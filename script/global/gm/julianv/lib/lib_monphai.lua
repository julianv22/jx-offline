------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------Vò khÝ BKMP---------------------------
tbMonPhai = {}
tbMonPhai.tbFacList = { -- Ds mon phai
    TL = 1, -- ThiÕu L©m
    TV = 2, -- Thiªn V­¬ng
    NM = 3, -- Nga Mi
    TY = 4, -- Thuý yªn
    ND = 5, -- Ngò §éc
    DM = 6, -- §­êng M«n
    CB = 7, -- C¸i Bang
    TN = 8, -- Thiªn NhÉn
    VD = 9, -- Vâ §ang
    CL = 10, -- C«n L«n
    HS = 11, -- Hoa S¬n
    VH = 12, -- Vâ Hån
    TD = 13 -- Tiªu Dao
}
tbMonPhai.tbFacInfo = { -- Thong tin tong hop
    [tbMonPhai.tbFacList.TL] = {
        szPinyin = "shaolin",
        szName = "ThiÕu L©m",
        tbPlaWeapon = {{"Anh Hµo La H¸n TriÒn Thñ", 8483}, {"Anh Hµo PhËt §µ T¨ng C«n", 8493},
                       {"Anh Hµo Kim Cang Giíi §ao", 8503}},
        tbGoldWeapon = {6, 11},
        tbGoldEquip = {
            [1] = "ThiÕu L©m QuyÒn",
            [2] = "ThiÕu L©m C«n",
            [3] = "ThiÕu L©m §ao"
        },
        tbMasks = {
            nStart = 4608,
            nEnd = 4610
        },
        tbPrivateEquip = {769, 771, 776}
    },
    [tbMonPhai.tbFacList.TV] = {
        szPinyin = "tianwang",
        szName = "Thiªn V­¬ng",
        tbPlaWeapon = {{"Anh Hµo Tö Kim Chïy", 8513}, {"Anh Hµo Hæ §Çu Th­¬ng", 8523},
                       {"Anh Hµo §¹i Lùc B¶o §ao", 8533}},
        tbGoldWeapon = {16, 21, 26},
        tbGoldEquip = {
            [4] = "Thiªn V­¬ng Chuú",
            [5] = "Thiªn V­¬ng Th­¬ng",
            [6] = "Thiªn V­¬ng §ao"
        },
        tbMasks = {
            nStart = 4611,
            nEnd = 4613
        },
        tbPrivateEquip = {793}
    },
    [tbMonPhai.tbFacList.NM] = {
        szPinyin = "emei",
        szName = "Nga Mi",
        tbPlaWeapon = {{"Anh Hµo V« S¾c Tr­êng KiÕm", 8543}, {"Anh Hµo TuyÕt S¾c TriÒn Thñ", 8553}},
        tbGoldWeapon = {31},
        tbGoldEquip = {
            [7] = "Nga Mi KiÕm",
            [8] = "Nga Mi Ch­ëng",
            [9] = "Nga Mi Buff"
        },
        tbMasks = {
            nStart = 4614,
            nEnd = 4615
        },
        tbPrivateEquip = {796, 801, 808}
    },
    [tbMonPhai.tbFacList.TY] = {
        szPinyin = "cuiyan",
        szName = "Thuý yªn",
        tbPlaWeapon = {{"Anh Hµo Tè La §ao", 8563}, {"Anh Hµo BÝch La Uyªn ¦¬ng§ao", 8573}},
        tbGoldWeapon = {46},
        tbGoldEquip = {
            [10] = "Thuý Yªn §¬n §ao",
            [11] = "Thuý Yªn Song §ao"
        },
        tbMasks = {
            nStart = 4616,
            nEnd = 4617
        },
        tbPrivateEquip = {811, 816}
    },
    [tbMonPhai.tbFacList.ND] = {
        szPinyin = "wudu",
        szName = "Ngò §éc",
        tbPlaWeapon = {{"Anh Hµo Ban Lan TriÒn Thñ", 8583}, {"Anh Hµo Lôc Quang §éc NhËn", 8593}},
        tbGoldWeapon = {61},
        tbGoldEquip = {
            [12] = "Ngò §éc Ch­ëng",
            [13] = "Ngò §éc §ao",
            [14] = "Ngò §éc Bïa"
        },
        tbMasks = {
            nStart = 4618,
            nEnd = 4619
        },
        tbPrivateEquip = {829, 834}
    },
    [tbMonPhai.tbFacList.DM] = {
        szPinyin = "tangmen",
        szName = "§­êng M«n",
        tbPlaWeapon = {{"Anh Hµo BÝ Linh Phi §ao", 8603}, {"Anh Hµo Tµn V©n TIÔn", 8613},
                       {"Anh Hµo Phi Tinh Tiªu", 8623}},
        tbGoldWeapon = {71, 76, 81},
        tbGoldEquip = {
            [15] = "§­êng M«n Phi §ao",
            [16] = "§­êng M«n Tô TiÔn",
            [17] = "§­êng M«n Phi Tiªu",
            [18] = "§­êng M«n BÉy"
        },
        tbMasks = {
            nStart = 4620,
            nEnd = 4622
        },
        tbPrivateEquip = {843, 854}
    },
    [tbMonPhai.tbFacList.CB] = {
        szPinyin = "gaibang",
        szName = "C¸i Bang",
        tbPlaWeapon = {{"Anh Hµo Tr­êng Phong TriÒn Thñ", 8633}, {"Anh Hµo Liªn Hoa Tr­îng", 8643}},
        tbGoldWeapon = {96},
        tbGoldEquip = {
            [19] = "C¸i Bang Ch­ëng",
            [20] = "C¸i Bang Bæng"
        },
        tbMasks = {
            nStart = 4623,
            nEnd = 4624
        },
        tbPrivateEquip = {855}
    },
    [tbMonPhai.tbFacList.TN] = {
        szPinyin = "tianren",
        szName = "Thiªn NhÉn",
        tbPlaWeapon = {{"Anh Hµo LÖ ¢m Th­¬ng", 8653}, {"Anh Hµo NghiÖp Háa §ao", 8663}},
        tbGoldWeapon = {101},
        tbGoldEquip = {
            [21] = "Thiªn NhÉn KÝch",
            [22] = "Thiªn NhÉn §ao",
            [23] = "Thiªn NhÉn Bïa"
        },
        tbMasks = {
            nStart = 4625,
            nEnd = 4626
        },
        tbPrivateEquip = {868, 874, 876}
    },
    [tbMonPhai.tbFacList.VD] = {
        szPinyin = "wudang",
        szName = "Vâ §ang",
        tbPlaWeapon = {{"Anh Hµo Th¸i Cùc KiÕm", 8673}, {"Anh Hµo Linh Ch©n KiÕm", 8683}},
        tbGoldWeapon = {116, 121},
        tbGoldEquip = {
            [24] = "Vâ §ang KhÝ",
            [25] = "Vâ §ang KiÕm"
        },
        tbMasks = {
            nStart = 4627,
            nEnd = 4628
        },
        tbPrivateEquip = {881, 888}
    },
    [tbMonPhai.tbFacList.CL] = {
        szPinyin = "kunlun",
        szName = "C«n L«n",
        tbPlaWeapon = {{"Anh Hµo B¹ch Hång §ao", 8693}, {"Anh Hµo Tö §iÖn KiÕm", 8703}},
        tbGoldWeapon = {126},
        tbGoldEquip = {
            [26] = "C«n L«n §ao",
            [27] = "C«n L«n KiÕm",
            [28] = "C«n L«n Bïa"
        },
        tbMasks = {
            nStart = 4629,
            nEnd = 4630
        },
        tbPrivateEquip = {891, 898, 901}
    },
    [tbMonPhai.tbFacList.HS] = {
        szPinyin = "huashan",
        szName = "Hoa S¬n",
        tbPlaWeapon = {{"Anh Hµo Th­¬ng Lan KiÕm", 8713}, {"Anh Hµo BÝch Hoa KiÕm", 8723}}
    },
    [tbMonPhai.tbFacList.VH] = {
        szPinyin = "wuhun",
        szName = "Vâ Hån",
        tbPlaWeapon = {{"Anh Hµo B¸ KhÝ ThuÉn", 8733}, {"Anh Hµo Uy Vò §ao", 8743}}
    },
    [tbMonPhai.tbFacList.TD] = {
        szPinyin = "xiaoyao",
        szName = "Tiªu Dao",
        tbPlaWeapon = {{"Anh Hµo Chi Di T¾c CÇm", 8753}, {"Anh Hµo Chi Hoa Èn KiÕm", 8763}}
    }
}
tbMonPhai.tbMisc = { -- Ngu hanh - ngoai trang - pk ...
    [0] = {
        szNgoaiTrang = "NPC",
        tbSeries = {"Kim", "yellow"},
        tbPK_Status = {"LuyÖn c«ng (Tr¾ng)", "white"}
    },
    [1] = {
        szNgoaiTrang = "Mò",
        tbSeries = {"Méc", "green"},
        tbPK_Status = {"ChÝnh Ph¸i (Vµng)", "orange"}
    },
    [2] = {
        szNgoaiTrang = "¸o",
        tbSeries = {"Thuû", "blue"},
        tbPK_Status = {"Tµ Ph¸i (TÝm)", "pink"}
    },
    [3] = {
        szNgoaiTrang = "Vò khÝ",
        tbSeries = {"Ho¶", "red"},
        tbPK_Status = {"Trung LËp (Xanh)", "green"}
    },
    [4] = {
        szNgoaiTrang = "Ngùa",
        tbSeries = {"Thæ", "orange"},
        tbPK_Status = {"S¸t Thñ (§á)", "red"}
    }
}

