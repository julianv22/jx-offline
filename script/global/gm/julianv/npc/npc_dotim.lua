------------------------------------------------------------------
-- Script Add �� t�m tu� ch�n option
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\gm\\julianv\\functions\\dialog_fun.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_monphai.lua")

tbDoTim = {}
tbDoTim.tbTrangBi = {
    [1] = {
        szName = "V� Kh�",
        tbEquip = { --
            { "Ki�m", 0, 0, 0 }, --
            { "�ao", 0, 0, 1 }, --
            { "Ch�y", 0, 0, 4 }, --        
            { "Th��ng - K�ch", 0, 0, 3 }, --        
            { "C�n - B�ng", 0, 0, 2 }, --
            { "Song �ao", 0, 0, 5 }, --
            { "Phi Ti�u", 0, 1, 0 }, --
            { "Phi �ao", 0, 1, 1 }, --
            { "T� Ti�n", 0, 1, 2 },
        },
    },
    [2] = {
        szName = "M�",
        tbEquip = { --
            { "T� L� M�o", 0, 7, 0 }, --
            { "Ng� L�o Qu�n", 0, 7, 1 }, --
            { "Tu La Ph�t K�t", 0, 7, 2 }, --
            { "Th�ng Thi�n Ph�t Qu�n", 0, 7, 3 }, --
            { "Y�m Nh�t Kh�i", 0, 7, 4 }, --
            { "Tr�ch Tinh Ho�n", 0, 7, 5 }, --
            { "� T�m M�o", 0, 7, 6 }, --
            { "Quan �m Ph�t Qu�n", 0, 7, 7 }, --
            { "�m D��ng V� C�c qu�n", 0, 7, 8 }, --
            { "Huy�n T� Di�n Tr�o", 0, 7, 9 }, --
            { "Long Huy�t ��u ho�n", 0, 7, 10 }, --
            { "Long L�n Kh�i", 0, 7, 11 }, --
            { "Thanh Tinh Thoa", 0, 7, 12 }, --
            { "Kim Ph�ng Tri�n S� ", 0, 7, 13 },
        },
    },
    [3] = {
        szName = "Trang ph�c",
        tbEquip = { --
            { "Th�t B�o C� Sa", 0, 2, 0 }, --
            { "Ch�n V� Th�nh Y", 0, 2, 1 }, --        
            { "Thi�n Nh�n M�t Trang", 0, 2, 2 }, --
            { "Gi�ng Sa B�o", 0, 2, 3 }, --
            { "���ng Ngh� Gi�p", 0, 2, 4 }, --
            { "V�n L�u Quy T�ng Y", 0, 2, 5 }, --
            { "Tuy�n Long B�o", 0, 2, 6 }, --
            { "Long Ti�u ��o Y", 0, 2, 8 }, --
            { "C�u V� B�ch H� Trang", 0, 2, 9 }, --
            { "Tr�m H��ng Sam", 0, 2, 10 }, --
            { "T�ch L�ch Kim Ph�ng gi�p", 0, 2, 11 }, --
            { "V�n Ch�ng T� T�m Y", 0, 2, 12 }, --
            { "L�u Ti�n Qu�n", 0, 2, 13 },
        },
    },
    [4] = {
        szName = "D�y Chuy�n",
        tbEquip = { --
            { "To�n Th�ch H�ng Li�n", 0, 4, 0 }, --
            { "L�c Ph� Th�y H� Th�n Ph� ", 0, 4, 1 },
        },
    },
    [5] = {
        szName = "Th�t L�ng",
        tbEquip = { --
            { "Thi�n T�m Y�u ��i", 0, 6, 0 }, --
            { "B�ch Kim Y�u ��i", 0, 6, 1 },
        },
    },
    [6] = {
        szName = "Nh�n",
        tbEquip = { { "Gi�i Ch�", 0, 3, 0 } },
     },
    [7] = {
        szName = "Bao Tay",
        tbEquip = { --
            { "Ng�c Tr�c (N�)", 0, 8, 0 }, --
            { "H� Uy�n (Nam)", 0, 8, 1 },
        },
    },
    [8] = {
        szName = "Ng�c B�i",
        tbEquip = { --
            { "Long Ti�n H��ng Nang", 0, 9, 0 }, --
            { "D��ng Chi B�ch Ng�c", 0, 9, 1 },
        },
    },
    [9] = {
        szName = "Gi�y",
        tbEquip = { --
            { "C�u Ti�t X��ng V� Ngoa", 0, 5, 0 }, --
            { "Thi�n T�m Ngoa", 0, 5, 1 }, --
            { "Kim L� H�i", 0, 5, 2 }, --
            { "Phi Ph�ng Ngoa", 0, 5, 3 },
        },
    },
}

