Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("T��ng D��ng - b�o danh ho�n t�t");
	-- ������
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �������Ϊ5,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,2) == 1) then
			EndSignUp(5);
		end
	else
		cw_endsignup_fun(4,5)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
