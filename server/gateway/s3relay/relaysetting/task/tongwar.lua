Include("\\script\\event\\tongwar\\event.lua");

TONGWAR_NAME = "V� L�m �� Nh�t Bang"
LEAGUE_NUMBER = 7
TONGWAR_STATETIME = 2000
TONGWAR_ENDTIME = 2130

-- ��һ���������Ǽ��Լ��Ķ���League
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;

TONGWAR_SEASON_TB = {
--  ID = {����,������ʼ��,���������գ���������ʼ�գ������������գ�������ȡ��ʼ�գ�������ȡ������}
--	[1] = {0706, 14, 18, 30, 70701, 70705},
--	[2] = {0709, 14, 18, 30, 71001, 71006},
--	[3] = {0803, 18, 18, 30, 80331, 80406},
--	[4] = {0810, 3,  4,  16, 81017, 81022},
--	[5]	= {0904, 3,  4,	 16, 90417, 90422},
--	[6] = {0910, 3,  4,	 16, 91017, 91022},
--	[7] = {1004, 15, 16, 28, 100429, 100502},
--  ID = {[1]������ʼ��,[2]������,	[3]����ֹ,	[4]������,	[5]����ֹ}
	[1] = {101030, 		101101,		101108,		101109,		101113},
	--Season 2 - VLDNB 2011 - Modified by DinhHQ - 20110510
	--phase 1: 20110514
	--phase 2: 20110514 - 20110521
	--phase 3: 20110522 - 20110529
	[2] = {110514, 		110514,		110521,		110522,		110529},
	--Season 3 - VLDNB 10 - Modified by DinhHQ - 20111013
	--phase 1: 20111022
	--phase 2: 20111022 - 20111030
	--phase 3: 20111031 - 20111107
	[3] = {111022, 		111022,		111029,		111030,		111106},
	--Season 4 - VLDNB 11 - Modified by DinhHQ - 20120507
	[4] = {120512, 		120512,		120523,		120524,		120530},
	--Season 5 - VLDNB 12 - Modified by DinhHQ - 20121024
	[5] = {121027, 		121027,		121105,		121106,		121111},
	--Season 6 - VLDNB 13 - Modified by DinhHQ - 20130401
	[6] = {130406, 		130406,		130413,		130414,		130418},
	--Season 7 - VLDNB 14 - Modified by ThanhLD - 20130401
	[7] = {131012, 		131012,		131019,		131020,		131024},
	--Season 8 - VLDNB 15 - Modified by ThanhLD - 20140319
	[8] = {140329, 		140329,		140405,		140406,		140411},
}
SCHEDULE_TABLE = {	-- �����ճ�
	{
		"29",	-- 2009��10��4��
		{5, 7}, 	-- �ٰ� VS ����
		{4, 6}, 	-- �꾩 VS ����
		{2, 3}		-- �ɶ� VS ����
	},
	{
		"30",	-- 2009��10��6��
		{1, 4},		-- ���� VS �꾩
		{5, 6},		-- ���� VS ����
		{3, 7}		-- �ٰ� VS ����
	},
	{
		"31",	-- 2009��10��8��
		{2, 7},		-- �ɶ� VS �ٰ�
		{1, 5},		-- ���� VS ����
		{6, 3}		-- ���� VS ����
	},
	{
		"1",	-- 2009��10��10��
		{4, 5},		-- �꾩 VS ����
		{2, 6},		-- �ɶ� VS ����
		{1, 3}		-- ���� VS ����
	},
	{
		"2",	-- 2009��10��12��
		{1, 2},		-- ���� VS �ɶ�
		{6, 7},		-- �ٰ� VS ����
		{3, 4}		-- �꾩 VS ����
	},
	{
		"3",	-- 2009��10��14��
		{2, 4},		-- �ɶ� VS �꾩 
		{1, 7},		-- ���� VS �ٰ�
		{3, 5}		-- ���� VS ����
	},
	{
		"5",	-- 2009��10��16��
		{4, 7},		-- �꾩 VS �ٰ�
		{2, 5},		-- �ɶ� VS ����
		{1, 6}		-- ���� VS ����
	}
}

function TaskShedule()
	TaskName(TONGWAR_NAME)
	OutputMsg(TONGWAR_NAME)
	local nhour = GetNextHour();
	TaskTime(nhour, 0)		-- �״���������һ�����㿪ʼ

	TaskInterval(30)	-- 30����һ��
	TaskCountLimit(0)	--���޴δ�������
end

