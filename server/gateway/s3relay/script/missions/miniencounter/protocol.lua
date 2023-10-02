Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");
Include("\\script\\missions\\miniencounter\\playermanager.lua");

-- ������apply_signup
-- ˵������ұ����μӱ�����gs -> relay -> gs
-- ����ֵ��
function apply_signup(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	local nPlayerMapID = ObjBuffer:PopObject(ParamHandle)
	local nSignupResult = -1;	--��������ֵ��-1 - ϵͳ����, 1 - �ɹ�, 2 - �ѱ���, 3 - ��������, 4 - �Ѿ��ڱ�����							 

	local tbMapList = EncounterMapManager.tbMapList;
	local nMapID	= -1;
	for i = 1, getn(tbMapList) do
		local tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			break;
		end
	end

	if nSignupResult < 0 and nMapID > 0 then											-- �ڱ�����
		nSignupResult = 4;
	end

	if nSignupResult < 0 and EncounterPlayerManager:IsInBlackList(szRoleName) then	  -- �ں������б���
		nSignupResult = 3;
	end

	if nSignupResult < 0 and EncounterPlayerManager:IsInPrepareList(szRoleName) then	-- ���Ŷ��б���
		nSignupResult = 2;
	end
	
	if nSignupResult < 0 then														   -- �����Ŷ��б�
		local tbPlayer = EncounterPlayer:new(szRoleName);
		if EncounterPlayerManager:AddToPrepareList(tbPlayer) then	  
				DungeonGlobalData:PlayerInfoChange(szRoleName, {1, nPlayerMapID})
			nSignupResult = 1;
		end
	end

	-- Return Result
	ObjBuffer:PushObject(ResultHandle, szRoleName);
	ObjBuffer:PushObject(ResultHandle, nSignupResult);

		if nSignupResult == 1 then
			local hObject = OB_Create();
			ObjBuffer:PushObject(hObject, szRoleName);
			RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "AddPlayerToQueue", hObject)
			OB_Release(hObject)
		end

	-- ������һ�����
	if nSignupResult > 0 and nSignupResult ~= 4 and nSignupResult ~= 3 then			 -- �����ɹ������Ѿ�����
		replenish_player();
	end
end

function get_prepare_list_num(ParamHandle, ResultHandle)
	local nPrepareNum = 0;
	if EncounterPlayerManager.tbPrepareList ~= nil then
		nPrepareNum = getn(EncounterPlayerManager.tbPrepareList);
	end
	
	ObjBuffer:PushObject(ResultHandle, nPrepareNum);
end

-- ������return_map
-- ˵������ҵ�����������
function return_map(ParamHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	local tbMapList = EncounterMapManager.tbMapList;
	local nMapNum   = getn(tbMapList);
	local nMapID = -1;
	local tbMap  = nil;
	
	for i = 1, nMapNum do
		tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			OutputMsg("return_map.."..nMapID..".."..szRoleName)
			break;
		end
	end

	local tbPlayerList = {}
	if nMapID > 0 and tbMap then
		local nCamp = tbMap:GetCampByName(szRoleName)
		tinsert(tbPlayerList, {szRoleName, nCamp})
		notify_enter_map(tbPlayerList, nMapID, 2, tbMap.nGameStartTime)
		return 1;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "return_map_msg", hObject);
	OB_Release(hObject);
end

-- ������cancel_signup
-- ˵�������ȡ����������
function cancel_signup(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);					-- ��ɫ��
	local tbPrepareList = EncounterPlayerManager.tbPrepareList;
	local nCancelResult = -1;	-- ȡ�������-1 ϵͳ����1 ȡ���ɹ���0 ��δ������2 �����в���ȡ��

	-- ����Ƿ��ڱ�����
	local tbMapList = EncounterMapManager.tbMapList;
	local nMapID	= -1;
	for i = 1, getn(tbMapList) do
		local tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			break;
		end
	end

	if nCancelResult < 0 and nMapID > 0 then								-- �����в���ȡ��
		nCancelResult = 2;
	end

	if nCancelResult < 0 then
		if EncounterPlayerManager:IsInPrepareList(szRoleName) then		  -- ��׼�������У�����ȡ������
			if EncounterPlayerManager:DelFromPrepareList(szRoleName) then
								DungeonGlobalData:PlayerInfoChange(szRoleName, nil)
				nCancelResult = 1;
			end
		else																-- ��δ����
			nCancelResult = 0;
		end
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	ObjBuffer:PushObject(hObject, nCancelResult);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "cancel_signup_msg", hObject);
	OB_Release(hObject);
	--EncounterPlayerManager:PrintPrepareList();
end

