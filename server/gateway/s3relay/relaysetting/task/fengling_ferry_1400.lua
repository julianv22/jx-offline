-- function TaskShedule()
-- 	--���÷�������
-- 	TaskName("Phong L�ng ��")
-- 	local nStartHour = tonumber(date("%H")) + 1;
	
-- 	if (nStartHour >= 24) then
-- 		nStartHour = 0;
-- 	end;
	
-- 	TaskTime(nStartHour, 0);
	
-- 	--���ü��ʱ�䣬��λΪ����
-- 	TaskInterval(60) --60����һ��
	
-- 	--���ô���������0��ʾ���޴���
-- 	TaskCountLimit(0)
-- 	OutputMsg("=================Phong l�ng ��==================");
-- end

function TaskShedule()
	TaskName("Phong L�ng ��")
	TaskInterval(1440) --60����һ��
	TaskTime(14, 0);
	TaskCountLimit(0)
	OutputMsg("=================Phong l�ng ��==================");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end