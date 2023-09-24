--��UI����ĺϳ���
--ͨ������tbComposeClass:GetMaterialList(tbMaterial)�Զ������ϳɲ�����Ϣ 
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





Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\string.lua")
if not tbComposeClass then
	
tbComposeClass = tbBaseClass:new()


--����:��ʼ���ϳ���
--��������������������õı�����һ�£�������ȫ�ֵģ����ϳɹ�ʽ����־����
--��
function tbComposeClass:_init(szClassName, tbFormula, szLogTitle)
	szClassName = szClassName or "tbComposeClass"
	
	self.szClassName = szClassName
	self.tbFormula = tbFormula

	self.szLogTitle = szLogTitle or "M�c �inh h�p th�nh"
	setglobal(szClassName, self)
	
	self:MakeAskNumberFunction()
	
end

--���ܣ����ݲ���˵���������ϲ��ϵ����
--����������˵����
--���أ��Ƿ���ȫƥ��(1/0)�����ϸ�����������ϳɸ������
function tbComposeClass:CheckMaterial(tbMaterial, nComposeCount)
	local i
	local flag = 1
	local tbCount  = {}
	local tbMaxSetCount = {}
	nComposeCount = nComposeCount or 1
	
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			tbItem.nCount = tbItem.nCount or 1
			local nItemNeedCount = tbItem.nCount * nComposeCount
			if nItemNeedCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1		
				local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
				tbCount[i] = nCurCount
				tbMaxSetCount[i] = floor(nCurCount / nItemNeedCount)
				if nCurCount < nItemNeedCount then
					flag =  0;
				end	
			end			
		elseif tbItem.nJxb then
			local nCash = GetCash()
			tbCount[i] = nCash
			local nNeedJxb = tbItem.nJxb * nComposeCount
			tbMaxSetCount[i] = floor(nCash / nNeedJxb)
			if nCash < nNeedJxb then
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
function tbComposeClass:CanMakeMaxCount(tbMaterial)
	local _, _, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local nMinCount = tbMaxCount[1]
	for i=2, getn(tbMaxCount) do
		if nMinCount > tbMaxCount[i] then
			nMinCount = tbMaxCount[i]
		end
	end
	return nMinCount;
end

--���ܣ����ݲ���˵�������ĵ���Ӧ��Ʒ
--����������˵����
--���أ��Ƿ�ɹ�(1/0)
function tbComposeClass:ConsumeMaterial(tbMaterial, nConsumeCount, szLogTitle)
	local i
	nConsumeCount = nConsumeCount or 1
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then				
			tbItem.nCount = tbItem.nCount or 1
			local nConsumeItemCount = tbItem.nCount * nConsumeCount
			if nConsumeItemCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1
				--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
				if ConsumeEquiproomItem(nConsumeItemCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
					return 0;
				end
				self:ConsumeLog(nConsumeItemCount.." "..tbItem.szName, szLogTitle)
			end
		elseif tbItem.nJxb then
			local nConsumeJxb = tbItem.nJxb * nConsumeCount
			if Pay(nConsumeJxb) == 0 then
				return 0;
			else
				Msg2Player(format("C�n <color=yellow>%d<color> l��ng", nConsumeJxb))
				self:ConsumeLog("Jxb "..nConsumeCount.." * "..tbItem.nJxb, szLogTitle)
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
function tbComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","v�t ph�m ","S� l��ng")
	local _, tbCount, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local i;
	for i=1,getn(tbMaterial) do
		
		local szColor = "<color=green>"
		if tbMaxCount[i] < 1 then
			szColor = "<color=red>"
		end
		local tbItem = tbMaterial[i]
		if tbItem.nJxb then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,"Ng�n l��ng", szColor, tbCount[i], tbMaterial[i].nJxb)
		elseif tbItem.szName and tbItem.nCount then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,tbMaterial[i].szName, szColor, tbCount[i], tbMaterial[i].nCount)
		end
	end
	return szList
end



