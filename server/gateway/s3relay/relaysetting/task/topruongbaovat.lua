--�ua top r��ng b�o v�t
local nStartDate	 = 20120520;
local nCloseDate	 = 20130618;	

function TaskShedule()
	TaskName("Top 10 nh�n v�t - x�p h�ng l�c 0h ng�y th� 2 h�ng tu�n")
	TaskInterval(24 * 60)
	TaskTime(0,0)
	TaskCountLimit(0)
	OutputMsg("Top 10 nh�n v�t - x�p h�ng l�c 0h ng�y th� 2 h�ng tu�n")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	local nWeek = tonumber(date("%w"))
	if nDate < %nStartDate or nDate > %nCloseDate or nWeek ~= 1 then
		return
	end
	RemoteExecute("\\script\\activitysys\\config\\1019\\extend.lua",	"pActivity:LoadAccumulatepr", 0)
	OutputMsg("Top 10 nh�n v�t - x�p h�ng l�c 0h ng�y th� 2 h�ng tu�n")
end
