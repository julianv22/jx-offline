--H� th�ng ti�p nh�n ��ng k� v� x�p h�ng 10 ng��i level cao nh�t server - Created by DinhHQ - 20110614
local nStartDate	 = 20210707;
local nCloseDate	 = 20210731;	
function TaskShedule()
	TaskName("Top 10 server - x�p h�ng 0h")
	TaskInterval(24 * 60)
	TaskTime(00, 00)
	TaskCountLimit(0)
	OutputMsg("topten server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\ctc_feature\\top10\\top10.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("Top 10 list sorted")
end
