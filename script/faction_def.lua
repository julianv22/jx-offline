-- ע�⣺�������ɵĶ��壬�����lua�ģ�C++�Ķ�����\settings\faction_settings.ini
tbFacDef = {}
tbFacDef.nMaxFac = 13
tbFacDef.tbIds = {
    SHAOLIN = 0,
    TIANWANG = 1,
    TANGMEN = 2,
    WUDU = 3,
    EMEI = 4,
    CUIYAN = 5,
    GAIBANG = 6,
    TIANREN = 7,
    WUDANG = 8,
    KUNLUN = 9,
    HUASHAN = 10,
    WUHUN = 11,
    XIAOYAO = 12
}

tbFacDef.tbSchools = {
    [1] = "Thi�u L�m quy�n ph�p",
    [2] = "Thi�u L�m c�n ph�p",
    [3] = "Thi�u L�m �ao ph�p",
    [4] = "Thi�n V��ng ch�y ph�p",
    [5] = "Thi�n V��ng th��ng ph�p",
    [6] = "Thi�n V��ng �ao ph�p",
    [7] = "Nga Mi ki�m ph�p",
    [8] = "Nga Mi ch��ng ph�p",
    [9] = "Th�y Y�n �ao ph�p",
    [10] = "Th�y Y�n song �ao",
    [11] = "Ng� ��c ch��ng ph�p",
    [12] = "Ng� ��c �ao ph�p",
    [13] = "���ng M�n Phi �ao",
    [14] = "���ng M�n n� ti�n",
    [15] = "���ng M�n phi ti�u",
    [16] = "C�i Bang ch��ng ph�p",
    [17] = "C�i Bang c�n ph�p",
    [18] = "Thi�n Nh�n m�u ph�p",
    [19] = "Thi�n Nh�n �ao ph�p",
    [20] = "V� �ang quy�n ph�p",
    [21] = "V� �ang ki�m ph�p",
    [22] = "C�n L�n �ao ph�p",
    [23] = "C�n L�n ki�m ph�p",
    [24] = "Hoa S�n kh� t�ng",
    [25] = "Hoa S�n ki�m t�ng",
    [26] = "V� H�n Thu�n Ph�p",
    [27] = "V� H�n �ao Ph�p",
    [28] = "Ti�u Dao Ki�m Ph�p",
    [29] = "Ti�u Dao C�m Ph�p"
}

