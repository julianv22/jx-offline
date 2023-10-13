IL("TITLE");
IncludeLib("ITEM");
Include("\\script\\lib\\timerlist.lua")

regLevel = 200; -- giíi h¹n cÊp ®é nhËn vËt phÈm
tbpotion = {
	[1] = {
		szName = "Ngò Hoa Ngäc Lé Hoµn",
		szid = {1,2,0,5,0,0,0},
	},
	[2] = {
		szName = "Ngò Hoa Ngäc Lé Hoµn §Æc BiÖt",
		szid = {1,8,0,1,0,0,0},
	},
}

function main(nItemIdx)
	dofile("script/item/ib/texiaowuhua_jinnang.lua")
	local nCurLevel = GetLevel()
	if nCurLevel >= regLevel then
		Msg2Player("ChØ cã cÊp ®é d­íi <color=yellow>"..regLevel.."<color> míi nhËn ®­îc hç trî") 
	end
	if nCurLevel < regLevel then
		getnumber()
	end
	return 1;
end
function getnumber()
	AskClientForNumber("soluong",0,60,"NhËp sè l­îng:") 
end

function soluong(num)
	local nitemName = tbpotion[1].szName
	local nitem =  tbpotion[1].szid
	for i = 1, num do
		local kind = nitem[1]
		local genre = nitem[2]
		local detail = nitem[3]
		local parti = nitem[4]
		local level = nitem[5]
		local series = nitem[6]
		local luck = nitem[7]
		AddItem(kind,genre,detail,parti,level,series,luck)
	end
	Msg2Player("B¹n nhËn ®­îc "..num.." <color=yellow>"..nitemName.."<color>.") 
end
