IncludeLib("FILESYS");
IncludeLib("TITLE");
IncludeLib("SETTING");
Include("\\script\\event\\storm\\function.lua") -- Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") -- HUANGZHIZHANG
Include("\\script\\missions\\boss\\bigboss.lua") -- big boss
Include("\\script\\battles\\lang.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua")

Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");

Include("\\script\\battles\\doubleexp.lua")
FRAME2TIME = 18; -- 18 t��ng ���ng 1 gi�y
BAOMING_TIME = 10 -- 10 ph�t th�i gian ��ng k�
FIGHTING_TIME = 30 -- 60 ph�t tr�n chi�n
ANNOUNCE_TIME = 20 -- 20 gi�y c�ng b� t�i chi�n tr�n

BOSS_TIME_MAIN = 15 -- 30 ph�t sau khi b�o danh xu�t hi�n nguy�n so�i
VANISHGAME_TIME_MAIN = 20 -- 20 ph�t cu�i xu�t hi�n nguy�n so�i ti�p theo

TIMER_1 = ANNOUNCE_TIME * FRAME2TIME; -- 20 gi�y c�ng b� t�i chi�n tr�n
TIMER_2 = (FIGHTING_TIME + BAOMING_TIME) * 60 * FRAME2TIME; -- Th�i gian chi�n ��u 1h
RUNGAME_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; -- 10 ph�t sau khi ��ng k�, t� ��ng b��c v�o giai �o�n chi�n ��u
GO_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; -- Th�i gian �p d�ng l� 10 ph�t s� RunMission

SONGJIN_SIGNUP_FEES = 200000 -- Ph� ��ng k�

JUNGONGPAI = 1773 -- ID item 6,1,1477
EXPIRED_TIME = 24 * 60 -- Song and Jin military medals expired
JUNGONGPAI_Task_ID = 1830 -- --Song and Jin military medal task variables

TIME_GAME_LIMIT = 5 * 60 -- Th�i gian � l�i trong tr�i qu� l�u, qu� th�i gian s� out ra NPC b�o danh

-------------------------------------------------- --------The following by Liao Zhishan
TIME_EXHIBIT_BOSS = 18 * 60 * (20 + BAOMING_TIME) / (20 * 18) -- 20 minutes into the competition, that is, 50 minutes after registration starts
-------------------------------------------------
-- BOSSINFO = {BOSSID, BOSSNAME, LEVEL, SERIES}
-----------------------------------------------
BOSSINFO = {
    [1] = { 511, "Tr��ng T�ng Ch�nh", 95, 4 },
    [2] = { 513, "Di�u Nh� ", 95, 2 },
    [3] = { 523, "Li�u Thanh Thanh", 95, 1 },
}
----------------------------------------------------
-- BOSSEXHIBITPOSITION = {MAPID, POSX, POSY, MAPNAME}
----------------------------------------------------
BOSSEXHIBITPOSITION = {
    { 386, 1411, 2691, "C�u ranh gi�i (cao c�p) " },
    { 355, 1391, 2745, "Doanh tr�i (cao c�p) " }, { 352, 1413, 2921, "Th�m l�m (cao c�p) " },
    { 380, 1439, 3335, "Xung phong (Cao c�p) " },
    { 328, 1348, 2853, "Khu v�c b�nh nguy�n (cao c�p) " },
    { 331, 1385, 2796, "Khu v�c H� T�n (cao c�p) " },
    { 346, 1914, 3512, "Th�nh tr�n (cao c�p) " }, { 349, 1367, 2827, "S�n c�c (cao c�p) " },
    { 383, 1855, 2872, "Th�m l�m (cao c�p) " },
}
function ExhibitBoss() -- Xu�t hi�n Boss � chi�n tr��ng cao c�p
    local ExhibitArray_Index = 0;
    local PosArray_Count = getn(BOSSEXHIBITPOSITION);
    for i = 1, PosArray_Count do
        if (BOSSEXHIBITPOSITION[i][1] == SubWorldIdx2ID(SubWorld)) then
            ExhibitArray_Index = i;
            break
        end
    end
    if (0 == ExhibitArray_Index) then -- If it is not an advanced map, BOSS display will be performed
        return
    end
    local BossID_Index = random(1, 3);
    npcindex = AddNpcEx(BOSSINFO[BossID_Index][1], BOSSINFO[BossID_Index][3],
                   BOSSINFO[BossID_Index][4], SubWorld,
                   BOSSEXHIBITPOSITION[ExhibitArray_Index][2] * 32,
                   BOSSEXHIBITPOSITION[ExhibitArray_Index][3] * 32, 1, BOSSINFO[BossID_Index][2], 1);
    SetNpcDeathScript(npcindex, "\\script\\battles\\bossdeath.lua");

    WriteLog(BOSSINFO[BossID_Index][1] .. "," .. BOSSINFO[BossID_Index][3] .. "," ..
                 BOSSINFO[BossID_Index][4] .. "," .. SubWorldIdx2ID(SubWorld) .. "," ..
                 BOSSEXHIBITPOSITION[ExhibitArray_Index][2] .. "," ..
                 BOSSEXHIBITPOSITION[ExhibitArray_Index][3] .. "," .. BOSSINFO[BossID_Index][2]);

    local NewsStr = "Theo b�o c�o c�a th�m t� ti�n tuy�n " .. BOSSINFO[BossID_Index][2] ..
                        " �� xu�t hi�n t�i khu v�c cao c�p!";
    AddGlobalNews(NewsStr);
end
----------------------------------------------------------����by ��־ɽ

PL_TOTALPOINT = 1 -- Task save t�ng �i�m t�ch l�y c�a nh�n v�t
PL_KILLPLAYER = 2 -- Task save BONUS_KILLPLAYER �i�m gi�t player
PL_KILLNPC = 3 -- Task save BONUS_KILLNPC s� npc b� gi�t
PL_BEKILLED = 4 -- Task save s� l��ng b� Player gi�t
PL_SNAPFLAG = 5 -- Task save BONUS_SNAPFLAG �i�m �o�t c�
PL_KILLRANK1 = 6 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=1
PL_KILLRANK2 = 7 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=2
PL_KILLRANK3 = 8 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=3
PL_KILLRANK4 = 9 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=4
PL_KILLRANK5 = 10 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=5
PL_KILLRANK6 = 11 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=6 "nguy�n so�i"
PL_KILLRANK7 = 12 -- Task save BONUS_KILLRANK1 �i�m gi�t qu�i rank=7
PL_MAXSERIESKILL = 13 -- Task save BONUS_MAXSERIESKILL max li�n tr�m
PL_SERIESKILL = 14 -- The player's current number of consecutive kills
PL_FINISHGOAL = 15
PL_1VS1 = 16
PL_GETITEM = 17 -- Task save BONUS_GETITEM  l�m Item chi�n ��u hi�n BXH "L�y b�o v�t"
PL_WINSIDE = 18
PL_PRISEGRADE = 19
PL_AVERAGEGRADE = 20
PL_WINGRADE = 21
PL_PARAM1 = 22 -- Ghi l�i t�a �� X FLAG "�o�t c�"
PL_PARAM2 = 23 -- Ghi l�i t�a �� Y FLAG "�o�t c�"
PL_PARAM3 = 24 -- ���ڼ�¼����
PL_PARAM4 = 25
PL_PARAM5 = 26
PL_CURRANK = 27 -- =PL_PARAM6 = 27 Indicates the player's current official position, currently using parameter No. 6

