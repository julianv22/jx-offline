Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
--function main()
--	dofile("script/global/magicscriptitem/dataubitich.lua")
	
	
--	Msg2Player(myTaskValueType)
--	return 1
--end



function main(nItemIndex)
	dofile("script/global/gm/dataulenhbai.lua")

	local szTitle =  "<npc>Chµo mõng b¹n ®Õn víi thÕ giíi<color=red> Vâ L©m TruyÒn Kú <color>.<enter>Bæn trang muèn mang ®Õn cho c¸c b¹n mét s©n ch¬i lµnh m¹nh vµ æn ®Þnh l©u dµi...!<enter><color=red>Youtube: PYTA Gaming<color> Chóc c¸c nh©n sü b«n tÈu giang hå vui vÎ t¹i <color=green>ThÕ Giíi ¶o<color>. Xin ch©n thµnh c¶m ¬n quý nh©n sü... !"
		local tbOpt =
	{
		{"Hoµn thµnh nhiÖm vô ®­îc giao ngay lËp tøc",DaTau_HT},	
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle, tbOpt)	
	return 1
--	local LoiThoai = "Cuèn bÝ tÞch ghi chÐp l¹i nh÷ng bÝ mËt cña D· TÈu vÒ nhiÖm vô truy t×m <color=green>MËt ChÝ<color> vµ <color=green>§Þa §å ChÝ<color><enter>HiÖn t¹i <color=yellow>D· TÈu<color> ®ang giao ng­¬i lµm nhiÖm vô : "..tl_gettaskinfo()
--	local tb = {}
--	tinsert(tb,{"Hoµn thµnh nhiÖm vô ®­îc giao ngay lËp tøc",DaTau_HT})
--	SayEx(LoiThoai,tb)
--	return 1
end
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
tbOptionFindGood = {
{97,0,"Søc m¹nh"},
{98,3,"Th©n Ph¸p"},
{99,2,"Sinh KhÝ"},
{101,0,"Kh¸ng §éc"},
{105,4,"Kh¸ng B¨ng"},
{102,2,"Kh¸ng Ho¶ - Thuû"},
{103,1,"Kh¸ng L«i - Méc"},

--96: Phuc hoi the luc / Day Chuyen, Nhan
--92: Phuc hoi noi luc / Ngoc Boi
--88: Phuc hoi sinh luc / Dai Lung (0,6,0)
}
tbOptionFindGoodShowGood = {
{97,0,{0,3,0,10},2,"Søc m¹nh"},
{98,3,{0,3,0,10},2,"Th©n Ph¸p"},
{99,2,{0,3,0,10},2,"Sinh KhÝ"},
{101,0,{0,3,0,10},2,"Kh¸ng §éc"},
{105,4,{0,3,0,10},2,"Kh¸ng B¨ng"},
{102,2,{0,3,0,10},2,"Kh¸ng Ho¶ - Thuû"},
{103,1,{0,3,0,10},2,"Kh¸ng L«i - Méc"},
{108,4,{0,3,0,10},2,"Gi¶m thêi gian tróng ®éc - Thæ"},
{110,2,{0,3,0,10},2,"Gi¶m thêi gian cho¸ng - Thuû"},
{106,3,{0,3,0,10},2,"Gi¶m thêi lµm chËm - ho¶"},
{88,99,{0,6,0,10},1,"Phôc håi sinh lùc / §ai l­ng"},
{92,99,{0,9,0,10},1,"Phôc håi néi lùc / Ngäc Béi / H­¬ng nang"},
{96,99,{0,3,0,10},1,"Phôc håi thÓ lùc / nhÉn"},
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
		tinsert(tbSayOpt, {"Trang Tr­íc", SayEx, {nDesc,tbOpt,nSelectPerPage, nPage - 1}})
	end
	if nEnd < nTotalSelect then
		tinsert(tbSayOpt, {"Trang Sau ", SayEx, {nDesc,tbOpt,nSelectPerPage, nPage + 1}})
	end
	tinsert(tbSayOpt, {"KÕt thóc ®èi tho¹i"})
	CreateNewSayEx(nDesc,tbSayOpt)
end;

function DaTau_HT()
	myTaskType = tl_getplayertasktype() --KiÓm tra lo¹i nhiÖm vô ®ang lµm lµ nhiÖm vô g×, nÕu b»ng 4 th× míi lµ nhiÖm vô t×m ®Þa ®å chÝ
	--6: T×m sè l­îng m¶nh b¶n ®å s¬n hµ x· t¾c
	myTaskID = tl_gettasktablecol()
	if myTaskType == 1 then
		return Talk(1, "", "BÝ tÞch kh«ng ghi chÐp c¸ch thøc hoµn thµnh nhiÖm vô lÇn nµy, xin h·y kiÓm tra l¹i.")
	end
	if myTaskType == 2 then --T×m item cã option
		local myGenre,myDetail,myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre")), tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail")), tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		local myGoodsFive = TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive") --Ngò hµnh
		myMagicID = TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName") --ID cña option cÇn t×m kiÕm
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		if (myGoodsFive == "n") then --NÕu nhiÖm vô d· tÈu kh«ng yªu cÇu ngò hµnh mãn ®å
		--n: NghÜa lµ Mãn ®å D· TÈu yªu cÇu ko cÇn ngò hµnh g× c¶
			if (myMagicID ~= "n") then --yªu cÇu option kÌm theo
				for i=1,getn(tbOptionFindGood) do
					if tbOptionFindGood[i][1] == tonumber(myMagicID) then --®©y lµ nh÷ng option cã yªu cÇu ngò hµnh, option cña dßng 2
						myGoodsFive = tbOptionFindGood[i][2]
						LoaiDong = 2 --Option Èn
						myMagicID = tonumber(myMagicID)
					break --t×m ®­îc item ®Õn ®©y nã tho¸t vßng lÆp for. Tøc lµ c¸i ®o¹n ë d­íi sÏ ko ch¹y n÷a
					end
					--cã ®ßi option nh­ng option kh«ng yªu cÇu ngò hµnh
						myGoodsFive = random(0,4)
						LoaiDong = 1 --dßng 1
						myMagicID = tonumber(myMagicID)
				end
			end
		else --®· yªu cÇu ngò hµnh
			myGoodsFive = tonumber(myGoodsFive)
			LoaiDong = 2 --Option Èn
		end
		myLevel = TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level")
		if (myLevel == "n") then --Tøc lµ lo¹i nµo còng ®­îc kh«ng quan träng
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
		if (myMagicID == "n") then --t×m item kh«ng cÇn option, th× sÏ cã ngò hµnh kÌm theo
			Item = AddItem(myGenre,myDetail,myParticular,myLevel,myGoodsFive,100,10)
		else --t×m item yªu cÇu option lµ sÏ cã kho¶ng min max
			local magictype
			SoVongLap = 0
			while magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax do --trong khi option ch­a ®óng option cÇn t×m
				local Item = AddItem(myGenre,myDetail,myParticular,myLevel,myGoodsFive,100,10)
				magictype, p1 = GetItemMagicAttrib(Item,LoaiDong)
				if magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax then
					RemoveItemByIndex(Item)
				end
				SoVongLap = SoVongLap + 1
				if SoVongLap == 1000 then Msg2Player("Kh«ng t×m ®­îc") break end
			end
		end
	return
	end
	if myTaskType == 3 then
	--T×m 1 mãn ®å(lo¹i nµo còng ®­îc) cã option kÌm theo
	myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
	myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
	myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
	for i=1,getn(tbOptionFindGoodShowGood) do
		if tbOptionFindGoodShowGood[i][1] == myMagicID then --lµ nh÷ng option cã yªu cÇu ngò hµnh hoÆc ®å ®Æc biÖt míi cã
			nG,nD,nP,nLevel = tbOptionFindGoodShowGood[i][3][1],tbOptionFindGoodShowGood[i][3][2], tbOptionFindGoodShowGood[i][3][3],tbOptionFindGoodShowGood[i][3][4]
			nLoaiDong = tbOptionFindGoodShowGood[i][4]
			if tbOptionFindGoodShowGood[i][2] == 99 then
				nNguHanh = random(0,4)
			else
				nNguHanh = tbOptionFindGoodShowGood[i][2]
			end
		break
		end
		--nh÷ng option ch¼ng ®Æc biÖt g× nh­ sinh lùc, néi lùc thÓ lùc
		nG,nD,nP,nLevel,nLoaiDong,nNguHanh = 0,3,0,10,1,random(0,4)
	end
	--Msg2Player(nNguHanh)
	--Msg2Player(nG)
	--Msg2Player(nD)
	--Msg2Player(nP)
	--Msg2Player(nLevel)
	local magictype, p1
	SoVongLap = 0
	while magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax do --trong khi option ch­a ®óng option cÇn t×m
		local Item = AddItem(nG,nD,nP,nLevel,nNguHanh,100,10)
		magictype, p1 = GetItemMagicAttrib(Item,nLoaiDong)
		if magictype ~= myMagicID or p1 < myMagicMin or p1 > myMagicMax then
			RemoveItemByIndex(Item)
		end
		SoVongLap = SoVongLap + 1
		--Msg2Player(SoVongLap)
		if SoVongLap == 1000 then Msg2Player("Kh«ng t×m ®­îc") break end
	end
	return
	end
	if myTaskType == 4 then
		--Talk(1, "", "BÝ tÞch kh«ng ghi chÐp c¸ch thøc hoµn thµnh nhiÖm vô lÇn nµy, xin h·y kiÓm tra l¹i.")
		--return 1
		nt_setTask(1025,15)
		Talk(1, "", "NhiÖm vô "..tl_gettaskinfo().." ®· Hoµn Thµnh.")
	return
	end
	if myTaskType == 5 then --NhiÖm vô n©ng c¸c lo¹i ®iÓm danh väng, phóc duyªn, tèng kim, pk
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType")) --C¸i gi¸ trÞ quyÕt ®Þnh nã lµ lo¹i nhiÖm vô t¨ng kinh nghiÖm, danh väng, phóc duyªn, tèng kim, pk.....
		--2: N©ng kinh nghiÖm
		--3: Danh väng
		--4: Phóc duyªn
		--5: PK
		--6: Tèng Kim
		myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue")) --Gi¸ trÞ chØ ra bao nhiªu ®iÓm kn, danh väng, phóc duyªn, pk, tèng kim.....cÇn ph¶i n©ng lªn
		if myTaskValueType == 2 then --n©ng kinh nghiÖm
			nt_setTask(1034,-1*myTaskValue)
			Talk(1, "", "NhiÖm vô "..tl_gettaskinfo().." ®· Hoµn Thµnh.")
			--Msg2Player(nt_getTask(1034))
			--Msg2Player(nt_getTask(1033))
		else
		--nt_getTask(1026) sÏ lµ Task chung ®Ó tÝnh c¸c lo¹i ®iÓm cßn l¹i
			nt_setTask(1026,-1*myTaskValue)
			Talk(1, "", "NhiÖm vô "..tl_gettaskinfo().." ®· Hoµn Thµnh.")
		end
	return
	end
	if myTaskType == 6 then --T×m sè l­îng m¶nh b¶n ®å s¬n hµ x· t¾c
		nt_setTask(1027,100)
		Talk(1, "", "NhiÖm vô "..tl_gettaskinfo().." ®· Hoµn Thµnh.")
	return
	end
end

