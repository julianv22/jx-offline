tbPointsType = { -- C�c lo�i �i�m
    [1] = {
        szName = "Kinh nghi�m (EXP)",
        szUnit = "�i�m EXP",
        nLimit = 9999999999999999,
        pFun = function( num ) AddOwnExp(num) end,
    },
    [2] = {
        szName = "��ng c�p (Level)",
        szUnit = "��ng c�p",
        nLimit = 200,
        pFun = function( num ) ST_LevelUp(num - GetLevel()) end,
    },
    [3] = {
        szName = "Ti�m n�ng",
        szUnit = "�i�m Ti�m n�ng",
        nLimit = 1000000,
        pFun = function( num ) AddProp(num) end,
    },
    [4] = {
        szName = "K� n�ng",
        szUnit = "�i�m K� n�ng",
        nLimit = 999,
        pFun = function( num ) AddMagicPoint(num) end,
    },
    [5] = {
        szName = "Ti�n v�n",
        szUnit = "v�n l��ng",
        nLimit = 100000,
        pFun = function( num ) Earn(num * 10000) end,
    },
    [6] = {
        szName = "Ti�n ��ng",
        szUnit = "Ti�n ��ng",
        nLimit = 999,
        pFun = function( num ) for i = 1, num do AddStackItem(1, 4, 417, 1, 1, 0, 0, 0) end end,
    },
    [7] = {
        szName = "Kim Nguy�n B�o",
        szUnit = "Kim Nguy�n B�o",
        nLimit = 999,
        pFun = function( num ) for i = 1, num do AddEventItem(343) end end,
    },
    [8] = {
        szName = "Danh V�ng",
        szUnit = "�i�m Danh V�ng",
        nLimit = 100000,
        pFun = function( num ) AddRepute(num) end,
    },
    [9] = {
        szName = "Ph�c Duy�n",
        szUnit = "�i�m Ph�c Duy�n",
        nLimit = 100000,
        pFun = function( num )
            FuYuan_Start()
            FuYuan_Add(num)
        end,
    },
    [10] = {
        szName = "T�i l�nh ��o",
        pFun = function()
            AddLeadExp(1000000000)
            Msg2Player(
                "Nh�n ���c <color=yellow>1.000.000.000<color> <color=green>�i�m l�nh ��o")
        end,
    },
    [11] = {
        szName = "�i�m c�ng hi�n Bang H�i",
        pFun = function()
            AddContribution(1000000)
            Msg2Player(
                "Nh�n ���c <color=yellow>1.000.000<color> <color=green>�i�m c�ng hi�n Bang H�i")
        end,
    },
    [12] = {
        szName = "Ch�n Nguy�n v� H� M�ch ��n",
        pFun = function()
            SetTask(4000, GetTask(4000) + 12000)
            for i = 1, 12 do AddStackItem(500, 6, 1, 3203, 0, 0, 0) end
            Msg2Player(
                "Nh�n ���c <color=yellow>60.000<color> Ch�n Nguy�n v� <color=yellow>30.000<color> H� M�ch ��n")
        end,
    },
}

tbDanhHieu = {
    VoLam = {
        { "Th�i th� Ph��ng T��ng", 153 }, { "Th�i th� Th�nh ��", 154 },
        { "Th�i th� ��i L�", 155 }, { "Th�i th� Bi�n Kinh", 156 },
        { "Th�i th� T��ng D��ng", 157 }, { "Th�i th� D��ng Ch�u", 158 },
        { "Th�i th� L�m An", 159 }, { "V� L�m Li�n ��u Qu�n Qu�n", 81 },
        { "V� L�m Li�n ��u H�ng 2", 82 }, { "V� L�m Li�n ��u H�ng 3", 83 },
        { "V� L�m Li�n ��u H�ng 4", 84 }, { "V� L�m Minh Ch�", 188 },
        { "Phi�u M� ��i T��ng Qu�n", 185 }, { "Ng� Long Cu�ng �ao", 165 },
        { "Long Th�n Ki�m", 80 }, { "Thi�n H� �� Nh�t Bang", 189 },
        { "V� Tr� H�ng Hoang", 205 }, { "Binh M� Nguy�n So�i", 202 },
        { "Si�u Cao Th� �� Nh�t B�ng", 204 }, { "Cao Th� Giang H�", 208 },
        { "Thi�n H� �� Nh�t", 209 }, { "�� Nh�t Th��ng Nh�n", 210 },        
    },
    KiemThe = {
        { "GM Julian-V", 201 }, { "Uy Ch�n C�u Ch�u", 192 }, { "V� L�m Ch� T�n", 193 },
        { "Nh�t Ki�m Phong Thi�n", 194 }, { "Nh�t L�u Cao Th�", 195 },
        { "Hi�p Kh�ch Cu�i C�ng Tr�n Giang H�", 196 }, { "Si�u Th�n", 200 },
        { "Phong V�n", 197 }, { "��i Th�nh", 198 }, { "Tr�n Thi�n", 199 },
        { "Ho�ng ��", 207 }, { "��c B� Thi�n H�", 206 },
    },
}

function tbDanhHieu.Active( DanhHieu )
    -- local nTime = tonumber(FormatTime2String("%m%d%H%M", GetCurServerTime() * 60 * 60 * 24 * nDays))
    local nTime = tonumber(FormatTime2String("%m%d%H%M", GetCurServerTime() * 60 * 60 * 24 * 30))
    local szTitle = type(DanhHieu) == "table" and DanhHieu[1] or DanhHieu
    local nTitle = type(DanhHieu) == "table" and DanhHieu[2] or szTitle
    Title_AddTitle(nTitle, 1, nTime);
    Title_ActiveTitle(nTitle);
    SetTask(1122, nTitle);
    GMMsg2Player("K�ch ho�t danh hi�u", "<color=yellow>" .. szTitle)
end
