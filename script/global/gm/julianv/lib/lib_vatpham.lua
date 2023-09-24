tbVatPham = {}
tbVatPham.tbList = {
    HuyenTinh = 1,
    ThuyTinh = 2,
    PhucDuyen = 3
}
tbVatPham.NguyenLieu = {
    [tbVatPham.tbList.HuyenTinh] = {{
        szName = "Huy�n Tinh C�p 1",
        tbProp = {6, 1, 147, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 2",
        tbProp = {6, 1, 147, 2, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 3",
        tbProp = {6, 1, 147, 3, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 4",
        tbProp = {6, 1, 147, 4, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 5",
        tbProp = {6, 1, 147, 5, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 6",
        tbProp = {6, 1, 147, 6, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 7",
        tbProp = {6, 1, 147, 7, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 8",
        tbProp = {6, 1, 147, 8, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 9",
        tbProp = {6, 1, 147, 9, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Huy�n Tinh C�p 10",
        tbProp = {6, 1, 147, 10, 0, 0, 0},
        tbParam = {60}
    }},
    [tbVatPham.tbList.ThuyTinh] = {{
        szName = "T� Th�y Tinh",
        tbProp = {4, 239, 1, 1, 0, 0},
        tbParam = {60}
    }, {
        szName = "Lam Th�y Tinh",
        tbProp = {4, 238, 1, 1, 0, 0},
        tbParam = {60}
    }, {
        szName = "L�c Th�y Tinh",
        tbProp = {4, 240, 1, 1, 0, 0},
        tbParam = {60}
    }},
    [tbVatPham.tbList.PhucDuyen] = {{
        szName = "Ph�c Duy�n Ti�u",
        tbProp = {6, 1, 122, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Ph�c Duy�n Trung",
        tbProp = {6, 1, 123, 1, 0, 0, 0},
        tbParam = {60}
    }, {
        szName = "Ph�c Duy�n ��i",
        tbProp = {6, 1, 124, 1, 0, 0, 0},
        tbParam = {60}
    }}
}
tbVatPham.VP_Khac = {{
    szName = "H�i Thi�n T�i T�o L� Bao",
    tbProp = {6, 1, 1781, 0, 0, 0},
    tbParam = {60}
}, {
    szName = "Khi�u Chi�n L�nh.",
    tbProp = {6, 1, 1499, 0, 0, 0}
}, {
    szName = "C�n Kh�n Song Tuy�t B�i",
    tbProp = {6, 1, 2219, 0, 0, 0}
}, {
    szName = "Nh�c V��ng Ki�m L� Bao",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "Long Huy�t Ho�ng",
    tbProp = {6, 1, 2340, 0, 0, 0}
}, {
    szName = "T� M�u L�nh",
    tbProp = {6, 1, 1427, 0, 0, 0}
}, {
    szName = "T�n V�t M�n Ph�i",
    tbProp = {6, 1, 1670, 0, 0, 0}
}, {
    szName = "T�n V�t D��ng Anh",
    tbProp = {6, 1, 1671, 0, 0, 0}
}, {
    szName = "H�n Nguy�n Linh L�",
    tbProp = {6, 1, 2312, 1, 0, 0}
}, {
    szName = "��i L�c Ho�n L� H�p",
    tbProp = {6, 1, 2517, 0, 0, 0}
}, {
    szName = "Th�p To�n ��i B�",
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
