------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\global\\gm\\julianv\\functions\\hoangkim_bachkim.lua") -- v� khi ho�ng/b�ch kim
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- l�y item ho�ng kim, b�ch kim
Include("\\script\\global\\gm\\lib_data_table.lua") -- data table ng�a & trang b�

function JulianV:NhanTrangBi()
    dofile("script/global/gm/julianv/functions/hoangkim_bachkim.lua")
    local tbOpt = {
        { "Nh�n �� xanh - �� t�m", JulianV.NhanTrangBi2 },
        { "Nh�n �n - Phi phong - Trang s�c", JulianV.TrangBiKhac_Dialog }, --
        { "Trang b� Ho�ng Kim - B�ch Kim cao c�p", chose_type_goldquip }, --   
        { "Nh�n Set Ho�ng Kim M�n Ph�i", JulianV.SetHKMP_Dialog }, --    
        { "Nh�n trang b� Tr�n Bang Chi B�o", JulianV.TrangBi_HKMP_An }, --
        { "V� kh� B�ch Kim m�n ph�i", JulianV.VKHK_Dialog, { 1 } }, --
        { "V� kh� Ho�ng Kim M�n Ph�i", JulianV.VKHK_Dialog, { 2 } }, --
        { "Nh�n An Bang, Kim Phong, ��nh Qu�c, H�ng �nh", JulianV.HoangKimCui }, --
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:NhanTrangBi2()
    local tbOpt = {
        { "Nh�n �� xanh", JulianV.DoXanh_Dialog }, --
        { "Nh�n �� t�m", JulianV.QualityItem_Dialog }, --
        { "Ch� t�o �� t�m", JulianV.QualityWeapon_Dialog },
    }
    JDialog:Show(tbOpt, JulianV.NhanTrangBi)
end

function JulianV:TrangBiHiem()
    local tbOpt = {
        { "Set Long T��ng", JulianV.NhanTBHiem, { 5219, 5227 } }, --
        { "Set L�ng V�n", JulianV.NhanTBHiem, { 5203, 5207 } }, --
        { "Set H�c Th�n", JulianV.NhanTBHiem, { 4838, 4842 } }, --
        { "Set Th��ng Khung", JulianV.NhanTBHiem, { 5198, 5202 } }, --
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
    Talk(1, "", "�� chuy�n b� trang b� v�o h�nh trang, xin h�y ki�m tra l�i<pic=46>")
end

function JulianV:NhanVatPham()
    local tbOpt = {
        { "L�y ng�a", JulianV.Horses_Dialog }, --
        { "Nh�n m�t n� Chi�n tr��ng", JulianV.GetMask }, --
        { "V�t ph�m tr�ng sinh", JulianV.TransLifeItem_Dialog }, --    
        { "Nguy�n li�u ch� t�o �� t�m", JulianV.NguyenLieu_Dialog }, --
        { "Nh�n c�c lo�i v�t ph�m kh�c", JulianV.VatPhamKhac_Dialog }, --
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:ChangeFeature_Dialog()
    local tbOpt = {
        { "Xem tr��c ngo�i h�nh", JulianV.Feature_Preview }, --
        { "Ki�m tra ID ngo�i trang", JulianV.Check_Feature }, --
        { "��i ngo�i h�nh trang b� theo ID", JulianV.Change_Equip_Feature }, --
        -- { "��i ngo�i h�nh v� kh� (S� d�ng menu)", JulianV.Change_Weapon_Feature }, --
        { "Ph�c h�i ngo�i h�nh g�c", JulianV.Restore_Feature },
    }
    JDialog:Show(tbOpt, JulianV.TrangBi_VatPham)
end

function JulianV:TrangBiKhac_Dialog()
    local tbOpt = {
        { "Ng� h�nh �n", JulianV.NguHanhAn_Diag }, --
        { "Phi Phong", JulianV.NhanPhiPhong }, --
        { "Trang S�c", JulianV.NhanTrangSuc },
        { "C�n Kh�n Gi�i Ch�", JulianV.NhanCanKhon_Diag }, --
        { "Set ��ng S�t", JulianV.NhanTBHiem, { 494, 497 } }, --
    }
    JDialog:Show(tbOpt, JulianV.NhanTrangBi)
end

-------------------------Nh�n ng�a-------------------------
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
            table[num][1] .. " [C�p " .. table[num][3] .. "]", JulianV.Add_Horses,
            { table[num][2], table[num][3] },
        }
    end
    local tbOpt = {}
    if not nPage then nPage = 1 end
    local nCount = getn(tbHorse)
    if nPage < nCount then
        for i = 1, getn(tbHorse[nPage]) do tinsert(tbOpt, tbHorseRes(tbHorse[nPage], i)) end
        tinsert(tbOpt, { "Trang sau", JulianV.Chose_Horses, { nHorseType, nPage + 1 } })
    else
        for i = 1, getn(tbHorse[nCount]) do tinsert(tbOpt, tbHorseRes(tbHorse[nCount], i)) end
    end
    if nPage > 1 then
        tinsert(tbOpt, { "Trang tr��c", JulianV.Chose_Horses, { nHorseType, nPage - 1 } })
    end
    JDialog:Show(tbOpt, nil,
        "<sex>h�y ch�n cho m�nh m�t con chi�n m� t�t �� h�nh t�u giang h�<pic=46>}}\n\n" ..
            strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end

function JulianV.Add_Horses( nId, nLevel )
    Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(0, 10, nId, nLevel, 0, 0, 0)))
end
-------------------------Thay ��i ngo�i h�nh trang b�-------------------------
function JulianV:Feature_Preview()
    local Feature_Help = function()
        local szTitle =
            "<pic=139> <bclr=pink>Ch�c n�ng thay ��i ngo�i h�nh trang b�:<bclr>\n\n<pic=136> Ch�n ki�u ngo�i trang mu�n xem tr��c.\n<pic=135> Nh�p ID b�t ��u xem.\n<pic=136> Sau �� s� d�ng {{��i H�ng Bao}} v� {{Ti�u H�ng Bao}} �� xem �i t�i ho�c l�i l�i.\n<pic=135><color> Sau khi ch�n ���c ngo�i h�nh �ng � th� s� d�ng ch�c n�ng ��i ngo�i h�nh trang b� theo ID �� thay ��i."
        JDialog:Show({ { "Ta �� hi�u", JulianV.Feature_Preview } }, nil, szTitle)
    end

    if HaveCommonItem(6, 1, 13) < 1 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(6, 1, 13, 0, 0, 0)))
    end
    if HaveCommonItem(6, 1, 14) < 1 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(6, 1, 14, 0, 0, 0)))
    end
    local tbOpt = {}
    tinsert(tbOpt, { "Xem h��ng d�n", Feature_Help })
    for i = 0, getn(tbMonPhai.tbNgoaiTrang) do
        tinsert(tbOpt, { tbMonPhai.tbNgoaiTrang[i], JulianV.Ask_Feature_StartId, { i } })
    end
    JDialog:Show(tbOpt, JulianV.ChangeFeature_Dialog,
        "<bclr=pink>Ch�c n�ng xem tr��c ngo�i h�nh trang b�.<bclr>\n\n<sex>mu�n ki�m tra lo�i trang b� n�o<pic=44><color>")
