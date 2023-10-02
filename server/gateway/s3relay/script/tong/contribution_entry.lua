--���ֵ��->ȡ80%�ӵ����˹��׶�->(���ۻ����׶��ۼ�(���ۻ����׶�����)->�����ܹ��׶��ۼӣ�(�������Ŀ��)������Ŀ�깱�׶��ۼ�->�����Ŀ�깱�׶��ۼ�)��
	--ȡ5%�ӵ�ʦ����ȡ15%�ӵ��������׶ȣ�%60��ֵ�����������->������ۻ�������(����)->������ۻ��������40%��ֵ����ս������
--���ֵ����ں�����ContriValueAdd(nValue, nEntry)�����أ���ʾʧ��(�ް��)������ʾ�ɹ�
Include("\\script\\tong\\tong_setting.lua")
Include("\\script\\tong\\log.lua")


--���浽һ����ֵ���ŷ���Relay
TONG_VALUE_SYNC = 1000000 --�������׶ȼ���Ŀ���ۻ����׶ȼ�ֵ����������
TONG_FUND_SYNC = 5000000 --������𻺴�����

--ת��ϵ��
coefPersonal = 0.8
coefTongStore = 0.15
coefMaster = 0.05
coefBuildFund = 0.6
coefWarFund = 0.4


function TongFundAdd(nTongID, nCurValue)
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	nCurValue = nCurValue / 10000
	--_dbgMsg("Ŀǰ���ۻ��������"..nTongWeekBuildFund.."/"..nWeekBuildUpper)
	local nBuildFund = floor(nCurValue*coefBuildFund)	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildFund)
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--���ۻ�����������
		if (nTongWeekBuildFund + nBuildFund >= nWeekBuildUpper) then
			local nLeft = nWeekBuildUpper - nTongWeekBuildFund				 
			--_dbgMsg("������𼴴������ޣ������ӵ������������")
			-- ����¼���¼
			cTongLog:WriteInf("FUND", "THRESHOLD\t"..tostring(TONG_GetName(nTongID)).."\tTongWeek:\t"..
				TONG_GetWeek(nTongID).."\tTongDay:\t"..TONG_GetDay(nTongID))
			TONG_ApplyAddEventRecord(nTongID, "Ng�n s�ch ki�n thi�t nh�n ���c v��t qu� gi�i h�n tu�n, ng�n s�ch ki�n thi�t d� ra s� chuy�n sang ng�n s�ch ki�n thi�t d� b�")
			TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund - nLeft)
			nBuildFund = nLeft
		end
		--_dbgMsg("���Ӱ�Ὠ�����"..nBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nBuildFund)		
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildFund)
		--_dbgMsg("���Ӱ�����ۻ��������"..(nBuildFund))
		TONG_ApplyAddTotalBuildFund(nTongID, nBuildFund)
		--_dbgMsg("���Ӱ�����ۻ��������"..(nBuildFund))
	else
		TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund)
		--_dbgMsg("���Ӵ����������"..nBuildFund)
	end
	--_dbgMsg("���Ӱ��ս������"..floor(nCurValue*coefWarFund))
	TONG_ApplyAddWarBuildFund(nTongID, nCurValue*coefWarFund)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nCurValue*coefWarFund)
end

