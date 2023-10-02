-- �����һ��±����϶�ʱ��

-- INTERVAL_TIME   = 30	    -- ÿ���Сʱ����
-- VARV_BASEINDEX  = 100    -- ʹ�õ���ʼȫ�ֱ���
-- DELAY_TIME      = 15     -- �ӳٶһ�ʱ��

-- INTERVAL_TIME   = 30    -- ÿ���Сʱ����
INTERVAL_TIME   = 5    -- ÿ���Сʱ����
VARV_LASTCITY   = 100   -- �ϴζһ����ϵĳ���
VARV_BASEINDEX  = 101   -- ʹ�õ���ʼȫ�ֱ���
-- DELAY_MIN_TIME  = 15    -- �ӳٶһ�ʱ�䣨���ӣ�
DELAY_MIN_TIME  = 2    -- �ӳٶһ�ʱ�䣨���ӣ�
START_HOUR_TIME = 9     -- �һ���ʼʱ�䣨Сʱ��


function IncMinute(hour, minute, inc)
	hour = mod(hour + floor(inc/60), 24)
	minute = mod(minute + mod(inc,60), 60)
    return hour, minute
end

-- function GetNextTime()
--     -- ��һ����㴥����ʱ��
--     local hour = tonumber(date("%H"))
--     local minute = tonumber(date("%M"))
--     if (minute >= 0 and minute < 30) then
--         return hour, 30
--     else
--         return IncHour(hour, 1), 0
--     end
-- end

function GetNextTime()
    -- ��һ����㴥����ʱ��
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    return IncMinute(hour, minute, 1)
end

-- �һ����ϵĳ���
tbl_cities = {
    {1,     "Ph��ng T��ng"},
    {11,    "Th�nh ��"},
    {37,    "Bi�n Kinh"},
    {78,    "T��ng D��ng"},
    {80,    "D��ng Ch�u"},
    {162,   "��i L�"},
    {176,   "L�m An"}, 
};

-- �ɶһ��Ĳ���{ÿ�οɶһ���Ŀ, ÿ��ɶһ�����}
tbl_material = {
    {1000, 12},     -- ��
    {100, 6},       -- ����
    {50, 6},        -- ����
    {10, 6},        -- Ҭ˿
};

-- ��������
tbl_material_names = {
    "Tr�ng ",
    "H�nh nh�n ",
    "��u ph�ng ",
    "C�m d�a",
};

-- ��ʼ���ɶһ����ϵ�ÿ��ɶһ�����
function InitMaterial()
    for i = 1, getn(tbl_material) do
        SetGblInt(VARV_BASEINDEX + i, tbl_material[i][2])
    end
end

-- ��ȡ�ɶһ�������Ŀ
function GetMaterialCount(typeid)
    return tbl_material[typeid][1];
end

-- ѡ�񱾴�Ҫ�һ��Ĳ���
function SelectMaterial()
    local index = random(1, getn(tbl_material))
    local count = GetGblInt(VARV_BASEINDEX + index)
    if (count ~= 0) then
        SetGblInt(VARV_BASEINDEX + index, count - 1)
        return index
    end
    
    for i = 1, getn(tbl_material) do
        if (i ~= index) then
            count = GetGblInt(VARV_BASEINDEX + i)
            if (count ~= 0) then
                SetGblInt(VARV_BASEINDEX + i, count - 1)
                return i
            end
        end
    end
    return nil
end

function TaskShedule()
	TaskName("Ho�t ��ng Trung thu ��i v�t li�u l�m b�nh ");	

	-- ���ü��ʱ��
	TaskInterval(INTERVAL_TIME);

	-- ���ô���ʱ��
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Ho�t ��ng Trung thu ��i v�t li�u l�m b�nh, ��ng h� ��nh gi� kh�i ��ng l� %d:%d...", h, m));

	-- ִ��30��
	TaskCountLimit(0);
	
	-- ��ʼ��
	InitMaterial()
end

-- ��ӡ��������
function PrintMaterialCount()
    for i = 1, getn(tbl_material_names) do
        OutputMsg(format("%s: %d left",
            tbl_material_names[i],
            GetGblInt(VARV_BASEINDEX + i)))
    end
end

-- �ر��ϴεĶһ����ϻ
function CloseLastExchange()
    -- �رնһ�����
    local lastcity = GetGblInt(VARV_LASTCITY)
    if (lastcity ~= nil and lastcity ~= 0) then
        local mapid = tbl_cities[lastcity][1]
        local cityname = tbl_cities[lastcity][2]
    	OutputMsg(format("Ho�t ��ng Trung thu ��i v�t li�u l�m b�nh % �� ��ng...", cityname))
        -- ����GameServer�ϵĽű�
        local cmd = format("dw ExchangeMoonCakeMaterial(%d,0,0,0)", mapid)
        GlobalExecute(cmd); 
        DelGblInt(VARV_LASTCITY)
    end
end

-- �����ϴεĶһ����ϻ
function SaveLastExchange(lastcity)
   SetGblInt(VARV_LASTCITY, lastcity)
end

function TaskContent()
    local hour = tonumber(date("%H"))
    local minute = tonumber(date("%M"))
    
    -- ÿ��һ�γ�ʼ�����Ͽɶһ�����
    if (hour == START_HOUR_TIME and minute < 30) then
        InitMaterial()
    end
    
    if (hour >= START_HOUR_TIME) then
        local typeid = SelectMaterial()             -- �������
        local city = random(1, getn(tbl_cities))    -- ���ѡ�����
        local minute = random(1, DELAY_MIN_TIME)    -- �ӳٶһ�ʱ�䣨���ӣ�
        local mapid = tbl_cities[city][1]
        local cityname = tbl_cities[city][2]

        if (typeid == nil) then
        	OutputMsg("Ho�t ��ng Trung thu ��i v�t li�u l�m b�nh b� l�i...")
        else
    	    -- ����GameServer�ϵĽű�
            CloseLastExchange()
            SaveLastExchange(city)

     	    local cmd = format("dw ExchangeMoonCakeMaterial(%d,%d,%d,%d)",
                mapid,                      -- ���ڵ�ͼ
                minute,                     -- �ӳٶһ�ʱ��
                typeid,                     -- �������
                GetMaterialCount(typeid));  -- ÿ�οɶһ���Ŀ
            GlobalExecute(cmd)
        	OutputMsg(format("Ho�t ��ng Trung thu ��i v�t li�u l�m b�nh % �� b�t ��u...", cityname));
            
            OutputMsg(cmd);
            PrintMaterialCount()
        end
  	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
