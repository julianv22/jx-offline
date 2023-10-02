Include("\\script\\tong\\tong_setting.lua")
--���ò���
WS_MAX_LEVEL = 10 --�������ȼ�
WS_COEF_CLOSE = 0.2 --�ر�������ά�����ıȣ����ڿ���״̬��

aWorkshopTypeData = {}	--���������������ò���
aWorkshopLevelData = {}	--�����ȼ�����
aWorkshopNameType = {}  --����������������ID

function LoadWorkshopSetting()	--��������
	local b2 = TabFile_Load("\\settings\\tong\\workshop\\workshop_level_data.txt", "WorkshopLevelData")
	local b3 = TabFile_Load("\\settings\\tong\\workshop\\workshops.txt", "WorkshopTypeData")
	if b2~=1 or b3~=1 then
		print("��c t�p config t�c ph��ng th�t b�i!")
		if b2 == 1 then TabFile_UnLoad("WorkshopLevelData") end
		if b3 == 1 then TabFile_UnLoad("WorkshopTypeData") end
		return
	end
	local nRowCount = TabFile_GetRowCount("WorkshopLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("WorkshopLevelData", y, "LEVEL"))
		aWorkshopLevelData[nLevel] = {}
		for x = 1, 100 do 
			local szHead = TabFile_GetCell("WorkshopLevelData", 1, x)
			if szHead ~= "" then	
				aWorkshopLevelData[nLevel][szHead] = TabFile_GetCell("WorkshopLevelData", y, x)
			else
				break	
			end		
		end	
	end	
	nRowCount = TabFile_GetRowCount("WorkshopTypeData")
	for y = 2, nRowCount do
		local eType = tonumber(TabFile_GetCell("WorkshopTypeData", y, "TYPE"))
		aWorkshopTypeData[eType] = {}
		for x = 1, 100 do
			local szHead = TabFile_GetCell("WorkshopTypeData", 1, x)
			if szHead ~= "" then	
				aWorkshopTypeData[eType][szHead] = TabFile_GetCell("WorkshopTypeData", y, x)
			else
				break	
			end		
		end	
	end
	for i = 1, getn(aWorkshopTypeData) do
		aWorkshopNameType[aWorkshopTypeData[i]["NAME"]] = i
	end	
--	TabFile_UnLoad("WorkshopLevelData")
--	TabFile_UnLoad("WorkshopTypeData")
end
LoadWorkshopSetting()
------------------------���㹫ʽ-------------------------------------
--�����������ϵ��
function calcMemberCoef(nMembers)
	if nMembers < 50 then
		return 1.5 - nMembers/50*(1.5-1)
	elseif	nMembers > 300 then
		return 5 - (300/nMembers)*(5-3)
	else
		return 1
	end
end

--�����ճ�ά�����ù�ʽ�����������*�������*������������*�����������
function calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	return nBaseFund*nMembers*coefType*coefMember
end

--�������������ճ����ļ���ر�״̬�������ճ�����
function calcCloseDailyFund(nNormalFund)
	return nNormalFund * WS_COEF_CLOSE
end

-------------------------���ݽӿ�------------------------------------
function wsGetMaxLevel(nTongID, eType)
	return WS_MAX_LEVEL
end

function wsGetName(eType)
	return aWorkshopTypeData[eType]["NAME"]
end

function wsGetTypeID(szName)
	return aWorkshopNameType[szName]
end

function wsGetUpgradeCostFund(nTongID, eType, nCurLevel) --��ȡ���¼����轨�����
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["UPGRADE_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("G�p l�i khi n�ng c�p ng�n s�ch ki�n thi�t!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen) --��ȡ�ճ�ά������
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--���������
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--��ȡ�������
	local coefMember = calcMemberCoef(nMembers)	--��������ϵ��
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --����ϵ������������������
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("G�p l�i khi b�o tr� chi ph� h�ng ng�y!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen) --��ȡ�����ճ�ά������
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--���������
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--��ȡ�������
	local coefMember = calcMemberCoef(nMembers)	--��������ϵ��
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --����ϵ������������������
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("G�p l�i khi b�o tr� chi ph� h�ng ng�y!")
		return INVALID_VALUE
	end
	return floor(nRet/nMembers)
end

function wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel) --��ȡ���ص���ά�����ò�
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--���������
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--��ȡ�������
	local coefMember = calcMemberCoef(nMembers)	--��������ϵ��
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --����ϵ������������������
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if (nRet == nil) then
		print("G�p l�i khi b�o tr� chi ph� h�ng ng�y!")
		return INVALID_VALUE
	end
	nRet = nRet - calcCloseDailyFund(nRet)
	return floor(nRet/nMembers)
end

function wsGetOpenCost(nTongID, eType, nCurLevel)	--��ȡ��������
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["OPEN_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("G�p l�i khi nh�n ���c ti�u hao do k�ch ho�t!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetAllDayConsume(nTongID)	--��ȡ��������һ��ά������
	local nTotalValue = 0
	local nID = TWS_GetFirstWorkshop(nTongID)
	while nID ~= 0 do
		local eType = TWS_GetType(nTongID, nID)
		local bOpen = TWS_IsOpen(nTongID, nID)
		local nCurLevel = TWS_GetUseLevel(nTongID, nID)
		nTotalValue = nTotalValue + wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen)
		nID = TWS_GetNextWorkshop(nTongID, nID)
	end
	return nTotalValue
end