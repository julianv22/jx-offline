------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
IL("TITLE")
IncludeLib("SETTING")
IncludeLib("ITEM")
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\thinh\\hotro\\functions_partner.lua") -- b¹n ®ång hµnh
-----------------------------INCLUDE FILES-----------------------------
JulianV = {}
function JulianV:IncludeFiles()
    local root = "\\script\\global\\gm\\julianv\\"
    local tbInclude = {
        functions = { "dialog_fun", "player_manager", "server_manager", "trangbi_vatpham" },
        lib = { "lib_monphai", "lib_vatpham", "lib_boss", "lib_trangbi", "lib_others" },
    }
    for folder, files in tbInclude do
        for i = 1, getn(files) do Include(root .. folder .. "\\" .. files[i] .. ".lua") end
    end
end
JulianV:IncludeFiles()
-----------------------------DIALOG-----------------------------
function main()
    dofile("script/global/gm/julianv/main.lua")
    dofile("script/global/gm/julianv/lib/lib_vatpham.lua")
    dofile("script/global/gm/julianv/lib/lib_monphai.lua")
    dofile("script/global/gm/julianv/lib/lib_trangbi.lua")
    dofile("script/global/gm/julianv/lib/lib_boss.lua")
    dofile("script/global/gm/julianv/lib/lib_others.lua")
    JulianV:Main()
    return 1
end
function JulianV:Main()
    local tbOpt = {
        { "Tools", self.ChucNangKhac }, --
        { "Qu¶n lý Server", self.Server_Dialog }, --
        { "Qu¶n lý Nh©n vËt", self.Player_Dialog }, --        
        { "Trang bÞ - VËt phÈm", self.TrangBi_VatPham }, --                
        { "B¹n §ång hµnh", functions_for_partner }, --
        { "Bang Héi", self.Tong_Dialog }, --
        { "Chøc n¨ng GM", self.Admin_Dialog }, --            
    }
    JDialog:Show(tbOpt)
end
------------------------Admin------------------------
function JulianV:Admin_Dialog()
    local GM_Title = function( num )
        if Title_GetActiveTitle() ~= 191 then
            return { "BËt huy hiÖu GM", JulianV.GM_Activate, { num } }
        else
            return { "T¾t huy hiÖu GM", JulianV.GM_Activate, { num } }
        end
    end
    local GM_Res = function( num )
        if IsOwnFeatureChanged() == 0 then
            return { "BiÕn thµnh GM", JulianV.GM_Activate, { num } }
        else
            return { "Trë l¹i nh­ cò", JulianV.GM_Activate, { num } }
        end
    end
    local GM_Hide = function( num )
        if GetSkillState(733) == -1 then
            return { "BËt tÝnh n¨ng tµng h×nh", JulianV.GM_Activate, { num } }
        else
            return { "T¾t tÝnh n¨ng tµng h×nh", JulianV.GM_Activate, { num } }
        end
    end
    local PowerOpt = function()
        if HaveMagic(161) ~= -1 then
            return { "Power Down", JulianV.PowerUp, { -1 } }
        else
            return { "Power Up", JulianV.PowerUp, { 0 } }
        end
    end
    local tbOpt = {
        { "DÞch chuyÓn tøc thêi", JulianV.Teleport }, GM_Title(1), GM_Res(2), GM_Hide(3),
        PowerOpt(),
    }
    JDialog:Show(tbOpt, main)
end
---@param num? integer
function JulianV.GM_Activate( num )
    if num == 1 then
        if Title_GetActiveTitle() ~= 191 then
            SetTask(1122, 191)
            Title_AddTitle(191, 1, 30 * 24 * 60 * 60 * 18);
            Title_ActiveTitle(191);
            Msg2Player("KÝch ho¹t huy hiÖu GM")
        else
            Title_RemoveTitle(191)
            Msg2Player("Huû kÝch ho¹t huy hiÖu GM")
        end
        return
    end
    if num == 2 then
        if IsOwnFeatureChanged() == 0 then
            ChangeOwnFeature(0, 0, 567);
            Msg2Player("BiÕn thµnh h×nh d¸ng GM");
        else
            RestoreOwnFeature();
            Msg2Player("Trë l¹i h×nh d¸ng ban ®Çu");
        end
        return
    end
    if num == 3 then
        if GetSkillState(733) == -1 then
            AddSkillState(733, 1, 0, 777600);
            Msg2Player("BËt chøc n¨ng tµng h×nh cho GM");
        else
            AddSkillState(733, 1, 0, 18 * 1);
            Msg2Player("T¾t chøc n¨ng tµng h×nh cho GM");
        end
    end
