

function TaskShedule()
	--���÷�������
	TaskName("Ho�t ��ng ng�y lԗ�Cu�c �ua b�n m�a")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(15) --15һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("=================Ho�t ��ng ng�y lԗ�Cu�c �ua b�n m�a==================");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	
	if nDate < 080611 or nDate > 080713 then --��2008��06��11�� ���C 2008��07��13��24��
		return
	end
	local bIsStart = 0
	if (nHour >= 10 and nHour < 11) or (nHour >= 22 and nHour < 23) then
		bIsStart = 1
	elseif nHour >= 14 and nHour < 15 and (nWeek == 6 or nWeek == 0 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	elseif nHour >= 2 and nHour < 3 and  (nWeek == 6 or nDate == 080430 or nDate == 080501 ) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		GlobalExecute("dwf \\script\\missions\\racegame\\missionctrl.lua startRaceMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "Hi�n t�i c� th� ��n Minh Nguy�t Tr�n �� b�o danh tham gia, 1 ph�t sau cu�c �ua s� b�t ��u."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


