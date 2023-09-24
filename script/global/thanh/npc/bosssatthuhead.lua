-------------------------------------------------------------------------
IncludeLib("NPCINFO")
IncludeLib("ITEM")
function OnDeath(nNpcIndex)
    kill_level20(nNpcIndex)
end

-----------------------------------------------------------------------

function kill_level20(nNpcIndex)
    local nNpcSign = GetNpcParam(nNpcIndex, 1);
    if (nNpcSign >= 1 and nNpcSign <= 20) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev20.ini", 0, 4, nseries);
    end
    if (nNpcSign >= 21 and nNpcSign <= 40) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev30.ini", 0, 5, nseries);
    end
    if (nNpcSign >= 41 and nNpcSign <= 60) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev40.ini", 0, 6, nseries);
    end
    if (nNpcSign >= 61 and nNpcSign <= 80) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev50.ini", 0, 7, nseries);
    end
    if (nNpcSign >= 81 and nNpcSign <= 100) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev60.ini", 0, 8, nseries);
    end
    if (nNpcSign >= 101 and nNpcSign <= 120) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev70.ini", 0, 9, nseries);
    end
    if (nNpcSign >= 121 and nNpcSign <= 140) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev80.ini", 0, 10, nseries);
    end
    if (nNpcSign >= 141 and nNpcSign <= 160) then
        ITEM_DropRateItem(nNpcIndex, 1, "\\settings\\droprate\\boss\\bosstask_lev90.ini", 0, 10, nseries);
    end
    add_expforkiller(nNpcSign);
end

-----------------------------------------------------------------------

function add_expforkiller(nvalue)
    if (nvalue >= 1) and (nvalue <= 20) then
        AddOwnExp(15000)
    elseif (nvalue >= 21) and (nvalue <= 40) then
        AddOwnExp(30000)
    elseif (nvalue >= 41) and (nvalue <= 60) then
        AddOwnExp(60000)
    elseif (nvalue >= 61) and (nvalue <= 80) then
        AddOwnExp(120000)
    elseif (nvalue >= 81) and (nvalue <= 100) then
        AddOwnExp(240000)
    elseif (nvalue >= 101) and (nvalue <= 120) then
        AddOwnExp(480000)
    elseif (nvalue >= 121) and (nvalue <= 140) then
        AddOwnExp(1000000)
    elseif (nvalue >= 141) and (nvalue <= 160) then
        AddOwnExp(2000000)
        -- AddExp_Skill_Extend(140000);
    end
end
