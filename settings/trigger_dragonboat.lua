-- description	: ���ۻ����������RelayÿСʱ����
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\settings\\trigger_include.lua")

function OnTrigger()
	-- ����missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
end

OnTrigger();
