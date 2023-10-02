Include("\\script\\leaguematch\\head.lua")
Include("\\script\\gb_taskfuncs.lua")
Include("\\script\\leaguematch\\switch.lua")


function TaskShedule()
	TaskName("LeagueMatch Fixe Team")
	--����1���Ӻ�,2����ǰ��ִ��
	
	local nTime = GetSysCurrentTime() + 120
	local tbTm = Time2Tm(nTime)
	TaskTime(tbTm[4], tbTm[5])
	
	
	TaskCountLimit(1);	--ִֻ��1��Ŷ
	TaskInterval(1);	--���ʲô������
	
end

function TaskContent()
	local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
	
	OutputMsg("============ LeagueMatch Remove Teams With Error ==============")

	local n_type = WLLS_SEASON_TB[n_sid][1]
	_M("ɾ����ս��")
	local n_lid = LG_GetFirstLeague(WLLS_LGTYPE)
	while (not FALSE(n_lid)) do 
		local n_next = LG_GetNextLeague(WLLS_LGTYPE, n_lid)
		if (LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE) ~= n_type) then
			local str_lgname = LG_GetLeagueInfo(n_lid)
			wlls_lg_clear_one(n_lid)
			LG_ApplyRemoveLeague(WLLS_LGTYPE, str_lgname)
		end
		n_lid = n_next
	end
	
	OutputMsg("============ LeagueMatch Remove Teams With Error Successfully ==============")
end