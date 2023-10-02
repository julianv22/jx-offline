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
bFind , key1, mapid = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
if (bFind == 1) then 
	--��������ķ���������Boss������ʱ
	if (IsMapOnGameSvr(mapid, dwGameSvrIP ) == 1) then 
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, mapid, "iii");		
		if (bResult == 1) then 
			success = SaveCustomDataToSDBOw("GoldBoss", Sid, mapid, "iii", npctid, npclevel, 0);
			NotifySDBRChanged1Svr(dwGameSvrIP, "GoldBoss", Sid ,mapid ,1);		
			msg = format("Ph��ng �n Qu�i Ho�ng Kim %d, ph�t hi�n GameSvr %d kh�i ��ng k�t n�i v�i Relay, xu�t hi�n qu�i v�t, khu v�c %d, ID Npc%d,   ��ng c�p Npc%d.", Sid, dwGameSvrIP, mapid, npctid, npclevel);
			OutputMsg(msg);
		else
			success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);		
		end;
	else
		OutputMsg("M�y ch� kh�i ��ng l�i kh�ng t�n t�i Boss d��i ��y:"..Sid);
	end
end

end;

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--���÷�������
	TaskName("Boss Ho�ng kim"..Sid)
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(Interval)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(Count)
	
	--�趨��ʱ������ʱ��
	if (StartHour ~= -1 and StartMin ~= -1) then 
		TaskTime(StartHour, StartMin);
	end;
	--ɾ����ǰ������
	success = ClearRecordOnShareDB("GoldBoss",Sid, 0,1,0);
	OutputMsg("X�a d� li�u qu�i v�t Ho�ng kim trong database"..Sid);
end

function TaskContent()
	bFind , key1, key2 = GetFirstRecordFromSDB("GoldBoss",Sid, 0, 1, 0);
	if (bFind == 1) then
		OutputMsg("T�m th�y d� li�u qu�i v�t Ho�ng kim rong database".. Sid..","..key2.."D� li�u ph��ng �n");
		bResult , npctid, npclevel, npcstate = GetCustomDataFromSDB("GoldBoss", Sid, key2, "iii");
		msg =	format("D� li�u %d trong ph��ng �n qu�i v�t Ho�ng kim l� Npc: %d, ��ng c�p:%d, Tr�ng th�i: %d", Sid, npctid, npclevel, npcstate);
		OutputMsg(msg);
		if (bResult == 1) then 
			if (npctid == 0 and npcstate == 0 and npclevel == 0) or (npctid ~= 0 and npclevel ~=0 and npcstate == 0) then 
				create, mapid, npcid, npclevel = NewBoss();
				if (create == 1) then 
					msg = format("Qu�i v�t Ho�ng kim %d trong ph��ng �n kh�ng c� ho�c �� ch�t, s�p xu�t hi�n qu�i v�t ho�ng kim m�i, s� h�nh m�u Npc l� %d, ��ng c�p Npc %d.   ", Sid, mapid, npcid, npclevel);
					OutputMsg(msg);
					success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
					NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
				end
			end
		end
	else
		create, mapid, npcid, npclevel = NewBoss();
		msg = format("Qu�i v�t Ho�ng kim %d trong ph��ng �n kh�ng t�n t�i, s�p xu�t hi�n qu�i v�t ho�ng kim m�i, s� h�nh m�u Npc l� %d, ��ng c�p Npc %d   ", Sid, mapid, npcid, npclevel);
		OutputMsg(msg);
		success = SaveCustomDataToSDBOw("GoldBoss",Sid, mapid, "iii", npcid, npclevel, 0);
		NotifySDBRecordChanged("GoldBoss", Sid ,mapid ,1);
	end
end

