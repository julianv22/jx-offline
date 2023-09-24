IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
IncludeLib("LEAGUE");
Include("\\script\\global\\skills_table.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")
-- Include("\\script\\global\\findboss.lua") 
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\global\\gm\\ex_lib_function.lua")
-- Include("\\script\\global\\thinh\\npc\\npc_vocong.lua")
----------------------------------------------------------------------------------------------------------------------------------------------------------------
LENHBAI_ADMIN = "<#><link=image[0]:\\spr\\item\\sprADMIN.spr>LÖnh Bµi GM: <link>"
function main()
    dofile("script/global/gm/lbadmin.lua")
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Qu¶n Lý Server", QLServer}, {"Qu¶n lý Nh©n vËt", nhan_vat},
                   {"Chøc N¨ng Bang Héi", DMcreattongtest}, {"NhËn Trang BÞ", TrangBi},
                   {"NhËn VËt PhÈm", NhanVatPham}, {"KickOutSelf()", KickOutSelf}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
    return 1;
end

function CS5()
    ST_DoTransLife()
end
---------------------------------Nh©n vËt---------------------------------
function nhan_vat()
    local tbSay = { --
    {"Di chuyÓn vÒ Ba L¨ng HuyÖn", GoBLH}, --
    {"Häc kü n¨ng M«n ph¸i", change_phai}, {"NhËn Danh hiÖu", nhandanhhieu}, --
    {"Thay ®æi ngo¹i h×nh trang bÞ", change_feature}, --
    {"§æi giíi tÝnh", xacnhan}, --
    {"§æi Ngò hµnh", ngu_hanh}, --
    {"Më réng r­¬ng", moruong}, --
    {"Trë l¹i"}, {"Tho¸t", no}}
    CreateNewSayEx("Xin chµo <bclr=red>" .. GetName() .. "b¹n muèn lµm g×?", tbSay)
end

---------------------§æi giíi tÝnh-------------------------
function xacnhan()
    local szTitle = "<color=red>" .. GetName() .. "<color> ng­¬i cã ch¾c ch¾n muèn thay ®æi giíi tÝnh kh«ng?"
    local tbOpt = {"X¸c nhËn!/change_sex", "Trë l¹i/nhan_vat", "Kªt thóc ®èi tho¹i/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function change_sex()
    if GetSex() == 1 then
        SetSex(0)
    else
        SetSex(1)
    end
    Talk(1, "KickOutSelf", "§· chuyÓn giíi thµnh c«ng")
end
---------------------§æi Ngò hµnh-------------------------
tbSeries = { -- table ngò hµnh
    [0] = {"Kim", "yellow"},
    [1] = {"Méc", "green"},
    [2] = {"Thuû", "blue"},
    [3] = {"Ho¶", "red"},
    [4] = {"Thæ", "orange"}
}

function ngu_hanh()
    local nSeries = GetSeries()
    local tbSay = {format(
        "<color=red>%s<color> hiÖn t¹i lµ hÖ <color=%s>%s<color>.\nH·y chän ngò hµnh muèn chuyÓn:", GetName(),
        tbSeries[nSeries][2], tbSeries[nSeries][1])}
    for id, _ in tbSeries do
        tinsert(tbSay, format("%s/#change_5hanh(%d)", tbSeries[id][1], id))
        -- tinsert(tbSay, tbSeries[id][1].."/#change_5hanh("..id..")")
    end
    tinsert(tbSay, "Trë l¹i/nhan_vat")
    tinsert(tbSay, "Tho¸t/no")

    CreateTaskSay(tbSay)
end

function change_5hanh(num)
    local nSeries = GetSeries()
    if nSeries == num then
        Talk(1, "", format("§· lµ hÖ <color=%s>%s<color> råi, kh«ng cÇn chuyÓn n÷a!", tbSeries[num][2],
            tbSeries[num][1]))
    else
        SetSeries(num)
        Talk(1, "KickOutSelf", format("§· chuyÓn sang hÖ <color=%s>%s<color>!", tbSeries[num][2], tbSeries[num][1]))
    end
end
---------------------§æi Ngo¹i trang-------------------------
tbNgoaiTrang = {
    [0] = "Ngo¹i h×nh NPC",
    [1] = "Ngo¹i h×nh Mò",
    [2] = "Ngo¹i h×nh ¸o",
    [3] = "Ngo¹i h×nh Vò khÝ",
    [4] = "Ngo¹i h×nh Ngùa"
}

function change_feature()
    local tbSay = { --
    {"Xem tr­íc ngo¹i h×nh", feature_preview}, --
    {"KiÓm tra ID ngo¹i trang", CheckFeature}, --
    {"§æi ngo¹i h×nh trang bÞ theo ID", feature_item_ui}, --
    {"§æi ngo¹i h×nh vò khÝ (Sö dông menu)", feature_item}, --
    {"Phôc håi ngo¹i h×nh gèc", restore_feature_item}, --    
    {"Tho¸t", no}}
    CreateNewSayEx("Xin chµo <bclr=red>" .. GetName() .. "<bclr> ta cã thÓ gióp g× ®­îc ng­¬i?", tbSay)
end

function feature_preview(num)
    if HaveCommonItem(6, 1, 13) < 1 then
        AddItem(6, 1, 13, 0, 0, 0)
    end
    if HaveCommonItem(6, 1, 14) < 1 then
        AddItem(6, 1, 14, 0, 0, 0)
    end
    local tbSay = {}
    if num == nil then
        tinsert(tbSay, {"Xem h­íng dÉn", feature_preview, {1}})
        for i = 0, getn(tbNgoaiTrang) do
            tinsert(tbSay, {tbNgoaiTrang[i], askStartID, {i}})
        end
        tinsert(tbSay, {"Tho¸t", no})
        CreateNewSayEx("Xin chµo <bclr=red>" .. GetName() .. "<bclr> ta cã thÓ gióp g× ®­îc ng­¬i?", tbSay)
    else
        Say(strfill_center("Chøc n¨ng thay ®æi ngo¹i h×nh trang bÞ", 50) ..
                "\n\nChän kiÓu ngo¹i trang muèn xem tr­íc.\nNhËp ID b¾t ®Çu xem.\nSau ®ã sö dông <color=yellow>§¹i H«ng Bao<color> vµ <color=yellow>TiÓu Hång Bao<color> ®Ó xem ngo¹i trang.\nSau khi chän ®­îc ngo¹i h×nh ­ng ý th× sö dông chøc n¨ng §æi ngo¹i h×nh trang bÞ theo ID ®Ó thay ®æi.",
            1, {"Ta ®· hiÓu.../change_feature"})
    end
end

function askStartID(nId)
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr­íc ngo¹i h×nh <color=yellow>" .. tbNgoaiTrang[nId])
    g_AskClientNumberEx(1, 9999, "Start ID", {SetTaskTemp, {169}})
end
function feature_item_ui()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "feature_item_tb_confirm", "onCancel", 1);
end

function feature_item_tb_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "NhËp ID muèn ®æi:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end
-----Quan Ly Server-------------------
function QLServer()
    local nNam = tonumber(GetLocalDate("%Y"));
    local nThang = tonumber(GetLocalDate("%m"));
    local nNgay = tonumber(GetLocalDate("%d"));
    local nGio = tonumber(GetLocalDate("%H"));
    local nPhut = tonumber(GetLocalDate("%M"));
    local nGiay = tonumber(GetLocalDate("%S"));
    local nW, nX, nY = GetWorldPos()
    local nIdPlay = PlayerIndex
    local tbSay = {"Th«ng tin ng­êi ch¬i/Show", "Thao t¸c lªn ng­êi ch¬i/luachonid1", "Trë l¹i", "Tho¸t/no"}

    Say("Xin Chµo <color=red>" .. GetName() .. "<color>!\nTäa ®é hiÖn t¹i: <color=green>" .. nW ..
            "<color> <color=blue>" .. nX .. "/" .. nY .. "<color> \n<color>Index:           <color=green>" .. nIdPlay ..
            "<color>\nSè SHXT: <color=green>        " .. GetTask(T_SonHaXaTac) ..
            "<color> m¶nh.\nHiÖn §ang Cã:    <bclr=red><color=yellow>[" .. GetPlayerCount() ..
            "]<color><bclr> ng­êi ch¬i trong game.\n", getn(tbSay), tbSay)
end

function Show()
    AskClientForNumber("Show1", 1, 1180, "NhËp sè tiÒn cÇn chuyÓn")
end

