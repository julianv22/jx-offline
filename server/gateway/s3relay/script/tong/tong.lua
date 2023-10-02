function DefFun1(n1)
	return 1
end
function DefFun2(n1, n2)
	return 1
end
if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\workshop\\workshop_setting.lua")
Include("\\script\\tong\\log.lua")
if MODEL_RELAY == 1 then
	Include("\\script\\gb_taskfuncs.lua")
else
	Include("\\script\\tong\\map\\map_management.lua")
end

--����ʼ��
function INIT_R(nTongID)
	if (nTongID == 0 or TONG_GetDay(nTongID) ~= 0)then
		return 0
	end
	return MAINTAIN_R(nTongID)
end
INIT_G_1 = DefFun1
INIT_G_2 = DefFun1

function ADD_R(nTongID, nMasterID)
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = "T�o bang h�i";
	local szRecordPlus;
	local szMasterName = TONGM_GetName(nTongID, nMasterID);
	if (szMasterName ~= "") then
		szRecordPlus = szMasterName.." "..szRecord;
	else
		szMasterName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	
	cTongLog:WriteInfTB("TONG", "build", nTongID, {master = szMasterName})
		
	return INIT_R(nTongID)
end
ADD_G_1 = DefFun2
ADD_G_2 = DefFun2

function REMOVE_R(nTongID)
	local tbMsg = {
		membercount	= TONG_GetMemberCount(nTongID),
		retirecount	= TONG_GetMemberCount(nTongID, 4),
		day			= TONG_GetDay(nTongID),
		buildfund	= TONG_GetBuildFund(nTongID),
		warbuildfund= TONG_GetWarBuildFund(nTongID),
	}
	cTongLog:WriteInfTB("TONG", "dismiss", nTongID, tbMsg)
	return 1
end
REMOVE_G_1 = DefFun1
REMOVE_G_2 = DefFun1

aszTongLogXPFileHead = {	
	"Ng�y","S� tu�n","Bang h�i","��ng c�p ki�n thi�t","Ng�n s�ch ki�n thi�t","Ng�n s�ch chi�n b�","N�p �i�m c�ng hi�n","S� ng��i",
	"S� ng��i tho�i �n","Ng�n s�ch ki�n thi�t h�ng tu�n","Ng�n s�ch ki�n thi�t ti�u hao","Ng�n s�ch chi�n b� h�ng tu�n","Ng�n s�ch chi�n b� ti�u hao","Ng�n qu� th�nh ki�n thi�t","G�p ti�n th�nh ki�n thi�t","Ki�n thi�t th�nh chi�n b�",
	"T�c ph��ng s�n xu�t","T�ng s� T�c Ph��ng","Khu Binh gi�p ","Khu Thi�n C�ng ","Khu M�t n� ","Th� luy�n ph��ng","Khu Thi�n � ","Khu L� v�t ",
	"Khu ho�t ��ng ","C�p T�c Ph��ng cao nh�t","�� kh� m�c ti�u tu�n","Ho�n th�nh m�c ti�u tu�n","H� th�ng m�c ti�u tu�n",
}
TongLogXPRecords = 0
function WriteXPLog(nTongID)
	if not tongLogFile then
		--�ļ�������
		if not openfile("Logs/tong/tonglog_xp.log", "r")then
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
			if (tongLogFile == nil)then
				return
			end
			local size = getn(aszTongLogXPFileHead);
			for i=1,size-1 do
				write(tongLogFile,aszTongLogXPFileHead[i],'\t')
			end
			write(tongLogFile,aszTongLogXPFileHead[size],'\n')
		else
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
		end
	end	
	local aszData = GetTongLogData(nTongID)
	if (not tongLogFile or not aszData)then
		print("errererer\n")
		return	
	end
	write(tongLogFile,date("%Y-%m-%d %H:%M:%S"),'\t')
	local size = getn(aszData);
	for i=1,size-1 do
		write(tongLogFile,aszData[i],'\t')
	end
	write(tongLogFile,aszData[size],'\n')
	TongLogXPRecords = TongLogXPRecords + 1
	if TongLogXPRecords > 20 then
		TongLogXPRecords = 0
		flush(tongLogFile)
	end
end

