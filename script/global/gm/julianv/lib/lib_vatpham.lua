tbVatPham = {}
tbVatPham.tbList = {
    HuyenTinh = 1,
    ThuyTinh = 2,
    PhucDuyen = 3
}
tbVatPham.NguyenLieu = {
    [tbVatPham.tbList.HuyenTinh] = {{
        szName = "HuyÒn Tinh CÊp 1",
        tbProp = {6, 1, 147, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 2",
        tbProp = {6, 1, 147, 2, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 3",
        tbProp = {6, 1, 147, 3, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 4",
        tbProp = {6, 1, 147, 4, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 5",
        tbProp = {6, 1, 147, 5, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 6",
        tbProp = {6, 1, 147, 6, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 7",
        tbProp = {6, 1, 147, 7, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 8",
        tbProp = {6, 1, 147, 8, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 9",
        tbProp = {6, 1, 147, 9, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "HuyÒn Tinh CÊp 10",
        tbProp = {6, 1, 147, 10, 0, 0, 0},
        tbParam = {60}
    }},
    [tbVatPham.tbList.ThuyTinh] = {{
        szName = "Tö Thñy Tinh",
        tbProp = {4, 239, 1, 1, 0, 0},
        tbParam = {60}
    }, {
        szName = "Lam Thñy Tinh",
        tbProp = {4, 238, 1, 1, 0, 0},
        tbParam = {60}
    }, {
        szName = "Lôc Thñy Tinh",
        tbProp = {4, 240, 1, 1, 0, 0},
        tbParam = {60}
    }},
    [tbVatPham.tbList.PhucDuyen] = {{
        szName = "Phóc Duyªn TiÓu",
        tbProp = {6, 1, 122, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Phóc Duyªn Trung",
        tbProp = {6, 1, 123, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Phóc Duyªn §¹i",
        tbProp = {6, 1, 124, 1, 0, 0, 0},
        tbParam = {60}
    }}
}
tbVatPham.VP_Khac = {{
    szName = "Håi Thiªn T¸i T¹o LÔ Bao",
    tbProp = {6, 1, 1781, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Khiªu ChiÕn LÖnh.",
    tbProp = {6, 1, 1499, 0, 0, 0}
}, {
    szName = "Cµn Kh«n Song TuyÖt Béi",
    tbProp = {6, 1, 2219, 0, 0, 0}
}, {
    szName = "Nh¹c V­¬ng KiÕm LÔ Bao",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Long HuyÕt Hoµng",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Tö MÉu LÖnh",
    tbProp = {6, 1, 1427, 0, 0, 0}
}, {
    szName = "TÝn VËt M«n Ph¸i",
    tbProp = {6, 1, 1670, 0, 0, 0}
}, {
    szName = "TÝn VËt D­¬ng Anh",
    tbProp = {6, 1, 1671, 0, 0, 0}
}, {
    szName = "Hçn Nguyªn Linh Lé",
    tbProp = {6, 1, 2312, 1, 0, 0}
}, {
    szName = "§¹i Lùc Hoµn LÔ Hép",
    tbProp = {6, 1, 2517, 0, 0, 0}
}, {
    szName = "ThËp Toµn §¹i Bæ",
    tbProp = {6, 1, 1399, 0, 0, 0}
}}
function tbVatPham:Define()
    for id, NguyenLieu in tbVatPham.NguyenLieu do
        tbVatPham[id] = NguyenLieu
    end
end
tbVatPham:Define()

function tbVatPham:Khac()
    local tbTemp = {}
    for id, VP_Khac in tbVatPham.VP_Khac do
        tbTemp[id] = VP_Khac
    end
    return tbTemp
end
