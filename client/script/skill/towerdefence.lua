--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end

SKILLS={
	--������
	jingang_fumo={ --��շ�ħ
		physicsenhance_p={{{1,15},{20,55}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,61}}
		},
		addskilldamage2={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,64}}
		},
		addskilldamage3={
			[1]={{1,11},{2,11}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,19},{2,19}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,2},{20,6}}}
	},
	shaolin_gunfa={ --���ֹ���
		addphysicsdamage_p={{{1,25},{20,100}},{{1,-1},{2,-1}},{{1,2},{2,2}}},
		attackratingenhance_p={{{1,35},{20,275}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_daofa={ --���ֵ���
		addphysicsdamage_p={{{1,25},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,5},{20,15,Conic}},{{1,-1},{2,-1}}}
	},
	shaolin_quanfa={ --����ȭ��
		addphysicsdamage_p={{{1,25},{20,415}},{{1,-1},{2,-1}},{{1,9},{2,9}}},
		attackratingenhance_p={{{1,35},{20,275}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,6},{20,45,Conic}},{{1,-1},{2,-1}}}
	},
	xinglong_buyu={ --��������
		physicsenhance_p={{{1,60},{20,445}}},
		seriesdamage_p={{{1,1},{20,10}}},
		deadlystrike_p={{{1,5},{20,20}}},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,150}}
		},
		addskilldamage3={
			[1]={{1,271},{2,271}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,272},{2,272}},
			[3]={{1,1},{20,35}}
		},
		skill_cost_v={{{1,2},{20,10}}}
	},
	longzhao_huzhua={ --��צ��ץ
		physicsenhance_p={{{1,120},{20,1242}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		ignoredefense_p={{{1,9},{20,85},{21,86}}},
		stun_p={{{1,1},{20,5}},{{1,1},{20,5}}},
		deadlystrike_p={{{1,5},{20,40}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		addskilldamage1={
			[1]={{1,318},{2,318}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		addskilldamage2={
			[1]={{1,317},{2,317}},
			[3]={{1,1},{20,110},{25,150},{27,161}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,1},{20,16}}}
	},
	luohan_zhen={ --�޺���
		addphysicsdamage_p={{{1,11},{20,135}},{{1,18},{2,18}},{{1,6},{2,6}}},
		meleedamagereturn_p={{{1,1},{20,45},{21,46},{25,50},{26,50}},{{1,18},{2,18}}},
		rangedamagereturn_p={{{1,1},{20,45},{25,50},{26,50}},{{1,18},{2,18}}},
		adddefense_v={{{1,40},{20,800}},{{1,18},{2,18}}},
	},
	budong_mingwang={ --��������
		attackratingenhance_p={{{1,28},{20,275}},{{1,18*120},{20,18*180}}},
		adddefense_v={{{1,15},{20,250}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,10},{20,40}}}
	},
	shizi_hou={ --ʨ�Ӻ�
		stun_p={{{1,15},{20,65},{21,66}},{{1,5},{20,27},{21,28}}},
		physicsdamage_v={
			[1]={{1,45},{20,140}},
			[3]={{1,45},{20,140}}
		},
		skill_cost_v={{{1,10},{20,60}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
	},
	mohe_wuliang={ --Ħڭ����
		physicsenhance_p={{{1,52},{20,1000}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		addskilldamage1={
			[1]={{1,321},{2,321}},
			[3]={{1,1},{20,92/2}}
		},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		missle_speed_v={{{1,28},{20,40}}},
		skill_attackradius={{{1,1200},{20,1200}}},
		skill_cost_v={{{1,15},{20,35}}}
	},
	hengsao_liuhe={ --��ɨ����
		physicsenhance_p={{{1,71},{20,417}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		attackrating_p={{{1,12},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,56}},
			[3]={{1,10},{20,56}}
		},
		deadlystrike_p={{{1,10},{20,30}}},
		addskilldamage1={
			[1]={{1,319},{2,319}},
			[3]={{1,1},{20,96/2}}
		},
		skill_attackradius={{{1,96},{20,96}}},
		skill_cost_v={{{1,8},{20,8}}}
	},
	yijin_jing={ --�׽
		allres_p={{{1,1},{20,20}},{{1,-1},{2,-1}}}
	},
	rulai_qianye={ --����ǧҶ
		addphysicsdamage_p={{{1,65},{30,215}},{{1,18*120},{30,18*360}},{{1,6},{2,6}}},
		lifemax_p={{{1,3},{30,100}},{{1,18*120},{30,18*360}}},
		addcolddamage_v={{{1,10},{30,215}},{{1,18*120},{30,18*360}}},
		deadlystrikeenhance_p={{{1,5},{30,15}},{{1,18*120},{30,18*360}}},
		attackspeed_v={{{1,35},{30,65},{35,70},{36,82},{37,96},{38,98},{39,100},{40,101},{41,102},{42,103},{43,104},{44,105},{45,106},{46,107},{47,108}},{{1,18*120},{30,18*360}}},
		skill_cost_v={{{1,15},{30,45}}}
	},
	damo_dujiang={ --��Ħ�ɽ�
		physicsenhance_p={{{1,55},{15,345},{20,615}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		ignoredefense_p={{{1,9},{20,90},{21,94},{22,98},{23,99},{24,99},}},
		skill_cost_v={{{1,15},{20,35}}},
		colddamage_v={
			[1]={{1,10},{20,155}},
			[3]={{1,10},{20,155}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		addskillexp1={{{1,318},{2,318}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6312,1.15,1,2,1)},
							{2,SkillExpFunc(6312,1.15,2,2,1)},
							{3,SkillExpFunc(6312,1.16,3,2,1)},
							{4,SkillExpFunc(6312,1.17,4,2,1)},
							{5,SkillExpFunc(6312,1.18,5,2,1)},
							{6,SkillExpFunc(6312,1.19,6,2,1)},
							{7,SkillExpFunc(6312,1.20,7,2,1)},
							{8,SkillExpFunc(6312,1.21,8,2,1)},
							{9,SkillExpFunc(6312,1.22,9,2,1)},
							{10,SkillExpFunc(6312,1.23,10,2,1)},
							{11,SkillExpFunc(6312,1.24,11,2,1)},
							{12,SkillExpFunc(6312,1.23,12,2,1)},
							{13,SkillExpFunc(6312,1.22,13,2,1)},
							{14,SkillExpFunc(6312,1.21,14,2,1)},
							{15,SkillExpFunc(6312,1.20,15,2,1)},
							{16,SkillExpFunc(6312,1.19,16,2,1)},
							{17,SkillExpFunc(6312,1.18,17,2,1)},
							{18,SkillExpFunc(6312,1.17,18,2,1)},
							{19,SkillExpFunc(6312,1.16,19,2,1)},
							{20,SkillExpFunc(6312,1.15,20,2,1)},
							}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
	},
	hengsao_qianjun={ --��ɨǧ��
		physicsenhance_p={{{1,10},{15,150},{20,353}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		skill_cost_v={{{1,15},{20,20}}},
		attackrating_p={{{1,45},{20,412}}},
		deadlystrike_p={{{1,10},{20,30}}},
		colddamage_v={
			[1]={{1,10},{20,114}},
			[3]={{1,10},{20,114}}
		},
		skill_attackradius={{{1,128},{20,128}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5070,1.15,1,3,1)},
							{2,SkillExpFunc(5070,1.15,2,3,1)},
							{3,SkillExpFunc(5070,1.16,3,3,1)},
							{4,SkillExpFunc(5070,1.17,4,3,1)},
							{5,SkillExpFunc(5070,1.18,5,3,1)},
							{6,SkillExpFunc(5070,1.19,6,3,1)},
							{7,SkillExpFunc(5070,1.20,7,3,1)},
							{8,SkillExpFunc(5070,1.21,8,3,1)},
							{9,SkillExpFunc(5070,1.22,9,3,1)},
							{10,SkillExpFunc(5070,1.23,10,3,1)},
							{11,SkillExpFunc(5070,1.24,11,3,1)},
							{12,SkillExpFunc(5070,1.23,12,3,1)},
							{13,SkillExpFunc(5070,1.22,13,3,1)},
							{14,SkillExpFunc(5070,1.21,14,3,1)},
							{15,SkillExpFunc(5070,1.20,15,3,1)},
							{16,SkillExpFunc(5070,1.21,16,3,1)},
							{17,SkillExpFunc(5070,1.18,17,3,1)},
							{18,SkillExpFunc(5070,1.17,18,3,1)},
							{19,SkillExpFunc(5070,1.16,19,3,1)},
							{20,SkillExpFunc(5070,1.15,20,3,1)},
							}},
	},
	wuxiang_zhan={ --����ն
		physicsenhance_p={{{1,45},{15,150},{20,333}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		colddamage_v={
			[1]={{1,10},{20,111}},
			[3]={{1,10},{20,111}}
		},
		skill_cost_v={{{1,15},{20,45}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5700,1.15,1,2,1)},
							{2,SkillExpFunc(5700,1.15,2,2,1)},
							{3,SkillExpFunc(5700,1.16,3,2,1)},
							{4,SkillExpFunc(5700,1.17,4,2,1)},
							{5,SkillExpFunc(5700,1.18,5,2,1)},
							{6,SkillExpFunc(5700,1.19,6,2,1)},
							{7,SkillExpFunc(5700,1.20,7,2,1)},
							{8,SkillExpFunc(5700,1.21,8,2,1)},
							{9,SkillExpFunc(5700,1.22,9,2,1)},
							{10,SkillExpFunc(5700,1.23,10,2,1)},
							{11,SkillExpFunc(5700,1.24,11,2,1)},
							{12,SkillExpFunc(5700,1.23,12,2,1)},
							{13,SkillExpFunc(5700,1.22,13,2,1)},
							{14,SkillExpFunc(5700,1.21,14,2,1)},
							{15,SkillExpFunc(5700,1.20,15,2,1)},
							{16,SkillExpFunc(5700,1.19,16,2,1)},
							{17,SkillExpFunc(5700,1.18,17,2,1)},
							{18,SkillExpFunc(5700,1.17,18,2,1)},
							{19,SkillExpFunc(5700,1.16,19,2,1)},
							{20,SkillExpFunc(5700,1.15,20,2,1)},
							}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
	},
	dachengrulaizhou={ --���������
		poisondamagereturn_p={{{1,5},{15,40},{20,45},{21,45}},{{1,-1},{2,-1}}},
		returnskill_p={{{1,5},{15,50},{20,56},{21,57}},{{1,-1},{2,-1}}},
		autoreplyskill={{{1,20 * 256 + 1},{20,20 * 256 + 20},{21,20*256 + 21}},{{1,-1},{2,-1}},{{1,10*18*256 + 1},{19,4*18*256 + 3},{20,5*18*256 + 3},{21,5*18*256 + 3}}},
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

