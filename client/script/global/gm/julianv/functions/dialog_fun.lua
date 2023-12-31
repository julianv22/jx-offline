------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\common.lua")

SPRLINK = "<#><link=image[0]:\\spr\\julianv.spr><link>"
JDialog = {}
JDialog.tbOptions = {} -- Cac dong menu

function JDialog:InitTitle( szMessage ) -- Khoi tao tieu de Dialog
    dofile("script/global/gm/julianv/functions/dialog_fun.lua")
    if type(szMessage) == "table" then
        self.szTitle = szMessage[1] -- Tieu de Dialog
    else
        self.szTitle = SPRLINK .. szMessage
    end
end
---@param tbOpt? table @Cac options
---@param szTitle? string @Tieu de Dialog
function JDialog:Show( tbOpt, pBack, szTitle ) -- Hien thi Dialog
    if szTitle then
        self:InitTitle(szTitle)
    else
        self:DefaultTitle()
    end
    self.tbOptions = tbOpt
    if pBack then
        if type(pBack) == "function" then -- n�u tham s� l� function
            tinsert(self.tbOptions, { "Tr� l�i", pBack })
        elseif type(pBack) == "table" then -- n�u tham s� l� table
            self.tbBack = { "Tr� l�i" } -- Menu tro lai
            for i = 1, getn(pBack) do tinsert(self.tbBack, pBack[i]) end
            tinsert(self.tbOptions, self.tbBack)
        end
    end
    tinsert(self.tbOptions, { "K�t th�c ��i tho�i" })
    CreateNewSayEx(self.szTitle, self.tbOptions)
end

function JDialog:DefaultTitle() -- Reset tieu de Dialog ve mac dinh
    local nW, nX, nY = GetWorldPos()
    local szFactionName = GetLastFactionNumber() == -1 and "T�n Nh�n" or
                              tbMonPhai.tbFacName[GetLastFactionNumber() + 1]
    local szTongName = GetTong() ~= "" and "\n<pic=135> Bang H�i  : <bclr=pink>" .. GetTong() ..
                           "<bclr>" or ""
    local szAccount, szName, nTransLifeCount = GetAccount(), GetName(), ST_GetTransLifeCount()
    local szCurCamp = format("<color=%s>%s<color>", tbMonPhai.tbPK_Status[GetCamp()][2],
                          tbMonPhai.tbPK_Status[GetCamp()][1])
    local szMessage = format(
                          "<pic=137> T�i kho�n : <bclr=red>%s<bclr>     Index : {{%s}}\n<pic=136> Nh�n v�t  : <bclr=blue>%s<bclr>\n<pic=135> M�n ph�i  : <g>%s</g>     C�p �� : <g>%d</g>\n<pic=136> Th� l�c   : %s   Tr�ng sinh : <g>%d</g>" ..
                              szTongName .. "\n\n<pic=54> T�a ��   : {{%d,}} <g>%d/%d</g>",
                          szAccount, PlayerIndex, szName, szFactionName, GetLevel(), szCurCamp,
                          ST_GetTransLifeCount(), nW, nX, nY)
    self:InitTitle(szMessage)
end
---@param table? table @Table phan trang
---@param nOfPage? integer @So phan tu moi trang
function JDialog:PhanTrang( table, nOfPage ) -- Phan trang
    local tbSplitTable = { nil }
    local nCount = getn(table) -- ��m s� ph�n t� c�a b�ng
    nOfPage = nOfPage or 10
    if nCount > nOfPage then -- N�u s� ph�n t� > s� item c�a 1 trang
        local nIndex = floor(nCount / nOfPage) -- Chia l�y ph�n nguy�n
        for id = 0, nIndex - 1 do
            local tbTemp = {}
            for n = id * nOfPage + 1, id * nOfPage + nOfPage do tinsert(tbTemp, table[n]) end
            tinsert(tbSplitTable, tbTemp)
        end
        local nMod = mod(nCount, nOfPage) -- Chia l�y ph�n d�
        if nMod > 0 then
            local tbTemp = {}
            for i = nCount - nMod + 1, nCount do tinsert(tbTemp, table[i]) end
            tinsert(tbSplitTable, tbTemp)
        end
    else
        tbSplitTable = table
    end
    return tbSplitTable
end
---@param path? string @File Path to load
---@param tab_name? string @Table name
---@param start_col? integer
---@param max_row? integer
function JDialog:GetTabFileData( path, tab_name, start_row, max_col ) -- Doc file txt
    path = safeshow(path)
    if TabFile_Load(path, tab_name) ~= 1 then return print("��c t�p tin th�t b�i! " .. path) end
    if not start_row or start_row < 1 then start_row = 1 end
    if not max_col or max_col < 1 then max_col = 1 end
    local nCount = TabFile_GetRowCount(tab_name)
    local tbData = {}
    for y = start_row, nCount do
        local tbTemp = {}
        for x = 1, max_col do tinsert(tbTemp, TabFile_GetCell(tab_name, y, x)) end
        tinsert(tbData, tbTemp)
    end
    return tbData, nCount - start_row + 1
end
---@param self? integer @Max page number
---@param pFun? function @Callback Function
function JDialog:JumpToPage( pFun ) g_AskClientNumberEx(1, self, "S� trang", { pFun }) end
