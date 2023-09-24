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
LENHBAI_ADMIN = "<#><link=image[0]:\\spr\\item\\sprADMIN.spr>L�nh B�i GM: <link>"
function main()
    dofile("script/global/gm/lbadmin.lua")
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Qu�n L� Server", QLServer}, {"Qu�n l� Nh�n v�t", nhan_vat},
                   {"Ch�c N�ng Bang H�i", DMcreattongtest}, {"Nh�n Trang B�", TrangBi},
                   {"Nh�n V�t Ph�m", NhanVatPham}, {"KickOutSelf()", KickOutSelf}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
    return 1;
end

function CS5()
    ST_DoTransLife()
end
---------------------------------Nh�n v�t---------------------------------
function nhan_vat()
    local tbSay = { --
    {"Di chuy�n v� Ba L�ng Huy�n", GoBLH}, --
    {"H�c k� n�ng M�n ph�i", change_phai}, {"Nh�n Danh hi�u", nhandanhhieu}, --
    {"Thay ��i ngo�i h�nh trang b�", change_feature}, --
    {"��i gi�i t�nh", xacnhan}, --
    {"��i Ng� h�nh", ngu_hanh}, --
    {"M� r�ng r��ng", moruong}, --
    {"Tr� l�i"}, {"Tho�t", no}}
    CreateNewSayEx("Xin ch�o <bclr=red>" .. GetName() .. "b�n mu�n l�m g�?", tbSay)
end

---------------------��i gi�i t�nh-------------------------
function xacnhan()
    local szTitle = "<color=red>" .. GetName() .. "<color> ng��i c� ch�c ch�n mu�n thay ��i gi�i t�nh kh�ng?"
    local tbOpt = {"X�c nh�n!/change_sex", "Tr� l�i/nhan_vat", "K�t th�c ��i tho�i/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function change_sex()
    if GetSex() == 1 then
        SetSex(0)
    else
        SetSex(1)
    end
    Talk(1, "KickOutSelf", "�� chuy�n gi�i th�nh c�ng")
end
---------------------��i Ng� h�nh-------------------------
tbSeries = { -- table ng� h�nh
    [0] = {"Kim", "yellow"},
    [1] = {"M�c", "green"},
    [2] = {"Thu�", "blue"},
    [3] = {"Ho�", "red"},
    [4] = {"Th�", "orange"}
}

function ngu_hanh()
    local nSeries = GetSeries()
    local tbSay = {format(
        "<color=red>%s<color> hi�n t�i l� h� <color=%s>%s<color>.\nH�y ch�n ng� h�nh mu�n chuy�n:", GetName(),
        tbSeries[nSeries][2], tbSeries[nSeries][1])}
    for id, _ in tbSeries do
        tinsert(tbSay, format("%s/#change_5hanh(%d)", tbSeries[id][1], id))
        -- tinsert(tbSay, tbSeries[id][1].."/#change_5hanh("..id..")")
    end
    tinsert(tbSay, "Tr� l�i/nhan_vat")
    tinsert(tbSay, "Tho�t/no")

    CreateTaskSay(tbSay)
end

function change_5hanh(num)
    local nSeries = GetSeries()
    if nSeries == num then
        Talk(1, "", format("�� l� h� <color=%s>%s<color> r�i, kh�ng c�n chuy�n n�a!", tbSeries[num][2],
            tbSeries[num][1]))
    else
        SetSeries(num)
        Talk(1, "KickOutSelf", format("�� chuy�n sang h� <color=%s>%s<color>!", tbSeries[num][2], tbSeries[num][1]))
    end
end
---------------------��i Ngo�i trang-------------------------
tbNgoaiTrang = {
    [0] = "Ngo�i h�nh NPC",
    [1] = "Ngo�i h�nh M�",
    [2] = "Ngo�i h�nh �o",
    [3] = "Ngo�i h�nh V� kh�",
    [4] = "Ngo�i h�nh Ng�a"
}

function change_feature()
    local tbSay = { --
    {"Xem tr��c ngo�i h�nh", feature_preview}, --
    {"Ki�m tra ID ngo�i trang", CheckFeature}, --
    {"��i ngo�i h�nh trang b� theo ID", feature_item_ui}, --
    {"��i ngo�i h�nh v� kh� (S� d�ng menu)", feature_item}, --
    {"Ph�c h�i ngo�i h�nh g�c", restore_feature_item}, --    
    {"Tho�t", no}}
    CreateNewSayEx("Xin ch�o <bclr=red>" .. GetName() .. "<bclr> ta c� th� gi�p g� ���c ng��i?", tbSay)
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
        tinsert(tbSay, {"Xem h��ng d�n", feature_preview, {1}})
        for i = 0, getn(tbNgoaiTrang) do
            tinsert(tbSay, {tbNgoaiTrang[i], askStartID, {i}})
        end
        tinsert(tbSay, {"Tho�t", no})
        CreateNewSayEx("Xin ch�o <bclr=red>" .. GetName() .. "<bclr> ta c� th� gi�p g� ���c ng��i?", tbSay)
    else
        Say(strfill_center("Ch�c n�ng thay ��i ngo�i h�nh trang b�", 50) ..
                "\n\nCh�n ki�u ngo�i trang mu�n xem tr��c.\nNh�p ID b�t ��u xem.\nSau �� s� d�ng <color=yellow>��i H�ng Bao<color> v� <color=yellow>Ti�u H�ng Bao<color> �� xem ngo�i trang.\nSau khi ch�n ���c ngo�i h�nh �ng � th� s� d�ng ch�c n�ng ��i ngo�i h�nh trang b� theo ID �� thay ��i.",
            1, {"Ta �� hi�u.../change_feature"})
    end
end

function askStartID(nId)
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr��c ngo�i h�nh <color=yellow>" .. tbNgoaiTrang[nId])
    g_AskClientNumberEx(1, 9999, "Start ID", {SetTaskTemp, {169}})
end
function feature_item_ui()
    GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        "feature_item_tb_confirm", "onCancel", 1);
end

