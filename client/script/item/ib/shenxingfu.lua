Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\boss\\callboss_incity.lua")
IncludeLib("TONG")


function main(sel)
	dofile("/script/item/ib/shenxingfu.lua");
--local szTongName, nTongID = GetTongName();
--if szTongName ~= nil and szTongName ~= "" then
--if TONG_GetMemberCount(nTongID) > 150 then
--Say("Bang v��t qu� 150 th�nh vi�n kh�ng th� s� d�ng th�n th�nh ph�.Xin h�y t�n tr�ng s�n ch�i kh�ng gian l�n trong vi�c s�p nh�p bang h�i �� tr�nh phi�n ph�c cho ch�nh b�n bang m�nh.");
--return 1
--end
--end

	if (IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("Hi�n t�i ng��i kh�ng th� s� d�ng th�n h�nh ph�!");
		return 1
	end

	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end

	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end

	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end;

	--check map
	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("B�n �� hi�n t�i ng��i �ang ��ng thu�c khu v�c ��c th�, kh�ng th� s� d�ng th�n h�nh ph�.");
		return 1
	end;

	if (GetLevel() < 5) then
		Say("Ng��i ch�i ph�i ��t ��ng c�p 5 tr� l�n m�i c� th� s� d�ng th�n h�nh ph�.", 0);
		return 1
	end;
				if (GetSkillState(739) >= 1) then
			Say("B�n �ang v�n Ti�u Bang H�i kh�ng th� s� d�ng THP")
			return 1
		end;

Say("Th�n h�nh ph� �i ��n n�i ���c ch� ��nh..!!!", 7,
		"Th�n trang - Th�nh th� - M�n ph�i - CLD/gototown",
		"Maps luy�n c�ng/goto_luyencong",
		"Thi�t ��t �i�m h�i sinh./set_backpos",
		"�i l�m [Ho�t ��ng]./vitri_khac",
		"T�m boss ho�ng kim/timbosshk",
		"�i Minh Nguy�t Tr�n - ��o Hoa ��o./#tbVNGWORDPOS:GotoOtherMap()",
		"R�i kh�i/no");
	return 1
end;

function didenchienlongok()
-- if GetFaction() == "cuiyan" then
-- Say("Th�y y�n Kh�ng ��c tham gia Chi�n Long ��ng")
-- return
-- end
	Say("H�y ch�n c�ng m� b�n mu�n!", 4, "C�ng V� Di S�n/cong1","C�ng T�ng V�n ��ng/cong2","C�ng La Ti�u S�n/cong3", "��i m�t l�t �i!/OnCancel")
end

function cong1()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1670, 2959);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function cong2()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1548, 2995);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function cong3()
	Msg2Player("�� ��n Chi�n Long ��ng!")
	NewWorld(959, 1701, 3152);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function vitri_khac()
