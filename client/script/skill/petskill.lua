
--迭代函数,用于计算技能熟练度
--具体方法：
--根据1级熟练度,升级加速度,级数,重复伤害次数,范围,计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--宠物技能
	pu_su={ --朴素
		sorbdamage_yan_p=
		{
		[1]={{1,10},{2,15},{3,20},{4,25},{5,30},{15,80},{16,83},{20,95}},
		[2]={{1,-1},{5,-1}},
		}
	},
	ying_yong={ --英勇
		anti_sorbdamage_yan_p=
		{
		[1]={{1,10},{2,15},{3,20},{4,25},{5,30},{15,80},{16,83},{20,95}},
		[2]={{1,-1},{5,-1}},
		}
	},
	qiang_gong={ --强攻
		skill_enhance=
		{
		[1]={{1,20},{2,40},{3,60},{4,80},{5,100},{15,300},{16,310},{20,350}},
		[2]={{1,-1},{5,-1}},
		}
	},
	jing_zhun={ --精准
		do_hurt_p=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20},{15,30},{16,31},{20,35}},
		[2]={{1,-1},{10,-1}},
		}
	},
	gang_ying={ --刚硬
		anti_do_hurt_p=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20},{15,30},{16,31},{20,35}},
		[2]={{1,-1},{10,-1}},
		}
	},
	chuan_ci={ --穿刺
		anti_hitrecover=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20},{15,30},{16,31},{20,35}},
		[2]={{1,-1},{10,-1}},
		}
	},
	zhi_mi={ --致密
		fasthitrecover_yan_v=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20},{15,30},{16,31},{20,35}},
		[2]={{1,-1},{10,-1}},
		}
	},
	yuan_run={ --圆润
		block_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10},{15,15},{16,16},{20,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	jian_qiang={ --坚强
		anti_block_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10},{15,15},{16,16},{20,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	duan_lie={ --断裂
		enhancehit_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10},{15,15},{16,16},{20,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	wen_gu={ --稳固
		anti_enhancehit_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10},{15,15},{16,16},{20,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	shan_guang={ --闪光
		lifemax_yan_v=
		{
		[1]={{1,1000},{2,1400},{3,1800},{4,2200},{5,2600},{10,4600},{15,6600},{16,6800},{20,8400}},
		[2]={{1,-1},{10,-1}},
		}
	},
	fu_guang={ --辐光
		manamax_yan_v=
		{
		[1]={{1,700},{2,900},{3,1100},{4,1300},{5,1500},{10,2500},{15,3500},{16,3700},{20,4500}},
		[2]={{1,-1},{10,-1}},
		}
	},
	jian_ren={ --坚韧
		physicsres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50},{15,75},{16,80},{20,100}},
		[2]={{1,-1},{10,-1}},
		}
	},
	gao_neng={ --高能
		fireres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50},{15,75},{16,80},{20,100}},
		[2]={{1,-1},{10,-1}},
		}
	},
	qing_ying={ --轻盈
		coldres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50},{15,75},{16,80},{20,100}},
		[2]={{1,-1},{10,-1}},
		}
	},
	fu_shu={ --复苏
		poisonres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50},{15,75},{16,80},{20,100}},
		[2]={{1,-1},{10,-1}},
		}
	},
	chun_jing={ --纯净
		lightingres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50},{15,75},{16,80},{20,100}},
		[2]={{1,-1},{10,-1}},
		}
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点,求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此,如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点,求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此,如果已知两点(x1,y1),(x2,y2)可求得过此2点的
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
--根据2个点,求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此,如果已知两点(x1,y1),(x2,y2)可求得过此2点的
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
--根据points提供的一系列点,用相邻的两个点描绘曲线
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
--			[1]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[2]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[3]={{级别,数值,曲线},{级别,数值,曲线},。。。。},	
--		},
--		魔法属性=	{
--			[1]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[2]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[3]={{级别,数值,曲线},{级别,数值,曲线},。。。。},	
--		},
--		。。。。。
--	},
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[2]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[3]={{级别,数值,曲线},{级别,数值,曲线},。。。。},	
--		},
--		魔法属性=	{
--			[1]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[2]={{级别,数值,曲线},{级别,数值,曲线},。。。。},
--			[3]={{级别,数值,曲线},{级别,数值,曲线},。。。。},	
--		},
--		。。。。。
--	},
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1,1级时为35,20级时为335,曲线不填,默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3],表示魔法属性physicsenhance_p参数2,默认为任何时候都是0
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
--return：当技能名称为data,技能等级为level
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
		SKILLS[data][levelname][1]={{0,0},{5,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{5,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{5,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
