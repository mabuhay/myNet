--[[
    copyright      Zaya Game Inc
    author         Mike Chang
    date           Nov.22, 2016
    usage          
]]

player = class("player")

function player:ctor()

	self.level 			--等级
	self.exp 			--经验

	self.heros 			--英雄列表
	self.items			--物品列表
	self.party_1		--队1
	self.party_2		--队2
	self.party_3		--队3

	self.party_arena	--竞技场队伍

	self.gold 			--金币
	self.diamond		--钻石
	self.topaz 			--黄晶

	self.ration 		--口粮key supply used to play Story Mode stages
	self.supply 		--补充key supply used to play Sanctuary, Boss
end

