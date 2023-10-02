Include("\\script\\lib\\objbuffer_head.lua")

nStartHour = 19
nEndHour = 24
nStartDate = 1212170000
nEndDate = 1301010000

local _GetStartTime = function(nNowHour, nNowMin)
	
	local nDate = tonumber(date("%y%m%d%H%M"))
	if nDate < nStartDate or nDate > nEndDate then
		return
	end
	
	nNowHour = mod(nNowHour,24)
	nNowMin = mod(nNowMin,60)
	if nNowHour < nStartHour then
		return nStartHour,0
	end
	if nNowMin >= 30 and nNowMin < 60 then
		return nNowHour+1,0
	elseif nNowMin >= 0 and nNowMin < 30 then
		return nNowHour,30
	end
end


function TaskShedule()
	--���÷�������
	TaskName("�շѰ�ʥ���ڻ");
	
	local nNowHour = tonumber(date("%H"));
	local nNowMin = tonumber(date("%M"));
	
	local nHour,nMin = %_GetStartTime(nNowHour, nNowMin)
	
	TaskTime(nHour, nMin);
	--�趨��ʱ������ʱ��
	
	--TaskTime(nNowHour, nNowMin)

	--���ü��ʱ�䣬��λΪ����
	TaskInterval(30); --60����һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0);

	OutputMsg("����2012.12�");
	
end

function TaskContent()
	local nDate = tonumber(date("%y%m%d%H%M"));
	local nHM = tonumber(date("%H%M"));

	if tonumber(nDate) >= nStartDate and tonumber(nDate) < nEndDate then
		if nHM >= 1900 and nHM < 2400 then
			local nCityMapID = random(4);
			local nCityPos = random(12);
			-- OutputMsg(format(" %d citymapid ",nCityMapID));
			-- OutputMsg(format(" %d nCityPos ", nCityPos));
			local handle = OB_Create();
			ObjBuffer:PushObject(handle, nCityMapID);
			ObjBuffer:PushObject(handle, nCityPos);
			RemoteExecute("\\script\\activitysys\\config\\2\\extend.lua", "pActivity:GetFairyPos", handle);
			RemoteExecute("\\script\\activitysys\\config\\2\\extend.lua", "pActivity:CreatFairy", 0);
			OB_Release(handle);
		end
	end		
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

