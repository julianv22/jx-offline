--Ӧ��Relay��ս��ϵͳ��Ƶģ�ȫ��������,����Ĺ��ܿ���״̬��ȡ��
--�ù��ܵ��ص��ǣ�
--1��ȫ����������ͬʱ�������޸�
--2����ʹ�����������Ϸ����Ȼ��Ч
--ȱ���ǣ����ͬʱ��̨�������޸ĸ�ֵʱ���ܻ�������⣬�����뾡��ʹ��Append�ķ�ʽ����������ݼ�ģʽ��
--���Relay������û��Ӧʱ��������쳣�����
--���Ա�����һ��Ӧ���ڶ���ֵ׼ȷ�Բ��Ǻܸ߻��߿��Խ������������Ĺ��ܡ�
--Designed By Romandou 2006.1.21
IncludeLib("LEAGUE")
RELAYTASK_GAMEMODULE = 502 --��Ÿ��ֿ��ص�ս��ID
RELAYTASK_MODULETASK = 1 -- �����Ϸ���ܿ���״̬���������ID
--һ�����ܵ�״̬�����֣�0��δ����UnUsed����1������Started����2���ر� Stopped��
------------------------------------------------------------------------------------------------------------------------------------------------------
function gb_GetModule(szModuleName)
	local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName) ;
	if (lid == 0 or lid == nil) then
		return 0
	end
	return LG_GetLeagueTask(lid, RELAYTASK_MODULETASK)
end

function gb_StopModule(szModuleName)
	OutputMsg("Game Module Is Stopped. -->"..szModuleName)
	gb_SetModule(szModuleName, 2)
end

function gb_StartModule(szModuleName)
	OutputMsg("Game Module Is Started. -->"..szModuleName)
	gb_SetModule(szModuleName, 1)
end

function OutputMsg(szMsg)
	WriteLog(szMsg)
	print(szMsg)
end

function gb_AutoStartModule(szModuleName)
	if (szModuleName == "") then
		return 
	end
	
	local nState = gb_GetModule(szModuleName)
	if (nState == 0) then
		gb_StartModule(szModuleName)
		OutputMsg("New Game Module Is Started. -->"..szModuleName)
	elseif(nState == 1) then
		OutputMsg("Game Module Is Started. -->"..szModuleName)
	else
		OutputMsg("Game Module Is Stopped. -->"..szModuleName)
	end
	
end

function _gb_SetModule(szModuleName, nTaskID, nValue)
	local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName) ;
	if (lid == 0 or lid == nil) then
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid, RELAYTASK_GAMEMODULE, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_GAMEMODULE, szModuleName)
		LG_AddMemberToObj(lid, memberObj)
		LG_ApplyAddLeague(lid)
		LG_FreeLeagueObj(lid)
	end
	LG_ApplySetLeagueTask(RELAYTASK_GAMEMODULE, szModuleName, nTaskID, nValue)
end

function gb_SetModule(szModuleName,nValue)
	_gb_SetModule(szModuleName,RELAYTASK_MODULETASK, nValue)
end
