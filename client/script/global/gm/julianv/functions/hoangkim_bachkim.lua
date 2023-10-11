------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------V� kh� BKMP---------------------------
function JulianV:VKHK_Dialog()
    local tbOpt = {}
    if self == 1 then
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, JulianV.GetWeapon, { self, id } })
        end
    else
        for i = 1, 10 do
            tinsert(tbOpt, { tbMonPhai.tbFacName[i], JulianV.GetWeapon, { self, i } })
        end
    end
    JDialog:Show(tbOpt, JulianV.NhanTrangBi, "M�i <sex>ch�n m�n ph�i<pic=46><color>")
end

function JulianV:GetWeapon( id )
    local nType = self
    if (CountFreeRoomByWH(2, 4, 1) < 1) then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    end
    if CalcFreeItemCellCount() < 15 then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
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

function JulianV:SetHKMP_Dialog() -- set trang b� hkmp
    if GetLastFactionNumber() == -1 then
        Talk(1, "", "Nh� ng��i ch�a gia nh�p m�n ph�i nh�n c�i g� m� nh�n <pic=138>")
        return
    end
    local nFacID = GetLastFactionNumber() + 1
    if not self then
        local tbOpt = {}
        for id, wp in tbMonPhai.tbGoldEquip[nFacID] do
            tinsert(tbOpt, { wp, JulianV.SetHKMP_Dialog, { id } })
        end
        JDialog:Show(tbOpt, JulianV.NhanTrangBi,
            "M�i <sex>ch�n lo�i h�nh luy�n c�ng<pic=46><color>")
    else
        for i = 1, 5 do
            Msg2Player("Nh�n ���c trang b� Ho�ng Kim M�n ph�i <color=yellow>" ..
                           GetItemName(AddGoldItem(0, self * 5 + i - 5)))
        end
    end
end

function JulianV:TrangBi_HKMP_An() -- set trang b� hkmp �n
    if not self then
        local tbOpt = {}
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, JulianV.TrangBi_HKMP_An, { id } })
        end
        JDialog:Show(tbOpt, JulianV.NhanTrangBi, "M�i <sex>ch�n m�n ph�i<pic=46><color>")
    else
        if not tbMonPhai.tbPrivateEquip[self] then
            Talk(1, "", "M�n ph�i n�y ch�a c� trang b� Tr�n Bang Chi B�o<pic=46>")
        else
            for _, id in tbMonPhai.tbPrivateEquip[self] do
                Msg2Player("Nh�n ���c trang b� Ho�ng Kim M�n ph�i <color=yellow>" ..
                               GetItemName(AddGoldItem(0, id)))
            end
        end
    end
end

function JulianV.HoangKimCui( nStart, nEnd ) -- trang b� hk th��ng
    if not nStart then
        local tbOpt = {
            { "An Bang", JulianV.HoangKimCui, { 408, 411 } }, --
            { "��nh Qu�c", JulianV.HoangKimCui, { 389, 393 } }, --
            { "Kim Phong", JulianV.HoangKimCui, { 177, 185 } }, --
            { "H�ng �nh (Th��ng)", JulianV.HoangKimCui, { 204, 207 } }, --
            { "H�ng �nh (Ho�n M�)", JulianV.HoangKimCui, { 434, 437 } },
        }
        JDialog:Show(tbOpt, JulianV.NhanTrangBi,
            "M�i <sex>ch�n trong b� y�u th�ch<pic=46><color>")
    else
        for i = nStart, nEnd do
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
-------------------------�n - Phi Phong - Trang S�c-------------------------
function JulianV:NguHanhAn_Diag()
    local tbOpt = {
        { "T�n Nh�m H�nh �n Gi�m (H�)", JulianV.NhanNguHanhAn, { 5930 } }, --
        { "T�n Nh�m H�nh �n Gi�m (Trung)", JulianV.NhanNguHanhAn, { 5931 } }, --
        { "T�n Nh�m H�nh �n Gi�m (Th��ng)", JulianV.NhanNguHanhAn, { 5932 } }, --
        { "Ng� H�nh �n C��ng Ho�", JulianV.NhanNguHanhAn, { 0 } }, --
        { "Ng� H�nh �n Nh��c Ho�", JulianV.NhanNguHanhAn, { 1 } }, --
        { "Ng� H�nh �n C��ng Ho� v� Nh��c Ho�", JulianV.NhanNguHanhAn, { 2 } },
    }
    JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