tbDoTim.tbMagic_VuKhi = {
    [0] = { -- Kim
        -- {"STVL ngo�i c�ng (�i�m)", 220},
        { "STVL n�i c�ng (�i�m)", 440 }, --
        { "Kh�ng ��c", 290 }, -- 
        -- {"T�ng ��ng c�p k� n�ng h� Kim", 390}
    },
    [1] = { -- M�c
        { "��c s�t ngo�i c�ng", 230 }, --
        { "��c s�t n�i c�ng", 480 }, --
        { "Kh�ng L�i", 320 }, --
        { "Th�i gian ph�c h�i", 90 }, --
        -- {"T�ng ��ng c�p k� n�ng h� M�c", 410}
    },
    [2] = { -- Thu�
        { "B�ng s�t ngo�i c�ng", 240 }, --
        { "B�ng s�t n�i c�ng", 450 }, --
        { "Kh�ng Ho�", 310 }, --
        { "Th�i gian cho�ng", 340 }, -- 
        -- {"T�ng ��ng c�p k� n�ng h� Thu�", 400}
    },
    [3] = { -- Ho�
        { "Ho� s�t ngo�i c�ng", 250 }, --
        { "Ho� s�t n�i c�ng", 460 }, --
        { "Th�i gian l�m ch�m", 360 }, -- 
        -- {"T�ng ��ng c�p k� n�ng h� Ho�", 420}
    },
    [4] = { -- Th�
        { "L�i s�t ngo�i c�ng", 260 }, --
        { "L�i s�t n�i c�ng", 470 }, --
        { "Kh�ng B�ng", 300 }, --
        { "Th�i gian tr�ng ��c", 380 }, --
        -- {"T�ng ��ng c�p k� n�ng h� Th�", 430}
    },
}

tbDoTim.tbMagic_TrangPhuc = {
    [0] = { -- Kim
        { "Kh�ng ��c", 290 },
    },
    [1] = { -- M�c
        { "Kh�ng L�i", 320 }, --
        { "Th�i gian ph�c h�i", 90 },
    },
    [2] = { -- Thu�
        { "Kh�ng Ho�", 310 }, --
        { "Th�i gian cho�ng", 340 },
    },
    [3] = { -- Ho�		
        { "Ph�ng th� V�t l�", 280 }, --
        { "Th�i gian l�m ch�m", 360 },
    },
    [4] = { -- Th�
        { "Kh�ng B�ng", 300 }, --
        { "Th�i gian tr�ng ��c", 380 },
    },
}

tbDoTim.tbMagic_All = {
    [1] = { -- V� Kh�
        { "Sinh l�c", 150 }, --
        { "N�i l�c", 160 }, --
        { "K� n�ng v�n c�", 110 }, --
        { "H�t sinh l�c", 130 }, --
        { "H�t n�i l�c", 140 }, --
        { "STVL ngo�i c�ng (%)", 10 }, --
        { "STVL ngo�i c�ng (�i�m)", 220 }, --
        { "T�c �� ��nh ngo�i c�ng", 30 }, --
        { "T� l� c�ng k�ch ch�nh x�c", 20 }, --
        { "T�ng ph�m vi s�t th��ng", 100 }, --
        { "B� qua n� tr�nh", 40 }, --
        -- {"Kh�ng th� ph� hu�", 50}
    },
    [2] = { -- Trang b�
        { "Sinh l�c", 150 }, --
        { "N�i l�c", 160 }, --
        { "K� n�ng v�n c�", 110 }, --
        { "Chuy�n ho� s�t th��ng th�nh n�i l�c", 270 }, --
        { "Ph�c h�i sinh l�c m�i n�a gi�y", 180 }, --
        { "May m�n", 350 }, --
        { "Sinh kh�", 330 }, --
        { "S�c m�nh", 210 }, --
        { "Th�n ph�p", 370 }, --
        { "N� tr�nh", 60 }, -- 
        -- {"Kh�ng th� ph� hu�", 50}
    },
}

