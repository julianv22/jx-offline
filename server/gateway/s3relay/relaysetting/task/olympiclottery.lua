szMainString = "Lottery";
nMaxServerCount = 8;

function GameSvrConnected(dwGameSvrIP)
	SyncLottery(dwGameSvrIP, szMainString);
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--���÷�������
	TaskName("D� �o�n Olympic")
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(10)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
end

function TaskContent()
	OutputMsg("--------------"..date().."--------------------");
	CheckLotteryState("RelaySetting\\Lottery.txt", szMainString, nMaxServerCount);
	OutputMsg("----------------------------------");
end

