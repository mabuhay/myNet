require 'class'
local skynet = require "skynet"

Save_hero = class("save_hero")

function Save_hero:ctor()
	self.instid = 23423432
	self.confid = 1000
	self.lv = 1
	self.exp = 3
	self.star = 1
	self.quality = 1
	self.equip_1 = 10010
	self.equip_2 = 10020
	self.equip_3 = 10030
	self.equip_4 = 10040
	self.equip_5 = 10050
	self.equip_6 = 10060
end

function Save_hero:call()
	-- body
end

function Save_hero:save()
	-- local r = skynet.call("mydb", "lua", "set", 1, 323232, 999)
	local tb = {instid=100100,confid=1001,lv=5}
	local r = skynet.call("mydb", "lua", "hmset", 1, 'hero'..tb.instid, tb)
end

function Save_hero:read( ... )
	-- body
end
