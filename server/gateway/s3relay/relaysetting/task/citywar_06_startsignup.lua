Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("D��ng Ch�u - b�o danh b�t ��u");
	-- ������
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ���ݱ��Ϊ6,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(6,1) == 1) then
			StartSignUp(6);
		end
	else
		cw_startsignup_fun(0,6)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
