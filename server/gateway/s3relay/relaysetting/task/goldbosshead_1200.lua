Include("\\script\\mission\\bossnew\\callboss_new.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua")

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--���÷�������
	TaskName("Boss Ho�ng Kim 1200")
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(1440)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	
	--�趨��ʱ������ʱ��
	
	TaskTime(12, 0);
	
	--ɾ����ǰ������
	for i = 1, getn(tb_goldboss) do
		success = ClearRecordOnShareDB("GoldBoss", tb_goldboss[i].Sid, 0, 1, 0);
		OutputMsg("X�a d� li�u qu�i v�t Ho�ng kim trong database"..tb_goldboss[i].Sid);
	end
end

function TaskContent()
	for i = 1, getn(tb_goldboss) do
		str = tb_goldboss[i].str;
		GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	end
	local tbTempData = tbCallBossNewRandom:GetBossPosS3();
	local ResHandle = OB_Create()
	for i=1,3 do
		ObjBuffer:PushObject(ResHandle, tbTempData[i].nId)
	end
	RemoteExecute("\\script\\missions\\boss\\callboss_new.lua", "tbCallBossNewRandom:CallBossNewFixureGS",ResHandle);
	OB_Release(ResHandle)
	
	OutputMsg("***====Ho�t ��ng Boss Ti�u xu�t hi�n====***")
	----GlobalExecute("dwf \\script\\missions\\boss\\callboss_incity.lua CallBossDown_Fixure()");
end