function WEEKLY_MAINTAIN_R(nTongID)
	WriteXPLog(nTongID)	--��һ�ܵ�Log
	
	--���Log�������
	for i = TONGTSK_WEEK_BFADD,TONGTSK_BF2WF do
		TONG_ApplySetTaskValue(nTongID, i, 0)
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_HEROLING, 0);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_USEHEROLING, 0);
	
	--������Ŀ�꽱��
	local nWeekGoalEvent = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalLevel = TONG_GetWeekGoalLevel(nTongID)
	local nWeekGoalValue = TONG_GetWeekGoalValue(nTongID)
	local nWeekGoalTotal = TONG_GetWeekGoalTotal(nTongID)
	local nWeekGoalPlayer = TONG_GetWeekGoalPlayer(nTongID)
	local nWeekGoalPriceTong = TONG_GetWeekGoalPriceTong(nTongID)
	local nWeekGoalPricePlayer = TONG_GetWeekGoalPricePlayer(nTongID)
	--��Ŀ�������Ƶ�����
	TONG_ApplySetLWeekGoalEvent(nTongID, nWeekGoalEvent)
	TONG_ApplySetLWeekGoalLevel(nTongID, nWeekGoalLevel)
	TONG_ApplySetLWeekGoalValue(nTongID, nWeekGoalValue)
	TONG_ApplySetLWeekGoalTotal(nTongID, nWeekGoalTotal)
	TONG_ApplySetLWeekGoalPlayer(nTongID, nWeekGoalPlayer)
	TONG_ApplySetLWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	TONG_ApplySetLWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
	--�жϰ����Ŀ���Ƿ����
	if (nWeekGoalTotal > 0 and nWeekGoalValue >= nWeekGoalTotal) then		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 1)
		TONG_ApplyAddEventRecord(nTongID, "M�c ti�u bang h�i tu�n tr��c �� ho�n th�nh, bang ch� ho�c tr��ng l�o c� th�m quy�n c� th� ��n T� ��n c�a bang �� nh�n th��ng");	-- ����¼���¼
		Msg2Tong(nTongID, "M�c ti�u bang h�i tu�n n�y �� ho�n th�nh, bang ch� ho�c tr��ng l�o c� th�m quy�n c� th� ��n T� ��n c�a bang �� nh�n th��ng, bang ch�ng n�o ho�n th�nh m�c ti�u tu�n c� nh�n c�ng c� th� ��n T� ��n �� nh�n ph�n th��ng c� nh�n. Th�i h�n l� 1 tu�n!")
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 0)
	end		
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nBuildLevel = TONG_GetBuildLevel(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, nBuildLevel)
	--������ۻ��������δ������
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--����ٵ�����
		local nDec = nWeekBuildUpper - nTongWeekBuildFund
		--�ж��ٴ���
		local nStored = TONG_GetStoredBuildFund(nTongID)
		if (nStored < nDec) then
			nDec = nStored
		end
		if (TONG_ApplyAddStoredBuildFund(nTongID, -nDec) == 1) then
			TONG_ApplyAddBuildFund(nTongID, nDec)
			local szMsg = "Ng�n s�ch ki�n thi�t nh�n ���c trong tu�n n�y ch�a ��t gi�i h�n, ng�n s�ch ki�n thi�t d� tr� chuy�n"..nDec.." v�n v�o ng�n s�ch ki�t thi�t"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end
	TONG_ApplySetWeekBuildFund(nTongID, 0) --���ۻ����������0
	TONG_ApplySetWeekGoalValue(nTongID, 0)	--��Ŀ���ۻ����׶���0
	TONG_ApplyAddWeek(nTongID, 1)			--���������1
	
	local nMembers = TONG_GetMemberCount(nTongID, -1)		
	cTongLog:WriteInfTB("TONG", "weeklymaintain", nTongID,
						{
						week = TONG_GetWeek(nTongID),
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = nBuildLevel,
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						weekbuildfund = nTongWeekBuildFund,
--						weekgoalevent = nWeekGoalEvent,
						weekgoalvalue = nWeekGoalValue,
						weekgoaltotal = nWeekGoalTotal,
						}	)
	
			--�ؼ���һ���� ��ʼ��
	if (nBuildLevel >= 4) then
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		-- �ر������
		if (nStuntID == 6) then
			nStuntID = 0
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		end
	
		if (nStuntID ~= 0) then
			local nNextStunt = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
			if (nNextStunt ~= 0 and nNextStunt ~= nStuntID) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nNextStunt)
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, 0)
				nStuntID = nNextStunt
				local szMsg = "K� n�ng bang h�i chuy�n th�nh"..TB_STUNTID_INFO[nStuntID].name
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)	-- ����¼���¼
			end
			--Ӧ��������ά��ʱ
			Maintain_Stunt(nTongID, nStuntID)	--��ս������ά���ؼ�
			if (nBuildLevel == 5) then
				local nCitySTID = tong_GetCityStuntID(nTongID)
				if (nCitySTID ~= 0 and TB_STUNTID_INFO[nCitySTID].right == 1) then
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
				else
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, 0)
				end
			end
		end
	end
	
	--�趨�����Ŀ��
	if nMembers < MIN_WEEKGOAL_MEMBER then
		local szMsg = "Nh�n s� �t h�n "..MIN_WEEKGOAL_MEMBER.." ng��i, m�c ti�u tu�n kh�ng th� b�t ��u!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg);
--		TONG_ApplySetWeekGoalEvent(nTongID, 0)
--		TONG_ApplySetWeekGoalLevel(nTongID, 0)
--		TONG_ApplySetWeekGoalPlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalTotal(nTongID, 0)
--		TONG_ApplySetWeekGoalPricePlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalPriceTong(nTongID, 0)
	else
		local nType = random(getn(TB_WEEKGOAL_TYPE_ID))
		local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
		if (nLevel <= 0) then nLevel = 1 end --��ʼʱ��Ŀ���Ѷ�Ĭ��Ϊ1
		if (nLevel > 2) then
			nLevel = 2
			TONG_ApplySetCurWeekGoalLevel(nTongID, 2)
		end
		local nHourValue = random(150, 170)
		nWeekGoalPlayer = TB_WEEKGOAL_CHANGE[nLevel] * nHourValue --ȷ�������Ŀ�깱�׶�
		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer) --ȷ�������Ŀ�깱�׶�
		nWeekGoalPricePlayer = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue) --ȷ�������Ŀ�꽱��
		nWeekGoalPriceTong = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue * 0.4 * nMembers) --ȷ�������Ŀ�꽱��
