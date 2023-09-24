--Ӧ��Relay��ս��ϵͳ��Ƶģ�ȫ�������飬������µ�����������ܡ�
--������������ص��ǣ�
--1��ȫ����������ͬʱ�������޸�
--2����ʹ�����������Ϸ����Ȼ��Ч
--ȱ���ǣ����ͬʱ��̨�������޸ĸ�ֵʱ���ܻ�������⣬�����뾡��ʹ��Append�ķ�ʽ����������ݼ�ģʽ��
--���Relay������û��Ӧʱ��������쳣�����
--���Ա�����һ��Ӧ���ڶ���ֵ׼ȷ�Բ��Ǻܸ߻��߿��Խ������������Ĺ��ܡ�
--Designed By Romandou 2005.11.14

IncludeLib("LEAGUE")
RELAYTASK_LEAGUEID = 500

function gb_GetTask(szModuleName, nTaskID)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		return 0
	end
	return LG_GetLeagueTask(lid,nTaskID)
end

function gb_SetTask(szModuleName, nTaskID, nValue)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		print("lid = nil")
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid, RELAYTASK_LEAGUEID, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_LEAGUEID, szModuleName)
		LG_AddMemberToObj(lid, memberObj)
		LG_ApplyAddLeague(lid,"\\script\\lib\\gb_taskfuncs.lua", "OnCreateModule")
		LG_FreeLeagueObj(lid)
	end
	
	LG_ApplySetLeagueTask(RELAYTASK_LEAGUEID, szModuleName, nTaskID, nValue)
end

function OnCreateModule(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("gb_Task Build Fail: "..szLeagueName.."szMember"..szMemberName)
		print("gb_Task Build Fail: "..szLeagueName.."szMember"..szMemberName)
	end
	print("gb_Task Build Success: "..szLeagueName.."szMember"..szMemberName)
end

function gb_AppendTask(szModuleName, nTaskID, nAppendValue)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		print("append nil")
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid , RELAYTASK_LEAGUEID, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_LEAGUEID, szModuleName)
		LG_AddMemberToObj(lid , memberObj)
		LG_ApplyAddLeague(lid ,"\\script\\lib\\gb_taskfuncs.lua", "OnCreateModule")
		LG_FreeLeagueObj(lid)
	end
	LG_ApplyAppendLeagueTask(RELAYTASK_LEAGUEID, szModuleName, nTaskID, nAppendValue)
end
