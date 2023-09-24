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
    {"NhËn CÈm nang AIO", NhanLenhBai, {5128}}, --
    {"Hç trî t©n thñ", HoTroTanThu}, --
    {"NhËn Siªu PhÈm B¶o R­¬ng", toGiveItems, {5129}}, --
    -- {"Kü n¨ng - TiÒm n¨ng", HoTroSkill}, --        
    {"NhËn trïng sinh", TrungSinh}, --
    {"-----------------------------------", support}, --
    {"Dän s¹ch R­¬ng chøa ®å", ClearF4}, --
    {"Huû vËt phÈm", DisposeItem}, --
    {"KÕt thóc ®èi tho¹i"}}
    CreateNewSayEx("<npc>Mêi <sex> {{" .. GetName() .. "}} chän", tbOpt)
end

function NhanLenhBai(nId)
    local nItemIdx
    if HaveCommonItem(6, 1, nId) == 1 then
        Talk(1, "", "B¹n ®· së h÷u LÖnh bµi nµy råi!")
        return
    elseif nId == 5128 then
        nItemIdx = AddItem(6, 1, 5128, 0, 0, 0)
        TalkEx(1, {"Xin chµo <color=yellow>" .. GetName() .. "<color>!", "Trªn con ®­êng hµnh hiÖp",
                   "NÕu gÆp bÊt cø khã kh¨n nµo", "H·y sö dông {{" .. GetItemName(nItemIdx) .. "}}!"})
    else
        nItemIdx = AddItem(6, 1, nId, 0, 0, 0)
    end
    Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(nItemIdx))
end

function HoTroSkill()
    local tbOpt = { --
    {"TÈy Tñy", clear_attibute_point}, --
    {"Céng ®iÓm nhanh", add_prop}, --
    {"Trê l¹i", support}, --
    {"KÕt thóc ®èi tho¹i"}}
    CreateNewSayEx("<npc>Hç trî Kü n¨ng - TiÒm n¨ng ng­êi ch¬i", tbOpt)
end

function HoTroTanThu()
    local szSkillTanThu = HaveMagic(1995) == 1 and "Xo¸ Skill [Hç trî T©n Thñ]" or
                              "NhËn Skill [Hç trî T©n Thñ]"
    local tbOpt = { --
    {"NhËn Hç trî t©n thñ", tbGiveSkill60.MainDialog}, --
    {szSkillTanThu, SkillTanThu, {HaveMagic(1995) == 1 and 0 or 1}}, --  
    {"NhËn lÖnh bµi lµm NV M«n ph¸i", NhanLenhBai, {5127}}, --
    {"NhËn lÖnh bµi lµm NV D· TÈu", NhanLenhBai, {5126}}, --
    {"Trë l¹i", support}, --
    {"KÕt thóc ®èi tho¹i"}}
    CreateNewSayEx("<npc>Hç trî ng­êi ch¬i míi", tbOpt)
end

function SkillTanThu(bAddSkill)
    if bAddSkill == 0 then
        DelMagic(1995)
    else
        AddMagic(1995, 1)
    end
    Talk(1, "", "Thµnh c«ng! Më b¶ng Vâ C«ng <F5> hoÆc <E> ®Ó kiÓm tra")
end

function ClearF4(bComfirm)
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L­u ý: <color>TÊt c¶ vËt phÈm vµ trang bÞ trong R­¬ng chøa ®å sÏ bÞ {{Xo¸ bá}} hoµn toµn vµ kh«ng thÓ phôc håi nh­ cò.\n\n<sex> cã ch¾c ch¾n muèn lµm vËy kh«ng?", --
            {{"X¸c nhËn", ClearF4, {1}}, --
            {"§Ó ta suy nghÜ l¹i..."}})
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do
                RemoveItemByIndex(tbItems[i], -1);
            end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "§· dän s¹ch r­¬ng")
    end
end

function toGiveItems(nItemIdx)
    Msg2Player("NhËn ®­îc <color=yellow>" .. GetItemName(AddItem(6, 1, nItemIdx, 0, 0, 0)))
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