--		nWeekGoalPlayer = WEEKGOAL_VALUE_PERSON;
--		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer); --ȷ�������Ŀ�깱�׶�
--		nWeekGoalPricePlayer = WEEKGOAL_PRICE_PERSON;
--		nWeekGoalPriceTong = WEEKGOAL_PRICE_TONG;
--		TONG_ApplySetWeekGoalEvent(nTongID, TB_WEEKGOAL_TYPE_ID[nType])
		TONG_ApplySetWeekGoalEvent(nTongID, nType)
		TONG_ApplySetWeekGoalLevel(nTongID, nLevel)
		TONG_ApplySetWeekGoalPlayer(nTongID, nWeekGoalPlayer)
		TONG_ApplySetWeekGoalTotal(nTongID, nWeekGoalTotal)
		TONG_ApplySetWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
		TONG_ApplySetWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	
		TONG_ApplyAddEventRecord(nTongID, "M�c ti�u tu�n n�y: "..TB_WEEKGOAL_TYPE_NAME[nType]);	-- ����¼���¼
		Msg2Tong(nTongID, "M�c ti�u trong tu�n c�a bang: <color=green>"..TB_WEEKGOAL_TYPE_NAME[nType])
	end
	return 1
end

function Maintain_Stunt(nTongID, nStuntID)
	if (nStuntID == 0) then
		return
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 0)
	--TONGTSK_MONEYBOX_DROPMAX
	if (TB_STUNTID_INFO[nStuntID].right == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, 0)
	end
	local nStuntState = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	if (TB_STUNT_PAUSESTATE[nStuntState][4] == 3 or TB_STUNT_PAUSESTATE[nStuntState][4] == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (nCurFund < TB_STUNTID_INFO[nStuntID].consume) then
			local szMsg = "Ng�n s�ch chi�n b� kh�ng �� �� b�o tr� Bang h�i ��c k�. Tu�n n�y t�m ��ng ch�c n�ng ��c k�!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 0)
		else
			TONG_ApplyAddWarBuildFund(nTongID, -TB_STUNTID_INFO[nStuntID].consume)
			if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
				local szMsg = "Ng�n s�ch chi�n b� �� �� b� v�o chi ph� b�o tr�, bang h�i ��c k� s� ti�p t�c ho�t ��ng!"
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)
			else
				if (nStuntState == TB_STUNT_PAUSESTATE[nStuntState][4]) then
					Msg2Tong(nTongID, "Bang h�i ��c k� ti�p t�c b�o tr�"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr�ng th�i ")
					TONG_ApplyAddEventRecord(nTongID, "Bang h�i ��c k� ti�p t�c b�o tr�"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr�ng th�i ")
				else
					Msg2Tong(nTongID, "B�o tr� bang h�i ��c k�"..TB_STUNT_PAUSESTATE[nStuntState][2])
					TONG_ApplyAddEventRecord(nTongID, "B�o tr� bang h�i ��c k�"..TB_STUNT_PAUSESTATE[nStuntState][2])
				end
			end
		end
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
	end
end

WEEKLY_MAINTAIN_G_1 = DefFun1
--WEEKLY_MAINTAIN_G_2 = DefFun1

function WEEKLY_MAINTAIN_G_2(nTongID)
	--ÿ��ά��ʱ���ͼ��NPCͷ��Ч��������AddSkill���Ա�֤���л��ؼ���ͼ�ڵ�Ч�����л�
	local nMapID = TONG_GetTongMap(nTongID)
	local nMapIdx = SubWorldID2Idx(nMapID)
	if (nMapIdx < 0) then
		return 1
	end
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nStuntID > 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function MAINTAIN_R(nTongID)
	local nDay = TONG_GetDay(nTongID)
	local nWeek = TONG_GetWeek(nTongID)
	local nexweek = nil
	if (nDay == 0 or tonumber(date("%w")) == 1 or 
		nDay >= TONG_GetTaskValue(nTongID, TONGTSK_LAST_WM_DAY) + 7) then
		nexweek = 1
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_WM_DAY, nDay)
	end
	Msg2Tong(nTongID, "Bang h�i b��c v�o ng�y th� <color=white>"..(nDay+1).."<color>, ng�n s�ch ki�n thi�t tr��c m�t: <color=gold>"..
		TONG_GetBuildFund(nTongID).."<color> v�n, ng�n s�ch chi�n b�: <color=gold>"..TONG_GetWarBuildFund(nTongID)..
		"<color> v�n")
	cTongLog:WriteInfTB("TONG", "maintain", nTongID,
						{
						day = nDay,
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = TONG_GetBuildLevel(nTongID),
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						}	)
	--���0��ʱ������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel > 0)then
		--����ά��
		local nWS = TWS_GetFirstWorkshop(nTongID)
		while (nWS ~= 0)do
			if (nexweek)then --ÿ����ղ���
				TWS_ApplySetDayOutput(nTongID, nWS, 0)			
				local nUseLevelSet = TWS_GetUseLevelSet(nTongID, nWS)
				local nCurUseLevel = TWS_GetUseLevel(nTongID, nWS)
				if nUseLevelSet > 0 and nUseLevelSet ~= nCurUseLevel and nUseLevelSet <= TWS_GetLevel(nTongID, nWS) 
					and nUseLevelSet <= tongGetWorkshopUpperLevel(nTongID, nTongLevel) then
					TWS_ApplySetUseLevel(nTongID, nWS, nUseLevelSet)
					local nType = TWS_GetType(nTongID, nWS)
					Msg2Tong(nTongID, "<color=green>"..wsGetName(nType).."<color>��ng c�p s� d�ng �i�u ch�nh th�nh c�p<color=blue>"..nUseLevelSet..
						"<color>")
				end
			end
			TWS_ApplyMaintain(nTongID, nWS)
			nWS = TWS_GetNextWorkshop(nTongID, nWS)
		end
		--�ж���ͣ״̬
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 0)then
			if (nCurFund >= TONG_GetStandFund(nTongID))then
				TONG_ApplySetPauseState(nTongID, 0)
				TONG_ApplyAddEventRecord(nTongID, "Ng�n s�ch chi�n b� �� ��t y�u c�u ng�n s�ch chi�n b� b�o tr� h�ng tu�n, tr�ng th�i t�m ng�ng c�a bang h�i ���c x�a b�!");	-- ����¼���¼
				Msg2Tong(nTongID, "Ng�n s�ch chi�n b� �� ��t y�u c�u ng�n s�ch chi�n b� b�o tr� h�ng tu�n, tr�ng th�i t�m ng�ng c�a bang h�i ���c x�a b�!")
				cTongLog:WriteInfTB("TONG", "unpause", nTongID, {})
			end
		elseif (nCurFund < TONG_GetStandFund(nTongID)) then
			TONG_ApplySetPauseState(nTongID, 1)
			TONG_ApplyAddEventRecord(nTongID, "T�c ph��ng c�a bang b� t�m d�ng do ng�n s�ch chi�n b� kh�ng �� chi ph� b�o tr� h�ng tu�n");	-- ����¼���¼
			Msg2Tong(nTongID, "Ng�n s�ch chi�n b� th�p h�n ng�n s�ch chi�n b� b�o tr� h�ng tu�n, tr�ng th�i c�a bang h�i l� <color=red>T�m d�ng!")
			cTongLog:WriteInfTB("TONG", "pause", nTongID, {})
		end	
		
		local nConsume = TONG_GetMaintainFund(nTongID)
		TONG_ApplyAddWarBuildFund(nTongID, -nConsume)		
		TONG_ApplyAddEventRecord(nTongID, "B�o tr� bang h�i ng�y h�m nay, ti�u hao"..nConsume.." v�n ng�n s�ch chi�n b�");	-- ����¼���¼
		Msg2Tong(nTongID, "B�o tr� bang h�i ng�y h�m nay, ti�u hao ng�n s�ch chi�n b� bang h�i: <color=gold>"..nConsume.."<color> v�n")
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFCONSUME, nConsume)
		nConsume = wsGetAllDayConsume(nTongID)
		nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
		Msg2Tong(nTongID, "Ng�n s�ch chi�n b� b�o tr� h�ng ng�y c�a bang hi�n t�i l�:  <color=gold>"..nConsume.." v�n")
		Msg2Tong(nTongID, "Ng�n s�ch chi�n b� b�o tr� h�ng tu�n c�a bang h�i hi�n t�i l�: <color=gold>"..(nConsume * 7).." v�n")
		local nWarBuildFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 1 and nWarBuildFund < nConsume * 7)then
			local szMsg = "Ng�n s�ch chi�n b� th�p h�n ng�n s�ch chi�n b� b�o tr� h�ng tu�n, tr��c l�n b�o tr� sau s� kh�ng c� thay ��i, t�c ph��ng bang h�i b� t�m d�ng!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)-- ����¼���¼
		end
		TONG_ApplySetMaintainFund(nTongID, nConsume)
		local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
		TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
		--ս������Ϊ0ʱ�жϽ���
