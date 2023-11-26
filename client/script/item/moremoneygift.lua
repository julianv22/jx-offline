IL("TITLE"); -- quan li title

function main()
	dofile("script/item/moremoneygift.lua")
	local ITEM_TO_CHECK = GetTaskTemp(168)
	if ITEM_TO_CHECK==0 then
		ITEM_TO_CHECK = 4
	end
	local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
	local nSettingsIdx = -1 - GetSex()
	local nChange = 0
	local step = 1
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
		nChange = min(1999, nMaskNPC + step)
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
