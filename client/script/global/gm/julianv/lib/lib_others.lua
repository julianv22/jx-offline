tbPointsType = { -- C¸c lo¹i ®iÓm
    [1] = {
        szName = "Kinh nghiÖm (EXP)",
        szUnit = "®iÓm EXP",
        nLimit = 9999999999999999,
        pFun = function( num ) AddOwnExp(num) end,
    },
    [2] = {
        szName = "§¼ng cÊp (Level)",
        szUnit = "®¼ng cÊp",
        nLimit = 200,
        pFun = function( num ) ST_LevelUp(num - GetLevel()) end,
    },
    [3] = {
        szName = "TiÒm n¨ng",
        szUnit = "®iÓm TiÒm n¨ng",
        nLimit = 1000000,
        pFun = function( num ) AddProp(num) end,
    },
    [4] = {
        szName = "Kü n¨ng",
        szUnit = "®iÓm Kü n¨ng",
        nLimit = 999,
        pFun = function( num ) AddMagicPoint(num) end,
    },
    [5] = {
        szName = "TiÒn v¹n",
        szUnit = "v¹n l­îng",
        nLimit = 100000,
        pFun = function( num ) Earn(num * 10000) end,
    },
    [6] = {
        szName = "TiÒn §ång",
        szUnit = "TiÒn §ång",
        nLimit = 999,
        pFun = function( num ) for i = 1, num do AddStackItem(1, 4, 417, 1, 1, 0, 0, 0) end end,
    },
    [7] = {
        szName = "Kim Nguyªn B¶o",
        szUnit = "Kim Nguyªn B¶o",
        nLimit = 999,
        pFun = function( num ) for i = 1, num do AddEventItem(343) end end,
    },
    [8] = {
        szName = "Danh Väng",
        szUnit = "®iÓm Danh Väng",
        nLimit = 100000,
        pFun = function( num ) AddRepute(num) end,
    },
    [9] = {
        szName = "Phóc Duyªn",
        szUnit = "®iÓm Phóc Duyªn",
        nLimit = 100000,
        pFun = function( num )
            FuYuan_Start()
            FuYuan_Add(num)
        end,
    },
    [10] = {
        szName = "Tµi l·nh ®¹o",
        pFun = function()
            AddLeadExp(1000000000)
            Msg2Player(
                "NhËn ®­îc <color=yellow>1.000.000.000<color> <color=green>®iÓm l·nh ®¹o")
        end,
    },
    [11] = {
        szName = "§iÓm cèng hiÕn Bang Héi",
        pFun = function()
            AddContribution(1000000)
            Msg2Player(
                "NhËn ®­îc <color=yellow>1.000.000<color> <color=green>®iÓm cèng hiÕn Bang Héi")
        end,
    },
    [12] = {
        szName = "Ch©n Nguyªn vµ Hé M¹ch §¬n",
        pFun = function()
            SetTask(4000, GetTask(4000) + 12000)
            for i = 1, 12 do AddStackItem(500, 6, 1, 3203, 0, 0, 0) end
            Msg2Player(
                "NhËn ®­îc <color=yellow>60.000<color> Ch©n Nguyªn vµ <color=yellow>30.000<color> Hé M¹ch §¬n")
        end,
    },
}

tbDanhHieu = {
    VoLam = {
        { "Th¸i thó Ph­îng T­êng", 153 }, { "Th¸i thó Thµnh §«", 154 },
        { "Th¸i thó §¹i Lý", 155 }, { "Th¸i thó BiÖn Kinh", 156 },
        { "Th¸i thó T­¬ng D­¬ng", 157 }, { "Th¸i thó D­¬ng Ch©u", 158 },
        { "Th¸i thó L©m An", 159 }, { "Vâ L©m Liªn §Êu Qu¸n Qu©n", 81 },
        { "Vâ L©m Liªn §Êu H¹ng 2", 82 }, { "Vâ L©m Liªn §Êu H¹ng 3", 83 },
        { "Vâ L©m Liªn §Êu H¹ng 4", 84 }, { "Vâ L©m Minh Chñ", 188 },
        { "Phiªu M· §¹i T­íng Qu©n", 185 }, { "Ngù Long Cuång §ao", 165 },
        { "Long ThÇn KiÕm", 80 }, { "Thiªn H¹ §Ö NhÊt Bang", 189 },
        { "Vò Trô Hång Hoang", 205 }, { "Binh M· Nguyªn So¸i", 202 },
        { "Siªu Cao Thñ §Ö NhÊt B¶ng", 204 }, { "Cao Thñ Giang Hå", 208 },
        { "Thiªn H¹ §Ö NhÊt", 209 }, { "§Ö NhÊt Th­¬ng Nh©n", 210 },        
    },
    KiemThe = {
        { "GM Julian-V", 201 }, { "Uy ChÊn Cöu Ch©u", 192 }, { "Vâ L©m ChÝ T«n", 193 },
        { "NhÊt KiÕm Phong Thiªn", 194 }, { "NhÊt L­u Cao Thñ", 195 },
        { "HiÖp Kh¸ch Cuèi Cïng Trªn Giang Hå", 196 }, { "Siªu ThÇn", 200 },
        { "Phong V©n", 197 }, { "§¹i Th¸nh", 198 }, { "TrÊn Thiªn", 199 },
        { "Hoµng §Õ", 207 }, { "§éc Bé Thiªn H¹", 206 },
    },
}

function tbDanhHieu.Active( DanhHieu )
    -- local nTime = tonumber(FormatTime2String("%m%d%H%M", GetCurServerTime() * 60 * 60 * 24 * nDays))
    local nTime = tonumber(FormatTime2String("%m%d%H%M", GetCurServerTime() * 60 * 60 * 24 * 30))
    local szTitle = type(DanhHieu) == "table" and DanhHieu[1] or DanhHieu
    local nTitle = type(DanhHieu) == "table" and DanhHieu[2] or szTitle
    Title_AddTitle(nTitle, 1, nTime);
    Title_ActiveTitle(nTitle);
    SetTask(1122, nTitle);
    GMMsg2Player("KÝch ho¹t danh hiÖu", "<color=yellow>" .. szTitle)
end
