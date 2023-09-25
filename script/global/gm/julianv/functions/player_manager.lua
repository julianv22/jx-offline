------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
tbPointsType = { -- C�c lo�i �i�m
    [1] = {
        szName = "Kinh nghi�m (EXP)",
        szUnit = "�i�m EXP",
        nLimit = 9999999999999999,
        pFun = function(num)
            AddOwnExp(num)
        end
    },
    [2] = {
        szName = "��ng c�p (Level)",
        szUnit = "��ng c�p",
        nLimit = 200,
        pFun = function(num)
            ST_LevelUp(num - GetLevel())
        end
    },
    [3] = {
        szName = "Ti�m n�ng",
        szUnit = "�i�m Ti�m n�ng",
        nLimit = 1000000,
        pFun = function(num)
            AddProp(num)
        end
    },
    [4] = {
        szName = "K� n�ng",
        szUnit = "�i�m K� n�ng",
        nLimit = 999,
        pFun = function(num)
            AddMagicPoint(num)
        end
    },
    [5] = {
        szName = "Ti�n v�n",
        szUnit = "v�n l��ng",
        nLimit = 100000,
        pFun = function(num)
            Earn(num * 10000)
        end
    },
    [6] = {
        szName = "Ti�n ��ng",
        szUnit = "Ti�n ��ng",
        nLimit = 999,
        pFun = function(num)
            for i = 1, num do
                AddStackItem(1, 4, 417, 1, 1, 0, 0, 0)
            end
        end
    },
    [7] = {
        szName = "Kim Nguy�n B�o",
        szUnit = "Kim Nguy�n B�o",
        nLimit = 999,
        pFun = function(num)
            for i = 1, num do
                AddEventItem(343)
            end
        end
    },
    [8] = {
        szName = "Danh V�ng",
        szUnit = "�i�m Danh V�ng",
        nLimit = 100000,
        pFun = function(num)
            AddRepute(num)
        end
    },
    [9] = {
        szName = "Ph�c Duy�n",
        szUnit = "�i�m Ph�c Duy�n",
        nLimit = 100000,
        pFun = function(num)
            FuYuan_Start()
            FuYuan_Add(num)
        end
    },
    [10] = {
        szName = "T�i l�nh ��o",
        pFun = function()
            AddLeadExp(1000000000)
            Msg2Player("Nh�n ���c <color=yellow>1.000.000.000<color> <color=green>�i�m l�nh ��o")
        end
    },
    [11] = {
        szName = "�i�m c�ng hi�n Bang H�i",
        pFun = function()
            AddContribution(1000000)
            Msg2Player("Nh�n ���c <color=yellow>1.000.000<color> <color=green>�i�m c�ng hi�n Bang H�i")
        end
    },
    [12] = {
        szName = "Ch�n Nguy�n v� H� M�ch ��n",
        pFun = function()
            SetTask(4000, GetTask(4000) + 12000)
            for i = 1, 12 do
                AddStackItem(500, 6, 1, 3203, 0, 0, 0)
            end
            Msg2Player(
                "Nh�n ���c <color=yellow>60.000<color> Ch�n Nguy�n v� <color=yellow>30.000<color> H� M�ch ��n")
        end
    }
}

function change_PK(nType)
    if not nType then
        local tbSay = {"<sex>mu�n ��i sang m�u tr�ng th�i n�o<pic=44>"}
        local szPK = function(num)
            return format("%s (%s)", tbMonPhai.tbPK_Status[num][1], tbMonPhai.tbPK_Status[num][3])
        end
        for i = 0, getn(tbMonPhai.tbPK_Status) do
            tinsert(tbSay, szPK(i) .. "/change_PK")
        end
        tinsert(tbSay, "Ta s� quay l�i sau/return")
        CreateTaskSay(tbSay)
    else
        SetCurCamp(nType)
        SetCamp(nType)
        Msg2Player(format("�� ��i m�u PK sang <color=%s>%s", tbMonPhai.tbPK_Status[nType][2],
            tbMonPhai.tbPK_Status[nType][1]))
    end
end

Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua"); -- t�y tu�, c�ng �i�m nhanh
Include("\\script\\\\global\\\\gm\\\\julianv\\\\npc\\\\npc_congskill.lua") -- H� Tr� C�ng Full Skill