end
---@param nMapId? integer 
---@param nPosX? integer
function JulianV.Teleport( nMapId, nPosX )
    if not nMapId then
        g_AskClientNumberEx(0, 9999, "NhËp ID map", { JulianV.Teleport })
    elseif not nPosX then
        g_AskClientNumberEx(0, 9999, "To¹ ®é X", { JulianV.Teleport, { nMapId } })
    else
        g_AskClientNumberEx(0, 9999, "To¹ ®é Y", { JulianV.MoveTo, { nMapId, nPosX } })
    end

end

function JulianV.MoveTo( ... )
    local nMapId, nPosX, nPosY = unpack(arg)
    if nPosX < 1000 and nPosY < 1000 then
        nPosX = nPosX * 8
        nPosY = nPosY * 16
    end
    local nMove = NewWorld(nMapId, nPosX, nPosY)
    AddSkillState(963, 1, 0, 18 * 3)
    if nMove ~= 1 then
        GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ",
            "ThÊt b¹i! VÞ trÝ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.")
        return
    end

    SetStringTask(TASK_S_POSITION, szPos)
    GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ", nMapId .. ", <color=yellow>" .. nPosX .. "/" ..
        nPosY .. "<color> <color=green>Thµnh c«ng!")
end
---@param lvl? integer @Level
function JulianV.PowerUp( lvl )
    local tbMagic = { 21, 36, 75, 92, 130, 156, 160, 161, 166, 173, 178, 282, 332, 712 }
    if lvl == -1 then
        DoClearPropCore()
        for i = 1, getn(tbMagic) do DelMagic(tbMagic[i]) end
        return
    end
    if lvl == 0 then
        g_AskClientNumberEx(0, 200, "Power Up Level", { JulianV.PowerUp })
    else
        -- AddProp(200000);
        -- Earn(10000000) -- 1000 v¹n
        -- AddItem(0, 10, 5, 5, 0, 0, 0) -- Ngùa
        ST_LevelUp(lvl - GetLevel())
        DoClearPropCore()
        AddStrg(lvl * 250)
        AddDex(lvl * 250)
        AddVit(lvl * 250)
        AddEng(lvl * 250)
        for i = 1, getn(tbMagic) do AddMagic(tbMagic[i], floor(lvl / 10 * 1.5)) end
        GMMsg2Player("Th«ng b¸o",
            "<color=yellow>Ng­¬i ®· nhËn ®­îc mét cè lùc l­îng thÇn bÝ!<color>")
    end
end
------------------------Nh©n vËt------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\ex_lib_function.lua")

function JulianV:Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = {
        { "NhËn ®iÓm", JulianV.Point_Dialog }, --
        { "Kü n¨ng - TiÒm n¨ng", JulianV.SkillSupport }, --    
        { "Häc kü n¨ng M«n ph¸i", change_phai }, --
        { "NhËn danh hiÖu", JulianV.NhanDanhHieu }, --
        { "§æi mµu PK", JulianV.Change_PK }, --
        { "§æi ngò hµnh", JulianV.Change_Serries }, --
        { "§æi giíi tÝnh", JulianV.Change_Sex }, --
        { "§æi tªn nh©n vËt", JulianV.RenameCharacter },
    }
    JDialog:Show(tbOpt, main)
