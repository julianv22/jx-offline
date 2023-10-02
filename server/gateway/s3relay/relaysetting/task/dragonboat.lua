-- ���۱�����ʱ��

INTERVAL_TIME = 60	-- ÿСʱ����

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
	TaskName("�ua thuy�n r�ng");	

	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("��ng h� ��nh gi� �ua thuy�n r�ng s� kh�i ��ng v�o %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);

	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	OutputMsg("B�t ��u b�o danh �ua thuy�n r�ng...");
	-- ����GameServer�ϵĽű�
	GlobalExecute("dw LoadScript([[\\settings\\trigger.lua]])");
end
