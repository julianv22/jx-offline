------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\common.lua")
IncludeLib("SETTING")
IncludeLib("FILESYS")
Include(safeshow("/script/global/gm/julianv/lib/lib_quest.lua"))
Include(safeshow("/script/global/gm/julianv/functions/dialog_fun.lua"))

QSupport = {
    szTitle = {
        "C�m nang ��c bi�t gi�p d�ch chuy�n nhanh c�c ��a �i�m l�m nhi�m v�.\n\nHo�n th�nh nhi�m v� <sex>s� nh�n ���c nh�ng ph�n th��ng x�ng ��ng",
        {
            "M�i <sex>ch�n th�n tr�n mu�n l�m nhi�m v�<pic=46></g>",
            "M�i <sex>ch�n nhi�m v�<pic=46></g>",
        }, --
        "Di chuy�n ��n v� tr� l�m nhi�m v� m�n ph�i {{",
        "Di chuy�n ��n v� tr� l�m nhi�m v� {{Ho�ng Kim}} ",
    },

    tbThonTran = {
        List = {
            "Ba L�ng Huy�n", "Giang T�n Th�n", "V�nh L�c Tr�n", "Chu Ti�n Tr�n",
            "��o H��ng Th�n", "Long M�n Tr�n", "Th�ch C� Tr�n", "Long Tuy�n Th�n",
        },
        [1] = {
            "Thu�c cho cha Ti�u Ng�", "H�i m�n c�a A Ph��ng",
            "Con trai c�a C� L�o Th�i",
        },
        [2] = { "H� T� b�i s�", "Thu�c cho Ng� L�o gia", "C�y n� c�a H� T�" },
        [3] = { "��i s�ch", "Ng�u Ng�u mu�n l�m ��i hi�p", "Chuy�n qu�t trao t�nh" },
        [4] = { "Khuy�n L�o Chu v� nh�", "Kh�n uy�n ��ng", "Chi�c v�ng c�a Song Song" },
        [5] = { "�i t�m Ti�u Long", "T� Trung b�o qu�c", "X� h��ng H� c�t cao" },
        [6] = { "Gi�i thi�u c�ng vi�c", "Chuy�n tin", "�i gi�t heo r�ng" },
        [7] = { "��a c�m", "Tr� ti�n", "Chi�c nh�n c�a A Kinh" },
        [8] = {
            "Cha d��ng c� t�t kh�ng?", "Gi�p B�nh Ph�ng s�a �ao",
            "Canh D��ng Xu�n B�ch Tuy�t",
        },
    },

    tbListMP = {
        [0] = "Thi�u L�m",
        [1] = "Thi�n V��ng Bang",
        [2] = "���ng M�n",
        [3] = "Ng� ��c",
        [4] = "Nga My",
        [5] = "Th�y Y�n",
        [6] = "C�i Bang",
        [7] = "Thi�n Nh�n Gi�o",
        [8] = "V� �ang",
        [9] = "C�n L�n",
        [10] = "Hoa S�n",
    },

    tbMonPhai = {
        [1] = "Nhi�m v� c�p 10 ",
        [2] = "Nhi�m v� c�p 20 ",
        [3] = "Nhi�m v� c�p 30 ",
        [4] = "Nhi�m v� c�p 40 ",
        [5] = "Nhi�m v� c�p 50 ",
        [6] = "Nhi�m v� xu�t s� ",
        [7] = "Nhi�m v� tr�ng ph�n s� m�n ",
        [8] = "Nhi�m v� c�p 90 ",
        [10] = "Nhi�m v� k� danh �� t� ",
    },

    tbGoldenList = {
        [1] = " <color=orange>Ch�nh ph�i<color>",
        [2] = " <g>Trung l�p</g>",
        [3] = " <color=pink>T� ph�i<color>",
        ["Ch�nh tuy�n"] = {
            [1] = "Nhi�m v� ch�nh tuy�n c�p 20",
            [2] = "Nhi�m v� ch�nh tuy�n c�p 30",
            [3] = "Nhi�m v� ch�nh tuy�n c�p 40",
            [4] = "Nhi�m v� ch�nh tuy�n c�p 50",
            [5] = "Nhi�m v� ch�nh tuy�n c�p 60",
        },
        ["Ph� tuy�n"] = {
            [1] = "Nhi�m v� ph� tuy�n c�p 20-29",
            [2] = "Nhi�m v� ph� tuy�n c�p 30-39",
            [3] = "Nhi�m v� ph� tuy�n c�p 40-49",
            [4] = "Nhi�m v� ph� tuy�n c�p 50-59",
        },
    },
}