PL_BATTLEID = 41
PL_RULEID = 42
PL_BATTLECAMP = 43
PL_BATTLESERIES = 44 -- Record the player's last campaign number.
PL_KEYNUMBER = 45
PL_LASTDEATHTIME = 46
PL_BATTLEPOINT = 47 -- Record the player's total points in this battle. The total points is the sum of the points in each battle the player participated in, E(PL_TOTALPOINT1 PL_TOTALPOINT2...)
PL_ROUND = 48

GAME_KEY = 1
GAME_BATTLEID = 2
GAME_RULEID = 3
GAME_MAPID = 4
GAME_CAMP1 = 5 -- The number of flags captured by Song Dynasty (the number of food sent)
GAME_CAMP2 = 6 -- The number of flags captured by the gold side (the number of food sent)
GAME_MAPICONID = 7
GAME_RESTTIME = 8
GAME_LEVEL = 9
GAME_MODE = 10
GAME_CAMP1AREA = 11
GAME_CAMP2AREA = 12
GAME_BATTLESERIES = 13
GAME_ROUND = 14

tbRANKNAME = {
    "<color=white>Binh S�<color>", "<color=0xa0ff>Hi�u �y<color>",
    "<color=0xff>Th�ng L�nh<color>", "<color=yellow>Ph� T��ng<color>",
    "<color=yellow><bclr=red>��i T��ng<bclr><color>", "<color=black>Nguy�n So�i<color>",
}

MS_STATE = 1

MS_TRANK1_S = 30 -- MissionV ID of the template ID of Song level 1 Npc
MS_TRANK1_J = MS_TRANK1_S + 6; -- MissionV ID of the template ID of Jinfang level 1 Npc	36
MS_RANK1LVL_S = MS_TRANK1_J + 6; -- Level 1 Npc of Song Fang MissionV ID		42
MS_RANK1LVL_J = MS_RANK1LVL_S + 6; -- Level 1 Npc of Jinfang MissionV ID	48
MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6; --		54
MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6; --		60
MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 -- Record the number of times Song Fang summoned Npc	--	66
MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 -- Record the number of times Jin Fang summons Npc	67

MS_PL2RANK1_S = 70 -- The current mission, the number of people in Song Dynasty who have become "soldiers"
MS_PL2RANK2_S = 71
MS_PL2RANK3_S = 72
MS_PL2RANK4_S = 73
MS_PL2RANK5_S = 74
MS_PL2RANK6_S = 75

MS_PL2RANK1_J = 76 -- The current mission, the number of people in the Jinfang who have achieved the title of "Soldier"
MS_PL2RANK2_J = 77 -- Colonel
MS_PL2RANK3_J = 78 -- Commander
MS_PL2RANK4_J = 79 -- Lieutenant General
MS_PL2RANK5_J = 80 -- General
MS_PL2RANK6_J = 81 -- Marshal

MS_HUANGZHIZHANG = 90 -- Reward multiplier for Chapter of Glory activity
MS_WUXINGZHUCNT_S = 91 -- Record the number of Five Elements Pillars summoned by Song Fang	68
MS_WUXINGZHUCNT_J = 92 -- Record the number of five-element pillars summoned by Jinfang	69

MAX_CALLNPCCOUNT = 10;
MAX_CALLWUXINGZHU = 4;
GLB_BATTLESTATE = 30
GLB_FORBIDBATTLE = 31; -- When the value is 1, it means to stop the start of the campaign
-- Coordinates of registration points for three levels
S_SIGNUPTAB = {};

TV_LASTDEATHTIME = 2306
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308

function bt_CheckDeathValid()
    local nowW, nowMapX, nowMapY = GetWorldPos();
    if (nowMapX == GetTask(TV_LASTDEATHMAPX) and nowMapY == GetTask(TV_LASTDEATHMAPY)) then
        return 0
    else
        SetTask(TV_LASTDEATHMAPX, nowMapX)
        SetTask(TV_LASTDEATHMAPY, nowMapY)
        return 1
    end

    --		local nowTime = GetCurServerTime()
    --	if (nowTime < GetTask(TV_LASTDEATHTIME)) then
    --	SetTask(TV_LASTDEATHTIME, nowTime)
    -- return 1
    -- end

    -- if (nowtime - GetTask(TV_LASTDEATHTIME) < MAX_CHECKDEATHTIME) then
    -- return 0
    -- else
    --			SetTask(TV_LASTDEATHTIME, nowTime)
    --	end
end

function bt_CheckLifeMax()
    if (GetLife(0) < GetLife(1)) then
        Msg2Player("Xin h�y h�i ph�c ��y �� sinh l�c, sau ��y h�y ra ��i Doanh!");
        return 0
    end
    return 1
end

BONUS_KILLPLAYER = 7500
BONUS_SNAPFLAG = 6000
BONUS_KILLNPC = 250
BONUS_KILLRANK1 = 500
BONUS_KILLRANK2 = 1000
BONUS_KILLRANK3 = 1500
BONUS_KILLRANK4 = 2500
BONUS_KILLRANK5 = 5000
BONUS_KILLRANK6 = 10000
BONUS_KILLRANK7 = 50000
BONUS_MAXSERIESKILL = 150
BONUS_GETITEM = 250
BONUS_1VS1 = 4000

RA_KILL_PL_RANK = { 10, 2.334, 0.934, 0.84, 0.56, 0.35 }
-- 7 player soldiers	--7/3 Player Captain	--14/15 Player leadership	--21/25 Player Lieutenant	--14/25 Player General	--7/20 Player Marshal

RANK_PKBONUS = {
    { 1, 6 / 5, 7 / 5, 8 / 5, 2 }, { 4 / 5, 1, 6 / 5, 7 / 5, 8 / 5 },
    { 3 / 5, 4 / 5, 1, 6 / 5, 7 / 5 }, { 2 / 5, 3 / 5, 4 / 5, 1, 6 / 5 },
    { 1 / 5, 2 / 5, 3 / 5, 4 / 5, 1 },
};

TAB_SERIESKILL = -- Record the table of actual consecutive kills for players of different ranks during PK. 1 means record, 0 means not record.
{ { 1, 1, 1, 1, 1 }, { 1, 1, 1, 1, 1 }, { 1, 1, 1, 1, 1 }, { 0, 1, 1, 1, 1 }, { 0, 0, 1, 1, 1 } };

