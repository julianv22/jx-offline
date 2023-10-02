-- by: ngaVN
-- Des: Thai doi nguoi choi dang ky tong kim
-------------------------------------------------------------------------
IncludeLib("SETTING")

if not tbVNG2011_ChangeSign then tbVNG2011_ChangeSign = {} end

tbVNG2011_ChangeSign.tbSIGN = {
    [1] = { 0550, 0600 },
    [2] = { 0650, 0700 },
    [3] = { 0750, 0800 },
    [4] = { 0850, 0900 },
    [5] = { 0950, 1000 },
    [6] = { 1050, 1100 },
    [7] = { 1150, 1200 },
    [8] = { 1250, 1300 },
    [9] = { 1350, 1400 },
    [10] = { 1450, 1500 },
    [11] = { 1000, 1105 },
    [12] = { 1650, 1700 },
    [13] = { 1750, 1800 },
    [14] = { 1850, 1900 },
    [15] = { 1950, 2000 },
    [16] = { 2050, 2100 },
    [17] = { 2150, 2200 },
    [18] = { 2250, 2300 },
};

-- Kiem tra trung sinh cua nguoi choi
function tbVNG2011_ChangeSign:CheckSign()
    local nTransLife = ST_GetTransLifeCount()
    if (nTransLife < 3) then return 0 end
    return 1
end

-- Tr¶ vÒ  trung sinh cua nguoi choi
function tbVNG2011_ChangeSign:GetTransLife()
    local nTransLife = ST_GetTransLifeCount()
    if (nTransLife < 3) then return 0 end
    return nTransLife
end

----Kiem tra dieu kien nguoi choi	dang ky battle
function tbVNG2011_ChangeSign:CheckChangeSign()
    local nSignHM = tonumber(date("%H%M"));
    for i = 1, getn(self.tbSIGN) do
        if (nSignHM >= self.tbSIGN[i][1] and nSignHM <= self.tbSIGN[i][2]) then
            local nRet = self:CheckSign();
            if (nRet ~= 1) then return 0 end
        end
    end
    return 1
end

----Kiem tra dieu kien nguoi choi	dang ky battle
function tbVNG2011_ChangeSign:GetTimeNow()
    local nTimeNow = tonumber(date("%H%M"));
    local nTime = 0;
    for i = 1, getn(self.tbSIGN) do
        if (nTimeNow >= self.tbSIGN[i][1] and nTimeNow <= self.tbSIGN[i][2]) then
            nTime = self.tbSIGN[i][2] - nTimeNow;
            return nTime
        end
    end
    return nTime
end
