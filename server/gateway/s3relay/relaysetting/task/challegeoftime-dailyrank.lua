

function TaskShedule()
	--���÷�������
	TaskName("���ػÿ�����а�")
	
	TaskTime(0, 0);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440) --30����һ��
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("=================���ػÿ�����а�==================");
end

function TaskContent()
	name , value = Ladder_GetLadderInfo(10235, 1);
	value = value * (-1);
	if (name ~= "") then
		local szTime	= format("%s ph�t %s gi�y", floor(value/60), floor(mod(value, 60)));
		local szMsg 	= format("Ch�c m�ng ��i <%s> �� ho�n th�nh <th�ch ��u th�i gian> v�i th�i gian ng�n nh�t <%s>", name, szTime);
		GlobalExecute(format("dw AddGlobalNews([[%s]], 10)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
	end
	Ladder_ClearLadder(10235);
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


