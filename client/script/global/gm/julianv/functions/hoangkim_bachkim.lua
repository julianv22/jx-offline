------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------Vò khÝ BKMP---------------------------
function JulianV.VKHK_Dialog( nType )
    local tbOpt = {}
    if nType == 1 then
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, JulianV.getWeapon, { nType, id } })
        end
    else
        for i = 1, 10 do
            tinsert(tbOpt, { tbMonPhai.tbFacName[i], JulianV.getWeapon, { nType, i } })
        end
    end
    JDialog:Show(tbOpt, JulianV.NhanTrangBi, "Mêi <sex>chän m«n ph¸i<pic=46><color>")
end

function JulianV.getWeapon( nType, id )
    if (CountFreeRoomByWH(2, 4, 1) < 1) then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    end
    if CalcFreeItemCellCount() < 15 then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    end
    local tbWeapon = nType == 1 and tbMonPhai.tbPlaWeapon or tbMonPhai.tbGoldWeapon
    local nItemId
    for _, wp in tbWeapon[id] do
        nItemId = nType == 1 and AddPlatinaItem(0, wp[2]) or AddGoldItem(0, wp)
        Msg2Player(format(
                       "<color=green>NhËn ®­îc Vò khÝ Hoµng Kim m«n ph¸i<color> %s %s%s",
                       tbMonPhai.tbFacName[id],
                       nType == 1 and "<bclr=blue><color=white>" or "<color=yellow>",
                       GetItemName(nItemId)))
    end
end

function JulianV.SetHKMP_Dialog( nItemId ) -- set trang bÞ hkmp
    if GetFaction() == "" then
        Talk(1, "", "Nhµ ng­¬i ch­a gia nhËp m«n ph¸i nhËn c¸i g× mµ nhËn <pic=138>")
        return
    end
    local nFacID = tbMonPhai.tbPinyn[GetFaction()][1]
    if not nItemId then
        local tbOpt = {}
        for id, wp in tbMonPhai.tbGoldEquip[nFacID] do
            tinsert(tbOpt, { wp, JulianV.SetHKMP_Dialog, { id } })
        end
        JDialog:Show(tbOpt, JulianV.NhanTrangBi,
            "Mêi <sex>chän lo¹i h×nh luyÖn c«ng<pic=46><color>")
    else
        for i = 1, 5 do
            Msg2Player("NhËn ®­îc trang bÞ Hoµng Kim M«n ph¸i <color=yellow>" ..
                           GetItemName(AddGoldItem(0, nItemId * 5 + i - 5)))
        end
    end
end

function JulianV.TrangBi_HKMP_An( nFacId ) -- set trang bÞ hkmp Èn
    if not nFacId then
        local tbOpt = {}
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, JulianV.TrangBi_HKMP_An, { id } })
        end
        JDialog:Show(tbOpt, JulianV.NhanTrangBi, "Mêi <sex>chän m«n ph¸i<pic=46><color>")
    else
        if not tbMonPhai.tbPrivateEquip[nFacId] then
            Talk(1, "", "M«n ph¸i nµy ch­a cã trang bÞ TrÊn Bang Chi B¶o<pic=46>")
        else
            for _, id in tbMonPhai.tbPrivateEquip[nFacId] do
                Msg2Player("NhËn ®­îc trang bÞ Hoµng Kim M«n ph¸i <color=yellow>" ..
                               GetItemName(AddGoldItem(0, id)))
            end
        end
    end
end

function JulianV.HoangKimCui( nStart, nEnd ) -- trang bÞ hk th­êng
    if not nStart then
        local tbOpt = {
            { "An Bang", JulianV.HoangKimCui, { 408, 411 } }, --
            { "§Þnh Quèc", JulianV.HoangKimCui, { 389, 393 } }, --
            { "Kim Phong", JulianV.HoangKimCui, { 177, 185 } }, --
            { "Hång ¶nh (Th­êng)", JulianV.HoangKimCui, { 204, 207 } }, --
            { "Hång ¶nh (Hoµn Mü)", JulianV.HoangKimCui, { 434, 437 } },
        }
        JDialog:Show(tbOpt, JulianV.NhanTrangBi,
            "Mêi <sex>chän trong bÞ yªu thÝch<pic=46><color>")
    else
        for i = nStart, nEnd do
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
-------------------------Ên - Phi Phong - Trang Søc-------------------------
function JulianV:NguHanhAn_Diag()
    local tbOpt = {
        { "T©n Nh©m Hµnh Ên Gi¸m (H¹)", JulianV.getNguHanhAn, { 5930 } }, --
        { "T©n Nh©m Hµnh Ên Gi¸m (Trung)", JulianV.getNguHanhAn, { 5931 } }, --
        { "T©n Nh©m Hµnh Ên Gi¸m (Th­îng)", JulianV.getNguHanhAn, { 5932 } }, --
        { "Ngò Hµnh Ên C­êng Ho¸", JulianV.getNguHanhAn, { 0 } }, --
        { "Ngò Hµnh Ên Nh­îc Ho¸", JulianV.getNguHanhAn, { 1 } }, --
        { "Ngò Hµnh Ên C­êng Ho¸ vµ Nh­îc Ho¸", JulianV.getNguHanhAn, { 2 } },
    }
    JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
