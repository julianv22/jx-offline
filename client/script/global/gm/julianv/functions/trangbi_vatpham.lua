------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\global\\gm\\julianv\\functions\\hoangkim_bachkim.lua") -- vò khi hoµng/b¹ch kim
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- lÊy item hoµng kim, b¹ch kim
Include("\\script\\global\\gm\\lib_data_table.lua") -- data table ngùa & trang bÞ

function JulianV:NhanTrangBi()
    dofile("script/global/gm/julianv/functions/hoangkim_bachkim.lua")
    local tbOpt = {
        { "NhËn ®å xanh - ®å tÝm", JulianV.NhanTrangBi2 },
        { "NhËn Ên - Phi phong - Trang søc", JulianV.TrangBiKhac_Dialog }, --
        { "Trang bÞ Hoµng Kim - B¹ch Kim cao cÊp", chose_type_goldquip }, --   
        { "NhËn Set Hoµng Kim M«n Ph¸i", JulianV.SetHKMP_Dialog }, --    
        { "NhËn trang bÞ TrÊn Bang Chi B¶o", JulianV.TrangBi_HKMP_An }, --
        { "Vò khÝ B¹ch Kim m«n ph¸i", JulianV.VKHK_Dialog, { 1 } }, --
        { "Vò khÝ Hoµng Kim M«n Ph¸i", JulianV.VKHK_Dialog, { 2 } }, --
        { "NhËn An Bang, Kim Phong, §Þnh Quèc, Hång ¶nh", JulianV.HoangKimCui }, --
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:NhanTrangBi2()
    local tbOpt = {
        { "NhËn ®å xanh", JulianV.DoXanh_Dialog }, --
        { "NhËn ®å tÝm", JulianV.QualityItem_Dialog }, --
        { "ChÕ t¹o ®å tÝm", JulianV.QualityWeapon_Dialog },
    }
    JDialog:Show(tbOpt, JulianV.NhanTrangBi)
end

function JulianV:TrangBiHiem()
    local tbOpt = {
        { "Set Long T­¬ng", JulianV.NhanTBHiem, { 5219, 5227 } }, --
        { "Set L¨ng V©n", JulianV.NhanTBHiem, { 5203, 5207 } }, --
        { "Set H¾c ThÇn", JulianV.NhanTBHiem, { 4838, 4842 } }, --
        { "Set Th­¬ng Khung", JulianV.NhanTBHiem, { 5198, 5202 } }, --
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV.NhanTBHiem( ... )
    local nCount = getn(arg)
    if nCount > 2 then
        for i = 1, nCount do AddGoldItem(0, arg[i]) end
    elseif nCount == 2 then
        for i = arg[1], arg[2] do AddGoldItem(0, i) end
    end
    Talk(1, "", "§· chuyÓn bé trang bÞ vµo hµnh trang, xin h·y kiÓm tra l¹i<pic=46>")
end

function JulianV:NhanVatPham()
    local tbOpt = {
        { "LÊy ngùa", JulianV.Horses_Dialog }, --
        { "NhËn mÆt n¹ ChiÕn tr­êng", JulianV.getMasks }, --
        { "VËt phÈm trïng sinh", JulianV.TransLifeItem_Dialog }, --    
        { "Nguyªn liÖu chÕ t¹o ®å tÝm", JulianV.NguyenLieu_Dialog }, --
        { "NhËn c¸c lo¹i vËt phÈm kh¸c", JulianV.VatPhamKhac_Dialog }, --
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:ChangeFeature_Dialog()
    local tbOpt = {
        { "Xem tr­íc ngo¹i h×nh", JulianV.Feature_Preview }, --
        { "KiÓm tra ID ngo¹i trang", JulianV.Check_Feature }, --
        { "§æi ngo¹i h×nh trang bÞ theo ID", JulianV.Change_Equip_Feature }, --
        -- { "§æi ngo¹i h×nh vò khÝ (Sö dông menu)", JulianV.Change_Weapon_Feature }, --
        { "Phôc håi ngo¹i h×nh gèc", JulianV.Restore_Feature },
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:TrangBiKhac_Dialog()
    local tbOpt = {
        { "Ngò hµnh Ên", JulianV.NguHanhAn_Diag }, --
        { "Phi Phong", JulianV.getPhiPhong }, --
        { "Trang Søc", JulianV.getTrangSuc },
        { "Cµn Kh«n Giíi ChØ", JulianV.NhanCanKhon_Diag }, --
        { "Set §éng S¸t", JulianV.NhanTBHiem, { 494, 497 } }, --
    }
    JDialog:Show(tbOpt, JulianV.NhanTrangBi)
end

-------------------------NhËn ngùa-------------------------
function JulianV:Horses_Dialog()
    local tbOpt = {}
    for i = 1, getn(tbNameResHorse) do
        tinsert(tbOpt, { tbNameResHorse[i].szName, JulianV.Chose_Horses, { i } })
    end
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.Chose_Horses( nHorseType, nPage )
    local tbHorse = JDialog:PhanTrang(tbNameResHorse[nHorseType].szEquip, 10)
    local tbHorseRes = function( table, num )
        return {
            table[num][1] .. " [CÊp " .. table[num][3] .. "]", JulianV.Add_Horses,
            { table[num][2], table[num][3] },
        }
    end
    local tbOpt = {}
    if not nPage then nPage = 1 end
    local nCount = getn(tbHorse)
    if nPage < nCount then
        for i = 1, 10 do tinsert(tbOpt, tbHorseRes(tbHorse[nPage], i)) end
        tinsert(tbOpt, { "Trang sau", JulianV.Chose_Horses, { nHorseType, nPage + 1 } })
    else
        for i = 1, getn(tbHorse[nCount]) do tinsert(tbOpt, tbHorseRes(tbHorse[nCount], i)) end
    end
    if nPage > 1 then
        tinsert(tbOpt, { "Trang tr­íc", JulianV.Chose_Horses, { nHorseType, nPage - 1 } })
    end
    JDialog:Show(tbOpt, nil,
        "<sex>h·y chän cho m×nh mét con chiÕn m· tèt ®Ó hµnh tÈu giang hå<pic=46>}}\n\n" ..
            strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end

function JulianV.Add_Horses( nId, nLevel )
    Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddItem(0, 10, nId, nLevel, 0, 0, 0)))
end
-------------------------Thay ®æi ngo¹i h×nh trang bÞ-------------------------
function JulianV:Feature_Preview()
    local Feature_Help = function()
        local szTitle =
            "<pic=139> <bclr=pink>Chøc n¨ng thay ®æi ngo¹i h×nh trang bÞ:<bclr>\n\n<pic=136> Chän kiÓu ngo¹i trang muèn xem tr­íc.\n<pic=135> NhËp ID b¾t ®Çu xem.\n<pic=136> Sau ®ã sö dông {{§¹i Hång Bao}} vµ {{TiÓu Hång Bao}} ®Ó xem ®i tíi hoÆc lïi l¹i.\n<pic=135><color> Sau khi chän ®­îc ngo¹i h×nh ­ng ý th× sö dông chøc n¨ng §æi ngo¹i h×nh trang bÞ theo ID ®Ó thay ®æi."
        JDialog:Show({ { "Ta ®· hiÓu", JulianV.Feature_Preview } }, nil, szTitle)
    end

    if HaveCommonItem(6, 1, 13) < 1 then
        Msg2Player("Nh©n ®­îc <color=yellow>" .. GetItemName(AddItem(6, 1, 13, 0, 0, 0)))
    end
    if HaveCommonItem(6, 1, 14) < 1 then
        Msg2Player("Nh©n ®­îc <color=yellow>" .. GetItemName(AddItem(6, 1, 14, 0, 0, 0)))
    end
    local tbOpt = {}
    tinsert(tbOpt, { "Xem h­íng dÉn", Feature_Help })
    for i = 0, getn(tbMonPhai.tbNgoaiTrang) do
        tinsert(tbOpt, { tbMonPhai.tbNgoaiTrang[i], JulianV.Ask_Feature_StartId, { i } })
    end
    JDialog:Show(tbOpt, JulianV.ChangeFeature_Dialog,
        "<bclr=pink>Chøc n¨ng xem tr­íc ngo¹i h×nh trang bÞ.<bclr>\n\n<sex>muèn kiÓm tra lo¹i trang bÞ nµo<pic=44><color>")
end

function JulianV.Ask_Feature_StartId( nId )
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr­íc ngo¹i h×nh <color=yellow>" .. tbMonPhai.tbNgoaiTrang[nId])
    g_AskClientNumberEx(0, 9999, "Start ID", { SetTaskTemp, { 169 } })
end

function JulianV:Check_Feature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player(format(
                   "Helm: <color=yellow>%d<color>, Armor: <color=yellow>%d<color>, Weapon: <color=yellow>%d<color>, Horse <color=yellow>%d<color>, Mask: <color=yellow>%d",
                   nHelm, nArmor, nWeapon, nHorse, nMaskNPC))
end

function JulianV:Change_Equip_Feature()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "Change_Equip_Feature_Confirm", "onCancel", 1);
end

function Change_Equip_Feature_Confirm( nCount )
    if nCount == 0 then return end
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ<pic=46>")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(0, 9999, "NhËp ID muèn ®æi:", { SetItemNewFeature, { nItemIndex } })
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function JulianV:Change_Weapon_Feature()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "Change_Weapon_Feature_Confirm", "onCancel", 1);
end

function Change_Weapon_Feature_Confirm( nCount )
    if nCount == 0 then return end
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ<pic=46>")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(0, 500, "NhËp ID muèn ®æi:", { SetItemNewFeature, { nItemIndex } })
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end

function JulianV:Restore_Feature()
    GiveItemUI("Phôc håi ngo¹i h×nh trang bÞ", "§Æt vµo c¸c trang bÞ muèn phôc håi.",
        "Restore_Feature_Confirm", "onCancel", 1);
end

function Restore_Feature_Confirm( nCount )
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        SetItemNewFeature(nItemIndex, -1)
    end
end
------------------------C¸c lo¹i vËt phÈm------------------------
function JulianV.getGoldItem( nItemIdx ) -- nhËn trang bÞ HK
    if nItemIdx == 0 then return end
    if not nItemIdx then
        g_AskClientNumberEx(0, 9999, "GoldItem ID", { JulianV.getGoldItem })
    else
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nItemIdx)))
    end
