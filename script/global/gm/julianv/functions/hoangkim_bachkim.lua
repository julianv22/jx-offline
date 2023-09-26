------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------Vò khÝ BKMP---------------------------
function VKHK_Dialog( nType )
    local tbOpt = {}
    if nType == 1 then
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, getWeapon, { nType, id } })
        end
    else
        for i = 1, 10 do tinsert(tbOpt, { tbMonPhai.tbFacName[i], getWeapon, { nType, i } }) end
    end
    tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän m«n ph¸i<pic=46><color>")
end

function getWeapon( nType, id )
    if (CountFreeRoomByWH(2, 4, 1) < 1) then
        Talk(1, "", "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ.");
        return
    end
    if CalcFreeItemCellCount() < 15 then
        Talk(1, "", "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ.");
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

function SetHKMP_Dialog( nItemId ) -- set trang bÞ hkmp
    local nFacID = tbMonPhai.tbPinyn[GetFaction()][1]
    if not nItemId then
        local tbOpt = {}
        for id, wp in tbMonPhai.tbGoldEquip[nFacID] do
            tinsert(tbOpt, { wp, SetHKMP_Dialog, { id } })
        end
        tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän lo¹i h×nh luyÖn c«ng<pic=46><color>")
    else
        for i = 1, 5 do
            Msg2Player("NhËn ®­îc trang bÞ Hoµng Kim M«n ph¸i <color=yellow>" ..
                           GetItemName(AddGoldItem(0, nItemId * 5 + i - 5)))
        end
    end
end

function TrangBi_HKMP_An( nFacId ) -- set trang bÞ hkmp Èn
    if not nFacId then
        local tbOpt = {}
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, { szMonPhai, TrangBi_HKMP_An, { id } })
        end
        tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän m«n ph¸i<pic=46><color>")
    else
        if not tbMonPhai.tbPrivateEquip[nFacId] then
            Talk(1, "", "M«n ph¸i nµy ch­a cã trang bÞ TrÊn Bang Chi B¶o")
        else
            for _, id in tbMonPhai.tbPrivateEquip[nFacId] do
                Msg2Player("NhËn ®­îc trang bÞ Hoµng Kim M«n ph¸i <color=yellow>" ..
                               GetItemName(AddGoldItem(0, id)))
            end
        end
    end
end

function HoangKimCui( nStart, nEnd ) -- trang bÞ hk th­êng
    if not nStart then
        local tbOpt = {
            { "An Bang", HoangKimCui, { 408, 411 } }, --
            { "§Þnh Quèc", HoangKimCui, { 389, 393 } }, --
            { "Kim Phong", HoangKimCui, { 177, 185 } }, --
            { "Hång ¶nh (Th­êng)", HoangKimCui, { 204, 207 } }, --
            { "Hång ¶nh (Hoµn Mü)", HoangKimCui, { 434, 437 } },
        }
        tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän trong bÞ yªu thÝch<pic=46><color>")
    else
        for i = nStart, nEnd do
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
-------------------------Ên - Phi Phong - Trang Søc-------------------------
function NguHanhAn_Diag()
    local tbOpt = {
        { "T©n Nh©m Hµnh Ên Gi¸m (H¹)", getNguHanhAn, { 5930 } }, --
        { "T©n Nh©m Hµnh Ên Gi¸m (Trung)", getNguHanhAn, { 5931 } }, --
        { "T©n Nh©m Hµnh Ên Gi¸m (Th­îng)", getNguHanhAn, { 5932 } }, --
        { "Ngò Hµnh Ên C­êng Ho¸", getNguHanhAn, { 0 } }, --
        { "Ngò Hµnh Ên Nh­îc Ho¸", getNguHanhAn, { 1 } }, --
        { "Ngò Hµnh Ên C­êng Ho¸ vµ Nh­îc Ho¸", getNguHanhAn, { 2 } },
    }
    tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
end

function getNguHanhAn( nType, nIndex )
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
            tinsert(tbOpt, { szLoaiAn(nType) .. i, getNguHanhAn, { nType, nType * 10 + i } })
        end
        tbDialog:Show(tbOpt, NguHanhAn_Diag)
    else
        -- Msg2Player(nIndex+3204)
        Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, nIndex + 3204)))
    end
end

function getPhiPhong( nIndex )
    if not nIndex then
        local tbOpt = {
            { "Phi Phong cÊp thÊp", getPhiPhong, { 3465 } }, --
            { "Phi Phong PhÖ Quang", getPhiPhong, { 3476 } }, --
            { "Phi Phong KhÊp ThÇn", getPhiPhong, { 3479 } }, --
            { "Phi Phong K×nh Thiªn", getPhiPhong, { 3482 } }, --
            { "Phi Phong V« Cùc", getPhiPhong, { 3485 } }, --
            { "Phi Phong Siªu CÊp", getPhiPhong, { 3488 } },
        }
        tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
    else
        if nIndex == 3465 then
            for i = 3465, 3475 do AddGoldItem(0, i) end
            return
        end
        for i = nIndex, nIndex + 2 do AddGoldItem(0, i) end
        Talk(1, "", "§· chuyÓn Phi Phong vµo hµnh trang, xin h·y kiÓm tra l¹i!")
    end
end

function getTrangSuc( nIndex, nEnd )
    if not nIndex then
        local tbOpt = {
            { "Bé Trang Søc 1", getTrangSuc, { 1 } }, --
            { "Bé Trang Søc 2", getTrangSuc, { 2 } }, --
            { "Bé Trang Søc Long §¸m", getTrangSuc, { 4483, 4487 } }, --
            { "Bé Trang Søc Cuång Lan", getTrangSuc, { 4488, 4492 } }, --
            { "Long ChiÕn Vu D·", getTrangSuc, { 5657 } },
        }
        tbDialog:Show(tbOpt, TrangBiKhac_Dialog)
    else
        local thongbao = function()
            Talk(1, "", "§· chuyÓn trang bÞ vµo hµnh trang, xin h·y kiÓm tra l¹i!")
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
