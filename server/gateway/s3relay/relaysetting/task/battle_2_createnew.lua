-- ��ս�ν�
-- DongZhi
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	
	TaskName( "Qu�c chi�n T�ng Kim t�ng �i�u ��ng" );	--��������
	TaskTime( 20, 00 );				--����ʱ��
	TaskInterval(1440);				--���ʱ��:һ��
	TaskCountLimit(0);				--�޴�������
	
	OutputMsg("**************** T�ng �i�u ��ng qu�c chi�n t�ng kim nhi�m v� kh�i ��ng th�nh c�ng ****************")	
end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 then
		OutputMsg("**************** Create GUOZHAN New Battle ****************")	
		battle_StartNewIssue(2, 3);	
		OutputMsg("***********************************************************")
	end

end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
