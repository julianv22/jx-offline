Include("\\script\\gb_taskfuncs.lua")
GN_EVENTNAME = "Ho�t ��ng Ho�ng chi ch��ng"
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3
TB_HUANGZHIZHANG_EVENT = {
		"Chi�n tr��ng T�ng Kim",
		"Nhi�m v� T�n S� ",
		"Th�ch th�c th�i gian",
		"Chu�i nhi�m v� D� T�u",
		--"ͬ�������������ƪ��ͬ����������",
	}
	
TB_HUANGZHIZHANG_RATE = {
		50,
		0,
		25,
		25,
}

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 25;
end
function TaskShedule()
	--���÷�������
	TaskName(GN_EVENTNAME)

	h, m = GetNextTime()
	TaskTime(h, m);
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(30)
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
--ÿ��������������
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, 0)
	end
	gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
	OutputMsg("Ho�ng chi ch��ng")
end

function TaskContent()
	local nDate = tonumber(date("%m%d"))
	local nHour = tonumber(date("%H%M"))
	--�ʱ����21��00~23��00
	--00:00֪ͨ��������
	
	local event_date = gb_GetTask(GN_EVENTNAME, GN_HUANG_DATE)
	--ÿ���һ�λʱ���ڣ����ѡ�
	if (event_date == 0 or event_date ~= nDate) then
		local nrand = random(1, 100);
		local nsum = 0;
		local event_event = 1;
		for i = 1, getn(TB_HUANGZHIZHANG_RATE) do
			nsum = nsum + TB_HUANGZHIZHANG_RATE[i];
			if (nsum >= nrand) then
				event_event = i;
				break
			end;
		end;
		gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, event_event)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_DATE, nDate)
		OutputMsg(date().."��m huy ho�ng,   ho�t ��ng ��m nay l� "..TB_HUANGZHIZHANG_EVENT[event_event])
		local szMsg = format("[Ho�t ��ng ��m Huy Ho�ng]: T�i nay, ho�t ��ng <color=yellow>%s<color> nh�n ��i ph�n th��ng l� %s, b�t ��u l�c 19h45, c�c v� ��i hi�p h�y nhanh ch�n tham gia.",
						"Ho�ng chi ch��ng",
						TB_HUANGZHIZHANG_EVENT[event_event]);
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		return
	end
	
	--�ǻʱ��رտ���
	if (nHour < 1945 or nHour >= 2145) then
		if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) ~= 0) then
			gb_SetTask(GN_EVENTNAME, GN_HUANG_EVENTID, 0)
			gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 0)
			local szMsg = format("T�i nay, <color=yellow><color>ho�t ��ng nh�n ��i ph�n th��ng �� k�t th�c, t�i mai s� ti�p t�c.", "Ho�ng chi ch��ng");
			GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
			GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		end
		return
	end
	
	--��20��55ʱ�俪�������
	if (nHour >= 1945 and nHour <= 2145 + 3) then
		local event_event = gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID)
		gb_SetTask(GN_EVENTNAME, GN_HUANG_SWITH, 1)
		OutputMsg(date().."B�t ��u ho�t ��ng ��m huy ho�ng")
		local szMsg = format("[Ho�t ��ng ��m huy ho�ng]: Ho�t ��ng <color=yellow>%s<color> �� b�t ��u, n�i dung ho�t ��ng l� %s. M�i ng��i h�y nhanh ch�n ��n tham gia.",
							"Ho�ng chi ch��ng",
							TB_HUANGZHIZHANG_EVENT[event_event])
		GlobalExecute(format("dw AddLocalNews([[%s]])", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
--	GlobalExecute("dw AddLocalNews([[[�Ի�֮ҹ�]����֮�»���ڽ����У���λ��ҿ�������ٴ���ѯ����˫���Ļ���ݣ����λ�������ܶ���������������]])")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
