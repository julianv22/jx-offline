--tong_action.lua
--��������������ʵĽӿ�
function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")

if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end

-------------------�ʽ�ת����ϵ----------------------
--��ȡǮ
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.." �� ��ng g�p "..nAdd.." l��ng v�o ng�n qu� bang h�i"
	else
		szMsg = szMember.." �� r�t t� ng�n qu� bang h�i"..(-nAdd).." l��ng"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end

function APPLY_JOIN_TONG(nTongID, szApplyerName)
	if szApplyerName == nil then
		return 0
	end
	
	local szMsg = szApplyerName.." G�i l�i m�i gia nh�p bang h�i"
	Msg2Tong(nTongID, szMsg)
	return 1
end

function SAVE_ZHAO_MU(nTongID)	
	local szMsg = "C�p nh�t th�nh c�ng tin t�c chi�u m� bang h�i!"
	Msg2Tong(nTongID, szMsg)
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	if (CheckGlobalTradeFlag() == 0) then
		return 0
	end
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("Kh�ng �� ng�n l��ng!")
		return 0
	end
	local nMax = 2000000000	--20��
	if (abs(nAdd) > nMax) then
		Msg2Player("Ng�n l��ng n�p v�o qu� nhi�u!")
		return 0
	end
	--�ȸ�Ǯ�ټ��ʽ�
	if (nAdd > 0)then	--��Ǯ
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else				--ȡǮ
		if nCash > nMax + nAdd then --ȡ�������nMax
			Msg2Player("Kh�ng th� r�t ng�n l��ng! S� ng�n l��ng trong h�nh trang s� v��t m�c cho ph�p!")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	--�ȿ��ʽ��ٸ�Ǯ
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end

