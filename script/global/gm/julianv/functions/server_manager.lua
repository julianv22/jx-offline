------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function Choose_Boss_Dialog()
    if GetLevel() < 90 then
        Talk(1, "",
            "§¼ng cÊp cña ng­¬i qu¸ thÊp kh«ng thÓ sö dông chøc n¨ng nµy <pic=15>\nH·y t¨ng lªn cÊp <color=yellow>90<color> råi quay l¹i nhÐ<pic=46>")
    else
        local tbOpt = {
            { "Boss TiÓu - §¹i Hoµng Kim", Boss_HK },
            { "Boss Hoµng Kim M«n Ph¸i", Boss_HKMP }, { "Boss Cao thñ Vâ l©m", Boss_CaoThu },
        }
        tbDialog:Show(tbOpt, main)
    end
end

function Boss_CaoThu()
    local tbOpt = {}
    for i = 1, getn(tbAdvancedBoss) do
        tinsert(tbOpt, { tbAdvancedBoss[i].szName, Call_Boss, { tbAdvancedBoss, i } })
    end
    tbDialog:Show(tbOpt, Choose_Boss_Dialog, "Mêi <sex>chän Boss muèn gäi<pic=46><color>")
end

function Boss_HKMP()
    local tbOpt = {}
    for i = 1, getn(tbFactionBoss) do
        tinsert(tbOpt, { tbFactionBoss[i].szName, Call_Boss, { tbFactionBoss, i } })
    end
    tbDialog:Show(tbOpt, Choose_Boss_Dialog, "Mêi <sex>chän Boss muèn gäi<pic=46><color>")
end

function Boss_HK( nPage )
    local tbBossHK = JDialog:PhanTrang(tbBoss, 11)
    local tbOpt = {}
    if not nPage or nPage == 1 then
        for i = 1, 11 do
            tinsert(tbOpt, { tbBossHK[1][i].szName, Call_Boss, { tbBossHK[1], i } })
        end
        tinsert(tbOpt, { "Trang sau", Boss_HK, { 2 } })
    else
        local nCount = getn(tbBossHK)
        if nPage < nCount then
            for i = 1, 11 do
                tinsert(tbOpt, { tbBossHK[nPage][i].szName, Call_Boss, { tbBossHK[nPage], i } })
            end
            tinsert(tbOpt, { "Trang sau", Boss_HK, { nPage + 1 } })
        else
            for i = 1, getn(tbBossHK[nCount]) do
                tinsert(tbOpt, { tbBossHK[nCount][i].szName, Call_Boss, { tbBossHK[nCount], i } })
            end
        end
        if nPage > 1 then tinsert(tbOpt, { "Trang tr­íc", Boss_HK, { nPage - 1 } }) end
    end

    tbDialog:Show(tbOpt, nil, "Mêi <sex>chän Boss muèn gäi<pic=46><color>")
end

function Call_Boss( tbBoss, nIndex )
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local Boss = tbBoss[nIndex];
    local nw, nx, ny = GetWorldPos();
    local clBoss = AddNpcEx(Boss.nBossId, Boss.nLevel, Boss.nSeries, SubWorldID2Idx(nw), nx * 32,
                       ny * 32, 1, Boss.szName, 1);
    SetNpcDeathScript(clBoss, "\\script\\missions\\boss\\bosstieu.lua")
    SetNpcParam(clBoss, 1, Boss.nBossId); -- l­u id boss.
    SetNpcTimer(clBoss, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",
              Boss.szName, SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