function Show1(num)
    local nNum = num + 20
    for i = num, nNum do
        gmidx = PlayerIndex
        PlayerIndex = i
        TarName = GetName()
        PlayerIndex = gmidx
        Msg2Player("PlayIndex:<color=green> " .. i .. "<color> - Tªn:<color=green> " .. TarName .. "");
    end
end

function luachonid1()
    AskClientForNumber("one", 0, 5000, "NhËp ID ng­êi ch¬i")
end

function one(num)
    if ((num) > GetPlayerCount()) then
        Msg2Player("Kh«ng cã nh©n vËt víi ID: <color=green>" .. num .. "<color> ®­îc chän !!");
    else
        SetTaskTemp(200, num)
        gmName = GetName()
        gmidx = PlayerIndex
        PlayerIndex = GetTaskTemp(200)
        tk = GetAccount()
        lev = GetLevel()
        xp = GetExp()
        cam = GetCamp()
        fac = GetFaction()
        cash = GetCash()
        lif = GetExtPoint(1)
        man = GetMana()
        apo = GetEnergy()
        spo = GetRestSP()
        cr = GetColdR()
        pr = GetTask(747)
        phr = GetPhyR()
        fr = GetFireR()
        lr = GetLightR()
        eng = GetEng()
        dex = GetDex()
        strg = GetStrg()
        vit = GetVit()
        w, x, y = GetWorldPos()
        xinxi = GetInfo()
        ObjName = GetName()
        PlayerIndex = gmidx
        Msg2Player("Nh©n vËt tªn:<color=metal> " .. ObjName .. "<color>");
        local tbSay = {"T¨ng cÊp ®é cho ng­êi ch¬i/tangcap1", "Hæ trî tiÒn ®ång/bufskillsgm1",
                       "Hæ trî tiÒn v¹n/themtienvan1", "Di chuyÓn nh©n vËt vÒ BLH/move",
                       "Add ®iÓm cho ng­êi ch¬i./buffpoint", "KÝch nh©n vËt/kich", "CÊm Ch¸t/camchat",
                       "Më Ch¸t/mochat", "Tho¸t/no", "Trë l¹i"}
        Say("Tµi Kho¶n:<color=green> " .. tk .. "<color>  - Nh©n VËt   :<color=green> " .. ObjName ..
                "<color>\nCÊp ®é   :<color=green> " .. lev .. "<color>           - Kinh nghiÖm: <color=green>" .. xp ..
                "%<color>\nMµu      :<color=green> " .. cam .. "<color>             - M«n ph¸i   :<color=green>" ..
                fac .. "<color>\nTiÒn MÆt :<color=green> " .. (cash / 10000) ..
                " v¹n<color> - TiÒn §ång  :<color=green>" .. lif .. " ®ång<color>\nVÞ trÝ   : <color=blue>" .. w ..
                "<color>,<color=green>" .. x .. "<color>,<color=green>" .. y .. "<color>", getn(tbSay), tbSay)
        Msg2Player("Ng­êi ch¬i <color=cyan>" .. xinxi)
    end
end
function themtienvan1()
    AskClientForNumber("themtienvan", 0, 2000000000, "NhËp sè tiÒn cÇn chuyÓn")
end
function themtienvan(num)
    nNum = num / 10000
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· thªm <color=metal>" .. nNum ..
                   "<color> v¹n l­îng cho b¹n !");
    Earn(num)
    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName .. "<color> ®­îc b¹n thªm <color=metal>" .. nNum ..
                   "<color> v¹n l­îng thµnh c«ng");
end
function bufskillsgm1()
    AskClientForNumber("buffskillsgm", 0, 500, "sè l­îng tiÒn ®ång")
end
function buffskillsgm(num)
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· chuyÓn <color=metal>" .. num ..
                   "<color> tiÒn ®ång cho b¹n !");
    AddStackItem(num, 4, 417, 1, 1, 0, 0, 0)
    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName .. "<color> ®­îc b¹n t¨ng <color=metal>" .. num ..
                   "<color> tiÒn ®ång thµnh c«ng");
end
function buffpoint()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· t¨ng ®iÓm theo yªu cÇu!");

    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName .. "<color> ®­îc b¹n t¨ng ®iÓm theo yªu cÇu thµnh c«ng");
end

function tangcap1()
    AskClientForNumber("tangcap", 0, 200, "cÊp cÇn t¨ng")
end
function tangcap(num)
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· t¨ng <color=metal>" .. num ..
                   "<color> cÊp ®é cho b¹n !");
    for i = 1, num do
        AddOwnExp(999999999999)
    end
    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName .. "<color> ®­îc b¹n t¨ng <color=metal>" .. num ..
                   "<color> cÊp ®é thµnh c«ng");
end
function move()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 200 * 8, 200 * 16)
    else
        SetPos(1630, 3255)
    end
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· di chuyÓn b¹n vÒ Ba L¨ng HuyÖn");
    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName ..
                   "<color> ®­îc b¹n di chuyÓn vÒ Ba LÆng HuyÖn thµnh c«ng");
end

function kich()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu¶n lý <color=green>" .. gmName .. "<color> ®· kick kÑt tµi kho¶n cho b¹n");
    KickOutSelf()
    PlayerIndex = gmidx
    Msg2Player("Nh©n vËt <color=green>" .. ObjName .. "<color> ®­îc b¹n kick kÑt tµi kho¶n thµnh c«ng");
end

function camchat()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    SetChatFlag(1)
    Msg2Player("B¹n bÞ khãa Ch¸t trªn mäi tÇn sè !")
    PlayerIndex = gmidx
    AddGlobalCountNews("Nh©n VËt:<color=red> " .. ObjName .. "<color> §· BÞ CÊm Chat Trªn Mäi TÇn Sè !", 1)
end

function mochat()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    SetChatFlag(0)
    Msg2Player("B¹n ®­îc më khãa Ch¸t trªn mäi tÇn sè !")
    PlayerIndex = gmidx
    AddGlobalCountNews("Nh©n VËt:<color=green> " .. ObjName .. "<color> §­îc Më Chat Trªn Mäi TÇn Sè !", 1)
end

function laytoado()
    local w, x, y = GetWorldPos()
    local nIdPlay = PlayerIndex
    Say("M¸p sè <color=Green>" .. w .. "<color> täa ®é <color=Yellow>" .. x .. ", " .. y)
end

----------BANG HOI--------------
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function DMcreattongtest()
    local strTongName = GetTongName()
    if (strTongName == nil or strTongName == "") then
        local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                            "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                            GetPlayerCount() .. "<color>"
        local tbOpt = {{"NhËn §iÒu KiÖn T¹o Bang Héi", dmcreatetong}, {"Gia NhËp Bang Héi", dmjointong},
                       {"T¹o Bang Héi", dmcreateit}, {"Trë L¹i", main}, {"Tho¸t"}}
        CreateNewSayEx(szTitle, tbOpt)
    else
        Say(szTitle, 0)
    end
