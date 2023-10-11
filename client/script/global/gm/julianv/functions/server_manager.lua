------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function JulianV:Choose_Boss_Dialog()
    if GetLevel() < 90 then
        Talk(1, "",
            "��ng c�p c�a ng��i qu� th�p kh�ng th� s� d�ng ch�c n�ng n�y <pic=15>\nH�y t�ng l�n c�p <color=yellow>90<color> r�i quay l�i nh�<pic=46>")
    else
        local tbOpt = {
            { "Boss Ti�u - ��i Ho�ng Kim", JulianV.Boss_HK },
            { "Boss Ho�ng Kim M�n Ph�i", JulianV.FactionBoss },
            { "Boss Cao th� V� l�m", JulianV.Boss_CaoThu },
        }
        JDialog:Show(tbOpt, JulianV.Server_Dialog)
    end
end

function JulianV:Boss_CaoThu()
    local tbOpt = {}
    for i = 1, getn(tbAdvancedBoss) do
        tinsert(tbOpt, { tbAdvancedBoss[i].szName, JulianV.Call_Boss, { tbAdvancedBoss, i } })
    end
    JDialog:Show(tbOpt, JulianV.Choose_Boss_Dialog, "M�i <sex>ch�n Boss mu�n g�i<pic=46><color>")
end

function JulianV:FactionBoss()
    local tbOpt = {}
    for i = 1, getn(tbFactionBoss) do
        tinsert(tbOpt, { tbFactionBoss[i].szName, JulianV.Call_Boss, { tbFactionBoss, i } })
    end
    JDialog:Show(tbOpt, JulianV.Choose_Boss_Dialog, "M�i <sex>ch�n Boss mu�n g�i<pic=46>}}")
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
    if nPage > 1 then tinsert(tbOpt, { "Trang tr��c", JulianV.Boss_HK, { nPage - 1 } }) end
    JDialog:Show(tbOpt, nil, "M�i <sex>ch�n Boss mu�n g�i<pic=46>}}\n\n" ..
        strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end

function JulianV:Call_Boss( nIndex )
    if GetFightState() == 0 then
        Talk(1, "", "Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
        return
    end
    local Boss = self[nIndex];
    local nw, nx, ny = GetWorldPos();
    local clBoss = AddNpcEx(Boss.nBossId, Boss.nLevel, Boss.nSeries, SubWorldID2Idx(nw), nx * 32,
                       ny * 32, 1, Boss.szName, 1);
    SetNpcDeathScript(clBoss, "\\script\\missions\\boss\\bosstieu.lua")
    SetNpcParam(clBoss, 1, Boss.nBossId); -- l�u id boss.
    SetNpcTimer(clBoss, 120 * 60 * 18)
    local W, X, Y = GetWorldPos();
    str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s (%d,%d)<color>",
              Boss.szName, SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))
    local handle = OB_Create();
    ObjBuffer:PushObject(handle, str)
    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
    OB_Release(handle)
end
