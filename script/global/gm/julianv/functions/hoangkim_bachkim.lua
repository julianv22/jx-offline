------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------Vò khÝ BKMP---------------------------
function VKHK_Dialog(nType)
    dofile("script/global/gm/julianv/functions/hoangkim_bachkim.lua")
    local tbOpt = {}
    if nType == 1 then
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, {szMonPhai, getWeapon, {nType, id}})
        end
    else
        for i = 1, 10 do
            tinsert(tbOpt, {tbMonPhai.tbFacName[i], getWeapon, {nType, i}})
        end
    end
    tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän m«n ph¸i<pic=46><color>")
end

function getWeapon(nType, id)
    if (CountFreeRoomByWH(2, 4, 1) < 1) then
        Talk(1, "", "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ.");
        return
    end
    if CalcFreeItemCellCount() < 15 then
        Talk(1, "", "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ.");
        return
    end
    local tbWeapon = function(nType)
        if nType == 1 then
            return tbMonPhai.tbPlaWeapon
        else
            return tbMonPhai.tbGoldWeapon
        end
    end
    local nItemId
    for _, wp in tbWeapon(nType)[id] do
        nItemId = nType == 1 and AddPlatinaItem(0, wp[2]) or AddGoldItem(0, wp)
        Msg2Player(format("<color=green>NhËn ®­îc Vò khÝ Hoµng Kim m«n ph¸i<color> %s %s%s",
            tbMonPhai.tbFacName[id], nType == 1 and "<bclr=blue><color=white>" or "<color=yellow>", GetItemName(nItemId)))
    end
end

function SetHKMP_Dialog(nItemId)
    local nFacID = tbMonPhai.tbPinyn[GetFaction()]
    if not nItemId then
        local tbOpt = {}
        for id, wp in tbMonPhai.tbGoldEquip[nFacID] do
            tinsert(tbOpt, {wp, SetHKMP_Dialog, {id}})
        end
        tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän lo¹i h×nh luyÖn c«ng<pic=46><color>")
    else
        for i = 1, 5 do
            Msg2Player("NhËn ®­îc trang bÞ Hoµng Kim M«n ph¸i <color=yellow>" ..
                           GetItemName(AddGoldItem(0, nItemId * 5 + i - 5)))
        end
    end
end

function TrangBi_HKMP_An(nFacId)
    if not nFacId then
        local tbOpt = {}
        for id, szMonPhai in tbMonPhai.tbFacName do
            tinsert(tbOpt, {szMonPhai, TrangBi_HKMP_An, {id}})
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

function HoangKimCui(nStart, nEnd)
    if not nStart then
        local tbOpt = { --
        {"An Bang", HoangKimCui, {408, 411}}, --
        {"§Þnh Quèc", HoangKimCui, {389, 393}}, --
        {"Kim Phong", HoangKimCui, {177, 185}}}
        tbDialog:Show(tbOpt, NhanTrangBi, "Mêi <sex>chän trong bÞ yªu thÝch<pic=46><color>")
    else
        for i = nStart, nEnd do
            Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddGoldItem(0, i)))
        end
    end
end
