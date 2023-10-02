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

--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	chunniu=
	{ --��ţר�ñ�ɱ��
		seriesdamage_p=
		{
			{{1,5},{20,30}}
		},
		physicsenhance_p=
		{
			{{1,15},{20,75}}
		},
		firedamage_v=
		{
			[1]={{1,100},{20,25000*1000}},
			[3]={{1,100},{20,25000*1000}}
		},
		poisondamage_v=
		{
			[1]={{1,20},{20,1600*1000}},
			[2]={{1,50},{20,1000*1000}},
			[3]={{1,10},{20,20}}
		},
		physicsdamage_v=
		{
			[1]={{1,100},{20,25000*1000}},
			[3]={{1,100},{20,25000*1000}}
		},
		colddamage_v=
		{
			[1]={{1,100},{20,25000*1000}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,25000*1000}}
		},
		lightingdamage_v=
		{
			[1]={{1,100},{20,25000*1000}},
			[3]={{1,100},{20,25000*1000}}
		},
		anti_block_rate={
				[1]={{1,300},{2,300}},
				[2]={{1,-1},{2,-1}},
				[3]={},
		},
		anti_allres_yan_p={
				[1]={{1,300},{2,300}},
				[2]={{1,-1},{2,-1}},
				[3]={},
		},
		enhancehit_rate={
				[1]={{1,300},{2,300}},
				[2]={{1,-1},{2,-1}},
				[3]={},
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	chunniuzidan=
	{ --��ţר�ñ�ɱ���Ӽ���
		seriesdamage_p=
		{
			{{1,5},{20,30}}
		},
		physicsenhance_p=
		{
			{{1,15},{20,75}}
		},
		firedamage_v=
		{
			[1]={{1,100},{20,7500}},
			[3]={{1,100},{20,7500}}
		},
		poisondamage_v=
		{
			[1]={{1,20},{20,800}},
			[2]={{1,50},{20,500}},
			[3]={{1,10},{20,20}}
		},
		physicsdamage_v=
		{
			[1]={{1,100},{20,7500}},
			[3]={{1,100},{20,7500}}
		},
		colddamage_v=
		{
			[1]={{1,100},{20,7500}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,7500}}
		},
		lightingdamage_v=
		{
			[1]={{1,100},{20,7500}},
			[3]={{1,100},{20,7500}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	tianchi=
	{ --����ؾ���ɱ��
		fatallystrike_p={{{1,70},{20,70}}},
		lifereplenish_v={{{1,-250},{20,-250}},{{1,18*1},{20,18*1}}},
		manareplenish_v={{{1,-1000},{20,-1000}},{{1,18*1},{20,18*1}}},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	tianchijiguan=
	{ --����ؾ����ؼ���
		fatallystrike_p={{{1,100},{20,100}}},
		lifereplenish_v={{{1,-2500},{20,-2500}},{{1,18*1},{20,18*1}}},
		manareplenish_v={{{1,-2500},{20,-2500}},{{1,18*1},{20,18*1}}},
		firedamage_v=
		{
			[1]={{1,500},{20,500}},
			[3]={{1,500},{20,500}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	tianchiboss=
	{ --���BOSS
		seriesdamage_p=
		{
			{{1,5},{20,30}}
		},
		physicsenhance_p=
		{
			{{1,15},{20,75}}
		},
		firedamage_v=
		{
			[1]={{1,100},{20,5000}},
			[3]={{1,100},{20,5000}}
		},
		poisondamage_v=
		{
			[1]={{1,20},{20,300}},
			[2]={{1,50},{20,300}},
			[3]={{1,10},{20,20}}
		},
		physicsdamage_v=
		{
			[1]={{1,100},{20,5000}},
			[3]={{1,100},{20,5000}}
		},
		colddamage_v=
		{
			[1]={{1,100},{20,5000}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,5000}}
		},
		lightingdamage_v=
		{
			[1]={{1,100},{20,5000}},
			[3]={{1,100},{20,5000}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	tianchibosszidan=
	{ --���BOSS�Ӽ���
		seriesdamage_p=
		{
			{{1,5},{20,30}}
		},
		physicsenhance_p=
		{
			{{1,15},{20,75}}
		},
		firedamage_v=
		{
			[1]={{1,100},{20,2500}},
			[3]={{1,100},{20,2500}}
		},
		poisondamage_v=
		{
			[1]={{1,20},{20,200}},
			[2]={{1,50},{20,100}},
			[3]={{1,10},{20,20}}
		},
		physicsdamage_v=
		{
			[1]={{1,100},{20,2500}},
			[3]={{1,100},{20,2500}}
		},
		colddamage_v=
		{
			[1]={{1,100},{20,2500}},
			[2]={{1,1},{20,18}},
			[3]={{1,100},{20,2500}}
		},
		lightingdamage_v=
		{
			[1]={{1,100},{20,2500}},
			[3]={{1,100},{20,2500}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	niumowang={ --ţħ���⻷
		lifemax_v={{{1,50000*100},{20,500000*100}},{{1,18},{2,18}}},
		lifereplenish_v={{{1,300*100},{20,1000*100}},{{1,18},{2,18}}},
		manareplenish_v={{{1,300*100},{20,1000*100}},{{1,18},{2,18}}},
		fasthitrecover_v={{{1,90},{20,100},{31,200},{32,200}},{{1,18},{2,18}}},
		fatallystrikeres_p={{{1,90},{20,100}},{{1,18},{2,18}}},
		freezetimereduce_p={{{1,90},{20,100}},{{1,18},{2,18}}},
		poisontimereduce_p={{{1,90},{20,100}},{{1,18},{2,18}}},
		stuntimereduce_p={{{1,90},{20,100}},{{1,18},{2,18}}},
		addphysicsmagic_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		addphysicsdamage_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		allres_p={{{1,50},{20,100*10}},{{1,18},{2,18}}},
		allresmax_p={{{1,5},{20,10},{21,10}},{{1,18},{2,18}}},
	},
	mengniu={ --��ţ�⻷
		lifemax_v={{{1,35000},{20,350000}},{{1,18},{2,18}}},
		lifereplenish_v={{{1,250},{20,600}},{{1,18},{2,18}}},
		manareplenish_v={{{1,250},{20,600}},{{1,18},{2,18}}},
		fasthitrecover_v={{{1,85},{20,100},{31,200},{32,200}},{{1,18},{2,18}}},
		fatallystrikeres_p={{{1,85},{20,100}},{{1,18},{2,18}}},
		freezetimereduce_p={{{1,85},{20,100}},{{1,18},{2,18}}},
		poisontimereduce_p={{{1,85},{20,100}},{{1,18},{2,18}}},
		stuntimereduce_p={{{1,85},{20,100}},{{1,18},{2,18}}},
		addphysicsmagic_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		addphysicsdamage_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		allres_p={{{1,40},{20,70}},{{1,18},{2,18}}},
		allresmax_p={{{1,3},{20,8},{21,8}},{{1,18},{2,18}}},
	},
		cainiu={ --��ţ�⻷
		lifemax_v={{{1,10000},{20,100000}},{{1,18},{2,18}}},
		lifereplenish_v={{{1,200},{20,450}},{{1,18},{2,18}}},
		manareplenish_v={{{1,200},{20,450}},{{1,18},{2,18}}},
		fasthitrecover_v={{{1,75},{20,100},{31,200},{32,200}},{{1,18},{2,18}}},
		fatallystrikeres_p={{{1,75},{20,100}},{{1,18},{2,18}}},
		freezetimereduce_p={{{1,75},{20,100}},{{1,18},{2,18}}},
		poisontimereduce_p={{{1,75},{20,100}},{{1,18},{2,18}}},
		stuntimereduce_p={{{1,75},{20,100}},{{1,18},{2,18}}},
		addphysicsmagic_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		addphysicsdamage_v={{{1,100},{20,1000}},{{1,18},{2,18}}},
		allres_p={{{1,30},{20,55}},{{1,18},{2,18}}},
		allresmax_p={{{1,1},{20,5},{21,5}},{{1,18},{2,18}}},
	},
}
function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function GetSkillLevelData(levelname, data, level)
	return GetSkillLevelDataByTable(levelname, data, level)
end;


function GetSkillLevelDataByTable(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(%SKILLS[data]==nil) then
		return ""
	end
	if(%SKILLS[data][levelname]==nil) then
		return ""
	end
	if(%SKILLS[data][levelname][1]==nil) then
		%SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(%SKILLS[data][levelname][2]==nil) then
		%SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(%SKILLS[data][levelname][3]==nil) then
		%SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,%SKILLS[data][levelname][1]))
	p2=floor(Link(level,%SKILLS[data][levelname][2]))
	p3=floor(Link(level,%SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;
