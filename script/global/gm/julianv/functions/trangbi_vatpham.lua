------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\global\\gm\\julianv\\functions\\hoangkim_bachkim.lua") -- v� khi b�ch kim
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- l�y item ho�ng kim, b�ch kim
Include("\\script\\global\\gm\\lib_data_table.lua") -- data table ng�a & trang b�
Include("\\script\\global\\gm\\julianv\\lib\\lib_trangbi.lua")

function NhanTrangBi()
    dofile("script/global/gm/julianv/lib/lib_trangbi.lua")
    local tbOpt = { --    
    {"Trang b� Ho�ng Kim - B�ch Kim cao c�p", chose_type_goldquip}, --   
    {"Trang b� Ho�ng Kim M�n Ph�i", SetHKMP_Dialog}, --    
    {"Nh�n trang b� Tr�n Bang Chi B�o", TrangBi_HKMP_An}, --
    {"V� kh� B�ch Kim m�n ph�i", VKHK_Dialog, {1}}, --
    {"V� kh� Ho�ng Kim M�n Ph�i", VKHK_Dialog, {2}}, --
    {"Nh�n An Bang, Kim Phong, ��nh Qu�c", HoangKimCui}, --
    {"Nh�n �� xanh"}, --
    {"Nh�n �� t�m", QualityItem_Dialog}} --
    tbDialog:Show(tbOpt, TrangBi_VatPham)
end

function NhanVatPham()
    local tbOpt = { --
    {"L�y ng�a", Horses_Dialog}, --
    {"V�t ph�m tr�ng sinh", TransLifeItem_Dialog}}
    tbDialog:Show(tbOpt, TrangBi_VatPham)
end

function ChangeFeature_Dialog()
    local tbOpt = { --
    {"Xem tr��c ngo�i h�nh", Feature_Preview}, --
    {"Ki�m tra ID ngo�i trang", Check_Feature}, --
    {"��i ngo�i h�nh trang b� theo ID", Change_Equip_Feature}, --
    {"��i ngo�i h�nh v� kh� (S� d�ng menu)", Change_Weapon_Feature}, --
    {"Ph�c h�i ngo�i h�nh g�c", Restore_Feature}}
    tbDialog:Show(tbOpt, TrangBi_VatPham)
end

function Horses_Dialog()
    local tbOpt = {}
    for i = 1, getn(tbNameResHorse) do
        tinsert(tbOpt, {tbNameResHorse[i].szName, Chose_Horses, {i}})
    end
    tbDialog:Show(tbOpt, NhanVatPham)
end

function Chose_Horses(nHorseType, nPage)
    local tbHorse = JDialog:PhanTrang(tbNameResHorse[nHorseType].szEquip, 10)
    local tbHorseRes = function(table, num)
        return {table[num][1] .. " [C�p " .. table[num][3] .. "]", Add_Horses, {table[num][2], table[num][3]}}
    end
    local tbOpt = {}
    if not nPage or nPage == 1 then
        for i = 1, 10 do
            tinsert(tbOpt, tbHorseRes(tbHorse[1], i))
        end
        tinsert(tbOpt, {"Trang sau", Chose_Horses, {nHorseType, 2}})
    else
        local nCount = getn(tbHorse)
        if nPage < nCount then
            for i = 1, 10 do
                tinsert(tbOpt, tbHorseRes(tbHorse[nPage], i))
            end
            tinsert(tbOpt, {"Trang sau", Chose_Horses, {nHorseType, nPage + 1}})
        else
            for i = 1, getn(tbHorse[nCount]) do
                tinsert(tbOpt, tbHorseRes(tbHorse[nCount], i))
            end
        end
        if nPage > 1 then
            tinsert(tbOpt, {"Trang tr��c", Chose_Horses, {nHorseType, nPage - 1}})
        end
    end
    tbDialog:Show(tbOpt, nil, "<sex>mu�n l�y ng�a n�o<pic=44><color>")
end

function Add_Horses(nId, nLevel)
    Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(0, 10, nId, nLevel, 0, 0, 0)))
