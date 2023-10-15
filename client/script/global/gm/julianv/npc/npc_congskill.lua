IncludeLib("SETTING")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\lib\\log.lua")
------------------------------------------------------------------------------------------------------------
function main()
    dofile("script/global/gm/julianv/npc/npc_congskill.lua")
    dialog_main()
end
tbChat = {
    "<color=green>Ch�o m�ng qu� nh�n s� <pic=1>",
    "<color=green>Ai c�n c�ng Skill h�y t�i ��y",
    "<color=orange>Ch�c ��i hi�p ch�i game vui v�, nh� like, share k�nh Youtube PYTA Gaming nha!",
}
function npcchat_npcmacdinh()
    local nNpcIndex = GetLastDiagNpc();
    local nTaskChat = GetNpcParam(nNpcIndex, 1);
    if nTaskChat == 0 then
        SetNpcParam(nNpcIndex, 1, 1); -- set index ��u ti�n c�a table npc chat.
        SetNpcTimer(nNpcIndex, 500); -- Tu� ch�nh th�i gian npc t� chat (20 s)
    end
end
function OnTimer( nNpcIndex, nTimeOut )
    local nTaskChat = GetNpcParam(nNpcIndex, 1);
    if not nTaskChat or nTaskChat <= 0 then
        nTaskChat = 1;
    else
        nTaskChat = nTaskChat + 1;
    end
    if nTaskChat > getn(tbChat) then nTaskChat = 1; end
    NpcChat(nNpcIndex, tbChat[nTaskChat], 1);
    SetNpcParam(nNpcIndex, 1, nTaskChat)
    SetNpcTimer(nNpcIndex, 500);
end

function dialog_main()
    npcchat_npcmacdinh()
    local szTitle = "<npc> Xin ch�o <color=red>" .. GetName() ..
                        "<color> ! Ta l� ng��i h� tr� c�c nh�n s� khi m�i tham gia v�o <color=yellow>V� L�m Truy�n K�<color>. \n\n<color=green>Ch� � b�o v� s�c kh�e v� t�i s�n khi ch�i Game.<pic=115><color>"
    tbOpt = { { "H� Tr� C�ng Full Skill", HoTroTanThu }, { "Th�i" } }
    CreateNewSayEx(szTitle, tbOpt)
