dialognpc_julianv = {
    { 2526, 53, 1604, 3204, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua", "NPC �� T�m" },
}

newtasknpc_julianv {
    { 2521, 95, 0, 53, 1550, 3265, 0, "C�c g� Si�u C�p", 0, "" },
    { 2521, 95, 0, 53, 1553, 3269, 0, "C�c g� Si�u C�p", 0, "" },
    { 2521, 95, 0, 53, 1547, 3270, 0, "C�c g� Si�u C�p", 0, "" },
}

function add_new_npc_julianv()
    add_dialognpc(dialognpc_julianv)
    add_newtasknpc(newtasknpc_julianv, "Hit me!")
end
