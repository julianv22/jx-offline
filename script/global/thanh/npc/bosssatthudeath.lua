IncludeLib("ITEM")
IncludeLib("NPCINFO")
function OnDeath(nNpcIndex)
    kill_level(nNpcIndex)
end
function kill_level(nNpcIndex)
    local nNpcSign = GetNpcParam(nNpcIndex, 1);
    local nseries = NPCINFO_GetSeries(nNpcIndex)
    ITEM_DropRateItem(nNpcIndex, 20, "\\settings\\droprate\\boss\\bosstask_lev90.ini", 0, 10, nseries);
end