end
-------Full Skill------------
tb_skill_add = {
    [0] = { -- thi�u l�m
        [1] = { 10, 14, 4, 6, 8, 15, 16, 20, 11, 19, 271, 21, 273 },
        [2] = { "Thi�u L�m Quy�n", "Quy�n Ph�p", 14, 8, 271, 273 },
        [3] = { "Thi�u L�m �ao", "�ao Ph�p", 6, 19, 273 },
        [4] = { "Thi�u L�m C�n", "C�n Ph�p", 10, 4, 11, 273 },
    },
    [1] = { -- thi�n v��ng
        [1] = { 29, 30, 34, 23, 24, 26, 33, 31, 35, 3740, 42, 32, 36, 41, 324 },
        [2] = { "Thi�n V��ng Th��ng", "Th��ng Ph�p", 30, 23, 35, 41, 36 },
        [3] = { "Thi�n V��ng Ch�y", "Ch�y Ph�p", 29, 26, 31, 324, 36 },
        [4] = { "Thi�n V��ng �ao", "�ao Ph�p", 34, 24, 32, 37, 36 },
    },
    [2] = { -- ���ng m�n
        [1] = { 45, 43, 347, 303, 47, 50, 54, 343, 345, 349, 48, 58, 249, 341 },
        [2] = { "���ng M�n - Phi Ti�u", "Phi Ti�u Thu�t", 45, 43, 47, 341, 48 },
        [3] = { "���ng M�n - Phi �ao", "Phi �ao Thu�t", 45, 43, 50, 249, 48 },
        [4] = { "���ng M�n - T� Ti�n", "T� Ti�n Thu�t", 45, 43, 54, 58, 48 },
        [5] = { "���ng M�n - B�y", "H�m T�nh Thu�t", 303, 347, 343, 349, 345, 48 },
    },
    [3] = { -- ng� ��c
        [1] = { 63, 65, 60, 62, 67, 66, 70, 64, 68, 69, 384, 73, 356, 72, 71, 74, 75 },
        [2] = { "Ng� ��c �ao", "�ao Ph�p", 65, 60, 384, 74, 75 },
        [3] = { "Ng� ��c Ch��ng", "Ch��ng Ph�p", 63, 62, 68, 71, 75 },
        [4] = { "Ng� ��c B�a", "B�a Ch�", 67, 70, 64, 356, 72, 75 },
    },
    [4] = { -- nga mi
        [1] = { 80, 85, 77, 79, 93, 82, 89, 385, 86, 92, 88, 91, 252, 282 },
        [2] = { "Nga Mi Ki�m", "Ki�m Ph�p", 85, 77, 385, 88, 252 },
        [3] = { "Nga Mi Ch��ng", "Ch��ng Ph�p", 80, 79, 82, 91, 252 },
        [4] = { "Nga Mi Ph� Tr�", "Ph� Tr�", 93, 89, 86, 92, 282, 252 },
    },
    [5] = { -- th�y y�n
        [1] = { 99, 102, 95, 97, 269, 105, 113, 100, 109, 108, 111, 114 },
        [2] = { "Th�y Y�n �ao", "�ao Ph�p", 99, 95, 105, 109, 108, 114 },
        [3] = { "Th�y Y�n Song �ao", "Ch��ng Ph�p", 102, 97, 113, 111, 114 },
    },
    [6] = { -- c�i bang
        [1] = { 119, 122, 115, 116, 129, 124, 274, 277, 125, 128, 130, 360 },
        [2] = { "C�i Bang B�ng", "B�ng Ph�p", 119, 115, 124, 125, 360, 130 },
        [3] = { "C�i Bang R�ng", "Ch��ng Ph�p", 122, 116, 274, 128, 360, 130 },
    },
    [7] = { -- thi�n nh�n
        [1] = { 135, 145, 131, 132, 136, 137, 138, 140, 141, 364, 143, 142, 148, 150 },
        [2] = { "Thi�n Nh�n M�u", "M�u Ph�p", 135, 132, 141, 142, 150 },
        [3] = { "Thi�n Nh�n �ao Ph�p", "�ao Ph�p", 145, 131, 138, 148, 150 },
        [4] = { "Thi�n Nh�n B�a", "B�a Ch�", 136, 137, 140, 364, 143, 150 },
    },
    [8] = { -- v� �ang
        [1] = { 153, 155, 151, 152, 159, 158, 164, 160, 157, 165, 166, 267 },
        [2] = { "V� �ang Ki�m", "Ki�m Ph�p", 155, 151, 158, 267, 166 },
        [3] = { "V� �ang Kh�", "Quy�n Ph�p", 153, 152, 164, 165, 166 },
    },
    [9] = { -- c�n l�n
        [1] = {
            169, 179, 167, 168, 171, 392, 174, 172, 173, 178, 393, 175, 181, 90, 176, 182, 275, 630,
        },
        [2] = { "C�n L�n �ao", "�ao Ph�p", 169, 167, 178, 176, 275 },
        [3] = { "C�n L�n Ki�m", "Ki�m Ph�p", 179, 168, 172, 182, 275 },
        [4] = { "C�n L�n B�a", "B�a Ch�", 392, 174, 393, 175, 90, 275 },
    },
    [10] = { -- Hoa s�n
        [1] = {
            1347, 1350, 1349, 1374, 1375, 1372, 1351, 1376, 1354, 1378, 1355, 1379, 1358, 1380,
            1360, 1363, 1382, 1365, 1368,
        },
        [2] = { "Hoa S�n Ki�m", "Ki�m Ph�p", 1347, 1349, 1351, 1354, 1355, 1360, 1358 },
        [3] = { "Hoa S�n Kh�", "Ch��ng ph�p", 1372, 1374, 1376, 1379, 1380, 1358 },
    },
    [11] = { -- V� H�n
        [1] = { 1963, 1964, 1965, 1971, 1972, 1974, 1975, 1976, 1977, 1979, 1980, 1981, 1982 },
        [2] = { "Thu�n Ph�p", "Thu�n ph�p", 1963, 1964, 1965, 1971, 1972, 1982 },
        [3] = { "�ao Ph�p", "�ao ph�p", 1974, 1975, 1976, 1977, 1979, 1980, 1981, 1982 },
    },
    [12] = { -- Ti�u Dao
        [1] = { 1881, 1905, 1882, 1906, 1883, 1885, 1907, 1887, 1909, 1888, 1889, 1890 },
        [2] = { "Ki�m Ph�p", "Ki�m ph�p", 1881, 1882, 1883, 1885, 1887, 1888, 1889, 1890 },
        [3] = { "C�m Ph�p", "C�m ph�p", 1905, 1906, 1883, 1907, 1909, 1888, 1889, 1890 },
    },
}
NpcName = "<color=yellow>NPC T� C�ng Full Skill<color>: "
function dialog_main()
    npcchat_npcmacdinh()
    local szTitle = "<npc> Xin ch�o <color=red>" .. GetName() ..
                        "<color> ! Ch�o m�ng ��n v�i <color=yellow>V� L�m Truy�n K� Offline<color>. \n\n<color=green>Ch� � b�o v� s�c kh�e v� t�i s�n khi ch�i Game.<pic=115><color>"
    local nFaction = GetLastFactionNumber()
    local tab_Content = { "C�ng �i�m k� n�ng/#add_magic(" .. nFaction .. ")", "Tho�t./Quit" }
    Say(NpcName, getn(tab_Content), tab_Content);
