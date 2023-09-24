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

--Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua"); -- t�y t�y, c�ng �i�m nhanh
 Include("\\script\\global\\fuyuan.lua")
tbFunction = {
		{"N�ng c�p ��","level",0,200,"Nh�p C�p ��:"},
		{"Danh v�ng v� ph�c duy�n","danhvong",0,100000,"Nh�p S� L��ng:"},
		{"Ti�n v�n","tienvan",0,1000,"Nh�p S� L��ng:"},
		{"Ti�n ��ng","tiendong",0,2000,"Nh�p S� L��ng:"},
		{"KNB","knb",0,60,"Nh�p S� L��ng:"},
		{"�i�m Ch�n Nguy�n v� H� M�ch ��n","channguyen",0,100000,"Nh�p S� L��ng:"},
		{"�i�m Ti�m N�ng","pointtiemnang",0,30000,"Nh�p S� L��ng:"},
		{"�i�m K� N�ng","pointkynang",0,1000,"Nh�p S� L��ng:"},
		{"T�i l�nh ��o","tailanhdao",0,1000000000,"Nh�p S� L��ng:"},
		{"�i�m c�ng hi�n","conghien",0,1000000,"Nh�p S� L��ng:"},
 }
---------- L�y c�c lo�i �i�m----------------
function laydiem()
	dofile("script/global/gm/function_points.lua")
	local szTitle = "Xin ch�o ! ��i hi�p mu�n nh�n lo�i �i�m n�o1?"
	local tbOpt= {}
	for i = 1 , getn(tbFunction) do
		tinsert(tbOpt, {tbFunction[i][1],askNunber, {tbFunction[i][2], tbFunction[i][3], tbFunction[i][4], tbFunction[i][5]}})
	end
	tinsert(tbOpt, {"L�t n�a quay l�i"});
	CreateNewSayEx(szTitle, tbOpt)
end
-------------------------------------------------------------------------
function askNunber(nIndex, nIndex1, nIndex2, nIndex3)
	AskClientForNumber(nIndex, nIndex1, nIndex2, nIndex3) 
end
------------C�p-------------------
function askNunber1()
	AskClientForNumber("change_phai", 0, 10, "Nh�p S� L��ng111:") 
end

function level(nIndex)
	local nCurLevel = GetLevel()
	local nAddLevel = nIndex - nCurLevel
	ST_LevelUp(nAddLevel)
	Msg2Player("B�n nh�n ���c c�p �� <color=yellow>"..nIndex.."<color>.") 
end

function danhvong(nIndex)
	AddRepute(nIndex)
	FuYuan_Start()
	FuYuan_Add(nIndex)
	Msg2Player("B�n nh�n ���c "..nIndex.." �i�m Danh V�ng v� Ph�c Duy�n.")
end

function tienvan(nIndex)
	local money= nIndex*10000
	Earn(money)
	Msg2Player(format("B�n nh�n ���c <color=yellow>%d v�n<color>.", nIndex))
end

----------------�i�m K� N�ng----------------------------------------
function pointkynang(nIndex)
	AddMagicPoint(nIndex)		---Nh�n �i�m k� n�ng
	Msg2Player("B�n nh�n ���c <color=yellow>"..nIndex.."<color> �i�m K� N�ng.")
end
------------------�i�m Ti�m N�ng--------------------------------------
function pointtiemnang(nIndex)
	AddProp(nIndex)		---Nh�n �i�m ti�m n�ng
	Msg2Player("B�n nh�n ���c <color=yellow>"..nIndex.."<color> �i�m Ti�m N�ng.")
end

---Tien Dong---
function tiendong(nIndex)
	for i = 1, nIndex do
		--AddStackItem(1,4,417,1,1,0,0,0)
		AddItem(4,417,1,1,0,0,0)
	end
	Msg2Player("B�n nh�n ���c <color=yellow>"..nIndex.." <color>ti�n ��ng.")
end
------------T�i L�nh ��o----------------------------
function tailanhdao(nIndex)
	for i = 1, 250 do
		AddLeadExp(nIndex)
	end
	Msg2Player("B�n nh�n ���c  <color=yellow>"..nIndex.." <color> �i�m exp t�i l�nh ��o");
end
------------�i�m C�ng Hi�n----------------------------
function conghien(nIndex)
	AddContribution(nIndex);
	Msg2Player("B�n nh�n ���c  <color=yellow>"..nIndex.." <color> �i�m c�ng hi�n")
end
----KNB------
function knb(nIndex)
	for i=1, nIndex do
		AddEventItem(343)
	end
Msg2Player("B�n nh�n ���c <color=yellow>"..nIndex.." <color>KNB.")
end
------------Ch�n Nguy�n----------------------------
function channguyen(nIndex)
	SetTask(4000, GetTask(4000) + nIndex)	
	for i = 1,nIndex do
		AddItem(6, 1, 3203, 0, 0, 0)
	end
	Msg2Player("Nh�n ���c <color=yellow>"..nIndex.." Ch�n Nguy�n v� "..nIndex.." H� M�ch ��n")
end