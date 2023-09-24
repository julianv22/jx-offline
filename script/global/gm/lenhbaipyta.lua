IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER");
IncludeLib("TONG");
IncludeLib("LEAGUE");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\global\\fuyuan.lua");
Include("\\script\\global\\translife.lua");
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
Include("\\script\\global\\gm\\lib_data_table.lua");
Include("\\script\\global\\gm\\lib_data_table_filelua.lua");
Include("\\script\\lib\\remoteexc.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\lib\\log.lua");
Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\dailogsys\\g_dialog.lua");
Include("\\script\\activitysys\\functionlib.lua");
Include("\\script\\activitysys\\npcdailog.lua");
Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua"); -- t?y t?y, c?ng di?m nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua"); -- lÊy trang bÞ
Include("\\script\\global\\gm\\functions_points.lua"); -- lÊy c¸c lo¹i ®iÓm
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua"); -- lÊy item hoµng kim, b¹ch kim
Include("\\script\\global\\thinh\\hotro\\functions_partner.lua"); -- b¹n ®ång hµnh
-- Include("\\script\\global\\thinh\\hotro\\npccongfullskill.lua") -- céng Skill
-- Include("\\script\\global\\gm\\julianv\\vukhi_bachkim.lua") -- vò khi b¹ch kim

TITLEDIALOG = "Tªn nh©n vËt : <color=green>%s<color>\n" .. "Tªn tµi kho¶n: <color=green>%s<color>\n" ..
                  "Täa ®é       : <color=green>%d, %d/%d<color>"

function main()
    dofile("script/global/gm/lenhbaipyta.lua")
    local strFaction = GetFaction()
    local nW, nX, nY = GetWorldPos();
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY), "Shop/#Sale(142)",
                   "NhËn Point/CacLoaiDiem", "TiÒm n¨ng - Kü n¨ng/status_dialog",
                   "Trang bÞ - VËt phÈm/laytrangbivatpham", "Boss Hoµng Kim/bosshk1",
                   "B¹n §ång hµnh/functions_for_partner", "Danh hiÖu KiÕm ThÕ/chondanhhieu",
                   "§æi mµu PK/trangthai", "Söa lçi ThÇn Hµnh Phï/fixthanhanhphu", "Vøt tÊt c¶/vutall",
                   "Hñy vËt phÈm/DisposeItem", "Tho¸t/no"};
    CreateTaskSay(tbSay)
    return 1;
end

function status_dialog()
    local szTitle = "Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn sö dông chøc n¨ng g×?"
    local tbSay = {"TiÒm n¨ng/#chose_reset_type(1)", "Kü n¨ng/#chose_reset_type(2)",
                   "Thªm - Xãa Skill theo ID/LaySkillID", "Trë l¹i/main", "Tho¸t/no"};
    Say(szTitle, getn(tbSay), tbSay)
end
----------------------------LÊy Trang BÞ - VËt PhÈm-----------------------
function vutall()
    -- RemoveItemByIndex(5122)
    ThrowAllItem()
    AddItem(6, 1, 5122, 0, 0, 0)
    AddItem(6, 1, 5124, 0, 0, 0)
end
function laytrangbivatpham()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP), "LÊy §å TÝm/CreateItemPurple",
                   "LÊy Full Ngùa/layngua", "LÊy Phi Phong/layphiphong",
                   "Vò khÝ B¹ch Kim M«n ph¸i/getVKBK_diaglog",
                   "LÊy Set §å Hoµng Kim, B¹ch Kim/chose_type_goldquip",
                   "N©ng CÊp §å B¹ch Kim/nangcacpbachkim", "LÊy ITEM MagicScript/LayItem",
                   "LÊy ITEM Questkey/LayQuestkey", "LÊy §å Hoµng Kim (Goldequip)/LayGoldequip", "Trë l¹i/main",
                   "Tho¸t/no"}
    CreateTaskSay(tbSay)
    return 1;
end
--------------------- LÊy phi phong-------------------------
function layphiphong()
    for i = 3465, 3490 do
        AddGoldItem(0, i)
    end