local tab_Content = {
		--"V�n Ti�u/goto_vantieu",
		"Boss s�t th�/gotobosssatthu",
		"V��t �i/goto_satthu",
		"T�n S�/goto_tinsu",
		"Ki�m Gia M� Cung/goto_kiemgia",
		"Th� Luy�n ���ng/goto_thiluyenduong",
		"Vi�m �� B�o T�ng/goto_viemde",
		"Phong L�ng ��/goto_phonglangdo",
		--"T�ng - Kim/gopos_step2battle",
		--"��u Tr��ng Sinh T�/vaodautruong",
		"Thi�n Tr� M�t C�nh/goto_thientri",
		--"Lo�n Chi�n C�u Ch�u/goto_chaucoc",
		"Chi�n tr��ng Th�t Th�nh ��i Chi�n/gopos_sevencityfield",
		"K�t th�c..!/no"
	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function vaodautruong()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if  nWeekDay == 0 or  nWeekDay == 1 or  nWeekDay == 2 or  nWeekDay == 3 or  nWeekDay == 4 or  nWeekDay == 5  then
	Say("Th�i gian v�o ��u Tr��ng 20h10 Th� 7 h�ng Tu�n")
	return 1
	end

	local _, nTongID = GetTongName()
	if (nTongID == 0) then
		Msg2Player("Kh�ng c� trong bang h�i, kh�ng th� tham gia.")
		return
	end
	local szTong = GetTongName()
	if szTong == "" then
		Msg2Player("Kh�ng c� trong bang h�i, kh�ng th� tham gia.")
		return
	end

	--if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
	--	Say("�n s� kh�ng th� tham gia .")
	--	return
	--end

	local tbSay = {}
	tinsert(tbSay,"H�u Doanh B�c./#gotoDT(1572,2438)")
	tinsert(tbSay,"H�u Doanh Nam./#gotoDT(1206,3156)")
	tinsert(tbSay,"H�u Doanh  ��ng./#gotoDT(1545,3110)")
	tinsert(tbSay,"H�u Doanh T�y./#gotoDT(1218,2452)")
	tinsert(tbSay,"Th�i ta kh�ng mu�n �i./no")
	Say("M�i l�a ch�n khu v�c tham ��u", getn(tbSay), tbSay)
	return 1
end;

function gotoDT(nX,nY)
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if  (nHour >= 2010 and nHour < 2059) then
		else
			Say("Th�i gian v�o ��u tr��ng sinh t� l� 20h10. .",0);
			return
		end
NewWorld(355,nX,nY)
SetPunish(0)
SetLogoutRV(1);
BienHinh()
	local szTong = GetTong()
	if not szTong or  szTong == "" then
		SetCreateTeam(0);
		SetCurCamp(4);
BienHinh()
end
end
function BienHinh()
local szTong = GetTongName()

if szTong == "Vui�V�" then
ChangeOwnFeature( 1, 3500*18, 822,  0, 0, 0, 0)
end
if szTong == "V��L�m" then
ChangeOwnFeature( 1, 3500*18, 1194,  0, 0, 0, 0)
end
if szTong == "�Qu�y" then
ChangeOwnFeature( 1, 3500*18, 1195,  0, 0, 0, 0)
end
if szTong == "Ng�" then
ChangeOwnFeature( 1, 3500*18, 1196,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1200,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1114,  0, 0, 0, 0)
end
if szTong == "" then
ChangeOwnFeature( 1, 3500*18, 1436,  0, 0, 0, 0)
end
if szTong == "" and GetCamp() ~= 6 then
ChangeOwnFeature( 1, 3500*18, 893,  0, 0, 0, 0)
end
if GetCamp() == 6 then
ChangeOwnFeature( 1, 3500*18, 1503,  0, 0, 0, 0)
end
end


function goto_satthu()
SetFightState(0)
NewWorld(78,1509,3209)
end
function goto_thientri()
SetFightState(1)
NewWorld(934,1598,3240)
end
function goto_chaucoc()
SetFightState(0)
NewWorld(176,1574,2955)
end

function goto_vantieu()
SetFightState(1)
NewWorld(1,1559,2768)
end
function goto_tinsu()
SetFightState(0)
NewWorld(11,3024,5086)
end
function goto_thiluyenduong()
SetFightState(0)
NewWorld(176,1588,2941)
end


function goto_kiemgia()
SetFightState(0)
NewWorld(949,1580,3158)
end

function goto_viemde()
SetFightState(0)
--NewWorld(53,1629,3184)
NewWorld(37, 1711, 3179)
end

function goto_phonglangdo()
SetFightState(1)
NewWorld(336,1124,3187)
end


--*******************************************************************
tbMapGoldBoss = {
{"C� B�ch","Ph� Dung ��ng",202,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Gi�c ��i S�","Nh�n Th�ch ��ng",10,"Thanh kh� ��ng",198,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng Phi Y�n", "Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Lam Y Y","V� L�ng ��ng",199,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Linh Phi�u", "Tr��ng B�ch s�n B�c",322,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Y�n Hi�u Tr�i", "Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"M�nh Th��ng L��ng","Sa m�c ��a bi�u",224,"Sa M�c s�n  ��ng 2",226,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Gia Lu�t T� Ly", "L��ng Th�y ��ng",181,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"��o Thanh Ch�n Nh�n","Tr��ng B�ch s�n Nam",321,"M�c Cao Qu�t",340,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Tuy�n C� T�", "T�y S�n ��o",342,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"V��ng T�","V� L�ng ��ng",199,"Ph� Dung ��ng",202,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Nan ��i S�","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng B�t Nhi�m", "Tr��ng B�ch s�n Nam",321,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"B�ch Doanh Doanh", "Thanh kh� ��ng",198,"Sa m�c ��a bi�u",224,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i", "T�y S�n ��o",342,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Chung Linh T�", "Phi Thi�n ��ng",204,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Nh�n Ng�", "Nh�n Th�ch ��ng",10,"L��ng Th�y ��ng",181,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"�oan M�c Du�", "Phong L�ng ��",336,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"T� ��i Nh�c", "M�c B�c Th�o Nguy�n",341,"V� L�ng ��ng",199,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Li�n T�","Tr��ng B�ch s�n B�c",322,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i","Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H�n Ngu D�t","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
}

function timbosshk()
    findgoldboss(1,12)
end
function findgoldboss(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(tbMapGoldBoss);
	local tab_Content = {}

	for i = f_bossx1, f_bossy1 do
		tinsert(tab_Content, tbMapGoldBoss[i][1].."/#findgoldboss_Step2( "..i..")");
	end
	if (f_bossx1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho�t./no");
	Say("��i hi�p t�m cao th� n�o?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
	local tb = {}
	for i=2,getn(tbMapGoldBoss[nId]),2 do --"buoc nhay 2 tuc la i=2,4,6,8,10
	local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1])
		if npcidxtab == nil then
				nNPCCount = 0
		else
			nNPCCount = getn(npcidxtab);
		end
		for j = 1, nNPCCount do
			x, y, subworld = GetNpcPos(npcidxtab[j]);
			m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld)

			--tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
			tinsert(tb,tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..floor(m/8).."-"..floor(n/16).."]/#findgoldboss_Step3("..m..","..n..","..k..")")
		end
	end
	strTittle = "T�m th�y cao th� v� l�m "..tbMapGoldBoss[nId][1].." t�i c�c v� tr� sau ��y."
	--tinsert(tbOpt, {"tho�t ",Quit})
	tinsert(tb,"Quay l�i./#findgoldboss(1,12)")
	tinsert(tb,"Tho�t./Quit")
	--CreateNewSayEx(strTittle, tbOpt)
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end
--*******************************************************************

tab_RevivePos = {
	[1] = {	--"Dia ly"
		{"Th�nh �� ��ng", 6, 11},{"Th�nh �� t�y", 7, 11},{"Th�nh �� nam", 8, 11},{"Th�nh �� b�c", 9, 11},{"Th�nh �� trung t�m", 5, 11}
	},
	[2] = {	--"Dia ly"
		{"T��ng D��ng ��ng", 30, 78},{"T��ng D��ng t�y", 32 , 78},{"T��ng D��ng nam", 31, 78},{"T��ng D��ng b�c", 33, 78},{"T��ng D��ng trung t�m", 29, 78}
	},
	[3] = {	--"Dia ly"
		{"Ph��ng T��ng ��ng", 1, 1},{"Ph��ng T��ng t�y", 2, 1},{"Ph��ng T��ng nam", 3, 1},{"Ph��ng T��ng b�c", 4, 1},{"Ph��ng T��ng trung t�m", 0, 1}
	},
	[4] = {	--"Dia ly"
		{"��i l� b�c", 64, 162},{"��i l� trung t�m", 63, 162}
	},
	[5] = {	--"Dia ly"
		{"Bi�n Kinh ��ng", 24, 37},{"Bi�n Kinh t�y", 25, 37},{"Bi�n Kinh nam", 24, 37},{"Bi�n Kinh b�c", 26, 37},{"Bi�n Kinh trung t�m", 23, 37}
	},
	[6] = {	--"Dia ly"
		{"D��ng Ch�u ��ng", 35, 80},{"D��ng Ch�u t�y", 38, 80},{"D��ng Ch�u nam", 37, 80},{"D��ng Ch�u b�c", 36, 80},{"D��ng Ch�u trung t�m", 34, 80}
	},
	[7] = {	--"Dia ly"
		{"L�m An ��ng", 68, 176},{"L�m An nam", 67, 176},{"L�m An b�c", 69, 176}
	},
	[8] = {	--"Dia ly"
		{"Ba L�ng huy�n", 19, 53},{"Giang T�n Th�n", 10, 20},{"V�nh L�c tr�n", 43, 99},{"Chu Ti�n tr�n", 45, 100},{"��o H��ng th�n", 47, 101},{"Long M�n tr�n", 55, 121},{"Th�ch C� tr�n", 59, 153},{"Long Tuy�n th�n", 65, 174},{"T�y S�n th�n", 1, 175}
	},
	[9] = {	--"Dia ly"
		{"Thi�n V��ng Bang", 21, 59},{"Thi�u L�m ph�i", 52, 103},{"���ng M�n", 15, 25},{"Ng� ��c Gi�o", 71, 183},{"Nga My ph�i", 13, 13},{"Th�y Y�n m�n", 61, 154},{"Thi�n Nh�n gi�o", 28, 49},{"C�i Bang", 53, 115},{"V� �ang ph�i", 40, 81},{"C�n L�n ph�i", 58, 131},{"Hoa S�n ph�i", 987, 987}, {"V� H�n", 1042, 1042},
	},
};
--Cai gi do
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
			return 1;
		end
	end



	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh ��/#setpos_step2(1)",
		"T��ng D��ng/#setpos_step2(2)",
		"Ph��ng T��ng/#setpos_step2(3)",
		"��i L�/#setpos_step2(4)",
		"Bi�n Kinh/#setpos_step2(5)",
		"D��ng Ch�u/#setpos_step2(6)",
		"L�m An/#setpos_step2(7)",
		"Th�n trang/#setpos_step2(8)",
		"M�n ph�i/#setpos_step2(9)"
	}
	Say("Thi�t ��t �i�m h�i th�nh cho l �n sau s� d�ng th� ��a ph�", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Thi�t ��t �i�m h�i th�nh cho l �n sau s� d�ng th� ��a ph�", getn(tab_Content), tab_Content);
end;
--"Dia ly"
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("��i hi�p �� ��t th�nh c�ng �i�m h�i sinh"..tab_RevivePos[nIdx][nSubIdx][1], 0);
	Msg2Player("��i hi�p �� ��t th�nh c�ng �i�m h�i sinh"..tab_RevivePos[nIdx][nSubIdx][1]);
end;
--"Dia ly"
function gototown()

	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh th� /gopos_step2town",
		"Th�n trang/#gopos_step2(8)",
		"M�n ph�i/#gopos_step2(9)",
		"Chi�n Tr��ng T�ng - Kim/gopos_step2battle",
		"Chi�n tr��ng Th�t Th�nh ��i Chi�n/gopos_sevencityfield",
		"Chi�n Long ��ng/didenchienlongok",

	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end;

tbMapTrain = {
	[10] ={
		{"Ph��ng T��ng",1,1528,2733},
		{"Hoa S�n",2,2287,4092},
		{"Th�nh ��",11,3100,4822},
		{"Nga My ph�i",13,1867,5021},
		{"Giang T�n Th�n",20,3701,6232},
		{"���ng M�n",25,3532,5770},
		{"Bi�n Kinh",37,2081,2477},
		{"Thi�n Nh�n gi�o",45,1559,3246},
		{"Thi�n Nh�n Gi�o t�ng 1",46,1611,3201},
		{"Thi�n Nh�n Gi�o t�ng 2",47,1606,3054},
		{"Thi�n Nh�n Gi�o t�ng 2",48,1672,3138},
		{"Th�t S�t ��ng",50,1425,3217},
		{"Ba L�ng huy�n",53,1342,3346},
		{"Nam Nh�c tr�n",54,1618,2969},
		{"Thi�n V��ng Bang",59,1425,3472},
		{"Thi�n V��ng ��o s�n ��ng",65,1596,3250},
		{"Ph�c L�u ��ng",73,1599,3210},
		{"T��ng D��ng",78,1299,3483},
		{"D��ng Ch�u",80,1345,3359},
		{"V� �ang ph�i",81,1620,3595},
		{"M� cung ��y gi�ng",82,1593,3193},
		{"V�nh L�c tr�n",99,1849,2835},
		{"Chu Ti�n tr�n",100,1852,3356},
		{"��o H��ng th�n",101,1767,2816},
		{"Thi�u L�m ph�i",103,1622,3565},
		{"M�c Nh�n H�ng",111,1580,3417},
		{"Long M�n tr�n",121,1715,4394},
		{"C�n L�n ph�i",131,1872,3659},
		{"D��c V��ng C�c",140,2429,3731},
		{"Th�ch C� tr�n",153,1439,3042},
		{"Th�y Y�n m�n",154,628,1261},
		{"��i L� ph�",162,1642,2935},
		{"Long Tuy�n th�n",174,1818,3017},
		{"L�m An",176,1614,2561},
		{"Ng� ��c Gi�o",183,1371,3677},
		{"M� cung nh�p m�n",190,1380,3003},
		{"Nh�n ��ng s�n",195,682,2863},
	},
	[20] ={
		{"Ki�m C�c T�y B�c",3,932,4076},
		{"T�n L�ng",7,2417,2631},
		{"M�nh H� ��ng",14,1589,3217},
		{"Ki�m C�c T�y Nam",19,3096,3968},
		{"Ki�m C�c Trung Nguy�n",43,1673,2713},
		{"V� L�ng s�n",70,1649,3050},
		{"B�ch Th�y ��ng",71,1739,3208},
		{"H�a Lang ��ng",83,1584,3248},
		{"C�i Bang",115,1538,4021},
		{"La Ti�u s�n",179,1618,3292},
	},
	[30] ={
		{"Kim Quang ��ng",4,1797,3058},
		{"L�ng T�n Th�y Ho�ng",8,1603,3497},
		{"B�ch V�n ��ng",22,1752,3372},
		{"Mi�u L�nh",74,1947,3120},
		{"Y�n T� ��ng",77,1549,3169},
		{"Ph�c Ng�u S�n ��ng",90,1649,3567},
		{"Th�c C��ng s�n",92,2025,3040},
		{"Kho�i Ho�t L�m",136,1716,3144},
		{"D��c V��ng ��ng t�ng 1",141,1603,3372},
		{"Tuy�t B�o ��ng t�ng 1",145,1563,3245},
		{"Tuy�t B�o ��ng t�ng 2",146,1630,3325},
		{"Th� Ph� ��ng",170,1605,3191},
		{"V� Di s�n",193,1937,2851},
	},
	[40] ={
		{"Kinh Ho�ng ��ng",5,1822,3473},
		{"T�a V�n ��ng",6,1384,3286},
		{"Thanh Th�nh s�n",21,2247,3923},
		{"Th�n Ti�n ��ng",23,1710,3077},
		{"Tr�c T� ��ng t�ng 3",28,1551,3192},
		{"Ph�c Ng�u S�n T�y",41,2078,2804},
		{"M� cung K� Qu�n ��ng",91,1806,2858},
		{"M�t th�t Thi�u L�m",113,1675,3361},
		{"Ho�ng H� Nguy�n ��u",122,1612,3328},
		{"Ki�n T�nh Phong s�n ��ng",135,1748,3198},
		{"�i�m Th��ng s�n",167,1214,2731},
		{"Ph�ng Nh�n ��ng",168,1508,3005},
		{"�i�m Th��ng ��ng t�ng 1",171,1532,3130},
		{"�i�m Th��ng ��ng t�ng 2",172,1586,3223},
		{"�i�m Th��ng ��ng t�ng 3",173,1353,3102},
		{"Long Cung ��ng",180,1509,3106},
	},
	[50] ={
		{"��a ��o h�u vi�n T�n T��ng t�",12,1589,3188},
		{"H��ng Th�y ��ng",24,1692,3189},
		{"Thi�t th�p t�ng 1",38,1702,3134},
		{"Thi�t th�p t�ng 2",39,1690,3032},
		{"Thi�t th�p t�ng 3",40,1668,3133},
		{"Thi�n T�m ��ng",42,1648,3119},
		{"��y ��ng ��nh h� t�ng 1",66,1596,3199},
		{"��y ��ng ��nh h� t�ng 2",67,1591,3193},
		{"T��ng V�n ��ng t�ng 1",116,1787,2980},
		{"L�u Ti�n ��ng t�ng 1",125,1811,3219},
		{"B�ng Huy�t ��ng",132,1701,3407},
		{"Tuy�t B�o ��ng t�ng 3",147,1630,3323},
		{"�c b� ��a ��o",163,1559,3201},
		{"Thi�n T�m th�p t�ng 1",164,1606,3194},
		{"Thi�n T�m th�p t�ng 2",165,1501,3295},
		{"S�n ��ng Ng� Hoa vi�n",178,1609,3200},
		{"Nghi�t Long ��ng",182,1997,3067},
		{"Ng�c Hoa ��ng",194,1599,3199},
	},
	[60] ={
		{"Tr�c T� ��ng t�ng 1",26,1603,3210},
		{"Th�nh ��ng t�ng 1",51,1666,3291},
		{"Th�nh ��ng t�ng 2",52,1617,3261},
		{"Ho�nh S�n Ph�i",56,1594,3210},
		{"Thanh Loa ��o",68,1545,2972},
		{"M�t ��o Nha m�n T��ng D��ng",79,1599,3206},
		{"108 La H�n tr�n",114,1499,3312},
		{"T��ng V�n ��ng t�ng 2",117,1660,2947},
		{"T��ng V�n ��ng t�ng 3",118,1525,2962},
		{"T��ng V�n ��ng t�ng 4",119,1569,3099},
		{"L�u Ti�n ��ng t�ng 2",126,1496,2929},
		{"L�u Ti�n ��ng t�ng 3",127,1769,3216},
		{"L�u Ti�n ��ng t�ng 4",128,1515,3123},
		{"Tuy�t B�o ��ng t�ng 4",148,1527,3273},
		{"M� cung c�m ��a",158,1584,3191},
		{"Thi�n T�m th�p t�ng 3",166,1662,3245},
		{"D��ng Gi�c ��ng",196,1691,3068},
	},
	[70] ={
		{"Tr��ng Giang Nguy�n ��u",9,2478,5691},
		{"Tr�c T� ��ng t�ng 2",27,1607,3208},
		{"��o Hoa Nguy�n",55,1729,3282},
		{"Thanh Loa ��o s�n ��ng",69,1600,3207},
		{"��i T� ��ng",72,1611,2969},
		{"S�n B�o ��ng",76,1796,2959},
		{"Linh C�c ��ng",94,1751,3107},
		{"T��ng V�n ��ng t�ng 5",120,1815,3195},
		{"L�o H� ��ng",123,1698,3363},
		{"L�u Ti�n ��ng t�ng 5",129,1597,3212},
		{"L�u Ti�n ��ng t�ng 6",130,1547,3143},
		{"D��c V��ng ��ng t�ng 2",142,1467,3288},
		{"Tuy�t B�o ��ng t�ng 5",149,1611,3220},
		{"Long Nh�n ��ng",169,1596,3212},
		{"T�n L�ng t�ng 2",206,1790,3265},
		{"L�m Du Quan",319,2031,3286},
	},
	[80] ={
		{"Nh�n Th�ch ��ng",10,1603,3209},
		{"D��c V��ng ��ng t�ng 3",143,1602,3215},
		{"Tuy�t B�o ��ng t�ng 6",150,1613,3184},
		{"Tuy�t B�o ��ng t�ng 7",151,1612,3218},
		{"L��ng Th�y ��ng",181,1590,3199},
		{"Thanh kh� ��ng",198,1522,2955},
		{"V� L�ng ��ng",199,1644,2906},
		{"C� D��ng ��ng",200,1612,3171},
		{"B�ng H� ��ng",201,1599,3197},
		{"Ph� Dung ��ng",202,1786,2823},
		{"V� Danh ��ng",203,1551,2992},
		{"Phi Thi�n ��ng",204,1679,3391},
		{"D��ng Trung ��ng",205,1698,3408},
		{"T�n L�ng t�ng 3",207,1595,3205},
		{"Sa m�c ��a bi�u",224,1591,3013},
		{"Ch�n n�i Tr��ng B�ch",320,1386,2253},
	},
	[90] ={
		{"Kho� Lang ��ng",75,1872,3071},
		{"Ti�n C�c ��ng",93,1526,3172},
		{"C�n Vi�n ��ng",124,1672,3420},
		{"D��c V��ng ��ng t�ng 4",144,1690,3023},
		{"Tuy�t B�o ��ng t�ng 8",152,1675,3365},
		{"Sa M�c 1",225,1476,3274},
		{"Sa M�c 2",226,1553,3173},
		{"Sa M�c 3",227,1530,3270},
		{"Tr��ng B�ch s�n Nam",321,966,2296},
		{"Tr��ng B�ch s�n B�c",322,2048,4120},
		{"M�c Cao Qu�t",340,1853,3446},
		{"M�c B�c Th�o Nguy�n",341,1576,3040},
		{"Vi s�n ��o",342,1400,2800},
		{"H�c Sa ��ng",875,1576,3177},
	},
	[100] ={
		{"T�ch Huy�t C�c",917,1816,3392},
		{"�c Nh�n C�c",918,1816,3392},
		{"Th�c C�t Nhai",919,1608,3168},
		{"H�c M�c Nhai",920,1608,3168},
	},
	[110] ={
		{"Thi�n Ph� S�n",921,1560,3104},
		{"B�n Long S�n",922,1560,3104},
		{"��a M�u S�n",923,2008,4080},
		{"Uy�n Ph�ng S�n",924,2008,4080},
		{"�c Lang C�c 1",950,1592,3195},
		{"�c Lang C�c 2",951,1592,3195},
		{"�c Lang C�c 3",952,1592,3195},
		{"�c Lang C�c 4",953,1592,3195},
		{"�c Lang C�c 5",954,1592,3195},
		{"�c Lang C�c 6",955,1592,3195},
		{"�c Lang C�c 7",956,1592,3195},
		{"�c Lang C�c 8",995,1592,3195},
	},
}

function goto_luyencong()
	--dofile("/script/item/ib/shenxingfu.lua");
	local tab_Content = {
		"B�n �� c�p 10/#goto_luyencong2(10,getn(tbMapTrain[10]))", --
		"B�n �� c�p 20/#goto_luyencong2(20,getn(tbMapTrain[20]))",
		"B�n �� c�p 30/#goto_luyencong2(30,getn(tbMapTrain[30]))",
		"B�n �� c�p 40/#goto_luyencong2(40,getn(tbMapTrain[40]))",
		"B�n �� c�p 50/#goto_luyencong2(50,getn(tbMapTrain[50]))",
		"B�n �� c�p 60/#goto_luyencong2(60,getn(tbMapTrain[60]))",
		"B�n �� c�p 70/#goto_luyencong2(70,getn(tbMapTrain[70]))",
		"B�n �� c�p 80/#goto_luyencong2(80,getn(tbMapTrain[80]))",
		"B�n �� c�p 90/#goto_luyencong2(90,getn(tbMapTrain[90]))",
		"B�n �� c�p 100/#goto_luyencong2(100,getn(tbMapTrain[100]))",
		"B�n �� c�p 110/#goto_luyencong2(110,getn(tbMapTrain[110]))",
		"Tho�t/no",
	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function goto_luyencong2(num1,num2,num3)
	local tab_Content = {};
	if num2 > 8 then
		if num3 == nil then
			a = 1;
			num = 8;
		end
		if num3 ~= nil then
		a = num2 - num3;
			if a > 8 then
				a = num3;
				num = num3 + 8;
			end
			if a < 8 then 
				a = num3;
				num = num2;
			end
		end
	end
	if num2 <= 8 and num3 == nil then 
		a = 1;
		num = num2;
	end
	for i = a , num do
		tinsert(tab_Content, tbMapTrain[num1][i][1].."/#goto_luyencong3("..num1..","..i..")");
		--Msg2Player(""..i..""..num.." s� a:"..num1.." s� b:"..num2.."")
	end
	if num2 > 8 and num3 == nil then
		tinsert(tab_Content, "Trang k� /#goto_luyencong2( "..num1..","..num2..","..a.."+8)");
	end	
	if num2 > 8 and num3 ~=nil then
		n = num2 - num3;
		if n > 8 then
			tinsert(tab_Content, "Trang k� /#goto_luyencong2( "..num1..","..num2..","..a.."+8)");
		end
	end
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function goto_luyencong3(num1,num2)
	local mapName = tbMapTrain[num1][num2][1]
	local mapid = tbMapTrain[num1][num2][2]
	local mapx = tbMapTrain[num1][num2][3]
	local mapy =  tbMapTrain[num1][num2][4]
	--Msg2Player(""..mapid..","..mapx..","..mapy.."")
	NewWorld(mapid,mapx,mapy)
	SetFightState(1);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i ��n <color=yellow>"..mapName.."<color> n�o");
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3)
end

function gopos_step2town()
	local tab_Content = {
		"R�i kh�i/no",
		"Th�nh ��/#gopos_step2(1)",
		"T��ng D��ng/#gopos_step2(2)",
		"Ph��ng T��ng/#gopos_step2(3)",
		"��i L�/#gopos_step2(4)",
		"Bi�n Kinh/#gopos_step2(5)",
		"D��ng Ch�u/#gopos_step2(6)",
		"L�m An/#gopos_step2(7)",
	}
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

--"Dia ly"
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end;

--"Dia ly"
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);

	if (not nPosX or not nPosY) then
		return
	end;
	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i "..tab_RevivePos[nIdx][nSubIdx][1].." n�o");
	SetProtectTime(18*3) --"Dia ly"
	AddSkillState(963, 1, 0, 18*3)
end;



function gopos_step2battle()
	--if ( GetLevel() < 120 ) then
		--Talk( 1, "", "Phong V�n Lu�n Ki�m gian kh� kh�c li�t, ng��i ch�a ��t ��n c�p 120 h�y v� luy�n th�m r�i h�y t�nh." );
	--else
		Say ( "Trong Phong V�n Lu�n Ki�m, b�n l�i th� v� s� ng��i tuy c� chi�m �u th� nh�ng s� nh�n ���c �i�m t�ch l�y �t h�n, c�c h� mu�n ch�n b�o danh b�n n�o?", 3, "V�o �i�m b�o danh phe T�ng (T)/#DoRescriptFunc(1)", "V�o �i�m b�o danh phe Kim (K)/#DoRescriptFunc(2)","�� ta suy ngh� l�i./no" );
	--end;
end

function gopos_sevencityfield()
	Say("Ng��i mu�n �i chi�n tr��ng n�o c�a Th�t Th�nh ��i Chi�n?", 8,
		"Chi�n tr��ng Th�nh ��/#goto_sevencityfield(1)",
		"Chi�n tr��ng Bi�n Kinh/#goto_sevencityfield(2)",
		"Chi�n tr��ng ��i L�/#goto_sevencityfield(3)",
		"Chi�n tr��ng Ph��ng T��ng/#goto_sevencityfield(4)",
		"Chi�n tr��ng L�m An/#goto_sevencityfield(5)",
		"Chi�n tr��ng T��ng D��ng/#goto_sevencityfield(6)",
		"Chi�n tr��ng D��ng Ch�u/#goto_sevencityfield(7)",
		"�� ta suy ngh� l�i/Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end

function DoRescriptFunc(nSel)
	--if ( GetLevel() < 120 ) then
	--	Talk( 1, "", "Phong V�n Lu�n Ki�m gian kh� kh�c li�t, ng��i ch�a ��t ��n c�p 120 h�y v� luy�n th�m r�i h�y t�nh." );
	--	return
	--end
	local tbsongjin_pos = {1541, 3178};	--cai gi do
	local szstr = "Phe T�ng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "Phe Kim (K)";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim S� C�p" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0);--- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Trung C�p" );
	else
		NewWorld( 325, tbsongjin_pos[1], tbsongjin_pos[2]);
	SetProtectTime(18*3) --- cai gi do
	AddSkillState(963, 1, 0, 18*3)
		SetFightState(0);
		DisabledUseTownP(0); --- cai gi do
		Msg2Player( "��n n�i b�o danh Chi�n Tr��ng T�ng Kim Cao C�p" );
	end
end

function gotobosssatthu()
	local tab_Content = {
		"Boss S�t th� 9x/#gopos_9x()",
		"Boss S�t th� 2x/#gopos_2x()",
		"Boss S�t th� 3x/#gopos_3x()",
		"Boss S�t th� 4x/#gopos_4x()",
		"Boss S�t th� 5x/#gopos_5x()",
		"Boss S�t th� 6x/#gopos_6x()",
		"Boss S�t th� 7x/#gopos_7x()",
		"Boss S�t th� 8x/#gopos_8x()",
		"Thoat/no"
	}
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end;

tab_lv2xmap = {
		{73,1544,2944,"Tr�c L�nh C�m","Ph�c L�u ��ng",},
		{73,1416,3024,"Ti�u Thi�n Ng�o","Ph�c L�u ��ng",},
		{73,1640,3088,"M�c Minh Ki�t","Ph�c L�u ��ng",},
		{73,1736,3040,"T�t V�u Ph�ng","Ph�c L�u ��ng",},
		{43,1600,3024,"L�c C�u U","Ki�m C�c Trung Nguy�n",},
		{43,1712,3136,"B� Hi�u Tr�n","Ki�m C�c Trung Nguy�n",},
		{43,1800,3056,"C�c Ki�m Thu","Ki�m C�c Trung Nguy�n",},
		{43,1784,2736,"Thi�u Hoa Dung","Ki�m C�c Trung Nguy�n",},
		{71,1680,3136,"Quan T� M�c","B�ch Th�y ��ng",},
		{71,1600,3072,"B�nh Th�ch H�i","B�ch Th�y ��ng",},
		{71,1576,3184,"B�ch Ph� B�nh","B�ch Th�y ��ng",},
		{71,1592,3280,"Tr��ng L�nh s�n ","B�ch Th�y ��ng",},
		{83,1512,3072,"Ti�u Ki�m Tuy�t","H�a Lang ��ng",},
		{83,1560,2880,"Kha Thi�u Gia","H�a Lang ��ng",},
		{83,1720,3024,"Ch��ng B�t Ph��ng","H�a Lang ��ng",},
		{83,1696,3184,"M�ng �t  Phi","H�a Lang ��ng",},
		{14,1792,3520,"T� �� Tuy�t Ch�y","M�nh H� ��ng",},
		{14,1712,3312,"Th��ng Quan L�ng","M�nh H� ��ng",},
		{14,1624,3136,"D��ng Thanh �n","M�nh H� ��ng",},
		{14,1704,3200,"Ng�y Chi�m Th�n","M�nh H� ��ng",},    
}

tab_lv3xmap = {
	{4,1576,2992,"��o �o�t Thu","Kim Quang ��ng",},
	{4,1752,3248,"X� B� ��ng ","Kim Quang ��ng",},
	{4,1744,2960,"L��ng T� Nam ","Kim Quang ��ng",},
	{4,1536,2880,"Tr�c Th�t Lang","Kim Quang ��ng",},
	{22,1720,3184,"Ki�u ��nh Thi�n","B�ch V�n ��ng",},
	{22,1784,3040,"Tr�ng V� C�p ","B�ch V�n ��ng",},
	{22,1888,3200,"Kh� C�m S� ","B�ch V�n ��ng",},
	{22,1720,3344,"�inh V�n D�c","B�ch V�n ��ng",},
	{77,1368,3504,"Phong Ng� �n","Y�n T� ��ng",},
	{77,1440,3344,"Khang B�t H�i","Y�n T� ��ng",},
	{77,1648,3264,"Ph��ng D�c Vi�m","Y�n T� ��ng",},
	{77,1616,3520,"Ninh T�m Cu�ng","Y�n T� ��ng",},
	{141,1568,3264,"H�nh Ph� Sinh","T�ng 1 D��c V��ng ��ng",},
	{141,1552,3216,"Ho�c Tr�n Phi","T�ng 1 D��c V��ng ��ng",},
	{141,1656,3264,"Qu�n V� Y�m","T�ng 1 D��c V��ng ��ng",},
	{141,1632,3184,"Di�p V�nh �n","T�ng 1 D��c V��ng ��ng",},
	{193,1248,2960,"�u ch� Phong","V� Di s�n",},
	{193,912,2656,"��c C� Hi�p ","V� Di s�n",},
	{193,960,2704,"H�ng Ph� Nhai","V� Di s�n",},
	{193,1440,3168,"Ngh� ��i Chu","V� Di s�n",},
}
tab_lv4xmap = {
{5,1616,3472,"Du Th�n Giang ","Kinh Ho�ng ��ng",},
{5,1440,3376,"H� H�ng Phi","Kinh Ho�ng ��ng",},
{5,1600,3280,"T�ng V� Phong","Kinh Ho�ng ��ng",},
{5,1752,3616,"L� Th��ng Nh�n","Kinh Ho�ng ��ng",},
{168,1760,3216,"Nh�m T�ng Ho�nh","Ph�ng Nh�n ��ng",},
{168,1760,3024,"H�n Khanh Long","Ph�ng Nh�n ��ng",},
{168,1640,2912,"Tr� Ph�m Ch�n","Ph�ng Nh�n ��ng",},
{168,1520,2928,"Chung Thi�t Th�i","Ph�ng Nh�n ��ng",},
{23,1696,3168,"�i�u D�ch �ao","Th�n Ti�n ��ng",},
{23,1768,3072,"�� T�n Sinh","Th�n Ti�n ��ng",},
{23,1864,3168,"B�ng V� T�nh","Th�n Ti�n ��ng",},
{23,1768,3312,"L� Hoa ��","Th�n Ti�n ��ng",},
{91,1536,3008,"Th�ch �nh Sa","K� Qu�n ��ng",},
{91,1528,2784,"Nguy Nh�n T� ","K� Qu�n ��ng",},
{91,1688,2960,"C� Vi�n Kh� ","K� Qu�n ��ng",},
{91,1656,3088,"Tang Ninh C�c","K� Qu�n ��ng",},
{135,1736,2960,"Di�m T� H�u","Ki�n T�nh Phong s�n  ��ng",},
{135,1808,3040,"��m Thi�n B�c","Ki�n T�nh Phong s�n  ��ng",},
{135,1608,3088,"Th�ch C� Ki�u","Ki�n T�nh Phong s�n  ��ng",},
{135,1536,2896,"�ng Th�i Hi�p","Ki�n T�nh Phong s�n  ��ng",},

}
tab_lv5xmap = {
{12,1792,3168,"M�nh ��p H�ng","M�t ��o T�n T��ng t�",},
{12,1720,3104,"�n T�c H�n","M�t ��o T�n T��ng t�",},
{12,1696,3200,"Ho�c Thanh S��ng","M�t ��o T�n T��ng t�",},
{12,1776,3264,"Mi�n T� ��o","M�t ��o T�n T��ng t�",},
{24,1792,3232,"Ti�u V�ng Du","H��ng Th�y ��ng",},
{24,1896,3280,"Cao N�i Kho�t","H��ng Th�y ��ng",},
{24,1952,3376,"M�nh T�  V� ","H��ng Th�y ��ng",},
{24,2064,3216,"���ng Ngh�a Chi","H��ng Th�y ��ng",},
{42,1592,2928,"L�u Vi Thi�n","Thi�n T�m ��ng",},
{42,1520,3152,"L� Tranh Tranh","Thi�n T�m ��ng",},
{42,1632,2992,"S� Ti�u s�n ","Thi�n T�m ��ng",},
{42,1704,3104,"T�y M�n V� Gi�i","Thi�n T�m ��ng",},
{66,1720,3232,"Gi�i T�nh Ch� ","S�n ��ng d��i ��y ��ng ��nh H�",},
{66,1696,3312,"L�i Huy�n Kh�ch","S�n ��ng d��i ��y ��ng ��nh H�",},
{66,1832,3232,"Di�p Ng� Long","S�n ��ng d��i ��y ��ng ��nh H�",},
{66,1656,3184,"Ti�t Ti�u B�ch","S�n ��ng d��i ��y ��ng ��nh H�",},
{194,1720,3360,"M�u Tu�t Nhung","Ng�c Hoa ��ng",},
{194,1768,3200,"D��ng Di�m Qu�n","Ng�c Hoa ��ng",},
{194,1536,3104,"Du Ti�u C��ng","Ng�c Hoa ��ng",},
{194,1480,3456,"C� D�  T�u","Ng�c Hoa ��ng",},

}
tab_lv6xmap = {
{164,1784,3120,"U�ng Th� Th�y","T�ng 1 Thi�n T�m th�p",},
{164,1776,2928,"Y�n L�u Sanh","T�ng 1 Thi�n T�m th�p",},
{164,1720,3072,"Tang Th��ng H�i","T�ng 1 Thi�n T�m th�p",},
{164,1568,3040,"B� Th�p Tam ","T�ng 1 Thi�n T�m th�p",},
{117,1664,3008,"H�u  Kh�t Ki�m","T�ng  2 T��ng V�n ��ng",},
{117,1528,3104,"H�u Y�n T�n","T�ng  2 T��ng V�n ��ng",},
{117,1656,3136,"Thi�u Th�t S�t","T�ng  2 T��ng V�n ��ng",},
{117,1680,3248,"Du V�n L� ","T�ng  2 T��ng V�n ��ng",},
{56,1464,3440,"C�u Du�n Sam","Ho�nh s�n  ph�i",},
{56,1536,3376,"Th��ng Quan Ch�t","Ho�nh s�n  ph�i",},
{56,1504,3232,"T�i Vi�n B�c","Ho�nh s�n  ph�i",},
{56,1624,3152,"T��ng Huy�n Vi�n","Ho�nh s�n  ph�i",},
{148,1536,3296,"Khu�t L�c Vinh","T�ng 4 Tuy�t B�o ��ng",},
{148,1560,3280,"L� Qu�n B�c ","T�ng 4 Tuy�t B�o ��ng",},
{148,1560,3312,"Gi�i Qui Nam ","T�ng 4 Tuy�t B�o ��ng",},
{148,1624,3200,"T�ng V� �nh","T�ng 4 Tuy�t B�o ��ng",},
{196,1528,3040,"Ti�n Th� Thanh ","D��ng Gi�c ��ng",},
{196,1648,2944,"B�ch Th��ng Nham","D��ng Gi�c ��ng",},
{196,1768,3184,"Bi�n L�u Thi�n"," D��ng Gi�c ��ng",},
{196,1656,3344,"Th�i Tinh Th�n","D��ng Gi�c ��ng",},

}
tab_lv7xmap = {
{123,1600,3200,"H�ng L�nh Ti","L�o H� ��ng",},
{123,1704,3248,"T�o Nh�n Ph� ","L�o H� ��ng",},
{123,1576,3360,"Tr�nh Ph�c Ba","L�o H� ��ng",},
{123,1552,3296,"��ng An Khu� ","L�o H� ��ng",},
{94,1664,3120,"�ng  Ti�u Phong","Linh C�c ��ng",},
{94,1752,3168,"Th��ng Tri�u S��ng","Linh C�c ��ng",},
{94,1584,3248,"Ph�ng Song D�c","Linh C�c ��ng",},
{94,1608,3040,"Ph� Kh�u Tu","Linh C�c ��ng",},
{319,1656,3296,"L�c Long Hi�n","L�m Du Quan",},
{319,1856,3264,"C� Thanh D��ng","L�m Du Quan",},
{319,1928,3632,"Quan Thi�n V�n","L�m Du Quan",},
{319,1808,3408,"H� Thi�u H�ng","L�m Du Quan",},
{72,1624,3120,"T� C� Ng�m","��i T� ��ng",},
{72,1800,3200,"H� Nh�t Lang","��i T� ��ng",},
{72,1584,3232,"Ho�ng V�n Ki�p","��i T� ��ng",},
{72,1560,2976,"Giang Tr�m Nh�n ","��i T� ��ng",},
{76,1648,3136,"C�nh Dung Ph�c","S�n B�o ��ng",},
{76,1584,3152,"Kh��ng T� Dao","S�n B�o ��ng",},
{76,1832,3056,"Kh�ng Dong Nh�n","S�n B�o ��ng",},
{76,1608,3024,"L�ng T�n Trung","S�n B�o ��ng",},

}
tab_lv8xmap = {
{201,1768,3200,"Di�p �c Anh","B�ng H� ��ng",},
{201,1648,3184,"L�c Nh� Kim","B�ng H� ��ng",},
{201,1696,3312,"M�c Nam Tr�c","B�ng H� ��ng",},
{201,1832,3360,"T�n T� Du","B�ng H� ��ng",},
{10,1744,2992,"C� V� Th��ng","Nh�n Th�ch ��ng",},
{10,1848,3216,"Li�u T� Gia","Nh�n Th�ch ��ng",},
{10,1752,3216,"Thi ��i Thi�u","Nh�n Th�ch ��ng",},
{10,1672,3136,"T�n V�n B�u ","Nh�n Th�ch ��ng",},
{202,1544,2832,"��ng B�t Ph�c","Ph� Dung ��ng",},
{202,1712,2912,"���ng B�c V�n","Ph� Dung ��ng",},
{202,1608,3136,"��o ��o Ch� ","Ph� Dung ��ng",},
{202,1512,2656,"�i�n V� ��o","Ph� Dung ��ng",},
{181,1592,3104,"Vi�n Ni�m T�ch","L��ng Th�y ��ng",},
{181,1624,2960,"Tr�nh Tr�c Qu�n","L��ng Th�y ��ng",},
{181,1696,3024,"Ch��ng Nguy�n S�ng","L��ng Th�y ��ng",},
{181,1688,3216,"T� Tr�ng H�u","L��ng Th�y ��ng",},
{143,1536,3152,"Vu C�u  ��","T�ng 3 D��c V��ng ��ng",},
{143,1528,3248,"Vi�n Thi�n Th� ","T�ng 3 D��c V��ng ��ng",},
{143,1640,3120,"Nh�c Th��ng C�n","T�ng 3 D��c V��ng ��ng",},
{143,1632,3248,"Chi�m Ph�c V�n","T�ng 3 D��c V��ng ��ng",},

}
tab_lv9xmap = {
{93,1640,3264,"Gi� Gi�i Nh�n","Ti�n C�c ��ng",},
{93,1640,3056,"Tr�nh C�u Nh�t","Ti�n C�c ��ng",},
{93,1736,3200,"Chu S� B� ","Ti�n C�c ��ng",},
{93,1608,3152,"Trang Minh Trung","Ti�n C�c ��ng",},
{225,1584,3312,"Cam Ch�nh C� ","Sa M�c s�n  ��ng",},
{225,1256,3232,"V� Nh�t Th� ","Sa M�c s�n  ��ng",},
{225,1448,3376,"D��ng Phong  D�t","Sa M�c s�n  ��ng",},
{225,1424,3104,"H� Sinh Vong","Sa M�c s�n  ��ng",},
{75,1704,3184,"T�ng Ch� �an","Kho� Lang ��ng",},
{75,1752,3120,"V� Bi�n Th�nh","Kho� Lang ��ng",},
{75,1824,3184,"C� Th� ��ng","Kho� Lang ��ng",},
{75,1632,3152,"Gia C�t Kinh H�ng","Kho� Lang ��ng",},
{321,1248,2992,"Phan Ng�t Nh�n","Tr��ng B�ch nam",},
{321,1483,2744,"Li�n H�nh Th�i","Tr��ng B�ch nam",}, -- lag
{321,1288,2608,"B�o Tri�t s�n ","Tr��ng B�ch nam",},
{321,1112,2560,"V�n H� Tinh","Tr��ng B�ch nam",},
{340,1216,2736,"Tr� Thi�n M�n","M�c Cao Qu�t",},
{340,1720,2752,"�o�n L�ng Nguy�t","M�c Cao Qu�t",},
{340,1272,2736,"T� D�t Minh","M�c Cao Qu�t",},
{340,1924,2770,"Nh�m Th��ng Khung","M�c Cao Qu�t",},
}
-- Boss Sat Thu 2x
function gopos_2x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv2xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv2xmap[i][4].."/#gopos_2xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_2x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_2x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end
function gopos_2xdi(nIdx)
	NewWorld(tab_lv2xmap[nIdx][1], tab_lv2xmap[nIdx][2], tab_lv2xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv2xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv2xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 3x
function gopos_3x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv3xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv3xmap[i][4].."/#gopos_3xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_3x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_3x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_3xdi(nIdx)
	NewWorld(tab_lv3xmap[nIdx][1], tab_lv3xmap[nIdx][2], tab_lv3xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv3xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv3xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat thu 4x
function gopos_4x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv4xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv4xmap[i][4].."/#gopos_4xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_4x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_4x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_4xdi(nIdx)
	NewWorld(tab_lv4xmap[nIdx][1], tab_lv4xmap[nIdx][2], tab_lv4xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv4xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv4xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 5x
function gopos_5x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv5xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv5xmap[i][4].."/#gopos_5xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_5x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_5x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_5xdi(nIdx)
	NewWorld(tab_lv5xmap[nIdx][1], tab_lv5xmap[nIdx][2], tab_lv5xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv5xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv5xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 6x
function gopos_6x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv6xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv6xmap[i][4].."/#gopos_6xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_6x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_6x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_6xdi(nIdx)
	NewWorld(tab_lv6xmap[nIdx][1], tab_lv6xmap[nIdx][2], tab_lv6xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv6xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv6xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 7x
function gopos_7x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv7xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv7xmap[i][4].."/#gopos_7xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_7x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_7x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_7xdi(nIdx)
	NewWorld(tab_lv7xmap[nIdx][1], tab_lv7xmap[nIdx][2], tab_lv7xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv7xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv7xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 8x
function gopos_8x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv8xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv8xmap[i][4].."/#gopos_8xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_8x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_8x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "Tho�t/no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_8xdi(nIdx)
	NewWorld(tab_lv8xmap[nIdx][1], tab_lv8xmap[nIdx][2], tab_lv8xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv8xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv8xmap[nIdx][4].."<color> n�o!");
end
-- Boss Sat Thu 9x
function gopos_9x(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv9xmap);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv9xmap[i][5]..": "..tab_lv9xmap[i][4].."/#gopos_9xdi("..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr��c/#gopos_9x(1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang k�/#gopos_9x("..(ne_1+1)..","..n_count..")");
	end
	
	tinsert(tab_Content, "R�i kh�i./no");
	Say("<color=green>H�y ch�n k� m� ng��i mu�n ti�u di�t, ta s� ��a ng��i ��n ch� h�n!<color>", getn(tab_Content), tab_Content);
end

function gopos_9xdi(nIdx)
	NewWorld(tab_lv9xmap[nIdx][1], tab_lv9xmap[nIdx][2], tab_lv9xmap[nIdx][3])
	SetFightState(1);
	Msg2Player("H�y ng�i y�n, ch�ng ta �i ��n <color=Green>"..tab_lv9xmap[nIdx][5].."<color> �� ti�u di�t <color=Yellow>"..tab_lv9xmap[nIdx][4].."<color> n�o!");
end


function no()
end

