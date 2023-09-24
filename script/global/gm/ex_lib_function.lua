IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER");
IncludeLib("TONG");
IncludeLib("LEAGUE");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\newtask\\newtask_head.lua")
TITLEDIALOG = "Tªn nh©n vËt : <color=green>%s<color>\n" .. "Tªn tµi kho¶n: <color=green>%s<color>\n" ..
                  "Täa ®é       : <color=green>%d, %d/%d<color> \nIP           : <color=green>%s<color>"
-- Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua");
Include("\\script\\global\\gm\\lib_data_table.lua");
Include("\\script\\global\\gm\\lib_data_table_filelua.lua");
Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua"); -- tÈy tñy, céng ®iÓm nhanh
Include("\\script\\global\\gm\\ex_lib_head.lua");
Include("\\script\\global\\gm\\functions_points.lua"); -- lÊy c¸c lo¹i ®iÓm
Include("\\script\\global\\gm\\functions_playmusic.lua"); -- play music
Include("\\script\\global\\gm\\functions_boss.lua") -- gäi boss ,t×m boss
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- lÊy item hoµng kim, b¹ch kim
function main()
    dofile("script/global/gm/ex_lib_function.lua")
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "Vøt tÊt c¶ vËt phÈm trong r­¬ng/vutallvatpham")
    tinsert(tbSay, "NhËn danh hiÖu kiÕm thÕ/chondanhhieu")
    tinsert(tbSay, "LÊy c¸c lo¹i ®å vµ ®iÓm/laydohoangkim")
    -- tinsert(tbSay, "Test/takeMusic") 
    -- tinsert(tbSay, "LÊy full ngùa/layngua") 
    tinsert(tbSay, "§æi ngo¹i h×nh vò khÝ/ngoaitrang")
    -- tinsert(tbSay, "LÊy c¸c lo¹i ®iÓm/laydiem") 
    -- tinsert(tbSay, "LÊy Magicscript Item/TaoItem") 
    tinsert(tbSay, "Thªm,Xãa Skill theo ID/LaySkillID")
    tinsert(tbSay, "§æi mµu ch÷/change_mauchu")
    tinsert(tbSay, "ChuyÓn ®æi m«n ph¸i/change_phai")
    -- tinsert(tbSay, "LÊy Set ®å hoµng kim, b¹ch kim/chose_type_goldquip")
    -- tinsert(tbSay, "N©ng cÊp ®å b¹ch kim/bachkim_main")
    tinsert(tbSay, "Boss Hoµng Kim/bosshk")
    tinsert(tbSay, "TÈy, céng ®iÓm nhanh/chose_reset_type")
    tinsert(tbSay, "Reload ngay/reloadngay")
    tinsert(tbSay, "Reload Script/ReLoadScript")
    tinsert(tbSay, "Hñy vËt phÈm/DisposeItem")
    tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
    CreateTaskSay(tbSay)
    return 1;
end
-----------------------------------------------------------------------------
function laydohoangkim()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "LÊy full ngùa/layngua")
    tinsert(tbSay, "LÊy c¸c lo¹i ®iÓm/laydiem")
    tinsert(tbSay, "LÊy phi phong/layphiphong")
    tinsert(tbSay, "LÊy c¸c lo¹i ®iÓm/laydiem")
    tinsert(tbSay, "LÊy Magicscript Item/TaoItem")
    tinsert(tbSay, "LÊy Set ®å hoµng kim, b¹ch kim/chose_type_goldquip")
    tinsert(tbSay, "N©ng cÊp ®å b¹ch kim/bachkim_main")
    tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
    CreateTaskSay(tbSay)
    return 1;
end

function vutallvatpham()
    ThrowAllItem()
end
--------------------test------------------------
Include("\\script\\global\\thanh\\npc\\bosssatthuhead.lua")
Include("\\script\\global\\thanh\\npc\\add_npc.lua")
-- function nhandanhhieu(nindex)
-- Title_AddTitle(nindex, 1, 4302359);
-- Title_ActiveTitle(nindex);
-- SetTask(1122, nindex);
-- end
---------------NhËn Danh HiÖu-----------------------
function chondanhhieu()
    local szTitle = "Xin chµo <color=yellow>" .. GetName() .. "<color> , xin mêi chän Danh HiÖu...!!!"
    local tbOpt = {{"Uy ChÊn Cöu Ch©u.", nhandanhhieu, {5001}}, {"Vâ L©m ChÝ T«n.", nhandanhhieu, {5002}},
                   {"NhÊt KiÕm Phong Thiªn.", nhandanhhieu, {5003}}, {"NhÊt L­u Cao Thñ.", nhandanhhieu, {5004}},
                   {"HiÖp Kh¸ch Cuèi Cïng Trªn Giang Hå.", nhandanhhieu, {5005}}, {"Tho¸t"}}
    CreateNewSayEx(szTitle, tbOpt)
