Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Ph��ng T��ng- b�o danh b�t ��u");
	
	-- ������
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ1,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,1) == 1) then
			StartSignUp(1);
		end;
	else
		cw_startsignup_fun(3,1);
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
