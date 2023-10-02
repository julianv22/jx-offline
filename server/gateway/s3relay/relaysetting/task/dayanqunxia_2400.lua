Include("\\script\\event\\2011dayanqunxia\\event.lua")

local nStartDate = 20110123000
local nEndDate = 201102210000

function TaskShedule()
	
	TaskName("��i Y�n Qu�n Hi�p 24h x�p h�ng T�u L��ng")

	-- һ��һ�Σ���λ����
	TaskInterval(1440)
	-- ���ô���ʱ��
	TaskTime(0, 0)
	OutputMsg("Trong th�i gian di�n ra ho�t ��ng ��i Y�n Qu�n Hi�p, s� c�n c� v�o T�u L��ng c�a ng��i ch�i v�o l�c 24h m�i ng�y ti�n h�nh x�p h�ng")
	-- ִ�����޴�
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