end

function JulianV.getQuestkey( nItemId ) -- nhËn questkey item
    if nItemId == 0 then return end
    if nItemId == 7 or not nItemId then
        g_AskClientNumberEx(0, 9999, "Questkey ID", { JulianV.getQuestkey })
    else
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddEventItem(nItemId)))
    end
end

function JulianV.getMagicItem( szItem ) -- nhËn magic item
    if not szItem then
        g_AskClientStringEx("6,1,125,0,0,0", 0, 9000, "Item Code:", { JulianV.getMagicItem })
    else
        local tbItem = split(szItem, ",")
        if getn(tbItem) == 6 then
            local nClass, nType, nId, nLvl, nSerie, nLuck = tonumber(tbItem[1]),
                tonumber(tbItem[2]), tonumber(tbItem[3]), tonumber(tbItem[4]), tonumber(tbItem[5]),
                tonumber(tbItem[6])
            local nItemIdx = AddItem(nClass, nType, nId, nLvl, nSerie, nLuck)
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(nItemIdx))
        else
            Talk(1, "", "Sai Item code: [" .. getn(tbItem) .. "] tr­êng d÷ liÖu<pic=46>")
        end
    end
end

function JulianV.getMagicItemSll( nItemId, nCount ) -- nhËn magic item theo sè l­îng
    if nItemId == 0 or nCount == 0 then return end
    if not nItemId then
        g_AskClientNumberEx(0, 9999, "ParticularType ID", { JulianV.getMagicItemSll })
    elseif not nCount then
        g_AskClientNumberEx(0, CalcFreeItemCellCount(), "Sè l­îng",
            { JulianV.getMagicItemSll, { nItemId } })
    else
        local ItemIndex
        for i = 1, nCount do ItemIndex = AddItem(6, 1, nItemId, 0, 0, 0) end
        Msg2Player("NhËn ®­îc " .. nCount .. " <color=yellow>" .. GetItemName(ItemIndex))
    end