BALANCE_MAMCOUNT = 5; -- The number difference between Song and Jin Dynasties is adjusted to 5 people
BALANCE_GUOZHAN_MAXCOUNT = 5; -- The maximum number of people allowed on one side in the National War between Song and Jin Dynasties
TAB_RANKBONUS = { 0, 1000, 3000, 6000, 10000 };
RANK_SKILL = 661;
TAB_RANKMSG = {
    "B�n ���c phong l� <color=white>Binh S�<color>!",
    "B�n ���c phong l� <color=0xff>Hi�u �y<color>! Sinh l�c t�ng20%",
    "B�n ���c phong l� <color=0xff>Th�ng L�nh<color>! Sinh l�c t�ng 30%, ph�ng th� t�ng 5%",
    "B�n ���c phong l� <color=yellow>Ph� T��ng<color>! Sinh l�c t�ng 40%, ph�ng th� t�ng 10% ",
    "B�n ���c phong l� <color=yellow><bclr=red>��i T��ng<bclr><color>! Sinh l�c t�ng 50%, ph�ng th� t�ng 15%.",
    "B�n ���c phong l� <color=yellow>Nguy�n So�i<color=>!",
}

TITLE_BONUSRANK1 = 0 -- the points required to become the corresponding title
TITLE_BONUSRANK2 = 10000
TITLE_BONUSRANK3 = 20000
TITLE_BONUSRANK4 = 40000
TITLE_BONUSRANK5 = 60000
TITLE_BONUSRANK6 = 80000

TITLE_PL2RANK1_N = 400 -- the maximum number of players with the corresponding title
TITLE_PL2RANK2_N = 60
TITLE_PL2RANK3_N = 25
TITLE_PL2RANK4_N = 10
TITLE_PL2RANK5_N = 5
TITLE_PL2RANK6_N = 1

TV_SERIESKILL_REALY = 2305 -- The player's current actual consecutive kill value (high-level kills of lower-level players will count consecutive kills, but not the real consecutive kills)

tbGAME_SIGNMAP = { 323, 324, 325 } -- Record the map ID number of the registration points of each level, and the levels are arranged from low to high
tbSIGNMAP_POS = { { 1541, 3178 }, { 1570, 3085 } }
szGAME_GAMELEVEL = {
    "Chi�n tr��ng S� c�p", "Chi�n tr��ng Trung c�p", "Chi�n tr��ng Cao c�p",
}

tbBATTLEMAP = {
    44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355,
    357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375,
    376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 868, 869, 870, 876, 877, 878, 879, 880,
    881, 883, 884, 885, 898, 899, 900, 902, 903, 904, 970, 971,
}; -- List of maps used in all campaigns
tbNPCPOS = { "npcpos1", "npcpos2" }
TNPC_DOCTOR1 = 55; -- ID NPC b�n thu�c
TNPC_DOCTOR2 = 49;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
TNPC_DEPOSIT = 625;

TNPC_FLAG0 = 626; -- ID NPC c�
TNPC_FLAG1 = 628;
TNPC_FLAG2 = 627;

TNPC_TRANSPORT1 = 55; -- The NPC template ID number of the teleporter
TNPC_TRANSPORT2 = 49;

tbTNPC_SOLDIER = { { 631, 632, 633, 634, 635, 636 }, { 637, 638, 639, 640, 641, 642 } }
BATTLES_WINGAME_POINT = 1200; -- �������e�֪���
BATTLES_LOSEGAME_POINT = 600; -- ʧ�����e�֪���
BATTLES_TIEGAME_POINT = 900; -- ƽ���p���e�֪���

-- According to the ID of the registered map, obtain the corresponding campaign level
function bt_map2battlelevel( mapid )
    for i = 1, getn(tbGAME_SIGNMAP) do if (mapid == tbGAME_SIGNMAP[i]) then return i end end
    return 0
end

function bt_camp_getbonus( camp, bonus, strmsg, percent )
    local OldPlayerIndex = PlayerIndex
    idx = 0;
    for i = 1, 500 do
        idx, pidx = GetNextPlayer(MISSIONID, idx, camp);
        if (pidx > 0) then
            PlayerIndex = pidx;
            local n_bonus = bt_addtotalpoint(bonus)
            Msg2Player(strmsg .. n_bonus .. "<color> �i�m t�ch l�y) ")
            Say("��t n�y b�n nh�n ���c <color=yellow>" .. n_bonus ..
                    "<color> �i�m t�ch l�y", 0)
        end
        if (idx <= 0) then break end
    end
    PlayerIndex = OldPlayerIndex
end

-- Obtain the coordinates of a certain level registration point
function bt_getsignpos( camp )
    if (camp <= 0 or camp > 2) then camp = 1 end

    level = GetLevel();

    if (level < 80) then
        return tbGAME_SIGNMAP[1], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
    elseif (level < 120) then
        return tbGAME_SIGNMAP[2], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
    else
        return tbGAME_SIGNMAP[3], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
    end
end

-- Based on the coordinate collection table of the trapfile file, generate all trap points and associate them with the script of scriptfile
function bt_addtrap( trapfile, scriptfile )
    local count = GetTabFileHeight(trapfile);
    scriptid = FileName2Id(scriptfile);

    ID = SubWorldIdx2ID(SubWorld);

    for i = 1, count - 1 do
        x = GetTabFileData(trapfile, i + 1, 1);
        y = GetTabFileData(trapfile, i + 1, 2);
        AddMapTrap(ID, x, y, scriptfile);
    end
end

-- "123,234" -> 123, 234, convert coordinate data written in a string into two numerical variables
function bt_str2xydata( str )
    m = strfind(str, ",")
    x = tonumber(strsub(str, 0, m - 1))
    y = tonumber(strsub(str, m + 1))
    return x, y
end

-- Get a random coordinate from the coordinate file
function bt_getadata( file )
    local totalcount = GetTabFileHeight(file) - 1;
    id = random(totalcount);
    x = GetTabFileData(file, id + 1, 1);
    y = GetTabFileData(file, id + 1, 2);
    return x, y
end

-- Based on the coordinate collection table of the npcfile file, generate all dialogue npcs with the npc template number tnpcid, and associate the script of the scriptfile
function bt_adddiagnpc( npcfile, scriptfile, tnpcid, name )
    addcount = 0;
    local count = GetTabFileHeight(npcfile);

    for i = 1, count - 1 do
        x = GetTabFileData(npcfile, i + 1, 1);
        y = GetTabFileData(npcfile, i + 1, 2);
        if (name ~= nil or name ~= "") then
            npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)
        else
            npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
        end

        if (npcidx > 0) then
            SetNpcScript(npcidx, scriptfile)
            addcount = addcount + 1
        else
            print("battle" .. BT_GetGameData(GAME_BATTLEID) ..
                      "error!can not add dialog npc !tnpcid:" .. tnpcid .. " [" ..
                      SubWorldIdx2ID(SubWorld) .. "," .. x .. "," .. y);
        end
    end
    return addcount
