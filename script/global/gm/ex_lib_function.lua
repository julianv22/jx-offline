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
Include("\\script\\task\\newtask\\newtask_head.lua")
TITLEDIALOG = "T�n nh�n v�t : <color=green>%s<color>\n" .. "T�n t�i kho�n: <color=green>%s<color>\n" ..
                  "T�a ��       : <color=green>%d, %d/%d<color> \nIP           : <color=green>%s<color>"
-- Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
Include("\\script\\global\\gm\\lib_data_table.lua");
Include("\\script\\global\\gm\\lib_data_table_filelua.lua");
Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua"); -- t�y t�y, c�ng �i�m nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua");
Include("\\script\\global\\gm\\functions_points.lua"); -- l�y c�c lo�i �i�m
Include("\\script\\global\\gm\\functions_playmusic.lua"); -- play music
Include("\\script\\global\\gm\\functions_boss.lua") -- g�i boss ,t�m boss
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- l�y item ho�ng kim, b�ch kim
function main()
    dofile("script/global/gm/ex_lib_function.lua")
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "V�t t�t c� v�t ph�m trong r��ng/vutallvatpham")
    tinsert(tbSay, "Nh�n danh hi�u ki�m th�/chondanhhieu")
    tinsert(tbSay, "L�y c�c lo�i �� v� �i�m/laydohoangkim")
    -- tinsert(tbSay, "Test/takeMusic") 
    -- tinsert(tbSay, "L�y full ng�a/layngua") 
    tinsert(tbSay, "��i ngo�i h�nh v� kh�/ngoaitrang")
    -- tinsert(tbSay, "L�y c�c lo�i �i�m/laydiem") 
    -- tinsert(tbSay, "L�y Magicscript Item/TaoItem") 
    tinsert(tbSay, "Th�m,X�a Skill theo ID/LaySkillID")
    tinsert(tbSay, "��i m�u ch�/change_mauchu")
    tinsert(tbSay, "Chuy�n ��i m�n ph�i/change_phai")
    -- tinsert(tbSay, "L�y Set �� ho�ng kim, b�ch kim/chose_type_goldquip")
    -- tinsert(tbSay, "N�ng c�p �� b�ch kim/bachkim_main")
    tinsert(tbSay, "Boss Ho�ng Kim/bosshk")
    tinsert(tbSay, "T�y, c�ng �i�m nhanh/chose_reset_type")
    tinsert(tbSay, "Reload ngay/reloadngay")
    tinsert(tbSay, "Reload Script/ReLoadScript")
    tinsert(tbSay, "H�y v�t ph�m/DisposeItem")
    tinsert(tbSay, "K�t th�c ��i tho�i./no")
    CreateTaskSay(tbSay)
    return 1;
end
-----------------------------------------------------------------------------
function laydohoangkim()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "L�y full ng�a/layngua")
    tinsert(tbSay, "L�y c�c lo�i �i�m/laydiem")
    tinsert(tbSay, "L�y phi phong/layphiphong")
    tinsert(tbSay, "L�y c�c lo�i �i�m/laydiem")
    tinsert(tbSay, "L�y Magicscript Item/TaoItem")
    tinsert(tbSay, "L�y Set �� ho�ng kim, b�ch kim/chose_type_goldquip")
    tinsert(tbSay, "N�ng c�p �� b�ch kim/bachkim_main")
    tinsert(tbSay, "K�t th�c ��i tho�i./no")
    CreateTaskSay(tbSay)
    return 1;
end

function vutallvatpham()
    ThrowAllItem()
end
--------------------test------------------------
Include("\\script\\global\\thanh\\npc\\bosssatthuhead.lua")
Include("\\script\\global\\thanh\\npc\\add_npc.lua")
-- function nhandanhhieu(nindex)
-- Title_AddTitle(nindex, 1, 4302359);
-- Title_ActiveTitle(nindex);
-- SetTask(1122, nindex);
-- end
---------------Nh�n Danh Hi�u-----------------------
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
--------------------- L�y phi phong-------------------------
function layphiphong()
    for i = 3465, 3490 do
        AddGoldItem(0, i)
    end
