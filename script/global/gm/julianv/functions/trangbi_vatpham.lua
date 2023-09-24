------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\global\\gm\\julianv\\functions\\hoangkim_bachkim.lua") -- vò khi b¹ch kim
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- lÊy item hoµng kim, b¹ch kim
Include("\\script\\global\\gm\\lib_data_table.lua") -- data table ngùa & trang bÞ
Include("\\script\\global\\gm\\julianv\\lib\\lib_trangbi.lua")

function NhanTrangBi()
    dofile("script/global/gm/julianv/lib/lib_trangbi.lua")
    local tbOpt = { --    
    {"Trang bÞ Hoµng Kim - B¹ch Kim cao cÊp", chose_type_goldquip}, --   
    {"Trang bÞ Hoµng Kim M«n Ph¸i", SetHKMP_Dialog}, --    
    {"NhËn trang bÞ TrÊn Bang Chi B¶o", TrangBi_HKMP_An}, --
    {"Vò khÝ B¹ch Kim m«n ph¸i", VKHK_Dialog, {1}}, --
    {"Vò khÝ Hoµng Kim M«n Ph¸i", VKHK_Dialog, {2}}, --
    {"NhËn An Bang, Kim Phong, §Þnh Quèc", HoangKimCui}, --
    {"NhËn ®å xanh"}, --
    {"NhËn ®å tÝm", QualityItem_Dialog}} --
    tbDialog:Show(tbOpt, TrangBi_VatPham)
end

function NhanVatPham()
    local tbOpt = { --
    {"LÊy ngùa", Horses_Dialog}, --
    {"VËt phÈm trïng sinh", TransLifeItem_Dialog}}
    tbDialog:Show(tbOpt, TrangBi_VatPham)
end

function ChangeFeature_Dialog()
    local tbOpt = { --
    {"Xem tr­íc ngo¹i h×nh", Feature_Preview}, --
    {"KiÓm tra ID ngo¹i trang", Check_Feature}, --
    {"§æi ngo¹i h×nh trang bÞ theo ID", Change_Equip_Feature}, --
    {"§æi ngo¹i h×nh vò khÝ (Sö dông menu)", Change_Weapon_Feature}, --
    {"Phôc håi ngo¹i h×nh gèc", Restore_Feature}}
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
        return {table[num][1] .. " [CÊp " .. table[num][3] .. "]", Add_Horses, {table[num][2], table[num][3]}}
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
            tinsert(tbOpt, {"Trang tr­íc", Chose_Horses, {nHorseType, nPage - 1}})
        end
    end
    tbDialog:Show(tbOpt, nil, "<sex>muèn lÊy ngùa nµo<pic=44><color>")
end

function Add_Horses(nId, nLevel)
    Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddItem(0, 10, nId, nLevel, 0, 0, 0)))
end
-------------------------Start Feature-------------------------
tbNgoaiTrang = {
    [0] = "Ngo¹i h×nh NPC",
    [1] = "Ngo¹i h×nh Mò",
    [2] = "Ngo¹i h×nh ¸o",
    [3] = "Ngo¹i h×nh Vò khÝ",
    [4] = "Ngo¹i h×nh Ngùa"
}

function Feature_Preview()
    function Feature_Help()
        local szTitle =
            "<pic=139> <bclr=pink>Chøc n¨ng thay ®æi ngo¹i h×nh trang bÞ:<bclr>\n\n<pic=136> Chän kiÓu ngo¹i trang muèn xem tr­íc.\n<pic=135> NhËp ID b¾t ®Çu xem.\n<pic=136> Sau ®ã sö dông {{§¹i Hång Bao}} vµ {{TiÓu Hång Bao}} ®Ó xem ®i tíi hoÆc lïi l¹i.\n<pic=135><color> Sau khi chän ®­îc ngo¹i h×nh ­ng ý th× sö dông chøc n¨ng §æi ngo¹i h×nh trang bÞ theo ID ®Ó thay ®æi."
        tbDialog:Show({{"Ta ®· hiÓu", Feature_Preview}}, nil, szTitle)
    end

    if HaveCommonItem(6, 1, 13) < 1 then
        Msg2Player("Nh©n ®­îc <color=yellow>" .. GetItemName(AddItem(6, 1, 13, 0, 0, 0)))
    end
    if HaveCommonItem(6, 1, 14) < 1 then
        Msg2Player("Nh©n ®­îc <color=yellow>" .. GetItemName(AddItem(6, 1, 14, 0, 0, 0)))
    end
    local tbOpt = {}
    tinsert(tbOpt, {"Xem h­íng dÉn", Feature_Help})
    for i = 0, getn(tbNgoaiTrang) do
        tinsert(tbOpt, {tbNgoaiTrang[i], Ask_Feature_StartId, {i}})
    end
    tbDialog:Show(tbOpt, ChangeFeature_Dialog)
