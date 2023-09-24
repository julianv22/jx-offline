-- ?gm ds LoadClientScript("\\script\\skill\\advancedskill.lua")

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
--���ָ�λbyte����8λ��Line
function LineWith8Byte(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	local y1_l = mod(y1, 256)		-- y1�ĵ�8λ
	local y1_h = floor(y1/256)		-- y1�ĸ�λ
	local y2_l = mod(y2, 256)		-- y2�ĵ�8λ
	local y2_h = floor(y2/256)		-- y2�ĸ�λ
	local y3_l = floor((y2_l-y1_l)*(x-x1)/(x2-x1)+y1_l)
	local y3_h = floor((y2_h-y1_h)*(x-x1)/(x2-x1)+y1_h)
	local y_result = y3_h*256 + y3_l
	return y_result
end

SKILLS=
{
	sl_adskill={ --���ֽ��׼���
		skill_desc=
			function(level)
				return "Khi thi tri�n <color=water>[Minh K�nh V� ��i]<color> t�ng c�ng k�ch t�m g�n v� t�m xa <color=orange>"..floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[1])).." %<color> ph�n s�t th��ng, duy tr� <color=orange>"..floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[2]) / 18).." gi�y<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1230 * 256 + 1,LineWith8Byte},{20,1230 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 5,LineWith8Byte},{30,20*18*256 + 7,LineWith8Byte},{31,20*18*256 + 7,LineWith8Byte}}
		},
		meleedamagereturn_p={{{1,10},{20,50},{30,60},{31,60}},{{1,10*18},{20,15*18},{21,15*18}}},
		rangedamagereturn_p={{{1,10},{20,50},{30,60},{31,60}},{{1,10*18},{20,15*18},{21,15*18}}},
							},
	tw_adskill={ --�������׼���
		skill_desc=
			function(level)
				return "Thi tri�n <color=water>[Du Long Ch�n Kh�]<color> c� <color=orange>"..floor(100 - Link(level,SKILLS.tw_adskill.missle_missrate[1])).." %<color>t� l� mi�n d�ch tr�ng th�i ti�u c�c c�a b�n th�n, duy tr� <color=orange>"..floor(Link(level,SKILLS.tw_adskill.ignorenegativestate_p[2]) / 18).." gi�y<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1231 * 256 + 1,LineWith8Byte},{20,1231 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 10,LineWith8Byte},{20,10*18*256 + 10,LineWith8Byte},{30,10*18*256 + 10,LineWith8Byte},{31,10*18*256 + 10,LineWith8Byte}}
		},