end

function JulianV.Ask_Feature_StartId( nId )
    SetTaskTemp(168, nId)
    Msg2Player("Xem tr��c ngo�i h�nh <color=yellow>" .. tbMonPhai.tbNgoaiTrang[nId])
    g_AskClientNumberEx(0, 9999, "Start ID", { SetTaskTemp, { 169 } })
end

function JulianV:Check_Feature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player(format(
                   "Helm: <color=yellow>%d<color>, Armor: <color=yellow>%d<color>, Weapon: <color=yellow>%d<color>, Horse <color=yellow>%d<color>, Mask: <color=yellow>%d",
                   nHelm, nArmor, nWeapon, nHorse, nMaskNPC))
end

function JulianV:Change_Equip_Feature()
    g_GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        { JulianV.Change_Equip_Feature_Confirm });
end

function JulianV.Change_Equip_Feature_Confirm( nCount )
    if nCount == 0 then
        Talk(1, "", "Vui l�ng ��t trang b� v�o<pic=46>")
        return
    end
    if nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(0, 9999, "Nh�p ID mu�n ��i:", { SetItemNewFeature, { nItemIndex } })
        -- SetItemNewFeature(nItemIndex, nNo)
        Msg2Player("Thao t�c th�nh c�ng!")
    else
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�<pic=46>")
        return
    end
