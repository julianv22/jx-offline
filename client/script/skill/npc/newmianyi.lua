function GetSkillLevelData(levelname, data, level)


--���˶���ʱ��
if (levelname == "fasthitrecover_v") then
return Getfasthitrecover_v(level)
end;

--���˶���ʱ�䣺#d1~������
if (levelname == "fasthitrecover_yan_v") then
return Getfasthitrecover_v(level)
end;

--����һ���ֿ�����#d1+%
if (levelname == "fatallystrikeres_p") then
return Getfatallystrikeres_p(level)
end;

--�ٻ�ʱ�䣺#d1~%
if (levelname == "freezetimereduce_p") then
return Getfreezetimereduce_p(level)
end;

--�ж�ʱ�䣺#d1~%���ж�ʱ����٣�
if (levelname == "poisontimereduce_p") then
return Getpoisontimereduce_p(level)
end;

--ѣ��ʱ�䣺#d1~%
if (levelname == "stuntimereduce_p") then
return Getstuntimereduce_p(level)
end;

--�ܽ�����ʱ�˺�������#d1+%
if (levelname == "meleedamagereturn_p") then
return Getmeleedamagereturn_p(level)
end;

--��Զ�̹���ʱ�˺�������#d1+%
if (levelname == "rangedamagereturn_p") then
return Getrangedamagereturn_p(level)
end;

--�������Խ�ϵ���˺���#d1-%
if (levelname == "metal2medamage_p") then
return Getrangemetal2medamage_p(level)
end;

--��������ľϵ���˺���#d1-%
if (levelname == "wood2medamage_p") then
return Getrangewood2medamage_p(level)
end;

--��������ˮϵ���˺���#d1-%
if (levelname == "water2medamage_p") then
return Getrangewater2medamage_p(level)
end;

--�������Ի�ϵ���˺���#d1-%
if (levelname == "fire2medamage_p") then
return Getrangefire2medamage_p(level)
end;

--����������ϵ���˺���#d1-%
if (levelname == "earth2medamage_p") then
return Getrangeearth2medamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getrangemetal2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangewood2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangewater2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangefire2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangeearth2medamage_p(level)
return Param2String(50,-1,0)
end;


function Getfasthitrecover_v(level)
return Param2String(1000,-1,0)
end;

function Getfatallystrikeres_p(level)
return Param2String(1000,-1,0)
end

function Getfreezetimereduce_p(level)
return Param2String(2000,-1,0)
end;

function Getpoisontimereduce_p(level)
return Param2String(3000,-1,0)
end;

function Getstuntimereduce_p(level)
return Param2String(2000,-1,0)
end;

function Getmeleedamagereturn_p(level)
return Param2String(80,-1,0)
end

function Getrangedamagereturn_p(level)
return Param2String(80,-1,0)
end

