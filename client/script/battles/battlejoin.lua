--coding by romandou 2004-12-22
--ս�۵ı�����Npc�Ի��ű�

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

Include("\\script\\battles\\vngbattlesign.lua")


function main()
dofile("script/battles/battlejoin.lua");	
	local nWorld, _, _ = GetWorldPos()
	--if nWorld ~= 162 then
		--Talk(1, "", "Ch�c n�ng �� ��ng.")
		--return
	--end
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
		Say("��i qu�n c�a ta v�n ch�a xu�t ph�t! H�y t�m th�i ngh� ng�i ��i tin nh�!",0)
		SubWorld = nOldSubWorld
		return
	end

-------------------------------------------------------------------	
--�ж���ҵȼ��뱨����ȼ��Ƿ����ʺ�
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --��ҵȼ�
	local bt_level = 0;	-- ��ǰ��ͼ������ս�۵ȼ�
	
	if (pl_level < 40 ) then
		Say("Chi�n tr��ng ch� d�nh cho ng��i t� c�p 40 tr� l�n, ng��i ch�a �� �i�u ki�n. C� g�ng t�p luy�n th�m �i!",2, "���c!/bt_oncancel", "Ta mu�n t�m hi�u th�ng tin chi�n d�ch./bt_onbattleinfo");--��������ĵȼ�С��40������û�д�����������
		SubWorld = nOldSubWorld
		return 
	elseif (pl_level < 80) then
		bt_level = 1
	elseif (pl_level < 120) then
		bt_level = 2
	else
		bt_level = 3
	end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("B�o danh T�ng Kim, ID c� v�n ��, xin b� ph�n v�n h�nh ki�m tra g�p!");
		 	SubWorld = nOldSubWorld
		 	return 	
		 end
		 Say("Khu v�c n�y l� "..szGAME_GAMELEVEL[maplevel]..", ��ng c�p c�a ng��i hi�n gi� ch� c� th� "..szGAME_GAMELEVEL[bt_level].."�� b�o danh!", 0)--����û�зֵȼ�����ʾ��Ϣ		 
		 SubWorld = nOldSubWorld
		 return
	end

-------------------------------------------------------------------	
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("Ti�n ph��ng c� v�n ��, t�m th�i kh�ng th� ti�n h�nh T�ng Kim ��i chi�n!", 0 )
		SubWorld = nOldSubWorld
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin l�i! ��i chi�n v�n ch�a b�t ��u! L�n sau quay l�i nh�!", 0 )
		SubWorld = tempSubWorld;		
		return
	elseif (state == 3) then
		Say("Xin l�i! ��i chi�n �� k�t th�c! L�n sau quay l�i nh�!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin l�i! ��i chi�n �� k�t th�c! L�n sau quay l�i nh�!", 0)
		SubWorld = nOldSubWorld
		return 
	end

	if (bt_ncamp == 1) then
		Say("Chi�n d�ch ["..battlename.."]Chi�n d�ch �� b�t ��u, m�i ng��i h�y v� t� d�n ��i t�ng, t�c ng� c� c�u: Thi�n h� h�ng vong, th�t phu h�u tr�ch. Nay ng��i kim x�m ph�m b� c�i ch�ng ta, ��y l� l�c b�o hi�u ��t n��c, ch� c�n c�p 40 tr� l�n v� c�n 1T�ng Kim Chi�u Binh L�nh B�i th� c� th� ��n ��p qu�c gia r�i, n�o ng��i anh em c�n ch�n ch� g� n�a!", 2, "Ta tham gia! (�i�m t�ch l�y tr� v� 0) /bt_joinsong", "�� ta suy ngh� l�i!/bt_oncancel");
	else
		Say("Chi�n d�ch ["..battlename.."]Chi�n d�ch �� b�t ��u, h�i c�c v� d�ng s� Kim qu�c, th�i kh�c nh�t th�ng thi�n h� v� d�p b�n T�ng qu�c nam man c�n ���ng c�a ch�ng ta �� ��n. Nay Kim qu�c r�t c�n s� tr� l�c c�a c�c ng��i, ch� c�n c�p 40 tr� l�n v� n�p 1 T�ng Kim Chi�u Binh L�nh B�i l� c� th� ��n ��p qu�c gia r�i, n�o ng��i anh em c�n ch�n ch� g� n�a!", 2, "Ta tham gia! (�i�m t�ch l�y tr� v� 0) /bt_joinjin", "�� ta suy ngh� l�i!/bt_oncancel");
	end
	SubWorld = nOldSubWorld
	return	
