Include("\\script\\lib\\common.lua")
Include("\\script\\gb_taskfuncs.lua")

--Const Value--
WULIN_LGTYPE_REGISTER = 7
WULIN_LGTYPE_ELECTOR = 8
WULIN_LGTYPE_ACCOUNT = 9
WULIN_FILE_MEMBERS_REGISTER = "relay_log\\wulin_2nd\\register.log"
WULIN_FILE_MEMBERS_ALL = "relay_log\\wulin_2nd\\wulin_finalmember.log"
WULIN_FILE_TONGMASTER = "relay_log\\wulin_2nd\\wulin_tongmaster.log"
WULIN_MAXMEMBER = 100		--ÿ���������100��ѡ��
WULIN_MAXLEADER = 8		--����������
WULIN_GB_NAME = "�ڶ������ִ��"
WULIN_MONEYBASE = 1000000
WULIN_TB_TIME = {
	register = {open = 03030000, close = 03162400},	--ȷ���ʸ�ʱ��
	elector = {open = 03100000, close = 03162400},		--��ѡʱ��
	leader = {open = 03162400, close = 03232400}		--Ʊѡ�����
}

--LG Value--ELECTOR		--��Ͷ�������Ϣ
WULIN_LGTASK_MONEY = 1	--Ͷע���
WULIN_LGTASK_RANK = 3	--��ǰ����
WULIN_LGTASK_DATE = 4	--Ͷע����
WULIN_LGTASK_TIME = 5	--Ͷעʱ��

--LG Value--REGISTER
WULIN_LGTASK_VOTEDCNT = 1
WULIN_LGTASK_CANVOTE = 2
WULIN_LGTASK_LEADER = 3
WULIN_LGTASK_DATE = 4	--Ͷע����
WULIN_LGTASK_TIME = 5	--Ͷעʱ��
WULIN_LGTASK_FACTION = 6	--����Number
WULIN_LGTASK_LEVEL = 7	--�ȼ�

--GB Value--
WULIN_GBTASK_SWITH = 1	--ִ�й��� 0δ��ʼ��1��ʼ��������Ͷ��2�����������Կ�ʼѡȡ��Ͷ�ɹ�ѡ�֣�3���ִ��ѡ��������ȷ�����Կ�ʼѡ���
WULIN_GBTASK_REGCNT = 2	--��ǰ��ѡ�ѱ�������

WULIN_FutureMsg = {
		register = "<color=yellow>3��3��~3��16��<color>�ڼ䣬ȫ��ȫ���ڶ������ִ����ǰ��Χѡ�ֿ�����<color=yellow>�ٰ����ִ���Ա(202/202)<color>����ȷ�������μӣ���ȡ�õڶ������ִ��ѡ���ʸ���ǰ��Χѡ��������μ�������",
		elector = "<color=yellow>3��10��~3��16��<color>�ڼ䣬ȫ��ȫ���ڶ������ִ��ѡ���ʸ�Ͷ��ʼ����ҿ�����<color=yellow>�ٰ����ִ���Ա(202/202)<color>�������밵�꾺Ͷ����ȡ�õڶ������ִ��ѡ���ʸ�������μ�������",
		leader = "<color=yellow>3��17��~3��23��<color>�ڼ䣬ȫ��ȫ���ڶ������ִ�����������Ʊѡ��ʼ�����ִ�����ѡ�ֿ�����<color=yellow>�ٰ����ִ���Ա(202/202)<color>����ͶƱѡ�����ִ�������������(���)�������(����)�Լ���᳤�ϡ�������μ�������",
}

--���Ϊnil��0������1�����򷵻�0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

function _msg(...)
	local str = ""
	for i=1,getn(arg) do
	str = str.."\t"..arg[i]
	end
	OutputMsg(str)
end

function wulin_creatNewmember(n_lgtype, pname, paccount)
	--����ս��
	local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
	LG_SetLeagueInfo(nNewLeagueID, n_lgtype, pname)	--����������Ϣ(���͡�����)
	LG_ApplyAddLeague(nNewLeagueID, "", "")
	LG_FreeLeagueObj(nNewLeagueID)

	--����ս��
	--��account��Ϊ��һ��ս��
	--WULIN_LGTYPE_ACCOUNT
	--roleaccount
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ACCOUNT, paccount))) then
		local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ACCOUNT, paccount)	--����������Ϣ(���͡�����)
		LG_ApplyAddLeague(nNewLeagueID, "", "")
		LG_FreeLeagueObj(nNewLeagueID)
	end
		
	--����ս�����˺�
	local nMemberID = LGM_CreateMemberObj()	--�������ų�Ա���ݶ���(���ض���ID)
	--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
	LGM_SetMemberInfo(nMemberID, pname, 0, WULIN_LGTYPE_ACCOUNT, paccount)
	LGM_ApplyAddMember(nMemberID, "", "")
	LGM_FreeMemberObj(nMemberID)
end