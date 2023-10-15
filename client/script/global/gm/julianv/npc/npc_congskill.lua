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
    "<color=green>Chµo mõng quý nh©n sü <pic=1>",
    "<color=green>Ai cÇn céng Skill h·y tíi ®©y",
    "<color=orange>Chóc ®¹i hiÖp ch¬i game vui vÎ, nhí like, share kªnh Youtube PYTA Gaming nha!",
}
function npcchat_npcmacdinh()
    local nNpcIndex = GetLastDiagNpc();
    local nTaskChat = GetNpcParam(nNpcIndex, 1);
    if nTaskChat == 0 then
        SetNpcParam(nNpcIndex, 1, 1); -- set index ®Çu tiªn cña table npc chat.
        SetNpcTimer(nNpcIndex, 500); -- Tuú chØnh thêi gian npc tù chat (20 s)
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
    local szTitle = "<npc> Xin chµo <color=red>" .. GetName() ..
                        "<color> ! Ta lµ ng­êi hæ trî c¸c nh©n sÜ khi míi tham gia vµo <color=yellow>Vâ L©m TruyÒn Kú<color>. \n\n<color=green>Chó ý b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
    tbOpt = { { "Hç Trî Céng Full Skill", HoTroTanThu }, { "Th«i" } }
    CreateNewSayEx(szTitle, tbOpt)
