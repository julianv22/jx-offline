------------------------------------------------------------------
-- Copyright by Julian-V (https://www.youtube.com/julianv)
------------------------------------------------------------------
function JulianV:Change_PK() -- ��i m�u pk
    local nType = self
    if not nType then
        local tbSay = { "<sex>mu�n ��i sang m�u tr�ng th�i n�o<pic=44>" }
        local szPK = function( num )
            return format("%s (%s)", tbMonPhai.tbPK_Status[num][1], tbMonPhai.tbPK_Status[num][3])
        end
        for i = 0, getn(tbMonPhai.tbPK_Status) do
            tinsert(tbSay, szPK(i) .. format("/#JulianV.Change_PK(%d)", i))
        end
        tinsert(tbSay, "Ta s� quay l�i sau/return")
        CreateTaskSay(tbSay)
    else
        SetCurCamp(nType)
        SetCamp(nType)
        Msg2Player(format("�� ��i m�u PK sang <color=%s>%s", tbMonPhai.tbPK_Status[nType][2],
                       tbMonPhai.tbPK_Status[nType][1]))
    end
end

Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua"); -- t�y tu�, c�ng �i�m nhanh
Include("\\script\\global\\gm\\julianv\\npc\\npc_congskill.lua") -- H� Tr� C�ng Full Skill

function JulianV:SkillSupport() -- h� tr� skill
    local tbOpt = {
        { "T�y T�y", JulianV.ClearPoints_Dialog }, --
        { "C�ng �i�m nhanh", JulianV.CongDiemNhanh }, --    
        { "Th�m - Xo� Skill n�ng cao", JulianV.Skill_NangCao },
    }
    if HaveMagic(210) == -1 then
        tinsert(tbOpt, 1, { "H�c Khinh c�ng", JulianV.LearnSkill, { 210 } })
    end
    JDialog:Show(tbOpt, JulianV.Player_Dialog)
end

function JulianV:CongDiemNhanh()
    local tbOpt = {
        { "C�ng Ti�m n�ng nhanh", add_prop }, --
        { "C�ng K� n�ng nhanh", add_magic, { GetLastFactionNumber() } }, --
    }
    JDialog:Show(tbOpt, JulianV.SkillSupport)
end

function JulianV.LearnSkill( nSkillId, nLevel ) -- h�c skill
    nLevel = nLevel or 1
    if HaveMagic(nSkillId) == nLevel then
        Talk(1, "", "Ng��i �� s� h�u k� n�ng n�y r�i<pic=46>")
    else
        AddMagic(nSkillId, nLevel)
        GMMsg2Player("H�c ���c k� n�ng",
            "<color=yellow>" .. GetSkillName(nSkillId) .. "<color> c�p " .. nLevel)
    end
end

function JulianV:ClearPoints_Dialog() -- t�y tu�
    local tbOpt = {
        { "T�y Ti�m n�ng", DoClearPropCore }, --
        { "T�y K� n�ng", DoClearSkillCore }, --
        { "Kh�ng t�y", JulianV.SkillSupport }, --
    }
    JDialog:Show(tbOpt)
end
------------------------Th�m, xo� skil theo ID------------------------
function JulianV:Skill_NangCao()
    local tbOpt = {
        { "Th�m Skill (SkillID, Level)", JulianV.AddAdvSkill, { 0 } }, --
        { "Xo� Skill (SkillID)", JulianV.DelAdvSkill }, --        
    }
    JDialog:Show(tbOpt, JulianV.SkillSupport)
end

function JulianV:AddAdvSkill()
    if self == 0 then
        g_AskClientStringEx("1995,20", 1, 100, "Skill ID", { JulianV.AddAdvSkill })
    else
        local tbSkill = split(self, ",")
        if getn(tbSkill) > 2 then
            Talk(1, "", "Qu� nhi�u tham s�, ch� nh�n 2 tham s� l� Skill ID v� Level<pic=46>")
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
        GMMsg2Player("Xo� b� k� n�ng", "<color=yellow>" .. GetSkillName(nSkillId))
    end
end
------------------------Nh�n �i�m------------------------
function JulianV:Point_Dialog()
    local tbOpt = {}
    for id, tbPoints in tbPointsType do
        tinsert(tbOpt, { tbPoints.szName, JulianV.Pick_Points, { id, tbPoints.nLimit } })
    end
    JDialog:Show(tbOpt, JulianV.Player_Dialog)
end

function JulianV:Pick_Points( nLimit )
    if self < 10 then
        g_AskClientNumberEx(0, nLimit, "S� l��ng:", { JulianV.Set_Points, { self } })
    else
        tbPointsType[self].pFun()
    end
end

function JulianV:Set_Points( num )
    if num == 0 then
        return
    else
        tbPointsType[self].pFun(num)
        Msg2Player("Nh�n ���c <color=yellow>" .. num .. "<color> <color=green>" ..
                       tbPointsType[self].szUnit)
    end
end

function JulianV:Change_Sex() -- chuy�n gi�i
    if self == 1 then
        SetSex(GetSex() == 1 and 0 or 1)
        Talk(1, "KickOutSelf", "�� chuy�n gi�i th�nh c�ng<pic=46>")
    else
        local tbOpt = {
            { "�i th�i!", JulianV.Change_Sex, { 1 } }, --
            { "�� ta suy ngh� l�i..." },
        }
        CreateNewSayEx(SPRLINK .. "<sex>{{" .. GetName() ..
                           "}} c� ch�c ch�n mu�n sang Th�i kh�ng <pic=108><color>", tbOpt)
    end
end

function JulianV:Change_Serries() -- ��i ng� h�nh
    local nSeries, nCurSeries = self, GetSeries()
    local szSeries = function( num )
        return format("<color=%s>%s<color>", tbMonPhai.tbSeries[num][2], tbMonPhai.tbSeries[num][1])
    end
    if not nSeries then
        local tbOpt = {}
        for i = 0, getn(tbMonPhai.tbSeries) do
            tinsert(tbOpt, { tbMonPhai.tbSeries[i][1], JulianV.Change_Serries, { i } })
        end
        JDialog:Show(tbOpt, JulianV.Player_Dialog, "<sex>hi�n t�i l� h� " ..
            szSeries(nCurSeries) .. "\n\nM�i ch�n ng� h�nh mu�n ��i:")
    else
        if nCurSeries == nSeries then
            Talk(1, "", "�� l� h� " .. szSeries(nCurSeries) ..
                " r�i, kh�ng c�n chuy�n n�a<pic=46>")
        else
            SetSeries(nSeries)
            Talk(1, "KickOutSelf", "�� chuy�n sang h� " .. szSeries(nSeries))
        end
    end
end

function JulianV:RenameCharacter() -- ��i t�n
    if not self then
        g_AskClientStringEx("Julian-V", 1, 100, "Nh�p t�n m�i", { JulianV.RenameCharacter })
    else
        RenameRole(self)
    end
end
------------------------Nh�n Nh�n Danh hi�u------------------------
function JulianV:NhanDanhHieu()
    local tbOpt = {
        { "Danh hi�u V� l�m", JulianV.DanhHieuVoLam }, --
        { "Danh hi�u VIP", JulianV.DanhHieuKiemThe }, --
        { "T�t c� Danh Hi�u (playertitle.txt)", JulianV.ShowAllTitle }, --
        { "K�ch ho�t Danh hi�u (Title ID)", JulianV.ActiveTitle, { 0 } }, --
        { "Hu� k�ch ho�t Danh hi�u", JulianV.ActiveTitle, { -1 } }, --
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
        JDialog:Show(tbOpt, JulianV.NhanDanhHieu, "M�i <sex>ch�n danh hi�u<pic=46><color>")
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
    if nPage > 1 then tinsert(tbOpt, { "Trang tr��c", JulianV.DanhHieuVoLam, { nPage - 1 } }) end
    JDialog:Show(tbOpt, nil, "M�i <sex>ch�n Danh Hi�u<pic=46>}}")
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
    if nPage > 1 then tinsert(tbOpt, { "Trang tr��c", JulianV.ShowAllTitle, { nPage - 1 } }) end
    tinsert(tbOpt, { "Nh�y ��n trang...", JDialog.JumpToPage, { nCount, JulianV.ShowAllTitle } })
    JDialog:Show(tbOpt, nil, "M�i <sex>ch�n Danh Hi�u<pic=46>}}\n\n" ..
        strfill_center("Trang {{" .. nPage .. "/" .. nCount .. "}}", 50, "-"))
end
