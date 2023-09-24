-- ����Ѫ����������״̬�����޵ļ��ܼ���ʽ
-- ״̬���������ӣ���ֵ����ʽ���𼶵���100��״̬��

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 30*18;	-- Ĭ��״̬�����״̬ά��ʱ�䣨30�룩���ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 100;			-- һ�����ܶ�Ӧ��״̬����ߵ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "manamax_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "lifemax_yan_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "manamax_v") then
		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- ״̬�����ӣ���ֵ����ʽ
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end
