Include("\\RelaySetting\\Task\\bosswhere.lua");
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 51112;
Interval = 1440;
Count = 0;
StartHour=12;
StartMin=0;

function NewBoss()
	str = "Quan ph� g�n ��y ph�i Tr��ng T�ng Ch�nh tr�c n� ��o ph�m!";
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["zhangzongzheng"][Random(getn(where.zhangzongzheng))+1],511, 90;
end;



