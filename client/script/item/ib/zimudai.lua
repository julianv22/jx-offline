Include("\\script\\global\\login_head.lua")
-- ��ĸ��

DAY_SECOND_SUM			=	60 * 60 * 24;
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;

TASKID_ZMD_EXPIRE_TIME	=	2558;					-- ��ĸ����Ч�����������


function main(nItemIdx)
	local szMsg = "<#>T�i t� m�u c� th�i h�n s� d�ng l�: <color=yellow>"..zmd_get_expire_date().."<color>";
	Say(szMsg, 2, "N�p 1 tu�n/#recharge("..nItemIdx..")", "H�y b� /cancel");
	return 1;
end

-- ��ĸ����ֵ
function recharge(nItemIdx)
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		return
	end
	zmd_add_expire_date(1);
	if (GetPartnerBagLevel() ~= 10) then
		SetPartnerBagLevel(10);
	end
	Say("<#>N�p th�nh c�ng, t�i t� m�u c�a ��i hi�p c� th�i h�n s� d�ng l�: <color=yellow>"..zmd_get_expire_date().."<color>", 0);
end

-- ��ĸ����ʱ���
function zmd_check_expire_timer()
	local nExpireState = zmd_check_expire();
	if (nExpireState == 2) then
		if (GetPartnerBagLevel() ~= 0) then
			SetPartnerBagLevel(0);
			Msg2Player("T�i t� m�u c�a ��i hi�p �� qu� h�n r�i");
		end
	elseif (nExpireState == 1) then
		if (random(1, 3) == 1) then
			Msg2Player("T�i t� m�u c�a ��i hi�p s� h�t h�n trong v�ng h�m nay");
		end
	end
end

-- ������ĸ����Ч���ڣ���λΪ�ܣ�
function zmd_add_expire_date(nRechargeWeek)
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	SetTask(TASKID_ZMD_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime);
end

-- �����ĸ���Ƿ��ѹ���Ч����
function zmd_check_expire()
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- �ѹ���
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1������ʾ��������
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ��������
		else
			return 0;		-- ����
		end
	end
end

-- ��ȡ��ĸ����Ч����
function zmd_get_expire_date()
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	if (nExpireTime ~= 0) then
		return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
	else
		return "Ch�a kh�i ��ng";
	end
end

function cancel()
end

if (GetProductRegion() == "cn_ib") then
	login_add(zmd_check_expire_timer, 2)
end