function TaskContent()
	
	local task_month = tonumber(date("%y%m"));
	local task_date = tonumber(date("%d"));
	local task_time = tonumber(date("%H%M"));
	local task_ymd = task_month *100 + task_date;
	
	
	
	local nseason = tongwar_GetCurSeason(task_ymd)
	
	
	OutputMsg(format("M�a hi�n t�i l� %s", nseason))
	if (nseason == 0) then		--û�а��ŵ�������
		set_tongwar_phase(0);
		--OutputMsg("season "..task_month.." cannot be found in schedule, quit task."..nseason)
		return 0;
	end;
	
	
	
	if (task_ymd > TONGWAR_SEASON_TB[nseason][5]) then	--��ǰ�����Ľ���ʱ���ѹ��������ټ���
		set_tongwar_phase(0);
		--OutputMsg("season "..task_month.." cannot be found in schedule, quit task.")
		return 0;
	end;
	
	--�������� 22�� 0������ ��ɾ������ս����Ϣ�����¶�ȡռ�ǰ��
	--��ʱ����������а���Ϣ
	--VLDNB2011 Set sign up time from 00h 20110514 to 18h 20110514 - Modified by DinhHQ 20110510
	if ((task_ymd == TONGWAR_SEASON_TB[nseason][1]) and (task_time < 1800)) then
		if (tongwar_initmatch(nseason) == 1) then
			return 1;
		end
	end
	
	if (task_ymd >= TONGWAR_SEASON_TB[nseason][2] and task_ymd <= TONGWAR_SEASON_TB[nseason][3]) then
		if (task_ymd == TONGWAR_SEASON_TB[nseason][2] and task_time < 1800) then
			return
		else
			set_tongwar_phase(2);--��ǰ�׶�Ϊ2,�����ս�����
		end
	elseif (task_ymd >= TONGWAR_SEASON_TB[nseason][4] and task_ymd <= TONGWAR_SEASON_TB[nseason][5]) then
		set_tongwar_phase(3);--��ǰ�׶�Ϊ3,����������
	end;
	
	local team1, team2, team3	-- Table���ͣ�Table[2] = {����1, ����2}
	local strGlExe = ""
	for i = 1, LEAGUE_NUMBER do
		if (tostring(task_date) == SCHEDULE_TABLE[i][1]) then
			team1 = SCHEDULE_TABLE[i][2]
			team2 = SCHEDULE_TABLE[i][3]
			team3 = SCHEDULE_TABLE[i][4]
		end
	end
	
	if (not team1) or (not team2) or (not team3) then	-- ���ڲ����ճ̱���˳�
		OutputMsg("date "..task_date.." cannot be found in schedule, quit task.")
		return
	end
	if (task_time >= (TONGWAR_STATETIME - 5) and task_time <= (TONGWAR_STATETIME + 5)) then	-- ������ʼ
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		OutputMsg(TONGWAR_NAME.."starting.")
		for i = 1, getn(TONGWAR_CITY) do
			local szcityname = TONGWAR_CITY[i];
			LG_ApplySetLeagueTask(TONGWAR_LGTYPE, szcityname, TONGWAR_LGTASK_CAMP, 0)
			LG_ApplySetLeagueTask(TONGWAR_LGTYPE, szcityname, TONGWAR_LGTASK_MAP, 0)
		end;
		local ground1, ground2, ground3 = random_ground()	-- ��������������
		-- ����9���������ֱ��ǵ�һ�����������˶���˫����Ӫ�����أ��ڶ������������˶���˫����Ӫ�����أ����������������˶���˫����Ӫ������
		strGlExe = format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", team1[1], team1[2], ground1, team2[1], team2[2], ground2, team3[1], team3[2], ground3)
		GlobalExecute(strGlExe)
		OutputMsg(strGlExe);
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		return
	end
	if (task_time >= (TONGWAR_ENDTIME - 5) and task_time <= (TONGWAR_ENDTIME + 5)) then	-- ��������
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		strGlExe = "dw tongwar_start(0)"	-- ����Ϊ0��ʾ��������
		GlobalExecute(strGlExe)
		OutputMsg(TONGWAR_NAME.."overed.")
		OutputMsg(strGlExe);
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		return
	end
	--OutputMsg(task_time.." "..task_date.." "..task_month)
end

function random_ground()	-- ��������������������ظ����������1��2��3
	local grd = {}
	grd[1] = random(1, 3)
	repeat
		grd[2] = random(1, 3)
	until (grd[2] ~= grd[1])
	repeat
		grd[3] = random(1, 3)
	until (grd[3] ~= grd[1]) and (grd[3] ~= grd[2])
	return	grd[1], grd[2], grd[3]
