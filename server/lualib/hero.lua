local skynet = require "skynet"
local service = require "service"
local client = require "client"

require "utils"

local cli = client.handler()

function gethero( ... )
	-- do_redis( {'set','youname','bullshit'})
	local instid = 123129
	local tb = {confid=1001,lv=5}	
	do_redis( {'hmset','tb_user'..instid,tb} )
	local ret = do_redis( {'hgetall','tb_user'..instid} )
	return make_pairs_table(ret)
end

function cli:get_heroinfo()
	local  ret = gethero()
	return { hi = ret }
end