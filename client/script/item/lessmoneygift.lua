IL("TITLE"); -- quan li title
-- ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
-- 0 lµ vÜnh viÔn, ®i chung w -1 ®Ó kh«ng set thêi gian
-- 1 lµ cã tÝnh thêi gian, sè thø 2 lµ gi©y * 18
-- nSettingsIdx: -1 lµ nam, -2 lµ n÷
-- b¾t ®Çu tõ 0 lµ h×nh d¹ng npc trong npcs.txt


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
		item_type = "ngùa"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 3 then
		nChange = nWeapon + step
		nWeapon = nChange	
		item_type = "vò khÝ"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 2 then
		nChange = nArmor + step
		nArmor = nChange	
		item_type = "¸o"
		ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
	elseif ITEM_TO_CHECK == 1 then
		nChange = nHelm + step
		nHelm = nChange	
		item_type = "mò"
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
		item_type = "danh hiÖu"
	end
	Msg2Player("ID "..item_type..": <color=yellow>"..nChange)
	return 1
end