function skillSupport()
    local tbOpt = { --
    {"H�c Khinh c�ng", learnSkill, {210}}, --
    {"T�y T�y", ClearPoints_Dialog}, --
    {"C�ng �i�m nhanh", CongDiemNhanh}, --    
    {"Th�m - Xo� Skill n�ng cao", Skill_Nang_Cao}}
    tbDialog:Show(tbOpt, Player_Dialog)
end

function CongDiemNhanh()
    local tbSay = {"<sex>mu�n c�ng �i�m lo�i n�o<pic=44>", --
    "C�ng Ti�m n�ng nhanh/add_prop", --
    format("C�ng K� n�ng nhanh/#add_magic(%d)", GetLastFactionNumber()), --
    "Ta s� quay l�i sau/return"}
    CreateTaskSay(tbSay)
end

function learnSkill(nSkillId, nLevel)
    if HaveMagic(nSkillId) == 1 then
        Talk(1, "", "Ng��i �� s� h�u k� n�ng n�y r�i")
    else
        AddMagic(nSkillId, nLevel and nLevel or 1)
    end
end

function ClearPoints_Dialog()
    local tbSay = {"<sex>mu�n t�y tu� lo�i n�o<pic=44>", --
    "T�y Ti�m n�ng/DoClearPropCore", --
    "T�y K� n�ng/DoClearSkillCore", --
    "Kh�ng t�y/return"}
    CreateTaskSay(tbSay)
end

function Skill_Nang_Cao()
    local tbSay = {"<sex>mu�n s� d�ng ch�c n�ng n�o<pic=44>", --
    format("Th�m Skill (SkillID, Level)/#AdvancedSkill(0)"), --
    "Xo� Skill (SkillID)/#DelAdvSkill(0)", --
    "Tr� l�i/skillSupport", --
    "K�t th�c ��i tho�i/return"}
    CreateTaskSay(tbSay)
end

function AdvancedSkill(szSkill)
    if szSkill == 0 then
        g_AskClientStringEx("1995,20", 1, 100, "Skill ID", {AdvancedSkill})
    else
        local tbSkill = lib:Split(szSkill, ",")
        if getn(tbSkill) > 2 then
            Talk(1, "", "Qu� nhi�u tham s�, ch� nh�n 2 tham s� l� Skill ID v� Level")
        else
            local nSkillId, nLevel = tonumber(tbSkill[1]), tonumber(tbSkill[2])
            AddMagic(nSkillId, nLevel)
            Msg2Player("Nh�n ���c Skill <color=yellow>" .. GetSkillName(nSkillId) .. "<color> c�p " .. nLevel)
        end
    end
end

function DelAdvSkill(nSkillId)
    if nSkillId == 0 then
        g_AskClientNumberEx(1, 9999, "Skill ID", {DelAdvSkill})
    else
        DelMagic(nSkillId)
        Msg2Player("�� xo� Skill <color=yellow>" .. GetSkillName(nSkillId))
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
        g_AskClientNumberEx(1, nLimit, "S� l��ng:", {Set_Points, {nType}})
    else
        tbPointsType[nType].pFun()
    end
end

function Set_Points(nType, num)
    if num ~= 0 then
        tbPointsType[nType].pFun(num)
        Msg2Player("Nh�n ���c <color=yellow>" .. num .. "<color> <color=green>" .. tbPointsType[nType].szUnit)
    end
end

function Change_Sex(bComfirm)
    if not bComfirm then
        local tbOpt = { --
        {"�i th�i!", Change_Sex, {1}}, --
        {"�� ta suy ngh� l�i..."}}
        CreateNewSayEx(SPRLINK .. "<sex>{{" .. GetName() ..
                           "}} c� ch�c ch�n mu�n sang Th�i kh�ng <pic=108><color>", tbOpt)
    else
        SetSex(GetSex() == 1 and 0 or 1)
        Talk(1, "KickOutSelf", "�� chuy�n gi�i th�nh c�ng")
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
            "<sex>hi�n t�i l� h� " .. szSeries(nCurSeries) .. "\n\nM�i ch�n ng� h�nh mu�n ��i:")
    else
        if nCurSeries == nSeries then
            Talk(1, "", "�� l� h� " .. szSeries(nCurSeries) .. " r�i, kh�ng c�n chuy�n n�a!")
        else
            SetSeries(nSeries)
            Talk(1, "KickOutSelf", "�� chuy�n sang h� " .. szSeries(nSeries))
        end
    end
end

function renameCharacter(szName)
    if not szName then
        AskClientForString("renameCharacter", "", 1, 100, "Nh�p t�n m�i")
    else
        RenameRole(szName)
    end
end
