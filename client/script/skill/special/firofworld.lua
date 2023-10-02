Include("\\script\\skill\\head.lua")
SKILLS={
	huwan7={ --����7�ż��ܣ�����ɫ���е��ˣ���1%������5��ʹ���˲���ʹ���书,CD1��
		autoattackskill={{{1,1265*256 + 1},{20,1265*256 + 20}},{{1,-1},{20,-1}},{{1,1*18*256 + 1},{20,1*18*256 + 1}}},
					},
	huwan7_zuzhou={ --����7�ż��ܾ���Ч����5���ڲ���ʹ�ü���
		forbit_attack={
			[1]={{1,1},{20,1}},
			[2]={{1,18*5},{2,18*5.5},{3,18*6},{4,18*6}}
									},
								},

	xianglian3 ={ --����3�ż��ܡ�����ɫ������ʱ��Ѫ������25%��10%���ʻ��5��������ʱ��ɫ���������˺�x4������������״̬��ʧ��CD10��
		autorescueskill=
		{
			{
				{1,1267*256 + 1},{20,1267*256 + 20},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,10*18*256 + 10},
				{2,10*18*256 + 15},
				{3,10*18*256 + 20},
				{4,10*18*256 + 20},
			}
		},
					},
	xianglian3_fuzhu={ --����3�ż���ʵ��Ч��������5�룬ͬʱ�ػ�����100%����4�룬�ػ�Ч��200%
		hide={{{1,1},{20,1}},{{1,5*18},{20,5*18}}},
		enhancehit_rate={{{1,100},{2,100}},{{1,18*4},{20,18*4}}},
		enhancehiteffect_rate=
		{
  		[1] = {{1,200},{2,200}},
  		[2] = {{1,18*4},{20,18*4}},
  		[3] = {},
		},
	},
	
	yuenan1hao={ --Խ��1�ż��ܣ�����ɫ���е��ˣ���1%���ʺ��Եз�ȫ��100%��CD1��
		autoattackskill={{{1,1320*256 + 1},{20,1320*256 + 20}},{{1,-1},{20,-1}},{{1,10*18*256 + 1},{2,10*18*256 + 2},{3,10*18*256 + 3},{4,10*18*256 + 3}}},
		skill_desc=
			function(level)
				return "Khi tr�ng ��ch c�<color=orange>1%<color>t� l� k�ch ho�t<color=orange>b� qua kh�ng t�t c� c�a ��i ph��ng 100%<color>hi�u �ng, duy tr� 1 gi�y\n"
			end,
					},
	yuenan1_duzhu={ --Խ��1�ż��ܾ���Ч����3���ں���ȫ��100%������1��
		anti_allres_yan_p={
			[1]={{1,100},{20,100}},
			[2]={{1,18*3},{20,18*3}},
			[3]={},
									},
		},
		
		yuenan2hao={ --Խ��2�ż��ܣ���ɫ����ʱ50%����ʹ��Χ400��Χ�ڵĽ�ɫ���ܹ�������45%
		autodeathskill={{{1,1322*256 + 1},{20,1322*256 + 20}},{{1,-1},{20,-1}},{{1,50},{2,55},{3,60},{4,60}}},
		skill_desc=
			function(level)
				return "Sau khi ch�t c�<color=orange>50%<color>t� l� l�m cho k� n�ng c�ng k�ch c�a nh�n v�t xung quanh gi�m �i<color=orange>45%<color>hi�u �ng, duy tr�<color=orange>10<color>gi�y\n"
			end,
					},
	yuenan2_duzhu={ --Խ��2�ż��ܾ���Ч�������ܹ�������45%������10��
		skill_enhance={
			[1]={{1,-300},{2,-400},{3,-500},{4,-500}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
		missle_hitcount={{{1,8},{20,8}}},
		},
		
	yuenan4hao={ --Խ��4�ż��ܣ���ɫѪ������25%˲�䣬����2000�ڹ��˺���100�յ��˺�������10��
		autorescueskill={{{1,1324*256 + 1},{20,1324*256 + 20}},{{1,-1},{20,-1}},{{1,10*18*256 + 100},{20,10*18*256 + 100}}},
			skill_desc=
			function(level)

				local nMag = floor(Link(level,SKILLS.yuenan4_duzhu.addcoldmagic_v[1]))
				local nPois = floor(Link(level,SKILLS.yuenan4_duzhu.addpoisonmagic_v[1]))
				local nAtk = floor(Link(level,SKILLS.yuenan4_duzhu.addphysicsdamage_v[1]))
				return format("Khi sinh l�c th�p h�n 25%% n�ng cao c�ng k�ch n�i c�ng<color=orange>%d<color>�i�m, \n��c c�ng s�t th��ng<color=orange>%d<color>�i�m, \nn�ng cao ph� �i�m<color=orange>%d<color>�i�m\n", nMag, nPois, nAtk)
			end,
					},
	yuenan4_duzhu={ --����2000�ڹ��˺���100�յ��˺�������10��
		addcoldmagic_v={
			[1]={{1,2000},{20,2000}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
			addfiremagic_v={
			[1]={{1,2000},{20,2000}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
			addlightingmagic_v={
			[1]={{1,2000},{20,2000}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
			addphysicsmagic_v={
			[1]={{1,2000},{20,2000}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
			addpoisonmagic_v={
			[1]={{1,200},{20,200}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
			addphysicsdamage_v={
			[1]={{1,100},{20,100}},
			[2]={{1,18*10},{20,18*10}},
			[3]={},
			},
		},
		
	yuenan5hao={ --Խ��5�ż��ܣ����������У�3%�ļ���ʹ�Լ�Ѫ��+3000������20��
		autoreplyskill={{{1,1326*256 + 1},{20,1326*256 + 20}},{{1,-1},{20,-1}},{{1,20*18*256 + 3},{20,20*18*256 + 3}}},
					},
	yuenan5_duzhu={ --Խ��5�ż��ܾ���Ч����Ѫ��+3000������20��
		lifemax_yan_v={
			[1]={{1,3000},{2,5000},{3,7000},{4,7000}},
			[2]={{1,18*20},{20,18*20}},
			[3]={},
			},
		},
		
		yuenan6hao={ --Խ��6�ż��ܣ��ػ�15%
		enhancehit_rate={{{1,15},{2,17},{3,20},{4,20}},{{1,-1},{20,-1}}},
					},
					
		yuenan8hao={ --Խ��8�ż��ܣ���ֹʹ�ü��ܣ�����5�룬���8�ˡ�
		forbit_attack={{{1,1},{20,1}},{{1,5*18},{2,5.5*18},{3,6*18},{4,6*18}}},
		missle_hitcount={{{1,8},{2,10},{3,12},{4,12}}},
		skill_desc=
			function(level)
				return "L�m cho xung quanh nhi�u nh�t<color=orange>8<color>ng��i kh�ng th� s� d�ng k� n�ng, duy tr�<color=orange>5<color>gi�y, 2 ph�t c� th� s� d�ng 1 l�n\n"
			end,
					},
					
	yuenan9hao={ --Խ��9�ż��ܣ����е���ʱ��1%�ĸ���ʹ����ʧȥ50%Ѫ��
		autoattackskill={{{1,1330*256 + 1},{20,1330*256 + 20}},{{1,-1},{20,-1}},{{1,1*18*256 + 1},{2,1*18*256 + 1.5},{3,1*18*256 + 2},{4,1*18*256 + 2}}},
		skill_desc=
			function(level)
				return "Khi tr�ng ��ch, c�<color=orange>1%<color>t� l� l�m cho ��ch t�n th�t<color=orange>50%<color>l��ng m�u\n"
			end,
					},
	yuenan9_duzhu={ --Խ��9�ż��ܾ���Ч����ʹ����ʧȥ50%Ѫ�����޲�ʧȥ3000Ѫ��
		fatallystrike_p={
			[1]={{1,100},{20,100}},
			[2]={},
			[3]={},
			},
		
		},
		
		yuenan10hao={ --Խ��10�ż��ܣ�������ʱ��3%�ĸ��ʴ��������˺�50%������3��
		autoreplyskill={{{1,1332*256 + 1},{20,1332*256 + 20}},{{1,-1},{20,-1}},{{1,3*18*256 + 3},{2,3*18*256 + 4},{3,3*18*256 + 5},{4,3*18*256 + 5}}},
					},
	yuenan10_duzhu={ --Խ��10�ż��ܾ���Ч��������50%������3��
		meleedamagereturn_p={
			[1]={{1,50},{20,50}},
			[2]={{1,18*3},{20,18*3}},
			[3]={},
			},
		rangedamagereturn_p={
			[1]={{1,50},{20,50}},
			[2]={{1,18*3},{20,18*3}},
			[3]={},
			},
		},
		
}
