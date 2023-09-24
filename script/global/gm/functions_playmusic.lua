-------------------------------Play Music-------------------------------------------
tbMusic = {
	[1] = { szName = "EDM Gaming Music" , szLink = "\\music\\EDMGamingMusicMixCovered.mp3"},
	[2] = { szName = "Nh¹c kh«ng biÕt tªn" , szLink = "\\music\\vdel.mp3"},
	[3] = { szName = "Nh÷ng gi©y phóc b×nh yªn" , szLink = "\\music\\BinhYenNhungPhutGiay.mp3"},
	[4] = { szName = "Ch¾c ai ®ã sÏ vÒ (New Version)" , szLink = "\\music\\ChacAiDoSeVeNewVersion.mp3"},
	[5] = { szName = "Chóng ta kh«ng thuéc vÒ nhau" , szLink = "\\music\\ChungTaKhongThuocVeNhau.mp3"},
	[6] = { szName = "Em cña ngµy h«m qua" , szLink = "\\music\\EmCuaNgayHomQua.mp3"},
	[7] = { szName = "N¾ng Êm xa dÇn" , szLink = "\\music\\NangAmXaDan.mp3"},
	[8] = { szName = "N¾ng Êm xa dÇn (remix)" , szLink = "\\music\\NangAmXaDanOnionnRemix.mp3"},
	[9] = { szName = "Nh­ ngµy h«m qua" , szLink = "\\music\\NhuNgayHomQua.mp3"},
	[10] = { szName = "Remember Me" , szLink = "\\music\\RememberMe.mp3"},
	[11] = { szName = "You Of Yesterday" , szLink = "\\music\\YouOfYesterday.mp3"},
}
function takeMusic()
	local szTitle = "Xin chµo ! §¹i hiÖp nghe nh¹c g× ?"
	local tbOpt= {}
	for i = 1 , getn(tbMusic) do
		tinsert(tbOpt,{tbMusic[i].szName,playMusic,{i}})
	end
	tinsert(tbOpt,{"KÕt thóc ®èi tho¹"})
	CreateNewSayEx(szTitle, tbOpt)
end
function playMusic(nIndex)
	PlayMusic(tbMusic[nIndex].szLink)
end
--------------------------------------------------------------------------------