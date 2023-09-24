--IncludeLib("ITEM");
--IncludeLib("TIMER");
--IncludeLib("FILESYS");
--IncludeLib("SETTING");
--IncludeLib("TASKSYS")
--IncludeLib("PARTNER");
--IncludeLib("BATTLE");
--IncludeLib("RELAYLADDER");
--IncludeLib("TONG");
--IncludeLib("LEAGUE");
--Include( "\\script\\task\\system\\task_string.lua" );
--Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\lib\\log.lua");
--Include("\\script\\dailogsys\\dailogsay.lua")
--Include("\\script\\dailogsys\\g_dialog.lua")
--Include("\\script\\activitysys\\functionlib.lua")
--Include("\\script\\global\\translife.lua")
--Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
--Include("\\script\\global\\gm\\ex_lib_head.lua");
--Include("\\script\\global\\gm\\lib_data_table.lua");
--Include("\\script\\global\\gm\\lib_data_table_filelua.lua");

--Include("\\script\\global\\Ãÿ ‚”√µÿ\\√Œæ≥\\npc\\¬∑»À_≈—…Æ.lua"); -- t»y tÒy, cÈng Æi”m nhanh
 Include("\\script\\global\\fuyuan.lua")
tbFunction = {
		{"N©ng c p ÆÈ","level",0,200,"NhÀp C p ßÈ:"},
		{"Danh v‰ng vµ phÛc duy™n","danhvong",0,100000,"NhÀp SË L≠Óng:"},
		{"Ti“n vπn","tienvan",0,1000,"NhÀp SË L≠Óng:"},
		{"Ti“n ÆÂng","tiendong",0,2000,"NhÀp SË L≠Óng:"},
		{"KNB","knb",0,60,"NhÀp SË L≠Óng:"},
		{"ßi”m Ch©n Nguy™n vµ HÈ Mπch ß¨n","channguyen",0,100000,"NhÀp SË L≠Óng:"},
		{"ßi”m Ti“m N®ng","pointtiemnang",0,30000,"NhÀp SË L≠Óng:"},
		{"ßi”m K¸ N®ng","pointkynang",0,1000,"NhÀp SË L≠Óng:"},
		{"Tµi l∑nh Æπo","tailanhdao",0,1000000000,"NhÀp SË L≠Óng:"},
		{"ßi”m cËng hi’n","conghien",0,1000000,"NhÀp SË L≠Óng:"},
 }
---------- L y c∏c loπi Æi”m----------------
function laydiem()
	dofile("script/global/gm/function_points.lua")
	local szTitle = "Xin chµo ! ßπi hi÷p muËn nhÀn loπi Æi”m nµo1?"
	local tbOpt= {}
	for i = 1 , getn(tbFunction) do
		tinsert(tbOpt, {tbFunction[i][1],askNunber, {tbFunction[i][2], tbFunction[i][3], tbFunction[i][4], tbFunction[i][5]}})
	end
	tinsert(tbOpt, {"L∏t n˜a quay lπi"});
	CreateNewSayEx(szTitle, tbOpt)
end
-------------------------------------------------------------------------
function askNunber(nIndex, nIndex1, nIndex2, nIndex3)
	AskClientForNumber(nIndex, nIndex1, nIndex2, nIndex3) 
end
------------C p-------------------
function askNunber1()
	AskClientForNumber("change_phai", 0, 10, "NhÀp SË L≠Óng111:") 
end

function level(nIndex)
	local nCurLevel = GetLevel()
	local nAddLevel = nIndex - nCurLevel
	ST_LevelUp(nAddLevel)
	Msg2Player("Bπn nhÀn Æ≠Óc c p ÆÈ <color=yellow>"..nIndex.."<color>.") 
end

function danhvong(nIndex)
	AddRepute(nIndex)
	FuYuan_Start()
	FuYuan_Add(nIndex)
	Msg2Player("Bπn nhÀn Æ≠Óc "..nIndex.." Æi”m Danh V‰ng vµ PhÛc Duy™n.")
end

function tienvan(nIndex)
	local money= nIndex*10000
	Earn(money)
	Msg2Player(format("Bπn nhÀn Æ≠Óc <color=yellow>%d vπn<color>.", nIndex))
end

----------------ßi”m K¸ N®ng----------------------------------------
function pointkynang(nIndex)
	AddMagicPoint(nIndex)		---NhÀn Æi”m k¸ n®ng
	Msg2Player("Bπn nhÀn Æ≠Óc <color=yellow>"..nIndex.."<color> Æi”m K¸ N®ng.")
end
------------------ßi”m Ti“m N®ng--------------------------------------
function pointtiemnang(nIndex)
	AddProp(nIndex)		---NhÀn Æi”m ti“m n®ng
	Msg2Player("Bπn nhÀn Æ≠Óc <color=yellow>"..nIndex.."<color> Æi”m Ti“m N®ng.")
end

---Tien Dong---
function tiendong(nIndex)
	for i = 1, nIndex do
		--AddStackItem(1,4,417,1,1,0,0,0)
		AddItem(4,417,1,1,0,0,0)
	end
	Msg2Player("Bπn nhÀn Æ≠Óc <color=yellow>"..nIndex.." <color>ti“n ÆÂng.")
end
------------Tµi L∑nh ßπo----------------------------
function tailanhdao(nIndex)
	for i = 1, 250 do
		AddLeadExp(nIndex)
	end
	Msg2Player("Bπn nhÀn Æ≠Óc  <color=yellow>"..nIndex.." <color> Æi”m exp tµi l∑nh Æπo");
end
------------ßi”m CËng Hi’n----------------------------
function conghien(nIndex)
	AddContribution(nIndex);
	Msg2Player("Bπn nhÀn Æ≠Óc  <color=yellow>"..nIndex.." <color> Æi”m cËng hi’n")
end
----KNB------
function knb(nIndex)
	for i=1, nIndex do
		AddEventItem(343)
	end
Msg2Player("Bπn nhÀn Æ≠Óc <color=yellow>"..nIndex.." <color>KNB.")
end
------------Ch©n Nguy™n----------------------------
function channguyen(nIndex)
	SetTask(4000, GetTask(4000) + nIndex)	
	for i = 1,nIndex do
		AddItem(6, 1, 3203, 0, 0, 0)
	end
	Msg2Player("NhÀn Æ≠Óc <color=yellow>"..nIndex.." Ch©n Nguy™n vµ "..nIndex.." HÈ Mπch ß¨n")
end