function feature_item_tb_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "Nh�p ID mu�n ��i:", {SetItemNewFeature, {nItemIndex}})
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
    local tbSay = {"Th�ng tin ng��i ch�i/Show", "Thao t�c l�n ng��i ch�i/luachonid1", "Tr� l�i", "Tho�t/no"}

    Say("Xin Ch�o <color=red>" .. GetName() .. "<color>!\nT�a �� hi�n t�i: <color=green>" .. nW ..
            "<color> <color=blue>" .. nX .. "/" .. nY .. "<color> \n<color>Index:           <color=green>" .. nIdPlay ..
            "<color>\nS� SHXT: <color=green>        " .. GetTask(T_SonHaXaTac) ..
            "<color> m�nh.\nHi�n �ang C�:    <bclr=red><color=yellow>[" .. GetPlayerCount() ..
            "]<color><bclr> ng��i ch�i trong game.\n", getn(tbSay), tbSay)
end

function Show()
    AskClientForNumber("Show1", 1, 1180, "Nh�p s� ti�n c�n chuy�n")
end

function Show1(num)
    local nNum = num + 20
    for i = num, nNum do
        gmidx = PlayerIndex
        PlayerIndex = i
        TarName = GetName()
        PlayerIndex = gmidx
        Msg2Player("PlayIndex:<color=green> " .. i .. "<color> - T�n:<color=green> " .. TarName .. "");
    end
end

function luachonid1()
    AskClientForNumber("one", 0, 5000, "Nh�p ID ng��i ch�i")
end

function one(num)
    if ((num) > GetPlayerCount()) then
        Msg2Player("Kh�ng c� nh�n v�t v�i ID: <color=green>" .. num .. "<color> ���c ch�n !!");
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
        Msg2Player("Nh�n v�t t�n:<color=metal> " .. ObjName .. "<color>");
        local tbSay = {"T�ng c�p �� cho ng��i ch�i/tangcap1", "H� tr� ti�n ��ng/bufskillsgm1",
                       "H� tr� ti�n v�n/themtienvan1", "Di chuy�n nh�n v�t v� BLH/move",
                       "Add �i�m cho ng��i ch�i./buffpoint", "K�ch nh�n v�t/kich", "C�m Ch�t/camchat",
                       "M� Ch�t/mochat", "Tho�t/no", "Tr� l�i"}
        Say("T�i Kho�n:<color=green> " .. tk .. "<color>  - Nh�n V�t   :<color=green> " .. ObjName ..
                "<color>\nC�p ��   :<color=green> " .. lev .. "<color>           - Kinh nghi�m: <color=green>" .. xp ..
                "%<color>\nM�u      :<color=green> " .. cam .. "<color>             - M�n ph�i   :<color=green>" ..
                fac .. "<color>\nTi�n M�t :<color=green> " .. (cash / 10000) ..
                " v�n<color> - Ti�n ��ng  :<color=green>" .. lif .. " ��ng<color>\nV� tr�   : <color=blue>" .. w ..
                "<color>,<color=green>" .. x .. "<color>,<color=green>" .. y .. "<color>", getn(tbSay), tbSay)
        Msg2Player("Ng��i ch�i <color=cyan>" .. xinxi)
    end
end
function themtienvan1()
    AskClientForNumber("themtienvan", 0, 2000000000, "Nh�p s� ti�n c�n chuy�n")
end
function themtienvan(num)
    nNum = num / 10000
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� th�m <color=metal>" .. nNum ..
                   "<color> v�n l��ng cho b�n !");
    Earn(num)
    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName .. "<color> ���c b�n th�m <color=metal>" .. nNum ..
                   "<color> v�n l��ng th�nh c�ng");
end
function bufskillsgm1()
    AskClientForNumber("buffskillsgm", 0, 500, "s� l��ng ti�n ��ng")
end
function buffskillsgm(num)
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� chuy�n <color=metal>" .. num ..
                   "<color> ti�n ��ng cho b�n !");
    AddStackItem(num, 4, 417, 1, 1, 0, 0, 0)
    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName .. "<color> ���c b�n t�ng <color=metal>" .. num ..
                   "<color> ti�n ��ng th�nh c�ng");
end
function buffpoint()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� t�ng �i�m theo y�u c�u!");

    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName .. "<color> ���c b�n t�ng �i�m theo y�u c�u th�nh c�ng");
end

function tangcap1()
    AskClientForNumber("tangcap", 0, 200, "c�p c�n t�ng")
end
function tangcap(num)
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� t�ng <color=metal>" .. num ..
                   "<color> c�p �� cho b�n !");
    for i = 1, num do
        AddOwnExp(999999999999)
    end
    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName .. "<color> ���c b�n t�ng <color=metal>" .. num ..
                   "<color> c�p �� th�nh c�ng");
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
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� di chuy�n b�n v� Ba L�ng Huy�n");
    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName ..
                   "<color> ���c b�n di chuy�n v� Ba L�ng Huy�n th�nh c�ng");
end

function kich()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    Msg2Player("Qu�n l� <color=green>" .. gmName .. "<color> �� kick k�t t�i kho�n cho b�n");
    KickOutSelf()
    PlayerIndex = gmidx
    Msg2Player("Nh�n v�t <color=green>" .. ObjName .. "<color> ���c b�n kick k�t t�i kho�n th�nh c�ng");
end

function camchat()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    SetChatFlag(1)
    Msg2Player("B�n b� kh�a Ch�t tr�n m�i t�n s� !")
    PlayerIndex = gmidx
    AddGlobalCountNews("Nh�n V�t:<color=red> " .. ObjName .. "<color> �� B� C�m Chat Tr�n M�i T�n S� !", 1)
end

function mochat()
    gmidx = PlayerIndex
    PlayerIndex = GetTaskTemp(200)
    SetChatFlag(0)
    Msg2Player("B�n ���c m� kh�a Ch�t tr�n m�i t�n s� !")
    PlayerIndex = gmidx
    AddGlobalCountNews("Nh�n V�t:<color=green> " .. ObjName .. "<color> ���c M� Chat Tr�n M�i T�n S� !", 1)
end

function laytoado()
    local w, x, y = GetWorldPos()
    local nIdPlay = PlayerIndex
    Say("M�p s� <color=Green>" .. w .. "<color> t�a �� <color=Yellow>" .. x .. ", " .. y)
end

----------BANG HOI--------------
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function DMcreattongtest()
    local strTongName = GetTongName()
    if (strTongName == nil or strTongName == "") then
        local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                            "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                            GetPlayerCount() .. "<color>"
        local tbOpt = {{"Nh�n �i�u Ki�n T�o Bang H�i", dmcreatetong}, {"Gia Nh�p Bang H�i", dmjointong},
                       {"T�o Bang H�i", dmcreateit}, {"Tr� L�i", main}, {"Tho�t"}}
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
    Msg2Player("<color=yellow>Ng���i �� h�i �� t�t c� �i�u ki�n �� t�o Bang H�i!<color>")
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
        Msg2Player("<color=yellow>Gia nh�p Bang h�i th�nh c�ng!<color>")
    else
    end
