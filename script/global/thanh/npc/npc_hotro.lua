IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\tanthu\\giveskill60.lua")
Include("\\script\\global\\gm\\julianv\\main.lua")
------------------------------------------------------------------------------------------------------------
function main()
    dofile("script/global/thanh/npc/npc_hotro.lua")
    support()
end

function support()
    local tbOpt = { --
    {"Nh�n C�m nang AIO", NhanLenhBai, {5128}}, --
    {"H� tr� t�n th�", HoTroTanThu}, --
    {"Nh�n Si�u Ph�m B�o R��ng", toGiveItems, {5129}}, --
    -- {"K� n�ng - Ti�m n�ng", HoTroSkill}, --        
    {"Nh�n tr�ng sinh", TrungSinh}, --
    {"-----------------------------------", support}, --
    {"D�n s�ch R��ng ch�a ��", ClearF4}, --
    {"Hu� v�t ph�m", DisposeItem}, --
    {"K�t th�c ��i tho�i"}}
    CreateNewSayEx("<npc>M�i <sex> {{" .. GetName() .. "}} ch�n", tbOpt)
end

function NhanLenhBai(nId)
    local nItemIdx
    if HaveCommonItem(6, 1, nId) == 1 then
        Talk(1, "", "B�n �� s� h�u L�nh b�i n�y r�i!")
        return
    elseif nId == 5128 then
        nItemIdx = AddItem(6, 1, 5128, 0, 0, 0)
        TalkEx(1, {"Xin ch�o <color=yellow>" .. GetName() .. "<color>!", "Tr�n con ���ng h�nh hi�p",
                   "N�u g�p b�t c� kh� kh�n n�o", "H�y s� d�ng {{" .. GetItemName(nItemIdx) .. "}}!"})
    else
        nItemIdx = AddItem(6, 1, nId, 0, 0, 0)
    end
    Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(nItemIdx))
end

function HoTroSkill()
    local tbOpt = { --
    {"T�y T�y", clear_attibute_point}, --
    {"C�ng �i�m nhanh", add_prop}, --
    {"Tr� l�i", support}, --
    {"K�t th�c ��i tho�i"}}
    CreateNewSayEx("<npc>H� tr� K� n�ng - Ti�m n�ng ng��i ch�i", tbOpt)
end

function HoTroTanThu()
    local szSkillTanThu = HaveMagic(1995) == 1 and "Xo� Skill [H� tr� T�n Th�]" or
                              "Nh�n Skill [H� tr� T�n Th�]"
    local tbOpt = { --
    {"Nh�n H� tr� t�n th�", tbGiveSkill60.MainDialog}, --
    {szSkillTanThu, SkillTanThu, {HaveMagic(1995) == 1 and 0 or 1}}, --  
    {"Nh�n l�nh b�i l�m NV M�n ph�i", NhanLenhBai, {5127}}, --
    {"Nh�n l�nh b�i l�m NV D� T�u", NhanLenhBai, {5126}}, --
    {"Tr� l�i", support}, --
    {"K�t th�c ��i tho�i"}}
    CreateNewSayEx("<npc>H� tr� ng��i ch�i m�i", tbOpt)
end

function SkillTanThu(bAddSkill)
    if bAddSkill == 0 then
        DelMagic(1995)
    else
        AddMagic(1995, 1)
    end
    Talk(1, "", "Th�nh c�ng! M� b�ng V� C�ng <F5> ho�c <E> �� ki�m tra")
end

function ClearF4(bComfirm)
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L�u �: <color>T�t c� v�t ph�m v� trang b� trong R��ng ch�a �� s� b� {{Xo� b�}} ho�n to�n v� kh�ng th� ph�c h�i nh� c�.\n\n<sex> c� ch�c ch�n mu�n l�m v�y kh�ng?", --
            {{"X�c nh�n", ClearF4, {1}}, --
            {"�� ta suy ngh� l�i..."}})
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do
                RemoveItemByIndex(tbItems[i], -1);
            end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "�� d�n s�ch r��ng")
    end
end

function toGiveItems(nItemIdx)
    Msg2Player("Nh�n ���c <color=yellow>" .. GetItemName(AddItem(6, 1, nItemIdx, 0, 0, 0)))
end

function TrungSinh()
    local nTransLife = ST_GetTransLifeCount();
    local nCurLevel = GetLevel()
    local nAddLevel = 200 - nCurLevel
    if (nTransLife == 0) then
        for i = 1, 6 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel)
    elseif (nTransLife == 1) then
        for i = 1, 5 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel);
    elseif (nTransLife == 2) then
        for i = 1, 4 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel);
    elseif (nTransLife == 3) then
        for i = 1, 3 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel);
    elseif (nTransLife == 4) then
        for i = 1, 2 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel);
    elseif (nTransLife == 5) then
        for i = 1, 1 do
            ST_LevelUp(nAddLevel)
            ST_DoTransLife()
        end
        ST_LevelUp(nAddLevel);
    end
    ST_LevelUp(200);
end
