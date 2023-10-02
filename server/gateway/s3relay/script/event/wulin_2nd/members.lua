Include("\\script\\event\\wulin_2nd\\head.lua")

function wulin_register(szParam)
	--��ִ������
	OutputMsg(szParam)
	local aryParam = split(szParam, " ")
	local rolename = aryParam[1]		--��ɫ��
	local roleaccount = aryParam[2]	--�ʺ�
	local rolelevel = tonumber(aryParam[3])		--�ȼ�
	local rolefaction = tonumber(aryParam[4])	--����
	local n_gtype = tonumber(aryParam[5])	--��Χ���
	
	local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename)
	if (not FALSE(n_lid)) then
		return	--��������Ѿ�ע����ˣ���Ϊʲô����ִ�е���
	end
	wulin_creatNewmember(WULIN_LGTYPE_REGISTER, rolename, roleaccount)

		LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_FACTION, rolefaction)
		LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_LEVEL, rolelevel)
		gb_AppendTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT, 1)
	--�����ɹ�����¼�ڰ�
	local logfilename = WULIN_FILE_MEMBERS_REGISTER
	WriteStringToFile(logfilename, rolename.."\t"..roleaccount.."\t"..tostring(rolelevel).."\t"..tostring(rolefaction).."\t"..tostring(n_gtype).."\n")

	--������ʾ
	local szMsg = "<color=gold>���ִ���Ա<color>������������ȷ�ϡ���ϲ����Ϊ�ڶ������ִ��ѡ�֡�"
	GlobalExecute(format("dw wulin_gm_say([[%s]], [[%s]])", rolename, szMsg))	--��������descript����
end