--����ʽ�ת�������
function MONEYFUND2BUILDFUND_R(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	local nAdd = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	if (nCurFund +  nAdd > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		return 0
	end
	if (TONG_ApplyAddMoney(nTongID, -nOffer) == 1 and TONG_ApplyAddBuildFund(nTongID, nAdd) == 1)then
		TONG_ApplyAddWeekBuildFund(nTongID, nAdd)
		local szMember = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMember.." l�m cho"..nOffer.."Ng�n s�ch bang chuy�n "..nAdd.." v�n l��ng v�o ng�n s�ch ki�n thi�t"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("Ng�n s�ch bang h�i kh�ng ��")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("Chuy�n kho�n t�i thi�u l� 1 v�n l��ng!")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("Kh�ng th� chuy�n ng�n, v� s� l�m ng�n s�ch ki�n thi�t bang v��t qu� gi�i h�n tu�n!")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2

--�������תս������
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." l�m cho"..nOffer.." v�n ng�n s�ch ki�n thi�t chuy�n sang ng�n s�ch chi�n b�."
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("Ng�n s�ch ki�n thi�t bang kh�ng ��!")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2

--��Ա��Ǯת�������
function MONEY2BUILDFUND_R(nTongID, nOffer)
	local nTotalBuildfundAdd = floor(nOffer / 10000)
	local nBuildfundAdd = 0
	local nStoredAdd = 0
	local nCurBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	if (nCurBuildFund >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd
		nBuildfundAdd = 0
	elseif (nCurBuildFund + nTotalBuildfundAdd >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd -  (nWeekBuildUpper - nCurBuildFund)
		nBuildfundAdd = nTotalBuildfundAdd - nStoredAdd
	else
		nStoredAdd = 0
		nBuildfundAdd = nTotalBuildfundAdd
	end
	if (nBuildfundAdd > 0)then
		TONG_ApplyAddBuildFund(nTongID, nBuildfundAdd)
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildfundAdd)
	end
	if (nStoredAdd > 0)then
		TONG_ApplyAddStoredBuildFund(nTongID, nStoredAdd)
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." �� ��ng g�p "..(nOffer / 10000).." v�n l��ng v�o ng�n s�ch ki�n thi�t bang"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("M�i l�n quy�n g�p t�i thi�u l� 1 v�n l��ng!")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("Ng�n l��ng kh�ng ��!")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("�n s� kh�ng th� ��ng g�p!")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("Kh�ng th� ��ng g�p, v� l�m cho �i�m c�ng hi�n t�ch l�y s� v��t qu� gi�i h�n tu�n!")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("B�n ��ng g�p <color=gold>"..nOffer.."<color>Ng�n l��ng ��n bang h�i l�p qu�, ��ng th�i nh�n ���c<color=green>"..nContribution.."<color>Nh�n v�o �� c�ng hi�n")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2

--��Ա���׶�ת�������׶�
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	-- if (TONG_ApplyAddStoredOffer(nTongID, nOffer) ~= 1)then
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." �� ��ng g�p "..nOffer.." �i�m c�ng hi�n v�o ng�n s�ch c�ng hi�n bang"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	-- �۳����׶�ʱ����relay���룬��ΪrelayҲ��ִ����Ӧ�ű����� wangbin 2009-4-13
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("�i�m c�ng hi�n kh�ng ��!")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3

-- �������׶�ת��Ա���׶ȣ�Ⱥ����
g_szFigure = { "To�n th� bang h�i", "Bang ch� ", "Tr��ng L�o", "��i tr��ng", "�� t� ", "�n s�" }
function STOREOFFER2CONTRIBUTION1_R(nTongID, nFigure, nOffer)
	if (TONG_IsExist(nTongID) ~= 1)then
		return 0
	end
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	-- if (TONG_GetStoredOffer(nTongID) >= nCounts * nOffer)then
		-- if (TONGM_ApplyAddOfferEx(nTongID, nFigure, nOffer) ~= 1)then		
		--	return 0
		-- end		
		-- if (TONG_ApplyAddStoredOffer(nTongID, -nCounts * nOffer) ~= 1)then
		-- return 0
		-- end	
	if (TONG_DistributeOfferToGroup(nTongID, nFigure, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMaster.."Th�nh vi�n tr�n m�ng"..g_szFigure[nFigure+2].."("..nCounts.." ng��i) ���c ph�n ph�t "..nOffer.." �i�m c�ng hi�n!"
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("Ng�n s�ch c�ng hi�n kh�ng �� �� ph�t!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3

-- �������׶�ת��Ա���׶ȣ����ˣ�
function STOREOFFER2CONTRIBUTION2_R(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		return 0
	end
	-- if (TONG_GetStoredOffer(nTongID) >= nOffer)then
	-- 	TONG_ApplyAddStoredOffer(nTongID, -nOffer)
	-- 	TONGM_ApplyAddOffer(nTongID, nMemberID, nOffer)
	if (TONG_DistributeOfferToMember(nTongID, nMemberID, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = format("%s ph�t cho %s %d �i�m c�ng hi�n d� tr�",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("Ng�n s�ch �i�m c�ng hi�n ch� c� th� ph�t cho th�nh vi�n trong bang!")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("Ng�n s�ch c�ng hi�n kh�ng ��!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3

-- ��Ա���߳����
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].." kh�ng th� b� tr�c xu�t!");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." tr�c xu�t "..szMember.." ra kh�i bang h�i!"
		Msg2Tong(nTongID, szMsg)
		--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼	
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	-- �۵�5%���׶ȣ�����ȡ����
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	--ս�����𲻹���
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	--����������
	if (nStoredBuildFund < nBuildDec)then
		--�ټӽ��軹�ǲ�����
		if (nBuildFund < nBuildDec - nStoredBuildFund)then
			return 0
		end
		TONG_ApplyAddStoredBuildFund(nTongID, -nStoredBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nStoredBuildFund - nBuildDec)
	else
		TONG_ApplyAddStoredBuildFund(nTongID, -nBuildDec)		
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nBuildDec)
	TONG_ApplyAddWarBuildFund(nTongID, -nWarBuildDec)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nWarBuildDec)
	--��������
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." tr�c xu�t "..szMember.." tr�c xu�t kh�i bang h�i, ng�n s�ch ki�n thi�t d� tr� gi�m"..nBuildDec..
		" v�n, ng�n s�ch chi�n b� gi�m"..nWarBuildDec.." v�n!"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "Khi tr�c xu�t ng��i ng�n s�ch ki�n thi�t d� tr� kh�ng ��, ph�n thi�u h�t s� kh�u tr� v�o ng�n s�ch ki�n thi�t!")	
	end
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼	
	cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember, builddec = nBuildDec, warbuilddec = nWarBuildDec})
	return 1
end
function MEMBER_KICK_G_1(nTongID, nMemberID, nFlag)
	
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].." kh�ng th� b� tr�c xu�t!");
		return 0;
	end
	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	--�޳�����Ա�ļ���
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	--�޳�����Ա�ļ�������
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						--��ǰ����
	
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("M�i ng�y ch� ���c gi�i t�n %d bang ch�ng!",MAX_KICK_COUNT);
		Msg2Player(szMsg);
		return 0;
	end
	
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0)then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nFlag == 1)then
		Say("<#>Tr�c xu�t th�nh vi�n s� kh�u tr� ng�n s�ch ki�n thi�t d� tr� c�a bang"..nBuildDec.." v�n (n�u ng�n s�ch ki�n thi�t d� tr� kh�ng �� s� tr� v�o ng�n s�ch ki�n thi�t) v� ng�n s�ch chi�n b�"..nWarBuildDec.." v�n, c� ��ng � kh�ng?", 
			2, "Tr�c xu�t/#KickConfirm("..nTongID..","..nMemberID..")", "H�y b� /#Cancel")
	elseif (nFlag == 2)then
		--ս�����𲻹���
		if (nWarFund < nWarBuildDec)then
			Msg2Player("Sau khi tr�c xu�t th�nh vi�n, ng�n s�ch chi�n b� s� kh�u tr� th�nh s� �m, t�m th�i kh�ng th� tr�c xu�t th�nh vi�n!")
			return 0
		end
		--����������
		if (nStoredBuildFund < nBuildDec)then
			--�ټ�ս�����ǲ�����
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("Sau khi tr�c xu�t th�nh vi�n, ng�n s�ch ki�n thi�t s� kh�u tr� th�nh s� �m, t�m th�i kh�ng th� tr�c xu�t th�nh vi�n!")
				return 0
			end
		end	
		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	-- ֱ����relay�۳�5%���׶ȡ� wangbin 2009-4-15
	--ע�⵱ǰ��PlayerID�Ǳ�����
	-- local nContribution = GetContribution()
	-- local nDel = (nContribution + 20 - 1) / 20	--�۵�5%���׶ȣ�����ȡ����
	-- AddContribution(-nDel)
	return 1
