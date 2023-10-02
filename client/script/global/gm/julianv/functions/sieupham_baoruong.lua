------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
tbItem = {}
tbItem.Ds = {
    Nhan = 1,
    DayChuyen = 2,
    NgocBoi = 3,
 }

tbItem.tbItemInfo = {
    [tbItem.Ds.Nhan] = {
        szName = "Nh�n",
        tbList = { 4134, 4135 },
     },
    [tbItem.Ds.DayChuyen] = {
        szName = "D�y Chuy�n",
        tbList = { 4436 },
     },
    [tbItem.Ds.NgocBoi] = {
        szName = "Ng�c B�i",
        tbList = { 4481 },
     },
}

function main()
    dofile("script/global/gm/julianv/functions/sieupham_baoruong.lua")

    if (CountFreeRoomByWH(2, 2, 1) < 1) then
        Talk(1, "", "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    elseif CalcFreeItemCellCount() < 6 then
        Talk(1, "", "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�<pic=46>");
        return
    else
        getItem()
    end
end

function getItem()
    for i = 1, getn(tbItem.tbItemInfo) do
        for _, tbItemIdx in tbItem.tbItemInfo[i].tbList do
            Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddGoldItem(0, tbItemIdx)))
        end
    end
end
