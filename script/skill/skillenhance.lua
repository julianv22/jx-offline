--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	quanshaolin={ --ȭ����150��������ƣ���ϵ������
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
	quanshaolin_child={ --ȭ����150���˰�����
		skill_desc=
			function(level)
				return
				"<color=orange>���������<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>���������<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>���������<color>�������ζ��ּ��ʣ�����<color=orange>"..floor(Link(level,SKILLS.quanshaolin_child.stun_p[1])).."%<color>\n"
			end,
		missle_speed_add={{{1,1},{21,7}}},
		missle_lifetime_add={{{1,0},{9,0},{10,-1},{25,-1},{26,-2},{40,-2}}},
		stun_p={{{1,1},{20,20}},{{1,5},{20,5},{21,6}}},
		physicsenhance_p={{{1,65*0.2},{15,415*0.2}}},
	},

	daoshaolin={ --������150�������
		skill_desc=
			function(level)
				return
				"<color=orange>�������<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daoshaolin.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�������<color>��������һ���ʣ�����<color=orange>"..floor(Link(level,SKILLS.daoshaolin.deadlystrike_p[1])).."%<color>\n"
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

	gunshaolin={ --������150Τ������
		skill_desc=
			function(level)
				return
				"<color=orange>Τ������<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.gunshaolin.physicsenhance_p[1])).."%<color>\n"
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
	gunshaolin_child={ --������150Τ�ӻ���
		skill_desc=
			function(level)
				return
				"<color=orange>Τ�ӻ���<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.gunshaolin_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>Τ�ӻ���<color>��������һ���ʣ�����<color=orange>"..floor(Link(level,SKILLS.gunshaolin_child.deadlystrike_p[1])).."%<color>\n"
			end,
		physicsenhance_p={{{1,12},{15,180*0.5}}},
		deadlystrike_p={{{1,6},{20,35}}},
	},
		
	chuitianwang={ --������150�ݺ�˻ģ���ϵ������
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
	chuitianwang_child={ --������150�ݺ�˻��˺�
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.chuitianwang_child.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>�ݺ�˻�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�ݺ�˻�<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>�ݺ�˻�<color>�������룺����<color=orange>"..floor(Link(level,SKILLS.chuitianwang_child.missle_speed_add[1]) * 3).."<color>\n"..
				"<color=orange>�ݺ�˻�<color>���е���ʱ����<color=orange>�ϻ��"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
		physicsenhance_p={{{1,30},{15,210*0.5}}},
		missle_speed_add={{{1,1},{21,6}}},
		reduceskillcd1={ --���ϻ��CD
			[1]={{1,40},{2,40}},
			[3]={{1,3*18*256+12},{15,3*18*256+36},{21,3*18*256+36}}
		},
	},
	
	daotianwang={ --������150����ն
		skill_desc=
			function(level)
				return
				"<color=orange>����ն<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daotianwang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>����ն<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.daotianwang.missle_speed_add[1])).."<color>\n"..
				"<color=orange>����ն<color>�������룺����<color=orange>"..floor(Link(level,SKILLS.daotianwang.missle_speed_add[1]) * 8).."<color>\n"
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
	daotianwang_child={ --������150 ����ն�ӵ�
		physicsenhance_p={{{1,45*0.3},{15,180*0.3}}},
		missle_speed_add={{{1,1},{21,8}}},
	},

	qiangtianwang={ --ǹ����150�����ɽ�
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
	qiangtianwang_child={ --ǹ����150�����ɽ��˺�
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qiangtianwang_child.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>�����ɽ�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����ɽ�<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.missle_speed_add[1])).."<color>\n"..
				"<color=orange>�����ɽ�<color>�������룺����<color=orange>"..floor(Link(level,SKILLS.qiangtianwang_child.missle_speed_add[1]) * 3).."<color>\n"..
				"<color=orange>�����ɽ�<color>���е���ʱ����<color=orange>�ϻ��"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
		physicsenhance_p={{{1,60*0.5},{15,240*0.5}}},
		missle_speed_add={{{1,1},{21,6}}},
		reduceskillcd1={ --���ϻ��CD
			[1]={{1,40},{2,40}},
			[3]={{1,3*18*256+12},{15,3*18*256+36},{21,3*18*256+36}}
		},
	},

	feidaotang={ --�ɵ���150 ��Ӱ��
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.feidaotang.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.feidaotang1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.feidaotang1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.feidaotang1.lifereplenish_v[2])/18)
				return
				"<color=orange>��Ӱ��<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.feidaotang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>��Ӱ��<color>���е���ʱ��<color=orange>"..nPois.."%<color>�ĸ��ʸ����˸���<color=orange>1��˺��<color>״̬��\n��ȴʱ��<color=orange>"..nMag.."��<color>�����ɵ���<color=orange>"..nTimes.."��<color>������ʱ��<color=orange>"..nTime.."��<color>\n"..
				"<color=orange>˺��<color>״̬��ÿ���������ָ�����<color=orange>"..-floor(Link(level,SKILLS.feidaotang1.lifereplenish_v[1])).."��<color>\n"
			end,
		physicsenhance_p={{{1,30},{15,180*0.45},}},
		skill_appendskillrandcomb={
			{{1,2045},{20,2045}}, --��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}}, --X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}} --��ȴ*256+����
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
	feidaotang1={ --�ɵ���DEBUFF
		lifereplenish_v={{{1,-10},{20,-51}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*4},{10,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	feibiaotang={ --������150Ǭ��һ��
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.feibiaotang.reduceskillcd1[3]))
				local nH24 = floor(floor(nCurValue/256))
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>Ǭ��һ��<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.feibiaotang.physicsenhance_p[1])).."%<color>\n"..
				--"<color=orange>Ǭ��һ��<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.feibiaotang.colddamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.feibiaotang.colddamage_v[3])).."��<color>\n"..
				"<color=orange>Ǭ��һ��<color>���е���ʱ����<color=orange>��Ӱ��"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
		physicsenhance_p={{{1,8},{15,110*0.30},}},
		--colddamage_v={
		--	[1]={{1,1},{15,60},{21,78}},
		--	[3]={{1,3},{15,180},{21,234}}
		--},
		reduceskillcd1={ --����Ӱ��CD
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

	nutang={ --����150 ������ɱ����ɰ����
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.nutang.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.nutang1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.nutang1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.nutang1.lifereplenish_v[2])/18)
				return
				"<color=orange>������ɱ<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.nutang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>������ɱ<color>���е���ʱ��<color=orange>"..nPois.."%<color>�ĸ��ʸ����˸���<color=orange>1��˺��<color>״̬��\n��ȴʱ��<color=orange>"..nMag.."��<color>�����ɵ���<color=orange>"..nTimes.."��<color>������ʱ��<color=orange>"..nTime.."��<color>\n"..
				"<color=orange>˺��<color>״̬��ÿ���������ָ�����<color=orange>"..-floor(Link(level,SKILLS.nutang1.lifereplenish_v[1])).."��<color>\n"
			end,
		physicsenhance_p={{{1,18},{15,240*0.35}}},
		skill_appendskillrandcomb={
			{{1,2045},{20,2045}},--��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}}--��ȴ*256+����
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
	nutang1={ --����DEBUFF
		lifereplenish_v={{{1,-10},{20,-51}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*4},{10,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	daodu={ --����150�Ļ���Ӱ
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return
				"<color=orange>�Ļ���Ӱ<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daodu.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�Ļ���Ӱ<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.daodu.poisondamage_v[1])).."��<color>/��\n"..
				"<color=orange>�Ļ���Ӱ<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>����嶾���䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
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
	wudu_1={ --�嶾�������
		skill_appendskillrandcomb={--�����Ƽ�
			{{1,356},{20,356}},--��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	wudu_2={
		skill_appendskillrandcomb={--���Ķ���
			{{1,72},{20,72}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	wudu_3={
		skill_appendskillrandcomb={--��������
			{{1,64},{20,64}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	wudu_4={
		skill_appendskillrandcomb={--����ʴ��
			{{1,70},{20,70}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	wudu_5={
		skill_appendskillrandcomb={--�������
			{{1,67},{20,67}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	wudu_6={
		skill_appendskillrandcomb={--���ʴ��
			{{1,73},{20,73}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},

	zhangdu={ --�ƶ�150 ��������
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.wudu_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return
				"<color=orange>��������<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.zhangdu.poisondamage_v[1])).."��<color>/��\n"..
				"<color=orange>��������<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>����嶾���䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
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
	zhangdu1={ --�ƶ����������˺�2
		poisondamage_v={{{1,1},{20,25*0.3}},{{1,60},{20,60}},{{1,10},{20,10}}},
	},

	jianemei={ --����ü150�����쾧
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianemei.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nMag = floor(Link(level,SKILLS.jianemei1.skill_stack_buff[1])/18)
				local nTimes = floor(Link(level,SKILLS.jianemei1.skill_stack_buff[2]))
				local nTime = floor(Link(level,SKILLS.jianemei1.skill_enhance[2])/18)
				return
				"<color=orange>�����쾧<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.jianemei.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����쾧<color>���е���ʱ��<color=orange>"..nPois.."%<color>�ĸ��ʸ��Լ�������<color=orange>1��<color>����֮ӡ��\n��ȴʱ��<color=orange>"..nMag.."��<color>�����ɵ���<color=orange>"..nTimes.."��<color>������ʱ��<color=orange>"..nTime.."��<color>\n"..
				"<color=orange>����֮ӡ<color>״̬���Թ������ܼӳ�����<color=orange>"..floor(Link(level,SKILLS.jianemei1.skill_enhance[1])).."%<color>"
			end,
		skill_appendskillrandcomb={
			{{1,2059},{20,2059}},--��������id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,1*18*256+30},{19,1*18*256+40},{20,1*18*256+40}}--��ȴ*256+����
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
	jianemei1={ --����üBUFF
		skill_enhance={{{1,5},{21,21}},{{1,18*5},{20,18*5}}},
		skill_stack_buff={{{1,18*3},{15,18*3},{20,18*2},{21,18*2}},{{1,3},{20,3}}},
	},

	zhangemei={ --�ƶ�ü150������
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.zhangemei.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(Link(level,SKILLS.zhangemei1.fastwalkrun_p[2])/18)
				return
				"<color=orange>������<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.zhangemei.colddamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.zhangemei.colddamage_v[3])).."<color>��\n"..
				"<color=orange>������<color>���е���ʱ��<color=orange>"..nPois.."%<color>����Ϊ��ʩ��<color=orange>"..nTime.."��<color>��<color=orange>����֮Ϣ<color>״̬��\n"..
				"�⹦ϵ�书���ж���������<color=orange>"..-floor(Link(level,SKILLS.zhangemei1.attackspeed_yan_v[1])).."%<color>������\n"..
				"�ƶ��ٶȣ�����<color=orange>"..-floor(Link(level,SKILLS.zhangemei1.fastwalkrun_p[1])).."%<color>\n"
				--"�ڹ�ϵ�书���ж���������<color=orange>"..floor(Link(level,SKILLS.zhangemei1.castspeed_yan_v[1])).."%������<color>\n"..
			end,
		skill_appendskillrandcomb={
			{{1,2061},{20,2061}},--��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,3*18*256+30},{10,3*18*256+40},{21,3*18*256+50}}--��ȴ*256+����
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
	zhangemei1={ --�ƶ�üDEBUFF
		fastwalkrun_p={{{1,-10},{20,-35}},{{1,18*5},{21,18*10}}},
		attackspeed_yan_v={{{1,-17},{20,-38}},{{1,18*5},{21,18*10}}},
		--castspeed_yan_v={{{1,-17},{20,-55}},{{1,18*8},{20,18*8}}},
		--attackspeed_v={{{1,-17},{20,-55}},{{1,18*5},{20,18*5}}},
		--castspeed_v={{{1,-17},{20,-55}},{{1,18*5},{20,18*5}}},

	},

	daocui={ --����150��ȸԽ֦
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.daocui.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>��ȸԽ֦<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daocui.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>��ȸԽ֦<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.daocui.missle_speed_add[1])).."<color>\n"..
				"<color=orange>��ȸԽ֦<color>���е���ʱ����<color=orange>��ѩ��"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
		missle_speed_add={{{1,1},{21,8}}},
		missle_lifetime_add={{{1,0},{2,-1},{5,-1},{6,-2},{10,-2},{11,-3},{15,-3},{16,-4},{21,-4},{22,-5},{27,-5},{28,-6},{35,-6},{36,-7},{40,-7}}},
		physicsenhance_p={{{1,18},{20,93},}},
		reduceskillcd1={ --����ѩ��CD
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

	neicui={ --�ڴ�150ˮӳ����
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.neicui.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>ˮӳ����<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.neicui.colddamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.neicui.colddamage_v[3])).."<color>��\n"..
				"<color=orange>ˮӳ����<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.neicui.missle_speed_add[1])).."<color>\n"..
				"<color=orange>ˮӳ����<color>���е���ʱ����<color=orange>��ѩ��"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
		missle_speed_add={{{1,1},{21,8}}},
		missle_lifetime_add={{{1,0},{2,-1},{4,-1},{5,-2},{7,-2},{8,-3},{11,-3},{12,-4},{16,-4},{17,-5},{20,-5},{21,-6},{26,-6},{27,-7},{32,-7},{33,-8},{38,-8}}},
		colddamage_v={
			[1]={{1,18},{15,290}},
			[3]={{1,18},{15,290}}
		},
		reduceskillcd1={ --����ѩ��CD
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

	jianhuashan={ --����ɽ150�Ž���һBUFF����
		skill_desc=
		function(level)
			local nMag = floor(Link(level,SKILLS.jianhuashan.autoattackskill_ex[3])/256)
			local nPois = floor(Link(level,SKILLS.jianhuashanex.autoattackskill_ex[3])/18/256)
			return 
			"<color=orange>���������¾Ž�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.jianhuashan1.physicsenhance_p[1])).."%<color>\n"..
			"<color=orange>���������¾Ž�<color>�������ʣ�����<color=orange>"..nMag.."%<color>\n"..
			"<color=orange>���������¾Ž�<color>��ȴʱ�䣺����<color=orange>"..nPois.."��<color>"
		end,
		autoattackskill_ex={
			{{1,1368*256 + 1},{20,1368*256 + 1},{21,1368*256 + 1}}, --����ID*256+��1��2
			{{1,10*60*18},{20,10*60*18},{21,10*60*18}},	--buffʱ��
			{{1,1*256 + 1},{20,10*256 + 1},{21,10*256 + 1},} --�Ӽ�ֵ*256+���͸���1CD2  --�������Ա������߼�����Ȼ�ᱨ��
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
	jianhuashanex={ --����ɽ150�Ž���һBUFF����
		autoattackskill_ex={
			{{1,1368*256 + 2},{20,1368*256 + 2},{21,1368*256 + 2}}, --����ID*256+��1��2
			{{1,10*60*18},{20,10*60*18},{21,10*60*18}},	--buffʱ��
			{{1,1*18*256 + 2},{10,2*18*256 + 2},{20,3*18*256 + 2},{21,3*18*256 + 2}} --�Ӽ�ֵ*256+���͸���1CD2
		},
	},
	jianhuashan1={ --����ɽ150���¾Ž�
		physicsenhance_p={{{1,3},{21,82}}},
	},
	qihuashan={ --����ɽ-Ħ�ƽ���
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
	
	qihuashan1={ --����ɽ-�޼�������ը
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qihuashan1.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return
				"<color=orange>������ը<color>�����˺�������<color=orange>"..floor(Link(level,SKILLS.qihuashan1.colddamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.qihuashan1.colddamage_v[3])).."<color>��\n"..
				"<color=orange>������ը<color>���е��˼���<color=orange>Ħ�ƽ���"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
			end,
			colddamage_v={
				[1]={{1,24},{15,220}},
				[3]={{1,36},{15,280}}
			},
			reduceskillcd1={ --��Ħ�ƽ���CD
				[1]={{1,1380},{2,1380}},
				[3]={{1,5*18*256+1.5*18},{10,5*18*256+2*18},{21,5*18*256+3.5*18}}
			},
	},

	gungaibang={ --��ؤ��150�����ӵ�
		skill_desc=
			function(level)
				return 
				"<color=orange>�����ӵ�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.gungaibang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����ӵ�<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.gungaibang.missle_speed_add[1])).."<color>\n"
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

	zhanggaibang={ --��ؤ��150ʱ������
		skill_desc=
			function(level)
				return 
				"<color=orange>ʱ������<color>���˺�������<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.firedamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.firedamage_v[3])).."<color>��\n"..
				"<color=orange>ʱ������<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.zhanggaibang.missle_speed_add[1])).."<color>\n"
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

	daotianren={ --������150������ԭ
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>������ԭ<color>���˺�������<color=orange>"..floor(Link(level,SKILLS.daotianren.firedamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.daotianren.firedamage_v[3])).."<color>��\n"..
				"<color=orange>������ԭ<color>��������һ���ʣ�����<color=orange>"..floor(Link(level,SKILLS.daotianren.fatallystrike_p[1])).."<color>%\n"..
				"<color=orange>������ԭ<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>����������䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
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

	tianren_1={ --�����������
		skill_appendskillrandcomb={--�����ٻ�
			{{1,136},{20,136}},--��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	tianren_2={
		skill_appendskillrandcomb={--�ɺ��޼�
			{{1,140},{20,140}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	tianren_3={
		skill_appendskillrandcomb={--�������
			{{1,364},{20,364}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	tianren_4={
		skill_appendskillrandcomb={--��ħ���
			{{1,143},{20,143}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},

	qiangtianren={ --ǹ����150����ŭ��
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.tianren_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>����ŭ�Ρ�ħ����<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.qiangtianren.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>����ŭ�Ρ�ħ����<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.qiangtianren.missle_speed_add[1])).."<color>\n"..
				"<color=orange>����ŭ��<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>�����嶾���䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
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
	qiangtianren_child={ --ǹ����150ħ����
		missle_speed_add={{{1,1},{21,4}}},
		physicsenhance_p={{{1,55*0.15},{20,535*0.15}}},
	},
	
	daowuhun={ --�����150�������
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.daowuhun.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(floor(nCurValue/18)/256)
				return
				"<color=orange>�������<color>���е���ʱ��<color=orange>"..nPois.."%<color>�ĸ��ʸ��Լ�����һ�㡾ŭ������ȴʱ��<color=orange>"..nTime.."��<color>\n"..
				"<color=orange>�������<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daowuhun.physicsenhance_p[1])).."%<color>\n"
			end,
		skill_appendskillrandcomb={
			{{1,2006},{20,2006}},--��������id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,4*18*256+30},{10,3*18*256+40},{20,3*18*256+50},{21,3*18*256+50}}--��ȴ*256+����
		},
		physicsenhance_p={{{1,20*0.53},{20,80*0.53},}},
		special_point_add={
			{{1,1982},{20,1982}},-- Ŀ�꼼��id
			{{1,0},{20,0}},-- ��������������������0����Ϊbuff������-1
			{{1,1},{20,1}},-- ���Ӹ���
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
	daowuhun_child={ --�����150��Ѫ֮��
		skill_desc=
			function(level)
				return 
				"<color=orange>��Ѫ֮��<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daowuhun.physicsenhance_p[1])).."%<color>\n"
			end,
			physicsenhance_p={{{1,20*0.53},{20,80*0.53},}},
		},

	dunwuhun={ --�����150��ʦ��²
		skill_desc=
			function(level)
				return 
				"<color=orange>��ʦ��²<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.dunwuhun.physicsenhance_p[1])).."%<color>\n"
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
	dunwuhun_child={--�����150�����İ�
		skill_desc=
			function(level)
				return 
				"<color=orange>�����İ�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.dunwuhun_child.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����İ�<color>���ٵ��˹������ܼӳɣ�����<color=orange>"..-floor(Link(level,SKILLS.dunwuhun_child_child.skill_enhance[1])).."%<color>\n"
			end,
			physicsenhance_p={{{1,18*0.3},{20,100*0.3},}},
		},
	dunwuhun_child_child={--�����150�����İ�������Ч��
		skill_enhance={
			{{1,-1},{20,-30}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},

	kunlun_1={ --�����ؼ��������
		skill_appendskillrandcomb={--������
			{{1,392},{20,392}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	kunlun_2={
		skill_appendskillrandcomb={--��
			{{1,174},{20,174}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	kunlun_3={
		skill_appendskillrandcomb={--��ڤ����
			{{1,393},{20,393}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	kunlun_4={
		skill_appendskillrandcomb={--�ۺ���ѩ
			{{1,175},{20,175}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},
	kunlun_5={
		skill_appendskillrandcomb={--���ٻ�Ӱ
			{{1,90},{20,90}},
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,7*18*256+30},{10,6*18*256+35},{11,6*18*256+35},{20,5*18*256+40},{21,5*18*256+40}}--��ȴ*256+����
		},
	},

	daokunlun={ --������150�����
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>�����<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.daokunlun.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����<color>�����ٶȣ�����<color=orange>"..floor(Link(level,SKILLS.daokunlun.missle_speed_add[1])).."<color>\n"..
				"<color=orange>�����<color>�������룺����<color=orange>"..floor(Link(level,SKILLS.daokunlun.missle_speed_add[1]) * 16).."<color>\n"..
				"<color=orange>�����<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>����������䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
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

	jiankunlun={ --������150��������
		skill_desc=
			function(level)
				return 
				"<color=orange>��������<color>�׹��˺�������<color=orange>"..floor(Link(level,SKILLS.jiankunlun.lightingdamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.jiankunlun.lightingdamage_v[3])).."<color>��\n"
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
	jiankunlun_child={ --������150�׶�Ǭ��
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[3]))
				local nH24 = floor(nCurValue/256)
				local nMag = nCurValue-(nH24*256)
				local szTime = floor(nH24/18)
				local nCurValue2 = floor(Link(level,SKILLS.kunlun_1.skill_appendskillrandcomb[2]))
				local nlevel = nCurValue2-(floor(nCurValue2/256)*256)
				return 
				"<color=orange>�׶�Ǭ��<color>�׹��˺�������<color=orange>"..floor(Link(level,SKILLS.jiankunlun_child.lightingdamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.jiankunlun_child.lightingdamage_v[3])).."<color>��\n"..
				"<color=orange>�׶�Ǭ��<color>����Ŀ����<color=orange>"..nMag.."%<color>�ĸ���Ϊ�丽��<color=orange>"..nlevel.."��<color>����������䣬\n"..
				"������<color=orange>"..szTime.."��<color>�ڲ����ٴδ���"
			end,
		lightingdamage_v={
			[1]={{1,32},{20,434},},
			[3]={{1,32},{20,434},}
		},
	},

	jianwudang={ --���䵱150�����Ǻ�
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianwudang.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return 
				"<color=orange>�����Ǻ�<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.jianwudang.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>�����Ǻ�<color>�������ζ��ּ��ʣ�����<color=orange>"..floor(Link(level,SKILLS.jianwudang.stun_p[1])).."%<color>\n"..
				"<color=orange>�����Ǻ�<color>���е��˼���<color=orange>���ٲ�Ⱦ"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
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
	
	qiwudang={ --���䵱150�컯̫��
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qiwudang.reduceskillcd1[3]))
				local nH24 = floor(nCurValue/256)
				local nL8 = nCurValue-(nH24*256)
				local nMag = floor(nH24/18)
				local szTime = floor(nL8/18)
				return 
				"<color=orange>�컯̫��<color>�׹��˺�������<color=orange>"..floor(Link(level,SKILLS.qiwudang.lightingdamage_v[1])).."<color>��<color=orange>"..floor(Link(level,SKILLS.qiwudang.lightingdamage_v[3])).."<color>��\n"..
				"<color=orange>�컯̫��<color>���е��˼���<color=orange>���ٲ�Ⱦ"..szTime.."��<color>��ȴʱ�䣬ÿ<color=orange>"..nMag.."��<color>����Чһ��"
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

	jianxiaoyao={ --����ң150ʮ��һɱ
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.jianxiaoyao.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				return
				"<color=orange>ʮ��һɱ<color>���е���ʱ��<color=orange>"..nPois.."%<color>�ĸ��ʸ��Լ�����һ�㡾���ɡ�\n"..
				"<color=orange>ʮ��һɱ<color>�չ��˺�������<color=orange>"..floor(Link(level,SKILLS.jianxiaoyao.physicsenhance_p[1])).."%<color>\n"..
				"<color=orange>ʮ��һɱ<color>����һ���ʣ�����<color=orange>"..floor(Link(level,SKILLS.jianxiaoyao.deadlystrike_p[1])).."%<color>\n"
			end,
		skill_appendskillrandcomb={
			{{1,2100},{20,2100}},--��������id
			{{1,1*256+1},{19,1*256+19},{20,1*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,13*256+10},{10,13*256+30},{20,13*256+50},{21,13*256+50}}--��ȴ*256+����
		},
		physicsenhance_p={{{1,7},{21,163}}},
		deadlystrike_p={{{1,1},{21,15}}},
		special_point_add={
			{{1,2083},{20,2083}},-- Ŀ�꼼��id
			{{1,0},{20,0}},-- ��������������������0����Ϊbuff������-1
			{{1,1},{20,1}},-- ���Ӹ���
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

	qinxiaoyao={ --����ң150÷����Ū
		skill_desc=
			function(level)
				return
				"<color=orange>÷����Ū<color>�׹��˺�������<color=orange>"..floor(Link(level,SKILLS.qinxiaoyao.lightingdamage_p[1])).."%<color>\n"
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
	qinxiaoyao_child={ --����ң150�Ӽ��ܡ�����������
		skill_desc=
			function(level)
				local nCurValue = floor(Link(level,SKILLS.qinxiaoyao_child.skill_appendskillrandcomb[3]))
				local nPois = nCurValue-(floor(nCurValue/256)*256)
				local nTime = floor(Link(level,SKILLS.qinxiaoyao1.lightingres_yan_p[2])/18)
				return
				"<color=orange>��������<color>�������ζ��ּ��ʣ�����<color=orange>"..floor(Link(level,SKILLS.qinxiaoyao_child.stun_p[1])).."%<color>\n"..
				"<color=orange>��������<color>���е���ʱ��<color=orange>"..nPois.."%<color>����Ϊ��ʩ��<color=orange>"..nTime.."��<color>��<color=water>����㱡�<color>״̬��\n"..
				"���׻𶾷�������<color=orange>"..-floor(Link(level,SKILLS.qinxiaoyao1.coldres_yan_p[1])).."%<color>������\n"
			end,
		skill_appendskillrandcomb={
			{{1,2115},{20,2115}},--��������id
			{{1,0*256+1},{19,0*256+19},{20,0*256+20}},--X*256+���ܵȼ���XΪ0��Ŀ�꣬Ϊ1���Լ�
			{{1,3*18*256+30},{10,3*18*256+40},{21,3*18*256+50}}--��ȴ*256+����
		},
		stun_p={{{1,1},{21,14}},{{1,1},{20,12},{21,12}}},
	},
	qinxiaoyao1={ --����ңDEBUFF
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
--����2���㣬�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
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
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
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
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
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
--�����趨��ʽ���£�
--SKILLS={
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	����������
--}
--�磺
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--ħ������physicsenhance_p����1��1��ʱΪ35��20��ʱΪ335�����߲��Ĭ������
--			[2]={{1,0},{20,0}},
--		},--û��[3]����ʾħ������physicsenhance_p����2��Ĭ��Ϊ�κ�ʱ����0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--�����������ܡ��������¡���ħ�����Ժ���ֵ
-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata�����ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
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