end
function bt_add_a_diagnpc( scriptfile, tnpcid, x, y, name )
    if (name ~= nil or name ~= "") then
        npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name);
    else
        npcidx = AddNpc(tnpcid, 1, SubWorld, x, y)
    end

    if (npcidx > 0) then
        SetNpcScript(npcidx, scriptfile)
    else
        print(
            "battle" .. BT_GetGameData(GAME_BATTLEID) .. "error!can not add dialog npc !tnpcid:" ..
                tnpcid .. " [" .. SubWorldIdx2ID(SubWorld) .. "," .. x .. "," .. y);
    end
    return npcidx
end

-- Based on the coordinate collection table of the npcfile file, generate all combat type NPCs with the NPC template number tnpcid
function bt_addfightnpc( npcfile, tnpcid, level, camp, removewhendeath, name, boss )
    addcount = 0;
    local count = GetTabFileHeight(npcfile) - 1;

    l_removedeath = 1;
    l_name = "";
    l_boss = 0;

    if (removewhendeath ~= nil) then l_removedeath = removewhendeath end

    if (name ~= nil or name ~= "") then l_name = name end

    if (boss ~= nil) then l_boss = boss end

    for i = 1, count do
        x = GetTabFileData(npcfile, i + 1, 1);
        y = GetTabFileData(npcfile, i + 1, 2);
        npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
        if (npcidx > 0) then
            SetNpcCurCamp(npcidx, camp)
            addcount = addcount + 1
        else
            print("battle" .. BT_GetGameData(GAME_BATTLEID) ..
                      "error!can not add fight npc !tnpcid:" .. tnpcid .. " [" ..
                      SubWorldIdx2ID(SubWorld) .. "," .. x .. "," .. y);
        end
    end
    return addcount
end

-- According to the coordinate collection table of the npcfile file, randomly generate a combat type NPC with the NPC template number tnpcid.
function bt_addrandfightnpc(npcfile, tnpcid, level, camp, count, deathscript, removewhendeath, name,
                            boss )
    addcount = 0;

    if (count <= 0) then return end

    local totalcount = GetTabFileHeight(npcfile) - 1;
    if (totalcount <= 0) then return end

    l_removedeath = 1;
    l_name = "";
    l_boss = 0;

    if (removewhendeath ~= nil) then l_removedeath = removewhendeath end

    if (name ~= nil or name ~= "") then l_name = name end

    if (boss ~= nil) then l_boss = boss end

    for i = 1, count do
        id = random(totalcount)
        x = GetTabFileData(npcfile, id + 1, 1);
        y = GetTabFileData(npcfile, id + 1, 2);
        npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
        if (npcidx > 0) then
            SetNpcCurCamp(npcidx, camp)
            SetNpcDeathScript(npcidx, deathscript)
            addcount = addcount + 1
        else
            print("battle" .. BT_GetGameData(GAME_BATTLEID) ..
                      "error!can not add fight npc !tnpcid:" .. tnpcid .. " [" ..
                      SubWorldIdx2ID(SubWorld) .. "," .. x .. "," .. y);
        end
    end
    return addcount
end

function delnpcsafe( nNpcIndex )
    if (nNpcIndex <= 0) then return end

    PIdx = NpcIdx2PIdx(nNpcIndex);
    if (PIdx > 0) then
        WriteLog("L�i!!! DelNpc mu�n x�a b� m�t gamer ");
        return
    end

    DelNpc(nNpcIndex)
end

-------------------------------------------------------------------------
-- Camp indicates which party is in charge of the dialogue, 1 is Song, 2 is Jin Fang
-- If equal to 1, it means that you have already signed up for this battle and belong to this camp.
-- If equal to 2, it means that you have signed up for this battle, but do not belong to this camp.
-- If equal to 0, it means that you have not registered yet.

function bt_checklastbattle( Camp )

    local MKey = BT_GetGameData(GAME_KEY); -- The unique Key code of the current campaign
    local BattleId = BT_GetGameData(GAME_BATTLEID); -- The ID of the campaign type
    local RuleId = BT_GetGameData(GAME_RULEID);

    if (MKey == BT_GetData(PL_KEYNUMBER) and BattleId == BT_GetData(PL_BATTLEID) and
        BT_GetData(PL_ROUND) == BT_GetGameData(GAME_ROUND)) then
        if (Camp == BT_GetData(PL_BATTLECAMP)) then
            return 1
        else
            return 2
        end
    else
        return 0
    end

end
-------------------------------------------------------------------------
function bt_setnormaltask2type()
    -- 701 is already occupied, so change to 751
    BT_SetType2Task(1, 751)
    for i = 2, 50 do BT_SetType2Task(i, 700 + i); end
end
--------------------------------------------------------------------------
-- Split the string according to the delimiter and return an array composed of each segment.
-- Example 1: strsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- Example 2: strsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
    local arySlice = {};
    local nSliceCount = 0;
    local nStartIdx, nEndIdx;
    while (1) do
        nStartIdx, nEndIdx = strfind(strText, strSeparator, 1, 1);
        if (nStartIdx == nil) then break end
        if (nStartIdx > 1) then
            nSliceCount = nSliceCount + 1;
            arySlice[nSliceCount] = strsub(strText, 1, nStartIdx - 1);
        end
        strText = strsub(strText, nEndIdx + 1);
    end
    if (strlen(strText) > 0) then arySlice[nSliceCount + 1] = strText; end
    return arySlice;
end
--------------------------------------------------------------------------------
function getNpcInfo( strNpcInfo )
    local arystrInfo = strsplit(strNpcInfo, ",");
    return tonumber(arystrInfo[1]), tonumber(arystrInfo[2]), tonumber(arystrInfo[3]);
