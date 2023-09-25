------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
tbPointsType = { -- C¸c lo¹i ®iÓm
    [1] = {
        szName = "Kinh nghiÖm (EXP)",
        szUnit = "®iÓm EXP",
        nLimit = 9999999999999999,
        pFun = function(num)
            AddOwnExp(num)
        end
    },
    [2] = {
        szName = "§¼ng cÊp (Level)",
        szUnit = "®¼ng cÊp",
        nLimit = 200,
        pFun = function(num)
            ST_LevelUp(num - GetLevel())
        end
    },
    [3] = {
        szName = "TiÒm n¨ng",
        szUnit = "®iÓm TiÒm n¨ng",
        nLimit = 1000000,
        pFun = function(num)
            AddProp(num)
        end
    },
    [4] = {
        szName = "Kü n¨ng",
        szUnit = "®iÓm Kü n¨ng",
        nLimit = 999,
        pFun = function(num)
            AddMagicPoint(num)
        end
    },
    [5] = {
        szName = "TiÒn v¹n",
        szUnit = "v¹n l­îng",
        nLimit = 100000,
        pFun = function(num)
            Earn(num * 10000)
        end
    },
    [6] = {
        szName = "TiÒn §ång",
        szUnit = "TiÒn §ång",
        nLimit = 999,
        pFun = function(num)
            for i = 1, num do
                AddStackItem(1, 4, 417, 1, 1, 0, 0, 0)
            end
        end
    },
    [7] = {
        szName = "Kim Nguyªn B¶o",
        szUnit = "Kim Nguyªn B¶o",
        nLimit = 999,
        pFun = function(num)
            for i = 1, num do
                AddEventItem(343)
            end
        end
    },
    [8] = {
        szName = "Danh Väng",
        szUnit = "®iÓm Danh Väng",
        nLimit = 100000,
        pFun = function(num)
            AddRepute(num)
        end
    },
    [9] = {
        szName = "Phóc Duyªn",
        szUnit = "®iÓm Phóc Duyªn",
        nLimit = 100000,
        pFun = function(num)
            FuYuan_Start()
            FuYuan_Add(num)
        end
    },
    [10] = {
        szName = "Tµi l·nh ®¹o",
        pFun = function()
            AddLeadExp(1000000000)
            Msg2Player("NhËn ®­îc <color=yellow>1.000.000.000<color> <color=green>®iÓm l·nh ®¹o")
        end
    },
    [11] = {
        szName = "§iÓm cèng hiÕn Bang Héi",
        pFun = function()
            AddContribution(1000000)
            Msg2Player("NhËn ®­îc <color=yellow>1.000.000<color> <color=green>®iÓm cèng hiÕn Bang Héi")
        end
    },
    [12] = {
        szName = "Ch©n Nguyªn vµ Hé M¹ch §¬n",
        pFun = function()
            SetTask(4000, GetTask(4000) + 12000)
            for i = 1, 12 do
                AddStackItem(500, 6, 1, 3203, 0, 0, 0)
            end
            Msg2Player(
                "NhËn ®­îc <color=yellow>60.000<color> Ch©n Nguyªn vµ <color=yellow>30.000<color> Hé M¹ch §¬n")
        end
    }
}

function change_PK(nType)
    if not nType then
        local tbSay = {"<sex>muèn ®æi sang mµu tr¹ng th¸i nµo<pic=44>"}
        local szPK = function(num)
            return format("%s (%s)", tbMonPhai.tbPK_Status[num][1], tbMonPhai.tbPK_Status[num][3])
        end
        for i = 0, getn(tbMonPhai.tbPK_Status) do
            tinsert(tbSay, szPK(i) .. "/change_PK")
        end
        tinsert(tbSay, "Ta sÏ quay l¹i sau/return")
        CreateTaskSay(tbSay)
    else
        SetCurCamp(nType)
        SetCamp(nType)
        Msg2Player(format("§· ®æi mµu PK sang <color=%s>%s", tbMonPhai.tbPK_Status[nType][2],
            tbMonPhai.tbPK_Status[nType][1]))
    end
end

Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua"); -- tÈy tuû, c«ng ®iÓm nhanh
Include("\\script\\\\global\\\\gm\\\\julianv\\\\npc\\\\npc_congskill.lua") -- Hç Trî Céng Full Skill

function skillSupport()
    local tbOpt = { --
    {"Häc Khinh c«ng", learnSkill, {210}}, --
    {"TÈy Tñy", ClearPoints_Dialog}, --
    {"Céng ®iÓm nhanh", CongDiemNhanh}, --    
    {"Thªm - Xo¸ Skill n©ng cao", Skill_Nang_Cao}}
    tbDialog:Show(tbOpt, Player_Dialog)
end

function CongDiemNhanh()
    local tbSay = {"<sex>muèn céng ®iÓm lo¹i nµo<pic=44>", --
    "Céng TiÒm n¨ng nhanh/add_prop", --
    format("Céng Kü n¨ng nhanh/#add_magic(%d)", GetLastFactionNumber()), --
    "Ta sÏ quay l¹i sau/return"}
    CreateTaskSay(tbSay)
