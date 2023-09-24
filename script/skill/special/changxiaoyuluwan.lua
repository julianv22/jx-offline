--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	---������
	zhanlong_jue={ --ն����
		physicsenhance_p={{{1,80},{20,185}}},
		ignoredefense_p={{{1,5},{20,20}}},
		seriesdamage_p={{{1,1},{20,10}}},
		colddamage_v={
			[1]={{1,1},{20,25}},
			[3]={{1,2},{20,50}}
		},
		deadlystrike_p={{{1,6},{20,10}}},
		addskilldamage1={
			[1]={{1,325},{2,325}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage2={
			[1]={{1,408},{2,408}},
			[3]={{1,1},{20,50}}
		},
		addskilldamage3={
			[1]={{1,324},{2,324}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,407},{2,407}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,2},{20,6}}}
	},
	tianwang_qiangfa={ --����ǹ��
		addphysicsdamage_p={{{1,25},{20,315}},{{1,-1},{2,-1}},{{1,3},{2,3}}},
		attackratingenhance_p={{{1,75},{20,270}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,2},{20,15}},{{1,-1},{2,-1}}}
	},
	tianwang_daofa={ --��������
		addphysicsdamage_p={{{1,50},{20,300}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		attackratingenhance_p={{{1,15},{20,72}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,2},{20,15}},{{1,-1},{2,-1}}}
	},
	tianwang_chuifa={ --��������
		addphysicsdamage_p={{{1,25},{20,275}},{{1,-1},{2,-1}},{{1,4},{2,4}}},
		attackratingenhance_p={{{1,15},{20,72}},{{1,-1},{2,-1}}},
		deadlystrikeenhance_p={{{1,2},{20,15}},{{1,-1},{2,-1}}}
	},
	huifeng_luoyan={ --�ط�����
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,80},{20,215}}},
		attackrating_p={{{1,10},{20,147}}},
		addskilldamage1={
			[1]={{1,323},{2,323}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,327},{2,327}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage3={
			[1]={{1,41},{2,41}},
			[3]={{1,1},{20,15}}
		},
		addskilldamage4={
			[1]={{1,225},{2,225}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,4},{20,10}}}
	},
	xingyun_jue={ --���ƾ�
		physicsenhance_p={{{1,30},{20,255}}},
		ignoredefense_p={{{1,10},{20,35}}},
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,5},{20,50}},
			[3]={{1,100},{20,100}}
		},
		deadlystrike_p={{{1,8},{20,20}}},
		addskilldamage1={
			[1]={{1,325},{2,325}},
			[3]={{1,1},{20,55},{25,95},{29,116}}
		},
		addskilldamage2={
			[1]={{1,408},{2,408}},
			[3]={{1,1},{20,55},{25,95},{29,116}}
		},
		missle_speed_v={{{1,22},{20,22}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,66},{20,66}}},
		skill_cost_v={{{1,3},{20,7}}}
	},
	wuxin_zhan={ --����ն
		physicsenhance_p={{{1,65},{20,453}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		deadlystrike_p={{{1,4},{20,25}}},
		addskilldamage1={
			[1]={{1,322},{2,322}},
			[3]={{1,1},{20,80}}
		},
		addskilldamage2={
			[1]={{1,326},{2,326}},
			[3]={{1,1},{20,80}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,10},{20,20}}}
	},
	jiumingwan={ --������
		lifereplenish_v={{{1,15},{2,15}},{{1,18*1800},{20,18*1800}}},
		manareplenish_v={{{1,15},{2,15}},{{1,18*1800},{20,18*1800}}}
		
	},
	jiugongwan={ --�ù���
		lifereplenish_v={{{1,30},{2,30}},{{1,18*1800},{20,18*1800}}},
		manareplenish_v={{{1,30},{2,30}},{{1,18*1800},{20,18*1800}}}
		
	},
	yuluwan={ --��¶��
		lifereplenish_v={{{1,60},{2,60}},{{1,18*1800},{20,18*1800}}},
		manareplenish_v={{{1,60},{2,60}},{{1,18*1800},{20,18*1800}}}
		
	},
	jinglei_zhan={ --����ն
		physicsenhance_p={{{1,40},{20,200}}},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,322},{2,322}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,326},{2,326}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage3={
			[1]={{1,32},{2,32}},
			[3]={{1,1},{20,35}}
		},
		addskilldamage4={
			[1]={{1,220},{2,220}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,18},{20,18}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,54},{20,54}}},
		skill_cost_v={{{1,5},{20,10}}}
	},
	yangguan_sandie={ --��������
		physicsenhance_p={{{1,130},{20,375}}},
		seriesdamage_p={{{1,5},{20,30}}},
		attackrating_p={{{1,10},{20,180}}},
		addskilldamage1={
			[1]={{1,323},{2,323}},
			[3]={{1,1},{20,65},{25,105},{29,118}}
		},
		addskilldamage2={
			[1]={{1,327},{2,327}},
			[3]={{1,1},{20,65},{25,105},{29,118}}
		},
		missle_speed_v={{{1,22},{20,22}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,66},{20,66}}},
		skill_cost_v={{{1,9},{20,16}}}
	},
	tianwang_zhanyi={ --����ս��
		lifemax_p={{{1,21},{30,185}},{{1,-1},{30,-1}}},
		lifemax_yan_p={{{1,21},{35,160},{36,160}},{{1,-1},{30,-1}}},
		deadlystrikeenhance_p={{{1,5},{30,45}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,5},{30,65}},{{1,-1},{30,-1}}},
		skill_cost_v={{{1,10},{30,50}}}
	},
	pofeng_zhan={ --�÷�ն
		physicsenhance_p={{{1,120},{20,275}}},
		seriesdamage_p={{{1,5},{20,30}}},
		addskilldamage1={
			[1]={{1,322},{2,322}},
			[3]={{1,1},{20,70},{25,110},{27,117}}
		},
		addskilldamage2={
			[1]={{1,326},{2,326}},
			[3]={{1,1},{20,70},{25,110},{27,117}}
		},
		missle_speed_v={{{1,22},{20,22}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,66},{20,66}}},
		skill_cost_v={{{1,8},{20,12}}}
	},
	duanhun_ci={ --�ϻ��
		physicsenhance_p={{{1,25},{20,215}}},
		seriesdamage_p={{{1,1},{20,50}}},
		stun_p={{{1,16},{20,35}},{{1,5},{20,18}}},
		skill_param1_v={{{1,4},{5,12},{20,24},{28,31},{31,31}}},
		skill_param2_v={{{1,18},{20,1},{21,1}}},
		deadlystrike_p={{{1,4},{20,80}}},
		missle_speed_v={{{1,22},{20,30},{21,32},{22,32}}},
		skill_attackradius={{{1,22*16},{20,30*16},{21,30*16}}},
		skill_cost_v={{{1,10},{20,20}}}
	},
	xuezhan_bafang={ --Ѫս�˷�
		physicsenhance_p={{{1,60},{20,723}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		attackrating_p={{{1,75},{20,320}}},
		deadlystrike_p={{{1,4},{20,25}}},
		addskilldamage1={
			[1]={{1,323},{2,323}},
			[3]={{1,1},{20,70}}
		},
		addskilldamage2={
			[1]={{1,327},{2,327}},
			[3]={{1,1},{20,70}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,11},{20,45}}}
	},
	jinzhong_zhao={ --������
		physicsres_p={{{1,12},{20,50}},{{1,18*120},{20,18*180}}},
		poisonres_p={{{1,12},{20,49}},{{1,18*120},{20,18*180}}},
		coldres_p={{{1,7},{20,45}},{{1,18*120},{20,18*180}}},
		fireres_p={{{1,-5},{20,-15},{21,-15}},{{1,18*120},{20,18*180}}},
		skill_cost_v={{{1,12},{20,40}}}
	},
	chenglong_jue={ --������
		physicsenhance_p={{{1,40},{20,495}}},
		ignoredefense_p={{{1,38},{20,80},{21,82}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		colddamage_v={
			[1]={{1,10},{20,100}},
			[3]={{1,20},{20,200}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		addskilldamage1={
			[1]={{1,325},{2,325}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,408},{2,408}},
			[3]={{1,1},{20,60}}
		},
		missle_speed_v={{{1,26},{20,26}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,78},{20,78}}},
		skill_cost_v={{{1,10},{20,16}}}
	},
	potian_zhan={ --����ն
		physicsenhance_p={{{1,35},{15,150},{20,338}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		deadlystrike_p={{{1,4},{20,25}}},
		attackrating_p={{{1,35},{20,215}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,15},{20,30}}},
		addskillexp1={{{1,322},{2,322}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7280,1.25,1,2.5,1)},
							{2,SkillExpFunc(7280,1.25,2,2.5,1)},
							{3,SkillExpFunc(7280,1.25,3,2.5,1)},
							{4,SkillExpFunc(7280,1.25,4,2.5,1)},
							{5,SkillExpFunc(7280,1.25,5,2.5,1)},
							{6,SkillExpFunc(7280,1.25,6,2.5,1)},
							{7,SkillExpFunc(7280,1.25,7,2.5,1)},
							{8,SkillExpFunc(7280,1.25,8,2.5,1)},
							{9,SkillExpFunc(7280,1.25,9,2.5,1)},
							{10,SkillExpFunc(7280,1.25,10,2.5,1)},
							{11,SkillExpFunc(7280,1.25,11,2.5,1)},
							{12,SkillExpFunc(7280,1.25,12,2.5,1)},
							{13,SkillExpFunc(7280,1.25,13,2.5,1)},
							{14,SkillExpFunc(7280,1.25,14,2.5,1)},
							{15,SkillExpFunc(7280,1.25,15,2.5,1)},
							{16,SkillExpFunc(7280,1.25,16,2.5,1)},
							{17,SkillExpFunc(7280,1.25,17,2.5,1)},
							{18,SkillExpFunc(7280,1.25,18,2.5,1)},
							{19,SkillExpFunc(7280,1.25,19,2.5,1)},
							{20,SkillExpFunc(7280,1.25,20,2.5,1)},
							}},
	},
	zhuixing_zhuyue={ --׷������
		physicsenhance_p={{{1,50},{15,200},{20,381}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		attackrating_p={{{1,95},{20,360}}},
		deadlystrike_p={{{1,4},{20,25}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		skill_cost_v={{{1,10},{20,65}}},
		addskillexp1={{{1,323},{2,323}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6550,1.25,1,5,1)},
							{2,SkillExpFunc(6550,1.25,2,5,1)},
							{3,SkillExpFunc(6550,1.25,3,5,1)},
							{4,SkillExpFunc(6550,1.25,4,5,1)},
							{5,SkillExpFunc(6550,1.25,5,5,1)},
							{6,SkillExpFunc(6550,1.25,6,5,1)},
							{7,SkillExpFunc(6550,1.25,7,5,1)},
							{8,SkillExpFunc(6550,1.25,8,5,1)},
							{9,SkillExpFunc(6550,1.25,9,5,1)},
							{10,SkillExpFunc(6550,1.25,10,5,1)},
							{11,SkillExpFunc(6550,1.25,11,5,1)},
							{12,SkillExpFunc(6550,1.25,12,5,1)},
							{13,SkillExpFunc(6550,1.25,13,5,1)},
							{14,SkillExpFunc(6550,1.25,14,5,1)},
							{15,SkillExpFunc(6550,1.25,15,5,1)},
							{16,SkillExpFunc(6550,1.25,16,5,1)},
							{17,SkillExpFunc(6550,1.25,17,5,1)},
							{18,SkillExpFunc(6550,1.25,18,5,1)},
							{19,SkillExpFunc(6550,1.25,19,5,1)},
							{20,SkillExpFunc(6550,1.25,20,5,1)},
							}},
	},
	zhuifeng_jue={ --׷���
		physicsenhance_p={{{1,25},{15,140},{20,380}}},
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		ignoredefense_p={{{1,12},{20,90},{21,94},{22,98},{23,99},{24,99}}},
		colddamage_v={
			[1]={{1,1},{20,50}},
			[3]={{1,5},{20,250}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		missle_speed_v={{{1,30},{20,30}}},
		missle_lifetime_v={{{1,4},{20,4}}},
		skill_attackradius={{{1,90},{20,90}}},
		addskillexp1={{{1,325},{2,325}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(7750,1.25,1,2.5,1)},
							{2,SkillExpFunc(7750,1.25,2,2.5,1)},
							{3,SkillExpFunc(7750,1.25,3,2.5,1)},
							{4,SkillExpFunc(7750,1.25,4,2.5,1)},
							{5,SkillExpFunc(7750,1.25,5,2.5,1)},
							{6,SkillExpFunc(7750,1.25,6,2.5,1)},
							{7,SkillExpFunc(7750,1.25,7,2.5,1)},
							{8,SkillExpFunc(7750,1.25,8,2.5,1)},
							{9,SkillExpFunc(7750,1.25,9,2.5,1)},
							{10,SkillExpFunc(7750,1.25,10,2.5,1)},
							{11,SkillExpFunc(7750,1.25,11,2.5,1)},
							{12,SkillExpFunc(7750,1.25,12,2.5,1)},
							{13,SkillExpFunc(7750,1.25,13,2.5,1)},
							{14,SkillExpFunc(7750,1.25,14,2.5,1)},
							{15,SkillExpFunc(7750,1.25,15,2.5,1)},
							{16,SkillExpFunc(7750,1.25,16,2.5,1)},
							{17,SkillExpFunc(7750,1.25,17,2.5,1)},
							{18,SkillExpFunc(7750,1.25,18,2.5,1)},
							{19,SkillExpFunc(7750,1.25,19,2.5,1)},
							{20,SkillExpFunc(7750,1.25,20,2.5,1)},
							}},
		skill_cost_v={{{1,10},{20,30}}}
	},
	daoxutian={ --������
		allres_p={{{1,1},{20,10},{21,10}},{{1,-1},{2,-1}}},
		allresmax_p={{{1,1},{20,5},{21,5}},{{1,-1},{2,-1}}},
		lifereplenish_p={{{1,1},{15,30},{20,35},{21,36}},{{1,-1},{2,-1}}},
		ignoreskill_p={{{1,5},{15,79},{20,89},{21,89}},{{1,-1},{2,-1}}},
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

