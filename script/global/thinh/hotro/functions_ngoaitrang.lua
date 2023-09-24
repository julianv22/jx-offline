--------Ngoai Trang--------------
function ngoaitrang()
    local szTitle = "��i hi�p c�n g�?"
    local tbOpt = {"Ki�m ID ngo�i trang/CheckFeature", "Thay ��i ngo�i h�nh cho 1 trang b�/feature_item",
                   "Ph�c h�i ngo�i h�nh g�c cho trang b�/restore_feature_item", "Tr� l�i/main", "Th�i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function CheckFeature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player("Helm, Armor, Weapon, Horse, Mask:")
    Msg2Player(nHelm .. ", " .. nArmor .. ", " .. nWeapon .. ", " .. nHorse .. ", " .. nMaskNPC)
end

function feature_item()
    GiveItemUI("Thay ��i ngo�i h�nh trang b�",
        "H�y ��t v�o 1 trang b� mu�n thay ��i. L�u � ngo�i h�nh m�i v�n t�n t�i sau khi tho�t game.",
        "feature_item_confirm", "onCancel", 1);
end

function feature_item_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu� nhi�u trang b�, kh�ng th� x� l�")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "Nh�p ID mu�n ��i:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end