--		if (nWarBuildFund == 0)then
--		local nLastDegradeDay = TONG_GetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY)
--			if (nDay - nLastDegradeDay > 7)then
--				if TONG_ApplyDegrade(nTongID) == 1 then
--					TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY, nDay)
--					local szMsg = "���ս�������ѽ���0������ȼ��½�һ����������һ���ڰ�᲻���ٽ�����"
--					Msg2Tong(nTongID, szMsg)
--					TONG_ApplyAddEventRecord(nTongID, szMsg)	-- ����¼���¼
--				end	
--			end	
--		end
	else	--����ȼ�Ϊ0
		if (TONG_GetMaintainFund(nTongID) > 0) then
			TONG_ApplySetMaintainFund(nTongID, 0)
		end	
		if (TONG_GetPerStandFund(nTongID) > 0) then
			TONG_ApplySetPerStandFund(nTongID, 0)
		end	
	end
	

	-- �����Լ�ά��
	Master_SelfCommend_Maintain(nTongID);
	
	--ÿ7�������ά��
	--��ĳ�ε���ά�������쳣û���������У��ڶ�������������ά��
	if (nexweek) then
		TONG_ApplyWeeklyMaintain(nTongID)
		Msg2Tong(nTongID, "Ki�n thi�t bang b��c sang tu�n th� <color=white>"..(nWeek+1).."<color>.")
	end
	
	--�ؼ�ά��
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nenabled = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED)
	local ndifday = tonumber(date("%w"))
	local nCitySTID = tong_GetCityStuntID(nTongID)
	
	-- �ر������
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
		
	--���ؼ�Ϊ�쵼����ȡ����TB_STUNTID_INFO[nStuntID].memper��Ϊ0��
	if (nCitySTID ~= 0 and (ndifday >= 1 and ndifday <= 4)) then
		if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) + TB_STUNTID_INFO[nCitySTID].memper <= TB_STUNTID_INFO[nCitySTID].maxmem) then
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
		end
	end
	if (nTongLevel >= 4) then
		if (nStuntID ~= 0 and nenabled ~= 0) then 
			--����1��2��3��4������θ����ؼ�
			if (ndifday <= 4 and ndifday >= 1) then
				if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) + TB_STUNTID_INFO[nStuntID].memper <= TB_STUNTID_INFO[nStuntID].maxmem) then
					TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].memper)
				end
			end
		end
	end
	TONG_ApplyAddDay(nTongID, 1)
	return 1