end
function KickConfirm(nTongID, nMemberID)
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
end

-- ��Ա����
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "B�n ";
			end
			Msg2PlayerByName(szExecutorName, szPerson.." ��m nhi�m ch�c v� quan tr�ng, kh�ng th� tho�i �n, ch� c� ��i tr��ng v� bang ch�ng m�i c� th� tho�i �n!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "Tr��c m�t s� ng��i tho�i �n c�a bang �� ��t gi�i h�n, kh�ng th� ti�p t�c s� d�ng thao t�c tho�i �n"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "Ch� c� th� cho tho�i �n ��i v�i th�nh vi�n kh�ng l�n m�ng t� "..TONGMEMBER_RETIRE_REQUIRE_DAY.." ng�y tr� l�n!");
					return 0;
			end
			szMsg = szExecutorName.." vs "..szMemberName.."Ti�n h�nh thao t�c tho�i �n"
		else
			szMsg = szMemberName.."Tho�i �n kh�i bang h�i"
		end
		Msg2Tong(nTongID, szMsg);
		TONGM_ApplySetRetireDate(nTongID, nMemberID, nTodayDate);
		cTongLog:WriteInfTB("MEMBER", "retire", nTongID, {member = szMemberName})
	elseif (bRetireOrNot == 0) then
		if (nFigure ~= 4) then
			cTongLog:WriteErr("MEMBER", "unretire", nTongID, {member = szMemberName})
			return 0;
		end
		if (nTodayDate - TONGM_GetRetireDate(nTongID, nMemberID) < TONGMEMBER_UNRETIRE_REQUIRE_DAY) then
			Msg2PlayerByName(szExecutorName, "K� t� ng�y tho�i �n"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.." ng�y sau ng�y tho�i �n m�i c� th� h�y b� tho�i �n!");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "H�y b� tho�i �n th�nh c�ng!");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0���������ά��
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1;
end
function MEMBER_RETIRE_G_1(nTongID, nMemberID, bRetireOrNot)
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		local szMemberName = TONGM_GetName(nTongID, nMemberID);
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (GetTongMemberID() == nMemberID) then
				szPerson = "B�n ";
			end
			Msg2Player(szPerson.." ��m nhi�m ch�c v� quan tr�ng, kh�ng th� tho�i �n, ch� c� ��i tr��ng v� bang ch�ng m�i c� th� tho�i �n!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("Tr��c m�t s� ng��i tho�i �n c�a bang �� ��t gi�i h�n, kh�ng th� ti�p t�c s� d�ng thao t�c tho�i �n");
			return 0;
		end
	else
		if (nFigure ~= 4) then	-- ������ʿ����������
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3

-- ��Ա������
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	-- ����
	if (bOnline == 1) then
	-- ����
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3

function MEMBER_REMOVE_R(nTongID, nMemberID)
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	--0���������ά��
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_REMOVE_G_1 = DefFun2
MEMBER_REMOVE_G_2 = DefFun2

-- ��Ա������
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.." gia nh�p b�n bang, ng�n s�ch ki�n thi�t d� tr� bang h�i t�ng"..nBuildAdd..
		" v�n, ng�n s�ch chi�n b� t�ng"..nWarBuildAdd.." v�n!"
	Msg2Tong(nTongID, szMsg)
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	--��ά��ս���������
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0���������ά��
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_ADD_G_1 = DefFun3
MEMBER_ADD_G_2 = DefFun3

function MEMBER_SETFIGURE_R(nTongID, nMemberID, nFigure)
	if (nFigure == TONG_ELDER)then
		if TONG_GetMemberCount(nTongID, TONG_ELDER) >= MAX_ELDER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� l��ng tr��ng l�o �� ��t gi�i h�n!");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "S� l��ng ��i tr��ng �� ��t gi�i h�n!");
			end					
			return 0	
		end
	end
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "setfigure", nTongID, {member = szMember, figure = nFigure});
	return 1
