Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelHongBaoCoef = {}
aLevelHongBaoPrice = {}
aLevelPriceBag = {}		--������ĸ���Ļ��ѹ��׶�
--aLevelPartnerLevel = {} --������ĸ����ͬ��ȼ�����
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\liwu_level_data.txt", "liwuLevelData")
	if b1~=1 then
		print("��c t�p config l� v�t t�c ph��ng th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("liwuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("liwuLevelData", y, "LEVEL"))
		aLevelHongBaoCoef[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "OUTPUT_COEF"))
		aLevelHongBaoPrice[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE"))
		aLevelPriceBag[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE_BAG"))
		--aLevelPartnerLevel[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PARTNER_LEVEL"))
	end
	--TabFile_UnLoad("liwuLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
if MODEL_GAMESERVER == 1 then
IncludeLib("PARTNER")
end

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n L� ph�m ph��ng") ~= 1 then
		return 0
	end
	Say("<#>T�ng qu�n L� ph�m ph��ng: Ng�y ng�y t�ng ��i l�, th�ng th�ng c� tin vui. T�t nay kh�ng nh�n l�, c� ch�ng nh�n h�ng bao!", 3, 
	"Nh�n h�ng bao/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")", "K�ch ho�t t�i h�nh trang/#partner_bag".."("..nTongID..
	","..nWorkshopID..")", "Kh�ng c�n ��u/cancel");
	return 1;
end

function partner_bag(nTongID, nWorkshopID)
	local nBagLevel = GetPartnerBagLevel()
	if (nBagLevel >=10 )then
		Say("<#>T�ng qu�n L� ph�m ph��ng: T�i h�nh trang c�a ng��i �� m� r�ng h�t m�c r�i", 1, "Bi�t r�i/cancel")
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nBagLevel >= nLevel)then
		Say("T�ng qu�n L� ph�m ph��ng: Hi�n t�i t�i h�nh trang c�a ng��i ��t c�p "..nBagLevel..". Hi�n t�i, ��ng c�p s� d�ng c�a L� ph�m ph��ng kh�ng �� �� n�ng c�p t�i h�nh trang.", 
			1, "L�c kh�c ta quay l�i v�y./cancel")
			return
	end
	Say("T�ng qu�n L� ph�m ph��ng: Hi�n t�i t�i h�nh trang c�a ng��i ��t c�p "..nBagLevel..", s� d�ng <color=yellow>"..aLevelPriceBag[nBagLevel+1].."<color> �i�m c�ng hi�n �� n�i r�ng t�i h�nh trang, c� ��ng � kh�ng?",2,
		"Th�t t�t qu�, n�i r�ng c�ng l�n c�ng t�t./#YaoBag("..nTongID..","..nWorkshopID..")", "T�m th�i ch�a c�n thi�t./cancel")
end

function YaoBag(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nToLevel = GetPartnerBagLevel()+1
	if (nToLevel > nLevel)then
		Say("T�ng qu�n L� ph�m ph��ng: Hi�n t�i, ��ng c�p s� d�ng c�a L� ph�m ph��ng kh�ng �� �� n�ng c�p t�i h�nh trang.", 
			1, "L�c kh�c ta quay l�i v�y./cancel")
			return
	end
	if (GetContribution() < aLevelPriceBag[nToLevel])then
		Say("<#>T�ng qu�n L� ph�m ph��ng: �i�m c�ng hi�n kh�ng ��, h�y ra s�c v� bang h�i ��.", 1, "Kh�ng �� sao/cancel")
		return
	end
	AddContribution(-aLevelPriceBag[nToLevel])
	SetPartnerBagLevel(nToLevel)
	Say("<#>T�ng qu�n L� ph�m ph��ng: H�y tin t��ng v�o kh� n�ng c�a ta, ng��i xem, t�i h�nh trang c�a ng��i "..nToLevel.."�� l�m xong r�i, sau n�y c� th� ��n nh�n nhi�u h�ng bao h�n.", 1, 
		"Qu� nhi�n danh b�t h� truy�n/cancel")
	Msg2Player("T�i h�nh trang �� ��t c�p "..nToLevel..", kh�ng gian ch�a l�n h�n ")
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelHongBaoCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡ�����
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelHongBaoPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("S� nh�p v�o c�n l�i *100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n L� ph�m ph��ng: Th�t ��ng ti�c, h�m nay l� ph�m �� ph�t xong, ng�y mai h�y ��n v�y!", 0)
		return 0;
	end
	Say("<#>T�ng qu�n L� ph�m ph��ng: C�n s� d�ng <color=yellow>"..aLevelHongBaoPrice[nLevel].."<color> �i�m c�ng hi�n �� ��i l�y 1 h�ng bao", 2, 
		"���c. /#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Kh�ng mu�n/cancel");
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		Say("<#>T�ng qu�n L� ph�m ph��ng: Th�t ��ng ti�c, �i�m c�ng hi�n kh�ng ��, kh�ng th� nh�n ��i h�ng bao!", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>T�ng qu�n L� ph�m ph��ng: V�t ph�m n�y ch�a c�, h�y ��i khi kh�c!", 0)
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "H�nh trang ph�i c� hai � tr�ng.");
		return 
	end
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		return
	end
	AddContribution(-aLevelHongBaoPrice[nLevel]);
	Msg2Player("B�n ti�u t�n "..aLevelHongBaoPrice[nLevel].."�i�m c�ng hi�n, nh�n ���c 1 c�i bang h�i th�n b� h�ng bao!");
	AddItem(6, 1, 1021, 1, 0, 0, 0);
end
function cancel()
end

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh�ng c� bang h�i"	
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local nPrice  --��ǰ��ȡ���غ���Ĺ��׶�
	local dHongBaoCount	--��ǰÿ�����غ���ղ�����������
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelHongBaoPrice[nUseLevel]
			dHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel] / aLevelHongBaoCoef[1])	
		else
			nPrice = "--"
			dHongBaoCount = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextHongBaoCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelHongBaoPrice[nUseLevel + 1] --�¼���ȡ���غ���Ĺ��׶�
		dNextHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel + 1] / aLevelHongBaoCoef[1]) --�¼�ÿ�����غ���ղ�����������
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextHongBaoCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			"S�n l��ng th�n b� h�ng bao m�i ng�y t�ng l�n: <color=gold>"..dHongBaoCount.."<color> l�n\n"..		
			"�i�m c�ng hi�n �� ��i l�y h�ng bao: <color=gold>"..nPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			"<color=water>S�n l��ng th�n b� h�ng bao m�i ng�y t�ng l�n: <color=Violet>"..dNextHongBaoCount.."<color> l�n\n"..	
			"�i�m c�ng hi�n �� ��i l�y h�ng bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>Ch�a th�nh l�p<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			"<color=water>S�n l��ng th�n b� h�ng bao m�i ng�y t�ng l�n: <color=Violet>"..dNextHongBaoCount.."<color> l�n\n"..	
			"�i�m c�ng hi�n �� ��i l�y h�ng bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end

end