------------------------------------------------------------------
-- Script Add ®å tÝm tuú chän option
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\gm\\julianv\\functions\\dialog_fun.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_monphai.lua")

tbDoTim = {}
tbDoTim.tbTrangBi = {
    [1] = {
        szName = "Vò KhÝ",
        tbEquip = { --
            { "KiÕm", 0, 0, 0 }, --
            { "§ao", 0, 0, 1 }, --
            { "Chïy", 0, 0, 4 }, --        
            { "Th­¬ng - KÝch", 0, 0, 3 }, --        
            { "C«n - Bæng", 0, 0, 2 }, --
            { "Song §ao", 0, 0, 5 }, --
            { "Phi Tiªu", 0, 1, 0 }, --
            { "Phi §ao", 0, 1, 1 }, --
            { "Tô TiÔn", 0, 1, 2 },
        },
    },
    [2] = {
        szName = "Mò",
        tbEquip = { --
            { "Tú L« M·o", 0, 7, 0 }, --
            { "Ngò L·o Qu¸n", 0, 7, 1 }, --
            { "Tu La Ph¸t KÕt", 0, 7, 2 }, --
            { "Th«ng Thiªn Ph¸t Qu¸n", 0, 7, 3 }, --
            { "YÓm NhËt Kh«i", 0, 7, 4 }, --
            { "TrÝch Tinh Hoµn", 0, 7, 5 }, --
            { "¤ Tµm M·o", 0, 7, 6 }, --
            { "Quan ¢m Ph¸t Qu¸n", 0, 7, 7 }, --
            { "¢m D­¬ng V« Cùc qu¸n", 0, 7, 8 }, --
            { "HuyÒn Tª DiÖn Tr¸o", 0, 7, 9 }, --
            { "Long HuyÕt §Çu hoµn", 0, 7, 10 }, --
            { "Long L©n Kh«i", 0, 7, 11 }, --
            { "Thanh Tinh Thoa", 0, 7, 12 }, --
            { "Kim Phông TriÓn SÝ ", 0, 7, 13 },
        },
    },
    [3] = {
        szName = "Trang phôc",
        tbEquip = { --
            { "ThÊt B¶o Cµ Sa", 0, 2, 0 }, --
            { "Ch©n Vò Th¸nh Y", 0, 2, 1 }, --        
            { "Thiªn NhÉn MËt Trang", 0, 2, 2 }, --
            { "Gi¸ng Sa Bµo", 0, 2, 3 }, --
            { "§­êng Nghª Gi¸p", 0, 2, 4 }, --
            { "V¹n L­u Quy T«ng Y", 0, 2, 5 }, --
            { "TuyÒn Long Bµo", 0, 2, 6 }, --
            { "Long Tiªu §¹o Y", 0, 2, 8 }, --
            { "Cöu VÜ B¹ch Hå Trang", 0, 2, 9 }, --
            { "TrÇm H­¬ng Sam", 0, 2, 10 }, --
            { "TÝch LÞch Kim Phông gi¸p", 0, 2, 11 }, --
            { "V¹n Chóng TÒ T©m Y", 0, 2, 12 }, --
            { "L­u Tiªn QuÇn", 0, 2, 13 },
        },
    },
    [4] = {
        szName = "D©y ChuyÒn",
        tbEquip = { --
            { "Toµn Th¹ch H¹ng Liªn", 0, 4, 0 }, --
            { "Lôc PhØ Thóy Hé Th©n Phï ", 0, 4, 1 },
        },
    },
    [5] = {
        szName = "Th¾t L­ng",
        tbEquip = { --
            { "Thiªn Tµm Yªu §¸i", 0, 6, 0 }, --
            { "B¹ch Kim Yªu §¸i", 0, 6, 1 },
        },
    },
    [6] = {
        szName = "NhÉn",
        tbEquip = { { "Giíi ChØ", 0, 3, 0 } },
     },
    [7] = {
        szName = "Bao Tay",
        tbEquip = { --
            { "Ngäc Tr¹c (N÷)", 0, 8, 0 }, --
            { "Hé UyÓn (Nam)", 0, 8, 1 },
        },
    },
    [8] = {
        szName = "Ngäc Béi",
        tbEquip = { --
            { "Long Tiªn H­¬ng Nang", 0, 9, 0 }, --
            { "D­¬ng Chi B¹ch Ngäc", 0, 9, 1 },
        },
    },
    [9] = {
        szName = "Giµy",
        tbEquip = { --
            { "Cöu TiÕt X­¬ng VÜ Ngoa", 0, 5, 0 }, --
            { "Thiªn Tµm Ngoa", 0, 5, 1 }, --
            { "Kim Lò Hµi", 0, 5, 2 }, --
            { "Phi Phông Ngoa", 0, 5, 3 },
        },
    },
}

