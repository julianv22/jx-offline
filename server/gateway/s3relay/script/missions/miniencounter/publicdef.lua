-- Type : DungeonGlobalData
DungeonGlobalData = {};
DungeonGlobalData.BLACK_LIST_TIME		 = 10;		 -- ������ʱ�䣺X����
DungeonGlobalData.MAP_WAIT_TIME		   = 180;		-- ����׼��ʱ�䣺X��
DungeonGlobalData.SEARCH_TIMER_INTERVAL   = 60;		 -- ���������������X��
DungeonGlobalData.UNFORBID_TIMER_INTERVAL = 60;		 -- ��������������X��
DungeonGlobalData.PLAY_NUM_UPPER_LIMIT	= 16;		  -- ��������
DungeonGlobalData.PLAY_NUM_LOWER_LIMIT	= 8;		  -- ��������

DungeonGlobalData.tbPlayerInfo = {}	--�����Ϣ[szRoleName]={bOnline, nMapID}

function DungeonGlobalData:PlayerInfoChange(szRoleName, tbInfo)
	local msg = format("PlayerInfoChange: %s , ", szRoleName)
	if tbInfo then
		msg = msg..format("bOnline=%d, nMapID=%d", tbInfo[1], tbInfo[2])
	else
		msg = msg.."nil"
	end
	OutputMsg(msg)
	self.tbPlayerInfo[szRoleName] = tbInfo
end

DungeonGlobalData.tbValidWaitMap = 
{
	[1] = {1  , 43 },
	[2] = {45 , 196},
	[3] = {198, 207},
	[4] = {224, 234},
	[5] = {319, 325},
	[6] = {332, 333},
	[7] = {340, 340},
};

function DungeonGlobalData:GetPlayerMapID(szRoleName)
	local player = self.tbPlayerInfo[szRoleName]
	if player then
		return player[2]
	end
	return nil
end

function DungeonGlobalData:IsInValidWaitMap(szRoleName)
	print("[Function Stack] - DungeonGlobalData:IsInValidWaitMap(szRoleName) - publicdef.lua");

	if szRoleName == nil then
		print(">> Error : szRoleName is invalid.");
		return nil;
	end

	local nCurMapID = self:GetPlayerMapID(szRoleName);
	if nCurMapID == nil then
		print(">> Error : nCurMapID is nil, maybe the player is offline.");
		return nil;
	end

	local nValidWaitMapGroupNum = getn(DungeonGlobalData.tbValidWaitMap);
	for i = 1, nValidWaitMapGroupNum do
		local tbValidWaitMapInterval = DungeonGlobalData.tbValidWaitMap[i];
		if nCurMapID >= tbValidWaitMapInterval[1] and nCurMapID <= tbValidWaitMapInterval[2] then
			return 1;
		end
	end
	
	return nil;
end
