-- �����˶��������ж�ʱ�䡢���ٻ�ʱ�䡢��ѣ��ʱ�䡢��������һ���ֿ��ļ��ܼ���ʽ
-- �����˶��������ж�ʱ�䡢���ٻ�ʱ�䡢��ѣ��ʱ�䡢��������һ���ֿ���ʽ���𼶵���10����ֵ

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME =60 * 18;	-- Ĭ������״̬ά��ʱ�䣨1���ӣ����ɸ��ݾ���ʹ����Ҫ�ڵ���AddSkillStateʱָ��ʱ��
VALUE_ENHANCE_PER_LEVEL = 10;			-- һ�����ܶ�Ӧ����ߵ���ֵ

function GetSkillLevelData(levelname, data, level)
	if (levelname == "fasthitrecover_v") then
			return GetStatus_V(level);
	end
	if (levelname == "poisontimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "freezetimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "stuntimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "fatallystrikeres_p") then
			return GetStatus_V(level);
	end
	strNull = "";
	return strNull
end

-- ״̬���ӣ���ֵ����ʽ
function GetStatus_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end

