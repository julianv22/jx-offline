Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("T��ng D��ng - C�ng th�nh chi�n b�t ��u ");
	-- ������
	TaskInterval(1440);
	
	-- 20��00�ֿ�ս
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �������Ϊ5,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,4) == 1) then
			StartCityWar(5);
		end
	else
		cw_start_fun(5,5)	--4������4,1����cw_CanStart(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
