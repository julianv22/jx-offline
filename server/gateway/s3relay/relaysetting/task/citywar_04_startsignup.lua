Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi�n Kinh-b�o danh b�t ��u");
	-- ������
	TaskInterval(1440);
	
	-- 18��00�ֿ�ʼ
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �꾩���Ϊ4,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(4,1) == 1) then
			StartSignUp(4);
		end
	else
		cw_startsignup_fun(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
