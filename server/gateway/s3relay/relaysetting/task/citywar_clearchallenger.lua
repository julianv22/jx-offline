Include("\\RelaySetting\\Task\\citywar_head.lua")
LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;

function TaskShedule()
	TaskName("Bang h�i h�y b�o danh c�ng th�nh chi�n");
	TaskInterval(1440);	--ÿ��
	TaskTime(0, 0);			--0�� ����
	TaskCountLimit(0);	--���޴�

	clearCityWarLeague();
	checkCityWarLeague();
end

function TaskContent()
	clearCityWarLeague();
	checkCityWarLeague();
end;

function checkCityWarLeague()
--����ʱ����Ƿ� ����ս��
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function clearCityWarLeague()
--	 ��24ʱ ִ������Ĳ���
		for i = 1, 7 do
			local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				local nCount = LG_GetMemberCount(nlid);
				for k= 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3], szMemberName, "", "", 0);
				end;
			end;
			
			
			nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				nCount = LG_GetMemberCount(nlid);
				local tbTemMem = {};
				for k = 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					tbTemMem[getn(tbTemMem)+1] = szMemberName;
				end;
				for k = 1, getn(tbTemMem) do
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3], tbTemMem[k], "", "", 0);
				end;
			end;
		end;
end;

function cityid_to_lgname(nCityID)
	return TB_CITYWAR_ARRANGE[nCityID][3];
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
