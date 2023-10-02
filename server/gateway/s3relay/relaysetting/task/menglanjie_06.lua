greatseed_configtab = {
	{37, 2, 50, "\\settings\\maps\\great_night\\�꾩����.txt",}, --�꾩����;
	{162, 3, 50, "\\settings\\maps\\great_night\\������.txt"},	--������
	{80, 3, 50, "\\settings\\maps\\great_night\\���ݶ���.txt"},	--���ݶ���;
	{1, 1, 50, "\\settings\\maps\\great_night\\��������.txt"},	--��������;
	{176, 2, 50, "\\settings\\maps\\great_night\\�ٰ�����.txt"},	--�ٰ�����;
	{11, 2, 50, "\\settings\\maps\\great_night\\�ɶ�����.txt"},	--�ɶ�����;
	{78, 3, 50, "\\settings\\maps\\great_night\\��������.txt"},	--��������;
};

function TaskShedule()
	--���÷�������
	TaskName("L� Vu Lan")
	
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	nMin = nMin + 2;
	if (nMin >= 60) then
		nMin = nMin - 60;
		nHour = nHour + 1;
	end;
	
	if (nHour >= 24) then
		nHour = 0;
	end;
	TaskTime(nHour, nMin);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("==================L� Vu Lan"..nHour..":"..nMin.."B�t ��u===================");
end

function TaskContent()
	--��19:30��20:01���м���ܴ���
	local START_TIME = 1930;
	local END_TIME = 2000;
	
	local nNowTime = tonumber(date("%H%M"));
	local nDate = tonumber(date("%y%m%d"));
	
	if (nDate >= 60808 and nDate <= 60815) then
		if (nNowTime >= 800 and nNowTime <= 2400)  then
			GlobalExecute("dw ShowFlower()"); --Խ���������ֻ�
			OutputMsg("=================L� Vu Lan===================");
		end;
	end;
end;
