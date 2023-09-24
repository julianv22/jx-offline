Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function OnDeath(nNpcIndex)
    RoiDo(random(1, 8783))
end

function RoiDo(num)
    tbAwardTemplet:GiveAwardByList({{
        szName = "1 mãn ®å hoµng kim",
        tbProp = {0, num},
        nCount = 1,
        nQuality = 1
    }}, "test", 1);
    -- tbAwardTemplet:GiveAwardByList({{szName="M·nh",tbProp={6,1,239,1,0},nCount=1,},}, "test", 1);
end
