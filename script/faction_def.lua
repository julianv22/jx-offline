-- ×¢Òâ£º¸÷¸öÃÅÅÉµÄ¶¨Òå£¬Õâ·ÝÊÇluaµÄ£¬C++µÄ¶¨ÒåÔÚ\settings\faction_settings.ini
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
    [1] = "ThiÕu L©m quyÒn ph¸p",
    [2] = "ThiÕu L©m c«n ph¸p",
    [3] = "ThiÕu L©m ®ao ph¸p",
    [4] = "Thiªn V­¬ng chïy ph¸p",
    [5] = "Thiªn V­¬ng th­¬ng ph¸p",
    [6] = "Thiªn V­¬ng ®ao ph¸p",
    [7] = "Nga Mi kiÕm ph¸p",
    [8] = "Nga Mi ch­ëng ph¸p",
    [9] = "Thóy Yªn ®ao ph¸p",
    [10] = "Thóy Yªn song ®ao",
    [11] = "Ngò §éc ch­ëng ph¸p",
    [12] = "Ngò §éc ®ao ph¸p",
    [13] = "§­êng M«n Phi §ao",
    [14] = "§­êng M«n ná tiÔn",
    [15] = "§­êng M«n phi tiªu",
    [16] = "C¸i Bang ch­ëng ph¸p",
    [17] = "C¸i Bang c«n ph¸p",
    [18] = "Thiªn NhÉn m©u ph¸p",
    [19] = "Thiªn NhÉn ®ao ph¸p",
    [20] = "Vâ §ang quyÒn ph¸p",
    [21] = "Vâ §ang kiÕm ph¸p",
    [22] = "C«n L«n ®ao ph¸p",
    [23] = "C«n L«n kiÕm ph¸p",
    [24] = "Hoa S¬n khÝ t«ng",
    [25] = "Hoa S¬n kiÕm t«ng",
    [26] = "Vâ Hån ThuÉn Ph¸p",
    [27] = "Vâ Hån §ao Ph¸p",
    [28] = "Tiªu Dao KiÕm Ph¸p",
    [29] = "Tiªu Dao CÇm Ph¸p"
}

