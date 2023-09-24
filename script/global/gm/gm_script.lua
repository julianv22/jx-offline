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
 --Tr��c khi s� d�ng ���c ch�c n�ng GM, ng��i ch�i ph�i nh�p m�t kh�u
function tbAloneScript:GMPassword()
	local nResult, nIdx = self:CheckGameMaster()
	if (nResult == 0) then
		Talk(1, "", "B�n kh�ng ph�i l� <color=red>GM<color>, kh�ng th� s� d�ng v�t ph�m n�y");
	return 0 end
	if (GetLevel() < 0) then
		Talk(1, "", "�� s� d�ng ���c to�n b� ch�c n�ng b�n trong, vui l�ng n�ng l�n <color=red>c�p 200<color> r�i h�y s� d�ng ��n n�");
	return 0 end

	local szName = GetName();
	local szAccount = GetAccount();
	local nIsLogin = GetTaskTemp(TASKTEMP_LOGIN_LBGM);
	if (nIsLogin == 1) then
		self:DialogMain();
	return 1 end
	
	g_AskClientStringEx("", 1, 50, "Nh�p m�t kh�u:", {self.EnterGMPassword, {self, nIdx, szAccount, szName}})
end

function tbAloneScript:EnterGMPassword(nIdx, szAccount, szName, szPassword)
	if (TAB_LIST_GAMEMASTER[nIdx]["Password"] ~= szPassword) then
		Talk(1, "", "M�t kh�u kh�ng ��ng, vui l�ng ki�m tra l�i!");
	return 0 end
	self:DialogMain();
	SetTaskTemp(TASKTEMP_LOGIN_LBGM, 1)
	Msg2Player("B�n �� nh�p m�t kh�u ��ng, ��ng nh�p th�nh c�ng! B�y gi� c� th� s� d�ng ���c ch�c n�ng d�nh cho GM.")
end

function tbAloneScript:DialogMain()
	dofile("\\script\\global\\gm\\gm_script.lua")
	local szTitle = format("Ch�o m�ng <color=red>GM<color> tham gia m�y ch� <color=green>PYTA Gaming<color>! ��y l� l�nh b�i h� tr� d�nh cho GM �� qu�n l�, �i�u h�nh m�y ch� c�a m�nh.");
	local tbOption = {};
		tinsert(tbOption, {"Qu�n l� to�n b� M�y Ch�", self.ManagePlayerSystem, {self}})
	if (GetSkillState(733) == -1) then
		tinsert(tbOption, {"B�t t�nh n�ng T�ng H�nh", self.GMHide, {self}})
	else
		tinsert(tbOption, {"T�t t�nh n�ng T�ng H�nh", self.GMShow, {self}})
	end
	if (IsOwnFeatureChanged() == 0) then
		tinsert(tbOption, {"Bi�n th�nh h�nh d�ng GM", self.ChangeMask, {self}})
	else
		tinsert(tbOption, {"Tr� l�i h�nh d�ng ban ��u", self.RestoreMask, {self}})
	end
	if (Title_GetActiveTitle() ~= 191) then
		tinsert(tbOption, {"B�t huy hi�u GM", self.HaloGM, {self}})
	else
		tinsert(tbOption, {"T�t huy hi�u GM", self.HaloGM, {self}})
	end
                tinsert(tbOption, {"D�ch Chuy�n T�c Th�i", self.MoveToPosition, {self}})
		--tinsert(tbOption, {"L�y V�t Ph�m", self.TakeSpecifiedItem, {self}})
		--tinsert(tbOption, {"Th�m - X�a Skill", self.SkillsSystem, {self}})
		--tinsert(tbOption, {"T�nh n�ng h� tr� kh�c", self.SupportFeatureOther, {self}})
		tinsert(tbOption, {"T�m hi�u v� t�nh n�ng qu�n tr�", self.GMHelp, {self}})
		-- tinsert(tbOption, {"Logs", self.Write, {self}})
		-- tinsert(tbOption, {"Load", self.Loadds, {self}})
		tinsert(tbOption, {"��ng."})
	CreateNewSayEx(szTitle, tbOption)	
	--CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

