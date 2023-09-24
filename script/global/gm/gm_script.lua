IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
Include("\\script\\lib\\common.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\gm_tool\\dispose_item.lua");

Include("\\script\\global\\gm\\gm_lib.lua");
Include("\\script\\global\\gm\\gm_help.lua");

--Include("\\script\\global\\general\\thunghiem\\main.lua")

tbAloneScript = {};
function main()
	dofile("script/global/gm/gm_script.lua")
	tbAloneScript:DialogMain()
	return 1;
end
function tbAloneScript:main()
	dofile("script/global/gm/gm_script.lua")
	tbAloneScript:DialogMain()
	return 1;
end
 --Tr­íc khi sö dông ®­îc chøc n¨ng GM, ng­êi ch¬i ph¶i nhËp mËt khÈu
function tbAloneScript:GMPassword()
	local nResult, nIdx = self:CheckGameMaster()
	if (nResult == 0) then
		Talk(1, "", "B¹n kh«ng ph¶i lµ <color=red>GM<color>, kh«ng thÓ sö dông vËt phÈm nµy");
	return 0 end
	if (GetLevel() < 0) then
		Talk(1, "", "§Ó sö dông ®­îc toµn bé chøc n¨ng bªn trong, vui lßng n©ng lªn <color=red>cÊp 200<color> råi h·y sö dông ®Õn nã");
	return 0 end

	local szName = GetName();
	local szAccount = GetAccount();
	local nIsLogin = GetTaskTemp(TASKTEMP_LOGIN_LBGM);
	if (nIsLogin == 1) then
		self:DialogMain();
	return 1 end
	
	g_AskClientStringEx("", 1, 50, "NhËp mËt khÈu:", {self.EnterGMPassword, {self, nIdx, szAccount, szName}})
end

function tbAloneScript:EnterGMPassword(nIdx, szAccount, szName, szPassword)
	if (TAB_LIST_GAMEMASTER[nIdx]["Password"] ~= szPassword) then
		Talk(1, "", "MËt khÈu kh«ng ®óng, vui lßng kiÓm tra l¹i!");
	return 0 end
	self:DialogMain();
	SetTaskTemp(TASKTEMP_LOGIN_LBGM, 1)
	Msg2Player("B¹n ®· nhËp mËt khÈu ®óng, ®¨ng nhËp thµnh c«ng! B©y giê cã thÓ sö dông ®­îc chøc n¨ng dµnh cho GM.")
end