end
------------------------Server------------------------
function JulianV:Server_Dialog()
    dofile("script/global/gm/julianv/functions/server_manager.lua")
    local tbOpt = {
        { "Chøc n¨ng th«ng b¸o", JulianV.Notification_Dialog },
        { "Gäi Boss Hoµng Kim", JulianV.Choose_Boss_Dialog },
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:Notification_Dialog()
    local tbOpt = {
        { "TÇn sè thÕ giíi", JulianV.GM_Notification, { 0 } },
        { "TÇn sè m¸y chñ", JulianV.GM_Notification, { 1 } },
    }
    JDialog:Show(tbOpt, main)
end
---@param nType? integer
---@param szMessage? string
function JulianV.GM_Notification( nType, szMessage )
    if not szMessage then
        g_AskClientStringEx("", 0, 256, "Néi dung", { JulianV.GM_Notification, { nType } })
    else
        if nType == 0 then
            Msg2SubWorld("<color=yellow><bclr=red>GM " .. GetName() ..
                             "<bclr> th«ng b¸o:<color> <color=cyan>" .. szMessage)
        else
            AddGlobalCountNews("<color=yellow><bclr=red>GM " .. GetName() ..
                                   "<bclr> th«ng b¸o: <color>" .. szMessage, 3)
        end
    end
end
------------------------Trang Trang bÞ - VËt phÈm------------------------
function JulianV:TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")
    local tbOpt = {
        { "NhËn vËt phÈm", JulianV.NhanVatPham }, --    
        { "NhËn trang bÞ", JulianV.NhanTrangBi }, --   
        { "Trang bÞ hiÕm", JulianV.TrangBiHiem }, --
        { "Thay ®æi ngo¹i h×nh trang bÞ", JulianV.ChangeFeature_Dialog }, --    
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "NhËn MagicScript Item (Genre, Detail, Particular)", JulianV.GetMagicItem }, --
        { "LÊy nhiÒu Magic Item (Particular)", JulianV.GetMagicItems }, --
        { "NhËn Questkey Item (Questkey ID)", JulianV.GetQuestkey }, --
        { "NhËn GoldItem (GoldItem ID)", JulianV.GetGoldItem }, --       

    }
    JDialog:Show(tbOpt, main)