function tbMonPhai:Define() -- Dinh nghia table
    self.tbFacName = {} -- Ten MP
    self.tbPlaWeapon = {} -- VK Bach Kim
    self.tbGoldWeapon = {} -- VK Hoang Kim
    self.tbGoldEquip = {} -- Trang bi Hoang Kim
    self.tbPinyn = {} -- Ten Pinyn
    self.tbMasks = {} -- Mat na
    self.tbSeries = {} -- Ngu hanh
    self.tbPK_Status = {} -- Trang thai PK
    self.tbNgoaiTrang = {} -- Ngoai trang trang bi
    -- self.tbShortName = {} -- {Ten viet tat, Ten Pinyn}
    self.tbPrivateEquip = {} -- Trang bi Hoang Kim an 
    for id, tbInfo in self.tbFacInfo do
        self.tbFacName[id] = tbInfo.szName
        self.tbPlaWeapon[id] = tbInfo.tbPlaWeapon
        self.tbGoldWeapon[id] = tbInfo.tbGoldWeapon
        self.tbGoldEquip[id] = tbInfo.tbGoldEquip
        self.tbPrivateEquip[id] = tbInfo.tbPrivateEquip
        self.tbPinyn[tbInfo.szPinyin] = {id, tbInfo.szName}
        self.tbMasks[id] = tbInfo.tbMasks
    end
    for id, tbInfo in tbMonPhai.tbMisc do
        self.tbSeries[id] = tbInfo.tbSeries
        self.tbPK_Status[id] = tbInfo.tbPK_Status
        self.tbNgoaiTrang[id] = tbInfo.szNgoaiTrang
    end
    -- for key, id in self.tbFacList do
    --     self.tbShortName[id] = {key, self.tbFacInfo[id].szPinyin}
    -- end
end
tbMonPhai:Define()