end

---------------NhËn ®å xanh, ®å tÝm---------------
function JulianV:QualityWeapon_Dialog()
    Include("\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua")
    tbDoTim:Main()
    -- if not bGoto then
    --     CreateTaskSay({
    --         "H·y nhËn ®å tÝm t¹i <bclr=pink>NPC §å TÝm<bclr>\n\n" ..
    --             strfill_center("<color=yellow>Ba L¨ng HuyÖn<color>: <color=green>200/200<color>",
    --                 100) .. "\n<sex>cã muèn di chuyÓn tíi ®ã kh«ng?", --
    --         "H·y ®­a ta tíi ®ã!/#JulianV.QualityWeapon_Dialog(1)", --
    --         "Ta sÏ quay l¹i sau.../return",
    --     })
    -- else
    --     Msg2Player("H·y ngåi yªn, chóng ta di chuyÓn tíi <color=yellow>Ba L¨ng HuyÖn")
    --     w, x, y = GetWorldPos()
    --     if (w ~= 53) then
    --         SetFightState(0)
    --         NewWorld(53, 1605, 3205)
    --     else
    --         SetPos(1605, 3205)
    --     end
    -- end
end

function JulianV.QualityItem_Dialog( nSex, nSeries ) -- då tÝm    
    Include("\\script\\tagnewplayer\\qualityitem.lua")
    local tbOpt = {}
    if not nSex then -- chän giíi tÝnh
        tbOpt = {
            { "§å tÝm dµnh cho Nam", JulianV.QualityItem_Dialog, { 0 } },
            { "§å tÝm dµnh cho N÷", JulianV.QualityItem_Dialog, { 1 } },
        }
        JDialog:Show(tbOpt, JulianV.NhanTrangBi2, "Mêi <sex>chän lo¹i trang bÞ<pic=46><color>")
    else
        for szName, _ in QItemNam do
            tinsert(tbOpt, { szName, JulianV.getQualityItem, { nSex, szName } })
        end
        JDialog:Show(tbOpt, JulianV.QualityItem_Dialog,
            "Mêi <sex>chän lo¹i trang bÞ<pic=46><color>")
    end

