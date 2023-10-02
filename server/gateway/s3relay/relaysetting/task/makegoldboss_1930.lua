QY_GOLDBOSS_APOS_INFO = {
					{"C� B�ch", 566, 95, 0, {"Ph� Dung ��ng","S�n B�o ��ng","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					{"Huy�n Gi�c ��i S� ", 740, 95, 0, {"Nh�n Th�ch ��ng","Thanh kh� ��ng","city"}},
					{"���ng Phi Y�n", 1366, 95, 1, {"Phong L�ng �� Nam","Kh�a Long ��ng","city"}},
					{"Lam Y Y", 582, 95, 1, {"V� L�ng ��ng","Phi Thi�n ��ng","city"}},
					{"H� Linh Phi�u", 568, 95, 2, {"Tr��ng B�ch s�n B�c","V� Danh ��ng","city"}},
					{"Y�n Hi�u Tr�i", 744, 95, 2, {"Sa M�c 1","Sa M�c 3","city"}},
					{"M�nh Th��ng L��ng", 583, 95, 3, {"Sa m�c ��a bi�u","Sa M�c 2","city"}},
					{"Gia Lu�t T� Ly", 563, 95, 3, {"L��ng Th�y ��ng","D��ng Trung ��ng","city"}},
					{"��o Thanh Ch�n Nh�n", 562, 95, 4, {"Tr��ng B�ch s�n Nam ","M�c Cao Qu�t","city"}},
					{"Tuy�n C� T� ", 747, 95, 4, {"Phi Thi�n ��ng","city"}},
					
				--{"����ѩ��", 564, 95, 3, 227, 1504, 3144, "��˵����߹�������ѩ��׷���ľ�ȥ�����Ĺ��ػ�ɳĮ�Թ���"},
}

QY_GOLDBOSS_DPOS_INFO = {
					{"Thanh Tuy�t S� Th�i", 743, 95, 341, 2, "Giang h� truy�n r�ng Thanh Tuy�t S� Th�i t�ng danh tr�n giang h� �� xu�t hi�n t�i M�c B�c Th�o Nguy�n! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"},
					{"Y�n Hi�u Tr�i", 744, 95, 336, 2, "Nghe n�i Th�y Ti�n s� gi� Y�n Hi�u Tr�i �� xu�t hi�n t�i Phong L�ng �� B�c! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"},
					{"H� Nh�n Ng� ", 745, 95, 321, 3, "Giang h� t��ng truy�n H� Nh�n Ng� �� xu�t hi�n t�i Tr��ng B�ch S�n! S� c� m�t tr�n huy�t chi�n x�y ra!", "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"},
					{"Huy�n Gi�c ��i S� ", 740, 95, 322, 0, "Giang h� truy�n r�ng Huy�n Gi�c ��i S� t�ng danh tr�n giang h� xu�t hi�n t�i Tr��ng B�ch S�n! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"},
					{"Tuy�n C� T� ", 747, 95, 340, 4, "Giang h� ��n ��i To�n C� T� �n t�ch b�y l�u ��t nhi�n xu�t hi�n t�i M�c Cao Qu�t. Huy�t chi�n s� l�i x�y ra!", "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"},
					{"T� ��i Nh�c", 1367, 95, 342,4, "Nhi�u ng��i ��n r�ng T� ��i Nh�c �� xu�t hi�n t�i Vi S�n ��o! Giang h� t� ��y l�i th�m m�t phen s�ng gi�!", "\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
}
Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 19:30" );
	TaskInterval( 1440 );
	TaskTime( 19, 30 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  19:30" );
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
