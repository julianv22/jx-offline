IncludeLib("TONG")
TONG_CONTRIBUTION_LIMIT = 
{
	[0] = {4480000, 	2688000, 	1792000}, -- �������׶�	�����������	ս������
	[1] = {4480000, 	2688000, 	1792000},
	[2] = {11200000,	6720000,	4480000},
	[3] = {11200000,	6720000,	4480000},
	[4] = {22400000, 	13440000, 8960000},
	[5] = {22400000, 	13440000, 8960000},
}

TONG_CONTRIBUTION_LIMIT_TITLE = {"N�p �i�m c�ng hi�n",	"Ng�n s�ch ki�n thi�t d� tr�",	"Ng�n s�ch chi�n b�"};

TONG_CONTRIBUTION_TSKID = {18, 19, 15} -- �������׶�	�����������	ս������
MEMBER_CONTRIBUTION_TSKID = 7
MEMBER_CONTRIBUTION_LIMIT = 
{
	{1, 0}, -- ��͵ȼ�, ���˹���
	{50, 240000},
	{80, 2240000},
}

function TaskShedule()
	-- ���÷�������
	TaskName("Tong Contribution Clean")
	-- ִֻ��һ��
	TaskInterval( 244000 )
	TaskCountLimit( 1 )
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end

function TaskContent()
	OutputMsg("Tong Contribution Clean Start!!");
	 local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\tongcontribution_clean.log";
   
	-- �������
	local nTongID = TONG_GetFirstTong();
	while(nTongID ~= 0)do
		--��ṱ������
		local strTongName = TONG_GetName(nTongID);
		nTongLevel = TONG_GetTaskValue(nTongID, 13);
		for i=1,getn(TONG_CONTRIBUTION_TSKID) do
			local nValue = TONG_GetTaskValue(nTongID, TONG_CONTRIBUTION_TSKID[i]);
			if (nValue > TONG_CONTRIBUTION_LIMIT[nTongLevel][i] or nValue < 0) then
				local nNewValue = TONG_CONTRIBUTION_LIMIT[nTongLevel][i];
				if (nValue < 0) then
					nNewValue = 0;
				end
				TONG_ApplySetTaskValue(nTongID, TONG_CONTRIBUTION_TSKID[i], nNewValue);
				WriteStringToFile(logfilename, format("clean TONG(Name:%s,ID:%0.f,Level:%d) %s old value is %0.f new value is %0.f\n", strTongName, nTongID, nTongLevel, TONG_CONTRIBUTION_LIMIT_TITLE[i], nValue, nNewValue));
			end
		end
		
		-- ������Ա
		local nMemberID = TONG_GetFirstMember(nTongID, -2);
		while(nMemberID ~= 0)do
			local nMemberCon = TONGM_GetTaskValue(nTongID, nMemberID, MEMBER_CONTRIBUTION_TSKID);
			local nRoleLevel = TONGM_GetTaskValue(nTongID, nMemberID, 6);
			if (nRoleLevel < MEMBER_CONTRIBUTION_LIMIT[2][1]) then
				TONGM_ApplySetTaskValue(nTongID, nMemberID, MEMBER_CONTRIBUTION_TSKID, MEMBER_CONTRIBUTION_LIMIT[1][2]);
				WriteStringToFile(logfilename, format("clean TONGMEMBER(ID:%0.f,Level:%d) old value is %0.f new value is %0.f\n", nMemberID, nRoleLevel, nMemberCon, MEMBER_CONTRIBUTION_LIMIT[1][2]));
			elseif(nRoleLevel < MEMBER_CONTRIBUTION_LIMIT[3][1]) then
				if (nMemberCon > MEMBER_CONTRIBUTION_LIMIT[2][2] or nMemberCon < 0) then
					local nNewValue = MEMBER_CONTRIBUTION_LIMIT[2][2];
					if (nMemberCon < 0) then
						nNewValue = 0;
					end
					TONGM_ApplySetTaskValue(nTongID, nMemberID, MEMBER_CONTRIBUTION_TSKID, nNewValue);
					WriteStringToFile(logfilename, format("clean TONGMEMBER(ID:%0.f,Level:%d) old value is %0.f new value is %0.f\n", nMemberID, nRoleLevel, nMemberCon, nNewValue));
				end
			else
				if (nMemberCon > MEMBER_CONTRIBUTION_LIMIT[3][2] or nMemberCon < 0) then
					local nNewValue = MEMBER_CONTRIBUTION_LIMIT[3][2];
					if (nMemberCon < 0) then
						nNewValue = 0;
					end
					TONGM_ApplySetTaskValue(nTongID, nMemberID, MEMBER_CONTRIBUTION_TSKID, nNewValue);
					WriteStringToFile(logfilename, format("clean TONGMEMBER(ID:%0.f,Level:%d) old value is %0.f new value is %0.f\n", nMemberID, nRoleLevel, nMemberCon, nNewValue));
				end
			end
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, -2);
		end
		nTongID = TONG_GetNextTong(nTongID);
	end
	OutputMsg("Tong Contribution Clean End!!");
end