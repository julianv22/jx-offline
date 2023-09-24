-- NPC Ke trom kinh mach -- Thinh Nguyen
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
    local tbAwardgive = {{
        szName = "�i�m Kinh Nghi�m",
        nExp = 5e6
    }, {
        szName = "Ch�n nguy�n ��n",
        tbProp = {6, 1, 4804, 0, 0, 0},
        nCount = 1
    }, {
        szName = "H� m�ch ��n",
        tbProp = {6, 1, 3203, 0, 0, 0},
        nCount = 50
    }, {
        szName = "��i h� m�ch ��n",
        tbProp = {6, 1, 4418, 0, 0, 0},
        nCount = 1
    }}
    tbAwardTemplet:GiveAwardByList(tbAwardgive, "Nhi�m v� reset kinh m�ch, KillBossExp")
end