end
---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function sf_callnpc( usedtime, totaltime )
    if (usedtime > totaltime) then return end
    local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
    s_area = BT_GetGameData(GAME_CAMP1AREA);
    j_area = BT_GetGameData(GAME_CAMP2AREA);
    for i = 2, 6 do
        if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
            prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
            npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
            nowadd = npccount - prenpccount;
            if (nowadd > 0) then
                print("call song npc count= " .. nowadd .. "rank=" .. i)
                npcfile = GetIniFileData(mapfile, "Area_" .. s_area, tbNPCPOS[random(2)]);
                bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1),
                    GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
                if (i == 6) then
                    Msg2MSAll(MISSIONID,
                        "Phong V�n Lu�n Ki�m b�o c�o: Nguy�n So�i qu�n T�ng �� xu�t hi�n!");
                end
            end
        end
    end

    for i = 2, 6 do
        if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
            prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
            npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
            nowadd = npccount - prenpccount
            if (nowadd > 0) then
                print("call jing npc count= " .. nowadd .. "rank=" .. i)
                npcfile = GetIniFileData(mapfile, "Area_" .. j_area, tbNPCPOS[random(2)]);
                bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1),
                    GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
                if (i == 6) then
                    Msg2MSAll(MISSIONID,
                        "Phong V�n Lu�n Ki�m b�o c�o: Nguy�n So�i qu�n Kim �� xu�t hi�n!");
                end
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------
function test_callnpc( count, time )
    t = 0;

    for i = 1, time do
        last = floor((i - 1) / time * count)
        now = floor(i / time * count)
        c = now - last
        t = t + c
        print(c)
    end

    print("total:" .. t)
end
------------------------------------------------------------------------------------------------------------
function sf_buildfightnpcdata()
    local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
    s_area = BT_GetGameData(GAME_CAMP1AREA);
    j_area = BT_GetGameData(GAME_CAMP2AREA);

    for i = 1, 6 do
        str = BT_GetBattleParam(i);
        tnpcid, level, count = getNpcInfo(str);
        SetMissionV(MS_TRANK1_S + i - 1, tnpcid);
        SetMissionV(MS_RANK1LVL_S + i - 1, level);
        SetMissionV(MS_NPCCOUNT1_S + i - 1, count)
    end

    for i = 1, 6 do
        str = BT_GetBattleParam(i + 6);
        tnpcid, level, count = getNpcInfo(str);
        SetMissionV(MS_TRANK1_J + i - 1, tnpcid);
        SetMissionV(MS_RANK1LVL_J + i - 1, level);
        SetMissionV(MS_NPCCOUNT1_J + i - 1, count)
    end

    --At the beginning, the soldiers all appeared at once��������Song
    npcfile = GetIniFileData(mapfile, "Area_" .. s_area, tbNPCPOS[2]);
    bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1,
        GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)

    --The soldiers all appear at the beginning��������Gold
    npcfile = GetIniFileData(mapfile, "Area_" .. j_area, tbNPCPOS[2]);
    bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J), GetMissionV(MS_RANK1LVL_J), 2,
        GetMissionV(MS_NPCCOUNT1_J), tabFILE_NPCDEATH[1], 0)

end
------------------------------------------------------------------------------------------
function GetIniFileData( mapfile, sect, key )
    if (IniFile_Load(mapfile, mapfile) == 0) then
        print("Load IniFile Error!" .. mapfile)
        return ""
    else
        return IniFile_GetData(mapfile, sect, key)
    end
end

function GetTabFileHeight( mapfile )
    if (TabFile_Load(mapfile, mapfile) == 0) then
        print("Load TabFileError!" .. mapfile);
        return 0
    end
    return TabFile_GetRowCount(mapfile)
end

function GetTabFileData( mapfile, row, col )
    if (TabFile_Load(mapfile, mapfile) == 0) then
        print("Load TabFile Error!" .. mapfile)
        return 0
    else
        return tonumber(TabFile_GetCell(mapfile, row, col))
    end
end

function bt_addtotalpoint( point )
    if (point == 0) then return end

    local nWeekDay = tonumber(GetLocalDate("%w"));
    if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
        point = BigBoss:AddSongJinPoint(point);
        point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
        point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
    else
        local nHour = tonumber(GetLocalDate("%H%M"))
        -- DinhHQ
        -- 20110406: kh�ng k�ch ho�t hi�u �ng x2 x3 �i�m khi s� d�ng m�t n�  trong TK  Thi�n t� 
        if (nHour < 2045 or nHour >= 2250) then
            point = BigBoss:AddSongJinPoint(point);
            point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
            point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
        end
    end
    -- ����ս��Ӣ�����
    --	local nHour = tonumber(GetLocalDate("%H"));
    --	if nWeekDay ~=1 and nHour ~= 21 then
    --		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
    --	end

    -- tinhpn 20100706: Vo Lam Minh Chu
    local nHour = tonumber(date("%H%M"))
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if (GetTask(TSK_Get2ExpTK) == nDate) then
        if (nHour >= 2100 and nHour <= 2300) then
            if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then point = point * 2 end
        end
    end

    -- tinhpn 20100804: IPBonus
    local nDay = tonumber(date("%w"))
    if nDay == 0 or nDay == 5 or nDay == 6 then
        if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then point = floor(point * 1.5) end
    end
    point = Songjin_checkdoubleexp(point)

    -- Points check
    if BT_GetData(PL_BATTLEPOINT) > 1000000 then

        local szName = GetName(); -- character name
        local nGameLevel = BT_GetGameData(GAME_LEVEL); --Song and Jin level
        local nSubWorldID = SubWorldIdx2ID(); -- Map ID

        local nAddPoint = point; -- Points added this time
        local nTotalPoint = BT_GetData(PL_TOTALPOINT); -- Points for this game
        local nBattlePoint = BT_GetData(PL_BATTLEPOINT); --Character points
        local nKillPlayer = BT_GetData(PL_KILLPLAYER); --Number of murders

        WriteLog(format(
                     "Warning[Too Much Battle Point] %s in Level_%d Battle(%d) want to add %d Ponit. Now Total Point is %d, Battle Point is %d, Kill %d Players!",
                     szName, nGameLevel, nSubWorldID, nAddPoint, nTotalPoint, nBattlePoint,
                     nKillPlayer));
    end

    BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
    BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)

    bt_JudgePLAddTitle()
    -- Storm �ӻ���
    storm_addpoint(1, point)
    return point
end

function bt_assignrank(camp) -- This function is no longer valid
    camptab = {}
    -- Clear current official position data
    for tt = 70, 81 do SetMissionV(tt, 0) end

    idx = 0
    pidx = 0

    count = 1
    for i = 1, 500 do
        idx, pidx = GetNextPlayer(MISSIONID, idx, camp);

        if (pidx > 0) then
            camptab[count] = pidx;
            count = count + 1
        end
        if (idx == 0) then break end
    end

    for tj = 1, getn(camptab) do

        nTopData = 0
        nTopPlayer = 0;
        nTopIndex = 0
        for i = 1, getn(camptab) do
            if (camptab[i] ~= 0) then
                PlayerIndex = camptab[i];
                if (BT_GetData(PL_BATTLEPOINT) >= nTopData) then
                    nTopPlayer = PlayerIndex
                    nTopData = BT_GetData(PL_BATTLEPOINT)
                    nTopIndex = i
                end
            end
        end

        if (nTopData > 0) then
            PlayerIndex = nTopPlayer
            camptab[nTopIndex] = 0;
            if (camp == 1) then
                JudgePLAddTitle()
            else
                JudgePLAddTitle()
            end
        end
    end