end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
--if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
	if (bt_ncamp == 1) then
		Say("Nh�n ng��i m�t la m�y lo�t, nh�t ��nh l� Kim qu�c gian t�! Ng��i ��u! B�t l�y h�n!",0)
		Msg2Player("Ng��i �� ��u qu�n cho Kim qu�c, h�y ��n g�p M� binh quan xin nh�p chi�n tr��ng!")
	else
		Say("T�n Nam man kia, c� gan th�m nh�p v�o l�nh ��a ��i Kim, r� r�ng l� t� t�m c�i ch�t!",0)
		Msg2Player("Ng��i �� ��u qu�n cho Kim qu�c, h�y ��n g�p M� binh quan xin nh�p chi�n tr��ng!")	
	end;
	SubWorld = nOldSubWorld
	return 
end

----------------------------------------------------------------------
--��ʽ����ʱ�������ǣ�
--1���Ѿ����˱��ε�ս��
--2���Ѿ��Ǳ���ս�۵���Ӫ��
--3���뱾��ս�ֵ�ս�ֵȼ������

--��ʽ���Ա�����

	--Storm ������ս
	say_index = 1
	storm_ask2start(1)
end;

--�������ν��ս�Ի�
function storm_goon_start()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	say_index = 1
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		return
	end
	
	local tb_words = {
		"Tr�ng tr�n �� r�n vang! Sao ng��i ch�a tham gia chi�n?",
		"Ch�c m�ng b�n �� ch�nh th�c tr� th�nh t��ng s� c�a ��i T�ng! H�y ch�ng t� b�n l�nh c�a m�nh �i!",
		"Ch�c m�ng b�n �� ch�nh th�c tr� th�nh t��ng s� c�a ��i Kim! H�y ch�ng t� b�n l�nh c�a m�nh �i!"
	}
	local szMsg = "Hi�n th�i qu�n s� 2 b�n l�: "..mem_song.." --- "..mem_jin
	Say(szMsg, 2, "H�y cho ta tham gia/bt_enterbattle", "�� ta suy ngh� l�i!/bt_oncancel");
	if (bt_getgn_awardtimes() ~= 1) then
		Msg2Player("Chi�n d�ch l�n n�y l� <color=yellor>��m Huy Ho�ng<color>, ph�n th��ng g�p ��i so v�i b�nh th��ng! C� h�i kh�ng n�n b� qua!")
	end
	SubWorld = nOldSubWorld
end