tbDoTim.tbMagic_VuKhi = {
    [0] = { -- Kim
        -- {"STVL ngo¹i c«ng (®iÓm)", 220},
        { "STVL néi c«ng (®iÓm)", 440 }, --
        { "Kh¸ng §éc", 290 }, -- 
        -- {"T¨ng ®¼ng cÊp kü n¨ng hÖ Kim", 390}
    },
    [1] = { -- Méc
        { "§éc s¸t ngo¹i c«ng", 230 }, --
        { "§éc s¸t néi c«ng", 480 }, --
        { "Kh¸ng L«i", 320 }, --
        { "Thêi gian phôc håi", 90 }, --
        -- {"T¨ng ®¼ng cÊp kü n¨ng hÖ Méc", 410}
    },
    [2] = { -- Thuû
        { "B¨ng s¸t ngo¹i c«ng", 240 }, --
        { "B¨ng s¸t néi c«ng", 450 }, --
        { "Kh¸ng Ho¶", 310 }, --
        { "Thêi gian cho¸ng", 340 }, -- 
        -- {"T¨ng ®¼ng cÊp kü n¨ng hÖ Thuû", 400}
    },
    [3] = { -- Ho¶
        { "Ho¶ s¸t ngo¹i c«ng", 250 }, --
        { "Ho¶ s¸t néi c«ng", 460 }, --
        { "Thêi gian lµm chËm", 360 }, -- 
        -- {"T¨ng ®¼ng cÊp kü n¨ng hÖ Ho¶", 420}
    },
    [4] = { -- Thæ
        { "L«i s¸t ngo¹i c«ng", 260 }, --
        { "L«i s¸t néi c«ng", 470 }, --
        { "Kh¸ng B¨ng", 300 }, --
        { "Thêi gian tróng §éc", 380 }, --
        -- {"T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ", 430}
    },
}

tbDoTim.tbMagic_TrangPhuc = {
    [0] = { -- Kim
        { "Kh¸ng §éc", 290 },
    },
    [1] = { -- Méc
        { "Kh¸ng L«i", 320 }, --
        { "Thêi gian phôc håi", 90 },
    },
    [2] = { -- Thuû
        { "Kh¸ng Ho¶", 310 }, --
        { "Thêi gian cho¸ng", 340 },
    },
    [3] = { -- Ho¶		
        { "Phßng thñ VËt lý", 280 }, --
        { "Thêi gian lµm chËm", 360 },
    },
    [4] = { -- Thæ
        { "Kh¸ng B¨ng", 300 }, --
        { "Thêi gian tróng §éc", 380 },
    },
}

tbDoTim.tbMagic_All = {
    [1] = { -- Vò KhÝ
        { "Sinh lùc", 150 }, --
        { "Néi lùc", 160 }, --
        { "Kü n¨ng vèn cã", 110 }, --
        { "Hót sinh lùc", 130 }, --
        { "Hót néi lùc", 140 }, --
        { "STVL ngo¹i c«ng (%)", 10 }, --
        { "STVL ngo¹i c«ng (®iÓm)", 220 }, --
        { "Tèc ®é ®¸nh ngo¹i c«ng", 30 }, --
        { "TØ lÖ c«ng kÝch chÝnh x¸c", 20 }, --
        { "T¨ng ph¹m vi s¸t th­¬ng", 100 }, --
        { "Bá qua nÐ tr¸nh", 40 }, --
        -- {"Kh«ng thÓ ph¸ huû", 50}
    },
    [2] = { -- Trang bÞ
        { "Sinh lùc", 150 }, --
        { "Néi lùc", 160 }, --
        { "Kü n¨ng vèn cã", 110 }, --
        { "ChuyÓn ho¸ s¸t th­¬ng thµnh néi lùc", 270 }, --
        { "Phôc håi sinh lùc mçi nöa gi©y", 180 }, --
        { "May m¾n", 350 }, --
        { "Sinh khÝ", 330 }, --
        { "Søc m¹nh", 210 }, --
        { "Th©n ph¸p", 370 }, --
        { "NÐ tr¸nh", 60 }, -- 
        -- {"Kh«ng thÓ ph¸ huû", 50}
    },
}

