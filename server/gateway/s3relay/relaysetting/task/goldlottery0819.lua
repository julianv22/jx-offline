STARTHOUR = 20;
STARTMIN = 0;

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--���÷�������
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 20��00�ֿ�ս
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id  Account|RoleName

function TaskContent()
	OutputMsg("----------------R�t th�m v� s� ho�ng kim GoldLottery ---------------------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) ~= 820) then
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	RecordString = szMainString.."0819" 
	ResultString = szResultString.."0819"
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0,0,"ii")
	
	if (result > 0 ) then
		OutputMsg("ID tr�ng th��ng v� s� ho�ng kim 08-19 ��ng b� "..P2.."-"..P1)
		NotifySDBRecordChanged(ResultString, 0, 0, 1)
	else
		GenGoldLottery(RecordString, ResultString)
	end

	OutputMsg("--------------------------------------------");
end

function GenGoldLottery(RdString, RsString)
	nCount , key1, key2 = GetRecordCount(RdString,0,0,0,0);
	OutputMsg("GoldLottery Count "..nCount);
	if (nCount > 0) then
		nRand =	random(1, nCount)
		bFound , P1,P2 = GetRecordInfoFromNO(RdString, 0, 0, 0, 0, nRand)
		if(bFound == 1) then
			bResult , m = GetCustomDataFromSDB(RdString, P1, P2, "i");		
			str = format("ID ph�n th��ng trong v� s� ho�ng kim l� %d-%d", P1, P2);
			success = SaveCustomDataToSDBOw(RsString , 0, 0, "ii", P1,P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			strNews = format("dw AddLocalNews ( [ [V� s� ho�ng kim tr�ng th��ng ng�y 19 th�ng 8 �� m�! S� l�: [%d-%d]. M�i ng��i ch�i tr�ng th��ng mau ��n L� Quan nh�n ph�n th��ng ho�ng kim!]], 1) ", P2,P1)
			GlobalExecute(strNews);
			OutputMsg(str);
		else
			OutputMsg("Ki�m tra s� li�u c� l�i, ch�a t�m ���c ng��i tr�ng th��ng")
		end
	else
		OutputMsg("Kh�ng c� ng��i n�o tr�ng th��ng n�n kh�ng c� ph�n th��ng.")
	end
end;