end
function dmcreatetong()
    SetCamp(4)
    SetCurCamp(4)
    AddRepute(1000);
    FuYuan_Start();
    FuYuan_Add(1000);
    AddLeadExp(20000)
    AddEventItem(195)
    if GetLevel() <= 100 then
        for i = 1, 100 do
            AddOwnExp(100000000)
        end
    end
    Msg2Player("<color=yellow>Ng­­¬i ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
end

function dmjointong()
    if GetCamp() ~= 4 then
        if GetLevel() <= 100 then
            for i = 1, 100 do
                AddOwnExp(100000000)
            end
        end
        SetCamp(4)
        SetCurCamp(4)
        Msg2Player("<color=yellow>Gia nhËp Bang héi thµnh c«ng!<color>")
    else
    end
end
function dmcreateit()
    Tong_name, oper = GetTong()
    if (oper == 0) and (GetTask(99) == 1) then
        Say("Kiªm hiÖp ch­ëng m«n nh©n:Khai s¸ng bang héi, më réng b¸ nghiÖp.", 2,
            "B¾t ®Çu dùng bang/Direct_CreateTong", "§îi ta mét chót/wait_a_moment")
    elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and
        (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
        Talk(6, "create_pay",
            "Ng­êi ch¬i: Kiªm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?",
            "Kiªm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i cã ®ñ n¨ng lùc l·nh ®¹o, cã 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ",
            "Ch­ëng m«n nh©n:  NÕu trong 3 ngµy cã ng­êi rêi bang th× néi trong 3 ngµy ®ã ng­¬i ph¶i t×m ng­êi kh¸c thay thÕ.",
            "Ch­ëng m«n nh©n:  Ng­¬i ph¶i cã ®ñ tµi l·nh ®¹o vµ tÝn vËt ®ã lµ Nh¹c V­¬ng KiÕm",
            "Ng­êi ch¬i: Nh¹c V­¬ng Kiªm ? Ng­êi nãi lµ thanh kiªm nµy µ ? ",
            "Kiªm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· cã nã... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
    else
        i = random(0, 1)
        if (i == 0) then
            Talk(1, "",
                "Kiªm hiÖp ch­ëng m«n nh©n: Nªu nh­ muèn thµnh lËp bang héi, ng­¬i cã thÓ v× nã bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ n÷a ®­êng hñy bá.")
        else
            Talk(6, "",
                "Kiªm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iÒu kiÖn lËp bang µ? §Ó ta nãi cho ng­¬i râ.",
                "Kiªm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt x­,  tiªp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo kh¸c, ng­¬i nhÊt ®inh ph¶i cã danh väng giang hå, cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.",
                "Kiªm hiÖp ch­ëng m«n nh©n: Sau ®ã ®i chiÕn tr­êng t×m mét thanh Nh¹c V­¬ng Kiªm lµm bang chñ tÝn vËt lµ ®­îc råi.")
        end
    end
end

function create_pay()
    Say("Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c.", 2,
        "Kh«ng thµnh vÊn ®ª, ta cã ®em 100v l­îng ®©y! /create_pay_yes",
        "Ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")
end
function create_pay_yes()
    if (GetCash() >= 1000000) then
        Pay(1000000)
        DelItem(195)
        SetTask(99, 1)
        Direct_CreateTong()
    else
        Talk(1, "",
            "Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn kÐm, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tÝch gãp ®Ó Bang Héi ®­îc giµu m¹nh. ")
    end
end

function Direct_CreateTong()
    CreateTong(1)
end
---------Trang Bi--------------
function TrangBi()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"NhËn §å Xanh", laydoxanh}, {"NhËn §å TÝm", laydotim},
                   {"NhËn An Bang, Kim Phong, §Þnh Quèc", ab_kp_dq}, {"NhËn Trang BÞ HKMP", setHKMPT1},
                   {"NhËn Vò KhÝ HKMP", vkHKMP}, {"NhËn NhÉn Cao CÊp", Nhan}, {"NhËn TrÊn Bang Chi B¶o", TBCB},
                   {"NhËn Trang BÞ HiÕm", TBHiem}, {"NhËn Ên, Phi Phong, Trang Søc", anphiphong},
                   {"NhËn MÆt n¹ chiÕn tr­êng", matna}, {"Trë L¹i", main}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

----AN BANG - KIM PHONG - DINH QUOC----
function ab_kp_dq()
    local szTitle = LENHBAI_ADMIN .. "<#>Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"An Bang", anbang}, {"Kim Phong", kimphong}, {"§Þnh Quèc", dinhquoc}, {"Trë L¹i", TrangBi},
                   {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function anbang()
    for i = 408, 411 do
        AddGoldItem(0, i)
    end
end
function kimphong()
    for i = 177, 185 do
        AddGoldItem(0, i)
    end
end
function dinhquoc()
    for i = 389, 393 do
        AddGoldItem(0, i)
    end
end
---HKMP----
function setHKMPT1()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"ThiÕu L©m QuyÒn", hkmp, {1}}, {"ThiÕu L©m C«n", hkmp, {2}}, {"ThiÕu L©m §ao", hkmp, {3}},
                   {"Thiªn V­¬ng Chïy", hkmp, {4}}, {"Thiªn V­¬ng Th­¬ng", hkmp, {5}},
                   {"Thiªn V­¬ng §ao", hkmp, {6}}, {"Nga Mi KiÕm", hkmp, {7}}, {"Nga Mi Ch­ëng", hkmp, {8}},
                   {"Nga Mi Buff", hkmp, {9}}, {"Thóy Yªn §¬n §ao", hkmp, {10}},
                   {"Thóy Yªn Song §ao", hkmp, {11}}, {"Ngò §éc Ch­ëng Ph¸p", hkmp, {12}},
                   {"Ngò §éc §ao Ph¸p", hkmp, {13}}, {"Trang kÕ", setHKMPT2}, {"Trë L¹i", TrangBi}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function setHKMPT2()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ngò §éc Bïa Ph¸p", hkmp, {14}}, {"§­êng M«n Phi §ao", hkmp, {15}},
                   {"§­êng M«n Tô TiÔn", hkmp, {16}}, {"§­êng M«n Phi Tiªu", hkmp, {17}},
                   {"§­êng M«n BÉy", hkmp, {18}}, {"C¸i Bang Rång", hkmp, {19}},
                   {"C¸i Bang C«n Ph¸p", hkmp, {20}}, {"Thiªn NhÉn KÝch", hkmp, {21}},
                   {"Thiªn NhÉn §ao", hkmp, {22}}, {"Thiªn NhÉn Bïa", hkmp, {23}}, {"Vâ §ang KhÝ", hkmp, {24}},
                   {"Vâ §ang KiÕm", hkmp, {25}}, {"C«n L«n §ao", hkmp, {26}}, {"C«n L«n KiÕm", hkmp, {27}},
                   {"C«n L«n Bïa", hkmp, {28}}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function hkmp(nId)
    for i = 1, 5 do
        AddGoldItem(0, 5 * nId + i - 5)
    end
end
---MÆt n¹-----------
function matna()
    local tab_Content = {"MÆt ThiÕu L©m/matna1", "MÆt Thiªn V­¬ng/matna2", "MÆt Nga My/matna3",
                         "MÆt Thóy Yªn/matna4", "MÆt Ngò §éc/matna5", "MÆt §­êng M«n/matna6",
                         "MÆt C¸i Bang/matna7", "MÆt Thiªn NhÉn/matna8", "MÆt Vâ §ang/matna9",
                         "MÆt C«n L«n/matna10", "Tho¸t/no", "Trë l¹i"}
    Say("Xin mêi chän !", getn(tab_Content), tab_Content);
end
function matna1()
    for i = 4608, 4610 do
        AddGoldItem(0, i)
    end
end
function matna2()
    for i = 4611, 4613 do
        AddGoldItem(0, i)
    end
end
function matna3()
    for i = 4614, 4615 do
        AddGoldItem(0, i)
    end
end
function matna4()
    for i = 4616, 4617 do
        AddGoldItem(0, i)
    end
end
function matna5()
    for i = 4618, 4619 do
        AddGoldItem(0, i)
    end
end
function matna6()
    for i = 4620, 4622 do
        AddGoldItem(0, i)
    end
end
function matna7()
    for i = 4623, 4624 do
        AddGoldItem(0, i)
    end
end
function matna8()
    for i = 4625, 4626 do
        AddGoldItem(0, i)
    end
end
function matna9()
    for i = 4627, 4628 do
        AddGoldItem(0, i)
    end
end
function matna10()
    for i = 4629, 4630 do
        AddGoldItem(0, i)
    end
end
----VK HKMP----
function vkHKMP()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"ThiÕu L©m", VKTL}, {"Thiªn V­¬ng", VKTV}, {"Nga Mi", VKNM}, {"Thóy Yªn", VKTY},
                   {"Ngò §éc", VK5D}, {"§­êng M«n", VKDM}, {"C¸i Bang", VKCB}, {"Thiªn NhÉn", VKTN},
                   {"Vâ §ang", VKVD}, {"C«n L«n", VKCL}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function VKTL()
    AddGoldItem(0, 11)
    AddGoldItem(0, 6)
end
function VKTV()
    AddGoldItem(0, 16)
    AddGoldItem(0, 21)
    AddGoldItem(0, 26)
end
function VKNM()
    AddGoldItem(0, 31)
end
function VKTY()
    AddGoldItem(0, 46)
end
function VK5D()
    AddGoldItem(0, 61)
end
function VKDM()
    AddGoldItem(0, 71)
    AddGoldItem(0, 76)
    AddGoldItem(0, 81)
end
function VKCB()
    AddGoldItem(0, 96)
end
function VKTN()
    AddGoldItem(0, 101)
end
function VKVD()
    AddGoldItem(0, 116)
    AddGoldItem(0, 121)
end
function VKCL()
    AddGoldItem(0, 126)
end
----NhÉn----
function Nhan()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"H­ng Bang Chi Giíi", xb_jz}, {"TrÊn Nh¹c Chi Giíi", zy_jz},
                   {"Th­îng Ph­¬ng Chi Giíi", sf_jz}, {"Thiªn Hµ Giíi", sh_jz},
                   {"§Õ Hoµng Chi Giíi", dh_jz}, {"Thiªn Tö Chi Giíi", tz_jz}, {"ThÕ Tóc Toµn Giíi", sz_jz},
                   {"V« Danh Giíi ChØ", vdgc}, {"Cµn Kh«n Giíi ChØ (Cùc phÈm)", jz08},
                   {"L·nh B¸ Nguyªn Méng Chi Giíi (Míi)", jz08x}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function vdgc()
    AddGoldItem(0, 141)
    AddGoldItem(0, 142)