end
MEMBER_SETFIGURE_G_1 = DefFun3
MEMBER_SETFIGURE_G_2 = DefFun3

-- ���õ�ͼ
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "�� c� khu v�c bang h�i chung, nh�p v�o n�t <V�o b�n bang> �� �i v�o khu v�c n�y!"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- �����ʷ��¼
	TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
	cTongLog:WriteInfTB("MAP", "set", nTongID, {mapid = nMapID});
	return 1
end
MAP_SET_G_1	= DefFun2
MAP_SET_G_2	= DefFun2

function GenParam(aInfo)
	local i = aInfo[1]
	aInfo[1] = i+1
	local mapcopy = aDynMapCopy[i]
	return aDynMapCopyName[mapcopy]..aInfo[2]..mapcopy..")"
end

function EnterMap(nTongID, nMapCopy)
	if (GetFightState() ~= 0)then
		Msg2Player("Ch� c� th� �i v�o t� khu v�c phi chi�n ��u!")
		return
	end
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(nMapCopy, pos.x, pos.y)
end

function CreatMap(nTongID, nMapCopy)
	TONG_ApplyCreatMap(nTongID, nMapCopy)
end

function BrowseMap(nTongID)
	local aInfo = {1, "/#EnterMap("..nTongID..","}		
	Say("<#>H�y ch�n b�n �� mu�n xem", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"Kh�ng xem n�a!/#Cancel")