end
function dmcreateit()
    Tong_name, oper = GetTong()
    if (oper == 0) and (GetTask(99) == 1) then
        Say("Ki�m hi�p ch��ng m�n nh�n:Khai s�ng bang h�i, m� r�ng b� nghi�p.", 2,
            "B�t ��u d�ng bang/Direct_CreateTong", "��i ta m�t ch�t/wait_a_moment")
    elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and
        (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
        Talk(6, "create_pay",
            "Ng��i ch�i: Ki�m hi�p ch��ng m�n nh�n, xin h�i ta ph�i l�m nh� th� n�o m�i ca th� khai t�ng l�p ph�i tr� th�nh Bang ch� ��y?",
            "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ng��i ph�i c� �� n�ng l�c l�nh ��o, c� 16 ng��i c�ng ch� h��ng c�ng ng��i l�p bang, tr�i qua 3 ng�y Kh�o Nghi�m K� ",
            "Ch��ng m�n nh�n:  N�u trong 3 ng�y c� ng��i r�i bang th� n�i trong 3 ng�y �� ng��i ph�i t�m ng��i kh�c thay th�.",
            "Ch��ng m�n nh�n:  Ng��i ph�i c� �� t�i l�nh ��o v� t�n v�t �� l� Nh�c V��ng Ki�m",
            "Ng��i ch�i: Nh�c V��ng Ki�m ? Ng��i n�i l� thanh ki�m n�y � ? ",
            "Ki�m hi�p ch��ng m�n nh�n : Th� ra l� ng��i �� c� n�... Kh�ng t�, qu� nhi�n tu�i tr� t�i cao!!! ")
    else
        i = random(0, 1)
        if (i == 0) then
            Talk(1, "",
                "Ki�m hi�p ch��ng m�n nh�n: N�u nh� mu�n th�nh l�p bang h�i, ng��i c� th� v� n� b� ra 1 l��ng l�n th�i gian, s�c l�c c�ng t�m huy�t, kh�ng th� n�a ���ng h�y b�.")
        else
            Talk(6, "",
                "Ki�m hi�p ch��ng m�n nh�n:  Ng��i mu�n h�i �i�u ki�n l�p bang �? �� ta n�i cho ng��i r�.",
                "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ph�i xu�t x�,  ti�p theo ng��i kh�ng th� � b�t k� bang h�i n�o kh�c, ng��i nh�t �inh ph�i c� danh v�ng giang h�, cu�i c�ng l� t�i l�nh ��o ph�i h�n 30 c�p.",
                "Ki�m hi�p ch��ng m�n nh�n: Sau �� �i chi�n tr��ng t�m m�t thanh Nh�c V��ng Ki�m l�m bang ch� t�n v�t l� ���c r�i.")
        end
    end
end

function create_pay()
    Say("Ki�m hi�p ch��ng m�n nh�n: Ng��i c�n l� phi l� 100 v�n l��ng b�c.", 2,
        "Kh�ng th�nh v�n ��, ta c� �em 100v l��ng ��y! /create_pay_yes",
        "Ta kh�ng �em �� ti�n r�i. /create_pay_no")
end
function create_pay_yes()
    if (GetCash() >= 1000000) then
        Pay(1000000)
        DelItem(195)
        SetTask(99, 1)
        Direct_CreateTong()
    else
        Talk(1, "",
            "Ki�m hi�p ch��ng m�n nh�n: Vi�c duy tr� bang h�i r�t t�n k�m, ng��i ph�i c� g�ng c�ng m�i ng��i t�ch g�p �� Bang H�i ���c gi�u m�nh. ")
    end
end

function Direct_CreateTong()
    CreateTong(1)
end
---------Trang Bi--------------
function TrangBi()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Nh�n �� Xanh", laydoxanh}, {"Nh�n �� T�m", laydotim},
                   {"Nh�n An Bang, Kim Phong, ��nh Qu�c", ab_kp_dq}, {"Nh�n Trang B� HKMP", setHKMPT1},
                   {"Nh�n V� Kh� HKMP", vkHKMP}, {"Nh�n Nh�n Cao C�p", Nhan}, {"Nh�n Tr�n Bang Chi B�o", TBCB},
                   {"Nh�n Trang B� Hi�m", TBHiem}, {"Nh�n �n, Phi Phong, Trang S�c", anphiphong},
                   {"Nh�n M�t n� chi�n tr��ng", matna}, {"Tr� L�i", main}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

----AN BANG - KIM PHONG - DINH QUOC----
function ab_kp_dq()
    local szTitle = LENHBAI_ADMIN .. "<#>Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"An Bang", anbang}, {"Kim Phong", kimphong}, {"��nh Qu�c", dinhquoc}, {"Tr� L�i", TrangBi},
                   {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Thi�u L�m Quy�n", hkmp, {1}}, {"Thi�u L�m C�n", hkmp, {2}}, {"Thi�u L�m �ao", hkmp, {3}},
                   {"Thi�n V��ng Ch�y", hkmp, {4}}, {"Thi�n V��ng Th��ng", hkmp, {5}},
                   {"Thi�n V��ng �ao", hkmp, {6}}, {"Nga Mi Ki�m", hkmp, {7}}, {"Nga Mi Ch��ng", hkmp, {8}},
                   {"Nga Mi Buff", hkmp, {9}}, {"Th�y Y�n ��n �ao", hkmp, {10}},
                   {"Th�y Y�n Song �ao", hkmp, {11}}, {"Ng� ��c Ch��ng Ph�p", hkmp, {12}},
                   {"Ng� ��c �ao Ph�p", hkmp, {13}}, {"Trang k�", setHKMPT2}, {"Tr� L�i", TrangBi}, {"Tho�t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function setHKMPT2()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ng� ��c B�a Ph�p", hkmp, {14}}, {"���ng M�n Phi �ao", hkmp, {15}},
                   {"���ng M�n T� Ti�n", hkmp, {16}}, {"���ng M�n Phi Ti�u", hkmp, {17}},
                   {"���ng M�n B�y", hkmp, {18}}, {"C�i Bang R�ng", hkmp, {19}},
                   {"C�i Bang C�n Ph�p", hkmp, {20}}, {"Thi�n Nh�n K�ch", hkmp, {21}},
                   {"Thi�n Nh�n �ao", hkmp, {22}}, {"Thi�n Nh�n B�a", hkmp, {23}}, {"V� �ang Kh�", hkmp, {24}},
                   {"V� �ang Ki�m", hkmp, {25}}, {"C�n L�n �ao", hkmp, {26}}, {"C�n L�n Ki�m", hkmp, {27}},
                   {"C�n L�n B�a", hkmp, {28}}, {"Tho�t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function hkmp(nId)
    for i = 1, 5 do
        AddGoldItem(0, 5 * nId + i - 5)
    end
end
---M�t n�-----------
function matna()
    local tab_Content = {"M�t Thi�u L�m/matna1", "M�t Thi�n V��ng/matna2", "M�t Nga My/matna3",
                         "M�t Th�y Y�n/matna4", "M�t Ng� ��c/matna5", "M�t ���ng M�n/matna6",
                         "M�t C�i Bang/matna7", "M�t Thi�n Nh�n/matna8", "M�t V� �ang/matna9",
                         "M�t C�n L�n/matna10", "Tho�t/no", "Tr� l�i"}
    Say("Xin m�i ch�n !", getn(tab_Content), tab_Content);
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Thi�u L�m", VKTL}, {"Thi�n V��ng", VKTV}, {"Nga Mi", VKNM}, {"Th�y Y�n", VKTY},
                   {"Ng� ��c", VK5D}, {"���ng M�n", VKDM}, {"C�i Bang", VKCB}, {"Thi�n Nh�n", VKTN},
                   {"V� �ang", VKVD}, {"C�n L�n", VKCL}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
----Nh�n----
function Nhan()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"H�ng Bang Chi Gi�i", xb_jz}, {"Tr�n Nh�c Chi Gi�i", zy_jz},
                   {"Th��ng Ph��ng Chi Gi�i", sf_jz}, {"Thi�n H� Gi�i", sh_jz},
                   {"�� Ho�ng Chi Gi�i", dh_jz}, {"Thi�n T� Chi Gi�i", tz_jz}, {"Th� T�c To�n Gi�i", sz_jz},
                   {"V� Danh Gi�i Ch�", vdgc}, {"C�n Kh�n Gi�i Ch� (C�c ph�m)", jz08},
                   {"L�nh B� Nguy�n M�ng Chi Gi�i (M�i)", jz08x}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
----------L�y �� Xanh------------------
tbDoXanh = {
    [1] = {
        szName = "D�y Chuy�n",
        tbEquip = {{"To�n th�ch h�ng li�n", 0, 4, 0}, {"L�c Ph� Th�y H� Th�n ph� ", 0, 4, 1}}
    },
    [2] = {
        szName = "�o Gi�p",
        tbEquip = {{"Th�t B�o C� Sa", 0, 2, 0}, {"Ch�n V� Th�nh Y", 0, 2, 1},
                   {"Thi�n Nh�n M�t Trang", 0, 2, 2}, {"Gi�ng Sa B�o", 0, 2, 3}, {"���ng Ngh� gi�p", 0, 2, 4},
                   {"V�n L�u Quy T�ng Y", 0, 2, 5}, {"Tuy�n Long b�o", 0, 2, 6}, {"Long Ti�u ��o Y", 0, 2, 8},
                   {"C�u V� B�ch H� trang", 0, 2, 9}, {"Tr�m H��ng sam", 0, 2, 10},
                   {"T�ch L�ch Kim Ph�ng gi�p", 0, 2, 11}, {"V�n Ch�ng T� T�m Y", 0, 2, 12},
                   {"L�u Ti�n Qu�n", 0, 2, 13}}
    },
    [3] = {
        szName = "�ai L�ng",
        tbEquip = {{"Thi�n T�m Y�u ��i", 0, 6, 0}, {"B�ch Kim Y�u ��i", 0, 6, 1}}
    },
    [4] = {
        szName = "Gi�y",
        tbEquip = {{"C�u Ti�t X��ng V� Ngoa", 0, 5, 0}, {"Thi�n T�m Ngoa", 0, 5, 1}, {"Kim L� h�i", 0, 5, 2},
                   {"Phi Ph�ng Ngoa", 0, 5, 3}}
    },
    [5] = {
        szName = "Bao Tay",
        tbEquip = {{"Long Ph�ng Huy�t Ng�c Tr�c", 0, 8, 0}, {"Thi�n T�m H� Uy�n", 0, 8, 1}}
    },
    [6] = {
        szName = "N�n",
        tbEquip = {{"T� L� m�o", 0, 7, 0}, {"Ng� l�o qu�n", 0, 7, 1}, {"Tu La Ph�t k�t", 0, 7, 2},
                   {"Th�ng Thi�n Ph�t Qu�n", 0, 7, 3}, {"Y�m Nh�t kh�i", 0, 7, 4},
                   {"Tr�ch Tinh ho�n", 0, 7, 5}, {"� T�m M�o", 0, 7, 6}, {"Quan �m Ph�t Qu�n", 0, 7, 7},
                   {"�m D��ng V� C�c qu�n", 0, 7, 8}, {"Huy�n T� Di�n Tr�o", 0, 7, 9},
                   {"Long Huy�t ��u ho�n", 0, 7, 10}, {"Long L�n Kh�i", 0, 7, 11}, {"Thanh Tinh Thoa", 0, 7, 12},
                   {"Kim Ph�ng Tri�n S� ", 0, 7, 13}}
    },
    [7] = {
        szName = "V� Kh� C�n Chi�n",
        tbEquip = {{"Huy�n Thi�t Ki�m", 0, 0, 0}, {"��i Phong �ao", 0, 0, 1}, {"Kim C� B�ng", 0, 0, 2},
                   {"Ph� Thi�n K�ch", 0, 0, 3}, {"Ph� Thi�n ch�y", 0, 0, 4}, {"Th�n Nh�t Tr�m", 0, 0, 5}}
    },
    [8] = {
        szName = "Ng�c B�i",
        tbEquip = {{"Long Ti�n H��ng Nang", 0, 9, 0}, {"D��ng Chi B�ch Ng�c", 0, 9, 1}}
    },
    [9] = {
        szName = "V� Kh� T�m Xa",
        tbEquip = {{"B� V��ng Ti�u", 0, 1, 0}, {"To�i Nguy�t �ao", 0, 1, 1}, {"Kh�ng T��c Linh", 0, 1, 2}}
    },
    [10] = {
        szName = "Nh�n",
        tbEquip = {{"To�n Th�ch Gi�i Ch� ", 0, 3, 0}}
    }
}

function laydoxanh()
    local tbOpt = {}
    for i = 1, getn(tbDoXanh) do
        tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
    end

    tinsert(tbOpt, {"Tho�t."})
    CreateNewSayEx(LENHBAI_ADMIN .. "Xin m�i l�a ch�n trang b�:", tbOpt)
end
function laydoxanh1(nType)
    local tbEquip = tbDoXanh[nType]["tbEquip"]
    local tbOpt = {}
    for i = 1, getn(tbEquip) do
        tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
    end

    tinsert(tbOpt, {"Tho�t."})
    local szTitle = format(LENHBAI_ADMIN .. "Xin m�i l�a ch�n trang b�:")
    CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
    local tbOpt = {}
    tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
    tinsert(tbOpt, {"M�c", laydoxanh3, {nIndex, nType, 1}})
    tinsert(tbOpt, {"Th�y", laydoxanh3, {nIndex, nType, 2}})
    tinsert(tbOpt, {"H�a", laydoxanh3, {nIndex, nType, 3}})
    tinsert(tbOpt, {"Th� ", laydoxanh3, {nIndex, nType, 4}})

    tinsert(tbOpt, {"Tho�t."})
    local szTitle = format(LENHBAI_ADMIN .. "M�i ch�n h�:")
    CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh3(nIndex, nType, nSeries)
    g_AskClientNumberEx(0, 60, "S� L��ng:", {laydoxanh4, {nIndex, nType, nSeries}})
end
function laydoxanh4(nIndex, nType, nSeries, nCount)
    local tbEquipSelect = tbDoXanh[nType]["tbEquip"][nIndex]
    for i = 1, nCount do
        AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 500, 10)
    end
end

-----L�y �� T�m------------------------------------------------
function laydotim()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Trang B� MaxOp", dotimmax}, {"V� Kh�", weapon}, {"Y Ph�c", shirt}, {"�inh M�o", hat},
                   {"H� Uy�n", glove}, {"Y�u ��i", belt}, {"H�i T�", shoe}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function dotimmax()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"V� Kh�", vukhi}, {"Ki�m", kiem}, {"Trang Ph�c", trangphuc}, {"�inh M�o", non},
                   {"Bao Tay", baotay}, {"�ai L�ng", dailung}, {"Gi�y", giay}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ki�m", kiem}, {"�ao", dao}, {"B�ng", bong}, {"K�ch", kick}, {"Ch�y", chuy},
                   {"Song �ao", songdao}, {"Phi Ti�u", phitieu}, {"Phi �ao", phidao}, {"T� Ti�n", tutien},
                   {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Th�t B�o C� Sa", aothieulam}, {"Ch�n V� Th�nh Y", aovodang},
                   {"Thi�n Nh�n M�t Trang", aothiennhan}, {"Gi�ng Sa B�o", sabao}, {"���ng Ngh� Gi�p", dng},
                   {"V�n L�u Quy T�ng Y", aocaibang}, {"Tuy�n Long B�o", longbao}, {"Long Ti�u ��o Y", daoy},
                   {"C�u V� B�ch H� Trang", hotrang}, {"Tr�m H��ng Sam", huongsam},
                   {"T�ch L�ch Kim Ph�ng Gi�p", kimphung}, {"V�n Ch�ng T� T�m Y", tamy},
                   {"L�u Ti�n Qu�n", tienquan}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"T� L� M�o", lomao}, {"Ng� L�o Qu�n", laoquan}, {"Tu La Ph�t K�", phatket},
                   {"Th�ng Thi�n Ph�t Qu�n", phatquan}, {"Y�m Nh�t Kh�i", nhatkhoi},
                   {"Tr�ch Tinh Ho�n", tinhhoan}, {"� T�m M�o", tammao}, {"Quan �m Ph�t Qu�n", quanam},
                   {"�m D��ng V� C�c Qu�n", amduong}, {"Huy�n T� Di�n Tr�o", dientrao},
                   {"Long Huy�t ��u Ho�n", longhuyet}, {"Long L�n Kh�i", lankhoi}, {"Thanh Tinh Thoa", tinhthoa},
                   {"Kim Ph�ng Tri�n S�", triensi}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long Ph�ng Huy�t Ng�c Tr�c", ngoctrac}, {"Thi�n T�m H� Uy�n", houyen},
                   {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Thi�n T�m Y�u ��i", thientamyeu}, {"B�ch Kim Y�u ��i", bachkimyeudai},
                   {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"C�u Ti�t X��ng V� Ngoa", cuutien}, {"Thi�n T�m Ngoa", thientam}, {"Kim L� H�i", kimlu},
                   {"Phi Ph�ng Ngoa", phiphung}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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

-------Trang B� Hi�m-------------
function TBHiem()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long T��ng Chi L�n", longtuong}, {"L�ng V�n", pgaming}, {"V� Li�t", vuliet},
                   {"H�c Th�n", hacthan}, {"Th��ng Khung", unknow}, {"Nh�n ��c C�", docco},
                   {"Trang S�c Huynh ��", huynhde}, {"��ng S�t", dongsat}, {"C� S�n", coson},
                   {"Set C� Th�p", cothap}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

---------C�c Trang B� Long T��ng-H�c Th�n---��ng S�t--V� Li�t--------------------------
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
-------�n Phi Phong-------------
function anphiphong()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"�n", an}, {"Phi Phong", phiphong}, {"Trang S�c", trangsuc}, {"H�ng �nh", honganh},
                   {"Tr� L�i", TrangBi}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
