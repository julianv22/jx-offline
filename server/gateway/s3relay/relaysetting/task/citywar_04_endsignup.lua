Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi�n Kinh-b�o danh ho�n t�t");
	-- ������
	TaskInterval(1440);	--ÿ��
	
	-- 19��00�ֽ���
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- �꾩���Ϊ4,�����citywar.ini��ָ����һ��
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(4,2) == 1) then
			EndSignUp(4);
		end
	else
		cw_endsignup_fun(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
