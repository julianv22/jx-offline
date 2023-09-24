--------Ngoai Trang--------------
function ngoaitrang()
    local szTitle = "§¹i hiÖp cÇn g×?"
    local tbOpt = {"KiÓm ID ngo¹i trang/CheckFeature", "Thay ®æi ngo¹i h×nh cho 1 trang bŞ/feature_item",
                   "Phôc håi ngo¹i h×nh gèc cho trang bŞ/restore_feature_item", "Trë l¹i/main", "Th«i./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function CheckFeature()
    local nHelm, nArmor, nWeapon, nHorse, nMaskNPC = GetPlayerFeature(PlayerIndex)
    Msg2Player("Helm, Armor, Weapon, Horse, Mask:")
    Msg2Player(nHelm .. ", " .. nArmor .. ", " .. nWeapon .. ", " .. nHorse .. ", " .. nMaskNPC)
end

function feature_item()
    GiveItemUI("Thay ®æi ngo¹i h×nh trang bŞ",
        "H·y ®Æt vµo 1 trang bŞ muèn thay ®æi. L­u ı ngo¹i h×nh míi vÉn tån t¹i sau khi tho¸t game.",
        "feature_item_confirm", "onCancel", 1);
end

function feature_item_confirm(nCount)
    if nCount > 1 then
        Talk(1, "", "Qu¸ nhiÒu trang bŞ, kh«ng thÓ xö lİ")
        return
    elseif nCount == 1 then
        local nItemIndex = GetGiveItemUnit(1)
        g_AskClientNumberEx(1, 500, "NhËp ID muèn ®æi:", {SetItemNewFeature, {nItemIndex}})
        -- SetItemNewFeature(nItemIndex, nNo)
    end
end
