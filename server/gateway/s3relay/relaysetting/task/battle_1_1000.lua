-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    -- ���÷�������
    TaskName("Chi�n d�ch T��ng D��ng (T�ng Kim) 10:00");
    TaskInterval(1440);
    TaskTime(9, 50);
    TaskCountLimit(0);
    -- ���������Ϣ
    OutputMsg("[Chien truong Tong-Kim] 10:00 startup...");
end

function TaskContent()
    Battle_StartNewRound(1, 1); -- GMָ������ͼ���ս��
    Battle_StartNewRound(1, 2); -- GMָ������м���ս��
    Battle_StartNewRound(1, 3); -- GMָ������߼���ս��
end

function GameSvrConnected( dwGameSvrIP ) end
function GameSvrReady( dwGameSvrIP ) end
