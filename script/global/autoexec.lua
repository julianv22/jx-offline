-- �Զ�����npc�ű�
Include("\\script\\global\\addxishancunnpc.lua")
Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\addtollgatenpc.lua") -- ���عؿ������漰��NPC
Include("\\script\\task\\partner\\partner_head.lua") -- ����ͬ�������漰��NPC
Include("\\script\\missions\\freshman_match\\add_championnpc.lua")
Include("\\script\\event\\mid_autumn\\add_zhongqiunpc.lua")
Include("\\script\\missions\\newcitydefence\\cd_addsignnpc.lua") -- Phong Hoa Lien Thanh
Include("\\script\\misc\\league_cityinfo.lua")
Include("\\script\\missions\\leaguematch\\wlls_autoexec.lua") -- Li�n ��u
Include("\\script\\missions\\statinfo\\head.lua") -- ����ͳ��
Include("\\script\\event\\wulin_2nd\\wulin_addmaster.lua") -- Lien Dau
Include("\\script\\global\\addspreadernpc.lua") -- ��Ϸ�ƹ�Ա
Include("\\script\\missions\\tongwar\\tongwar_autoexec.lua")
Include("\\script\\task\\lv120skill\\head.lua") -- 120����������
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\��ԭ����\\�꾩\\�꾩\\trap\\bianjing_ximen_trap.lua")
Include("\\script\\������\\��ɽ��\\addnpcandtrap.lua") -- Vi Son Dao	
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua"); -- ��������
Include("\\script\\event\\change_destiny\\npc.lua"); -- Than Nong Chan Don
Include("\\script\\missions\\newpracticemap\\addnpc.lua"); -- PHLT
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua"); -- Npc Long Nhi
Include("\\script\\misc\\timeline\\timelinemanager.lua") -- ʱ����
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\global\\vng\\add_npc.lua")
Include("\\script\\global\\huashan2013\\npc_hoason.lua")
-- Include("\\script\\global\\vuhon\\npc_vuhon.lua")
Include("\\script\\global\\autoexec_npc.lua")
Include("\\script\\global\\thinh\\npc\\add_npc.lua")
Include("\\script\\global\\thanh\\npc\\add_npc.lua")
Include("\\script\\global\\gm\\julianv\\npc\\add_npc.lua")
--------------------------------------------------------------------------------------------------------------
Include("\\script\\missions\\maze\\head.lua")
Include("\\script\\missions\\bairenleitai\\head.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
-- Include("\\script\\huashan\\addnpc_hoason.lua")--Npc Phai Hoa Son
-- Include("\\script\\update_feature\\thuonghoi\\add_npc_nvth.lua")--Nhiem Vu Thuong Hoi
-- Include("\\script\\update_feature\\codetanthu\\vlmc_bossdeath.lua")
--------------------------------------------------------------------------------------------------------------
if (GetProductRegion() == "vn") then
    -- 2006 ����ڻͷ�ļ�
    Include("\\script\\event\\mid_autumn06\\autoexe.lua"); -- Chien Tam Ton Gia
    Include("\\script\\global\\judgeoffline_special.lua") -- ���������ȡ����йܷ�������ͼ
    Include("\\script\\event\\collect_juanzhou\\autoaddnpc.lua") -- �ռ����ؾ�������������npc
    Include("\\script\\event\\act2years_yn\\head.lua") -- Խ����������������npc
    Include("\\script\\������\\������\\heisha_autoexec.lua") -- Map Hac Sa Dong
    Include("\\script\\event\\great_night\\great_night_head.lua") -- Qua Huy Hoang
end

MSID_LOCALNEWS = 17 -- ϵͳ�Զ�����LocalNews��ʱ���¼����

Include([[\script\event\springfestival07\head.lua]]);

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\event\\other\\shensuanzi\\class.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")

function main()
    -- Thien Tri Mat Canh
    DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua", "GameFloor1:Start")
    DynamicExecute("\\script\\missions\\tianchimijing\\floor2\\gamefloor2.lua", "GameFloor2:Start")
    DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "GameFloor3:Start")
    DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua", "GameFloor4:Start")
    DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\yunchihead.lua", "AddEnterNpc")
    DynamicExecute("\\script\\changefeature\\initmap.lua", "AddDailogNpc")
    -- Nguyet Ca Dao
    DynamicExecute("\\script\\missions\\yuegedao\\yuegedao\\yuegedaoworld.lua",
        "YueGeDaoWorld:Start")
    DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua",
        "YueGeMiGuWorld:Start")

    DynamicExecute("\\script\\global\\npc\\huoke.lua", "CallHuoKeInit")
    tbShenSuanZi:Init()

    OpenGlbMission(8)

    -- ��������ͳ������
    OpenGlbMission(MSID_STAT_GOODS_SALE)

    buildAllCityInfoLeague()

    -- �һ���ͼ����
    load_mission_aexp();
    add_dialognpc(adddialognpc); -- Npc Chuc Nang
    add_newtasknpc(addnewtasknpc); -- Npc He Thong
    add_dialognpc(nw_npclist)
    add_dialognpc(npclist_sevencity)
    add_xishancunnpc(xishancunnpc);
    add_spreadernpc(spreadernpc); -- ������Ϸ�ƹ�Ա
    add_killertasknpc(addkillertasknpc); -- Npc Sat Thu
    add_alltollgatenpc(); -- ���عؿ���������npc
    -- add_allpartnernpc();     --����ͬ����������npc
    -- add_zhongqiunpc();		--��������npc
    cd_addsignnpc() -- ��������ս��������NPC

    wlls_autoexe() -- Lien Dau
    -- ������NPC    
    add_dialognpc(tbActNpcList)
    tongwar_addsignnpc()
    add_tongnpc() -- ���ذ�����npc
    local n_date = tonumber(GetLocalDate("%Y%m%d"));
    local szRegion = GetProductRegion();

    if (szRegion == "vn") then
        -- add_dialognpc(ACT2YEAR_YN_NPC);	--������NPC   by�ӷ��� 2008-10-09ɾ������NPC
        AnonymVale_auto(); -- �йܵ�ͼ
        add_dialognpc(tab_springfestivalNPC);
        -- add_dialognpc(addmoontown_mulao);	--�ռ����ؾ�������������npc by�ӷ��� 2008-10-09ɾ������NPC
        -- add_dialognpc(tbxmas2007_girl_binger) --2007ʥ���������
        -- add_dialognpc(newyear_2008_chunjiecailu) --2008�����»�
        -- ��ɽ��
        add_dialognpc(tbaddJinShanDao_NpcAndTrap.tbDialogNpc); -- ���ӶԻ�npc
        tbaddJinShanDao_NpcAndTrap:AddTrapR() -- ������trap��
        tbaddJinShanDao_NpcAndTrap:AddTrapL() -- ������trap��
        tbaddJinShanDao_NpcAndTrap:AddMons() -- ���ӹ���
        -- add_obstacle_map();

        if (SubWorldID2Idx(11) >= 0) then
            local npcidx = AddNpc(245, 1, SubWorldID2Idx(11), 390 * 8 * 32, 317 * 16 * 32, 1,
                               "Ho�ng Li�n L�o L�o");
            SetNpcScript(npcidx, "\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");
        end
        add_dialognpc(au06_tab_kidnpc); -- Chien Tam Ton Gia

        tbChangeDestiny:addNpc(); -- �������
        tbNewPracticeMap:addNpc(); -- ��������ͼ
        tbBeatTiger:AddNpc(); -- Npc Long Nhi
    end

    -- �����꾩������trap��
    add_trap_bianjingximen()
    add_heisha_entertrap();

    G_ACTIVITY:LoadActivitys()
    G_TASK:LoadAllConfig()
    G_ACTIVITY:OnMessage("ServerStart");

    tbTimeLineManager:LoadAllTimeLine(tbTimeLineList);
    AutoFunctions:Run()
    add_npc_thinh()
    add_npc_thanh()
    add_npc_hoason()
    add_new_npc_julianv()
    -- add_npc_vuhon()
    local szFile = "\\script\\event\\great_night\\great_night_head.lua"
    DynamicExecute(szFile, "OnGreatNightServerStart")