end
MAINTAIN_G_1 = DefFun1
MAINTAIN_G_2 = DefFun1



function logicTongLevelUp(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel >= 5)then
		return 5
	end	
	local nWsCount = TWS_GetWorkshopCount(nTongID)
	local nWsDemand = tongGetUpgradeWorkshopDemand(nTongID, nCurLevel)
	if (nWsCount < nWsDemand)then
		return 1, nWsDemand
	end
	local nLevelHi = tongGetUpgradeHighWorkshopsLevel(nTongID, nCurLevel)
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nHiNum = 0
	while (nWorkshop > 0) do
		if (TWS_GetLevel(nTongID, nWorkshop) >= nLevelHi)then
			nHiNum = nHiNum + 1
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	local nHighDemand = tongGetUpgradeHighWorkshopsDemand(nTongID, nCurLevel)
	if (nHiNum < nHighDemand)then
		return 2, nHighDemand, nLevelHi
	end
	local nBFund = TONG_GetBuildFund(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (nBFund < nCost)then
		return 3, nCost
	end
	local nLastUpgradeDay = TONG_GetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY)
	if (nLastUpgradeDay + 7 > TONG_GetDay(nTongID))then
		return 4, nLastUpgradeDay
	end
	if (nCurLevel == 2)then
		if (TONG_GetTongMap(nTongID) <= DYNMAP_ID_BASE)then
			return 6
		end
	elseif (nCurLevel == 4)then
		local nCityDay = TONG_GetOccupyCityDay(nTongID)
		if (nCityDay == 0) then
			return 7, nCityDay
		end
	end	
	return 0
end

function UPGRADE_R(nTongID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (logicTongLevelUp(nTongID) ~= 0)then
		return 0
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1)then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	TONG_ApplySetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY, TONG_GetDay(nTongID))

	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = "��ng c�p ki�n thi�t bang h�i t�ng l�n "..(nCurLevel + 1).."c�p";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." l�m cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	Msg2Tong(nTongID, szRecordPlus);
	cTongLog:WriteInfTB("TONG", "upgrade", nTongID, {buildlevel = (nCurLevel + 1), day = TONG_GetDay(nTongID)})
	--0������һ��ʱ��ʾ
	if (nCurLevel == 0)then
		local szMsg = "��ng c�p ki�n thi�t c�a bang h�i th�ng l�n c�p 1, ch�c n�ng T� ��n ph�n ph�t �i�m c�ng hi�n ���c m� ra.";
		Msg2Tong(nTongID, szMsg);
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	end
	if (nCurLevel == 4) then
		local nCitySTID = tong_GetCityStuntID(nTongID)
		local nday = getRelativeDay(nTongID)
		OutputMsg("UPGRade,"..nCitySTID..","..nday)
		if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) < TONG_GetWeek(nTongID)) then
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		end
		if (nCitySTID ~= 0) then
			if (TB_STUNTID_INFO[nCitySTID].right == 2) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
			else
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
			end
		end
	end
	--����������μ�¼
	local nNowLevel = nCurLevel + 1;
	if (nNowLevel == 2 or nNowLevel == 4) then
		local nOrder = gb_GetTask("TONG_LVL_UP_ORDER", nNowLevel) + 1
		gb_SetTask("TONG_LVL_UP_ORDER", nNowLevel, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_ORDER, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, -1)	
	end;
	return 1
end

