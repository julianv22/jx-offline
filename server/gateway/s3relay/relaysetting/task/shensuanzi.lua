






function TaskShedule()
	--���÷�������
	TaskName("shensuanzi")
	
	local  nInterval = 24*60
	
	
	
	local nNextHour, nNextMinute = 19, 05
	
	TaskTime(nNextHour, nNextMinute);

	--���ü��ʱ�䣬��λΪ����
	TaskInterval(nInterval) --nInterval����һ��
	--���ô���������0��ʾ���޴���	
	
	TaskCountLimit(0)
	
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "shensuanzi",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	
	local nDate = tonumber(date("%Y%m%d"))
	
	if  20100709 <= nDate and nDate < 20100816 then
		RemoteExecute("\\script\\event\\other\\shensuanzi\\class.lua",	"tbShenSuanZi:RoundStart_gc", 0)
		OutputMsg("[shensuanzi]start signup")
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end