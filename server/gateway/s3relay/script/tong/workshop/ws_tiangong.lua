Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelRepairScale = {}
aLevelRepairLevel = {}
aLevelEnhanceAdd = {}
aLevelContributionCoef = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tiangong_level_data.txt", "tiangongLevelData")
	if b1~=1 then
		print("��c t�p config Thi�n c�ng ph��ng th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("tiangongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tiangongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "OUTPUT_COEF"))
		aLevelRepairScale[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_SCALE"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "CONTRIBUTION_COEF"))
		aLevelRepairLevel[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_LEVEL"))
		aLevelEnhanceAdd[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "ENHANCE_ADD"))
	end
	--TabFile_UnLoad("tiangongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n Thi�n c�ng ph��ng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"S�a th�ng th��ng/#repair_ok1".."("..nTongID..","..nWorkshopID..")",
		"s�a gia c�/#repair_ok2".."("..nTongID..","..nWorkshopID..")",
		"Nh�n ���c t�i �� ngh�/#use_xiulibao("..nTongID..","..nWorkshopID..")",
		"Kh�ng c�n ��u/cancel"
	}
	Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Vi�c s�a ch�a lo�i th�n binh l�i kh� trong bang ��u do m�t tay ta ��m tr�ch.", getn(aryszContent), aryszContent);
	return 1;
end

--------------------------------------------------------------------------------------------
VALUE_XIULIBAO_CONTRIBUTION = 50	--�Ͻ����Ҫ�ĸ��˹��׶�
function use_xiulibao(nTongID, nWorkshopID)
	Say("T�ng qu�n Thi�n c�ng ph��ng: H�nh t�u giang h�, trang b� th��ng xuy�n b� h� h�ng? Gi� ��y ng��i c� th� mua t�i �� ngh�, kh�ng c�n quay v� th�nh, ch� c�n d�ng n� th� ng��i c� th� s�a trang b� b�t c� ��u, v� ���ng nhi�n ph�i tr� chi ph� t��ng ���ng. T�i �� ngh� c� th�i h�n s� d�ng l� 1 tu�n, c�n ti�u ph� <color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> �i�m c�ng hi�n �� ��i, ng��i c� ��ng � kh�ng?", 3,
	"��i 1 t�i �� ngh�/#tg_sure2xiulibao("..nTongID..","..nWorkshopID..")",
	"T�i �� ngh� l� g�?/tg_helpxiulibao",
	"Ta bi�t r�i/cancel")
end

function tg_helpxiulibao()
	Say("T�ng qu�n Thi�n c�ng ph��ng: T�i �� ngh� s� gi�p ng��i s�a ch�a trang b� b�t k� th�i gian v� ��a �i�m, ch� c�n nh�p chu�t ph�i s� d�ng th� c�ng s� gi�ng nh� ��n c�c c�a h�ng trong th�nh, v� d� nhi�n c�ng ph�i tr� m�t chi ph� t��ng ���ng. T�i �� ngh� c� th�i h�n s� d�ng l� m�t tu�n, th�i gian s� t�nh t� khi b�t ��u mua, v� th� c� mua nhi�u c�i c�ng m�t l�c th� c�ng kh�ng c� t�c d�ng.", 0)
end

function tg_sure2xiulibao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Th�t ��ng ti�c, Thi�n c�ng ph��ng �ang t�m ng�ng ho�t ��ng. Ng�n s�ch chi�n b� c�n t�ng �� chi ph� b�o tr� h�ng tu�n, th� 12h ��m c�ng ng�y T�c ph��ng m�i ho�t ��ng tr� l�i.", 0)
		Msg2Player("T�c ph��ng �ang t�m ng�ng ho�t ��ng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Ng��i ch�a gia nh�p bang, t�m ��n ta c� vi�c g�?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--���ʹ�õȼ�
	if (nUseLevel < 4) then
		Say("<#>��ng c�p s� d�ng Thi�n c�ng ph��ng ch�a �� c�p 4, kh�ng th� nh�n ���c bang v�t.", 0)
		Msg2Player("��ng c�p s� d�ng t�c ph��ng ch�a �� c�p 4, kh�ng th� s� d�ng ch�c n�ng n�y.kh�ng th� s� d�ng ch�c n�ng n�y")
		return
	end
	if (GetContribution() < VALUE_XIULIBAO_CONTRIBUTION or AddContribution(-VALUE_XIULIBAO_CONTRIBUTION) ~= 1)then
		Say("Th�t ��ng ti�c, �i�m c�ng hi�n kh�ng �� <color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> �i�m, kh�ng th� ��i l�y bang v�t.", 0)
		Msg2Player("�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� s� d�ng ch�c n�ng n�y.")
		return 0
	end
	local nItemIndex = AddItem(6,1,1084,1,1,0);
	local nTime = GetCurServerTime() + 7 * 24 * 60 * 60;
	local nDate = FormatTime2Number(nTime);
	local nYear = floor(nDate/100000000);
	local nMMDD = floor( mod(nDate, 100000000) / 10000 );
	local nHour = floor( mod(nDate, 10000) / 100 );
	SetSpecItemParam(nItemIndex, 1, nTime);
	SetSpecItemParam(nItemIndex, 2, nYear);
	SetSpecItemParam(nItemIndex, 3, nMMDD);
	SetSpecItemParam(nItemIndex, 4, nHour);
	SyncItem(nItemIndex);
	Msg2Player("��i ���c 1 T�i �� ngh�, th�i gian s� d�ng c�n l�i l� 7 ng�y.")
	Say("��i ���c 1 T�i �� ngh�, th�i gian s� d�ng c�n l�i l� 7 ng�y.", 0)
end
--------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��칤
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ���ղ�����ֵ��
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
		return 0
	end
	return 1
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function repair_ok1(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function repair_ok2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: H�m nay b�n vi�c qu�, kh�ng th� gi�p ng��i s�a gia c� trang b�, ng�y mai h�y ��n nh�!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 2)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..","..nWorkshopID..","..nUse..")")
end

function CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>T�ng qu�n Thi�n c�ng ph��ng: ��ng c�p Thi�n c�ng ph��ng hi�n t�i kh�ng th� s�a ch�a trang b� n�y.", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>T�ng qu�n Thi�n c�ng ph��ng: ��ng c�p Thi�n c�ng ph��ng hi�n t�i kh�ng th� s�a ch�a trang b� n�y.", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>T�ng qu�n thi�n c�ng ph��ng: Trang b� b�ch kim kh�ng th� s�a ���c.", 0)
		return
	end
		
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1)then
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur * aLevelRepairScale[nLevel]/100;
		local nCostlyPrice = nCheapPrice * 3; -- ���޵�����
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("T�ng qu�n Thi�n c�ng ph��ng: <#>", 3, "S�a k�: "..nCostlyPrice.." l��ng, ti�u hao �i�m c�ng hi�n:  "..(nCostContribution*3).."�i�m/#Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..(nCostContribution*3)..")", 
		"S�a ��n gi�n: "..nCheapPrice.." l��ng, ti�u hao �i�m c�ng hi�n:  "..nCostContribution.." �i�m, �� b�n gi�m "..nLostDur.."�i�m/#Cheap_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCheapPrice..","..nCostContribution..")", "Kh�ng c�n ��u/cancel")
		return	
	end
	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>T�ng qu�n Thi�n c�ng ph��ng: S�a ch�a trang b� n�y c�n ti�u hao:  "..nCostlyPrice.." l��ng, ti�u hao �i�m c�ng hi�n: <color=yellow>"..nCostContribution.."<color> �i�m, ng��i ��ng � kh�ng?", 2, "S�a ch�a/#TG_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..nCostContribution..")", "Kh�ng c�n ��u/cancel")