function UPGRADE_G_1(nTongID)
	local nRet, rt_1, rt_2 = logicTongLevelUp(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
		Msg2Player("�� n�ng l�n c�p k� ti�p c�n ph�i x�y d�ng <color=yellow> "..rt_1.."<color> T�c Ph��ng")
	elseif (nRet == 2)then
		Msg2Player("��ng c�p ki�n th�t n�ng l�n c�p ti�p theo c�n T�c Ph��ng c� <color=yellow>"..rt_1.."<color> ��t <color=green>"..rt_2.."<color>")
	elseif (nRet == 3)then
		Msg2Player("��ng c�p ki�n thi�t n�ng l�n c�p ti�p theo c�n ng�n s�ch ki�n thi�t<color=gold>: "..rt_1.." v�n")
	elseif (nRet == 4)then
		Msg2Player("N�ng c�p ��ng c�p ki�n thi�t c�n ph�i c�ch nhau 1 tu�n!")
	elseif (nRet == 5)then
		Msg2Player("��ng c�p ki�n thi�t �� ��t ��n c�p cao nh�t!")
	elseif (nRet == 6)then
		Msg2Player("��ng c�p ki�n thi�t ��t c�p 3 c�n ph�i c� khu v�c bang h�i ri�ng!")		
	elseif (nRet == 7)then
		Msg2Player("��ng c�p ki�n thi�t ��t c�p 5 c�n chi�m l�nh 1 th�nh th�!")				
	end	
	return 0	
end
--UPGRADE_G_2 = DefFun1
--//////////////////
--��������ȼ��ﵽ4��5�������ӵ��ͼ��֮��
--//////////////////
function UPGRADE_G_2(nTongID)
--��ʱ��õĽ���ȼ�������ǰ�������󣿴˴�������������
	local nCurLevel = TONG_GetBuildLevel(nTongID) + 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nCurLevel < 4) then
		return 0
	else
		if (nMapIndex < 0) then
			return 0
		end
		if (nCurLevel == 4) then
			ClearMapNpcWithName(nMap, "C�t bi�u t��ng bang h�i");	--ɾ��ĳ����ͼID�ϵģ�ĳ�����ֵ�NPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			ClearMapNpcWithName(nMap, "C�t bi�u t��ng bang h�i");	--ɾ��ĳ����ͼID�ϵģ�ĳ�����ֵ�NPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng th�nh th")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nCitySTID ~= 0) then
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function logicTongDegrade(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel < 1)then
		return 1, nCurLevel
	end	
	return 0, nCurLevel
end
function DEGRADE_R(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet ~= 0)then
		return 0
	end	
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nWsUpperLevel = tongGetWorkshopUpperLevel(nTongID, nCurLevel - 1)
	--������������ʹ�õȼ�
	while(nWorkshop ~= 0)do
		if (TWS_GetUseLevel(nTongID, nWorkshop) > nWsUpperLevel)then
			TWS_ApplySetUseLevel(nTongID, nWorkshop, nWsUpperLevel)
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = "��ng c�p ki�n thi�t gi�m xu�ng "..(nCurLevel - 1).."c�p";
	TONG_ApplyAddHistoryRecord(nTongID, szRecord);		-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szRecord);		-- ����¼���¼
	cTongLog:WriteInfTB("TONG", "degrade", nTongID, {buildlevel = (nCurLevel - 1), day = TONG_GetDay(nTongID)})
	return 1
end
function DEGRADE_G_1(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
	end
	return 0
end
--DEGRADE_G_2 = DefFun1
function DEGRADE_G_2(nTongID)
--��ʱ��õĽ���ȼ�������ǰ�������󣿴˴�������������
	local nCurLevel = TONG_GetBuildLevel(nTongID) - 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nMapIndex < 0) then
		return 1
	end
	if (nCurLevel == 4) then	--5������4��ʱ��ͼ��Ҫ�����
		ClearMapNpcWithName(nMap, "C�t bi�u t��ng bang h�i");	--ɾ��ĳ����ͼID�ϵģ�ĳ�����ֵ�NPC
		ClearMapNpcWithName(nMap, "C�t bi�u t��ng th�nh th");	--ɾ��ĳ����ͼID�ϵģ�ĳ�����ֵ�NPC
		local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
		SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
		local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
		SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		if (nStuntID ~= 0) then
			AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
		end
	elseif (nCurLevel == 3) then	--����3��ʱ����û��ͼ����
		ClearMapNpcWithName(nMap, "C�t bi�u t��ng bang h�i");	--ɾ��ĳ����ͼID�ϵģ�ĳ�����ֵ�NPC
	end
	return 1
end


