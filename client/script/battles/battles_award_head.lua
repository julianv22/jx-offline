--ÀŒΩΩ· ¯ªÒµ√Ω±¿¯
--edit by –°¿À∂‡∂‡
--2007.12.10
--∏ˆ»ÀªÒµ√Ω±¿¯
--À˘”–ÕÊº“,∞¸¿® §∏∫∆Ω battles_award_all_singleplayer(ÕÊº“index,Ω· ¯ªÒµ√µƒ∏ˆ»À◊‹ª˝∑÷,ÀŒΩº∂±[1,≥ıº∂,2÷–º∂,3∏ﬂº∂])
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\vonghoa\\item\\head.lua");
Include("\\script\\baoruongthanbi\\head.lua");
--[DinhHQ]
--[20101216]:event ngu thai ket tinh
Include("\\script\\vng_event\\ngusackettinh\\script\\nskt_SongJin.lua");
--new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\mission_award.lua")
--[20110225]: 8/3/2011
Include("\\script\\vng_event\\20110225_8_thang_3\\mission_award.lua")


--local tbItem ={szName="§ Kim B∂o R≠¨ng", tbProp={6, 1, 2192, 1, 0, 0}, nCount = 20, nExpiredTime = 20100125};

function battles_award_all_singleplayer(nplayerindex,nplayer_point,ngame_level)
	if ngame_level == 3 or ngame_level == 2 or ngame_level == 1 then
		if nplayer_point >= 500 then
			local noldplayindex = PlayerIndex
			PlayerIndex = nplayerindex
			battles_award_singleplayer_AddItem(nplayer_point)
			PlayerIndex = noldplayindex
			return
		end
	end
end

function battles_award_singleplayer_AddItem(nplayer_point)
		if nplayer_point < 500 then
		return
	end
	local TAB_KML = {
						{szName="<color=pink>Kim M∑ L÷nh", tbProp={6,1,4094}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
				}
	
	for i = 1,getn(TAB_KML) do
		tbAwardTemplet:GiveAwardByList(TAB_KML[i], "Ph«n th≠Îng Kim M∑ L÷nh");
	end
end