end
------------------------------------------N©ng cÊp ®å B¹ch Kim -----------------------------------
function nangcacpbachkim()
    local szTitle = " Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn sö dông chøc n¨ng g×?"
    local tbOpt = {"N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 0/make_bachkim",
                   "N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 10/make_bachkim_max",
                   "N©ng cÊp trang bÞ B¹ch Kim tõng cÊp/up_bachkim", "Trë l¹i/main", "Tho¸t/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
    GiveItemUI("T¹o trang bÞ B¹ch Kim", "N©ng cÊp trang bÞ Hoµng kim thµnh B¹ch kim", "do_upgoldeq_process", 1);
end
function do_upgoldeq_process()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
    GiveItemUI("T¹o trang bÞ B¹ch Kim", "N©ng cÊp trang bÞ B¹ch kim Max (+10)", "do_upgoldeq_max", 1);
end
function do_upgoldeq_max()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
    for i = 1, 10 do
        UpgradePlatinaItem(GetGiveItemUnit(1))
    end
end

function up_bachkim()
    GiveItemUI("N©ng cÊp trang bÞ B¹ch kim", "Bá vµo trang bÞ B¹ch kim", "upgrade_bachkim_process", 1);
end

function upgrade_bachkim_process()
    UpgradePlatinaItem(GetGiveItemUnit(1))
end
-----------------------------LÊy Ngùa------------------
function layngua()
    local tbSay = {"§¹i hiÖp muèn lÊy ngùa nµo?"}
    local nName = tbNameResHorse
    local nNum = getn(nName)
    for i = 1, nNum do
        local nHorse = tbNameResHorse[i].szName
        -- local nHorse = nName[num].szName
        tinsert(tbSay, "" .. nHorse .. "/layngua1")
    end
    tinsert(tbSay, "Tho¸t/no")
    CreateTaskSay(tbSay)
end
function layngua1(num, page)
    local tbSay = {"§¹i hiÖp muèn lÊy ngùa nµo?"}
    local nTable = tbNameResHorse[num + 1].szEquip
    local nCount = getn(nTable)
    if page == nill then
        if nCount > 10 then
            for i = 1, 10 do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, 1))
            tinsert(tbSay, "Tho¸t/no")
        end
        if nCount <= 10 then
            for i = 1, nNum do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, "Tho¸t/no")
        end
    end
    if page ~= nil and page >= 0 then
        local nPage = page
        local nNum = nCount - nPage * 10
        if nNum > 10 then
            for i = nPage * 10 + 1, nPage * 10 + 10 do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            if page ~= 0 then
                tinsert(tbSay, format("Trang tr­íc/#layngua1(%d,%d)", num, page - 1))
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho¸t/no")
            end
            if page == 0 then
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho¸t/no")
            end
        end
        if nNum <= 10 then
            for i = nPage * 10 + 1, nCount do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang tr­íc/#layngua1(%d,%d)", num, page - 1))
            tinsert(tbSay, "Tho¸t/no")
        end
    end
    CreateTaskSay(tbSay)
end
function addngua(id, level)
    local nid = id
    local nlevel = level
    AddItem(0, 10, id, level, 0, 0, 0)
