--H� th�ng ti�p nh�n ��ng k� v� x�p h�ng 10 ng��i level cao nh�t server - Created by DinhHQ - 20110614
local nStartDate	 = 20170707;
local nCloseDate	 = 20220717;	
function TaskShedule()
	TaskName("Top 10 server - x�p h�ng 10h")
	TaskInterval(24 * 60)
	TaskTime(10, 00)
	TaskCountLimit(0)
	OutputMsg("topten server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\vng_feature\\top10\\vngtop10.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("Toplist sorted")
end