---�n------
function an()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"T�n Nh�m H�nh �n Gi�m (H�)", anha1}, {"T�n Nh�m H�nh �n Gi�m (Trung)", antrung1},
                   {"T�n Nh�m H�nh �n Gi�m (Th��ng)", anthuong1}, {"C��ng H�a", cuonghoa},
                   {"Nh��c H�a", nhuochoa}, {"C��ng H�a v� Nh��c H�a", cuonghoanhuochoa},
                   {"Tr� L�i", anphiphong}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoa()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ho�ng Kim �n (C��ng h�a) 1", nguhanhan, {1}},
                   {"Ho�ng Kim �n (C��ng h�a) 2", nguhanhan, {2}},
                   {"Ho�ng Kim �n (C��ng h�a) 3", nguhanhan, {3}},
                   {"Ho�ng Kim �n (C��ng h�a) 4", nguhanhan, {4}},
                   {"Ho�ng Kim �n (C��ng h�a) 5", nguhanhan, {5}},
                   {"Ho�ng Kim �n (C��ng h�a) 6", nguhanhan, {6}},
                   {"Ho�ng Kim �n (C��ng h�a) 7", nguhanhan, {7}},
                   {"Ho�ng Kim �n (C��ng h�a) 8", nguhanhan, {8}},
                   {"Ho�ng Kim �n (C��ng h�a) 9", nguhanhan, {9}},
                   {"Ho�ng Kim �n (C��ng h�a) 10", nguhanhan, {10}}, {"Tr� L�i", an}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nhuochoa()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ho�ng Kim �n (Nh��c h�a) 1", nguhanhan, {11}},
                   {"Ho�ng Kim �n (Nh��c h�a) 2", nguhanhan, {12}},
                   {"Ho�ng Kim �n (Nh��c h�a) 3", nguhanhan, {13}},
                   {"Ho�ng Kim �n (Nh��c h�a) 4", nguhanhan, {14}},
                   {"Ho�ng Kim �n (Nh��c h�a) 5", nguhanhan, {15}},
                   {"Ho�ng Kim �n (Nh��c h�a) 6", nguhanhan, {16}},
                   {"Ho�ng Kim �n (Nh��c h�a) 7", nguhanhan, {17}},
                   {"Ho�ng Kim �n (Nh��c h�a) 8", nguhanhan, {18}},
                   {"Ho�ng Kim �n (Nh��c h�a) 9", nguhanhan, {19}},
                   {"Ho�ng Kim �n (Nh��c h�a) 10", nguhanhan, {20}}, {"Tr� L�i", an}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function cuonghoanhuochoa()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ng� H�nh �n 1", nguhanhan, {21}}, {"Ng� H�nh �n 2", nguhanhan, {22}},
                   {"Ng� H�nh �n 3", nguhanhan, {23}}, {"Ng� H�nh �n 4", nguhanhan, {24}},
                   {"Ng� H�nh �n 5", nguhanhan, {25}}, {"Ng� H�nh �n 6", nguhanhan, {26}},
                   {"Ng� H�nh �n 7", nguhanhan, {27}}, {"Ng� H�nh �n 8", nguhanhan, {28}},
                   {"Ng� H�nh �n 9", nguhanhan, {29}}, {"Ng� H�nh �n 10", nguhanhan, {30}}, {"Tr� L�i", an},
                   {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nguhanhan(nId)
    for i = 3205, 3205 do
        AddGoldItem(0, 1 * nId + i - 1)
    end
end
---Phi Phong------
function phiphong()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Phi Phong C�p Th�p", phiphong1}, {"Phi Phong Ph� Quang", phiphongphequang},
                   {"Phi Phong Kh�p Th�n", phiphongkhapthan}, {"Phi Phong K�nh Thi�n", phiphongkinhthien},
                   {"Phi Phong V� C�c", phiphongvocuc}, {"Phi Phong Cao C�p", phiphongcaocap},
                   {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
-----Trang S�c------------
function trangsuc()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Long Chu�n Vu D�", longchien}, {"Trang S�c 1", trangsuc1}, {"Trang S�c 2", trangsuc2},
                   {"Long ��m", longdam}, {"Cu�ng Lan", cuonglan}, {"Tr� L�i", anphiphong}, {"Tho�t"}}
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
---H�ng �nh------
function honganh()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"H�ng �nh Th��ng", honganh1}, {"H�ng �nh Ho�ng M�", honganh2}, {"Tr� L�i", anphiphong},
                   {"Tho�t"}}
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

