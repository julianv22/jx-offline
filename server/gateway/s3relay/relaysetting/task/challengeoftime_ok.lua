-- ʱ�����ս������ʱ��

INTERVAL_TIME = 60	-- ÿСʱ����
-- INTERVAL_TIME = 10	-- ÿСʱ����

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("Thi ��u 'Th�ch th�c th�i gian'");	

	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Thi ��u 'Th�ch th�c th�i gian' c�n c� theo gi� tr�n Server   %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	OutputMsg("�ang bao danh thi ��u 'Th�ch th�c th�i gian'");
	-- ����GameServer�ϵĽű�
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "Th�i gian b�o danh 'Th�ch th�c th�i gian' �� b�t ��u, c�c ��i tr��ng h�y mau ��n Nhi�p Th� Tr�n � c�c th�nh th� b�o danh. Th�i gian b�o danh l� 10 ph�t."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