end

function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>Qu� bang mu�n ��nh c� t�i ��u?", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"C�n suy x�t l�i/#Cancel")
end

--��ͼ��������
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#>Bang h�i c�a ng��i �� c� b�n �� ri�ng r�i!", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>Bang h�i �� c� b�n �� chung r�i, bang h�i ��t t�i c�p 2 m�i c� th� c� b�n �� ri�ng!", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>Hi�n nay ��ng c�p bang h�i kh�ng t�i c�p 2, ch� c� th� s� d�ng b�n �� chung, h�y ch�n 1 b�n �� chung (ki�n ngh� n�n ch�n b�n �� c� �t bang h�i):", 6,
			"L�a ch�n ng�u nhi�n/#PublicMap("..nTongID..","..nrand..")", 
			"Khu v�c chung 1 (�� c� "..aNum[1].." bang h�i)/#PublicMap("..nTongID..",1)", 
			"Khu v�c chung 2 (�� c� "..aNum[2].." bang h�i)/#PublicMap("..nTongID..",2)",
			"Khu v�c chung 3 (�� c� "..aNum[3].." bang h�i)/#PublicMap("..nTongID..",3)", 
			"Khu v�c chung 4 (�� c� "..aNum[4].." bang h�i)/#PublicMap("..nTongID..",4)",
			"H�y b� /#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>Bang h�i hi�n nay �� c� th� c� b�n �� ri�ng, ng��i c� mu�n t�o kh�ng?", 2, "V�o xem th�/#BrowseMap("..nTongID..")", 
			"T�o b�n ��/#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end

--��ͼ�����ɹ�
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	--�״δ�����ʱ�򹫸�һ��
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "Kh�ng bi�t n�i n�o"
		end
		local szMsg = "Xin ch�c m�ng, qu� bang �� s� h�u khu v�c ho�t ��ng ri�ng, bang ch�ng c� th� ch�n <�i v�o b�n bang> �� b��c v�o!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- �����ʷ��¼
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- ����¼���¼
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
--��ͼ�����ɹ�
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	-- ��ͼ���ڴ˷�����
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	-- ����С��ͼ����
	SetWorldName(nMapIdx, TONG_GetName(nTongID).." - l�nh ��a")
	-- ��������Ϊ����ͼ
	SetMapType(nMapIdx, 1);
	-- ���ò���ΪTongID
	SetMapParam(nMapIdx, 0, nTongID);
	-- �������а���ͼNpc
	add_one_citytong_npc(nMapIdx, nMapCopy);
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID)
	local npcid
	while(nWorkshopID ~= 0)do
		local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		if (nUseLevel > 0)then
			npcid = add_one_building(nMapIdx, nMapCopy, TWS_GetType(nTongID, nWorkshopID), nUseLevel)
			TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
		end	
		nWorkshopID = TWS_GetNextWorkshop(nTongID, nWorkshopID)
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
		if (nCurLevel == 4) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "C�t bi�u t��ng bang h�i")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "C�t bi�u t��ng th�nh th")--��
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nStuntID ~= 0 and nCitySTID ~= 0 and TB_STUNTID_INFO[nStuntID].skillid ~= nil) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	return 1
end

-- GameSvr���ģ���ͷ�
function RELEASE_G()
	--�������ݻ���
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		--������
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end

-- �������ͼ
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("Ng��i ch�i c�p 10 tr� l�n m�i c� th� b��c v�o l�nh ��a bang h�i!");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("Ch� c� th� �i v�o l�nh ��a bang h�i t� nh�ng khu v�c phi chi�n ��u!");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("Bang h�i n�y kh�ng t�n t�i, kh�ng th� v�o khu v�c bang!");
		return 0;
	end
	local _,SelfTong = GetTongName()
