--ʥ������ٻ�ʥ����
--2007-11-24
--by С�˶��
Include("\\RelaySetting\\Task\\vnxmas2007_head.lua")

function TaskShedule()
	TaskName("Ho�t ��ng Boss gi�ng sinh 2007");
	TaskInterval(1440);
	
	-- 20��00�ֿ�ս
	TaskTime(20, 0);
	OutputMsg("Ho�t ��ng Boss gi�ng sinh 2007 b�t ��u l�c 20:00")
	TaskCountLimit(0);
end

function TaskContent()
	local ndate = tonumber(date("%y%m%d%H"))
	if ndate < 07120800 or ndate > 07121524 then
		return 
	end
	local ni = 0
	local tbmap = {}
	for nmapid,nitem in tb_xmas2007_city do
		ni = ni + 1
		tbmap[ni] = nmapid 
	end
	local np = random(1,getn(tbmap))
	local selectmapid = tbmap[np]
	GlobalExecute(format("dwf \\script\\event\\vnchristmas2007\\callboss\\callboss.lua xmars2007_callboss([[%s]])",selectmapid));
end
function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