end
function add_magic( nFaction )
    if nFaction < 0 then
        nMonPhai = "Ch�a Gia Nh�p Ph�i"
    elseif nFaction == 0 then
        nMonPhai = "Thi�u L�m"
    elseif nFaction == 1 then
        nMonPhai = "Thi�n V��ng"
    elseif nFaction == 2 then
        nMonPhai = "���ng M�n"
    elseif nFaction == 3 then
        nMonPhai = "Ng� ��c"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Th�y Y�n"
    elseif nFaction == 6 then
        nMonPhai = "C�i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thi�n Nh�n"
    elseif nFaction == 8 then
        nMonPhai = "V� �ang"
    elseif nFaction == 9 then
        nMonPhai = "C�n L�n"
    elseif nFaction == 10 then
        nMonPhai = "Hoa S�n"
    elseif nFaction == 11 then
        nMonPhai = "V� H�n"
    elseif nFaction == 12 then
        nMonPhai = "Ti�u Dao"
    end
    if GetLevel() < 90 or nFaction < 0 then
        local tab_Content = { "Quay l�i/main", "Tho�t/Quit" }
        Say(NpcName ..
                "Nh�n v�t ��t ��ng c�p 90 tr� l�n �� gia nh�p m�n ph�i m�i c� th� s� d�ng ch�c n�ng n�y.",
            getn(tab_Content), tab_Content);
        return
    end
    local tab_Content = {
        "C�ng theo t�ng k� n�ng/#Add_PointMagic(1," .. nFaction .. ")",
        "C�ng theo h��ng luy�n c�ng/#Add_PointMagic(2," .. nFaction .. ")",
        "C�ng to�n b� k� n�ng l�n c�p cao nh�t./#Add_PointMagic(3," .. nFaction .. ")",
        "Quay l�i/main", "Tho�t/Quit",
    }
    Say(NpcName .. "Ng��i �� gia nh�p m�n ph�i <color=yellow>" .. nMonPhai ..
            "<color>, ng��i mu�n c�ng k� n�ng th� n�o?", getn(tab_Content), tab_Content);
