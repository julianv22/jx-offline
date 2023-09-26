------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\common.lua")

SPRLINK = "<#><link=image[0]:\\spr\\julianv.spr><link>"
JDialog = {}

function JDialog:_init(szMessage) -- Khoi tao tieu de Dialog
    dofile("script/global/gm/julianv/functions/dialog_fun.lua")
    if szMessage then
        self.szTitle = SPRLINK .. szMessage -- Tieu de Dialog
    else
        self.szTitle = format(SPRLINK .. "Xin ch�o <sex><bclr=red>%s<bclr> ta c� th� gi�p g� cho ng��i<pic=44><color>",
            GetName())
    end
    self.tbOptions = {nil} -- Cac dong menu
end

function JDialog:Show(table, pBack, szTitle) -- Hien thi Dialog
    if szTitle then
        self:_init(szTitle)
    end
    self.tbOptions = table
    if pBack then
        if type(pBack) == "function" then -- n�u tham s� l� function
            tinsert(self.tbOptions, {"Tr� l�i", pBack})
        elseif type(pBack) == "table" then -- n�u tham s� l� table
            self.tbBack = {"Tr� l�i"}
            for i = 1, getn(pBack) do
                tinsert(self.tbBack, pBack[i])
            end
            tinsert(self.tbOptions, self.tbBack)
        end
    end
    tinsert(self.tbOptions, {"K�t th�c ��i tho�i"})
    CreateNewSayEx(self.szTitle, self.tbOptions)
    self:ChangeTitle()
end

function JDialog:ChangeTitle() -- Reset tieu de Dialog ve mac dinh
    local nW, nX, nY = GetWorldPos()
    local szFactionName = GetFaction() == "" and "T�n Nh�n" or tbMonPhai.tbPinyn[GetFaction()][2]
    local nOnline, szAccount, szName, nTransLifeCount = GetPlayerCount(), GetAccount(), GetName(),
        ST_GetTransLifeCount()
    local szCurCamp = format("<color=%s>%s<color>", tbMonPhai.tbPK_Status[GetCamp()][2],
        tbMonPhai.tbPK_Status[GetCamp()][1])
    local szMessage = format(
        "<pic=137> Online   : <color=yellow>%s<color>     T�i kho�n : <bclr=red>%s<bclr>\n<pic=136> Nh�n v�t : <bclr=blue>%s<bclr>\n<pic=135> M�n ph�i : <color=green>%s<color>     C�p �� : <color=green>%d<color>\n<pic=137> M�u PK   : %s   Tr�ng sinh : <color=green>%d<color>\n\n<pic=54> T�a ��  : <color=yellow>%d,<color> <color=orange>%d/%d<color>",
        nOnline, szAccount, szName, szFactionName, GetLevel(), szCurCamp, 0, nW, nX, nY)
    self:_init(szMessage)
end

function JDialog:PhanTrang(table, nOfPage) -- Phan trang
    local tbSplitTable = {nil}
    local nCount = getn(table) -- ��m s� ph�n t� c�a b�ng
    if nCount > nOfPage then -- N�u s� ph�n t� > s� item c�a 1 trang
        local nIndex = floor(nCount / nOfPage) -- Chia l�y ph�n nguy�n
        for id = 0, nIndex - 1 do
            local tbTemp = {}
            for n = id * nOfPage + 1, id * nOfPage + nOfPage do
                tinsert(tbTemp, table[n])
            end
            tinsert(tbSplitTable, tbTemp)
        end
        local nMod = mod(nCount, nOfPage) -- Chia l�y ph�n d�
        if nMod > 0 then
            local tbTemp = {}
            for i = nCount - nMod + 1, nCount do
                tinsert(tbTemp, table[i])
            end
            tinsert(tbSplitTable, tbTemp)
        end
    else
        tbSplitTable = table
    end
    return tbSplitTable
end