function TONGCLAIMWAR_R(nTongID, nDestTongID)
--	local nTimes    = 0;
--	local nCurTimes = 0;
--	local nCurDay = TONG_GetDay(nTongID);
--	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
--	if (nCurDay ~= nDay) then
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
--	elseif (nCurDay == nDay) then
--		nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
--	end;
	
	local nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	local nCurTimes = nTimes + 1;
	
	local nCostMoneyFund = 0;	--��λ:��
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then	
		Msg2Player("Bang h�i tuy�n chi�n c�n giao n�p"..nCostMoneyFund.." v�n l�y t� ng�n s�ch!");
		return 0;
	end;
	
	--��ս�ɹ��󣬴�����1������
	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);
	
	local szDestTongName = GetTongNameByID(nDestTongID);
	local szTongMsg = "Bang ch�  �� tuy�n chi�n bang h�i"..szDestTongName.." r�i";
	Msg2Tong(nTongID, szTongMsg);
	TONG_ApplyAddEventRecord(nTongID, szTongMsg);
	return 1;
end

function TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	-- Open bang h�i tuy�n chi�n Modifiled NgaVN - 20111124
--	do
--		return
--	end
	
	if (nTongID == nDestTongID) then
		Msg2Player("Kh�ng th� t� tuy�n chi�n bang h�i ch�nh m�nh!");
		return 0;
	end;
	
	local szDoFunc = "/#DO_TONGCLAIMWAR_G_1("..nTongID..","..nDestTongID..")"
	Say("X�c nh�n mu�n tuy�n chi�n?",2,"X�c nh�n"..szDoFunc, "�� ta suy ngh� l�i/cancel")
end

function DO_TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	local nTimes    = 0;
	local nCurTimes = 0;
	local nCurDay = TONG_GetDay(nTongID);
	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
	if (nCurDay ~= nDay) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
	elseif (nCurDay == nDay) then
		 nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	end;
	
	nCurTimes = nTimes + 1;	
	local nCostMoneyFund = 0;	--��λ:��
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_GetMoney(nTongID) < nCostMoneyFund * 10000) then
		Msg2Player("Tuy�n chi�n bang h�i c�n giao n�p"..nCostMoneyFund.." v�n l�y t� ng�n s�ch!");
		return 0;
	end;	
	
	--��relay������
--	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);	
-- Fix bang h�i tuy�n chi�n Modifiled AnhHH - 20111110
	TongClaimWar(nDestTongID);
	return 1;
end

function cancel()
end

TONGCLAIMWAR_G_2 = DefFun2

function ClaimWar_Death_Process(nAttackerIndex)
	local result = 0;	
	local szTong = 0;
	szTong, result = GetTong();
	
	local szAttackPlayer = GetNpcName(nAttackerIndex);
	local szDestTong     = GetNpcTong(nAttackerIndex);
	
	local szMsg = format("%s bang h�i c�a %s �� ti�u di�t %s bang h�i c�a %s", szDestTong, szAttackPlayer, szTong, GetName());
	Msg2SubWorld(szMsg);
end

function CHANGECAMP_R(nTongID, nCamp)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2PlayerByName(szExecutorName, "Kh�ng th� thay ��i phe ph�i trong li�n minh c�a bang h�i");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2PlayerByName(szExecutorName, "����ս�׶β��ܸı�����Ӫ��");
--		return 0;
--	end
	
	local nCostMoneyFund = 100;	-- ��λ���� ӦԽ����Ҫ���Ϊ100W by Zhi Dong
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, "��i phe c�nh cho bang c�n n�p ph� "..nCostMoneyFund.." v�n l�y t� ng�n s�ch!");
		return 0;
	end
	Msg2Tong(nTongID, "Bang ch� thay ��i phe ph�i c�a b�n bang! ");
	cTongLog:WriteInfTB("TONG", "changecamp", nTongID, {camp = nCamp, camp_old = nCurCamp})
	return 1;
end
function CHANGECAMP_G_1(nTongID, nCamp)
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2Player("Kh�ng th� thay ��i phe ph�i trong li�n minh c�a bang h�i");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("����ս�׶β��ܸı�����Ӫ��");
--		return 0;
--	end
	local nCostMoneyFund = 100; -- ��λ���� ӦԽ����Ҫ���Ϊ100W by Zhi Dong
	if (TONG_GetMoney(nTongID) < nCostMoneyFund*10000) then
		Msg2Player("��i phe c�nh cho bang c�n n�p ph� "..nCostMoneyFund.." v�n l�y t� ng�n s�ch!");
		return 0;
	end
	return 1;
end

