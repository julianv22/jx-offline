--close_citydefence_1700.lua
--�ر�����ս��

function TaskShedule()
	TaskName("V� qu�c Phong H�a li�n th�nh");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(17, 0);
	OutputMsg(format("'V� qu�c li�n th�nh' �� k�t th�c %d:%d...", 17, 0));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	OutputMsg("V� qu�c li�n th�nh �� k�t th�c");
	GlobalExecute("dw CityDefence_CloseMain()");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
