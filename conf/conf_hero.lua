--| id | 品质 | 名字 | 职业 | 定位 | 初始经验等级 | 初始星级 | 最高星级 | 碎片 | 碎片数量 | 出生点 | 召唤耗点 | 普攻速度 | 攻击力 | 防御力 | 移动速度 | 暴击 | 暴击伤害 | 格挡率 | 破击强度 | 效果命中 | 效果抵抗 | 暴击伤害减免 | 技能，（第一个是普攻） | 召唤动画 | 头像 | 立绘图、形象图 | 战斗形象 | 英雄是否可觉醒 | 觉醒材料物品 | ai模式 |
--| id:int | quality:int | name:string | job:int | seat:int | init_exp_lv:int | init_star:int | max_star:int | parts:int | parts_num:int | born_point:int | sumon_cost:int | attack_speed:float | attack:int | defence:int | move_speed:int | crit:int | crit_power:int | block:int | damage_rate:int | effect_hit:int | effect_resistance:int | crit_defence:int | skills:luatable | summon_animation:string | icon:string | static_image:string | battle_image:string | awaken:bool | awaken_item:int | aimode:int | 
conf_hero = {}

conf_hero[1000]={
  move_speed=100,
  seat=1,
  crit=3,
  crit_power=5,
  init_exp_lv=1,
  defence=18,
  born_point=2,
  quality=1,
  sumon_cost=3,
  attack=28,
  parts=51001,
  attack_speed=1.8,
  job=1,
  damage_rate=2,
  effect_hit=1,
  awaken_item=51002,
  effect_resistance=1,
  awaken=true,
  max_star=6,
  parts_num=20,
  init_star=1,
  crit_defence=1,
  name='一个英雄',
  skills={1001,1002,1003,1004,},
  aimode=1,
  block=2,
}

