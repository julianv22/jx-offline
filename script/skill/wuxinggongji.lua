--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "attackrating_p") then
return Getackrating_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_v(level)
result =1
return Param2String(result,0,result)
end;

function Getackrating_p(level)
result = 1
return Param2String(result,0,0)
end;