end
function Add_PointMagic( nId, nFaction )
    if nFaction < 0 then
        nMonPhai = "Ch�a Gia Nh�p Ph�i"
    elseif nFaction == 0 then
        nMonPhai = "Thi�u L�m"
    elseif nFaction == 1 then
        nMonPhai = "Thi�n V��ng"
    elseif nFaction == 2 then
        nMonPhai = "���ng M�n"
    elseif nFaction == 3 then
        nMonPhai = "Ng� ��c"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Th�y Y�n"
    elseif nFaction == 6 then
        nMonPhai = "C�i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thi�n Nh�n"
    elseif nFaction == 8 then
        nMonPhai = "V� �ang"
    elseif nFaction == 9 then
        nMonPhai = "C�n L�n"
    elseif nFaction == 10 then
        nMonPhai = "Hoa S�n"
    elseif nFaction == 11 then
        nMonPhai = "V� H�n"
    elseif nFaction == 12 then
        nMonPhai = "Ti�u Dao"
    end
    if nId == 1 then
        local tb_Desc = {};
        for i = 1, getn(tb_skill_add[nFaction][1]) do
            local skillcur = HaveMagic(tb_skill_add[nFaction][1][i]);
            local skillmax = GetSkillMaxLevel(tb_skill_add[nFaction][1][i]) +
                                 GetSkillMaxLevelAddons()
            if skillcur >= 0 and skillcur < skillmax then
                local nPointAdd = skillmax - skillcur
                tinsert(tb_Desc,
                    format(
                        "Th�ng c�p " .. "%s" .. "[Max: " .. "%s" ..
                            "]/#Add_PointMagic_Type1(%d,%d,%d,%d,%d)",
                        GetSkillName(tb_skill_add[nFaction][1][i]), skillmax,
                        tb_skill_add[nFaction][1][i], nPointAdd, nFaction, i, skillmax));
            end
        end
        tinsert(tb_Desc, 1, NpcName .. "L�a ch�n k� n�ng th�ng c�p");
        tinsert(tb_Desc, "Quay l�i/#add_magic(" .. nFaction .. ")");
        tinsert(tb_Desc, "Tho�t/OnCancel");
        CreateTaskSay(tb_Desc);
    elseif nId == 2 then
        local HuongLC = getn(tb_skill_add[nFaction]) - 1
        local TongSkill1 = 0
        local TongSkill2 = 0
        for i = 3, getn(tb_skill_add[nFaction][2]) do
            TongSkill1 = TongSkill1 + GetSkillMaxLevel(tb_skill_add[nFaction][2][i]) +
                             GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][2][i]);
        end
        for i = 3, getn(tb_skill_add[nFaction][3]) do
            TongSkill2 = TongSkill2 + GetSkillMaxLevel(tb_skill_add[nFaction][3][i]) +
                             GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][3][i]);
        end
        if HuongLC == 2 then
            local tab_Content = {
                "C�ng theo " .. tb_skill_add[nFaction][2][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill1 .. "] �i�m K� N�ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][3][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill2 .. "] �i�m K� N�ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")", "Quay l�i/#add_magic(" .. nFaction .. ")", "Tho�t/Quit",
            }
            Say(NpcName .. "M�n ph�i " .. nMonPhai .. " c� " .. HuongLC ..
                    " h��ng luy�n c�ng �� l�: " .. tb_skill_add[nFaction][2][2] .. " v� " ..
                    tb_skill_add[nFaction][3][2] .. ".<enter>" .. tb_skill_add[nFaction][2][2] ..
                    " bao g�m " .. (getn(tb_skill_add[nFaction][2]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " K� N�ng.", getn(tab_Content),
                tab_Content);
        elseif HuongLC == 3 then
            -- local TongSkill3 = (    (getn(tb_skill_add[nFaction][4])-3)*20+30    ) + (getn(tb_skill_add[nFaction][4])-2)*GetSkillMaxLevelAddons()
            local TongSkill3 = 0
            for i = 3, getn(tb_skill_add[nFaction][4]) do
                TongSkill3 = TongSkill3 + GetSkillMaxLevel(tb_skill_add[nFaction][4][i]) +
                                 GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][4][i]);
            end
            local tab_Content = {
                "C�ng theo " .. tb_skill_add[nFaction][2][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill1 .. "] �i�m K� N�ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][3][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill2 .. "] �i�m K� N�ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][4][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill3 .. "] �i�m K� N�ng/#AddHuongLC(4," .. nFaction .. "," ..
                    TongSkill3 .. ")", "Quay l�i/#add_magic(" .. nFaction .. ")", "Tho�t/Quit",
            }
            Say(NpcName .. "M�n ph�i " .. nMonPhai .. " c� " .. HuongLC ..
                    " h��ng luy�n c�ng �� l�: " .. tb_skill_add[nFaction][2][2] .. ", " ..
                    tb_skill_add[nFaction][3][2] .. ".v� " .. tb_skill_add[nFaction][4][2] ..
                    "<enter>" .. tb_skill_add[nFaction][2][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][2]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][4][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][4]) - 2) .. " K� N�ng.", getn(tab_Content),
                tab_Content);
        elseif HuongLC == 4 then
            -- local TongSkill3 = (    (getn(tb_skill_add[nFaction][4])-3)*20+30    ) + (getn(tb_skill_add[nFaction][4])-2)*GetSkillMaxLevelAddons()
            -- local TongSkill4 = (    (getn(tb_skill_add[nFaction][5])-3)*20+30    ) + (getn(tb_skill_add[nFaction][5])-2)*GetSkillMaxLevelAddons()
            local TongSkill3 = 0
            local TongSkill4 = 0
            for i = 3, getn(tb_skill_add[nFaction][4]) do
                TongSkill3 = TongSkill3 + GetSkillMaxLevel(tb_skill_add[nFaction][4][i]) +
                                 GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][4][i]);
            end
            for i = 3, getn(tb_skill_add[nFaction][5]) do
                TongSkill4 = TongSkill4 + GetSkillMaxLevel(tb_skill_add[nFaction][5][i]) +
                                 GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][5][i]);
            end
            local tab_Content = {
                "C�ng theo " .. tb_skill_add[nFaction][2][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill1 .. "] �i�m K� N�ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][3][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill2 .. "] �i�m K� N�ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][4][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill3 .. "] �i�m K� N�ng/#AddHuongLC(4," .. nFaction .. "," ..
                    TongSkill3 .. ")",
                "C�ng theo " .. tb_skill_add[nFaction][5][2] .. ", c�n t�ng c�ng [" ..
                    TongSkill4 .. "] �i�m K� N�ng/#AddHuongLC(5," .. nFaction .. "," ..
                    TongSkill4 .. ")", "Quay l�i/#add_magic(" .. nFaction .. ")", "Tho�t/Quit",
            }
            Say(NpcName .. "M�n ph�i " .. nMonPhai .. " c� " .. HuongLC ..
                    " h��ng luy�n c�ng �� l�: " .. tb_skill_add[nFaction][2][2] .. ", " ..
                    tb_skill_add[nFaction][3][2] .. ", " .. tb_skill_add[nFaction][4][2] .. " v� " ..
                    tb_skill_add[nFaction][5][2] .. "<enter>" .. tb_skill_add[nFaction][2][2] ..
                    " bao g�m " .. (getn(tb_skill_add[nFaction][2]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][4][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][4]) - 2) .. " K� N�ng.<enter>" ..
                    tb_skill_add[nFaction][5][2] .. " bao g�m " ..
                    (getn(tb_skill_add[nFaction][5]) - 2) .. " K� N�ng.", getn(tab_Content),
                tab_Content);
        end
    elseif nId == 3 then
        local nTongSoSkill = getn(tb_skill_add[nFaction][1])
        local nTongSoPoint_Need = 0
        local CheckFullSkill = 0
        for i = 1, nTongSoSkill do
            local nSkillHienTai = HaveMagic(tb_skill_add[nFaction][1][i]);
            if nSkillHienTai >= 0 then CheckFullSkill = CheckFullSkill + 1 end
            local nSkillToiDa = GetSkillMaxLevel(tb_skill_add[nFaction][1][i]) +
                                    GetSkillMaxLevelAddons()
            local nPointNeed = nSkillToiDa - nSkillHienTai
            nTongSoPoint_Need = nTongSoPoint_Need + nPointNeed
        end
        if CheckFullSkill < nTongSoSkill then -- N�u ch�a h�c �� skill
            local tab_Content = { "Quay l�i/#add_magic(" .. nFaction .. ")", "Tho�t/Quit" }
            Say(NpcName .. "Ng��i l� m�t �� t� c�a ph�i <color=yellow>" .. nMonPhai ..
                    "<color>. M�n ph�i c� t�ng c�ng <color=green>" .. nTongSoSkill ..
                    "<color> K� n�ng c� th� th�ng c�p. Ng��i m�i ch� l�nh gi�o ���c <color=green>" ..
                    CheckFullSkill ..
                    "<color> K� n�ng. H�y c� g�ng tu luy�n th�m, khi n�o ��y �� <color=green>" ..
                    nTongSoSkill .. "<color> K� N�ng m�i c� th� s� d�ng ch�c n�ng n�y.",
                getn(tab_Content), tab_Content);
            return
        end
        if GetMagicPoint() < nTongSoPoint_Need then -- N�u s� �i�m y�u c�u kh�ng �� �� c�ng.
            local tab_Content = { "Quay l�i/#add_magic(" .. nFaction .. ")", "Tho�t/Quit" }
            Say(NpcName .. "Ng��i l� m�t �� t� c�a ph�i <color=yellow>" .. nMonPhai ..
                    "<color>. M�n ph�i c� t�ng c�ng <color=green>" .. nTongSoSkill ..
                    "<color> K� n�ng, y�u c�u ph�i c� �t nh�t <color=green>" ..
                    nTongSoPoint_Need ..
                    "<color> �i�m K� N�ng m�i c� th� n�ng c�p. H�y tu luy�n th�m �i.",
                getn(tab_Content), tab_Content);
            return
        end
        for i = 1, nTongSoSkill do
            local nIdSkill = tb_skill_add[nFaction][1][i]
            local SkillCaoNhat = GetSkillMaxLevel(nIdSkill) + GetSkillMaxLevelAddons()
            local SkillPointNeed = GetSkillMaxLevel(nIdSkill) + GetSkillMaxLevelAddons() -
                                       HaveMagic(nIdSkill);
            AddMagic(nIdSkill, SkillCaoNhat)
            AddMagicPoint(-SkillPointNeed)
            Msg2Player("N�ng th�nh c�ng <color=yellow>" .. GetSkillName(nIdSkill) ..
                           "<color> l�n c�p <color=green>" .. SkillCaoNhat ..
                           "<color>. �i�m K� N�ng c�n l�i <color=yellow>" .. GetMagicPoint() ..
                           "<color> �i�m.")
        end
    end