end
-------------------------Start Feature-------------------------
tbNgoaiTrang = {
    [0] = "Ngo�i h�nh NPC",
    [1] = "Ngo�i h�nh M�",
    [2] = "Ngo�i h�nh �o",
    [3] = "Ngo�i h�nh V� kh�",
    [4] = "Ngo�i h�nh Ng�a"
}

function Feature_Preview()
    function Feature_Help()
        local szTitle =
            "<pic=139> <bclr=pink>Ch�c n�ng thay ��i ngo�i h�nh trang b�:<bclr>\n\n<pic=136> Ch�n ki�u ngo�i trang mu�n xem tr��c.\n<pic=135> Nh�p ID b�t ��u xem.\n<pic=136> Sau �� s� d�ng {{��i H�ng Bao}} v� {{Ti�u H�ng Bao}} �� xem �i t�i ho�c l�i l�i.\n<pic=135><color> Sau khi ch�n ���c ngo�i h�nh �ng � th� s� d�ng ch�c n�ng ��i ngo�i h�nh trang b� theo ID �� thay ��i."
        tbDialog:Show({{"Ta �� hi�u", Feature_Preview}}, nil, szTitle)
    end

    if HaveCommonItem(6, 1, 13) < 1 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(6, 1, 13, 0, 0, 0)))
    end
    if HaveCommonItem(6, 1, 14) < 1 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(6, 1, 14, 0, 0, 0)))
    end
    local tbOpt = {}
    tinsert(tbOpt, {"Xem h��ng d�n", Feature_Help})
    for i = 0, getn(tbNgoaiTrang) do
        tinsert(tbOpt, {tbNgoaiTrang[i], Ask_Feature_StartId, {i}})
    end
    tbDialog:Show(tbOpt, ChangeFeature_Dialog)
end

function Ask_Feature_StartId(nId)
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr��c ngo�i h�nh <color=yellow>" .. tbNgoaiTrang[nId])
    g_AskClientNumberEx(1, 9999, "Start ID", {SetTaskTemp, {169}})
end

function Check_Feature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player(format(
        "Helm: <color=yellow>%d<color>, Armor: <color=yellow>%d<color>, Weapon: <color=yellow>%d<color>, Horse <color=yellow>%d<color>, Mask: <color=yellow>%d",
        nHelm, nArmor, nWeapon, nHorse, nMaskNPC))
end

function Change_Equip_Feature()
    GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        "Change_Equip_Feature_Confirm", "onCancel", 1);
end

function Change_Equip_Feature_Confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "Nh�p ID mu�n ��i:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function Change_Weapon_Feature()
    GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        "Change_Weapon_Feature_Confirm", "onCancel", 1);
end

function Change_Weapon_Feature_Confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "Nh�p ID mu�n ��i:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function Restore_Feature()
    GiveItemUI("Ph�c h�i ngo�i h�nh trang b�", "��t v�o c�c trang b� mu�n ph�c h�i.",
        "Restore_Feature_Confirm", "onCancel", 1);
end

function Restore_Feature_Confirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        SetItemNewFeature(nItemIndex, -1)
    end
end
-------------------------End Feature-------------------------
function DisposeItem(nCount)
    if not nCount then
        GiveItemUI("H�y v�t ph�m",
            "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m, v�t ph�m �� h�y kh�ng th� l�y l�i ���c!",
            "DisposeItem", "onCancel", 1);
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
        end
        Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
        Talk(1, "", "Thao t�c th�nh c�ng, xin ki�m tra l�i!");
    end
end

function getGoldItem(nItemIdx)
    if not nItemIdx then
        g_AskClientNumberEx(1, 9999, "GoldItem ID", {getGoldItem})
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nItemIdx)))
    end
end

