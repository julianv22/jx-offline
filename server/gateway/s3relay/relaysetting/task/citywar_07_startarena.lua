Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L�m An - tr�n L�i ��i b�t ��u");
	TaskSetMode(1);
	
	-- 2005��1��1��(������)��һ�ο�ʼ
	TaskSetStartDay(1, 1);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ٰ����Ϊ7,�����citywar.ini��ָ����һ��
	if (cw_CanStart(7,3) == 1) then
		StartArena(7);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
