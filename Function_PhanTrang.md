# Xây dựng function để phân trang

Áp dụng cho những table có số phần tử quá lớn (>15) ta sẽ phân trang các table này ra nhiều trang, mỗi trang chứa n phần tử

## Giả thiết

Giả sử ta có 1 table Boss Hoàng Kim trong đó có khoảng > 30 con boss, với cấu trúc:

```lua
tbBoss = {
    [1] = {
        szName = "TÞnh Th«ng",
        nBossId = 1355,
        nRate = 322,
        nSeries = 0,
        nLevel = 95,
     },
    [2] = {
        szName = "Ng¹o Thiªn T­íng Qu©n",
        nBossId = 1356,
        nRate = 322,
        nSeries = 0,
        nLevel = 95,
    },
    [3] = {
        szName = "LiÔu Thanh Thanh",
        nBossId = 523,
        nRate = 322,
        nSeries = 1,
        nLevel = 95,
     },
    ...
    ...
    ...
    [35 = { ...
```

## Bài toán

1. Phân trang table trên thành 4 trang, mỗi trang có chứa thông tin 10 con Boss, trang cuối (4) sẽ chứa thông tin con Boss thứ 31 -> 35

2. Hiển thị Dialog cho người chơi lựa chọn 10 con Boss đầu, thêm dòng **Trang sau** để sang trang (2,3,4). Nếu là trang cuối thì không thêm dòng này.

3. Từ trang 2 trở đi sẽ thêm dòng **Trang trước** để trở về trang trước đó. Nếu là trang đầu cùng thì không thêm dòng này.

## Giải quyết vấn đề

### Để giải quyết vấn đề trên ta cần

1. Tạo 1 function phân trang để chia table trên thành 1 table có chứa nhiều table con, mỗi table con chứa n phần tử (mỗi trang). Và trả về kết quả là 1 table đã được phân trang.

2. Thực hiện xử lý table đã được phân trang, và các điều kiện ở bước 2 và 3 của bài toán.

3. Tạo function gọi Boss với để gọi Boss tương ứng với các tham số truyền vào.

### 1. Tạo function phân trang:

```lua
function PhanTrang( table, nOfPage )
-- function này sẽ nhận 2 tham số là `table` là bảng cần phân trang và `nOfPage` là số phần tử mỗi trang

    local tbSplitTable = { nil } -- Tạo 1 bảng tạm `tbSplitTable` để trả về kết quả

    local nCount = getn(table) -- Đếm số phần tử của `table` nCount = 35

    if nCount > nOfPage then -- Nếu số phần tử của `table` lớn hơn số phân tử mỗi trang (35 > 10)

        local nIndex = floor(nCount / nOfPage) -- Chia lấy phần nguyên nIndex = 3

        for id = 0, nIndex - 1 do -- Chạy vòng lặp từ 0 đến nIndex -1 (3 - 1 = 2)
        -- Nên chạy từ 0 thay vì 1 để dễ tính toán cho vòng for bên dưới

            local tbTemp = {} -- Tạo 1 bảng  tạm để thực hiện việc lấy các phần tử của `table`

            for n = id * nOfPage + 1, id * nOfPage + nOfPage do
            -- Ở bước 1 khi id = 0 thì n bắt đầu từ (0 * 10 + 1) = 1 đến (0 * 10 + 10) = 10
            -- Ở bước thứ nIndex - 1 (2) thì n bắt đầu từ (2 * 10 + 1) = 21 đến (2 * 10 + 10) = 30

                tinsert(tbTemp, table[n]) -- Ở các bước này sẽ insert các phần tử thứ n của `table` vào bảng tạm

            end     
            
            tinsert(tbSplitTable, tbTemp) -- insert `tbTemp` vào `tbSplitTable`

        end

        local nMod = mod(nCount, nOfPage) -- Chia lấy phần dư nMod = 5

        if nMod > 0 then -- Nếu phần dư > 0 (trong 1 vài trường hợp thì nCount chia hết cho nOfPage)

            local tbTemp = {} -- tạo 1 bảng tạm khác

            for i = nCount - nMod + 1, nCount do -- Chạy vòng lặp từ 31 - > 35 (35 - 5 + 1 = 31)

                tinsert(tbTemp, table[i]) -- insert vào bảng tạm

            end

            tinsert(tbSplitTable, tbTemp) -- tiếp tục insert `tbTemp` vào `tbSplitTable`
            -- Lúc này các phần tử từ 31 -> 35 sẽ nằm trong table thứ 4 của `tbSplitTable`

        end

    else -- Nếu số phần từ của `table` nhỏ hơn hoặc bằng số phần tử mỗi trang nCount <= nOfPage

        tbSplitTable = table -- Không cần phân trang mà gán trực tiếp cho `tbSplitTable` 

    end

    return tbSplitTable -- trả về kết quả là 1 table đã được phân trang

end
```