end
--------------------- Gia Nh�p M�n Ph�i (New)-------------------------
Include("\\script\\faction_def.lua")
function change_phai()
    local szTitle = "Xin ch�o ! ��i hi�p mu�n gia nh�p ph�i n�o ?"
    local tbOpt = {}
    local tbFacName = tbFacDef.tbFacShortName
    for i = 0, getn(tbFacName) do
        tinsert(tbOpt, {tbFacName[i], joinMonphai, {i}})
    end
    tinsert(tbOpt, {"L�t n�a quay l�i"});
    CreateNewSayEx(szTitle, tbOpt)
end
function joinMonphai(nIndex)
    local CurFaction = GetLastFactionNumber()
    local nLevelSkill = 150 -- add t�i skill 150
    if nIndex == CurFaction then
        Msg2Player("Hi�n t�i b�n �ang � m�n ph�i n�y")
        return 1;
    end
    ---------------th�ng tin m�n ph�i hi�n t�i-------------------
    local curFacNames = tbFacDef.tbFacNames[CurFaction]
    local fname = tbFacDef.tbFacChNames[CurFaction]
    if curFacNames ~= nil then
        DoClearSkillCore()
        local curFacNumber = tbFacDef.tbFacName2FacId[curFacNames]
        local curTaskId_Fact
        mi = tbFacDef.tbFacTaskIds[CurFaction]
        nt_setTask(curTaskId_Fact, 0) -- x�a nhi�m v� m�n ph�i c�a ph�i c�
        for i = 10, nLevelSkill, 10 do
            DelFacSkill(curFacNumber, i)
        end
        local szMsg = format("�� x�a t�t c� k� n�ng c�a <color=green>%s<color>", fname)
        Msg2Player("" .. szMsg)
    end
    -------------Th�ng tin add m�n ph�i m�i---------------------
    local FacNames = tbFacDef.tbFacNames[nIndex]
    local FacNumber = tbFacDef.tbFacName2FacId[FacNames]
    local FacSeries = tbFacDef.tbSeriess[nIndex]
    local Camps = tbFacDef.tbCamps[nIndex]
    local RankIds = tbFacDef.tbRankIds[nIndex]
    local TaskId_Fact = tbFacDef.tbFacTaskIds[nIndex]
    local TaskId_137s = tbFacDef.tbTaskId_137s[nIndex]
    local Value_137s = tbFacDef.tbValue_137s[nIndex]
    local name = format("<color=yellow>" .. GetName() .. "<color>")
    local JoinMsgs = format(tbFacDef.tbJoinMsgs[nIndex], name)
    ----------------------------------
    SetSeries(FacSeries)
    nt_setTask(TaskId_Fact, 60 * 256) -- Set l�m nhi�m v� xu�t s�
    SetFaction(FacNames)
    SetCamp(Camps)
    SetCurCamp(Camps)
    SetRank(RankIds)
    nt_setTask(TaskId_137s, Value_137s)
    SetLastFactionNumber(FacNumber)
    for i = 10, nLevelSkill, 10 do
        AddFacSkill(FacNumber, i)
    end
    DoClearPropCore()
    Msg2SubWorld(JoinMsgs)
    -- KickOutSelf()
end

function test()
    local szTitle = "Xin ch�o ! ��i hi�p h�c mu�n gi�p �� g�?"
    local tbOpt = {{"K�t th�c ��i tho�i"}}
    CreateNewSayEx("<link=image:\\spr\\item\\songjin\\token.spr> <link>" .. szTitle .. "", tbOpt)
end

function gotomap()
    w, x, y = GetWorldPos()
    if (w ~= 193) then
        SetFightState(0)
        NewWorld(193, 1937, 2851)
    end