--���ֵ������߼���HEAD��½�汾��
function ContriValueEntryLogic_HEAD(nValue, nEntry) --nValue ��ֵ����nEntry���
	--nValue = nValue * 10
	--_dbgMsg("X*X*X*X*X*X*X*X*X*X*X*X*X**X*X")
	--_dbgMsg("��ֵ��ڣ�10����"..nValue)
	local nRet = 1
	local _TongName, nTongID = GetTongName()
	if (nTongID == 0) then
		return 0
	end
	--��ʿ����ʹ��
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		return -2
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nWeekTotal = GetWeeklyOffer()
	local WeekGoal = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalValue = GetWeekGoalOffer()	
	---------------------------------ת��������-------------------------------------------
	local nPersonal = coefPersonal*nValue	
	local nMaster = coefMaster*nValue
	--����
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nPersonal
	--_dbgMsg("�ܻ���"..nValuePlayer)
	local nContribution = floor(nValuePlayer/COEF_CONTRIB_TO_VALUE)
	if (nContribution > 0) then
		--�������Ŀ��
		if (nEntry == WeekGoal) then
			--������Ŀ�깱�׶��ۼ�
			AddWeekGoalOffer(nContribution)
			--�����Ŀ���ۻ����׶��ۼ�
			local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution
			if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
				TONG_ApplyAddWeekGoalValue(nTongID, nCurValue)
				nCurValue = 0
			end
			TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
		end
		--���ۻ����׶�
		--_dbgMsg("Ŀǰ���ۻ����׶�"..nWeekTotal.."/"..MAX_WEEK_CONTRIBUTION)
		if (nWeekTotal < MAX_WEEK_CONTRIBUTION)	then
			--��ȡ�Ĺ��׶Ƚ���������
			--_dbgMsg("���ӹ��׶�"..nContribution)
			if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION) then
				nContribution = MAX_WEEK_CONTRIBUTION - nWeekTotal
				--_dbgMsg("���׶��Ѵ������ޣ�����ֻ���ӹ��׶�"..nContribution)
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				SetWeeklyOffer(MAX_WEEK_CONTRIBUTION)
				--ʣ���ֵ��
				nValuePlayer = 0
				--�ܼ�ֵ��ȡ��ñ�
				--nValue = nContribution/coefPersonal*COEF_CONTRIB_TO_VALUE
			else
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				AddWeeklyOffer(nContribution)
				nValuePlayer = mod(nValuePlayer, COEF_CONTRIB_TO_VALUE)
			end
			--�������׶�
			local nTongStore = coefTongStore*nValue
			--��ᴢ��
			local nValueTong = TONG_GetTaskTemp(nTongID, TONG_STORETEMP) + nTongStore			
			--_dbgMsg("Ŀǰ��ᴢ������"..nValueTong)
			if (nValueTong > TONG_VALUE_SYNC)then
				local nStore = floor(nValueTong/COEF_CONTRIB_TO_VALUE)
				--_dbgMsg("���Ӱ�ᴢ��"..nStore)
				TONG_ApplyAddStoredOffer(nTongID, nStore)
				nValueTong = mod(nValueTong, COEF_CONTRIB_TO_VALUE)
			end
			TONG_SetTaskTemp(nTongID, TONG_STORETEMP, nValueTong)
		else
			--_dbgMsg("���׶��Ѵ����ޣ�")
			--�Ѵ�������
			nRet = -1
		end
	end
	if (nRet == 1)then
		--ʣ�໺�棺nValuePlayer
		SetTask(TASKID_CONTRIVALUE, nValuePlayer)
		--ʦͽ��ϵ
		local nMasterValue = GetTongMTask(TONGMTSK_TOMASTER) + nMaster
		if (nMasterValue > MAX_SHITU_VALUE_STORE) then
			nMasterValue = MAX_SHITU_VALUE_STORE
		end	
		SetTongMTask(TONGMTSK_TOMASTER, nMasterValue)
	end
	
	-----------------------------------------ת����������-----------------------------
	local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
	nCurValue = nCurValue + nValue
	--_dbgMsg("Ŀǰ�����𻺴�"..nCurValue)
	if (nCurValue > TONG_FUND_SYNC) then
		TongFundAdd(nTongID,  nCurValue)
		nCurValue = 0
	end
	TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, nCurValue)
	return nRet
end

--���ֵ������߼���IB�汾��
function ContriValueEntryLogic_IB(nValue, nEntry) --nValue ��ֵ����nEntry���
	local _TongName, nTongID = GetTongName();
	-- �ж��Ƿ��а��
	if (nTongID == 0) then
		return 0;
	end
	-- �ж��Ƿ���Ŀ��
	if (nEntry ~= TONG_GetWeekGoalEvent(nTongID)) then
		return 0;
	end
	-- ����ֵ������ɹ��׶ȣ��ӵ���ҺͰ���������ֻ�ܼӵ���Ŀ�����蹱�׶�
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nValue;
	--_dbgMsg("�ܻ���"..nValuePlayer)
	local nContribution = floor(nValuePlayer / COEF_CONTRIB_TO_VALUE);
	local nWeekGoalGap = TONG_GetWeekGoalPlayer(nTongID) - GetWeekGoalOffer();
	if (nContribution >= nWeekGoalGap) then
		nContribution = nWeekGoalGap;
		nValuePlayer = 0;
	end
	if (nContribution > 0) then
		-- ������Ŀ�깱�׶��ۼ�
		AddWeekGoalOffer(nContribution);
		-- �����Ŀ���ۻ����׶��ۼ�
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution;
		if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
			TONG_ApplyAddWeekGoalValue(nTongID, nCurValue);
			nCurValue = 0;
		end
		TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
	end
	--ʣ�໺�棺nValuePlayer
	SetTask(TASKID_CONTRIVALUE, mod(nValuePlayer, COEF_CONTRIB_TO_VALUE));
	return 1;
end

ContriValueEntryLogic = ContriValueEntryLogic_HEAD;

--function Test(nValue, nEvent)
--	if (nEvent == nil)then
--		nEvent = EVE_XINSHI
--	end	
--	ContriValueEntryLogic(nValue, nEvent)
--end