### 2. Xử lý table đã được phân trang

```lua
function Boss_HK( nPage ) -- function này sẽ nhận tham số là nPage (số trang)

    local tbBossHK = PhanTrang(tbBoss, 10) -- Phân trang `tbBoss` thành 1 table mà mỗi phần tử chỉ chứa thông tin 10 Boss rồi gán cho tbBossHK

    local tbOpt = {}

    if not nPage or nPage == 1 then -- Nếu chưa có số trang hoặc số trang là 1

        for i = 1, 10 do -- Chạy vòng lặp từ 1 đến 10 để show tên boss 

            tinsert(tbOpt, { tbBossHK[1][i].szName, Call_Boss, { tbBossHK[1], i } })
            -- Show tên Boss và function Gọi boss (Call_Boss) truyền các tham số tương ứng với trang 1

        end

        tinsert(tbOpt, { "Trang sau", Boss_HK, { 2 } })
        -- Vì đây là trang 1 nên thêm dòng Trang sau như yêu cầu 2 của bài toán.
        -- Trường hợp này ta fix cố định tham số nPage = 2

    else

        local nCount = getn(tbBossHK) -- Đếm số phần tử của tbBossHK (table này là table đã phân trang) (=4)

        if nPage < nCount then -- Nếu số trang vẫn còn < số phần tử của tbBossHK (4)

            for i = 1, 10 do -- Chạy vòng lặp để show tên Boss 

                tinsert(tbOpt, { tbBossHK[nPage][i].szName, Call_Boss, { tbBossHK[nPage], i } })
                -- Show tên Boss và function gọi Call_Boss với các tham số tương ứng với số trang

            end

            tinsert(tbOpt, { "Trang sau", Boss_HK, { nPage + 1 } })
            -- Thêm dòng trang sau theo yêu cầu 3 của bài toán
            -- Tham số nPage sẽ được tăng lên 1

        else -- Khi số trang = số phần tử của tbBossHK (4)

            for i = 1, getn(tbBossHK[nCount]) do -- Chỉ chạy vòng lặp từ 1 đến số phần tử của tbBossHK[4] = 5

                tinsert(tbOpt, { tbBossHK[nCount][i].szName, Call_Boss, { tbBossHK[nCount], i } })
                -- Show tên Boss và function gọi Call_Boss với các tham số tương ứng

            end

        end

        if nPage > 1 then -- Nếu số trang > 1

            tinsert(tbOpt, { "Trang tr­íc", Boss_HK, { nPage - 1 } })
            -- Thêm dòng trang trước theo yêu cầu 2 của bài toán
            -- Tham số nPage sẽ bị giảm xuống 1

        end

    end

    tbDialog:Show(tbOpt, nil, "Mêi <sex>chän Boss muèn gäi<pic=46><color>") -- Hiển thị dialog tương tác với người chơi

end
```

### Hàm gọi Boss

Hàm này nhận 2 tham số **tbBoss** và **nIndex** được truyền vào bên trên để thực hiện việc gọi Boss với **nIndex** tương ứng

Vì hàm này tôi không tự viết, chỉ tham khảo của người khác và sửa lại cho thích hợp với bài toán nên ko comment giải thích.

```lua
function Call_Boss( tbBoss, nIndex )

    if GetFightState() == 0 then

        Talk(1, "", "Kh«ng thÓ th¶ boss ë nh÷ng n¬i phi chiÕn ®Êu ®­îc.")

        return

    end

    local Boss = tbBoss[nIndex];

    local nw, nx, ny = GetWorldPos();

    local clBoss = AddNpcEx(Boss.nBossId, Boss.nLevel, Boss.nSeries, SubWorldID2Idx(nw), nx * 32,

                       ny * 32, 1, Boss.szName, 1);

    SetNpcDeathScript(clBoss, "\\script\\missions\\boss\\bosstieu.lua")

    SetNpcParam(clBoss, 1, Boss.nBossId); -- l­u id boss.

    SetNpcTimer(clBoss, 120 * 60 * 18)

    local W, X, Y = GetWorldPos();

    str = format("<color=yellow>%s<color> ®· xuÊt hiÖn t¹i <color=yellow>%s (%d,%d)<color>",

              Boss.szName, SubWorldName(SubWorld), floor(X / 8), floor((Y + 5) / 16))

    local handle = OB_Create();

    ObjBuffer:PushObject(handle, str)

    RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)

    OB_Release(handle)

end
```
