Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\lib\\common.lua")

--Realy Global Value--
RLGLB_WLLS_PHASE	= 121	--������ǰ�����׶�
RLGLB_WLLS_SEASONID	= 122	--��ǰ�������
RLGLB_WLLS_MATCHID	= 123	--��ǰ�������
RLGLB_WLLS_SVRCOUNT	= 123	-- +i ĳ׼������ǰ����(124~143)

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11--��������
WLLS_LGTASK_LAST	= 1	--���μӵ����һ��������ţ�����׼�������㣩	
WLLS_LGTASK_SVRID	= 2 --���μӵ����һ������������
WLLS_LGTASK_MSCAMP	= 3 --���μӵ����һ������MS��Ӫ
WLLS_LGTASK_POINT	= 4	--ս�ӻ�û���
WLLS_LGTASK_RANK	= 5	--ս������
WLLS_LGTASK_WIN		= 6	--ʤ������
WLLS_LGTASK_TIE		= 7	--ƽ�ִ���
WLLS_LGTASK_TOTAL	= 8	--����������ʧ�ܴ��� = TOTAL - WIN - TIE��
WLLS_LGTASK_JOIN	= 9	--�Ѿ�����׼����������
WLLS_LGTASK_TIME	= 10--ս��ʱ���ܼ�
WLLS_LGTASK_STYPE	= 12--�齨ʱ������ģʽ
WLLS_LGTASK_EMY1	= 13	--����һ�����������Ķ��֣�ս����String2ID��
WLLS_LGTASK_EMY2	= 14	--�����ڶ������������Ķ���
WLLS_LGTASK_EMY3	= 15	--�������������������Ķ���
WLLS_LGTASK_TOTAL_EX= 16	--��չ�μӴ���
WLLS_LGTASK_USE_LingQi_COUNT= 17	--��չ�μӴ���

WLLS_LGMTASK_JOB	= 1	--ְλ:0����Ա��1���ӳ�
WLLS_LGMTASK_STATE	= 2	--ս�ӳ�Ա״̬��0���ڳ��⣻1������׼����
WLLS_LGMTASK_ADDSID	= 3	--���ĸ����������˱�ս��
WLLS_LGMTASK_WIN	= 4	--��Ҫ���ӵ�ʤ������
WLLS_LGMTASK_TIE	= 5	--��Ҫ���ӵ�ƽ�ִ���
WLLS_LGMTASK_TOTAL	= 6	--��Ҫ���ӵĲ�������
WLLS_LGMTASK_OVER	= 7	--���ĸ�����������Խ��

--Const Value--
WLLS_LGTYPE	= 5	--ս������

WLLS_MAX_COUNT	= 200	--ÿ��׼����������ɶ���ս��

WLLS_MATCHTIME	= 15	--ÿ��������ʱ�䣨���ӣ�

WLLS_LEVEL_DESC = {"V� l�m li�n ��u", "V� l�m li�n ��u"}
WLLS_LingQi_PerCOUNT = 4
WLLS_TYPE = {
	{
		name = "Song ��u",	-- ������������
		max_member = 2,		-- ս������Ա��
		ladder = 10196,		-- ������ʼID
		mtypes = 2,			-- �����������е�ս��������Ŀ�������������а�������
		groups = 8,			-- ͬ���͵�ս�ӿ��Ա����䵽�����ײ�ͬ�ĳ���
	},
	{
		name = "Thi ��u 1 ng��i",
		max_member = 1,
		ladder = 10201,
		mtypes = 20,
		groups = 1,
	},
	{
		name = "Song ��u s� ��",
		max_member = 2,
		ladder = 10221,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "��u ba ng��i",
		max_member = 3,
		ladder = 10223,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "��n ��u t� do",
		max_member = 1,
		ladder = 10235,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "Song ��u (C�ng h�)",
		max_member = 2,
		ladder = 10238,
		mtypes = 10,
		groups = 1,
	},
	{
		name = "Song ��u",
		max_member = 2,
		ladder = 10248,
		mtypes = 2,
		groups = 8,
	},
}

--���Ϊnil��0������1�����򷵻�0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--���ָ����ս��������Ϣ
function wlls_lg_clear_one(n_lid)
	_M("wlls_lg_clear_one", n_lid)
	local str_lgname, _, n_membercount = LG_GetLeagueInfo(n_lid)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_LAST, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_POINT, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_RANK, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_WIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIE, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TOTAL, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_JOIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIME, 0)
	--���ÿ����Աս����Ϣ
	for i = 0, n_membercount-1 do 
		local str_playername = LG_GetMemberInfo(n_lid, i)
		wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 0)
	end	
end

--��ȫstr
function wlls_safestr(str)
	return '"'..safestr(str)..'"'
end

function wlls_getlginfo(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if FALSE(n_lid) then return str_lgname.."\t" end
	local str = ""
	for i = 0, LG_GetMemberCount(n_lid)-1 do
		local str_pl = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_pl, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			str = str_pl..str
		else
			str = str.." "..str_pl
		end
	end
	return  str_lgname.."\t"..str
end

function wlls_SetLeagueTask(str_lgname, n_taskid, n_value)
	local n_oldv = LG_GetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid, n_value)
end

function wlls_SetMemberTask(str_lgname, str_plname, n_taskid, n_value)
	local n_oldv = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid, n_value)
end

--����������
function wlls_CheckMatchCount(n_leagueid, n_sid)
	
	if FALSE(n_leagueid) or WLLS_SEASON_TB[n_sid] == nil then
		return 
	end
	
	 if (LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL) >= WLLS_SEASON_TB[n_sid][4]) then	--���������ﵽ����
		
		if LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL_EX) >= LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT then
			return
		end
	end
	
	return 1
end

function _M(...)
	--local str = "+++DEBUG["..date("%H:%M:%S").."]: "..join(arg)
	--OutputMsg(str)
end
