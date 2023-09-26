dialognpc_julianv = {
    { 2526, 53, 1604, 3204, "\\script\\global\\gm\\julianv\\npc\\npc_dotim.lua", "NPC §å TÝm" },
}

newtasknpc_julianv {
    { 2521, 95, 0, 53, 1550, 3265, 0, "Céc gç Siªu CÊp", 0, "" },
    { 2521, 95, 0, 53, 1553, 3269, 0, "Céc gç Siªu CÊp", 0, "" },
    { 2521, 95, 0, 53, 1547, 3270, 0, "Céc gç Siªu CÊp", 0, "" },
}

function add_new_npc_julianv()
    add_dialognpc(dialognpc_julianv)
    add_newtasknpc(newtasknpc_julianv, "Hit me!")
end