function main()
    dofile("script/global/gm/julianv/functions/quest_support.lua")
    dofile("script/global/gm/julianv/lib/lib_quest.lua")
    local tbOpt = {
        { "Nhi�m v� Th�n tr�n", QSupport.Village_Dialog },
        { "Nhi�m v� M�n ph�i", QSupport.Faction_Dialog },
        { "Nhi�m v� Ho�ng Kim", QSupport.Golden_Dialog },
    }
    JDialog:Show(tbOpt, nil, QSupport.szTitle[1])
    return 1
end
--------------------------NV Th�n Tr�n--------------------------
function QSupport:Village_Dialog()
    local tbOpt = {}
    if not self then
        for i = 1, getn(QSupport.tbThonTran.List) do
            tinsert(tbOpt, { QSupport.tbThonTran.List[i], QSupport.Village_Dialog, { i } })
        end
    else
        for i = 1, getn(QSupport.tbThonTran[self]) do
            tinsert(tbOpt, {
                i .. "." .. QSupport.tbThonTran[self][i], QSupport.VillageQuest, { self, i },
            })
        end
    end
    JDialog:Show(tbOpt, self and QSupport.Village_Dialog or main,
        QSupport.szTitle[2][self and 2 or 1])
end

function QSupport:VillageQuest( nQuestId )
    local szTitle = tbVillageQuest[self][nQuestId][1][1]
    local tbOpt = {}
    for step, quest in tbVillageQuest[self][nQuestId] do
        if step > 1 then
            local tbPosition = pack(quest[2], quest[4], quest[5], quest[6])
            tinsert(tbOpt, { step - 1 .. "." .. quest[1], QSupport.MoveTo, tbPosition })
        end
    end
    JDialog:Show(tbOpt, QSupport.Village_Dialog, szTitle)
end

function QSupport.MoveTo( ... )
    local nFightState, nMapId, nPosX, nPosY = unpack(arg)
    NewWorld(nMapId, nPosX, nPosY)
    SetFightState(nFightState)
end
--------------------------NV M�n Ph�i--------------------------
function QSupport:Faction_Dialog()
    local nFaction = GetLastFactionNumber()
    if nFaction < 0 then
        Talk(1, "", "Xin h�y gia nh�p m�n ph�i �� s� d�ng ch�c n�ng n�y<pic=46>")
        return
    elseif nFaction > 10 then
        Talk(1, "", "Hi�n t�i ch�a ph�t tri�n nhi�m v� m�n ph�i n�y<pic=46>")
        return
    end
    local szFacName = QSupport.tbListMP[nFaction]
    local tbOpt = {}
    for id, quest in QSupport.tbMonPhai do
        tinsert(tbOpt, { quest .. szFacName, QSupport.FactionQuest, { nFaction, id } })
    end
    JDialog:Show(tbOpt, main, QSupport.szTitle[3] .. szFacName .. "}}")
end

function QSupport:FactionQuest( nLevel, nPage )
    local nFaction = self
    nPage = nPage or 1
    local szFacName = QSupport.tbListMP[nFaction]
    local szQuestName = QSupport.tbMonPhai[nLevel] .. szFacName
    local tbQuestInfo = tbFactionQuest[nFaction][nLevel]
    local szTitle = tbQuestInfo[1]
    local nStep, tbOpt = getn(tbQuestInfo), {}
    if nStep <= 10 then -- N�u s� b��c th�c hi�n <= 10
        for i = 2, nStep do
            local tbPosition = pack(tbQuestInfo[i][3], tbQuestInfo[i][5], tbQuestInfo[i][6],
                                   tbQuestInfo[i][7], szQuestName, i - 1, tbQuestInfo[i][1])
            tinsert(tbOpt,
                { i - 1 .. "." .. tbQuestInfo[i][1], QSupport.FactionQuest_MoveTo, tbPosition })
        end
    else -- N�u s� b��c th�c hi�n > 10
        tbQuestInfo = JDialog:PhanTrang(tbQuestInfo, 10)
        local nCount = getn(tbQuestInfo)
        for i = 1, getn(tbQuestInfo[nPage]) do
            local nStep = nPage == 1 and (i - 1) or ((nPage - 1) * 10 + i - 1)
            local tbPosition = pack(tbQuestInfo[nPage][i][3], tbQuestInfo[nPage][i][5],
                                   tbQuestInfo[nPage][i][6], tbQuestInfo[nPage][i][7], szQuestName,
                                   nStep, tbQuestInfo[nPage][i][1])
            if nPage == 1 then
                if i > 1 then
                    tinsert(tbOpt, {
                        i - 1 .. "." .. tbQuestInfo[nPage][i][1], QSupport.FactionQuest_MoveTo,
                        tbPosition,
                    })
                end
            else
                tinsert(tbOpt, {
                    (nPage - 1) * 10 + i - 1 .. "." .. tbQuestInfo[nPage][i][1],
                    QSupport.FactionQuest_MoveTo, tbPosition,
                })
            end
        end
        if nPage < nCount then
            tinsert(tbOpt, { "Trang sau", QSupport.FactionQuest, { nFaction, nLevel, nPage + 1 } })
        end
        if nPage > 1 then
            tinsert(tbOpt,
                { "Trang tr��c", QSupport.FactionQuest, { nFaction, nLevel, nPage - 1 } })
        end
    end
    JDialog:Show(tbOpt, QSupport.Faction_Dialog, szTitle)