end

function xb_jz()
    AddGoldItem(0, 508)
end
function zy_jz()
    AddGoldItem(0, 509)
end
function sf_jz()
    AddGoldItem(0, 510)
end
function sh_jz()
    AddGoldItem(0, 511)
end
function dh_jz()
    AddGoldItem(0, 530)
end
function tz_jz()
    AddGoldItem(0, 531)
end
function sz_jz()
    AddGoldItem(0, 498)
end
function jz08()
    AddGoldItem(0, 3878)
end
function jz08x()
    AddGoldItem(0, 3541)
end
----------LÊy §å Xanh------------------
tbDoXanh = {
    [1] = {
        szName = "D©y ChuyÒn",
        tbEquip = {{"Toµn th¹ch h¹ng liªn", 0, 4, 0}, {"Lôc PhØ Thóy Hé Th©n phï ", 0, 4, 1}}
    },
    [2] = {
        szName = "¸o Gi¸p",
        tbEquip = {{"ThÊt B¶o Cµ Sa", 0, 2, 0}, {"Ch©n Vò Th¸nh Y", 0, 2, 1},
                   {"Thiªn NhÉn MËt Trang", 0, 2, 2}, {"Gi¸ng Sa Bµo", 0, 2, 3}, {"§­êng Nghª gi¸p", 0, 2, 4},
                   {"V¹n L­u Quy T«ng Y", 0, 2, 5}, {"TuyÒn Long bµo", 0, 2, 6}, {"Long Tiªu ®¹o Y", 0, 2, 8},
                   {"Cöu VÜ B¹ch Hå trang", 0, 2, 9}, {"TrÇm H­¬ng sam", 0, 2, 10},
                   {"TÝch LÞch Kim Phông gi¸p", 0, 2, 11}, {"V¹n Chóng TÒ T©m Y", 0, 2, 12},
                   {"L­u Tiªn QuÇn", 0, 2, 13}}
    },
    [3] = {
        szName = "§ai L­ng",
        tbEquip = {{"Thiªn Tµm Yªu §¸i", 0, 6, 0}, {"B¹ch Kim Yªu §¸i", 0, 6, 1}}
    },
    [4] = {
        szName = "Giµy",
        tbEquip = {{"Cöu TiÕt X­¬ng VÜ Ngoa", 0, 5, 0}, {"Thiªn Tµm Ngoa", 0, 5, 1}, {"Kim Lò hµi", 0, 5, 2},
                   {"Phi Phông Ngoa", 0, 5, 3}}
    },
    [5] = {
        szName = "Bao Tay",
        tbEquip = {{"Long Phông HuyÕt Ngäc Tr¹c", 0, 8, 0}, {"Thiªn Tµm Hé UyÓn", 0, 8, 1}}
    },
    [6] = {
        szName = "Nãn",
        tbEquip = {{"Tú L« m·o", 0, 7, 0}, {"Ngò l·o qu¸n", 0, 7, 1}, {"Tu La Ph¸t kÕt", 0, 7, 2},
                   {"Th«ng Thiªn Ph¸t Qu¸n", 0, 7, 3}, {"YÓm NhËt kh«i", 0, 7, 4},
                   {"TrÝch Tinh hoµn", 0, 7, 5}, {"¤ Tµm M·o", 0, 7, 6}, {"Quan ¢m Ph¸t Qu¸n", 0, 7, 7},
                   {"¢m D­¬ng V« Cùc qu¸n", 0, 7, 8}, {"HuyÒn Tª DiÖn Tr¸o", 0, 7, 9},
                   {"Long HuyÕt §Çu hoµn", 0, 7, 10}, {"Long L©n Kh«i", 0, 7, 11}, {"Thanh Tinh Thoa", 0, 7, 12},
                   {"Kim Phông TriÓn SÝ ", 0, 7, 13}}
    },
    [7] = {
        szName = "Vò KhÝ CËn ChiÕn",
        tbEquip = {{"HuyÒn ThiÕt KiÕm", 0, 0, 0}, {"§¹i Phong §ao", 0, 0, 1}, {"Kim C« Bæng", 0, 0, 2},
                   {"Ph¸ Thiªn KÝch", 0, 0, 3}, {"Ph¸ Thiªn chïy", 0, 0, 4}, {"Th«n NhËt Tr·m", 0, 0, 5}}
    },
    [8] = {
        szName = "Ngäc Béi",
        tbEquip = {{"Long Tiªn H­¬ng Nang", 0, 9, 0}, {"D­¬ng Chi B¹ch Ngäc", 0, 9, 1}}
    },
    [9] = {
        szName = "Vò KhÝ TÇm Xa",
        tbEquip = {{"B¸ V­¬ng Tiªu", 0, 1, 0}, {"To¸i NguyÖt §ao", 0, 1, 1}, {"Khæng T­íc Linh", 0, 1, 2}}
    },
    [10] = {
        szName = "NhÉn",
        tbEquip = {{"Toµn Th¹ch Giíi ChØ ", 0, 3, 0}}
    }
}

function laydoxanh()
    local tbOpt = {}
    for i = 1, getn(tbDoXanh) do
        tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
    end

    tinsert(tbOpt, {"Tho¸t."})
    CreateNewSayEx(LENHBAI_ADMIN .. "Xin mêi lùa chän trang bÞ:", tbOpt)
end
function laydoxanh1(nType)
    local tbEquip = tbDoXanh[nType]["tbEquip"]
    local tbOpt = {}
    for i = 1, getn(tbEquip) do
        tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
    end

    tinsert(tbOpt, {"Tho¸t."})
    local szTitle = format(LENHBAI_ADMIN .. "Xin mêi lùa chän trang bÞ:")
    CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
    local tbOpt = {}
    tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
    tinsert(tbOpt, {"Méc", laydoxanh3, {nIndex, nType, 1}})
    tinsert(tbOpt, {"Thñy", laydoxanh3, {nIndex, nType, 2}})
    tinsert(tbOpt, {"Háa", laydoxanh3, {nIndex, nType, 3}})
    tinsert(tbOpt, {"Thæ ", laydoxanh3, {nIndex, nType, 4}})

    tinsert(tbOpt, {"Tho¸t."})
    local szTitle = format(LENHBAI_ADMIN .. "Mêi chän hÖ:")
    CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh3(nIndex, nType, nSeries)
    g_AskClientNumberEx(0, 60, "Sè L­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
end
function laydoxanh4(nIndex, nType, nSeries, nCount)
    local tbEquipSelect = tbDoXanh[nType]["tbEquip"][nIndex]
    for i = 1, nCount do
        AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 500, 10)
    end
end

-----LÊy §å TÝm------------------------------------------------
function laydotim()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Trang BÞ MaxOp", dotimmax}, {"Vò KhÝ", weapon}, {"Y Phôc", shirt}, {"§inh M·o", hat},
                   {"Hé UyÓn", glove}, {"Yªu §¸i", belt}, {"Hµi Tö", shoe}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function dotimmax()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Vò KhÝ", vukhi}, {"KiÕm", kiem}, {"Trang Phôc", trangphuc}, {"§inh M·o", non},
                   {"Bao Tay", baotay}, {"§ai L­ng", dailung}, {"Giµy", giay}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function vukhi()
    AddQualityItem(2, 0, 0, 1, 10, 0, 0, 483, 510, 481, 503, 496, 492)
end
function kiem()
    AddQualityItem(2, 0, 0, 0, 10, 2, 0, 483, 512, 481, 505, 496, 514)
end
function trangphuc()
    AddQualityItem(2, 0, 2, 0, 10, 2, 0, 488, 512, 496, 515, 497, 514)
end
function non()
    AddQualityItem(2, 0, 7, 0, 10, 3, 0, 496, 509, 497, 518, 499, 519)
