COEF_CONTRIB_TO_VALUE	=	1000		--���׶ȼ�ֵ��ת��ϵ��
MAX_SHITU_VALUE_STORE	=	10000000	--���ʦ���ϵ��ֵ��
MAX_WEEK_CONTRIBUTION	=	22400		--���ۻ����׶�����(10w/h*4h/1000*80%*7d)
MAX_KICK_COUNT			=	20			--ÿ�������޳�����Ա�ĸ���

--���׶���ڻ����
EVE_NOEVENT		=	0
EVE_SOJIN		=	1	--�ν�
EVE_XINSHI		=	2	--��ʹ
EVE_CHUNGGUAN	=	3	--����
EVE_YESHOU		=	4	--Ұ��
EVE_WULIN		=	5	--��������
EVE_FENGHUO		=	6	--���
EVE_HUADENG		=	7	--����
EVE_ZHONGZI		=	8	--����
EVE_SHUIJI		=	9	--�������
EVE_XIULIAN		=	10	--ͬ������
EVE_JUQING		=	11	--ͬ�����
EVE_JUANKUAN	=	12	--���
EVE_KILLER		=	13	--ɱ��boss
EVE_FENGLINGDU	=	14	--����ɶɴ�
EVE_LONGMAI		=	15	--����

--��Ŀ�����
MIN_WEEKGOAL_MEMBER			=	100																--�����Ŀ����������
DAILY_PRICE			=	50	--ÿ����ڿɵ���̳��ȡ�Ľ���
TB_WEEKGOAL_PRICE_BASE	=	{ 2.5,	4.5,	6.75 }	--�����Ѷȼ���Ľ�������
TB_WEEKGOAL_CHANGE		=	{ 4,	8,		16 }	-- �����Ѷȼ�������ֶ�Сʱ��
WEEKGOAL_VALUE_PERSON		=	150 * 8															--��Ŀ����˹��׶��������
WEEKGOAL_VALUE_TONG_SYNC	=	WEEKGOAL_VALUE_PERSON / 10										--��Ŀ���ṱ�׶��ۻ�ֵͬ����ֵ
WEEKGOAL_PRICE_PERSON		=	1000															--��Ŀ����˽�������ֵ����λ����
WEEKGOAL_PRICE_TONG			=	10																--��Ŀ���ά���ٻ�������
TB_WEEKGOAL_TYPE_ID		= 	{ EVE_SOJIN,	EVE_XINSHI,	EVE_CHUNGGUAN,	EVE_YESHOU }	--��Ŀ������
TB_WEEKGOAL_TYPE_NAME	=	{ "Chi�n tr��ng T�ng Kim",	"Nhi�m v� T�n S� ",	"Th�ch th�c th�i gian",		"Chu�i nhi�m v� D� T�u" }	--��Ŀ����������

--��������������
TASKID_CONTRIVALUE			=	2361			--���׼�ֵ��
TASKID_STORED_OFFER			=	2389			--��Һ󱸹��׶�
TASKID_STUNT_LASTWEEK		=	2443			--�ؼ���ȡ�İ������
TASKID_STUNT_LASTDAY		=	1580			--���һ����ȡ����ؼ��İ������
TASKID_CITY_LASTDAY			=	1581			--���һ����ȡ�����ؼ��İ������
TASKID_STUNT_TAKED			=	2444			--�ؼ��������Ƿ���ȡ��
TASKID_MONEYBOX_LASTTIME	=	2446			--����Ǯ��Ч����ֹʱ��
TASKID_PANAXBOX_OPEND		=	1577			--�ι޿����ر�
TASKID_PANAXBOX_LASTTIME	=	1578			--�ι�ʣ��ʹ��ʱ��
TASKID_CITYST_TAKED			=	1579			--�Ƿ���ȡ�˳����ؼ�
TASKID_LASTHERO_DATE		=	2497			--���һ����ȡ���Ӣ��������ڣ���ȡʱ�жϣ����£�	
TASKID_LASTHERO_TAKED		=	2498			--ÿ����ȡ���Ӣ����ĸ�������������ȡʱ�жϸ��£�
TASKID_HEROLING_COUNT		=	2499			--�ۻ���Ӣ�����������+��-��
TASKID_CONTRIBUTE_USED		=	2517			--�ۻ����ĵ��ܹ��׶ȣ���������ȡʱ�жϸ��£�

