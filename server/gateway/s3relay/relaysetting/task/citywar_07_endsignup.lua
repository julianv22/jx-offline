Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L�m An - b�o danh ho�n t�t");
	-- ������
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �ٰ����Ϊ7,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,2) == 1) then
			EndSignUp(7);
		end
	else
		cw_endsignup_fun(6,7)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