end

function JulianV.getQualityItem( ... )
    local nSex, szName, nSeries = unpack(arg)
    if not nSeries then
        local tbOpt = {}
        for i = 0, 4 do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.getQualityItem, { nSex, szName, i } })
        end
        JDialog:Show(tbOpt, { JulianV.QualityItem_Dialog, { nSex } },
            "Mêi <sex>chän ngò hµnh cho trang bÞ<pic=46><color>")
    else
        AddQItem(szName, nSeries, nSex)
    end
end

function JulianV.DoXanh_Dialog( szEquipName ) -- ®å xanh
    local tbOpt = {}
    if not szEquipName then
        for szTenTb, _ in tbDoXanh do
            tinsert(tbOpt, { szTenTb, JulianV.DoXanh_Dialog, { szTenTb } })
        end

    else
        for id, tbEquip in tbDoXanh[szEquipName] do
            tinsert(tbOpt, { tbEquip[1], JulianV.Chon_Series, { tbEquip } })
        end
    end
    JDialog:Show(tbOpt, JulianV.DoXanh_Dialog, "<sex>muèn nhËn trang bÞ nµo<pic=44><color>")
end

function JulianV.Chon_Series( tbEquip )
    local tbOpt = {}
    for i = 0, getn(tbMonPhai.tbSeries) do
        tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.getDoXanh, { tbEquip, i } })
    end
    JDialog:Show(tbOpt, JulianV.DoXanh_Dialog,
        "Mêi <sex>chän ngò hµnh cho trang bÞ<pic=46><color>")
end

function JulianV.getDoXanh( tbEquip, nSeries, nCount )
    if nCount == 0 then return end
    if not nCount then
        g_AskClientNumberEx(0, CalcFreeItemCellCount(), "Sè l­îng",
            { JulianV.getDoXanh, { tbEquip, nSeries } })
    else
        local nItemIndex
        local nGenre, nDetail, nPart = tbEquip[2], tbEquip[3], tbEquip[4]
        for i = 1, nCount do
            nItemIndex = AddItem(nGenre, nDetail, nPart, 10, nSeries, 500, 10)
        end
        Msg2Player("NhËn ®­îc " .. nCount .. " <color=blue>" .. GetItemName(nItemIndex))
    end
end
---------------VËt phÈm trïng sinh---------------
tbTransLifeItems = {
    {
        szName = "<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>",
        tbProp = { 6, 1, 1390, 0, 0, 0 },
        tbParam = { 60 },
    }, {
        szName = "<B¾c §Èu Tr­êng Sinh ThuËt - §¹i Thõa T©m Ph¸p>",
        tbProp = { 6, 1, 2974, 0, 0, 0 },
        tbParam = { 60 },
    }, {
        szName = "B¾c §Èu TÈy Tñy §¬n",
        tbProp = { 6, 1, 30127, 0, 0, 0 },
        tbParam = { 60 },
     }, {
        szName = "TÝch LÞch §¬n",
        tbProp = { 6, 1, 2973, 0, 0, 0 },
     },
}

