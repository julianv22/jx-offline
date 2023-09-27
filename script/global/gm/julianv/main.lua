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
        { "Qu�n l� Server", self.Server_Dialog }, --
        { "Qu�n l� Nh�n v�t", self.Player_Dialog }, --        
        { "Trang b� - V�t ph�m", self.TrangBi_VatPham }, --                
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
------------------------Nh�n v�t------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\julianv\\functions\\player_manager.lua")
Include("\\script\\global\\gm\\ex_lib_function.lua")

function JulianV:Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = {
        { "Nh�n �i�m", JulianV.Point_Dialog }, --
        { "K� n�ng - Ti�m n�ng", JulianV.skillSupport }, --    
        { "H�c k� n�ng M�n ph�i", change_phai }, --
        { "��i m�u PK", JulianV.change_PK }, --
        { "��i ng� h�nh", JulianV.Change_Serries }, --
        { "��i gi�i t�nh", JulianV.Change_Sex }, --
        { "��i t�n nh�n v�t", JulianV.renameCharacter },
    }
    JDialog:Show(tbOpt, main)
end
------------------------Server------------------------
Include("\\script\\global\\gm\\julianv\\functions\\server_manager.lua")
function JulianV:Server_Dialog()
    dofile("script/global/gm/julianv/functions/server_manager.lua")
    local tbOpt = { { "G�i Boss Ho�ng Kim", JulianV.Choose_Boss_Dialog } }
    JDialog:Show(tbOpt, main)
end
------------------------Trang Trang b� - V�t ph�m------------------------
Include("\\script\\global\\gm\\julianv\\functions\\trangbi_vatpham.lua")
function JulianV:TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")
    local tbOpt = {
        { "Nh�n v�t ph�m", JulianV.NhanVatPham }, --    
        { "Nh�n trang b�", JulianV.NhanTrangBi }, --   
        { "Trang b� hi�m", JulianV.TrangBiHiem }, --
        { "Thay ��i ngo�i h�nh trang b�", JulianV.ChangeFeature_Dialog }, --    
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "Nh�n MagicScript Item (Genre, Detail, Particular)", JulianV.getMagicItem }, --
        { "L�y nhi�u Magic Item (Particular)", JulianV.getMagicItemSll }, --
        { "Nh�n Questkey Item (Questkey ID)", JulianV.getQuestkey }, --
        { "Nh�n GoldItem (GoldItem ID)", JulianV.getGoldItem }, --
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "M� r�ng r��ng", JulianV.ExpandStorage }, --
        { "D�n s�ch R��ng ch�a ��", JulianV.ClearF4 }, --
        { "Hu� v�t ph�m", DisposeItem },
    }
    JDialog:Show(tbOpt, main)
end
------------------------Ch�c n�ng kh�c------------------------
function JulianV:ChucNangKhac()
    local tbOpt = {
        { "M� Shop", Sale, { 142 } }, --        
        { "�i t�i B�i Luy�n C�ng", JulianV.goto_BLC }, --
        { "Tr� v� Ba L�ng Huy�n", JulianV.goto_BLH }, --  
        { "S�a l�i Th�n H�nh Ph�", JulianV.fix_shenxingfu }, --          
        { "Check Emoticons", JulianV.CheckEmo }, --    
        { "KickOutSelf", KickOutSelf }, --
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:fix_shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a qu� nh�n s� �� tr� v� ban ��u<pic=46>")
end

function JulianV:goto_BLH()
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuy�n v� <color=yellow>Ba L�ng Huy�n<color> th�nh c�ng!");
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
            "                      R�i kh�i/return", --
            format("                      Next/#JulianV.CheckEmo(%d)", nPic + 8),
        }
        if nPic > 8 then
            tinsert(tbSay, format("                      Previous/#JulianV.CheckEmo(%d)", nPic - 8))
        end
        CreateTaskSay(tbSay)
    end
end
