IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\thinh\\hotro\\functions_points.lua")
Include("\\script\\global\\skills_table.lua")
------------------------------------------------------------------------------------------------------------
MaxCS = 100; -- giÌ hπn chuy”n sinh
regMoney = 100000;
regMoneyDesc = regMoney / 10000;
PropCS = 100; -- SË point nhÀn Æ≠Óc sau khi chuy”n sinh
regLevel = 200; -- y™u c«u Æºng c p Æ” chuy”n sinh
------------------------------------------------------------------------------------------------------------
function main()
    dofile("script/global/thanh/npc/npc_chuyensinh.lua")
    dialog_chuyensinh_main()
end

function dialog_chuyensinh_main()
    local szTitle = "Xin chµo ! ßπi hi÷p muËn chuy”n sinh ?<enter><enter>Chuy”n sinh l«n <color=yellow>" ..
                        (GetTask(5100) + 1) .. "<color> c«n :<enter>- ßºng c p : <color=yellow>" .. regLevel ..
                        "<color> <enter>- Ti“n : <color=yellow>" .. regMoneyDesc .. "<color> vπn"
    local tbOpt = {{"Chuy”n sinh", chuyensinh}, {"T»y TÒy", clear_attibute_point}, {"CÈng Æi”m nhanh", add_prop},
                   {"H‰c Khinh C´ng", khinhcong}, {"K’t thÛc ÆËi thoπi"}}
    CreateNewSayEx("<npc>" .. szTitle .. "", tbOpt)
    -- Say(szTitle, getn(tbOpt), tbOpt)
end

function chuyensinh()
    local cs = GetTask(5100)
    local name = GetName()
    local tien = GetCash()
    local level = GetLevel()
    if cs <= MaxCS then
        if level == regLevel then
            if tien >= regMoney then
                Talk(1, "", "Bπn Æ∑ chuy”n sinh thµnh c´ng")
                SetTask(5100, cs + 1)
                ST_LevelUp(-190)
                Pay(regMoney)
                AddProp(PropCS)
                DoClearPropCore()
                DoClearSkillCore()
                KickOutSelf()
            else
                Talk(1, "", "Bπn ch≠a ÆÒ ti“n vπn")
            end
        else
            Talk(1, "", "Bπn ch≠a ÆÒ Æºng c p, bπn c«n Æπt c p 200")
        end
    else
        Talk(1, "", "Bπn Æ∑ max chuy”n sinh rÂi")
    end
end

------Tay Tuy------------
function clear_attibute_point()
    local szTitle = "Xin chµo <color=yellow>" .. GetName() ..
                        "<color>. Bπn c«n t»y Æi”m Ti“m N®ng hay K¸ N®ng?"
    local tbOpt = {{"T»y ßi”m K¸ N®ng.", DoClearSkill}, {"T»y ßi”m Ti“m N®ng.", DoClearProp},
                   {"TrÎ V“", dialog_hotro_main}, {"Tho∏t."}}
    CreateNewSayEx("<npc>" .. szTitle .. "", tbOpt)
end

------Khinh Cong----------------------

function khinhcong()
    AddMagic(210, 1)
    Talk(1, "", "ß∑ h‰c Æ≠Óc khinh c´ng.")
end