tbFacDef.tbWholeInfoList = {
    --      [tbFacDef.tbIds.SHAOLIN] = {-- 
    --          ÃÅÅÉÃû, ÃÅÅÉID, ÕóÓª,   Í·ÏÎID, ÊôÐÔ
    --          ÈÎÎñID, 
    --          137µÄ±äÁ¿,  137±äÁ¿µÄÖµ,        // ¾ÍÕâÒ»ÏîÀ´Ëµ£¬¸ã²»Ã÷°×ÊÇ×öÊ²Ã´µÄ£¬ÈëÃÅµÄÊ±ºòÉèÖÃ
    --          ¼¼ÄÜTab,
    --          ÈëÃÅ¹«¸æ,
    --      },
    [tbFacDef.tbIds.SHAOLIN] = { -- ÉÙÁÖ
        szFacName = "shaolin",
        szFacChName = "ThiÕu L©m ph¸i",
        szFacShortName = "ThiÕu L©m",
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
        szMsg = "KÓ tõ h«m nay %s gia nhËp m«n ph¸i ThiÕu L©m, sau nµy nhê c¸c huynh chØ gi¸o!",
        tbSkillID = {
            [10] = {14, -- ÐÐÁú²»Óê[14]
            10 -- ½ð¸Õ·üÄ§[10]£¨ÈëÃÅ£©
            },
            [20] = {8, -- ÉÙÁÖÈ­·¨[8]
            4, -- ÉÙÁÖ¹÷·¨[4]£¨10¼¶£©
            6 -- ÉÙÁÖµ¶·¨[6]£¨10¼¶£©
            },
            [30] = {15 -- ²»¶¯Ã÷Íõ[15]£¨20¼¶£©
            },
            [40] = {16 -- ÂÞººÕó[16]£¨30¼¶£©
            },
            [50] = {20 -- Ê¨×Óºð [20]£¨40¼¶£©
            },
            [60] = {271, -- Áú×¦»¢×¥[271]
            11, -- ºáÉ¨ÁùºÏ [11]£¨50¼¶£©
            19 -- Ä¦Ú­ÎÞÁ¿ [19]£¨50¼¶£©
            },
            [70] = {273, -- ÈçÀ´Ç§Ò¶[273]
            21 -- Ò×½î¾­[21]£¨60¼¶£©
            },
            [90] = {{318, 1, "QuyÒn ph¸p", "§¹t Ma §é Giang"}, -- ´ïÄ¦¶É½­[318]            Ìí¼ÓÊìÁ·¶È¼¼ÄÜ ÖÁÉÙÌí¼ÓÎª1¼¶
                    {319, 1, "C«n ph¸p", "Hoµnh T¶o Thiªn Qu©n"}, -- ºáÉ¨Ç§¾ü[319]£¨90¼¶£©
            {321, 1, "§ao ph¸p", "V« T­íng Tr¶m "} -- ÎÞÏàÕ¶  [321]£¨90¼¶£©
            },
            [120] = {{709, 1, "Th«ng dông", "§¹i Thõa Nh­ Lai Chó"}},
            [150] = {{1055, 1, "QuyÒn ph¸p", "§¹i Lùc Kim Cang Ch­ëng"}, -- ´óÁ¦½ð¸ÕÕÆ[318]          Ìí¼ÓÊìÁ·¶È¼¼ÄÜ ÖÁÉÙÌí¼ÓÎª1¼¶
                     {1056, 1, "C«n ph¸p", "Vi §µ HiÕn Xö"}, -- Î¤ÍÓÏ×èÆ[319]£¨90¼¶£©
            {1057, 1, "§ao ph¸p", "Tam Giíi Quy ThiÒn"}, -- Èþ½ä¹éìø[321]£¨90¼¶£©
            {1220, 1, "Kim Quyªn La H¸n"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1", 56}, {"ThiÕu L©m C«n ph¸p. QuyÓn 2", 57},
                             {"ThiÕu L©m §ao ph¸p. QuyÓn 3", 58}}
        }
    },

    [tbFacDef.tbIds.TIANWANG] = { -- ÌìÍõ
        szFacName = "tianwang",
        szFacChName = "Thiªn V­¬ng Bang",
        szFacShortName = "Thiªn V­¬ng",
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
        szMsg = "KÓ tõ h«m nay %s gia nhËp Thiªn V­¬ng, nhê c¸c s­ huynh chØ gi¸o!",
        tbSkillID = {
            [10] = {34, -- ¾ªÀ×Õ¶[34]  £¨ÈëÃÅ£©
            30, -- »Ø·çÂäÑã[30]£¨ÈëÃÅ£©
            29 -- Õ¶Áú¾÷[29]  £¨ÈëÃÅ£©
            },
            [20] = {26, -- ÌìÍõ´¸·¨[26]£¨10¼¶£©
            23, -- ÌìÍõÇ¹·¨[23]£¨10¼¶£©
            24 -- ÌìÍõµ¶·¨[24]£¨10¼¶£©
            },
            [30] = {33 -- ¾²ÐÄ¾÷[33]  £¨20¼¶£©
            },
            [40] = {37, -- ÆÃ·çÕ¶  [37]£¨30¼¶£©
            35, -- Ñô¹ØÈýµþ[35]£¨30¼¶£©
            31 -- ÐÐÔÆ¾÷  [31]£¨30¼¶£©
            },
            [50] = {40 -- ¶Ï»ê´Ì  [40]£¨40¼¶£©
            },
            [60] = {42 -- ½ðÖÓÕÖ  [42]£¨50¼¶£©
            },
            [70] = {32, -- ÎÞÐÄÕ¶  [32] £¨60¼¶£©
            36, -- ÌìÍõÕ½Òâ[36]£¨ÕòÅÉ£©
            41, -- ÑªÕ½°Ë·½[41] £¨60¼¶£©
            324 -- ³ËÁú¾÷  [324]£¨60¼¶£©
            },
            [90] = {{325, 1, "Chïy ph¸p", "Truy Phong QuyÕt "}, -- ×··ç¾÷  £¨90¼¶£©
            {323, 1, "Th­¬ng ph¸p", "Truy Tinh Trôc NguyÖt "}, -- ×·ÐÇÖðÔÂ£¨90¼¶£©
            {322, 1, "§ao ph¸p", "Ph¸ Thiªn Tr¶m "} -- ÆÆÌìÕ¶  £¨90¼¶£©
            },
            [120] = {{708, 1, "Th«ng dông", "§¶o H­ Thiªn"} --
            },
            [150] = {{1059, 1, "Chïy ph¸p", "Tung Hoµnh B¸t Hoang"}, -- ×Ýºá°Ë»Ä
            {1060, 1, "Th­¬ng ph¸p", "B¸ V­¬ng T¹m Kim"}, -- °ÔÍõöÉ½ð
            {1058, 1, "§ao ph¸p", "Hµo Hïng Tr¶m"}, -- ºÀÐÛÕ¶
            {1221, 1, "Chinh Chi?n B¸t Ph­¬ng"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1", 37},
                             {"Thiªn V­¬ng Th­¬ng ph¸p. QuyÓn 2", 38}, {"Thiªn V­¬ng §ao ph¸p.QuyÓn 3", 39}}
        }
    },

    [tbFacDef.tbIds.TANGMEN] = { -- ÌÆÃÅ
        szFacName = "tangmen",
        szFacChName = "§­êng M«n",
        szFacShortName = "§­êng M«n",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp §­êng m«n, c¶m phiÒn c¸c s­ huynh s­ tû chØ gi¸o!",
        tbSkillID = {
            [10] = {45 -- Åùö¨µ¯[45 ]£¨ÈëÃÅ£©
            },
            [20] = {43, -- ÌÆÃÅ°µÆ÷[43 ]£¨10¼¶£©
            347 -- µØÑæ»ð[347]£¨10¼¶£©
            },
            [30] = {303 -- ¶¾´Ì¹Ç  [303]£¨20¼¶£©
            },
            [40] = {50, -- ×·ÐÄ¼ý  [50 ]£¨30¼¶£©
            54, -- ÂþÌì»¨Óê[54 ]£¨30¼¶£©
            47, -- ¶á»êïÚ  [47 ]£¨30¼¶£©
            343 -- ´©ÐÄ´Ì  [343]£¨30¼¶£©
            },
            [50] = {345 -- º®±ù´Ì  [345]£¨40¼¶£©
            },
            [60] = {349 -- À×»÷Êõ[349]£¨50¼¶£©
            },
            [70] = {249, -- Ð¡Àî·Éµ¶[249]£¨60¼¶£©
            48, -- ÐÄÑÛ  [48 ]£¨ÕòÅÉ£©
            58, -- ÌìÂÞµØÍø[58 ]£¨60¼¶£©
            341 -- É¢»¨ïÚ  [341]£¨60¼¶£©
            },
            [90] = {{339, 1, "Phi ®ao", "NhiÕp Hån NguyÖt ¶nh"}, -- Éã»êÔÂÓ°[339]£¨90¼¶£©
            {302, 1, "Ná tiÔn", "B¹o Vò Lª Hoa"}, -- ±©ÓêÀæ»¨[302]£¨90¼¶£©
            {342, 1, "Phi Tiªu", "Cöu Cung Phi Tinh"}, -- ¾Å¹¬·ÉÐÇ[342]£¨90¼¶£©
            {351, 0, "Th«ng dông", "Lo¹n Hoµn KÝch"} -- ÂÒ»·»÷  [351]£¨90¼¶£©
            },
            [120] = {{710, 1, "Th«ng dông", "Mª ¶nh Tung"}},
            [150] = {{1069, 1, "Phi ®ao", "V« ¶nh Xuyªn"}, -- ÎÞÓ°´©
            {1070, 1, "Ná tiÔn", "ThiÕt Liªn Tø S¸t"}, -- ÌúÁ«ËÄÉ±
            {1071, 1, "Phi Tiªu", "Cµn Kh«n NhÊt TrÞch"}, -- Ç¬À¤Ò»ÖÀ
            {1110, 0, "Th«ng dông", "TÝch LÞch Lo¹n Hoµn KÝch"}, -- Åùö¨ÂÒ»·»÷
            {1223, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh", 45},
                             {"Tô TiÔn thuËt. B¹o Vò Lª Hoa", 27}, {"Phi Tiªu thuËt. Cöu Cung Phi Tinh", 46},
                             {"H·m TÜnh thuËt.Lo¹n Hoµn KÝch", 28}}
        }
    },

    [tbFacDef.tbIds.WUDU] = { -- Îå¶¾
        szFacName = "wudu",
        szFacChName = "Ngò §éc Gi¸o",
        szFacShortName = "Ngò §éc",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp m«n Ngò §éc gi¸o, c¶m phiÒn c¸c s­ huynh s­ tû chØ gi¸o!",
        tbSkillID = {
            [10] = {63, -- ¶¾É°ÕÆ  [63]£¨ÈëÃÅ£©
            65 -- Ñªµ¶¶¾É±[65]£¨ÈëÃÅ£©
            },
            [20] = {62, -- Îå¶¾ÕÆ·¨[62]£¨10¼¶£©
            60, -- Îå¶¾µ¶·¨[60]£¨10¼¶£©
            67 -- ¾ÅÌì¿ñÀ×[67]£¨10¼¶£©
            },
            [30] = {70, -- ³àÑæÊ´Ìì[70]£¨20¼¶£©
            66 -- ÔÓÄÑÒ©¾­[66]£¨20¼¶£©
            },
            [40] = {68, -- ÓÄÚ¤÷¼÷Ã[68 ]£¨30¼¶£©
            384, -- °Ù¶¾´©ÐÄ[384]£¨30¼¶£©
            64, -- ±ùÀ¶Ðþ¾§[64 ]£¨30¼¶£©
            69 -- ÎÞÐÎ¹Æ  [69]£¨30¼¶£©
            },
            [50] = {356, -- ´©ÒÂÆÆ¼×  [356]£¨40¼¶£©
            73 -- Íò¹ÆÊ´ÐÄ[73 ]£¨40¼¶£©
            },
            [60] = {72 -- ´©ÐÄ¶¾´Ì[72]£¨50¼¶£©
            },
            [70] = {71, -- Ììî¸µØÉ·ÊÖ[71 ]£¨60¼¶£©
            75, -- Îå¶¾Ææ¾­[75]£¨ÕòÅÉ£©
            74 -- Öì¸òÇàÚ¤  [74 ]£¨60¼¶£©
            },
            [90] = {{353, 1, "Ch­ëng ph¸p", "¢m Phong Thùc Cèt "}, -- Òõ·çÊ´¹Ç[353]£¨90¼¶£©
            {355, 1, "§ao ph¸p", "HuyÒn ¢m Tr¶m "}, -- ÐþÒõÕ¶  [355]£¨90¼¶£©
            {390, 0, "Th«ng dông", "§o¹n C©n Hñ Cèt "} -- ¶Ï½î¸¯¹Ç[390]£¨90¼¶£©
            },
            [120] = {{711, 1, "Th«ng dông", "HÊp Tinh YÓm"}},
            [150] = {{1066, 1, "Ch­ëng ph¸p", ""}, -- ÐÎÏú¹ÇÁ¢
            {1067, 1, "§ao ph¸p", ""}, -- ÓÄ»êÊÉÓ°
            {1222, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Ngò §éc Ch­ëng Ph¸p. QuyÓn 1", 47}, {"Ngò §éc §ao ph¸p. QuyÓn 2", 48},
                             {"Ngò §éc NhiÕp T©m thuËt. QuyÓn 3", 49}}
        }
    },

    [tbFacDef.tbIds.EMEI] = { -- ¶ëÃ¼
        szFacName = "emei",
        szFacChName = "Nga My ph¸i",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp Nga My ph¸i, c¶m phiÒn c¸c s­ tû chØ gi¸o",
        tbSkillID = {
            [10] = {85, -- Ò»Ò¶ÖªÇï[85]£¨ÈëÃÅ£©
            80 -- Æ®Ñ©´©ÔÆ[80]£¨ÈëÃÅ£©
            },
            [20] = {77, -- ¶ëáÒ½£·¨[77]£¨10¼¶£©
            79 -- ¶ëáÒÕÆ·¨[79]£¨10¼¶£©
            },
            [30] = {93 -- ´Èº½ÆÕ¶É[93]£¨20¼¶£©
            },
            [40] = {385, -- ÍÆ´°ÍûÔÂ[385]£¨30¼¶£©
            82, -- ËÄÏóÍ¬¹é[82]£¨30¼¶£©
            89 -- ÃÎµû    [89]£¨30¼¶£©
            },
            [50] = {86 -- Á÷Ë®    [86 ]£¨40¼¶£©
            },
            [60] = {92 -- ·ðÐÄ´ÈÓÓ[92]£¨50¼¶£©
            },
            [70] = {88, -- ²»Ãð²»¾ø[88]£¨60¼¶£©
            252, -- ·ð·¨ÎÞ±ß[252]£¨ÕòÅÉ£©
            91, -- ·ð¹âÆÕÕÕ[91]£¨60¼¶£©
            282 -- ÇåÒôèó³ª[282]£¨60¼¶£©                          
            },
            [90] = {{328, 1, "KiÕm ph¸p", "Tam Nga TÒ TuyÕt "}, -- Èý¶ëö«Ñ©[328]£¨90¼¶£©
            {380, 1, "Ch­ëng ph¸p", "Phong S­¬ng To¸i ¶nh "}, -- ·çËªËéÓ°[380]£¨90¼¶£©
            {332, 0, "Th«ng dông", "Phæ §é Chóng Sinh "} -- ÆÕ¶ÉÖÚÉú[332]£¨90¼¶£©
            },
            [120] = {{712, 1, "Th«ng dông", "BÕ NguyÖt PhÊt TrÇn"}},
            [150] = {{1061, 1, "KiÕm ph¸p", "KiÕm Hoa V·n Tinh"}, -- ½£»¨Íì¾§
            {1062, 1, "Ch­ëng ph¸p", "B¨ng Vò L¹c Tinh"}, -- ±ùÓêçó¾§
            {1114, 1, "Hç trî", "Ngäc TuyÒn T©m Kinh"}, -- ÓñÈªÐÄ¾­
            {1224, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"DiÖt KiÕm MËt TÞch", 42}, {"Nga Mi  PhËt Quang Ch­ëng MËt TÞch", 43},
                             {"Phæ §é MËt TÞch", 59}}
        }
    },

    [tbFacDef.tbIds.CUIYAN] = { -- ´äÑÌ
        szFacName = "cuiyan",
        szFacChName = "Thóy Yªn m«n",
        szFacShortName = "Thóy Yªn",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp Thóy Yªn m«n, c¶m phiÒn c¸c s­ tû chØ gi¸o!",
        tbSkillID = {
            [10] = {99, -- ·ç»¨Ñ©ÔÂ[99 ]£¨ÈëÃÅ£©
            102 -- ·ç¾í²ÐÑ©[102]£¨ÈëÃÅ£©
            },
            [20] = {95, -- ´äÑÌµ¶·¨[95 ]£¨10¼¶£©
            97 -- ´äÑÌË«µ¶[97 ]£¨10¼¶£©
            },
            [30] = {269 -- ±ùÐÄÙ»Ó°[269]£¨20¼¶£©
            },
            [40] = {105, -- Óê´òÀæ»¨[105]£¨30¼¶£©
            113 -- ¸¡ÔÆÉ¢Ñ©[113]£¨30¼¶£©
            },
            [50] = {100 -- »¤Ìåº®±ù[100]£¨30¼¶£©
            },
            [60] = {109 -- Ñ©Ó°    [109]£¨40¼¶£©
            },
            [70] = {108, -- ÄÁÒ°Á÷ÐÇ[108]£¨60¼¶£©
            114, -- ±ù¹ÇÑ©ÐÄ[114]£¨ÕòÅÉ£©
            111 -- ±Ìº£³±Éú[111]£¨60¼¶£©
            },
            [90] = {{336, 1, "§ao ph¸p", "B¨ng Tung V« ¶nh "}, -- ±ù×ÙÎÞÓ°[336]£¨90¼¶£©
            {337, 1, "Song ®ao", "B¨ng T©m Tiªn Tö  "} -- ±ùÐÄÏÉ×Ó[337]£¨90¼¶£©
            },
            [120] = {{713, 1, "Th«ng dông", "Ngù TuyÕt Èn"}},
            [150] = {{1063, 1, "§ao ph¸p", "B¨ng T­íc Ho¹t Kú"}, -- ±ùÈ¸Ô½Ö¦
            {1065, 1, "Song ®ao", "Thñy Anh Man Tó"}, -- Ë®Ó³ÂüÐã
            {1225, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Thóy Yªn ®ao ph¸p", 40}, {"Thóy Yªn song ®ao", 41}}
        }
    },

    [tbFacDef.tbIds.GAIBANG] = { -- Ø¤°ï
        szFacName = "gaibang",
        szFacChName = "C¸i Bang",
        szFacShortName = "C¸i Bang",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp C¸i Bang, c¶m phiÒn c¸c tiÒn bèi chØ gi¸o!",
        tbSkillID = {
            [10] = {122, -- ¼ûÈËÉìÊÖ[122]£¨ÈëÃÅ£©
            119 -- ÑØÃÅÍÐ²§[119]£¨ÈëÃÅ£©
            },
            [20] = {116, -- Ø¤°ïÕÆ·¨[116]£¨10¼¶£©
            115 -- Ø¤°ï°ô·¨[115]£¨10¼¶£©
            },
            [30] = {129 -- »¯ÏÕÎªÒÄ[129]£¨20¼¶£©
            },
            [40] = {274, -- ½µÁúÕÆ[274]£¨30¼¶£©
            124 -- ´ò¹·Õó[124]£¨30¼¶£©
            },
            [50] = {277 -- »¬²»ÁôÊÖ[277]£¨40¼¶
            },
            [60] = {128, -- ¿ºÁúÓÐ»Ú[128]£¨50¼¶£©
            125 -- °ô´ò¶ñ¹·[125]£¨50¼¶£©
            },
            [70] = {130, -- ×íµû¿ñÎè[130]£¨ÕòÅÉ£©
            360 -- åÐÒ£¹¦[360]£¨60¼¶£©
            },
            [90] = {{357, 1, "Ch­ëng ph¸p", "Phi Long T¹i Thiªn "}, -- ·ÉÁúÔÚÌì[357]£¨90¼¶£©
            {359, 1, "Bæng ph¸p", "Thiªn H¹ V« CÈu "} -- ÌìÏÂÎÞ¹·[359]£¨90¼¶£©
            },
            [120] = {{714, 1, "Th«ng dông", "Hçn Thiªn KhÝ C«ng"}},
            [150] = {{1073, 1, "Ch­ëng ph¸p", "Thêi ThÆng Lôc Long"}, -- Ê±³ËÁùÁú
            {1074, 1, "Bæng ph¸p", "Bæng Huýnh L­îc §Þa"}, -- °ôåÄÂÓµØ
            {1227, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"C¸i Bang ch­ëng ph¸p", 54}, {"C¸i Bang c«n ph¸p", 55}}
        }
    },

    [tbFacDef.tbIds.TIANREN] = { -- ÌìÈÌ
        szFacName = "tianren",
        szFacChName = "Thiªn NhÉn Gi¸o",
        szFacShortName = "Thiªn NhÉn",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp Thiªn NhÉn gi¸o, b¸i kiÕn c¸c s­ huynh s­ tû!",
        tbSkillID = {
            [10] = {135, -- ²ÐÑôÈçÑª[135]£¨ÈëÃÅ£©
            145 -- µ¯Ö¸ÁÒÑæ[145]£¨ÈëÃÅ£©
            },
            [20] = {132, -- ÌìÈÌÃ¬·¨[132]£¨10¼¶£©
            131, -- ÌìÈÌµ¶·¨[131]£¨10¼¶£©
            136 -- »ð·ÙÁ«»ª[136]£¨10¼¶£©
            },
            [30] = {137 -- »ÃÓ°·Éºü[137]£¨20¼¶£©
            },
            [40] = {141, -- ÁÒ»ðÇéÌì[141]£¨30¼¶£©
            138, -- ÍÆÉ½Ìîº£[138]£¨30¼¶£©
            140 -- ·ÉºèÎÞ¼£[140]£¨30¼¶£©
            },
            [50] = {364 -- ±¯ËÖÇå·ç[364]£¨40¼¶£©
            },
            [60] = {143 -- À÷Ä§¶á»ê[143]£¨50¼¶£©
            },
            [70] = {142, -- ÍµÌì»»ÈÕ[142]£¨60¼¶£©
            150, -- ÌìÄ§½âÌå[150]£¨ÕòÅÉ£©
            148 -- Ä§ÑæÆßÉ±[148]£¨60¼¶£©
            },
            [90] = {{361, 1, "Th­¬ng ph¸p", "V©n Long KÝch"}, -- ÔÆÁú»÷  [361]£¨90¼¶£©
            {362, 1, "§ao ph¸p", "Thiªn Ngo¹i L­u Tinh"}, -- ÌìÍâÁ÷ÐÇ[362]£¨90¼¶£©
            {391, 0, "Th«ng dông", "NhiÕp Hån Lo¹n T©m "} -- Éå»êÂÒÐÄ[391]£¨90¼¶£©
            },
            [120] = {{715, 1, "Th«ng dông", "Ma ¢m PhÖ Ph¸ch"}},
            [150] = {{1075, 1, "Th­¬ng ph¸p", "Giang H¶i Né Lan"}, -- ½­º£Å­À½
            {1076, 1, "§ao ph¸p", "TËt Háa LiÖu Nguyªn"}, -- ¼²»ðÁÇÔ­
            {1226, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"V©n Long KÝch. M©u ph¸p", 35}, {"L­u Tinh. §ao ph¸p", 36},
                             {"NhiÕp Hån. Chó thuËt", 53}}
        }
    },

    [tbFacDef.tbIds.WUDANG] = { -- Îäµ±
        szFacName = "wudang",
        szFacChName = "Vâ §ang ph¸i",
        szFacShortName = "Vâ §ang",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp Vâ §ang ph¸i, tham kiÕn c¸c s­ huynh s­ tû!",
        tbSkillID = {
            [10] = {153, -- Å­À×Ö¸  [153]£¨ÈëÃÅ£©
            155 -- ²×º£Ã÷ÔÂ[155]£¨ÈëÃÅ£©
            },
            [20] = {152, -- Îäµ±È­·¨[152]£¨10¼¶£©
            151 -- Îäµ±½£·¨[151]£¨10¼¶£©
            },
            [30] = {159 -- ÆßÐÇÕó  [159]£¨30¼¶£©
            },
            [40] = {164, -- °þ¼°¶ø¸´[164]£¨30¼¶£©
            158 -- ½£·É¾ªÌì[158]£¨30¼¶£©
            },
            [50] = {160 -- ÌÝÔÆ×Ý  [160]£¨40¼¶£©
            },
            [60] = {157 -- ×øÍûÎÞÎÒ[157]£¨50¼¶£©
            },
            [70] = {165, -- ÎÞÎÒÎÞ½£[165]£¨60¼¶£©
            166, -- Ì«¼«Éñ¹¦[166]£¨ÕòÅÉ£©
            267 -- Èý»·Ì×ÔÂ[267]£¨60¼¶£©
            },
            [90] = {{365, 1, "QuyÒn ph¸p", "Thiªn §Þa V« Cùc "}, -- ÌìµØÎÞ¼«[365]£¨90¼¶£©
            {368, 1, "KiÕm ph¸p", "Nh©n KiÕm Hîp NhÊt  "} -- ÈË½£ºÏÒ»[368]£¨90¼¶£©
            },
            [120] = {{716, 1, "Th«ng dông", "XuÊt ø BÊt NhiÔm"}},
            [150] = {{1078, 1, "QuyÒn ph¸p", "T¹o Hãa Th¸i Thanh"}, -- Ôì»¯Ì«Çå
            {1079, 1, "KiÕm ph¸p", "KiÕm Thïy Tinh Hµ"}, -- ½£´¹ÐÇºÓ
            {1228, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Th¸i Cùc QuyÒn Phæ. QuyÓn 3", 33}, {"Th¸i Cùc KiÕm Phæ. QuyÓn 2", 34}}
        }
    },

    [tbFacDef.tbIds.KUNLUN] = { -- À¥ÂØ
     
        szFacChName = "C«n L«n ph¸i",
        szFacShortName = "C«n L«n",
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
        szMsg = "KÓ tõ h«m nay, %s gia nhËp C«n L«n ph¸i, b¸i kiÕn c¸c vÞ ®¹o huynh!",
        tbSkillID = {
            [10] = {169, -- ºô·ç·¨  [169]£¨ÈëÃÅ£©
            179 -- ¿ñÀ×ÕðµØ[179]£¨ÈëÃÅ£©
            },
            [20] = {167, -- À¥ÂØµ¶·¨[167]£¨10¼¶£©
            168, -- À¥ÂØ½£·¨[168]£¨10¼¶£©
            392, -- ²ø×Ö¾÷[392]£¨10¼¶£©
            171 -- Çå·ç·û  [171]£¨10¼¶£©
            },
            [30] = {174 -- î¿°í·û  [174]£¨20¼¶£©
            },
            [40] = {178, -- Ò»ÆøÈýÇå[178]£¨30¼¶£©
            172, -- Ñ¸À×Öä  [172]£¨30¼¶£©
            393, -- È±ÉÙID£¨30¼¶£©
            173 -- ÌìÇåµØ×Ç[173]£¨30¼¶£©
            },
            [50] = {175, -- ÆÛº®°ÁÑ©[175]£¨40¼¶£©
            181 -- ÆúÐÄ·û  [181]£¨40¼¶£©
            },
            [60] = {176, -- ¿ñ·çÖèµç[176]£¨50¼¶£©
            90 -- ÃÔ×Ù»ÃÓ°[90 ]£¨50¼¶£©
            },
            [70] = {275, -- Ëª°ÁÀ¥ÂØ[275]£¨ÕòÅÉ£©
            182, -- ÎåÀ×Õý·¨[182]£¨60¼¶£©
            630 -- µÚÈý×ÊÁÏÆ¬£¬Ôö¼ÓÀ¥ÂØÐÂ¼¼ÄÜ"ÐþÌìÎÞ¼«"
            },
            [90] = {{372, 1, "§ao ph¸p", "Ng¹o TuyÕt Tiªu Phong "}, -- °ÁÑ©Ð¥·ç[372]£¨90¼¶£©
            {375, 1, "KiÕm ph¸p", "L«i ®éng Cöu Thiªn "}, -- À×¶¯¾ÅÌì[375]£¨90¼¶£©
            {394, 0, "Th«ng dông", "Tóy Tiªn T¸ Cèt"} -- ×íÏÉ´í¹Ç[394]£¨90¼¶£©
            },
            [120] = {{717, 1, "Th«ng dông", "L­ìng Nghi Ch©n KhÝ"}},
            [150] = {{1080, 1, "§ao ph¸p", "Cöu Thiªn C­¬ng Phong"}, -- ¾ÅÌìî¸·ç
            {1081, 1, "KiÕm ph¸p", "Thiªn L«i ChÊn Nh¹c"}, -- ÌìÀ×ÕðÔÀ
            {1229, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Ngù Phong thuËt", 50}, {"Ngù L«i thuËt", 51}, {"Ngù T©m thuËt", 52}}
        }
    },
    [tbFacDef.tbIds.HUASHAN] = { -- »ªÉ½
        
        szFacChName = "Hoa S¬n ph¸i",
        szFacShortName = "Hoa S¬n",
        szFacShortEng = "hs",
        nFacNumb = tbFacDef.tbIds.HUASHAN,
        nCamp = 3,
        nRankId = 89,
        nSeries = 2,
        nTaskId_Fact = 3481, -- ÃÅÅÉÈÎÎñ±äÁ¿
        nTaskId_90Skill = 3486, -- 90¼¼ÄÜÈÎÎñ±äÁ¿
        nTaskId_137 = 137, -- ³öÊ¦ÈÎÎñ±äÁ¿
        nValue_137 = 71, -- ³öÊ¦ÈÎÎñ±äÁ¿Öµ
        n150TaskStep = 9, -- 150¼¼ÄÜÈÎÎñ²½Öè
        nJinjieSkillID = 1370, -- ½ø½×¼¼ÄÜ(ºÆÈ»Ö®Æø)
        nFactionMapId = 987,
        tbFactionMapPos = {1346, 3128},
        szMsg = "%s b¾t ®Çu tõ h«m nay gia nhËp ph¸i Hoa S¬n, ®Õn gÆp vµ b¸i kiÕn c¸c vÞ s­ huynh, xin c¸c vÞ chiÕu cè!",
        tbSkillID = {
            [10] = {1347, -- °×ºç¹áÈÕ(ÈëÃÅ)
            1372 -- Çå·çËÍË¬(ÈëÃÅ)
            },
            [20] = {1349, -- ½£×Ú×Ü¾÷(10¼¶)
            1374 -- ÁúÈÅÉí  (10¼¶)
            },
            [30] = {1350, -- ÑøÎá½£·¨(20¼¶)
            1375 -- º£ÄÉ°Ù´¨(20¼¶)
            },
            [40] = {1351, -- ½ðÑãºá¿Õ(30¼¶)
            1376 -- ÁúÐý½£Æø(30¼¶)
            },
            [50] = {1354, -- Ï£ÒÄ½£·¨(40¼¶)
            1378 -- ÆøÕðÉ½ºÓ(40¼¶)
            },
            [60] = {1355, -- ÌìÀ¤µ¹Ðü(50¼¶)
            1379 -- Æø¹á³¤ºç(50¼¶)
            },
            [70] = {1358, -- »ÃÑÛÔÆäÎ(ÕòÅÉ)
            1360, -- ²ÔËÉÓ­¿Í(60¼¶)
            1380 -- Ä¦ÔÆ½£Æø(60¼¶)
            },
            [90] = {{1364, 1, "Hoa S¬n kiÕm t«ng", "§o¹t MÖnh Liªn Hoµn Tam Tiªn KiÕm"}, -- ¶áÃüÁ¬»·ÈýÏÉ½£(90¼¶)
                    {1382, 1, "Hoa S¬n khÝ t«ng", "Ph¸ch Th¹ch Ph¸ Ngäc"} -- ÅüÊ¯ÆÆÓñ(90¼¶)
            },
            [120] = {{1365, 1, "Th«ng dông", "Tö Hµ KiÕm KhÝ"} -- ×ÏÏ¼½£Æø(120¼¶)
            },
            [150] = {{1369, 1, "Hoa S¬n kiÕm t«ng", "Cöu kiÕm hîp nhÊt"}, -- ¾Å½£ºÏÒ»
            {1384, 1, "Hoa S¬n khÝ t«ng", "ThÇn Quang Toµn NhiÔu"}, -- Éñ¹âÐýÈÆ
            {1370, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = {{"Hoa S¬n KiÕm T«ng-§o¹t mÖnh liªn hoµn tam tiªn kiÕm", 4062},
                             {"Hoa S¬n KhÝ T«ng-BÝch Th¹ch Ph¸ Ngäc", 4063}}
        }
    },
    [tbFacDef.tbIds.WUHUN] = { -- Îä»ê
      
        szFacChName = "Vò Hån",
        szFacShortName = "Vò Hån",
        szFacShortEng = "wh",
        nFacNumb = tbFacDef.tbIds.WUHUN,
        nCamp = 1,
        nRankId = 90,
        nSeries = 3,
        nTaskId_Fact = 4406, -- ÃÅÅÉÈÎÎñ±äÁ¿
        nTaskId_JMDZ = 4405,
        nTaskValue_JMDZ = 30 * 256,
        nTaskId_90Skill = 4407, -- 90¼¼ÄÜÈÎÎñ±äÁ¿
        nTaskId_137 = 137, -- ³öÊ¦ÈÎÎñ±äÁ¿
        nValue_137 = 71, -- ³öÊ¦ÈÎÎñ±äÁ¿Öµ
        n150TaskStep = 3,
        nJinjieSkillID = 1986, -- ½ø½×¼¼ÄÜ(¾«ÖÒ±¨¹ú)
        nFactionMapId = 1042,
        tbFactionMapPos = {1530, 3251},
        szMsg = "%s tõ nµy gia nhËp Vò Hån, ®Õn b¸i kiÕn c¸c vÞ s­ huynh, xin c¸c vÞ chiÕu cè!",
        tbSkillID = {
            [10] = {1972, -- ¶áÕ¯ÑïÆì(ÈëÃÅ)
            1974 -- ³¤Ó§»Ó³â(ÈëÃÅ)
            },
            [20] = {1964, -- Îä»êÌÃ¶Ü·¨(10¼¶)
            1975 -- Îä»êÌÃµ¶·¨  (10¼¶)
            },
            [30] = {1976 -- ¹«ÖÒ±üÐÔ(20¼¶)
            },
            [40] = {1965, -- ÇëÓ§ÌáÈñÂÃ(30¼¶)
            1977 -- º³É½»÷(30¼¶)
            },
            [50] = {1963, -- ³¯ÌìãÚ(40¼¶)
            1979 -- Å­ÅüÌìÑÄ(40¼¶)
            },
            [60] = {1980 -- ¹Â½«°ÙÕ½º¨(50¼¶)
            },
            [70] = {1982, -- ÎäÄÂÒÅÖ¾(ÕòÅÉ)
            1971, -- ÖÇÓÂ³¬Â×(60¼¶)
            1981 -- ¼¢²ÍºúÂ²Èâ(60¼¶)
            },
            [90] = {{1967, 1, "Vò Hån hÖ ThuÉn", "TrÊn Biªn Thïy"}, -- Õò±ßÚï(90¼¶)
            {1983, 1, "Vò Hån hÖ §ao", "Kh¸t Èm Hung N« HuyÕt"} -- ¿ÊÒûÐÙÅ«Ñª(90¼¶)
            },
            [120] = {{1984, 1, "Th«ng dông", "Trung Vu L­u Phong"} -- ÖÒÎäÁ÷·ç(120¼¶)
            },
            [150] = {{1969, 1, "Vò Hån hÖ ThuÉn", "Huy S­ DiÖt Lç"}, -- »ÓÊ¦ÃðÂ²
            {1985, 1, "Vò Hån hÖ §ao", "Trõ Gian DiÖt NÞnh"}, -- ²ù¼é³ýØú
            {1986, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = { -- 90¼¶¼¼ÄÜÊéµÀ¾ßÃûºÍID,×¢Òâ£¡ÒªºÍ¼¼ÄÜ±íÖÐ90¼¶¼¼ÄÜµÄË³ÐòÒ»Ò»¶ÔÓ¦£¡
            {"Vò Hån ThuÉn Ph¸p#TrÊn Biªn Thïy", 5106}, {"Vò Hån §ao Ph¸p#Kh¸t Èm Hung N« HuyÕt", 5107}}
        }
    },
    [tbFacDef.tbIds.XIAOYAO] = { -- åÐÒ£ÅÉ
        bFactionIsOpen = nil,
        
        szFacChName = "Ph¸i Tiªu Dao",
        szFacShortName = "Tiªu Dao",
        szFacShortEng = "xy",
        nFacNumb = tbFacDef.tbIds.XIAOYAO,
        nCamp = 3,
        nRankId = 98,
        nSeries = 4,
        nTaskId_Fact = 4464, -- ÃÅÅÉÈÎÎñ±äÁ¿
        nTaskId_JMDZ = 4463,
        nTaskValue_JMDZ = 40 * 256,
        nTaskId_90Skill = 4465, -- 90¼¼ÄÜÈÎÎñ±äÁ¿
        nTaskId_137 = 137, -- ³öÊ¦ÈÎÎñ±äÁ¿
        nValue_137 = 71, -- ³öÊ¦ÈÎÎñ±äÁ¿Öµ
        n150TaskStep = 6,
        nJinjieSkillID = 2132, -- Éî²ØÉíÃû
        nFactionMapId = 1057,
        tbFactionMapPos = {1584, 3251},
        tbSchools = {28, 29},
        szMsg = "%s tõ h«m nay vµo Ph¸i Tiªu Dao, nay ®Õn b¸i kiÕn c¸c vÞ s­ huynh, mong h·y chiÕu cè!",
        szSelfCall = "Bæn M«n",
        tbSkillID = {
            [10] = {1881, -- Îâ¹³ËªÑ©(ÈëÃÅ) Ng« C©u S­¬ng TuyÕt
            1905 -- ËæÒâÇú(ÈëÃÅ) Tïy ý Khóc
            },
            [20] = {1882, -- åÐÒ£½£·¨(10¼¶) Tiªu Dao KiÕm Ph¸p
            1906 -- åÐÒ£ÇÙ·¨(10¼¶) Tiªu Dao CÇm Ph¸p
            },
            [30] = {1883 -- ÒÆ¹¬»»Óð(20¼¶) Di Cung Ho¸n Vò
            },
            [40] = {1885, -- ìªí³Á÷ÐÇ(30¼¶) T¸p §¹p L­u Tinh
            1907 -- ÂäÑãÆ½É³(30¼¶) L¹c Nh¹n B×nh Sa
            },
            [50] = {1887, -- ÒÐ½£·÷Ìì(40¼¶) û KiÕm PhÊt Thiªn
            1909 -- ¹ãÁêÉ¢(40¼¶) Qu¶ng L¨ng T¸n
            },
            [60] = {1888 -- Òø°°°×Âí(50¼¶) Ng©n Yªn B¹ch M·
            },
            [70] = {1890, -- Ç§Àï¶ÀÐÐ(ÕòÅÉ) Thiªn Lý §éc Hµnh
            1889 -- ÏÀ¹ÇÈáÇé(³öÊ¦) HiÖp Cèt Nhu T×nh --tq
            },
            [90] = {{1891, 1, "Tiªu Dao KiÕm T«ng", "KiÕm QuyÕt Phï V©n"}, -- ½£¾ö¸¡ÔÆ(90¼¶)
            {1910, 1, "Tiªu Dao CÇm T«ng", "Cao S¬n L­u Thñy "} -- ¸ßÉ½Á÷Ë®(90¼¶)
            },
            [120] = {{1894, 1, "Th«ng dông", "¡n Uèng No Say"} -- à¢ÖË³Öõü(120¼¶)
            },
            [150] = {{1896, 1, "Tiªu Dao KiÕm T«ng", "ThËp Bé NhÊt S¸t"}, -- Ê®²½Ò»É±
            {1911, 1, "Tiªu Dao CÇm T«ng", "Mai Hoa Tam Léng"}, -- Ã·»¨ÈýÅª
            {1901, 1, "Skill 180"}}
        },
        tbItemInfo = {
            tbSkillBook90 = { -- 90¼¶¼¼ÄÜÊéµÀ¾ßÃûºÍID,×¢Òâ£¡ÒªºÍ¼¼ÄÜ±íÖÐ90¼¶¼¼ÄÜµÄË³ÐòÒ»Ò»¶ÔÓ¦£¡
            {"Tiªu Dao KiÕm Ph¸p-KiÕm QuyÕt Phï V©n", 5231}, {"Tiªu Dao CÇm Ph¸p-Cao S¬n L­u Thñy", 5232}},
            tbVipMaskIndex = {
                [1] = 8767, -- Äù˜„¡¤Ñ×»ËÃæ¾ß
                [2] = 8768, -- ÎÞ¾¡¡¤Ñ×»ËÃæ¾ß
                [3] = 8769, -- Ìì½¾¡¤Ñ×»ËÃæ¾ß
                [4] = 8781 -- ÎÞË«¡¤Ñ×»ËÃæ¾ß
            },
            tbVipWuXingYin = {
                [0] = 8770, -- ÖÁ×ðÓ¡¼ø
                [1] = 8771, -- 1¡ïÖÁ×ðÓ¡¼ø
                [2] = 8772, -- 2¡ïÖÁ×ðÓ¡¼ø
                [3] = 8773, -- 3¡ïÖÁ×ðÓ¡¼ø
                [4] = 8774, -- 4¡ïÖÁ×ðÓ¡¼ø
                [5] = 8775, -- 5¡ïÖÁ×ðÓ¡¼ø
                [6] = 8776, -- 6¡ïÖÁ×ðÓ¡¼ø
                [7] = 8777, -- 7¡ïÖÁ×ðÓ¡¼ø
                [8] = 8778, -- 8¡ïÖÁ×ðÓ¡¼ø
                [9] = 8779, -- 9¡ïÖÁ×ðÓ¡¼ø
                [10] = 8780 -- 10¡ïÖÁ×ðÓ¡¼ø
            }
        }
    }
}

-- Include("\\script\\faction_def.lua")
-- ×¢Òâ£ºÈ«²¿ÏÂ±êÊÇ´Ó0¿ªÊ¼
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
