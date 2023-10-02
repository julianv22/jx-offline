function DEF_FUN(nTongID, nID)
	return 1
end

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
Include("\\script\\tong\\workshop\\workshop_logic.lua")
Include("\\script\\tong\\workshop\\workshop_def.lua")
Include("\\script\\tong\\log.lua")

if (MODEL_GAMESERVER == 1) then --�����GameServer
	Include("\\script\\tong\\addtongnpc.lua");
	Include([[\script\tong\workshop\tongcolltask.lua]]);--�����������ͷ�ļ�
end

function SVR_CheckUse(nTongID, nWorkshopID, szName)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		if (GetTask(TASK_LP_COUNT) ~= 0) then --����а��������������
			local nRwlp = rwlp_taskcheck(nTongID, nWorkshopID);
			local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).." -c�p<color> ";
			local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Ph��ng t�ng qu�n<color>";
			if (nRwlp == 2) then --�����ͼ�ǶԵ�
				Say("H�nh nh� ng��i �ang l�m nhi�m v� l�nh b�i, nhanh ch�ng t�m  "..szZGName.."xem �ng �y c� gi�p ���c g� cho ng��i kh�ng.", 0);
				Msg2Player("T�m ��i tho�i "..szZGName.."trong ph�m vi khu v�c.");
			elseif (nRwlp == 0) then --
				Say("H�nh nh� ng��i �ang l�m nhi�m v� l�nh b�i, nh�ng t�ng qu�n khu v�c chung kh�ng qu�n l� vi�c <color=yellow>th� ti�n c�<color> n�y, h�y ��n bang h�i kh�c t�m "..szZGName.."xem �ng �y c� gi�p ���c g� cho ng��i kh�ng.", 0);
				Msg2Player("Kh�ng th� t�m th�y <color=yellow>th� ti�n c�<color> t�i khu v�c chung.");
			elseif (nRwlp == 1) then --
				rwlp_dedaojianshu(nTongID, nWorkshopID);
			end;
		else
			Say("��y kh�ng ph�i l� l�nh ��a qu� bang, kh�ng th� s� d�ng T�c Ph��ng n�y.", 0);
		end;
		return 0
	end
	if (nWorkshopID <= 0) then
		Say("Qu� bang d��ng nh� ch�a x�y d�ng T�c Ph��ng n�y.", 0)
		return 0
	end	
	if (TWS_GetUseLevel(nTongID, nWorkshopID) < 1) then
		Say("��ng c�p t�c ph��ng n�y l� 0, t�m th�i kh�ng th� s� d�ng", 0);
		return 0;
	end
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1) then
		Say(szName..": Bang h�i ta ch�a x�y d�ng t�c ph��ng n�y, mu�n s� d�ng ph�i �i t�m bang ch� ho�c tr��ng l�o khai m�.", 0);
		return 0;
	end	
	if TONG_GetPauseState(nTongID) ~= 0 then
		Say(szName..": T�c Ph��ng �ang t�m ng�ng ho�t ��ng.", 0);
		return 0;
	end
	return 1
end

function RL_DoLevelUp(nTongID, nID, nToLevel)
	if (logicWorkShopLevelUp(nTongID, nID, nToLevel) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local nCost = wsGetUpgradeCostFund(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	
	-- �����ʷ/�¼���¼��֪ͨ
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szRecord = wsGetName(eType).."Th�ng l�n c�p "..nToLevel.."c�p";
	local szRecordPlus;
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." l�m cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "upgrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1;
end

function RL_DoDegrade(nTongID, nID, nToLevel)
	--ȡ����������
	do return 0 end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	--ʹ�õȼ�
	if TWS_GetUseLevel(nTongID, nID) > nToLevel then
		TWS_ApplySetUseLevel(nTongID, nID, nToLevel)
	end
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nToLevel, bOpen) - 
			wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen);			
	--��ά��ս������仯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)
	
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = wsGetName(eType).."Gi�m xu�ng c�p"..nToLevel.."c�p";
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
		
	cTongLog:WriteInfTB("WORKSHOP", "degrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1	
end

function RL_DoOpen(nTongID, nID)
	if (logicWorkShopOpen(nTongID, nID) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCost = wsGetOpenCost(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--��ά��ս������仯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = wsGetName(eType).."Khai m� l�i";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." l�m cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "open", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--��ά��ս������仯
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)	
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = wsGetName(eType).."��ng";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." l�m cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "close", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoDestroy(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopDestroy(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen)
	--��ά��ս������仯
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)
	
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = wsGetName(eType).."H�y b�";
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
	
	cTongLog:WriteInfTB("WORKSHOP", "destroy", nTongID, {workshopid = nID, typename = wsGetName(eType), level = TWS_GetLevel(nTongID, nID)})
	
	return 1
end

function RL_DoLearn(nTongID, eType)
	if (logicWorkShopLearn(nTongID, eType) ~= 0) then
		return 0
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, 0)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, 1, 1);
	--��ά��ս������仯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- �����ʷ/�¼���¼��֪ͨ
	local szRecord = "�� x�y d�ng"..wsGetName(eType);
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- ����¼���¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "learn", nTongID, {typename = wsGetName(eType)})
	
	return 1
