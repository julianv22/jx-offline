--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range


SKILLS={
	
	mohe_wuliang={ --Ħڭ����
		--�չ��˺���#d1-��#d3-��
		physicsenhance_p={{{1,52},{20,372}}},
		--������ˣ�#d1-%
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		--�����˺���#d1-��#d3-��
		colddamage_v={
			[1]={{1,56},{20,56}},
			[3]={{1,112},{20,112}}
		},
		--�ӵ������ٶ�
		missle_speed_v={{{1,32},{20,32}}},
		--�����ͷŷ�Χ
		skill_attackradius={{{1,700},{20,700}}},
		--ʩ������[SkillCostType]��skills���У����͵�ֵ
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	jiugong_feixing={ --�Ź�����
		--������ˣ�#d1-%
		seriesdamage_p={{{1,50},{15,50},{20,50},{21,50}}},
		--�չ��˺���#d1-��#d3-��
		physicsenhance_p={{{1,10},{15,100},{20,294}}},
		--��������һ���ʣ�#d1-%
		deadlystrike_p={{{1,50},{20,50}}},
		--�⹦ϵ�����˺���#d1+��/��
		poisondamage_v={{{1,1},{20,30}},{{1,60},{20,60}},{{1,10},{20,10}}},
		--�ӵ������ٶ�
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		--�����ͷŷ�Χ
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	tiangang_disha={ --���ɷ
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		poisondamage_v={{{1,50},{20,135}},{{1,60},{20,60}},{{1,10},{20,10}}},
		--�ӵ������ٶ�
		missle_speed_v={{{1,16},{20,16}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bumie_bujue={ --���𲻾�
		physicsenhance_p={{{1,80},{20,385}}},
		seriesdamage_p={{{1,50},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,282}},
			[3]={{1,10},{20,282}}
		},
		deadlystrike_p={{{1,80},{20,80}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bihai_chaosheng={ --�̺�����
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		physicsdamage_v={
			[1]={{1,20},{20,200}},
			[3]={{1,20},{20,200}},
		},
		colddamage_v={
			[1]={{1,43},{20,704}},
			[3]={{1,43},{20,1214}}
		},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bangda_egou={ --�����
		physicsenhance_p={{{1,10},{20,179}}},
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		firedamage_v={
			[1]={{1,70},{20,360}},
			[3]={{1,70},{20,420}}
		},
		missle_speed_v={{{1,32},{20,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	liehuo_qingtian={ --�һ�����
		seriesdamage_p={{{1,50},{20,50}}},
		physicsenhance_p={{{1,15},{20,75}}},
		firedamage_v={
			[1]={{1,8},{20,150}},
			[3]={{1,8},{20,150}}
		},
		missle_speed_v={{{1,32},{20,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	

	wuwo_wujian={ --�����޽�
		lightingdamage_v={
			[1]={{1,1},{20,5}},
			[3]={{1,5},{20,752}}
		},
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		--�����»���ּ��ʣ�#d1-%
		stun_p={{{1,20},{20,20}},{{1,10},{20,10},{21,10}}},
		--ͬʱ����#d1-���ӵ���
		skill_misslenum_v={{{1,64},{20,64},{21,64}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,700},{20,700},{21,700}}},
		skill_cost_v={{{1,70},{20,130}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	wulei_zhengfa={ --��������
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		lightingdamage_v={
			[1]={{1,25},{20,937}},
			[3]={{1,25},{20,937}}
		},
		--�ӵ������ٶ�
		missle_speed_v={{{1,16},{20,16}}},
		skill_attackradius={{{1,700},{20,700},{21,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
		qingxing_zhen={ --������
		attackratingenhance_p={{{1,24},{20,500}},{{1,18},{2,18}}},
		adddefense_v={{{1,97},{20,800}},{{1,18},{20,18}}},
		anti_block_rate={{{1,1},{20,100}},{{1,-1},{2,-1}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,-1},{20,-1}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,-1},{20,-1}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --���ԶԷ�ȫ��
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --�����˺�
		allres_yan_p={{{1,10},{20,60},{40,70},{40,70}},{{1,18},{2,18}}}, --���п�������
		sorbdamage_yan_p={{{1,200},{20,200},{40,250},{41,250}},{{1,-1},{20,-1}}},--�����˺� 
	},
		luohan_zhen={ --�޺���
		addphysicsdamage_p={{{1,11},{20,135}},{{1,18},{2,18}},{{1,6},{2,6}}},
		meleedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		rangedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		adddefense_v={{{1,40},{20,800}},{{1,18},{2,18}}},
		anti_block_rate={{{1,1},{30,100},{31,100}},{{1,-1},{2,-1}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,-1},{20,-1}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,-1},{20,-1}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --���ԶԷ�ȫ��
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --�����˺�
		allres_yan_p={{{1,10},{20,60},{40,70},{40,70}},{{1,18},{2,18}}}, --���п�������
		sorbdamage_yan_p={{{1,200},{20,200},{40,250},{41,250}},{{1,-1},{20,-1}}},--�����˺� 
		attackratingenhance_p={{{1,1000},{20,1000}},{{1,18},{2,18}}},--������
	},
		liushui={--��ˮ
		fastwalkrun_p={{{1,5},{20,33}},{{1,18},{2,18}}},--����һ���ƶ��ٶ�
		anti_block_rate={{{1,1},{20,100}},{{1,18},{2,18}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,18},{2,18}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,18},{2,18}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --���ԶԷ�ȫ��
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --�����˺�
		allres_yan_p={{{1,10},{20,70},{40,75},{41,75}},{{1,18},{2,18}}}, --���п�������
		sorbdamage_yan_p={{{1,200},{20,200},{40,400},{41,400}},{{1,18},{2,18}}},--�����˺� 
		attackratingenhance_p={{{1,1000},{20,1000}},{{1,18},{2,18}}},--������
		enhancehiteffect_rate={{{1,1},{20,50},{21,50}},{{1,18},{2,18}}},--�ػ�Ч��
	},
		bangda_egou1={ --�����
		physicsdamage_v={
			[1]={{1,200},{20,500000*10}},--�չ��˺�������500000%
			[3]={{1,200},{20,500000*10}},
		},
		firedamage_v={
			[1]={{1,43},{20,5000000*10}},--�����˺�������5000000-5000000
			[3]={{1,43},{20,5000000*10}}
		},
		seriesdamage_p={{{1,50},{20,100},{21,100}}},
		deadlystrike_p={{{1,200},{20,200}}},
		--anti_block_rate={{{1,1},{30,200},{31,200}},{{1,-1},{2,-1}}},
		missle_speed_v={{{1,50},{20,50}}},
		skill_attackradius={{{1,900},{20,900}}},
		skill_cost_v={{{1,0},{20,0}}},
		--������ȴʱ��
		skill_mintimepercast_v={{{1,18*30},{20,18*30}}},
		skill_mintimepercastonhorse_v={{{1,18*30},{20,18*30}}},
	},
		yuan_run={ --Բ��
		block_rate=
		{
		[1]={{1,-30},{2,-40},{3,-50}},
		[2]={{1,-1},{10,-1}},
		}
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
