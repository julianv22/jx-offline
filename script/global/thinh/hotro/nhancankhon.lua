Include("\\script\\dailogsys\\dailogsay.lua");

tbCANKHON = {
    [1] = {
        szName = "Kh�ng H�a - Th�i Gian Tr�ng ��c",
        id = 6578
    },
    [2] = {
        szName = "Kh�ng B�ng - Th�i Gian Tr�ng ��c",
        id = 6579
    },
    [3] = {
        szName = "Kh�ng L�i - Th�i Gian Tr�ng ��c",
        id = 6580
    },
    [4] = {
        szName = "Kh�ng ��c - Th�i Gian Tr�ng ��c",
        id = 6581
    },
    [5] = {
        szName = "PTVL - Th�i Gian Tr�ng ��c",
        id = 6582
    },
    [6] = {
        szName = "Kh�ng H�a - Th�i Gian L�m Cho�ng",
        id = 6583
    },
    [7] = {
        szName = "Kh�ng B�ng - Th�i Gian L�m Cho�ng",
        id = 6584
    },
    [8] = {
        szName = "Kh�ng L�i - Th�i Gian L�m Cho�ng",
        id = 6585
    },
    [9] = {
        szName = "Kh�ng ��c - Th�i Gian L�m Cho�ng",
        id = 6586
    },
    [10] = {
        szName = "PTVL - Th�i Gian L�m Cho�ng",
        id = 6587
    },
    [11] = {
        szName = "Kh�ng H�a - Th�i Gian L�m Ch�m",
        id = 6588
    },
    [12] = {
        szName = "Kh�ng B�ng - Th�i Gian L�m Ch�m",
        id = 6589
    },
    [13] = {
        szName = "Kh�ng L�i - Th�i Gian L�m Ch�m",
        id = 6590
    },
    [14] = {
        szName = "Kh�ng ��c - Th�i Gian L�m Ch�m",
        id = 6591
    },
    [15] = {
        szName = "PTVL - Th�i Gian L�m Ch�m",
        id = 6592
    }
}
--------------------------------------------------------------------------------
function NhanCanKhon()
    local szTitle = "B�n mu�n nh�n trang b� n�o?"
    local tbOption = {"Nh�n gi�m th�i gian tr�ng ��c/#Cankhon(0)",
                      "Nh�n gi�m th�i gian l�m cho�ng/#Cankhon(1)",
                      "Nh�n gi�m th�i gian l�m ch�m/#Cankhon(2)", "Tr� l�i/main", "Tho�t./no"}
    Say(szTitle, getn(tbOption), tbOption)
end

function Cankhon(index)
    local szTitle = "B�n mu�n nh�n trang b� n�o?"
    local tbOption = {}
    for i = index * 5 + 1, index * 5 + 5 do
        tinsert(tbOption, format("Nh�n %s/#AddGoldItem(0, %d)", tbCANKHON[i].szName, tbCANKHON[i].id))
    end
    tinsert(tbOption, "Tr� l�i./NhanCanKhon")
    tinsert(tbOption, "K�t th�c ��i tho�i./no")
    Say(szTitle, getn(tbOption), tbOption)
end
