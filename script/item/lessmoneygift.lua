IL("TITLE"); -- quan li title
Include("\\script\\vng_lib\\files_lib.lua") -- to read file
-- ChangeOwnFeature(0, -1, nSettingsIdx,  nHelm, nArmor, nWeapon, nHorse)
-- 0 l� v�nh vi�n, �i chung w -1 �� kh�ng set th�i gian
-- 1 l� c� t�nh th�i gian, s� th� 2 l� gi�y * 18
-- nSettingsIdx: -1 l� nam, -2 l� n�
-- b�t ��u t� 0 l� h�nh d�ng npc trong npcs.txt

function main()
    dofile("script/item/lessmoneygift.lua")
    ITEM_TO_CHECK = loadsavevalue("settings/changefeature/ngoaitrang.txt")
    local ITEM_TO_CHECK = GetTaskTemp(168)
    -- Msg2Player("Task value: <color=yellow>"..ITEM_TO_CHECK)
    if ITEM_TO_CHECK == -1 then
        ITEM_TO_CHECK = 4
    end
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    local nSettingsIdx = -1 - GetSex()
    local nChange = 0
    local step = -1
    local item_type = ""
    if ITEM_TO_CHECK == 4 then
        nHorse = GetTaskTemp(169)
        item_type = "ng�a"
        ChangeOwnFeature(0, -1, nSettingsIdx, nHelm, nArmor, nWeapon, nHorse)
        nChange = nHorse + step
        SetTaskTemp(169, nChange)
    elseif ITEM_TO_CHECK == 3 then
        nWeapon = GetTaskTemp(169)
        item_type = "v� kh�"
        ChangeOwnFeature(0, -1, nSettingsIdx, nHelm, nArmor, nWeapon, nHorse)
        nChange = nWeapon + step
        SetTaskTemp(169, nChange)
    elseif ITEM_TO_CHECK == 2 then
        nArmor = GetTaskTemp(169)
        item_type = "�o"
        ChangeOwnFeature(0, -1, nSettingsIdx, nHelm, nArmor, nWeapon, nHorse)
        nChange = nArmor + step
        SetTaskTemp(169, nChange)
    elseif ITEM_TO_CHECK == 1 then
        nHelm = GetTaskTemp(169)
        item_type = "m�"
        ChangeOwnFeature(0, -1, nSettingsIdx, nHelm, nArmor, nWeapon, nHorse)
        nChange = nHelm + step
        SetTaskTemp(169, nChange)
    elseif ITEM_TO_CHECK == 0 then
        nMaskNPC = GetTaskTemp(169)
        item_type = "m�t n�"
        ChangeOwnFeature(0, -1, nMaskNPC)
        nChange = nMaskNPC + step
        SetTaskTemp(169, nChange)
    end
    Msg2Player("ID " .. item_type .. ": <color=yellow>" .. GetTaskTemp(169)-1)
    return 1
end
