Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("��i L�-b�o danh b�t ��u");
	-- ���ڶ�
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ3,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,1) == 1) then
			StartSignUp(3);
		end
	else
		cw_startsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
