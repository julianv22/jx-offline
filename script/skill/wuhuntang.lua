--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--�����-��
	changyinghuichi={ --��ӧ�ӳ�
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,10},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,100}},
			[3]={{1,10},{20,150}}
		},
		addskilldamage1={
			[1]={{1,1981},{2,1981}},
			[3]={{1,1},{20,40}}
		},
		addskilldamage2={
			[1]={{1,1983},{2,1983}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1985},{2,1985}},
			[3]={{1,1},{20,32}}
		},
		missle_speed_v={{{1,20},{20,20}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	wuhuntangdaofa={ --����õ���
		addphysicsdamage_p={{{1,10},{20,150}},{{1,-1},{2,-1}},{{1,11},{2,11}}},
		deadlystrikeenhance_p={{{1,2},{20,25}},{{1,-1},{2,-1}}}
	},
	gongzhongbingxing={ --���ұ���
		--meleedamagereturn_p={{{1,-1},{20,-15}},{{1,-1},{2,-1}}},
		--rangedamagereturn_p={{{1,-1},{20,-15}},{{1,-1},{2,-1}}},
		anti_enhancehit_rate={{{1,0},{34,0},{35,5},{39,5},{40,10},{50,10}},{{1,-1},{2,-1}}},
		block_rate={{{1,0},{34,0},{35,5},{39,5},{40,10},{50,10}},{{1,-1},{2,-1}}},
		skill_desc=
			function(level)
				return "M�i <color=orange> "..floor(Link(level,SKILLS.gongzhongbingxing.autocastskill[3]) / 18/256).." gi�y <color>t� ��ng nh�n ���c <color=orange>2 t�ng [N�]<color>,"
				.."T�i �a c� <color=orange>"..floor(Link(level,SKILLS.gongzhongbingxing.special_point_base[3])).."T�ng [N�]<color>"
			end,
        autocastskill = {
			{{1,1989*256 + 1},{20,1989*256 + 20}},--Ŀ�꼼��id * 256 + �ȼ�
			{{1,-1},{20,-1}},-- Ϊ1��ʾ��CD������CD��-1
			{{1, (3*18*256 + 100)},{20, (3*18*256 + 100)}},-- ���֡�� * 256 + ��������
		},
        special_point_base={
			{{1,1976},{20,1976}},-- Ŀ�꼼��id
			{{1,-1},{20,-1}},-- ��������������������0����Ϊbuff������-1
			{{1,5 },{20,5}},-- ���Ӹ���
		}
	},
	nuqi={ --���ұ���-ŭ��������
        special_point_add={
			{{1,1976},{20,1976}},-- Ŀ�꼼��id
			{{1,0},{20,0}},-- ��������������������0����Ϊbuff������-1
			{{1,2},{20,2}},-- ���Ӹ���
		}
	},
	nuqi2={ --���ұ���-ŭ2��������
		special_point_add={
			{{1,1990},{20,1990}},-- Ŀ�꼼��id
			{{1,-1},{20,-1}},-- ��������������������0����Ϊbuff������-1
			{{1,4 * 256},{20,4 * 256}},-- ������*256 + ���Ӹ���
		}
	},
	hanshanji={ --��ɽ��
		physicsenhance_p={{{1,25*1.05},{20,215*1.05},{28,295*1.05},{29,305*1.15}}},
		deadlystrike_p={{{1,4*1.05},{20,80*1.05},{28,112*1.05},{29,116*1.15}}},
		cost_sp={
			{{1,1976},{20,1976}},  -- Ŀ�꼼��id
			{{1,0},{20,0}}, -- ����
			{{1,2},{20,2}}, -- �Լ���
		},
		skill_desc=
			function(level)
				return "<color=orange>�i�u ki�n thi tri�n: <color><color=yellow>"..floor(Link(level,SKILLS.hanshanji.cost_sp[3])).." t�ng [N�]<color>\n"
				.."T� l� h�i ph�c sinh l�c: <color=orange>-"..floor(Link(level,SKILLS.hanshanji_zi2.lifereplenish_dec_p[1])).."%<color>\n"
			end,
		missle_speed_v={{{1,22},{20,30},{21,32},{22,32}}},
		skill_attackradius={{{1,22*16},{20,30*16},{21,30*16}}},
	},
	hanshanji_zi={ --��ɽ���˺�
		physicsenhance_p={{{1,25*1.05},{20,215*1.05},{28,295*1.05},{29,305*1.15}}},
		deadlystrike_p={{{1,4*1.05},{20,80*1.05},{28,112*1.05},{29,116*1.15}}},
		missle_speed_v={{{1,22},{20,30},{21,32},{22,32}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,4},{10,4}}},
		skill_attackradius={{{1,22*16},{20,30*16},{21,30*16}}},
	},
	hanshanji_zi2={ --��ɽ�����ظ�
		lifereplenish_dec_p={{{1,1},{28,25},{34,30},{35,30}},{{1,18*1},{28,18*6},{34,18*9},{35,18*9}}},
	},
	nupitianya={ --ŭ������
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,10},{20,179}}},
		firedamage_v={
			[1]={{1,70},{20,360}},
			[3]={{1,70},{20,420}}
		},
		addskilldamage1={
			[1]={{1,1983},{2,1983}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1985},{2,1985}},
			[3]={{1,1},{20,50}}
		},
		skill_attackradius={{{1,120},{20,120}}},
		skill_cost_v={{{1,28},{20,48}}}
	},
	baijiangguzhanhan={ --�½���ս��
		attackspeed_v={{{1,1},{30,43},{31,43}},{{1,-1},{30,-1}}},
	    attackspeed_yan_v={{{1,1},{30,43},{31,43}},{{1,-1},{30,-1}}},
		anti_block_rate={{{1,1},{30,30},{31,30}},{{1,-1},{30,-1}}},
		me2metaldamage_p={{{1,20},{30,20},{31,20}},{{1,-1},{30,-1}}},
		metal2medamage_p={{{1,20},{30,20},{31,20}},{{1,-1},{30,-1}}},
	},
	jicanhunurou={ --���ͺ�²��
		physicsenhance_p={{{1,25},{20,231}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		firedamage_v={
			[1]={{1,10},{20,482}},
			[3]={{1,10},{20,482}}
		},
		addskilldamage1={
			[1]={{1,1983},{2,1983}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage2={
			[1]={{1,1985},{2,1985}},
			[3]={{1,1},{20,32}}
		},
		skill_cost_v={{{1,28},{20,48}}},
		missle_speed_v={{{1,30},{20,30}}},
		skill_attackradius={{{1,120},{20,120}}},
	},
	wumuyizhi={ --������־
		lock_life={
			{{1,100},{35,3000},{36,3400}}, -- ��������ֵ
			{{1,18*1},{20,18*3},{30,18*4},{41,18*4}}, -- ����ʱ�䣬��buff�ĵ�һ������Ϊ׼
			{{1,1},{20,1,}},-- 0����Ч���� 1�����ܵ�������ֵ�� 2�����ܸ�������ֵ��3��ֻ�ܵ�������ֵ
		},
		cast_when_buff_removed = {
			{{1,1991},{2,1991}}, -- Ҫ�ŵļ���
			{{1,-1},{2,-1}}, -- �ȼ���-1����Ҿ���
			{{1,1984},{1,1984}} -- ��������ܵĵȼ�ȥ��1991�ļ���
		},
		ignorenegativestate_p={
			{{1,1},{15,1},{20,1},{21,1}},
			{{1,18},{20,18},{21,18}},
		},
		skill_mintimepercast_v={{{1,60*18},{20,50*18},{30,45*18},{40,40*18},{41,40*18}}},
		skill_mintimepercastonhorse_v={{{1,60*18},{10,55*18},{20,50*18},{30,45*18},{40,40*18},{41,40*18}}},
		anti_do_hurt_p={{{1,1},{35,35}},{{1,18*1},{35,18*5},{40,18*7},{41,18*7}}},
		anti_do_stun_p={{{1,1},{35,35}},{{1,18*1},{35,18*5},{40,18*7},{41,18*7}}},
		fasthitrecover_v={{{1,50},{35,1000}},{{1,18*1},{35,18*5},{40,18*7},{41,18*7}}},
		stuntimereduce_p={{{1,50},{35,1000}},{{1,18*1},{35,18*5},{40,18*7},{41,18*7}}},
		skill_enhance={{{1,3},{35,100},{36,110}},{{1,18*1},{35,18*5},{40,18*7},{41,18*7}}},
		skill_desc=
			function(level)
				return "<color=orange>�i�u ki�n thi tri�n: <color><color=yellow>"..floor(Link(level,SKILLS.wumuyizhi.cost_sp[3])).." t�ng [N�]<color>\n"
				.."Thi tri�n k� n�ng, <color=orange>l�p t�c<color> x�a tr�ng th�i b�t l�i c�a b�n th�n\n"
				.."Trong th�i gian duy tr� tr�ng th�i k� n�ng, t�ng kh� n�ng chi�n ��u v� sinh l�c kh�ng th� gi�m ��n <color=orange>"..floor(Link(level,SKILLS.wumuyizhi.lock_life[1])).."<color> tr� xu�ng\n"
				.."Th�i gian duy tr�: <color=orange>"..floor(Link(level,SKILLS.wumuyizhi.lock_life[2]) / 18).." gi�y<color>, "
				.."Th�i gian kh�i ph�c chi�u th�c: <color=orange>"..floor(Link(level,SKILLS.wumuyizhi.skill_mintimepercast_v[1]) / 18).." gi�y<color>\n"
			end,
		cost_sp={
			{{1,1976},{20,1976}},  -- Ŀ�꼼��id
			{{1,0},{20,0}}, -- ����
			{{1,1},{20,1}}, -- �Լ���
		},
	},
	keyinxiongnuxue={ --������ūѪ
		physicsenhance_p={{{1,12*1.05},{15,100*1.05},{20,206*1.05},{28,375*1.05},{29,396*1.05}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		firedamage_v={
			[1]={{1,70*1.05},{15,150*1.05},{20,285*1.05},{28,501*1.05},{29,528*1.15}},
			[3]={{1,70*1.05},{15,200*1.05},{20,432*1.05},{28,803*1.05},{29,849*1.15}}
		},
		addskilldamage1={
			[1]={{1,1985},{2,1985}},
			[3]={{1,1},{20,32}}
		},
		skill_cost_v={{{1,30},{20,50}}},
		missle_speed_v={{{1,35},{20,35}}},
		skill_attackradius={{{1,160},{20,160}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(8600,1.15,1,1,1)},
							{2,SkillExpFunc(8600,1.15,2,1,1)},
							{3,SkillExpFunc(8600,1.16,3,1,1)},
							{4,SkillExpFunc(8600,1.17,4,1,1)},
							{5,SkillExpFunc(8600,1.18,5,1,1)},
							{6,SkillExpFunc(8600,1.19,6,2,1)},
							{7,SkillExpFunc(8600,1.20,7,2,1)},
							{8,SkillExpFunc(8600,1.21,8,2,1)},
							{9,SkillExpFunc(8600,1.22,9,2,1)},
							{10,SkillExpFunc(8600,1.23,10,2,1)},
							{11,SkillExpFunc(8600,1.24,11,2,1)},
							{12,SkillExpFunc(8600,1.23,12,2,1)},
							{13,SkillExpFunc(8600,1.22,13,2,1)},
							{14,SkillExpFunc(8600,1.21,14,2,1)},
							{15,SkillExpFunc(8600,1.20,15,3,1)},
							{16,SkillExpFunc(8600,1.19,16,3,1)},
							{17,SkillExpFunc(8600,1.18,17,3,1)},
							{18,SkillExpFunc(8600,1.17,18,3,1)},
							{19,SkillExpFunc(8600,1.16,19,3,1)},
							{20,SkillExpFunc(8600,1.15,20,4,1)},
						}},
	},
	zhongwuliufeng={ --��������
		attackrating_p={{{1,10},{20,200}}},
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
		skill_desc=
			function(level)
				return "Sau khi ch�m d�t tr�ng th�i <color=yellow>V� M�c Di Th�<color>, b�n th�n h�i sinh l�c: <color=orange>"..floor(Link(level,SKILLS.zhongwuliufengBUFF.resume_life_p[1])).."% x Sinh l�c t�i �a b�n th�n<color>\n\n"
			end,
	},
	zhongwuliufengBUFF={ --���������ѪBUFF
		resume_life_p = {
			{{1,30},{28,60},{34,70},{35,71}}, -- �ذٷ�֮��,������Ч
			{{1,1},{2,1}} -- ����ʱ�䣬ÿ֡��Ч
		},
	},
	chanjianchuning={ --�������
		physicsenhance_p={{{1,17},{10,170},{20,340},{30,510},{40,680},{50,850},{51,850}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,15},{10,150},{20,300},{50,750},{51,750}},
			[3]={{1,15},{10,150},{20,300},{50,750},{51,750}}
		},
		reset_bufftime = {
			{{1,1988},{20,1988}}, -- Ŀ�꼼��id
			{{1,-1},{20,-1}}, -- ����ʱ�䣬-1��ʾ��Ŀ�꼼�ܾ���
			{{1,0},{20,0}} -- �ܷ�Ŀ�꼼�ܵ�ʱ������
		},
		skill_desc=
			function(level)
				return "Sau khi ��i ph��ng tr�ng ��n <color=yellow>Tr� Gian Di�t N�nh<color>, n�u ��i ph��ng �� c� <color=orange>tr�ng th�i b�t l�i Lay S�n K�ch<color> s� t�o l�i th�i gian duy tr� tr�ng th�i n�y\n\n"
			end,
		skill_cost_v={{{1,18},{20,55},{23,66},{26,72}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,8},{10,8}}},
		missle_speed_v={{{1,40},{20,40}}},
		skill_attackradius={{{1,480},{20,480}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	feixuezhiren={ --��Ѫ֮��
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		physicsenhance_p={{{1,10*0.5},{20,179*0.5}}},
		firedamage_v={
			[1]={{1,70*0.5},{20,360*0.5}},
			[3]={{1,70*0.5},{20,420*0.5}}
		},
		skill_attackradius={{{1,480},{20,480}}},
		skill_cost_v={{{1,28},{20,48}}}
	},
	jingzhongbaoguo= --���ұ���
	{
		skill_desc=
			function(level)
				return "<color=water>[D�ng C�m Ti�n L�n]<color>, ".."Gi�p b�n th�n t�ng t�c �� di chuy�n <color=orange>"..floor(Link(level,SKILLS.fenyongdangxian.fastwalkrun_p[1]))..
				"%<color> t�c �� di chuy�n trong <color=orange>"..floor(Link(level,SKILLS.fenyongdangxian.fastwalkrun_p[2]) / 18).."<color> gi�y \n"
			end,	
		autoreplyskill=
		{--�Զ��������µ���
			{
				{1,1987*256 + 1},{20,1987*256 + 20},{21,1987*256 + 21}
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,15*18*256 + 1},{20,15*18*256 + 20},{21,15*18*256 + 21}
			}
		},
	},
	 fenyongdangxian={ --���µ���
		fastwalkrun_p={{{1,10},{20,30}},{{1,5*18},{20,13*18},{21,13*18}}},--������
	 },
	 ---��ϵ
	 duozhai_yangqi={ --��կ����
	 	physicsenhance_p={{{1,5},{20,55}}},
		skill_cost_v={{{1,12},{20,20}}},
		firedamage_v={
			[1]={{1,5},{20,50}},
			[3]={{1,5},{20,50}}
		},
		addskilldamage1={
			[1]={{1,1963},{2,1963}},
			[3]={{1,1},{20,45}}
		},
		addskilldamage2={
			[1]={{1,1967},{2,1967}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage3={
			[1]={{1,1969},{2,1969}},
			[3]={{1,1},{20,38}}
		},
	},
	wuhuntang_dunfa={ --����öܷ�
		addphysicsdamage_p={{{1,15},{20,215}},{{1,-1},{2,-1}},{{1,12},{2,12}}},
		--attackratingenhance_p={{{1,35},{20,272}},{{1,-1},{2,-1}}},
		attackratingenhance_p={{{1,20},{20,320}},{{1,-1},{2,-1}}},--���������� LLX140722
		addfiredamage_v={{{1,20},{30,315}},{{1,18*120},{30,18*360}}},
		deadlystrikeenhance_p={{{1,6},{20,35}},{{1,-1},{2,-1}}}
	},
	chaotian_que={ --������
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		physicsenhance_p={{{1,25},{20,231}}},
		deadlystrike_p={{{1,4},{20,55}}},
		firedamage_v={
			[1]={{1,10},{20,482}},
			[3]={{1,10},{20,482}}
		},
		addskilldamage1={
			[1]={{1,1967},{2,1967}},
			[3]={{1,1},{20,65}}
		},
		addskilldamage2={
			[1]={{1,1969},{2,1969}},
			[3]={{1,1},{20,54}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{2,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,12},{20,20}}}
	},
	zhenbian_chui={ --�����
		physicsenhance_p={{{1,45},{20,445}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,4},{20,65}}},
		firedamage_v={
			[1]={{1,6},{15,100},{20,378}},
			[3]={{1,6},{15,100},{20,378}}
		},
		addskilldamage1={
			[1]={{1,1969},{2,1969}},
			[3]={{1,1},{20,30}}
		},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{2,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,30},{20,30}}},
--		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,378},{20,378}}
--		},
--		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(11600,1.15,1,1,1)},
							{2,SkillExpFunc(11600,1.15,2,1,1)},
							{3,SkillExpFunc(11600,1.16,3,1,1)},
							{4,SkillExpFunc(11600,1.17,4,1,1)},
							{5,SkillExpFunc(11600,1.18,5,1,1)},
							{6,SkillExpFunc(11600,1.19,6,1,1)},
							{7,SkillExpFunc(11600,1.20,7,1,1)},
							{8,SkillExpFunc(11600,1.21,8,1,1)},
							{9,SkillExpFunc(11600,1.22,9,1,1)},
							{10,SkillExpFunc(11600,1.23,10,1,1)},
							{11,SkillExpFunc(11600,1.24,11,1,1)},
							{12,SkillExpFunc(11600,1.23,12,1,1)},
							{13,SkillExpFunc(11600,1.22,13,1,1)},
							{14,SkillExpFunc(11600,1.21,14,1,1)},
							{15,SkillExpFunc(11600,1.20,15,1,1)},
							{16,SkillExpFunc(11600,1.19,16,1,1)},
							{17,SkillExpFunc(11600,1.18,17,1,1)},
							{18,SkillExpFunc(11600,1.17,18,1,1)},
							{19,SkillExpFunc(11600,1.16,19,1,1)},
							{20,SkillExpFunc(11600,1.15,20,1,1)},
							}},
	},
	qingyin_tiruilv1={ --��ӧ������
		sorbdamage_yan_p={{{1,10},{15,8},{32,25}},{{1,36},{2,36}}},
		anti_do_hurt_p={{{1,1},{15,3},{20,5},{25,6}},{{1,36},{2,36}}},
		anti_enhancehit_rate={{{1,1},{5,2},{10,3},{15,4},{20,5},{23,6},{26,7}},{{1,36},{20,36}}},
		--lifereplenish_v={{{1,1},{15,4},{25,15},{26,15}},{{1,18},{2,18}}},
		--manareplenish_v={{{1,1},{15,4},{25,15},{26,15}},{{1,18},{2,18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
		cost_sp={
			{{1,1976},{20,1976}},  -- Ŀ�꼼��id
			{{1,0},{20,0}}, -- ����
			{{1,4},{20,4}}, -- �Լ���
		},
		skill_desc=
			function(level)
				return "<color=orange>�i�u ki�n thi tri�n: <color><color=yellow>"..floor(Link(level,SKILLS.qingyin_tiruilv1.cost_sp[3])).." t�ng [N�]<color>\n"
			end,
		--skill_desc=
			--function(level)

				--local nMag = floor(Link(level,SKILLS.longxuan2.colddamage_v[3]))
				--local nPois = format("%.2f", (floor(Link(level,SKILLS.longxuan2.frozen_action[2])*100/18 )/100))
				--local nAtk = floor(Link(level,SKILLS.podao_pojian.candetonate3[3]))
				--return format("�����������<color=orange>%d<color>��ı������˺�����ʹ���˶���<color=orange>%.2f<color>�룬\n", nMag, nPois)
			--end,
		addskilldamage1={
				[1]={{1,1382},{2,1382}},
				[3]={{1,1},{20,60},{31,70}}
			},
	},
	qingyin_tiruilv2={ --��ӧ������
		candetonate1={
			[1]={{1,421*256+0},{2,421*256+0}},
			[3]={{1,36},{26,36},{31,36},{32,36}},
		},
	},
	huishi_mielu={ --��ʦ��²
		physicsenhance_p={{{1,55},{20,535},{23,686},{26,762}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		deadlystrike_p={{{1,10},{10,20},{20,40},{30,60},{40,80},{45,85}}},
		firedamage_v={
			[1]={{1,10},{15,150},{20,500},{23,900},{26,1200}},
			[3]={{1,10},{15,150},{20,500},{23,900},{26,1200}}
		},
		--missle_speed_v={{{1,24},{20,24},{21,24}}},
		missle_speed_v={{{1,55},{20,55},{21,55}}},--���ӵ����̵��ӵ������ٶ� ByLLX 140722
		skill_attackradius={{{1,480},{20,480},{21,480}}},
		skill_cost_v={{{1,48},{20,72},{23,79}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1970},{20,1970}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		skill_skillexp_v={{	{1,300},
												{2,600},
												{3,1000},
												{4,1500},
												{5,2100},
												{6,2800},
												{7,3600},
												{8,4500},
												{9,5500},
												{10,6600},
												{11,7800},
												{12,9100},
												{13,10500},
												{14,12000},
												{15,13600},
												{16,15300},
												{17,17100},
												{18,19000},
												{19,21400},
												{20,90000},
												{21,120000},
												{22,150000},
												{23,200000},
												{24,250000},
												{25,300000},
												{26,390000},
												}},	
	},
	huishi_mielu_2={ --��ʦ��²��2ʽ
		physicsenhance_p={{{1,10},{15,60},{30,120},{40,200},{45,200}}},
		seriesdamage_p={{{1,40},{15,40},{20,80},{21,82}}},
		firedamage_v={
			[1]={{1,1},{30,230},{31,230}},
			[3]={{1,1},{30,400},{31,400}}
		},
		missle_speed_v={{{1,45},{20,45},{21,45}}},
		skill_misslenum_v={{{1,1},{5,1},{20,3},{21,3}}},
	},
	zhiyong_new={ --���³���
		lifemax_p={{{1,5},{25,60},{31,70},{32,70}},{{1,12*18*256},{20,12*18*256},{31,12*18*256},{32,12*18*256}}},
		lifemax_yan_p={{{1,5},{25,60},{31,70},{32,70}},{{1,12*18*256},{20,12*18*256},{31,12*18*256},{32,12*18*256}}},
		allres_yan_p={{{1,1},{30,25},{40,25}},{{1,12*18*256},{20,12*18*256},{31,12*18*256},{32,12*18*256}}},
		allres_p={{{1,1},{30,25},{40,25}},{{1,12*18*256},{20,12*18*256},{31,12*18*256},{32,12*18*256}}}
		},
--		missle_speed_v={{{1,28},{20,32},{21,32}}},
--		skill_attackradius={{{1,448},{20,512},{21,512}}},
--		skill_cost_v={{{1,30},{20,35}}}
	zhiyong_new1={ --���³�������
		--autoreplyskill={{{1,1363*256 + 1},{20,1363*256 + 20},{21,1363*256 + 21}},{{1,10*60*18},{20,10*60*18}},{{1,15*18*256 + 1},{20,15*18*256 + 3},{31,15*18*256 + 3},{32,15*18*256 + 3}}},
		--���Ӵ������ʣ�������ȴʱ�� LLX140722

		skill_desc=
			function(level)
				return "<color=water>[Chi�t K�ch]<color> g�y cho ng��i t�n c�ng, k� n�ng t�n c�ng t�ng: Gi�m <color=orange>"..floor(-Link(level,SKILLS.zhiyong_chaolun1.skill_enhance[1]))..
				"%<color> t�c �� di chuy�n trong <color=orange>"..floor(Link(level,SKILLS.zhiyong_chaolun1.skill_enhance[2]) / 18).."<color> gi�y \n"
			end,

		autoreplyskill={{{1,16777216+1973*256 + 1},{20,16777216+1973*256 + 20},{21,16777216+1973*256 + 21}},{{1,10*60*18},{20,10*60*18}},{{1,12*18*256 + 1},{20,12*18*256 + 20},{30,12*18*256 + 30},{31,12*18*256 + 30}}},
		skill_cost_v={{{1,48},{20,72},{23,79}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_showevent={{{1,1},{10,1},{20,1}}},
	},
	wuhuntangjiangongsu=
	{--����ü�����
		attackspeed_yan_v=
		{
			{
				{1,-1},{10,-5},{11,-6},{20,-15},{21,-15}
			},
			{
				{1,1*18},{20,5*18},{21,5*18}
			}
		},
		castspeed_yan_v=
		{
			{
				{1,-1},{10,-5},{11,-6},{20,-15},{21,-15}
			},
			{
				{1,1*18},{20,5*18},{21,5*18}
			},
		},
		attackspeed_v={{{1,-1},{10,-5},{11,-6},{20,-15},{21,-15}},{{1,1*18},{20,5*18},{21,5*18}}},
		castspeed_v={{{1,-1},{10,-5},{11,-6},{20,-15},{21,-15}},{{1,1*18},{20,5*18},{21,5*18}}},
		skill_enhance={
			[1]={{1,0},{20,0},{21,-2},{22,-4}},
			[2]={{1,1*18},{20,5*18},{21,5*18}},
			[3]={},
			},
	},
	zhiyong_chaolun1=
	{--���³��׼�����
		skill_enhance={
			[1]={{1,-1},{20,-20},{21,-22},{22,-24}},
			[2]={{1,1*18},{20,5*18},{21,5*18}},
			[3]={},
			},
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