------Nh�n V�t Ph�m-----------
function NhanVatPham()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"V�t Ph�m Tr�ng Sinh", trungsinh}, -- {"Nh�n 50 item",TaoItem2},
    -- {"Nh�n 100 item",TaoItem3},
    {"Nguy�n Li�u Ch� T�o �� T�m", epdotim}, {"V�t Ph�m Kh�c", vatphamkhac}, {"Tr� L�i", main}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

-----------Tr�ng Sinh----------------------------------------------------------------------------------------------
VPTrungSinh = {{
    szName = "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>",
    tbProp = {6, 1, 1390, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "<B�c ��u Tr��ng Sinh Thu�t - ��i Th�a T�m Ph�p>",
    tbProp = {6, 1, 2974, 0, 0, 0},
    tbParam = {60}
}, -- {szName="T�ch L�ch ��n", tbProp={6,1,2973,0,0,0}},
{
    szName = "B�c ��u T�y T�y ��n",
    tbProp = {6, 1, 30127, 0, 0, 0},
    tbParam = {60}
}}
function trungsinh()
    local szTitle = LENHBAI_ADMIN .. "<#>Xin ch�o <color=red>" .. GetName() ..
                        "<color>. Xin m�i ch�n V�t Ph�m c�n s� d�ng.\n\nHi�n t�i c� <color=red>" ..
                        GetPlayerCount() .. " <color>ng��i ch�i �ang tr�c tuy�n.<color>"
    local tbOpt = {}
    local nCount = getn(VPTrungSinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("Nh�n %s", VPTrungSinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemTS, {i}})
    end
    tinsert(tbOpt, {"T�ch L�ch ��n", tichlichdon})
    tinsert(tbOpt, {"Tr� V�", NhanVatPham})
    tinsert(tbOpt, {"Tho�t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTS(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "Nh�p S� L��ng:", {get_item_TS, {nIndex}})
end
function get_item_TS(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("H�nh trang c�n �t nh�t <color=yellow>%d<color> � tr�ng", nCount))
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
-----------�p �� t�m----------------------------------------------------------------------------------------------
function epdotim()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Huy�n Tinh", HuyenTinh}, {"Th�y Tinh", ThuyTinh}, {"Ph�c Duy�n", PhucDuyen},
                   {"Kho�ng Th�ch Ch� T�o", khoangthach}, {"Manh Thi�n Th�ch", manhthienthach},
                   {"Tr� L�i", NhanVatPham}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
-----------Huy�n Tinh----------------------------------------------------------------------------------------------
NhanHuyenTinh = {{
    szName = "Huy�n Tinh C�p 1",
    tbProp = {6, 1, 147, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 2",
    tbProp = {6, 1, 147, 2, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 3",
    tbProp = {6, 1, 147, 3, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 4",
    tbProp = {6, 1, 147, 4, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 5",
    tbProp = {6, 1, 147, 5, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 6",
    tbProp = {6, 1, 147, 6, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 7",
    tbProp = {6, 1, 147, 7, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 8",
    tbProp = {6, 1, 147, 8, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 9",
    tbProp = {6, 1, 147, 9, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Huy�n Tinh C�p 10",
    tbProp = {6, 1, 147, 10, 0, 0, 0},
    tbParam = {60}
}}
function HuyenTinh()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanHuyenTinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("Nh�n %s", NhanHuyenTinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemHT, {i}})
    end
    tinsert(tbOpt, {"Tr� V�", NhanVatPham})
    tinsert(tbOpt, {"Tho�t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemHT(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "Nh�p S� L��ng:", {get_item_HT, {nIndex}})
end
function get_item_HT(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("H�nh trang c�n �t nh�t <color=yellow>%d<color> � tr�ng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanHuyenTinh[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanHuyenTinh[nIndex], szLogTitle, nCount)
end
-----Thuy Tinh---------
NhanThuyTinh = {{
    szName = "T� Th�y Tinh",
    tbProp = {4, 239, 1, 1, 0, 0},
    tbParam = {60}
}, {
    szName = "Lam Th�y Tinh",
    tbProp = {4, 238, 1, 1, 0, 0},
    tbParam = {60}
}, {
    szName = "L�c Th�y Tinh",
    tbProp = {4, 240, 1, 1, 0, 0},
    tbParam = {60}
}}
function ThuyTinh()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanThuyTinh)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("Nh�n %s", NhanThuyTinh[i].szName)
        tinsert(tbOpt, {szOption, get_itemTT, {i}})
    end
    tinsert(tbOpt, {"Tr� V�", NhanVatPham})
    tinsert(tbOpt, {"Tho�t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemTT(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "Nh�p S� L��ng:", {get_item_TT, {nIndex}})
end
function get_item_TT(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("H�nh trang c�n �t nh�t <color=yellow>%d<color> � tr�ng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanThuyTinh[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanThuyTinh[nIndex], szLogTitle, nCount)
end
-----Phuc Duyen---------
NhanPhucDuyen = {{
    szName = "Ph�c Duy�n Ti�u",
    tbProp = {6, 1, 122, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Ph�c Duy�n Trung",
    tbProp = {6, 1, 123, 1, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Ph�c Duy�n ��i",
    tbProp = {6, 1, 124, 1, 0, 0, 0},
    tbParam = {60}
}}
function PhucDuyen()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(NhanPhucDuyen)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("Nh�n %s", NhanPhucDuyen[i].szName)
        tinsert(tbOpt, {szOption, get_itemPD, {i}})
    end
    tinsert(tbOpt, {"Tr� V�", NhanVatPham})
    tinsert(tbOpt, {"Tho�t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemPD(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "Nh�p S� L��ng:", {get_item_PD, {nIndex}})
end
function get_item_PD(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("H�nh trang c�n �t nh�t <color=yellow>%d<color> � tr�ng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", NhanPhucDuyen[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(NhanPhucDuyen[nIndex], szLogTitle, nCount)
end
-----Kho�ng Th�ch---------
function khoangthach()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Trang Ph�c H� Kim", hekim}, {"Trang Ph�c H� M�c", hemoc}, {"Trang Ph�c H� Th�y", hethuy},
                   {"Trang Ph�c H� H�a", hehoa}, {"Trang Ph�c H� Th�", hetho}, {"Tr� L�i", epdotim}, {"Tho�t"}}
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
    szName = "H�i Thi�n T�i T�o L� Bao",
    tbProp = {6, 1, 1781, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Khi�u Chi�n L�nh.",
    tbProp = {6, 1, 1499, 0, 0, 0}
}, {
    szName = "C�n Kh�n Song Tuy�t B�i",
    tbProp = {6, 1, 2219, 0, 0, 0}
}, {
    szName = "Nh�c V��ng Ki�m L� Bao",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Long Huy�t Ho�ng",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "T� M�u L�nh",
    tbProp = {6, 1, 1427, 0, 0, 0}
}, {
    szName = "T�n V�t M�n Ph�i",
    tbProp = {6, 1, 1670, 0, 0, 0}
}, {
    szName = "T�n V�t D��ng Anh",
    tbProp = {6, 1, 1671, 0, 0, 0}
}, {
    szName = "H�n Nguy�n Linh L�",
    tbProp = {6, 1, 2312, 1, 0, 0}
}, {
    szName = "��i L�c Ho�n L� H�p",
    tbProp = {6, 1, 2517, 0, 0, 0}
}, {
    szName = "Th�p To�n ��i B�",
    tbProp = {6, 1, 1399, 0, 0, 0}
}}
function vatphamkhac()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {}
    local nCount = getn(VPKHAC)
    local szOption = ""
    for i = 1, nCount do
        szOption = format("Nh�n %s", VPKHAC[i].szName)
        tinsert(tbOpt, {szOption, get_itemKhac, {i}})
    end
    tinsert(tbOpt, {"Tr� V�", NhanVatPham})
    tinsert(tbOpt, {"Tho�t"})
    CreateNewSayEx(szTitle, tbOpt)
end
function get_itemKhac(nIndex)
    local nMaxCount = CalcFreeItemCellCount()
    g_AskClientNumberEx(0, nMaxCount, "Nh�p S� L��ng:", {get_item_Khac, {nIndex}})
end
function get_item_Khac(nIndex, nCount)
    if nCount <= 0 then
        return
    end
    if CalcFreeItemCellCount() < nCount then
        Talk(1, "", format("H�nh trang c�n �t nh�t <color=yellow>%d<color> � tr�ng", nCount))
        return
    end
    local szLogTitle = format("[liguan]get_free_item_%s", VPKHAC[nIndex].szName)
    tbAwardTemplet:GiveAwardByList(VPKHAC[nIndex], szLogTitle, nCount)
end

function doiten()
    AskClientForString("doitennv", "", 1, 100, "Xin nh�p t�n m�i");
end
function doitennv(strings)
    RenameRole(strings)
end

--------------------------------------------------------1296 tang toc do di chuye
local tbEquipFreeCell = {{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1}, {2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1}}

-------------Tao ITEM-------------------------------------------------------------------
function TaoItem()
    g_AskClientStringEx("6,1,222,0,0,0", 1, 9000, "Nh�p V�o Item Code:", {TaoItemID})
end

function TaoItemID(szItem)
    local szICode = lib:Split(szItem, ",");
    local n = getn(szICode);
    if (n ~= 1) then
        if (n < 6) then
            Talk(1, "", format("Sai Item Code. Thi�u tr��ng y�u c�u <color=yellow>%s<color>", n));
            return
        end
        if (n > 7) then
            Talk(1, "", format("Sai Item Code. Qu� nhi�u tr��ng d� li�u <color=yellow>%s<color>", n));
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
            Talk(1, "", format("C�p �� man �� kh�ng ���c th�p qu� <color=yellow>%s<color>", itlv));
            return
        end
        if (itlv > 10) then
            Talk(1, "", format("Ch� h� tr� ��n c�p 10. Hi�n t�i nh�p v�o <color=yellow>%s<color>", itlv));
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
    Msg2Player("B�n di chuy�n v� <color=yellow>Ba L�ng Huy�n<color> th�nh c�ng.");
end

----V�ng S�ng - Danh Hi�u------
function vongsang(nindex)
    Title_AddTitle(nindex, 1, 4302359);
    Title_ActiveTitle(nindex);
    SetTask(1122, nindex);
end

function nhandanhhieu()
    local szTitle = "<npc>Xin ch�o <color=yellow>" .. GetName() .. "<color> , xin m�i ch�n Danh Hi�u...!!!"
    local tbOpt = {{"Th�i th� Ph��ng T��ng.", vongsang, {153}}, {"Th�i th� Th�nh ��.", vongsang, {154}},
                   {"Th�i th� ��i L�.", vongsang, {155}}, {"Th�i th� Bi�n Kinh.", vongsang, {156}},
                   {"Th�i th� T��ng D��ng.", vongsang, {157}}, {"Th�i th� D��ng Ch�u.", vongsang, {158}},
                   {"Th�i th� L�m An.", vongsang, {159}}, {"V� L�m Li�n ��u Qu�n Qu�n.", vongsang, {81}},
                   {"V� L�m Li�n ��u H�ng 2.", vongsang, {82}}, {"V� L�m Li�n ��u H�ng 3.", vongsang, {83}},
                   {"V� L�m Li�n ��u H�ng 4.", vongsang, {84}}, {"Trang K�", danhhieu2}, {"Tr� L�i", main},
                   {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu2()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"V�ng S�ng ADM.", vongsang, {228}}, {"Nh�t ��i T�ng S�", vongsang, {239}},
                   {"Phi�u M� ��i T��ng Qu�n.", vongsang, {185}}, {"V� H�c K� T�i.", vongsang, {258}},
                   {"Ng� Long Cu�ng �ao.", vongsang, {165}}, {"Tuy�t Th� Cao Th�.", vongsang, {240}},
                   {"Long Th�n Ki�m.", vongsang, {80}}, {"Th�n Th� B�t Ph�m.", vongsang, {256}},
                   {"B� Ch� Th�t Th�nh.", vongsang, {193}}, {"Thi�n H� �� Nh�t Bang.", vongsang, {142}},
                   {"Trang K�", danhhieu3}, {"Tr� L�i", nhandanhhieu}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu3()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"��c B� Thi�n H�", vongsang, {325}}, {"Uy M�nh V� Song�", vongsang, {326}},
                   {"L�c �p Qu�n H�ng", vongsang, {327}}, {"T� Tuy�t chi�n tr��ng", vongsang, {328}},
                   {"Ng� Tuy�t chi�n tr��ng", vongsang, {329}}, {"L�c Tuy�t chi�n tr��ng", vongsang, {330}},
                   {"Th�t Tuy�t chi�n tr��ng", vongsang, {331}}, {"B�t Tuy�t chi�n tr��ng", vongsang, {332}},
                   {"C�u Tuy�t chi�n tr��ng", vongsang, {333}}, {"Th�p Tuy�t chi�n tr��ng", vongsang, {334}},
                   {"Trang K�", danhhieu4}, {"Tr� L�i", nhandanhhieu2}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

function danhhieu4()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Tri�u M�nh", vongsang, {408}}, {"Thi�n H� V� ��ch", vongsang, {421}},
                   {"Thi�n H� Th�p C��ng", vongsang, {422}}, {"T�n th�", vongsang, {423}},
                   {"Vua PK.", vongsang, {229}}, {"��c C� C�u B�i", vongsang, {237}},
                   {"Long Tranh H� ��u", vongsang, {236}}, {"M�i nh�p giang h� ", vongsang, {244}},
                   {"V� L�m Minh Ch�", vongsang, {245}}, {"V� L�m Ch� T�n.", vongsang, {238}},
                   {"Tr� L�i", danhhieu4}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end

---------------M� R�ng R��ng--------------------------------------
function moruong()
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    AddItem(6, 1, 1427, 90, 1, 0, 0)
end
----------------------Nh�n Tr�n Bang Chi B�o-------------------------------------------------------------
function TBCB()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Thi�u L�m", CBTL}, {"Thi�n V��ng", CBTV}, {"Nga My", CBNM}, {"Th�y Y�n", CBTY},
                   {"Ng� ��c", CBND}, {"���ng M�n", CBDM}, {"C�i Bang", CBCB}, {"Thi�n Nh�n", CBTN},
                   {"V� �ang", CBVD}, {"C�n L�n", CBCL}, {"Tr� L�i", TrangBi}, {"Tho�t"}}
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
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Ch�n Pet", Pet1}, {"X�a Pet", Pet2}, {"Tr� l�i", Pet}, {"Tho�t."}}
    CreateNewSayEx(szTitle, tbOpt)
end

function Pet1()
    local szTitle = LENHBAI_ADMIN .. "Xin ch�o Admin <color=red>" .. GetName() ..
                        "<color>,Nh�ng ch�c n�ng b�n d��i c� th� gi�p b�n ki�m tra Server ho�c h� tr� ng��i ch�i.\n\n<pic=137> Online    : <color=green>" ..
                        GetPlayerCount() .. "<color>"
    local tbOpt = {{"Chu T��c", Pet3}, {"H�a K� L�n", Pet4}, {"Thanh Long", Pet5}, {"Huy�n V�", Pet6},
                   {"B�ch H�", Pet7}, {"Tr� L�i", Pet}, {"Tho�t"}}
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
