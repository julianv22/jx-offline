--����֮��Relay�˴����ű�

function GameSvrConnected(dwGameSvrIP)
rolename = GetStringFromSDB("LuckyStar", 0, 0);
if (rolename ~= "") then
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end;
	str = format("M�y d�ch v� tr� ch�i: n�i l�i %d Relay,Ng�i sao may m�n tr��c kia ��ng b� l�%s", dwGameSvrIP, rolename)
	OutputMsg(str);
end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	TaskName("Ng�i sao may m�n")
	TaskTime(12, 0)
	TaskInterval(360)
	TaskCountLimit(0)
end

function TaskContent()
	accname, rolename = RandomSelAOnlinePlayer()
	date = GetCurrentTime()
	success = SaveStringToSDBOw("LuckyStarLog", date, 0, rolename)
	success = SaveStringToSDBOw("LuckyStar", 0, 0, rolename)
	str = format("Ng�i sao may m�n xu�t hi�n m�i l� %s",rolename)
	OutputMsg(str);
	NotifySDBRecordChanged("LuckyStar", 0 , 0, 1);
end