end
-------Full Skill------------
tb_skill_add = {
    [0] = { -- thiÕu l©m
        [1] = { 10, 14, 4, 6, 8, 15, 16, 20, 11, 19, 271, 21, 273 },
        [2] = { "ThiÕu L©m QuyÒn", "QuyÒn Ph¸p", 14, 8, 271, 273 },
        [3] = { "ThiÕu L©m §ao", "§ao Ph¸p", 6, 19, 273 },
        [4] = { "ThiÕu L©m C«n", "C«n Ph¸p", 10, 4, 11, 273 },
    },
    [1] = { -- thiªn v­¬ng
        [1] = { 29, 30, 34, 23, 24, 26, 33, 31, 35, 3740, 42, 32, 36, 41, 324 },
        [2] = { "Thiªn V­¬ng Th­¬ng", "Th­¬ng Ph¸p", 30, 23, 35, 41, 36 },
        [3] = { "Thiªn V­¬ng Chïy", "Chïy Ph¸p", 29, 26, 31, 324, 36 },
        [4] = { "Thiªn V­¬ng §ao", "§ao Ph¸p", 34, 24, 32, 37, 36 },
    },
    [2] = { -- ®­êng m«n
        [1] = { 45, 43, 347, 303, 47, 50, 54, 343, 345, 349, 48, 58, 249, 341 },
        [2] = { "§­êng M«n - Phi Tiªu", "Phi Tiªu ThuËt", 45, 43, 47, 341, 48 },
        [3] = { "§­êng M«n - Phi §ao", "Phi §ao ThuËt", 45, 43, 50, 249, 48 },
        [4] = { "§­êng M«n - Tô TiÔn", "Tô TiÔn ThuËt", 45, 43, 54, 58, 48 },
        [5] = { "§­êng M«n - BÉy", "H·m TÜnh ThuËt", 303, 347, 343, 349, 345, 48 },
    },
    [3] = { -- ngò ®éc
        [1] = { 63, 65, 60, 62, 67, 66, 70, 64, 68, 69, 384, 73, 356, 72, 71, 74, 75 },
        [2] = { "Ngò §éc §ao", "§ao Ph¸p", 65, 60, 384, 74, 75 },
        [3] = { "Ngò §éc Ch­ëng", "Ch­ëng Ph¸p", 63, 62, 68, 71, 75 },
        [4] = { "Ngò §éc Bïa", "Bïa Chó", 67, 70, 64, 356, 72, 75 },
    },
    [4] = { -- nga mi
        [1] = { 80, 85, 77, 79, 93, 82, 89, 385, 86, 92, 88, 91, 252, 282 },
        [2] = { "Nga Mi KiÕm", "KiÕm Ph¸p", 85, 77, 385, 88, 252 },
        [3] = { "Nga Mi Ch­ëng", "Ch­ëng Ph¸p", 80, 79, 82, 91, 252 },
        [4] = { "Nga Mi Phô Trî", "Phô Trî", 93, 89, 86, 92, 282, 252 },
    },
    [5] = { -- thóy yªn
        [1] = { 99, 102, 95, 97, 269, 105, 113, 100, 109, 108, 111, 114 },
        [2] = { "Thóy Yªn §ao", "§ao Ph¸p", 99, 95, 105, 109, 108, 114 },
        [3] = { "Thóy Yªn Song §ao", "Ch­ëng Ph¸p", 102, 97, 113, 111, 114 },
    },
    [6] = { -- c¸i bang
        [1] = { 119, 122, 115, 116, 129, 124, 274, 277, 125, 128, 130, 360 },
        [2] = { "C¸i Bang Bæng", "Bæng Ph¸p", 119, 115, 124, 125, 360, 130 },
        [3] = { "C¸i Bang Rång", "Ch­ëng Ph¸p", 122, 116, 274, 128, 360, 130 },
    },
    [7] = { -- thiªn nhÉn
        [1] = { 135, 145, 131, 132, 136, 137, 138, 140, 141, 364, 143, 142, 148, 150 },
        [2] = { "Thiªn NhÉn M©u", "M©u Ph¸p", 135, 132, 141, 142, 150 },
        [3] = { "Thiªn NhÉn §ao Ph¸p", "§ao Ph¸p", 145, 131, 138, 148, 150 },
        [4] = { "Thiªn NhÉn Bïa", "Bïa Chó", 136, 137, 140, 364, 143, 150 },
    },
    [8] = { -- vâ ®ang
        [1] = { 153, 155, 151, 152, 159, 158, 164, 160, 157, 165, 166, 267 },
        [2] = { "Vâ §ang KiÕm", "KiÕm Ph¸p", 155, 151, 158, 267, 166 },
        [3] = { "Vâ §ang KhÝ", "QuyÒn Ph¸p", 153, 152, 164, 165, 166 },
    },
    [9] = { -- c«n l«n
        [1] = {
            169, 179, 167, 168, 171, 392, 174, 172, 173, 178, 393, 175, 181, 90, 176, 182, 275, 630,
        },
        [2] = { "C«n L«n §ao", "§ao Ph¸p", 169, 167, 178, 176, 275 },
        [3] = { "C«n L«n KiÕm", "KiÕm Ph¸p", 179, 168, 172, 182, 275 },
        [4] = { "C«n L«n Bïa", "Bïa Chó", 392, 174, 393, 175, 90, 275 },
    },
    [10] = { -- Hoa s¬n
        [1] = {
            1347, 1350, 1349, 1374, 1375, 1372, 1351, 1376, 1354, 1378, 1355, 1379, 1358, 1380,
            1360, 1363, 1382, 1365, 1368,
        },
        [2] = { "Hoa S¬n KiÕm", "KiÕm Ph¸p", 1347, 1349, 1351, 1354, 1355, 1360, 1358 },
        [3] = { "Hoa S¬n KhÝ", "Ch­ëng ph¸p", 1372, 1374, 1376, 1379, 1380, 1358 },
    },
    [11] = { -- Vò Hån
        [1] = { 1963, 1964, 1965, 1971, 1972, 1974, 1975, 1976, 1977, 1979, 1980, 1981, 1982 },
        [2] = { "ThuÉn Ph¸p", "ThuÉn ph¸p", 1963, 1964, 1965, 1971, 1972, 1982 },
        [3] = { "§ao Ph¸p", "§ao ph¸p", 1974, 1975, 1976, 1977, 1979, 1980, 1981, 1982 },
    },
    [12] = { -- Tiªu Dao
        [1] = { 1881, 1905, 1882, 1906, 1883, 1885, 1907, 1887, 1909, 1888, 1889, 1890 },
        [2] = { "KiÕm Ph¸p", "KiÕm ph¸p", 1881, 1882, 1883, 1885, 1887, 1888, 1889, 1890 },
        [3] = { "CÇm Ph¸p", "CÇm ph¸p", 1905, 1906, 1883, 1907, 1909, 1888, 1889, 1890 },
    },
}
NpcName = "<color=yellow>NPC Tù Céng Full Skill<color>: "
function dialog_main()
    npcchat_npcmacdinh()
    local szTitle = "<npc> Xin chµo <color=red>" .. GetName() ..
                        "<color> ! Chµo mõng ®Õn víi <color=yellow>Vâ L©m TruyÒn Kú Offline<color>. \n\n<color=green>Chó ý b¶o vÖ søc kháe vµ tµi s¶n khi ch¬i Game.<pic=115><color>"
    local nFaction = GetLastFactionNumber()
    local tab_Content = { "Céng ®iÓm kü n¨ng/#add_magic(" .. nFaction .. ")", "Tho¸t./Quit" }
    Say(NpcName, getn(tab_Content), tab_Content);
