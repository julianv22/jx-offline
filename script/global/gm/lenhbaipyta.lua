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
Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua"); -- t?y t?y, c?ng di?m nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua"); -- l�y trang b�
Include("\\script\\global\\gm\\functions_points.lua"); -- l�y c�c lo�i �i�m
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua"); -- l�y item ho�ng kim, b�ch kim
Include("\\script\\global\\thinh\\hotro\\functions_partner.lua"); -- b�n ��ng h�nh
-- Include("\\script\\global\\thinh\\hotro\\npccongfullskill.lua") -- c�ng Skill
-- Include("\\script\\global\\gm\\julianv\\vukhi_bachkim.lua") -- v� khi b�ch kim

TITLEDIALOG = "T�n nh�n v�t : <color=green>%s<color>\n" .. "T�n t�i kho�n: <color=green>%s<color>\n" ..
                  "T�a ��       : <color=green>%d, %d/%d<color>"

function main()
    dofile("script/global/gm/lenhbaipyta.lua")
    local strFaction = GetFaction()
    local nW, nX, nY = GetWorldPos();
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY), "Shop/#Sale(142)",
                   "Nh�n Point/CacLoaiDiem", "Ti�m n�ng - K� n�ng/status_dialog",
                   "Trang b� - V�t ph�m/laytrangbivatpham", "Boss Ho�ng Kim/bosshk1",
                   "B�n ��ng h�nh/functions_for_partner", "Danh hi�u Ki�m Th�/chondanhhieu",
                   "��i m�u PK/trangthai", "S�a l�i Th�n H�nh Ph�/fixthanhanhphu", "V�t t�t c�/vutall",
                   "H�y v�t ph�m/DisposeItem", "Tho�t/no"};
    CreateTaskSay(tbSay)
    return 1;
end

function status_dialog()
    local szTitle = "Xin ch�o <color=red>" .. GetName() .. "<color> ! ��i hi�p mu�n s� d�ng ch�c n�ng g�?"
    local tbSay = {"Ti�m n�ng/#chose_reset_type(1)", "K� n�ng/#chose_reset_type(2)",
                   "Th�m - X�a Skill theo ID/LaySkillID", "Tr� l�i/main", "Tho�t/no"};
    Say(szTitle, getn(tbSay), tbSay)
end
----------------------------L�y Trang B� - V�t Ph�m-----------------------
function vutall()
    -- RemoveItemByIndex(5122)
    ThrowAllItem()
    AddItem(6, 1, 5122, 0, 0, 0)
    AddItem(6, 1, 5124, 0, 0, 0)
end
function laytrangbivatpham()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP), "L�y �� T�m/CreateItemPurple",
                   "L�y Full Ng�a/layngua", "L�y Phi Phong/layphiphong",
                   "V� kh� B�ch Kim M�n ph�i/getVKBK_diaglog",
                   "L�y Set �� Ho�ng Kim, B�ch Kim/chose_type_goldquip",
                   "N�ng C�p �� B�ch Kim/nangcacpbachkim", "L�y ITEM MagicScript/LayItem",
                   "L�y ITEM Questkey/LayQuestkey", "L�y �� Ho�ng Kim (Goldequip)/LayGoldequip", "Tr� l�i/main",
                   "Tho�t/no"}
    CreateTaskSay(tbSay)
    return 1;
end
--------------------- L�y phi phong-------------------------
function layphiphong()
    for i = 3465, 3490 do
        AddGoldItem(0, i)
    end
