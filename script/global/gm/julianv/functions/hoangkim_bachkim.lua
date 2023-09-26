------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------V� kh� BKMP---------------------------
function VKHK_Dialog( nType )
    local tbOpt = {}
    if nType == 1 then
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, getWeapon, { nType, id } })
        end
    else
        for i = 1, 10 do tinsert(tbOpt, { tbMonPhai.tbFacName[i], getWeapon, { nType, i } }) end
    end
    tbDialog:Show(tbOpt, NhanTrangBi, "M�i <sex>ch�n m�n ph�i<pic=46><color>")
end

function getWeapon( nType, id )
    if (CountFreeRoomByWH(2, 4, 1) < 1) then
        Talk(1, "", "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�.");
        return
    end
    if CalcFreeItemCellCount() < 15 then
        Talk(1, "", "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�.");
        return
    end
    local tbWeapon = nType == 1 and tbMonPhai.tbPlaWeapon or tbMonPhai.tbGoldWeapon
    local nItemId
    for _, wp in tbWeapon[id] do
        nItemId = nType == 1 and AddPlatinaItem(0, wp[2]) or AddGoldItem(0, wp)
        Msg2Player(format(
                       "<color=green>Nh�n ���c V� kh� Ho�ng Kim m�n ph�i<color> %s %s%s",
                       tbMonPhai.tbFacName[id],
                       nType == 1 and "<bclr=blue><color=white>" or "<color=yellow>",
                       GetItemName(nItemId)))
    end
end

function SetHKMP_Dialog( nItemId ) -- set trang b� hkmp
    local nFacID = tbMonPhai.tbPinyn[GetFaction()][1]
    if not nItemId then
        local tbOpt = {}
        for id, wp in tbMonPhai.tbGoldEquip[nFacID] do
            tinsert(tbOpt, { wp, SetHKMP_Dialog, { id } })
        end
        tbDialog:Show(tbOpt, NhanTrangBi, "M�i <sex>ch�n lo�i h�nh luy�n c�ng<pic=46><color>")
    else
        for i = 1, 5 do
            Msg2Player("Nh�n ���c trang b� Ho�ng Kim M�n ph�i <color=yellow>" ..
                           GetItemName(AddGoldItem(0, nItemId * 5 + i - 5)))
        end
    end
end

function TrangBi_HKMP_An( nFacId ) -- set trang b� hkmp �n
    if not nFacId then
        local tbOpt = {}
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, TrangBi_HKMP_An, { id } })
        end
        tbDialog:Show(tbOpt, NhanTrangBi, "M�i <sex>ch�n m�n ph�i<pic=46><color>")
    else
        if not tbMonPhai.tbPrivateEquip[nFacId] then
            Talk(1, "", "M�n ph�i n�y ch�a c� trang b� Tr�n Bang Chi B�o")
        else
            for _, id in tbMonPhai.tbPrivateEquip[nFacId] do
                Msg2Player("Nh�n ���c trang b� Ho�ng Kim M�n ph�i <color=yellow>" ..
                               GetItemName(AddGoldItem(0, id)))
            end
        end
    end
end

function HoangKimCui( nStart, nEnd ) -- trang b� hk th��ng
    if not nStart then
        local tbOpt = {
            { "An Bang", HoangKimCui, { 408, 411 } }, --
            { "��nh Qu�c", HoangKimCui, { 389, 393 } }, --
            { "Kim Phong", HoangKimCui, { 177, 185 } }, --
            { "H�ng �nh (Th��ng)", HoangKimCui, { 204, 207 } }, --
            { "H�ng �nh (Ho�n M�)", HoangKimCui, { 434, 437 } },
        }
        tbDialog:Show(tbOpt, NhanTrangBi, "M�i <sex>ch�n trong b� y�u th�ch<pic=46><color>")
    else
        for i = nStart, nEnd do
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
-------------------------�n - Phi Phong - Trang S�c-------------------------
function NguHanhAn_Diag()
    local tbOpt = {
        { "T�n Nh�m H�nh �n Gi�m (H�)", getNguHanhAn, { 5930 } }, --
        { "T�n Nh�m H�nh �n Gi�m (Trung)", getNguHanhAn, { 5931 } }, --
        { "T�n Nh�m H�nh �n Gi�m (Th��ng)", getNguHanhAn, { 5932 } }, --
        { "Ng� H�nh �n C��ng Ho�", getNguHanhAn, { 0 } }, --
        { "Ng� H�nh �n Nh��c Ho�", getNguHanhAn, { 1 } }, --
        { "Ng� H�nh �n C��ng Ho� v� Nh��c Ho�", getNguHanhAn, { 2 } },
    }
    tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
