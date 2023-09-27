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
        { "Ch�c n�ng GM", self.Admin_Dialog }, --    
        { "Tools", self.ChucNangKhac }, --
    }
    JDialog:Show(tbOpt)
end
------------------------Admin------------------------
function JulianV:Admin_Dialog()
    local GM_Title = function( num )
        if Title_GetActiveTitle() ~= 191 then
            return { "B�t huy hi�u GM", JulianV.GM_Activate, { num } }
        else
            return { "T�t huy hi�u GM", JulianV.GM_Activate, { num } }
        end
    end
    local GM_Res = function( num )
        if IsOwnFeatureChanged() == 0 then
            return { "Bi�n th�nh GM", JulianV.GM_Activate, { num } }
        else
            return { "Tr� l�i nh� c�", JulianV.GM_Activate, { num } }
        end
    end
    local GM_Hide = function( num )
        if GetSkillState(733) == -1 then
            return { "B�t t�nh n�ng t�ng h�nh", JulianV.GM_Activate, { num } }
        else
            return { "T�t t�nh n�ng t�ng h�nh", JulianV.GM_Activate, { num } }
        end
    end
    local tbOpt = {
        { "D�ch chuy�n t�c th�i", JulianV.Teleport }, GM_Title(1), GM_Res(2), GM_Hide(3),
    }
    JDialog:Show(tbOpt, main)
end

function JulianV.GM_Activate( num )
    if num == 1 then
        if Title_GetActiveTitle() ~= 191 then
            SetTask(1122, 191)
            Title_AddTitle(191, 1, 30 * 24 * 60 * 60 * 18);
            Title_ActiveTitle(191);
            Msg2Player("K�ch ho�t huy hi�u GM")
        else
            Title_RemoveTitle(191)
            Msg2Player("Hu� k�ch ho�t huy hi�u GM")
        end
        return
    end
    if num == 2 then
        if IsOwnFeatureChanged() == 0 then
            ChangeOwnFeature(0, 0, 567);
            Msg2Player("Bi�n th�nh h�nh d�ng GM");
        else
            RestoreOwnFeature();
            Msg2Player("Tr� l�i h�nh d�ng ban ��u");
        end
        return
    end
    if num == 3 then
        if GetSkillState(733) == -1 then
            AddSkillState(733, 1, 0, 777600);
            Msg2Player("B�t ch�c n�ng t�ng h�nh cho GM");
        else
            AddSkillState(733, 1, 0, 18 * 1);
            Msg2Player("T�t ch�c n�ng t�ng h�nh cho GM");
        end
    end
end

function JulianV.Teleport( nMapId, nPosX )
    if not nMapId then
        g_AskClientNumberEx(0, 999, "Nh�p ID map", { JulianV.Teleport })
    elseif not nPosX then
        g_AskClientNumberEx(0, 9999, "To� �� X", { JulianV.Teleport, { nMapId } })
    else
        g_AskClientNumberEx(0, 9999, "To� �� Y", { JulianV.MoveTo, { nMapId, nPosX } })
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
        GMMsg2Player("D�ch chuy�n ��n v� tr�",
            "Th�t b�i! V� tr� kh�ng h�p l�, vui l�ng ki�m tra l�i.")
        return
    end

    SetStringTask(TASK_S_POSITION, szPos)
    GMMsg2Player("D�ch chuy�n ��n v� tr�",
        nMapId .. ", <color=yellow>" .. nPosX .. "/" .. nPosY .. "<color> <color=green>Th�nh c�ng!")
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
--             GMMsg2Player("D�ch chuy�n ��n v� tr�",
--                 "Th�t b�i! V� tr� kh�ng h�p l�, vui l�ng ki�m tra l�i.")
--             return
--         end

--         SetStringTask(TASK_S_POSITION, szPos)
--         GMMsg2Player("D�ch chuy�n ��n v� tr�", "<color=yellow>Th�nh c�ng!")
--     end
-- end
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
        { "Hu� v�t ph�m", DisposeItem }, --
        { "M� r�ng r��ng", JulianV.ExpandStorage }, --
        { "D�n s�ch R��ng ch�a ��", JulianV.ClearF4 }, --        
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

function JulianV:ExpandStorage() -- M� r�ng r��ng
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    AddItem(6, 1, 1427, 90, 1, 0, 0)
end

function JulianV.ClearF4( bComfirm ) -- D�n r��ng ��
    if not bComfirm then
        CreateNewSayEx(SPRLINK ..
                           "<color=red><pic=115> L�u �: <color>T�t c� v�t ph�m v� trang b� trong R��ng ch�a �� s� b� {{Xo� b�}} ho�n to�n v� kh�ng th� ph�c h�i nh� c�.\n\n<sex>c� ch�c ch�n mu�n l�m v�y kh�ng<pic=44><color>", --
            {
                { "X�c nh�n", JulianV.ClearF4, { 1 } }, --
                { "�� ta suy ngh� l�i..." },
            })
    else
        local tbItems = GetRoomItems(0);
        if (getn(tbItems) > 0) then
            for i = 1, getn(tbItems) do RemoveItemByIndex(tbItems[i], -1); end
            AddItem(6, 1, 5128, 0, 0, 0)
        end
        Talk(1, "", "�� d�n s�ch r��ng<pic=46>")
    end
end

function DisposeItem( nCount ) -- Hu� v�t ph�m
    if not nCount then
        GiveItemUI("H�y v�t ph�m",
            "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m, v�t ph�m �� h�y kh�ng th� l�y l�i ���c!",
            "DisposeItem", "onCancel", 1);
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
        end
        Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
        Talk(1, "", "Thao t�c th�nh c�ng, xin ki�m tra l�i<pic=46>");
    end
end
