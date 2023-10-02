QY_GOLDBOSS_APOS_INFO = {
					{"Cæ B¸ch", 566, 95, 0, {"Phï Dung ®éng","S¬n B¶o ®éng","city"}}, -- Ãû×Ö,ÐÎÏó,µÈ¼¶,ÎåÐÐ,{¿ÉÄÜ³öÏÖµÄµØÍ¼}
					{"HuyÒn Gi¸c §¹i S­", 740, 95, 0, {"Nh¹n Th¹ch ®éng","Thanh Khª ®éng","city"}},
					{"§­êng Phi YÕn", 1366, 95, 1, {"Phong L¨ng §é nam","Kháa Lang ®éng","city"}},
					{"Lam Y Y", 582, 95, 1, {"Vò L¨ng ®éng","Phi Thiªn ®éng","city"}},
					{"Hµ Linh Phiªu", 568, 95, 2, {"Tr­êng B¹ch s¬n B¾c","V« Danh ®éng","city"}},
					{"Yªn HiÓu Tr¸i", 744, 95, 2, {"Sa M¹c 1","Sa M¹c 3","city"}},
					{"M¹nh Th­¬ng L­¬ng", 583, 95, 3, {"Sa M¹c §Þa BiÓu","Sa M¹c 2","city"}},
					{"Gia LuËt TÞ Ly", 563, 95, 3, {"L­ìng Thñy ®éng","D­¬ng Trung ®éng","city"}},
					{"§¹o Thanh Ch©n Nh©n", 562, 95, 4, {"Tr­êng B¹ch s¬n Nam","M¹c Cao QuËt","city"}},
					{"TuyÒn C¬ Tö", 747, 95, 4, {"Vi S¬n ®¶o","Phi Thiªn ®éng","city"}},
}

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "MAKE GOLDBOSS 22:00" );
	TaskInterval( 1440 );
	TaskTime( 22, 00 );
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  22:00" );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		qy_makeboss_fixure(1)
		return 0;
	end;
	BigBoss.gold_boss_count = 0;
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end