tbVNGWORDPOS= tbVNGWORDPOS or {}
tbVNGWORDPOS.tbOtherMap = {
		{523,1579,3121	,"Minh nguy�t tr�n T��ng D��ng",},
		{521,1579,3121	,"Minh nguy�t tr�n Th�nh ��",},
		{520,1579,3121	,"Minh nguy�t tr�n Ph��ng T��ng",},
		{525,1579,3121	,"Minh nguy�t tr�n ��i L�",},
		{524,1579,3121	,"Minh nguy�t tr�n D��ng Ch�u",},
		{522,1579,3121	,"Minh nguy�t tr�n Bi�n Kinh",},
		{526,1579,3121	,"Minh nguy�t tr�n L�m An",},
		{55,1602,3125		,"��o Hoa Nguy�n",},
	};




function tbVNGWORDPOS:GotoOtherMap()
	local tab_Content = {};
	local nCount = getn(self.tbOtherMap);
	for i = 1, nCount do
		tinsert(tab_Content, self.tbOtherMap[i][4].."/#tbVNGWORDPOS:GotoStepPos( "..i..")");
	end
	tinsert(tab_Content, "R�i kh�i/no");
	Say("Th�n h�nh ph�, �i ��n n�i ng��i mu�n.", getn(tab_Content), tab_Content);
end

function tbVNGWORDPOS:GotoStepPos(nIdx)
	local tbOtherMap = self.tbOtherMap[nIdx];
	NewWorld(tbOtherMap[1], tbOtherMap[2], tbOtherMap[3]);
	SetFightState(0);
	Msg2Player("Xin h�y ng�i y�n, ch�ng ta �i"..tbOtherMap[4].." n�o");
end