end
function nhandanhhieu(nIndex)
    Title_AddTitle(nIndex, 1, 4302359);
    Title_ActiveTitle(nIndex);
    SetTask(1122, nIndex);
end
--------------------- LÊy phi phong-------------------------
function layphiphong()
    for i = 3465, 3490 do
        AddGoldItem(0, i)
    end
end
--------------------- Gia NhËp M«n Ph¸i (New)-------------------------
Include("\\script\\faction_def.lua")
function change_phai()
    local szTitle = "Xin chµo ! §¹i hiÖp muèn gia nhËp ph¸i nµo ?"
    local tbOpt = {}
    local tbFacName = tbFacDef.tbFacShortName
    for i = 0, getn(tbFacName) do
        tinsert(tbOpt, {tbFacName[i], joinMonphai, {i}})
    end
    tinsert(tbOpt, {"L¸t n÷a quay l¹i"});
    CreateNewSayEx(szTitle, tbOpt)
end
function joinMonphai(nIndex)
    local CurFaction = GetLastFactionNumber()
    local nLevelSkill = 150 -- add tíi skill 150
    if nIndex == CurFaction then
        Msg2Player("HiÖn t¹i b¹n ®ang ë m«n ph¸i nµy")
        return 1;
    end
    ---------------th«ng tin m«n ph¸i hiÖn t¹i-------------------
    local curFacNames = tbFacDef.tbFacNames[CurFaction]
    local fname = tbFacDef.tbFacChNames[CurFaction]
    if curFacNames ~= nil then
        DoClearSkillCore()
        local curFacNumber = tbFacDef.tbFacName2FacId[curFacNames]
        local curTaskId_Fact
        mi = tbFacDef.tbFacTaskIds[CurFaction]
        nt_setTask(curTaskId_Fact, 0) -- xãa nhiÖm vô m«n ph¸i cña ph¸i cò
        for i = 10, nLevelSkill, 10 do
            DelFacSkill(curFacNumber, i)
        end
        local szMsg = format("§· xãa tÊt c¶ kü n¨ng cña <color=green>%s<color>", fname)
        Msg2Player("" .. szMsg)
    end
    -------------Th«ng tin add m«n ph¸i míi---------------------
    local FacNames = tbFacDef.tbFacNames[nIndex]
    local FacNumber = tbFacDef.tbFacName2FacId[FacNames]
    local FacSeries = tbFacDef.tbSeriess[nIndex]
    local Camps = tbFacDef.tbCamps[nIndex]
    local RankIds = tbFacDef.tbRankIds[nIndex]
    local TaskId_Fact = tbFacDef.tbFacTaskIds[nIndex]
    local TaskId_137s = tbFacDef.tbTaskId_137s[nIndex]
    local Value_137s = tbFacDef.tbValue_137s[nIndex]
    local name = format("<color=yellow>" .. GetName() .. "<color>")
    local JoinMsgs = format(tbFacDef.tbJoinMsgs[nIndex], name)
    ----------------------------------
    SetSeries(FacSeries)
    nt_setTask(TaskId_Fact, 60 * 256) -- Set lµm nhiÖm vô xuÊt s­
    SetFaction(FacNames)
    SetCamp(Camps)
    SetCurCamp(Camps)
    SetRank(RankIds)
    nt_setTask(TaskId_137s, Value_137s)
    SetLastFactionNumber(FacNumber)
    for i = 10, nLevelSkill, 10 do
        AddFacSkill(FacNumber, i)
    end
    DoClearPropCore()
    Msg2SubWorld(JoinMsgs)
    -- KickOutSelf()
end

function test()
    local szTitle = "Xin chµo ! §¹i hiÖp häc muèn gióp ®ì g×?"
    local tbOpt = {{"KÕt thóc ®èi tho¹i"}}
    CreateNewSayEx("<link=image:\\spr\\item\\songjin\\token.spr> <link>" .. szTitle .. "", tbOpt)
end

function gotomap()
    w, x, y = GetWorldPos()
    if (w ~= 193) then
        SetFightState(0)
        NewWorld(193, 1937, 2851)
    end
