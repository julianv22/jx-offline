Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
--function main()
--	dofile("script/global/magicscriptitem/dataubitich.lua")
	
	
--	Msg2Player(myTaskValueType)
--	return 1
--end



function main(nItemIndex)
	dofile("script/global/gm/dataulenhbai.lua")

	local szTitle =  "<npc>Ch�o m�ng b�n ��n v�i th� gi�i<color=red> V� L�m Truy�n K� <color>.<enter>B�n trang mu�n mang ��n cho c�c b�n m�t s�n ch�i l�nh m�nh v� �n ��nh l�u d�i...!<enter><color=red>Youtube: PYTA Gaming<color> Ch�c c�c nh�n s� b�n t�u giang h� vui v� t�i <color=green>Th� Gi�i �o<color>. Xin ch�n th�nh c�m �n qu� nh�n s�... !"
		local tbOpt =
	{
		{"Ho�n th�nh nhi�m v� ���c giao ngay l�p t�c",DaTau_HT},	
		{"Tho�t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
	return 1
--	local LoiThoai = "Cu�n b� t�ch ghi ch�p l�i nh�ng b� m�t c�a D� T�u v� nhi�m v� truy t�m <color=green>M�t Ch�<color> v� <color=green>��a �� Ch�<color><enter>Hi�n t�i <color=yellow>D� T�u<color> �ang giao ng��i l�m nhi�m v� : "..tl_gettaskinfo()
--	local tb = {}
--	tinsert(tb,{"Ho�n th�nh nhi�m v� ���c giao ngay l�p t�c",DaTau_HT})
--	SayEx(LoiThoai,tb)
--	return 1
end
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
tbOptionFindGood = {
{97,0,"S�c m�nh"},
{98,3,"Th�n Ph�p"},
{99,2,"Sinh Kh�"},
{101,0,"Kh�ng ��c"},
{105,4,"Kh�ng B�ng"},
{102,2,"Kh�ng Ho� - Thu�"},
{103,1,"Kh�ng L�i - M�c"},

--96: Phuc hoi the luc / Day Chuyen, Nhan
--92: Phuc hoi noi luc / Ngoc Boi
--88: Phuc hoi sinh luc / Dai Lung (0,6,0)
}
tbOptionFindGoodShowGood = {
{97,0,{0,3,0,10},2,"S�c m�nh"},
{98,3,{0,3,0,10},2,"Th�n Ph�p"},
{99,2,{0,3,0,10},2,"Sinh Kh�"},
{101,0,{0,3,0,10},2,"Kh�ng ��c"},
{105,4,{0,3,0,10},2,"Kh�ng B�ng"},
{102,2,{0,3,0,10},2,"Kh�ng Ho� - Thu�"},
{103,1,{0,3,0,10},2,"Kh�ng L�i - M�c"},
{108,4,{0,3,0,10},2,"Gi�m th�i gian tr�ng ��c - Th�"},
{110,2,{0,3,0,10},2,"Gi�m th�i gian cho�ng - Thu�"},
{106,3,{0,3,0,10},2,"Gi�m th�i l�m ch�m - ho�"},
{88,99,{0,6,0,10},1,"Ph�c h�i sinh l�c / �ai l�ng"},
{92,99,{0,9,0,10},1,"Ph�c h�i n�i l�c / Ng�c B�i / H��ng nang"},
{96,99,{0,3,0,10},1,"Ph�c h�i th� l�c / nh�n"},
}

function SayEx(nDesc,tbOpt,nSelectPerPage,nPage)
	if nDesc == "" or nDesc == nil then nDesc = " " end
	local nTotalSelect = getn(tbOpt)
	if nPage == nil then nPage = 1 end
	local nStart = (nPage - 1) * nSelectPerPage + 1
	local nEnd = nStart + nSelectPerPage - 1
	if nStart > nTotalSelect then
		return
	end
	if nEnd > nTotalSelect then
		nEnd = nTotalSelect
	end
	local tbSayOpt = {}
	for i=nStart, nEnd do
		tinsert(tbSayOpt,{tbOpt[i][1],tbOpt[i][2],tbOpt[i][3]})
	end
	if nStart > 1 then
		tinsert(tbSayOpt, {"Trang Tr��c", SayEx, {nDesc,tbOpt,nSelectPerPage, nPage - 1}})
	end
	if nEnd < nTotalSelect then
		tinsert(tbSayOpt, {"Trang Sau ", SayEx, {nDesc,tbOpt,nSelectPerPage, nPage + 1}})
	end
	tinsert(tbSayOpt, {"K�t th�c ��i tho�i"})
	CreateNewSayEx(nDesc,tbSayOpt)
end;

function DaTau_HT()
	myTaskType = tl_getplayertasktype() --Ki�m tra lo�i nhi�m v� �ang l�m l� nhi�m v� g�, n�u b�ng 4 th� m�i l� nhi�m v� t�m ��a �� ch�
	--6: T�m s� l��ng m�nh b�n �� s�n h� x� t�c
	myTaskID = tl_gettasktablecol()
	if myTaskType == 1 then
		return Talk(1, "", "B� t�ch kh�ng ghi ch�p c�ch th�c ho�n th�nh nhi�m v� l�n n�y, xin h�y ki�m tra l�i.")
	end
	if myTaskType == 2 then --T�m item c� option
		local myGenre,myDetail,myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre")), tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail")), tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		local myGoodsFive = TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive") --Ng� h�nh
		myMagicID = TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName") --ID c�a option c�n t�m ki�m
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		if (myGoodsFive == "n") then --N�u nhi�m v� d� t�u kh�ng y�u c�u ng� h�nh m�n ��
		--n: Ngh�a l� M�n �� D� T�u y�u c�u ko c�n ng� h�nh g� c�
			if (myMagicID ~= "n") then --y�u c�u option k�m theo
				for i=1,getn(tbOptionFindGood) do
					if tbOptionFindGood[i][1] == tonumber(myMagicID) then --��y l� nh�ng option c� y�u c�u ng� h�nh, option c�a d�ng 2
						myGoodsFive = tbOptionFindGood[i][2]
						LoaiDong = 2 --Option �n
						myMagicID = tonumber(myMagicID)
					break --t�m ���c item ��n ��y n� tho�t v�ng l�p for. T�c l� c�i �o�n � d��i s� ko ch�y n�a
					end
					--c� ��i option nh�ng option kh�ng y�u c�u ng� h�nh
						myGoodsFive = random(0,4)
						LoaiDong = 1 --d�ng 1
						myMagicID = tonumber(myMagicID)
				end
			end
		else --�� y�u c�u ng� h�nh
			myGoodsFive = tonumber(myGoodsFive)
			LoaiDong = 2 --Option �n
		end
		myLevel = TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level")
		if (myLevel == "n") then --T�c l� lo�i n�o c�ng ���c kh�ng quan tr�ng
			myLevel = random(1,10)
		else
			myLevel = tonumber(myLevel)
		end
		
		--Msg2Player(myGenre)
		--Msg2Player(myDetail)
		--Msg2Player(myParticular)		
		--Msg2Player(myMagicID)
		--Msg2Player(myMagicMax)
		--Msg2Player(myMagicMin)		
		--Msg2Player(LoaiDong)		
		--Msg2Player(myGoodsFive)								
		if (myMagicID == "n") then --t�m item kh�ng c�n option, th� s� c� ng� h�nh k�m theo
			Item = AddItem(myGenre,myDetail,myParticular,myLevel,myGoodsFive,100,10)
		else --t�m item y�u c�u option l� s� c� kho�ng min max
			local magictype
			SoVongLap = 0
			while magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax do --trong khi option ch�a ��ng option c�n t�m
				local Item = AddItem(myGenre,myDetail,myParticular,myLevel,myGoodsFive,100,10)
				magictype, p1 = GetItemMagicAttrib(Item,LoaiDong)
				if magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax then
					RemoveItemByIndex(Item)
				end
				SoVongLap = SoVongLap + 1
				if SoVongLap == 1000 then Msg2Player("Kh�ng t�m ���c") break end
			end
		end
	return
	end
	if myTaskType == 3 then
	--T�m 1 m�n ��(lo�i n�o c�ng ���c) c� option k�m theo
	myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
	myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
	myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
	for i=1,getn(tbOptionFindGoodShowGood) do
		if tbOptionFindGoodShowGood[i][1] == myMagicID then --l� nh�ng option c� y�u c�u ng� h�nh ho�c �� ��c bi�t m�i c�
			nG,nD,nP,nLevel = tbOptionFindGoodShowGood[i][3][1],tbOptionFindGoodShowGood[i][3][2], tbOptionFindGoodShowGood[i][3][3],tbOptionFindGoodShowGood[i][3][4]
			nLoaiDong = tbOptionFindGoodShowGood[i][4]
			if tbOptionFindGoodShowGood[i][2] == 99 then
				nNguHanh = random(0,4)
			else
				nNguHanh = tbOptionFindGoodShowGood[i][2]
			end
		break
		end
		--nh�ng option ch�ng ��c bi�t g� nh� sinh l�c, n�i l�c th� l�c
		nG,nD,nP,nLevel,nLoaiDong,nNguHanh = 0,3,0,10,1,random(0,4)
	end
	--Msg2Player(nNguHanh)
	--Msg2Player(nG)
	--Msg2Player(nD)
	--Msg2Player(nP)
	--Msg2Player(nLevel)
	local magictype, p1
	SoVongLap = 0
	while magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax do --trong khi option ch�a ��ng option c�n t�m
		local Item = AddItem(nG,nD,nP,nLevel,nNguHanh,100,10)
		magictype, p1 = GetItemMagicAttrib(Item,nLoaiDong)
		if magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax then
			RemoveItemByIndex(Item)
		end
		SoVongLap = SoVongLap + 1
		--Msg2Player(SoVongLap)
		if SoVongLap == 1000 then Msg2Player("Kh�ng t�m ���c") break end
	end
	return
	end
	if myTaskType == 4 then
		--Talk(1, "", "B� t�ch kh�ng ghi ch�p c�ch th�c ho�n th�nh nhi�m v� l�n n�y, xin h�y ki�m tra l�i.")
		--return 1
		nt_setTask(1025,15)
		Talk(1, "", "Nhi�m v� "..tl_gettaskinfo().." �� Ho�n Th�nh.")
	return
	end
	if myTaskType == 5 then --Nhi�m v� n�ng c�c lo�i �i�m danh v�ng, ph�c duy�n, t�ng kim, pk
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType")) --C�i gi� tr� quy�t ��nh n� l� lo�i nhi�m v� t�ng kinh nghi�m, danh v�ng, ph�c duy�n, t�ng kim, pk.....
		--2: N�ng kinh nghi�m
		--3: Danh v�ng
		--4: Ph�c duy�n
		--5: PK
		--6: T�ng Kim
		myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue")) --Gi� tr� ch� ra bao nhi�u �i�m kn, danh v�ng, ph�c duy�n, pk, t�ng kim.....c�n ph�i n�ng l�n
		if myTaskValueType == 2 then --n�ng kinh nghi�m
			nt_setTask(1034,-1*myTaskValue)
			Talk(1, "", "Nhi�m v� "..tl_gettaskinfo().." �� Ho�n Th�nh.")
			--Msg2Player(nt_getTask(1034))
			--Msg2Player(nt_getTask(1033))
		else
		--nt_getTask(1026) s� l� Task chung �� t�nh c�c lo�i �i�m c�n l�i
			nt_setTask(1026,-1*myTaskValue)
			Talk(1, "", "Nhi�m v� "..tl_gettaskinfo().." �� Ho�n Th�nh.")
		end
	return
	end
	if myTaskType == 6 then --T�m s� l��ng m�nh b�n �� s�n h� x� t�c
		nt_setTask(1027,100)
		Talk(1, "", "Nhi�m v� "..tl_gettaskinfo().." �� Ho�n Th�nh.")
	return
	end
end

