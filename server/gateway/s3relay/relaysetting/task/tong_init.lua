--���ά���ű�
--by luobaohang 06/03/10
IncludeLib("TONG")
-- ���ά����ʱ��
INTERVAL_TIME = 999999
function TaskShedule()
	TaskName("Bang h�i c� �ang kh�i ��ng");
	-- ���ô���ʱ��(��ʱִ��)
	-- ִ��1��
	TaskCountLimit(1);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Bang h�i c� �ang kh�i ��ng.......................")
	while (nTongID ~= 0)do
		if (TONG_GetDay(nTongID) <= 0)then
			OutputMsg("�ang v�n h�nh bang h�i c�: "..TONG_GetName(nTongID))
			TONG_ApplyInit(nTongID)
		end	
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
