-- description	: ���ۻ����������RelayÿСʱ����
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")


-- �򿪵�ͼ��Ӧ��mission
function start_missions(map)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			OpenMission(MISSION_MATCH);
		end
	end
end

-- �رյ�ͼ��Ӧ��mission
function close_missions(map)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			if (GetMissionV(VARV_STATE) ~= 0) then
				CloseMission(MISSION_MATCH);
			end
		end
	end
end

function OnTrigger()
	-- ����missions
	close_missions(map_map);
	start_missions(map_map);
end

OnTrigger();