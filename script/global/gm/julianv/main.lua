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
    {"Qu�n l� Nh�n v�t", Player_Dialog}, --
    {"Qu�n l� Server", Server_Dialog}, --
    {"Trang b� - V�t ph�m", TrangBi_VatPham}, --        
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
        "                      R�i kh�i/return", --
        format("                      Next/#CheckEmo(%d)", nPic + 8)}
        if nPic > 8 then
            tinsert(tbSay, format("                      Previous/#CheckEmo(%d)", nPic - 8))
        end
        CreateTaskSay(tbSay)
    end
end
------------------------Nh�n v�t------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\julianv\\functions\\player_manager.lua")
Include("\\script\\global\\gm\\ex_lib_function.lua")

function Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = { --    
    {"Nh�n �i�m", Point_Dialog}, --
    {"K� n�ng - Ti�m n�ng", skillSupport}, --    
    {"H�c k� n�ng M�n ph�i", change_phai}, --
    {"��i m�u PK", change_PK}, --
    {"��i ng� h�nh", Change_Serries}, --
    {"��i gi�i t�nh", Change_Sex}, --
    {"��i t�n nh�n v�t", renameCharacter}}
    tbDialog:Show(tbOpt, main)
end
------------------------Server------------------------
function Server_Dialog()
    local tbOpt = { --
    {"G�i Boss Ho�ng Kim"}}
    tbDialog:Show(tbOpt, main)
end
------------------------Trang Trang b� - V�t ph�m------------------------
Include("\\script\\global\\gm\\julianv\\functions\\trangbi_vatpham.lua")
function TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")    
    local tbOpt = { --    
    {"Nh�n trang b�", NhanTrangBi}, --    
    {"Nh�n v�t ph�m", NhanVatPham}, --    
    {"Thay ��i ngo�i h�nh trang b�", ChangeFeature_Dialog}, --    
    {"------------------------", TrangBi_VatPham}, --
    {"L�y MagicScript Item", getMagicItem}, --
    {"L�y Questkey Item (Questkey ID)", getQuestkey}, --
    {"L�y GoldItem (GoldItem ID)", getGoldItem}, --
    {"------------------------", TrangBi_VatPham}, --
    {"M� r�ng r��ng", ExpandStorage}, --
    {"D�n s�ch R��ng ch�a ��", ClearF4}, --    
    {"Hu� v�t ph�m", DisposeItem}}
    tbDialog:Show(tbOpt, main)
end
------------------------Ch�c n�ng kh�c------------------------
function ChucNangKhac()
    local tbOpt = { --
    {"M� Shop", Sale, {142}}, --        
    {"�i t�i B�i Luy�n C�ng", goto_BLC}, --
    {"Tr� v� Ba L�ng Huy�n", goto_BLH}, --  
    {"S�a l�i Th�n H�nh Ph�", fix_shenxingfu}, --  
    {"KickOutSelf", KickOutSelf}}
    tbDialog:Show(tbOpt, main)
end

function fix_shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a qu� nh�n s� �� tr� v� ban ��u!")
end

function goto_BLH()
    w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuy�n v� <color=yellow>Ba L�ng Huy�n<color> th�nh c�ng!");
end

function goto_BLC()
    NewWorld(996, 1581, 3197)
    SetFightState(1)
end
