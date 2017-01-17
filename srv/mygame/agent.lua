local skynet = require "skynet"
local netpack = require "netpack"
local socket = require "socket"
local sproto = require "sproto"
local sprotoloader = require "sprotoloader"

local WATCHDOG
local host
local send_request

local CMD = {}
local REQUEST = {}
local client_fd

local userid

function gen_newuserid()
	
end

function REQUEST:login()
	print("login", self.username)
	local r=skynet.call("REDIS","lua","get",self.username)
	if r == nil then
		userid = gen_newuserid()
		skynet.call("SIMPLEDB","lua","set",self.what,self.value)
		return { result = 0}
	else
		return { result = 1}
	end
end

--区服-角色等级
function REQUEST:get_userinfo()
	local hist = {101,102}
	return { 
		lastsvr = 101,
		historysvr = hist
	}
end

function REQUEST:playerinfo()
	-- body
end

function REQUEST:quit()
	skynet.call(WATCHDOG, "lua", "close", client_fd)
end

function REQUEST:get()
	print("get", self.what)
	local r = skynet.call("mydb", "lua", "get", 1, self.what)
	return { result = r }
end

function REQUEST:set()
	print("set", self.what, self.value)
	local r = skynet.call("mydb", "lua", "set", 1, self.what, self.value)
end

function REQUEST:hget()
	print("get", self.what)
	local r = skynet.call("mydb", "lua", "hget", 1, self.what)
	return { result = r }
end

function REQUEST:hset()
	print("set", self.what, self.value)
	local r = skynet.call("mydb", "lua", "hset", 1, self.what, self.value)
end

function REQUEST:handshake()
	return { msg = "Welcome to skynet." }
end

local function request(name, args, response)
	local f = assert(REQUEST[name])
	local r = f(args)
	if response then
		return response(r)
	end
end

local function send_package(pack)
	local package = string.pack(">s2", pack)
	socket.write(client_fd, package)
end

skynet.register_protocol {
	name = "client",
	id = skynet.PTYPE_CLIENT,
	unpack = function (msg, sz)
		return host:dispatch(msg, sz)
	end,
	dispatch = function (_, _, type, ...)
		if type == "REQUEST" then
			local ok, result  = pcall(request, ...)
			if ok then
				if result then
					send_package(result)
				end
			else
				skynet.error(result)
			end
		else
			assert(type == "RESPONSE")
			error "This example doesn't support request client"
		end
	end
}

function CMD.start(conf)	
	local fd = conf.client
	local gate = conf.gate
	WATCHDOG = conf.watchdog
	-- slot 1,2 set at main.lua
	host = sprotoloader.load(1):host "package"
	send_request = host:attach(sprotoloader.load(2))
	skynet.fork(function()
		while true do
			-- send_package(send_request "heartbeat")
			skynet.sleep(500)
		end
	end)

	client_fd = fd
	skynet.call(gate, "lua", "forward", fd)
end

function CMD.disconnect()
	-- todo: do something before exit
	skynet.exit()
end

skynet.start(function()
	skynet.dispatch("lua", function(_,_, command, ...)
		local f = CMD[command]
		skynet.ret(skynet.pack(f(...)))
	end)
end)
