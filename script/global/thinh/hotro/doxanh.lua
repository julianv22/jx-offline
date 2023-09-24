tbItemName = {
    -- VK can
    [0] = {
        szName = "V� Kh� C�n Chi�n",
        tbEquip = {{"Huy�n Thi�t Ki�m", 0, 0, 0}, {"��i Phong �ao", 0, 0, 1}, {"Kim C� B�ng", 0, 0, 2},
                   {"Ph� Thi�n K�ch", 0, 0, 3}, {"Ph� Thi�n ch�y", 0, 0, 4}, {"Th�n Nh�t Tr�m", 0, 0, 5},
                   {"Tri�n Th�", 0, 0, 6}, {"V� H�n �ao", 0, 0, 7}, {"V� H�n Thu�n", 0, 0, 8}}
    },
    -- VK xa
    [1] = {
        szName = "V� Kh� T�m Xa",
        tbEquip = {{"B� V��ng Ti�u", 0, 1, 0}, {"To�i Nguy�t �ao", 0, 1, 1}, {"Kh�ng T��c Linh", 0, 1, 2}}
    },
    -- Ao
    [2] = {
        szName = "�o Gi�p",
        tbEquip = {{"Th�t B�o C� Sa", 0, 2, 0}, {"Ch�n V� Th�nh Y", 0, 2, 1},
                   {"Thi�n Nh�n M�t Trang", 0, 2, 2}, {"Gi�ng Sa B�o", 0, 2, 3}, {"���ng Ngh� gi�p", 0, 2, 4},
                   {"V�n L�u Quy T�ng Y", 0, 2, 5}, {"Tuy�n Long b�o", 0, 2, 6}, {"Long Ti�u ��o Y", 0, 2, 8},
                   {"C�u V� B�ch H� trang", 0, 2, 9}, {"Tr�m H��ng sam", 0, 2, 10},
                   {"T�ch L�ch Kim Ph�ng gi�p", 0, 2, 11}, {"V�n Ch�ng T� T�m Y", 0, 2, 12},
                   {"L�u Ti�n Qu�n", 0, 2, 13}}
    },
    -- Nhan
    [3] = {
        szName = "Nh�n",
        tbEquip = {{"To�n Th�ch Gi�i Ch� ", 0, 3, 0}}
    },
    -- Day Chuyen
    [4] = {
        szName = "D�y Chuy�n",
        tbEquip = {{"To�n th�ch h�ng li�n", 0, 4, 0}, {"L�c Ph� Th�y H� Th�n ph� ", 0, 4, 1}}
    },
    -- Giay
    [5] = {
        szName = "Gi�y",
        tbEquip = {{"C�u Ti�t X��ng V� Ngoa", 0, 5, 0}, {"Thi�n T�m Ngoa", 0, 5, 1}, {"Kim L� h�i", 0, 5, 2},
                   {"Phi Ph�ng Ngoa", 0, 5, 3}}
    },
    -- Dai Lung
    [6] = {
        szName = "�ai L�ng",
        tbEquip = {{"Thi�n T�m Y�u ��i", 0, 6, 0}, {"B�ch Kim Y�u ��i", 0, 6, 1}}
    },
    -- Non
    [7] = {
        szName = "N�n",
        tbEquip = {{"T� L� m�o", 0, 7, 0}, {"Ng� l�o qu�n", 0, 7, 1}, {"Tu La Ph�t k�t", 0, 7, 2},
                   {"Th�ng Thi�n Ph�t Qu�n", 0, 7, 3}, {"Y�m Nh�t kh�i", 0, 7, 4},
                   {"Tr�ch Tinh ho�n", 0, 7, 5}, {"� T�m M�o", 0, 7, 6}, {"Quan �m Ph�t Qu�n", 0, 7, 7},
                   {"�m D��ng V� C�c qu�n", 0, 7, 8}, {"Huy�n T� Di�n Tr�o", 0, 7, 9},
                   {"Long Huy�t ��u ho�n", 0, 7, 10}, {"Long L�n Kh�i", 0, 7, 11}, {"Thanh Tinh Thoa", 0, 7, 12},
                   {"Kim Ph�ng Tri�n S� ", 0, 7, 13}}
    },
    -- Bao Tay
    [8] = {
        szName = "Bao Tay",
        tbEquip = {{"Long Ph�ng Huy�t Ng�c Tr�c", 0, 8, 0}, {"Thi�n T�m H� Uy�n", 0, 8, 1}}
    },
    -- NGoc Boi
    [9] = {
        szName = "Ng�c B�i",
        tbEquip = {{"Long Ti�n H��ng Nang", 0, 9, 0}, {"D��ng Chi B�ch Ng�c", 0, 9, 1}}
    }
}
----------L�y �� Xanh------------------
function laydoxanh()
    local tbOpt = {}
    for i = 0, 9 do
        tinsert(tbOpt, format("%s/#laydoxanh1(%d)", tbItemName[i].szName, i))
    end
    tinsert(tbOpt, "Tr� l�i./main")
    tinsert(tbOpt, "K�t th�c ��i tho�i./no")
    Say("Xin m�i l�a ch�n trang b�:", getn(tbOpt), tbOpt)
    -- CreateNewSayEx("Xin m�i l�a ch�n trang b�:", tbOpt)
