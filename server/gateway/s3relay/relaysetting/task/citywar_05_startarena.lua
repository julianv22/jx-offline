Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("T��ng D��ng - tr�n L�i ��i b�t ��u");
	TaskSetMode(1);
	
	-- 1��6��(������)��һ�ο�ʼ
	TaskSetStartDay(1, 6);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �������Ϊ5,�����citywar.ini��ָ����һ��
	if (cw_CanStart(5,3) == 1) then
		StartArena(5);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