end

function EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nCurDur = GetCurDurability(nItemIdx)
	local nFixDur = nMaxDur - nCurDur
	_dbgMsg("Gi� tr� l��ng c�n l�i"..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0)then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: H�m nay b�n vi�c qu�, kh�ng th� gi�p ng��i s�a gia c�, ng�y mai h�y ��n nh�!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>T�ng qu�n Thi�n c�ng ph��ng: ��ng c�p Thi�n c�ng ph��ng hi�n t�i kh�ng th� s�a ch�a trang b� n�y.", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>T�ng qu�n Thi�n c�ng ph��ng: ��ng c�p Thi�n c�ng ph��ng hi�n t�i kh�ng th� s�a ch�a trang b� n�y.", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>T�ng qu�n thi�n c�ng ph��ng: Trang b� b�ch kim kh�ng th� s�a ���c.", 0)
		return
	end
	
	local nDurPrice = GetRepairDurPrice(nItemIdx);
	--ǿ������ӳɵļ�ֵ
	if (nPrice < 0)then
		nPrice = 0
	end
	local nDstDur = floor(nMaxDur * (1+aLevelEnhanceAdd[nLevel]/100))
	if (nDstDur > 255) then
		nDstDur = 255;
	end
	if (nCurDur > nMaxDur)then
		nFixDur = floor(nDstDur - nCurDur)
	else
		nFixDur = floor(nDstDur - nMaxDur)
	end
	if (nFixDur <= 0)then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Trang b� n�y kh�ng th� gia c� n�a!", 0)
		return
	end	
	local nEnhancePrice = nDurPrice * nFixDur * 1.5
	nPrice = nPrice + nEnhancePrice
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1)then
		nFixDur = nMaxDur - nCurDur
		if (nFixDur < 0)then
			nFixDur = 0
		end
