--------------------------------------------------------------
--			 			Boss Ho�ng Kim						--
--------------------------------------------------------------
function bosshk()
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "G�i Boss Ho�ng Kim/Auto_TestBoss");
			tinsert(tbSay, "T�m Boss Ho�ng Kim/timbosshk");
			tinsert(tbSay, "K�t th�c ��i tho�i./no")
		CreateTaskSay(tbSay)
	return 1;
end
---------------G�i Boss HK------------------------
----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS  = 
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
        [1]={	szName = "T�nh Th�ng",		        nBossId = 1355,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [2]={	szName = "Ng�o Thi�n T��ng Qu�n",	nBossId = 1356,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Li�u Thanh Thanh",		nBossId = 523,	nRate = 322,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "T�y V��ng T� ��c",		nBossId = 1358,	nRate = 322,	nSeries = 1,	nLevel = 95},
        [5]={	szName = "Di�u Nh�",			nBossId = 513,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [6]={	szName = "Do�n Thanh V�n",		nBossId = 1360,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [7]={	szName = "H�c Y S�t Th�",		nBossId = 1361,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [8]={	szName = "Th�p Ph��ng C�u Di�t",		nBossId = 1362,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [9]={	szName = "Tr��ng T�ng Ch�nh",		nBossId = 511,	nRate = 322,	nSeries = 4,	nLevel = 95},
        [10]={	szName = "Thanh Y T�",			nBossId = 1364,	nRate = 322,	nSeries = 4,	nLevel = 95},
}

TBBOSS2  = 
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
        [1]={	szName = "C� B�ch",			nBossId = 566,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "V��ng T�",			nBossId = 739,	nRate = 322,	nSeries = 0,	nLevel = 95},	
        [3]={	szName = "Huy�n Gi�c ��i S�",		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [4]={	szName = "Huy�n Nan ��i S�",		nBossId = 1365,	nRate = 342,	nSeries = 0,	nLevel = 95},
	[5]={	szName = "���ng B�t Nhi�m",		nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[6]={	szName = "���ng Phi Y�n",		nBossId = 1366,	nRate = 342,	nSeries = 1,	nLevel = 95},
        [7]={	szName = "B�ch Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[8]={	szName = "Lam Y Y",			nBossId = 582,	nRate = 336,	nSeries = 1,	nLevel = 95},
        [9]={	szName = "Thanh Tuy�t S� Th�i",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[10]={	szName = "H� Linh Phi�u",		nBossId = 568,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[11]={	szName = "Chung Linh T�",		nBossId = 567,	nRate = 336,	nSeries = 2,	nLevel = 95},
}

TBBOSS22  = 
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
        [1]={	szName = "Y�n Hi�u Tr�i",		nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
        [2]={	szName = "H� Nh�n Ng�",			nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[3]={	szName = "M�nh Th��ng L��ng",		nBossId = 583,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "�o�n M�c Du�",		nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[5]={	szName = "Gia Lu�t T� Ly",		nBossId = 563,	nRate = 227,	nSeries = 3,	nLevel = 95},
        [6]={	szName = "H�n M�ng",			nBossId = 748,	nRate = 341,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "��n T� Nam",			nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
        [8]={	szName = "��o Thanh Ch�n Nh�n",		nBossId = 562,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "T� ��i Nh�c",			nBossId = 1367,	nRate = 342,	nSeries = 4,	nLevel = 95},	
	[10]={	szName = "Thanh Li�n T�",		nBossId = 1368,	nRate = 875,	nSeries = 4,	nLevel = 95},
        [11]={	szName = "Tuy�n C� T�",			nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
}


TBBOSSCAONHAN  = 
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
	[1]={	szName = "Thi�u L�m H� T� V� T�ng",	nBossId = 1194,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "Thi�n V��ng Tr�n Bang H� V�",	nBossId = 1193,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[3]={	szName = "D��ng Gia Trang Hi�p Kh�ch",	nBossId = 1195,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "Ng� ��c V� S�c La S�t",	nBossId = 1196,	nRate = 300,	nSeries = 1,	nLevel = 95},
	[5]={	szName = "Nga Mi Kim ��nh S� Th�i",	nBossId = 1197,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "Th�y Y�n M�n V� �nh S�t Th�",	nBossId = 1198,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[7]={	szName = "C�i Bang Ti�u Dao Th�n C�i",	nBossId = 1199,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[8]={	szName = "Thi�n Nh�n H� Gi�o Th�nh S�",	nBossId = 1200,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[9]={	szName = "V� �ang Th�i �t Ch�n Qu�n",	nBossId = 1201,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[10]={	szName = "C�n L�n H� Ph�i Thi�n Qu�n",	nBossId = 1202,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[11]={	szName = "Hoa S�n ��c C� Ki�m Ti�n",	nBossId = 1231,	nRate = 300,	nSeries = 2,	nLevel = 95},
}

TBBOSSCAOCAP  = 
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
	[1]={	szName = "M� Dung To�n",		nBossId = 1875,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[2]={	szName = "Kim Th� L��ng",		nBossId = 1874,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Tr��ng Tuy�n",			nBossId = 1873,	nRate = 300,	nSeries = 3,	nLevel = 95},
}

function Auto_TestBoss()
	tb = {"<color=red>"..GetName().."<color> b�n mu�n th� boss n�o?"}
	for k=1,getn(TBBOSS) do 
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss2");
	tinsert(tb,"Tho�t/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss2()
	tb = {"<color=red>"..GetName().."<color> b�n mu�n th� boss n�o?"}
	for k=1,getn(TBBOSS2) do 
		tinsert(tb,format("%s/#PickBoss2(%d)",TBBOSS2[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss22");
	tinsert(tb,"Tho�t/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss22()
	tb = {"<color=red>"..GetName().."<color> b�n mu�n th� boss n�o?"}
	for k=1,getn(TBBOSS22) do 
		tinsert(tb,format("%s/#PickBoss22(%d)",TBBOSS22[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss3");
	tinsert(tb,"Tho�t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss3()
	tb = {"<color=red>"..GetName().."<color> b�n mu�n th� boss n�o?"}
	for k=1,getn(TBBOSSCAONHAN) do 
		tinsert(tb,format("%s/#PickBoss3(%d)",TBBOSSCAONHAN[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss4");
	tinsert(tb,"Tho�t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss4()
	tb = {"<color=red>"..GetName().."<color> b�n mu�n th� boss n�o?"}
	for k=1,getn(TBBOSSCAOCAP) do 
		tinsert(tb,format("%s/#PickBoss4(%d)",TBBOSSCAOCAP[k].szName,k));
	end	
	tinsert(tb,"Tho�t/cancel");
	CreateTaskSay(tb)
end

function PickBoss(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return 
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bosstieu.lua")		
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss2(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return 
	end
	local item = TBBOSS2[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss22(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return 
	end
	local item = TBBOSS22[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss3(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return 
	end
	local item = TBBOSSCAONHAN[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\misc\\boss\\callbossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
function PickBoss4(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return 
	end
	local item = TBBOSSCAOCAP[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);		
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function cancel()
end
-------------------------T�m Boss HK-----------------------------------------
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
