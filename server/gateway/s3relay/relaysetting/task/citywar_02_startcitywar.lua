Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Th�nh ��- C�ng th�nh chi�n b�t ��u ");
	-- ���ڶ�
	TaskInterval(1440);
	
	-- 20��00�ֿ�ս
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ɶ����Ϊ2,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(2,4) == 1) then
			StartCityWar(2);
		end
	else
		cw_start_fun(2,2)	--4������4,1����cw_CanStart(2,4)
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