--����Ա�����������
TONGMTSK_WEEK_GOAL_PRICE	=	1001			--��Ŀ���콱��¼
TONGMTSK_DAILY_PRICE		=	1002			--��̳�콱��¼
TONGMTSK_TOMASTER			=	1003			--ʦ���ϵ��ֵ��
TONGMTSK_SELFCOMMEND_TIME	=	1037			--[�����Լ�]��������Լ���ʱ�䣬�������ж����Ͷ��һ��������ʱ���Ⱥ�����
TONGMTSK_MASTERCANDIDATE	=	1038			--[�����Լ�]��(1)��(0)�ǰ�����ѡ��
TONGMTSK_INICONTRIBUTIVENESS=	1039			--[�����Լ�]�������ʱ�Ĺ��׶�
TONGMTSK_CONTRIBUTIVENESS	=	1040			--[�����Լ�]��ѡ�ĸ��˹��׶�

--��������������
TONGTSK_WEEKGOAL_COMPLETE	=	1006			--�������Ŀ���Ƿ����
TONGTSK_LAST_LEVELUP_DAY	=	1007			--��Ὠ��ȼ��ϴ�����ʱ��
TONGTSK_WEEKGOAL_PRICE_WEEK	=	1009			--��¼��Ŀ�������������һ������
TONGTSK_LAST_DEGRADE_DAY	=	1010			--����ϴν���ʱ��
TONGTSK_STUNT_ID			=	1011			--����ؼ����
TONGTSK_STUNT_MEMLIMIT		=	1012			--����ؼ�ÿ��ʱ���ܹ���ȡ����
TONGTSK_STUNT_MAINPERIOD	=	1013			--����ؼ�ά�����ڣ�������㣬�Խ�ֹ����
TONGTSK_STUNT_ENABLED		=	1014			--����ؼ��Ƿ񼤻1-���0-��ͣ
TONGTSK_STUNT_SWICTH		=	1021			--��һ���ڽ�Ҫ���ĵİ���ؼ�
TONGTSK_TOTEMINDEX			=	{ 1022, 1023 }	--��¼ͼ��֮��NPC��index��1027Ϊ��ߵģ�1028Ϊ�ұߵġ��ұߵ��ڰ��Ϊ5����ռ�ǰ�ʱ������Ϊ����ͼ��֮��
TONGTSK_CITYST_MEMLIMIT		=	1034			--�����ؼ��ܹ���ȡ����
TONGTSK_MONEYBOX_DROPMAX	=	1035			--����Ǯ����������boss��ӡ������
TONGTSK_STUNT_PAUSE			=	1036			--�����ͣά���ؼ�
TONGTSK_OPEN_DATE			=	1041			--[�����Լ�]�����Լ�������ʱ�䣬���Ϊ0��ʾû�п���
TONGTSK_LAST_WM_DAY			=	1050			--����ϴ���ά������
TONGTSK_LUP_ORDER			=	1051			--�����������
TONGTSK_LUP_PRICE			=	1052			--�����������
TONGTSK_HEROLING			=	1043			--���ÿ���ۻ���Ӣ���ÿ����գ�������
TONGTSK_USEHEROLING			=	1044			--������ĵ�Ӣ���ÿ����գ�������
TONGTSK_MAP_EXPIRE_DATE		=	1045			--����ͼ����Ч����
TONGTSK_MEMBER_KICK_COUNT	=	1046			--�޳�����Ա�ļ���
TONGTSK_MEMBER_KICK_DATE	=	1047			--�޳�����Ա�ļ�������

TONGTSK_CLAIMWAR_DATE   = 1053         --ĳ�����ս����, add by wdb
TONGTSK_CLAIMWAR_TIMES  = 1054		   --ĳ�����ĳ����ս�Ĵ���

