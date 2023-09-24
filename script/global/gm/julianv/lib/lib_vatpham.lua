tbNguyenLieu = {}
tbVatPham = {}
tbNguyenLieu.tbList = {
    HuyenTinh = 1,
    ThuyTinh = 2,
    PhucDuyen = 3
}
tbNguyenLieu.tbVatPham = {
    [tbNguyenLieu.tbList.HuyenTinh] = {{
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
    [tbNguyenLieu.tbList.ThuyTinh] = {{
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
    [tbNguyenLieu.tbList.PhucDuyen] = {{
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

function tbNguyenLieu:Define()
    for id, VatPham in tbNguyenLieu.tbVatPham do
        tbVatPham[id] = VatPham
    end
end
tbNguyenLieu:Define()