end

function GetNextHour()
	local nh = tonumber(date("%H")) + 1;
	if (nh >= 24) then
		nh = 0;
	end;
	return nh;
end;

function tongwar_GetTong()
	local tb = {}
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		tb[strCityTongName] = tb[strCityTongName] or {}
		tinsert(tb[strCityTongName], strCityName)
	end
	return tb
end

function tongwar_GetCurSeason(nDate)
	
	for i, tb in TONGWAR_SEASON_TB do
		if (nDate >= TONGWAR_SEASON_TB[i][1] and nDate <= TONGWAR_SEASON_TB[i][5]) then
			OutputMsg(format("%d<=%d<=%d ->%d",TONGWAR_SEASON_TB[i][1],nDate,TONGWAR_SEASON_TB[i][5], i));
			return i;
		end;
	end;
	OutputMsg(format("%d ->%d",nDate,0));
	return 0;
end
function tongwar_initmatch(nseason)
	if (gb_GetTask("TONGWAR_STATION", 3) == nseason) then
		OutputMsg("gb_GetTask(TONGWAR_STATION, 3) == nseason)")
		return 0;
	end;
	local szlogfile = LOGFILE..date("%y%m").."\\tongwar.log"
	
	--��һ����һ�ɾ����ս��
	tongwar_delete_oldleague(TONGWAR_LGTYPE, nseason);
	
	-- ɾ���ɵ�һ������ȼ��Ķ���
	tongwar_delete_oldleague(ONETONG_LGTYPE);
	tongwar_delete_oldleague(ONETONG_ACC_LGTYPE);
	
	
	local tbTongSet = tongwar_GetTong()
	
	for strCityTongName, tbCity in tbTongSet do
		
		if getn(tbCity) == 1 and strCityTongName ~= nil and strCityTongName ~= "" then
			local strCityName = tbCity[1]
			 
			if FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName)) then
				local nLeagueID = LG_CreateLeagueObj()
				LG_SetLeagueInfo(nLeagueID, TONGWAR_LGTYPE, strCityName)
				LG_ApplyAddLeague(nLeagueID, "", "")
				LG_FreeLeagueObj(nLeagueID)
				LG_ApplySetLeagueTask(TONGWAR_LGTYPE, strCityName, TONGWAR_LGTASK_SEASON, nseason);
				
				if (not FALSE(strCityTongName))then
					nMemberID = LGM_CreateMemberObj()
					--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
					LGM_SetMemberInfo(nMemberID, strCityTongName, 1, TONGWAR_LGTYPE, strCityName)
					LGM_ApplyAddMember(nMemberID, "", "")
					LGM_FreeMemberObj(nMemberID)
					LG_ApplySetMemberTask(TONGWAR_LGTYPE, strCityName, strCityTongName, TONGWAR_LGMTASK_JOB, 1)
				end
				WriteStringToFile(szlogfile, strCityName.."\t"..strCityTongName.."\n")
				OutputMsg("Bang h�i tham gia V� L�m �� Nh�t Bang �� ���c x�c ��nh!!");
			end
			
		end
	end

	
	for i = 10225, 10234 do		--������а���Ϣ;�������ݲ鿴 ui\������������.ini
		Ladder_ClearLadder(i);
	end;
	--"TONGWAR_STATION"	1�����ʰ�۵İ��id
	--					2�����µ�һ������
	 gb_SetTask("TONGWAR_STATION", 2,1)	--��ǰ�׶�Ϊ1,�¿����µ�һ��
	 gb_SetTask("TONGWAR_STATION", 3,nseason)	--
	 return 1;
end;


function set_tongwar_phase(nphase)
	if (gb_GetTask("TONGWAR_STATION", 2) ~= nphase) then
		gb_SetTask("TONGWAR_STATION", 2,nphase)	--��ǰ�׶�Ϊ0,û�е�һ�����
		OutputMsg("Set TongWar Phase "..nphase)
	end;
end;

function tongwar_delete_oldleague(nlgtype, nseason)
	local n_lid = LG_GetFirstLeague(nlgtype);
	while (not FALSE(n_lid)) do 
		local n_rmlid = n_lid;
		n_lid = LG_GetNextLeague(nlgtype, n_lid);
		if (not nseason or LG_GetLeagueTask(n_rmlid, TONGWAR_LGTASK_SEASON) ~= nseason) then
			local str_lgname = LG_GetLeagueInfo(n_rmlid);
			LG_ApplyRemoveLeague(nlgtype, str_lgname);
		end;
	end
end
	

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
