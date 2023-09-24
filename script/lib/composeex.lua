--��UI����ĺϳ���
--ͨ������tbActivityCompose:GetMaterialList(tbMaterial)�Զ������ϳɲ�����Ϣ 
--��ʽ�� ��Ʒ�� ����Ʒ����/���������
--
--���� tbComposeClass:Compose(tbFormula, szLogTitle, pFun, ...)
--���ɺϳɣ�ʧ�ܷ���0���ɹ�����1
--
--tbFormula��ʽ
--tbFormula = {tbMaterial��tbProduct}
--
--tbMaterial д��ͬ\script\lib\awardtemplet.lua ��tbItem��Ŀǰֻ������ߣ���Ǯ
--
--tbProduct д����ȫͬ \script\lib\awardtemplet.lua ����Ϊnil


Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\string.lua")


INVENTORY_ROOM = {}

INVENTORY_ROOM.room_equipment	= 0		-- װ����
INVENTORY_ROOM.room_repositor	= 1		-- ������
INVENTORY_ROOM.room_trade		= 2		-- ������
INVENTORY_ROOM.room_tradeback	= 3		-- ���׹�����װ�����ı���
INVENTORY_ROOM.room_trade1		= 4		-- ���׹����жԷ��Ľ�����
INVENTORY_ROOM.room_immediacy	= 5		-- �����Ʒ
INVENTORY_ROOM.room_beset		= 6		-- ��Ƕ
INVENTORY_ROOM.room_ext1		= 7		-- ��չ��1
INVENTORY_ROOM.room_ext2		= 8		-- ��չ��2
INVENTORY_ROOM.room_ext3		= 9		-- ��չ��3
INVENTORY_ROOM.room_giveitem	= 10	--�ͻ��˸������
INVENTORY_ROOM.room_distill		= 11	--��ʯ��ȡ����
INVENTORY_ROOM.room_enchase		= 12	--��Ƕ����
INVENTORY_ROOM.room_atlas		= 13	--�ƽ�ͼ��
INVENTORY_ROOM.room_partnerbag	= 14	-- ͬ�鱳����
INVENTORY_ROOM.room_num			= 15	-- �ռ�����	



	
tbActivityCompose = tbBaseClass:new()


--����:��ʼ���ϳ���
--��������������������õı�����һ�£�������ȫ�ֵģ����ϳɹ�ʽ����־����
--��
function tbActivityCompose:_init(tbFormula, szLogTitle, nRoomType)
	

	self.tbFormula = tbFormula
	self.nRoomType = nRoomType or INVENTORY_ROOM.room_equipment
	self.szLogTitle = szLogTitle or "M�c �inh h�p th�nh"
	
end


function tbActivityCompose:UseGiveUI()
	
	self.nRoomType = nRoomType or INVENTORY_ROOM.room_giveitem
	
	
end

--���ܣ����ݲ���˵���������ϲ��ϵ����
--����������˵����
--���أ��Ƿ���ȫƥ��(1/0)�����ϸ�����������ϳɸ������
function tbActivityCompose:CheckMaterial(tbMaterial, nComposeCount)
	local i
	local flag = 1
	local tbCount  = {}
	local tbMaxSetCount = {}
	nComposeCount = nComposeCount or 1
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			tbItem.nCount = tbItem.nCount or 1
			local nItemNeedCount = tbItem.nCount * nComposeCount
			if nItemNeedCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1		
				local nCurCount = self:CalcItemCount(tbRoomItems, tbItem)
				tbCount[i] = nCurCount
				tbMaxSetCount[i] = floor(nCurCount / nItemNeedCount)
				if nCurCount < nItemNeedCount then
					flag =  0;
				end	
			end			
		elseif tbItem.nJxb then
			local nCash = GetCash()
			tbCount[i] = nCash
			local nNeedJxb = tbItem.nJxb * tbItem.nCount * nComposeCount
			tbMaxSetCount[i] = floor(nCash / nNeedJxb)
			if nCash < nNeedJxb then
				flag = 0
			end
		elseif tbItem.nTaskId then
			local nTaskValue = GetTask(tbItem.nTaskId)
			tbCount[i] = nTaskValue
			local nNeedValue = tbItem.nCount * nComposeCount
			tbMaxSetCount[i] = floor(nTaskValue / nNeedValue)
			if nTaskValue < nNeedValue then
				flag = 0
			end
		elseif tbItem.pGetCount then
			local nCurCount = tbItem:pGetCount()
			tbItem.nCount = tbItem.nCount or 1
			local nNeedCount = tbItem.nCount * nComposeCount
			tbCount[i] = nCurCount
			tbMaxSetCount[i] = floor(nCurCount / nNeedCount)
			if nCurCount < nNeedCount then
				flag =  0;
			end	
		end
	end
	return flag, tbCount, tbMaxSetCount;
