-- description	: ���ػ����������RelayÿСʱ����
-- author		: wangbin
-- datetime		: 2005-07-14

Include("\\settings\\trigger_include.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTrigger()
	-- DEBUG
	print("trigger_challengeoftime start...");
	-- TODO: �޸��������
	-- ����missions
	for i=1, getn(tbLevelMaps) do
		close_missions(tbLevelMaps[i], MISSION_MATCH, VARV_STATE);
		start_missions(tbLevelMaps[i], MISSION_MATCH);
	end
	
	--���ص��� 2011.03.02
	ChuangGuan30:KickOutAll()
	ClearMapNpc(CHUANGGUAN30_MAP_ID)
	-- ��Ӽ�ʱ��
	DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:AddTime")
end
--OnTrigger();