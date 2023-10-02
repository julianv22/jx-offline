-- �������١����١����ܡ����е�״̬���ļ��ܼ���ʽ
-- ״̬�����ӣ��ٷֱȣ���ʽ���𼶵���50%״̬��
-- ״̬�����ӣ���ֵ����ʽ���𼶵���50��״̬��

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 3* 60 * 18;	-- Ĭ���ڹ��˺�����״̬ά��ʱ�䣨3���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ���ڹ��˺���ߵ���ֵ
PERCENT_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ��״̬����ߵİٷֱ�

function GetSkillLevelData(levelname, data, level)
	if (levelname == "fastwalkrun_p") then
	 		return GetStatusEnhance_P(level);
	end
	if (levelname == "adddefense_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "attackratingenhance_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "attackspeed_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "castspeed_v") then
	 		return GetStatusEnhance_V(level);
	end	
	if (levelname == "attackspeed_yan_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "castspeed_yan_v") then
	 		return GetStatusEnhance_V(level);
	end	
	strNull = "";
	return strNull
end

-- ״̬�����ӣ��ٷֱȣ���ʽ
function GetStatusEnhance_P(level)
	local enhance_percent = PERCENT_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_percent, DEFAULT_ENHANCE_TIME, 0);
end

-- ״̬�����ӣ���ֵ����ʽ
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end