end

function JulianV:Restore_Feature()
    g_GiveItemUI("Ph�c h�i ngo�i h�nh trang b�", "��t v�o c�c trang b� mu�n ph�c h�i.",
        { JulianV.Restore_Feature_Confirm });
end

function JulianV.Restore_Feature_Confirm( nCount )
    if nCount == 0 then
        Talk(1, "", "Vui l�ng ��t trang b� v�o<pic=46>")
        return
    end
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        SetItemNewFeature(nItemIndex, -1)
        Msg2Player("Thao t�c th�nh c�ng!")
    end
end
------------------------C�c lo�i v�t ph�m------------------------
function JulianV.GetGoldItem( nItemIdx ) -- nh�n trang b� HK
    if nItemIdx == 0 then return end
    if not nItemIdx then
        g_AskClientNumberEx(0, 9999, "GoldItem ID", { JulianV.GetGoldItem })
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nItemIdx)))
    end
end

function JulianV.GetQuestkey( nItemId ) -- nh�n questkey item
    if nItemId == 0 then return end
    if nItemId == 7 or not nItemId then
        g_AskClientNumberEx(0, 9999, "Questkey ID", { JulianV.GetQuestkey })
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddEventItem(nItemId)))
    end
end

function JulianV.GetMagicItem( szItem ) -- nh�n magic item
    if not szItem then
        g_AskClientStringEx("6,1,125,0,0,0", 0, 9000, "Item Code:", { JulianV.GetMagicItem })
    else
        local tbItem = split(szItem, ",")
        if getn(tbItem) == 6 then
            local nClass, nType, nId, nLvl, nSerie, nLuck = unpack(tbItem)
            local nItemIdx = AddItem(nClass, nType, nId, nLvl, nSerie, nLuck)
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(nItemIdx))
        else
            Talk(1, "", "Sai Item code: [" .. getn(tbItem) .. "] tr��ng d� li�u<pic=46>")
        end
    end
end

function JulianV.GetMagicItems( nItemId, nCount ) -- nh�n magic item theo s� l��ng
    if nItemId == 0 or nCount == 0 then return end
    if not nItemId then
        g_AskClientNumberEx(0, 9999, "ParticularType ID", { JulianV.GetMagicItems })
    elseif not nCount then
        g_AskClientNumberEx(0, CalcFreeItemCellCount(), "S� l��ng",
            { JulianV.GetMagicItems, { nItemId } })
    else
        local ItemIndex
        for i = 1, nCount do ItemIndex = AddItem(6, 1, nItemId, 0, 0, 0) end
        Msg2Player("Nh�n ���c " .. nCount .. " <color=yellow>" .. GetItemName(ItemIndex))
    end
end

---------------Nh�n �� xanh, �� t�m---------------
function JulianV:QualityWeapon_Dialog()
    Include("\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua")
    tbDoTim:Main()
    -- if not bGoto then
    --     CreateTaskSay({
    --         "H�y nh�n �� t�m t�i <bclr=pink>NPC �� T�m<bclr>\n\n" ..
    --             strfill_center("<color=yellow>Ba L�ng Huy�n<color>: <color=green>200/200<color>",
    --                 100) .. "\n<sex>c� mu�n di chuy�n t�i �� kh�ng?", --
    --         "H�y ��a ta t�i ��!/#JulianV.QualityWeapon_Dialog(1)", --
    --         "Ta s� quay l�i sau.../return",
    --     })
    -- else
    --     Msg2Player("H�y ng�i y�n, ch�ng ta di chuy�n t�i <color=yellow>Ba L�ng Huy�n")
    --     w, x, y = GetWorldPos()
    --     if (w ~= 53) then
    --         SetFightState(0)
    --         NewWorld(53, 1605, 3205)
    --     else
    --         SetPos(1605, 3205)
    --     end
    -- end
