TAB_SET = {
    [0] = "Ho�ng kim m�n ph�i",
    [1] = "Ho�ng kim m�n ph�i �n"
};

TAB_GOLD_SET = {
    [0] = {
        ["Thi�u L�m Quy�n"] = {
            [0] = {1, 5},
            [1] = {647, 651}
        },
        ["Thi�u L�m B�ng"] = {
            [0] = {6, 10},
            [1] = {652, 656}
        },
        ["Thi�u L�m �ao"] = {
            [0] = {11, 15},
            [1] = {542, 546}
        }
    },
    [1] = {
        ["Thi�n V��ng Ch�y"] = {
            [0] = {16, 20},
            [1] = {552, 556}
        },
        ["Thi�n V��ng Th��ng"] = {
            [0] = {21, 25},
            [1] = {547, 551}
        },
        ["Thi�n V��ng �ao"] = {
            [0] = {26, 30},
            [1] = {557, 561}
        }
    },
    [4] = {
        ["Nga My Ki�m"] = {
            [0] = {31, 35},
            [1] = {562, 566}
        },
        ["Nga My Ch��ng"] = {
            [0] = {36, 40},
            [1] = {567, 571}
        },
        ["Nga My Buff"] = {
            [0] = {41, 45}
        }
    },
    [5] = {
        ["Th�y Y�n �ao"] = {
            [0] = {46, 50},
            [1] = {572, 576}
        },
        ["Th�y Y�n Song �ao"] = {
            [0] = {51, 55},
            [1] = {577, 581}
        }
    },
    [3] = {
        ["Ng� ��c Ch��ng"] = {
            [0] = {56, 60},
            [1] = {582, 586}
        },
        ["Ng� ��c �ao"] = {
            [0] = {61, 65},
            [1] = {587, 591}
        },
        ["Ng� ��c B�a"] = {
            [0] = {66, 70}
        }
    },
    [2] = {
        ["���ng M�n Phi �ao"] = {
            [0] = {71, 75},
            [1] = {592, 596}
        },
        ["���ng M�n T� Ti�n"] = {
            [0] = {76, 80},
            [1] = {597, 601}
        },
        ["���ng M�n Phi Ti�u"] = {
            [0] = {81, 85},
            [1] = {602, 606}
        },
        ["���ng M�n B�y"] = {
            [0] = {86, 90}
        }
    },
    [6] = {
        ["C�i Bang Ch��ng"] = {
            [0] = {91, 95},
            [1] = {607, 611}
        },
        ["C�i Bang C�n"] = {
            [0] = {96, 100},
            [1] = {612, 616}
        }
    },
    [7] = {
        ["Thi�n Nh�n K�ch"] = {
            [0] = {101, 105},
            [1] = {617, 621}
        },
        ["Thi�n Nh�n �ao"] = {
            [0] = {106, 110},
            [1] = {622, 626}
        },
        ["Thi�n Nh�n B�a"] = {
            [0] = {111, 115}
        }
    },
    [8] = {
        ["V� �ang Quy�n"] = {
            [0] = {116, 120},
            [1] = {627, 631}
        },
        ["V� �ang Ki�m"] = {
            [0] = {121, 125},
            [1] = {632, 636}
        }
    },
    [9] = {
        ["C�n L�n �ao"] = {
            [0] = {126, 130},
            [1] = {637, 641}
        },
        ["C�n L�n Ki�m"] = {
            [0] = {131, 135},
            [1] = {642, 646}
        },
        ["C�n L�n B�a"] = {
            [0] = {136, 140}
        }
    }
};

TAB_FACTION = {
    [0] = "Thi�u L�m",
    [1] = "Thi�n V��ng",
    [2] = "���ng M�n",
    [3] = "Ng� ��c",
    [4] = "Nga My",
    [5] = "Th�y Y�n",
    [6] = "C�i Bang",
    [7] = "Thi�n Nh�n",
    [8] = "V� �ang",
    [9] = "C�n L�n"

};

function SetTrangBiHoangKim()
    local szTitle = "Ng��i mu�n nh�n trang b� ph�i n�o?";
    local tbOption = {}
    local num_faction = 10
    for i_faction = 0, (num_faction - 1) do
        tinsert(tbOption, format("Trang b� ph�i %s /#AddGold_Faction(%d)", TAB_FACTION[i_faction], i_faction))
    end
    tinsert(tbOption, "Tr� l�i/main")
    tinsert(tbOption, "K�t th�c ��i tho�i./no")
    Say(szTitle, getn(tbOption), tbOption)
    -- CreateNewSayEx(szTitle, tbOption)
