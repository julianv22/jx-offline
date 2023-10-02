-- �����ڹ��˺��ļ��ܼ���ʽ
-- �ڹ��˺����ӣ��ٷֱȣ���ʽ���𼶵���10%�ڹ��˺�
-- �ڹ��˺����ӣ���ֵ����ʽ���𼶵���10���ڹ��˺�

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 10 * 60 * 18;	-- Ĭ���ڹ��˺�����״̬ά��ʱ�䣨10���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
PERCENT_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ���ڹ��˺���ߵİٷֱ�
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ���ڹ��˺���ߵ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsmagic_p" or levelname == "addpoisonmagic_p" or levelname == "addcoldmagic_p" or levelname == "addfiremagic_p" or levelname == "addlightingmagic_p") then
		return GetStatusEnhance_P(level);
	end
	if (levelname == "addphysicsmagic_v" or levelname == "addpoisonmagic_v" or levelname == "addcoldmagic_v" or levelname == "addfiremagic_v" or levelname == "addlightingmagic_v") then
		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- �ڹ��˺����ӣ��ٷֱȣ���ʽ
function GetStatusEnhance_P(level)
	local enhance_percent = PERCENT_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_percent, DEFAULT_ENHANCE_TIME, 0);
end

-- �ڹ��˺����ӣ���ֵ����ʽ
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end