function JulianV:TransLifeItem_Dialog()
    local tbOpt = {}
    for i = 1, getn(tbTransLifeItems) do
        tinsert(tbOpt, { tbTransLifeItems[i].szName, JulianV.getTransLifeItem, { i } })
    end
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.getTransLifeItem( nIndex, nCount )
    if nCount == 0 then return end
    local nMax = CalcFreeItemCellCount()
    if not nCount then
        g_AskClientNumberEx(0, nIndex == 4 and 999 or nMax, "Sè l­îng",
            { JulianV.getTransLifeItem, { nIndex } })
    else
        if nIndex == 4 then
            for i = 1, nCount do
                local prop = tbTransLifeItems[4].tbProp
                AddItem(prop[1], prop[2], prop[3], prop[4], prop[6], prop[6])
            end
            Msg2Player(format("NhËn ®­îc %d %s", nCount, tbTransLifeItems[4].szName))
        else
            local szLogTitle = format("[liguan]get_free_item_%s", tbTransLifeItems[nIndex].szName)
            tbAwardTemplet:GiveAwardByList(tbTransLifeItems[nIndex], szLogTitle, nCount)
        end
    end
end
------------------------Nguyªn liÖu chÕ t¹o ®å tÝm------------------------
function JulianV:NguyenLieu_Dialog()
    local tbOpt = {
        { "HuyÒn Tinh", JulianV.chonNguyenLieu, { 1 } }, --
        { "Thuû Tinh", JulianV.chonNguyenLieu, { 2 } }, --
        { "Phóc Duyªn", JulianV.chonNguyenLieu, { 3 } }, --
        { "Kho¸ng Th¹ch", JulianV.nhanKhoangThach }, --
        { "M¶nh Thiªn Th¹ch", JulianV.chonNguyenLieu, { 0 } }, --
    }
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.chonNguyenLieu( nType )
    if nType == 0 then
        local nItemIdx
        for i = 1317, 1325 do nItemIdx = AddEventItem(i) end
        Msg2Player("NhËn ®­îc 10 <color=yellow>" .. GetItemName(nItemIdx))
    else
        local tbOpt = {}
        for id, VatPham in tbVatPham[nType] do
            tinsert(tbOpt, { VatPham.szName, JulianV.nhanNguyenLieu, { nType, id } })
        end
        JDialog:Show(tbOpt, JulianV.NguyenLieu_Dialog)
    end
end

function JulianV.nhanNguyenLieu( nType, nIndex, nCount )
    if not nCount then
        g_AskClientNumberEx(1, 999, "Sè l­îng", { JulianV.nhanNguyenLieu, { nType, nIndex } })
    else
        local szLog = format("[liguan]get_free_item_%s", tbVatPham[nType][nIndex].szName)
        tbAwardTemplet:GiveAwardByList(tbVatPham[nType][nIndex], szLog, nCount)
    end
end

function JulianV.nhanKhoangThach( nSeries )
    if not nSeries then
        local tbOpt = {}
        for i = 0, getn(tbMonPhai.tbSeries) do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.nhanKhoangThach, { i } })
        end
        JDialog:Show(tbOpt, JulianV.NguyenLieu_Dialog,
            "Mêi <sex>chän ngò hµnh cho Kho¸ng Th¹ch<pic=46><color>")
    else
        for i = 149, 154 do
            if mod(i, 2) == 0 then
                AddItem(6, 1, i, 1, 0, 0, 0)
            else
                AddItem(6, 1, i, 1, nSeries, 0, 0)
            end
        end
        Talk(1, "", "NhËn Kho¸ng Th¹ch thµnh c«ng<pic=46> H·y kiÓm tra hµnh trang")
    end
end
-------------------------VËt phÈm kh¸c-------------------------
function JulianV:VatPhamKhac_Dialog()
    local tbOpt = {}
    local tbVP_Khac = tbVatPham:Khac()
    for id, VatPham in tbVP_Khac do
        tinsert(tbOpt, { VatPham.szName, JulianV.Nhan_VP_Khac, { id } })
    end
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.Nhan_VP_Khac( nIndex, nCount )
    if not nCount then
        g_AskClientNumberEx(1, CalcFreeItemCellCount(), "Sè l­îng",
            { JulianV.Nhan_VP_Khac, { nIndex } })
    else
        local szLogTitle = format("[liguan]get_free_item_%s", tbVatPham:Khac()[nIndex].szName)
        tbAwardTemplet:GiveAwardByList(tbVatPham:Khac()[nIndex], szLogTitle, nCount)
    end
end

function JulianV.getMasks( nIndex )
    if not nIndex then
        local tbOpt = {}
        for i = 1, 10 do tinsert(tbOpt, { tbMonPhai.tbFacName[i], JulianV.getMasks, { i } }) end
        JDialog:Show(tbOpt, JulianV.NhanVatPham)
    else
        local nStart, nEnd = tbMonPhai.tbMasks[nIndex].nStart, tbMonPhai.tbMasks[nIndex].nEnd
        for i = nStart, nEnd do
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
