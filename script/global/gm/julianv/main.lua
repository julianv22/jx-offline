------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
IL("TITLE")
IncludeLib("SETTING")
IncludeLib("ITEM")
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\common.lua")
------------------------------------------------------------------
Include("\\script\\global\\gm\\julianv\\functions\\dialog_fun.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_monphai.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_vatpham.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_boss.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_trangbi.lua")
-----------------------------DIALOG-----------------------------

JulianV = {}

function main()
    dofile("script/global/gm/julianv/main.lua")
    dofile("script/global/gm/julianv/lib/lib_vatpham.lua")
    dofile("script/global/gm/julianv/lib/lib_monphai.lua")
    dofile("script/global/gm/julianv/lib/lib_boss.lua")
    JulianV:Main()
    return 1
end

function JulianV:Main()
    local tbOpt = {
        { "Qu¶n lý Server", self.Server_Dialog }, --
        { "Qu¶n lý Nh©n vËt", self.Player_Dialog }, --        
        { "Trang bÞ - VËt phÈm", self.TrangBi_VatPham }, --                
        { "Chøc n¨ng GM", self.Admin_Dialog }, --    
        { "Tools", self.ChucNangKhac }, --
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
    local tbOpt = {
        { "DÞch chuyÓn tøc thêi", JulianV.Teleport }, GM_Title(1), GM_Res(2), GM_Hide(3),
    }
    JDialog:Show(tbOpt, main)
end

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

function JulianV.Teleport( nMapId, nPosX )
    if not nMapId then
        g_AskClientNumberEx(0, 999, "NhËp ID map", { JulianV.Teleport })
    elseif not nPosX then
        g_AskClientNumberEx(0, 9999, "To¹ ®é X", { JulianV.Teleport, { nMapId } })
    else
        g_AskClientNumberEx(0, 9999, "To¹ ®é Y", { JulianV.MoveTo, { nMapId, nPosX } })
    end

end

function JulianV.MoveTo( nMapId, nPosX, nPosY )
    if nPosX < 1000 and nPosY < 1000 then
        nPosX = nPosX * 8
        nPosY = nPosY * 16
    end
    nMove = NewWorld(nMapId, nPosX, nPosY)
    AddSkillState(963, 1, 0, 18 * 3)
    if nMove ~= 1 then
        GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ",
            "ThÊt b¹i! VÞ trÝ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.")
        return
    end

    SetStringTask(TASK_S_POSITION, szPos)
    GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ",
        nMapId .. ", <color=yellow>" .. nPosX .. "/" .. nPosY .. "<color> <color=green>Thµnh c«ng!")
end
-- function JulianV.Teleport( szPos )
--     if not szPos then
--         g_AskClientStringEx(GetStringTask(TASK_S_POSITION), 0, 256, "Map,PosX,PosY",
--             { JulianV.Teleport })
--     else
--         local tbPos = split(szPos, ",")
--         local nMap = tonumber(tbPos[1])
--         local nPosX = tonumber(tbPos[2])
--         local nPosY = tonumber(tbPos[3])
--         local nMove;
--         if nPosX < 1000 and nPosY < 1000 then
--             nPosX = nPosX * 8
--             nPosY = nPosY * 16
--         end

--         nMove = NewWorld(nMap, nPosX, nPosY)
--         AddSkillState(963, 1, 0, 18 * 3)

--         if nMove ~= 1 then
--             GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ",
--                 "ThÊt b¹i! VÞ trÝ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.")
--             return
--         end

--         SetStringTask(TASK_S_POSITION, szPos)
--         GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ", "<color=yellow>Thµnh c«ng!")
--     end
-- end
------------------------Nh©n vËt------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\julianv\\functions\\player_manager.lua")
Include("\\script\\global\\gm\\ex_lib_function.lua")

function JulianV:Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = {
        { "NhËn ®iÓm", JulianV.Point_Dialog }, --
        { "Kü n¨ng - TiÒm n¨ng", JulianV.skillSupport }, --    
        { "Häc kü n¨ng M«n ph¸i", change_phai }, --
        { "§æi mµu PK", JulianV.change_PK }, --
        { "§æi ngò hµnh", JulianV.Change_Serries }, --
        { "§æi giíi tÝnh", JulianV.Change_Sex }, --
        { "§æi tªn nh©n vËt", JulianV.renameCharacter },
    }
    JDialog:Show(tbOpt, main)
end
------------------------Server------------------------
Include("\\script\\global\\gm\\julianv\\functions\\server_manager.lua")
function JulianV:Server_Dialog()
    dofile("script/global/gm/julianv/functions/server_manager.lua")
    local tbOpt = { { "Gäi Boss Hoµng Kim", JulianV.Choose_Boss_Dialog } }
    JDialog:Show(tbOpt, main)
end
------------------------Trang Trang bÞ - VËt phÈm------------------------
Include("\\script\\global\\gm\\julianv\\functions\\trangbi_vatpham.lua")
function JulianV:TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")
    local tbOpt = {
        { "NhËn vËt phÈm", JulianV.NhanVatPham }, --    
        { "NhËn trang bÞ", JulianV.NhanTrangBi }, --   
        { "Trang bÞ hiÕm", JulianV.TrangBiHiem }, --
        { "Thay ®æi ngo¹i h×nh trang bÞ", JulianV.ChangeFeature_Dialog }, --    
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "NhËn MagicScript Item (Genre, Detail, Particular)", JulianV.getMagicItem }, --
        { "LÊy nhiÒu Magic Item (Particular)", JulianV.getMagicItemSll }, --
        { "NhËn Questkey Item (Questkey ID)", JulianV.getQuestkey }, --
        { "NhËn GoldItem (GoldItem ID)", JulianV.getGoldItem }, --       

    }
    JDialog:Show(tbOpt, main)
end
------------------------Chøc n¨ng kh¸c------------------------
function JulianV:ChucNangKhac()
    local tbOpt = {
        { "Më Shop", Sale, { 142 } }, --        
        { "§i tíi B·i LuyÖn C«ng", JulianV.goto_BLC }, --
        { "Trë vÒ Ba L¨ng HuyÖn", JulianV.goto_BLH }, --  
        { "Söa lçi ThÇn Hµnh Phï", JulianV.fix_shenxingfu }, --
        { "Huû vËt phÈm", DisposeItem }, --
        { "Më réng r­¬ng", JulianV.ExpandStorage }, --
        { "Dän s¹ch R­¬ng chøa ®å", JulianV.ClearF4 }, --        
        { "Check Emoticons", JulianV.CheckEmo }, --    
        { "KickOutSelf", KickOutSelf }, --
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:fix_shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña quý nh©n sÜ ®· trë vÒ ban ®Çu<pic=46>")
end

function JulianV:goto_BLH()
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng!");
end

function JulianV:goto_BLC()
    NewWorld(996, 1581, 3197)
    SetFightState(1)
end

function JulianV.CheckEmo( nPic )
    if not nPic then
        g_AskClientNumberEx(1, 999, "Start Id", { JulianV.CheckEmo })
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

function DisposeItem( nCount ) -- Huû vËt phÈm
    if not nCount then
        GiveItemUI("Hñy vËt phÈm",
            "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!",
            "DisposeItem", "onCancel", 1);
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
        end
        Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
        Talk(1, "", "Thao t¸c thµnh c«ng, xin kiÓm tra l¹i<pic=46>");
    end
end
