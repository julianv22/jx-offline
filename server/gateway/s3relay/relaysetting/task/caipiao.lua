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

Include("\\script\\event\\other\\caipiao\\head_gc.lua")

Include("\\script\\lib\\baseclass.lua")


local tbCaiPiao_TaskShedule = function()
	local nHM = tonumber(date("%H%M"))
	local nWeekDay = tonumber(date("%W%w"))
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d%H%M"))
	
	local nAwardWeekDay = tbCaiPiao:GetCurAwardWeekDay()
	if 201002040000 > nDate or nDate > 201003220000 then
		return 
	end
	
	if tonumber(date("%Y%m%d")) < 20100224 then
		--��ʱ������
		return 
	end
	
	
	if (nDay == 5 or nDay == 6 or nDay == 0) then
		if 0800 <= nHM and nHM < 2100  then
			if tbCaiPiao:CheckRound(nWeekDay) ~= 1 then
				tbCaiPiao:NewRound(nWeekDay)
				tbCaiPiao:DebugOut("D� li�u ch�n s�", nWeekDay, "������,�½�һ������ʼ��Ͷ")
			else
				tbCaiPiao:LoadAllData(nWeekDay)
				tbCaiPiao:DebugOut("D� li�u ch�n s�", nWeekDay, "��ȡ����ʼ��Ͷ")
			end
		end
	end
	
	
	if nAwardWeekDay ~= nil then
			
		local tbTemp = tbBaseClass:NewClass(tbCaiPiao, nAwardWeekDay)
		
		if mod(nAwardWeekDay, 10) == 0 and tbTemp:CheckRound(nAwardWeekDay) ~= 1 then
			tbTemp:NewRound(nAwardWeekDay)
			tbTemp:DebugOut("���վ�Ȼû��Ͷ���������һ��", nAwardWeekDay)
		end
		
		if tbTemp:CheckRound(nAwardWeekDay) == 1 then				
			tbTemp:LoadAllData(nAwardWeekDay)
			
			if tbTemp.nStage == 3 then
				tbTemp:DebugOut("�Ѿ��н��", nAwardWeekDay)
			else
				tbTemp:CalcResult()
				tbTemp:DebugOut("�����㡿��Ʊ����", nAwardWeekDay)
			end
		else
			tbTemp:DebugOut("D� li�u ch�n s�", nAwardWeekDay, "�����ڣ���������")
		end
	end
end
function TaskShedule()
	--���÷�������
	TaskName("V� s� ")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--���ü��ʱ�䣬��λΪ����
	TaskInterval(nInterval) --nInterval����һ��
	--���ô���������0��ʾ���޴���	
	
	TaskCountLimit(0)
	%tbCaiPiao_TaskShedule()
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "caipiao",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	
	%tbCaiPiao_TaskShedule()
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end