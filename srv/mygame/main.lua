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

	do_redis( {'set','myname','mike007'}, 1)

	local watchdog = skynet.newservice("watchdog")
	skynet.call(watchdog, "lua", "start", {
		port = 8888,
		maxclient = max_client,
		nodelay = true,
	})
	print("Watchdog listen on ", 8888)

	skynet.exit()
end)
