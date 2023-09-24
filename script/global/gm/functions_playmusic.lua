-------------------------------Play Music-------------------------------------------
tbMusic = {
	[1] = { szName = "EDM Gaming Music" , szLink = "\\music\\EDMGamingMusicMixCovered.mp3"},
	[2] = { szName = "Nh�c kh�ng bi�t t�n" , szLink = "\\music\\vdel.mp3"},
	[3] = { szName = "Nh�ng gi�y ph�c b�nh y�n" , szLink = "\\music\\BinhYenNhungPhutGiay.mp3"},
	[4] = { szName = "Ch�c ai �� s� v� (New Version)" , szLink = "\\music\\ChacAiDoSeVeNewVersion.mp3"},
	[5] = { szName = "Ch�ng ta kh�ng thu�c v� nhau" , szLink = "\\music\\ChungTaKhongThuocVeNhau.mp3"},
	[6] = { szName = "Em c�a ng�y h�m qua" , szLink = "\\music\\EmCuaNgayHomQua.mp3"},
	[7] = { szName = "N�ng �m xa d�n" , szLink = "\\music\\NangAmXaDan.mp3"},
	[8] = { szName = "N�ng �m xa d�n (remix)" , szLink = "\\music\\NangAmXaDanOnionnRemix.mp3"},
	[9] = { szName = "Nh� ng�y h�m qua" , szLink = "\\music\\NhuNgayHomQua.mp3"},
	[10] = { szName = "Remember Me" , szLink = "\\music\\RememberMe.mp3"},
	[11] = { szName = "You Of Yesterday" , szLink = "\\music\\YouOfYesterday.mp3"},
}
function takeMusic()
	local szTitle = "Xin ch�o ! ��i hi�p nghe nh�c g� ?"
	local tbOpt= {}
	for i = 1 , getn(tbMusic) do
		tinsert(tbOpt,{tbMusic[i].szName,playMusic,{i}})
	end
	tinsert(tbOpt,{"K�t th�c ��i tho�"})
	CreateNewSayEx(szTitle, tbOpt)
end
function playMusic(nIndex)
	PlayMusic(tbMusic[nIndex].szLink)
end
--------------------------------------------------------------------------------