end
------------------------Bang Héi------------------------
Include("\\script\\global\\repute_head.lua")
function JulianV:Tong_Dialog()
    local tbOpt = {
        { "NhËn ®iÒu kiÖn lËp Bang", JulianV.CreaeTongCondition }, --
        { "NhËn ®iÒu kiÖn gia nhËp Bang Héi", JulianV.JoinTongCondition }, --
        { "KiÕn t¹o Bang Héi", JulianV.CreateTong }, --
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:CreaeTongCondition()
    SetCamp(4)
    SetCurCamp(4)
    AddRepute(1000);
    FuYuan_Start();
    FuYuan_Add(1000);
    AddLeadExp(20000)
    AddEventItem(195)
    if GetLevel() <= 100 then ST_LevelUp(100 - GetLevel()) end
    Msg2Player(
        "<color=yellow>Ng­­¬i ®· héi ®ñ tÊt c¶ ®iÒu kiÖn ®Ó kiÕn t¹o Bang Héi!<color>")
end

function JulianV:JoinTongCondition()
    if GetCamp() ~= 4 then
        if GetLevel() <= 100 then ST_LevelUp(100 - GetLevel()) end
        SetCamp(4)
        SetCurCamp(4)
        Msg2Player("<color=yellow>NhËn ®iÒu kiÖn gia nhËp Bang Héi thµnh c«ng!<color>")
    end
end
---@param num? integer
function JulianV:CreateTong()
    local szTongName, nOper = GetTong()
    if nOper == 0 and GetCamp() == 4 and GetLevel() >= 50 and GetReputeLevel(GetRepute()) >= 6 and
        GetLeadLevel() >= 30 and HaveItem(195) == 1 then
        TalkEx("#JulianV.CreateTongConFirm()", {
            "Ng­êi ch¬i: KiÕm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi cã thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?",
            "KiÕm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i cã ®ñ n¨ng lùc l·nh ®¹o, cã 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua Kú kh¶o nghiÖm 3 ngµy",
            "KiÕm hiÖp ch­ëng m«n nh©n:  NÕu trong 3 ngµy cã ng­êi rêi bang th× néi trong 3 ngµy ®ã ng­¬i ph¶i t×m ng­êi kh¸c thay thÕ.",
            "KiÕm hiÖp ch­ëng m«n nh©n:  Ng­¬i ph¶i cã ®ñ tµi l·nh ®¹o vµ tÝn vËt ®ã lµ Nh¹c V­¬ng KiÕm",
            "Ng­êi ch¬i: Nh¹c V­¬ng KiÕm? Ng­êi nãi lµ thanh kiªm nµy µ?",
            "KiÕm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· cã nã... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!!",
        })
    else
        local i = random(0, 1)
        if i == 0 then
            Talk(1, "",
                "KiÕm hiÖp ch­ëng m«n nh©n: NÕu nh­ muèn thµnh lËp Bang Héi, ng­¬i cã thÓ v× nã bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ nöa ®­êng hñy bá<pic=46>")
        else
            TalkEx(1, "", {
                "KiÕm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iÒu kiÖn lËp Bang µ? §Ó ta nãi cho ng­¬i râ<pic=46>",
                "KiÕm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt x­,  tiÕp theo ng­¬i kh«ng thÓ ë bÊt kú Bang Héi nµo kh¸c, ng­¬i nhÊt ®Þnh ph¶i cã danh väng giang hå, cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.",
                "KiÕm hiÖp ch­ëng m«n nh©n: Sau ®ã ®i chiÕn tr­êng t×m mét thanh Nh¹c V­¬ng KiÕm lµm bang chñ tÝn vËt lµ ®­îc råi.",
            })
        end
    end
end
---@param bConfirm? boolean
function JulianV.CreateTongConFirm( bConfirm )
    if not bConfirm then
        Say(
            "KiÕm hiÖp ch­ëng m«n nh©n: Khai s¸ng Bang Héi, më réng b¸ nghiÖp<pic=46>\nNg­¬i cÇn lÖ phÝ lµ <color=yellow>100 v¹n l­îng.",
            2, {
                "Kh«ng thµnh vÊn ®Ò!/#JulianV.CreateTongConFirm(1)",
                "§Ó ta suy nghÜ l¹i.../return",
            })
    elseif GetCash() >= 1000000 then
        Pay(1000000)
        DelItem(195)
        SetTask(99, 1)
        CreateTong(1)
    end
end
------------------------Chøc n¨ng kh¸c------------------------
function JulianV:ChucNangKhac()
    local tbOpt = {
        { "Më Shop", Sale, { 188 } }, --        
        { "§i tíi B·i LuyÖn C«ng", JulianV.Goto_BLC }, --
        { "Trë vÒ Ba L¨ng HuyÖn", JulianV.Goto_BLH }, --  
        { "Söa lçi ThÇn Hµnh Phï", JulianV.Fix_Shenxingfu }, --
        { "Huû vËt phÈm", JulianV.DisposeItem }, --
        { "Më réng r­¬ng", JulianV.ExpandStorage }, --
        { "Dän s¹ch R­¬ng chøa ®å", JulianV.ClearF4 }, --        
        { "Check Emoticons", JulianV.CheckEmo }, --    
        { "KickOutSelf", KickOutSelf }, --
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:Fix_Shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña quý nh©n sÜ ®· trë vÒ ban ®Çu<pic=46>")
end

function JulianV:Goto_BLH()
    local w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng!");
end

function JulianV:Goto_BLC()
    NewWorld(996, 1581, 3197)
    SetFightState(1)
end
---@param nPic? integer
function JulianV.CheckEmo( nPic )
    if not nPic then
        g_AskClientNumberEx(0, 999, "Start Id", { JulianV.CheckEmo })
    else
        local szPic = ""
        for i = nPic, nPic + 7 do szPic = szPic .. "Pic " .. i .. ": <pic=" .. i .. ">\n" end
        local tbSay = {
            szPic, --
            "                      Rêi khái/return", --
            format("                      Next/#JulianV.CheckEmo(%d)", nPic + 8),
        }
        if nPic > 8 then
            tinsert(tbSay, format("                      Previous/#JulianV.CheckEmo(%d)", nPic - 8))
        end
        CreateTaskSay(tbSay)
    end
end

function JulianV:ExpandStorage() -- Më réng r­¬ng
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    AddItem(6, 1, 1427, 90, 1, 0, 0)
end
---@param bComfirm? boolean
function JulianV.ClearF4( bComfirm ) -- Dän r­¬ng ®å
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L­u ý: <color>TÊt c¶ vËt phÈm vµ trang bÞ trong R­¬ng chøa ®å sÏ bÞ {{Xo¸ bá}} hoµn toµn vµ kh«ng thÓ phôc håi nh­ cò.\n\n<sex>cã ch¾c ch¾n muèn lµm vËy kh«ng<pic=44><color>", --
            {
                { "X¸c nhËn", JulianV.ClearF4, { 1 } }, --
                { "§Ó ta suy nghÜ l¹i..." },
            })
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do RemoveItemByIndex(tbItems[i], -1); end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "§· dän s¹ch r­¬ng<pic=46>")
    end
end
---@param nCount? integer
function JulianV.DisposeItem( nCount ) -- Huû vËt phÈm
    if not nCount then
        g_GiveItemUI("Hñy vËt phÈm",
            "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!",
            { JulianV.DisposeItem })
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
        end
        Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng!")
        Talk(1, "", "Thao t¸c thµnh c«ng, xin kiÓm tra l¹i<pic=46>");
    end
end
