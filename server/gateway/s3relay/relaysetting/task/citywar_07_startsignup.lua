Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L�m An - b�o danh b�t ��u");
	-- ������
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ٰ����Ϊ7,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,1) == 1) then
			StartSignUp(7);
		end
	else
		cw_startsignup_fun(6,7)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
