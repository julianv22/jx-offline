--�ƽ����Ľű��趨
--1������һ���ƽ����Ĳ��������ű��ļ���������Relay\RelaySetting\Task\Ŀ¼���档
--�ڸ��ļ���ͷ���ֱ�������ƽ�����ͷ�ļ�
--�����·�������
--Include("\\RelaySetting\\Task\\GoldBossHead.lua");

--2���ڷǺ�������(ȫ�ֶ���)����д��ƽ�����йص�ȫ�ֱ���ֵ
--�ֱ���
--1��Sid��ʾ������Boss�ķ����ţ�ÿ������ֻ��ͬʱ����һ��Boss��ע��Boss�����ű�����Ψһ�ģ������趨�ظ���Sid��.
--2��Interval��ʾ����Boss�ļ��ʱ��,��λΪ����
--3��Count ��ʾ�����÷����Ĵ��������Ϊ0��ʾ���޴�����ֻҪ��ʱ��ʹ������ű���
--4��StartHour, StartMin��ʾ��һ�δ�����������ʱ�䣬StartHour��ʾСʱ��StartMin��ʾ���ӡ�
--���StartHour��StartMin����-1ʱ����ʾRelayһ��������������ʼ��һ�δ���
--����:
--Sid = 4
--Interval = 30
--Count = 4
--StartHour = 3
--StartMin = 19
--�����趨��ʾ����4���ƽ�����������������3��19�ֿ�ʼ��һ�δ����������Ժ�ÿ��Сʱ(30����)����һ�Σ�������4�Ρ�Ҳ������3:19 3:49 4:19 4:49����.

--3��������ʵ��Boss�Ľű�����NewBoss()
--�ú���������ڡ��ú����Ĺ����Ǿ����Ƿ�Ҫ����Boss,Boss���ڵء�������ȼ���
--��ˡ��������շ�������4������
--�ֱ��ʾ�Ƿ�Ҫ����boss,boss���ڵ�ͼid,boss��Npcģ��id, boss�ĵȼ���
--��������NewBoss��ʵ��.
--function NewBoss()
	--return 1, 20, random(100), 50 + random(50); 
--end;
--��ʾ������������ڵ�ͼIDΪ20�ĵ�ͼ�ϣ�npcģ�����1��100���,�ȼ���51��100���

--4����Relay\RelaySetting\Task\TaskList.ini�ļ������ӱ��ű�
--��[List]�µ�Count��ֵ��һ��ʾ��������һ����ʱ��������
--����[Task_X],��X�滻�����µ�Countֵ.
--��[Task_X]��TaskFile����ű����ļ���
																			--�ƽ���������:��
																			--2004.2.13 16:27:08

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--���÷�������
	TaskName("Boss Ho�ng Kim 2030")
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	
	--�趨��ʱ������ʱ��
	
	TaskTime(16, 00);
	
	--ɾ����ǰ������
	for i= 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("X�a d� li�u qu�i v�t Ho�ng kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end

