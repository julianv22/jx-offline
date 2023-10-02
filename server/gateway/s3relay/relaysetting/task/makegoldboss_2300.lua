QY_GOLDBOSS_APOS_INFO = {
					{"V­¬ng T¸", 739, 95, 0, {"Vò L¨ng ®éng","Phï Dung ®éng","city"}}, -- Ãû×Ö,ÐÎÏó,µÈ¼¶,ÎåÐÐ,{¿ÉÄÜ³öÏÖµÄµØÍ¼}
					{"HuyÒn Nan §¹i S­", 1365, 95, 0, {"Phong L¨ng §é b¾c","Kháa Lang ®éng","city"}},
					{"§­êng BÊt NhiÔm", 741, 95, 1, {"Tr­êng B¹ch s¬n Nam","Nh¹n Th¹ch ®éng","city"}},
					{"B¹ch Doanh Doanh", 742, 95, 1, {"Thanh Khª ®éng","Sa M¹c §Þa BiÓu","city"}},
					{"Thanh TuyÖt S­ Th¸i", 743, 95, 2, {"Vi S¬n ®¶o","D­¬ng Trung ®éng","city"}},
					{"Chung Linh Tó", 567, 95, 2, {"Phi Thiªn ®éng","V« Danh ®éng","city"}},
					{"Hµ Nh©n Ng·", 745, 95, 3, {"Nh¹n Th¹ch ®éng","L­ìng Thñy ®éng","city"}},
					{"§oan Méc DuÖ", 565, 95, 3, {"Phong L¨ng §é nam","S¬n B¶o ®éng","city"}},
					{"Tõ §¹i Nh¹c", 1367, 95, 4, {"M¹c B¾c Th¶o Nguyªn","Vò L¨ng ®éng","city"}},
					{"Thanh Liªn Tö", 1368, 95, 4, {"Tr­êng B¹ch s¬n B¾c","Sa M¹c 3","city"}},
}

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "MAKE GOLDBOSS 23:00" );
	TaskInterval( 1440 );
	TaskTime( 23, 00 );
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  23:00" );
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