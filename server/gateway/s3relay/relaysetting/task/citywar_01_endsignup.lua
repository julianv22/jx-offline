Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Ph��ng T��ng- b�o danh ho�n t�t");
	-- ������
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ1,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,2) == 1) then
			EndSignUp(1);
		end;
	else
		cw_endsignup_fun(3,1);
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
