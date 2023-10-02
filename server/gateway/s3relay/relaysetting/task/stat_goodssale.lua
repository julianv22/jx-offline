-- ��ʱͳ������

--------------------------------------------------------------------------
-- ͳ��ս����Ϣ
LGTYPE_STATINFO 			= 10000 -- ս������
LGNAME_STAT_GOODS_SALE 		= "stat_goodssale" -- ս������
LOGNAME_GOODS_SALE			= "Logs/stat_goodssale_"

---------------------------------------------------------
-- ͳ����Ŀ�������ID����
LG_STATITEM_TASKID_TOTAL	= 0; -- ��ͳ�Ƽ���(LeagueMember TaskID)
LG_STATITEM_TASKID_TODAY	= 1; -- ����ͳ�Ƽ���(LeagueMember TaskID)
-- 1 ~ 12 12���·ݵ�ͳ�Ƽ���
	-- 2005�꣺501~512
	-- 2006�꣺601~612

--LG_STAT_TASKID_CURDATE		= 0; -- ��ǰͳ������(League TaskID)
--------------------------------------------------------------------------

function TaskShedule()
	TaskName("Th�ng k� v�t ph�m ti�u th� ");
	
	-- 8*60����һ��
	TaskInterval(8*60);
	
	-- ����TaskTme, ����Relay����ʱ�Ϳ�ʼ
	-- 0��00�ֿ�ʼ
	TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	--OutputMsg("������Ʒ����ͳ��...");
end

function TaskContent()
	local logName = LOGNAME_GOODS_SALE..date("%Y%m%d%H%M%s")..".log";
	local szMsg = "";
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE)
	if (nLeagueID == 0) then
		--szMsg = "[Error]NotFound StatInfo:"..LGNAME_STAT_GOODS_SALE;
		--WriteStringToFile(logName, szMsg);
		return 0;
	end
	
	-- tab head
	szMsg = "ItemName\tTotal\tToDay\r\n" -- ��Ʒ��	��ͳ��	����ͳ��
	WriteStringToFile(logName, szMsg);
			
	local nMemberCount = LG_GetMemberCount(nLeagueID);
	if (nMemberCount <= 0) then
		return 0;
	end
	
	OutputMsg("Th�ng k� s� l��ng v�t ph�m:"..nMemberCount);
	local i = 0;
	for i = 0, nMemberCount-1 do
		local szMemberName, nJob = LG_GetMemberInfo(nLeagueID, i);
		local nTotal = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TOTAL);
		local nToDay = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TODAY);
		
		szMsg = szMemberName.."\t"..nTotal.."\t"..nToDay.."\r\n"; -- ��Ʒ��	��ͳ��	����ͳ��
		OutputMsg("Th�ng k� s� l��ng v�t ph�m:"..szMsg);
		WriteStringToFile(logName, szMsg);
	end	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
