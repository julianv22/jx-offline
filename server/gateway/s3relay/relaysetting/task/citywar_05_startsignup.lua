Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("T��ng D��ng - b�o danh b�t ��u");
	-- ������
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �������Ϊ5,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,1) == 1) then
			StartSignUp(5);
		end
	else
		cw_startsignup_fun(4,5)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