end

function SVR_CheckLevelUp(nTongID, nID, nToLevel)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopLevelUp(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("T�c ph��ng n�y �� ��t ��n c�p cao nh�t, mu�n n�ng c�p t�c ph��ng c�n ph�i n�ng ��ng c�p ki�n thi�t tr��c!")
	elseif (nRet == 2) then
		Msg2Player("Ng�n s�ch ki�n thi�t bang kh�ng ��, kh�ng th� n�ng c�p t�c ph��ng n�y.")
	elseif (nRet == 3) then
		Msg2Player("Bang h�i �ang t�m ng�ng ho�t ��ng, kh�ng th� n�ng c�p t�c ph��ng!")	
	elseif (nRet == 4) then
		Msg2Player("Sau khi n�ng c�p, ng�n s�ch chi�n b� th�p h�n ng�n s�ch b�o tr� h�ng tu�n, kh�ng th� n�ng c�p t�c ph��ng n�y!")	
	end	
	return 0
end

function SVR_DoLevelUp(nTongID, nID, nToLevel)
		--ʹ�õȼ�
	Say("Ng��i c� th� n�ng ��ng c�p s� d�ng t�c ph��ng b�ng v�i ��ng c�p t�c ph��ng, c� ��ng � kh�ng?", 2, "Mu�n/#SetUSeLevel("..nTongID..","..
		nID..")", "Kh�ng mu�n/cancel")
	return 1
end

function SetUSeLevel(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	if nLevel > 0 then
		TWS_ApplySetUseLevel(nTongID, nID, nLevel)
		TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
	end
	Msg2Player("��ng c�p s� d�ng t�c ph��ng ���c n�ng l�n b�ng v�i ��ng c�p t�c ph��ng!")
end

function SVR_CheckOpen(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopOpen(nTongID, nID)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
	elseif (nRet == 2) then
		Msg2Player("Bang h�i �ang t�m ng�ng ho�t ��ng, kh�ng th� khai m� t�c ph��ng!")
	elseif (nRet == 3) then
		Msg2Player("Ng�n s�ch ki�n thi�t bang kh�ng ��, kh�ng th� khai m� t�c ph��ng n�y!")
	elseif (nRet == 4) then
		Msg2Player("Sau khi khai m�, ng�n s�ch chi�n b� th�p h�n ng�n s�ch b�o tr� h�ng tu�n, kh�ng th� khai m� t�c ph��ng n�y!")	
	end
	return 0
end

function SVR_DoOpen(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckClose(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	return 1
end

function SVR_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckDestroy(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDestroy(nTongID, nID)
	if (nRet == 0) then
		return 1
	end	
	return 0
end

function SVR_DoDestroy(nTongID, nID)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		DelNpc(npcid)
		TWS_GetBuildingNpc(nTongID, nID, 0)
	end
	return 1
end

function SVR_CheckLearn(nTongID, eType)
	if nTongID == 0 then
		return 0
	end
	local nRet = logicWorkShopLearn(nTongID, eType)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("S� l��ng t�c ph��ng �� ��t gi�i h�n, mu�n x�y d�ng th�m c�n ph�i n�ng ��ng c�p ki�n thi�t l�n!")	
	elseif (nRet == 2) then
		Msg2Player("T�c ph��ng n�y �� c� r�i!")
	elseif (nRet == 3) then
		Msg2Player("Bang h�i t�m ng�ng ho�t ��ng, kh�ng th� x�y d�ng t�c ph��ng!")
	elseif (nRet == 4) then
		Msg2Player("Ng�n s�ch ki�n th�t kh�ng ��, kh�ng th� th�nh l�p t�c ph��ng n�y!")
	elseif (nRet == 5) then
		Msg2Player("Sau khi x�y d�ng, ng�n s�ch chi�n b� th�p h�n ng�n s�ch b�o tr� h�ng tu�n, kh�ng th� x�y d�ng t�c ph��ng n�y!")	
	end
	return 0
end

--DoLearn��GS�����������ŵ��õ�
function SVR_DoLearn(nTongID, nWorkshopID)
	local eType = TWS_GetType(nTongID, nWorkshopID)
	if (eType == 0)then
		_dbgMsg("SVR_DoLearn: ERRORRORORR")
		return 0
	end
	local nMapID = TONG_GetTongMap(nTongID)
	--�ް���ͼ��Ƕ�̬��ͼ
	if (nMapID < DYNMAP_ID_BASE)then
		return 1
	end
	nMapID = SubWorldID2Idx(nMapID)
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	--��ͼ���ڴ˷�����
	if (nMapID < 0 or nMapCopy <= 0)then
		return 1
	end
	local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
	_dbgMsg("add building npcid:"..npcid)
	if (npcid > 0)then
		TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
	end
	return 1
end 

function SVR_CheckDegrade(nTongID, nID, nToLevel)
	--ȡ����������
	do return 0 end
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("T�c ph��ng �� � c�p th�p nh�t, kh�ng th� gi�m c�p n�a!")
	end
	return 0	
end

function SVR_DoDegrade(nTongID, nID, nToLevel)
	return 1
end 

SET_USELEVELSET_R = DEF_FUN
SET_USELEVELSET_G_1 = DEF_FUN
function SET_USELEVELSET_G_1(nTongID, nID)
	SetULConfirm(nTongID, nID)
	return 0
end

function SetULConfirm(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCurLevelSet = TWS_GetUseLevelSet(nTongID, nID)
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
	if nCurLevelSet <= 0 then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nCurLevel)then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nUpperLevel) then	
		nCurLevelSet = nUpperLevel
	end
	local eType = TWS_GetType(nTongID, nID)
	Say("<#>Hi�n t�i, <color=yellow>"..wsGetName(eType).."<color>��ng c�p th�c t� l� <color=blue>"..
		nLevel.."<color>, ��ng c�p s� d�ng l� <color=blue>"..nCurLevel.."<color>\n �� ���c �i�u ch�nh ��ng c�p s� d�ng, "..
		"sau khi <color=red>b�o tr� h�ng tu�n<color> s� c� hi�u l�c, ��ng c�p s� d�ng hi�n t�i l� <color=blue>"..nCurLevelSet.."<color>, "..
		"ng��i mu�n �i�u ch�nh ��ng c�p s� d�ng cho tu�n sau th� n�o?",3,"C�p 1 ��n 5/#SetUseLevelSet("..nTongID..","..nID..",1)",
		"C�p 6 ��n 10/#SetUseLevelSet("..nTongID..","..nID..",2)", "Ta mu�n r�i kh�i!/cancel")
end

function SetUseLevelSet(nTongID, nID, nFlag)
	if nFlag == 1 then
		Say("H�y l�a ch�n ��ng c�p:  ", 6, "C�p 1/#SUS_Chose("..nTongID..","..nID..",1)", "C�p 2/#SUS_Chose("..nTongID..","..nID..",2)",
			"C�p 3/#SUS_Chose("..nTongID..","..nID..",3)", "C�p 4/#SUS_Chose("..nTongID..","..nID..",4)",
			"C�p 5/#SUS_Chose("..nTongID..","..nID..",5)", "Tr� l�i/#SetULConfirm("..nTongID..","..nID..")")
	elseif nFlag == 2 then
		Say("H�y l�a ch�n ��ng c�p:  ", 6, "C�p 6/#SUS_Chose("..nTongID..","..nID..",6)", "C�p 7/#SUS_Chose("..nTongID..","..nID..",7)",
			"C�p 8/#SUS_Chose("..nTongID..","..nID..",8)", "C�p 9/#SUS_Chose("..nTongID..","..nID..",9)",
			"C�p 10/#SUS_Chose("..nTongID..","..nID..",10)", "Tr� l�i/#SetULConfirm("..nTongID..","..nID..")")
	end
end

function SUS_Chose(nTongID, nID, nLevel)
	local nWsLevel = TWS_GetLevel(nTongID, nID)
	if (nLevel > nWsLevel)then
		Say("��ng c�p s� d�ng ���c ch�n kh�ng th� l�n h�n ��ng c�p t�c ph��ng hi�n t�i", 1, "Bi�t r�i/cancel")
		return
	end
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))	
	if (nLevel > nUpperLevel)then
		Say("��ng c�p s� d�ng t�c ph��ng hi�n t�i c�a qu� bang s� gi�i h�n � c�p: <color=red>"..nUpperLevel.."<color>3. Kh�ng th� ch�n ��ng c�p cao h�n ��ng c�p n�y.", 1, "Bi�t r�i/cancel")
		return
	end
	local eType = TWS_GetType(nTongID, nID)
	local szMsg = "<color=white>"..GetName().."<color>thi�t l�p <color=red>"..wsGetName(eType)..
	"<color> ��ng c�p s� d�ng l� <color=green>"..nLevel.."<color>, ".."Thay ��i n�y s� c� hi�u l�c sau m�t tu�n"
	Msg2Tong(nTongID, szMsg)
	-- ����¼���¼
	TONG_ApplyAddEventRecord(nTongID, GetName().."Thi�t l�p "..wsGetName(eType).." ��ng c�p s� d�ng hi�n t�i l� "..nLevel.."c�p");
	TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
end

SET_USELEVEL_R = DEF_FUN
SET_USELEVEL_G_1 = DEF_FUN
function SET_USELEVEL_G_2(nTongID, nID, nToLevel)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		if nToLevel > 0 then
			local eType = TWS_GetType(nTongID, nID)
			ChangeNpcFeature(npcid, 0, 0, building_figure[eType][nToLevel])
		else
			DelNpc(npcid)
			TWS_SetBuildingNpc(nTongID, nID, 0)
		end	
	elseif nToLevel > 0 then
		local nMapID = TONG_GetTongMap(nTongID)
		local eType = TWS_GetType(nTongID, nID)
		--�ް���ͼ��Ƕ�̬��ͼ
		if (nMapID < DYNMAP_ID_BASE)then
			return 1
		end
		nMapID = SubWorldID2Idx(nMapID)
		local nMapCopy = TONG_GetTongMapTemplate(nTongID)
		--��ͼ���ڴ˷�����
		if (nMapID <= 0 or eType == 0 or nMapCopy <= 0)then
			return 1
		end
		local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
		_dbgMsg("add building npcid:"..npcid)
		if (npcid > 0)then
			TWS_SetBuildingNpc(nTongID, nID, npcid)
		end
	end
	return 1
end

function cancel()
end
	
else
-----------------����ǿͻ���---------------
Include("\\script\\tong\\workshop\\workshop_setting.lua")
SET_USELEVELSET_C_1 = DEF_FUN
SET_USELEVELSET_C_2 = DEF_FUN
SET_USELEVEL_C_1 = DEF_FUN
SET_USELEVEL_C_2 = DEF_FUN
end	--if����

--Ĭ�ϵĴ�������Ҫ���ؿ����¸�ֵ
LEARN_R		= RL_DoLearn
LEARN_G_1	= SVR_CheckLearn
LEARN_G_2	= SVR_DoLearn
LEARN_C_1	= DEF_FUN
LEARN_C_2	= DEF_FUN

REMOVE_R	= RL_DoDestroy
REMOVE_G_1	= SVR_CheckDestroy
REMOVE_G_2	= SVR_DoDestroy
REMOVE_C_1	= DEF_FUN
REMOVE_C_2	= DEF_FUN

OPEN_R		= RL_DoOpen
OPEN_G_1	= SVR_CheckOpen
OPEN_G_2	= SVR_DoOpen
OPEN_C_1 	= DEF_FUN
OPEN_C_2 	= DEF_FUN

CLOSE_R		= RL_DoClose
CLOSE_G_1	= SVR_CheckClose
CLOSE_G_2	= SVR_DoClose
CLOSE_C_1 	= DEF_FUN
CLOSE_C_2 	= DEF_FUN

UPGRADE_R	= RL_DoLevelUp
UPGRADE_G_1	= SVR_CheckLevelUp
UPGRADE_G_2	= SVR_DoLevelUp
UPGRADE_C_1 = DEF_FUN
UPGRADE_C_2 = DEF_FUN

DEGRADE_R	= RL_DoDegrade
DEGRADE_G_1	= SVR_CheckDegrade
DEGRADE_G_2	= SVR_DoDegrade
DEGRADE_C_1 = DEF_FUN
DEGRADE_C_2 = DEF_FUN

--MAINTAIN_R	 = DEF_FUN
MAINTAIN_G_1 = DEF_FUN
MAINTAIN_G_2 = DEF_FUN
MAINTAIN_C_1 = DEF_FUN
MAINTAIN_C_2 = DEF_FUN