function tbAloneScript:DialogMain()
	dofile("\\script\\global\\gm\\gm_script.lua")
	local szTitle = format("Chµo mõng <color=red>GM<color> tham gia m¸y chñ <color=green>PYTA Gaming<color>! §©y lµ lÖnh bµi hç trî dµnh cho GM ®Ó qu¶n lý, ®iÒu hµnh m¸y chñ cña m×nh.");
	local tbOption = {};
		tinsert(tbOption, {"Qu¶n lý toµn bé M¸y Chñ", self.ManagePlayerSystem, {self}})
	if (GetSkillState(733) == -1) then
		tinsert(tbOption, {"BËt tÝnh n¨ng Tµng H×nh", self.GMHide, {self}})
	else
		tinsert(tbOption, {"T¾t tÝnh n¨ng Tµng H×nh", self.GMShow, {self}})
	end
	if (IsOwnFeatureChanged() == 0) then
		tinsert(tbOption, {"BiÕn thµnh h×nh d¸ng GM", self.ChangeMask, {self}})
	else
		tinsert(tbOption, {"Trë l¹i h×nh d¸ng ban ®Çu", self.RestoreMask, {self}})
	end
	if (Title_GetActiveTitle() ~= 191) then
		tinsert(tbOption, {"BËt huy hiÖu GM", self.HaloGM, {self}})
	else
		tinsert(tbOption, {"T¾t huy hiÖu GM", self.HaloGM, {self}})
	end
                tinsert(tbOption, {"DÞch ChuyÓn Tøc Thêi", self.MoveToPosition, {self}})
		--tinsert(tbOption, {"LÊy VËt PhÈm", self.TakeSpecifiedItem, {self}})
		--tinsert(tbOption, {"Thªm - Xãa Skill", self.SkillsSystem, {self}})
		--tinsert(tbOption, {"TÝnh n¨ng hç trî kh¸c", self.SupportFeatureOther, {self}})
		tinsert(tbOption, {"T×m hiÓu vÒ tÝnh n¨ng qu¶n trÞ", self.GMHelp, {self}})
		-- tinsert(tbOption, {"Logs", self.Write, {self}})
		-- tinsert(tbOption, {"Load", self.Loadds, {self}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle, tbOption)	
	--CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

-- function tbAloneScript:Loadds()
	-- LoadScript("\\script\\global\\gm\\gm_script.lua")
-- end

function tbAloneScript:ManagePlayerSystem()
	local szTitle = format("Mêi GM <color=red>%s<color> lùa chän chøc n¨ng hç trî qu¶n trÞ:", GetName());
	local tbOption = {}
		tinsert(tbOption, {"Chøc n¨ng Th«ng B¸o", self.NotificationManage, {self}})
		tinsert(tbOption, {"Qu¶n lý Nh©n VËt", self.ManageSystemGlobal, {self}})
		tinsert(tbOption, {"Thao t¸c Ng­êi Ch¬i", self.ManipulationOnPlayer, {self}})
		--tinsert(tbOption, {"DÞch ChuyÓn Tøc Thêi", self.MoveToPosition, {self}})
		--tinsert(tbOption, {"LÊy VËt PhÈm", self.TakeSpecifiedItem, {self}})
		--tinsert(tbOption, {"Thªm - Xãa Skill", self.SkillsSystem, {self}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																						DÞch chuyÓn ®Õn vÞ trÝ																				--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbAloneScript:MoveToPosition()
	g_AskClientStringEx(GetStringTask(TASK_S_POSITION), 0, 256, "Map,PosX,PosY:", {self.EnterPosition, {self}})
end

function tbAloneScript:EnterPosition(szPos)
	local tbPos = split(szPos, ",")
	local nMap = tonumber(tbPos[1])
	local nPosX = tonumber(tbPos[2])
	local nPosY = tonumber(tbPos[3])
	local nMove;
	if nPosX < 1000 and nPosY < 1000 then
		nPosX = nPosX*8
		nPosY = nPosY*16
	end
	
	nMove = NewWorld(nMap,nPosX, nPosY)
	AddSkillState(963, 1, 0, 18*3)
	
	if nMove ~= 1 then
		GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ","ThÊt b¹i! VÞ trÝ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.")
		return
	end
	
	SetStringTask(TASK_S_POSITION, szPos)
	GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ","<color=yellow>Thµnh c«ng!")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	HÖ thèng lÊy kü n¨ng																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:SkillsSystem()
	local szTitle = "HÖ thèng kü n¨ng bao gåm Thªm kü n¨ng vµ Xãa kü n¨ng, b¹n muèn sö dông hÖ thèng kü n¨ng nµo?"
	local tbOpt = {}
		tinsert(tbOpt, {"Thªm Kü n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.AddSkills, {self}}}})
		tinsert(tbOpt, {"Xãa Kü n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.DeleteSkills, {self}}}})
		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAloneScript:AddSkills(szSkills)
	local _,_, nStart, nEnd, _, nPoint = self:GetSplitSkills(szSkills)
	for i = nStart, nEnd do
		AddMagic(i, nPoint)
		GMMsg2Player("Thªm Kü n¨ng", "Kü n¨ng “"..GetSkillName(i).."” ®¼ng cÊp "..nPoint.."!")
	end
end

function tbAloneScript:DeleteSkills(szSkills)
	local tbSkills, nCount, nStart, _, nEnd, _ = self:GetSplitSkills(szSkills)
	if nCount > 2 then
		GMMsg2Player("Xãa Kü n¨ng", "NhËp th«ng sè bÞ lçi, chØ cã thÓ nhËp tèi ®a 2 th«ng sè trë xuèng.")
		return 0
	end
	for i = nStart, nEnd do
		DelMagic(i)
		GMMsg2Player("Xãa Kü n¨ng", "Kü n¨ng “"..GetSkillName(i).."” ®· ®­îc xãa bá!")
	end
end

function tbAloneScript:GetSplitSkills(szString)
	local nStartSkill, nEndSkill, nEndSkill2, nPointSkill;
	local tbString = split(szString, ",")
	local nType = self:IsParamNumber(tbString)
	if nType ~= 1 then
		GMMsg2Player("Thªm Kü n¨ng", "NhËp th«ng sè bÞ lçi, chØ sö dông c¸c ký tù sè tõ 0-9 vµ dÊu phÈy “,”.")
		return 0
	end
	
	if (getn(tbString) == 1) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[1];
		nEndSkill2 = tbString[1];
		nPointSkill = 0;
	elseif (getn(tbString) == 2) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[1];
		nEndSkill2 = tbString[2];
		nPointSkill = tbString[2];
	elseif (getn(tbString) == 3) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[2];
		nPointSkill = tbString[3];
	end

	return tbString, getn(tbString), nStartSkill, nEndSkill, nEndSkill2, nPointSkill;
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	LÊy vËt phÈm chØ ®Þnh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:TakeSpecifiedItem()
	g_AskClientStringEx(GetStringTask(TASKS_GETITEM), 0, 256, "Th«ng sè item:", {self.TakeSpecifiedItemParam, {self}})
end

function tbAloneScript:TakeSpecifiedItemParam(szParam)
	if not szParam then
		Talk(1, "", "GM ch­a nhËp th«ng sè cña mét item bÊt kú, vui lßng thö l¹i.")
		return 0
	end
	
	local nType, tbParam = self:GetTypeParam(szParam)
	if (nType == 0) then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! Tèi ®a cho phÐp lµ 16 th«ng sè.")
		return 0
	end
	local nIsParam = self:IsParamNumber(tbParam[2])
	if nIsParam ~= 1 then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! ChØ sö dông c¸c ký tù sè tõ 0-9 vµ dÊu phÈy “,”.")
		return 0
	end
	
	self:SetCountSpecifiedItem(nType, tbParam)
end

function tbAloneScript:SetCountSpecifiedItem(nType, tbParam)
	local tbOptionSelected = {}
	g_AskClientNumberEx(1, 500, "NhËp sè l­îng:", {self.CountSpecifiedItem, {self, {nType, tbParam, tbOptionSelected}}})
end

function tbAloneScript:CountSpecifiedItem(tbSpecifiedItem, nCount, nOptionSelected)
	local szTitle = "H·y thiÕt lËp thªm option nÕu muèn.\n\n* Option GM ®· chän:"
	local nIsTable = self:IsOption(tbSpecifiedItem[3], "table")
	if nIsTable then
		for x, y in tbSpecifiedItem[3] do
			szTitle = szTitle..format("\n"..strfill_right("+", 5, " ").." <color=green>%s<color>",y[1])
		end
	end
	
	local tbOpt = {}
		local nBind = self:GetTypeOption(tbSpecifiedItem[3], 1)
		if nBind ~= 1 then
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm vÜnh viÔn", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 1}})
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 2}})
		end
		
		local nExpired = self:GetTypeOption(tbSpecifiedItem[3], 2)
		if nExpired ~= 2 then
			tinsert(tbOpt, {"+ Thªm option thêi h¹n sö dông", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 3}})
		end
		
		tinsert(tbOpt, {"§· xong, ta muèn lÊy ngay b©y giê", self.CreateItemSpecified, {self, tbSpecifiedItem, nCount}})
		tinsert(tbOpt, {"Chän l¹i option", self.ReselectOption, {self, tbSpecifiedItem, nCount}})

		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAloneScript:CreateItemSpecified(tbSpecifiedItem, nCount)
	local GMPlayer = PlayerIndex;
	local szPlayerName = "";
	local szGMName = "";
	if nPlayerIndex then
		PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
	end
	
	local nItemIndex = 0;
	local szItemName = "";
	local tbItem = self:GetParamItem(tbSpecifiedItem)
		for i = 1, nCount do
			nItemIndex = self:NewItemEx(tbItem)
			
			if (nItemIndex <= 0) then
				break
			end
				
			szItemName = GetItemName(nItemIndex)
			
			if (IsItemStackable(nItemIndex) == 1) then
				SetItemStackCount(nItemIndex, 1)
			end
			
			for x, y in tbSpecifiedItem[3] do
				if y[3] == 1 then
					SetItemBindState(nItemIndex, y[2])
				end
				if y[3] == 2 then
					ITEM_SetExpiredTime(nItemIndex,y[2]*24*60)
				end
			end
			
			AddItemByIndex(nItemIndex)
		end
	
	SetStringTask(TASKS_GETITEM, tbSpecifiedItem[2][1])

	if nPlayerIndex then
		PlayerIndex = GMPlayer;
			szGMName = GetName()
			Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i <color=yellow>%s<color> nµy %d %s", szPlayerName, nCount, szItemName))
		PlayerIndex = nPlayerIndex;
			Msg2Player(format("B¹n ®· ®­îc GM <color=yellow>%s<color> tÆng %d %s", szGMName, nCount, szItemName))
		nPlayerIndex = nil;
	else
		Msg2Player(format("B¹n nhËn ®­îc %d %s", nCount, szItemName))
	end
end

function tbAloneScript:GetParamItem(tbSpecifiedItem)
	local nType = tbSpecifiedItem[1]
	local tbParam = tbSpecifiedItem[2][2]
	local nVersion, nQuality;
	local nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic;
	local MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6;
	
	if (nType == 1) then
		if (getn(tbParam) == 1) then
			nQuality, nDetailType = 1, (tbParam[1] -1)
		elseif (getn(tbParam) == 2) then
			nQuality, nDetailType = tbParam[1], (tbParam[2] -1);
		end
	elseif (nType == 2) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
	elseif (nType == 3) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
		MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6 = tbParam[7],tbParam[8],tbParam[9],tbParam[10],tbParam[11],tbParam[12];
	end
	
	return {
		nVersion or 4,
		nQuality or 2,
		nGenre or 0,
		nDetailType or 0,
		nParcular or 0,
		nLevel or 0,
		nSeries or 0,
		nMagic or 0,
		MagicIndex1 or 0,
		MagicIndex2 or 0,
		MagicIndex3 or 0,
		MagicIndex4 or 0,
		MagicIndex5 or 0,
		MagicIndex6 or 0
	}
end

function tbAloneScript:NewItemEx(tbItem)
	return NewItemEx(
		tbItem[1],
		0,
		tbItem[2],
		tbItem[3],
		tbItem[4],
		tbItem[5],
		tbItem[6],
		tbItem[7],
		tbItem[8],
		tbItem[9],
		tbItem[10],
		tbItem[11],
		tbItem[12],
		tbItem[13],
		tbItem[14],
		0)
end

function tbAloneScript:ReselectOption(tbSpecifiedItem, nCount)
	tbSpecifiedItem[3] = {}
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbAloneScript:GetTypeOption(tbOption, nType)
	for x, y in tbOption do
		if tbOption[x][3] == nType then
			return nType
		end
	end
	return 0
end

function tbAloneScript:AddOptionInItem(tbSpecifiedItem, nCount, nOptionSelected)
	local tbListOption =
	{
		[1] = {"Khãa b¶o hiÓm vÜnh viÔn", 1},
		[2] = {"Khãa b¶o hiÓm", 1},
		[3] = {"Thêi h¹n sö dông", 2},
	};
	
	if (nOptionSelected == 1) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -2, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 2) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -1, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 3) then
		self:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption[nOptionSelected]);
	end