tbFacDef.tbWholeInfoList = {
    --      [tbFacDef.tbIds.SHAOLIN] = {-- 
    --          ������, ����ID, ��Ӫ,   ͷ��ID, ����
    --          ����ID, 
    --          137�ı���,  137������ֵ,        // ����һ����˵���㲻��������ʲô�ģ����ŵ�ʱ������
    --          ����Tab,
    --          ���Ź���,
    --      },
    [tbFacDef.tbIds.SHAOLIN] = { -- ����
        szFacName = "shaolin",
        szFacChName = "Thi�u L�m ph�i",
        szFacShortName = "Thi�u L�m",
        szFacShortEng = "sl",
        nFacNumb = tbFacDef.tbIds.SHAOLIN,
        nCamp = 1,
        nRankId = 72,
        nSeries = 0,
        nTaskId_Fact = 7,
        nTaskId_90Skill = 122,
        nTaskId_137 = 137,
        nValue_137 = 67,
        n150TaskStep = 6,
        nJinjieSkillID = 1220,
        nFactionMapId = 103,
        tbFactionMapPos = {1845, 2983},
        szMsg = "K� t� h�m nay %s gia nh�p m�n ph�i Thi�u L�m, sau n�y nh� c�c huynh ch� gi�o!",
        tbSkillID = {
            [10] = {14, -- ��������[14]
            10 -- ��շ�ħ[10]�����ţ�
            },
            [20] = {8, -- ����ȭ��[8]
            4, -- ���ֹ���[4]��10����
            6 -- ���ֵ���[6]��10����
            },
            [30] = {15 -- ��������[15]��20����
            },
            [40] = {16 -- �޺���[16]��30����
            },
            [50] = {20 -- ʨ�Ӻ� [20]��40����
            },
            [60] = {271, -- ��צ��ץ[271]
            11, -- ��ɨ���� [11]��50����
            19 -- Ħڭ���� [19]��50����
            },
            [70] = {273, -- ����ǧҶ[273]
            21 -- �׽[21]��60����
            },
            [90] = {{318, 1, "Quy�n ph�p", "��t Ma �� Giang"}, -- ��Ħ�ɽ�[318]            ��������ȼ��� �������Ϊ1��
                    {319, 1, "C�n ph�p", "Ho�nh T�o Thi�n Qu�n"}, -- ��ɨǧ��[319]��90����
            {321, 1, "�ao ph�p", "V� T��ng Tr�m "} -- ����ն  [321]��90����
            },
            [120] = {{709, 1, "Th�ng d�ng", "��i Th�a Nh� Lai Ch�"}},
            [150] = {{1055, 1, "Quy�n ph�p", "��i L�c Kim Cang Ch��ng"}, -- ���������[318]          ��������ȼ��� �������Ϊ1��
                     {1056, 1, "C�n ph�p", "Vi �� Hi�n X�"}, -- Τ������[319]��90����
            {1057, 1, "�ao ph�p", "Tam Gi�i Quy Thi�n"}, -- �������[321]��90����
            {1220, 1, "Kim Quy�n La H�n"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Thi�u L�m Quy�n Ph�p. Quy�n 1", 56}, {"Thi�u L�m C�n ph�p. Quy�n 2", 57},
                             {"Thi�u L�m �ao ph�p. Quy�n 3", 58}}
        }
    },

    [tbFacDef.tbIds.TIANWANG] = { -- ����
        szFacName = "tianwang",
        szFacChName = "Thi�n V��ng Bang",
        szFacShortName = "Thi�n V��ng",
        szFacShortEng = "tw",
        nFacNumb = tbFacDef.tbIds.TIANWANG,
        nCamp = 3,
        nRankId = 69,
        nSeries = 0,
        nTaskId_Fact = 3,
        nTaskId_90Skill = 121,
        nTaskId_137 = 137,
        nValue_137 = 63,
        n150TaskStep = 4,
        nJinjieSkillID = 1221,
        nFactionMapId = 59,
        tbFactionMapPos = {1552, 3188},
        szMsg = "K� t� h�m nay %s gia nh�p Thi�n V��ng, nh� c�c s� huynh ch� gi�o!",
        tbSkillID = {
            [10] = {34, -- ����ն[34]  �����ţ�
            30, -- �ط�����[30]�����ţ�
            29 -- ն����[29]  �����ţ�
            },
            [20] = {26, -- ��������[26]��10����
            23, -- ����ǹ��[23]��10����
            24 -- ��������[24]��10����
            },
            [30] = {33 -- ���ľ�[33]  ��20����
            },
            [40] = {37, -- �÷�ն  [37]��30����
            35, -- ��������[35]��30����
            31 -- ���ƾ�  [31]��30����
            },
            [50] = {40 -- �ϻ��  [40]��40����
            },
            [60] = {42 -- ������  [42]��50����
            },
            [70] = {32, -- ����ն  [32] ��60����
            36, -- ����ս��[36]�����ɣ�
            41, -- Ѫս�˷�[41] ��60����
            324 -- ������  [324]��60����
            },
            [90] = {{325, 1, "Ch�y ph�p", "Truy Phong Quy�t "}, -- ׷���  ��90����
            {323, 1, "Th��ng ph�p", "Truy Tinh Tr�c Nguy�t "}, -- ׷�����£�90����
            {322, 1, "�ao ph�p", "Ph� Thi�n Tr�m "} -- ����ն  ��90����
            },
            [120] = {{708, 1, "Th�ng d�ng", "��o H� Thi�n"} --
            },
            [150] = {{1059, 1, "Ch�y ph�p", "Tung Ho�nh B�t Hoang"}, -- �ݺ�˻�
            {1060, 1, "Th��ng ph�p", "B� V��ng T�m Kim"}, -- �����ɽ�
            {1058, 1, "�ao ph�p", "H�o H�ng Tr�m"}, -- ����ն
            {1221, 1, "Chinh Chi?n B�t Ph��ng"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Thi�n V��ng Ch�y Ph�p. Quy�n 1", 37},
                             {"Thi�n V��ng Th��ng ph�p. Quy�n 2", 38}, {"Thi�n V��ng �ao ph�p.Quy�n 3", 39}}
        }
    },

    [tbFacDef.tbIds.TANGMEN] = { -- ����
        szFacName = "tangmen",
        szFacChName = "���ng M�n",
        szFacShortName = "���ng M�n",
        szFacShortEng = "tm",
        nFacNumb = tbFacDef.tbIds.TANGMEN,
        nCamp = 3,
        nRankId = 76,
        nSeries = 1,
        nTaskId_Fact = 2,
        nTaskId_90Skill = 123,
        nTaskId_137 = 137,
        nValue_137 = 62,
        n150TaskStep = 7,
        nJinjieSkillID = 1223,
        nFactionMapId = 25,
        tbFactionMapPos = {3982, 5235},
        szMsg = "K� t� h�m nay, %s gia nh�p ���ng m�n, c�m phi�n c�c s� huynh s� t� ch� gi�o!",
        tbSkillID = {
            [10] = {45 -- ������[45 ]�����ţ�
            },
            [20] = {43, -- ���Ű���[43 ]��10����
            347 -- �����[347]��10����
            },
            [30] = {303 -- ���̹�  [303]��20����
            },
            [40] = {50, -- ׷�ļ�  [50 ]��30����
            54, -- ���컨��[54 ]��30����
            47, -- �����  [47 ]��30����
            343 -- ���Ĵ�  [343]��30����
            },
            [50] = {345 -- ������  [345]��40����
            },
            [60] = {349 -- �׻���[349]��50����
            },
            [70] = {249, -- С��ɵ�[249]��60����
            48, -- ����  [48 ]�����ɣ�
            58, -- ���޵���[58 ]��60����
            341 -- ɢ����  [341]��60����
            },
            [90] = {{339, 1, "Phi �ao", "Nhi�p H�n Nguy�t �nh"}, -- �����Ӱ[339]��90����
            {302, 1, "N� ti�n", "B�o V� L� Hoa"}, -- �����滨[302]��90����
            {342, 1, "Phi Ti�u", "C�u Cung Phi Tinh"}, -- �Ź�����[342]��90����
            {351, 0, "Th�ng d�ng", "Lo�n Ho�n K�ch"} -- �һ���  [351]��90����
            },
            [120] = {{710, 1, "Th�ng d�ng", "M� �nh Tung"}},
            [150] = {{1069, 1, "Phi �ao", "V� �nh Xuy�n"}, -- ��Ӱ��
            {1070, 1, "N� ti�n", "Thi�t Li�n T� S�t"}, -- ������ɱ
            {1071, 1, "Phi Ti�u", "C�n Kh�n Nh�t Tr�ch"}, -- Ǭ��һ��
            {1110, 0, "Th�ng d�ng", "T�ch L�ch Lo�n Ho�n K�ch"}, -- �����һ���
            {1223, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Phi �ao thu�t. Nhi�p H�n Nguy�t �nh", 45},
                             {"T� Ti�n thu�t. B�o V� L� Hoa", 27}, {"Phi Ti�u thu�t. C�u Cung Phi Tinh", 46},
                             {"H�m T�nh thu�t.Lo�n Ho�n K�ch", 28}}
        }
    },

    [tbFacDef.tbIds.WUDU] = { -- �嶾
        szFacName = "wudu",
        szFacChName = "Ng� ��c Gi�o",
        szFacShortName = "Ng� ��c",
        szFacShortEng = "wu",
        nFacNumb = tbFacDef.tbIds.WUDU,
        nCamp = 2,
        nRankId = 80,
        nSeries = 1,
        nTaskId_Fact = 10,
        nTaskId_90Skill = 124,
        nTaskId_137 = 137,
        nValue_137 = 70,
        n150TaskStep = 5,
        nJinjieSkillID = 1222,
        nFactionMapId = 183,
        tbFactionMapPos = {1746, 2673},
        szMsg = "K� t� h�m nay, %s gia nh�p m�n Ng� ��c gi�o, c�m phi�n c�c s� huynh s� t� ch� gi�o!",
        tbSkillID = {
            [10] = {63, -- ��ɰ��  [63]�����ţ�
            65 -- Ѫ����ɱ[65]�����ţ�
            },
            [20] = {62, -- �嶾�Ʒ�[62]��10����
            60, -- �嶾����[60]��10����
            67 -- �������[67]��10����
            },
            [30] = {70, -- ����ʴ��[70]��20����
            66 -- ����ҩ��[66]��20����
            },
            [40] = {68, -- ��ڤ����[68 ]��30����
            384, -- �ٶ�����[384]��30����
            64, -- ��������[64 ]��30����
            69 -- ���ι�  [69]��30����
            },
            [50] = {356, -- �����Ƽ�  [356]��40����
            73 -- ���ʴ��[73 ]��40����
            },
            [60] = {72 -- ���Ķ���[72]��50����
            },
            [70] = {71, -- ���ɷ��[71 ]��60����
            75, -- �嶾�澭[75]�����ɣ�
            74 -- �����ڤ  [74 ]��60����
            },
            [90] = {{353, 1, "Ch��ng ph�p", "�m Phong Th�c C�t "}, -- ����ʴ��[353]��90����
            {355, 1, "�ao ph�p", "Huy�n �m Tr�m "}, -- ����ն  [355]��90����
            {390, 0, "Th�ng d�ng", "�o�n C�n H� C�t "} -- �Ͻ��[390]��90����
            },
            [120] = {{711, 1, "Th�ng d�ng", "H�p Tinh Y�m"}},
            [150] = {{1066, 1, "Ch��ng ph�p", ""}, -- ��������
            {1067, 1, "�ao ph�p", ""}, -- �Ļ���Ӱ
            {1222, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Ng� ��c Ch��ng Ph�p. Quy�n 1", 47}, {"Ng� ��c �ao ph�p. Quy�n 2", 48},
                             {"Ng� ��c Nhi�p T�m thu�t. Quy�n 3", 49}}
        }
    },

    [tbFacDef.tbIds.EMEI] = { -- ��ü
        szFacName = "emei",
        szFacChName = "Nga My ph�i",
        szFacShortName = "Nga Mi",
        szFacShortEng = "em",
        nFacNumb = tbFacDef.tbIds.EMEI,
        nCamp = 1,
        nRankId = 64,
        nSeries = 2,
        nTaskId_Fact = 1,
        nTaskId_90Skill = 125,
        nTaskId_137 = 137,
        nValue_137 = 61,
        n150TaskStep = 7,
        nJinjieSkillID = 1224,
        nFactionMapId = 13,
        tbFactionMapPos = {1898, 4978},
        szMsg = "K� t� h�m nay, %s gia nh�p Nga My ph�i, c�m phi�n c�c s� t� ch� gi�o",
        tbSkillID = {
            [10] = {85, -- һҶ֪��[85]�����ţ�
            80 -- Ʈѩ����[80]�����ţ�
            },
            [20] = {77, -- ���ҽ���[77]��10����
            79 -- �����Ʒ�[79]��10����
            },
            [30] = {93 -- �Ⱥ��ն�[93]��20����
            },
            [40] = {385, -- �ƴ�����[385]��30����
            82, -- ����ͬ��[82]��30����
            89 -- �ε�    [89]��30����
            },
            [50] = {86 -- ��ˮ    [86 ]��40����
            },
            [60] = {92 -- ���Ĵ���[92]��50����
            },
            [70] = {88, -- ���𲻾�[88]��60����
            252, -- ���ޱ�[252]�����ɣ�
            91, -- �������[91]��60����
            282 -- ������[282]��60����                          
            },
            [90] = {{328, 1, "Ki�m ph�p", "Tam Nga T� Tuy�t "}, -- ������ѩ[328]��90����
            {380, 1, "Ch��ng ph�p", "Phong S��ng To�i �nh "}, -- ��˪��Ӱ[380]��90����
            {332, 0, "Th�ng d�ng", "Ph� �� Ch�ng Sinh "} -- �ն�����[332]��90����
            },
            [120] = {{712, 1, "Th�ng d�ng", "B� Nguy�t Ph�t Tr�n"}},
            [150] = {{1061, 1, "Ki�m ph�p", "Ki�m Hoa V�n Tinh"}, -- �����쾧
            {1062, 1, "Ch��ng ph�p", "B�ng V� L�c Tinh"}, -- ������
            {1114, 1, "H� tr�", "Ng�c Tuy�n T�m Kinh"}, -- ��Ȫ�ľ�
            {1224, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Di�t Ki�m M�t T�ch", 42}, {"Nga Mi  Ph�t Quang Ch��ng M�t T�ch", 43},
                             {"Ph� �� M�t T�ch", 59}}
        }
    },

    [tbFacDef.tbIds.CUIYAN] = { -- ����
        szFacName = "cuiyan",
        szFacChName = "Th�y Y�n m�n",
        szFacShortName = "Th�y Y�n",
        szFacShortEng = "cy",
        nFacNumb = tbFacDef.tbIds.CUIYAN,
        nCamp = 3,
        nRankId = 67,
        nSeries = 2,
        nTaskId_Fact = 6,
        nTaskId_90Skill = 126,
        nTaskId_137 = 137,
        nValue_137 = 66,
        n150TaskStep = 6,
        nJinjieSkillID = 1225,
        nFactionMapId = 154,
        tbFactionMapPos = {403, 1361},
        szMsg = "K� t� h�m nay, %s gia nh�p Th�y Y�n m�n, c�m phi�n c�c s� t� ch� gi�o!",
        tbSkillID = {
            [10] = {99, -- �绨ѩ��[99 ]�����ţ�
            102 -- ����ѩ[102]�����ţ�
            },
            [20] = {95, -- ���̵���[95 ]��10����
            97 -- ����˫��[97 ]��10����
            },
            [30] = {269 -- ����ٻӰ[269]��20����
            },
            [40] = {105, -- ����滨[105]��30����
            113 -- ����ɢѩ[113]��30����
            },
            [50] = {100 -- ���庮��[100]��30����
            },
            [60] = {109 -- ѩӰ    [109]��40����
            },
            [70] = {108, -- ��Ұ����[108]��60����
            114, -- ����ѩ��[114]�����ɣ�
            111 -- �̺�����[111]��60����
            },
            [90] = {{336, 1, "�ao ph�p", "B�ng Tung V� �nh "}, -- ������Ӱ[336]��90����
            {337, 1, "Song �ao", "B�ng T�m Ti�n T�  "} -- ��������[337]��90����
            },
            [120] = {{713, 1, "Th�ng d�ng", "Ng� Tuy�t �n"}},
            [150] = {{1063, 1, "�ao ph�p", "B�ng T��c Ho�t K�"}, -- ��ȸԽ֦
            {1065, 1, "Song �ao", "Th�y Anh Man T�"}, -- ˮӳ����
            {1225, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Th�y Y�n �ao ph�p", 40}, {"Th�y Y�n song �ao", 41}}
        }
    },

    [tbFacDef.tbIds.GAIBANG] = { -- ؤ��
        szFacName = "gaibang",
        szFacChName = "C�i Bang",
        szFacShortName = "C�i Bang",
        szFacShortEng = "gb",
        nFacNumb = tbFacDef.tbIds.GAIBANG,
        nCamp = 1,
        nRankId = 78,
        nSeries = 3,
        nTaskId_Fact = 8,
        nTaskId_90Skill = 128,
        nTaskId_137 = 137,
        nValue_137 = 68,
        n150TaskStep = 9,
        nJinjieSkillID = 1227,
        nFactionMapId = 115,
        tbFactionMapPos = {1501, 3672},
        szMsg = "K� t� h�m nay, %s gia nh�p C�i Bang, c�m phi�n c�c ti�n b�i ch� gi�o!",
        tbSkillID = {
            [10] = {122, -- ��������[122]�����ţ�
            119 -- �����в�[119]�����ţ�
            },
            [20] = {116, -- ؤ���Ʒ�[116]��10����
            115 -- ؤ�����[115]��10����
            },
            [30] = {129 -- ����Ϊ��[129]��20����
            },
            [40] = {274, -- ������[274]��30����
            124 -- ����[124]��30����
            },
            [50] = {277 -- ��������[277]��40��
            },
            [60] = {128, -- �����л�[128]��50����
            125 -- �����[125]��50����
            },
            [70] = {130, -- �������[130]�����ɣ�
            360 -- ��ң��[360]��60����
            },
            [90] = {{357, 1, "Ch��ng ph�p", "Phi Long T�i Thi�n "}, -- ��������[357]��90����
            {359, 1, "B�ng ph�p", "Thi�n H� V� C�u "} -- �����޹�[359]��90����
            },
            [120] = {{714, 1, "Th�ng d�ng", "H�n Thi�n Kh� C�ng"}},
            [150] = {{1073, 1, "Ch��ng ph�p", "Th�i Th�ng L�c Long"}, -- ʱ������
            {1074, 1, "B�ng ph�p", "B�ng Hu�nh L��c ��a"}, -- �����ӵ�
            {1227, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"C�i Bang ch��ng ph�p", 54}, {"C�i Bang c�n ph�p", 55}}
        }
    },

    [tbFacDef.tbIds.TIANREN] = { -- ����
        szFacName = "tianren",
        szFacChName = "Thi�n Nh�n Gi�o",
        szFacShortName = "Thi�n Nh�n",
        szFacShortEng = "tr",
        nFacNumb = tbFacDef.tbIds.TIANREN,
        nCamp = 2,
        nRankId = 81,
        nSeries = 3,
        nTaskId_Fact = 4,
        nTaskId_90Skill = 127,
        nTaskId_137 = 137,
        nValue_137 = 64,
        n150TaskStep = 9,
        nJinjieSkillID = 1226,
        nFactionMapId = 49,
        tbFactionMapPos = {1644, 3215},
        szMsg = "K� t� h�m nay, %s gia nh�p Thi�n Nh�n gi�o, b�i ki�n c�c s� huynh s� t�!",
        tbSkillID = {
            [10] = {135, -- ������Ѫ[135]�����ţ�
            145 -- ��ָ����[145]�����ţ�
            },
            [20] = {132, -- ����ì��[132]��10����
            131, -- ���̵���[131]��10����
            136 -- �������[136]��10����
            },
            [30] = {137 -- ��Ӱ�ɺ�[137]��20����
            },
            [40] = {141, -- �һ�����[141]��30����
            138, -- ��ɽ�[138]��30����
            140 -- �ɺ��޼�[140]��30����
            },
            [50] = {364 -- �������[364]��40����
            },
            [60] = {143 -- ��ħ���[143]��50����
            },
            [70] = {142, -- ͵�컻��[142]��60����
            150, -- ��ħ����[150]�����ɣ�
            148 -- ħ����ɱ[148]��60����
            },
            [90] = {{361, 1, "Th��ng ph�p", "V�n Long K�ch"}, -- ������  [361]��90����
            {362, 1, "�ao ph�p", "Thi�n Ngo�i L�u Tinh"}, -- ��������[362]��90����
            {391, 0, "Th�ng d�ng", "Nhi�p H�n Lo�n T�m "} -- �������[391]��90����
            },
            [120] = {{715, 1, "Th�ng d�ng", "Ma �m Ph� Ph�ch"}},
            [150] = {{1075, 1, "Th��ng ph�p", "Giang H�i N� Lan"}, -- ����ŭ��
            {1076, 1, "�ao ph�p", "T�t H�a Li�u Nguy�n"}, -- ������ԭ
            {1226, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"V�n Long K�ch. M�u ph�p", 35}, {"L�u Tinh. �ao ph�p", 36},
                             {"Nhi�p H�n. Ch� thu�t", 53}}
        }
    },

    [tbFacDef.tbIds.WUDANG] = { -- �䵱
        szFacName = "wudang",
        szFacChName = "V� �ang ph�i",
        szFacShortName = "V� �ang",
        szFacShortEng = "wd",
        nFacNumb = tbFacDef.tbIds.WUDANG,
        nCamp = 1,
        nRankId = 73,
        nSeries = 4,
        nTaskId_Fact = 5,
        nTaskId_90Skill = 129,
        nTaskId_137 = 137,
        nValue_137 = 65,
        n150TaskStep = 5,
        nJinjieSkillID = 1228,
        nFactionMapId = 81,
        tbFactionMapPos = {1574, 3224},
        szMsg = "K� t� h�m nay, %s gia nh�p V� �ang ph�i, tham ki�n c�c s� huynh s� t�!",
        tbSkillID = {
            [10] = {153, -- ŭ��ָ  [153]�����ţ�
            155 -- �׺�����[155]�����ţ�
            },
            [20] = {152, -- �䵱ȭ��[152]��10����
            151 -- �䵱����[151]��10����
            },
            [30] = {159 -- ������  [159]��30����
            },
            [40] = {164, -- ��������[164]��30����
            158 -- ���ɾ���[158]��30����
            },
            [50] = {160 -- ������  [160]��40����
            },
            [60] = {157 -- ��������[157]��50����
            },
            [70] = {165, -- �����޽�[165]��60����
            166, -- ̫����[166]�����ɣ�
            267 -- ��������[267]��60����
            },
            [90] = {{365, 1, "Quy�n ph�p", "Thi�n ��a V� C�c "}, -- ����޼�[365]��90����
            {368, 1, "Ki�m ph�p", "Nh�n Ki�m H�p Nh�t  "} -- �˽���һ[368]��90����
            },
            [120] = {{716, 1, "Th�ng d�ng", "Xu�t � B�t Nhi�m"}},
            [150] = {{1078, 1, "Quy�n ph�p", "T�o H�a Th�i Thanh"}, -- �컯̫��
            {1079, 1, "Ki�m ph�p", "Ki�m Th�y Tinh H�"}, -- �����Ǻ�
            {1228, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Th�i C�c Quy�n Ph�. Quy�n 3", 33}, {"Th�i C�c Ki�m Ph�. Quy�n 2", 34}}
        }
    },

    [tbFacDef.tbIds.KUNLUN] = { -- ����
     
        szFacChName = "C�n L�n ph�i",
        szFacShortName = "C�n L�n",
        szFacShortEng = "kl",
        nFacNumb = tbFacDef.tbIds.KUNLUN,
        nCamp = 3,
        nRankId = 75,
        nSeries = 4,
        nTaskId_Fact = 9,
        nTaskId_90Skill = 130,
        nTaskId_137 = 137,
        nValue_137 = 69,
        n150TaskStep = 5,
        nJinjieSkillID = 1229,
        nFactionMapId = 131,
        tbFactionMapPos = {1582, 3175},
        szMsg = "K� t� h�m nay, %s gia nh�p C�n L�n ph�i, b�i ki�n c�c v� ��o huynh!",
        tbSkillID = {
            [10] = {169, -- ���編  [169]�����ţ�
            179 -- �������[179]�����ţ�
            },
            [20] = {167, -- ���ص���[167]��10����
            168, -- ���ؽ���[168]��10����
            392, -- ���־�[392]��10����
            171 -- ����  [171]��10����
            },
            [30] = {174 -- ��  [174]��20����
            },
            [40] = {178, -- һ������[178]��30����
            172, -- Ѹ����  [172]��30����
            393, -- ȱ��ID��30����
            173 -- �������[173]��30����
            },
            [50] = {175, -- �ۺ���ѩ[175]��40����
            181 -- ���ķ�  [181]��40����
            },
            [60] = {176, -- ������[176]��50����
            90 -- ���ٻ�Ӱ[90 ]��50����
            },
            [70] = {275, -- ˪������[275]�����ɣ�
            182, -- ��������[182]��60����
            630 -- ��������Ƭ�����������¼���"�����޼�"
            },
            [90] = {{372, 1, "�ao ph�p", "Ng�o Tuy�t Ti�u Phong "}, -- ��ѩХ��[372]��90����
            {375, 1, "Ki�m ph�p", "L�i ��ng C�u Thi�n "}, -- �׶�����[375]��90����
            {394, 0, "Th�ng d�ng", "T�y Ti�n T� C�t"} -- ���ɴ��[394]��90����
            },
            [120] = {{717, 1, "Th�ng d�ng", "L��ng Nghi Ch�n Kh�"}},
            [150] = {{1080, 1, "�ao ph�p", "C�u Thi�n C��ng Phong"}, -- �����
            {1081, 1, "Ki�m ph�p", "Thi�n L�i Ch�n Nh�c"}, -- ��������
            {1229, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Ng� Phong thu�t", 50}, {"Ng� L�i thu�t", 51}, {"Ng� T�m thu�t", 52}}
        }
    },
    [tbFacDef.tbIds.HUASHAN] = { -- ��ɽ
        
        szFacChName = "Hoa S�n ph�i",
        szFacShortName = "Hoa S�n",
        szFacShortEng = "hs",
        nFacNumb = tbFacDef.tbIds.HUASHAN,
        nCamp = 3,
        nRankId = 89,
        nSeries = 2,
        nTaskId_Fact = 3481, -- �����������
        nTaskId_90Skill = 3486, -- 90�����������
        nTaskId_137 = 137, -- ��ʦ�������
        nValue_137 = 71, -- ��ʦ�������ֵ
        n150TaskStep = 9, -- 150����������
        nJinjieSkillID = 1370, -- ���׼���(��Ȼ֮��)
        nFactionMapId = 987,
        tbFactionMapPos = {1346, 3128},
        szMsg = "%s b�t ��u t� h�m nay gia nh�p ph�i Hoa S�n, ��n g�p v� b�i ki�n c�c v� s� huynh, xin c�c v� chi�u c�!",
        tbSkillID = {
            [10] = {1347, -- �׺����(����)
            1372 -- �����ˬ(����)
            },
            [20] = {1349, -- �����ܾ�(10��)
            1374 -- ������  (10��)
            },
            [30] = {1350, -- ���ὣ��(20��)
            1375 -- ���ɰٴ�(20��)
            },
            [40] = {1351, -- ������(30��)
            1376 -- ��������(30��)
            },
            [50] = {1354, -- ϣ�Ľ���(40��)
            1378 -- ����ɽ��(40��)
            },
            [60] = {1355, -- ��������(50��)
            1379 -- ���᳤��(50��)
            },
            [70] = {1358, -- ��������(����)
            1360, -- ����ӭ��(60��)
            1380 -- Ħ�ƽ���(60��)
            },
            [90] = {{1364, 1, "Hoa S�n ki�m t�ng", "�o�t M�nh Li�n Ho�n Tam Ti�n Ki�m"}, -- �����������ɽ�(90��)
                    {1382, 1, "Hoa S�n kh� t�ng", "Ph�ch Th�ch Ph� Ng�c"} -- ��ʯ����(90��)
            },
            [120] = {{1365, 1, "Th�ng d�ng", "T� H� Ki�m Kh�"} -- ��ϼ����(120��)
            },
            [150] = {{1369, 1, "Hoa S�n ki�m t�ng", "C�u ki�m h�p nh�t"}, -- �Ž���һ
            {1384, 1, "Hoa S�n kh� t�ng", "Th�n Quang To�n Nhi�u"}, -- �������
            {1370, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Hoa S�n Ki�m T�ng-�o�t m�nh li�n ho�n tam ti�n ki�m", 4062},
                             {"Hoa S�n Kh� T�ng-B�ch Th�ch Ph� Ng�c", 4063}}
        }
    },
    [tbFacDef.tbIds.WUHUN] = { -- ���
      
        szFacChName = "V� H�n",
        szFacShortName = "V� H�n",
        szFacShortEng = "wh",
        nFacNumb = tbFacDef.tbIds.WUHUN,
        nCamp = 1,
        nRankId = 90,
        nSeries = 3,
        nTaskId_Fact = 4406, -- �����������
        nTaskId_JMDZ = 4405,
        nTaskValue_JMDZ = 30 * 256,
        nTaskId_90Skill = 4407, -- 90�����������
        nTaskId_137 = 137, -- ��ʦ�������
        nValue_137 = 71, -- ��ʦ�������ֵ
        n150TaskStep = 3,
        nJinjieSkillID = 1986, -- ���׼���(���ұ���)
        nFactionMapId = 1042,
        tbFactionMapPos = {1530, 3251},
        szMsg = "%s t� n�y gia nh�p V� H�n, ��n b�i ki�n c�c v� s� huynh, xin c�c v� chi�u c�!",
        tbSkillID = {
            [10] = {1972, -- ��կ����(����)
            1974 -- ��ӧ�ӳ�(����)
            },
            [20] = {1964, -- ����öܷ�(10��)
            1975 -- ����õ���  (10��)
            },
            [30] = {1976 -- ���ұ���(20��)
            },
            [40] = {1965, -- ��ӧ������(30��)
            1977 -- ��ɽ��(30��)
            },
            [50] = {1963, -- ������(40��)
            1979 -- ŭ������(40��)
            },
            [60] = {1980 -- �½���ս��(50��)
            },
            [70] = {1982, -- ������־(����)
            1971, -- ���³���(60��)
            1981 -- ���ͺ�²��(60��)
            },
            [90] = {{1967, 1, "V� H�n h� Thu�n", "Tr�n Bi�n Th�y"}, -- �����(90��)
            {1983, 1, "V� H�n h� �ao", "Kh�t �m Hung N� Huy�t"} -- ������ūѪ(90��)
            },
            [120] = {{1984, 1, "Th�ng d�ng", "Trung Vu L�u Phong"} -- ��������(120��)
            },
            [150] = {{1969, 1, "V� H�n h� Thu�n", "Huy S� Di�t L�"}, -- ��ʦ��²
            {1985, 1, "V� H�n h� �ao", "Tr� Gian Di�t N�nh"}, -- �������
            {1986, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = { -- 90���������������ID,ע�⣡Ҫ�ͼ��ܱ���90�����ܵ�˳��һһ��Ӧ��
            {"V� H�n Thu�n Ph�p#Tr�n Bi�n Th�y", 5106}, {"V� H�n �ao Ph�p#Kh�t �m Hung N� Huy�t", 5107}}
        }
    },
    [tbFacDef.tbIds.XIAOYAO] = { -- ��ң��
        bFactionIsOpen = nil,
        
        szFacChName = "Ph�i Ti�u Dao",
        szFacShortName = "Ti�u Dao",
        szFacShortEng = "xy",
        nFacNumb = tbFacDef.tbIds.XIAOYAO,
        nCamp = 3,
        nRankId = 98,
        nSeries = 4,
        nTaskId_Fact = 4464, -- �����������
        nTaskId_JMDZ = 4463,
        nTaskValue_JMDZ = 40 * 256,
        nTaskId_90Skill = 4465, -- 90�����������
        nTaskId_137 = 137, -- ��ʦ�������
        nValue_137 = 71, -- ��ʦ�������ֵ
        n150TaskStep = 6,
        nJinjieSkillID = 2132, -- �������
        nFactionMapId = 1057,
        tbFactionMapPos = {1584, 3251},
        tbSchools = {28, 29},
        szMsg = "%s t� h�m nay v�o Ph�i Ti�u Dao, nay ��n b�i ki�n c�c v� s� huynh, mong h�y chi�u c�!",
        szSelfCall = "B�n M�n",
        tbSkillID = {
            [10] = {1881, -- �⹳˪ѩ(����) Ng� C�u S��ng Tuy�t
            1905 -- ������(����) T�y � Kh�c
            },
            [20] = {1882, -- ��ң����(10��) Ti�u Dao Ki�m Ph�p
            1906 -- ��ң�ٷ�(10��) Ti�u Dao C�m Ph�p
            },
            [30] = {1883 -- �ƹ�����(20��) Di Cung Ho�n V�
            },
            [40] = {1885, -- ������(30��) T�p ��p L�u Tinh
            1907 -- ����ƽɳ(30��) L�c Nh�n B�nh Sa
            },
            [50] = {1887, -- �н�����(40��) � Ki�m Ph�t Thi�n
            1909 -- ����ɢ(40��) Qu�ng L�ng T�n
            },
            [60] = {1888 -- ��������(50��) Ng�n Y�n B�ch M�
            },
            [70] = {1890, -- ǧ�����(����) Thi�n L� ��c H�nh
            1889 -- ��������(��ʦ) Hi�p C�t Nhu T�nh --tq
            },
            [90] = {{1891, 1, "Ti�u Dao Ki�m T�ng", "Ki�m Quy�t Ph� V�n"}, -- ��������(90��)
            {1910, 1, "Ti�u Dao C�m T�ng", "Cao S�n L�u Th�y "} -- ��ɽ��ˮ(90��)
            },
            [120] = {{1894, 1, "Th�ng d�ng", "�n U�ng No Say"} -- ��˳���(120��)
            },
            [150] = {{1896, 1, "Ti�u Dao Ki�m T�ng", "Th�p B� Nh�t S�t"}, -- ʮ��һɱ
            {1911, 1, "Ti�u Dao C�m T�ng", "Mai Hoa Tam L�ng"}, -- ÷����Ū
            {1901, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = { -- 90���������������ID,ע�⣡Ҫ�ͼ��ܱ���90�����ܵ�˳��һһ��Ӧ��
            {"Ti�u Dao Ki�m Ph�p-Ki�m Quy�t Ph� V�n", 5231}, {"Ti�u Dao C�m Ph�p-Cao S�n L�u Th�y", 5232}},
            tbVipMaskIndex = {
                [1] = 8767, -- �������׻����
                [2] = 8768, -- �޾����׻����
                [3] = 8769, -- �콾���׻����
                [4] = 8781 -- ��˫���׻����
            },
            tbVipWuXingYin = {
                [0] = 8770, -- ����ӡ��
                [1] = 8771, -- 1������ӡ��
                [2] = 8772, -- 2������ӡ��
                [3] = 8773, -- 3������ӡ��
                [4] = 8774, -- 4������ӡ��
                [5] = 8775, -- 5������ӡ��
                [6] = 8776, -- 6������ӡ��
                [7] = 8777, -- 7������ӡ��
                [8] = 8778, -- 8������ӡ��
                [9] = 8779, -- 9������ӡ��
                [10] = 8780 -- 10������ӡ��
            }
        }
    }
}

-- Include("\\script\\faction_def.lua")
-- ע�⣺ȫ���±��Ǵ�0��ʼ
function tbFacDef:MakeDefine()
    self.tbFacNames = {}
    self.tbFacChNames = {}
    self.tbFacShortName = {}
    self.tbCamps = {}
    self.tbRankIds = {}
    self.tbSeriess = {}
    self.tbFacTaskIds = {}
    self.tbTaskId_90Skills = {}
    self.tbTaskId_137s = {}
    self.tbValue_137s = {}
    self.tb150TaskSteps = {}
    self.tbJinjieSkillIDs = {}
    self.tbFacMapIds = {}
    self.tbJoinMsgs = {}
    self.tbSkills = {}
    self.tbItemInfos = {}
    self.tbFacName2TaskId = {}
    self.tbFacName2RankId = {}
    self.tbFacName2FacId = {}
    self.tbFacChName2FacId = {}
    self.tbFacMapPos = {}
    self.tb90Skills = {}
    self.tb120Skills = {}
    self.tb150Skills = {}
    self.tbVipMaskIndexs = {}
    self.tbVipWuXingYins = {}
    for _, tbFactionInfo in self.tbWholeInfoList do
        self.tbFacNames[tbFactionInfo.nFacNumb] = tbFactionInfo.szFacName
        self.tbFacChNames[tbFactionInfo.nFacNumb] = tbFactionInfo.szFacChName
        self.tbFacShortName[tbFactionInfo.nFacNumb] = tbFactionInfo.szFacShortName
        self.tbCamps[tbFactionInfo.nFacNumb] = tbFactionInfo.nCamp
        self.tbRankIds[tbFactionInfo.nFacNumb] = tbFactionInfo.nRankId
        self.tbSeriess[tbFactionInfo.nFacNumb] = tbFactionInfo.nSeries
        self.tbFacTaskIds[tbFactionInfo.nFacNumb] = tbFactionInfo.nTaskId_Fact
        self.tbTaskId_90Skills[tbFactionInfo.nFacNumb] = tbFactionInfo.nTaskId_90Skill
        self.tbTaskId_137s[tbFactionInfo.nFacNumb] = tbFactionInfo.nTaskId_137
        self.tbValue_137s[tbFactionInfo.nFacNumb] = tbFactionInfo.nValue_137
        self.tb150TaskSteps[tbFactionInfo.nFacNumb] = tbFactionInfo.n150TaskStep
        self.tbJinjieSkillIDs[tbFactionInfo.nFacNumb] = tbFactionInfo.nJinjieSkillID
        self.tbFacMapIds[tbFactionInfo.nFacNumb] = tbFactionInfo.nFactionMapId
        self.tbJoinMsgs[tbFactionInfo.nFacNumb] = tbFactionInfo.szMsg

        self.tbSkills[tbFactionInfo.nFacNumb] = tbFactionInfo.tbSkillID

        self.tbItemInfos[tbFactionInfo.nFacNumb] = tbFactionInfo.tbItemInfo

        self.tbFacName2TaskId[tbFactionInfo.szFacName] = tbFactionInfo.nTaskId_Fact
        self.tbFacName2RankId[tbFactionInfo.szFacName] = tbFactionInfo.nRankId
        self.tbFacName2FacId[tbFactionInfo.szFacName] = tbFactionInfo.nFacNumb
        self.tbFacChName2FacId[tbFactionInfo.szFacChName] = tbFactionInfo.nFacNumb

        self.tbFacMapPos[tbFactionInfo.nFacNumb] = {tbFactionInfo.nFactionMapId, tbFactionInfo.tbFactionMapPos[1],
                                                    tbFactionInfo.tbFactionMapPos[2]}

        self.tb90Skills[tbFactionInfo.nFacNumb] = {}
        for _, tbSkillInfo in tbFactionInfo.tbSkillID[90] do
            tinsert(self.tb90Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end
        self.tb120Skills[tbFactionInfo.nFacNumb] = {}
        for _, tbSkillInfo in tbFactionInfo.tbSkillID[120] do
            tinsert(self.tb120Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end
        self.tb150Skills[tbFactionInfo.nFacNumb] = {}
        for _, tbSkillInfo in tbFactionInfo.tbSkillID[150] do
            tinsert(self.tb150Skills[tbFactionInfo.nFacNumb], tbSkillInfo[1])
        end

        -- self.tbVipMaskIndexs[tbFactionInfo.nFacNumb]        = tbFactionInfo.tbItemInfo.tbVipMaskIndex
        -- self.tbVipWuXingYins[tbFactionInfo.nFacNumb]        = tbFactionInfo.tbItemInfo.tbVipWuXingYin
    end
end

tbFacDef:MakeDefine()

function FacName2Id(szFacName)
    for key, value in tbFacDef.tbWholeInfoList do
        if value.szFacChName == szFacName then
            return key
        end
    end

    return -1;
end

function AddFacSkill(nFacId, nLv)
    if nFacId < 0 or nFacId >= tbFacDef.nMaxFac then
        return
    end
    if not tbFacDef.tbSkills[nFacId][nLv] then
        return
    end

    for _, tbSkillInfo in tbFacDef.tbSkills[nFacId][nLv] do
        local nSkillId = 0
        local nSkillLv = 0
        if type(tbSkillInfo) == "table" then
            nSkillId = tbSkillInfo[1]
            nSkillLv = 20 -- tbSkillInfo[2]
        elseif type(tbSkillInfo) == "number" then
            nSkillId = tbSkillInfo
            nSkillLv = 0
        end
        if HaveMagic(nSkillId) == -1 then
            AddMagic(nSkillId, nSkillLv)
            AddSkillEvent(nFacId, nLv, nSkillId, nSkillLv)
        end
    end
    DynamicExecute("\\script\\misc\\eventsys\\eventsys.lua", "EventSys:OnPlayerEvent", "OnLearnSkill", PlayerIndex, nLv)
end
--------------Custom delskill-----------------------------------
function DelFacSkill(nFacId, nLv)
    if nFacId < 0 or nFacId >= tbFacDef.nMaxFac then
        return
    end
    if not tbFacDef.tbSkills[nFacId][nLv] then
        return
    end
    for _, tbSkillInfo in tbFacDef.tbSkills[nFacId][nLv] do
        local nSkillId = 0
        if type(tbSkillInfo) == "table" then
            nSkillId = tbSkillInfo[1]
        elseif type(tbSkillInfo) == "number" then
            nSkillId = tbSkillInfo
        end
        if HaveMagic(nSkillId) ~= -1 then
            DelMagic(nSkillId)
        end
    end
end
-------------------------------------------------------------------

function AddSkillEvent(nFacId, nLv, nSkillId, nSkillLv)
    if nLv == 90 then
        WriteLog("Player Get 90 Skill. szAccount = %s, szName = %s, nFacId = %d, nLv = %d, nSkillId = %d, nSkillLv = %d")
    end
end