end
--------Ngùa------------------
function layngua()
    local tbSay = {"§¹i hiÖp muèn lÊy ngùa nµo?"}
    local nName = tbNameResHorse
    local nNum = getn(nName)
    for i = 1, nNum do
        local nHorse = tbNameResHorse[i].szName
        -- local nHorse = nName[num].szName
        tinsert(tbSay, "" .. nHorse .. "/layngua1")
    end
    tinsert(tbSay, "Tho¸t/no")
    CreateTaskSay(tbSay)
end
function layngua1(num, page)
    local tbSay = {"§¹i hiÖp muèn lÊy ngùa nµo?"}
    local nTable = tbNameResHorse[num + 1].szEquip
    local nCount = getn(nTable)
    if page == nill then
        if nCount > 10 then
            for i = 1, 10 do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, 1))
            tinsert(tbSay, "Tho¸t/no")
        end
        if nCount <= 10 then
            for i = 1, nNum do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, "Tho¸t/no")
        end
    end
    if page ~= nil and page >= 0 then
        local nPage = page
        local nNum = nCount - nPage * 10
        if nNum > 10 then
            for i = nPage * 10 + 1, nPage * 10 + 10 do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            if page ~= 0 then
                tinsert(tbSay, format("Trang tr­íc/#layngua1(%d,%d)", num, page - 1))
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho¸t/no")
            end
            if page == 0 then
                tinsert(tbSay, format("Trang sau/#layngua1(%d,%d)", num, page + 1))
                tinsert(tbSay, "Tho¸t/no")
            end
        end
        if nNum <= 10 then
            for i = nPage * 10 + 1, nCount do
                local nHorseName = nTable[i][1]
                local nHorseRes = nTable[i][2]
                local nHorseLevel = nTable[i][3]
                tinsert(tbSay, format("" .. nHorseName .. " [CÊp " .. nHorseLevel .. "]/#addngua(%d,%d)", nHorseRes,
                    nHorseLevel))
            end
            tinsert(tbSay, format("Trang tr­íc/#layngua1(%d,%d)", num, page - 1))
            tinsert(tbSay, "Tho¸t/no")
        end
    end
    CreateTaskSay(tbSay)
end
function addngua(id, level)
    local nid = id
    local nlevel = level
    AddItem(0, 10, id, level, 0, 0, 0)
end
--------Ngoai Trang--------------
function ngoaitrang()
    local szTitle = "§¹i hiÖp cÇn g×?"
    local tbOpt = {"KiÓm ID ngo¹i trang/CheckFeature", "Thay ®æi ngo¹i h×nh cho vò khÝ/feature_item",
                   "Phôc håi ngo¹i h×nh gèc cho trang bÞ/restore_feature_item", "Trë l¹i/main", "Th«i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function CheckFeature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player("Helm, Armor, Weapon, Horse, Mask:")
    Msg2Player(nHelm .. ", " .. nArmor .. ", " .. nWeapon .. ", " .. nHorse .. ", " .. nMaskNPC)
end

function feature_item()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bÞ",
        "H·y ®Æt vµo 1 trang bÞ muèn thay ®æi. L­u ý ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "feature_item_confirm", "onCancel", 1);
end

function feature_item_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bÞ, kh«ng thÓ xö lÝ")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
        chose_typeweapon(nItemIndex, nGenre, nDetailType, nParticular)
    end
end
function chose_typeweapon(nItemIndex, nGenre, nDetailType, nParticular)
    local tbOpt = {"Chän lo¹i h×nh vò khÝ"}
    local list = tbNameResWeapon
    for i = 1, getn(list) do
        tinsert(tbOpt, list[i].szName ..
            format("/#chose_typeweapon_final(%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType, nParticular, i));
        -- Msg2Player(""..i)
    end
    CreateTaskSay(tbOpt);
end
function chose_typeweapon_final(nItemIndex, nGenre, nDetailType, nParticular, num, page)
    local tbOpt = {"<dec><npc>§¹i hiÖp muèn chän vò khÝ nµo ?"};
    local list = tbNameResWeapon[num].tbEquip;
    local nNum = getn(list)
    if page ~= nil then
        local nCount = nNum - page * 8
        if nCount > 8 then
            for i = page * 8 + 1, page * 8 + 8 do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            if page == 0 then
                tinsert(tbOpt,
                    format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page + 1))
            end
            if page >= 1 then
                tinsert(tbOpt,
                    format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page + 1))
                tinsert(tbOpt,
                    format("Trang tr­íc/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre, nDetailType,
                        nParticular, num, page - 1))
            end
            Msg2Player("" .. page)
            tinsert(tbOpt, "Tho¸t/no")
        end
        if nCount <= 8 then
            for i = page * 8 + 1, nNum do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, "Tho¸t/no")
        end
        -- tinsert(tbSay,format("Trang tr­íc/#chose_typeweapon_final(%d,%d)",num))
    end
    if page == nil then
        if nNum > 8 then
            for i = 1, 8 do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, format("Trang sau/#chose_typeweapon_final(%d,%d,%d,%d,%d,%d)", nItemIndex, nGenre,
                nDetailType, nParticular, num, 1))
            tinsert(tbOpt, "Tho¸t/no")
        end
        if nNum <= 8 then
            for i = 1, nNum do
                tinsert(tbOpt, list[i][1] .. format("/#setngoaitrang(%d,%d)", nItemIndex, list[i][2]));
            end
            tinsert(tbOpt, "Tho¸t/no")
        end
    end
    CreateTaskSay(tbOpt);
