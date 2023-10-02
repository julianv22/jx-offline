--����������
--by С��
--2007-03-29

INTERVAL_TIME = 1440	-- ÿ24Сʱ����1��
WULINLING_LGTYPE = 536;		
WULINLING_LGTASK = 1;		--����
WULINLING_LGTASKPH = 2;	--����
WULINLING_LGTASKDATA = 3;	--����ύ����ʱ��
function TaskShedule()
	TaskName("X�p h�ng V� L�m l�nh");
	-- 1440����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��(0��0��)
	TaskTime(0, 0);
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	local nData = tonumber(date("%Y%m%d%H"))
	if nData > 2007040600 and nData < 2007042710 then --����ʱ����2007042624,������ʱ������10����,���������
		wulinling_dosort()
	end
		
end

function wulinling_dosort()
		local tbtemp = {};
		local temp = {};
		local i = 1;
		local nlg_idx = LG_GetFirstLeague(WULINLING_LGTYPE);
		while	nlg_idx ~= 0 and nlg_idx ~= nil do
			tbtemp[i] = {};
			tbtemp[i][1] = LG_GetLeagueInfo(nlg_idx);
			tbtemp[i][2] = LG_GetLeagueTask(nlg_idx,WULINLING_LGTASK);
			tbtemp[i][3] = LG_GetLeagueTask(nlg_idx,WULINLING_LGTASKDATA);
			nlg_idx = LG_GetNextLeague(WULINLING_LGTYPE, nlg_idx);
			i = i + 1;
		end
		
		-- ð������*********
		local n = i - 1;
    for i = 1, n ,1 do
    	for j = n - 1, 1 ,-1 do
    		if j < i then 
    			break;
    		end
    		if tbtemp[j+1][2] < tbtemp[j][2] then
    			temp[1] = tbtemp[j+1][1];
    			temp[2] = tbtemp[j+1][2];
    			temp[3] = tbtemp[j+1][3];
    			tbtemp[j+1][1] = tbtemp[j][1];
    			tbtemp[j+1][2] = tbtemp[j][2];
    			tbtemp[j+1][3] = tbtemp[j][3];
    			tbtemp[j][1] = temp[1];
    			tbtemp[j][2] = temp[2];
    			tbtemp[j][3] = temp[3];
    		elseif tbtemp[j+1][2] == tbtemp[j][2] then
    			if tbtemp[j+1][3] > tbtemp[j][3] then		--����һ��,���ύʱ���ж�,�ύ���������ǰ
	    			temp[1] = tbtemp[j+1][1];
	    			temp[2] = tbtemp[j+1][2];
	    			temp[3] = tbtemp[j+1][3];
	    			tbtemp[j+1][1] = tbtemp[j][1];
	    			tbtemp[j+1][2] = tbtemp[j][2];
	    			tbtemp[j+1][3] = tbtemp[j][3];
	    			tbtemp[j][1] = temp[1];
	    			tbtemp[j][2] = temp[2];
	    			tbtemp[j][3] = temp[3];
    			end
    		end
    	end
    end
    --**********end
   local nData = date("%Y%m%d%H");
   local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\wulinling.log";
   WriteStringToFile(logfilename, "TONGNAME\tLINGPAI\tRANK\tHANDINTIME\tSORTIME\n");
	for i = n, 1, -1 do
		LG_ApplySetLeagueTask(WULINLING_LGTYPE, tbtemp[i][1], WULINLING_LGTASKPH, n-i+1,"", "");
		OnWuLinLingSortLog(logfilename, tbtemp[i][1],tbtemp[i][2],tbtemp[i][3],n-i+1,nData);
	end
end

function OnWuLinLingSortLog(szFile, LGName,LGSum,LGData,LGSort,LGLogData)
	WriteStringToFile(szFile, format("%s\t%s\t%s\t%s\t%s\n", 
	tostring(LGName), tostring(LGSum),tostring(LGSort), tostring(LGData), tostring(LGLogData)));
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