end

function laydoxanh1(nType)
    local tbEquip = tbItemName[nType]["tbEquip"]
    local tbOpt = {}
    for i = 1, getn(tbEquip) do
        tinsert(tbOpt, format("%s/#laydoxanh2(%d,%d)", tbEquip[i][1], i, nType)) -- {tbEquip[i][1], laydoxanh2, {i, nType}}
    end

    tinsert(tbOpt, "Tr� l�i./laydoxanh")
    tinsert(tbOpt, "K�t th�c ��i tho�i./no")
    Say("Xin m�i l�a ch�n trang b�:", getn(tbOpt), tbOpt)
end

function laydoxanh2(nIndex, nType)
    local szTitle = "M�i ch�n h�:"
    local tbOpt = {}
    tinsert(tbOpt, format("Kim/#laydoxanh3(%d,%d, 0)", nIndex, nType))
    tinsert(tbOpt, format("M�c/#laydoxanh3(%d,%d, 1)", nIndex, nType))
    tinsert(tbOpt, format("Th�y/#laydoxanh3(%d,%d, 2)", nIndex, nType))
    tinsert(tbOpt, format("H�a/#laydoxanh3(%d,%d, 3)", nIndex, nType))
    tinsert(tbOpt, format("Th�/#laydoxanh3(%d,%d, 4)", nIndex, nType))
    tinsert(tbOpt, "Tr� l�i./laydoxanh")
    tinsert(tbOpt, "K�t th�c ��i tho�i./no")
    Say(szTitle, getn(tbOpt), tbOpt)
end

function laydoxanh3(nIndex, nType, nSeries)
    g_AskClientNumberEx(0, 60, "S� L��ng:", {laydoxanh4, {nIndex, nType, nSeries}})
end

function level_of_clothes(player_level)
    level = player_level / 9 + 1
    if level < 1 then
        level = 1
    elseif level > 10 then
        level = 10
    end
    return level
end

function laydoxanh4(nIndex, nType, nSeries, nCount)
    local Level_Player = GetLevel()
    local Level_Clothes = level_of_clothes(Level_Player)
    local tbEquipSelect = tbItemName[nType]["tbEquip"][nIndex]
    for i = 1, nCount do
        AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], Level_Clothes, nSeries, 500, 10)
    end
end

-------------------------------------------------------Th�ng c�p------------------------------------------

function UpgradeDo()
    GiveItemUI("Th�ng c�p trang b�", "��i hi�p ��t v�t ph�m v�o!", "UpItemConfirm", "onCancel", 1);
end

function UpItemConfirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local strItem = GetItemName(nItemIndex)
        local nEquipVer = ITEM_GetItemVersion(nItemIndex)
        local nEquipRandSeed = ITEM_GetItemRandSeed(nItemIndex)
        local nQuality = GetItemQuality(nItemIndex)
        local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
        local arynMagLvl = GetItemAllParams(nItemIndex)
        if nLevel < 10 then
            RemoveItemByIndex(nItemIndex)
            newitem_index = AddItemEx(nEquipVer, nEquipRandSeed, nQuality, nGenre, nDetailType, nParticular, nLevel + 1,
                nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6])
            local strItem_new = GetItemName(newitem_index)
            Msg2Player("Th�ng c�p v�t ph�m th�nh c�ng")
            Talk(1, "",
                "Th�ng c�p th�nh c�ng <color=yellow>" .. strItem .. "<color> th�nh <color=yellow>" .. strItem_new);
        else
            Talk(1, "", "Kh�ng th� th�ng c�p <color=yellow>" .. strItem)
        end
    end
end

-------------------------------------------------------H� c�p------------------------------------------

function DowngradeDo()
    GiveItemUI("H� c�p trang b�", "��i hi�p ��t v�t ph�m v�o!", "DownItemConfirm", "onCancel", 1);
end

function DownItemConfirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local strItem = GetItemName(nItemIndex)
        local nEquipVer = ITEM_GetItemVersion(nItemIndex)
        local nEquipRandSeed = ITEM_GetItemRandSeed(nItemIndex)
        local nQuality = GetItemQuality(nItemIndex)
        local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
        local arynMagLvl = GetItemAllParams(nItemIndex)
        if nLevel > 1 then
            RemoveItemByIndex(nItemIndex)
            newitem_index = AddItemEx(nEquipVer, nEquipRandSeed, nQuality, nGenre, nDetailType, nParticular, nLevel - 1,
                nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6])
            local strItem_new = GetItemName(newitem_index)
            Msg2Player("H� c�p v�t ph�m th�nh c�ng")
            Talk(1, "",
                "H� c�p th�nh c�ng <color=yellow>" .. strItem .. "<color> th�nh <color=yellow>" .. strItem_new);
        else
            Talk(1, "", "Kh�ng th� h� c�p <color=yellow>" .. strItem)
        end
    end
end