--�����Լ�ά��
function Master_SelfCommend_Maintain(nTongID)
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		return	--��û�п����򷵻�
	end
	
	local dwIniDayTime = TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE);
	local dwCurrTime = GetSysCurrentTime();
	local nOweday = ceil((dwCurrTime - dwIniDayTime)/(24 * 3600 ))
	if (nOweday <= CAST_DURATION) then -- ��û�е�������
		return
	end
	
	Msg2Tong(nTongID, "Th�i gian t� ti�n c� �� k�t th�c");
	TONG_ApplyAddEventRecord(nTongID, "Th�i gian t� ti�n c� �� k�t th�c");
	local bRetireLoop = 0;
	local nMemberID  = TONG_GetFirstMember(nTongID, -1);
	--����ǰ3�������Էֱ�Ϊ��ԱID,��Ͷ������Ͷ����
	tbForecontributiveness = 
	{ 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime} 
	} 
	
	--����ǰ3����Ͷ���Ĺ��׶�
	while (nMemberID > 0) do
		local nContributiveness = TONGM_GetTaskValue(nTongID,nMemberID, TONGMTSK_CONTRIBUTIVENESS) --��ø��˹��׶�
		local dwContributivenesstime = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME)--��þ�Ͷʱ��
		if (nContributiveness > tbForecontributiveness[3][2] or 
			(nContributiveness == tbForecontributiveness[3][2] and 
			dwContributivenesstime < tbForecontributiveness[3][3] and
			nContributiveness > 0) and --��֤�μ��˾�Ͷ
			dwContributivenesstime > dwIniDayTime	--��֤�Ǳ��ξ�Ͷ����������һ�ε�
			) then
				tbForecontributiveness[3][1] = nMemberID
				tbForecontributiveness[3][2] = nContributiveness
				tbForecontributiveness[3][3] = dwContributivenesstime
				if ((tbForecontributiveness[3][2] > tbForecontributiveness[2][2]) or
					(tbForecontributiveness[3][2] == tbForecontributiveness[2][2] and
					tbForecontributiveness[3][3] < tbForecontributiveness[2][3])) then
					tbForecontributiveness[2],tbForecontributiveness[3] = tbForecontributiveness[3],tbForecontributiveness[2];
						if ((tbForecontributiveness[2][2] > tbForecontributiveness[1][2]) or
        					(tbForecontributiveness[2][2] == tbForecontributiveness[1][2] and
        					tbForecontributiveness[2][3] < tbForecontributiveness[1][3])) then
        					tbForecontributiveness[1], tbForecontributiveness[2] = tbForecontributiveness[2], tbForecontributiveness[1];
        				end 
        		end 
        end 

        --��Ա���������0
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, 0);
		if (bRetireLoop == 0) then
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, -1);	--������һ����Ա
			if (nMemberID == 0) then
				nMemberID = TONG_GetFirstMember(nTongID, 4);		--������һ����ʿ
				bRetireLoop = 1;
			end
		else
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, 4);	--������һ����ʿ
		end
	end  --end while

	
	--����ǰ3��
	for i = 1, 3 do
		if (tbForecontributiveness[i][1] ~= 0 and tbForecontributiveness[i][2] ~= 0) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[i][1])
			local szDateTime = FormatTime2String(tbForecontributiveness[i][3])
			local szMsg = "h�ng th� "..i.." "..szMember.." S� tranh c�: "..tostring(tbForecontributiveness[i][2]).." Th�i gian tranh c�: "..szDateTime;
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end 
	
	--�����µİ���
	if (tbForecontributiveness[1][1] == 0) then
			Msg2Tong(nTongID, "L�n tranh c� ch�c bang ch� n�y kh�ng ch�n ���c ng��i th�ch h�p.");
	else
		if (TONG_GetFirstMember(nTongID, 0) == tbForecontributiveness[1][1] or
			SetTongMaster(nTongID, tbForecontributiveness[1][1]) == 1) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[1][1]);
			Msg2Tong(nTongID, "Bang ch� nhi�m v� m�i c�a bang s� l� "..tostring(szMember).."S� �i�m tranh c� c�a bang ch� m�i l�: "..tostring(tbForecontributiveness[1][2]));
			TONG_ApplyAddHistoryRecord(nTongID, "Bang ch� nhi�m v� m�i c�a bang s� l� "..tostring(szMember).."S� �i�m tranh c� c�a bang ch� m�i l�: "..tostring(tbForecontributiveness[1][2]));
		else
			local tbMsg = {
				masterid     = tbForecontributiveness[1][1]
				};
			cTongLog:WriteErrTB("TONG", "master_bidding", nTongID, tbMsg);
		end
	end
	
	--�����������
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, 0);
end


--function CHANGECAMP_C_1(nTongID, nCamp)
--	local nCurCamp =TONG_GetCurCamp(nTongID);
--	if (nCurCamp == nCamp or nCurCamp < 1 or nCurCamp > 3) then
--		return 0;
--	end
--	if (TONG_GetUnionID(nTongID) ~= 0) then
--		Msg2Player("��������У������޸���Ӫ��");
--		return 0;
--	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("����ս�׶β��ܸı�����Ӫ��");
--		return 0;
--	end
--	return 1;
--end
CHANGECAMP_G_2 = DefFun2

---------�ͻ��˵�ȫ�����⡣����������������������
else
INIT_C_1 = DefFun1
INIT_C_2 = DefFun1
ADD_C_1 = DefFun2
ADD_C_2 = DefFun2
REMOVE_C_1 = DefFun1
REMOVE_C_2 = DefFun1
WEEKLY_MAINTAIN_C_1 = DefFun1
WEEKLY_MAINTAIN_C_2 = DefFun1
MAINTAIN_C_1 = DefFun1
MAINTAIN_C_2 = DefFun1
UPGRADE_C_1 = DefFun1
UPGRADE_C_2 = DefFun1
DEGRADE_C_1 = DefFun1
DEGRADE_C_2 = DefFun1
CHANGECAMP_C_1 = DefFun2
CHANGECAMP_C_2 = DefFun2
TONGCLAIMWAR_C_1 = DefFun2
TONGCLAIMWAR_C_2 = DefFun2	
end