end
function setngoaitrang(nItemIndex, nNo)
    SetItemNewFeature(nItemIndex, nNo)
end
function restore_feature_item()
    GiveItemUI("Phôc håi ngo¹i h×nh trang bÞ", "§Æt vµo c¸c trang bÞ muèn phôc håi.",
        "restore_feature_item_confirm", "onCancel", 1);
end

function restore_feature_item_confirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        SetItemNewFeature(nItemIndex, -1)
    end
end
----------------------------------------------------Bach Kim -----------------------------------
function bachkim_main()
    local szTitle = " Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn sö dông chøc n¨ng g×?"
    local tbOpt = {}
    tinsert(tbOpt, "N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 0/make_bachkim")
    tinsert(tbOpt, "N©ng cÊp ®å Hoµng kim lªn B¹ch kim cÊp 10/make_bachkim_max")
    tinsert(tbOpt, "N©ng cÊp trang bÞ B¹ch Kim tõng cÊp/up_bachkim")
    tinsert(tbOpt, "Quay l¹i/main")
    tinsert(tbOpt, "Th«i./no")
    Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
    GiveItemUI("T¹o trang bÞ B¹ch Kim", "N©ng cÊp trang bÞ Hoµng kim thµnh B¹ch kim", "do_upgoldeq_process", 1);
end
function do_upgoldeq_process()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
    GiveItemUI("T¹o trang bÞ B¹ch Kim", "N©ng cÊp trang bÞ B¹ch kim Max (+10)", "do_upgoldeq_max", 1);
end
function do_upgoldeq_max()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
    for i = 1, 10 do
        UpgradePlatinaItem(GetGiveItemUnit(1))
    end
end

function up_bachkim()
    GiveItemUI("N©ng cÊp trang bÞ B¹ch kim", "Bá vµo trang bÞ B¹ch kim", "upgrade_bachkim_process", 1);
end

function upgrade_bachkim_process()
    UpgradePlatinaItem(GetGiveItemUnit(1))
