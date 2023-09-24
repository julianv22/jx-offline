IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
IncludeLib("LEAGUE")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")
Include("\\script\\global\\titlefuncs.lua")
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

TITLEDIALOG = "T�n nh�n v�t: <color=green>%s<color>\n".."T�n t�i kho�n: <color=green>%s<color>\n".."T�a ��: <color=green>%d, %d/%d<color>"

function main()
	dofile("script/global/gm/lenhbaitestserver.lua")
    local nW,nX,nY = GetWorldPos()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)}
    tinsert(tbSay, "L�y ITEM (MagicScript,QuesKey, Gold Item)/TaoItem")
    tinsert(tbSay, "L�y list �� ho�ng kim/Goldequip")
    tinsert(tbSay, "L�y �� t�m/CreateItemPurple")
    tinsert(tbSay,"Thay ��i tr�ng th�i nh�n v�t/trangthai")
    tinsert(tbSay, "H�y v�t ph�m/DisposeItem")
    tinsert(tbSay, "S�a l�i Th�n H�nh Ph�/fixthanhanhphu")
    tinsert(tbSay,"Thao t�c l�n ng��i ch�i./luachonid1")
    tinsert(tbSay,"Tri�u h�i l�nh b�i test c� (!)./SummonLegacy")
    tinsert(tbSay, "K�t th�c ��i tho�i./no")
    CreateTaskSay(tbSay)
	return 1;
end