end

function tbAloneScript:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption)
	g_AskClientNumberEx(1,999999, "Thêi h¹n sö dông:", {self.SetTimeOptionInItem, {self, tbSpecifiedItem, nCount, nOptionSelected, tbListOption}})
end

function tbAloneScript:SetTimeOptionInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption, nTimer)
	tbSpecifiedItem[3][nOptionSelected] = {tbListOption[1], nTimer, tbListOption[2]};
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbAloneScript:IsOption(tbOpt, nType)
	if (type(tbOpt) == nType) then
		return 1
	else
		return
	end
end

function tbAloneScript:GetTypeParam(szParam)
	local nTypeParam = 0;
	local nMaxParam = 16;
	local tbParam = split(szParam)
	if (getn(tbParam) < 3) then
		nTypeParam = 1;
	elseif (getn(tbParam) == 6) then
		nTypeParam = 2;
	elseif (getn(tbParam) > 6) and (getn(tbParam) < 13) then
		nTypeParam = 3;
	-- elseif (getn(tbParam) >= 13) and (getn(tbParam) =< nMaxParam) then
		-- nTypeParam = 4;
	end
	return nTypeParam, {szParam, tbParam};
end

function tbAloneScript:IsParamNumber(tbParam)
	for i = 1, getn(tbParam) do
		local IsNumber = tonumber(tbParam[i])
		if not IsNumber then
			return 0;
		end
	end
	return 1;
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																TÝnh n¨ng giµnh cho GM																									--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:GMHide()
	AddSkillState(733,1,0,777600);
	Msg2Player("BËt chøc n¨ng Tµng H×nh cho GM");
