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
        "CÈm nang ®Æc biÖt gióp dÞch chuyÓn nhanh c¸c ®Þa ®iÓm lµm nhiÖm vô.\n\nHoµn thµnh nhiÖm vô <sex>sÏ nhËn ®­îc nh÷ng phÇn th­ëng xøng ®¸ng",
        {
            "Mêi <sex>chän th«n trÊn muèn lµm nhiÖm vô<pic=46></g>",
            "Mêi <sex>chän nhiÖm vô<pic=46></g>",
        }, --
        "Di chuyÓn ®Õn vÞ trÝ lµm nhiÖm vô m«n ph¸i {{",
        "Di chuyÓn ®Õn vÞ trÝ lµm nhiÖm vô {{Hoµng Kim}} ",
    },

    tbThonTran = {
        List = {
            "Ba L¨ng HuyÖn", "Giang T©n Th«n", "VÜnh L¹c TrÊn", "Chu Tiªn TrÊn",
            "§¹o H­¬ng Th«n", "Long M«n TrÊn", "Th¹ch Cæ TrÊn", "Long TuyÒn Th«n",
        },
        [1] = {
            "Thuèc cho cha TiÓu Ng­", "Håi m«n cña A Ph­¬ng",
            "Con trai cña Cæ L·o Th¸i",
        },
        [2] = { "Hæ Tö b¸i s­", "Thuèc cho Ng« L·o gia", "C©y n¸ cña Hæ Tö" },
        [3] = { "§æi s¸ch", "Ng­u Ng­u muèn lµm ®¹i hiÖp", "ChuyÓn qu¹t trao t×nh" },
        [4] = { "Khuyªn L·o Chu vÒ nhµ", "Kh¨n uyªn ­¬ng", "ChiÕc vßng cña Song Song" },
        [5] = { "§i t×m TiÓu Long", "T« Trung b¸o quèc", "X¹ h­¬ng Hæ cèt cao" },
        [6] = { "Giíi thiÖu c«ng viÖc", "ChuyÓn tin", "§i giÕt heo rõng" },
        [7] = { "§­a c¬m", "Tr¶ tiÒn", "ChiÕc nhÉn cña A Kinh" },
        [8] = {
            "Cha d­îng cã tèt kh«ng?", "Gióp Bµnh Phãng söa ®ao",
            "Canh D­¬ng Xu©n B¹ch TuyÕt",
        },
    },

    tbListMP = {
        [0] = "ThiÕu L©m",
        [1] = "Thiªn V­¬ng Bang",
        [2] = "§­êng M«n",
        [3] = "Ngò §éc",
        [4] = "Nga My",
        [5] = "Thóy Yªn",
        [6] = "C¸i Bang",
        [7] = "Thiªn NhÉn Gi¸o",
        [8] = "Vâ §ang",
        [9] = "C«n L«n",
        [10] = "Hoa S¬n",
    },

    tbMonPhai = {
        [1] = "NhiÖm vô cÊp 10 ",
        [2] = "NhiÖm vô cÊp 20 ",
        [3] = "NhiÖm vô cÊp 30 ",
        [4] = "NhiÖm vô cÊp 40 ",
        [5] = "NhiÖm vô cÊp 50 ",
        [6] = "NhiÖm vô xuÊt s­ ",
        [7] = "NhiÖm vô trïng ph¶n s­ m«n ",
        [8] = "NhiÖm vô cÊp 90 ",
        [10] = "NhiÖm vô ký danh ®Ö tö ",
    },

    tbGoldenList = {
        [1] = " <color=orange>ChÝnh ph¸i<color>",
        [2] = " <g>Trung lËp</g>",
        [3] = " <color=pink>Tµ ph¸i<color>",
        ["ChÝnh tuyÕn"] = {
            [1] = "NhiÖm vô chÝnh tuyÕn cÊp 20",
            [2] = "NhiÖm vô chÝnh tuyÕn cÊp 30",
            [3] = "NhiÖm vô chÝnh tuyÕn cÊp 40",
            [4] = "NhiÖm vô chÝnh tuyÕn cÊp 50",
            [5] = "NhiÖm vô chÝnh tuyÕn cÊp 60",
        },
        ["Phô tuyÕn"] = {
            [1] = "NhiÖm vô phô tuyÕn cÊp 20-29",
            [2] = "NhiÖm vô phô tuyÕn cÊp 30-39",
            [3] = "NhiÖm vô phô tuyÕn cÊp 40-49",
            [4] = "NhiÖm vô phô tuyÕn cÊp 50-59",
        },
    },
}

