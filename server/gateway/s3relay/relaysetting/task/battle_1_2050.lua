-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	TaskName( "Chi�n d�ch T��ng D��ng (T�ng Kim) 20:50" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "BATTLE[XiangYang] 20:50 startup..." );
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );		-- GMָ������ͼ���ս��
--	Battle_StartNewRound( 1, 2 );		-- GMָ������м���ս��
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		return							-- ����һ �ر�һ���߼��ν��ù�ս�ν����
	else
		Battle_StartNewRound( 1, 3 );	-- GMָ������߼���ս��	
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
