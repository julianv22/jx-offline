-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	-- ���÷�������
	TaskName( "T�ng ch� huy Chi�n d�ch T�ng Kim" );
	TaskSetMode(1);

	--ÿ�ܵģ�����һ)��ʼ�µ�һ��
	TaskSetStartDay(1, 3);

	-- һ��һ��ѭ��
	TaskInterval(7);
	TaskTime(2, 0);
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("****************Create XIANGYANG New Battle********")
	battle_StartNewIssue(1, 1 );	
	battle_StartNewIssue(1, 2 );	
	battle_StartNewIssue(1, 3 );	
	OutputMsg("***************************************************")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