function main()
    dofile("script/global/gm/julianv/functions/quest_support.lua")
    dofile("script/global/gm/julianv/lib/lib_quest.lua")
    local tbOpt = {
        { "NhiÖm vô Th«n trÊn", QSupport.Village_Dialog },
        { "NhiÖm vô M«n ph¸i", QSupport.Faction_Dialog },
        { "NhiÖm vô Hoµng Kim", QSupport.Golden_Dialog },
    }
    JDialog:Show(tbOpt, nil, QSupport.szTitle[1])
    return 1
end
--------------------------NV Th«n TrÊn--------------------------
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
--------------------------NV M«n Ph¸i--------------------------
function QSupport:Faction_Dialog()
    local nFaction = GetLastFactionNumber()
    if nFaction < 0 then
        Talk(1, "", "Xin h·y gia nhËp m«n ph¸i ®Ó sö dông chøc n¨ng nµy<pic=46>")
        return
    elseif nFaction > 10 then
        Talk(1, "", "HiÖn t¹i ch­a ph¸t triÓn nhiÖm vô m«n ph¸i nµy<pic=46>")
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
    if nStep <= 10 then -- NÕu sè b­íc thùc hiÖn <= 10
        for i = 2, nStep do
            local tbPosition = pack(tbQuestInfo[i][3], tbQuestInfo[i][5], tbQuestInfo[i][6],
                                   tbQuestInfo[i][7], szQuestName, i - 1, tbQuestInfo[i][1])
            tinsert(tbOpt,
                { i - 1 .. "." .. tbQuestInfo[i][1], QSupport.FactionQuest_MoveTo, tbPosition })
        end
    else -- NÕu sè b­íc thùc hiÖn > 10
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
                { "Trang tr­íc", QSupport.FactionQuest, { nFaction, nLevel, nPage - 1 } })
        end
    end
    JDialog:Show(tbOpt, QSupport.Faction_Dialog, szTitle)
end

function QSupport.FactionQuest_MoveTo( ... )
    local nFightState, nMapId, nPosX, nPosY, szQuestName, nStep, szQuestContent = unpack(arg)
    GMMsg2Player("B­íc " .. nStep, "<color=yellow>" .. szQuestName ..
        "<color>\nNéi dung: <color=green>" .. szQuestContent)
    AddNote("Néi dung nhiÖm vô: <color=green>" .. nStep .. "<color>")
    NewWorld(nMapId, nPosX, nPosY)
    SetFightState(nFightState)
end
--------------------------NV Hoµng Kim--------------------------
function QSupport:Golden_Dialog( szQuestType )
    szQuestType = szQuestType or ""
    local tbOpt, nQuestType = {}, self
    if not nQuestType then
        tbOpt = {
            { "ChÝnh tuyÕn", QSupport.Golden_Dialog, { 1, "ChÝnh tuyÕn" } },
            { "Phô tuyÕn", QSupport.Golden_Dialog, { 2, "Phô tuyÕn" } },
        }
    else
        tbOpt = {
            {
                "ChÝnh ph¸i - BÝ mËt TÇm Long Héi", QSupport.GoldenQuest,
                { nQuestType, 1, szQuestType },
            }, {
                "Trung lËp - C©u chuyÖn L©m Uyªn Nhai", QSupport.GoldenQuest,
                { nQuestType, 2, szQuestType },
            },
            { "Tµ ph¸i - Long KhÝ chi ho¹", QSupport.GoldenQuest,
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
