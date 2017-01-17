local skynet = require "skynet"

function do_redis(args, uid)
	local cmd = assert(args[1])
	args[1] = uid
	return skynet.call("mydb", "lua", cmd, table.unpack(args))
end