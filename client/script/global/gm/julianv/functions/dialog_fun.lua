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
        if type(pBack) == "function" then -- nÕu tham sè lµ function
            tinsert(self.tbOptions, { "Trë l¹i", pBack })
        elseif type(pBack) == "table" then -- nÕu tham sè lµ table
            self.tbBack = { "Trë l¹i" } -- Menu tro lai
            for i = 1, getn(pBack) do tinsert(self.tbBack, pBack[i]) end
            tinsert(self.tbOptions, self.tbBack)
        end
    end
    tinsert(self.tbOptions, { "KÕt thóc ®èi tho¹i" })
    CreateNewSayEx(self.szTitle, self.tbOptions)
end

function JDialog:DefaultTitle() -- Reset tieu de Dialog ve mac dinh
    local nW, nX, nY = GetWorldPos()
    local szFactionName = GetFaction()
    if szFactionName == "" then
        szFactionName = "T¸n Nh©n"
    elseif szFactionName ~= "Míi nhËp giang hå " then
        szFactionName = tbMonPhai.tbPinyn[GetFaction()][2]
    end
    local szTongName = GetTong()
    szTongName = szTongName == "" and "Trèng" or szTongName
    local szAccount, szName, nTransLifeCount = GetAccount(), GetName(), ST_GetTransLifeCount()
    local szCurCamp = format("<color=%s>%s<color>", tbMonPhai.tbPK_Status[GetCamp()][2],
                          tbMonPhai.tbPK_Status[GetCamp()][1])
    local szMessage = format(
                          "<pic=137> Tµi kho¶n : <bclr=red>%s<bclr>     Index : <color=yellow>%s<color>\n<pic=136> Nh©n vËt  : <bclr=blue>%s<bclr>\n<pic=135> M«n ph¸i  : <color=green>%s<color>     CÊp ®é : <color=green>%d<color>\n<pic=136> ThÕ lùc   : %s   Trïng sinh : <color=green>%d<color>\n<pic=135> Bang Héi  : <bclr=pink>%s<bclr>\n\n<pic=54> Täa ®é   : <color=yellow>%d,<color> <color=orange>%d/%d<color>",
                          szAccount, PlayerIndex, szName, szFactionName, GetLevel(), szCurCamp,
                          ST_GetTransLifeCount(), szTongName, nW, nX, nY)
    self:InitTitle(szMessage)
end
---@param table? table @Table phan trang
---@param nOfPage? integer @So phan tu moi trang
function JDialog:PhanTrang( table, nOfPage ) -- Phan trang
    local tbSplitTable = {}
    local nCount = getn(table) -- §Õm sè phÇn tö cña b¶ng
    if nCount > nOfPage then -- NÕu sè phÇn tö > sè item cña 1 trang
        local nIndex = floor(nCount / nOfPage) -- Chia lÊy phÇn nguyªn
        for id = 0, nIndex - 1 do
            local tbTemp = {}
            for n = id * nOfPage + 1, id * nOfPage + nOfPage do tinsert(tbTemp, table[n]) end
            tinsert(tbSplitTable, tbTemp)
        end
        local nMod = mod(nCount, nOfPage) -- Chia lÊy phÇn d­
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
