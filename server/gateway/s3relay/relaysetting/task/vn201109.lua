-- Խ���շ�2011��9�»(����ں������),���ߴ���з��̻�
Include("\\script\\lib\\objbuffer_head.lua")


local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	local nNextHour = nStartHour;
	local nNextMinute = ceil(nStartMinute / nInterval) * nInterval + nInterval;
	
	if nStartMinute >= 50 then
		nNextMinute = 0;
		if nStartHour == 23 then
			nNextHour = 0;
		else
			nNextHour = nStartHour + 1;
		end		
	end			
	return nNextHour, nNextMinute;
end

function TaskShedule()
	--���÷�������
	TaskName("vn201109");

	local  nInterval = 10;	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = % _GetNexStartTime(nStartHour, nStartMinute, nInterval);
	TaskTime(nNextHour, nNextMinute);

	--���ü��ʱ�䣬��λΪ����
	TaskInterval(nInterval);--nInterval����һ��

	--���ô���������0��ʾ���޴�����
	TaskCountLimit(0);
	OutputMsg("��������ں�����ڻ");
end

function TaskContent()
	
	local  nInterval = 10;
	local nTime = tonumber(date("%H"));
	local nDate	= tonumber(date("%Y%m"));
	
	OutputMsg(format("L� Qu�c Kh�nh v� T�t Trung Thu %d--%d", nDate, nTime));
	-- ��2011��9��1�յ�2011��9��30��24ʱ,ÿ��20��--21��,���ߴ�����ͷŹ��컨�ڶ�10%�ľ��齱��.
	if nDate == 201109 and nTime == 20 then
		local tCity =	{{1, "Ph��ng T��ng"},{11, "Th�nh ��"},{162, "��i L�"},{37, "Bi�n Kinh"},
									{78, "T��ng D��ng"},{80, "D��ng Ch�u"},{176, "L�m An"}};
		local nItem = random(1, 7);
		local nStartHour = tonumber(date("%H"));
		local nStartMinute = tonumber(ceil(tonumber(date("%M"))/nInterval)*nInterval);
		local nNextHour, nNextMinute = % _GetNexStartTime(nStartHour, nStartMinute, nInterval);
		local tCity =	{{1, "Ph��ng T��ng"},{11, "Th�nh ��"},{162, "��i L�"},{37, "Bi�n Kinh"},
										{78, "T��ng D��ng"},{80, "D��ng Ch�u"},{176, "L�m An"}};
		local nItem = random(1, 7);
		local strMsg = format("T� %d: %02d ��n %d: %02d t�i %s s� d�ng Ph�o Hoa Qu�c Kh�nh s� nh�n ���c th�m 10%% kinh nghi�m.", 
				nStartHour, nStartMinute, nNextHour, nNextMinute, tCity[nItem][2]);		
		OutputMsg(strMsg);
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", strMsg));

		local handle = OB_Create();
		ObjBuffer:PushObject(handle, tCity[nItem][1]);
	  RemoteExecute("\\script\\activitysys\\config\\33\\extend.lua", "SetSeptemperRewardsCityMapID", handle);
	  OB_Release(handle);
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end