--����Log
TONGTSK_WEEK_BFADD			=	1100
TONGTSK_WEEK_BFCONSUME		=	1101
TONGTSK_WEEK_WFADD			=	1102
TONGTSK_WEEK_WFCONSUME		=	1103
TONGTSK_WEEK_WSCONSUME		=	1104
TONGTSK_MONEYFUND2BF		=	1105
TONGTSK_MONEY2BF			=	1106
TONGTSK_BF2WF				=	1107

--���ڻ����ʱ����������
TONGTSK_Gongde_meici = 1205
TONGTSK_Gongde_meici_flag = 1206 -- ��¼������ʱ
TONGTSK_Gongde_meizhou = 1208 --
TONGTSK_Gongde_meizhou_flag = 1209 -- ��¼%j
TONGTSK_Gongde_Total = 1210
--�����ʱ�����������
--���׶�������ݻ���
TONG_TEMPSTART				=	100				--��ʱ����ID������ڴ�ֵ
TONG_WEEKTEMP				=	101				--��Ŀ���ۻ����׶Ȼ���
TONG_STORETEMP				=	102				--�������׶Ȼ���
TONG_FUNDTEMP				=	103				--���𻺴�
TONG_TMPWEEKGOALPRICE		=	104				--��Ŀ���콱��ʱ

--�������
TONGMEMBER_RETIRE_MAX_RATE		=	0.5			-- ��������������
TONGMEMBER_RETIRE_REQUIRE_DAY	=	7			-- ����������Ҫ����7�첻���߲ſɽ���
TONGMEMBER_UNRETIRE_REQUIRE_DAY	=	7			-- �ָ�������Ҫ������7���ſɽ���

-- ���ְ��ID
TONG_MASTER		= 0		--����
TONG_ELDER		= 1		--����
TONG_MANAGER	= 2		--�ӳ�
TONG_MASS		= 3		--����
TONG_RETIRE		= 4		--��ʿ

-- ���ְ������
TB_TONG_FIGURE_NAME =
{
	[TONG_MASTER]	=	"Bang ch� ",
	[TONG_ELDER]	=	"Tr��ng L�o",
	[TONG_MANAGER]	=	"��i tr��ng",
	[TONG_MASS]		=	"�� t� ",
	[TONG_RETIRE]	=	"�n s�",
};

MAX_ELDER_COUNT		=	7		-- ���������
MAX_MANAGER_COUNT	=	56		-- ���ӳ�����


-- ���Ȩ��ID
RIGHTID_WORKSHOP	=	9001	-- ��������
RIGHTID_WEEKGOAL	=	2005;	-- ��Ŀ�����
RIGHTID_CITY		=	2003	-- ���й���
RIGHTID_STUNT		=	2006	-- �ؼ�����

DYNMAP_ID_BASE		=	70000	-- ��̬��ͼ��ʼֵ

-- �ؼ����
TB_STUNT_RIGHT_DS	=	{ "C�p l�nh ��o", "T�t c� th�nh vi�n" }
TB_TOTEMPOLE_POS	=	{ {1665, 3253}, {1657, 3262} }
TB_CITYID_STUNTID	=
{
	[1] = {"Ph��ng T��ng", 5},
	[2] = {"Th�nh ��", 1},
	[3] = {"��i L�", 6},
	[4] = {"Bi�n Kinh", 7},
	[5] = {"T��ng D��ng", 3},
	[6] = {"D��ng Ch�u", 2},
	[7] = {"L�m An", 4},
}
TB_STUNT_PAUSESTATE	=
{
--[stateid] ��ǰ״̬ ����״̬ ׼��ı��״̬ ά�����״̬
	[0] = {"��ng", "��ng", 1, 0},
	[1] = {"��ng", "m� ", 0, 3},
	[2] = {"m� ", "��ng", 3, 0},
	[3] = {"m� ", "m� ", 2, 3},
}

-- �����Լ����
CAST_DURATION		=	14;				--��Ͷ����
MASTER_ASIDE_TIME	=	30;				--�����뿪��ʱ��
FORETASKVALUE		=	2240;			--ǰ������Ŀ��ֵ