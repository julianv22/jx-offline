Include("\\script\\tong\\workshop\\workshop_setting.lua")

-------�������������߼�-------
function logicWorkShopLevelUp(nTongID, nID, nToLevel)
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local nnTongIDLevel = TONG_GetBuildLevel(nTongID)
	if (nToLevel > tongGetWorkshopUpperLevel(nTongID, nnTongIDLevel)) then
		return 1 --("�����Ѵ����ȼ���")
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, nCurLevel)
	local nCurFund = TONG_GetBuildFund(nTongID)
	if nCurFund < nCost then	--��������Ƿ�����
		return 2 --("��������㣬����������")
	end	
	if TONG_GetPauseState(nTongID) ~= 0 then	--��������Ƿ�����
		return 3 --("��������㣬����������")
	end
	local bOpen = TWS_IsOpen(nTongID, nID)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nToLevel, bOpen) - 
			wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen);	
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 4 --����ά��ս���������ս������
	end	
	return 0
end

function logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nToLevel < 1) then
		return 1
	end	
	return 0
end
			
function logicWorkShopOpen(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (TWS_IsOpen(nTongID, nID) == 1) then
		return 1
	end
--	if TONG_GetPauseState(nTongID) ~= 0 then
--		return 2 --("��ͣ״̬")
--	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCost = wsGetOpenCost(nTongID, eType, nCurLevel)
	if TONG_GetBuildFund(nTongID) < nCost then
		return 3 --("���������")
	end	
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 4 --����ά��ս���������ս������
	end	
	return 0
end

function logicWorkShopClose(nTongID, nID)
	if (TWS_IsOpen(nTongID, nID) == 1) then
		return 0
	end
	return 1	
end

function logicWorkShopDestroy(nTongID, nID)
	if (TWS_GetLevel(nTongID, nID) > 0) then
		return 0
	end
	return 1	
end

function logicWorkShopLearn(nTongID, eType)
	--if not WorkShopCheckAuthority(nTongID,eType,nPlayerIdx) then
	--	return 1 --("û��Ȩ��")
	--end
	local nnTongIDLevel = TONG_GetBuildLevel(nTongID)
	local nWorkshops = TWS_GetWorkshopCount(nTongID)
	--���������Ѵ�����
	if nWorkshops >= tongGetMaxWorkshopNum(nTongID, nnTongIDLevel)then
		return 1
	end
	--�����Ѵ���
	if TWS_GetWorkshopCount(nTongID, eType) > 0 then
		return 2
	end
	if TONG_GetPauseState(nTongID) ~= 0 then
		return 3
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, 0)
	 --("���������")
	if TONG_GetBuildFund(nTongID) < nCost then
		return 4
	end
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, 1, 1);
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 5 --����ά��ս���������ս������
	end	
	return 0
end
