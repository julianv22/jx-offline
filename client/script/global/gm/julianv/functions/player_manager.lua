------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function JulianV:Change_PK() -- ®æi mµu pk
    local nType = self
    if not nType then
        local tbSay = { "<sex>muèn ®æi sang mµu tr¹ng th¸i nµo<pic=44>" }
        local szPK = function( num )
            return format("%s (%s)", tbMonPhai.tbPK_Status[num][1], tbMonPhai.tbPK_Status[num][3])
        end
        for i = 0, getn(tbMonPhai.tbPK_Status) do
            tinsert(tbSay, szPK(i) .. format("/#JulianV.Change_PK(%d)", i))
        end
        tinsert(tbSay, "Ta sÏ quay l¹i sau/return")
        CreateTaskSay(tbSay)
    else
        SetCurCamp(nType)
        SetCamp(nType)
        Msg2Player(format("§· ®æi mµu PK sang <color=%s>%s", tbMonPhai.tbPK_Status[nType][2],
                       tbMonPhai.tbPK_Status[nType][1]))
    end
end

Include("\\script\\global\\ÌØÊâÓÃµØ\\ÃÎ¾³\\npc\\Â·ÈË_ÅÑÉ®.lua"); -- tÈy tuû, c«ng ®iÓm nhanh
Include("\\script\\global\\gm\\julianv\\npc\\npc_congskill.lua") -- Hç Trî Céng Full Skill

function JulianV:SkillSupport() -- hç trî skill
    local tbOpt = {
        { "TÈy Tñy", JulianV.ClearPoints_Dialog }, --
        { "Céng ®iÓm nhanh", JulianV.CongDiemNhanh }, --    
        { "Thªm - Xo¸ Skill n©ng cao", JulianV.Skill_NangCao },
    }
    if HaveMagic(210) == -1 then
        tinsert(tbOpt, 1, { "Häc Khinh c«ng", JulianV.LearnSkill, { 210 } })
    end
    JDialog:Show(tbOpt, JulianV.Player_Dialog)
end

function JulianV:CongDiemNhanh()
    local tbOpt = {
        { "Céng TiÒm n¨ng nhanh", add_prop }, --
        { "Céng Kü n¨ng nhanh", add_magic, { GetLastFactionNumber() } }, --
    }
    JDialog:Show(tbOpt, JulianV.SkillSupport)
end

function JulianV.LearnSkill( nSkillId, nLevel ) -- häc skill
    nLevel = nLevel or 1
    if HaveMagic(nSkillId) == nLevel then
        Talk(1, "", "Ng­¬i ®· së h÷u kü n¨ng nµy råi<pic=46>")
    else
        AddMagic(nSkillId, nLevel)
        GMMsg2Player("Häc ®­îc kü n¨ng",
            "<color=yellow>" .. GetSkillName(nSkillId) .. "<color> cÊp " .. nLevel)
    end
end

function JulianV:ClearPoints_Dialog() -- tÈy tuû
    local tbOpt = {
        { "TÈy TiÒm n¨ng", DoClearPropCore }, --
        { "TÈy Kü n¨ng", DoClearSkillCore }, --
        { "Kh«ng tÈy", JulianV.SkillSupport }, --
    }
    JDialog:Show(tbOpt)
end
------------------------Thªm, xo¸ skil theo ID------------------------
function JulianV:Skill_NangCao()
    local tbOpt = {
        { "Thªm Skill (SkillID, Level)", JulianV.AddAdvSkill, { 0 } }, --
        { "Xo¸ Skill (SkillID)", JulianV.DelAdvSkill }, --        
    }
    JDialog:Show(tbOpt, JulianV.SkillSupport)
end

function JulianV:AddAdvSkill()
    if self == 0 then
        g_AskClientStringEx("1995,20", 1, 100, "Skill ID", { JulianV.AddAdvSkill })
    else
        local tbSkill = split(self, ",")
        if getn(tbSkill) > 2 then
            Talk(1, "", "Qu¸ nhiÒu tham sè, chØ nhËn 2 tham sè lµ Skill ID vµ Level<pic=46>")
        else
            local nSkillId, nLevel = tonumber(tbSkill[1]), tonumber(tbSkill[2])
            JulianV.LearnSkill(nSkillId, nLevel)
        end
    end
