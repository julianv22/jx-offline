tbBoss = {}
for i = 1590, 1630 do
    tinsert(tbBoss, { i - 235, 95, 5, 996, i, i * 2, 0, "NPC LuyÖn C«ng", 1, " " })
end

function add_boss_bailuyencong( Tab1 )
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