end

--���ܣ����ݲ���˵�����ж�����ܺϳɼ���
--����������˵����
--���أ����ϳɸ���
function tbActivityCompose:CanMakeMaxCount(tbMaterial)
	local _, _, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local nMinCount = tbMaxCount[1]
	for i=2, getn(tbMaxCount) do
		if nMinCount > tbMaxCount[i] then
			nMinCount = tbMaxCount[i]
		end
	end
	return nMinCount;
end

function tbActivityCompose:MakeItem(nItemIndex)
	local tbItem = {}
	tbItem.nQuality = GetItemQuality(nItemIndex)
	tbItem.tbProp = {}
	
	if tbItem.nQuality == 1 then
		tbItem.tbProp  = {0, GetGlodEqIndex(nItemIndex)}
	elseif tbItem.nQuality == 4 then
		tbItem.tbProp  = {0, GetPlatinaEquipIndex(nItemIndex)}
	else
		local nG,nD,nP,nL,nS, nLuk = GetItemProp(nItemIndex)
		tbItem.tbProp = {nG,nD,nP,nL,nS, nLuk}
	end
	return tbItem
end

function tbActivityCompose:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local tbRecItem = self:MakeItem(nItemIndex)
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
					return 
				end
			end
		end
	end	
	
	for key, value in tbItem do 
		if strfind(key, "Limit") and  type(value) == "function" then
			if value(tbItem, nItemIndex) ~= 1 then
				return
			end
		end
	end			
	return 1
end

function tbActivityCompose:GetRoomItems(nRoomType)
	
	local tbRoomItems = {}
	if nRoomType == INVENTORY_ROOM.room_giveitem then
		for i=1, 24 do
			local nItemIndex = GetGiveItemUnit(i)
			if nItemIndex and nItemIndex > 0 then
				tinsert(tbRoomItems, nItemIndex)
			end
		end
	else
		tbRoomItems = GetRoomItems(nRoomType)
	end
	return tbRoomItems
end

function tbActivityCompose:CalcItemCount(tbRoomItems, tbItem)
	local nTotalCount = 0
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			if self:CheckItem(tbItem ,nItemIndex) == 1 then
				nTotalCount = nTotalCount + nCount
			end
		end
	end
	return nTotalCount	
end

function tbActivityCompose:ConsumeItem(tbRoomItems, nConsumeItemCount, tbItem)
	
	
	local nTotalCount = nConsumeItemCount
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			if self:CheckItem(tbItem ,nItemIndex) == 1 then
				
				if nCount <= nTotalCount then
					if RemoveItemByIndex(nItemIndex) == 1 then
						nTotalCount =  nTotalCount - nCount
						nIdx = nPrevIdx
					end
				else
					SetItemStackCount( nItemIndex, nCount - nTotalCount );
					nTotalCount = 0;
				end
		
				if nTotalCount == 0 then
					return 1;
				end
			end
		end
	end	
	return nil
end

--���ܣ����ݲ���˵�������ĵ���Ӧ��Ʒ
--����������˵����
--���أ��Ƿ�ɹ�(1/0)
function tbActivityCompose:ConsumeMaterial(tbMaterial, nConsumeCount, szLogTitle)
	local i
	nConsumeCount = nConsumeCount or 1
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then				
			tbItem.nCount = tbItem.nCount or 1
			local nConsumeItemCount = tbItem.nCount * nConsumeCount
			if nConsumeItemCount > 0 then
				local tbProp = tbItem.tbProp
				local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯
				if self:ConsumeItem(tbRoomItems, nConsumeItemCount, tbItem) ~= 1 then
					return 0;
				end
				self:ConsumeLog(nConsumeItemCount.." "..tbItem.szName, szLogTitle)
			end
		elseif tbItem.nJxb then
			local nConsumeJxb = tbItem.nJxb * tbItem.nCount * nConsumeCount
			if Pay(nConsumeJxb) == 0 then
				return 0;
			else
				Msg2Player(format("C�n <color=yellow>%d<color> l��ng", nConsumeJxb))
				self:ConsumeLog("Jxb "..nConsumeCount.." * "..tbItem.nJxb * tbItem.nCount, szLogTitle)
			end
		elseif tbItem.nTaskId then
			local nConsumeValue = tbItem.nCount * nConsumeCount
			if GetTask(tbItem.nTaskId) < nConsumeValue then
				return 0;
			else
				SetTask(tbItem.nTaskId, GetTask(tbItem.nTaskId) - nConsumeValue)
				Msg2Player(format("Chi tr� <color=yellow>%d <color>%s", nConsumeValue, tbItem.szName))
				self:ConsumeLog("nTask "..nConsumeCount.." * "..tbItem.nCount, szLogTitle)
			end
		elseif tbItem.pConsume then
			local nConsumeCount = tbItem.nCount * nConsumeCount
			if tbItem:pConsume(nConsumeCount) ~= 1 then
				return 0;
			end
			self:ConsumeLog(nConsumeCount.." "..tbItem.szName, szLogTitle)
		end
	end
	return 1;