function bt_enterbattle()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		if( nHour >= 2045 and nHour < 2300)then
			local nNpcIndex = GetLastDiagNpc()
			local szNpcName = GetNpcName(nNpcIndex)
			local szTong = GetTong()
			if szTong ~= nil and szTong ~= "" then
				if 2 == bt_ncamp then
					if GetCityOwner(4) ~= szTong and GetCityOwner(7) == szTong then--4���꾩��7���ٰ�, 2�ǽ�
						Msg2Player("Bang h�i chi�m th�nh L�m An ch� ���c b�o danh b�n T�ng!")
						SubWorld = nOldSubWorld
						return
					end
				elseif 1 == bt_ncamp then
					if GetCityOwner(4) == szTong and GetCityOwner(7) ~= szTong then--4���꾩��7���ٰ���1���η�
						Msg2Player("Bang h�i chi�m th�nh Bi�n Kinh ch� ���c b�o danh b�n Kim!")
						SubWorld = nOldSubWorld
						return
					end
				else
					SubWorld = nOldSubWorld
					return
				end
			end
		end
	end
	
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		SubWorld = nOldSubWorld
		return
	end
	
	if	bt_checkmem_for_guozan() == 0 then
		SubWorld = nOldSubWorld
		return
	end
	
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin l�i, ti�n tuy�n �ang c� v�n ��, t�m th�i kh�ng th� v�o chi�n tr��ng.",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			SubWorld = nOldSubWorld
			return
		end
		--tinhpn20100804: IPBonus
		if (GetTask(TASKID_COUNT_X2TONGKIM) == 1) then
			SetTask(TASKID_COUNT_X2TONGKIM, 0)
			SetTask(TASKID_RECIEVE_BONUS_TK, 1)
		else
			SetTask(TASKID_RECIEVE_BONUS_TK, 0)
		end
		
		--By: NgaVN
		--Kiem tra nguoi choi truoc khi join vao mission
		local nRet = tbVNG2011_ChangeSign:CheckChangeSign();
		local nTimeNow = tbVNG2011_ChangeSign:GetTimeNow()
		if ( nRet ~= 1 ) then
			Say(format("Chi�n tr��ng c�n <color=red>%d <color=red>ph�t n�a c� th� b�o danh", nTimeNow));
			SubWorld = nOldSubWorld
			return
		end

		SubWorld = idx;
		BT_SetData(PL_SERIESKILL, 0)
		SetTask(TV_SERIESKILL_REALY,0)
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
		local SubWorld = OldSubWorld;
		SubWorld = nOldSubWorld
		return
	else
		Say("Xin l�i! Ti�n ph��ng c� v�n ��, t�m th�i kh�ng th� v�o chi�n tr��ng", 0);
	end
	SubWorld = nOldSubWorld
end;

function bt_wantjin()
		Say("Ng��i x�c ��nh ��u qu�n cho Kim qu�c? N�u �� gia nh�p, n�i trong 1 tu�n ng��i s� l� ng��i c�a ch�ng ta. Mu�n thay ��i, ph�i ��i tu�n sau!",2, "Ta nh�t ��nh gia nh�p Kim qu�c/bt_joinjin", "�� ta suy ngh� l�i ��!/bt_oncancel");
end;

function bt_wantsong()
		Say("Ng��i x�c ��nh ��u qu�n cho T�ng qu�c? N�u �� gia nh�p, n�i trong 1 tu�n ng��i s� l� ng��i c�a ch�ng ta. Mu�n thay ��i, ph�i ��i tu�n sau!",2, "Ta nh�t ��nh gia nh�p T�ng qu�c/bt_joinsong", "�� ta suy ngh� l�i ��!/bt_oncancel");
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C�ng c�o:�� b�t ��u chi�n d�ch m�i, �i�m t�ch ph�n hi�n gi� s� l� 0!")
	Msg2Player("Hoan ngh�nh! Hoan ngh�nh! Ng��i T�ng lu�n l� anh h�ng!")

	--Storm ������ս
	say_index = 2
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld
			if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C�ng c�o:�� b�t ��u chi�n d�ch m�i, �i�m t�ch ph�n hi�n gi� s� l� 0!")
	Msg2Player("Hoan ngh�nh! Hoan ngh�nh! Kim qu�c kh�ng thi�u anh t�i!")

	--Storm ������ս
	say_index = 3
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_oncancel()

end

