-- ��ʱ��һ�������������Gameserver��ϵͳ����
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"Ho�t ��ng xu�n 2006",--����
"OpenShop",--�̳�
"Thi�p th�ng b�o ch�c m�ng m�u",--Msg2SubWorld
"Thi�p cu�n",--AddLocalNews
"Ph�c duy�n ph�o hoa", 
"Truy�n c�ng",
"L� v�t t�nh nh�n",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("Thi�t k� h� th�ng tr� ch�i ");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("Kh�i ��ng h� th�ng ��ng m� c�c ch�c n�ng trong tr� ch�i...");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