tbDoTim.tbSeries = {
    [0] = { "Kim", "yellow" },
    [1] = { "M�c", "green" },
    [2] = { "Thu�", "blue" },
    [3] = { "Ho�", "red" },
    [4] = { "Th�", "orange" },
}
tbDoTim.szSerires = function( num )
    return format("<color=%s>%s<color>", tbDoTim.tbSeries[num][2], tbDoTim.tbSeries[num][1])
end

function tbDoTim:Define()
    self.tbWeaponMagic = self.tbMagic_VuKhi
    self.tbEquipMagic = self.tbMagic_TrangPhuc
    for i = 0, getn(self.tbSeries) do
        for _, tbOptVK in self.tbMagic_All[1] do tinsert(self.tbWeaponMagic[i], tbOptVK) end
        for _, tbOptTB in self.tbMagic_All[2] do tinsert(self.tbEquipMagic[i], tbOptTB) end
    end
end
tbDoTim:Define()

tbCheTao = {
    nItemId = 0,
    szName = "",
    nLevel = 0,
    nGenre = 0,
    nDetail = 0,
    nPart = 0,
    nSeries = 0,
    tbOptions = {},
}

JulianV = JDialog
function main()
    dofile("script/global/gm/julianv/npc/npc_dotim.lua")
    tbDoTim:Main()
end

function tbDoTim:Main() -- ch�n lo�i trang b� ch� t�o 
    MAIN_TITLE = "<npc>M�i <sex><bclr=red>" .. GetName() .. "<bclr> l�a ch�n<pic=46>\n"
    local szTitle = "<npc><sex><bclr=red>" .. GetName() ..
                        "<bclr> mu�n ch� t�o <bclr=pink>�� T�m<bclr> ch�ng<pic=44><color>"
    local tbOpt = {}
    for id, tbEquip in self.tbTrangBi do
        tinsert(tbOpt, { id .. ". " .. tbEquip.szName, self.PurpleItem_diaglog, { id } })
    end
    JulianV:ChangeTitle()
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.PurpleItem_diaglog( nItemId ) -- ch�n t�n trang b�
    if (CountFreeRoomByWH(2, 3) < 1) then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    end
    MAIN_TITLE = MAIN_TITLE ..
                     strfill_center(
                         " Ch� t�o <bclr=pink>" .. tbDoTim.tbTrangBi[nItemId].szName .. "<bclr> ",
                         70, ".")
    local tbOpt = {}
    for id, tbEquip in tbDoTim.tbTrangBi[nItemId].tbEquip do
        local nEqIdx, nGenre, nDetail, nPart = id, tbEquip[2], tbEquip[3], tbEquip[4]
        tinsert(tbOpt,
            { tbEquip[1], tbDoTim.getItemLevel, { nItemId, nEqIdx, nGenre, nDetail, nPart } })
    end
    JulianV:Show(tbOpt, main, MAIN_TITLE)
end

function tbDoTim.getItemLevel( nItemId, nEqIdx, nGenre, nDetail, nPart ) -- ch�n level trang b�
    tbCheTao.nItemId = nItemId
    tbCheTao.szName = tbDoTim.tbTrangBi[nItemId].tbEquip[nEqIdx][1]
    tbCheTao.nGenre = nGenre
    tbCheTao.nDetail = nDetail
    tbCheTao.nPart = nPart
    g_AskClientNumberEx(1, 10, "Item level", { tbDoTim.getItemSeries })
end

