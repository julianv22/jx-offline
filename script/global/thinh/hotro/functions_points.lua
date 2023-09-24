Include("\\script\\global\\fuyuan.lua") -- de nhan phuc duyen
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
    local tbSay = {"��i hi�p mu�n nh�n lo�i �i�m n�o?"}
    tinsert(tbSay, "N�ng c�p ��/dangcap")
    tinsert(tbSay, "Danh v�ng v� ph�c duy�n/danhvong")
    tinsert(tbSay, "Ti�n v�n/tien")
    tinsert(tbSay, "Ti�n ��ng/tiendong")
    tinsert(tbSay, "�i�m Ch�n Nguy�n v� H� M�ch ��n/channguyen")
    tinsert(tbSay, "�i�m Ti�m N�ng/pointtiemnang")
    tinsert(tbSay, "�i�m K� N�ng/pointkynang")
    tinsert(tbSay, "T�i l�nh ��o/tailanhdao")
    tinsert(tbSay, "�i�m c�ng hi�n/conghien")
    tinsert(tbSay, "Tr� l�i/main")
    tinsert(tbSay, "K�t th�c ��i tho�i./no")
    CreateTaskSay(tbSay)
end

------------C�p-------------------
function dangcap()
    AskClientForNumber("level", 0, 200, "Nh�p C�p ��:")
end

function level(num)
    local nCurLevel = GetLevel()
    local nAddLevel = num - nCurLevel
    ST_LevelUp(nAddLevel)
    Msg2Player("B�n nh�n ���c c�p �� <color=yellow>" .. num .. "<color>.")
end

function danhvong()
    AskClientForNumber("danhvongINPUT", 0, 100000, "Nh�p S� L��ng:")
end

function danhvongINPUT(nNum)
    AddRepute(nNum)
    FuYuan_Start()
    FuYuan_Add(nNum)
    Msg2Player(" B�n nh�n ���c " .. nNum .. " �i�m Danh V�ng.")
end

function tien()
    AskClientForNumber("tienvan", 0, 1000, "Nh�p S� L��ng:")
end
function tienvan(slkv)
    local money = slkv * 10000
    Earn(money)
    Msg2Player(format("B�n nh�n ���c <color=yellow>%d v�n<color>.", slkv))
end

----------------�i�m K� N�ng----------------------------------------
function pointkynang()
    AskClientForNumber("pointkynang1", 0, 1000, "Nh�p S� L��ng:")
end
function pointkynang1(nNum)
    AddMagicPoint(nNum) ---Nh�n �i�m k� n�ng
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m K� N�ng.")
end
------------------�i�m Ti�m N�ng--------------------------------------
function pointtiemnang()
    AskClientForNumber("pointtiemnang1", 0, 1000000, "Nh�p S� L��ng:")
end
function pointtiemnang1(nNum)
    AddProp(nNum) ---Nh�n �i�m ti�m n�ng
    Msg2Player("B�n nh�n ���c <color=yellow>" .. nNum .. "<color> �i�m Ti�m N�ng.")
end

---Tien Dong---
function tiendong()
    AskClientForNumber("tiendong1", 0, 1000, "Nh�p S� L��ng:")
end
function tiendong1(sltiendong)
    AddStackItem(sltiendong, 4, 417, 1, 1, 0, 0, 0)
    Msg2Player("B�n nh�n ���c <color=yellow>" .. sltiendong .. " <color>ti�n ��ng.")
end
------------T�i L�nh ��o----------------------------
function tailanhdao()
    for i = 1, 250 do
        AddLeadExp(1000000000)
    end
    Msg2Player("B�n nh�n ���c 100 c�p t�i l�nh ��o");
end
------------�i�m C�ng Hi�n----------------------------
function conghien()
    AddContribution(1000000);
    Msg2Player("B�n nh�n ���c 1.000.000 �i�m c�ng hi�n")
end

function channguyen()
    for i = 1, 5 do
        SetTask(4000, GetTask(4000) + 12000)
        for i = 1, 12 do
            AddStackItem(500, 6, 1, 3203, 0, 0, 0)
        end
    end
    Msg2Player(
        "B�n nh�n ���c <color=yellow>60000<color> Ch�n Nguy�n v� <color=yellow>30000<color> H� M�ch ��n")
end
