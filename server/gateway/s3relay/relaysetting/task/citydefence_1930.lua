--citydefence.lua
-- 卫国战争之烽火连城

function TaskShedule()
	TaskName("V� qu鑓 Phong H醓 li猲 th祅h");	

	-- 一天一次，单位分钟
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(19, 30);
	OutputMsg(format("'V� qu鑓 li猲 th祅h'  b総 u %d:%d...", 19, 30));
	-- 执行无限次
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("it is not saturday or sunday,so citydefence will not open")
		return
	end
	if (weekdate == 6) then
		OutputMsg("'V� qu鑓 li猲 th祅h'   phe Kim  b総 u b竜 danh.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("'V� qu鑓 li猲 th祅h'   T鑞g  b総 u b竜 danh.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
