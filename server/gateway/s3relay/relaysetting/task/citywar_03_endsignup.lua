Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("��i L�-b�o danh ho�n t�t");
	-- ���ڶ�
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ������Ϊ3,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,2) == 1) then
			EndSignUp(3);
		end
	else
		cw_endsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