end
function add_magic( nFaction )
    if nFaction < 0 then
        nMonPhai = "Ch­a Gia NhËp Ph¸i"
    elseif nFaction == 0 then
        nMonPhai = "ThiÕu L©m"
    elseif nFaction == 1 then
        nMonPhai = "Thiªn V­¬ng"
    elseif nFaction == 2 then
        nMonPhai = "§­êng M«n"
    elseif nFaction == 3 then
        nMonPhai = "Ngò §éc"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Thóy Yªn"
    elseif nFaction == 6 then
        nMonPhai = "C¸i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thiªn NhÉn"
    elseif nFaction == 8 then
        nMonPhai = "Vâ §ang"
    elseif nFaction == 9 then
        nMonPhai = "C«n L«n"
    elseif nFaction == 10 then
        nMonPhai = "Hoa S¬n"
    elseif nFaction == 11 then
        nMonPhai = "Vò Hån"
    elseif nFaction == 12 then
        nMonPhai = "Tiªu Dao"
    end
    if GetLevel() < 90 or nFaction < 0 then
        local tab_Content = { "Quay l¹i/main", "Tho¸t/Quit" }
        Say(NpcName ..
                "Nh©n vËt ®¹t ®¼ng cÊp 90 trë lªn ®· gia nhËp m«n ph¸i míi cã thÓ sö dông chøc n¨ng nµy.",
            getn(tab_Content), tab_Content);
        return
    end
    local tab_Content = {
        "Céng theo tõng kü n¨ng/#Add_PointMagic(1," .. nFaction .. ")",
        "Céng theo h­íng luyÖn c«ng/#Add_PointMagic(2," .. nFaction .. ")",
        "Céng toµn bé kü n¨ng lªn cÊp cao nhÊt./#Add_PointMagic(3," .. nFaction .. ")",
        "Quay l¹i/main", "Tho¸t/Quit",
    }
    Say(NpcName .. "Ng­¬i ®· gia nhËp m«n ph¸i <color=yellow>" .. nMonPhai ..
            "<color>, ng­¬i muèn céng kü n¨ng thÕ nµo?", getn(tab_Content), tab_Content);