end
------Lay Skill Theo ID--------
function LaySkillID()
    local szTitle = "Xin chµo  <color=red>" .. GetName() .. "<color>, b¹n muèn nhËn hay xãa skill nµo?"
    local tbOpt = {{"Thªm Skills", g_AskClientStringEx, {"1200,20", 0, 256, "ID Skill", {AddSkill, {self}}}},
                   {"Xãa Skills", g_AskClientStringEx, {"1200", 0, 300, "ID Skill", {DelSkill, {self}}}},
                   {"Thªm Danh S¸ch Skills", g_AskClientStringEx,
                    {"1200,1210", 0, 256, "ID Skill", {AddDSSkill, {self}}}},
                   {"Xãa Danh S¸ch Skills", g_AskClientStringEx, {"1,1500", 0, 256, "ID Skill", {DelDSSkill, {self}}}},
                   {"Trë VÒ", main}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end
function AddDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        AddMagic(i, 20)
    end
end

function DelDSSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local s = tonumber(tbPos[1])
    local e = tonumber(tbPos[2])
    for i = s, e do
        DelMagic(i)
    end
end

function AddSkill(szPos)
    local tbPos = lib:Split(szPos, ",")
    local id = tonumber(tbPos[1])
    local cap = tonumber(tbPos[2])
    AddMagic(id, cap)
end

function DelSkill(szPos)
    local idskill = tonumber(szPos)
    DelMagic(idskill)
end
------------------§æi tªn-----------------------
function doiten()
    AskClientForString("doitennv", "", 1, 100, "Xin nhËp tªn míi");
end
function doitennv(strings)
    RenameRole(strings)
end
------------------§æi giíi tÝnh-----------------------
function doigioitinh()
    local szTitle = "Ng­¬i cã ch¾c ch¾n ®æi giíi tÝnh?"
    local tbOpt = {"§ång ý/chuyengioi", "Tõ chèi./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
function chuyengioi()
    if GetSex() == 1 then
        SetSex(0)
    else
        SetSex(1)
    end
    Talk(1, "", "§· chuyÓn giíi thµnh c«ng")
    KickOutSelf()
end
-----------Hñy VËt PhÈm---------------
function DisposeItem()
    GiveItemUI("Hñy vËt phÈm",
        "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!",
        "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
    for i = 1, nCount do
        local nItemIndex = GetGiveItemUnit(i)
        local strItem = GetItemName(nItemIndex)
        RemoveItemByIndex(nItemIndex)
        -- WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
    end -- for
    Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
    Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");
end

---------------------------------------------------------------
function TaoItem(num)
    g_AskClientStringEx("222,0,1", 1, 9000, "ID, CÊp , sè l­îng:", {TaoItemID})
end
function TaoItemID(szItem)
    local szICode = lib:Split(szItem, ",");
    local n = getn(szICode);
    if (n ~= 1) then
        if (n < 3) then
            Talk(1, "", format("Sai Item Code. ThiÕu tr­êng yªu cÇu <color=yellow>%s<color>", n));
            return
        end
        if (n > 3) then
            Talk(1, "", format("Sai Item Code. Qu¸ nhiÒu tr­êng d÷ liÖu <color=yellow>%s<color>", n));
            return
        end
        local itid = tonumber(szICode[1]);
        local itlv = tonumber(szICode[2]);
        local itnum = tonumber(szICode[3]);
        if (itlv < 0) then
            Talk(1, "", format("CÊp ®é man ®å kh«ng ®­îc thÊp qu¸ <color=yellow>%s<color>", itlv));
            return
        end
        if (itlv > 10) then
            Talk(1, "", format("ChØ hæ trî ®Õn cÊp 10. HiÖn t¹i nhËp vµo <color=yellow>%s<color>", itlv));
            return
        end
        if (itmagic == nil) then
            itmagic = 0;
        end
        for i = 1, itnum do
            AddItem(6, 1, itid, itlv, 0, 0, 0);
        end
    end
end

function reloadngay()
    local nlink = tbLinkFileLua[1].szFileLua
    for i = 1, getn(nlink) do
        local ReloadScript = LoadScript("" .. nlink[i][1] .. "");
        if (FALSE(ReloadScript)) then
            Msg2Player("XuÊt hiÖn lçi, kh«ng thÓ Reload!<enter><color=yellow>" .. nlink[i][1] .. "");
        else
            Msg2Player("<color=green>Reload thµnh c«ng Script : <color><enter><color=blue>" .. nlink[i][1] .. "");
        end
    end
end
function NhapDuongDan(Link)
    local ReloadScript = LoadScript(Link);
    if (FALSE(ReloadScript)) then
        Msg2Player("XuÊt hiÖn lçi, kh«ng thÓ Reload!<enter><color=yellow>" .. Link .. "");
    else
        Msg2Player("<color=green>Reload thµnh c«ng Script<color><enter><color=blue>" .. Link .. "");
    end
end
function ReLoadScript()
    return AskClientForString("NhapDuongDan", "", 1, 500, "<#>NhËp ®­êng dÉn")
end
function change_mauchu()
    local aryDescribe = {"<dec><npc>§¹i hiÖp muèn ®æi tr¹ng th¸i nµo ?"};
    for i = 1, getn(tbMauChu) do
        tinsert(aryDescribe, tbMauChu[i][1] .. format("/#set_mauchu(%d)", tbMauChu[i][2]));
    end
    tinsert(aryDescribe, "L¸t n÷a quay l¹i /no");
    CreateTaskSay(aryDescribe);
end

function set_mauchu(num)
    SetCurCamp(num)
    SetCamp(num)
end

---------- Reset point------------------
function chose_reset_type()
    local nW, nX, nY = GetWorldPos()
    local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount(), nW, nX, nY, szIP)}
    tinsert(tbSay, "TÈy tiÒm n¨ng/DoClearPropCore")
    tinsert(tbSay, "TÈy kü n¨ng/DoClearSkillCore")
    tinsert(tbSay, "Céng §iÓm Nhanh/add_prop");
    tinsert(tbSay, "Quay l¹i/main");
    CreateTaskSay(tbSay)
end
