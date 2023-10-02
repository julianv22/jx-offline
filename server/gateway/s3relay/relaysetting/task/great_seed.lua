Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	--{340,3,100,"\\settings\\maps\\great_night\\Ī�߿�.txt","M�c Cao Qu�t"},			--Ī�߿�
	{336,3,100,"\\settings\\maps\\great_night\\�����.txt","Phong L�ng ��"},			--�����
	
	{322,2,100,"\\settings\\maps\\great_night\\����ɽ��´.txt","Tr��ng B�ch s�n B�c"},	-- ����ɽ��´
	--{321,2,100,"\\settings\\maps\\great_night\\����ɽ��.txt","Tr��ng B�ch S�n Nam"},		-- ����ɽ��
	--{225,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��1.txt","Sa M�c 1"},		-- ����ɽ��
	--{226,2,30,"\\settings\\maps\\great_night\\ɳĮɽ��2.txt","Sa M�c 2"},		-- ����ɽ��
	--{227,2,40,"\\settings\\maps\\great_night\\ɳĮɽ��3.txt","Sa M�c 3"},		-- ����ɽ��
	
	--{182,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","Nghi�t Long ��ng"},	-- ����ɽ��
	--{167,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","�i�m Th��ng s�n"},			-- ����ɽ��
	{200,1,25,"\\settings\\maps\\great_night\\�������Թ�.txt","C� D��ng ��ng"},	-- ����ɽ��
	--{92,1,25,"\\settings\\maps\\great_night\\���ɽ.txt","Th�c C��ng s�n"},				-- ����ɽ��

--	{341, 4, 1, "\\settings\\maps\\great_night\\Į����ԭ.txt","Į����ԭ"},		-- Į����ԭ
--	{333, 4, 1, "\\settings\\maps\\great_night\\��ɽ��.txt","��ɽ��"},			-- ��ɽ��
--	{319, 4, 1, "\\settings\\maps\\great_night\\�����.txt","�����"},			-- �����
	{959, 4, 3, "\\settings\\maps\\great_night\\˫����.txt","Chi�n Long ��ng"},			-- ˫����
--	{181, 4, 1, "\\settings\\maps\\great_night\\��ˮ��.txt","��ˮ��"},			-- ��ˮ��
};

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
	--���÷�������
	TaskName("h�t Huy Ho�ng")
	
	-- 12��00�ֿ�ʼ
	TaskTime(20	, 00);
	
	--���ü��ʱ�䣬��λΪ����
	TaskInterval(5)
	
	--���ô���������0��ʾ���޴���
	TaskCountLimit(0)
	OutputMsg("#NAME?");
end

function TaskContent()
	--��19:30��20:01���м���ܴ���
	local START_TIME = 2000;
	local END_TIME = 2030;
	
	if righttime_add() ~= 1 then--���ʱ�䲻��
		gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 1, 0)
		gb_SetTask("h�t Huy Ho�ng", 12, 0);	--12�ű��������洢NPC�����
		return
	end;
	
	OutputMsg("#NAME?")
	--����������ڻ�ʼ����������
	local nNowTime = tonumber(date("%H%M"))
	
	--����������������ʱ��ÿ��׼ʱ��ʼ�ʱ����һ��ʱ
	if nNowTime >= 2000 and nNowTime < 2005 then	--	
		--NPC��� = NPC��˳�� +  ����(4)��������֤�����NPC�Ƿ����ڿɱ�ժȡ�Ĺ�ʵ
		gb_SetTask("h�t Huy Ho�ng", 12, 0);	--12�ű��������洢NPC�����
	end
	--------------------
	--
	--------------------
	--����ǵڼ���5���ӣ����ڼ�����
	--ִ�е�ʱ��������ε���ż��ȷ����ˢ���ӻ��ǹ�ʵ
	local nBatch = floor(mod(nNowTime,100)/5) + 1
	--
	local nMapCount = getn(greatseed_configtab);
	-----
	--
	-----
	for i = 1, nMapCount do
		local strExecute = format("dw Global_GreatSeedExecute(%d, %d, %d, [[%s]], [[%s]],%d)", greatseed_configtab[i][1], greatseed_configtab[i][2], greatseed_configtab[i][3], greatseed_configtab[i][4],greatseed_configtab[i][5],nBatch);
		GlobalExecute(strExecute);
		local szMsg = "";
		if (mod(nBatch,2) == 1) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "h�t Huy Ho�ng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "H�t Ho�ng Kim "
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "Qu� Huy Ho�ng"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "Qu� Ho�ng Kim"
		end; 
		szMsg = format("Hi�n t�i <%s> �� xu�t hi�n t�i %s, 5 ph�t sau s� k�t qu�. C�c v� ��i hi�p h�y chu�n b� h�i qu�.",
					szMsg,
					greatseed_configtab[i][5]);
		
		GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg));
	end;
end
function CreateLantern(nDate)
	if (gb_GetTask("Ho�t ��ng 'Hoa ��ng'", 2) == 0 or gb_GetTask("Ho�t ��ng 'Hoa ��ng'", 2) ~= nDate) then
		lantern_area = tblantern_area[ random( getn(tblantern_area) ) ]
		gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 1, lantern_area)
		gb_SetTask("Ho�t ��ng 'Hoa ��ng'", 2, nDate)
	end
	GlobalExecute("dw GN_Create_Lanterns()")
end

-- LLG_ALLINONE_TODO_20070802
--
function righttime_add()
	local nTime = tonumber(date("%H%M"));
	if (nTime >= 2000 and nTime < 2030)  then
		return 1;
	end;
	return 0;
end

function goldenseedmap()	--�����һ�λƽ����ӳ��ֵĵ�ͼ��1����2���ݣ�
	local goldcity = random(1, 2);
	gb_SetTask("h�t Huy Ho�ng", 1, goldcity);
	local RowIndex = random(2, 41)
	gb_SetTask("h�t Huy Ho�ng", 2, RowIndex);
	OutputMsg("Th�nh ph� huy ho�ng"..goldcity);
	OutputMsg("goldenseedmap();"..RowIndex);
	return goldcity;
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
