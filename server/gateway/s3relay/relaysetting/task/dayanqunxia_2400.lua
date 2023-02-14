Include("\\script\\event\\2011dayanqunxia\\event.lua")

local nStartDate = 20110123000
local nEndDate = 201102210000

function TaskShedule()
	
	TaskName("Чi Y課 Qu莕 Hi謕 24h x誴 h筺g T鰑 Lng")

	-- 一天一次，单位分钟
	TaskInterval(1440)
	-- 设置触发时间
	TaskTime(0, 0)
	OutputMsg("Trong th阨 gian di詎 ra ho箃 ng Чi Y課 Qu莕 Hi謕, s� c╪ c� v祇 T鰑 Lng c馻 ngi ch琲 v祇 l骳 24h m鏸 ng祔 ti課 h祅h x誴 h筺g")
	-- 执行无限次
	TaskCountLimit(0)
end

function TaskContent()
	local nCurDate = tonumber(tbQunXia:GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < %nStartDate or nCurDate > %nEndDate then
		return
	end
	tbQunXia:PaiMing()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end