--	if (SelfTong ~= nTongID)then
--		if TONG_GetTongMapBan(nTongID) ~= 0 then
--			Msg2Player(szTongName.." û�п��ŵ�ͼ���ƣ��޷����룡");
--	 		return 0;
--		end
--	end
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." Kh�ng c� khu v�c bang h�i, kh�ng th� �i v�o!");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("B�n �ang ��ng t�i khu v�c n�y r�i!");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	-- �Ժ��ͼ����������Ϊ��ͼ��һ������
end

--���õ�ͼ
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("Bang h�i c� khu v�c ri�ng m�i c� th� s� d�ng ch�c n�ng n�y!")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="Thi�t l�p c�m ��a/#SetTongMapBan("..nTongID..",1)",
				 [1]="H�y b� c�m ��a/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>M� <color>",
				[1]="<color=red>C�m <color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "C� th� l�a ch�n cho ph�p hay ng�n c�m th�nh vi�n bang h�i kh�c th�m nh�p, t�nh tr�ng hi�n t�i l�:"
	Say(szMsg..szState[ban], 2, szBan[ban], "H�y b�/#Cancel")
	return 1
end

function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="Cho ph�p",
				[1]="Ng�n c�m"}	
	local szMsg = szExcutor.." Thay ��i t�nh tr�ng khu v�c th�nh: "..szState[bOpen]
	Msg2Player("Thi�t l�p th�nh c�ng!")
	TONG_ApplyAddEventRecord(nTongID, szMsg);
end

MAP_BAN_R = DefFun2
MAP_BAN_G_1 = DefFun2
function MAP_BAN_G_2(nTongID, bBan)
	local nMap = TONG_GetTongMap(nTongID)
	if (nMap <= DYNMAP_ID_BASE)then
		return 1
	end
	nMap = SubWorldID2Idx(nMap)
	if(bBan == 1 and nMap >= 0)then
		local nMapCopy = SubWorldIdx2MapCopy(nMap)
		local nPlayer = GetFirstPlayerAtSW(nMap)
		while(nPlayer > 0)do
			PlayerIndex = nPlayer
			local _,b = GetTongName()
			if (b ~= nTongID)then
				SetFightState(0)
				local pos = GetMapEnterPos(nMapCopy)
				SetPos(pos.x, pos.y)
				Msg2Player("Khu v�c n�y �� ���c thi�p l�p c�m ��a, kh�ng th� b��c v�o!")
			end
			nPlayer = GetNextPlayerAtSW(nMap)
		end
	end
	return 1
end

function CITY_OCCUPY_R(nOwner, nPreOwner, nCityMap)
	TONG_ApplySetOccupyCityDay(nOwner, TONG_GetDay(nOwner));
	if (nPreOwner == 0)then
		return 1
	end
	-- ���ͽ���ȼ��ŵ��߳Ǵ�ս�ű��д��� wangbin 2010.8.11
	-- TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	--ʧȥ�ǳأ�5���ｵΪ4��
	-- if (TONG_GetBuildLevel(nPreOwner) >= 5) then
	-- 	TONG_ApplyDegrade(nPreOwner)
	-- 	local szMsg="���ǳض�ʧ������ȼ���Ϊ4��"
	-- 	Msg2Tong(nPreOwner, szMsg)
	-- 	TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	-- end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end