end
--------------------------Calculate the integral coefficient and reset the integral----------------- -----------------------
function ResetBonus()
    CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
    CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
    AVRCUN = (CAMP1CUN + CAMP2CUN) / 2

    if (AVRCUN == 0) then
        bonuscff1 = 1
        bonuscff2 = 1
    else
        -- ********************Edit �i�m t�ng kim khi ko c� ng��i phe kia*******************
        if (CAMP1CUN == 0 and CAMP2CUN ~= 0) then
            bonuscff1 = 1
            bonuscff2 = 1
        elseif (CAMP1CUN ~= 0 and CAMP2CUN == 0) then
            bonuscff1 = 1
            bonuscff2 = 1
        else
            bonuscff1 = 1 - (CAMP1CUN - AVRCUN) / AVRCUN
            bonuscff2 = 1 - (CAMP2CUN - AVRCUN) / AVRCUN
        end
    end

    -- ��ս�ν����˫��ƽ��
    if BT_GetGameData(GAME_BATTLEID) == 2 then
        bonuscff1 = 1
        bonuscff2 = 1
    end

    -- ����������ڻ�֮�»�У���������
    bonuscff1 = bonuscff1 * bt_getgn_awardtimes()
    bonuscff2 = bonuscff2 * bt_getgn_awardtimes()

    BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER * bonuscff1))
    BT_SetTypeBonus(PL_SNAPFLAG, 1, floor(BONUS_SNAPFLAG * bonuscff1))
    BT_SetTypeBonus(PL_KILLNPC, 1, floor(BONUS_KILLNPC * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK1, 1, floor(BONUS_KILLRANK1 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK2, 1, floor(BONUS_KILLRANK2 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK3, 1, floor(BONUS_KILLRANK3 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK4, 1, floor(BONUS_KILLRANK4 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK5, 1, floor(BONUS_KILLRANK5 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK6, 1, floor(BONUS_KILLRANK6 * bonuscff1))
    BT_SetTypeBonus(PL_KILLRANK7, 1, floor(BONUS_KILLRANK7 * bonuscff1))
    BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL * bonuscff1))
    BT_SetTypeBonus(PL_GETITEM, 1, floor(BONUS_GETITEM * bonuscff1))
    BT_SetTypeBonus(PL_1VS1, 1, floor(BONUS_1VS1 * bonuscff1))

    BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER * bonuscff2))
    BT_SetTypeBonus(PL_SNAPFLAG, 2, floor(BONUS_SNAPFLAG * bonuscff2))
    BT_SetTypeBonus(PL_KILLNPC, 2, floor(BONUS_KILLNPC * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK1, 2, floor(BONUS_KILLRANK1 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK2, 2, floor(BONUS_KILLRANK2 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK3, 2, floor(BONUS_KILLRANK3 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK4, 2, floor(BONUS_KILLRANK4 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK5, 2, floor(BONUS_KILLRANK5 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK6, 2, floor(BONUS_KILLRANK6 * bonuscff2))
    BT_SetTypeBonus(PL_KILLRANK7, 2, floor(BONUS_KILLRANK7 * bonuscff2))
    BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL * bonuscff2))
    BT_SetTypeBonus(PL_GETITEM, 2, floor(BONUS_GETITEM * bonuscff2))
    BT_SetTypeBonus(PL_1VS1, 2, floor(BONUS_1VS1 * bonuscff2))
end
------------------------------------------------------------------------------------

---------------------����ս��ʱ���������Ӧͷ�� BEGIN------------------------------------------
function bt_JudgePLAddTitle()
    -- ��õ�ǰ��Rank��������ִﵽ����һ��Rank��Ҫ��ֵ�������Ҹ�Rank,���Rankֵ�Ѿ��ﵽ�����򲻼�
    local nCurRank = BT_GetData(PL_CURRANK)
    if (nCurRank >= getn(TAB_RANKBONUS)) then return end
    if (BT_GetData(PL_TOTALPOINT) < TAB_RANKBONUS[nCurRank + 1]) then return end
    local nRankCount = getn(TAB_RANKBONUS)
    for i = 1, getn(TAB_RANKBONUS) do
        if (BT_GetData(PL_TOTALPOINT) >= TAB_RANKBONUS[nRankCount - i + 1]) then
            bt_RankEffect(nRankCount - i + 1)
            return
        end
    end
end

-- ����ͷ��
function bt_RankEffect( rank )
    if (rank == 0) then rank = 1 end
    local campnum = 89
    if (GetCurCamp() == 2) then campnum = campnum + 5 end
    Title_AddTitle(campnum + rank - 1, 0, 9999999)
    Title_ActiveTitle(campnum + rank - 1)
    AddSkillState(RANK_SKILL, rank - 1, 0, 999999);
    Msg2Player(TAB_RANKMSG[rank]);
    BT_SetData(PL_CURRANK, rank);
end

-------------------------����ս��ʱ���������Ӧͷ�� ENDING----------------------------------

function bt_autoselectmaparea( mapfile, areacount ) -- ���ѡ�񳡵��У�˫�����ڵ���Ӫ��
    local s_area = 0
    local j_area = 0
    local areatmp = random(areacount);
    local wwt = tonumber(GetIniFileData(mapfile, "Area_" .. areatmp, "camparea"))
    if (wwt == 0 or wwt == 1) then
        s_area = areatmp
        while (j_area == 0) do
            areatmp = random(areacount)
            if (areatmp ~= s_area) then
                wwt1 = tonumber(GetIniFileData(mapfile, "Area_" .. areatmp, "camparea"))
                if (wwt1 == 0 or wwt1 == 2) then j_area = areatmp end
            end
        end
    else
        j_area = areatmp
        while (s_area == 0) do
            areatmp = random(areacount)
            if (areatmp ~= j_area) then
                wwt1 = tonumber(GetIniFileData(mapfile, "Area_" .. areatmp, "camparea"))
                if (wwt1 == 0 or wwt1 == 1) then s_area = areatmp end
            end
        end
    end
    return s_area, j_area
end

function bt_exchangeexp( level, mark )
    if (level < 40) then return 0 end
    local base_exp = ((700 + floor((level - 40) / 5) * 100) * 60 * 7 / 3000); -- 1�����ֵ�Ļ�������ֵ
    local bonus = floor(mark * base_exp)

    -- �ν���� By �������� 09/07/27
    if (level >= 120) then bonus = floor(bonus * 2.5 * 2) end

    return bonus
end
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec( nSec )
    nRestMin = floor(nSec / 60);
    nRestSec = mod(nSec, 60)
    return nRestMin, nRestSec;
end

function bt_pop2signmap() -- ����������ں�Ӫͣ��5���ӣ��ڶ���ģʽ����Ԫ˧ģʽ��ɱ¾ģʽ��Ϊ2���ӻὫ��Ҷ���ս�������Բ�������
    local oldPlayerIndex = PlayerIndex
    local tbPlayer = {}
    local count = 0

    local idx = 0;
    for i = 1, 500 do
        idx, pidx = GetNextPlayer(MISSIONID, idx, 0);
        if (pidx > 0) then
            PlayerIndex = pidx
            if (GetFightState() == 0 and
                ((GetGameTime() - BT_GetData(PL_LASTDEATHTIME)) >= TIME_GAME_LIMIT)) then
                count = count + 1
                tbPlayer[count] = pidx
            end
        end
        if (idx <= 0) then break end
    end

    local game_level = BT_GetGameData(GAME_LEVEL);
    if (count > 0) then
        for i = 1, count do
            PlayerIndex = tbPlayer[i]
            local l_curcamp = GetCurCamp();

            SetTaskTemp(200, 0);
            SetLogoutRV(0);
            SetCreateTeam(1);
            SetDeathScript("");
            SetFightState(0) -- �����̺��Ϊ��ս��״̬��by Dan_Deng��
            SetPunish(1)
            ForbidChangePK(0);
            SetPKFlag(0)
            Msg2Player(
                "Th�i gian l�u l�i trong Doanh tr�i �� v��t qu� 5 ph�t, b�n b� ��y ra chi�n tuy�n")
            if (l_curcamp == 1) then
                SetRevPos(tbGAME_SIGNMAP[game_level], 1)
                NewWorld(bt_getsignpos(1))
            else
                SetRevPos(tbGAME_SIGNMAP[game_level], 2)
                NewWorld(bt_getsignpos(2))
            end

            local camp = GetCamp();
            SetCurCamp(camp);

        end
    end

    PlayerIndex = oldPlayerIndex
end

function bt_getgn_awardtimes()
    local nWeekDay = tonumber(GetLocalDate("%w"))
    if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
        local nHour = tonumber(GetLocalDate("%H%M"))
        -- DinhHQ
        -- 20110409: kh�ng k�ch ho�t hi�u �ng x4 �i�m t�ch l�y c�a TK Thi�n T� trong c�c gi� TK th��ng
        if (nHour >= 2045 and nHour < 2250) then return 4 end
    end
    if (GetMissionV(MS_HUANGZHIZHANG) == 0 or GetMissionV(MS_HAUNGZHIZHANG) == 1) then
        return 1
    else
        return GetMissionV(MS_HUANGZHIZHANG)
    end
end

function check_pl_level( pl_level )
    if (GetLevel() >= 40 and GetLevel() < 80) then return 1 end
    if (GetLevel() >= 80 and GetLevel() < 120) then return 2 end
    if (GetLevel() >= 120) then return 3 end
end

---�¼���Start
-- �ν������������У����߼��ν�
-- ÿ����������ʱ����ʱս�����е����κͻ��֣�
--	����ս��ͳ�ƣ�LEAGUERESULT���������гɼ����򣬱���ǰ10��
--	�������а񣨷������а�10250����������
-- ��������23ʱ����ս������Ľ����ǰ5�������������а�10239���У����콱
-- ͬʱ�����ս��ͳ�ƣ�LEAGUERESULT���еĳɼ�
-- 2545
LG_SONGJINHONOUR = 535;
LG_TSK_HONOURPOINT = 1;
LG_TSK_TOTALPOINT = 2;
LG_TSK_SECT = 3; -- ����
LG_TSK_GENDER = 4; -- �Ա�
function bt_sortbthonour()
    -- ���ν��
    local tbCurPlayer = {};
    for i = 1, 10 do
        local szname, npoint, nsect, ngender = BT_GetTopTenInfo(i, PL_TOTALPOINT);
        if (szname ~= nil) then
            tbCurPlayer[getn(tbCurPlayer) + 1] = { szname, (11 - i), npoint, nsect, ngender };
        end
    end

    if (tbCurPlayer == {}) then
        print("Battle Have No Player JoinIN!! SO , not do bt_sortbthonour!");
        return 0;
    end

    bt_reportworldresult(tbCurPlayer); -- �����������ɼ��������磨���з�������

    local tbNewPlayer = {};
    local nlg_idx = LG_GetFirstLeague(LG_SONGJINHONOUR);
    while (nlg_idx ~= nil and nlg_idx ~= 0) do
        local szlgname = LG_GetLeagueInfo(nlg_idx);
        local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
        local npoint = LG_GetLeagueTask(nlg_idx, LG_TSK_TOTALPOINT);
        local nsect = LG_GetLeagueTask(nlg_idx, LG_TSK_SECT);
        local ngender = LG_GetLeagueTask(nlg_idx, LG_TSK_GENDER);
        tbNewPlayer[getn(tbNewPlayer) + 1] = { szlgname, nhonour, npoint, nsect, ngender };
        nlg_idx = LG_GetNextLeague(LG_SONGJINHONOUR, nlg_idx);
    end

    local nnewcount = getn(tbNewPlayer);
    for i = 1, getn(tbCurPlayer) do
        local bP = 0;
        for k = 1, nnewcount do
            if (tbCurPlayer[i][1] == tbNewPlayer[k][1]) then
                tbNewPlayer[k][2] = tbCurPlayer[i][2] + tbNewPlayer[k][2];
                tbNewPlayer[k][3] = tbCurPlayer[i][3] + tbNewPlayer[k][3];
                tbNewPlayer[k][4] = tbCurPlayer[i][4];
                tbNewPlayer[k][5] = tbCurPlayer[i][5];
                bP = 1;
                break
            end
        end
        if (bP == 0) then tbNewPlayer[getn(tbNewPlayer) + 1] = tbCurPlayer[i]; end
    end

    -- ���뵽֮ǰ�Ľ��
    for i = 1, getn(tbCurPlayer) do
        local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, tbCurPlayer[i][1]);
        if (nlg_idx == nil or nlg_idx == 0) then -- ���û���򴴽������ٴ�����
            if (bt_createleague(tbCurPlayer[i][1]) == 1) then -- �����ɹ�
                LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT,
                    tbCurPlayer[i][2]);
                LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT,
                    tbCurPlayer[i][3]);
                LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_SECT,
                    tbCurPlayer[i][4]);
                LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_GENDER,
                    tbCurPlayer[i][5]);
            end
        else -- ������ھ��ۼ�
            LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT,
                tbCurPlayer[i][2]);
            LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT,
                tbCurPlayer[i][3]);
        end
    end

    Ladder_ClearLadder(10250); -- ������

    if (getn(tbNewPlayer) >= 1) then
        sort(tbNewPlayer, bt_sortmaxhonour);
        for i = 1, 10 do -- ��д����
            if (tbNewPlayer[i]) then
                Ladder_NewLadder(10250, tbNewPlayer[i][1], tbNewPlayer[i][2], 0, tbNewPlayer[i][4],
                    tbNewPlayer[i][5]);
            end
        end
    end
