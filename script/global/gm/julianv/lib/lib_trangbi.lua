------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
----------------------------V� kh� BKMP---------------------------
------------------------------------------------------------------
tbMonPhai = {}
tbMonPhai.FacList = {
    TL = 1, -- Thi�u L�m
    TV = 2, -- Thi�n V��ng
    NM = 3, -- Nga Mi
    TY = 4, -- Thu� y�n
    ND = 5, -- Ng� ��c
    DM = 6, -- ���ng M�n
    CB = 7, -- C�i Bang
    TN = 8, -- Thi�n Nh�n
    VD = 9, -- V� �ang
    CL = 10, -- C�n L�n
    HS = 11, -- Hoa S�n
    VH = 12, -- V� H�n
    TD = 13 -- Ti�u Dao
}
tbMonPhai.tbFactionInfo = {
    [tbMonPhai.FacList.TL] = {
        szPinyin = "shaolin",
        szName = "Thi�u L�m",
        tbPlaWeapon = {{"Anh H�o La H�n Tri�n Th�", 8483}, {"Anh H�o Ph�t �� T�ng C�n", 8493},
                       {"Anh H�o Kim Cang Gi�i �ao", 8503}},
        tbGoldWeapon = {6, 11},
        tbGoldEquip = {
            [1] = "Thi�u L�m Quy�n",
            [2] = "Thi�u L�m C�n",
            [3] = "Thi�u L�m �ao"
        }
    },
    [tbMonPhai.FacList.TV] = {
        szPinyin = "tianwang",
        szName = "Thi�n V��ng",
        tbPlaWeapon = {{"Anh H�o T� Kim Ch�y", 8513}, {"Anh H�o H� ��u Th��ng", 8523},
                       {"Anh H�o ��i L�c B�o �ao", 8533}},
        tbGoldWeapon = {16, 21, 26},
        tbGoldEquip = {
            [4] = "Thi�n V��ng Chu�",
            [5] = "Thi�n V��ng Th��ng",
            [6] = "Thi�n V��ng �ao"
        }
    },
    [tbMonPhai.FacList.NM] = {
        szPinyin = "emei",
        szName = "Nga Mi",
        tbPlaWeapon = {{"Anh H�o V� S�c Tr��ng Ki�m", 8543}, {"Anh H�o Tuy�t S�c Tri�n Th�", 8553}},
        tbGoldWeapon = {31},
        tbGoldEquip = {
            [7] = "Nga Mi Ki�m",
            [8] = "Nga Mi Ch��ng",
            [9] = "Nga Mi Buff"
        }
    },
    [tbMonPhai.FacList.TY] = {
        szPinyin = "cuiyan",
        szName = "Thu� y�n",
        tbPlaWeapon = {{"Anh H�o T� La �ao", 8563}, {"Anh H�o B�ch La Uy�n ��ng�ao", 8573}},
        tbGoldWeapon = {46},
        tbGoldEquip = {
            [10] = "Thu� Y�n ��n �ao",
            [11] = "Thu� Y�n Song �ao"
        }
    },
    [tbMonPhai.FacList.ND] = {
        szPinyin = "wudu",
        szName = "Ng� ��c",
        tbPlaWeapon = {{"Anh H�o Ban Lan Tri�n Th�", 8583}, {"Anh H�o L�c Quang ��c Nh�n", 8593}},
        tbGoldWeapon = {61},
        tbGoldEquip = {
            [12] = "Ng� ��c Ch��ng",
            [13] = "Ng� ��c �ao",
            [14] = "Ng� ��c B�a"
        }
    },
    [tbMonPhai.FacList.DM] = {
        szPinyin = "tangmen",
        szName = "���ng M�n",
        tbPlaWeapon = {{"Anh H�o B� Linh Phi �ao", 8603}, {"Anh H�o T�n V�n TI�n", 8613},
                       {"Anh H�o Phi Tinh Ti�u", 8623}},
        tbGoldWeapon = {71, 76, 81},
        tbGoldEquip = {
            [15] = "���ng M�n Phi �ao",
            [16] = "���ng M�n T� Ti�n",
            [17] = "���ng M�n Phi Ti�u",
            [18] = "���ng M�n B�y"
        }
    },
    [tbMonPhai.FacList.CB] = {
        szPinyin = "gaibang",
        szName = "C�i Bang",
        tbPlaWeapon = {{"Anh H�o Tr��ng Phong Tri�n Th�", 8633}, {"Anh H�o Li�n Hoa Tr��ng", 8643}},
        tbGoldWeapon = {96},
        tbGoldEquip = {
            [19] = "C�i Bang Ch��ng",
            [20] = "C�i Bang B�ng"
        }
    },
    [tbMonPhai.FacList.TN] = {
        szPinyin = "tianren",
        szName = "Thi�n Nh�n",
        tbPlaWeapon = {{"Anh H�o L� �m Th��ng", 8653}, {"Anh H�o Nghi�p H�a �ao", 8663}},
        tbGoldWeapon = {101},
        tbGoldEquip = {
            [21] = "Thi�n Nh�n K�ch",
            [22] = "Thi�n Nh�n �ao",
            [23] = "Thi�n Nh�n B�a"
        }
    },
    [tbMonPhai.FacList.VD] = {
        szPinyin = "wudang",
        szName = "V� �ang",
        tbPlaWeapon = {{"Anh H�o Th�i C�c Ki�m", 8673}, {"Anh H�o Linh Ch�n Ki�m", 8683}},
        tbGoldWeapon = {116, 121},
        tbGoldEquip = {
            [24] = "V� �ang Kh�",
            [25] = "V� �ang Ki�m"
        }
    },
    [tbMonPhai.FacList.CL] = {
        szPinyin = "kunlun",
        szName = "C�n L�n",
        tbPlaWeapon = {{"Anh H�o B�ch H�ng �ao", 8693}, {"Anh H�o T� �i�n Ki�m", 8703}},
        tbGoldWeapon = {126},
        tbGoldEquip = {
            [26] = "C�n L�n �ao",
            [27] = "C�n L�n Ki�m",
            [28] = "C�n L�n B�a"
        }
    },
    [tbMonPhai.FacList.HS] = {
        szPinyin = "huashan",
        szName = "Hoa S�n",
        tbPlaWeapon = {{"Anh H�o Th��ng Lan Ki�m", 8713}, {"Anh H�o B�ch Hoa Ki�m", 8723}}
    },
    [tbMonPhai.FacList.VH] = {
        szPinyin = "wuhun",
        szName = "V� H�n",
        tbPlaWeapon = {{"Anh H�o B� Kh� Thu�n", 8733}, {"Anh H�o Uy V� �ao", 8743}}
    },
    [tbMonPhai.FacList.TD] = {
        szPinyin = "xiaoyao",
        szName = "Ti�u Dao",
        tbPlaWeapon = {{"Anh H�o Chi Di T�c C�m", 8753}, {"Anh H�o Chi Hoa �n Ki�m", 8763}}
    }
}

function tbMonPhai:Define()
    self.tbFacName = {}
    self.tbPlaWeapon = {}
    self.tbGoldWeapon = {}
    self.tbGoldEquip = {}
    self.tbPinyn = {}
    for id, tbInfo in self.tbFactionInfo do
        self.tbFacName[id] = tbInfo.szName
        self.tbPlaWeapon[id] = tbInfo.tbPlaWeapon
        self.tbGoldWeapon[id] = tbInfo.tbGoldWeapon
        self.tbGoldEquip[id] = tbInfo.tbGoldEquip
        self.tbPinyn[tbInfo.szPinyin] = id
    end
end
tbMonPhai:Define()