end

function load_mission_aexp()
    mapTab = { 235, 236, 237, 238, 239, 240, 241 };
    nCount = getn(mapTab);

    oldSubWorld = SubWorld;
    for i = 1, nCount do
        idx = SubWorldID2Idx(mapTab[i]);
        if (idx ~= -1) then
            SubWorld = idx;
            OpenMission(9); -- 9Ϊ�һ�Mission ID
        end
    end

    SubWorld = oldSubWorld;
end

function add_dialognpc( Tab )
    for i = 1, getn(Tab) do
        local itemlist = Tab[i]
        SId = SubWorldID2Idx(itemlist[2]);
        if (SId >= 0) then
            npcindex = AddNpc(itemlist[1], 1, SId, itemlist[3] * 32, itemlist[4] * 32, 1,
                           itemlist[6]);
            SetNpcScript(npcindex, itemlist[5]);
        else
            if itemlist[1] == 1454 then print(itemlist[6], itemlist[2]) end
        end
    end
end

function add_newtasknpc( Tab1 )
    for i = 1, getn(Tab1) do
        Mid = SubWorldID2Idx(Tab1[i][4]);
        if (Mid >= 0) then
            TabValue5 = Tab1[i][5] * 32
            TabValue6 = Tab1[i][6] * 32
            newtasknpcindex = AddNpc(Tab1[i][1], Tab1[i][2], Mid, TabValue5, TabValue6, Tab1[i][7],
                                  Tab1[i][8]);
            SetNpcScript(newtasknpcindex, Tab1[i][10]);
        end
    end
end
