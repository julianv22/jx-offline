Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Th�nh ��-b�o danh b�t ��u");
	-- ����һ
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ɶ����Ϊ2,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(2,1) == 1) then
			StartSignUp(2);
		end
	else
		cw_startsignup_fun(1,2)
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