end
--------Ng�a------------------
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
--------Ngoai Trang--------------
function ngoaitrang()
    local szTitle = "��i hi�p c�n g�?"
    local tbOpt = {"Ki�m ID ngo�i trang/CheckFeature", "Thay ��i ngo�i h�nh cho v� kh�/feature_item",
                   "Ph�c h�i ngo�i h�nh g�c cho trang b�/restore_feature_item", "Tr� l�i/main", "Th�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function CheckFeature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player("Helm, Armor, Weapon, Horse, Mask:")
    Msg2Player(nHelm .. ", " .. nArmor .. ", " .. nWeapon .. ", " .. nHorse .. ", " .. nMaskNPC)
end

function feature_item()
    GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        "feature_item_confirm", "onCancel", 1);
end

function feature_item_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
        chose_typeweapon(nItemIndex, nGenre, nDetailType, nParticular)
    end
end
function chose_typeweapon(nItemIndex, nGenre, nDetailType, nParticular)
    local tbOpt = {"Ch�n lo�i h�nh v� kh�"}
    local list = tbNameResWeapon
    for i = 1, getn(list) do
        tinsert(tbOpt, list[i].szName ..
            format("/#chose_typeweapon_final(%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType, nParticular, i));
        -- Msg2Player(""..i)
    end
    CreateTaskSay(tbOpt);
end
function chose_typeweapon_final(nItemIndex, nGenre, nDetailType, nParticular, num, page)
    local tbOpt = {"<dec><npc>��i hi�p mu�n ch�n v� kh� n�o ?"};
    local list = tbNameResWeapon[num].tbEquip;
    local nNum = getn(list)
    if page ~= nil then
        local nCount = nNum - page * 8
        if nCount > 8 then
            for i = page * 8 + 1, page * 8 + 8 do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            if page == 0 then
                tinsert(tbOpt,
                    format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page + 1))
            end
            if page >= 1 then
                tinsert(tbOpt,
                    format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page + 1))
                tinsert(tbOpt,
                    format("Trang tr��c/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page - 1))
            end
            Msg2Player("" .. page)
            tinsert(tbOpt, "Tho�t/no")
        end
        if nCount <= 8 then
            for i = page * 8 + 1, nNum do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, "Tho�t/no")
        end
        -- tinsert(tbSay,format("Trang tr��c/#chose_typeweapon_final(%d,%d)",num))
    end
    if page == nil then
        if nNum > 8 then
            for i = 1, 8 do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre,
                nDetailType, nParticular, num, 1))
            tinsert(tbOpt, "Tho�t/no")
        end
        if nNum <= 8 then
            for i = 1, nNum do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, "Tho�t/no")
        end
    end
    CreateTaskSay(tbOpt);
end
function setngoaitrang(nItemIndex, nNo)
    SetItemNewFeature(nItemIndex, nNo)
end
function restore_feature_item()
    GiveItemUI("Ph�c h�i ngo�i h�nh trang b�", "��t v�o c�c trang b� mu�n ph�c h�i.",
        "restore_feature_item_confirm", "onCancel", 1);
end

function restore_feature_item_confirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        SetItemNewFeature(nItemIndex, -1)
    end
end
----------------------------------------------------Bach Kim -----------------------------------
function bachkim_main()
    local szTitle = " Xin ch�o <color=red>" .. GetName() .. "<color> ! ��i hi�p mu�n s� d�ng ch�c n�ng g�?"
    local tbOpt = {}
    tinsert(tbOpt, "N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 0/make_bachkim")
    tinsert(tbOpt, "N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 10/make_bachkim_max")
    tinsert(tbOpt, "N�ng c�p trang b� B�ch Kim t�ng c�p/up_bachkim")
    tinsert(tbOpt, "Quay l�i/main")
    tinsert(tbOpt, "Th�i./no")
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
------Lay Skill Theo ID--------
function LaySkillID()
    local szTitle = "Xin ch�o  <color=red>" .. GetName() .. "<color>, b�n mu�n nh�n hay x�a skill n�o?"
    local tbOpt = {{"Th�m Skills", g_AskClientStringEx, {"1200,20", 0, 256, "ID Skill", {AddSkill, {self}}}},
                   {"X�a Skills", g_AskClientStringEx, {"1200", 0, 300, "ID Skill", {DelSkill, {self}}}},
                   {"Th�m Danh S�ch Skills", g_AskClientStringEx,
                    {"1200,1210", 0, 256, "ID Skill", {AddDSSkill, {self}}}},
                   {"X�a Danh S�ch Skills", g_AskClientStringEx, {"1,1500", 0, 256, "ID Skill", {DelDSSkill, {self}}}},
                   {"Tr� V�", main}, {"Tho�t."}}
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
------------------��i t�n-----------------------
function doiten()
    AskClientForString("doitennv", "", 1, 100, "Xin nh�p t�n m�i");