-- function tbAloneScript:Loadds()
	-- LoadScript("\\script\\global\\gm\\gm_script.lua")
-- end

function tbAloneScript:ManagePlayerSystem()
	local szTitle = format("M�i GM <color=red>%s<color> l�a ch�n ch�c n�ng h� tr� qu�n tr�:", GetName());
	local tbOption = {}
		tinsert(tbOption, {"Ch�c n�ng Th�ng B�o", self.NotificationManage, {self}})
		tinsert(tbOption, {"Qu�n l� Nh�n V�t", self.ManageSystemGlobal, {self}})
		tinsert(tbOption, {"Thao t�c Ng��i Ch�i", self.ManipulationOnPlayer, {self}})
		--tinsert(tbOption, {"D�ch Chuy�n T�c Th�i", self.MoveToPosition, {self}})
		--tinsert(tbOption, {"L�y V�t Ph�m", self.TakeSpecifiedItem, {self}})
		--tinsert(tbOption, {"Th�m - X�a Skill", self.SkillsSystem, {self}})
		tinsert(tbOption, {"��ng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																						D�ch chuy�n ��n v� tr�																				--
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
		GMMsg2Player("D�ch chuy�n ��n v� tr�","Th�t b�i! V� tr� kh�ng h�p l�, vui l�ng ki�m tra l�i.")
		return
	end
	
	SetStringTask(TASK_S_POSITION, szPos)
	GMMsg2Player("D�ch chuy�n ��n v� tr�","<color=yellow>Th�nh c�ng!")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	H� th�ng l�y k� n�ng																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:SkillsSystem()
	local szTitle = "H� th�ng k� n�ng bao g�m Th�m k� n�ng v� X�a k� n�ng, b�n mu�n s� d�ng h� th�ng k� n�ng n�o?"
	local tbOpt = {}
		tinsert(tbOpt, {"Th�m K� n�ng", g_AskClientStringEx, {"", 0,256,"N�i dung th�ng b�o:", {self.AddSkills, {self}}}})
		tinsert(tbOpt, {"X�a K� n�ng", g_AskClientStringEx, {"", 0,256,"N�i dung th�ng b�o:", {self.DeleteSkills, {self}}}})
		tinsert(tbOpt, {"��ng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAloneScript:AddSkills(szSkills)
	local _,_, nStart, nEnd, _, nPoint = self:GetSplitSkills(szSkills)
	for i = nStart, nEnd do
		AddMagic(i, nPoint)
		GMMsg2Player("Th�m K� n�ng", "K� n�ng �"..GetSkillName(i).."� ��ng c�p "..nPoint.."!")
	end
end

function tbAloneScript:DeleteSkills(szSkills)
	local tbSkills, nCount, nStart, _, nEnd, _ = self:GetSplitSkills(szSkills)
	if nCount > 2 then
		GMMsg2Player("X�a K� n�ng", "Nh�p th�ng s� b� l�i, ch� c� th� nh�p t�i �a 2 th�ng s� tr� xu�ng.")
		return 0
	end
	for i = nStart, nEnd do
		DelMagic(i)
		GMMsg2Player("X�a K� n�ng", "K� n�ng �"..GetSkillName(i).."� �� ���c x�a b�!")
	end
end

function tbAloneScript:GetSplitSkills(szString)
	local nStartSkill, nEndSkill, nEndSkill2, nPointSkill;
	local tbString = split(szString, ",")
	local nType = self:IsParamNumber(tbString)
	if nType ~= 1 then
		GMMsg2Player("Th�m K� n�ng", "Nh�p th�ng s� b� l�i, ch� s� d�ng c�c k� t� s� t� 0-9 v� d�u ph�y �,�.")
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
--																	L�y v�t ph�m ch� ��nh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:TakeSpecifiedItem()
	g_AskClientStringEx(GetStringTask(TASKS_GETITEM), 0, 256, "Th�ng s� item:", {self.TakeSpecifiedItemParam, {self}})
end

function tbAloneScript:TakeSpecifiedItemParam(szParam)
	if not szParam then
		Talk(1, "", "GM ch�a nh�p th�ng s� c�a m�t item b�t k�, vui l�ng th� l�i.")
		return 0
	end
	
	local nType, tbParam = self:GetTypeParam(szParam)
	if (nType == 0) then
		GMMsg2Player("L�y v�t ph�m ch� ��nh", "Th�t b�i! T�i �a cho ph�p l� 16 th�ng s�.")
		return 0
	end
	local nIsParam = self:IsParamNumber(tbParam[2])
	if nIsParam ~= 1 then
		GMMsg2Player("L�y v�t ph�m ch� ��nh", "Th�t b�i! Ch� s� d�ng c�c k� t� s� t� 0-9 v� d�u ph�y �,�.")
		return 0
	end
	
	self:SetCountSpecifiedItem(nType, tbParam)
end

function tbAloneScript:SetCountSpecifiedItem(nType, tbParam)
	local tbOptionSelected = {}
	g_AskClientNumberEx(1, 500, "Nh�p s� l��ng:", {self.CountSpecifiedItem, {self, {nType, tbParam, tbOptionSelected}}})
end

function tbAloneScript:CountSpecifiedItem(tbSpecifiedItem, nCount, nOptionSelected)
	local szTitle = "H�y thi�t l�p th�m option n�u mu�n.\n\n* Option GM �� ch�n:"
	local nIsTable = self:IsOption(tbSpecifiedItem[3], "table")
	if nIsTable then
		for x, y in tbSpecifiedItem[3] do
			szTitle = szTitle..format("\n"..strfill_right("+", 5, " ").." <color=green>%s<color>",y[1])
		end
	end
	
	local tbOpt = {}
		local nBind = self:GetTypeOption(tbSpecifiedItem[3], 1)
		if nBind ~= 1 then
			tinsert(tbOpt, {"+ Th�m option kh�a b�o hi�m v�nh vi�n", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 1}})
			tinsert(tbOpt, {"+ Th�m option kh�a b�o hi�m", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 2}})
		end
		
		local nExpired = self:GetTypeOption(tbSpecifiedItem[3], 2)
		if nExpired ~= 2 then
			tinsert(tbOpt, {"+ Th�m option th�i h�n s� d�ng", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 3}})
		end
		
		tinsert(tbOpt, {"�� xong, ta mu�n l�y ngay b�y gi�", self.CreateItemSpecified, {self, tbSpecifiedItem, nCount}})
		tinsert(tbOpt, {"Ch�n l�i option", self.ReselectOption, {self, tbSpecifiedItem, nCount}})

		tinsert(tbOpt, {"��ng."})
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
			Msg2Player(format("B�n �� t�ng cho ng��i ch�i <color=yellow>%s<color> n�y %d %s", szPlayerName, nCount, szItemName))
		PlayerIndex = nPlayerIndex;
			Msg2Player(format("B�n �� ���c GM <color=yellow>%s<color> t�ng %d %s", szGMName, nCount, szItemName))
		nPlayerIndex = nil;
	else
		Msg2Player(format("B�n nh�n ���c %d %s", nCount, szItemName))
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
		[1] = {"Kh�a b�o hi�m v�nh vi�n", 1},
		[2] = {"Kh�a b�o hi�m", 1},
		[3] = {"Th�i h�n s� d�ng", 2},
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
	g_AskClientNumberEx(1,999999, "Th�i h�n s� d�ng:", {self.SetTimeOptionInItem, {self, tbSpecifiedItem, nCount, nOptionSelected, tbListOption}})
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
--																T�nh n�ng gi�nh cho GM																									--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:GMHide()
	AddSkillState(733,1,0,777600);
	Msg2Player("B�t ch�c n�ng T�ng H�nh cho GM");
end

function tbAloneScript:GMShow()
	AddSkillState(733,1,0,18*1);
	Msg2Player("T�t ch�c n�ng T�ng H�nh cho GM");
end

function tbAloneScript:ChangeMask()
	ChangeOwnFeature(0,0,567);
	Msg2Player("Bi�n th�nh h�nh d�ng GM");
end

function tbAloneScript:RestoreMask()
	RestoreOwnFeature();
	Msg2Player("Tr� l�i h�nh d�ng ban ��u");
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
--																				V�t ph�m h� tr�																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:SupportFeatureOther()
	local szTitle = format("Ch�o m�ng <color=red>GM<color> tham gia m�y ch� <color=green>PYTA Gaming<color>! ��y l� l�nh b�i h� tr� d�nh cho GM �� qu�n l�, �i�u h�nh m�y ch� c�a m�nh.");
	local tbOption = {};
		tinsert(tbOption, {"Thay ��i tr�ng th�i (M�u PK)", self.GMChangeCamp, {self}})
		tinsert(tbOption, {"H�y b� v�t ph�m", DisposeItem})
		tinsert(tbOption, {"��ng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:GMChangeCamp()
	local szTitle = "GM mu�n ��i sang m�u tr�ng th�i n�o d��i ��y?";
	local tbOption = {};
		tinsert(tbOption, {"Luy�n c�ng (Tr�ng)", self.GMChangeCampOK, {self, 0}})
		tinsert(tbOption, {"Ch�nh ph�i (V�ng)", self.GMChangeCampOK, {self, 1}})
		tinsert(tbOption, {"T� ph�i (T�m)", self.GMChangeCampOK, {self, 2}})
		tinsert(tbOption, {"Trung l�p (Xanh)", self.GMChangeCampOK, {self, 3}})
		tinsert(tbOption, {"S�t th� (��)", self.GMChangeCampOK, {self, 4}})
		tinsert(tbOption, {"GM (H�ng)", self.GMChangeCampOK, {self, 5}})
		tinsert(tbOption, {"��ng."})
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
--																Ta mu�n th�ng b�o ��n ng��i ch�i															--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbAloneScript:NotificationManage()
	local szTitle = "Hi�n t�i c� 2 ch�c n�ng th�ng b�o ch�nh, �� l�:\n+ <color=red>T�n s� th� gi�i<color>: K�nh n�y th�ng b�o tr�n khung ch�t t�n g�u trong giao di�n ng��i ch�i.\n+ <color=red>T�n s� m�y ch�<color>: K�nh n�y th�ng b�o ��n ng��i ch�i trong to�n m�y ch�, n�i d�ng ch�y ch� � ph�a tr�n ��u nh�n v�t."
	local tbOption = {}
		tinsert(tbOption, {"Th�ng b�o tr�n T�n s� Th� Gi�i", g_AskClientStringEx, {"", 0,256,"N�i dung th�ng b�o:", {self.EnterNotification, {self, 1}}}})
		tinsert(tbOption, {"Th�ng b�o tr�n T�n s� M�y Ch�", g_AskClientStringEx, {"", 0,256,"N�i dung th�ng b�o:", {self.EnterNotification, {self, 2}}}})
		tinsert(tbOption, {"��ng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:EnterNotification(nType, szNotices)
	if szNotices == nil or szNotices == "" then
	return 0 end

	if (nType == 1) then
		Msg2SubWorld("<color=yellow><bclr=red>GM "..GetName().."<bclr> n�i:<color> <color=cyan>"..szNotices)
	elseif (nType == 2) then
		AddGlobalCountNews("<color=yellow><bclr=red>GM "..GetName().."<bclr> th�ng b�o: <color>"..szNotices, 3)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															H� th�ng qu�n l� to�n m�y ch�																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbAloneScript:ManageSystemGlobal()
	local szTitle = "H� th�ng qu�n l� to�n m�y ch� ���c s� d�ng �� kh�a, c�m ch�t, kick out,� ng��i ch�i trong m�y ch�."
	local tbOption = {}
		tinsert(tbOption, {"Kh�a nh�n v�t �ang tr�c tuy�n", self.LockPlayerOnline, {self, 1}})
		tinsert(tbOption, {"M� kh�a nh�n v�t", self.UnlockPlayer, {self, 1}})
		tinsert(tbOption, {"Kh�a t�i kho�n �ang tr�c tuy�n", self. LockPlayerOnline, {self, 2}})
		tinsert(tbOption, {"M� kh�a t�i kho�n", self. UnlockPlayer, {self, 2}})
		tinsert(tbOption, {"��ng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbAloneScript:UnlockPlayer(nType)
	g_AskClientStringEx("", 1, 50, "T�n m� kh�a:", {self.EnterUnlockPlayer, {self, nType}})
end

function tbAloneScript:EnterUnlockPlayer(nType, szPlayer)
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local nCount = self:FileSystem_GetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer)
	if (tonumber(nCount) ~= 1) then
		Msg2Player(szPlayer.." kh�ng b� kh�a")
	return end
	self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer, "");
	self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
	Msg2Player(format("B�n �� m� kh�a cho <color=yellow>%s<color> n�y th�nh c�ng!", szPlayer));
end

function tbAloneScript:LockPlayerOnline(nType)
	g_AskClientStringEx("", 1, 50, "T�n mu�n kh�a:", {self.EnterLockPlayerOnline, {self, nType}})
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
		Msg2Player("Ng��i n�y hi�n kh�ng online ho�c kh�ng t�n t�i");
	return 0 end
	
	PlayerIndex = nGMPlayer;
	if (nType == 1) then
		self:LockSystemByNamePlayer(nPlayerIndex);
	elseif (nType == 2) then
		self:LockSystemByAccountPlayer(nPlayerIndex);
	end
end

function tbAloneScript:LockSystemByNamePlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "L� do b� kh�a:", {self.EnterLockSystemByNamePlayer, {self, nPlayerIndex}})
end

function tbAloneScript:EnterLockSystemByNamePlayer(nPlayerIndex, szMsg)
	local nType = 1;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetName();
			Msg2Player(format("<color=yellow>Nh�n v�t n�y �� b� kh�a, v� l� do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		PlayerIndex = nGMPlayer;
			Msg2Player("B�n �� kh�a ng��i ch�i n�y th�nh c�ng!")
			SetStringTask(TASKS_LOCKSYSTEM, szPlayerName);
end

function tbAloneScript:LockSystemByAccountPlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "L� do b� kh�a:", {self.EnterLockSystemByAccountPlayer, {self, nPlayerIndex}})
end

function tbAloneScript:EnterLockSystemByAccountPlayer(nPlayerIndex, szMsg)
	local nType = 2;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetAccount();
			Msg2Player(format("<color=yellow>Nh�n v�t n�y �� b� kh�a, v� l� do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		PlayerIndex = nGMPlayer;
			Msg2Player("B�n �� kh�a ng��i ch�i n�y th�nh c�ng!")
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
			Msg2Player("Nh�n v�t n�y c�a b�n hi�n �ang b� kh�a, kh�ng th� tham gia v�o game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
		
		local nIsAccount = tonumber(self:FileSystem_GetData(TAB_LINKFILEDATA[2][1], TAB_LINKFILEDATA[2][2], GetAccount())) or 0;
		
		if (nIsAccount == 1) then
			Msg2Player("T�i kho�n n�y c�a b�n hi�n �ang b� kh�a, kh�ng th� tham gia v�o game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															T�m hi�u v� t�nh n�ng LBGM																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:GMHelp()
	Describe("GM mu�n t�m hi�u v� t�nh n�ng qu�n tr� n�o d��i ��y?", 8,
	"T�m hi�u v� t�nh n�ng �L�y v�t ph�m b�t k��/TakeSpecifiedItem",
	"T�m hi�u v� t�nh n�ng �D�ch chuy�n ��n v� tr݅�/MoveToPosition",
	"��ng./OnCancel")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--														Thao t�c v�i ng��i ch�i �ang online																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbAloneScript:ManipulationOnPlayer()
	if (GetLevel() < 10) then
		Talk(1, "", "Nh�n v�t ��t c�p 10 tr� l�n m�i c� th� s� d�ng t�nh n�ng n�y")
	return end
	
	g_AskClientStringEx("", 0, 200, "T�n nh�n v�t:", {self.SearchPlayerOnline, {self}})
end

function tbAloneScript:SearchPlayerOnline(szPlayer)
	local GMPlayer = PlayerIndex;
	local szName, szAccount, szIP;
	local nLevel, nCash;
	nPlayerIndex = SearchPlayer(szPlayer)
	if nPlayerIndex <= 0 then
		Talk(1, "", "Nh�n v�t n�y �� r�i m�ng ho�c kh�ng t�n t�i!")
		return
	end
	
	local szFactionName = {
		["shaolin"] 		= "Thi�u L�m",
		["tianwang"] 	= "Thi�n V��ng bang",
		["tangmen"] 	= "���ng M�n",
		["wudu"] 			= "Ng� ��c gi�o",
		["emei"] 			= "Nga My",
		["cuiyan"] 		= "Th�y Y�n m�n",
		["gaibang"] 		= "C�i Bang",
		["tianren"] 		= "Thi�n Nh�n gi�o",
		["wudang"] 		= "V� �ang",
		["kunlun"] 		= "C�n L�n",
		["huashan"] 	= "Hoa S�n",
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
		Describe(format(strfill_center(" Th�ng tin ng��i ch�i ", 50, "-").."\n"
		.."\n+ T�n ng��i ch�i: %s"
		.."\n+ T�n t�i kho�n: %s"
		.."\n+ ��a ch� IP: %s"
		.."\n+ V� tr� hi�n t�i: B�n ��: %d - T�a ��: %d,%d"
		.."\n+ M�n ph�i: %s"
		.."\n+ ��ng c�p: %d"
		.."\n+ Ti�n v�n: %d"
		.."\n+ Ti�n ��ng: %d"

		.."\n+ �i�m danh v�ng: %d"
		.."\n+ �i�m ph�c duy�n: %d"
		.."\n+ �i�m uy danh: %d"
		.."\n+ �i�m t�ch l�y T�ng Kim: %d"
		.."\n+ �i�m t�ch l�y Li�n ��u: %d"
		
		.."\n------------------------------------------------"		
		.."\n+ Sinh l�c: %d"
		.."\n+ N�i l�c: %d"
		.."\n+ Th� l�c: %d"
		.."\n+ N� tr�nh: %d"
		
		.."\n+ Kh�ng b�ng: %d"
		.."\n+ Kh�ng l�i: %d"
		.."\n+ Kh�ng h�a: %d"
		.."\n+ Kh�ng ��c: %d"
		.."\n+ Ph�ng th� v�t l�: %d"
		
		.."\n+ S�c m�nh: %d"
		.."\n+ Sinh kh�: %d"
		.."\n+ Th�n ph�p: %d"
		.."\n+ N�i c�ng: %d"
		.."\n+ Ti�m n�ng c�n l�i: %d"
		.."\n+ K� n�ng c�n l�i: %d"
		.."\n------------------------------------------------"
		
		, szName or ""
		, szAccount or ""
		, szIP or ""
		, nWorld or 0, nPosX or 0, nPosY or 0
		, szFactionName[szFaction] or "Ch�a gia nh�p"
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
		"GM di chuy�n ��n ng��i ch�i n�y/#tbAloneScript:GMMoveToPlayer("..nPlayerIndex..")",
		"Ng��i ch�i n�y di chuy�n ��n GM/#tbAloneScript:PlayerMoveToGM("..nPlayerIndex..")",
		"T�ng �i�m cho ng��i ch�i n�y/#tbAloneScript:GivePoints("..nPlayerIndex..")",
		"T�ng v�t ph�m, ��o c�, trang b� cho ng��i ch�i n�y/#tbAloneScript:GiveItemForPlayer("..nPlayerIndex..")",
		"T�ng ti�n v�n (v�n l��ng) cho ng��i ch�i ng�y/#tbAloneScript:GiveCash("..nPlayerIndex..")",
		"T�ng ti�n ��ng cho ng��i ch�i ng�y/#tbAloneScript:GiveCoin("..nPlayerIndex..")",
		"T�ng KNB cho ng��i ch�i ng�y/#tbAloneScript:GiveKNB("..nPlayerIndex..")",
		"��ng./OnCancel")
end


function tbAloneScript:GivePoints(nPlayerIndex)
	local szTitle = "GM mu�n t�ng �i�m g� cho ng��i ch�i n�y?";
	local tbOpt = {}
		tinsert(tbOpt, {"C�p ��", g_AskClientNumberEx, {0,200, "Nh�p c�p ��:", {self.SetLevelPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Kinh nghi�m", g_AskClientNumberEx, {0,9999999999, "Nh�p s� �i�m:", {self.SetExpPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Danh v�ng", g_AskClientNumberEx, {0,9999999999, "Nh�p s� �i�m:", {self.SetReputePlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Ph�c duy�n", g_AskClientNumberEx, {0,9999999999, "Nh�p s� �i�m:", {self.SetFuYuanPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"T�ng Kim", g_AskClientNumberEx, {0,9999999999, "Nh�p s� �i�m:", {self.SetBattlePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Li�n ��u", g_AskClientNumberEx, {0,9999999999, "Nh�p s� �i�m:", {self.SetLeaguePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"��ng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAloneScript:SetLevelPlayer(nPlayerIndex, nLevel)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		ST_LevelUp(nLevel-GetLevel());
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> c�p �� b�i GM %s", nLevel, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> c�p ��", szPlayerName, nLevel))
end

function tbAloneScript:SetExpPlayer(nPlayerIndex, nExp)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		tl_addPlayerExp(nExp);
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> �i�m kinh nghi�m b�i GM %s", nExp, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> �i�m kinh nghi�m", szPlayerName, nExp))
end

function tbAloneScript:SetReputePlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddRepute(nPoint);
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> danh v�ng b�i GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> danh v�ng", szPlayerName, nPoint))
end

function tbAloneScript:SetFuYuanPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(151, GetTask(151)+nPoint)
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> ph�c duy�n b�i GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> ph�c duy�n", szPlayerName, nPoint))
end

function tbAloneScript:SetBattlePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(747, GetTask(747)+nPoint);
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> �i�m T�ng Kim b�i GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> �i�m T�ng Kim", szPlayerName, nPoint))
end

function tbAloneScript:SetLeaguePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(2501, GetTask(2501)+nPoint);
		Msg2Player(format("B�n �� nh�n ���c <color=yellow>%d<color> �i�m Li�n ��u b�i GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B�n �� t�ng cho ng��i ch�i %s <color=yellow>%d<color> �i�m Li�n ��u", szPlayerName, nPoint))
end

function tbAloneScript:GiveCash(nPlayerIndex)
	g_AskClientNumberEx(1, 20000, "Nh�p s� l��ng:", {self.GiveCashNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveCashNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		szPlayer = GetName();
		Earn(nCount*10000)
		Msg2Player(format("<color=green>B�n nh�n ���c <color=yellow>%d<color> v�n l��ng t� GM %s<color>", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B�n �� t�ng ng��i ch�i %s <color=yellow>%d<color> v�n l��ng<color>", szPlayer, nCount))
end

function tbAloneScript:GiveCoin(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "Nh�p s� l��ng:", {self.GiveCoinNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveCoinNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,417,1,0,0,0)
		end
		Msg2Player(format("<color=green>B�n nh�n ���c <color=yellow>%d<color> Ti�n ��ng t� GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B�n �� t�ng ng��i ch�i %s <color=yellow>%d<color> Ti�n ��ng.", szPlayer, nCount))
end

function tbAloneScript:GiveKNB(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "Nh�p s� l��ng:", {self.GiveKNBNow, {self, nPlayerIndex}})
end

function tbAloneScript:GiveKNBNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,343,1,0,0,0)
		end
		Msg2Player(format("<color=green>B�n nh�n ���c <color=yellow>%d<color> KNB t� GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B�n �� t�ng ng��i ch�i %s <color=yellow>%d<color> KNB.", szPlayer, nCount))
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
				GMMsg2Player(szName, "D�ch chuy�n ��n ng��i ch�i n�y th�t b�i!")
				return 0
			end
			GMMsg2Player(szName, "<color=yellow>D�ch chuy�n ��n ng��i ch�i n�y th�nh c�ng!")
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
					GMMsg2Player(szPlayerName, "D�ch chuy�n ��n ng��i ch�i n�y th�t b�i!")
				return 0
			end
			GMMsg2Player("Th�ng b�o tri�u t�p", "B�n ���c GM ra l�nh tri�u t�p!")
		PlayerIndex = GMPlayer;
			GMMsg2Player(szPlayerName, "<color=yellow>B�n �� tri�u t�p ng��i ch�i n�y th�nh c�ng!")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	L�y v�t ph�m ch� ��nh																			--
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

-- Ki�m tra GM (ki�m tra xem t�i kho�n, nh�n v�t n�y c� ph�i l� GM hay kh�ng?)
-- Gi� tr� tr� v�: [-2]: L�i table - [0]: kh�ng ph�i GM - [1]: t�i kho�n l� GM - [2]: t�n t�i kho�n v� nh�n v�t l� GM
--	Gi� tr� th� 2: s� th� t� c�a TK
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

-- Thi�t l�p d� li�u
--		+ szLinkFile: ���ng d�n file d�ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: T� kh�a c�n load
--		+ szValue: Gi� tr� c�a t� kh�a ��
function tbAloneScript:FileSystem_SetData(szLinkFile, szSection, szKey, szValue)
	IniFile_SetData(szLinkFile, szSection, szKey, szValue)
end

function tbAloneScript:FileSystem_SaveData(szLinkFile)
	IniFile_Save(szLinkFile, szLinkFile)
end

-- L�y d� li�u
--		+ szLinkFile: ���ng d�n file d�ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: T� kh�a c�n load
function tbAloneScript:FileSystem_GetData(szLinkFile, szSection, szKey)
	return IniFile_GetData(szLinkFile, szSection, szKey)
end

-- Load d� li�u
--		+ szLinkFile: ���ng d�n file d�ng "\\data\\log.txt"
function tbAloneScript:FileSystem_LoadFile(szLinkFile)
	File_Create(szLinkFile)
	return IniFile_Load(szLinkFile, szLinkFile)
end

-- L�y danh s�ch trong file:
--		+ szLinkFile: ���ng d�n file d�ng "\\data\\log.txt"
--		+ szSection = "TABLE"
--> Gi� tr� tr� v�: S� l��ng d�ng, danh s�ch table
function tbAloneScript:FileSystem_GetCount(szLinkFile, szSection)
	local tbKey = {}
	local nFile = TabFile_Load(szLinkFile, szSection)
	if nFile ~= 1 then
		print("T�p tin kh�ng t�n t�i ho�c ch�a c� d� li�u!")
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
	-- SetFightState(0); --Thi�t l�p tr�ng th�i chi�n ��u
	-- ForbidChangePK(1); --C�m chuy�n PK
	-- SetPKFlag(2); --Thi�t l�p PK
	-- SetChatFlag(1); --C�m ch�t
	-- DisabledStall(1); --C�m b�y b�n
	-- ForbitTrade(1); --C�m giao d�ch
	-- DisabledUseTownP(1); --C�m s� d�ng THP
	-- ForbidEnmity(1); --C�m c�u s�t
	-- SetCreateTeam(0); --Thi�t l�p t�o t� ��i
	local nPlayerIndex = PlayerIndex or 0;
	local szName = GetName() or "";
	local szAccount = GetAccount() or "";
	local nTimerOut = GetTaskTemp(TASKTEMP_KICKOUT);
	local nTime = GetCurServerTime();
	local nTimeNow = (nTimerOut - nTime) + TIMER_KICKOUT ;
	Msg2Player("<color=cyan>B�n c�n "..nTimeNow.." gi�y n�a s� b� h� th�ng kick ra kh�i game.")
	if (nTimeNow == 0) then
		SetTaskTemp(TASKTEMP_KICKOUT, 0)
		OfflineLive(nPlayerIndex);
		KickOutSelf(nPlayerIndex);
		print(format("[LOCKED] - Nguoi choi %s(%s) da bi kick ra khoi server!", szName, szAccount));
		StopTimer(TIMETASK_ID);
	end
end

tbAloneScript:StartGameServer();