end

function JulianV.QualityItem_Dialog( nSex, nSeries ) -- d� t�m    
    Include("\\script\\tagnewplayer\\qualityitem.lua")
    local tbOpt = {}
    if not nSex then -- ch�n gi�i t�nh
        tbOpt = {
            { "�� t�m d�nh cho Nam", JulianV.QualityItem_Dialog, { 0 } },
            { "�� t�m d�nh cho N�", JulianV.QualityItem_Dialog, { 1 } },
        }
        JDialog:Show(tbOpt, JulianV.NhanTrangBi2, "M�i <sex>ch�n lo�i trang b�<pic=46><color>")
    else
        for szName, _ in QItemNam do
            tinsert(tbOpt, { szName, JulianV.GetQualityItem, { nSex, szName } })
        end
        JDialog:Show(tbOpt, JulianV.QualityItem_Dialog,
            "M�i <sex>ch�n lo�i trang b�<pic=46><color>")
    end

end

function JulianV.GetQualityItem( ... )
    local nSex, szName, nSeries = unpack(arg)
    if not nSeries then
        local tbOpt = {}
        for i = 0, 4 do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.GetQualityItem, { nSex, szName, i } })
        end
        JDialog:Show(tbOpt, { JulianV.QualityItem_Dialog, { nSex } },
            "M�i <sex>ch�n ng� h�nh cho trang b�<pic=46><color>")
    else
        AddQItem(szName, nSeries, nSex)
    end
end

function JulianV.DoXanh_Dialog( szEquipName ) -- �� xanh
    local tbOpt = {}
    if not szEquipName then
        for szTenTb, _ in tbDoXanh do
            tinsert(tbOpt, { szTenTb, JulianV.DoXanh_Dialog, { szTenTb } })
        end
    else
        for id, tbEquip in tbDoXanh[szEquipName] do
            tinsert(tbOpt, { tbEquip[1], JulianV.DoXanh_Series, { tbEquip } })
        end
    end
    JDialog:Show(tbOpt, JulianV.DoXanh_Dialog, "<sex>mu�n nh�n trang b� n�o<pic=44><color>")
end

function JulianV.DoXanh_Series( tbEquip )
    local tbOpt = {}
    for i = 0, getn(tbMonPhai.tbSeries) do
        tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.NhanDoXanh, { tbEquip, i } })
    end
    JDialog:Show(tbOpt, JulianV.DoXanh_Dialog,
        "M�i <sex>ch�n ng� h�nh cho trang b�<pic=46><color>")
end

function JulianV.NhanDoXanh( tbEquip, nSeries, nCount )
    if nCount == 0 then return end
    if not nCount then
        g_AskClientNumberEx(0, CalcFreeItemCellCount(), "S� l��ng",
            { JulianV.NhanDoXanh, { tbEquip, nSeries } })
    else
        local nItemIndex
        local nGenre, nDetail, nPart = unpack(tbEquip, 2)
        for i = 1, nCount do
            nItemIndex = AddItem(nGenre, nDetail, nPart, 10, nSeries, 500, 10)
        end
        Msg2Player("Nh�n ���c " .. nCount .. " <color=blue>" .. GetItemName(nItemIndex))
    end
end
---------------V�t ph�m tr�ng sinh---------------
function JulianV:TransLifeItem_Dialog()
    local tbOpt = {}
    local TSItems = tbVatPham.tbTransLifeItems
    for i = 1, getn(TSItems) do
        tinsert(tbOpt, { TSItems[i].szName, JulianV.GetTransLifeItem, { i } })
    end
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.GetTransLifeItem( nIndex, nCount )
    local TSItems = tbVatPham.tbTransLifeItems
    if nCount == 0 then return end
    local nMax = CalcFreeItemCellCount()
    if not nCount then
        g_AskClientNumberEx(0, nIndex == 4 and 999 or nMax, "S� l��ng",
            { JulianV.GetTransLifeItem, { nIndex } })
    else
        if nIndex == 4 then
            for i = 1, nCount do
                local prop = TSItems[4].tbProp
                AddItem(unpack(prop))
            end
            Msg2Player(format("Nh�n ���c %d %s", nCount, TSItems[4].szName))
        else
            local szLogTitle = format("[liguan]get_free_item_%s", TSItems[nIndex].szName)
            tbAwardTemplet:GiveAwardByList(TSItems[nIndex], szLogTitle, nCount)
        end
    end
