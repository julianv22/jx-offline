-- Program reset kinh mach -- Thinh Nguyen
Include("\\script\\global\\meridian\\meridian.lua")

function main()
	kinhmach()
end

--------------------------------------------------Kinh mach ------------------------------------------
function kinhmach()
	local szTitle = "Xin ch�o <color=red>"..GetName().."<color> ! ��i hi�p mu�n s� d�ng ch�c n�ng g�?"
	local tbOpt={}
	tinsert(tbOpt, "��i Huy�t Long ��ng/doi_HLD")
	tinsert(tbOpt, "Reset kinh m�ch/reset_kinhmach_dialog")
	tinsert(tbOpt, "Nh�n max kinh m�ch/nhanmax_kinhmach")
	tinsert(tbOpt, "Nh�n kinh m�ch c�p 4/nhan_kinhmach_4")
	tinsert(tbOpt, "Ph�c h�i chi�u h� tr� sau t�y t�y/restore_skillkinhmach")
	tinsert(tbOpt, "K�t th�c ��i tho�i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function doi_HLD()
	local szTitle = "��i hi�p mu�n ��i Huy�t Long ��ng �� xung <color=yellow>huy�t th� m�y<color>?"
	local tbOpt={}
	for i = 5, 10 do
		tinsert(tbOpt, format("Huy�t th� %d/#give_HLD(%d)", i, i))
	end
	tinsert(tbOpt, "Trang sau/doi_HLD2")
	tinsert(tbOpt, "K�t th�c ��i tho�i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function doi_HLD2()
	local szTitle = "��i hi�p mu�n ��i Huy�t Long ��ng �� xung <color=yellow>huy�t th� m�y<color>?"
	local tbOpt={}
	for i = 11, 16 do
		tinsert(tbOpt, format("Huy�t th� %d/#give_HLD(%d)", i, i))
	end
	tinsert(tbOpt, "Trang tr��c/doi_HLD")
	tinsert(tbOpt, "K�t th�c ��i tho�i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

function give_HLD(nLevel)
	local szTitle = "�� xung <color=yellow>huy�t th� "..nLevel.."<color>, <color=green>m�t ��i H� M�ch ��n<color> ��i ���c <color=yellow>m�t Huy�t Long ��ng<color>, ��i hi�p mu�n ��i bao nhi�u vi�n?"
	local tbOpt={}
	tinsert(tbOpt, "10 vi�n/#buy_HLD("..nLevel..",10)")
	tinsert(tbOpt, "30 vi�n/#buy_HLD("..nLevel..",30)")
	tinsert(tbOpt, "50 vi�n/#buy_HLD("..nLevel..",50)")
	tinsert(tbOpt, "K�t th�c ��i tho�i./no")			
	Say(szTitle, getn(tbOpt), tbOpt)
end

local tbHLD = 
{
	[5] = {szName = "Huy�t Long ��ng c�p 4", tbProp = {6, 1, 30289,4}, nCount = 10}, --Item c�p 4
	[6] = {szName = "Huy�t Long ��ng c�p 5", tbProp = {6, 1, 30289,5}, nCount = 10}, --Item c�p 5
	[7] = {szName = "Huy�t Long ��ng c�p 6", tbProp = {6, 1, 30289,6}, nCount = 10}, --Item c�p 6
	[8] = {szName = "Huy�t Long ��ng c�p 2", tbProp = {6, 1, 3328,2}, nCount = 10},
	[9] = {szName = "Huy�t Long ��ng c�p 8", tbProp = {6, 1, 30289,8}, nCount = 10}, --Item c�p 8
	[10] = {szName = "Huy�t Long ��ng c�p 9", tbProp = {6, 1, 30289,9}, nCount = 10},--Item c�p 9
	[11] = {szName = "Huy�t Long ��ng c�p 5", tbProp = {6, 1, 3328,5}, nCount = 10},
	[12] = {szName = "Huy�t Long ��ng c�p 6", tbProp = {6, 1, 3328,6}, nCount = 10},
	[13] = {szName = "Huy�t Long ��ng c�p 12", tbProp = {6, 1, 30289,12}, nCount = 10},--Item c�p 12
	[14] = {szName = "Huy�t Long ��ng c�p 8", tbProp = {6, 1, 3328,8}, nCount = 10},
	[15] = {szName = "Huy�t Long ��ng 14", tbProp = {6, 1, 30289,14}, nCount = 10},--Item c�p 14
	[16] = {szName = "Huy�t Long ��ng c�p 10", tbProp = {6, 1, 3328,10}, nCount = 10},
}

function buy_HLD(nLevel, num)
	Msg2Player("Level c�n mua l� "..nLevel)
	if CalcItemCount(3, 6, 1, 4418, -1) < num then
		Talk(1, "", format("Ng��i kh�ng c� �� <color=yellow>%d ��i H� M�ch ��n.", num))
	else
		local tbItem = %tbHLD[nLevel]
		AddStackItem(num, 6, 1, tbItem.tbProp[3], tbItem.tbProp[4], 0, 0, 0)
		Msg2Player(format("��i ���c <color=yellow>%d vi�n %s<color>.", num, tbItem.szName))
		ConsumeItem(3, num, 6, 1, 4418, -1)
	end
	
end

function restore_skillkinhmach()
	if (HaveMagic(1993) == 0) then 
		if (GetMagicPoint()>=1) then
			AddMagicPoint(-1)
			AddMagic(1993, 1) 
			Msg2Player("�� kh�i ph�c <color=yellow>Kinh m�ch s� c�p.")
		else
			Talk(1, "", "C�n �t nh�t 1 �i�m k� n�ng �� t�ng chi�u h� tr�.")
			return 
		end
	else
		Talk(1, "", "Ng��i kh�ng c� g� c�n h� tr� th�m c�.")
	end
	if (HaveMagic(1994) == 0) then 
		if (GetMagicPoint()>=1) then
			AddMagicPoint(-1)
			AddMagic(1994, 1) 
			Msg2Player("�� kh�i ph�c <color=yellow>Kinh m�ch trung c�p.")
		else
			Talk(1, "", "C�n �t nh�t 1 �i�m k� n�ng �� t�ng chi�u h� tr�.")
			return 
		end 
	end
end

function nhan_kinhmach_4()
	for i= 1, 8 do 
			SetTask(4000+i, 4) -- 8 ���ng kinh m�ch � c�p 4
	end
	SetUpSkillIDAndLevel()
	Talk(1, "KickOutSelf", "Ng��i nh�n ���c 8 ���ng kinh m�ch c�p 4.")
end

function max_kinhmach()
	local nTotal = 0
	for i= 4001, 4008 do 
		nTotal = nTotal + GetTask(i)
	end
	if nTotal == 8*16 then
		return 1;
	else
		return 0;
	end
end

function reset_kinhmach_dialog()
	local szTitle = "Mu�n tr�ng luy�n kinh m�ch c�n ph�i max kinh m�ch hi�n th�i.\n"
	szTitle = szTitle.."Ngo�i ra ph�i ti�u hao <color=yellow>100 ��i h� m�ch ��n v� 50 000 �i�m Ch�n nguy�n.<color>\n"
	szTitle = szTitle.."��i h� m�ch ��n c� th� t�m ���c khi ti�u di�t <color=yellow>K� tr�m ch�n nguy�n<color> tr�n t�i <color=yellow>Ba L�ng Huy�n, 180, 213.<color>\n"
	local tbOpt={}
	tinsert(tbOpt, "Ta mu�n t�m hi�u th�m./info_rskinhmach")
	tinsert(tbOpt, "Ta ��ng � ti�n h�nh tr�ng luy�n./reset_kinhmach")
	tinsert(tbOpt, "Ta s� t�m �ng sau./thongbao_nhiemvu_kinhmach")	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function thongbao_nhiemvu_kinhmach()
	Msg2Player("K� tr�m ch�n nguy�n �ang tr�n t�i <color=yellow>Ba L�ng Huy�n, 180, 213.<color>")
	Talk(1, "", "H�y ti�u di�t nh�ng k� tr�m ch�n nguy�n t�i <color=yellow>Ba L�ng Huy�n, 180, 213.<color>.")
end

function info_rskinhmach()
	local szTitle = "Tr�ng luy�n kinh m�ch l�n 1 s� s� h�u <color=yellow>Kinh m�ch s� c�p<color>, b�o l�u 40\% tuy�t k� �� h�c.\n"
	szTitle = szTitle.."Tr�ng luy�n kinh m�ch l�n 2 s� s� h�u <color=yellow>Kinh m�ch trung c�p<color>, b�o l�u 50\% tuy�t k� �� h�c.\n"
	szTitle = szTitle.."Sau khi tr�ng luy�n, nh�n ���c 8 ���ng kinh m�ch � <color=yellow>c�p 4/16.<color>\n"
	local tbOpt={}
	tinsert(tbOpt, "Quay l�i./reset_kinhmach_dialog")
	tinsert(tbOpt, "K�t th�c ��i tho�i./no")	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function reset_kinhmach()
	if max_kinhmach() == 0 then
		Talk(1, "", "Kinh m�ch hi�n t�i c�a ng��i v�n ch�a max, ch�a th� tr�ng luy�n kinh m�ch.")
	else
		local nCN = 50000
		local nDHMD = 100
		if GetTask(4000) < nCN or CalcItemCount(3, 6, 1, 4418, -1) < nDHMD then
			Talk(1, "", format("Ng��i kh�ng c� �� %d Ch�n Nguy�n v� %d ��i H� M�ch ��n.", nCN, nDHMD))
		else
			ConsumeItem(3, nDHMD, 6, 1, 4418, -1)
			SetTask(4000, GetTask(4000) - nCN)
			rskinhmach_nhanskill()
		end
	end
end

function rskinhmach_nhanskill()
	for i= 1, 8 do 
			SetTask(4000+i, 4) -- 8 ���ng kinh m�ch � c�p 4
	end
	SetUpSkillIDAndLevel()
	if HaveMagic(1993) >= 0 then
		AddMagic(1994,1)
		Talk(1, "KickOutSelf", "Ng��i �� tr�ng luy�n to�n b� kinh m�ch, l�nh h�i ���c Kinh m�ch trung c�p.")
	else
		AddMagic(1993,1)
		Talk(1, "KickOutSelf", "Ng��i �� tr�ng luy�n to�n b� kinh m�ch, l�nh h�i ���c Kinh m�ch s� c�p.")
	end
end

function nhanmax_kinhmach()
	if (HaveMagic(1993) >= 0) or (HaveMagic(1994) >= 0) then
		Talk(1, "", "Tr�nh �� c�a ng��i �� cao r�i, ��ng �n gian n�a.")
	else
		local szTitle = "�� nh�n max kinh m�ch c�n ti�u hao 60 000 Ch�n Nguy�n v� 30 000 H� M�ch ��n? Ng��i c� ch�c kh�ng?"
		local tbOpt={}
		tinsert(tbOpt, "Ta ch�c ch�n/nhanmax_kinhmach_sure")
		tinsert(tbOpt, "Th�i./no")			
		Say(szTitle, getn(tbOpt), tbOpt)
	end
end

function nhanmax_kinhmach_sure()
	local nCN = 60000
	local nHMD = 30000
	if GetTask(4000) < nCN or CalcItemCount(3, 6, 1, 3203, -1) < nHMD then
		Talk(1, "", format("Ng��i kh�ng c� �� %d Ch�n Nguy�n v� %d H� M�ch ��n.", nCN, nHMD))
	else
		ConsumeItem(3, nHMD, 6, 1, 3203, -1)
		SetTask(4000, GetTask(4000) - nCN)
		set_max_kinhmach()
	end
end

function set_max_kinhmach()
	for i= 1, 8 do 
			SetTask(4000+i, 16)
	end
	SetUpSkillIDAndLevel()
	Talk(1, "KickOutSelf", "Ng��i �� nh�n ���c 8 ���ng kinh m�ch max.")
end