end
function AddHuongLC( nId, nFaction, nTotalSkillNeed )
    if GetMagicPoint() < nTotalSkillNeed then
        local tab_Content = { "Quay l�i/#Add_PointMagic(2," .. nFaction .. ")", "Tho�t/Quit" }
        Say(NpcName ..
                "L��ng �i�m K� N�ng c�n l�i kh�ng �� �� n�ng k� n�ng theo h��ng <color=yellow>" ..
                tb_skill_add[nFaction][nId][2] .. "<color>. C�n t�i thi�u " .. nTotalSkillNeed ..
                " �i�m k� n�ng", getn(tab_Content), tab_Content);
        return
    end
    for i = 3, getn(tb_skill_add[nFaction][nId]) do
        local Id_Skill = tb_skill_add[nFaction][nId][i]
        if HaveMagic(Id_Skill) < 0 then
            Msg2Player(
                "Ch�a h�c ��y �� c�c k� n�ng ch�a s� d�ng ���c ch�c n�ng n�y.")
            return
        end
        local DiemCong = GetSkillMaxLevel(Id_Skill) - HaveMagic(Id_Skill);
        local TenSkill = GetSkillName(Id_Skill)
        local Skill_CaoNhat = GetSkillMaxLevel(Id_Skill) + GetSkillMaxLevelAddons()
        AddMagic(Id_Skill, Skill_CaoNhat)
        AddMagicPoint(-DiemCong)
        Msg2Player("N�ng th�nh c�ng <color=yellow>" .. TenSkill ..
                       "<color> l�n c�p <color=green>" .. GetSkillMaxLevel(Id_Skill) ..
                       "<color>. �i�m K� N�ng c�n l�i <color=yellow>" .. GetMagicPoint() ..
                       "<color> �i�m.")
    end
end
function Add_PointMagic_Type1( nIdSkill, nPointAdd, nFaction, nViTri, nMaxSkill )
    local SkillName = GetSkillName(tb_skill_add[nFaction][1][nViTri])
    if GetMagicPoint() < nPointAdd then
        local tab_Content = { "Quay l�i/#Add_PointMagic(1," .. nFaction .. ")", "Tho�t/Quit" }
        Say(
            NpcName .. "L��ng �i�m K� N�ng c�n l�i kh�ng �� �� n�ng <color=yellow>" ..
                SkillName .. "<color> l�n c�p <color=yellow>" .. nMaxSkill .. "<color>.",
            getn(tab_Content), tab_Content);
    else
        AddMagic(nIdSkill, nMaxSkill)
        AddMagicPoint(-nPointAdd)
        Msg2Player("N�ng th�nh c�ng <color=yellow>" .. SkillName ..
                       "<color> l�n c�p <color=green>" .. nMaxSkill ..
                       "<color>. �i�m K� N�ng c�n l�i <color=yellow>" .. GetMagicPoint() ..
                       "<color> �i�m.")
    end
end
