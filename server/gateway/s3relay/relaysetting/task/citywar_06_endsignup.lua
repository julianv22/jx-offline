Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("D��ng Ch�u - b�o danh ho�n t�t");
	-- ������
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ���ݱ��Ϊ6,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(6,2) == 1) then
			EndSignUp(6);
		end
	else
		cw_endsignup_fun(0,6)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
