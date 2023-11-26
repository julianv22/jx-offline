Include("\\script\\lib\\timerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("script\\updateconfig\\tasklist.lua")
Include("\\script\\lib\\log.lua")
------------------------------------------------------
tbWinCashMsg = {
	"Ng­êi Ch¬i %s §· ThËt May M¾n NhËn §îc %s V¹n L­îng Tõ BÇu Cua",
}
-----------------------------------------------------------------
tbWinCoinMsg = {
	"Ng­êi Ch¬i %s §· ThËt May M¾n NhËn §îc %s TiÒn Xu Tõ BÇu Cua",
}
---------------------------------------------------------------------
FishGame = FishGame or {
	tbPlayerList = {},--luu toan bo thong tin nguoi choi: {nIndex,{Chua so cac con danh:["Bau"] = nCash,["Cua"] = nCash....},nAwardCash = 0-- luu so tien thang neu nguoi choi out game hoac trong truong hop dac biet khong add duoc tien}
	nResult = {},--{"Bau","Cua"}
	nTotalCash = 0,-- luu toan bo so tien danh
	nTotalCoin = 0,-- lua toan bo so xu danh
	nStarted = 0,
	nTOTAL_RATE = 0,
	DOUBLE_RATE = 2,-- ti le ra 2 mat giong nhau ti le chuan
	NORMAL_RATE = 1,-- ti le ra 3 mat khac nhau ti le chuan
}
------------------------------------------------------------------------------
tbAllResult = tbAllResult or {}

function FishGame:Init()
	--1 phut se chay 1 lan
	if self.nStarted == 0 then
		self.TimerID = TimerList:AddTimer(self, 18*60);
		self.nStarted = 1
		self.nStatus = 0
	end
	--khoi tao bang gia tri
	local nLuckRand = random(1,10)
	self.NORMAL_RATE = nLuckRand
	self.DOUBLE_RATE = nLuckRand * 2
	for i = 1,6 do
		for j = 1,6 do
			for k = 1,6 do
				if i == j or i == k or k == j then
					tinsert(tbAllResult,1,{i,j,k,self.DOUBLE_RATE})
					self.nTOTAL_RATE = self.nTOTAL_RATE + self.DOUBLE_RATE
				else
					tinsert(tbAllResult,1,{i,j,k,self.NORMAL_RATE})
					self.nTOTAL_RATE = self.nTOTAL_RATE + self.NORMAL_RATE
				end
			end
		end
	end
end
------------------------Ket Thuc Bang Gia Tri------------------------------------------------------------------------------------
function FishGame:Stop()
	self.nStarted = 0
	TimerList:DelTimer(self.TimerID);
end

FishGame:Init()
----------------------Ket Qua Dang Chay---------------------------
function FishGame:GetNextResult()
local nRand = random(1,self.nTOTAL_RATE)
local nResult = 0
local nValue = 0
	for i = 1,getn(tbAllResult) do
		nValue = nValue + tbAllResult[i][4]
		if nRand <= nValue then
			nResult = i
			break
		end
	end
	if nResult == 0 then
		return nil
	end
	local tbResult = {ChangeToString(tbAllResult[nResult][1]),ChangeToString(tbAllResult[nResult][2]),ChangeToString(tbAllResult[nResult][3])}
	for i = 1, 3 do
		self.nResult[tbResult[i]] = self.nResult[tbResult[i]] or 0
		self.nResult[tbResult[i]] = self.nResult[tbResult[i]] + 1
	end
	local szMsg = format("<color=green>KÕt qu¶ ®ît nµy <color=yellow> %s , %s ,%s <color=green>. 1 phót n÷a cã thÓ ®Æt cöa<color>",tbResult[1],tbResult[2],tbResult[3])
	logplayer("dulieu/songbac.txt",format("Ket qua bau cua lan nay"..tbResult[1].."va"..tbResult[2].."va"..tbResult[3]))
	Msg2SubWorld(szMsg)
	return 1
end

function ChangeToString(nValue)
	if nValue == 1 then
		return "BÇu"
	elseif nValue == 2 then
		return "Cua"
	elseif nValue == 3 then
		return "T«m"
	elseif nValue == 4 then
		return "C¸"
	elseif nValue == 5 then
		return "Gµ"
	elseif nValue == 6 then
		return "Nai"
	end
end
--------------------------------------Chay Dot 2-------------------------------------------------------
function FishGame:CalAwardForPlayer()
local nLoseCash = 0
local nLoseCoint = 0
	for szName,tbInfo in self.tbPlayerList do
		for szChoice,nPoint in self.nResult do
			local tbKind = tbInfo.tbPut[szChoice]
			if tbKind then
				if tbKind.nCash then
					tbInfo.nAwardCash =  tbInfo.nAwardCash + (nPoint + 1)*tbKind.nCash
					nLoseCash = nLoseCash + (nPoint + 1)*tbKind.nCash
				end
				if tbKind.nCoin then
					tbInfo.nAwardCoin =  tbInfo.nAwardCoin + (nPoint + 1)*tbKind.nCoin
					nLoseCoint = nLoseCoint + (nPoint + 1)*tbKind.nCoin
				end
			end
		end
		tbInfo.tbPut = {} --Xoa Du Lieu Khi Nhan Thuong
	end
	WriteLog("Bau cua lan nay tong tien van dat "..self.nTotalCash.." thua "..nLoseCash)
	WriteLog("Bau cua lan nay tong tien don dat "..self.nTotalCoin.." thua "..nLoseCoint)
	self.nTotalCash = 0
	self.nTotalCoin = 0
	self.nResult = {}
end
-------------------------------------Chay Dot 3------------------------------------------------------------------------------------------
function FishGame:AddAwardForPlayer()
	for szName,tbInfo in self.tbPlayerList do
		if callPlayerFunction(tbInfo.nIndex,GetName) == szName and tbInfo.nAwardCash and tbInfo.nAwardCash > 0 then
			callPlayerFunction(tbInfo.nIndex,Earn,tbInfo.nAwardCash*10000)
			callPlayerFunction(tbInfo.nIndex,Msg2Player,format("Ng­¬i nhËn ®­îc sè tiÒn %d v¹n tõ Chñ Sßng Bµi",tbInfo.nAwardCash))
			if tbInfo.nAwardCash > 100  then
				Msg2SubWorld(format("Nh©n vËt <color=green>%s<color> ¨n ®­îc <color=yellow>%d tiÒn v¹n <color>tõ ho¹t ®éng BÇu cua. ThËt may m¾n",szName,tbInfo.nAwardCash))
				logplayer("dulieu/songbac.txt",format("Nhan vat %s th¾ng so tien %d v¹n",szName ,tbInfo.nAwardCash))
			end
			tbInfo.nAwardCash = 0
		end
		if callPlayerFunction(tbInfo.nIndex,GetName) == szName and tbInfo.nAwardCoin and tbInfo.nAwardCoin > 0 then
			local nCoin = tbInfo.nAwardCoin
			if nCoin <= 100 then
				callPlayerFunction(tbInfo.nIndex,AddStackItem,nCoin,4,417,1,1,0,0)
			else
				local nRound = nCoin/100
				for i=1,nRound do
					callPlayerFunction(tbInfo.nIndex,AddStackItem,100,4,417,1,1,0,0)
				end
				if mod(nCoin,100) > 0 then
					callPlayerFunction(tbInfo.nIndex,AddStackItem,mod(nCoin,100),4,417,1,1,0,0)
				end
			end
			callPlayerFunction(tbInfo.nIndex,Msg2Player,format("Ng­¬i nhËn ®­îc %d tiÒn ®ång tõ Chñ Sßng Bµi",nCoin))
			Msg2SubWorld(format("Nh©n vËt <color=green>%s<color> ¨n ®­îc <color=yellow>%d tiÒn ®ång <color>tõ ho¹t ®éng BÇu cua. ThËt may m¾n",szName,nCoin))
			logplayer("dulieu/songbac.txt",format("Nhan vat %s th¾ng so tien %d ®ång",szName ,nCoin))
			tbInfo.nAwardCoin = 0
		end
	end
end
--------------------------------Xem Thong Tin Dat Cua-----------------------------------------------------------------------------
function showFishGate()
local szName = GetName()
	if not FishGame.tbPlayerList[szName] then
		Talk(1,"","Ng­¬i Ch­a §Æt Cöa nµo...!")
		return
	end
	local pPlayer =FishGame.tbPlayerList[szName]
	local szMsg = ""
	for szChoice,tbKind in pPlayer.tbPut do
		szMsg = szMsg.."Cöa: <color=green>"..szChoice.."<color> ".."TiÒn ®Æt:"
		if tbKind.nCash then
			szMsg = szMsg.."<color=red>"..tbKind.nCash.."<color> v¹n "
		end
		if tbKind.nCoin then
			szMsg = szMsg.." <color=green>"..tbKind.nCoin.."<color> tiÒn ®ång"
		end
		szMsg=szMsg.."\n"
	end
	Say(szMsg,0)
end
------------------------------------Bat Dau Dat Cua-------------------------------------------------------------------------------------------
function OnChoseKind()
	Say("Ng­¬i muèn ch¬i kh« m¸u",3,
	"TiÒn V¹n/#joinFishGame(1)",
	"TiÒn Xu/#joinFishGame(2)",
	"Th«i ta thua nhiÒu qu¸ råi/no")
end

function joinFishGame(nKind)
	if FishGame.nStatus ~= 1 then
		Say("Ng­¬i cã gÊp qu¸ kh«ng §îi 1 phót n÷a míi cã thÓ ®Æt cöa nhÐ",0)
		return
	end
	FishGame:OnPlayerJoin(PlayerIndex,GetName())
		if nKind == 1 then
			local tbSay = {
			"BÇu/#OnChoose(1,1)",
			"Cua/#OnChoose(2,1)",
			"T«m/#OnChoose(3,1)",
			"C¸/#OnChoose(4,1)",
			"Gµ/#OnChoose(5,1)",
			"Nai/#OnChoose(6,1)",
			"Th«i ta kh«ng ch¬i n÷a/no"
		}
		Say("Ng­¬i chän con nµo",getn(tbSay),tbSay)
	else
			local tbSay = {
			"BÇu/#OnChoose(1,2)",
			"Cua/#OnChoose(2,2)",
			"T«m/#OnChoose(3,2)",
			"C¸/#OnChoose(4,2)",
			"Gµ/#OnChoose(5,2)",
			"Nai/#OnChoose(6,2)",
			"Th«i ta kh«ng ch¬i n÷a/no"
		}
		Say("Ng­¬i chän con nµo",getn(tbSay),tbSay)
	end
end
-----------------------------------Bat Dau khoi Tao--------------------------------------------------------
function OnChoose(nChoice,nKind)
	if nKind == 1 then
		local nMaxCount = 1000
		g_AskClientNumberEx(1,nMaxCount, format("TiÒn (1-%d) v¹n", nMaxCount), {FishGame.GetNumberFromClient,{FishGame,nChoice,nKind} })
	else
		local nMaxCount = 1000
		g_AskClientNumberEx(1,nMaxCount, format("TiÒn ®ång (1-%d)", nMaxCount), {FishGame.GetNumberFromClient,{FishGame,nChoice,nKind} })
	end
end

function FishGame:GetNumberFromClient(nChoice,nKind,nPutCash)
	self:OnPlayerPut(PlayerIndex,GetName(),nPutCash,nChoice,nKind)
end

function FishGame:OnPlayerPut(nPlayerIndex,szName,nPutCash,nChoice,nKind)
	if nPutCash > 1000 then
		Say("§õng cã ¨n gian...:D",0)
		return
	end
	if not self.tbPlayerList[szName] or self.tbPlayerList[szName].nIndex ~= nPlayerIndex then
		callPlayerFunction(nPlayerIndex,Say,"Cã lçi xay ra vui lßng liÖn hÖ GM ®Ó biÕt thªm chi tiÕt",0)
		return
	end
	local pPlayer = self.tbPlayerList[szName]
	local szChoice =""
	if nChoice == 1 then
		szChoice = "BÇu"
	elseif nChoice == 2 then
		szChoice = "Cua"
	elseif nChoice == 3 then
		szChoice = "T«m"
	elseif nChoice == 4 then
		szChoice = "C¸"
	elseif nChoice == 5 then
		szChoice = "Gµ"
	elseif nChoice == 6 then
		szChoice = "Nai"
	end

	if nKind == 1 then
		if pPlayer.tbPut[szChoice] and pPlayer.tbPut[szChoice].nCash and pPlayer.tbPut[szChoice].nCash + nPutCash >= 1000 then
			Say("Ng­¬i ®Æt qu¸ 1000 v¹n mét cöa råi. Th¾ng ta quÞt tiÒn lu«n ®ã:T...",0)
			return
		end
		local nOwnCash = callPlayerFunction(nPlayerIndex,GetCash)
		if nOwnCash < nPutCash * 10000 then
			callPlayerFunction(nPlayerIndex,Say,"Kh«ng ®ñ tiÒn mµ còng d¸m ®Æt cöa. §i chç kh¸c ch¬i gióp kÎ kiÕt x¸c nµy",0)
			return
		end
		callPlayerFunction(nPlayerIndex,Pay,nPutCash*10000)
		pPlayer.tbPut[szChoice] = pPlayer.tbPut[szChoice] or {}
		pPlayer.tbPut[szChoice].nCash = pPlayer.tbPut[szChoice].nCash or 0
		pPlayer.tbPut[szChoice].nCash = pPlayer.tbPut[szChoice].nCash + nPutCash	
		logplayer("dulieu/songbac.txt",format("Nhan vat %s dat cua %s so tien %d v¹n",szName,szChoice,nPutCash))
		if nPutCash >= 1 then
			Msg2SubWorld(format("Con b¹c <color=green> %s <color> quyÕt ch¬i Tíi bÕn víi Chñ Sßng Bµi víi  <color=yellow> %d v¹n <color> ",szName,nPutCash))
		end
			self.nTotalCash = self.nTotalCash + nPutCash
		else
		if pPlayer.tbPut[szChoice] and pPlayer.tbPut[szChoice].nCoin and pPlayer.tbPut[szChoice].nCoin + nPutCash >= 1000 then
			Say("Ng­¬i ®Æt qu¸ 1000 tiÒn ®ång mét cöa råi. §õng kh« m¸u nh­ thÕ chø..",0)
			return
		end
		local nOwnCoin = callPlayerFunction(nPlayerIndex,CalcEquiproomItemCount,4, 417, 1, -1)
		if nOwnCoin < nPutCash then
			callPlayerFunction(nPlayerIndex,Say,"Kh«ng ®ñ tiÒn ®ång mµ còng d¸m ®Æt cöa. TÐ ®i",0)
			return
		end
		if callPlayerFunction(nPlayerIndex,ConsumeEquiproomItem,nPutCash, 4, 417, 1, -1) ~= 1 then
			callPlayerFunction(nPlayerIndex,Say,"Xin lçi cã lçi xÈy nghiªm träng vui lßng liªn hÖ GM")
			return
		end
		pPlayer.tbPut[szChoice] = pPlayer.tbPut[szChoice] or {}
		pPlayer.tbPut[szChoice].nCoin = pPlayer.tbPut[szChoice].nCoin or 0
		pPlayer.tbPut[szChoice].nCoin = pPlayer.tbPut[szChoice].nCoin + nPutCash
		logplayer("dulieu/songbac.txt",format("Nhan vat %s dat cua %s so tien %d tiÒn ®ång",szName,szChoice,nPutCash))
		if nPutCash >= 1 then
			Msg2SubWorld(format("Nh©n vËt <color=green> %s <color> mang <color=yellow> %d tiÒn ®ång <color> ®Æt bÇu cua.",szName,nPutCash))
		end
		self.nTotalCoin = self.nTotalCoin + nPutCash
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function FishGame:OnPlayerJoin(nPlayerIndex,szName)
	if not self.tbPlayerList[szName] then
		self:AddNewPlayer(nPlayerIndex,szName)
		return
	end

	if self.tbPlayerList[szName].nAwardCash > 0 then-- tra lai tien thang truoc do
		callPlayerFunction(nPlayerIndex,Earn,self.tbPlayerList[szName].nAwardCash*10000 )
		callPlayerFunction(nPlayerIndex,Msg2Player,format("Ng­¬i nhËn ®­îc sè tiÒn %d v¹n tõ bÇu cua thËt may m¾n",self.tbPlayerList[szName].nAwardCash))
		logplayer("dulieu/songbac.txt",format("Nhan vat %s th¾ng so tien %d v¹n",szName ,self.tbPlayerList[szName].nAwardCash))
		self.tbPlayerList[szName].nAwardCash = 0
	end

	if self.tbPlayerList[szName].nAwardCoin > 0 then-- tra lai tien thang truoc do
		local nCoin = self.tbPlayerList[szName].nAwardCoin
		if nCoin <= 100 then
			callPlayerFunction(nPlayerIndex,AddStackItem,nCoin,4,417,1,1,0,0)
		else
			local nRound = nCoin/100
			for i = 1,nRound do
				callPlayerFunction(nPlayerIndex,AddStackItem,100,4,417,1,1,0,0)
			end
			if mod(nCoin,100) > 0 then
				callPlayerFunction(nPlayerIndex,AddStackItem,mod(nCoin,100),4,417,1,1,0,0)
			end
		end
		self.tbPlayerList[szName].nAwardCoin = 0
		callPlayerFunction(nPlayerIndex,Msg2Player,format("Ng­¬i nhËn ®­îc %d tiÒn ®ång tõ bÇu cua thËt may m¾n",nCoin))
		logplayer("dulieu/songbac.txt",format("Nhan vat %s th¾ng so tien %d ®ång",szName ,nCoin))
	end
	self.tbPlayerList[szName].nIndex = nPlayerIndex
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FishGame:AddNewPlayer(nPlayerIndex,szName)
	self.tbPlayerList[szName] = {
		nIndex = nPlayerIndex,
		tbPut ={},
		nAwardCash = 0,
		nAwardCoin = 0,
	}
end

function FishGame:OnTime()
local nNowTime = tonumber(date( "%H%M"))
local nMin = tonumber(GetLocalDate("%M"));
local nX = mod(nMin,2)
	if (nX == 0) then
		self.nStatus = 0
		if self:GetNextResult() ~= 1 then
			print("Ch­¬ng Tr×nh §· X¶y Ra Lçi...!")
			return
		end
		self:CalAwardForPlayer()
		self:AddAwardForPlayer()
	elseif (nX == 1) then
		self.nStatus = 1
		local szMsg = "<color=green>B©y giê b¹n cã thÓ ®Æt cöa BÇu Cua <color>"
		Msg2SubWorld(szMsg)
	else
		self.nStatus = 1
	end
	--------------Thêi Gian §ãng Më BÇu Cua----------------
	if (ChuSongBac == 1) then
		if (nNowTime >= 0 and nNowTime < 9999) then
		--if (nNowTime >= 0800 and nNowTime < 2200) then
			return 1
		end
		return self:Stop()
	end
	return self:Stop()
	-------------------------------------------------------
end

function logplayer(zFile,szMsg)
	local handle = openfile(zFile,"a")
	write(handle,format("%s\n",szMsg));
	closefile(handle);
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------