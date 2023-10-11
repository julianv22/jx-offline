------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function JulianV:Choose_Boss_Dialog()
    if GetLevel() < 90 then
        Talk(1, "",
            "§¼ng cÊp cña ng­¬i qu¸ thÊp kh«ng thÓ sö dông chøc n¨ng nµy <pic=15>\nH·y t¨ng lªn cÊp <color=yellow>90<color> råi quay l¹i nhÐ<pic=46>")
    else
        local tbOpt = {
            { "Boss TiÓu - §¹i Hoµng Kim", JulianV.Boss_HK },
            { "Boss Hoµng Kim M«n Ph¸i", JulianV.FactionBoss },
            { "Boss Cao thñ Vâ l©m", JulianV.Boss_CaoThu },
        }
        JDialog:Show(tbOpt, JulianV.Server_Dialog)
    end
end

function JulianV:Boss_CaoThu()
    local tbOpt = {}
    for i = 1, getn(tbAdvancedBoss) do
        tinsert(tbOpt, { tbAdvancedBoss[i].szName, JulianV.Call_Boss, { tbAdvancedBoss, i } })
    end
    JDialog:Show(tbOpt, JulianV.Choose_Boss_Dialog, "Mêi <sex>chän Boss muèn gäi<pic=46><color>")
end

function JulianV:FactionBoss()
    local tbOpt = {}
    for i = 1, getn(tbFactionBoss) do
        tinsert(tbOpt, { tbFactionBoss[i].szName, JulianV.Call_Boss, { tbFactionBoss, i } })
    end
    JDialog:Show(tbOpt, JulianV.Choose_Boss_Dialog, "Mêi <sex>chän Boss muèn gäi<pic=46>}}")
end

function JulianV:Boss_HK()
    local nPage = self
    local tbBossHK = JDialog:PhanTrang(tbBoss, 11)
    local tbOpt = {}
    if not nPage then nPage = 1 end
    local nCount = getn(tbBossHK)
    if nPage < nCount then
        for i = 1, 11 do
            tinsert(tbOpt, { tbBossHK[nPage][i].szName, JulianV.Call_Boss, { tbBossHK[nPage], i } })
        end
        tinsert(tbOpt, { "Trang sau", JulianV.Boss_HK, { nPage + 1 } })
    else
        for i = 1, getn(tbBossHK[nCount]) do
            tinsert(tbOpt,
                { tbBossHK[nCount][i].szName, JulianV.Call_Boss, { tbBossHK[nCount], i } })
        end
    end
    if nPage > 1 then tinsert(tbOpt, { "Trang tr­íc", JulianV.Boss_HK, { nPage - 1 } }) end
    JDialog:Show(tbOpt, nil, "Mêi <sex>chän Boss muèn gäi<pic=46>}}\n\n" ..
        strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end

function JulianV:Call_Boss( nIndex )
    if GetFightState() == 0 then
        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")
        return
    end
    local Boss = self[nIndex];
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
