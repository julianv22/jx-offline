
local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end


function TaskShedule()
	--���÷�������
	TaskName("birthday0905")
	
	local  nInterval = 30;
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
--	if nNextHour ~= 20 then
--		nNextHour, nNextMinute = 20, 0
--	end
	
	TaskTime(nNextHour	, nNextMinute);
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(nInterval) --15����һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "birthday0905 liehaozhu",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local n_date = tonumber(date("%Y%m%d"));
	
	if (n_date > 20991231 or n_date < 20090619) then
		return
	end
	
	local n_weekid = tonumber(date("%w"));
	local n_hour = tonumber(date("%H"));
	if (n_weekid == 5 and n_hour == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", "Ho�t ��ng s�n b�t Nh�m b�o ph� �� b�t ��u, m�i c�c anh h�ng h�o ki�t chu�n b� cung n� l�n ���ng s�n b�t!"));
	elseif (n_weekid == 1 and n_hour == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", "Ho�t ��ng s�n b�t Nh�m b�o ph� trong tu�n n�y �� k�t th�c. Ch�c c�c anh h�ng h�o ki�t b�t ��u 1 tu�n m�i vui v� v� th�nh c�ng!"));
	end
	
	if (n_weekid == 5 or n_weekid == 6 or n_weekid == 0) then
		
		--GlobalExecute(format("dwf \\script\\event\\birthday_jieri\\200905\\panghaozhu\\addnpc_haozhu.lua birthday0905_addnpc_haozhu(%d)", 0));
		GlobalExecute(format("dwf \\script\\event\\birthday_jieri\\200905\\panghaozhu\\addnpc_haozhu.lua birthday0905_addnpc_haozhu(%d)", 15));
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