end

function bt_sortmaxhonour( tb1, tb2 )
    if (tb1[2] ~= tb2[2]) then
        return tb1[2] > tb2[2];
    else
        return tb1[3] > tb2[3];
    end
end

function bt_createleague( szlgname )
    local nNewLeagueID = LG_CreateLeagueObj() -- �����������ݶ���(���ض���ID)
    LG_SetLeagueInfo(nNewLeagueID, LG_SONGJINHONOUR, szlgname) -- ����������Ϣ(���͡�����)
    local ret = LG_ApplyAddLeague(nNewLeagueID, "", "")
    LG_FreeLeagueObj(nNewLeagueID)
    return ret
end

function bt_reportworldresult( tbPlayer )
    local ncount = getn(tbPlayer);
    if (ncount <= 0) then
        return 0;
    else
        if (ncount > 3) then ncount = 3; end

        local szParam = "Phong V�n Lu�n Ki�m cao c�p �� k�t th�c, Top" .. ncount ..
                            " g�m: <enter>";
        for i = 1, ncount do
            if (tbPlayer[i][1]) then
                szParam = format("%s   X�p h�ng %d <color=green>%s<color>  %d<enter>", szParam, i,
                              safeshow(tbPlayer[i][1]), tbPlayer[i][3]);
            end
        end
        LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld",
            szParam, "", "")
    end