--����ؼ�
--TONGTSK_STUNT_ID = 1011
--stunt����/���ð���ؼ�
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	
	-- �ر������
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
	
	if (nStuntID == 0) then	--û�п����ؼ�
		Describe("H�y l�a ch�n k� n�ng ��c bi�t cho bang: ", 7,
					TB_STUNTID_INFO[1].name.."/#StuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#StuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#StuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#StuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#StuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#StuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#StuntConfirm(7)",
					"Ch� ��i thi�t l�p/Cancel"		)
	else
		local szMsg = "K� n�ng hi�n t�i c�a bang h�i l�: "..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>Nh�n quy�n h�n k� thu�t ��c bi�t:"..
						"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>Duy tr� ti�n b�c k� thu�t ��c bi�t:"..
						"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n b�".."<color>"..
						"<enter>T�c d�ng c� th� k� thu�t ��c bi�t:"..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "Thay ��i k� n�ng/#CHANGE_STUNT_G_1("..nTongID..")", "B�o tr� k� n�ng m� (t�m ng�ng)/#PAUSED_STUNT_G_1("..nTongID..")", "R�i kh�i/OnCancel")
	end
end

function PAUSED_STUNT_G_1(nTongID)
	local nPause = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	local nswitch = 0
	local szMsg = ""
	if (nPause < 0 and nPause >= 4) then
		nPause = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nPause)
	end
	szMsg = "Tr�ng th�i k� n�ng hi�n t�i c�a bang l�:  "..TB_STUNT_PAUSESTATE[nPause][1].."<enter>Sau khi duy tr� v�o tu�n sau:"..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>Ng��i c� mu�n kh�ng?", 2, "M�(��ng)/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "H�y b�/Cancel")
	return 1
end

function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("Tr�ng th�i k� n�ng c�a bang tu�n sau s� ��i th�nh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("Tr�ng th�i k� n�ng c�a bang tu�n sau s� ��i th�nh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end

function StuntConfirm(nStuntID)
	--local nStuntID = nSel + 1
	local szMsg = "K� n�ng ���c ch�n hi�n t�i l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Nh�n quy�n h�n k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Duy tr� ti�n b�c k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n  b�<color>"..
					"<enter>T�c d�ng c� th� k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "��ng � ch�n/#StuntSureConfirm("..nStuntID..")", "Tr� v�/CONFIGURE_TONG_STUNT_G", "R�i kh�i/OnCancel")
end

function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>L�c tr��c th�i gian duy tr� k� thu�t ��c bi�t bang h�i l� m�t tu�n, b�y gi� ch� c� th� nh�n trong v�i ng�y"..nMaxMem.." l�n."
	else
		szMsg = "<enter>L�c tr��c th�i gian duy tr� k� thu�t ��c bi�t bang h�i l� m�t tu�n, b�y gi� m�i ng�y m�i nh�n v�t ch� c� th� nh�n ���c 1 l�n, ch� cho ph�p"..nMaxMem.." ng��i nh�n."
	end
	return szMsg
end

function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "K� n�ng hi�n t�i c�a bang h�i l�: "..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>Quy�t ��nh chuy�n k� thu�t ��c bi�t c�a bang h�i l�:"..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>Quy�t ��nh chuy�n k� thu�t ��c bi�t c�a bang h�i l�: [kh�ng]"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>Ng��i mu�n ��i k� thu�t ��c bi�t bang h�i th�nh lo�i n�o?"
		
		Describe(szMsg, 7,
					TB_STUNTID_INFO[1].name.."/#ChangeStuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#ChangeStuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#ChangeStuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#ChangeStuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#ChangeStuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#ChangeStuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#ChangeStuntConfirm(7)",
					"Ch� ��i thi�t l�p/Cancel"		)
	end
	return 1
end

function ChangeStuntConfirm(nStuntID)
	local _, nTongID = GetTongName()
	--local nStuntID = nSel + 1
	local szMsg = "K� n�ng ���c ch�n hi�n t�i l�:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>Nh�n quy�n h�n k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Duy tr� ti�n b�c k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v�n ti�n chi�n  b�<color>"..
					"<enter>T�c d�ng c� th� k� thu�t ��c bi�t:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "��ng � ch�n/#StuntSureConfirm("..nStuntID..")", "Tr� v�/#CHANGE_STUNT_G_1("..nTongID..")", "R�i kh�i/OnCancel")
end

function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end

function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "Bang h�i c�p d��i c�p 4 kh�ng th� s� d�ng k� n�ng ��c bi�t!");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	-- �ر������
	if (nOldStuntID == 6) then
		nOldStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nOldStuntID)
	end
	
	-- ���ԭ��û���ؼ�����Ϊ�����ؼ���������Ч��������Ϊ�����ؼ���ά������Ч��
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "K� n�ng ��c bi�t ���c m�, k� n�ng l� "..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "K� n�ng ��c bi�t ���c m�, k� n�ng l� "..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "Sau m�t tu�n th� k� n�ng s� ��i th�nh "..TB_STUNTID_INFO[nStuntID].name..".")
		return 0
	end
	cTongLog:WriteInfTB("TONG", "setstunt", nTongID, {stuntid = nStuntID});
	return 1
