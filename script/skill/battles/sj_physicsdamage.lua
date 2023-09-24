-- �����⹦�˺��ļ��ܼ���ʽ
-- �⹦�˺����ӣ���ֵ����ʽ���𼶵���10���⹦�˺�
--	�⹦�˺����ӣ��ٷֱȣ���ʽ:�𼶵���10%�⹦�˺�

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60 * 18;	-- Ĭ���⹦�˺�����״̬ά��ʱ�䣨1���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ���ڹ��˺���ߵ���ֵ�Ͱٷֱ�

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsdamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addfiredamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addlightingdamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addpoisondamage_v") then
			return GetStatusPoisonEnhance_V(level);
	end
	if (levelname == "addcolddamage_v") then
			return GetStatusColdEnhance_V(level);
	end
	if (levelname == "addphysicsdamage_p") then
			return GetStatusEnhance_P(level);
	end
	strNull = "";
	return strNull
end

-- ��������˺����ӣ���ֵ����ʽ
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, enhance_value);
end
--�����˺����ӣ��ٷֱȣ���ʽ
function GetStatusEnhance_P(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 6);
end

-- �ⶾ�˺����ӣ���ֵ����ʽ
function GetStatusPoisonEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 10);
end

-- ����˺����ӣ���ֵ����ʽ
function GetStatusColdEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end