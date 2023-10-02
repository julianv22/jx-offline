--citydefence.lua
-- ����ս��֮�������

function TaskShedule()
	TaskName("V� qu�c Phong H�a li�n th�nh");	

	-- һ��һ�Σ���λ����
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(19, 30);
	OutputMsg(format("'V� qu�c li�n th�nh' �� b�t ��u %d:%d...", 19, 30));
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("it is not saturday or sunday,so citydefence will not open")
		return
	end
	if (weekdate == 6) then
		OutputMsg("'V� qu�c li�n th�nh'   phe Kim �� b�t ��u b�o danh.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("'V� qu�c li�n th�nh'   T�ng �� b�t ��u b�o danh.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