--���ܣ����ݹ�ʽ�ϳ���Ʒ
--�������ϳɹ�ʽ��table������־���⣨string���������������������Ĳ���������������
--���أ��Ƿ�ɹ�(1/0)
function tbComposeClass:Compose(tbFormula, szLogTitle, nComposeCount, pFun, ...)
	--�������Ϊ�գ�ʹ��Ĭ��ֵ
	tbFormula	= tbFormula or self.tbFormula
	szLogTitle	= szLogTitle or self.szLogTitle
	
	
	local tbMaterial	= tbFormula.tbMaterial
	local tbProduct		= tbFormula.tbProduct
	
	nComposeCount = nComposeCount or 1
	
	
	if tbFormula.pLimitFun then
		if tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = tbFormula.nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("�� b�o ��m an to�n t�i s�n, xin h�y ��m b�o h�nh trang c�n th�a %d � tr�ng.", nFreeItemCellLimit))
		return 0
	end
	
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
	if type(pFun) == "function" then
		call(pFun, arg)
	end 
	return 1;
end

--���ܣ������ϳɶԻ�
--�������ϳɹ�ʽ���Ի��Ļص�����(�ַ�����ʽ)���ص�����������������table��
--���أ���
function tbComposeClass:ComposeDailog(tbFormula, szFunctionFormat, bIsAskNumber)
	--�������Ϊ�գ�ʹ��Ĭ��ֵ
	tbFormula			= tbFormula or self.tbFormula
	local szDefaultFunctionFormat = format("#%s:Compose(nil,nil, 1)", self.szClassName)
	if bIsAskNumber then
		szDefaultFunctionFormat = format("#%s:AskNumber()", self.szClassName)
	end
	szFunctionFormat	= szFunctionFormat or szDefaultFunctionFormat
	local tbMaterial = tbFormula.tbMaterial
	local tbProduct = tbFormula.tbProduct
	local szComposeTitle = tbFormula.szComposeTitle or format("��i %s", tbProduct.szName)
	local szMsg = format("<dec>%s c�n: <enter>%s", szComposeTitle ,self:GetMaterialList(tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("X�c nh�n/%s", szFunctionFormat ),
		"H�y b� /OnCancel"
	}
	CreateTaskSay(tbSay)
end


--���ܣ�д�����ռ�
--���������ĵ�����Ʒ���֣�����������string������־����
--���أ���
function tbComposeClass:ConsumeLog(szItemName, szLogTitle)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
end


function tbComposeClass:AskNumber()	
	local nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	if nMaxCount < 1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
	else
		AskClientForNumber(format("%s__AskNumberCallBack", self.szClassName), 1, nMaxCount, "Xin m�i nh�p s�");
	end
end

function tbComposeClass:ComposeCountComfirm(nCount)
	
	local nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	if nCount > nMaxCount then
		nCount = nMaxCount
	end
	
--	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
--	
--	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nCount)
--	
--	if CalcFreeItemCellCount() < nFreeItemCellLimit then
--		return Say(format("Ϊ�����Ĳ��ﰲȫ���뱣֤������%d�������ռ�", nFreeItemCellLimit))
--	end

	if self:Compose(nil, nil, nCount) == 0 then
		return 0;
	end
	
	
	return 1;
end

function tbComposeClass:MakeAskNumberFunction()
	local szFunctionName = format("%s__AskNumberCallBack", self.szClassName)
	local szMsg = format("function %s(nCount) local self = getglobal([[%s]]) return self:ComposeCountComfirm(nCount) end",
					szFunctionName, self.szClassName)
	dostring(szMsg)
end


function tbComposeClass:GetProductName(tbFormula)
	tbFormula	= tbFormula or self.tbFormula
	local tbProduct		= tbFormula.tbProduct
	return tbProduct.szName
end

function tbComposeClass:GetFormulaByString(tbFormula)
	tbFormula	= tbFormula or self.tbFormula
	local tbMaterial = tbFormula.tbMaterial
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


tbComposeClass:_init()

end