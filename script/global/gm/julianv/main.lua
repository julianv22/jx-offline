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
        { "Admin Control Panel", self.Admin_Dialog }, --    
        { "Tools", self.ChucNangKhac }, --
    }
    JDialog:Show(tbOpt)
end
------------------------Admin------------------------
function JulianV:Admin_Dialog()
    local tbOpt = {}
    JDialog:Show(tbOpt, main)
end
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
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "Më réng r­¬ng", JulianV.ExpandStorage }, --
        { "Dän s¹ch R­¬ng chøa ®å", JulianV.ClearF4 }, --
        { "Huû vËt phÈm", DisposeItem },
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