end
function baotay()
    AddQualityItem(2, 0, 8, 1, 10, 1, 0, 496, 513, 497, 508, 499, 492)
end
function dailung()
    AddQualityItem(2, 0, 6, 0, 10, 2, 0, 496, 512, 497, 515, 499, 514)
end
function giay()
    AddQualityItem(2, 0, 5, 0, 10, 4, 0, 487, 511, 496, 520, 497, 492)
end
function weapon()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"KiÕm", kiem}, {"§ao", dao}, {"Bçng", bong}, {"KÝch", kick}, {"Chïy", chuy},
                   {"Song §ao", songdao}, {"Phi Tiªu", phitieu}, {"Phi §ao", phidao}, {"Tô TiÔn", tutien},
                   {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function kiem()
    AddQualityItem(2, 0, 0, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function dao()
    AddQualityItem(2, 0, 0, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function bong()
    AddQualityItem(2, 0, 0, 2, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 2, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 2, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 2, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 2, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function kick()
    AddQualityItem(2, 0, 0, 3, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 3, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 3, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 3, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 3, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function chuy()
    AddQualityItem(2, 0, 0, 4, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 4, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 4, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 4, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 4, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function songdao()
    AddQualityItem(2, 0, 0, 5, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 5, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 5, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 5, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 0, 5, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function phitieu()
    AddQualityItem(2, 0, 1, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function phidao()
    AddQualityItem(2, 0, 1, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tutien()
    AddQualityItem(2, 0, 1, 2, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 2, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 2, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 2, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 1, 2, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function shirt()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"ThÊt B¶o Cµ Sa", aothieulam}, {"Ch©n Vò Th¸nh Y", aovodang},
                   {"Thiªn NhÉn MËt Trang", aothiennhan}, {"Gi¸ng Sa Bµo", sabao}, {"§­êng Nghª Gi¸p", dng},
                   {"V¹n L­u Quy T«ng Y", aocaibang}, {"TuyÒn Long Bµo", longbao}, {"Long Tiªu §¹o Y", daoy},
                   {"Cöu VÜ B¹ch Hå Trang", hotrang}, {"TrÇm H­¬ng Sam", huongsam},
                   {"TÝch LÞch Kim Phông Gi¸p", kimphung}, {"V¹n Chóng TÒ T©m Y", tamy},
                   {"L­u Tiªn QuÇn", tienquan}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function aothieulam()
    AddQualityItem(2, 0, 2, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function aovodang()
    AddQualityItem(2, 0, 2, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function aothiennhan()
    AddQualityItem(2, 0, 2, 2, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 2, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 2, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 2, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 2, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function sabao()
    AddQualityItem(2, 0, 2, 3, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 3, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 3, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 3, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 3, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function dng()
    AddQualityItem(2, 0, 2, 4, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 4, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 4, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 4, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 4, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function aocaibang()
    AddQualityItem(2, 0, 2, 5, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 5, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 5, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 5, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 5, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function longbao()
    AddQualityItem(2, 0, 2, 6, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 6, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 6, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 6, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 6, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function daoy()
    AddQualityItem(2, 0, 2, 8, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 8, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 8, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 8, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 8, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function hotrang()
    AddQualityItem(2, 0, 2, 9, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 9, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 9, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 9, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 9, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function huongsam()
    AddQualityItem(2, 0, 2, 10, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 10, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 10, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 10, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 10, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function kimphung()
    AddQualityItem(2, 0, 2, 11, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 11, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 11, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 11, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 11, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tamy()
    AddQualityItem(2, 0, 2, 12, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 12, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 12, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 12, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 12, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tienquan()
    AddQualityItem(2, 0, 2, 13, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 13, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 13, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 13, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 2, 13, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function hat()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Tú L« M·o", lomao}, {"Ngò L·o Qu¸n", laoquan}, {"Tu La Ph¸t KÕ", phatket},
                   {"Th«ng Thiªn Ph¸t Qu¸n", phatquan}, {"YÓm NhËt Kh«i", nhatkhoi},
                   {"TrÝch Tinh Hoµn", tinhhoan}, {"¤ Tµm M·o", tammao}, {"Quan ¢m Ph¸t Qu¸n", quanam},
                   {"¢m D­¬ng V« Cùc Qu¸n", amduong}, {"HuyÒn Tª DiÖn Tr¸o", dientrao},
                   {"Long HuyÕt §Çu Hoµn", longhuyet}, {"Long L©n Kh«i", lankhoi}, {"Thanh Tinh Thoa", tinhthoa},
                   {"Kim Phông TriÓn SÝ", triensi}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function lomao()
    AddQualityItem(2, 0, 7, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function laoquan()
    AddQualityItem(2, 0, 7, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function phatket()
    AddQualityItem(2, 0, 7, 2, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 2, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 2, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 2, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 2, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function phatquan()
    AddQualityItem(2, 0, 7, 3, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 3, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 3, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 3, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 3, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function nhatkhoi()
    AddQualityItem(2, 0, 7, 4, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 4, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 4, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 4, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 4, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tinhhoan()
    AddQualityItem(2, 0, 7, 5, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 5, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 5, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 5, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 5, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tammao()
    AddQualityItem(2, 0, 7, 6, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 6, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 6, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 6, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 6, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function quanam()
    AddQualityItem(2, 0, 7, 7, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 7, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 7, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 7, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 7, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function amduong()
    AddQualityItem(2, 0, 7, 8, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 8, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 8, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 8, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 8, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function dientrao()
    AddQualityItem(2, 0, 7, 9, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 9, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 9, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 9, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 9, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function longhuyet()
    AddQualityItem(2, 0, 7, 10, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 10, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 10, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 10, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 10, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function lankhoi()
    AddQualityItem(2, 0, 7, 11, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 11, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 11, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 11, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 11, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function tinhthoa()
    AddQualityItem(2, 0, 7, 12, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 12, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 12, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 12, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 12, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function triensi()
    AddQualityItem(2, 0, 7, 13, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 13, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 13, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 13, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 7, 13, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function glove()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long Phông HuyÕt Ngäc Tr¹c", ngoctrac}, {"Thiªn Tµm Hé UyÓn", houyen},
                   {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function ngoctrac()
    AddQualityItem(2, 0, 8, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function houyen()
    AddQualityItem(2, 0, 8, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 8, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function belt()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Thiªn Tµm Yªu §¸i", thientamyeu}, {"B¹ch Kim Yªu §¸i", bachkimyeudai},
                   {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function thientamyeu()
    AddQualityItem(2, 0, 6, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function bachkimyeudai()
    AddQualityItem(2, 0, 6, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 6, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function shoe()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Cöu TiÕt X­¬ng VÜ Ngoa", cuutien}, {"Thiªn Tµm Ngoa", thientam}, {"Kim Lò Hµi", kimlu},
                   {"Phi Phông Ngoa", phiphung}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function cuutien()
    AddQualityItem(2, 0, 5, 0, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 0, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 0, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 0, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 0, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function thientam()
    AddQualityItem(2, 0, 5, 1, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 1, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 1, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 1, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 1, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function kimlu()
    AddQualityItem(2, 0, 5, 2, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 2, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 2, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 2, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 2, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

function phiphung()
    AddQualityItem(2, 0, 5, 3, 10, 0, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 3, 10, 1, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 3, 10, 2, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 3, 10, 3, 0, -1, -1, -1, -1, -1, -1)
    AddQualityItem(2, 0, 5, 3, 10, 4, 0, -1, -1, -1, -1, -1, -1)
end

-------Trang BÞ HiÕm-------------
function TBHiem()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long T­¬ng Chi L©n", longtuong}, {"L¨ng V©n", pgaming}, {"Vò LiÖt", vuliet},
                   {"H¾c ThÇn", hacthan}, {"Th­¬ng Khung", unknow}, {"NhÉn §éc C«", docco},
                   {"Trang Søc Huynh §Ö", huynhde}, {"§éng S¸t", dongsat}, {"Cè S¬n", coson},
                   {"Set Cæ Th¸p", cothap}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

---------C¸c Trang BÞ Long T­¬ng-H¾c ThÇn---§éng S¸t--Vò LiÖt--------------------------
function cothap()
    for i = 5360, 5363 do
        AddGoldItem(0, i)
    end
end

function longtuong()
    for i = 5219, 5227 do
        AddGoldItem(0, i)
    end
end

function docco()
    for i = 4134, 4135 do
        AddGoldItem(0, i)
    end
end

function hacthan()
    for i = 4838, 4842 do
        AddGoldItem(0, i)
    end
end

function vuliet()
    for i = 5208, 5212 do
        AddGoldItem(0, i)
    end
end

function huynhde()
    AddGoldItem(0, 4436)
    AddGoldItem(0, 4481)
end

function dongsat()
    for i = 494, 497 do
        AddGoldItem(0, i)
    end
end

function unknow()
    for i = 5198, 5202 do
        AddGoldItem(0, i)
    end
end

function pgaming()
    for i = 5203, 5207 do
        AddGoldItem(0, i)
    end
end

function coson()
    AddGoldItem(0, 4129)
    AddGoldItem(0, 4133)
    AddGoldItem(0, 4441)
    AddGoldItem(0, 4445)
    AddGoldItem(0, 4449)
    AddGoldItem(0, 4453)
    AddGoldItem(0, 4457)
    AddGoldItem(0, 4461)
    AddGoldItem(0, 4465)
    AddGoldItem(0, 4469)
end
-------Ên Phi Phong-------------
function anphiphong()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ên", an}, {"Phi Phong", phiphong}, {"Trang Søc", trangsuc}, {"Hång ¶nh", honganh},
                   {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
---Ên------
function an()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"T©n NhËm Hµnh Ên Gi¸m (HË)", anha1}, {"T©n NhËm Hµnh Ên Gi¸m (Trung)", antrung1},
                   {"T©n NhËm Hµnh Ên Gi¸m (Th­îng)", anthuong1}, {"C­êng Hãa", cuonghoa},
                   {"Nh­îc Hãa", nhuochoa}, {"C­êng Hãa vµ Nh­îc Hãa", cuonghoanhuochoa},
                   {"Trë L¹i", anphiphong}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoa()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Hoµng Kim Ên (C­êng hãa) 1", nguhanhan, {1}},
                   {"Hoµng Kim Ên (C­êng hãa) 2", nguhanhan, {2}},
                   {"Hoµng Kim Ên (C­êng hãa) 3", nguhanhan, {3}},
                   {"Hoµng Kim Ên (C­êng hãa) 4", nguhanhan, {4}},
                   {"Hoµng Kim Ên (C­êng hãa) 5", nguhanhan, {5}},
                   {"Hoµng Kim Ên (C­êng hãa) 6", nguhanhan, {6}},
                   {"Hoµng Kim Ên (C­êng hãa) 7", nguhanhan, {7}},
                   {"Hoµng Kim Ên (C­êng hãa) 8", nguhanhan, {8}},
                   {"Hoµng Kim Ên (C­êng hãa) 9", nguhanhan, {9}},
                   {"Hoµng Kim Ên (C­êng hãa) 10", nguhanhan, {10}}, {"Trë L¹i", an}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nhuochoa()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Hoµng Kim Ên (Nh­îc hãa) 1", nguhanhan, {11}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 2", nguhanhan, {12}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 3", nguhanhan, {13}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 4", nguhanhan, {14}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 5", nguhanhan, {15}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 6", nguhanhan, {16}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 7", nguhanhan, {17}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 8", nguhanhan, {18}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 9", nguhanhan, {19}},
                   {"Hoµng Kim Ên (Nh­îc hãa) 10", nguhanhan, {20}}, {"Trë L¹i", an}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoanhuochoa()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ngò Hµnh Ên 1", nguhanhan, {21}}, {"Ngò Hµnh Ên 2", nguhanhan, {22}},
                   {"Ngò Hµnh Ên 3", nguhanhan, {23}}, {"Ngò Hµnh Ên 4", nguhanhan, {24}},
                   {"Ngò Hµnh Ên 5", nguhanhan, {25}}, {"Ngò Hµnh Ên 6", nguhanhan, {26}},
                   {"Ngò Hµnh Ên 7", nguhanhan, {27}}, {"Ngò Hµnh Ên 8", nguhanhan, {28}},
                   {"Ngò Hµnh Ên 9", nguhanhan, {29}}, {"Ngò Hµnh Ên 10", nguhanhan, {30}}, {"Trë L¹i", an},
                   {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nguhanhan(nId)
    for i = 3205, 3205 do
        AddGoldItem(0, 1 * nId + i - 1)
    end
end
---Phi Phong------
function phiphong()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Phi Phong CÊp ThÊp", phiphong1}, {"Phi Phong PhÖ Quang", phiphongphequang},
                   {"Phi Phong KhÊp ThÇn", phiphongkhapthan}, {"Phi Phong K×nh Thiªn", phiphongkinhthien},
                   {"Phi Phong V« Cùc", phiphongvocuc}, {"Phi Phong Cao CÊp", phiphongcaocap},
                   {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function anha1()
    AddGoldItem(0, 5930)
end

function antrung1()
    AddGoldItem(0, 5931)
end

function anthuong1()
    AddGoldItem(0, 5932)
end

function phiphong1()
    for i = 3465, 3475 do
        AddGoldItem(0, i)
    end
end
function phiphongphequang()
    for i = 3476, 3478 do
        AddGoldItem(0, i)
    end
end
function phiphongkhapthan()
    for i = 3479, 3481 do
        AddGoldItem(0, i)
    end
end
function phiphongkinhthien()
    for i = 3482, 3484 do
        AddGoldItem(0, i)
    end
end
function phiphongvocuc()
    for i = 3485, 3487 do
        AddGoldItem(0, i)
    end
end
function phiphongcaocap()
    for i = 3488, 3490 do
        AddGoldItem(0, i)
    end
end
-----Trang Søc------------
function trangsuc()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long ChuÕn Vu D·", longchien}, {"Trang Søc 1", trangsuc1}, {"Trang Søc 2", trangsuc2},
                   {"Long §¶m", longdam}, {"Cuång Lan", cuonglan}, {"Trë L¹i", anphiphong}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function longchien()
    AddGoldItem(0, 5657)
end

function trangsuc1()
    for i = 3542, 3554 do
        AddGoldItem(0, i)
    end
    for i = 3491, 3506 do
        AddGoldItem(0, i)
    end
end
function trangsuc2()
    AddGoldItem(0, 3506)
    AddGoldItem(0, 3880)
    AddGoldItem(0, 3881)
    AddGoldItem(0, 3882)
    AddGoldItem(0, 3883)
    AddGoldItem(0, 3884)
    AddGoldItem(0, 3885)
    AddGoldItem(0, 3886)
    AddGoldItem(0, 3887)
    AddGoldItem(0, 3888)
end
function longdam()
    for i = 4483, 4487 do
        AddGoldItem(0, i)
    end
end
function cuonglan()
    for i = 4488, 4492 do
        AddGoldItem(0, i)
    end
end
---Hång ¶nh------
function honganh()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Hång ¶nh Th­êng", honganh1}, {"Hång ¶nh Hoµng Mü", honganh2}, {"Trë L¹i", anphiphong},
                   {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function honganh1()
    for i = 204, 207 do
        AddGoldItem(0, i)
    end
end
function honganh2()
    for i = 434, 437 do
        AddGoldItem(0, i)
    end
end

------NhËn VËt PhÈm-----------
function NhanVatPham()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"VËt PhÈm Trïng Sinh", trungsinh}, -- {"NhËn 50 item",TaoItem2},
    -- {"NhËn 100 item",TaoItem3},
    {"Nguyªn LiÖu ChÕ T¹o §å TÝm", epdotim}, {"VËt PhÈm Kh¸c", vatphamkhac}, {"Trë L¹i", main}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

-----------Trïng Sinh----------------------------------------------------------------------------------------------
VPTrungSinh = {{
    szName = "<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>",
    tbProp = {6, 1, 1390, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "<B¾c §Èu Tr­êng Sinh ThuËt - §¹i Thõa T©m Ph¸p>",
    tbProp = {6, 1, 2974, 0, 0, 0},
    tbParam = {60}
}, -- {szName="TÝch LÞch §¬n", tbProp={6,1,2973,0,0,0}},
{
    szName = "B¾c §Èu TÈy Tñy §¬n",
    tbProp = {6, 1, 30127, 0, 0, 0},
    tbParam = {60}
}}
function trungsinh()
    local szTitle = LENHBAI_ADMIN .. "<#>Xin chµo <color=red>" .. GetName() ..
                        "<color>. Xin mêi chän VËt PhÈm cÇn sö dông.\n\nHiÖn t¹i cã <color=red>" ..
                        GetPlayerCount() .. " <color>ng­êi ch¬i ®ang trùc tuyÕn.<color>"
    local tbOpt = {}
    local nCount = getn(VPTrungSinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("NhËn %s", VPTrungSinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemTS, {i}})
    end
    tinsert(tbOpt, {"TÝch LÞch §¬n", tichlichdon})
    tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
    tinsert(tbOpt, {"Tho¸t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTS(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_TS, {nIndex}})
end
function get_item_TS(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", VPTrungSinh[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(VPTrungSinh[nIndex], szLogTitle, nCount)
end
function tichlichdon()
    for i = 1, 999 do
        AddItem(6, 1, 2973, 0, 0, 0)
    end
end
-----------Ðp ®å tÝm----------------------------------------------------------------------------------------------
function epdotim()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"HuyÒn Tinh", HuyenTinh}, {"Thñy Tinh", ThuyTinh}, {"Phóc Duyªn", PhucDuyen},
                   {"Kho¸ng Th¹ch ChÕ T¹o", khoangthach}, {"Manh Thiªn Th¹ch", manhthienthach},
                   {"Trë L¹i", NhanVatPham}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
-----------HuyÒn Tinh----------------------------------------------------------------------------------------------
NhanHuyenTinh = {{
    szName = "HuyÒn Tinh CÊp 1",
    tbProp = {6, 1, 147, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 2",
    tbProp = {6, 1, 147, 2, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 3",
    tbProp = {6, 1, 147, 3, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 4",
    tbProp = {6, 1, 147, 4, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 5",
    tbProp = {6, 1, 147, 5, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 6",
    tbProp = {6, 1, 147, 6, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 7",
    tbProp = {6, 1, 147, 7, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 8",
    tbProp = {6, 1, 147, 8, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 9",
    tbProp = {6, 1, 147, 9, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "HuyÒn Tinh CÊp 10",
    tbProp = {6, 1, 147, 10, 0, 0, 0},
    tbParam = {60}
}}
function HuyenTinh()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanHuyenTinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("NhËn %s", NhanHuyenTinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemHT, {i}})
    end
    tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
    tinsert(tbOpt, {"Tho¸t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemHT(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_HT, {nIndex}})
end
function get_item_HT(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanHuyenTinh[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanHuyenTinh[nIndex], szLogTitle, nCount)
end
-----Thuy Tinh---------
NhanThuyTinh = {{
    szName = "Tö Thñy Tinh",
    tbProp = {4, 239, 1, 1, 0, 0},
    tbParam = {60}
}, {
    szName = "Lam Thñy Tinh",
    tbProp = {4, 238, 1, 1, 0, 0},
    tbParam = {60}
}, {
    szName = "Lôc Thñy Tinh",
    tbProp = {4, 240, 1, 1, 0, 0},
    tbParam = {60}
}}
function ThuyTinh()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanThuyTinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("NhËn %s", NhanThuyTinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemTT, {i}})
    end
    tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
    tinsert(tbOpt, {"Tho¸t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTT(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_TT, {nIndex}})
end
function get_item_TT(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanThuyTinh[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanThuyTinh[nIndex], szLogTitle, nCount)
end
-----Phuc Duyen---------
NhanPhucDuyen = {{
    szName = "Phóc Duyªn TiÓu",
    tbProp = {6, 1, 122, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Phóc Duyªn Trung",
    tbProp = {6, 1, 123, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Phóc Duyªn §¹i",
    tbProp = {6, 1, 124, 1, 0, 0, 0},
    tbParam = {60}
}}
function PhucDuyen()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanPhucDuyen)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("NhËn %s", NhanPhucDuyen[i].szName)
        tinsert(tbOpt, {szOption, get_itemPD, {i}})
    end
    tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
    tinsert(tbOpt, {"Tho¸t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemPD(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_PD, {nIndex}})
end
function get_item_PD(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanPhucDuyen[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanPhucDuyen[nIndex], szLogTitle, nCount)
end
-----Kho¸ng Th¹ch---------
function khoangthach()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Trang Phôc HÖ Kim", hekim}, {"Trang Phôc HÖ Méc", hemoc}, {"Trang Phôc HÖ Thñy", hethuy},
                   {"Trang Phôc HÖ Háa", hehoa}, {"Trang Phôc HÖ Thæ", hetho}, {"Trë L¹i", epdotim}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function hekim()
    AddItem(6, 1, 149, 1, 0, 0, 0)
    AddItem(6, 1, 150, 1, 0, 0, 0)
    AddItem(6, 1, 151, 1, 0, 0, 0)
    AddItem(6, 1, 152, 1, 0, 0, 0)
    AddItem(6, 1, 153, 1, 0, 0, 0)
    AddItem(6, 1, 154, 1, 0, 0, 0)
end
function hemoc()
    AddItem(6, 1, 149, 1, 0, 0, 0)
    AddItem(6, 1, 150, 1, 1, 0, 0)
    AddItem(6, 1, 151, 1, 0, 0, 0)
    AddItem(6, 1, 152, 1, 1, 0, 0)
    AddItem(6, 1, 153, 1, 0, 0, 0)
    AddItem(6, 1, 154, 1, 1, 0, 0)
end
function hethuy()
    AddItem(6, 1, 149, 1, 0, 0, 0)
    AddItem(6, 1, 150, 1, 2, 0, 0)
    AddItem(6, 1, 151, 1, 0, 0, 0)
    AddItem(6, 1, 152, 1, 2, 0, 0)
    AddItem(6, 1, 153, 1, 0, 0, 0)
    AddItem(6, 1, 154, 1, 2, 0, 0)
end
function hehoa()
    AddItem(6, 1, 149, 1, 0, 0, 0)
    AddItem(6, 1, 150, 1, 3, 0, 0)
    AddItem(6, 1, 151, 1, 0, 0, 0)
    AddItem(6, 1, 152, 1, 3, 0, 0)
    AddItem(6, 1, 153, 1, 0, 0, 0)
    AddItem(6, 1, 154, 1, 3, 0, 0)
end
function hetho()
    AddItem(6, 1, 149, 1, 0, 0, 0)
    AddItem(6, 1, 150, 1, 4, 0, 0)
    AddItem(6, 1, 151, 1, 0, 0, 0)
    AddItem(6, 1, 152, 1, 4, 0, 0)
    AddItem(6, 1, 153, 1, 0, 0, 0)
    AddItem(6, 1, 154, 1, 4, 0, 0)
end
-----Manh Thien Thach---------
function manhthienthach()
    AddEventItem(1317)
    AddEventItem(1318)
    AddEventItem(1319)
    AddEventItem(1320)
    AddEventItem(1321)
    AddEventItem(1322)
    AddEventItem(1323)
    AddEventItem(1324)
    AddEventItem(1325)
end
----VP KHAC------------
VPKHAC = {{
    szName = "Håi Thiªn T¸i T¹o LÔ Bao",
    tbProp = {6, 1, 1781, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Khiªu ChiÕn LÖnh.",
    tbProp = {6, 1, 1499, 0, 0, 0}
}, {
    szName = "Cµn Kh«n Song TuyÖt Béi",
    tbProp = {6, 1, 2219, 0, 0, 0}
}, {
    szName = "Nh¹c V­¬ng KiÕm LÔ Bao",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Long HuyÕt Hoµng",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Tö MÉu LÖnh",
    tbProp = {6, 1, 1427, 0, 0, 0}
}, {
    szName = "TÝn VËt M«n Ph¸i",
    tbProp = {6, 1, 1670, 0, 0, 0}
}, {
    szName = "TÝn VËt D­¬ng Anh",
    tbProp = {6, 1, 1671, 0, 0, 0}
}, {
    szName = "Hçn Nguyªn Linh Lé",
    tbProp = {6, 1, 2312, 1, 0, 0}
}, {
    szName = "§¹i Lùc Hoµn LÔ Hép",
    tbProp = {6, 1, 2517, 0, 0, 0}
}, {
    szName = "ThËp Toµn §¹i Bæ",
    tbProp = {6, 1, 1399, 0, 0, 0}
}}
function vatphamkhac()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(VPKHAC)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("NhËn %s", VPKHAC[i].szName)
        tinsert(tbOpt, {szOption, get_itemKhac, {i}})
    end
    tinsert(tbOpt, {"Trë VÒ", NhanVatPham})
    tinsert(tbOpt, {"Tho¸t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemKhac(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "NhËp Sè L­îng:", {get_item_Khac, {nIndex}})
end
function get_item_Khac(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt <color=yellow>%d<color> « trèng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", VPKHAC[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(VPKHAC[nIndex], szLogTitle, nCount)
end

function doiten()
    AskClientForString("doitennv", "", 1, 100, "Xin nhËp tªn míi");
end
function doitennv(strings)
    RenameRole(strings)
end

--------------------------------------------------------1296 tang toc do di chuye
local tbEquipFreeCell = {{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1}, {2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1}}

-------------Tao ITEM-------------------------------------------------------------------
function TaoItem()
    g_AskClientStringEx("6,1,222,0,0,0", 1, 9000, "NhËp Vµo Item Code:", {TaoItemID})
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
        if (itlv > 10) then
            Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>", itlv));
            return
        end
        if (itmagic == nil) then
            itmagic = 0;
        end
        AddItem(itclass, ittype, itid, itlv, itseri, itluck, itmagic);
    else
        local EquipId = tonumber(szICode[1]);
        AddGoldItem(0, EquipId);
    end
end
---Ve BLH------------
function GoBLH()
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 200 * 8, 200 * 16)
    else
        SetPos(200 * 8, 200 * 16)
    end
    Msg2Player("B¹n di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng.");
end

----Vßng S¸ng - Danh HiÖu------
function vongsang(nindex)
    Title_AddTitle(nindex, 1, 4302359);
    Title_ActiveTitle(nindex);
    SetTask(1122, nindex);
end

function nhandanhhieu()
    local szTitle = "<npc>Xin chµo <color=yellow>" .. GetName() .. "<color> , xin mêi chän Danh HiÖu...!!!"
    local tbOpt = {{"Th¸i thó Ph­îng T­êng.", vongsang, {153}}, {"Th¸i thó Thµnh §«.", vongsang, {154}},
                   {"Th¸i thó §¹i Lý.", vongsang, {155}}, {"Th¸i thó BiÖn Kinh.", vongsang, {156}},
                   {"Th¸i thó T­¬ng D­¬ng.", vongsang, {157}}, {"Th¸i thó D­¬ng Ch©u.", vongsang, {158}},
                   {"Th¸i thó L©m An.", vongsang, {159}}, {"Vâ L©m Liªn §Êu Qu¸n Qu©n.", vongsang, {81}},
                   {"Vâ L©m Liªn §Êu H¹ng 2.", vongsang, {82}}, {"Vâ L©m Liªn §Êu H¹ng 3.", vongsang, {83}},
                   {"Vâ L©m Liªn §Êu H¹ng 4.", vongsang, {84}}, {"Trang KÕ", danhhieu2}, {"Trë L¹i", main},
                   {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu2()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Vßng S¸ng ADM.", vongsang, {228}}, {"NhÊt §¹i T«ng S­", vongsang, {239}},
                   {"Phiªu M· §¹i T­íng Qu©n.", vongsang, {185}}, {"Vâ Häc Kú Tµi.", vongsang, {258}},
                   {"Ngù Long Cuång §ao.", vongsang, {165}}, {"TuyÖt ThÕ Cao Thñ.", vongsang, {240}},
                   {"Long ThÇn KiÕm.", vongsang, {80}}, {"Th©n Thñ BÊt Phµm.", vongsang, {256}},
                   {"B¸ Chñ ThÊt Thµnh.", vongsang, {193}}, {"Thiªn H¹ §Ö NhÊt Bang.", vongsang, {142}},
                   {"Trang KÕ", danhhieu3}, {"Trë L¹i", nhandanhhieu}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu3()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"§éc B¸ Thiªn H¹", vongsang, {325}}, {"Uy M·nh V« Song­", vongsang, {326}},
                   {"Lùc ¸p QuÇn Hïng", vongsang, {327}}, {"Tø TuyÖt chiÕn tr­êng", vongsang, {328}},
                   {"Ngò TuyÖt chiÕn tr­êng", vongsang, {329}}, {"Lôc TuyÖt chiÕn tr­êng", vongsang, {330}},
                   {"ThÊt TuyÖt chiÕn tr­êng", vongsang, {331}}, {"B¸t TuyÖt chiÕn tr­êng", vongsang, {332}},
                   {"Cöu TuyÖt chiÕn tr­êng", vongsang, {333}}, {"ThËp TuyÖt chiÕn tr­êng", vongsang, {334}},
                   {"Trang KÕ", danhhieu4}, {"Trë L¹i", nhandanhhieu2}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu4()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"TriÖu M·nh", vongsang, {408}}, {"Thiªn H¹ V« §Þch", vongsang, {421}},
                   {"Thiªn H¹ ThËp C­êng", vongsang, {422}}, {"T©n thñ", vongsang, {423}},
                   {"Vua PK.", vongsang, {229}}, {"§éc C« CÇu B¹i", vongsang, {237}},
                   {"Long Tranh Hæ ®Êu", vongsang, {236}}, {"Míi nhËp giang hå ", vongsang, {244}},
                   {"Vâ L©m Minh Chñ", vongsang, {245}}, {"Vâ L©m ChÝ T«n.", vongsang, {238}},
                   {"Trë L¹i", danhhieu4}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

---------------Má Réng R­¬ng--------------------------------------
function moruong()
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    AddItem(6, 1, 1427, 90, 1, 0, 0)
end
----------------------NhËn TrÊn Bang Chi B¶o-------------------------------------------------------------
function TBCB()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"ThiÕu L©m", CBTL}, {"Thiªn V­¬ng", CBTV}, {"Nga My", CBNM}, {"Thóy Yªn", CBTY},
                   {"Ngò §éc", CBND}, {"§­êng M«n", CBDM}, {"C¸i Bang", CBCB}, {"Thiªn NhÉn", CBTN},
                   {"Vâ §ang", CBVD}, {"C«n L«n", CBCL}, {"Trë L¹i", TrangBi}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function CBTL()

    AddGoldItem(0, 769)
    AddGoldItem(0, 771)
    AddGoldItem(0, 776)
end

function CBTV()
    AddGoldItem(0, 793)
end

function CBNM()
    AddGoldItem(0, 796)
    AddGoldItem(0, 801)
    AddGoldItem(0, 808)
end

function CBTY()
    AddGoldItem(0, 811)
    AddGoldItem(0, 816)
end

function CBND()
    AddGoldItem(0, 829)
    AddGoldItem(0, 834)
end

function CBDM()
    AddGoldItem(0, 843)
    AddGoldItem(0, 854)
end

function CBCB()
    AddGoldItem(0, 855)
end

function CBTN()
    AddGoldItem(0, 868)
    AddGoldItem(0, 874)
    AddGoldItem(0, 876)
end

function CBVD()
    AddGoldItem(0, 881)
    AddGoldItem(0, 888)
end

function CBCL()
    AddGoldItem(0, 891)
    AddGoldItem(0, 898)
    AddGoldItem(0, 901)
end

-------------------Pet----------------------
function Pet()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Chän Pet", Pet1}, {"Xãa Pet", Pet2}, {"Trë l¹i", Pet}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end

function Pet1()
    local szTitle = LENHBAI_ADMIN .. "Xin chµo Admin <color=red>" .. GetName() ..
                        "<color>,Nh÷ng chøc n¨ng bªn d­íi cã thÓ gióp b¹n kiÓm tra Server hoÆc hæ trî ng­êi ch¬i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Chu T­íc", Pet3}, {"Háa Kú L©n", Pet4}, {"Thanh Long", Pet5}, {"HuyÒn Vò", Pet6},
                   {"B¹ch Hæ", Pet7}, {"Trë L¹i", Pet}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function Pet3()
    local partneridex = PARTNER_AddFightPartner(4, 4, 1, 5, 5, 5, 5, 5, 5)
    PARTNER_CallOutCurPartner(1)
end
function Pet4()
    local partneridex = PARTNER_AddFightPartner(1, 1, 1, 5, 5, 5, 5, 5, 5)
    PARTNER_CallOutCurPartner(1)
end
function Pet5()
    local partneridex = PARTNER_AddFightPartner(2, 2, 1, 5, 5, 5, 5, 5, 5)
    PARTNER_CallOutCurPartner(1)
end
function Pet6()
    local partneridex = PARTNER_AddFightPartner(3, 3, 1, 5, 5, 5, 5, 5, 5)
    PARTNER_CallOutCurPartner(1)
end
function Pet7()
    local partneridex = PARTNER_AddFightPartner(5, 0, 1, 5, 5, 5, 5, 5, 5)
    PARTNER_CallOutCurPartner(1)
end

function Pet2()
    PARTNER_RemovePartner(1, 1, 1, 5, 5, 5, 5, 5, 5)
end
