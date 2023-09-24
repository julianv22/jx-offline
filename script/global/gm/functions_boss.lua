--------------------------------------------------------------
--			 			Boss Hoµng Kim						--
--------------------------------------------------------------
function bosshk()
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "Gäi Boss Hoµng Kim/Auto_TestBoss");
			tinsert(tbSay, "T×m Boss Hoµng Kim/timbosshk");
			tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
		CreateTaskSay(tbSay)
	return 1;
end
---------------Gäi Boss HK------------------------
----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
        [1]={	szName = "TÞnh Th«ng",		        nBossId = 1355,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [2]={	szName = "Ng¹o Thiªn T­íng Qu©n",	nBossId = 1356,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "LiÔu Thanh Thanh",		nBossId = 523,	nRate = 322,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "T©y V­¬ng Tµ §éc",		nBossId = 1358,	nRate = 322,	nSeries = 1,	nLevel = 95},
        [5]={	szName = "DiÖu Nh­",			nBossId = 513,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [6]={	szName = "Do·n Thanh V©n",		nBossId = 1360,	nRate = 322,	nSeries = 2,	nLevel = 95},
        [7]={	szName = "H¾c Y S¸t Thñ",		nBossId = 1361,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [8]={	szName = "ThËp Ph­¬ng C©u DiÖt",		nBossId = 1362,	nRate = 322,	nSeries = 3,	nLevel = 95},
        [9]={	szName = "Tr­¬ng T«ng ChÝnh",		nBossId = 511,	nRate = 322,	nSeries = 4,	nLevel = 95},
        [10]={	szName = "Thanh Y Tö",			nBossId = 1364,	nRate = 322,	nSeries = 4,	nLevel = 95},
}

TBBOSS2  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
        [1]={	szName = "Cæ B¸ch",			nBossId = 566,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "V­¬ng T¸",			nBossId = 739,	nRate = 322,	nSeries = 0,	nLevel = 95},	
        [3]={	szName = "HuyÒn Gi¸c §¹i S­",		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
        [4]={	szName = "HuyÒn Nan §¹i S­",		nBossId = 1365,	nRate = 342,	nSeries = 0,	nLevel = 95},
	[5]={	szName = "§­êng BÊt NhiÔm",		nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[6]={	szName = "§­êng Phi YÕn",		nBossId = 1366,	nRate = 342,	nSeries = 1,	nLevel = 95},
        [7]={	szName = "B¹ch Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[8]={	szName = "Lam Y Y",			nBossId = 582,	nRate = 336,	nSeries = 1,	nLevel = 95},
        [9]={	szName = "Thanh TuyÖt S­ Th¸i",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[10]={	szName = "Hµ Linh Phiªu",		nBossId = 568,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[11]={	szName = "Chung Linh Tó",		nBossId = 567,	nRate = 336,	nSeries = 2,	nLevel = 95},
}

TBBOSS22  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
        [1]={	szName = "Yªn HiÓu Tr¸i",		nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
        [2]={	szName = "Hµ Nh©n Ng·",			nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[3]={	szName = "M¹nh Th­¬ng L­¬ng",		nBossId = 583,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "§o¹n Méc DuÖ",		nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[5]={	szName = "Gia LuËt TÞ Ly",		nBossId = 563,	nRate = 227,	nSeries = 3,	nLevel = 95},
        [6]={	szName = "Hµn M«ng",			nBossId = 748,	nRate = 341,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "§¬n Tö Nam",			nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
        [8]={	szName = "§¹o Thanh Ch©n Nh©n",		nBossId = 562,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "Tõ §¹i Nh¹c",			nBossId = 1367,	nRate = 342,	nSeries = 4,	nLevel = 95},	
	[10]={	szName = "Thanh Liªn Tö",		nBossId = 1368,	nRate = 875,	nSeries = 4,	nLevel = 95},
        [11]={	szName = "TuyÒn C¬ Tö",			nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
}


TBBOSSCAONHAN  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
	[1]={	szName = "ThiÕu L©m Hé Tù Vâ T¨ng",	nBossId = 1194,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "Thiªn V­¬ng TrÊn Bang Hé VÖ",	nBossId = 1193,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[3]={	szName = "D­¬ng Gia Trang HiÖp Kh¸ch",	nBossId = 1195,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[4]={	szName = "Ngò §éc V« S¾c La S¸t",	nBossId = 1196,	nRate = 300,	nSeries = 1,	nLevel = 95},
	[5]={	szName = "Nga Mi Kim §Ønh S­ Th¸i",	nBossId = 1197,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "Thóy Yªn M«n V« ¶nh S¸t Thñ",	nBossId = 1198,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[7]={	szName = "C¸i Bang Tiªu Dao ThÇn C¸i",	nBossId = 1199,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[8]={	szName = "Thiªn NhÉn Hé Gi¸o Th¸nh Sø",	nBossId = 1200,	nRate = 300,	nSeries = 3,	nLevel = 95},
	[9]={	szName = "Vâ §ang Th¸i Êt Ch©n Qu©n",	nBossId = 1201,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[10]={	szName = "C«n L«n Hé Ph¸i Thiªn Qu©n",	nBossId = 1202,	nRate = 300,	nSeries = 4,	nLevel = 95},
	[11]={	szName = "Hoa S¬n §éc C« KiÕm Tiªn",	nBossId = 1231,	nRate = 300,	nSeries = 2,	nLevel = 95},
}

TBBOSSCAOCAP  = 
{ --tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
	[1]={	szName = "Mé Dung Toµn",		nBossId = 1875,	nRate = 300,	nSeries = 2,	nLevel = 95},
	[2]={	szName = "Kim ThÝ L­îng",		nBossId = 1874,	nRate = 300,	nSeries = 0,	nLevel = 95},
	[3]={	szName = "Tr­¬ng Tuyªn",			nBossId = 1873,	nRate = 300,	nSeries = 3,	nLevel = 95},
}

function Auto_TestBoss()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSS) do 
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss2");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss2()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSS2) do 
		tinsert(tb,format("%s/#PickBoss2(%d)",TBBOSS2[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss22");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end
function Auto_TestBoss22()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSS22) do 
		tinsert(tb,format("%s/#PickBoss22(%d)",TBBOSS22[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss3");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss3()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSSCAONHAN) do 
		tinsert(tb,format("%s/#PickBoss3(%d)",TBBOSSCAONHAN[k].szName,k));
	end	
	tinsert(tb,"Trang sau/Auto_TestBoss4");
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function Auto_TestBoss4()
	tb = {"<color=red>"..GetName().."<color> b¹n muèn th¶ boss nµo?"}
	for k=1,getn(TBBOSSCAOCAP) do 
		tinsert(tb,format("%s/#PickBoss4(%d)",TBBOSSCAOCAP[k].szName,k));
	end	
	tinsert(tb,"Tho¸t/cancel");
	CreateTaskSay(tb)
end

function PickBoss(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bosstieu.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss2(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSS2[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss22(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSS22[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function PickBoss3(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSSCAONHAN[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\misc\\boss\\callbossdeath.lua")		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
function PickBoss4(nIndex)
	if GetFightState() == 0 then 
		Talk(1,"","Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
		return 
	end
	local item = TBBOSSCAOCAP[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);		
	SetNpcParam(index,1,item.nBossId); --l­u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function cancel()
end
-------------------------T×m Boss HK-----------------------------------------
tbMapGoldBoss = {
{"Cæ B¸ch","Phï Dung ®éng",202,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Gi¸c §¹i S­","Nh¹n Th¹ch ®éng",10,"Thanh khª ®éng",198,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng Phi YÕn", "Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Lam Y Y","Vò L¨ng ®éng",199,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c",322,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"M¹nh Th­¬ng L­¬ng","Sa m¹c ®Þa biÓu",224,"Sa M¹c s¬n  ®éng 2",226,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng",181,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§¹o Thanh Ch©n Nh©n","Tr­êng B¹ch s¬n Nam",321,"M¹c Cao QuËt",340,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"TuyÒn C¬ Tö", "T©y S¬n ®¶o",342,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"V­¬ng T¸","Vò L¨ng ®éng",199,"Phï Dung ®éng",202,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Nan §¹i S­","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam",321,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"B¹ch Doanh Doanh", "Thanh khª ®éng",198,"Sa m¹c ®Þa biÓu",224,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o",342,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Chung Linh Tó", "Phi Thiªn ®éng",204,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng",10,"L­ìng Thñy ®éng",181,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§oan Méc DuÖ", "Phong L¨ng ®é",336,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn",341,"Vò L¨ng ®éng",199,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh Liªn Tö","Tr­êng B¹ch s¬n B¾c",322,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i","Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµn Ngu Dèt","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
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
		tinsert(tab_Content, "Trang tr­íc/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho¸t./no");
	Say("§¹i hiÖp t×m cao thñ nµo?", getn(tab_Content), tab_Content);
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
	strTittle = "T×m thÊy cao thñ vâ l©m "..tbMapGoldBoss[nId][1].." t¹i c¸c vÞ trÝ sau ®©y."
	--tinsert(tbOpt, {"tho¸t ",Quit})
	tinsert(tb,"Quay l¹i./#findgoldboss(1,12)")
	tinsert(tb,"Tho¸t./Quit")
	--CreateNewSayEx(strTittle, tbOpt)
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end
