--�����Ž��ء���̳����
Include("\\script\\gb_taskfuncs.lua")
LG_PARTNER_JITAN_NAME = "T� ��n"
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
	TaskName( "Tr��ng Ca M�n c�m ��a   Nhi�m v� t� ��n" );
	--����������㿪ʼ
	local h, m = GetNextTime();
	TaskTime(h, m);
	TaskInterval( 60 );
	TaskCountLimit( 0 );
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 0)
	end
	-- ���������Ϣ
	OutputMsg( "Tr��ng Ca M�n c�m ��a   Nhi�m v� t� ��n" );
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 1)
	end
	GlobalExecute("dw Msg2SubWorld ( [ [Trong Tr��ng Ca M�n c�m ��a, linh l�c c�a s�t ��n �� h�i sinh. N� �ang k�u g�i b�n ��ng h�nh c�a b�n, n� c�n ch�ng nh�n kinh b�i. D�t b�n ��ng h�nh c�a b�n th�ng qua <color=yellow>M�n nh�n Tr��ng Ca M�n<color> x�m nh�p th�m hi�m c�m ��a.]]) ")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