end
----------------------------NhËn Danh HiÖu KiÕm ThÕ-----------------------
function chondanhhieu()
    local szTitle = "Xin chµo <color=yellow>" .. GetName() .. "<color> , xin mêi chän Danh HiÖu...!!!"
    local tbOpt = {{"Uy ChÊn Cöu Ch©u.", nhandanhhieu, {5001}}, {"Vâ L©m ChÝ T«n.", nhandanhhieu, {5002}},
                   {"NhÊt KiÕm Phong Thiªn.", nhandanhhieu, {5003}}, {"NhÊt L­u Cao Thñ.", nhandanhhieu, {5004}},
                   {"HiÖp Kh¸ch Cuèi Cïng Trªn Giang Hå.", nhandanhhieu, {5005}}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nhandanhhieu(nIndex)
    Title_AddTitle(nIndex, 1, 4302359);
    Title_ActiveTitle(nIndex);
    SetTask(1122, nIndex);
end
--------------------LÊy Skill theo ID-------------------
function LaySkillID()
    local szTitle = "Xin chµo  <color=red>" .. GetName() .. "<color>, b¹n muèn nhËn hay xãa skill nµo?"
    local tbOpt = {{"Thªm Skill", g_AskClientStringEx, {"69,20", 0, 256, "ID Skill", {AddSkill, {self}}}},
                   {"Xãa Skill", g_AskClientStringEx, {"69", 0, 300, "ID Skill", {DelSkill, {self}}}},
                   {"Thªm Danh S¸ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {AddDSSkill, {self}}}},
                   {"Xãa Danh S¸ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {DelDSSkill, {self}}}},
                   {"Trë l¹i", status_dialog}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        AddMagic(i, 20)
    end
end

function DelDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        DelMagic(i)
    end
end

function AddSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local id = tonumber(tbPos[1])
    local cap = tonumber(tbPos[2])
    AddMagic(id, cap)
end

function DelSkill(szPos)
    local idskill = tonumber(szPos)
    DelMagic(idskill)
end
----------------------LÊy ITEM--------------------------------
function LayQuestkey(num)
    if num == 7 or num == nil then
        g_AskClientNumberEx(1, 2000, "Questkey ID", {LayQuestkey})
    else
        local nItemIdx = AddEventItem(num)
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(nItemIdx))
    end
end

function LayItem()
    g_AskClientStringEx("6,1,125,0,0,0", 1, 9000, "NhËp Vµo Item Code:", {TaoItemID})
end

function TaoItemID(szItem)
    local szICode = lib:Split(szItem, ",");
    local n = getn(szICode);
    if (n ~= 1) then
        if (n < 6) then
            Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>", n));
            return
        end
        if (n > 7) then
            Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>", n));
            return
        end
        local itclass = tonumber(szICode[1]);
        local ittype = tonumber(szICode[2]);
        local itid = tonumber(szICode[3]);
        local itlv = tonumber(szICode[4]);
        local itseri = tonumber(szICode[5]);
        local itluck = tonumber(szICode[6]);
        local itmagic = tonumber(szICode[7]);
        if (itlv < 0) then
            Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>", itlv));
            return
        end
        -- if (itlv > 10) then Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>",itlv)); return end
        if (itmagic == nil) then
            itmagic = 0;
        end
        AddItem(itclass, ittype, itid, itlv, itseri, itluck, itmagic);
    else
        local EquipId = tonumber(szICode[1]);
        AddGoldItem(0, EquipId);
    end
end

-------------LÊy §å HK------------------------------------------------------------------
function LayGoldequip()
    g_AskClientStringEx("1", 0, 256, "ID GoldItem", {AddDSGold})
end

function AddDSGold(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    AddGoldItem(0, s)
end
-------------------------------LÊy §å TÝm MaxOPt-------------------------------------------
function CreateItemPurple()
    g_AskClientStringEx("0,0,0,10,0,1,2,3,4,5,6", 0, 256, "Item Param", {AddPurple})
end

function AddPurple(szPos)
    local tbPos = lib:Split(szPos, ",")
    local Genre = tonumber(tbPos[1])
    local Detail = tonumber(tbPos[2])
    local Particular = tonumber(tbPos[3])
    local Level = tonumber(tbPos[4])
    local Series = tonumber(tbPos[5])
    local Prop1 = tonumber(tbPos[6])
    local Prop2 = tonumber(tbPos[7])
    local Prop3 = tonumber(tbPos[8])
    local Prop4 = tonumber(tbPos[9])
    local Prop5 = tonumber(tbPos[10])
    local Prop6 = tonumber(tbPos[11])
    -- AddItemEx(4,seed,2,Genre,Detail,Particular,Level,Series,0,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
    AddQualityItem(2, Genre, Detail, Particular, Level, Series, 0, Prop1, Prop2, Prop3, Prop4, Prop5, Prop6)
end
----------------------Hñy vËt phÈm----------------------------
function DisposeItem()
    GiveItemUI("Hñy vËt phÈm",
        "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!",
        "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local strItem = GetItemName(nItemIndex)
        RemoveItemByIndex(nItemIndex)
        -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
    end
    Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
    Talk(1, "", "Thao t¸c thµnh c«ng, xin kiÓm tra l¹i!");
end
--------------------------------------------------------------
--			 		Söa ThÇn Hµnh Phï						--
--------------------------------------------------------------
function fixthanhanhphu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña Quý nh©n sÜ ®· trë vÒ ban ®Çu!")
end
--------------------------------------------------------------
--			 		Thay §æi Tr¹ng Th¸i						--
--------------------------------------------------------------
function trangthai()
    local szTitle = "§¹i hiÖp muèn ®æi sang tr¹ng th¸i nµo?"
    local tbOpt = {"LuyÖn C«ng (Tr¾ng)/#set_trangthai(0)", "ChÝnh Ph¸i (Vµng)/#set_trangthai(1)",
                   "Tµ Ph¸i (TÝm)/#set_trangthai(2)", "Trung LËp (Xanh)/#set_trangthai(3)",
                   "S¸t Thñ (§á)/#set_trangthai(4)", "Trë l¹i/main", "Tho¸t/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
function set_trangthai(nTrangthai)
    SetCurCamp(nTrangthai)
    SetCamp(nTrangthai)
end
--------------------------------------------------------------
--			 			Boss Hoµng Kim						--
--------------------------------------------------------------
function bosshk1()
    local strFaction = GetFaction()
    local nW, nX, nY = GetWorldPos();
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY), "Gäi Boss Hoµng Kim/Auto_TestBoss",
                   "T×m Boss Hoµng Kim/timbosshk", "Trë l¹i/main", "KÕt thóc ®èi tho¹i/no"};
    CreateTaskSay(tbSay)
    return 1;
end
---------------Gäi Boss HK------------------------
----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS = { -- tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
    [1] = {
        szName = "TÞnh Th«ng",
        nBossId = 1355,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "Ng¹o Thiªn T­íng Qu©n",
        nBossId = 1356,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "LiÔu Thanh Thanh",
        nBossId = 523,
        nRate = 322,
        nSeries = 1,
        nLevel = 95
    },
    [4] = {
        szName = "T©y V­¬ng Tµ §éc",
        nBossId = 1358,
        nRate = 322,
        nSeries = 1,
        nLevel = 95
    },
    [5] = {
        szName = "DiÖu Nh­",
        nBossId = 513,
        nRate = 322,
        nSeries = 2,
        nLevel = 95
    },
    [6] = {
        szName = "Do·n Thanh V©n",
        nBossId = 1360,
        nRate = 322,
        nSeries = 2,
        nLevel = 95
    },
    [7] = {
        szName = "H¾c Y S¸t Thñ",
        nBossId = 1361,
        nRate = 322,
        nSeries = 3,
        nLevel = 95
    },
    [8] = {
        szName = "ThËp Ph­¬ng C©u DiÖt",
        nBossId = 1362,
        nRate = 322,
        nSeries = 3,
        nLevel = 95
    },
    [9] = {
        szName = "Tr­¬ng T«ng ChÝnh",
        nBossId = 511,
        nRate = 322,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "Thanh Y Tö",
        nBossId = 1364,
        nRate = 322,
        nSeries = 4,
        nLevel = 95
    }
}

TBBOSS2 = { -- tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
    [1] = {
        szName = "Cæ B¸ch",
        nBossId = 566,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "V­¬ng T¸",
        nBossId = 739,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "HuyÒn Gi¸c §¹i S­",
        nBossId = 740,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [4] = {
        szName = "HuyÒn Nan §¹i S­",
        nBossId = 1365,
        nRate = 342,
        nSeries = 0,
        nLevel = 95
    },
    [5] = {
        szName = "§­êng BÊt NhiÔm",
        nBossId = 741,
        nRate = 336,
        nSeries = 1,
        nLevel = 95
    },
    [6] = {
        szName = "§­êng Phi YÕn",
        nBossId = 1366,
        nRate = 342,
        nSeries = 1,
        nLevel = 95
    },
    [7] = {
        szName = "B¹ch Doanh Doanh",
        nBossId = 742,
        nRate = 336,
        nSeries = 1,
        nLevel = 95
    },
    [8] = {
        szName = "Lam Y Y",
        nBossId = 582,
        nRate = 336,
        nSeries = 1,
        nLevel = 95
    },
    [9] = {
        szName = "Thanh TuyÖt S­ Th¸i",
        nBossId = 743,
        nRate = 341,
        nSeries = 2,
        nLevel = 95
    },
    [10] = {
        szName = "Hµ Linh Phiªu",
        nBossId = 568,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    },
    [11] = {
        szName = "Chung Linh Tó",
        nBossId = 567,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    }
}

TBBOSS22 = { -- tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
    [1] = {
        szName = "Yªn HiÓu Tr¸i",
        nBossId = 744,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    },
    [2] = {
        szName = "Hµ Nh©n Ng·",
        nBossId = 745,
        nRate = 321,
        nSeries = 3,
        nLevel = 95
    },
    [3] = {
        szName = "M¹nh Th­¬ng L­¬ng",
        nBossId = 583,
        nRate = 321,
        nSeries = 3,
        nLevel = 95
    },
    [4] = {
        szName = "§o¹n Méc DuÖ",
        nBossId = 565,
        nRate = 227,
        nSeries = 3,
        nLevel = 95
    },
    [5] = {
        szName = "Gia LuËt TÞ Ly",
        nBossId = 563,
        nRate = 227,
        nSeries = 3,
        nLevel = 95
    },
    [6] = {
        szName = "Hµn M«ng",
        nBossId = 748,
        nRate = 341,
        nSeries = 3,
        nLevel = 95
    },
    [7] = {
        szName = "§¬n Tö Nam",
        nBossId = 746,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    },
    [8] = {
        szName = "§¹o Thanh Ch©n Nh©n",
        nBossId = 562,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    },
    [9] = {
        szName = "Tõ §¹i Nh¹c",
        nBossId = 1367,
        nRate = 342,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "Thanh Liªn Tö",
        nBossId = 1368,
        nRate = 875,
        nSeries = 4,
        nLevel = 95
    },
    [11] = {
        szName = "TuyÒn C¬ Tö",
        nBossId = 747,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    }
}

TBBOSSCAONHAN = { -- tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
    [1] = {
        szName = "ThiÕu L©m Hé Tù Vâ T¨ng",
        nBossId = 1194,
        nRate = 300,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "Thiªn V­¬ng TrÊn Bang Hé VÖ",
        nBossId = 1193,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [3] = {
        szName = "D­¬ng Gia Trang HiÖp Kh¸ch",
        nBossId = 1195,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [4] = {
        szName = "Ngò §éc V« S¾c La S¸t",
        nBossId = 1196,
        nRate = 300,
        nSeries = 1,
        nLevel = 95
    },
    [5] = {
        szName = "Nga Mi Kim §Ønh S­ Th¸i",
        nBossId = 1197,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [6] = {
        szName = "Thóy Yªn M«n V« ¶nh S¸t Thñ",
        nBossId = 1198,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [7] = {
        szName = "C¸i Bang Tiªu Dao ThÇn C¸i",
        nBossId = 1199,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [8] = {
        szName = "Thiªn NhÉn Hé Gi¸o Th¸nh Sø",
        nBossId = 1200,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [9] = {
        szName = "Vâ §ang Th¸i Êt Ch©n Qu©n",
        nBossId = 1201,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "C«n L«n Hé Ph¸i Thiªn Qu©n",
        nBossId = 1202,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [11] = {
        szName = "Hoa S¬n §éc C« KiÕm Tiªn",
        nBossId = 1231,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    }
}

TBBOSSCAOCAP = { -- tªn boss,id boss, tû lÖ r¬i ®å,series boss,nLevel
    [1] = {
        szName = "Mé Dung Toµn",
        nBossId = 1875,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [2] = {
        szName = "Kim ThÝ L­îng",
        nBossId = 1874,
        nRate = 300,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "Tr­¬ng Tuyªn",
        nBossId = 1873,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    }
}

function Auto_TestBoss()
    tb = {"<color=red>" .. GetName() .. "<color> b¹n muèn th¶ boss nµo?"}
    for k = 1, getn(TBBOSS) do
        tinsert(tb, format("%s/#PickBoss(%d)", TBBOSS[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss2");
    tinsert(tb, "Tho¸t/no");
    CreateTaskSay(tb)
end
function Auto_TestBoss2()
    tb = {"<color=red>" .. GetName() .. "<color> b¹n muèn th¶ boss nµo?"}
    for k = 1, getn(TBBOSS2) do
        tinsert(tb, format("%s/#PickBoss2(%d)", TBBOSS2[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss22");
    tinsert(tb, "Tho¸t/no");
    CreateTaskSay(tb)
end
function Auto_TestBoss22()
    tb = {"<color=red>" .. GetName() .. "<color> b¹n muèn th¶ boss nµo?"}
    for k = 1, getn(TBBOSS22) do
        tinsert(tb, format("%s/#PickBoss22(%d)", TBBOSS22[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss3");
    tinsert(tb, "Tho¸t/no");
    CreateTaskSay(tb)
end

function Auto_TestBoss3()
    tb = {"<color=red>" .. GetName() .. "<color> b¹n muèn th¶ boss nµo?"}
    for k = 1, getn(TBBOSSCAONHAN) do
        tinsert(tb, format("%s/#PickBoss3(%d)", TBBOSSCAONHAN[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss4");
    tinsert(tb, "Tho¸t/no");
    CreateTaskSay(tb)
end

function Auto_TestBoss4()
    tb = {"<color=red>" .. GetName() .. "<color> b¹n muèn th¶ boss nµo?"}
    for k = 1, getn(TBBOSSCAOCAP) do
        tinsert(tb, format("%s/#PickBoss4(%d)", TBBOSSCAOCAP[k].szName, k));
    end
    tinsert(tb, "Tho¸t/no");
    CreateTaskSay(tb)
end

function PickBoss(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local item = TBBOSS[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bosstieu.lua")
    SetNpcParam(index, 1, item.nBossId); -- l­u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss2(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local item = TBBOSS2[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l­u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss22(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local item = TBBOSS22[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l­u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss3(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local item = TBBOSSCAONHAN[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\misc\\boss\\callbossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l­u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
function PickBoss4(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local item = TBBOSSCAOCAP[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcParam(index, 1, item.nBossId); -- l­u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
-------------------------T×m Boss HK-----------------------------------------
tbMapGoldBoss = {{"Cæ B¸ch", "Phï Dung ®éng", 202, "S¬n B¶o ®éng", 76, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"HuyÒn Gi¸c §¹i S­", "Nh¹n Th¹ch ®éng", 10, "Thanh khª ®éng", 198, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"§­êng Phi YÕn", "Phong L¨ng ®é", 336, "Kho¶ Lang ®éng", 75, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Lam Y Y", "Vò L¨ng ®éng", 199, "Phi Thiªn ®éng", 204, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c", 322, "V« Danh ®éng", 203, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1", 225, "Sa M¹c s¬n  ®éng 3", 227, "T­¬ng D­¬ng",
                  78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"M¹nh Th­¬ng L­¬ng", "Sa m¹c ®Þa biÓu", 224, "Sa M¹c s¬n  ®éng 2", 226,
                  "T­¬ng D­¬ng", 78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh",
                  37, "§¹i Lý", 162, "L©m An", 176},
                 {"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng", 181, "D­¬ng Trung ®éng", 205, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"§¹o Thanh Ch©n Nh©n", "Tr­êng B¹ch s¬n Nam", 321, "M¹c Cao QuËt", 340, "T­¬ng D­¬ng",
                  78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"TuyÒn C¬ Tö", "T©y S¬n ®¶o", 342, "Phi Thiªn ®éng", 204, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"V­¬ng T¸", "Vò L¨ng ®éng", 199, "Phï Dung ®éng", 202, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"HuyÒn Nan §¹i S­", "Phong L¨ng ®é", 336, "Kho¶ Lang ®éng", 75, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam", 321, "Kho¶ Lang ®éng", 75, "T­¬ng D­¬ng",
                  78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"B¹ch Doanh Doanh", "Thanh khª ®éng", 198, "Sa m¹c ®Þa biÓu", 224, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o", 342, "D­¬ng Trung ®éng", 205, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Chung Linh Tó", "Phi Thiªn ®éng", 204, "V« Danh ®éng", 203, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng", 10, "L­ìng Thñy ®éng", 181, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"§oan Méc DuÖ", "Phong L¨ng ®é", 336, "S¬n B¶o ®éng", 76, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn", 341, "Vò L¨ng ®éng", 199, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Thanh Liªn Tö", "Tr­êng B¹ch s¬n B¾c", 322, "Sa M¹c s¬n  ®éng 3", 227, "T­¬ng D­¬ng",
                  78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176},
                 {"Thanh TuyÖt S­ Th¸i", "Sa M¹c s¬n  ®éng 1", 225, "Sa M¹c s¬n  ®éng 3", 227,
                  "T­¬ng D­¬ng", 78, "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh",
                  37, "§¹i Lý", 162, "L©m An", 176},
                 {"Hµn Ngu Dèt", "Phong L¨ng ®é", 336, "Kho¶ Lang ®éng", 75, "T­¬ng D­¬ng", 78,
                  "Ph­îng T­êng", 1, "Thµnh §«", 11, "D­¬ng Ch©u", 80, "BiÖn Kinh", 37, "§¹i Lý", 162,
                  "L©m An", 176}}

function timbosshk()
    findgoldboss(1, 12)
end
function findgoldboss(f_bossx, f_bossy)

    if (not f_bossx) then
        f_bossx1 = 1;
        f_bossy1 = 12;
    else
        f_bossx1 = f_bossx;
        f_bossy1 = f_bossy;
    end

    if (f_bossy1 - f_bossx1 > 11) then
        f_bossy1 = f_bossx1 + 11;
    end

    local n_count = getn(tbMapGoldBoss);
    local tab_Content = {}

    for i = f_bossx1, f_bossy1 do
        tinsert(tab_Content, tbMapGoldBoss[i][1] .. "/#findgoldboss_Step2( " .. i .. ")");
    end
    if (f_bossx1 ~= 1) then
        tinsert(tab_Content, "Trang tr­íc/#findgoldboss( 1," .. (f_bossx1 - 1) .. ")");
    end

    if (f_bossy1 < n_count) then
        tinsert(tab_Content, "Trang sau/#findgoldboss( " .. (f_bossy1 + 1) .. "," .. n_count .. ")");
    end
    tinsert(tab_Content, "Tho¸t/no");
    Say("§¹i hiÖp t×m cao thñ nµo?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
    local tb = {}
    for i = 2, getn(tbMapGoldBoss[nId]), 2 do -- "buoc nhay 2 tuc la i=2,4,6,8,10
        local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i + 1], tbMapGoldBoss[nId][1])
        if npcidxtab == nil then
            nNPCCount = 0
        else
            nNPCCount = getn(npcidxtab);
        end
        for j = 1, nNPCCount do
            x, y, subworld = GetNpcPos(npcidxtab[j]);
            m, n, k = floor(x / 32), floor(y / 32), SubWorldIdx2ID(subworld)

            -- tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
            tinsert(tb,
                tbMapGoldBoss[nId][1] .. "-" .. tbMapGoldBoss[nId][i] .. "[" .. floor(m / 8) .. "-" .. floor(n / 16) ..
                    "]/#findgoldboss_Step3(" .. m .. "," .. n .. "," .. k .. ")")
        end
    end
    strTittle = "T×m thÊy cao thñ vâ l©m " .. tbMapGoldBoss[nId][1] .. " t¹i c¸c vÞ trÝ sau ®©y."
    -- tinsert(tbOpt, {"tho¸t ",Quit})
    tinsert(tb, "Trë l¹i/#findgoldboss(1,12)")
    tinsert(tb, "Tho¸t/no")
    -- CreateNewSayEx(strTittle, tbOpt)
    Say(strTittle, getn(tb), tb)
end
function findgoldboss_Step3(nX, nY, Map)
    NewWorld(Map, nX, nY) --
    SetFightState(1)
end
--------------------------------------------------------------
--			 TÈy Tñy, Céng §iÓm Nhanh							--
--------------------------------------------------------------
function chose_reset_type(num)
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    if num == 1 then
        tinsert(tbSay, "TÈy TiÒm n¨ng/DoClearPropCore")
        tinsert(tbSay, "Céng TiÒm n¨ng nhanh/add_prop")
    else
        tinsert(tbSay, "TÈy Kü n¨ng/DoClearSkillCore")
        tinsert(tbSay, "Céng Kü n¨ng nhanh/dialog_main")
    end
    tinsert(tbSay, "Trë l¹i/status_dialog")
    tinsert(tbSay, "Tho¸t/no")

    CreateTaskSay(tbSay)
end
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
    local tbSay = {"§¹i hiÖp muèn nhËn lo¹i ®iÓm nµo?", "Kinh nghiÖm (EXP)/kinhnghiem",
                   "N©ng cÊp ®é/dangcap200", "NhËn ®iÓm TiÒm n¨ng/pointtiemnang",
                   "NhËn ®iÓm Kü n¨ng/pointkynang", "NhËn TiÒn v¹n/tien", "NhËn TiÒn ®ång/tiendong",
                   "NhËn Kim Nguyªn B¶o/knb", "NhËn Ch©n nguyªn vµ Hé M¹ch §¬n/channguyen",
                   "NhËn Danh väng/danhvong", "NhËn §iÓm Phóc duyªn/phucduyen",
                   "NhËn Full Tµi l·nh ®¹o/tailanhdao", "NhËn ®iÓm Cèng hiÕn Bang héi/conghien",
                   "Trë l¹i/main", "KÕt thóc ®èi tho¹i/no"}
    CreateTaskSay(tbSay)
end
------------Ch©n Nguyªn----------------------------
function channguyen()
    SetTask(4000, GetTask(4000) + 12000)
    for i = 1, 12 do
        AddStackItem(500, 6, 1, 3203, 0, 0, 0)
    end
    Msg2Player(
        "B¹n nhËn ®­îc <color=yellow>12000<color> Ch©n Nguyªn vµ <color=yellow>6000<color> Hé M¹ch §¬n")
end
------------CÊp-------------------
function dangcap200()
    AskClientForNumber("level", 0, 200, "NhËp CÊp §é:")
end

function level(num)
    local nCurLevel = GetLevel()
    local nAddLevel = num - nCurLevel
    ST_LevelUp(nAddLevel)
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. num .. "<color> cÊp ®é.")
end
---EXP-----
function kinhnghiem()
    AskClientForNumber("kinhnghiem1", 0, 9999999999999999, "NhËp EXP")
end
function kinhnghiem1(nNum)
    AddOwnExp(nNum)
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. nNum .. "<color> kinh nghiÖm.")
end
---Tien Van---
function tien()
    AskClientForNumber("tienvan", 0, 10000000, "NhËp Sè L­îng:")
end
function tienvan(slkv)
    local money = slkv * 10000
    local giatrikv = money / 10000
    Earn(money)
    Msg2Player(format("B¹n nhËn ®­îc <color=yellow>%s<color> v¹n.", giatrikv))
end
---Tien Dong---
function tiendong()
    AskClientForNumber("tiendong1", 0, 1000, "NhËp Sè L­îng:")
end
function tiendong1(sltiendong)
    for i = 1, sltiendong do
        AddStackItem(1, 4, 417, 1, 1, 0, 0, 0)
    end
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. sltiendong .. "<color> tiÒn ®ång.")
end
----KNB------
function knb()
    AskClientForNumber("layknb", 0, 100000, "NhËp Sè L­îng:")
end
function layknb(slknb)
    for i = 1, slknb do
        AddEventItem(343)
    end
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. slknb .. "<color> KNB.")
end
----------------§iÓm Kü N¨ng----------------------------------------
function pointkynang()
    AskClientForNumber("pointkynang1", 0, 1000, "NhËp Sè L­îng:")
end
function pointkynang1(nNum)
    AddMagicPoint(nNum) ---NhËn ®iÓm kü n¨ng
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. nNum .. "<color> ®iÓm Kü N¨ng.")
end
------------------§iÓm TiÒm N¨ng--------------------------------------
function pointtiemnang()
    AskClientForNumber("pointtiemnang1", 0, 1000000, "NhËp Sè L­îng:")
end
function pointtiemnang1(nNum)
    AddProp(nNum) ---NhËn ®iÓm tiÒm n¨ng
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. nNum .. "<color> ®iÓm TiÒm N¨ng.")
end
------------Danh Väng----------------------------
function danhvong()
    AskClientForNumber("danhvongINPUT", 0, 100000, "NhËp Sè L­îng:")
end
function danhvongINPUT(nNum)
    AddRepute(nNum);
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. nNum .. "<color> ®iÓm Danh Väng.")
end
------------Phóc Duyªn----------------------------
function phucduyen()
    AskClientForNumber("phucduyen2", 0, 100000, "NhËp Sè L­îng:")
end
function phucduyen2(nNum)
    FuYuan_Start();
    FuYuan_Add(nNum);
    Msg2Player("B¹n nhËn ®­îc <color=yellow>" .. nNum .. "<color> ®iÓm Phóc Duyªn.")
end
------------Tµi L·nh §¹o----------------------------
function tailanhdao()
    for i = 1, 250 do
        AddLeadExp(1000000000)
    end
    Msg2Player("B¹n nhËn ®­îc 100 cÊp tµi l·nh ®¹o");
end
------------§iÓm Cèng HiÕn----------------------------
function conghien()
    AddContribution(1000000);
    Msg2Player("B¹n nhËn ®­îc 1.000.000 ®iÓm cèng hiÕn")
end
