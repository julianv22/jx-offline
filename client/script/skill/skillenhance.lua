--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	quanshaolin={ --拳少林150大力金刚掌，格斗系主技能
		stun_p={{{1,1},{20,20}},{{1,5},{20,5},{21,6}}},
		physicsenhance_p={{{1,65*0.2},{15,415*0.2}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	quanshaolin_child={ --拳少林150龙乘般若手
		skill_desc=
			function(level)
				return
				"<color=orange>大力金刚掌<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>大力金刚掌<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>大力金刚掌<color>攻击致晕对手几率：增加<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.stun_p[1])).."%<color>\n"
			end,
		missle_speed_add={{{1,1},{21,7}}},
		missle_lifetime_add={{{1,0},{9,0},{10,-1},{25,-1},{26,-2},{40,-2}}},
		stun_p={{{1,1},{20,20}},{{1,5},{20,5},{21,6}}},
		physicsenhance_p={{{1,65*0.2},{15,415*0.2}}},
	},

	daoshaolin={ --刀少林150叁戒归禅
		skill_desc=
			function(level)
				return
				"<color=orange>叁戒归禅<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daoshaolin.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>叁戒归禅<color>攻击会心一击率：增加<color=orange>"..floor(Link(level,SKILLS.daoshaolin.deadlystrike_p[1])).."%<color>\n"
			end,
		physicsenhance_p={{{1,55*0.5},{15,180*0.5}}},
		deadlystrike_p={{{1,4},{20,25}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	gunshaolin={ --棍少林150韦陀献杵
		skill_desc=
			function(level)
				return
				"<color=orange>韦陀献杵<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.gunshaolin.physicsenhance_p[1])).."%<color>\n"
			end,
		physicsenhance_p={{{1,12},{15,180*0.5}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	gunshaolin_child={ --棍少林150韦陀护法
		skill_desc=
			function(level)
				return
				"<color=orange>韦陀护法<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.gunshaolin_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>韦陀护法<color>攻击会心一击率：增加<color=orange>"..floor(Link(level,SKILLS.gunshaolin_child.deadlystrike_p[1])).."%<color>\n"
			end,
		physicsenhance_p={{{1,12},{15,180*0.5}}},
		deadlystrike_p={{{1,6},{20,35}}},
	},
		
	chuitianwang={ --锤天王150纵横八荒，格斗系主技能
		physicsenhance_p={{{1,30},{15,210*0.5}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	chuitianwang_child={ --锤天王150纵横八荒伤害
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.chuitianwang_child.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>纵横八荒<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>纵横八荒<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>纵横八荒<color>攻击距离：增加<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.missle_speed_add[1]) * 3).."<color>\n"..
				"<color=orange>纵横八荒<color>命中敌人时减少<color=orange>断魂刺"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		physicsenhance_p={{{1,30},{15,210*0.5}}},
		missle_speed_add={{{1,1},{21,6}}},
		reduceskillcd1={ --减断魂刺CD
			[1]={{1,40},{2,40}},
			[3]={{1,3*18*256+12},{15,3*18*256+36},{21,3*18*256+36}}
		},
	},
	
	daotianwang={ --刀天王150豪雄斩
		skill_desc=
			function(level)
				return
				"<color=orange>豪雄斩<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daotianwang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>豪雄斩<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.daotianwang.missle_speed_add[1])).."<color>\n"..
				"<color=orange>豪雄斩<color>攻击距离：增加<color=orange>"..floor(Link(level,SKILLS.daotianwang.missle_speed_add[1]) * 8).."<color>\n"
			end,
		physicsenhance_p={{{1,45*0.5},{15,180*0.65}}},
		missle_speed_add={{{1,1},{21,8}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	daotianwang_child={ --刀天王150 豪雄斩子弹
		physicsenhance_p={{{1,45*0.3},{15,180*0.3}}},
		missle_speed_add={{{1,1},{21,8}}},
	},

	qiangtianwang={ --枪天王150霸王錾金
		physicsenhance_p={{{1,60*0.5},{15,240*0.5}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	qiangtianwang_child={ --枪天王150霸王錾金伤害
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qiangtianwang_child.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>霸王錾金<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>霸王錾金<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>霸王錾金<color>攻击距离：增加<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.missle_speed_add[1]) * 3).."<color>\n"..
				"<color=orange>霸王錾金<color>命中敌人时减少<color=orange>断魂刺"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		physicsenhance_p={{{1,60*0.5},{15,240*0.5}}},
		missle_speed_add={{{1,1},{21,6}}},
		reduceskillcd1={ --减断魂刺CD
			[1]={{1,40},{2,40}},
			[3]={{1,3*18*256+12},{15,3*18*256+36},{21,3*18*256+36}}
		},
	},

	feidaotang={ --飞刀唐150 无影穿
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.feidaotang.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.feidaotang1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.feidaotang1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.feidaotang1.lifereplenish_v[2])/18)
				return
				"<color=orange>无影穿<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.feidaotang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>无影穿<color>命中敌人时有<color=orange>"..nPois.."%<color>的概率给敌人附上<color=orange>1层撕裂<color>状态，\n冷却时间<color=orange>"..nMag.."秒<color>，最多可叠加<color=orange>"..nTimes.."层<color>，持续时间<color=orange>"..nTime.."秒<color>\n"..
				"<color=orange>撕裂<color>状态：每半秒生命恢复减少<color=orange>"..-floor(Link(level,SKILLS.feidaotang1.lifereplenish_v[1])).."点<color>\n"
			end,
		physicsenhance_p={{{1,30},{15,180*0.45},}},
		skill_appendskillrandcomb={
			{{1,2045},{20,2045}}, --触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}}, --X*256+技能等级，X为0对目标，为1对自己
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}} --冷却*256+概率
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	feidaotang1={ --飞刀唐DEBUFF
		lifereplenish_v={{{1,-10},{20,-51}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*4},{10,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	feibiaotang={ --飞镖唐150乾坤一掷
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.feibiaotang.reduceskillcd1[3]))
				local nH24 = floor(floor(nCurValue/256))
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>乾坤一掷<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.feibiaotang.physicsenhance_p[1])).."%<color>\n"..
				--"<color=orange>乾坤一掷<color>冰攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.feibiaotang.colddamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.feibiaotang.colddamage_v[3])).."点<color>\n"..
				"<color=orange>乾坤一掷<color>命中敌人时减少<color=orange>迷影纵"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		physicsenhance_p={{{1,8},{15,110*0.30},}},
		--colddamage_v={
		--	[1]={{1,1},{15,60},{21,78}},
		--	[3]={{1,3},{15,180},{21,234}}
		--},
		reduceskillcd1={ --减迷影纵CD
			[1]={{1,710},{2,710}},
			[3]={{1,3*18*256+12},{15,3*18*256+36},{21,3*18*256+36}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	nutang={ --弩唐150 铁莲四杀和铁砂射星
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.nutang.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.nutang1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.nutang1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.nutang1.lifereplenish_v[2])/18)
				return
				"<color=orange>铁莲四杀<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.nutang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>铁莲四杀<color>命中敌人时有<color=orange>"..nPois.."%<color>的概率给敌人附上<color=orange>1层撕裂<color>状态，\n冷却时间<color=orange>"..nMag.."秒<color>，最多可叠加<color=orange>"..nTimes.."层<color>，持续时间<color=orange>"..nTime.."秒<color>\n"..
				"<color=orange>撕裂<color>状态：每半秒生命恢复减少<color=orange>"..-floor(Link(level,SKILLS.nutang1.lifereplenish_v[1])).."点<color>\n"
			end,
		physicsenhance_p={{{1,18},{15,240*0.35}}},
		skill_appendskillrandcomb={
			{{1,2045},{20,2045}},--触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}}--冷却*256+概率
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	nutang1={ --弩唐DEBUFF
		lifereplenish_v={{{1,-10},{20,-51}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*4},{10,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	daodu={ --刀毒150幽魂噬影
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return
				"<color=orange>幽魂噬影<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daodu.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>幽魂噬影<color>毒攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daodu.poisondamage_v[1])).."点<color>/次\n"..
				"<color=orange>幽魂噬影<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>随机五毒诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		poisondamage_v={{{1,14*0.5},{21,79*0.5}},{{1,60},{20,60}},{{1,10},{20,10}}},
		physicsenhance_p={{{1,18},{20,78},}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	wudu_1={ --五毒随机诅咒
		skill_appendskillrandcomb={--穿衣破甲
			{{1,356},{20,356}},--触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	wudu_2={
		skill_appendskillrandcomb={--穿心毒刺
			{{1,72},{20,72}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	wudu_3={
		skill_appendskillrandcomb={--冰蓝玄晶
			{{1,64},{20,64}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	wudu_4={
		skill_appendskillrandcomb={--赤炎蚀天
			{{1,70},{20,70}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	wudu_5={
		skill_appendskillrandcomb={--九天狂雷
			{{1,67},{20,67}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	wudu_6={
		skill_appendskillrandcomb={--万蛊蚀心
			{{1,73},{20,73}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},

	zhangdu={ --掌毒150 形销骨立
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return
				"<color=orange>形销骨立<color>毒攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.zhangdu.poisondamage_v[1])).."点<color>/次\n"..
				"<color=orange>形销骨立<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>随机五毒诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		poisondamage_v={{{1,15*0.5},{20,102*0.5}},{{1,60},{20,60}},{{1,10},{20,10}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	zhangdu1={ --掌毒形销骨立伤害2
		poisondamage_v={{{1,1},{20,25*0.3}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},

	jianemei={ --剑峨眉150剑花挽晶
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianemei.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.jianemei1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.jianemei1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.jianemei1.skill_enhance[2])/18)
				return
				"<color=orange>剑花挽晶<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jianemei.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>剑花挽晶<color>命中敌人时有<color=orange>"..nPois.."%<color>的概率给自己附加上<color=orange>1层<color>玄冰之印，\n冷却时间<color=orange>"..nMag.."秒<color>，最多可叠加<color=orange>"..nTimes.."层<color>，持续时间<color=orange>"..nTime.."秒<color>\n"..
				"<color=orange>玄冰之印<color>状态：对攻击技能加成增加<color=orange>"..floor(Link(level,SKILLS.jianemei1.skill_enhance[1])).."%<color>"
			end,
		skill_appendskillrandcomb={
			{{1,2059},{20,2059}},--触发技能id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}}--冷却*256+概率
		},
		physicsenhance_p={{{1,12},{15,123*0.5}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	jianemei1={ --剑峨眉BUFF
		skill_enhance={{{1,5},{21,21}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*3},{15,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	zhangemei={ --掌峨眉150冰雨珞晶
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.zhangemei.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(Link(level,SKILLS.zhangemei1.fastwalkrun_p[2])/18)
				return
				"<color=orange>冰雨珞晶<color>冰攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.zhangemei.colddamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.zhangemei.colddamage_v[3])).."<color>点\n"..
				"<color=orange>冰雨珞晶<color>命中敌人时有<color=orange>"..nPois.."%<color>概率为其施加<color=orange>"..nTime.."秒<color>的<color=orange>寒冰之息<color>状态：\n"..
				"外功系武功出招动作：减少<color=orange>"..-floor(Link(level,SKILLS.zhangemei1.attackspeed_yan_v[1])).."%<color>（阳）\n"..
				"移动速度：减少<color=orange>"..-floor(Link(level,SKILLS.zhangemei1.fastwalkrun_p[1])).."%<color>\n"
				--"内功系武功出招动作：减少<color=orange>"..floor(Link(level,SKILLS.zhangemei1.castspeed_yan_v[1])).."%（阳）<color>\n"..
			end,
		skill_appendskillrandcomb={
			{{1,2061},{20,2061}},--触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,3*18*256+30},{10,3*18*256+40},{21,3*18*256+50}}--冷却*256+概率
		},
		colddamage_v={
			[1]={{1,24},{15,420*0.8},},
			[3]={{1,36},{15,480*0.8},}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	zhangemei1={ --掌峨眉DEBUFF
		fastwalkrun_p={{{1,-10},{20,-35}},{{1,18*5},{21,18*10}}},
		attackspeed_yan_v={{{1,-17},{20,-38}},{{1,18*5},{21,18*10}}},
		--castspeed_yan_v={{{1,-17},{20,-55}},{{1,18*8},{20,18*8}}},
		--attackspeed_v={{{1,-17},{20,-55}},{{1,18*5},{20,18*5}}},
		--castspeed_v={{{1,-17},{20,-55}},{{1,18*5},{20,18*5}}},

	},

	daocui={ --刀翠150冰雀越枝
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.daocui.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>冰雀越枝<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daocui.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>冰雀越枝<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.daocui.missle_speed_add[1])).."<color>\n"..
				"<color=orange>冰雀越枝<color>命中敌人时减少<color=orange>御雪隐"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		missle_speed_add={{{1,1},{21,8}}},
		missle_lifetime_add={{{1,0},{2,-1},{5,-1},{6,-2},{10,-2},{11,-3},{15,-3},{16,-4},{21,-4},{22,-5},{27,-5},{28,-6},{35,-6},{36,-7},{40,-7}}},
		physicsenhance_p={{{1,18},{20,93},}},
		reduceskillcd1={ --减御雪隐CD
			[1]={{1,713},{2,713}},
			[3]={{1,5*18*256+3*18},{10,5*18*256+4*18},{20,5*18*256+5*18}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	neicui={ --内翠150水映曼秀
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.neicui.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>水映曼秀<color>冰攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.neicui.colddamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.neicui.colddamage_v[3])).."<color>点\n"..
				"<color=orange>水映曼秀<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.neicui.missle_speed_add[1])).."<color>\n"..
				"<color=orange>水映曼秀<color>命中敌人时减少<color=orange>御雪隐"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		missle_speed_add={{{1,1},{21,8}}},
		missle_lifetime_add={{{1,0},{2,-1},{4,-1},{5,-2},{7,-2},{8,-3},{11,-3},{12,-4},{16,-4},{17,-5},{20,-5},{21,-6},{26,-6},{27,-7},{32,-7},{33,-8},{38,-8}}},
		colddamage_v={
			[1]={{1,18},{15,290}},
			[3]={{1,18},{15,290}}
		},
		reduceskillcd1={ --减御雪隐CD
			[1]={{1,713},{2,713}},
			[3]={{1,5*18*256+3*18},{10,5*18*256+4*18},{20,5*18*256+5*18}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	jianhuashan={ --剑华山150九剑合一BUFF技能
		skill_desc=
		function(level)
			local nMag = floor(Link(level,SKILLS.jianhuashan.autoattackskill_ex[3])/256)
			local nPois = floor(Link(level,SKILLS.jianhuashanex.autoattackskill_ex[3])/18/256)
			return 
			"<color=orange>剑法·独孤九剑<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jianhuashan1.physicsenhance_p[1])).."%<color>\n"..
			"<color=orange>剑法·独孤九剑<color>触发概率：增加<color=orange>"..nMag.."%<color>\n"..
			"<color=orange>剑法·独孤九剑<color>冷却时间：减少<color=orange>"..nPois.."秒<color>"
		end,
		autoattackskill_ex={
			{{1,1368*256 + 1},{20,1368*256 + 1},{21,1368*256 + 1}}, --技能ID*256+加1减2
			{{1,10*60*18},{20,10*60*18},{21,10*60*18}},	--buff时间
			{{1,1*256 + 1},{20,10*256 + 1},{21,10*256 + 1},} --加减值*256+类型概率1CD2  --该条属性必须填到最高级，不然会报错
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	jianhuashanex={ --剑华山150九剑合一BUFF技能
		autoattackskill_ex={
			{{1,1368*256 + 2},{20,1368*256 + 2},{21,1368*256 + 2}}, --技能ID*256+加1减2
			{{1,10*60*18},{20,10*60*18},{21,10*60*18}},	--buff时间
			{{1,1*18*256 + 2},{10,2*18*256 + 2},{20,3*18*256 + 2},{21,3*18*256 + 2}} --加减值*256+类型概率1CD2
		},
	},
	jianhuashan1={ --剑华山150独孤九剑
		physicsenhance_p={{{1,3},{21,82}}},
	},
	qihuashan={ --气华山-摩云剑气
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	
	qihuashan1={ --气华山-无极剑气爆炸
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qihuashan1.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>气场爆炸<color>冰攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.qihuashan1.colddamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.qihuashan1.colddamage_v[3])).."<color>点\n"..
				"<color=orange>气场爆炸<color>命中敌人减少<color=orange>摩云剑气"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
			colddamage_v={
				[1]={{1,24},{15,220}},
				[3]={{1,36},{15,280}}
			},
			reduceskillcd1={ --减摩云剑气CD
				[1]={{1,1380},{2,1380}},
				[3]={{1,5*18*256+1.5*18},{10,5*18*256+2*18},{21,5*18*256+3.5*18}}
			},
	},

	gungaibang={ --棍丐帮150棒迥掠地
		skill_desc=
			function(level)
				return 
				"<color=orange>棒迥掠地<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.gungaibang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>棒迥掠地<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.gungaibang.missle_speed_add[1])).."<color>\n"
			end,
		missle_speed_add={{{1,1},{21,8}}},
		missle_lifetime_add={{{1,0},{2,-1},{4,-1},{5,-2},{9,-2},{10,-3},{13,-3},{14,-4},{18,-4},{19,-5},{24,-5},{25,-6},{30,-6},{31,-7},{37,-7},{38,-8},{40,-8},}},
		physicsenhance_p={{{1,10},{21,81},}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	zhanggaibang={ --掌丐帮150时乘六龙
		skill_desc=
			function(level)
				return 
				"<color=orange>时乘六龙<color>火攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.firedamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.firedamage_v[3])).."<color>点\n"..
				"<color=orange>时乘六龙<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.missle_speed_add[1])).."<color>\n"
			end,
		missle_speed_add={{{1,1},{21,6}}},
		missle_lifetime_add={{{1,0},{4,0},{5,-1},{13,-1},{14,-2},{24,-2},{25,-3},{36,-3},{37,-4},{40,-4},}},
		firedamage_v={
			[1]={{1,24},{21,720*0.5},},
			[3]={{1,24},{21,720*0.5},}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	daotianren={ --刀天忍150疾火燎原
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>疾火燎原<color>火攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daotianren.firedamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.daotianren.firedamage_v[3])).."<color>点\n"..
				"<color=orange>疾火燎原<color>攻击致命一击率：增加<color=orange>"..floor(Link(level,SKILLS.daotianren.fatallystrike_p[1])).."<color>%\n"..
				"<color=orange>疾火燎原<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>随机天忍诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		fatallystrike_p={{{1,1},{21,10}}},
		firedamage_v={
			[1]={{1,45*1},{21,213}},
			[3]={{1,45*1},{21,213}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	tianren_1={ --天忍随机诅咒
		skill_appendskillrandcomb={--火莲焚华
			{{1,136},{20,136}},--触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	tianren_2={
		skill_appendskillrandcomb={--飞鸿无迹
			{{1,140},{20,140}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	tianren_3={
		skill_appendskillrandcomb={--悲酥清风
			{{1,364},{20,364}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	tianren_4={
		skill_appendskillrandcomb={--厉魔夺魂
			{{1,143},{20,143}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},

	qiangtianren={ --枪天忍150江海怒澜
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>江海怒涛、魔音击<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.qiangtianren.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>江海怒涛、魔音击<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.qiangtianren.missle_speed_add[1])).."<color>\n"..
				"<color=orange>江海怒涛<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>天忍五毒诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		missle_speed_add={{{1,1},{21,4}}},
		physicsenhance_p={{{1,55*0.15},{20,535*0.15}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	qiangtianren_child={ --枪天忍150魔音击
		missle_speed_add={{{1,1},{21,4}}},
		physicsenhance_p={{{1,55*0.15},{20,535*0.15}}},
	},
	
	daowuhun={ --刀武魂150铲奸除佞
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.daowuhun.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(floor(nCurValue/18)/256)
				return
				"<color=orange>铲奸除佞<color>命中敌人时有<color=orange>"..nPois.."%<color>的概率给自己增加一层【怒】，冷却时间<color=orange>"..nTime.."秒<color>\n"..
				"<color=orange>铲奸除佞<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daowuhun.physicsenhance_p[1])).."%<color>\n"
			end,
		skill_appendskillrandcomb={
			{{1,2006},{20,2006}},--触发技能id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,4*18*256+30},{10,3*18*256+40},{20,3*18*256+50},{21,3*18*256+50}}--冷却*256+概率
		},
		physicsenhance_p={{{1,20*0.53},{20,80*0.53},}},
		special_point_add={
			{{1,1982},{20,1982}},-- 目标技能id
			{{1,0},{20,0}},-- 配在主动技能属性上填0，作为buff属性填-1
			{{1,1},{20,1}},-- 增加个数
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	daowuhun_child={ --刀武魂150沸血之刃
		skill_desc=
			function(level)
				return 
				"<color=orange>沸血之刃<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daowuhun.physicsenhance_p[1])).."%<color>\n"
			end,
			physicsenhance_p={{{1,20*0.53},{20,80*0.53},}},
		},

	dunwuhun={ --盾武魂150挥师灭虏
		skill_desc=
			function(level)
				return 
				"<color=orange>挥师灭虏<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.dunwuhun.physicsenhance_p[1])).."%<color>\n"
			end,
			physicsenhance_p={{{1,55*0.2},{20,435*0.2},}},
			skill_skillexp_v={{	{1,1000},
								{2,1000},
								{3,1000},
								{4,1000},
								{5,1000},
								{6,1000},
								{7,1000},
								{8,1000},
								{9,1000},
								{10,1000},
								{11,1000},
								{12,1000},
								{13,1000},
								{14,1000},
								{15,1000},
								{16,1000},
								{17,1000},
								{18,1000},
								{19,1000},
								{20,1000},}},
		},
	dunwuhun_child={--盾武魂150惊涛拍岸
		skill_desc=
			function(level)
				return 
				"<color=orange>惊涛拍岸<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.dunwuhun_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>惊涛拍岸<color>减少敌人攻击技能加成：增加<color=orange>"..-floor(Link(level,SKILLS.dunwuhun_child_child.skill_enhance[1])).."%<color>\n"
			end,
			physicsenhance_p={{{1,18*0.3},{20,100*0.3},}},
		},
	dunwuhun_child_child={--盾武魂150惊涛拍岸减攻击效果
		skill_enhance={
			{{1,-1},{20,-30}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},

	kunlun_1={ --昆仑秘籍随机诅咒
		skill_appendskillrandcomb={--束缚咒
			{{1,392},{20,392}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	kunlun_2={
		skill_appendskillrandcomb={--羁绊符
			{{1,174},{20,174}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	kunlun_3={
		skill_appendskillrandcomb={--北冥到海
			{{1,393},{20,393}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	kunlun_4={
		skill_appendskillrandcomb={--欺寒傲雪
			{{1,175},{20,175}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},
	kunlun_5={
		skill_appendskillrandcomb={--迷踪幻影
			{{1,90},{20,90}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--冷却*256+概率
		},
	},

	daokunlun={ --刀昆仑150九天罡风
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>九天罡风<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.daokunlun.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>九天罡风<color>飞行速度：增加<color=orange>"..floor(Link(level,SKILLS.daokunlun.missle_speed_add[1])).."<color>\n"..
				"<color=orange>九天罡风<color>攻击距离：增加<color=orange>"..floor(Link(level,SKILLS.daokunlun.missle_speed_add[1]) * 16).."<color>\n"..
				"<color=orange>九天罡风<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>随机昆仑诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		physicsenhance_p={{{1,6*1},{20,120*1}}},
		missle_speed_add={{{1,1},{21,9}}},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	jiankunlun={ --剑昆仑150天雷震岳
		skill_desc=
			function(level)
				return 
				"<color=orange>天雷震岳<color>雷攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jiankunlun.lightingdamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.jiankunlun.lightingdamage_v[3])).."<color>点\n"
			end,
		lightingdamage_v={
			[1]={{1,25},{20,230}},
			[3]={{1,25},{20,230}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	jiankunlun_child={ --剑昆仑150雷动乾坤
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>雷动乾坤<color>雷攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jiankunlun_child.lightingdamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.jiankunlun_child.lightingdamage_v[3])).."<color>点\n"..
				"<color=orange>雷动乾坤<color>命中目标有<color=orange>"..nMag.."%<color>的概率为其附加<color=orange>"..nlevel.."级<color>随机昆仑诅咒，\n"..
				"触发后<color=orange>"..szTime.."秒<color>内不会再次触发"
			end,
		lightingdamage_v={
			[1]={{1,32},{20,434},},
			[3]={{1,32},{20,434},}
		},
	},

	jianwudang={ --剑武当150剑垂星河
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianwudang.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return 
				"<color=orange>剑垂星河<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jianwudang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>剑垂星河<color>攻击致晕对手几率：增加<color=orange>"..floor(Link(level,SKILLS.jianwudang.stun_p[1])).."%<color>\n"..
				"<color=orange>剑垂星河<color>命中敌人减少<color=orange>出淤不染"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		physicsenhance_p={{{1,12*1},{20,115*1}}},
		stun_p={{{1,5},{20,20}},{{1,1},{20,6},{21,6}}},
		reduceskillcd1={
			[1]={{1,716},{10,716}},
			[3]={{1,5*18*256+3*18},{10,5*18*256+4*18},{20,5*18*256+5*18},{21,5*18*256+5*18}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},
	
	qiwudang={ --气武当150造化太清
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qiwudang.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return 
				"<color=orange>造化太清<color>雷攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.qiwudang.lightingdamage_v[1])).."<color>到<color=orange>"..floor(Link(level,SKILLS.qiwudang.lightingdamage_v[3])).."<color>点\n"..
				"<color=orange>造化太清<color>命中敌人减少<color=orange>出淤不染"..szTime.."秒<color>冷却时间，每<color=orange>"..nMag.."秒<color>可生效一次"
			end,
		lightingdamage_v={
			[1]={{1,6},{20,73}},
			[3]={{1,25*0.6},{20,230}}
		},
		reduceskillcd1={
			[1]={{1,716},{10,716}},
			[3]={{1,5*18*256+3*18},{10,5*18*256+4*18},{20,5*18*256+5*18},{21,5*18*256+5*18}}
		},
		skill_skillexp_v={{	{1,1000},
							{2,1000},
							{3,1000},
							{4,1000},
							{5,1000},
							{6,1000},
							{7,1000},
							{8,1000},
							{9,1000},
							{10,1000},
							{11,1000},
							{12,1000},
							{13,1000},
							{14,1000},
							{15,1000},
							{16,1000},
							{17,1000},
							{18,1000},
							{19,1000},
							{20,1000},}},
	},

	jianxiaoyao={ --剑逍遥150十步一杀
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianxiaoyao.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				return
				"<color=orange>十步一杀<color>命中敌人时有<color=orange>"..nPois.."%<color>的概率给自己增加一层【音律】\n"..
				"<color=orange>十步一杀<color>普攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.jianxiaoyao.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>十步一杀<color>会心一击率：增加<color=orange>"..floor(Link(level,SKILLS.jianxiaoyao.deadlystrike_p[1])).."%<color>\n"
			end,
		skill_appendskillrandcomb={
			{{1,2100},{20,2100}},--触发技能id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,13*256+10},{10,13*256+30},{20,13*256+50},{21,13*256+50}}--冷却*256+概率
		},
		physicsenhance_p={{{1,7},{21,163}}},
		deadlystrike_p={{{1,1},{21,15}}},
		special_point_add={
			{{1,2083},{20,2083}},-- 目标技能id
			{{1,0},{20,0}},-- 配在主动技能属性上填0，作为buff属性填-1
			{{1,1},{20,1}},-- 增加个数
		},
		skill_skillexp_v={
			{
				{1,1000},
				{2,1000},
				{3,1000},
				{4,1000},
				{5,1000},
				{6,1000},
				{7,1000},
				{8,1000},
				{9,1000},
				{10,1000},
				{11,1000},
				{12,1000},
				{13,1000},
				{14,1000},
				{15,1000},
				{16,1000},
				{17,1000},
				{18,1000},
				{19,1000},
				{20,1000},
			}
		},
	},

	qinxiaoyao={ --琴逍遥150梅花三弄
		skill_desc=
			function(level)
				return
				"<color=orange>梅花三弄<color>雷攻伤害：增加<color=orange>"..floor(Link(level,SKILLS.qinxiaoyao.lightingdamage_p[1])).."%<color>\n"
			end,
		lightingdamage_p={{{1,1},{21,8}}},
		skill_skillexp_v={
			{
				{1,1000},
				{2,1000},
				{3,1000},
				{4,1000},
				{5,1000},
				{6,1000},
				{7,1000},
				{8,1000},
				{9,1000},
				{10,1000},
				{11,1000},
				{12,1000},
				{13,1000},
				{14,1000},
				{15,1000},
				{16,1000},
				{17,1000},
				{18,1000},
				{19,1000},
				{20,1000},
			}
		},
	},
	qinxiaoyao_child={ --琴逍遥150子技能——阳关三叠
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qinxiaoyao_child.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(Link(level,SKILLS.qinxiaoyao1.lightingres_yan_p[2])/18)
				return
				"<color=orange>阳关三叠<color>攻击致晕对手几率：增加<color=orange>"..floor(Link(level,SKILLS.qinxiaoyao_child.stun_p[1])).."%<color>\n"..
				"<color=orange>阳关三叠<color>命中敌人时有<color=orange>"..nPois.."%<color>概率为其施加<color=orange>"..nTime.."秒<color>的<color=water>「恍惚」<color>状态：\n"..
				"冰雷火毒防：减少<color=orange>"..-floor(Link(level,SKILLS.qinxiaoyao1.coldres_yan_p[1])).."%<color>（阳）\n"
			end,
		skill_appendskillrandcomb={
			{{1,2115},{20,2115}},--触发技能id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+技能等级，X为0对目标，为1对自己
			{{1,3*18*256+30},{10,3*18*256+40},{21,3*18*256+50}}--冷却*256+概率
		},
		stun_p={{{1,1},{21,14}},{{1,1},{20,12},{21,12}}},
	},
	qinxiaoyao1={ --琴逍遥DEBUFF
		coldres_yan_p={{{1,-2},{20,-30},{21,-30}},{{1,18*10},{20,18*10}}},
		lightingres_yan_p={{{1,-2},{20,-30},{21,-30}},{{1,18*10},{20,18*10}}},
		fireres_yan_p={{{1,-2},{20,-30},{21,-30}},{{1,18*10},{20,18*10}}},
		poisonres_yan_p={{{1,-2},{20,-30},{21,-30}},{{1,18*10},{20,18*10}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

