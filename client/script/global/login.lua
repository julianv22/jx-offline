Include("\\script\\global\\login_head.lua")
-- ��¼�ű�
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) ����Զ����¼��ܹ���
-- Update: FanZai �����µĻ��ƣ�ֻ��ȥ��Include�Ϳ���ʵ�ֹ��ܿ���

-- һ��ֻ���޸ģ����/ɾ���������Include�ļ���
-- �����ļ���ִ��һ��login_add(fun, n_time)���ɣ����Ӳμ�"\\script\\missions\\leaguematch\\wlls_login.lua"��
-- ================================================================
-- Include("\\script\\global\\login_old.lua") -- �ɵ�Login�ű�������������
Include("\\script\\missions\\leaguematch\\wlls_login.lua") -- WLLS��������
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua") -- if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\global\\login_hint.lua") -- ��½���ʾ
-- ================================================================
Include("\\script\\worldrank\\vngglobalvar.lua")
Include("\\script\\worldrank\\vngtop10.lua")
Include("\\script\\worldrank\\xephang.lua")
-- ================================================================
Include("\\script\\activitysys\\g_activity.lua")

if (GetProductRegion() ~= "vn") then
    Include("\\script\\global\\chuangong_login.lua")
    Include("\\script\\task\\lv120skill\\head.lua") -- 120����������

    -- LLG_ALLINONE_TODO_20070802 ��ȷ��
    -- Include("\\script\\battles\\battle_login.lua")	--�ν�������������ʾ
end

if (GetProductRegion() == "cn_ib") then
    -- Include("\\script\\misc\\spreader\\emigration.lua")
    -- Include("\\script\\misc\\lost_item\\takelostitem.lua")
    -- Include([[\script\item\ib\tishenzhiren.lua]])	-- ����ֽ��
    Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua"); -- ��֮����
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

-- tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")

-- tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\global\\gm\\gm_script.lua") -- GM
Include("\\script\\global\\gm\\ex_lib_function.lua")
function main( bExchangeIn )
    -- ================================================================
    XepHang()
    tbTop10:LuuDSNhanVat()
    -- ================================================================
    -- tinhpn 20110223:Reset pass ruong
    ResetBox:AnnounceResetBoxDate()
    -- Kick ng��i ch�i b?kh�a
    DynamicExecute("\\script\\global\\gm\\gm_script.lua", "tbAloneScript:GameServerKickOut",
        PlayerIndex);
    -- B�ng x�p h�ng TOP 10
    -- Rankings();
    tbAloneScript:GMLoginInGame();

    -- DisabledStall(1); -- c�m ng�i b�n

    -- if (GetLevel() >= 60) then--x�a skill h?tr?t�n th?
    --	if (GetSkillState(1995) > 0) then
    --		RemoveSkillState(1995)
    --	end
    -- end
    -------------------
    if HaveCommonItem(6, 1, 1266) < 1 then
        tbAwardTemplet:GiveAwardByList({
            {
                szName = "",
                tbProp = { 6, 1, 1266, 1, 0 },
                nCount = 1,
             },
        }, "Th�n H�nh Ph�", 1);
    end
    if HaveCommonItem(6, 1, 438) < 1 then
        tbAwardTemplet:GiveAwardByList({
            {
                szName = "",
                tbProp = { 6, 1, 438, 1, 0 },
                nCount = 1,
             },
        }, "Th� ��a ph� (s� d�ng v� h�n)", 1);
    end
    -- if HaveCommonItem(6, 1, 5122) < 1 then
    --     tbAwardTemplet:GiveAwardByList({{
    --         szName = "",
    --         tbProp = {6, 1, 5122, 1, 0},
    --         nCount = 1
    --     }}, "L�nh b�i nh�n v�t", 1);
    -- end
    -- if HaveCommonItem(6, 1, 5123) < 1 then
    --     tbAwardTemplet:GiveAwardByList({{
    --         szName = "",
    --         tbProp = {6, 1, 5123, 1, 0},
    --         nCount = 1
    --     }}, "L�nh b�i Qu�n L� Server", 1);
    -- end
    -- if HaveCommonItem(6, 1, 5124) < 1 then
    --     tbAwardTemplet:GiveAwardByList({{
    --         szName = "",
    --         tbProp = {6, 1, 5124, 1, 0},
    --         nCount = 1
    --     }}, "L�nh b�i GM", 1);
    -- end
    if HaveCommonItem(6, 1, 5128) < 1 then
        tbAwardTemplet:GiveAwardByList({
            {
                szName = "",
                tbProp = { 6, 1, 5128, 1, 0 },
                nCount = 1,
             },
        }, "C�m nang AIO", 1);
    end
    ------------------
    if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
        Msg2Player("�ang trong th�i gian ho�t ��ng Online Nh�n Th��ng")
        OnlineAward_ResetDaily()
        OnlineAward_SummaryOnlineTime()
        OnlineAward_StartTime()
    end

    PlayerList:AddPlayer(PlayerIndex)
    -- ����ȫ��login�ű�
    if (TB_LOGIN_FUN[0]) then
        for i = 1, getn(TB_LOGIN_FUN[0]) do
            local func = TB_LOGIN_FUN[0][i]
            if (func) then func(bExchangeIn) end
        end
    end
    -- DonSachRuong()

    G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)

    for i = 1, getn(TB_LOGIN_FILEFUN) do
        local reg = TB_LOGIN_FILEFUN[i]
        DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
    end
    EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
    TaskManager:ResetUseGroup()
    LoginDelaySync(1) -- 1 ��ʾ��Ҫ��ʱͬ������, 0 ��ʾ����Ҫ
    -- �����ڴ˺�����ֱ������߼��������װ�ɺ�����ͨ��login_add���õ�TB_LOGIN_FUN[0]������
end

function DonSachRuong()
    Say(" d�n!")
    local tbItems = {}
    tbItems = GetRoomItems(0);
    if (getn(tbItems) > 0) then
        for i = 1, getn(tbItems) do RemoveItemByIndex(tbItems[i], -1); end
    end
end
-------------------------------------------
--  ���ܣ���¼ʱ����ʱͬ��һЩ��Ӱ��ϵͳ���е����ݵ��ͻ��ˣ����ٵ�¼�ķѵ�ʱ��
--  Ŀǰ��ʱʱ��Ϊ2��(����ִ��main_delaysync�ļ��������)
--- ������nStep ��ʾ��ǰ�ǵڼ���ͬ��
-- ���أ�0 - ��ʾͬ��δ������ϵͳ�ڱ��ε�����ɺ��Ի��ٴε��� main_delaysync
--		 1 - ��ʾ����ͬ������
function main_delaysync( nStep )
    local nDelayCount = EventSys:GetType("OnLogin"):GetDelayCount()

    if nStep >= 1 and nStep <= nDelayCount then
        EventSys:GetType("OnLogin"):OnPlayerEvent(nStep, PlayerIndex, bExchangeIn)
    end

    if (nStep >= 1 and nStep <= getn(TB_LOGIN_FUN)) then
        if (TB_LOGIN_FUN[nStep]) then
            for i = 1, getn(TB_LOGIN_FUN[nStep]) do
                if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
            end
        end
    end

    -- ���е�nStep����ʱͬ�������к���

    if (nStep < getn(TB_LOGIN_FUN) or nStep < nDelayCount) then
        return 0
    else
        return 1
    end
end
function no() if chuangong_login ~= nil then chuangong_login() end end
