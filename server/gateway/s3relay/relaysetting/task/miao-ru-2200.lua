Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 51322
Interval = 1440;
Count = 0;
StartHour=23;
StartMin=0;

function NewBoss()
	str = "Nghe n�i �� t� Nga Mi Di�u Nh� g�n ��y �� h� s�n!"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["miaoru"][Random(getn(where.miaoru))+1], 513, 90;
end;



