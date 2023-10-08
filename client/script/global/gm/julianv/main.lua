------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
IL("TITLE")
IncludeLib("SETTING")
IncludeLib("ITEM")
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\thinh\\hotro\\functions_partner.lua") -- b�n ��ng h�nh
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
        { "Qu�n l� Server", self.Server_Dialog }, --
        { "Qu�n l� Nh�n v�t", self.Player_Dialog }, --        
        { "Trang b� - V�t ph�m", self.TrangBi_VatPham }, --                
        { "B�n ��ng h�nh", functions_for_partner }, --
        { "Bang H�i", self.Tong_Dialog }, --
        { "Ch�c n�ng GM", self.Admin_Dialog }, --            
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
    local PowerOpt = function()
        if HaveMagic(161) ~= -1 then
            return { "Power Down", JulianV.PowerUp, { -1 } }
        else
            return { "Power Up", JulianV.PowerUp, { 0 } }
        end
    end
    local tbOpt = {
        { "D�ch chuy�n t�c th�i", JulianV.Teleport }, GM_Title(1), GM_Res(2), GM_Hide(3),
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
---@param nMapId? integer 
---@param nPosX? integer
function JulianV.Teleport( nMapId, nPosX )
    if not nMapId then
        g_AskClientNumberEx(0, 9999, "Nh�p ID map", { JulianV.Teleport })
    elseif not nPosX then
        g_AskClientNumberEx(0, 9999, "To� �� X", { JulianV.Teleport, { nMapId } })
    else
        g_AskClientNumberEx(0, 9999, "To� �� Y", { JulianV.MoveTo, { nMapId, nPosX } })
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
        GMMsg2Player("D�ch chuy�n ��n v� tr�",
            "Th�t b�i! V� tr� kh�ng h�p l�, vui l�ng ki�m tra l�i.")
        return
    end

    SetStringTask(TASK_S_POSITION, szPos)
    GMMsg2Player("D�ch chuy�n ��n v� tr�", nMapId .. ", <color=yellow>" .. nPosX .. "/" ..
        nPosY .. "<color> <color=green>Th�nh c�ng!")
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
        -- Earn(10000000) -- 1000 v�n
        -- AddItem(0, 10, 5, 5, 0, 0, 0) -- Ng�a
        ST_LevelUp(lvl - GetLevel())
        DoClearPropCore()
        AddStrg(lvl * 250)
        AddDex(lvl * 250)
        AddVit(lvl * 250)
        AddEng(lvl * 250)
        for i = 1, getn(tbMagic) do AddMagic(tbMagic[i], floor(lvl / 10 * 1.5)) end
        GMMsg2Player("Th�ng b�o",
            "<color=yellow>Ng��i �� nh�n ���c m�t c� l�c l��ng th�n b�!<color>")
    end
end
------------------------Nh�n v�t------------------------
Include("\\script\\global\\fuyuan.lua") -- fuc duyen
Include("\\script\\global\\gm\\ex_lib_function.lua")

function JulianV:Player_Dialog()
    dofile("script/global/gm/julianv/functions/player_manager.lua")
    local tbOpt = {
        { "Nh�n �i�m", JulianV.Point_Dialog }, --
        { "K� n�ng - Ti�m n�ng", JulianV.SkillSupport }, --    
        { "H�c k� n�ng M�n ph�i", change_phai }, --
        { "Nh�n danh hi�u", JulianV.NhanDanhHieu }, --
        { "��i m�u PK", JulianV.Change_PK }, --
        { "��i ng� h�nh", JulianV.Change_Serries }, --
        { "��i gi�i t�nh", JulianV.Change_Sex }, --
        { "��i t�n nh�n v�t", JulianV.RenameCharacter },
    }
    JDialog:Show(tbOpt, main)
end
------------------------Server------------------------
function JulianV:Server_Dialog()
    dofile("script/global/gm/julianv/functions/server_manager.lua")
    local tbOpt = {
        { "Ch�c n�ng th�ng b�o", JulianV.Notification_Dialog },
        { "G�i Boss Ho�ng Kim", JulianV.Choose_Boss_Dialog },
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:Notification_Dialog()
    local tbOpt = {
        { "T�n s� th� gi�i", JulianV.GM_Notification, { 0 } },
        { "T�n s� m�y ch�", JulianV.GM_Notification, { 1 } },
    }
    JDialog:Show(tbOpt, main)
end
---@param nType? integer
---@param szMessage? string
function JulianV.GM_Notification( nType, szMessage )
    if not szMessage then
        g_AskClientStringEx("", 0, 256, "N�i dung", { JulianV.GM_Notification, { nType } })
    else
        if nType == 0 then
            Msg2SubWorld("<color=yellow><bclr=red>GM " .. GetName() ..
                             "<bclr> th�ng b�o:<color> <color=cyan>" .. szMessage)
        else
            AddGlobalCountNews("<color=yellow><bclr=red>GM " .. GetName() ..
                                   "<bclr> th�ng b�o: <color>" .. szMessage, 3)
        end
    end
end
------------------------Trang Trang b� - V�t ph�m------------------------
function JulianV:TrangBi_VatPham()
    dofile("script/global/gm/julianv/functions/trangbi_vatpham.lua")
    local tbOpt = {
        { "Nh�n v�t ph�m", JulianV.NhanVatPham }, --    
        { "Nh�n trang b�", JulianV.NhanTrangBi }, --   
        { "Trang b� hi�m", JulianV.TrangBiHiem }, --
        { "Thay ��i ngo�i h�nh trang b�", JulianV.ChangeFeature_Dialog }, --    
        { "------------------------", JulianV.TrangBi_VatPham }, --
        { "Nh�n MagicScript Item (Genre, Detail, Particular)", JulianV.GetMagicItem }, --
        { "L�y nhi�u Magic Item (Particular)", JulianV.GetMagicItems }, --
        { "Nh�n Questkey Item (Questkey ID)", JulianV.GetQuestkey }, --
        { "Nh�n GoldItem (GoldItem ID)", JulianV.GetGoldItem }, --       

    }
    JDialog:Show(tbOpt, main)
end
------------------------Bang H�i------------------------
Include("\\script\\global\\repute_head.lua")
function JulianV:Tong_Dialog()
    local tbOpt = {
        { "Nh�n �i�u ki�n l�p Bang", JulianV.CreaeTongCondition }, --
        { "Nh�n �i�u ki�n gia nh�p Bang H�i", JulianV.JoinTongCondition }, --
        { "Ki�n t�o Bang H�i", JulianV.CreateTong }, --
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
        "<color=yellow>Ng���i �� h�i �� t�t c� �i�u ki�n �� ki�n t�o Bang H�i!<color>")
end

function JulianV:JoinTongCondition()
    if GetCamp() ~= 4 then
        if GetLevel() <= 100 then ST_LevelUp(100 - GetLevel()) end
        SetCamp(4)
        SetCurCamp(4)
        Msg2Player("<color=yellow>Nh�n �i�u ki�n gia nh�p Bang H�i th�nh c�ng!<color>")
    end
end
---@param num? integer
function JulianV:CreateTong()
    local szTongName, nOper = GetTong()
    if nOper == 0 and GetCamp() == 4 and GetLevel() >= 50 and GetReputeLevel(GetRepute()) >= 6 and
        GetLeadLevel() >= 30 and HaveItem(195) == 1 then
        TalkEx("#JulianV.CreateTongConFirm()", {
            "Ng��i ch�i: Ki�m hi�p ch��ng m�n nh�n, xin h�i ta ph�i l�m nh� th� n�o m�i c� th� khai t�ng l�p ph�i tr� th�nh Bang ch� ��y?",
            "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ng��i ph�i c� �� n�ng l�c l�nh ��o, c� 16 ng��i c�ng ch� h��ng c�ng ng��i l�p bang, tr�i qua K� kh�o nghi�m 3 ng�y",
            "Ki�m hi�p ch��ng m�n nh�n:  N�u trong 3 ng�y c� ng��i r�i bang th� n�i trong 3 ng�y �� ng��i ph�i t�m ng��i kh�c thay th�.",
            "Ki�m hi�p ch��ng m�n nh�n:  Ng��i ph�i c� �� t�i l�nh ��o v� t�n v�t �� l� Nh�c V��ng Ki�m",
            "Ng��i ch�i: Nh�c V��ng Ki�m? Ng��i n�i l� thanh ki�m n�y �?",
            "Ki�m hi�p ch��ng m�n nh�n : Th� ra l� ng��i �� c� n�... Kh�ng t�, qu� nhi�n tu�i tr� t�i cao!!!",
        })
    else
        local i = random(0, 1)
        if i == 0 then
            Talk(1, "",
                "Ki�m hi�p ch��ng m�n nh�n: N�u nh� mu�n th�nh l�p Bang H�i, ng��i c� th� v� n� b� ra 1 l��ng l�n th�i gian, s�c l�c c�ng t�m huy�t, kh�ng th� n�a ���ng h�y b�<pic=46>")
        else
            TalkEx(1, "", {
                "Ki�m hi�p ch��ng m�n nh�n:  Ng��i mu�n h�i �i�u ki�n l�p Bang �? �� ta n�i cho ng��i r�<pic=46>",
                "Ki�m hi�p ch��ng m�n nh�n: ��u ti�n ph�i xu�t x�,  ti�p theo ng��i kh�ng th� � b�t k� Bang H�i n�o kh�c, ng��i nh�t ��nh ph�i c� danh v�ng giang h�, cu�i c�ng l� t�i l�nh ��o ph�i h�n 30 c�p.",
                "Ki�m hi�p ch��ng m�n nh�n: Sau �� �i chi�n tr��ng t�m m�t thanh Nh�c V��ng Ki�m l�m bang ch� t�n v�t l� ���c r�i.",
            })
        end
    end
end
---@param bConfirm? boolean
function JulianV.CreateTongConFirm( bConfirm )
    if not bConfirm then
        Say(
            "Ki�m hi�p ch��ng m�n nh�n: Khai s�ng Bang H�i, m� r�ng b� nghi�p<pic=46>\nNg��i c�n l� ph� l� <color=yellow>100 v�n l��ng.",
            2, {
                "Kh�ng th�nh v�n ��!/#JulianV.CreateTongConFirm(1)",
                "�� ta suy ngh� l�i.../return",
            })
    elseif GetCash() >= 1000000 then
        Pay(1000000)
        DelItem(195)
        SetTask(99, 1)
        CreateTong(1)
    end
end
------------------------Ch�c n�ng kh�c------------------------
function JulianV:ChucNangKhac()
    local tbOpt = {
        { "M� Shop", Sale, { 188 } }, --        
        { "�i t�i B�i Luy�n C�ng", JulianV.Goto_BLC }, --
        { "Tr� v� Ba L�ng Huy�n", JulianV.Goto_BLH }, --  
        { "S�a l�i Th�n H�nh Ph�", JulianV.Fix_Shenxingfu }, --
        { "Hu� v�t ph�m", JulianV.DisposeItem }, --
        { "M� r�ng r��ng", JulianV.ExpandStorage }, --
        { "D�n s�ch R��ng ch�a ��", JulianV.ClearF4 }, --        
        { "Check Emoticons", JulianV.CheckEmo }, --    
        { "KickOutSelf", KickOutSelf }, --
    }
    JDialog:Show(tbOpt, main)
end

function JulianV:Fix_Shenxingfu()
    DisabledUseTownP(0)
    Talk(1, "",
        "Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a qu� nh�n s� �� tr� v� ban ��u<pic=46>")
end

function JulianV:Goto_BLH()
    local w, x, y = GetWorldPos()
    if (w ~= 53) then
        SetFightState(0)
        NewWorld(53, 1626, 3178)
    else
        SetPos(1619, 3183)
    end
    Msg2Player("Di chuy�n v� <color=yellow>Ba L�ng Huy�n<color> th�nh c�ng!");
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
---@param bComfirm? boolean
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
---@param nCount? integer
function JulianV.DisposeItem( nCount ) -- Hu� v�t ph�m
    if not nCount then
        g_GiveItemUI("H�y v�t ph�m",
            "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m, v�t ph�m �� h�y kh�ng th� l�y l�i ���c!",
            { JulianV.DisposeItem })
    else
        for i = 1, nCount do
            local nItemIndex = GetGiveItemUnit(i)
            local strItem = GetItemName(nItemIndex)
            RemoveItemByIndex(nItemIndex)
            -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
        end
        Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng!")
        Talk(1, "", "Thao t�c th�nh c�ng, xin ki�m tra l�i<pic=46>");
    end
end