end
function doitennv(strings)
    RenameRole(strings)
end
------------------��i gi�i t�nh-----------------------
function doigioitinh()
    local szTitle = "Ng��i c� ch�c ch�n ��i gi�i t�nh?"
    local tbOpt = {"��ng �/chuyengioi", "T� ch�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
function chuyengioi()
    if GetSex() == 1 then
        SetSex(0)
    else
        SetSex(1)
    end
    Talk(1, "", "�� chuy�n gi�i th�nh c�ng")
    KickOutSelf()
end
-----------H�y V�t Ph�m---------------
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
    end -- for
    Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
    Talk(1, "", "Thao t�c th�nh c�ng, ki�m tra l�i!");
end

---------------------------------------------------------------
function TaoItem(num)
    g_AskClientStringEx("222,0,1", 1, 9000, "ID, C�p , s� l��ng:", {TaoItemID})
end
function TaoItemID(szItem)
    local szICode = lib:Split(szItem, ",");
    local n = getn(szICode);
    if (n ~= 1) then
        if (n < 3) then
            Talk(1, "", format("Sai Item Code. Thi�u tr��ng y�u c�u <color=yellow>%s<color>", n));
            return
        end
        if (n > 3) then
            Talk(1, "", format("Sai Item Code. Qu� nhi�u tr��ng d� li�u <color=yellow>%s<color>", n));
            return
        end
        local itid = tonumber(szICode[1]);
        local itlv = tonumber(szICode[2]);
        local itnum = tonumber(szICode[3]);
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
        for i = 1, itnum do
            AddItem(6, 1, itid, itlv, 0, 0, 0);
        end
    end
end

function reloadngay()
    local nlink = tbLinkFileLua[1].szFileLua
    for i = 1, getn(nlink) do
        local ReloadScript = LoadScript("" .. nlink[i][1] .. "");
        if (FALSE(ReloadScript)) then
            Msg2Player("Xu�t hi�n l�i, kh�ng th� Reload!<enter><color=yellow>" .. nlink[i][1] .. "");
        else
            Msg2Player("<color=green>Reload th�nh c�ng Script : <color><enter><color=blue>" .. nlink[i][1] .. "");
        end
    end
end
function NhapDuongDan(Link)
    local ReloadScript = LoadScript(Link);
    if (FALSE(ReloadScript)) then
        Msg2Player("Xu�t hi�n l�i, kh�ng th� Reload!<enter><color=yellow>" .. Link .. "");
    else
        Msg2Player("<color=green>Reload th�nh c�ng Script<color><enter><color=blue>" .. Link .. "");
    end
end
function ReLoadScript()
    return AskClientForString("NhapDuongDan", "", 1, 500, "<#>Nh�p ���ng d�n")
end
function change_mauchu()
    local aryDescribe = {"<dec><npc>��i hi�p mu�n ��i tr�ng th�i n�o ?"};
    for i = 1, getn(tbMauChu) do
        tinsert(aryDescribe, tbMauChu[i][1] .. format("/#set_mauchu(%d)", tbMauChu[i][2]));
    end
    tinsert(aryDescribe, "L�t n�a quay l�i /no");
    CreateTaskSay(aryDescribe);
end

function set_mauchu(num)
    SetCurCamp(num)
    SetCamp(num)
end

---------- Reset point------------------
function chose_reset_type()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "T�y ti�m n�ng/DoClearPropCore")
    tinsert(tbSay, "T�y k� n�ng/DoClearSkillCore")
    tinsert(tbSay, "C�ng �i�m Nhanh/add_prop");
    tinsert(tbSay, "Quay l�i/main");
    CreateTaskSay(tbSay)
end
