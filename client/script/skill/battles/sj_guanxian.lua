-- ����Ѫ����������״̬�����޵ļ��ܼ���ʽ
-- ״̬���������ӣ���ֵ����ʽ���𼶵���100��״̬��

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 5*60*18;	-- Ĭ��״̬�����״̬ά��ʱ�䣨300�룩���ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_p") then
		return GetLife_P(level);
	end
	if (levelname == "allres_p") then
		return GetRes_P(level);
	end
	strNull = "";
	return strNull
end

-- ״̬�����ӣ���ֵ����ʽ
function GetLife_P(level)
	local life_add = 10 + 10*level
	return Param2String(life_add, DEFAULT_ENHANCE_TIME, 0);
end

function GetRes_P(level)
	local res_add = 5*(level-1)
	return Param2String(res_add, DEFAULT_ENHANCE_TIME, 0);
end