end

function Ask_Feature_StartId(nId)
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr­íc ngo¹i h×nh <color=yellow>" .. tbNgoaiTrang[nId])
    g_AskClientNumberEx(1, 9999, "Start ID", {SetTaskTemp, {169}})
end

function Check_Feature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player(format(
        "Helm: <color=yellow>%d<color>, Armor: <color=yellow>%d<color>, Weapon: <color=yellow>%d<color>, Horse <color=yellow>%d<color>, Mask: <color=yellow>%d",
        nHelm, nArmor, nWeapon, nHorse, nMaskNPC))
end

function Change_Equip_Feature()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "Change_Equip_Feature_Confirm", "onCancel", 1);
end

function Change_Equip_Feature_Confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "NhËp ID muèn ®æi:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function Change_Weapon_Feature()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "Change_Weapon_Feature_Confirm", "onCancel", 1);
end

function Change_Weapon_Feature_Confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "NhËp ID muèn ®æi:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function Restore_Feature()
    GiveItemUI("Phôc håi ngo¹i h×nh trang bÞ", "§Æt vµo c¸c trang bÞ muèn phôc håi.",
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
        GiveItemUI("Hñy vËt phÈm",
            "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!",
            "DisposeItem", "onCancel", 1);
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
        end
        Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
        Talk(1, "", "Thao t¸c thµnh c«ng, xin kiÓm tra l¹i!");
    end
end

function getGoldItem(nItemIdx)
    if not nItemIdx then
        g_AskClientNumberEx(1, 9999, "GoldItem ID", {getGoldItem})
    else
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nItemIdx)))
    end
end

function ClearF4(bComfirm)
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L­u ý: <color>TÊt c¶ vËt phÈm vµ trang bÞ trong R­¬ng chøa ®å sÏ bÞ {{Xo¸ bá}} hoµn toµn vµ kh«ng thÓ phôc håi nh­ cò.\n\n<sex>cã ch¾c ch¾n muèn lµm vËy kh«ng<pic=44><color>", --
            {{"X¸c nhËn", ClearF4, {1}}, --
            {"§Ó ta suy nghÜ l¹i..."}})
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do
                RemoveItemByIndex(tbItems[i], -1);
            end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "§· dän s¹ch r­¬ng")
    end
end

function getQuestkey(nItemId)
    if nItemId == 7 or not nItemId then
        g_AskClientNumberEx(343, 9999, "Questkey ID", {getQuestkey})
    else
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddEventItem(nItemId)))
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
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(nItemIdx))
        else
            Talk(1, "", "Sai Item code: [" .. getn(tbItem) .. "] tr­êng d÷ liÖu.")
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
        CreateTaskSay({"H·y nhËn ®å tÝm t¹i <bclr=pink>NPC §å TÝm<bclr>\n\n" ..
            strfill_center("<color=yellow>Ba L¨ng HuyÖn<color>: <color=green>200/200<color>", 100) ..
            "\n<sex>cã muèn di chuyÓn tíi ®ã kh«ng?", --
        "H·y ®­a ta tíi ®ã!/#QualityItem_Dialog(1)", --
        "Ta sÏ quay l¹i sau.../return"})
    else
        Msg2Player("H·y ngåi yªn, chóng ta di chuyÓn tíi <color=yellow>Ba L¨ng HuyÖn")
        w, x, y = GetWorldPos()
        if (w ~= 53) then
            SetFightState(0)
            NewWorld(53, 1605, 3205)
        else
            SetPos(1605, 3205)
        end
    end
end
---------------VËt phÈm trïng sinh---------------
tbTransLifeItems = { --
{
    szName = "<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>",
    tbProp = {6, 1, 1390, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "<B¾c §Èu Tr­êng Sinh ThuËt - §¹i Thõa T©m Ph¸p>",
    tbProp = {6, 1, 2974, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "B¾c §Èu TÈy Tñy §¬n",
    tbProp = {6, 1, 30127, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "TÝch LÞch §¬n",
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
        g_AskClientNumberEx(1, nIndex == 4 and 999 or nMax, "Sè l­îng", {getTransLifeItem, {nIndex}})
    else
        if nIndex == 4 then
            for i = 1, nCount do
                local prop = tbTransLifeItems[4].tbProp
                AddItem(prop[1], prop[2], prop[3], prop[4], prop[6], prop[6])
            end
            Msg2Player(format("NhËn ®­îc %d %s", nCount, tbTransLifeItems[4].szName))
        else
            local tbLog = format("[liguan]get_free_item_%s", tbTransLifeItems[nIndex].szName)
            tbAwardTemplet:GiveAwardByList(tbTransLifeItems[nIndex], szLogTitle, nCount)
        end
    end
end