end
function Add_PointMagic( nId, nFaction )
    if nFaction < 0 then
        nMonPhai = "Ch­a Gia NhËp Ph¸i"
    elseif nFaction == 0 then
        nMonPhai = "ThiÕu L©m"
    elseif nFaction == 1 then
        nMonPhai = "Thiªn V­¬ng"
    elseif nFaction == 2 then
        nMonPhai = "§­êng M«n"
    elseif nFaction == 3 then
        nMonPhai = "Ngò §éc"
    elseif nFaction == 4 then
        nMonPhai = "Nga My"
    elseif nFaction == 5 then
        nMonPhai = "Thóy Yªn"
    elseif nFaction == 6 then
        nMonPhai = "C¸i Bang"
    elseif nFaction == 7 then
        nMonPhai = "Thiªn NhÉn"
    elseif nFaction == 8 then
        nMonPhai = "Vâ §ang"
    elseif nFaction == 9 then
        nMonPhai = "C«n L«n"
    elseif nFaction == 10 then
        nMonPhai = "Hoa S¬n"
    elseif nFaction == 11 then
        nMonPhai = "Vò Hån"
    elseif nFaction == 12 then
        nMonPhai = "Tiªu Dao"
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
                        "Th¨ng cÊp " .. "%s" .. "[Max: " .. "%s" ..
                            "]/#Add_PointMagic_Type1(%d,%d,%d,%d,%d)",
                        GetSkillName(tb_skill_add[nFaction][1][i]), skillmax,
                        tb_skill_add[nFaction][1][i], nPointAdd, nFaction, i, skillmax));
            end
        end
        tinsert(tb_Desc, 1, NpcName .. "Lùa chän kü n¨ng th¨ng cÊp");
        tinsert(tb_Desc, "Quay l¹i/#add_magic(" .. nFaction .. ")");
        tinsert(tb_Desc, "Tho¸t/OnCancel");
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
                "Céng theo " .. tb_skill_add[nFaction][2][2] .. ", cÇn tæng céng [" ..
                    TongSkill1 .. "] ®iÓm Kü N¨ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][3][2] .. ", cÇn tæng céng [" ..
                    TongSkill2 .. "] ®iÓm Kü N¨ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")", "Quay l¹i/#add_magic(" .. nFaction .. ")", "Tho¸t/Quit",
            }
            Say(NpcName .. "M«n ph¸i " .. nMonPhai .. " cã " .. HuongLC ..
                    " h­íng luyÖn c«ng ®ã lµ: " .. tb_skill_add[nFaction][2][2] .. " vµ " ..
                    tb_skill_add[nFaction][3][2] .. ".<enter>" .. tb_skill_add[nFaction][2][2] ..
                    " bao gåm " .. (getn(tb_skill_add[nFaction][2]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " Kü N¨ng.", getn(tab_Content),
                tab_Content);
        elseif HuongLC == 3 then
            -- local TongSkill3 = (    (getn(tb_skill_add[nFaction][4])-3)*20+30    ) + (getn(tb_skill_add[nFaction][4])-2)*GetSkillMaxLevelAddons()
            local TongSkill3 = 0
            for i = 3, getn(tb_skill_add[nFaction][4]) do
                TongSkill3 = TongSkill3 + GetSkillMaxLevel(tb_skill_add[nFaction][4][i]) +
                                 GetSkillMaxLevelAddons() - HaveMagic(tb_skill_add[nFaction][4][i]);
            end
            local tab_Content = {
                "Céng theo " .. tb_skill_add[nFaction][2][2] .. ", cÇn tæng céng [" ..
                    TongSkill1 .. "] ®iÓm Kü N¨ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][3][2] .. ", cÇn tæng céng [" ..
                    TongSkill2 .. "] ®iÓm Kü N¨ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][4][2] .. ", cÇn tæng céng [" ..
                    TongSkill3 .. "] ®iÓm Kü N¨ng/#AddHuongLC(4," .. nFaction .. "," ..
                    TongSkill3 .. ")", "Quay l¹i/#add_magic(" .. nFaction .. ")", "Tho¸t/Quit",
            }
            Say(NpcName .. "M«n ph¸i " .. nMonPhai .. " cã " .. HuongLC ..
                    " h­íng luyÖn c«ng ®ã lµ: " .. tb_skill_add[nFaction][2][2] .. ", " ..
                    tb_skill_add[nFaction][3][2] .. ".vµ " .. tb_skill_add[nFaction][4][2] ..
                    "<enter>" .. tb_skill_add[nFaction][2][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][2]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][4][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][4]) - 2) .. " Kü N¨ng.", getn(tab_Content),
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
                "Céng theo " .. tb_skill_add[nFaction][2][2] .. ", cÇn tæng céng [" ..
                    TongSkill1 .. "] ®iÓm Kü N¨ng/#AddHuongLC(2," .. nFaction .. "," ..
                    TongSkill1 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][3][2] .. ", cÇn tæng céng [" ..
                    TongSkill2 .. "] ®iÓm Kü N¨ng/#AddHuongLC(3," .. nFaction .. "," ..
                    TongSkill2 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][4][2] .. ", cÇn tæng céng [" ..
                    TongSkill3 .. "] ®iÓm Kü N¨ng/#AddHuongLC(4," .. nFaction .. "," ..
                    TongSkill3 .. ")",
                "Céng theo " .. tb_skill_add[nFaction][5][2] .. ", cÇn tæng céng [" ..
                    TongSkill4 .. "] ®iÓm Kü N¨ng/#AddHuongLC(5," .. nFaction .. "," ..
                    TongSkill4 .. ")", "Quay l¹i/#add_magic(" .. nFaction .. ")", "Tho¸t/Quit",
            }
            Say(NpcName .. "M«n ph¸i " .. nMonPhai .. " cã " .. HuongLC ..
                    " h­íng luyÖn c«ng ®ã lµ: " .. tb_skill_add[nFaction][2][2] .. ", " ..
                    tb_skill_add[nFaction][3][2] .. ", " .. tb_skill_add[nFaction][4][2] .. " vµ " ..
                    tb_skill_add[nFaction][5][2] .. "<enter>" .. tb_skill_add[nFaction][2][2] ..
                    " bao gåm " .. (getn(tb_skill_add[nFaction][2]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][3][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][3]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][4][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][4]) - 2) .. " Kü N¨ng.<enter>" ..
                    tb_skill_add[nFaction][5][2] .. " bao gåm " ..
                    (getn(tb_skill_add[nFaction][5]) - 2) .. " Kü N¨ng.", getn(tab_Content),
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
        if CheckFullSkill < nTongSoSkill then -- NÕu ch­a häc ®ñ skill
            local tab_Content = { "Quay l¹i/#add_magic(" .. nFaction .. ")", "Tho¸t/Quit" }
            Say(NpcName .. "Ng­¬i lµ mét ®Ö tö cña ph¸i <color=yellow>" .. nMonPhai ..
                    "<color>. M«n ph¸i cã tæng céng <color=green>" .. nTongSoSkill ..
                    "<color> Kü n¨ng cã thÓ th¨ng cÊp. Ng­¬i míi chØ l·nh gi¸o ®­îc <color=green>" ..
                    CheckFullSkill ..
                    "<color> Kü n¨ng. H·y cè g¾ng tu luyÖn thªm, khi nµo ®Çy ®ñ <color=green>" ..
                    nTongSoSkill .. "<color> Kü N¨ng míi cã thÓ sö dông chøc n¨ng nµy.",
                getn(tab_Content), tab_Content);
            return
        end
        if GetMagicPoint() < nTongSoPoint_Need then -- NÕu sè ®iÓm yªu cÇu kh«ng ®ñ ®Ó céng.
            local tab_Content = { "Quay l¹i/#add_magic(" .. nFaction .. ")", "Tho¸t/Quit" }
            Say(NpcName .. "Ng­¬i lµ mét ®Ö tö cña ph¸i <color=yellow>" .. nMonPhai ..
                    "<color>. M«n ph¸i cã tæng céng <color=green>" .. nTongSoSkill ..
                    "<color> Kü n¨ng, yªu cÇu ph¶i cã Ýt nhÊt <color=green>" ..
                    nTongSoPoint_Need ..
                    "<color> ®iÓm Kü N¨ng míi cã thÓ n©ng cÊp. H·y tu luyÖn thªm ®i.",
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
            Msg2Player("N©ng thµnh c«ng <color=yellow>" .. GetSkillName(nIdSkill) ..
                           "<color> lªn cÊp <color=green>" .. SkillCaoNhat ..
                           "<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>" .. GetMagicPoint() ..
                           "<color> ®iÓm.")
        end
    end
end
function AddHuongLC( nId, nFaction, nTotalSkillNeed )
    if GetMagicPoint() < nTotalSkillNeed then
        local tab_Content = { "Quay l¹i/#Add_PointMagic(2," .. nFaction .. ")", "Tho¸t/Quit" }
        Say(NpcName ..
                "L­îng ®iÓm Kü N¨ng cßn l¹i kh«ng ®ñ ®Ó n©ng kü n¨ng theo h­íng <color=yellow>" ..
                tb_skill_add[nFaction][nId][2] .. "<color>. CÇn tèi thiÓu " .. nTotalSkillNeed ..
                " ®iÓm kü n¨ng", getn(tab_Content), tab_Content);
        return
    end
    for i = 3, getn(tb_skill_add[nFaction][nId]) do
        local Id_Skill = tb_skill_add[nFaction][nId][i]
        if HaveMagic(Id_Skill) < 0 then
            Msg2Player(
                "Ch­a häc ®Çy ®ñ c¸c kÜ n¨ng ch­a sö dông ®­îc chøc n¨ng nµy.")
            return
        end
        local DiemCong = GetSkillMaxLevel(Id_Skill) - HaveMagic(Id_Skill);
        local TenSkill = GetSkillName(Id_Skill)
        local Skill_CaoNhat = GetSkillMaxLevel(Id_Skill) + GetSkillMaxLevelAddons()
        AddMagic(Id_Skill, Skill_CaoNhat)
        AddMagicPoint(-DiemCong)
        Msg2Player("N©ng thµnh c«ng <color=yellow>" .. TenSkill ..
                       "<color> lªn cÊp <color=green>" .. GetSkillMaxLevel(Id_Skill) ..
                       "<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>" .. GetMagicPoint() ..
                       "<color> ®iÓm.")
    end
end
function Add_PointMagic_Type1( nIdSkill, nPointAdd, nFaction, nViTri, nMaxSkill )
    local SkillName = GetSkillName(tb_skill_add[nFaction][1][nViTri])
    if GetMagicPoint() < nPointAdd then
        local tab_Content = { "Quay l¹i/#Add_PointMagic(1," .. nFaction .. ")", "Tho¸t/Quit" }
        Say(
            NpcName .. "L­îng ®iÓm Kü N¨ng cßn l¹i kh«ng ®ñ ®Ó n©ng <color=yellow>" ..
                SkillName .. "<color> lªn cÊp <color=yellow>" .. nMaxSkill .. "<color>.",
            getn(tab_Content), tab_Content);
    else
        AddMagic(nIdSkill, nMaxSkill)
        AddMagicPoint(-nPointAdd)
        Msg2Player("N©ng thµnh c«ng <color=yellow>" .. SkillName ..
                       "<color> lªn cÊp <color=green>" .. nMaxSkill ..
                       "<color>. §iÓm Kü N¨ng cßn l¹i <color=yellow>" .. GetMagicPoint() ..
                       "<color> ®iÓm.")
    end
end