end
STUNT_SET_G_1	= DefFun2

function STUNT_SET_G_2(nTongID, nStuntID)
	if (nStuntID ~= 0) then
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
end

---------�ͻ��˵�ȫ�����⡣����������������������
else
-----------------����ǿͻ���---------------
MONEYFUND_ADD_C_1 = DefFun2
MONEYFUND_ADD_C_2 = DefFun2
MONEYFUND2BUILDFUND_C_1 = DefFun2
MONEYFUND2BUILDFUND_C_2 = DefFun2
MAP_CREATED_C_1 = DefFun2
MAP_CREATED_C_2 = DefFun2
MAP_CREAE_C_1	= DefFun2
MAP_CREAT_C_2	= DefFun2
MAP_SET_C_1	= DefFun2
MAP_SET_C_1	= DefFun2
CONTRIBUTION2STOREOFFER_C_1 = DefFun3
CONTRIBUTION2STOREOFFER_C_2 = DefFun3
BUILDFUND2WARFUND_C_1 = DefFun2
BUILDFUND2WARFUND_C_2 = DefFun2
MONEY2BUILDFUND_C_1 = DefFun2
MONEY2BUILDFUND_C_2 = DefFun2
STOREOFFER2CONTRIBUTION1_C_1 = DefFun3
STOREOFFER2CONTRIBUTION1_C_2 = DefFun3
STOREOFFER2CONTRIBUTION2_C_1 = DefFun3
STOREOFFER2CONTRIBUTION2_C_2 = DefFun3
MEMBER_KICK_C_1 = DefFun3
MEMBER_KICK_C_2 = DefFun3
MEMBER_RETIRE_C_1 = DefFun3
MEMBER_RETIRE_C_2 = DefFun3
MEMBER_ONLINE_C_1 = DefFun3
MEMBER_ONLINE_C_2 = DefFun3
MEMBER_ADD_C_1 = DefFun3
MEMBER_ADD_C_2 = DefFun3
MEMBER_SETFIGURE_C_1 = DefFun3
MEMBER_SETFIGURE_C_2 = DefFun3
STUNT_SET_C_1	= DefFun2
STUNT_SET_C_2	= DefFun2

aPrompt= {"C� mu�n x�y d�ng t�c ph��ng n�y kh�ng?",
"C� mu�n h�y b� t�c ph��ng n�y kh�ng?",
"C� mu�n k�ch ho�t t�c ph��ng n�y kh�ng?",
"C� mu�n ��ng c�a t�c ph��ng n�y kh�ng?",
"C� ��ng � n�ng c�p t�c ph��ng n�y kh�ng?",
"C� ��ng � �i�u ch�nh ��ng c�p s� d�ng t�c ph��ng kh�ng?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "Sau khi ��ng c�a, mu�n k�ch ho�t l�i c�n "..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).." v�n ti�n ki�n thi�t, c� ��ng � ��ng c�a kh�ng?"
	end
	return aPrompt[nOpt+1]
end

end

-------------------������ȫ���⡣����������������
-- ��ȡ��Ὠ�����������
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end

--���ۻ����׶�����
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end

-- ��ȡ���������������	
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	

-- ��ȡ��������ȼ�����
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end

function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end

-- ȡ��
function Cancel()
end
