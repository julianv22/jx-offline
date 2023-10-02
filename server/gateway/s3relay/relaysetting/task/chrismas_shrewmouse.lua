--ʥ���֮�������
Include("\\script\\gb_taskfuncs.lua");
CHRISMAS_SHREWMOUSE = "Ho�t ��ng Gi�ng Sinh";

function TaskShedule()
	TaskName(CHRISMAS_SHREWMOUSE);
	
	local nNowTimeHour = tonumber(date("%H"));
	local nNowTimeMin = tonumber(date("%M"));
	
	local nRemain = floor(nNowTimeMin / 15) + 1;
	if (nRemain >= 4) then
		nRemain = 0;
		nNowTimeHour = nNowTimeHour + 1
	end;
	nNowTimeMin = nRemain * 15;
	
	if (nNowTimeHour >= 24) then
		nNowTimeHour = 0
	end;

	OutputMsg("nNowTimeHour:"..nNowTimeHour.."nNowTimeMin:"..nNowTimeMin);
	TaskTime(nNowTimeHour, nNowTimeMin);
	
	TaskInterval( 15 );	--15���Ӵ���һ�Σ�
	
	TaskCountLimit( 0 );
	
	for i = 1, 5 do
		gb_SetTask(CHRISMAS_SHREWMOUSE, i, 0)
	end
	
	-- ���������Ϣ
	OutputMsg(CHRISMAS_SHREWMOUSE);
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(CHRISMAS_SHREWMOUSE, i, 0)
	end
	local BEGINTIME = 1900;
	local ENDTIME = 2250;
	local NOON_BEGINTIME = 1200;
	local NOON_ENDTIME = 1355
	local nDate = tonumber(date("%Y%m%d"));
	if (nDate >= 20061222 and nDate <= 20070114) then
		local nNowTime = tonumber(date("%H%M"));
		if ((nNowTime >= BEGINTIME and nNowTime <= ENDTIME) or (nNowTime >= NOON_BEGINTIME and nNowTime <= NOON_ENDTIME)) then
			OutputMsg("===================ʥ���====================");
			gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 1);
			local mapid = 582;
			local strExecute = format("dw chrismas_shrewmouse(%d)", mapid);
			GlobalExecute(strExecute);
		end;
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
