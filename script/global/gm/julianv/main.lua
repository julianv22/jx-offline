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
Include("\\script\\global\\gm\\julianv\\functions\\dialog_fun.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_monphai.lua")
Include("\\script\\global\\gm\\julianv\\lib\\lib_vatpham.lua")
-----------------------------DIALOG-----------------------------

tbDialog = JDialog
function main()
    dofile("script/global/gm/julianv/main.lua")
    dofile("script/global/gm/julianv/lib/lib_vatpham.lua")
    dofile("script/global/gm/julianv/lib/lib_monphai.lua")
    local tbOpt = { --
    {"Tools", ChucNangKhac}, --
    {"Qu¶n lý Nh©n vËt", Player_Dialog}, --
    {"Qu¶n lý Server", Server_Dialog}, --
    {"Trang bÞ - VËt phÈm", TrangBi_VatPham}, --        
    {"Check Resources", Admin_Dialog} --    
    }
    tbDialog:ChangeTitle()
    tbDialog:Show(tbOpt)
    return 1
end
------------------------Admin------------------------
function Admin_Dialog()
    local tbOpt = { --
    {"Check Emoticons", CheckEmo} --    
    }
    tbDialog:Show(tbOpt, main)
end

function CheckEmo(nPic)
    if not nPic then
        AskClientForNumber("CheckEmo", 1, 999, "Start ID")
    else
        local szPic = ""
        for i = nPic, nPic + 7 do
            szPic = szPic .. "Pic " .. i .. ": <pic=" .. i .. ">\n"
        end
        local tbSay = {szPic, --
        "                      Rêi khái/return", --
        format("                      Next/#CheckEmo(%d)", nPic + 8)}
        if nPic > 8 then
            tinsert(tbSay, format("                      Previous/#CheckEmo(%d)", nPic - 8))
        end
        CreateTaskSay(tbSay)
    end
end
------------------------Nh©n vËt------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\julianv\\functions\\player_manager.lua")
Include("\\script\\global\\gm\\ex_lib_function.lua")

function Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = { --    
    {"NhËn ®iÓm", Point_Dialog}, --
    {"Kü n¨ng - TiÒm n¨ng", skillSupport}, --    
    {"Häc kü n¨ng M«n ph¸i", change_phai}, --
    {"§æi mµu PK", change_PK}, --
    {"§æi ngò hµnh", Change_Serries}, --
    {"§æi giíi tÝnh", Change_Sex}, --
    {"§æi tªn nh©n vËt", renameCharacter}}
    tbDialog:Show(tbOpt, main)
end
------------------------Server------------------------
function Server_Dialog()
    local tbOpt = { --
    {"Gäi Boss Hoµng Kim"}}
    tbDialog:Show(tbOpt, main)
end
------------------------Trang Trang bÞ - VËt phÈm------------------------
Include("\\script\\global\\gm\\julianv\\functions\\trangbi_vatpham.lua")
function TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")    
    local tbOpt = { --    
    {"NhËn trang bÞ", NhanTrangBi}, --    
    {"NhËn vËt phÈm", NhanVatPham}, --    
    {"Thay ®æi ngo¹i h×nh trang bÞ", ChangeFeature_Dialog}, --    
    {"------------------------", TrangBi_VatPham}, --
    {"LÊy MagicScript Item", getMagicItem}, --
    {"LÊy Questkey Item (Questkey ID)", getQuestkey}, --
    {"LÊy GoldItem (GoldItem ID)", getGoldItem}, --
    {"------------------------", TrangBi_VatPham}, --
    {"Më réng r­¬ng", ExpandStorage}, --
    {"Dän s¹ch R­¬ng chøa ®å", ClearF4}, --    
    {"Huû vËt phÈm", DisposeItem}}
    tbDialog:Show(tbOpt, main)
end
------------------------Chøc n¨ng kh¸c------------------------
function ChucNangKhac()
    local tbOpt = { --
    {"Më Shop", Sale, {142}}, --        
    {"§i tíi B·i LuyÖn C«ng", goto_BLC}, --
    {"Trë vÒ Ba L¨ng HuyÖn", goto_BLH}, --  
    {"Söa lçi ThÇn Hµnh Phï", fix_shenxingfu}, --  
    {"KickOutSelf", KickOutSelf}}
    tbDialog:Show(tbOpt, main)
end

function fix_shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr¹ng th¸i sö dông thæ ®Þa phï vµ thÇn hµnh phï cña quý nh©n sÜ ®· trë vÒ ban ®Çu!")
end

function goto_BLH()
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng!");
end

function goto_BLC()
    NewWorld(996, 1581, 3197)
    SetFightState(1)
end