tbDoTim.tbSeries = {
    [0] = { "Kim", "yellow" },
    [1] = { "Méc", "green" },
    [2] = { "Thuû", "blue" },
    [3] = { "Ho¶", "red" },
    [4] = { "Thæ", "orange" },
}
tbDoTim.szSerires = function( num )
    return format("<color=%s>%s<color>", tbDoTim.tbSeries[num][2], tbDoTim.tbSeries[num][1])
end

function tbDoTim:Define()
    self.tbWeaponMagic = self.tbMagic_VuKhi
    self.tbEquipMagic = self.tbMagic_TrangPhuc
    for i = 0, getn(self.tbSeries) do
        for _, tbOptVK in self.tbMagic_All[1] do tinsert(self.tbWeaponMagic[i], tbOptVK) end
        for _, tbOptTB in self.tbMagic_All[2] do tinsert(self.tbEquipMagic[i], tbOptTB) end
    end
end
tbDoTim:Define()

tbCheTao = {
    nItemId = 0,
    szName = "",
    nLevel = 0,
    nGenre = 0,
    nDetail = 0,
    nPart = 0,
    nSeries = 0,
    tbOptions = {},
}

JulianV = JDialog
function main()
    dofile("script/global/gm/julianv/npc/npc_dotim.lua")
    tbDoTim:Main()
end

function tbDoTim:Main() -- chän lo¹i trang bÞ chÕ t¹o 
    MAIN_TITLE = "<npc>Mêi <sex><bclr=red>" .. GetName() .. "<bclr> lùa chän<pic=46>\n"
    local szTitle = "<npc><sex><bclr=red>" .. GetName() ..
                        "<bclr> muèn chÕ t¹o <bclr=pink>§å TÝm<bclr> ch¨ng<pic=44><color>"
    local tbOpt = {}
    for id, tbEquip in self.tbTrangBi do
        tinsert(tbOpt, { id .. ". " .. tbEquip.szName, self.PurpleItem_diaglog, { id } })
    end
    JulianV:ChangeTitle()
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.PurpleItem_diaglog( nItemId ) -- chän tªn trang bÞ
    if (CountFreeRoomByWH(2, 3) < 1) then
        Talk(1, "",
            "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ<pic=46>");
        return
    end
    MAIN_TITLE = MAIN_TITLE ..
                     strfill_center(
                         " ChÕ t¹o <bclr=pink>" .. tbDoTim.tbTrangBi[nItemId].szName .. "<bclr> ",
                         70, ".")
    local tbOpt = {}
    for id, tbEquip in tbDoTim.tbTrangBi[nItemId].tbEquip do
        local nEqIdx, nGenre, nDetail, nPart = id, tbEquip[2], tbEquip[3], tbEquip[4]
        tinsert(tbOpt,
            { tbEquip[1], tbDoTim.getItemLevel, { nItemId, nEqIdx, nGenre, nDetail, nPart } })
    end
    JulianV:Show(tbOpt, main, MAIN_TITLE)
end

function tbDoTim.getItemLevel( nItemId, nEqIdx, nGenre, nDetail, nPart ) -- chän level trang bÞ
    tbCheTao.nItemId = nItemId
    tbCheTao.szName = tbDoTim.tbTrangBi[nItemId].tbEquip[nEqIdx][1]
    tbCheTao.nGenre = nGenre
    tbCheTao.nDetail = nDetail
    tbCheTao.nPart = nPart
    g_AskClientNumberEx(1, 10, "Item level", { tbDoTim.getItemSeries })
end