end

function getNguHanhAn( nType, nIndex )
    if nType > 2 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nType)))
        return
    end
    if not nIndex then
        local szLoaiAn = function( nType )
            if nType == 0 then
                return "Ho�ng Kim �n (C��ng Ho�) "
            elseif nType == 1 then
                return "Ho�ng Kim �n (Nh��c Ho�) "
            elseif nType == 2 then
                return "Ng� H�nh �n (C��ng Ho� v� Nh��c Ho�) "
            end
        end
        local tbOpt = {}
        for i = 1, 10 do
            tinsert(tbOpt, { szLoaiAn(nType) .. i, getNguHanhAn, { nType, nType * 10 + i } })
        end
        tbDialog:Show(tbOpt, NguHanhAn_Diag)
    else
        -- Msg2Player(nIndex+3204)
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex + 3204)))
    end
end

function getPhiPhong( nIndex )
    if not nIndex then
        local tbOpt = {
            { "Phi Phong c�p th�p", getPhiPhong, { 3465 } }, --
            { "Phi Phong Ph� Quang", getPhiPhong, { 3476 } }, --
            { "Phi Phong Kh�p Th�n", getPhiPhong, { 3479 } }, --
            { "Phi Phong K�nh Thi�n", getPhiPhong, { 3482 } }, --
            { "Phi Phong V� C�c", getPhiPhong, { 3485 } }, --
            { "Phi Phong Si�u C�p", getPhiPhong, { 3488 } },
        }
        tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
    else
        if nIndex == 3465 then
            for i = 3465, 3475 do AddGoldItem(0, i) end
            return
        end
        for i = nIndex, nIndex + 2 do AddGoldItem(0, i) end
        Talk(1, "", "�� chuy�n Phi Phong v�o h�nh trang, xin h�y ki�m tra l�i!")
    end
end

function getTrangSuc( nIndex, nEnd )
    if not nIndex then
        local tbOpt = {
            { "B� Trang S�c 1", getTrangSuc, { 1 } }, --
            { "B� Trang S�c 2", getTrangSuc, { 2 } }, --
            { "B� Trang S�c Long ��m", getTrangSuc, { 4483, 4487 } }, --
            { "B� Trang S�c Cu�ng Lan", getTrangSuc, { 4488, 4492 } }, --
            { "Long Chi�n Vu D�", getTrangSuc, { 5657 } },
        }
        tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
    else
        local thongbao = function()
            Talk(1, "", "�� chuy�n trang b� v�o h�nh trang, xin h�y ki�m tra l�i!")
        end
        if nIndex == 1 then
            for i = 3542, 3554 do AddGoldItem(0, i) end
            for i = 3491, 3506 do AddGoldItem(0, i) end
            thongbao()
            return
        end
        if nIndex == 2 then
            AddGoldItem(0, 3506)
            for i = 3880, 3888 do AddGoldItem(0, i) end
            thongbao()
            return
        end
        if nEnd then
            for i = nIndex, nEnd do AddGoldItem(0, i) end
            thongbao()
            return
        else
            AddGoldItem(0, nIndex)
            thongbao()
            return
        end
    end
end
