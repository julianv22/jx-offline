IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\thinh\\hotro\\functions_points.lua")
------------------------------------------------------------------------------------------------------------
function main()
    -- dofile("script/global/thinh/npc/npc_vocong.lua")
    dialog_vocong_main()
end

function dialog_vocong_main()
    local szTitle = "Xin ch�o <color=red>" .. GetName() .. "<color> ! ��i hi�p h�c v� c�ng g�?"
    local tbOpt = {"V�o Ph�i V� H�c Skill 180/choose_faction", "H�c Khinh C�ng/khinhcong",
                   "Nh�n c�c lo�i �i�m/CacLoaiDiem", "L�y Skill Theo ID/LaySkillID",
                   "��i T�n Nh�n V�t/doiten", "Chuy�n ��i gi�i t�nh, Ng� H�nh/nguhanh",
                   "T�y T�y/clear_attibute_point", "K�t th�c ��i tho�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function doiten()
    AskClientForString("doitennv", "", 1, 100, "Xin nh�p t�n m�i");
end
function doitennv(strings)
    RenameRole(strings)
end

function nguhanh()
    local szTitle = "Ng��i c�n g�?"
    local tbOpt = {"Chuy�n ��i N� sang h� Kim/nukim", "Chuy�n ��i Nam sang h� Th�y/namthuy",
                   "Chuy�n Gi�i/chuyengioi", "Tr� l�i/dialog_vocong_main", "K�t th�c ��i tho�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function chuyengioi()
    if GetSex() == 1 then
        SetSex(0)
    else
        SetSex(1)
    end
    Talk(1, "", "�� chuy�n gi�i th�nh c�ng")
    KickOutSelf()
end

function nukim()
    if GetSex() == 1 then
        SetSeries(0)
        KickOutSelf()
    else
        Talk(1, "", "Ng��i l� P� �� � ?")
    end
end

function namthuy()
    if GetSex() == 0 then
        SetSeries(2)
        KickOutSelf()
    else
        Talk(1, "", "Vui l�ng ki�m tra l�i gi�i t�nh")
    end
end

--------------------------------Hoc Skill -----------------------------------------------------
tbFaction = {
    [1] = {
        szShowName = "Thi�u L�m",
        szFaction = "shaolin",
        nShortFaction = "sl",
        tbSkill = {318, 319, 321, 709, 1055, 1056, 1057, 1220},
        tbRank = {72}
    },
    [2] = {
        szShowName = "Thi�n V��ng Bang",
        szFaction = "tianwang",
        nShortFaction = "tw",
        tbSkill = {322, 325, 323, 708, 1058, 1059, 1060, 1221},
        tbRank = {69}
    },
    [3] = {
        szShowName = "���ng M�n",
        szFaction = "tangmen",
        nShortFaction = "tm",
        tbSkill = {339, 302, 342, 710, 1069, 1070, 1071, 1110, 1223},
        tbRank = {76}
    },
    [4] = {
        szShowName = "Ng� ��c Gi�o",
        szFaction = "wudu",
        nShortFaction = "wu",
        tbSkill = {353, 355, 711, 1066, 1067, 1222},
        tbRank = {80}
    },
    [5] = {
        szShowName = "Nga Mi",
        szFaction = "emei",
        nShortFaction = "em",
        tbSkill = {380, 328, 712, 1061, 1062, 1114, 1224},
        tbRank = {64}
    },
    [6] = {
        szShowName = "Th�y Y�n",
        szFaction = "cuiyan",
        nShortFaction = "cy",
        tbSkill = {336, 337, 713, 1063, 1065, 1225},
        tbRank = {67}
    },
    [7] = {
        szShowName = "C�i Bang",
        szFaction = "gaibang",
        nShortFaction = "gb",
        tbSkill = {357, 359, 714, 1073, 1074, 1227},
        tbRank = {78}
    },
    [8] = {
        szShowName = "Thi�n Nh�n Gi�o",
        szFaction = "tianren",
        nShortFaction = "tr",
        tbSkill = {361, 362, 715, 1075, 1076, 1226},
        tbRank = {81}
    },
    [9] = {
        szShowName = "V� �ang",
        szFaction = "wudang",
        nShortFaction = "wd",
        tbSkill = {365, 368, 716, 1078, 1079, 1228},
        tbRank = {73}
    },
    [10] = {
        szShowName = "C�n L�n",
        szFaction = "kunlun",
        nShortFaction = "kl",
        tbSkill = {372, 375, 717, 1080, 1081, 1229},
        tbRank = {75}
    }
}
tbFactionSeries = {
    [1] = {1, 2},
    [2] = {3, 4},
    [3] = {5, 6},
    [4] = {7, 8},
    [5] = {9, 10}
}

function check_faction()
    -- local szCurFaction = GetFaction()
    local FactionNumber = GetLastFactionNumber()
    -- Msg2Player("T�n m�n ph�i c�a b�n l�:  <color=yellow>"..szCurFaction.."<color>.") 
    -- Msg2Player("Ch� s� m�n ph�i c�a b�n l�:  <color=yellow>"..FactionNumber.."<color>.") 
    if FactionNumber >= 0 then
        return 0
    else
        return 1
    end
end

function vaohoason()
    SetFaction("huashan");
    SetCamp(3);
    SetCurCamp(3);
    SetRank(89);
    SetSeries(2);
    SetLastFactionNumber(10);
    AddMagic(1347, 0)
    AddMagic(1372, 0)
    AddMagic(1349, 0)
    AddMagic(1374, 0)
    AddMagic(1350, 0)
    AddMagic(1375, 0)
    AddMagic(1351, 0)
    AddMagic(1376, 0)
    AddMagic(1354, 0)
    AddMagic(1378, 0)
    AddMagic(1355, 0)
    AddMagic(1379, 0)
    AddMagic(1380, 0)
    AddMagic(1360, 0)
    AddMagic(1358, 0)
    AddMagic(1364, 20) --
    AddMagic(1382, 20) --
    AddMagic(1365, 20) -- 120
    AddMagic(1384, 20) --
    AddMagic(1369, 20) --
    AddMagic(1370, 20) --
    Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=yellow>Hoa S�n<color>")
end
-----------------------------------------------------------------------------------------------------------
function vaovuhon()
    SetFaction("wuhun");
    SetCamp(1);
    SetCurCamp(1);
    SetRank(97);
    SetSeries(3);
    SetLastFactionNumber(11);
    AddMagic(1963, 0)
    AddMagic(1964, 0)
    AddMagic(1965, 0)
    AddMagic(1971, 0)
    AddMagic(1972, 0)
    AddMagic(1974, 0)
    AddMagic(1975, 0)
    AddMagic(1976, 0)
    AddMagic(1977, 0)
    AddMagic(1979, 0)
    AddMagic(1980, 0)
    AddMagic(1981, 0)
    AddMagic(1982, 0)
    AddMagic(1967, 20) --
    AddMagic(1969, 20) --
    AddMagic(1983, 20) --
    AddMagic(1984, 20) --
    AddMagic(1985, 20) --
    AddMagic(1986, 20) --
    Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=yellow>V� H�n<color>")
end
-----------------------------------------------------------------------------------------------------------------------------
function vaotieudao()
    SetFaction("xiaoyao");
    SetCamp(3);
    SetCurCamp(4);
    SetRank(98);
    SetSeries(4);
    SetLastFactionNumber(12);
    AddMagic(1881, 0) -- level 10
    AddMagic(1905, 0) -- level 10
    AddMagic(1882, 0) -- level 20
    AddMagic(1906, 0) -- level 20
    AddMagic(1883, 0) -- level 30
    AddMagic(1885, 0) -- level 40
    AddMagic(1907, 0) -- level 40
    AddMagic(1887, 0) -- level 50
    AddMagic(1909, 0) -- level 50
    AddMagic(1888, 0) -- level 60
    AddMagic(1889, 0) -- level 60
    AddMagic(1890, 0) -- level 60
    AddMagic(1891, 20) ---- level 90
    AddMagic(1910, 20) ---- level 90
    AddMagic(1894, 20) ---- level 120
    AddMagic(1896, 20) ---- level 150
    AddMagic(1911, 20) ---- level 150
    AddMagic(1901, 20) ---- level 180
    Talk(1, "KickOutSelf", "Ng��i �� gia nh�p th�nh c�ng ph�i <color=fire>Ti�u Dao<color>")
end
-----------------------------------------------------------------------------------------------------------------------------
function choose_faction()
    if check_faction() ~= 1 then
        Talk(1, "", "Ng��i �� gia nh�p m�n ph�i.")
        return
    end
    local nSeries = GetSeries() + 1
    local szTitle = "Xin ch�o <color=red>" .. GetName() ..
                        "<color>. M�t khi gia nh�p m�n ph�i kh�ng th� thay ��i, h�y suy ngh� k�"
    local tbOpt = {}
    for i = 1, getn(tbFactionSeries[nSeries]) do
        local nIndex = tbFactionSeries[nSeries][i]
        tinsert(tbOpt, tbFaction[nIndex].szShowName .. "/#set_faction(" .. nIndex .. ")")
    end
    if nSeries == 3 then
        tinsert(tbOpt, "Hoa S�n/#vuhon_hoason(0)")
    end
    if nSeries == 4 then
        tinsert(tbOpt, "V� H�n/#vuhon_hoason(1)")
    end
    if nSeries == 5 then
        tinsert(tbOpt, "Ti�u Dao/#vuhon_hoason(2)")
    end
    tinsert(tbOpt, "Tr� V�/dialog_vocong_main")
    tinsert(tbOpt, "Tho�t/no")
    Say(szTitle, getn(tbOpt), tbOpt)
end

function vuhon_hoason(num)
    local szTitle = {}
    local tbOpt = {}
    if num == 0 then
        szTitle = "<color=red>" .. GetName() ..
                      "<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=yellow>Hoa S�n<color> kh�ng?"
        tbOpt = {"X�c nh�n!/vaohoason", "Tr� V�/dialog_vocong_main", "K�t th�c ��i tho�i./no"}
    elseif num == 1 then
        szTitle = "<color=red>" .. GetName() ..
                      "<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=yellow>V� H�n<color> kh�ng?"
        tbOpt = {"X�c nh�n!/vaovuhon", "Tr� V�/dialog_vocong_main", "K�t th�c ��i tho�i./no"}
    elseif num == 2 then
        szTitle = "<color=red>" .. GetName() ..
                      "<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=yellow>Ti�u Dao<color> kh�ng?"
        tbOpt = {"X�c nh�n!/vaotieudao", "Tr� V�/dialog_vocong_main", "K�t th�c ��i tho�i./no"}

    end
    Say(szTitle, getn(tbOpt), tbOpt)
end

function set_faction(nIndex)
    local szTitle = format("<color=red>" .. GetName() ..
                               "<color> ng��i c� ch�c ch�n mu�n gia nh�p ph�i <color=yellow>%s<color> kh�ng?",
        tbFaction[nIndex].szShowName)
    local tbOpt = {"X�c nh�n!/#do_set_faction(" .. nIndex .. ")", "Tr� V�/choose_faction",
                   "K�t th�c ��i tho�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function do_set_faction(nIndex)
    if check_faction() ~= 1 then
        Talk(1, "", "Ng��i �� gia nh�p m�n ph�i.")
        return
    end
    local nResult = SetFaction(tbFaction[nIndex].szFaction)
    if nResult == 0 then
        return
    end
    DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", tbFaction[nIndex].nShortFaction, 0)
    for i = 1, getn(tbFaction[nIndex].tbSkill) do -- Add Skill 90-120-150-180
        if tbFaction[nIndex].tbSkill[i] == 1110 then
            AddMagic(tbFaction[nIndex].tbSkill[i], 0)
        else
            AddMagic(tbFaction[nIndex].tbSkill[i], 20)
        end
    end
    for i = 1, getn(tbFaction[nIndex].tbRank) do -- Add X�ng Hi�u
        SetRank(tbFaction[nIndex].tbRank[i])
    end
    SetCurCamp(4) ----M�u ch� ��
    SetCamp(4)
    Talk(1, "KickOutSelf",
        format("Ng��i �� gia nh�p th�nh c�ng ph�i <color=yellow>%s", tbFaction[nIndex].szShowName))
end

------Khinh Cong----------------------

function khinhcong()
    AddMagic(210, 1)
    Talk(1, "", "�� h�c ���c khinh c�ng.")
end

------Tay Tuy------------
function clear_attibute_point()
    local szTitle = "Xin ch�o <color=red>" .. GetName() .. "<color>. B�n c�n t�y �i�m Ti�m N�ng hay K� N�ng?"
    local tbOpt = {"T�y �i�m K� N�ng./do_clear_skill", "T�y �i�m Ti�m N�ng./do_clear_prop",
                   "Tr� V�/dialog_vocong_main", "Tho�t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function do_clear_skill()
    local i = HaveMagic(210)
    local j = HaveMagic(400)
    local n = RollbackSkill()
    local x = 0
    if (i ~= -1) then
        i = 1;
        x = x + i
    end
    if (j ~= -1) then
        x = x + j
    end
    local rollback_point = n - x
    if (rollback_point + GetMagicPoint() < 0) then
        rollback_point = -1 * GetMagicPoint()
    end
    AddMagicPoint(rollback_point)
    if (i ~= -1) then
        AddMagic(210, i)
    end
    if (j ~= -1) then
        AddMagic(400, j)
    end
    Msg2Player("T�y t�y th�nh c�ng! Ng��i c� " .. rollback_point .. " �i�m k� n�ng �� ph�n ph�i l�i.")
    KickOutSelf()
end
function do_clear_prop()
    local base_str = {35, 20, 25, 30, 20}
    local base_dex = {25, 35, 25, 20, 15}
    local base_vit = {25, 20, 25, 30, 25}
    local base_eng = {15, 25, 25, 20, 40}
    local player_series = GetSeries() + 1

    local Utask88 = GetTask(88)
    AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))
    AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
    AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
    AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end

------Lay Skill Theo ID--------
function LaySkillID()
    local szTitle = "Xin ch�o  <color=red>" .. GetName() .. "<color>, b�n mu�n nh�n hay x�a skill n�o?"
    local tbOpt = {{"L�y Skill", g_AskClientStringEx, {"69,20", 0, 256, "ID Skill", {AddSkill, {self}}}},
                   {"X�a Skill", g_AskClientStringEx, {"69", 0, 300, "ID Skill", {DelSkill, {self}}}},
                   {"L�y Danh S�ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {AddDSSkill, {self}}}},
                   {"X�a Danh S�ch Skill", g_AskClientStringEx, {"69,70", 0, 256, "ID Skill", {DelDSSkill, {self}}}},
                   {"Tr� v�", dialog_vocong_main}, {"Tho�t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        AddMagic(i, 20)
    end
end

function DelDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        DelMagic(i)
    end
end

function AddSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local id = tonumber(tbPos[1])
    local cap = tonumber(tbPos[2])
    AddMagic(id, cap)
end

function DelSkill(szPos)
    local idskill = tonumber(szPos)
    DelMagic(idskill)
end
