tbBoss = {}
for i=1590,1630 do
	tinsert(tbBoss, {i-235,95,5,996,i,i*2,0,"NPC Luy�n C�ng",1," "})
end
	--{Id, Level, Series, SubWorldId, xPos, yPos, Name},
	-- {1355,95,0,996,1594,3183,0,"T�nh Th�ng",1," "},
	-- {1356,95,0,996,1594,3182,0,"Ng�o Thi�n T��ng Qu�n",1," "},
	-- {523,95,1,996,1599,3181,0,"Li�u Thanh Thanh",1," "},
	-- {1358,95,1,996,1598,3186,0,"T�y V��ng T� ��c",1," "},
	-- {513,95,2,996,1597,3184,0,"Di�u Nh�",1," "},
	-- {1360,95,2,996,1593,3189,0,"Do�n Thanh V�n",1," "},
	-- {1361,95,3,996,1602,3187,0,"H�c Y S�t Th�",1," "},
	-- {1362,95,3,996,1603,3185,0,"Th�p Ph��ng C�u Di�t",1," "},
	-- {511,95,4,996,1598,3181,0,"Tr��ng T�ng Ch�nh",1," "},
	-- {1364,95,4,996,1597,3191,0,"Thanh Y T�",1," "},


function add_boss_bailuyencong(Tab1)
	for i = 1 , getn(Tab1) do
		Mid = SubWorldID2Idx(Tab1[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = Tab1[i][5] * 32
			TabValue6 = Tab1[i][6] * 32
			newmonsterindex = AddNpc(Tab1[i][1],Tab1[i][2],Mid,TabValue5,TabValue6,Tab1[i][7],Tab1[i][8],Tab1[i][11]);
			SetNpcScript(newmonsterindex, Tab1[i][10]);
		end;
	end;
end