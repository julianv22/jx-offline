--���ά���ű�
--by luobaohang 06/03/10
IncludeLib("TONG")
-- ���ά����ʱ��
INTERVAL_TIME = 1440	-- ÿ24Сʱ����7��
function TaskShedule()
	TaskName("B�o tr� h�ng ng�y");
	-- 1440����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��(0��0��)
	TaskTime(0, 0);
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Kh�i ��ng b�o tr� bang h�i.......................")
	while (nTongID ~= 0)do
		OutputMsg("�ang ti�n h�nh b�o tr� bang:  "..TONG_GetName(nTongID))
		TONG_ApplyMaintain(nTongID)
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
