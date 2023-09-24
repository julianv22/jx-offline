-- So thu tu NPC la so trong npcs.xlss - 2
dialognpc_thinh = {{1393, 53, 1631, 3172, "\\script\\global\\thinh\\npc\\npc_trangbi.lua", "NPC Trang B�"},
                   {1393, 78, 1589, 3286, "\\script\\global\\thinh\\npc\\npc_trangbi.lua", "NPC Trang B�"},
                   {173, 53, 1635, 3177, "\\script\\global\\thinh\\npc\\npc_vocong.lua", "NPC V� C�ng"},
                   {2129, 53, 1622, 3168, "\\script\\global\\thinh\\rskinhmach\\rskinhmach.lua", "NPC Kinh m�ch"},
                   {1282, 78, 1606, 3224, "\\script\\global\\thinh\\hotro\\functions_partner_task.lua",
                    "Nhi�m v� B�n ��ng H�nh"}}

ketrom = {{1261, 0, 53, 1430, 3404, "K� Tr�m Ch�n Nguy�n 1"},
          {1262, 1, 53, 1438, 3404, "K� Tr�m Ch�n Nguy�n 2"},
          {1263, 2, 53, 1434, 3419, "K� Tr�m Ch�n Nguy�n 3"},
          {1264, 4, 53, 1435, 3398, "K� Tr�m Ch�n Nguy�n 4"},
          {1265, 3, 53, 1456, 3430, "K� Tr�m Ch�n Nguy�n 5"},
          {1266, 4, 53, 1442, 3423, "K� Tr�m Ch�n Nguy�n 6"},
          {1362, 0, 53, 1446, 3408, "K� Tr�m Ch�n Nguy�n 7"},
          {1363, 2, 53, 1446, 3395, "K� Tr�m Ch�n Nguy�n 8"},
          {1367, 4, 53, 1437, 3415, "K� Tr�m Ch�n Nguy�n 9"},
          {1261, 0, 53, 1435, 3423, "K� Tr�m Ch�n Nguy�n 10"},
          {1262, 1, 53, 1422, 3420, "K� Tr�m Ch�n Nguy�n 11"},
          {2478, 1, 53, 1454, 3430, "K� Tr�m Ch�n Nguy�n 12"},
          {2479, 1, 53, 1425, 3410, "K� Tr�m Ch�n Nguy�n 13"}}

function add_npc_thinh()
    add_dialognpc(dialognpc_thinh) -- c� s�n trong autoexec.lua
    add_npc_fight(ketrom, "\\script\\global\\thinh\\rskinhmach\\npcdeath.lua")
end

function add_npc_fight(tab1, link_script)
    if link_script ~= 0 then
        for i = 1, getn(tab1) do
            Mid = SubWorldID2Idx(tab1[i][3])
            npc_index = AddNpcEx(tab1[i][1], 95, tab1[i][2], Mid, tab1[i][4] * 32, tab1[i][5] * 32, 0, tab1[i][6], 0)
            SetNpcDeathScript(npc_index, link_script)
        end
    else
        for i = 1, getn(tab1) do
            Mid = SubWorldID2Idx(tab1[i][3])
            npc_index = AddNpcEx(tab1[i][1], 95, tab1[i][2], Mid, tab1[i][4] * 32, tab1[i][5] * 32, 0, tab1[i][6], 0)
        end
    end
end
