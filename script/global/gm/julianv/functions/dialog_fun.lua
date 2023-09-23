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
        self.szTitle = format(SPRLINK .. "Xin chµo <sex><bclr=red>%s<bclr> t«i cã thÓ gióp g×<pic=44><color>",
            GetName())
    end
    self.tbOptions = {nil} -- Cac dong menu
end

function JDialog:Show(table, pCallBack, szTitle) -- Hien thi Dialog
    if szTitle then
        self:_init(szTitle)
    end
    self.tbOptions = table
    if pCallBack then
        if type(pCallBack) == "function" then -- nÕu tham sè lµ function
            tinsert(self.tbOptions, {"Trë l¹i", pCallBack})
        elseif type(pCallBack) == "table" then -- nÕu tham sè lµ table
            self.tbCallBack = {"Trë l¹i"} -- Menu tro lai
            for i = 1, getn(pCallBack) do
                tinsert(self.tbCallBack, pCallBack[i])
            end
            tinsert(self.tbOptions, self.tbCallBack)
        end
    end
    tinsert(self.tbOptions, {"KÕt thóc ®èi tho¹i"})
    CreateNewSayEx(self.szTitle, self.tbOptions)
    self:ChangeTitle()
end

function JDialog:InsertOpt(tbOpt, nIndex) -- Them dong menu
    if nIndex then
        tinsert(self.tbOptions, nIndex, tbOpt)
    else
        tinsert(self.tbOptions, tbOpt)
    end
end

function JDialog:ChangeTitle() -- Reset tieu de Dialog ve mac dinh
    local nW, nX, nY = GetWorldPos();
    local szMessage = format("<pic=137> Tªn nh©n vËt  : <bclr=red>%s<bclr>\n" ..
                                 "<pic=136> Tªn tµi kho¶n : <bclr=blue>%s<bclr>\n" ..
                                 "<pic=135> Online        : <color=green>%s<color>" ..
                                 "\n\n<pic=54> Täa ®é       : <color=green>%d, %d/%d<color>", GetName(),
        GetAccount(), GetPlayerCount(), nW, nX, nY)
    self:_init(szMessage)
end

function JDialog:PhanTrang(table, nOfPage) -- Phan trang
    local tbSplitTable = {nil}
    local nCount = getn(table) -- §Õm sè phÇn tö cña b¶ng
    if nCount > nOfPage then -- NÕu sè phÇn tö > sè item cña 1 trang
        local nIndex = floor(nCount / nOfPage) -- Chia lÊy phÇn nguyªn
        for id = 0, nIndex - 1 do
            local tbTemp = {}
            for n = id * nOfPage + 1, id * nOfPage + nOfPage do
                tinsert(tbTemp, table[n])
            end
            tinsert(tbSplitTable, tbTemp)
        end
        local nMod = mod(nCount, nOfPage) -- Chia lÊy phÇn d­
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
