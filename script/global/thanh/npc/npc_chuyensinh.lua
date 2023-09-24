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
MaxCS = 100; -- gi� h�n chuy�n sinh
regMoney = 100000;
regMoneyDesc = regMoney / 10000;
PropCS = 100; -- S� point nh�n ���c sau khi chuy�n sinh
regLevel = 200; -- y�u c�u ��ng c�p �� chuy�n sinh
------------------------------------------------------------------------------------------------------------
function main()
    dofile("script/global/thanh/npc/npc_chuyensinh.lua")
    dialog_chuyensinh_main()
end

function dialog_chuyensinh_main()
    local szTitle = "Xin ch�o ! ��i hi�p mu�n chuy�n sinh ?<enter><enter>Chuy�n sinh l�n <color=yellow>" ..
                        (GetTask(5100) + 1) .. "<color> c�n :<enter>- ��ng c�p : <color=yellow>" .. regLevel ..
                        "<color> <enter>- Ti�n : <color=yellow>" .. regMoneyDesc .. "<color> v�n"
    local tbOpt = {{"Chuy�n sinh", chuyensinh}, {"T�y T�y", clear_attibute_point}, {"C�ng �i�m nhanh", add_prop},
                   {"H�c Khinh C�ng", khinhcong}, {"K�t th�c ��i tho�i"}}
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
                Talk(1, "", "B�n �� chuy�n sinh th�nh c�ng")
                SetTask(5100, cs + 1)
                ST_LevelUp(-190)
                Pay(regMoney)
                AddProp(PropCS)
                DoClearPropCore()
                DoClearSkillCore()
                KickOutSelf()
            else
                Talk(1, "", "B�n ch�a �� ti�n v�n")
            end
        else
            Talk(1, "", "B�n ch�a �� ��ng c�p, b�n c�n ��t c�p 200")
        end
    else
        Talk(1, "", "B�n �� max chuy�n sinh r�i")
    end
end

------Tay Tuy------------
function clear_attibute_point()
    local szTitle = "Xin ch�o <color=yellow>" .. GetName() ..
                        "<color>. B�n c�n t�y �i�m Ti�m N�ng hay K� N�ng?"
    local tbOpt = {{"T�y �i�m K� N�ng.", DoClearSkill}, {"T�y �i�m Ti�m N�ng.", DoClearProp},
                   {"Tr� V�", dialog_hotro_main}, {"Tho�t."}}
    CreateNewSayEx("<npc>" .. szTitle .. "", tbOpt)
end

------Khinh Cong----------------------

function khinhcong()
    AddMagic(210, 1)
    Talk(1, "", "�� h�c ���c khinh c�ng.")
end
