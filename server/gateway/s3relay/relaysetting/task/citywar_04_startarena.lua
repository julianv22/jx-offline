Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi�n Kinh- tr�n L�i ��i b�t ��u");
	TaskSetMode(1);
	
	-- 2005��1��7��(������)��һ�ο�ʼ
	TaskSetStartDay(1, 7);

	-- һ��һ��ѭ��
	TaskInterval(7);
	
	-- 20��00�ֿ���
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �꾩���Ϊ4,�����citywar.ini��ָ����һ��
	if (cw_CanStart(4,3) == 1) then
		StartArena(4);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
