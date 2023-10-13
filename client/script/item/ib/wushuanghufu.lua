-- ��˫����

IncludeLib("TONG");
IncludeLib("TIMER");
Include("\\script\\tong\\tong_header.lua");


SECOND_FRAME_SUM			=	18;										-- 1���֡��
HOUR_FRAME_SUM				=	SECOND_FRAME_SUM * 60 * 60;				-- 1Сʱ��֡��

WUSHUANG_DURATION			=	1;										-- ��Ч����ʱ�� 1Сʱ
WUSHUANG_DURATION_FRAME		=	WUSHUANG_DURATION * HOUR_FRAME_SUM;
WUSHUANG_EFFECT_FRAME		=	SECOND_FRAME_SUM * 15 * 60;				-- ÿ��Timer��������Чʱ��

TIMERID_WUSHUANG			=	78;										-- ID����д��\settings\timertask.txt
TIMER_WUSHUANG_FREQ			=	10;										-- �ͷ�Ƶ��(10��)
TIMER_WUSHUANG_FREQ_FRAME	=	TIMER_WUSHUANG_FREQ * SECOND_FRAME_SUM;
TIMER_WUSHUANG_COUNT		=	WUSHUANG_DURATION_FRAME / TIMER_WUSHUANG_FREQ_FRAME;

PK_PUNISH_REDUCE_ADD		=	50										-- PK�����Ӽ���%
PK_PUNISH_REDUCE_EXP 		=	50										-- PK����ͷ����ٱ���%
PK_PUNISH_REDUCE_MONEY		=	50										-- PK��Ǯ�ͷ����ٱ���%

TASKID_FEATURE_ID			=	1759;									-- ��˫������FeatureId
TMPTASKID_WUSHUANG_IDX		=	116;									-- ��¼ʹ�õ���˫������ItemIdx


function main(nItemIdx)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) > TONG_ELDER) then
		Say("ֻ�а����ͳ��Ͽ���ʹ��", 1, "�õ�/cancel");
		return 1;
	end
	SetTaskTemp(TMPTASKID_WUSHUANG_IDX, nItemIdx);
	GiveItemUI("��˫����", "�������", "process", "cancel");
	return 1;
end

function process(nItemCount)
	if (nItemCount ~= 1) then
		Say("������Ʒ��������", 0);
		return
	end
	local nMaskItemIdx = GetGiveItemUnit(1);
	local nItemGenre, nDetailType, nParticualrType = GetItemProp(nMaskItemIdx);
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("�����Ĳ�����߰ɡ�", 0);
		return
	end
	if (nParticualrType == 366) then
		Say("<color=yellow>αװ���<color>��������˫ɱ�����͡�", 0);
		return
	end
	local nWuShuangItemIdx = GetTaskTemp(TMPTASKID_WUSHUANG_IDX);
	local nFeatureId = GetMaskFeature(nMaskItemIdx);
	Describe("<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nFeatureId).."?ACTION="..tostring(0).."><link>��ȷ��ʹ�ã������ģ��"..WUSHUANG_DURATION.."Сʱ��", 2, "ȷ��/#process_confirm("..nWuShuangItemIdx..","..nMaskItemIdx..","..nFeatureId..")", "ȡ��/cancel");
end

function process_confirm(nWuShuangItemIdx, nMaskItemIdx, nFeatureId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) > TONG_ELDER) then
		return
	end
	if (RemoveItemByIndex(nWuShuangItemIdx) ~= 1 or
		RemoveItemByIndex(nMaskItemIdx) ~= 1) then
		WriteLog("[ERR] �쳣����˫����ɾ������ʧ�ܣ�\t"..GetAccount().."("..GetName()..")");
		return
	end
	SetTask(TASKID_FEATURE_ID, nFeatureId);
	TM_SetTimer(TIMER_WUSHUANG_FREQ_FRAME, TIMERID_WUSHUANG, TIMER_WUSHUANG_COUNT, 1);
	OnTimer();
end

function cancel()
end

function OnTimer()
	local nOrgPlayerIdx = PlayerIndex;
	local nCamp = GetCamp();
	local nFeatureId = GetTask(TASKID_FEATURE_ID);
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("���Ѿ��뿪�˰�ᣬ��˫�����޷�������Ч��");
		SetTask(TASKID_FEATURE_ID, 0);
		return
	end
	local nRestCount = TM_GetRestCount(TIMERID_WUSHUANG);
	if (nRestCount <= 0) then
		Msg2Player("��˫�����Ѿ��ľ���");
		SetTask(TASKID_FEATURE_ID, 0);
		return
	end
	if (mod(nRestCount * TIMER_WUSHUANG_FREQ, 300) == 0) then
		Msg2Player("<color=yellow>��˫����<color>����������<color=yellow>"..floor(nRestCount * TIMER_WUSHUANG_FREQ / 3600).."<color>Сʱ<color=yellow>"..mod(floor(nRestCount * TIMER_WUSHUANG_FREQ / 60), 60).."<color>���ӡ�");
	end
	local tTongPlayer = GetMapPlayerList(nCamp, 1, nTongID);
	-- ������Ȼ�������ϼ���
	for i = 1, getn(tTongPlayer) do
		PlayerIndex = tTongPlayer[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(WUSHUANG_EFFECT_FRAME, PK_PUNISH_REDUCE_ADD, PK_PUNISH_REDUCE_EXP, PK_PUNISH_REDUCE_MONEY);
			ChangeOwnFeature(1, WUSHUANG_EFFECT_FRAME, nFeatureId);
		end
	end
	PlayerIndex = nOrgPlayerIdx;
end