end

function learnSkill(nSkillId, nLevel)
    if HaveMagic(nSkillId) == 1 then
        Talk(1, "", "Ng­¬i ®· së h÷u kü n¨ng nµy råi")
    else
        AddMagic(nSkillId, nLevel and nLevel or 1)
    end
end

function ClearPoints_Dialog()
    local tbSay = {"<sex>muèn tÈy tuû lo¹i nµo<pic=44>", --
    "TÈy TiÒm n¨ng/DoClearPropCore", --
    "TÈy Kü n¨ng/DoClearSkillCore", --
    "Kh«ng tÈy/return"}
    CreateTaskSay(tbSay)
end

function Skill_Nang_Cao()
    local tbSay = {"<sex>muèn sö dông chøc n¨ng nµo<pic=44>", --
    format("Thªm Skill (SkillID, Level)/#AdvancedSkill(0)"), --
    "Xo¸ Skill (SkillID)/#DelAdvSkill(0)", --
    "Trë l¹i/skillSupport", --
    "KÕt thóc ®èi tho¹i/return"}
    CreateTaskSay(tbSay)
end

function AdvancedSkill(szSkill)
    if szSkill == 0 then
        g_AskClientStringEx("1995,20", 1, 100, "Skill ID", {AdvancedSkill})
    else
        local tbSkill = lib:Split(szSkill, ",")
        if getn(tbSkill) > 2 then
            Talk(1, "", "Qu¸ nhiÒu tham sè, chØ nhËn 2 tham sè lµ Skill ID vµ Level")
        else
            local nSkillId, nLevel = tonumber(tbSkill[1]), tonumber(tbSkill[2])
            AddMagic(nSkillId, nLevel)
            Msg2Player("NhËn ®­îc Skill <color=yellow>" .. GetSkillName(nSkillId) .. "<color> cÊp " .. nLevel)
        end
    end
end

function DelAdvSkill(nSkillId)
    if nSkillId == 0 then
        g_AskClientNumberEx(1, 9999, "Skill ID", {DelAdvSkill})
    else
        DelMagic(nSkillId)
        Msg2Player("§· xo¸ Skill <color=yellow>" .. GetSkillName(nSkillId))
    end
end

function Point_Dialog()
    local tbOpt = {}
    for id, tbPoints in tbPointsType do
        tinsert(tbOpt, {tbPoints.szName, Pick_Points, {id, tbPoints.nLimit}})
    end
    tbDialog:Show(tbOpt, Player_Dialog)
end

function Pick_Points(nType, nLimit)
    if nType < 10 then
        g_AskClientNumberEx(1, nLimit, "Sè l­îng:", {Set_Points, {nType}})
    else
        tbPointsType[nType].pFun()
    end
end

function Set_Points(nType, num)
    if num ~= 0 then
        tbPointsType[nType].pFun(num)
        Msg2Player("NhËn ®­îc <color=yellow>" .. num .. "<color> <color=green>" .. tbPointsType[nType].szUnit)
    end
end

function Change_Sex(bComfirm)
    if not bComfirm then
        local tbOpt = { --
        {"§i th«i!", Change_Sex, {1}}, --
        {"§Ó ta suy nghÜ l¹i..."}}
        CreateNewSayEx(SPRLINK .. "<sex>{{" .. GetName() ..
                           "}} cã ch¾c ch¾n muèn sang Th¸i kh«ng <pic=108><color>", tbOpt)
    else
        SetSex(GetSex() == 1 and 0 or 1)
        Talk(1, "KickOutSelf", "§· chuyÓn giíi thµnh c«ng")
    end
end

function Change_Serries(nSeries)
    local nCurSeries = GetSeries()
    local szSeries = function(num)
        return format("<color=%s>%s<color>", tbMonPhai.tbSeries[num][2], tbMonPhai.tbSeries[num][1])
    end
    if not nSeries then
        local tbOpt = {}
        for i = 0, getn(tbMonPhai.tbSeries) do
            tinsert(tbOpt, {tbMonPhai.tbSeries[i][1], Change_Serries, {i}})
        end
        tbDialog:Show(tbOpt, Player_Dialog,
            "<sex>hiÖn t¹i lµ hÖ " .. szSeries(nCurSeries) .. "\n\nMêi chän ngò hµnh muèn ®æi:")
    else
        if nCurSeries == nSeries then
            Talk(1, "", "§· lµ hÖ " .. szSeries(nCurSeries) .. " råi, kh«ng cÇn chuyÓn n÷a!")
        else
            SetSeries(nSeries)
            Talk(1, "KickOutSelf", "§· chuyÓn sang hÖ " .. szSeries(nSeries))
        end
    end
end

function renameCharacter(szName)
    if not szName then
        AskClientForString("renameCharacter", "", 1, 100, "NhËp tªn míi")
    else
        RenameRole(szName)
    end
end