end

function JulianV:DelAdvSkill()
    local nSkillId = self
    if nSkillId == 0 then return end
    if not nSkillId then
        g_AskClientNumberEx(0, 9999, "Skill ID", { JulianV.DelAdvSkill })
    else
        DelMagic(nSkillId)
        GMMsg2Player("Xo¸ bá kü n¨ng", "<color=yellow>" .. GetSkillName(nSkillId))
    end
end
------------------------NhËn ®iÓm------------------------
function JulianV:Point_Dialog()
    local tbOpt = {}
    for id, tbPoints in tbPointsType do
        tinsert(tbOpt, { tbPoints.szName, JulianV.Pick_Points, { id, tbPoints.nLimit } })
    end
    JDialog:Show(tbOpt, JulianV.Player_Dialog)
end

function JulianV:Pick_Points( nLimit )
    if self < 10 then
        g_AskClientNumberEx(0, nLimit, "Sè l­îng:", { JulianV.Set_Points, { self } })
    else
        tbPointsType[self].pFun()
    end
end

function JulianV:Set_Points( num )
    if num == 0 then
        return
    else
        tbPointsType[self].pFun(num)
        Msg2Player("NhËn ®­îc <color=yellow>" .. num .. "<color> <color=green>" ..
                       tbPointsType[self].szUnit)
    end
end

function JulianV:Change_Sex() -- chuyÓn giíi
    if self == 1 then
        SetSex(GetSex() == 1 and 0 or 1)
        Talk(1, "KickOutSelf", "§· chuyÓn giíi thµnh c«ng<pic=46>")
    else
        local tbOpt = {
            { "§i th«i!", JulianV.Change_Sex, { 1 } }, --
            { "§Ó ta suy nghÜ l¹i..." },
        }
        CreateNewSayEx(SPRLINK .. "<sex>{{" .. GetName() ..
                           "}} cã ch¾c ch¾n muèn sang Th¸i kh«ng <pic=108><color>", tbOpt)
    end
end

function JulianV:Change_Serries() -- ®æi ngò hµnh
    local nSeries, nCurSeries = self, GetSeries()
    local szSeries = function( num )
        return format("<color=%s>%s<color>", tbMonPhai.tbSeries[num][2], tbMonPhai.tbSeries[num][1])
    end
    if not nSeries then
        local tbOpt = {}
        for i = 0, getn(tbMonPhai.tbSeries) do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.Change_Serries, { i } })
        end
        JDialog:Show(tbOpt, JulianV.Player_Dialog, "<sex>hiÖn t¹i lµ hÖ " ..
            szSeries(nCurSeries) .. "\n\nMêi chän ngò hµnh muèn ®æi:")
    else
        if nCurSeries == nSeries then
            Talk(1, "", "§· lµ hÖ " .. szSeries(nCurSeries) ..
                " råi, kh«ng cÇn chuyÓn n÷a<pic=46>")
        else
            SetSeries(nSeries)
            Talk(1, "KickOutSelf", "§· chuyÓn sang hÖ " .. szSeries(nSeries))
        end
    end
end

function JulianV:RenameCharacter() -- ®æi tªn
    if not self then
        g_AskClientStringEx("Julian-V", 1, 100, "NhËp tªn míi", { JulianV.RenameCharacter })
    else
        RenameRole(self)
    end
end
------------------------NhËn NhËn Danh hiÖu------------------------
function JulianV:NhanDanhHieu()
    local tbOpt = {
        { "Danh hiÖu Vâ l©m", JulianV.DanhHieuVoLam }, --
        { "Danh hiÖu VIP", JulianV.DanhHieuKiemThe }, --
        { "TÊt c¶ Danh HiÖu (playertitle.txt)", JulianV.ShowAllTitle }, --
        { "KÝch ho¹t Danh hiÖu (Title ID)", JulianV.ActiveTitle, { 0 } }, --
        { "Huû kÝch ho¹t Danh hiÖu", JulianV.ActiveTitle, { -1 } }, --
    }
    JDialog:Show(tbOpt, JulianV.Player_Dialog)
