Include("\\script\\dailogsys\\dailogsay.lua");

TRANGBIHIEM = {
    ["V� Li�t"] = {5953, 5957},
    ["C� S�n"] = {6705, 6716},
    ["Th�n M�"] = {5933, 5938},
    ["Trang S�c Nh�m Ti�u Dao"] = {6262, 6282},
    ["Ho�ng Kim �n"] = {5930, 5932}
    -- ["M�t N�"] 			= 	{5658, 5669},
}

TRANGBIHOANGKIM = {
    ["Thi�n Ho�ng"] = {168, 176},
    ["Kim Phong"] = {177, 185},
    ["Hi�p C�t"] = {186, 189},
    ["Nhu T�nh"] = {190, 193},
    ["��nh Qu�c"] = {159, 163},
    ["An Bang"] = {164, 167},
    ["Kim Quang"] = {194, 203},
    ["C�p Nh�n V� Danh"] = {141, 142},
    ["��ng S�t"] = {143, 146},
    ["H�ng �nh"] = {204, 207},
    ["Nh�n EXP Th� T�c"] = {378, 379}
};

--------------------------------------------------
function TrangBiHiem()
    if (CalcFreeItemCellCount() < 20) then
        Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
        return
    end

    local tb_Equip = TRANGBIHIEM
    local szTitle = "B�n mu�n nh�n trang b� n�o?";
    local tbOption = {}
    for x, y in tb_Equip do
        tinsert(tbOption, format("Trang b� %s/#AddEquipGold_confirm(%d,%d)", x, tb_Equip[x][1], tb_Equip[x][2])) -- , AddEquipGoldOtherConfirm,{tb_Equip[x]}})
    end
    tinsert(tbOption, "Tr� l�i/main")
    tinsert(tbOption, "Tho�t./no")
    Say(szTitle, getn(tbOption), tbOption)
    -- CreateNewSayEx(szTitle, tbOption)
end
-------------------------------------------------------

function TrangBiHoangKimThuong()
    if (CalcFreeItemCellCount() < 20) then
        Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
        return
    end

    local tb_Equip = TRANGBIHOANGKIM
    local szTitle = "B�n mu�n nh�n trang b� n�o?";
    local tbOption = {}
    for x, y in tb_Equip do
        tinsert(tbOption, format("Trang b� %s/#AddEquipGold_confirm(%d,%d)", x, tb_Equip[x][1], tb_Equip[x][2])) -- , AddEquipGoldOtherConfirm,{tb_Equip[x]}})
    end
    tinsert(tbOption, "Tr� l�i/main")
    tinsert(tbOption, "Tho�t./no")
    Say(szTitle, getn(tbOption), tbOption)
end

function AddEquipGold_confirm(num1, num2)
    if (num2 - num1) <= 30 then
        for nID = num1, num2 do
            AddGoldItem(0, nID)
        end
    else
        Talk(1, "", "Kh�ng th� nh�n qu� nhi�u trang b� 1 l�c.")
    end
end
