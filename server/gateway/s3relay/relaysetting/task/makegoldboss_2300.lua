QY_GOLDBOSS_APOS_INFO = {
					{"V��ng T�", 739, 95, 0, {"V� L�ng ��ng","Ph� Dung ��ng","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					{"Huy�n Nan ��i S�", 1365, 95, 0, {"Phong L�ng �� b�c","Kh�a Lang ��ng","city"}},
					{"���ng B�t Nhi�m", 741, 95, 1, {"Tr��ng B�ch s�n Nam","Nh�n Th�ch ��ng","city"}},
					{"B�ch Doanh Doanh", 742, 95, 1, {"Thanh Kh� ��ng","Sa M�c ��a Bi�u","city"}},
					{"Thanh Tuy�t S� Th�i", 743, 95, 2, {"Vi S�n ��o","D��ng Trung ��ng","city"}},
					{"Chung Linh T�", 567, 95, 2, {"Phi Thi�n ��ng","V� Danh ��ng","city"}},
					{"H� Nh�n Ng�", 745, 95, 3, {"Nh�n Th�ch ��ng","L��ng Th�y ��ng","city"}},
					{"�oan M�c Du�", 565, 95, 3, {"Phong L�ng �� nam","S�n B�o ��ng","city"}},
					{"T� ��i Nh�c", 1367, 95, 4, {"M�c B�c Th�o Nguy�n","V� L�ng ��ng","city"}},
					{"Thanh Li�n T�", 1368, 95, 4, {"Tr��ng B�ch s�n B�c","Sa M�c 3","city"}},
}

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 23:00" );
	TaskInterval( 1440 );
	TaskTime( 23, 00 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
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