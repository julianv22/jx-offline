Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("��i L�- tr�n L�i ��i b�t ��u");
	TaskSetMode(1);
	
	-- 2005��1��4��(���ڶ�)��һ�ο�ʼ
	TaskSetStartDay(1, 4);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ3,�����citywar.ini��ָ����һ��
	if (cw_CanStart(3,3) == 1) then
		StartArena(3);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