function trangthai()
local szTitle = "��i hi�p mu�n ��i sang tr�ng th�i n�o?"
local tbOpt =
	{
		"Luy�n C�ng/#set_trangthai(0)",
		"Ch�nh Ph�i/#set_trangthai(1)",
		"T� Ph�i/#set_trangthai(2)",
		"Trung L�p/#set_trangthai(3)",
		"S�t Th�/#set_trangthai(4)",
		"Tr� l�i/main",
		"Tho�t./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end
function set_trangthai(nTrangthai)
	SetCurCamp(nTrangthai)
	SetCamp(nTrangthai)
end



function DisposeItem()
GiveItemUI("H�y v�t ph�m", "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m, v�t ph�m �� h�y kh�ng th� l�y l�i ���c!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		--WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
	end--for
	Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
	Talk(1, "", "Thao t�c th�nh c�ng, ki�m tra l�i!");
end


-------------Tao ITEM-------------------------------------------------------------------
function TaoItem()
g_AskClientStringEx("6,1,222,0,0,0",1,9000,"Nh�p V�o Item Code:",{TaoItemID})
end

function TaoItemID(szItem)
	local szICode = lib:Split(szItem, ",");
	local n = getn(szICode);
	if (n ~= 1) then
	if (n < 6) then Talk(1, "", format("Sai Item Code. Thi�u tr��ng y�u c�u <color=yellow>%s<color>",n)); return end
	if (n > 7) then Talk(1, "", format("Sai Item Code. Qu� nhi�u tr��ng d� li�u <color=yellow>%s<color>",n)); return end
	local itclass = tonumber(szICode[1]);
	local ittype = tonumber(szICode[2]);
	local itid = tonumber(szICode[3]);
	local itlv = tonumber(szICode[4]);
	local itseri = tonumber(szICode[5]);
	local itluck = tonumber(szICode[6]);
	local itmagic = tonumber(szICode[7]);
	if (itlv < 0) then Talk(1, "", format("C�p �� man �� kh�ng ���c th�p qu� <color=yellow>%s<color>",itlv)); return end
	--if (itlv > 10) then Talk(1, "", format("Ch� h� tr� ��n c�p 10. Hi�n t�i nh�p v�o <color=yellow>%s<color>",itlv)); return end
	if (itmagic == nil) then itmagic=0; end
	AddItem(itclass,ittype,itid,itlv,itseri,itluck,itmagic);
	else
	local EquipId = tonumber(szICode[1]);
	AddGoldItem(0, EquipId);
	end
end

-------------Lay Trang B� Ho�ng Kim Glodequip------------------------------------------------------------------
function Goldequip()
	g_AskClientStringEx("512,513", 0, 256, "ID GoldItem", {AddDSGold})
end

function AddDSGold(szPos)
       local tbPos = lib:Split(szPos, ",")
       local s = tonumber(tbPos[1])
       local e = tonumber(tbPos[2])
if (e~=0) then
	for i=s,e do AddGoldItem(0,i) end
else
	for i=1,7 do AddGoldItem(0,s) end
end
end

function TaoItemGlodequip(idgq)
	AddGoldItem(0, ""..idgq.."")
end


function CreateItemPurple()
	g_AskClientStringEx("0,0,1,10,4,1,2,3,4,5,6", 0, 256, "Item Param", {AddPurple})
end

function AddPurple(szPos)
    local tbPos = lib:Split(szPos, ",")
    local Genre = tonumber(tbPos[1])
	local Detail = tonumber(tbPos[2])
	local Particular = tonumber(tbPos[3])
	local Level = tonumber(tbPos[4])
	local Series = tonumber(tbPos[5])
	local Prop1 = tonumber(tbPos[6])
	local Prop2 = tonumber(tbPos[7])
	local Prop3 = tonumber(tbPos[8])
	local Prop4 = tonumber(tbPos[9])
	local Prop5 = tonumber(tbPos[10])
	local Prop6 = tonumber(tbPos[11])
	--AddItemEx(4,seed,2,Genre,Detail,Particular,Level,Series,0,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
	AddQualityItem(2, Genre,Detail,Particular, Level,Series,0,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
end

function luachonid1()
	AskClientForNumber("one",0,5000,"Nh�p ID ng��i ch�i")
end

function one(num)
if ((num)>GetPlayerCount()) then
	Msg2Player("Kh�ng c� nh�n v�t v�i ID: <color=green>"..num.."<color> ���c ch�n !!");
else
	SetTaskTemp(200,num)
    gmName=GetName()
    gmidx=PlayerIndex
    PlayerIndex=GetTaskTemp(200)
    tk=GetAccount()
    lev=GetLevel()
    xp=GetExp()
    cam=GetCamp()
    fac=GetFaction()
    cash=GetCash()
    lif=GetExtPoint()
    -- man=GetMana()
    -- apo=GetEnergy()
    -- spo=GetRestSP()
    -- cr=GetColdR()
    -- pr=GetTask(747)
    -- phr=GetPhyR()
    -- fr=GetFireR()
    -- lr=GetLightR()
    -- eng=GetEng()
    -- dex=GetDex()
    -- strg=GetStrg()
    -- vit=GetVit()
	xinxi = GetInfo()
    w,x,y=GetWorldPos()
    ObjName=GetName()
    PlayerIndex=gmidx
    Msg2Player("Nh�n v�t t�n:<color=metal> "..ObjName.."<color>");
    local tbSay=  {}
			tinsert(tbSay,"Di chuy�n nh�n v�t v� BLH./move")
            tinsert(tbSay,"K�ch nh�n v�t./kick")
            tinsert(tbSay,"Tho�t./no")
    Say("- T�i Kho�n:<color=green> "..tk.."<color>       - Nh�n V�t   :<color=green> "..ObjName.."<color>\n- C�p ��   :<color=green> "..lev.."<color>           - Kinh nghi�m: <color=green>"..xp.."%<color>\n- M�u      :<color=green> "..cam.."<color>            - M�n ph�i   : <color=green>"..fac.."<color>\n- Ti�n M�t :<color=green> "..(cash/10000).." v�n<color>   - Ti�n ��ng  : <color=green>"..lif.." ��ng<color>\n- V� tr�   : <color=blue>"..w.."<color>,<color=green>"..x.."<color>,<color=green>"..y.."<color>", getn(tbSay), tbSay)
    Msg2Player("Ng��i ch�i <color=cyan>"..xinxi)
end
end

function move()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
w,x,y=GetWorldPos()
if (w~=53) then
SetFightState(0)
NewWorld(53,200*8,200*16)
else
SetPos(1630, 3255)
end
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� di chuy�n b�n v� Ba L�ng Huy�n");
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n di chuy�n v� Ba L�ng Huy�n th�nh c�ng");
end

function kick()
gmidx=PlayerIndex
PlayerIndex=GetTaskTemp(200)
Msg2Player("Qu�n l� <color=green>"..gmName.."<color> �� kick k�t t�i kho�n cho b�n");
KickOutSelf()
PlayerIndex=gmidx
Msg2Player("Nh�n v�t <color=green>"..ObjName.."<color> ���c b�n kick k�t t�i kho�n th�nh c�ng");
end;

function fixthanhanhphu()
	DisabledUseTownP(0)
	Talk(1,"","Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a Qu� nh�n s� �� tr� v� ban ��u!")
end

function SummonLegacy()
    dofile("script/global/gm/lenhbaitestserver.lua")
end