function tbDoTim.getItemSeries( nItemLevel ) -- chän ngò hµnh trang bÞ
    tbCheTao.nLevel = nItemLevel
    MAIN_TITLE = MAIN_TITLE ..
                     format("\n<pic=137> Trang bÞ: <bclr=blue>%s<bclr> cÊp: %d", tbCheTao.szName,
                         nItemLevel)
    local szTitle = MAIN_TITLE .. "\n<pic=136><color>Chän ngò hµnh:"
    local tbOpt = {}
    for nSeries, tbHe in tbDoTim.tbSeries do
        tinsert(tbOpt, { "HÖ " .. tbHe[1], tbDoTim.getLine, { 1, nSeries } })
    end
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.getLine( nLine, nSeries, tbLineOpt ) -- chän c¸c dßng
    tbCheTao.nSeries = nSeries
    local tbOpt = {}
    local szTitle = ""
    if nLine == 1 then -- dßng 1
        MAIN_TITLE = MAIN_TITLE .. "\n<pic=136><color> Ngò hµnh hÖ: " .. szSerires(nSeries)
    else -- dßng #1
        tinsert(tbCheTao.tbOptions, tbLineOpt)
        local nPreLine = nLine - 1
        local szColor = mod(nPreLine, 2) == 0 and "violet" or "pink"
        MAIN_TITLE = MAIN_TITLE ..
                         format("\n  - Dßng %d: <color=%s>%s<color>", nPreLine, szColor,
                             tbCheTao.tbOptions[nPreLine][1])
        Msg2Player("Dßng " .. nPreLine .. ": <color=green>" .. tbCheTao.tbOptions[nPreLine][1])
    end
    if nLine <= 6 then
        szTitle = MAIN_TITLE .. "\n<pic=135><color> Chän dßng " .. nLine .. ":"
        tbDoTim.insertTable(tbOpt, nLine + 1)
    else
        szTitle = MAIN_TITLE
        tinsert(tbOpt, { "§ång ý chÕ t¹o", tbDoTim.CheTaoDoTim })
    end
    JulianV:Show(tbOpt, nil, szTitle)
end

function tbDoTim.insertTable( tbOpt, nLine ) -- hiÓn thÞ c¸c dßng
    if tbCheTao.nItemId == 1 then -- check id nÕu lµ vò khÝ
        for _, optVK in tbDoTim.tbWeaponMagic[tbCheTao.nSeries] do
            if type(optVK) == "table" then
                tinsert(tbOpt, { optVK[1], tbDoTim.getLine, { nLine, tbCheTao.nSeries, optVK } })
            end
        end
    else
        if tbCheTao.nItemId == 9 then -- nÕu lµ giµy th× thªm dßng TDDC
            tinsert(tbOpt, {
                "Tèc ®é di chuyÓn", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "Tèc ®é di chuyÓn", 70 } },
            })
        end
        if tbCheTao.nItemId == 4 then -- nÕu lµ d©y chuyÒn th× thªm dßng Kh¸ng tÊt c¶
            tinsert(tbOpt, {
                "Kh¸ng tÊt c¶", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "Kh¸ng tÊt c¶", 120 } },
            })
        end
        if tbCheTao.nItemId == 3 and tbCheTao.nSeries == 0 then -- nÕu lµ ¸o hÖ Kim th× thªm dßng Ph¶n ®ßn cËn chiÕn
            tinsert(tbOpt, {
                "Ph¶n ®ßn cËn chiÕn", tbDoTim.getLine,
                { nLine, tbCheTao.nSeries, { "Ph¶n ®ßn cËn chiÕn", 80 } },
            })
        end
        for _, optTB in tbDoTim.tbEquipMagic[tbCheTao.nSeries] do
            if type(optTB) == "table" then
                tinsert(tbOpt, { optTB[1], tbDoTim.getLine, { nLine, tbCheTao.nSeries, optTB } })
            end
        end
    end
end

function tbDoTim:CheTaoDoTim()
    local nItemIdx = AddQualityItem(2, tbCheTao.nGenre, tbCheTao.nDetail, tbCheTao.nPart,
                         tbCheTao.nLevel, tbCheTao.nSeries, 500, tbCheTao.tbOptions[1][2],
                         tbCheTao.tbOptions[2][2], tbCheTao.tbOptions[3][2],
                         tbCheTao.tbOptions[4][2], tbCheTao.tbOptions[5][2],
                         tbCheTao.tbOptions[6][2])
    Msg2Player("NhËn ®­îc <color=pink>" .. GetItemName(nItemIdx)) -- tbCheTao.szName
    tbCheTao.tbOptions = {}
end
