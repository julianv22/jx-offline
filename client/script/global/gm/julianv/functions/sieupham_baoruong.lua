------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function main()
    dofile("script/global/gm/julianv/functions/sieupham_baoruong.lua")

    if CountFreeRoomByWH(2, 1, 1) < 1 then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    elseif CountFreeRoomByWH(1, 2, 1) < 1 then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    elseif CalcFreeItemCellCount() < 6 then
        Talk(1, "",
            "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    else
        for i = 4134, 4135 do AddGoldItem(0, i) end
        AddGoldItem(0, 4436)
        AddGoldItem(0, 4481)
        Msg2Player(
            "Nh�n ���c b� trang s�c <color=yellow>��c C� C�u B�i Gi�i Ch�<color> v� <color=yellow>Huynh ��")
    end
end