-- ������search_timer
-- ˵����relay��������timer����������׼���б���������
-- ����ֵ���������´δ���ʱ��
function search_timer()	
	local tbPrepareList   = EncounterPlayerManager.tbPrepareList;
	local nPreparePlayerNum = getn(tbPrepareList);						  -- �ȴ������е�����

	if nPreparePlayerNum <= 0 then
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	-- ���Ȳ���ǰһ������������
	if replenish_player() then											  -- ������δ�����������һ���������򷵻�
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	-- �´δ��������±���
	if nPreparePlayerNum < DungeonGlobalData.PLAY_NUM_LOWER_LIMIT then
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	EncounterPlayerManager:ClearCheckTempList();
	local tbCheckTempList = EncounterPlayerManager.tbCheckTempList;		 -- ��ʱ������

	-- ����ɫ״̬����
	local tbTempAddBlackList = {};										  -- ��ʱ�������б�
	for i = 1, nPreparePlayerNum do

		local tbPlayer = tbPrepareList[i];
		if tbPlayer:CheckPlayerState() then			  -- ���ͨ�����Ȳ�����ɾ����������ֱ�������������׼��������ɾ��
			EncounterPlayerManager:AddToCheckTempList(tbPlayer);
		else																-- ���ʧ�ܣ�������ʱ������
			tinsert(tbTempAddBlackList, tbPlayer)
		end

		if getn(tbCheckTempList) >= DungeonGlobalData.PLAY_NUM_UPPER_LIMIT then  -- ��������Ѿ��ﵽ������������������
			break;
		end
	end

	-- �������������
	for i = 1, getn(tbTempAddBlackList) do
		local tbPlayer = tbTempAddBlackList[i];
		if tbPlayer then
			send_forbid_msg2player(tbPlayer.szRoleName);
			EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName);
			DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
			EncounterPlayerManager:AddToBlackList(tbPlayer);
		end
	end
	tbTempAddBlackList = {};

	local nCheckTempNum = getn(tbCheckTempList);
	if nCheckTempNum < DungeonGlobalData.PLAY_NUM_LOWER_LIMIT then
		EncounterPlayerManager:ClearCheckTempList();
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	else	-- ������Ϣ�����
		for i = 1, nCheckTempNum do
			send_prepare_fight_msg2player(tbCheckTempList[i].szRoleName);
		end
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, tbCheckTempList[1].szRoleName);		  -- ��ʱ���е�һ���������gs����(��ʽ�汾�ĳɰ�̨GS�ֿ�)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "allocate_map_dynamically", hObject);
	OB_Release(hObject);

	return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
end

-- ������send_forbid_msg2player
-- ˵��������������Ϣ�����
function send_forbid_msg2player(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "send_forbid_msg2player", hObject);
	OB_Release(hObject);
end

-- ������unforbid_timer
-- ˵����relay��������timer�����������������б������ʱ���ɫ
-- ����ֵ���������´δ���ʱ��
function unforbid_timer()
	local tbBlackList = EncounterPlayerManager.tbBlackList;

	for k, v in tbBlackList do
		local nCurTime = GetSysCurrentTime();									   -- ��ǰ������ʱ��
		local szRoleName = k;
		local tbPlayer = v;

		if nCurTime >= tbPlayer.nLockTime + DungeonGlobalData.BLACK_LIST_TIME * 60 then
			EncounterPlayerManager:DelFromBlackList(tbPlayer.szRoleName);

			-- ֪ͨ��ұ����
			local hObject = OB_Create();
			ObjBuffer:PushObject(hObject, tbPlayer.szRoleName);
			RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "unforbid_msg", hObject);
			OB_Release(hObject);
		end
	end

	return DungeonGlobalData.UNFORBID_TIMER_INTERVAL;
end

-- ������allocate_map_dynamically
-- ˵����search_timer�ص����������ڿ�����ͼ
-- ����ֵ���ޡ�
function allocate_map_dynamically(ParamHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle);
	if nMapID == nil or nMapID <= 0 then
		return nil;
	end

	local tbCheckTempList = EncounterPlayerManager.tbCheckTempList;				 -- �������������б�
	local nCheckTempNum   = getn(tbCheckTempList);

	local tbMap = EncounterMap:Create(nMapID);
	local tbPlayerList = {}
	if tbMap then
		for i = 1, nCheckTempNum do
			local tbPlayer = tbCheckTempList[i];
			local nCamp = tbMap:AddPlayer(tbPlayer.szRoleName)
			tinsert(tbPlayerList, {tbPlayer.szRoleName, nCamp})
		end
	end
	EncounterMapManager:AddMap(tbMap);

	notify_enter_map(tbPlayerList, nMapID, 0, tbMap.nGameStartTime);				-- ֪ͨgs����ҽ���
	
	-- ����Ҵ�׼��������ɾȥ
	for i = 1, nCheckTempNum do
		EncounterPlayerManager:DelFromPrepareList(tbCheckTempList[i].szRoleName);   -- ɾ����ɫ��Ϣ
		DungeonGlobalData:PlayerInfoChange(tbCheckTempList[i].szRoleName, nil)
	end

	EncounterPlayerManager:ClearCheckTempList();									-- �����ʱ����
end

