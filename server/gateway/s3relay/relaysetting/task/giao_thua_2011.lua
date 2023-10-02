-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6
local nStartDate	 = 20110202;
local nCloseDate	 = 20110205;		

function TaskShedule()
	-- ���÷�������
	TaskName( "��n giao th�a 2011" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "Giao thua 2011 start..." );
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M%S"));

	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\vng_event\\LunarYear2011\\giao_thua\\giao_thua_2011.lua",	"GiaoThua_2011:CallAddNpc", 0)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