--		autoattackskill=
--		{
--			{{1,738*256 + 1},{20,738*256 + 20}},
--			{{1,10},{20,40}},
--			{{1,10*18*256 + 10},{20,4*18*256 + 50}}
--		},
		missle_missrate={{{1,0},{20,0},{30,0},{31,0}}},
		ignorenegativestate_p=
		{
			{{1,100},{15,100},{20,100},{21,100}},
			{{1,1*18},{20,3*18},{30,4*18},{31,4*18}},
		},
							},
	wu_adskill ={ --�嶾���׼���
		skill_desc=
			function(level)
				return "Tr�ng m�c ti�u c� <color=orange>"..floor(Link(level,SKILLS.wu_adskill.autoattackskill[3]) - 1*18*256).." %<color> t� l� b�c ph�t <color=water>[H�n �nh T�ng Sinh]<color> c�p t��ng �ng\n"..
				"Sau m�i l�n thi tri�n <color=orange>"..floor((Link(level,SKILLS.wu_adskill.autoattackskill[3]) / (18*256))).." gi�y<color> s� kh�ng thi tri�n l�i\n"
			end,
		autoattackskill=
		{
			{{1,1232*256 + 1,LineWith8Byte},{20,1232*256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,1*18*256 + 20,LineWith8Byte},{20,1*18*256 + 80,LineWith8Byte},{30,1*18*256 + 95,LineWith8Byte},{31,1*18*256 + 95,LineWith8Byte}}
		},--���Ӵ�������
							},
	tm_adskill ={ --���Ž��׼���
		skill_desc=
			function(level)
				return "Khi sinh l�c th�p h�n 25% c� x�c su�t <color=orange>"..floor(Link(level,SKILLS.tm_adskill.autorescueskill[3]) - 15*18*256).." %<color> t� l� b�c ph�t 200% H�a gi�i s�t th��ng v� 20% b� qua Ph�ng th� v�t l�\n"..
				"Sau m�i l�n thi tri�n <color=orange>"..floor((Link(level,SKILLS.tm_adskill.autorescueskill[3]) / (18*256))).." gi�y<color> s� kh�ng thi tri�n l�i\n"
			end,	
		block_rate={{{1,200},{2,200}},{{1,18*1},{19,18*1},{20,18*2},{50,18*2}}},
		anti_physicsres_yan_p={{{1,20},{2,20}},{{1,18*1},{19,18*1},{20,18*2},{50,18*2}}},
		autorescueskill=
		{
			{
				{1,1233*256 + 1,LineWith8Byte},{20,1233*256 + 20,LineWith8Byte},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,15*18*256 + 5,LineWith8Byte},
				{20,15*18*256 + 20,LineWith8Byte},
				{30,15*18*256 + 25,LineWith8Byte},
			}
		},
								},
	em_adskill ={ --��ü���׼���
		skill_desc=
			function(level)
				return "Tr�ng m�c ti�u c� <color=orange>"..floor(Link(level,SKILLS.em_adskill.autoattackskill[3]) - 3*18*256).." %<color> t� l� thi tri�n <color=water>[T� H�ng Ph� ��]<color> c�p t��ng �ng\n"..
				"Sau m�i l�n thi tri�n <color=orange>"..floor((Link(level,SKILLS.em_adskill.autoattackskill[3]) / (18*256))).." gi�y<color> s� kh�ng thi tri�n l�i\n"
			end,
		autoattackskill=
		{
			{{1,1234*256 + 1,LineWith8Byte},{20,1234*256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,3*18*256 + 10,LineWith8Byte},{20,3*18*256 + 30,LineWith8Byte},{30,3*18*256 + 35,LineWith8Byte}}
		},
							},
	cy_adskill ={ --���̽��׼���
		skill_desc=
			function(level)
				return "Thi tri�n <color=water>[Dung Tuy�t V� Tung]<color> l�m �n th�n, m�i l�n �n th�n duy tr� <color=orange>"..floor(Link(level,SKILLS.cy_adskill.hide[2]) / 18).." gi�y<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1235 * 256 + 1,LineWith8Byte},{20,1235 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,20*18*256 + 3,LineWith8Byte},{20,10*18*256 + 5,LineWith8Byte},{30,10*18*256 + 7,LineWith8Byte},{31,10*18*256 + 7,LineWith8Byte}}
		},
		hide=
		{
			{{1,2},{20,5},{30,6},{31,6}},
			{{1,2*18},{20,5*18},{30,6*18},{31,6*18}}
		},
								},				
	tr_adskill ={ --���̽��׼���
		autoreplyskill=
		{
			{{1,1236 * 256 + 1,LineWith8Byte},{20,1236 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1,LineWith8Byte},{20,20*18*256 + 3,LineWith8Byte},{30,20*18*256 + 5,LineWith8Byte},{31,20*18*256 + 5,LineWith8Byte}}
		},
								},
	gb_adskill={ --ؤ����׼���
		skill_desc=
			function(level)
				return "Khi thi tri�n <color=water>[Thi�n H�nh Kh� C�ng]<color> c� th� t�ng t� l� b�c ph�t [H�n Thi�n Kh� C�ng] <color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[1])).." %<color>, \n"..
				"v� b� qua h�a ph�ng: <color=orange>"..floor(Link(level,SKILLS.gb_adskill.anti_fireres_yan_p[1])).." %(D��ng)<color>, duy tr� <color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18).." gi�y<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1237 * 256 + 1,LineWith8Byte},{20,1237 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 10,LineWith8Byte},{30,20*18*256 + 13,LineWith8Byte},{31,20*18*256 + 13,LineWith8Byte}}
		},
		enhance_714_auto=
		{
			{{1,2},{20,20},{30,25},{31,25}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
		anti_fireres_yan_p=
		{
			{{1,6},{20,20},{30,25},{31,25}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
								},
	wd_adskill ={ --�䵱���׼���
		skill_desc=
			function(level)
				return "Khi thi tri�n <color=water>[�m D��ng Khi Quy�t]<color> c� th� khi�n <color=orange>"..floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[1])).." %<color> s�t th��ng chuy�n h�a th�nh n�i l�c, duy tr� <color=orange>"..floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[2])/18).." gi�y<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1238 * 256 + 1,LineWith8Byte},{20,1238 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 10,LineWith8Byte},{30,20*18*256 + 13,LineWith8Byte},{31,20*18*256 + 13,LineWith8Byte}}
		},
		damage2addmana_p=
		{
			{{1,50},{20,200},{30,248},{31,248}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		}
								},
	kl_adskill ={ --���ؽ��׼���
		skill_desc=
			function(level)
				return "Khi thi tri�n <color=water>[Ti�n Thi�n C��ng Kh�]<color> c� th� t�ng t� l� b�c ph�t [L��ng Nghi Ch�n Kh�] <color=orange>"..floor(Link(level,SKILLS.kl_adskill.enhance_717_auto[1])).." %<color>, \n"..
				"v� b� qua L�i ph�ng: <color=orange>"..floor(Link(level,SKILLS.kl_adskill.anti_lightingres_yan_p[1])).." %(D��ng)<color>, duy tr� <color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18).." gi�y<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1239 * 256 + 1,LineWith8Byte},{20,1239 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 5,LineWith8Byte},{30,20*18*256 + 7,LineWith8Byte},{31,20*18*256 + 7,LineWith8Byte}}
		},
		enhance_717_auto=
		{
			{{1,3},{20,15},{30,20},{31,20}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
		anti_lightingres_yan_p=
		{
			{{1,5},{20,15},{30,20},{31,20}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
								},
	xy_adskill ={ --��ң���׼���
		skill_desc=
			function(level)
				return "<color=water>Tr�ng th�i [B�c Minh Chi Gi�p]:<color> Ph�ng th�ch l�p gi�p n�i l�c c�c ��i <color=orange>"..floor(Link(level,SKILLS.xy_adskill.staticmagicshield_p[1])/100)..
				" l�n <color> th��ng t�n ch�n kh� h� thu�n \nH� thu�n m�i <color=orange>"..floor(Link(level,SKILLS.xy_adskill.staticmagicshield_p[2])/18+1)..
				" gi�y<color> ��i m�i 1 l�n, li�n t�c <color=orange>"..floor(Link(level,SKILLS.xy_adskill.fastwalkrun_p[2])/18).." gi�y<color>\n\n"
			end,
		autoreplyskill=
		{
			{{1,1902 * 256 + 1,LineWith8Byte},{20,1902 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1,LineWith8Byte},{30,30*18*256 + 10,LineWith8Byte},{31,30*18*256 + 10,LineWith8Byte}}
		},
		fastwalkrun_p={{{1,0},{20,0}},{{1,5*18},{20,10*18},{21,10*18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		autocastskill = {
			{{1,1903*256 + 1},{20,1903*256 + 20}},--Ŀ�꼼��id * 256 + �ȼ�
			{{1,-1},{20,-1}},-- Ϊ1��ʾ��CD������CD��-1
			{{1, (1*18*256 + 100)},{20, (1*18*256 + 100)}},-- ���֡�� * 256 + ��������
		},
		staticmagicshield_p={{{1,100},{20,1000},{21,1050}},{{1,17},{20,17}}},
	},
}

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