--		if (GetOrgMaxDurability(nItemIdx) ~= nMaxDur)then
--			Say("<#>�칤���ܹܣ�����;ö�����ʧ��װ������ǿ������")
--			return
--		end
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		--��ͨ����Ӧ��۸�
		local nCheapPrice = nDurPrice * nFixDur;
		--ǿ������
		if (nCurDur > nMaxDur)then
			nFixDur = floor(nDstDur - nCurDur)
		else
			nFixDur = floor(nDstDur - nMaxDur)
		end	
		if (nFixDur <= 0)then
			Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Trang b� n�y kh�ng th� gia c� n�a!", 0)
			return
		end	
		--����ǿ������۸�
		local nEnhancePrice = nDurPrice * nFixDur * 1.5
		--ǿ�����������޵ļ۸���	
		nEnhancePrice = nEnhancePrice*3	
		--�ܼ�
		nCheapPrice = nCheapPrice *3 + nEnhancePrice
		--���ۺ�
		local nPayPrice = floor(nCheapPrice * aLevelRepairScale[nLevel]/100)
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: S�a gia c� trang b� n�y c�n ti�u ph�: "..nPayPrice.." l��ng, ti�u hao �i�m c�ng hi�n: <color=yellow>"..nCostContribution..
		"<color> �i�m, sau khi gia c�, �� b�n c�a trang b� l� "..nDstDur, 2, "S�a ch�a/#EH_Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nPayPrice..
				","..nCostContribution..","..nEnhancePrice..")", "Kh�ng c�n ��u/cancel")
		return	
	end	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>T�ng qu�n Thi�n c�ng ph��ng: S�a gia c� trang b� n�y c�n ti�u ph�: "..nCostlyPrice.." l��ng, ti�u hao �i�m c�ng hi�n: <color=yellow>"..nCostContribution.."<color> �i�m, sau khi gia c�, �� b�n c�a trang b� l� "..nDstDur, 2, "S�a ch�a/#Enhance_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..
			","..nCostContribution..","..nEnhancePrice..")", "Kh�ng c�n ��u/cancel")
end

function RepairCallBack(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	elseif (nUse == 2)then
		EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	end
end

function TG_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	if (GetCash() < nCostPrice) then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Ng�n l��ng kh�ng ��, c� �� r�i h�y quay l�i t�m ta!", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: �i�m c�ng hi�n kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��!", 0)
		return
	end
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
	--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
end

function Enhance_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	if (GetCash() < nCostPrice) then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Ng�n l��ng kh�ng ��, c� �� r�i h�y quay l�i t�m ta!", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: �i�m c�ng hi�n kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	EH_SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx) * (1+aLevelEnhanceAdd[nLevel]/100))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
end
--����
function Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: �i�m c�ng hi�n kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��!", 0)
		return
	end
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIdx, nCurMaxDur)
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCostPrice..") l��ng, ("..nCostContribution..") �i�m c�ng hi�n, s�a k� trang b� Ho�ng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Ng�n l��ng kh�ng ��, c� �� r�i h�y quay l�i t�m ta!", 0)
		return
	end