end

function QSupport.FactionQuest_MoveTo( ... )
    local nFightState, nMapId, nPosX, nPosY, szQuestName, nStep, szQuestContent = unpack(arg)
    GMMsg2Player("B��c " .. nStep, "<color=yellow>" .. szQuestName ..
        "<color>\nN�i dung: <color=green>" .. szQuestContent)
    AddNote("N�i dung nhi�m v�: <color=green>" .. nStep .. "<color>")
    NewWorld(nMapId, nPosX, nPosY)
    SetFightState(nFightState)
end
--------------------------NV Ho�ng Kim--------------------------
function QSupport:Golden_Dialog( szQuestType )
    szQuestType = szQuestType or ""
    local tbOpt, nQuestType = {}, self
    if not nQuestType then
        tbOpt = {
            { "Ch�nh tuy�n", QSupport.Golden_Dialog, { 1, "Ch�nh tuy�n" } },
            { "Ph� tuy�n", QSupport.Golden_Dialog, { 2, "Ph� tuy�n" } },
        }
    else
        tbOpt = {
            {
                "Ch�nh ph�i - B� m�t T�m Long H�i", QSupport.GoldenQuest,
                { nQuestType, 1, szQuestType },
            }, {
                "Trung l�p - C�u chuy�n L�m Uy�n Nhai", QSupport.GoldenQuest,
                { nQuestType, 2, szQuestType },
            },
            { "T� ph�i - Long Kh� chi ho�", QSupport.GoldenQuest,
              { nQuestType, 3, szQuestType } },
        }
    end
    JDialog:Show(tbOpt, nQuestType and QSupport.Golden_Dialog or main,
        QSupport.szTitle[4] .. szQuestType)
end

function QSupport:GoldenQuest( nCamp, szQuestType )
    local tbOpt = {}
    for i = 1, getn(QSupport.tbGoldenList[szQuestType]) do
        tinsert(tbOpt, {
            QSupport.tbGoldenList[szQuestType][i], QSupport.GoldenQuestStep,
            { self, szQuestType, nCamp, i },
        })
    end
    JDialog:Show(tbOpt, QSupport.Golden_Dialog,
        QSupport.szTitle[4] .. szQuestType .. QSupport.tbGoldenList[nCamp])
end

function QSupport:GoldenQuestStep( ... )
    local nQuestType = self
    local szQuestType, nCamp, nLevel = unpack(arg)
    local tbQuestInfo = tbGoldenQuest[nQuestType][nCamp][nLevel]
    local tbOpt = {}
    for i = 1, getn(tbQuestInfo) do
        local tbPosition = pack(tbQuestInfo[i][2], tbQuestInfo[i][4], tbQuestInfo[i][5],
                               tbQuestInfo[i][6])
        tinsert(tbOpt, { i .. "." .. tbQuestInfo[i][1], QSupport.MoveTo, tbPosition })
    end
    JDialog:Show(tbOpt, QSupport.Golden_Dialog,
        QSupport.szTitle[4] .. "\n" .. QSupport.tbGoldenList[nCamp] .. " - " ..
            QSupport.tbGoldenList[szQuestType][nLevel])
end
