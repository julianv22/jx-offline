-- �������ӷ����ļ��ܼ���ʽ
-- ����״̬�����ӹ�ʽ���𼶵���10��ٷֱȣ��������ӣ�

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60*18;	-- Ĭ��״̬�����״̬ά��ʱ�䣨1���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ��״̬����ߵİٷֱ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "physicsres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "poisonres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "coldres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "fireres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "lightingres_p") then
			return GetStatus_V(level);
	end
	if (levelname == "allres_p") then
			return GetStatus_V(level);
	end
	
	if (levelname == "physicsres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "poisonres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "coldres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "fireres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "lightingres_yan_p") then
			return GetStatus_V(level);
	end
	if (levelname == "allres_yan_p") then
			return GetStatus_V(level);
	end
	strNull = "";
	return strNull
end

-- ״̬�����ӣ���ֵ����ʽ
function GetStatus_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end