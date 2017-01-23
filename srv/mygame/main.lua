local skynet = require "skynet"
local sprotoloader = require "sprotoloader"
local snax = require 'snax'

require 'utils'
require "class"

local max_client = 64

skynet.start(function()
	print("Server start")
	skynet.uniqueservice("protoloader")
	local console = skynet.newservice("console")
	skynet.newservice("debug_console",8000)
	
	local db = skynet.uniqueservice("mydb")
	skynet.call(db,'lua','start')

	do_redis( {'set','myname','mike007'})
	do_redis( {'set','youname','bullshit'})
	local tb = {instid=100100,confid=1001,lv=5}	
	do_redis( {'hmset','tb_user'..tb.instid,tb} )
	local ret = do_redis( {'hgetall','tb_user'..tb.instid} )
	for k, v in pairs(ret) do
		print("k: "..k)
		print("v: "..v)
	end
	ret = make_pairs_table(ret)
	for k, v in pairs(ret) do
		print("k: "..k)
		print("v: "..v)
	end
	-- tb = convert_record(tbname, tb)
	-- local hero = Save_hero.new()
		
	-- local r = skynet.call("mydb", "lua", "hmset", 1, 'hero'..tb.instid, tb)


	local watchdog = skynet.newservice("watchdog")
	skynet.call(watchdog, "lua", "start", {
		port = 8888,
		maxclient = max_client,
		nodelay = true,
	})
	print("Watchdog listen on ", 8888)

	skynet.exit()
end)
