Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("D��ng Ch�u - tr�n L�i ��i b�t ��u");
	TaskSetMode(1);
	
	-- 2005��1��2��(������)��һ�ο�ʼ
	TaskSetStartDay(1, 2);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ���ݱ��Ϊ6,�����citywar.ini��ָ����һ��
	if (cw_CanStart(6,3) == 1) then
		StartArena(6);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
