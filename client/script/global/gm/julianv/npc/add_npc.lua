dialognpc_julianv = {}
tbDialog_NPC = {
    npc_dotim = {
        { 2526, 53, 1604, 3204, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
          "NPC �� T�m" },
        { 2526, 11, 3147, 5077, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
          "NPC �� T�m" },
        { 2526, 78, 1571, 3237, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
          "NPC �� T�m" },
        { 2526, 1, 1609, 3198, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua", "NPC �� T�m" },
        {
            2526, 162, 1629, 3156, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
            "NPC �� T�m",
        },
        { 2526, 37, 1718, 3084, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
          "NPC �� T�m" },
        { 2526, 80, 1785, 3033, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua",
          "NPC �� T�m" },
    },
}

npc_cocgo = {
    { 2521, 95, 0, 53, 1550, 3265, 0, "C�c g� Si�u C�p", 0, "" },
    { 2521, 95, 0, 53, 1553, 3269, 0, "C�c g� Si�u C�p", 0, "" },
    { 2521, 95, 0, 53, 1547, 3270, 0, "C�c g� Si�u C�p", 0, "" },
}

boss_luyen_cong = {}
for i = 1590, 1630 do
    tinsert(boss_luyen_cong, { i - 235, 95, 5, 996, i, i * 2, 0, "NPC Luy�n C�ng", 1, " " })
end

function boss_luyen_cong:add( Tab1 )
    for i = 1, getn(Tab1) do
        Mid = SubWorldID2Idx(Tab1[i][4]);
        if (Mid >= 0) then
            TabValue5 = Tab1[i][5] * 32
            TabValue6 = Tab1[i][6] * 32
            newmonsterindex = AddNpc(Tab1[i][1], Tab1[i][2], Mid, TabValue5, TabValue6, Tab1[i][7],
                                  Tab1[i][8], Tab1[i][11]);
            SetNpcScript(newmonsterindex, Tab1[i][10]);
        end
    end
end

function dialognpc_julianv:init() --
    for _, tbNpc in tbDialog_NPC do --
        for _, npc in tbNpc do --
            tinsert(dialognpc_julianv, npc)
        end
    end
end
dialognpc_julianv:init()

function dialognpc_julianv:add()
    add_dialognpc(dialognpc_julianv)
    add_newtasknpc(npc_cocgo, "Hit me")
    boss_luyen_cong:add(boss_luyen_cong)
end