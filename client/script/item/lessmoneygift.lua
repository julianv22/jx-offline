IL("TITLE"); -- quan li title
-- ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
-- 0 l� v�nh vi�n, �i chung w -1 �� kh�ng set th�i gian
-- 1 l� c� t�nh th�i gian, s� th� 2 l� gi�y * 18
-- nSettingsIdx: -1 l� nam, -2 l� n�
-- b�t ��u t� 0 l� h�nh d�ng npc trong npcs.txt


function main()
	dofile("script/item/lessmoneygift.lua")
	local ITEM_TO_CHECK = GetTaskTemp(168)
	if ITEM_TO_CHECK==0 then
		ITEM_TO_CHECK = 4
	end
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	local nSettingsIdx = -1 - GetSex()
	local nChange = 0
	local step = -1
	local item_type = ""
	if ITEM_TO_CHECK == 4 then
		nChange = nHorse + step
		nHorse = nChange
		item_type = "ng�a"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 3 then
		nChange = nWeapon + step
		nWeapon = nChange	
		item_type = "v� kh�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 2 then
		nChange = nArmor + step
		nArmor = nChange	
		item_type = "�o"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 1 then
		nChange = nHelm + step
		nHelm = nChange	
		item_type = "m�"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 6 then
		nMaskNPC = GetTaskTemp(169)
		nChange = nMaskNPC + step
		SetTaskTemp(169, nChange)
		item_type = "NPC"
		ChangeOwnFeature(1, 60*18, nChange,  0, 0, 0, 0)
	elseif ITEM_TO_CHECK == 5 then
		local ID_title = Title_GetActiveTitle()
		Title_RemoveTitle(ID_title)	
		nChange = ID_title + step
		Title_AddTitle(nChange, 1, 60*18) -- 5 phut
		Title_ActiveTitle(nChange)
		SetTask(1122, nChange)
		item_type = "danh hi�u"
	end
	Msg2Player("ID "..item_type..": <color=yellow>"..nChange)
	return 1
end