end
--����
function Cheap_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: �i�m c�ng hi�n kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��!", 0)
		return
	end
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		AddContribution(-nCostContribution)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCostPrice..") l��ng, "..nCostContribution.." �i�m c�ng hi�n, s�a ��n gi�n trang b� Ho�ng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nFixMaxDur..") , �� b�n l�n nh�t gi�m xu�ng, "..nLostDur.."�i�m");
	else
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Ng�n l��ng kh�ng ��, c� �� r�i h�y quay l�i t�m ta!", 0)
		return
	end
end
--ǿ������
function EH_Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: �i�m c�ng hi�n kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		EH_SetCurDurability(nItemIdx, nCurMaxDur* (1+aLevelEnhanceAdd[nLevel]/100))
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCostPrice..") l��ng, ("..nCostContribution..") �i�m c�ng hi�n, s�a gia c� trang b� Ho�ng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>T�ng qu�n Thi�n c�ng ph��ng: Ng�n l��ng kh�ng ��, c� �� r�i h�y quay l�i t�m ta!", 0)
		return
	end
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
	local nScale  --��ǰά��װ��������
	local dAdvanceRepairCount	--��ǰÿ��ǿ�������������
	local nAdvanceEnhance --��ǰǿ�������;öȳ������޵İٷֱ�
	local szRepairKind --��ǰ��ά�޵�װ��Ʒ��
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelRepairScale[nUseLevel] / 10)
			dAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])
			nAdvanceEnhance = aLevelEnhanceAdd[nUseLevel]
			if(aLevelRepairLevel[nUseLevel] == 1) then
				szRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>"
			elseif(aLevelRepairLevel[nUseLevel] == 2) then
				szRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>, <color=Violet>trang b� t�m<color>"
			else
				szRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>, <color=Violet>trang b� t�m<color>, <color=gold>trang b� Ho�ng Kim<color>"
			end
		else
			nScale = "--"
			dAdvanceRepairCount = "--"
			nAdvanceEnhance = "--"
			szRepairKind = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextAdvanceRepairCount,nNextAdvanceEnhance,szNextRepairKind
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then		
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextScale = format("%.1f",aLevelRepairScale[nUseLevel + 1] / 10) --�¼�ά��װ��������
		dNextAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ��ǿ�������������
		nNextAdvanceEnhance = aLevelEnhanceAdd[nUseLevel + 1]
		if(aLevelRepairLevel[nUseLevel + 1] == 1) then
			szNextRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>"
		elseif(aLevelRepairLevel[nUseLevel + 1] == 2) then
			szNextRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>, <color=Violet>trang b� t�m<color>"
		else
			szNextRepairKind = "<color=white>Trang b� tr�ng<color>, <color=water>trang b� xanh<color>, <color=Violet>trang b� t�m<color>, <color=gold>trang b� Ho�ng Kim<color>"
		end
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextAdvanceRepairCount = "--"
		szNextRepairKind = "<color=Violet>--<color>"
		nNextAdvanceEnhance = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			"Ch�ng lo�i trang b� c� th� s�a ch�a: "..szRepairKind.."\n"..
			"�i�m �u ��i s�a ch�a: <color=gold>"..nScale.."<color> ph�n tr�m\n"..
			"S�a gia c� �� b�n v��t gi�i h�n: <color=gold>"..nAdvanceEnhance.."%<color>\n"..
			"M�i ng�y t�ng l��ng s�a gia c� t�ng l�n: <color=gold>"..dAdvanceRepairCount.."<color> l�n\n"..		
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			"<color=water>Ch�ng lo�i c� th� s�a ch�a: "..szNextRepairKind.."\n"..
			"�i�m �u ��i s�a ch�a: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"S�a gia c� �� b�n v��t gi�i h�n: <color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"M�i ng�y t�ng l��ng s�a gia c� t�ng l�n: <color=Violet>"..dNextAdvanceRepairCount.."<color> l�n\n"..	
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>Ch�a th�nh l�p<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			"<color=water>Ch�ng lo�i c� th� s�a ch�a: "..szNextRepairKind.."\n"..
			"�i�m �u ��i s�a ch�a: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"S�a gia c� �� b�n v��t gi�i h�n: <color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"M�i ng�y t�ng l��ng s�a gia c� t�ng l�n: <color=Violet>"..dNextAdvanceRepairCount.."<color> l�n\n"..	
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end

end