function tbDoTim.getItemSeries( nItemLevel ) -- ch�n ng� h�nh trang b�
    tbCheTao.nLevel = nItemLevel
    MAIN_TITLE = MAIN_TITLE ..
                     format("\n<pic=137> Trang b�: <bclr=blue>%s<bclr> c�p: %d", tbCheTao.szName,
                         nItemLevel)
    local szTitle = MAIN_TITLE .. "\n<pic=136><color>Ch�n ng� h�nh:"
    local tbOpt = {}
    for nSeries, tbHe in tbDoTim.tbSeries do
        tinsert(tbOpt, { "H� " .. tbHe[1], tbDoTim.getLine, { 1, nSeries } })
    end
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.getLine( nLine, nSeries, tbLineOpt ) -- ch�n c�c d�ng
    tbCheTao.nSeries = nSeries
    local tbOpt = {}
    local szTitle = ""
    if nLine == 1 then -- d�ng 1
        MAIN_TITLE = MAIN_TITLE .. "\n<pic=136><color> Ng� h�nh h�: " .. szSerires(nSeries)
    else -- d�ng #1
        tinsert(tbCheTao.tbOptions, tbLineOpt)
        local nPreLine = nLine - 1
        local szColor = mod(nPreLine, 2) == 0 and "violet" or "pink"
        MAIN_TITLE = MAIN_TITLE ..
                         format("\n  - D�ng %d: <color=%s>%s<color>", nPreLine, szColor,
                             tbCheTao.tbOptions[nPreLine][1])
        Msg2Player("D�ng " .. nPreLine .. ": <color=green>" .. tbCheTao.tbOptions[nPreLine][1])
    end
    if nLine <= 6 then
        szTitle = MAIN_TITLE .. "\n<pic=135><color> Ch�n d�ng " .. nLine .. ":"
        tbDoTim.insertTable(tbOpt, nLine + 1)
    else
        szTitle = MAIN_TITLE
        tinsert(tbOpt, { "��ng � ch� t�o", tbDoTim.CheTaoDoTim })
    end
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.insertTable( tbOpt, nLine ) -- hi�n th� c�c d�ng
    if tbCheTao.nItemId == 1 then -- check id n�u l� v� kh�
        for _, optVK in tbDoTim.tbWeaponMagic[tbCheTao.nSeries] do
            if type(optVK) == "table" then
                tinsert(tbOpt, { optVK[1], tbDoTim.getLine, { nLine, tbCheTao.nSeries, optVK } })
            end
        end
    else
        if tbCheTao.nItemId == 9 then -- n�u l� gi�y th� th�m d�ng TDDC
            tinsert(tbOpt, {
                "T�c �� di chuy�n", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "T�c �� di chuy�n", 70 } },
            })
        end
        if tbCheTao.nItemId == 4 then -- n�u l� d�y chuy�n th� th�m d�ng Kh�ng t�t c�
            tinsert(tbOpt, {
                "Kh�ng t�t c�", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "Kh�ng t�t c�", 120 } },
            })
        end
        if tbCheTao.nItemId == 3 and tbCheTao.nSeries == 0 then -- n�u l� �o h� Kim th� th�m d�ng Ph�n ��n c�n chi�n
            tinsert(tbOpt, {
                "Ph�n ��n c�n chi�n", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "Ph�n ��n c�n chi�n", 80 } },
            })
        end
        for _, optTB in tbDoTim.tbEquipMagic[tbCheTao.nSeries] do
            if type(optTB) == "table" then
                tinsert(tbOpt, { optTB[1], tbDoTim.getLine, { nLine, tbCheTao.nSeries, optTB } })
            end
        end
    end
end

function tbDoTim:CheTaoDoTim()
    local nItemIdx = AddQualityItem(2, tbCheTao.nGenre, tbCheTao.nDetail, tbCheTao.nPart,
                         tbCheTao.nLevel, tbCheTao.nSeries, 500, tbCheTao.tbOptions[1][2],
                         tbCheTao.tbOptions[2][2], tbCheTao.tbOptions[3][2],
                         tbCheTao.tbOptions[4][2], tbCheTao.tbOptions[5][2],
                         tbCheTao.tbOptions[6][2])
    Msg2Player("Nh�n ���c <color=pink>" .. GetItemName(nItemIdx)) -- tbCheTao.szName
    tbCheTao.tbOptions = {}
end
