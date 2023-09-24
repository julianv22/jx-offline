-- �����ڹ��˺��ļ��ܼ���ʽ
-- �ڹ��˺����ӣ���ֵ����ʽ���𼶵���10���ڹ��˺�

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60 * 18;	-- Ĭ���ڹ��˺�����״̬ά��ʱ�䣨1���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ���ڹ��˺���ߵ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addpoisonmagic_v") then
	 		return GetStatusPoisonEnhance_V(level);
	end
	if (levelname == "addcoldmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addfiremagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addlightingmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- ���ա��ڻ��ڱ��������˺����ӣ���ֵ����ʽ
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, enhance_value);
end

-- �ڶ��˺����ӣ���ֵ����ʽ
function GetStatusPoisonEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 10);
end