function bt_checkmemcount_balance()
	local mapid = BT_GetGameData(GAME_MAPID);
	if (mapid > 0) then
		if (SubWorldID2Idx(mapid) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(mapid)
			local mem_song = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local mem_jin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			-- ��ս�ν� ���������ƽ�⴦��		
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and mem_song >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and mem_jin >= BALANCE_GUOZHAN_MAXCOUNT) then
					 -- ��������100�����ƣ���������ִ�У�����������5��
				else
					 -- ����δ�������ƣ�����5�˲�ֱ���������
					return mem_song, mem_jin
				end
			end
			
			if (bt_ncamp == 1 and (mem_song - mem_jin) >= BALANCE_MAMCOUNT ) then
				Say("Hi�n t�i binh l�c phe ta l� <color=yellow>"..mem_song.." ng��i<color>, ��ch ph��ng l� <color=yellow>"..mem_jin.." ng��i<color>, c�ch bi�t <color=red>"..BALANCE_MAMCOUNT.." ng��i<color>. Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t Kim binh! Tr�ng s� xin ��i tr�n sau nh�!", 0)
				return
			elseif (bt_ncamp == 2 and (mem_jin - mem_song) >= BALANCE_MAMCOUNT ) then
				Say("Hi�n t�i binh l�c phe ta l� <color=yellow>"..mem_jin.." ng��i<color>, ��ch ph��ng l� <color=yellow>"..mem_song.." ng��i<color>, c�ch bi�t <color=red>"..BALANCE_MAMCOUNT.." ng��i<color>. Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t T�ng qu�n. Tr�ng s� xin ��i tr�n sau nh�!", 0)
				return
			else
				return mem_song, mem_jin
			end
		end
	end
	Say("Xin l�i! Ti�n ph��ng c� v�n ��, t�m th�i kh�ng th� v�o chi�n tr��ng", 0);
	return nil
end

-- ��ս�ν�Խ�����������һ���ļ�� 1:���� 0:���ý���
function bt_checkmem_for_guozan()
	
	-- �ǹ�ս�ν�ֱ�ӷ���
	if BT_GetGameData(GAME_BATTLEID) ~= 2 then
		return 1;
	end
	
	-- ֮ǰ�Ѿ�ͨ����飬�μ���ս�ۣ������ټ����
--	if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) == bt_ncamp) then
--		return 1;
--	end
	
	local szCityOwner_LinAn		= GetCityOwner(7);	-- �ٰ���ռ����
	local szCityOwner_Bianjin	= GetCityOwner(4);	-- �꾩��ռ����
	local szMyTong				= GetTongName();	-- �Լ��İ��
	
	-- ռ�ǰ�����ݴ���
	if szCityOwner_LinAn == "" or szCityOwner_Bianjin == "" or szCityOwner_LinAn == szCityOwner_Bianjin then
		Say("L�n qu�c chi�n T�ng Kim n�y kh�ng ���c ph�p m�", 0);
		return 0;
	end
	
	-- ͨ��������ݽ���
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 1) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 2) then
		return 1;
	end

	-- ��ϸ
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 2) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 1) then
		Say("Gian t� c�a ��ch �� chui v�o ��i doanh r�i, h�y mau mau b�t!", 0);
		return 0;
	end
	
	-- ������ϵ�����
	local nCount_song = CalcItemCount(3, 6, 1, 2057, -1);
	local nCount_jin  = CalcItemCount(3, 6, 1, 2058, -1);
	
	if nCount_song == 0 and nCount_jin == 0 then
		Say("Hai qu�c giao tranh, c�n ph�i c� qu�c chi�n l�nh b�i c�a m�i b�n m�i ���c ti�n v�o.", 0);
		return 0;
	end
	
	-- �����б��������
	if (nCount_jin ~= 0 and bt_ncamp == 1) or (nCount_song ~= 0 and bt_ncamp == 2) then
		Say("Gian t� c�a ��ch �� chui v�o ��i doanh r�i, h�y mau mau b�t!", 0);
		return 0;
	end
	
	-- ����Ǯ
	if (GetCash() < 3000) then
		Say("Mu�n tham gia chi�n tr��ng T�ng Kim h�y �ng h� 3000 l��ng", 0)
		return 0;
	end
	
	-- �۳�����
	local bPay = 0;
	
	if bt_ncamp == 1 then
		bPay = ConsumeItem(3, 1, 6, 1, 2057, -1); 
	elseif bt_ncamp == 2 then
		bPay = ConsumeItem(3, 1, 6, 1, 2058, -1); 
	end
	
	if bPay ~= 1 then
		Msg2Player("Kh�u tr� l�nh b�i th�t b�i");
		return 0;
	end
	
	-- ����ͨ��
	return 1;
end