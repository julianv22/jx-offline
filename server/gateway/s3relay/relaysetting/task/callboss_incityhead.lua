QY_GOLDBOSS_POS = 
{
["city"] =
{{78,  {{1753,3121},{1670,3462},{1369,3411},{1379,3141}}, "T��ng D��ng"},
{1,   {{1799,3265},{1835,3024},{1436,2953},{1404,3338}}, "Ph��ng T��ng"},	
{11,  {{2966,4807},{2999,5266},{3252,5349},{3346,4797}}, "Th�nh ��"},	
{80,  {{1934,2861},{1723,3339},{1598,3313},{1538,3041}}, "D��ng Ch�u"},	
{37,  {{1770,3403},{1520,3281},{1535,2902},{2017,2679}}, "Bi�n Kinh"},	
{162, {{1404,3417},{1388,3149},{1723,3501},{1785,2986}}, "��i L�"},	
{176, {{1162,2781},{1832,3342},{1247,3354},{1754,2805}}, "L�m An"},
},

["Ph� Dung ��ng"]         ={{202, {{1647,3100},{1535,3032},{1618,2950},{1528,2768}}, "Ph� Dung ��ng"},},
["S�n B�o ��ng"]           ={{76,  {{1583,2989},{1767,3086},{1671,3220},{1551,3144}}, "S�n B�o ��ng"},},
["Nh�n Th�ch ��ng"]     ={{10,  {{1667,3055},{1773,2935},{1836,3082},{1750,3193}}, "Nh�n Th�ch ��ng"},},
["Thanh Kh� ��ng"]       ={{198, {{1547,2814},{1640,2918},{1687,3025},{1624,3072}}, "Thanh Kh� ��ng"},},
["Phong L�ng �� nam"] ={{336, {{1113,3134},{1241,3038},{1422,3113},{1475,2929}}, "Phong L�ng �� nam"},},
["Kh�a Lang ��ng"]       ={{75,  {{1717,3094},{1614,3191},{1843,3169},{1793,3030}}, "Kh�a Lang ��ng"},},
["V� L�ng ��ng"]           ={{199, {{1445,2959},{1602,3295},{1696,3034},{1852,3174}}, "V� L�ng ��ng"},},
["Phi Thi�n ��ng"]          ={{204, {{1624,3379},{1818,3460},{1527,3529},{1403,3407}}, "Phi Thi�n ��ng"},},
["Tr��ng B�ch s�n B�c"]  ={{322, {{1938,3957},{1697,3511},{1595,3976},{2046,3351}}, "Tr��ng B�ch s�n B�c"},},
["V� Danh ��ng"]           ={{203, {{1626,3049},{1471,2992},{1590,3282},{1792,3234}}, "V� Danh ��ng"},},
["Sa M�c ��a Bi�u"]        ={{224, {{1739,2857},{1622,2974},{1784,3096},{1447,3040}}, "Sa M�c ��a Bi�u"},},
["Sa M�c 1"]                  ={{225, {{1289,3261},{1486,3180},{1401,3284},{1603,3221}}, "Sa M�c 1"},},
["Sa M�c 2"]                  ={{226, {{1623,3118},{1708,3346},{1873,3217},{1789,3050}}, "Sa M�c 2"},},
["Sa M�c 3"]                  ={{227, {{1628,3277},{1658,3050},{1365,3160},{1498,3398}}, "Sa M�c 3"},},
["L��ng Th�y ��ng"]        ={{181, {{1635,3079},{1415,3041},{1504,3099},{1616,2951}}, "L��ng Th�y ��ng"},},
["D��ng Trung ��ng"]      ={{205, {{1612,3364},{1585,3226},{1495,3110},{1275,3059}}, "D��ng Trung ��ng"},},
["Tr��ng B�ch s�n Nam"] ={{321, {{1474,3008},{1065,3059},{1007,2626},{1413,2440}}, "Tr��ng B�ch s�n Nam"},},
["M�c Cao Qu�t"]           ={{340, {{1893,3275},{1762,2967},{1288,3304},{1447,2798}}, "M�c Cao Qu�t"},},
["Vi S�n ��o"]                ={{342, {{1212,2419},{1253,2924},{1516,2802},{1529,2477}}, "Vi S�n ��o"},},
["Phong L�ng �� b�c"]   ={{336, {{1531,2535},{1140,2639},{1166,2824},{1425,2793}}, "Phong L�ng �� b�c"},},
["M�c B�c Th�o Nguy�n"]={{341, {{1538,2429},{1258,2648},{1331,3182},{1484,3040}}, "M�c B�c Th�o Nguy�n"},},
}


function qy_makeboss_onlyone_pos()
	for i = 1, getn(QY_GOLDBOSS_APOS_INFO) do
		bossname = QY_GOLDBOSS_APOS_INFO[i][1]
		bossid = QY_GOLDBOSS_APOS_INFO[i][2]
		bosslvl = QY_GOLDBOSS_APOS_INFO[i][3]
		series = QY_GOLDBOSS_APOS_INFO[i][4]
		if(bossid == 748) then
			series = random(0, 4)
		end
		szMap = QY_GOLDBOSS_APOS_INFO[i][5][random(1,getn(QY_GOLDBOSS_APOS_INFO[i][5]))]
		world, posx, posy, worldname = qy_get_bosspos(szMap)
		str = format("Giang h� truy�n r�ng %s �� xu�t hi�n � %s ! Giang h� �t s� c� m�t tr�n ��m m�u!",bossname, worldname)
		GlobalExecute(format("dw QY_MakeBoss_RandInCity(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]] )",bossid, bosslvl, series, world, posx, posy, bossname, str ));
                                   local toadox = floor(posx/8);
                                   local toadoy = floor(posy/16);
                                   local szNews = format("<color=yellow>" ..bossname.. "<color> �� xu�t hi�n t�i <color=green>"..worldname.."<color> "..toadox.."/"..toadoy.."")
	                  LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
		OutputMsg("Create Boss "..bossname..","..bossid..","..bosslvl..","..world..","..posx..","..posy..","..series..date("----%Y%m%d%H%M"))
	end
end

function qy_get_bosspos(szMap)
	local cityidx = random(getn(QY_GOLDBOSS_POS[szMap]))
	local posidx = random(1,getn(QY_GOLDBOSS_POS[szMap][cityidx][2]));
	local world = QY_GOLDBOSS_POS[szMap][cityidx][1]
	local posx = QY_GOLDBOSS_POS[szMap][cityidx][2][posidx][1]
	local posy = QY_GOLDBOSS_POS[szMap][cityidx][2][posidx][2]
	return world, posx, posy, QY_GOLDBOSS_POS[szMap][cityidx][3]
end

function qy_makeboss_fixure(ngroup)
	GlobalExecute(format("dw CallBossDown_Fixure(%d)", ngroup))
end;