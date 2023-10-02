--�ص㣺��Ӧ��������Ӧ�á�
--һ�Ƚ���10����������1�˵�ĳ�ֽ�Ʒ����4�˵�ĳ�ֽ�Ʒ����5���ֵ�ĳ�ֽ�Ʒ
--���Ƚ���50��������20�˵�ĳ�ֽ���30�˵�������Ʒ
--ĳ�ֽ��ķ������ݣ������һ���𽱵������
TASK_LW_TYPECOUNT = 1 --
TASK_LW_AWARD_MAX = 2 --��ǰ�Ľ�Ʒ����
TASK_LW_AWARD_USED = 3 --��ǰ�Ľ�Ʒ�ѷ���ȥ����
TASK_LW_AWARD_TOTAL = 4 --��ǰ�����н�����
TASK_LW_AWARD_CURPOS = 5 --��ǰ�Ѿ��ж������������
--tab = 
--{
--	leagueid, վ��id
--	"awardinfo" = { ��Ʒ���
--	{awardUSED���ж��ٷ���ȥ��, total, {{type1max,type1cur}, {type2max,type2cur}, {type3max, type3cur}}},
--	{awardused, total,{type1max,type1cur}, {type2max,type2cur}},
--	},
--}

--��RELAY�����µ����޽������ݣ�ս�ӣ�
function limit_create_info(tab)
	leagueid = tab["leaguetype"]
	for i = 1, getn(tab["awardinfo"]) do 
		local some_tab = tab["awardinfo"][i]
		local leaguename = tostring(i)
		local lid = LG_GetLeagueObj(leagueid, leaguename) ;
		if (lid == 0 or lid == nil) then
			lid = LG_CreateLeagueObj()
			LG_SetLeagueInfo(lid, leagueid, leaguename)
			LG_ApplyAddLeague(lid)
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_TYPECOUNT , getn(some_tab[3]) )
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_AWARD_TOTAL , some_tab[2] )
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_AWARD_CURPOS , some_tab[1] )
			for j = 1, getn(some_tab[3]) do 
				local membername = "type"..j
				local memberObj = LGM_CreateMemberObj()
				LGM_SetMemberInfo(memberObj,membername, 0, leagueid, leaguename)
				--LG_AddMemberToObj(lid, memberObj)
				LGM_ApplyAddMember(memberObj)
				LG_ApplySetMemberTask(leagueid, leaguename, membername, TASK_LW_AWARD_MAX, some_tab[3][j][1])
				LG_ApplySetMemberTask(leagueid, leaguename, membername, TASK_LW_AWARD_USED, some_tab[3][j][2])
			end
			LG_FreeLeagueObj(lid)
		end
	end
end 

function limit_show_info(leagueid, msgfun)
	local levelcount = limit_getcount(leagueid)
	msgfun("---------------LIMITED_AWARD REPORT------------------")
	msgfun("AWARD LEVEL COUNT:"..levelcount)
	for i = 1, levelcount do 
		local awardcount, curpos, total = limit_get_level_awardinfo(leagueid, i)
		msgfun(i..":CHILD AWARD COUNT "..awardcount.." CURRENT GOT & TOTAL:"..curpos.."/"..total);
		for j = 1, awardcount do 
			local awardused, awardmax = limit_get_one_awardinfo(leagueid,i,j)
			msgfun("	["..j.."]:GOT & MAX:"..awardused.."/"..awardmax)
		end
	end
	msgfun("------------------------------------------------------")
end

function limit_clear_awardinfo(award_leaguetype)
	local count = 0
	local n_lid = LG_GetFirstLeague(award_leaguetype)
	while (n_lid ~= 0 and n_lid ~= nil) do
		
		name = LG_GetLeagueInfo(n_lid)
		if (name~= "") then 
			LG_ApplyRemoveLeague(award_leaguetype, name)
			count = count + 1
		end
		n_lid = LG_GetFirstLeague(award_leaguetype)
	end
	return count	
end

--���ĳ�����ͽ������
function limit_get_level_awardinfo(award_leaguetype, awardlevel)
	local lid = LG_GetLeagueObj(award_leaguetype, tostring(awardlevel)) ;
	if (lid ~= 0 and lid ~= nil) then 
		local curpos = LG_GetLeagueTask(lid,	TASK_LW_AWARD_CURPOS)
		local total = LG_GetLeagueTask(lid,		TASK_LW_AWARD_TOTAL)
		local typecount = LG_GetLeagueTask(lid,	TASK_LW_TYPECOUNT)
		return typecount, curpos, total
	end
	return -1, -1, -1
end

function limit_get_one_awardinfo(award_leaguetype, awardlevel, awardnum)
	local awardmax = LG_GetMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_MAX) ;
	local awardused = LG_GetMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_USED) ;
	return awardused, awardmax
end

function limit_getcount(award_leaguetype)
	local count = 0
	local n_lid = LG_GetFirstLeague(award_leaguetype)
	while (n_lid ~= 0 and n_lid ~= nil) do
		count = count + 1
		n_lid = LG_GetNextLeague(award_leaguetype, n_lid)
	end
	return count
end

function limit_append_award(award_leaguetype, awardlevel, awardnum)
	LG_ApplyAppendMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_USED, 1)
end

function limit_append_curcount(award_leaguetype, awardlevel, appendnum)
	LG_ApplyAppendLeagueTask(award_leaguetype, tostring(awardlevel), TASK_LW_AWARD_CURPOS, appendnum)
end

-----------------------------------------------------------------
--[1]->leaguename ս���� һ�ཱ��
--typecount = 3 һ�ཱ����3�ֽ�Ʒ
--maxcount = 10 ����ͳ�10����Ʒ
--total = 10000
--curpos = 100
--
--	[type1]member һ��ĵ�һ�ֽ�Ʒ
--	max = 1	һ��ĵ�һ�ֽ�Ʒ����ͳ�һ��
--	cur = 0 Ŀǰ�ͳ�������

--	[type2]member һ��ĵڶ��ֽ�Ʒ
--	max = 4
--	cur = 0
	
--	[type3]member һ��ĵ����ֽ�Ʒ
--	max = 5
--	cur = 0

--[2]						ս���� ���ཱ��
--typecount = 2
--maxcount = 50
--	[type1]			��Ա��
--	max=20
--	cur=0
--	[type2]			��Ա��
--	max=30
--	cur=0
--������
--������
-------------------------------------------------------------------