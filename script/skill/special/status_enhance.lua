-- ����Ѫ����������������״̬���ļ��ܼ���ʽ
-- ״̬�����ӣ��ٷֱȣ���ʽ���𼶵���50%״̬��
-- ״̬�����ӣ���ֵ����ʽ���𼶵���50��״̬��

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 10 * 60 * 18;	-- Ĭ��״̬�����״̬ά��ʱ�䣨10���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
PERCENT_ENHANCE_PER_LEVEL = 50;			-- һ�����ܶ�Ӧ��״̬����ߵİٷֱ�
VALUE_ENHANCE_PER_LEVEL = 50;			-- һ�����ܶ�Ӧ��״̬����ߵ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_p" or levelname == "manamax_p") then
		return GetStatusEnhance_P(level);
	end
	if (levelname == "lifemax_v" or levelname == "manamax_v") then
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