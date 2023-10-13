IL("TITLE");
IncludeLib("ITEM");
Include("\\script\\lib\\timerlist.lua")

regLevel = 200; -- gi�i h�n c�p �� nh�n v�t ph�m
tbpotion = {
	[1] = {
		szName = "Ng� Hoa Ng�c L� Ho�n",
		szid = {1,2,0,5,0,0,0},
	},
	[2] = {
		szName = "Ng� Hoa Ng�c L� Ho�n ��c Bi�t",
		szid = {1,8,0,1,0,0,0},
	},
}

function main(nItemIdx)
	dofile("script/item/ib/texiaowuhua_jinnang.lua")
	local nCurLevel = GetLevel()
	if nCurLevel >= regLevel then
		Msg2Player("Ch� c� c�p �� d��i <color=yellow>"..regLevel.."<color> m�i nh�n ���c h� tr�") 
	end
	if nCurLevel < regLevel then
		getnumber()
	end
	return 1;
end
function getnumber()
	AskClientForNumber("soluong",0,60,"Nh�p s� l��ng:") 
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
	Msg2Player("B�n nh�n ���c "..num.." <color=yellow>"..nitemName.."<color>.") 
end