end

function tbAloneScript:GMShow()
	AddSkillState(733,1,0,18*1);
	Msg2Player("T¾t chøc n¨ng Tµng H×nh cho GM");
end

function tbAloneScript:ChangeMask()
	ChangeOwnFeature(0,0,567);
	Msg2Player("BiÕn thµnh h×nh d¸ng GM");
end

function tbAloneScript:RestoreMask()
	RestoreOwnFeature();
	Msg2Player("Trë l¹i h×nh d¸ng ban ®Çu");
end

function tbAloneScript:HaloGM()
		if (Title_GetActiveTitle() ~= 191) then
			SetTask(1122, 191)
			Title_AddTitle(191, 1, 30*24*60*60*18);
			Title_ActiveTitle(191);
		else
			Title_RemoveTitle(191)
		end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																				VËt phÈm hç trî																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:SupportFeatureOther()
	local szTitle = format("Chµo mõng <color=red>GM<color> tham gia m¸y chñ <color=green>PYTA Gaming<color>! §©y lµ lÖnh bµi hç trî dµnh cho GM ®Ó qu¶n lý, ®iÒu hµnh m¸y chñ cña m×nh.");
	local tbOption = {};
		tinsert(tbOption, {"Thay ®æi tr¹ng th¸i (Mµu PK)", self.GMChangeCamp, {self}})
		tinsert(tbOption, {"Hñy bá vËt phÈm", DisposeItem})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:GMChangeCamp()
	local szTitle = "GM muèn ®æi sang mµu tr¹ng th¸i nµo d­íi ®©y?";
	local tbOption = {};
		tinsert(tbOption, {"LuyÖn c«ng (Tr¾ng)", self.GMChangeCampOK, {self, 0}})
		tinsert(tbOption, {"ChÝnh ph¸i (Vµng)", self.GMChangeCampOK, {self, 1}})
		tinsert(tbOption, {"Tµ ph¸i (TÝm)", self.GMChangeCampOK, {self, 2}})
		tinsert(tbOption, {"Trung lËp (Xanh)", self.GMChangeCampOK, {self, 3}})
		tinsert(tbOption, {"S¸t thñ (§á)", self.GMChangeCampOK, {self, 4}})
		tinsert(tbOption, {"GM (Hång)", self.GMChangeCampOK, {self, 5}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle, tbOption)
end

function tbAloneScript:GMChangeCampOK(nCamp)
	if not (TAB_LISTCAMP[nCamp]) then
		print("Thieu du lieu nCamp trong table TAB_LISTCAMP!")
	return 0 end
	SetCamp(nCamp)
	SetCurCamp(nCamp)
	Msg2Player(TAB_LISTCAMP[nCamp])
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																Ta muèn th«ng b¸o ®Õn ng­êi ch¬i															--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbAloneScript:NotificationManage()
	local szTitle = "HiÖn t¹i cã 2 chøc n¨ng th«ng b¸o chÝnh, ®ã lµ:\n+ <color=red>TÇn sè thÕ giíi<color>: Kªnh nµy th«ng b¸o trªn khung ch¸t t¸n gÉu trong giao diÖn ng­êi ch¬i.\n+ <color=red>TÇn sè m¸y chñ<color>: Kªnh nµy th«ng b¸o ®Õn ng­êi ch¬i trong toµn m¸y chñ, néi dông ch¹y ch÷ ë phÝa trªn ®Çu nh©n vËt."
	local tbOption = {}
		tinsert(tbOption, {"Th«ng b¸o trªn TÇn sè ThÕ Giíi", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.EnterNotification, {self, 1}}}})
		tinsert(tbOption, {"Th«ng b¸o trªn TÇn sè M¸y Chñ", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.EnterNotification, {self, 2}}}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:EnterNotification(nType, szNotices)
	if szNotices == nil or szNotices == "" then
	return 0 end

	if (nType == 1) then
		Msg2SubWorld("<color=yellow><bclr=red>GM "..GetName().."<bclr> nãi:<color> <color=cyan>"..szNotices)
	elseif (nType == 2) then
		AddGlobalCountNews("<color=yellow><bclr=red>GM "..GetName().."<bclr> th«ng b¸o: <color>"..szNotices, 3)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															HÖ thèng qu¶n lý toµn m¸y chñ																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbAloneScript:ManageSystemGlobal()
	local szTitle = "HÖ thèng qu¶n lý toµn m¸y chñ ®­îc sö dông ®Ó khãa, cÊm ch¸t, kick out,… ng­êi ch¬i trong m¸y chñ."
	local tbOption = {}
		tinsert(tbOption, {"Khãa nh©n vËt ®ang trùc tuyÕn", self.LockPlayerOnline, {self, 1}})
		tinsert(tbOption, {"Më khãa nh©n vËt", self.UnlockPlayer, {self, 1}})
		tinsert(tbOption, {"Khãa tµi kho¶n ®ang trùc tuyÕn", self. LockPlayerOnline, {self, 2}})
		tinsert(tbOption, {"Më khãa tµi kho¶n", self. UnlockPlayer, {self, 2}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:UnlockPlayer(nType)
	g_AskClientStringEx("", 1, 50, "Tªn më khãa:", {self.EnterUnlockPlayer, {self, nType}})
end

function tbAloneScript:EnterUnlockPlayer(nType, szPlayer)
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local nCount = self:FileSystem_GetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer)
	if (tonumber(nCount) ~= 1) then
		Msg2Player(szPlayer.." kh«ng bÞ khãa")
	return end
	self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer, "");
	self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
	Msg2Player(format("B¹n ®· më khãa cho <color=yellow>%s<color> nµy thµnh c«ng!", szPlayer));
