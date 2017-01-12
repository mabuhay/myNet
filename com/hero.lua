--Copyright©2016-2022 厦门市在野网络科技有限公司 版权所有

Hero = class("Hero")

Id：英雄id，每一个id是唯一的，分别对应一个英雄，一些与英雄关联的表需要指向英雄的时候，指向该id
➢	HeroCation：英雄的品质（1=S，2=A，3=B，4=C……）
➢	Job_Type：职业类型（1=战士，2=弓手，3=法师，4=刺客，5=肉盾）
➢	HeroType：英雄的类型，定位（1=攻击，2=防御，3=辅助，4=控场……）
➢	Lv：初始等级（1=1级……）
➢	HeroInitial：英雄初始星级（1=1星……）
➢	HeroMaxInitial：英雄最高星级（1=1星……）
➢	partsitem:合成该物件所需要的物品id，关联到物品表id中的指定碎片
➢	partsNum：合成所需数量（50=需要50个碎片合成）
➢	Bornpoint：英雄初始的出生点，在Ai的设计案里有提到过
➢	Feipoint：在战斗中召唤该英雄所需要的费点值
➢	Basic_Hp：英雄的基础初始血量
➢	Basic_attackspeed：普攻的技能CD
➢	Basic_Attack：英雄的基础初始攻击
➢	Basic_Def：英雄的基础初始防御
➢	Basic_Movespeed ：英雄的基础初始移动速度
➢	Basic_Crit：英雄的基础初始爆率
➢	Basic_CritPower：英雄的基础初始暴击伤害
➢	Basic_DamageRate：英雄的基础初始破击率
➢	Basic_Block：英雄的基础初始格挡率
➢	Basic_EffectHit：英雄的基础初始效果命中
➢	Basic_EffectResistance：英雄的基础初始抵抗
➢	Skill_pt1：技能配置1，关联技能表id，但是此位置是普攻
➢	Skill_2: 技能配置2，关联技能表id
➢	Skill_3: 技能配置3，关联技能表id
➢	Skill_4: 技能配置4，关联技能表id
➢	Skill_5: 技能配置5，关联技能表id
➢	SummonAnimation：召唤动画
➢	icon：英雄头像
➢	StaticImage：立绘图、形象图
➢	BattleImage：战斗形象
➢	action_Attack：攻击动作
➢	action_ AttackValue：攻击硬值
➢	action_Standby：待机动作
➢	action_Death：死亡动作
➢	action_Hit：被击动作
➢	action_Win：胜利动作
➢	action_hitfly：击飞
➢	action_hitground：倒地
➢	action_restand：倒地起身
➢	Awaken：英雄是否可觉醒
➢	AwakenProp：觉醒材料道具1,数量;觉醒材料道具2,数量;
➢	Aimode	Ai模式:攻击的AI模式，在Ai的案子里有提到过，此处不作赘述
