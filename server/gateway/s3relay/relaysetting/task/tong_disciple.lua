-- �����ļ���ӻ
Include("\\script\\gb_taskfuncs.lua")
function TaskShedule()
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	TaskName("TONG_SHREWMOUSE");	

	-- 3��Сʱһ�Σ���λ����
	TaskInterval(15);
	-- ���ô���ʱ��
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);
	
	TaskTime(nBeginTime, 0);
	OutputMsg(format("TONG_SHREWMOUSE will start at %d:%d...", nBeginTime, 0));
	-- ִ�����޴�
	TaskCountLimit(0);
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("TONG_SPFESTIVAL is SignUp Time");
	GlobalExecute("dwf \\script\\missions\\tong\\tong_disciple\\dis_gmscript.lua tong_opendisciple( 821 )");--821Ϊ��ļ���ӻ׼������mapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 0) then
		return 0
	end
	if (nMin > 55) then
		return 0;
	end;
	return 1
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