end

function JulianV.getNguHanhAn( nType, nIndex )
    if nType > 2 then
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nType)))
        return
    end
    if not nIndex then
        local szLoaiAn = function( nType )
            if nType == 0 then
                return "Hoµng Kim Ên (C­êng Ho¸) "
            elseif nType == 1 then
                return "Hoµng Kim Ên (Nh­îc Ho¸) "
            elseif nType == 2 then
                return "Ngò Hµnh Ên (C­êng Ho¸ vµ Nh­îc Ho¸) "
            end
        end
        local tbOpt = {}
        for i = 1, 10 do
            tinsert(tbOpt, { szLoaiAn(nType) .. i, JulianV.getNguHanhAn, { nType, nType * 10 + i } })
        end
        JDialog:Show(tbOpt, JulianV.NguHanhAn_Diag)
    else
        -- Msg2Player(nIndex+3204)
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex + 3204)))
    end
end

function JulianV.getPhiPhong( nIndex )
    if not nIndex then
        local tbOpt = {
            { "Phi Phong cÊp thÊp", JulianV.getPhiPhong, { 3465 } }, --
            { "Phi Phong PhÖ Quang", JulianV.getPhiPhong, { 3476 } }, --
            { "Phi Phong KhÊp ThÇn", JulianV.getPhiPhong, { 3479 } }, --
            { "Phi Phong K×nh Thiªn", JulianV.getPhiPhong, { 3482 } }, --
            { "Phi Phong V« Cùc", JulianV.getPhiPhong, { 3485 } }, --
            { "Phi Phong Siªu CÊp", JulianV.getPhiPhong, { 3488 } },
        }
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
    else
        if nIndex == 3465 then
            for i = 3465, 3475 do AddGoldItem(0, i) end
            return
        end
        for i = nIndex, nIndex + 2 do AddGoldItem(0, i) end
        Talk(1, "", "§· chuyÓn Phi Phong vµo hµnh trang, xin h·y kiÓm tra l¹i<pic=46>")
    end
end

function JulianV.getTrangSuc( nIndex, nEnd )
    if not nIndex then
        local tbOpt = {
            { "Bé Trang Søc 1", JulianV.getTrangSuc, { 1 } }, --
            { "Bé Trang Søc 2", JulianV.getTrangSuc, { 2 } }, --
            { "Bé Trang Søc Long §¸m", JulianV.getTrangSuc, { 4483, 4487 } }, --
            { "Bé Trang Søc Cuång Lan", JulianV.getTrangSuc, { 4488, 4492 } }, --
            { "Long ChiÕn Vu D·", JulianV.getTrangSuc, { 5657 } },
        }
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog)
    else
        local thongbao = function()
            Talk(1, "", "§· chuyÓn trang bÞ vµo hµnh trang, xin h·y kiÓm tra l¹i<pic=46>")
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
-------------------------NhÉn Cµn Kh«n-------------------------
function JulianV.NhanCanKhon_Diag( szResit, nIndex )
    local tbOpt = {}
    if not nIndex then
        if not szResit then
            for resitName, _ in tbNhanCanKhon do
                tinsert(tbOpt, { resitName, JulianV.NhanCanKhon_Diag, { resitName } })
            end
        else
            for _, tbEff in tbNhanCanKhon[szResit] do
                tinsert(tbOpt, { tbEff[1], JulianV.NhanCanKhon_Diag, { szResit, tbEff[2] } })
            end
        end
        JDialog:Show(tbOpt, JulianV.TrangBiKhac_Dialog,
            "Mêi <sex>chän thuéc tÝnh cña NhÉn Cµn Kh«n<pic=46><color>")
    else
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex)))
    end
end
