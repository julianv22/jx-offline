-- �׵۵ı��ر�����ʱ��
--ÿ������2�㵽����12�����㴥��

--by С�˶��
--2007.10.22
INTERVAL_TIME = 60	-- ÿСʱ����
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 25;
end

function TaskShedule()
	TaskName("YANDIBAOZANG");	
	
	-- 60����һ��
	TaskInterval(INTERVAL_TIME);
	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("[YANDIBAOZANG] Task Start At %d:%d...", h, m));
	-- ִ�����޴�
	TaskCountLimit(0);
	-- OutputMsg("�����Զ���������...");
end

function TaskContent()
	local TB_YDBZ_DATE_START =	--��������(ʱ)
	{
		8,9,10,12,14,16,18,20,22,
	}
	
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
	
		if (nhour == ndate_hour) then
			
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
				-- ����GameServer�ϵĽű�
				--GlobalExecute("dw LoadScript([[\\settings\\trigger_challengeoftime.lua]])");
				GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
				szMsg = "Ho�t ��ng v��t �i b�o t�ng vi�m �� �� b�t ��u b�o danh r�i, m�i ng��i h�y nhanh ch�ng ��n B�nh B�nh c� n��ng � Bi�n Kinh �� ��ng k� nh�, th�i gian b�o danh l� 5 ph�t."
				GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
--			end
			break;
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end