function send_prepare_fight_msg2player(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "send_prepare_fight_msg2player", hObject);
	OB_Release(hObject);
end

-- ������replenish_player
-- ˵����������һ�������ͻս������������˺����ڱ����Լ����������������б�����
-- ����ֵ��nil - δ���в�����߽��в��䵫�ǲ���ʧ�ܣ�1 - ���в��䲢�Ҳ���ɹ�
function replenish_player()
	local tbPrepareList = EncounterPlayerManager.tbPrepareList;			 -- ����׼������
	local tbMapList	 = EncounterMapManager.tbMapList;					-- ��ͼ����
	
	local nMapNum = getn(tbMapList);										-- ��ǰ�����ĵ�ͼ��

	local nPreparePlayerNum = getn(tbPrepareList);						  -- ��ǰ׼�����еȴ�����

	OutputMsg("replenish_player.."..nMapNum..".."..nPreparePlayerNum)

	if nMapNum <= 0 or nPreparePlayerNum <= 0 then						  -- ���û�е�ͼ��������׼������������Ϊ��
		return nil;
	end
	
	local tbMap = tbMapList[nMapNum];									   -- ���һ�������ı�
	

	-- �����ͼ�Ϸ������ڵȴ�����������������
	if tbMap and tbMap:IsValid() and tbMap:IsWait() and (not tbMap:IsFull()) then

		-- �õ�Ҫ���������
		local nReplenish = DungeonGlobalData.PLAY_NUM_UPPER_LIMIT - tbMap:GetTotalNum();
		if nReplenish > nPreparePlayerNum then
			nReplenish = nPreparePlayerNum;
		end

		local nCounter = nReplenish;
		local tbTempAddBlackList  = {};										 -- ��ʱ�������б�
		local tbTempEnterGameList = {};										 -- ��ʱ������Ϸ����б�

		-- ����׼�����У��Ϸ���Ҽ�����ʱ������Ϸ�б��Ƿ���ҽ�����ʱ�������б�
		for i = 1, nPreparePlayerNum do
			if nCounter <= 0 then											   -- ���䵽�������
				break;
			end

			local tbPlayer = tbPrepareList[i];
			if not tbPlayer:CheckPlayerState() then		  -- ��ɫ״̬�Ƿ���������ʱ������
				tinsert(tbTempAddBlackList, tbPlayer)
			else																-- ��ɫ״̬�Ϸ���������ʱ������Ϸ����б�
				tinsert(tbTempEnterGameList, tbPlayer)
				nCounter = nCounter - 1;										-- ������һ
			end
		end

		-- �������������
		for i = 1, getn(tbTempAddBlackList) do
			local tbPlayer = tbTempAddBlackList[i];
			if tbPlayer then
				send_forbid_msg2player(tbPlayer.szRoleName);					-- ����������Ϣ����� relay -> gs -> client
				EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName); -- ��׼��������ɾ��
				DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
				EncounterPlayerManager:AddToBlackList(tbPlayer);				-- ����������б�
			end
		end

		-- �����ͼ����
		local tbPlayerList = {}
		for i = 1, getn(tbTempEnterGameList) do
			local tbPlayer = tbTempEnterGameList[i];
			if tbPlayer then
				local nCamp = tbMap:AddPlayer(tbPlayer.szRoleName)
				tinsert(tbPlayerList, {tbPlayer.szRoleName, nCamp})
				EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName); -- ��׼��������ɾ��
				DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
			end
		end
		
		if getn(tbPlayerList) > 0 then
			notify_enter_map(tbPlayerList, tbMap.nMapID, 1, tbMap.nGameStartTime)
			return 1;
		end
	end

	return nil;
end

function notify_enter_map(tbPlayerList, nMapID, nReason, nStartTime)
	if nMapID == nil or nMapID < 0 then
		return
	end
	
	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, tbPlayerList)
	ObjBuffer:PushObject(hObject, nMapID)
	ObjBuffer:PushObject(hObject, nReason)
	ObjBuffer:PushObject(hObject, nStartTime)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "enter_map", hObject)
	OB_Release(hObject)
end

-- ������game_finish
-- ˵������������ɾ��relay�ϵ�ͼ��Ϣ��֪ͨgsɾ����ͼ��gs -> relay -> gs
function game_finish(ParamHandle, ResultHandle)

	local nMapID = ObjBuffer:PopObject(ParamHandle);

	if nMapID == nil or nMapID <= 0 then
		return nil;
	end

	EncounterMapManager:DelMap(nMapID);

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, nMapID);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function PlayerInfoChange(ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local bOnline = ObjBuffer:PopObject(ParamHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle)
	DungeonGlobalData:PlayerInfoChange(szName, {bOnline, nMapID})
end

AddTimer(DungeonGlobalData.SEARCH_TIMER_INTERVAL  , "search_timer"  , 0);
AddTimer(DungeonGlobalData.UNFORBID_TIMER_INTERVAL, "unforbid_timer", 0);
