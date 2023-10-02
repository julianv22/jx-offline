function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "attackspeed_v") then
return Getattackspeed_v(level)
end;

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
end;

if (levelname == "lifemax_p") then
return Getlifemax_p(level)
end;

if (levelname == "adddefense_v") then
return Getadddefense_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddphysicsdamage_p(level)
result1 = 150+20*level
result2 = 600+level*200
return Param2String(result1,result2,6)
end;

function Getattackratingenhance_p(level)
result1 = 50+15*level
result2 = 600+level*200
return Param2String(result1,result2,0)
end;

function Getlifemax_p(level)
result1 = -10-level
result2 = 600+level*200
return Param2String(result1,result2,0)
end;

function Getadddefense_v(level)
result1 = -level*15
result2 = 600+level*200
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 100
return Param2String(result,0,0)
end;

function Getattackspeed_v(level)
result =12+level*2
time = 600+level*200
return Param2String(result,time,0)
end;