end


--���ܣ����ݲ���˵�����ز��������Ϣ
--����������˵����
--���أ������Ϣ���ַ���
function tbActivityCompose:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","v�t ph�m ","S� l��ng")
	local _, tbCount, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local i;
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		
		local szColor = "<color=green>"
		if tbMaxCount[i] < 1 then
			szColor = "<color=red>"
		end
		if tbItem.nJxb then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,"Ng�n l��ng", szColor, tbCount[i], tbMaterial[i].nJxb * tbMaterial[i].nCount)
		elseif tbItem.szName and tbItem.nCount then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,tbMaterial[i].szName, szColor, tbCount[i], tbMaterial[i].nCount)
		end
	end
	return szList
end


--���ܣ����ݹ�ʽ�ϳ���Ʒ
--�������ϳɸ����������������������Ĳ���������������
--���أ��Ƿ�ɹ�(1/0)
function tbActivityCompose:Compose(nComposeCount)
	
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct
	
	nComposeCount = nComposeCount or 1
	
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	end
	
	if type(self.tbFormula.pProductFun) == "function" then
		
		self.tbFormula:pProductFun(nComposeCount)

	end
	return 1;
end

--���ܣ������ϳ�GiveUI
--�������Ƿ������ϳ�
--���أ���
function tbActivityCompose:ComposeGiveUI()
	
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("��i %s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbActivityCompose:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>")
	end
	
	self:Compose(1)
	
end
--���ܣ������ϳɶԻ�
--�������ϳɹ�ʽ���Ի��Ļص�����(�ַ�����ʽ)���ص�����������������table��
--���أ���
function tbActivityCompose:ComposeDailog(bIsAskNumber,nMaxCount)
	--�������Ϊ�գ�ʹ��Ĭ��ֵ

	if self.nRoomType == INVENTORY_ROOM.room_giveitem then
		return self:ComposeGiveUI()
	end
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct
	
	local szComposeTitle = self.tbFormula.szComposeTitle or format("��i %s", tbProduct.szName)
	
	local szMsg = format("%s y�u c�u: <enter>%s", szComposeTitle ,self:GetMaterialList(tbMaterial))
	local tbOpt = {}
	if bIsAskNumber == 1 then
		tbOpt[1] = {"X�c nh�n", self.AskNumber, {self, nMaxCount}}
	else
		tbOpt[1] = {"X�c nh�n", self.Compose, {self, 1}}
	end
	tbOpt[2] = {"H�y b� "}
	CreateNewSayEx(szMsg, tbOpt)
end


--���ܣ�д�����ռ�
--���������ĵ�����Ʒ���֣�����������string������־����
--���أ���
function tbActivityCompose:ConsumeLog(szItemName, szLogTitle)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
end


function tbActivityCompose:AskNumber(nMaxCount)	
	if nMaxCount then
		nMaxCount = min(self:CanMakeMaxCount(self.tbFormula.tbMaterial),nMaxCount)
	else
		nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	end

	if nMaxCount < 1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
	else
		
		g_AskClientNumberEx(1, nMaxCount, "Xin m�i nh�p s�", {self.ComposeCountComfirm, {self,nMaxCount}} )
	end
end

function tbActivityCompose:ComposeCountComfirm(nMaxCount, nCount)
--	print("nCount = " .. nCount)
--	print("nMaxCount = " .. nMaxCount)
	if nCount > nMaxCount then
		Say(format("Ng��i nh�p s� l��ng h�p th�nh �� v��t qu�<color=red>%d<color>, xin h�y nh�p l�i", nMaxCount))
		return 0
	end
	
	local nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	if nCount > nMaxCount then
		nCount = nMaxCount
	end

	if self:Compose(nCount) == 0 then
		return 0;
	end
	
	
	return 1;
end




function tbActivityCompose:GetProductName()
	return  self.tbFormula.tbProduct.szName
end

function tbActivityCompose:GetFormulaByString()
	local tbMaterial = self.tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." l��ng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
	end
	return szMsg
end