end

function JulianV:DanhHieuKiemThe()
    if not self then
        local tbOpt = {}
        for i = 1, getn(tbDanhHieu.KiemThe) do
            tinsert(tbOpt, {
                tbDanhHieu.KiemThe[i][1], JulianV.DanhHieuKiemThe, { tbDanhHieu.KiemThe[i] },
            })
        end
        JDialog:Show(tbOpt, JulianV.NhanDanhHieu, "Mêi <sex>chän danh hiÖu<pic=46><color>")
    else
        tbDanhHieu.Active(self)
    end
end

function JulianV:DanhHieuVoLam()
    local DanhHieuVL = JDialog:PhanTrang(tbDanhHieu.VoLam, 12)
    local tbOpt = {}
    local nPage = self or 1
    local nCount = getn(DanhHieuVL)
    if nPage < nCount then
        for i = 1, getn(DanhHieuVL[nPage]) do
            tinsert(tbOpt, { DanhHieuVL[nPage][i][1], tbDanhHieu.Active, { DanhHieuVL[nPage][i] } })
        end
        tinsert(tbOpt, { "Trang sau", JulianV.DanhHieuVoLam, { nPage + 1 } })
    else
        for i = 1, getn(DanhHieuVL[nCount]) do
            tinsert(tbOpt,
                { DanhHieuVL[nCount][i][1], tbDanhHieu.Active, { DanhHieuVL[nCount][i] } })
        end
    end
    if nPage > 1 then tinsert(tbOpt, { "Trang tr­íc", JulianV.DanhHieuVoLam, { nPage - 1 } }) end
    JDialog:Show(tbOpt, nil, "Mêi <sex>chän Danh HiÖu<pic=46>}}")
end

function JulianV:ActiveTitle( nTitleId )
    if self == 0 then
        if not nTitleId or nTitleId == 0 then
            g_AskClientNumberEx(0, 500, "Title ID", { JulianV.ActiveTitle, { self } })
        else
            tbDanhHieu.Active(nTitleId)
        end
    end
    if self == -1 then Title_RemoveTitle(GetTask(1122)) end
end

function JulianV:ShowAllTitle()
    local path, tab_name = safeshow("/settings/playertitle.txt"), "title"
    local tbTitle = JDialog:PhanTrang(JDialog:GetTabFileData(path, tab_name, 2, 2), 10)
    local tbOpt = {}
    local nPage = self or 1
    local nCount = getn(tbTitle)
    local szTitleName = function( tab, page, id )
        local text = tab[page][id][1]
        if strlen(text) > 30 then text = strsub(text, 1, 30) end
        if text == "" then text = "Unknown" end
        return tab[page][id][2] .. "." .. text
    end
    if nPage < nCount then
        for i = 1, getn(tbTitle[nPage]) do
            tinsert(tbOpt,
                { szTitleName(tbTitle, nPage, i), tbDanhHieu.Active, { tbTitle[nPage][i] } })
        end
        tinsert(tbOpt, { "Trang sau", JulianV.ShowAllTitle, { nPage + 1 } })
    else
        for i = 1, getn(tbTitle[nCount]) do
            tinsert(tbOpt,
                { szTitleName(tbTitle, nCount, i), tbDanhHieu.Active, { tbTitle[nCount][i] } })
        end
    end
    if nPage > 1 then tinsert(tbOpt, { "Trang tr­íc", JulianV.ShowAllTitle, { nPage - 1 } }) end
    tinsert(tbOpt, { "Nh¶y ®Õn trang...", JDialog.JumpToPage, { nCount, JulianV.ShowAllTitle } })
    JDialog:Show(tbOpt, nil, "Mêi <sex>chän Danh HiÖu<pic=46>}}\n\n" ..
        strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end
