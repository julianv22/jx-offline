if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"B�ch Doanh Doanh", 742, 95, 336, 1, "Giang h� truy�n r�ng B�ch Doanh Doanh t�ng danh tr�n giang h� �� xu�t hi�n t�i Phong L�ng �� b� B�c! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
					--{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"B�ch Doanh Doanh", 742, 95, 336, 1, "Giang h� truy�n r�ng B�ch Doanh Doanh t�ng danh tr�n giang h� �� xu�t hi�n t�i Phong L�ng �� b� B�c! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
--					{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
					{"V��ng T� ", 739, 95, 341, 0, "Giang h� truy�n r�ng V��ng T� t�ng danh tr�n giang h� �� xu�t hi�n t�i M�c B�c th�o nguy�n! Giang h� s�p c� m�t tr�n ��m m�u!", "\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					{"�oan M�c Du� ", 565, 95, 227, 3,"C� k� nh�n th�y �oan M�c Du� b� m�t xu�t hi�n t�i M� Cung Sa m�c ��n Ho�ng.", "\\settings\\maps\\��������\\ɳĮ�Թ�\\duanmuruiboss.txt"},
					{"Lam Y Y", 582, 95, 181, 1, "Con g�i Lam Y Y c�a H�c Di�n Lang Qu�n �ang luy�n c�ng � L��ng Th�y ��ng.", "\\settings\\maps\\������\\��ˮ���Թ�\\lanyiyiboss.txt"},
					{"���ng Phi Y�n", 1366, 95, 342, 1, "Nhi�u ng��i ��n r�ng ���ng Phi Y�n �� xu�t hi�n t�i Vi S�n ��o! Giang h� t� ��y l�i th�m m�t phen s�ng gi�!", "\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 21:00" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  21:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
