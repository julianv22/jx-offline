Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L�m An - C�ng th�nh chi�n b�t ��u ");
	-- ������
	TaskInterval(1440);
	
	-- 20��00�ֿ�ս
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ٰ����Ϊ7,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,4) == 1) then
			StartCityWar(7);
		end
	else
		cw_start_fun(0,7)	--4������4,1����cw_CanStart(6,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