function ClearF4(bComfirm)
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L�u �: <color>T�t c� v�t ph�m v� trang b� trong R��ng ch�a �� s� b� {{Xo� b�}} ho�n to�n v� kh�ng th� ph�c h�i nh� c�.\n\n<sex>c� ch�c ch�n mu�n l�m v�y kh�ng<pic=44><color>", --
            {{"X�c nh�n", ClearF4, {1}}, --
            {"�� ta suy ngh� l�i..."}})
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do
                RemoveItemByIndex(tbItems[i], -1);
            end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "�� d�n s�ch r��ng")
    end
end

function getQuestkey(nItemId)
    if nItemId == 7 or not nItemId then
        g_AskClientNumberEx(343, 9999, "Questkey ID", {getQuestkey})
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddEventItem(nItemId)))
    end
end

function getMagicItem(szItem)
    if not szItem then
        g_AskClientStringEx("6,1,125,0,0,0", 1, 9000, "Item Code:", {getMagicItem})
    else
        local tbItem = lib:Split(szItem, ",")
        if getn(tbItem) == 6 then
            local nClass, nType, nId, nLvl, nSerie, nLuck, nMagic = tonumber(tbItem[1]), tonumber(tbItem[2]),
                tonumber(tbItem[3]), tonumber(tbItem[4]), tonumber(tbItem[5]), tonumber(tbItem[6])
            local nItemIdx = AddItem(nClass, nType, nId, nLvl, nSerie, nLuck, nMagic)
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(nItemIdx))
        else
            Talk(1, "", "Sai Item code: [" .. getn(tbItem) .. "] tr��ng d� li�u.")
        end
    end
end

function ExpandStorage()
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    AddItem(6, 1, 1427, 90, 1, 0, 0)
end

function QualityItem_Dialog(bGoto)
    if not bGoto then
        CreateTaskSay({"H�y nh�n �� t�m t�i <bclr=pink>NPC �� T�m<bclr>\n\n" ..
            strfill_center("<color=yellow>Ba L�ng Huy�n<color>: <color=green>200/200<color>", 100) ..
            "\n<sex>c� mu�n di chuy�n t�i �� kh�ng?", --
        "H�y ��a ta t�i ��!/#QualityItem_Dialog(1)", --
        "Ta s� quay l�i sau.../return"})
    else
        Msg2Player("H�y ng�i y�n, ch�ng ta di chuy�n t�i <color=yellow>Ba L�ng Huy�n")
        w, x, y = GetWorldPos()
        if (w ~= 53) then
            SetFightState(0)
            NewWorld(53, 1605, 3205)
        else
            SetPos(1605, 3205)
        end
    end
end
---------------V�t ph�m tr�ng sinh---------------
tbTransLifeItems = { --
{
    szName = "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>",
    tbProp = {6, 1, 1390, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "<B�c ��u Tr��ng Sinh Thu�t - ��i Th�a T�m Ph�p>",
    tbProp = {6, 1, 2974, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "B�c ��u T�y T�y ��n",
    tbProp = {6, 1, 30127, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "T�ch L�ch ��n",
    tbProp = {6, 1, 2973, 0, 0, 0}
}}

function TransLifeItem_Dialog()
    local tbOpt = {}
    for i = 1, getn(tbTransLifeItems) do
        tinsert(tbOpt, {tbTransLifeItems[i].szName, getTransLifeItem, {i}})
    end
    tbDialog:Show(tbOpt, NhanVatPham)
end
function getTransLifeItem(nIndex, nCount)
    local nMax = CalcFreeItemCellCount()
    if not nCount then
        g_AskClientNumberEx(1, nIndex == 4 and 999 or nMax, "S� l��ng", {getTransLifeItem, {nIndex}})
    else
        if nIndex == 4 then
            for i = 1, nCount do
                local prop = tbTransLifeItems[4].tbProp
                AddItem(prop[1], prop[2], prop[3], prop[4], prop[6], prop[6])
            end
            Msg2Player(format("Nh�n ���c %d %s", nCount, tbTransLifeItems[4].szName))
        else
            local tbLog = format("[liguan]get_free_item_%s", tbTransLifeItems[nIndex].szName)
            tbAwardTemplet:GiveAwardByList(tbTransLifeItems[nIndex], szLogTitle, nCount)
        end
    end
end