end
------------------------Nguy�n li�u ch� t�o �� t�m------------------------
function JulianV:NguyenLieu_Dialog()
    local tbOpt = {
        { "Huy�n Tinh", JulianV.ChonNguyenLieu, { 1 } }, --
        { "Thu� Tinh", JulianV.ChonNguyenLieu, { 2 } }, --
        { "Ph�c Duy�n", JulianV.ChonNguyenLieu, { 3 } }, --
        { "Kho�ng Th�ch", JulianV.NhanKhoangThach }, --
        { "M�nh Thi�n Th�ch", JulianV.ChonNguyenLieu, { 0 } }, --
    }
    JDialog:Show(tbOpt, JulianV.NhanVatPham)
end

function JulianV.ChonNguyenLieu( nType )
    if nType == 0 then
        local nItemIdx
        for i = 1317, 1325 do nItemIdx = AddEventItem(i) end
        Msg2Player("Nh�n ���c 10 <color=yellow>" .. GetItemName(nItemIdx))
    else
        local tbOpt = {}
        for id, VatPham in tbVatPham[nType] do
            tinsert(tbOpt, { VatPham.szName, JulianV.NhanNguyenLieu, { nType, id } })
        end
        JDialog:Show(tbOpt, JulianV.NguyenLieu_Dialog)
    end
end

function JulianV.NhanNguyenLieu( nType, nIndex, nCount )
    if not nCount then
        g_AskClientNumberEx(1, 999, "S� l��ng", { JulianV.NhanNguyenLieu, { nType, nIndex } })
    else
        local szLog = format("[liguan]get_free_item_%s", tbVatPham[nType][nIndex].szName)
        tbAwardTemplet:GiveAwardByList(tbVatPham[nType][nIndex], szLog, nCount)
    end
end

function JulianV.NhanKhoangThach( nSeries )
    if not nSeries then
        local tbOpt = {}
        for i = 0, getn(tbMonPhai.tbSeries) do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.NhanKhoangThach, { i } })
        end
        JDialog:Show(tbOpt, JulianV.NguyenLieu_Dialog,
            "M�i <sex>ch�n ng� h�nh cho Kho�ng Th�ch<pic=46><color>")
    else
        for i = 149, 154 do
            if mod(i, 2) == 0 then
                AddItem(6, 1, i, 1, 0, 0, 0)
            else
                AddItem(6, 1, i, 1, nSeries, 0, 0)
            end
        end
        Talk(1, "", "Nh�n Kho�ng Th�ch th�nh c�ng<pic=46> H�y ki�m tra h�nh trang")
    end
end
-------------------------V�t ph�m kh�c-------------------------
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
        g_AskClientNumberEx(1, CalcFreeItemCellCount(), "S� l��ng",
            { JulianV.Nhan_VP_Khac, { nIndex } })
    else
        local szLogTitle = format("[liguan]get_free_item_%s", tbVatPham:Khac()[nIndex].szName)
        tbAwardTemplet:GiveAwardByList(tbVatPham:Khac()[nIndex], szLogTitle, nCount)
    end
end

function JulianV.GetMask( nIndex )
    if not nIndex then
        local tbOpt = {}
        for i = 1, 10 do tinsert(tbOpt, { tbMonPhai.tbFacName[i], JulianV.GetMask, { i } }) end
        JDialog:Show(tbOpt, JulianV.NhanVatPham)
    else
        local nStart, nEnd = tbMonPhai.tbMasks[nIndex].nStart, tbMonPhai.tbMasks[nIndex].nEnd
        for i = nStart, nEnd do
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
