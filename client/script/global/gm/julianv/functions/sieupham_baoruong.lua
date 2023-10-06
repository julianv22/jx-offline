------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function main()
    dofile("script/global/gm/julianv/functions/sieupham_baoruong.lua")

    if CountFreeRoomByWH(2, 1, 1) < 1 then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    elseif CountFreeRoomByWH(1, 2, 1) < 1 then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    elseif CalcFreeItemCellCount() < 6 then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    else
        for i = 4134, 4135 do AddGoldItem(0, i) end
        AddGoldItem(0, 4436)
        AddGoldItem(0, 4481)
        Msg2Player(
            "NhËn ®­îc bé trang søc <color=yellow>§éc C« CÇu B¹i Giíi ChØ<color> vµ <color=yellow>Huynh §Ö")
    end
end