end
---�¼���End

-- by zero 2007-7-30 ���ػ���ƽ����� �Σ���
function bonus_rate()
    CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
    CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
    AVRCUN = (CAMP1CUN + CAMP2CUN) / 2

    if (AVRCUN == 0) then
        bonuscff1 = 1
        bonuscff2 = 1
    else
        bonuscff1 = 1 - (CAMP1CUN - AVRCUN) / AVRCUN
        bonuscff2 = 1 - (CAMP2CUN - AVRCUN) / AVRCUN
    end
    return bonuscff1, bonuscff2
end

function mar_addmissionpoint( totalpoint, nCurCamp )
    if (totalpoint == 0) then return end
    local nWeekDay = tonumber(GetLocalDate("%w"));
    -- tinhpn 20100706: Vo Lam Minh Chu
    local nHour = tonumber(date("%H%M"))
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if (GetTask(TSK_Get2ExpTK) == nDate) then
        if (nHour >= 2100 and nHour <= 2300) then
            if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
                totalpoint = totalpoint * 2
            end
        end
    end

    -- tinhpn 20100804: IPBonus
    local nDay = tonumber(date("%w"))
    if nDay == 0 or nDay == 5 or nDay == 6 then
        if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then totalpoint = floor(totalpoint * 1.5) end
    end

    if (not nCurCamp) then
        nCurCamp = GetCurCamp();
    elseif (nCurCamp ~= 1 and nCurCamp ~= 2) then
        return
    end

    if (nCurCamp == 1) then
        SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S) + totalpoint)
    else
        SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J) + totalpoint)
    end
end

-- ʵʱ��ʾս���ĸ���������Ϣ by �������� 09/07/27
function bt_announce( lsf_level, n_time )

    -- ÿ10����(30��*���20��)����һ����Ϣ
    if (mod(n_time, 30) ~= 0) then return end

    -- ���߼�ս��������Ϣ
    if (lsf_level ~= 3) then return end

    local old_player = PlayerIndex;

    local nStrLen_Total = 31;
    local nStrLen_Sort_Title = 5;
    local nStrLen_Name_Title = 5;
    local nStrLen_Camp_Title = 10;
    local nStrLen_Score_Title = 11;
    local nStrLen_Sort_Text = 3;
    local nStrLen_Name_Text = 16;
    local nStrLen_Camp_Text = 6;
    local nStrLen_Score_Text = 6;

    -- ��ն����
    tbPlayer = {};
    battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
    Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("Top li�n tr�m", nStrLen_Total));
    Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("STT", nStrLen_Sort_Title) ..
        strfill_center("T�n", nStrLen_Name_Title) ..
        strfill_center("Phe ph�i", nStrLen_Camp_Title) ..
        strfill_center("Li�n tr�m", nStrLen_Score_Title));
    for i = 1, 5 do
        if tbPlayer[i] and tbPlayer[i] > 0 then
            PlayerIndex = tbPlayer[i];
            local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
            local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
            if (szname and szname ~= "") then
                Msg2MSAll(MISSIONID,
                    strfill_center(tostring(i), nStrLen_Sort_Text) ..
                        strfill_center(szname, nStrLen_Name_Text) ..
                        strfill_center(szCamp, nStrLen_Camp_Text) ..
                        strfill_center(tostring(npoint), nStrLen_Score_Text));
            end
        end
    end

    -- PK�������
    tbPlayer = {};
    battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
    Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("TOP PK", nStrLen_Total));
    Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("STT", nStrLen_Sort_Title) ..
        strfill_center("T�n", nStrLen_Name_Title) ..
        strfill_center("Phe ph�i", nStrLen_Camp_Title) .. strfill_center("PK", nStrLen_Score_Title));
    for i = 1, 5 do
        if tbPlayer[i] and tbPlayer[i] > 0 then
            PlayerIndex = tbPlayer[i];
            local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
            local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
            if (szname and szname ~= "") then
                Msg2MSAll(MISSIONID,
                    strfill_center(tostring(i), nStrLen_Sort_Text) ..
                        strfill_center(szname, nStrLen_Name_Text) ..
                        strfill_center(szCamp, nStrLen_Camp_Text) ..
                        strfill_center(tostring(npoint), nStrLen_Score_Text));
            end
        end
    end

    -- ��ɱNPC���� ��Ԫ˧����ģʽ
    if (MISSIONID == 16) then
        tbPlayer = {};
        battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
        Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("TOP NPC", nStrLen_Total));
        Msg2MSAll(MISSIONID, "<color=green>" .. strfill_center("STT", nStrLen_Sort_Title) ..
            strfill_center("T�n", nStrLen_Name_Title) ..
            strfill_center("Phe ph�i", nStrLen_Camp_Title) ..
            strfill_center("NPC", nStrLen_Score_Title));
        for i = 1, 5 do
            if tbPlayer[i] and tbPlayer[i] > 0 then
                PlayerIndex = tbPlayer[i];
                local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
                local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "V�ng (T)" or "T�m (K)";
                if (szname and szname ~= "") then
                    Msg2MSAll(MISSIONID,
                        strfill_center(tostring(i), nStrLen_Sort_Text) ..
                            strfill_center(szname, nStrLen_Name_Text) ..
                            strfill_center(szCamp, nStrLen_Camp_Text) ..
                            strfill_center(tostring(npoint), nStrLen_Score_Text));
                end
            end
        end
    end

    PlayerIndex = old_player;
end
