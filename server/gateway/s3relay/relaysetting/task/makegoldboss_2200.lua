QY_GOLDBOSS_APOS_INFO = {
					{"C� B�ch", 566, 95, 0, {"Ph� Dung ��ng","S�n B�o ��ng","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					{"Huy�n Gi�c ��i S�", 740, 95, 0, {"Nh�n Th�ch ��ng","Thanh Kh� ��ng","city"}},
					{"���ng Phi Y�n", 1366, 95, 1, {"Phong L�ng �� nam","Kh�a Lang ��ng","city"}},
					{"Lam Y Y", 582, 95, 1, {"V� L�ng ��ng","Phi Thi�n ��ng","city"}},
					{"H� Linh Phi�u", 568, 95, 2, {"Tr��ng B�ch s�n B�c","V� Danh ��ng","city"}},
					{"Y�n Hi�u Tr�i", 744, 95, 2, {"Sa M�c 1","Sa M�c 3","city"}},
					{"M�nh Th��ng L��ng", 583, 95, 3, {"Sa M�c ��a Bi�u","Sa M�c 2","city"}},
					{"Gia Lu�t T� Ly", 563, 95, 3, {"L��ng Th�y ��ng","D��ng Trung ��ng","city"}},
					{"��o Thanh Ch�n Nh�n", 562, 95, 4, {"Tr��ng B�ch s�n Nam","M�c Cao Qu�t","city"}},
					{"Tuy�n C� T�", 747, 95, 4, {"Vi S�n ��o","Phi Thi�n ��ng","city"}},
}

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 22:00" );
	TaskInterval( 1440 );
	TaskTime( 22, 00 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
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