end
------------------------------------------N�ng c�p �� B�ch Kim -----------------------------------
function nangcacpbachkim()
    local szTitle = " Xin ch�o <color=red>" .. GetName() .. "<color> ! ��i hi�p mu�n s� d�ng ch�c n�ng g�?"
    local tbOpt = {"N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 0/make_bachkim",
                   "N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 10/make_bachkim_max",
                   "N�ng c�p trang b� B�ch Kim t�ng c�p/up_bachkim", "Tr� l�i/main", "Tho�t/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
    GiveItemUI("T�o trang b� B�ch Kim", "N�ng c�p trang b� Ho�ng kim th�nh B�ch kim", "do_upgoldeq_process", 1);
end
function do_upgoldeq_process()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
    GiveItemUI("T�o trang b� B�ch Kim", "N�ng c�p trang b� B�ch kim Max (+10)", "do_upgoldeq_max", 1);
end
function do_upgoldeq_max()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
    for i = 1, 10 do
        UpgradePlatinaItem(GetGiveItemUnit(1))
    end
end

function up_bachkim()
    GiveItemUI("N�ng c�p trang b� B�ch kim", "B� v�o trang b� B�ch kim", "upgrade_bachkim_process", 1);
end

function upgrade_bachkim_process()
    UpgradePlatinaItem(GetGiveItemUnit(1))
end
-----------------------------L�y Ng�a------------------
function layngua()
    local tbSay = {"��i hi�p mu�n l�y ng�a n�o?"}
    local nName = tbNameResHorse
    local nNum = getn(nName)
    for i = 1, nNum do
        local nHorse = tbNameResHorse[i].szName
        -- local nHorse = nName[num].szName
        tinsert(tbSay, "" .. nHorse .. "/layngua1")
    end
    tinsert(tbSay, "Tho�t/no")
    CreateTaskSay(tbSay)
end
function layngua1(num, page)
    local tbSay = {"��i hi�p mu�n l�y ng�a n�o?"}
    local nTable = tbNameResHorse[num + 1].szEquip
    local nCount = getn(nTable)
    if page == nill then
        if nCount > 10 then
            for i = 1, 10 do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [C�p " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, 1))
            tinsert(tbSay, "Tho�t/no")
        end
        if nCount <= 10 then
            for i = 1, nNum do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [C�p " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, "Tho�t/no")
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
                tinsert(tbSay, format("" .. nHorseName .. " [C�p " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            if page ~= 0 then
                tinsert(tbSay, format("Trang tr��c/#layngua1(%d,%d)", num, page - 1))
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho�t/no")
            end
            if page == 0 then
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho�t/no")
            end
        end
        if nNum <= 10 then
            for i = nPage * 10 + 1, nCount do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [C�p " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang tr��c/#layngua1(%d,%d)", num, page - 1))
            tinsert(tbSay, "Tho�t/no")
        end
    end
    CreateTaskSay(tbSay)
end
function addngua(id, level)
    local nid = id
    local nlevel = level
    AddItem(0, 10, id, level, 0, 0, 0)
end
----------------------------Nh�n Danh Hi�u Ki�m Th�-----------------------
function chondanhhieu()
    local szTitle = "Xin ch�o <color=yellow>" .. GetName() .. "<color> , xin m�i ch�n Danh Hi�u...!!!"
    local tbOpt = {{"Uy Ch�n C�u Ch�u.", nhandanhhieu, {5001}}, {"V� L�m Ch� T�n.", nhandanhhieu, {5002}},
                   {"Nh�t Ki�m Phong Thi�n.", nhandanhhieu, {5003}}, {"Nh�t L�u Cao Th�.", nhandanhhieu, {5004}},
                   {"Hi�p Kh�ch Cu�i C�ng Tr�n Giang H�.", nhandanhhieu, {5005}}, {"Tho�t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nhandanhhieu(nIndex)
    Title_AddTitle(nIndex, 1, 4302359);
    Title_ActiveTitle(nIndex);
    SetTask(1122, nIndex);
end
--------------------L�y Skill theo ID-------------------
function LaySkillID()
    local szTitle = "Xin ch�o  <color=red>" .. GetName() .. "<color>, b�n mu�n nh�n hay x�a skill n�o?"
    local tbOpt = {{"Th�m Skill", g_AskClientStringEx, {"69,20", 0, 256, "ID Skill", {AddSkill, {self}}}},
                   {"X�a Skill", g_AskClientStringEx, {"69", 0, 300, "ID Skill", {DelSkill, {self}}}},
                   {"Th�m Danh S�ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {AddDSSkill, {self}}}},
                   {"X�a Danh S�ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {DelDSSkill, {self}}}},
                   {"Tr� l�i", status_dialog}, {"Tho�t"}}
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
----------------------L�y ITEM--------------------------------
function LayQuestkey(num)
    if num == 7 or num == nil then
        g_AskClientNumberEx(1, 2000, "Questkey ID", {LayQuestkey})
    else
        local nItemIdx = AddEventItem(num)
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(nItemIdx))
    end
end

function LayItem()
    g_AskClientStringEx("6,1,125,0,0,0", 1, 9000, "Nh�p V�o Item Code:", {TaoItemID})
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
        -- if (itlv > 10) then Talk(1, "", format("Ch� h� tr� ��n c�p 10. Hi�n t�i nh�p v�o <color=yellow>%s<color>",itlv)); return end
        if (itmagic == nil) then
            itmagic = 0;
        end
        AddItem(itclass, ittype, itid, itlv, itseri, itluck, itmagic);
    else
        local EquipId = tonumber(szICode[1]);
        AddGoldItem(0, EquipId);
    end
end

-------------L�y �� HK------------------------------------------------------------------
function LayGoldequip()
    g_AskClientStringEx("1", 0, 256, "ID GoldItem", {AddDSGold})
end

function AddDSGold(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    AddGoldItem(0, s)
end
-------------------------------L�y �� T�m MaxOPt-------------------------------------------
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
----------------------H�y v�t ph�m----------------------------
function DisposeItem()
    GiveItemUI("H�y v�t ph�m",
        "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m, v�t ph�m �� h�y kh�ng th� l�y l�i ���c!",
        "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local strItem = GetItemName(nItemIndex)
        RemoveItemByIndex(nItemIndex)
        -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
    end
    Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
    Talk(1, "", "Thao t�c th�nh c�ng, xin ki�m tra l�i!");
end
--------------------------------------------------------------
--			 		S�a Th�n H�nh Ph�						--
--------------------------------------------------------------
function fixthanhanhphu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a Qu� nh�n s� �� tr� v� ban ��u!")
end
--------------------------------------------------------------
--			 		Thay ��i Tr�ng Th�i						--
--------------------------------------------------------------
function trangthai()
    local szTitle = "��i hi�p mu�n ��i sang tr�ng th�i n�o?"
    local tbOpt = {"Luy�n C�ng (Tr�ng)/#set_trangthai(0)", "Ch�nh Ph�i (V�ng)/#set_trangthai(1)",
                   "T� Ph�i (T�m)/#set_trangthai(2)", "Trung L�p (Xanh)/#set_trangthai(3)",
                   "S�t Th� (��)/#set_trangthai(4)", "Tr� l�i/main", "Tho�t/no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
function set_trangthai(nTrangthai)
    SetCurCamp(nTrangthai)
    SetCamp(nTrangthai)
end
--------------------------------------------------------------
--			 			Boss Ho�ng Kim						--
--------------------------------------------------------------
function bosshk1()
    local strFaction = GetFaction()
    local nW, nX, nY = GetWorldPos();
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY), "G�i Boss Ho�ng Kim/Auto_TestBoss",
                   "T�m Boss Ho�ng Kim/timbosshk", "Tr� l�i/main", "K�t th�c ��i tho�i/no"};
    CreateTaskSay(tbSay)
    return 1;
end
---------------G�i Boss HK------------------------
----Youtube/c/PYTAGAMING---------
----HAM TEST GOI BOSS KHU VUC
TBBOSS = { -- t�n boss,id boss, t� l� r�i ��,series boss,nLevel
    [1] = {
        szName = "T�nh Th�ng",
        nBossId = 1355,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "Ng�o Thi�n T��ng Qu�n",
        nBossId = 1356,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "Li�u Thanh Thanh",
        nBossId = 523,
        nRate = 322,
        nSeries = 1,
        nLevel = 95
    },
    [4] = {
        szName = "T�y V��ng T� ��c",
        nBossId = 1358,
        nRate = 322,
        nSeries = 1,
        nLevel = 95
    },
    [5] = {
        szName = "Di�u Nh�",
        nBossId = 513,
        nRate = 322,
        nSeries = 2,
        nLevel = 95
    },
    [6] = {
        szName = "Do�n Thanh V�n",
        nBossId = 1360,
        nRate = 322,
        nSeries = 2,
        nLevel = 95
    },
    [7] = {
        szName = "H�c Y S�t Th�",
        nBossId = 1361,
        nRate = 322,
        nSeries = 3,
        nLevel = 95
    },
    [8] = {
        szName = "Th�p Ph��ng C�u Di�t",
        nBossId = 1362,
        nRate = 322,
        nSeries = 3,
        nLevel = 95
    },
    [9] = {
        szName = "Tr��ng T�ng Ch�nh",
        nBossId = 511,
        nRate = 322,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "Thanh Y T�",
        nBossId = 1364,
        nRate = 322,
        nSeries = 4,
        nLevel = 95
    }
}

TBBOSS2 = { -- t�n boss,id boss, t� l� r�i ��,series boss,nLevel
    [1] = {
        szName = "C� B�ch",
        nBossId = 566,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "V��ng T�",
        nBossId = 739,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "Huy�n Gi�c ��i S�",
        nBossId = 740,
        nRate = 322,
        nSeries = 0,
        nLevel = 95
    },
    [4] = {
        szName = "Huy�n Nan ��i S�",
        nBossId = 1365,
        nRate = 342,
        nSeries = 0,
        nLevel = 95
    },
    [5] = {
        szName = "���ng B�t Nhi�m",
        nBossId = 741,
        nRate = 336,
        nSeries = 1,
        nLevel = 95
    },
    [6] = {
        szName = "���ng Phi Y�n",
        nBossId = 1366,
        nRate = 342,
        nSeries = 1,
        nLevel = 95
    },
    [7] = {
        szName = "B�ch Doanh Doanh",
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
        szName = "Thanh Tuy�t S� Th�i",
        nBossId = 743,
        nRate = 341,
        nSeries = 2,
        nLevel = 95
    },
    [10] = {
        szName = "H� Linh Phi�u",
        nBossId = 568,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    },
    [11] = {
        szName = "Chung Linh T�",
        nBossId = 567,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    }
}

TBBOSS22 = { -- t�n boss,id boss, t� l� r�i ��,series boss,nLevel
    [1] = {
        szName = "Y�n Hi�u Tr�i",
        nBossId = 744,
        nRate = 336,
        nSeries = 2,
        nLevel = 95
    },
    [2] = {
        szName = "H� Nh�n Ng�",
        nBossId = 745,
        nRate = 321,
        nSeries = 3,
        nLevel = 95
    },
    [3] = {
        szName = "M�nh Th��ng L��ng",
        nBossId = 583,
        nRate = 321,
        nSeries = 3,
        nLevel = 95
    },
    [4] = {
        szName = "�o�n M�c Du�",
        nBossId = 565,
        nRate = 227,
        nSeries = 3,
        nLevel = 95
    },
    [5] = {
        szName = "Gia Lu�t T� Ly",
        nBossId = 563,
        nRate = 227,
        nSeries = 3,
        nLevel = 95
    },
    [6] = {
        szName = "H�n M�ng",
        nBossId = 748,
        nRate = 341,
        nSeries = 3,
        nLevel = 95
    },
    [7] = {
        szName = "��n T� Nam",
        nBossId = 746,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    },
    [8] = {
        szName = "��o Thanh Ch�n Nh�n",
        nBossId = 562,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    },
    [9] = {
        szName = "T� ��i Nh�c",
        nBossId = 1367,
        nRate = 342,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "Thanh Li�n T�",
        nBossId = 1368,
        nRate = 875,
        nSeries = 4,
        nLevel = 95
    },
    [11] = {
        szName = "Tuy�n C� T�",
        nBossId = 747,
        nRate = 341,
        nSeries = 4,
        nLevel = 95
    }
}

TBBOSSCAONHAN = { -- t�n boss,id boss, t� l� r�i ��,series boss,nLevel
    [1] = {
        szName = "Thi�u L�m H� T� V� T�ng",
        nBossId = 1194,
        nRate = 300,
        nSeries = 0,
        nLevel = 95
    },
    [2] = {
        szName = "Thi�n V��ng Tr�n Bang H� V�",
        nBossId = 1193,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [3] = {
        szName = "D��ng Gia Trang Hi�p Kh�ch",
        nBossId = 1195,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [4] = {
        szName = "Ng� ��c V� S�c La S�t",
        nBossId = 1196,
        nRate = 300,
        nSeries = 1,
        nLevel = 95
    },
    [5] = {
        szName = "Nga Mi Kim ��nh S� Th�i",
        nBossId = 1197,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [6] = {
        szName = "Th�y Y�n M�n V� �nh S�t Th�",
        nBossId = 1198,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [7] = {
        szName = "C�i Bang Ti�u Dao Th�n C�i",
        nBossId = 1199,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [8] = {
        szName = "Thi�n Nh�n H� Gi�o Th�nh S�",
        nBossId = 1200,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    },
    [9] = {
        szName = "V� �ang Th�i �t Ch�n Qu�n",
        nBossId = 1201,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [10] = {
        szName = "C�n L�n H� Ph�i Thi�n Qu�n",
        nBossId = 1202,
        nRate = 300,
        nSeries = 4,
        nLevel = 95
    },
    [11] = {
        szName = "Hoa S�n ��c C� Ki�m Ti�n",
        nBossId = 1231,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    }
}

TBBOSSCAOCAP = { -- t�n boss,id boss, t� l� r�i ��,series boss,nLevel
    [1] = {
        szName = "M� Dung To�n",
        nBossId = 1875,
        nRate = 300,
        nSeries = 2,
        nLevel = 95
    },
    [2] = {
        szName = "Kim Th� L��ng",
        nBossId = 1874,
        nRate = 300,
        nSeries = 0,
        nLevel = 95
    },
    [3] = {
        szName = "Tr��ng Tuy�n",
        nBossId = 1873,
        nRate = 300,
        nSeries = 3,
        nLevel = 95
    }
}

function Auto_TestBoss()
    tb = {"<color=red>" .. GetName() .. "<color> b�n mu�n th� boss n�o?"}
    for k = 1, getn(TBBOSS) do
        tinsert(tb, format("%s/#PickBoss(%d)", TBBOSS[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss2");
    tinsert(tb, "Tho�t/no");
    CreateTaskSay(tb)
end
function Auto_TestBoss2()
    tb = {"<color=red>" .. GetName() .. "<color> b�n mu�n th� boss n�o?"}
    for k = 1, getn(TBBOSS2) do
        tinsert(tb, format("%s/#PickBoss2(%d)", TBBOSS2[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss22");
    tinsert(tb, "Tho�t/no");
    CreateTaskSay(tb)
end
function Auto_TestBoss22()
    tb = {"<color=red>" .. GetName() .. "<color> b�n mu�n th� boss n�o?"}
    for k = 1, getn(TBBOSS22) do
        tinsert(tb, format("%s/#PickBoss22(%d)", TBBOSS22[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss3");
    tinsert(tb, "Tho�t/no");
    CreateTaskSay(tb)
end

function Auto_TestBoss3()
    tb = {"<color=red>" .. GetName() .. "<color> b�n mu�n th� boss n�o?"}
    for k = 1, getn(TBBOSSCAONHAN) do
        tinsert(tb, format("%s/#PickBoss3(%d)", TBBOSSCAONHAN[k].szName, k));
    end
    tinsert(tb, "Trang sau/Auto_TestBoss4");
    tinsert(tb, "Tho�t/no");
    CreateTaskSay(tb)
end

function Auto_TestBoss4()
    tb = {"<color=red>" .. GetName() .. "<color> b�n mu�n th� boss n�o?"}
    for k = 1, getn(TBBOSSCAOCAP) do
        tinsert(tb, format("%s/#PickBoss4(%d)", TBBOSSCAOCAP[k].szName, k));
    end
    tinsert(tb, "Tho�t/no");
    CreateTaskSay(tb)
end

function PickBoss(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local item = TBBOSS[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bosstieu.lua")
    SetNpcParam(index, 1, item.nBossId); -- l�u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss2(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local item = TBBOSS2[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l�u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss22(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local item = TBBOSS22[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\missions\\boss\\bossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l�u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end

function PickBoss3(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local item = TBBOSSCAONHAN[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcDeathScript(index, "\\script\\misc\\boss\\callbossdeath.lua")
    SetNpcParam(index, 1, item.nBossId); -- l�u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
function PickBoss4(nIndex)
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local item = TBBOSSCAOCAP[nIndex];
    local nw, nx, ny = GetWorldPos();
    local index = AddNpcEx(item.nBossId, item.nLevel, item.nSeries, SubWorldID2Idx(nw), nx * 32, ny * 32, 1,
        item.szName, 1);
    SetNpcParam(index, 1, item.nBossId); -- l�u id boss.
    SetNpcTimer(index, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>", item.szName,
        SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
-------------------------T�m Boss HK-----------------------------------------
tbMapGoldBoss = {{"C� B�ch", "Ph� Dung ��ng", 202, "S�n B�o ��ng", 76, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Huy�n Gi�c ��i S�", "Nh�n Th�ch ��ng", 10, "Thanh kh� ��ng", 198, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"���ng Phi Y�n", "Phong L�ng ��", 336, "Kho� Lang ��ng", 75, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Lam Y Y", "V� L�ng ��ng", 199, "Phi Thi�n ��ng", 204, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"H� Linh Phi�u", "Tr��ng B�ch s�n B�c", 322, "V� Danh ��ng", 203, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Y�n Hi�u Tr�i", "Sa M�c s�n  ��ng 1", 225, "Sa M�c s�n  ��ng 3", 227, "T��ng D��ng",
                  78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"M�nh Th��ng L��ng", "Sa m�c ��a bi�u", 224, "Sa M�c s�n  ��ng 2", 226,
                  "T��ng D��ng", 78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh",
                  37, "��i L�", 162, "L�m An", 176},
                 {"Gia Lu�t T� Ly", "L��ng Th�y ��ng", 181, "D��ng Trung ��ng", 205, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"��o Thanh Ch�n Nh�n", "Tr��ng B�ch s�n Nam", 321, "M�c Cao Qu�t", 340, "T��ng D��ng",
                  78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Tuy�n C� T�", "T�y S�n ��o", 342, "Phi Thi�n ��ng", 204, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"V��ng T�", "V� L�ng ��ng", 199, "Ph� Dung ��ng", 202, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Huy�n Nan ��i S�", "Phong L�ng ��", 336, "Kho� Lang ��ng", 75, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"���ng B�t Nhi�m", "Tr��ng B�ch s�n Nam", 321, "Kho� Lang ��ng", 75, "T��ng D��ng",
                  78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"B�ch Doanh Doanh", "Thanh kh� ��ng", 198, "Sa m�c ��a bi�u", 224, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Thanh Tuy�t S� Th�i", "T�y S�n ��o", 342, "D��ng Trung ��ng", 205, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Chung Linh T�", "Phi Thi�n ��ng", 204, "V� Danh ��ng", 203, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"H� Nh�n Ng�", "Nh�n Th�ch ��ng", 10, "L��ng Th�y ��ng", 181, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"�oan M�c Du�", "Phong L�ng ��", 336, "S�n B�o ��ng", 76, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"T� ��i Nh�c", "M�c B�c Th�o Nguy�n", 341, "V� L�ng ��ng", 199, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Thanh Li�n T�", "Tr��ng B�ch s�n B�c", 322, "Sa M�c s�n  ��ng 3", 227, "T��ng D��ng",
                  78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176},
                 {"Thanh Tuy�t S� Th�i", "Sa M�c s�n  ��ng 1", 225, "Sa M�c s�n  ��ng 3", 227,
                  "T��ng D��ng", 78, "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh",
                  37, "��i L�", 162, "L�m An", 176},
                 {"H�n Ngu D�t", "Phong L�ng ��", 336, "Kho� Lang ��ng", 75, "T��ng D��ng", 78,
                  "Ph��ng T��ng", 1, "Th�nh ��", 11, "D��ng Ch�u", 80, "Bi�n Kinh", 37, "��i L�", 162,
                  "L�m An", 176}}

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
        tinsert(tab_Content, "Trang tr��c/#findgoldboss( 1," .. (f_bossx1 - 1) .. ")");
    end

    if (f_bossy1 < n_count) then
        tinsert(tab_Content, "Trang sau/#findgoldboss( " .. (f_bossy1 + 1) .. "," .. n_count .. ")");
    end
    tinsert(tab_Content, "Tho�t/no");
    Say("��i hi�p t�m cao th� n�o?", getn(tab_Content), tab_Content);
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
    strTittle = "T�m th�y cao th� v� l�m " .. tbMapGoldBoss[nId][1] .. " t�i c�c v� tr� sau ��y."
    -- tinsert(tbOpt, {"tho�t ",Quit})
    tinsert(tb, "Tr� l�i/#findgoldboss(1,12)")
    tinsert(tb, "Tho�t/no")
    -- CreateNewSayEx(strTittle, tbOpt)
    Say(strTittle, getn(tb), tb)
end
function findgoldboss_Step3(nX, nY, Map)
    NewWorld(Map, nX, nY) --
    SetFightState(1)
end
--------------------------------------------------------------
--			 T�y T�y, C�ng �i�m Nhanh							--
--------------------------------------------------------------
function chose_reset_type(num)
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    if num == 1 then
        tinsert(tbSay, "T�y Ti�m n�ng/DoClearPropCore")
        tinsert(tbSay, "C�ng Ti�m n�ng nhanh/add_prop")
    else
        tinsert(tbSay, "T�y K� n�ng/DoClearSkillCore")
        tinsert(tbSay, "C�ng K� n�ng nhanh/dialog_main")
    end
    tinsert(tbSay, "Tr� l�i/status_dialog")
    tinsert(tbSay, "Tho�t/no")

    CreateTaskSay(tbSay)
end
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
    local tbSay = {"��i hi�p mu�n nh�n lo�i �i�m n�o?", "Kinh nghi�m (EXP)/kinhnghiem",
                   "N�ng c�p ��/dangcap200", "Nh�n �i�m Ti�m n�ng/pointtiemnang",
                   "Nh�n �i�m K� n�ng/pointkynang", "Nh�n Ti�n v�n/tien", "Nh�n Ti�n ��ng/tiendong",
                   "Nh�n Kim Nguy�n B�o/knb", "Nh�n Ch�n nguy�n v� H� M�ch ��n/channguyen",
                   "Nh�n Danh v�ng/danhvong", "Nh�n �i�m Ph�c duy�n/phucduyen",
                   "Nh�n Full T�i l�nh ��o/tailanhdao", "Nh�n �i�m C�ng hi�n Bang h�i/conghien",
                   "Tr� l�i/main", "K�t th�c ��i tho�i/no"}
    CreateTaskSay(tbSay)
end
------------Ch�n Nguy�n----------------------------
function channguyen()
    SetTask(4000, GetTask(4000) + 12000)
    for i = 1, 12 do
        AddStackItem(500, 6, 1, 3203, 0, 0, 0)
    end
    Msg2Player(
        "B�n nh�n ���c <color=yellow>12000<color> Ch�n Nguy�n v� <color=yellow>6000<color> H� M�ch ��n")
end
------------C�p-------------------
function dangcap200()
    AskClientForNumber("level", 0, 200, "Nh�p C�p ��:")
end

function level(num)
    local nCurLevel = GetLevel()
    local nAddLevel = num - nCurLevel
    ST_LevelUp(nAddLevel)
    Msg2Player("B�n nh�n ���c <color=yellow>" .. num .. "<color> c�p ��.")
end
---EXP-----
function kinhnghiem()
    AskClientForNumber("kinhnghiem1", 0, 9999999999999999, "Nh�p EXP")
end
function kinhnghiem1(nNum)
    AddOwnExp(nNum)
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> kinh nghi�m.")
end
---Tien Van---
function tien()
    AskClientForNumber("tienvan", 0, 10000000, "Nh�p S� L��ng:")
end
function tienvan(slkv)
    local money = slkv * 10000
    local giatrikv = money / 10000
    Earn(money)
    Msg2Player(format("B�n nh�n ���c <color=yellow>%s<color> v�n.", giatrikv))
end
---Tien Dong---
function tiendong()
    AskClientForNumber("tiendong1", 0, 1000, "Nh�p S� L��ng:")
end
function tiendong1(sltiendong)
    for i = 1, sltiendong do
        AddStackItem(1, 4, 417, 1, 1, 0, 0, 0)
    end
    Msg2Player("B�n nh�n ���c <color=yellow>" .. sltiendong .. "<color> ti�n ��ng.")
end
----KNB------
function knb()
    AskClientForNumber("layknb", 0, 100000, "Nh�p S� L��ng:")
end
function layknb(slknb)
    for i = 1, slknb do
        AddEventItem(343)
    end
    Msg2Player("B�n nh�n ���c <color=yellow>" .. slknb .. "<color> KNB.")
end
----------------�i�m K� N�ng----------------------------------------
function pointkynang()
    AskClientForNumber("pointkynang1", 0, 1000, "Nh�p S� L��ng:")
end
function pointkynang1(nNum)
    AddMagicPoint(nNum) ---Nh�n �i�m k� n�ng
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m K� N�ng.")
end
------------------�i�m Ti�m N�ng--------------------------------------
function pointtiemnang()
    AskClientForNumber("pointtiemnang1", 0, 1000000, "Nh�p S� L��ng:")
end
function pointtiemnang1(nNum)
    AddProp(nNum) ---Nh�n �i�m ti�m n�ng
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m Ti�m N�ng.")
end
------------Danh V�ng----------------------------
function danhvong()
    AskClientForNumber("danhvongINPUT", 0, 100000, "Nh�p S� L��ng:")
end
function danhvongINPUT(nNum)
    AddRepute(nNum);
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m Danh V�ng.")
end
------------Ph�c Duy�n----------------------------
function phucduyen()
    AskClientForNumber("phucduyen2", 0, 100000, "Nh�p S� L��ng:")
end
function phucduyen2(nNum)
    FuYuan_Start();
    FuYuan_Add(nNum);
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m Ph�c Duy�n.")
end
------------T�i L�nh ��o----------------------------
function tailanhdao()
    for i = 1, 250 do
        AddLeadExp(1000000000)
    end
    Msg2Player("B�n nh�n ���c 100 c�p t�i l�nh ��o");
end
------------�i�m C�ng Hi�n----------------------------
function conghien()
    AddContribution(1000000);
    Msg2Player("B�n nh�n ���c 1.000.000 �i�m c�ng hi�n")
end