end

function JulianV:NhanNguHanhAn( nIndex )
    if self > 2 then
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, self)))
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
            tinsert(tbOpt, { szLoaiAn(self) .. i, JulianV.NhanNguHanhAn, { self, self * 10 + i } })
        end
        JDialog:Show(tbOpt, JulianV.NguHanhAn_Diag)
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex + 3204)))
    end
end

function JulianV:NhanPhiPhong()
    local nIndex = self
    if not nIndex then
        local tbOpt = {
            { "Phi Phong c�p th�p", JulianV.NhanPhiPhong, { 3465 } }, --
            { "Phi Phong Ph� Quang", JulianV.NhanPhiPhong, { 3476 } }, --
            { "Phi Phong Kh�p Th�n", JulianV.NhanPhiPhong, { 3479 } }, --
            { "Phi Phong K�nh Thi�n", JulianV.NhanPhiPhong, { 3482 } }, --
            { "Phi Phong V� C�c", JulianV.NhanPhiPhong, { 3485 } }, --
            { "Phi Phong Si�u C�p", JulianV.NhanPhiPhong, { 3488 } },
        }
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
    else
        if nIndex == 3465 then
            for i = 3465, 3475 do AddGoldItem(0, i) end
            return
        end
        for i = nIndex, nIndex + 2 do AddGoldItem(0, i) end
        Talk(1, "", "�� chuy�n Phi Phong v�o h�nh trang, xin h�y ki�m tra l�i<pic=46>")
    end
end

function JulianV.NhanTrangSuc( nStart, nEnd )
    if not nStart then
        local tbOpt = {
            { "B� Trang S�c 1", JulianV.NhanTrangSuc, { 1 } }, --
            { "B� Trang S�c 2", JulianV.NhanTrangSuc, { 2 } }, --
            { "B� Trang S�c Long ��m", JulianV.NhanTrangSuc, { 4483, 4487 } }, --
            { "B� Trang S�c Cu�ng Lan", JulianV.NhanTrangSuc, { 4488, 4492 } }, --
            { "Long Chi�n Vu D�", JulianV.NhanTrangSuc, { 5657 } },
        }
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
    else
        local thongbao = function()
            Talk(1, "", "�� chuy�n trang b� v�o h�nh trang, xin h�y ki�m tra l�i<pic=46>")
        end
        if nStart == 1 then
            for i = 3542, 3554 do AddGoldItem(0, i) end
            for i = 3491, 3506 do AddGoldItem(0, i) end
            thongbao()
            return
        end
        if nStart == 2 then
            AddGoldItem(0, 3506)
            for i = 3880, 3888 do AddGoldItem(0, i) end
            thongbao()
            return
        end
        if nEnd then
            for i = nStart, nEnd do AddGoldItem(0, i) end
            thongbao()
            return
        else
            AddGoldItem(0, nStart)
            thongbao()
            return
        end
    end
end
-------------------------Nh�n C�n Kh�n-------------------------
function JulianV:NhanCanKhon_Diag( nIndex )
    local tbOpt = {}
    if not nIndex then
        if not self then
            for resitName, _ in tbNhanCanKhon do
                tinsert(tbOpt, { resitName, JulianV.NhanCanKhon_Diag, { resitName } })
            end
        else
            for _, tbEff in tbNhanCanKhon[self] do
                tinsert(tbOpt, { tbEff[1], JulianV.NhanCanKhon_Diag, { self, tbEff[2] } })
            end
        end
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog,
            "M�i <sex>ch�n thu�c t�nh c�a Nh�n C�n Kh�n<pic=46><color>")
    else
        Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex)))
    end
end
