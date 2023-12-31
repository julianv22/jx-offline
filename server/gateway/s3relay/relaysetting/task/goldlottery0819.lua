STARTHOUR = 20;
STARTMIN = 0;

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--设置方案名称
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 20点00分开战
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id  Account|RoleName

function TaskContent()
	OutputMsg("----------------R髏 th╩ v� s� ho祅g kim GoldLottery ---------------------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) ~= 820) then
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	RecordString = szMainString.."0819" 
	ResultString = szResultString.."0819"
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0,0,"ii")
	
	if (result > 0 ) then
		OutputMsg("ID tr髇g thng v� s� ho祅g kim 08-19 ng b� "..P2.."-"..P1)
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
			str = format("ID ph莕 thng trong v� s� ho祅g kim l� %d-%d", P1, P2);
			success = SaveCustomDataToSDBOw(RsString , 0, 0, "ii", P1,P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			strNews = format("dw AddLocalNews ( [ [V� s� ho祅g kim tr髇g thng ng祔 19 th竛g 8  m�! S� l�: [%d-%d]. M阨 ngi ch琲 tr髇g thng mau n L� Quan nh薾 ph莕 thng ho祅g kim!]], 1) ", P2,P1)
			GlobalExecute(strNews);
			OutputMsg(str);
		else
			OutputMsg("Ki觤 tra s� li謚 c� l鏸, ch璦 t譵 頲 ngi tr髇g thng")
		end
	else
		OutputMsg("Kh玭g c� ngi n祇 tr髇g thng n猲 kh玭g c� ph莕 thng.")
	end
end;