end

function AddGold_Faction(i_faction)
    local tb_Equip = TAB_GOLD_SET[i_faction];
    local tbOption = {};
    local szTitle = "M�i ch�n ���ng t�n c�ng c� b�n?";
    for x, y in tb_Equip do
        tinsert(tbOption, x .. "/#AddGold_Skill(" .. i_faction .. ",\"" .. x .. "\")") -- \" �� vi�t d�u nh�y, n�u kh�ng ch� pass k� t�.
        -- tinsert(tbOption, format(%s/#AddGold_Skill(%d, %a), x, i_faction, x))
    end
    tinsert(tbOption, "Tr� l�i./SetTrangBiHoangKim")
    tinsert(tbOption, "K�t th�c ��i tho�i./no")
    Say(szTitle, getn(tbOption), tbOption)
    -- CreateNewSayEx(szTitle, tbOption)
end

function AddGold_Skill(i_faction, skill_style)
    local tb_Equip = TAB_GOLD_SET[i_faction][skill_style]
    local tbOption = {};
    local szTitle = "M�i b�n ch�n set ho�ng kim?";
    -- for nSet = 12, 13 do
    -- for nSet, value in tb_Equip do
    --	tinsert(tbOption, TAB_SET[nSet].."/#AddGold_Set("..value[1]..","..value[2]..")") --tb_Equip[nSet]
    -- end
    for nSet = 0, 1 do
        if tb_Equip[nSet] then
            tinsert(tbOption, TAB_SET[nSet] .. "/#AddGold_Set(" .. tb_Equip[nSet][1] .. "," .. tb_Equip[nSet][2] .. ")")
        end
    end
    tinsert(tbOption, "Tr� l�i./SetTrangBiHoangKim")
    tinsert(tbOption, "K�t th�c ��i tho�i./no")
    Say(szTitle, getn(tbOption), tbOption)
    -- CreateNewSayEx(szTitle, tbOption)	
end

function AddGold_Set(num1, num2)
    if (num2 - num1) <= 10 then
        for nID = num1, num2 do
            AddGoldItem(0, nID)
        end
    else
        Talk(1, "", "Kh�ng th� nh�n qu� nhi�u trang b� 1 l�c.")
    end
end

----------------------Nh�n Tr�n Bang Chi B�o-------------------------------------------------------------
function TBCB()
    local szTitle = "B�n mu�n nh�n Tr�n Bang Chi B�o c�a ph�i n�o?"
    local tbOpt = {"Thi�u L�m/CBTL", "Thi�n V��ng/CBTV", "Nga My/CBNM", "Th�y Y�n/CBTY", "Ng� ��c/CBND",
                   "���ng M�n/CBDM", "C�i Bang/CBCB", "Thi�n Nh�n/CBTN", "V� �ang/CBVD", "C�n L�n/CBCL",
                   "Tr� l�i/main", "Tho�t./no"}
    -- CreateNewSayEx(szTitle, tbOpt)
    Say(szTitle, getn(tbOpt), tbOpt)
end

function CBTL()

    AddGoldItem(0, 769)
    AddGoldItem(0, 771)
    AddGoldItem(0, 776)
end

function CBTV()
    AddGoldItem(0, 793)
end

function CBNM()
    AddGoldItem(0, 796)
    AddGoldItem(0, 801)
    AddGoldItem(0, 808)
end

function CBTY()
    AddGoldItem(0, 811)
    AddGoldItem(0, 816)
end

function CBND()
    AddGoldItem(0, 829)
    AddGoldItem(0, 834)
end

function CBDM()
    AddGoldItem(0, 843)
    AddGoldItem(0, 854)
end

function CBCB()
    AddGoldItem(0, 855)
end

function CBTN()
    AddGoldItem(0, 868)
    AddGoldItem(0, 874)
    AddGoldItem(0, 876)
end

function CBVD()
    AddGoldItem(0, 881)
    AddGoldItem(0, 888)
end

function CBCL()
    AddGoldItem(0, 891)
    AddGoldItem(0, 898)
    AddGoldItem(0, 901)
end
