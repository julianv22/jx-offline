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
	jueshax=
	{ --��ɱx��ɱ��
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
			[1]={{1,50},{20,50}},
			[3]={{1,50},{20,50}}
		},
		poisondamage_v=
		{
			[1]={{1,20},{20,50}},
			[2]={{1,50},{20,50}},
			[3]={{1,10},{20,20}}
		},
		physicsdamage_v=
		{
			[1]={{1,50},{20,50}},
			[3]={{1,50},{20,50}}
		},
		colddamage_v=
		{
			[1]={{1,50},{20,50}},
			[2]={{1,1},{20,18}},
			[3]={{1,50},{20,50}}
		},
		lightingdamage_v=
		{
			[1]={{1,50},{20,50}},
			[3]={{1,50},{20,50}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
	},
	jueshax_zi=
	{ --��ɱx��ɱ���Ӽ���
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
			[1]={{1,10},{20,10}},
			[3]={{1,10},{20,10}}
		},
		poisondamage_v=
		{
			[1]={{1,10},{20,10}},
			[2]={{1,10},{20,10}},
			[3]={{1,10},{20,10}}
		},
		physicsdamage_v=
		{
			[1]={{1,10},{20,10}},
			[3]={{1,10},{20,10}}
		},
		colddamage_v=
		{
			[1]={{1,10},{20,10}},
			[2]={{1,1},{20,18}},
			[3]={{1,10},{20,10}}
		},
		lightingdamage_v=
		{
			[1]={{1,10},{20,10}},
			[3]={{1,10},{20,10}}
		},
		skill_cost_v=
		{
			{{1,0},{20,0}}
		}
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