end

function tbAloneScript:LockPlayerOnline(nType)
	g_AskClientStringEx("", 1, 50, "Tªn muèn khãa:", {self.EnterLockPlayerOnline, {self, nType}})
end

function tbAloneScript:EnterLockPlayerOnline(nType, szPlayer)
	local nGMPlayer = PlayerIndex
	local nPlayerIndex = 0;
	local szAccount = "";
	if (nType == 1) then
		nPlayerIndex = SearchPlayer(szPlayer)
	elseif (nType == 2) then
		nPlayerIndex= self:SearchAccount(szPlayer)
	end
	
	if (nPlayerIndex <= 0) then
		Msg2Player("Ng­êi nµy hiÖn kh«ng online hoÆc kh«ng tån t¹i");
	return 0 end
	
	PlayerIndex = nGMPlayer;
	if (nType == 1) then
		self:LockSystemByNamePlayer(nPlayerIndex);
	elseif (nType == 2) then
		self:LockSystemByAccountPlayer(nPlayerIndex);
	end
end

function tbAloneScript:LockSystemByNamePlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "Lý do bÞ khãa:", {self.EnterLockSystemByNamePlayer, {self, nPlayerIndex}})
end

function tbAloneScript:EnterLockSystemByNamePlayer(nPlayerIndex, szMsg)
	local nType = 1;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetName();
			Msg2Player(format("<color=yellow>Nh©n vËt nµy ®· bÞ khãa, v× lÝ do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		PlayerIndex = nGMPlayer;
			Msg2Player("B¹n ®· khãa ng­êi ch¬i nµy thµnh c«ng!")
			SetStringTask(TASKS_LOCKSYSTEM, szPlayerName);
end

function tbAloneScript:LockSystemByAccountPlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "Lý do bÞ khãa:", {self.EnterLockSystemByAccountPlayer, {self, nPlayerIndex}})
end

function tbAloneScript:EnterLockSystemByAccountPlayer(nPlayerIndex, szMsg)
	local nType = 2;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetAccount();
			Msg2Player(format("<color=yellow>Nh©n vËt nµy ®· bÞ khãa, v× lÝ do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		PlayerIndex = nGMPlayer;
			Msg2Player("B¹n ®· khãa ng­êi ch¬i nµy thµnh c«ng!")
			SetStringTask(TASKS_LOCKSYSTEM, szPlayerName);
end

function tbAloneScript:SearchAccount(szAccount)
	for i = 1, GetPlayerCount() do
		PlayerIndex = i;
			if (GetAccount() == szAccount) then
			return i end;
	end
return 0 end

function tbAloneScript:GameServerKickOut(nPlayerIndex)
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[1][1])
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[2][1])
	local GMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
	
	local nIsPlayer = tonumber(self:FileSystem_GetData(TAB_LINKFILEDATA[1][1], TAB_LINKFILEDATA[1][2], GetName())) or 0;
		
		if (nIsPlayer == 1) then
			Msg2Player("Nh©n vËt nµy cña b¹n hiÖn ®ang bÞ khãa, kh«ng thÓ tham gia vµo game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
		
		local nIsAccount = tonumber(self:FileSystem_GetData(TAB_LINKFILEDATA[2][1], TAB_LINKFILEDATA[2][2], GetAccount())) or 0;
		
		if (nIsAccount == 1) then
			Msg2Player("Tµi kho¶n nµy cña b¹n hiÖn ®ang bÞ khãa, kh«ng thÓ tham gia vµo game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															T×m hiÓu vÒ tÝnh n¨ng LBGM																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:GMHelp()
	Describe("GM muèn t×m hiÓu vÒ tÝnh n¨ng qu¶n trÞ nµo d­íi ®©y?", 8,
	"T×m hiÓu vÒ tÝnh n¨ng “LÊy vËt phÈm bÊt kú”/TakeSpecifiedItem",
	"T×m hiÓu vÒ tÝnh n¨ng “DÞch chuyÓn ®Õn vÞ trÝ…”/MoveToPosition",
	"§ãng./OnCancel")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--														Thao t¸c víi ng­êi ch¬i ®ang online																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:ManipulationOnPlayer()
	if (GetLevel() < 10) then
		Talk(1, "", "Nh©n vËt ®¹t cÊp 10 trë lªn míi cã thÓ sö dông tÝnh n¨ng nµy")
	return end
	
	g_AskClientStringEx("", 0, 200, "Tªn nh©n vËt:", {self.SearchPlayerOnline, {self}})
end

function tbAloneScript:SearchPlayerOnline(szPlayer)
	local GMPlayer = PlayerIndex;
	local szName, szAccount, szIP;
	local nLevel, nCash;
	nPlayerIndex = SearchPlayer(szPlayer)
	if nPlayerIndex <= 0 then
		Talk(1, "", "Nh©n vËt nµy ®· rêi m¹ng hoÆc kh«ng tån t¹i!")
		return
	end
	
	local szFactionName = {
		["shaolin"] 		= "ThiÕu L©m",
		["tianwang"] 	= "Thiªn V­¬ng bang",
		["tangmen"] 	= "§­êng M«n",
		["wudu"] 			= "Ngò §éc gi¸o",
		["emei"] 			= "Nga My",
		["cuiyan"] 		= "Thóy Yªn m«n",
		["gaibang"] 		= "C¸i Bang",
		["tianren"] 		= "Thiªn NhÉn gi¸o",
		["wudang"] 		= "Vâ §ang",
		["kunlun"] 		= "C«n L«n",
		["huashan"] 	= "Hoa S¬n",
	}
	
	PlayerIndex = nPlayerIndex;
		szName = GetName();
		szAccount = GetAccount();
		szFaction = GetFaction();
		nLevel = GetLevel();
		nCash = GetCash();
		szIP = self:GetIP();
		nRepute = GetRepute();
		nWorld, nPosX, nPosY = GetWorldPos();
		nLead = GetLeadLevel();
		nFight = GetFightState();
		nCamp = GetCamp();
		nFaction = GetLastFactionNumber();
		nPK = GetPK();
		nSex = GetSex();
		nFuYuan = GetTask(151);
		nBattle = GetTask(747);
		nLeague = GetTask(2501);
		nRespect = GetRespect();
		nCoin = GetExtPoint(1);
		
		nLife = GetLife(0);
		nMana = GetMana(0);
		nStamina = GetStamina(0);
		nDefend = GetDefend(0);
		nColdR = GetColdR(0);
		nLightR = GetLightR(0);
		nFireR = GetFireR(0);
		nPoisonR = GetPoisonR(0);
		nPhyR = GetPhyR(0);
		nLucky = GetLucky();
		
		nEng =  GetEng(0);
		nDex = GetDex(0);
		nStr = GetStrg(0);
		nVit = GetVit(0);
		nAP = GetRestAP();
		nSP = GetRestSP();
	PlayerIndex = GMPlayer;
		Describe(format(strfill_center(" Th«ng tin ng­êi ch¬i ", 50, "-").."\n"
		.."\n+ Tªn ng­êi ch¬i: %s"
		.."\n+ Tªn tµi kho¶n: %s"
		.."\n+ §Þa chØ IP: %s"
		.."\n+ VÞ trÝ hiÖn t¹i: B¶n ®å: %d - Täa ®é: %d,%d"
		.."\n+ M«n ph¸i: %s"
		.."\n+ §¼ng cÊp: %d"
		.."\n+ TiÒn v¹n: %d"
		.."\n+ TiÒn ®ång: %d"

		.."\n+ §iÓm danh väng: %d"
		.."\n+ §iÓm phóc duyªn: %d"
		.."\n+ §iÓm uy danh: %d"
		.."\n+ §iÓm tÝch lòy Tèng Kim: %d"
		.."\n+ §iÓm tÝch lòy Liªn §Êu: %d"
		
		.."\n------------------------------------------------"		
		.."\n+ Sinh lùc: %d"
		.."\n+ Néi lùc: %d"
		.."\n+ ThÓ lùc: %d"
		.."\n+ NÐ tr¸nh: %d"
		
		.."\n+ Kh¸ng b¨ng: %d"
		.."\n+ Kh¸ng l«i: %d"
		.."\n+ Kh¸ng háa: %d"
		.."\n+ Kh¸ng ®éc: %d"
		.."\n+ Phßng thñ vËt lý: %d"
		
		.."\n+ Søc m¹nh: %d"
		.."\n+ Sinh khÝ: %d"
		.."\n+ Th©n ph¸p: %d"
		.."\n+ Néi c«ng: %d"
		.."\n+ TiÒm n¨ng cßn l¹i: %d"
		.."\n+ Kü n¨ng cßn l¹i: %d"
		.."\n------------------------------------------------"
		
		, szName or ""
		, szAccount or ""
		, szIP or ""
		, nWorld or 0, nPosX or 0, nPosY or 0
		, szFactionName[szFaction] or "Ch­a gia nhËp"
		, nLevel or 0
		, nCash or 0
		, nCoin or 0
		
		, nRepute or 0
		, nFuYuan or 0
		, nRespect or 0
		, nBattle or 0
		, nLeague or 0
		-------------------------------------------------
		, nLife or 0
		, nMana or 0
		, nStamina or 0
		, nDefend or 0
		
		, nColdR or 0
		, nLightR or 0
		, nFireR or 0
		, nPoisonR or 0
		, nPhyR or 0
		, nStr or 0
		, nVit or 0
		, nDex or 0
		, nEng or 0
		, nAP or 0
		, nSP or 0
		-------------------------------------------------
		)
		,8,
		"GM di chuyÓn ®Õn ng­êi ch¬i nµy/#tbAloneScript:GMMoveToPlayer("..nPlayerIndex..")",
		"Ng­êi ch¬i nµy di chuyÓn ®Õn GM/#tbAloneScript:PlayerMoveToGM("..nPlayerIndex..")",
		"TÆng ®iÓm cho ng­êi ch¬i nµy/#tbAloneScript:GivePoints("..nPlayerIndex..")",
		"TÆng vËt phÈm, ®¹o cô, trang bÞ cho ng­êi ch¬i nµy/#tbAloneScript:GiveItemForPlayer("..nPlayerIndex..")",
		"TÆng tiÒn v¹n (v¹n l­îng) cho ng­êi ch¬i ngµy/#tbAloneScript:GiveCash("..nPlayerIndex..")",
		"TÆng tiÒn ®ång cho ng­êi ch¬i ngµy/#tbAloneScript:GiveCoin("..nPlayerIndex..")",
		"TÆng KNB cho ng­êi ch¬i ngµy/#tbAloneScript:GiveKNB("..nPlayerIndex..")",
		"§ãng./OnCancel")
end


function tbAloneScript:GivePoints(nPlayerIndex)
	local szTitle = "GM muèn tÆng ®iÓm g× cho ng­êi ch¬i nµy?";
	local tbOpt = {}
		tinsert(tbOpt, {"CÊp ®é", g_AskClientNumberEx, {0,200, "NhËp cÊp ®é:", {self.SetLevelPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Kinh nghiÖm", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetExpPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Danh väng", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetReputePlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Phóc duyªn", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetFuYuanPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Tèng Kim", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetBattlePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Liªn ®Êu", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetLeaguePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAloneScript:SetLevelPlayer(nPlayerIndex, nLevel)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		ST_LevelUp(nLevel-GetLevel());
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> cÊp ®é bëi GM %s", nLevel, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> cÊp ®é", szPlayerName, nLevel))
end

function tbAloneScript:SetExpPlayer(nPlayerIndex, nExp)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		tl_addPlayerExp(nExp);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm kinh nghiÖm bëi GM %s", nExp, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm kinh nghiÖm", szPlayerName, nExp))
end

function tbAloneScript:SetReputePlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddRepute(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> danh väng bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> danh väng", szPlayerName, nPoint))
end

function tbAloneScript:SetFuYuanPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(151, GetTask(151)+nPoint)
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> phóc duyªn bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> phóc duyªn", szPlayerName, nPoint))
end

function tbAloneScript:SetBattlePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(747, GetTask(747)+nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Tèng Kim bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Tèng Kim", szPlayerName, nPoint))
end

function tbAloneScript:SetLeaguePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(2501, GetTask(2501)+nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Liªn §Êu bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Liªn §Êu", szPlayerName, nPoint))
end

function tbAloneScript:GiveCash(nPlayerIndex)
	g_AskClientNumberEx(1, 20000, "NhËp sè l­îng:", {self.GiveCashNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveCashNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		szPlayer = GetName();
		Earn(nCount*10000)
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> v¹n l­îng tõ GM %s<color>", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> v¹n l­îng<color>", szPlayer, nCount))
end

function tbAloneScript:GiveCoin(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "NhËp sè l­îng:", {self.GiveCoinNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveCoinNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,417,1,0,0,0)
		end
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> TiÒn §ång tõ GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> TiÒn §ång.", szPlayer, nCount))
end

function tbAloneScript:GiveKNB(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "NhËp sè l­îng:", {self.GiveKNBNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveKNBNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,343,1,0,0,0)
		end
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> KNB tõ GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> KNB.", szPlayer, nCount))
end

function tbAloneScript:GiveItemForPlayer(nPlayerIndex)
	local GMPlayer = PlayerIndex;
		PlayerIndex = GMPlayer;
			self:TakeSpecifiedItem()
		PlayerIndex = nPlayerIndex;
end

function tbAloneScript:GMMoveToPlayer(nPlayerIndex)
	local nWorld, nX, nY;
	local szName = "";
	local GMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			nWorld, nX, nY = GetWorldPos();
			szName = GetName();
		PlayerIndex = GMPlayer;
			local nWorldIdx = NewWorld(nWorld, nX, nY);
			if nWorldIdx ~= 1 then
				GMMsg2Player(szName, "DÞch chuyÓn ®Õn ng­êi ch¬i nµy thÊt b¹i!")
				return 0
			end
			GMMsg2Player(szName, "<color=yellow>DÞch chuyÓn ®Õn ng­êi ch¬i nµy thµnh c«ng!")
end

function tbAloneScript:PlayerMoveToGM(nPlayerIndex)
	local nWorld, nX, nY;
	local szPlayerName = "";
	local szGMName = "";
	local GMPlayer = PlayerIndex;
		PlayerIndex = GMPlayer;
			szGMName = GetName();
			nWorld, nX, nY = GetWorldPos();
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetName();
			local nWorldIdx = NewWorld(nWorld, nX, nY)
			if nWorldIdx ~= 1 then
				PlayerIndex = GMPlayer;
					GMMsg2Player(szPlayerName, "DÞch chuyÓn ®Õn ng­êi ch¬i nµy thÊt b¹i!")
				return 0
			end
			GMMsg2Player("Th«ng b¸o triÖu tËp", "B¹n ®­îc GM ra lÖnh triÖu tËp!")
		PlayerIndex = GMPlayer;
			GMMsg2Player(szPlayerName, "<color=yellow>B¹n ®· triÖu tËp ng­êi ch¬i nµy thµnh c«ng!")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	LÊy vËt phÈm chØ ®Þnh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:GMLoginInGame()
	if (self:CheckGameMaster() == 2) then
		if (CalcEquiproomItemCount(6,1,4850,-1) == 0) then
			local nItemIndex = AddItem(6,1,4850,1,0,0);
			SetItemBindState(nItemIndex, -1);
		end
		if (CalcEquiproomItemCount(6,1,1266,-1) == 0) then
			local nItemIndex = AddItem(6,1,1266,1,0,0);
			SetItemBindState(nItemIndex, -1);
		end
		if (GetLevel() < 200) then
			ST_LevelUp(200-GetLevel())
		end
		
		if (Title_GetActiveTitle() ~= 5000) then
			SetTask(1122, 5000)
			Title_AddTitle(5000, 1, 30*24*60*60*18);
			Title_ActiveTitle(5000);
		end
	end
end

function tbAloneScript:Write()
	local data = "goldequip.txt";
	local str = "";
	for i = 5670, 5919 do
		local nItemIndex = NewItemEx(4,0,1,0,i-1,0,0,0,0,0,0,0,0,0,0,0)
		str = str..format("\t\t{\"%s\",%d},\n",GetItemName(nItemIndex),i)
	end
	-- for i = 4813, 4832 do
		-- local nItemIndex = NewItemEx(4,0,1,0,i-1,0,0,0,0,0,0,0,0,0,0,0)
		-- str = str..format("\t\t{\"%s\",%d},\n",GetItemName(nItemIndex),i)
	-- end
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end

-- KiÓm tra GM (kiÓm tra xem tµi kho¶n, nh©n vËt nµy cã ph¶i lµ GM hay kh«ng?)
-- Gi¸ trÞ tr¶ vÒ: [-2]: Lçi table - [0]: kh«ng ph¶i GM - [1]: tµi kho¶n lµ GM - [2]: tªn tµi kho¶n vµ nh©n vËt lµ GM
--	Gi¸ trÞ thø 2: sè thø tù cña TK
function tbAloneScript:CheckGameMaster()
	if not (TAB_LIST_GAMEMASTER) then
		print("Khong tim thay table!")
	return -2 end
	
	for i = 1, getn(TAB_LIST_GAMEMASTER) do
		if not (TAB_LIST_GAMEMASTER[i]["Account"]) then
			print("Khong tim thay string [Account] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Player"]) then
			print("Khong tim thay table [Player] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Password"]) then
			print("Khong tim thay string [Password] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Rank"]) then
			print("Khong tim thay string [Rank] trong danh sach table!!!")
		return -2 end
		
		if (TAB_LIST_GAMEMASTER[i]["Account"] == GetAccount()) then
			for k = 1, getn(TAB_LIST_GAMEMASTER[i]["Player"]) do
				if (TAB_LIST_GAMEMASTER[i]["Player"][k] == GetName()) then
				return 2, i end
			end
		return 1, i end
	end
return 0 end

function tbAloneScript:StartGameServer()
	for i = 1, getn(TAB_LINKFILEDATA) do
		self:FileSystem_LoadFile(TAB_LINKFILEDATA[i][1])
	end
end

-- ThiÕt lËp d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: Tõ khãa cÇn load
--		+ szValue: Gi¸ trÞ cña tõ khãa ®ã
function tbAloneScript:FileSystem_SetData(szLinkFile, szSection, szKey, szValue)
	IniFile_SetData(szLinkFile, szSection, szKey, szValue)
end

function tbAloneScript:FileSystem_SaveData(szLinkFile)
	IniFile_Save(szLinkFile, szLinkFile)
end

-- LÊy d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: Tõ khãa cÇn load
function tbAloneScript:FileSystem_GetData(szLinkFile, szSection, szKey)
	return IniFile_GetData(szLinkFile, szSection, szKey)
end

-- Load d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
function tbAloneScript:FileSystem_LoadFile(szLinkFile)
	File_Create(szLinkFile)
	return IniFile_Load(szLinkFile, szLinkFile)
end

-- LÊy danh s¸ch trong file:
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection = "TABLE"
--> Gi¸ trÞ tr¶ vÒ: Sè l­îng dßng, danh s¸ch table
function tbAloneScript:FileSystem_GetCount(szLinkFile, szSection)
	local tbKey = {}
	local nFile = TabFile_Load(szLinkFile, szSection)
	if nFile ~= 1 then
		print("TÖp tin kh«ng tån t¹i hoÆc ch­a cã d÷ liÖu!")
		return 0
	end
	
	for i = 2, TabFile_GetRowCount(szSection) do
		local szKey = TabFile_GetCell(szSection, i, "["..szSection.."]")
		local strKey = split(szKey, "=")
		if strKey[2] then
			tbKey[getn(tbKey)+1] = strKey;
		end
	end
	
	return getn(tbKey), tbKey
end

function tbAloneScript:GetIP()
	local tbIP = split(GetIP(), " : ")
	return tbIP[1], tbIP[2]
end

function OnTimer()
	-- SetFightState(0); --ThiÕt lËp tr¹ng th¸i chiÕn ®Êu
	-- ForbidChangePK(1); --CÊm chuyÓn PK
	-- SetPKFlag(2); --ThiÕt lËp PK
	-- SetChatFlag(1); --CÊm ch¸t
	-- DisabledStall(1); --CÊm bµy b¸n
	-- ForbitTrade(1); --CÊm giao dÞch
	-- DisabledUseTownP(1); --CÊm sö dông THP
	-- ForbidEnmity(1); --CÊm cõu s¸t
	-- SetCreateTeam(0); --ThiÕt lËp t¹o tæ ®éi
	local nPlayerIndex = PlayerIndex or 0;
	local szName = GetName() or "";
	local szAccount = GetAccount() or "";
	local nTimerOut = GetTaskTemp(TASKTEMP_KICKOUT);
	local nTime = GetCurServerTime();
	local nTimeNow = (nTimerOut - nTime) + TIMER_KICKOUT ;
	Msg2Player("<color=cyan>B¹n cßn "..nTimeNow.." gi©y nöa sÏ bÞ hÖ thèng kick ra khái game.")
	if (nTimeNow == 0) then
		SetTaskTemp(TASKTEMP_KICKOUT, 0)
		OfflineLive(nPlayerIndex);
		KickOutSelf(nPlayerIndex);
		print(format("[LOCKED] - Nguoi choi %s(%s) da bi kick ra khoi server!", szName, szAccount));
		StopTimer(TIMETASK_ID);
	end
end

tbAloneScript:StartGameServer();