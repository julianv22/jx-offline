Include("\\script\\tong\\workshop\\workshop_head.lua")

HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};

TK_GUANGHUAN = 2349;--��¼��Ұ��⻷�ı��
TK_SHIJIAN = 2350;--��¼��Ұ��⻷����Чʱ��
TK_ISCANCEL = 1757;--��¼�Ƿ��Ѿ�ȡ���˹⻷

aLevelCoef = {}
aLevelLingPaiPrice = {}
aLevelDiziCoef = {}
aLevelDiziDouble = {}
aLevelNianshouCoef = {}
aLevelNianshouDouble = {}
aLevelAuraPrice = {}

SEC_OF_DAY = 86400;


function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\huodong_level_data.txt", "huodongLevelData")
	if b1~=1 then
		print("��c t�p config ho�t ��ng t�c ph��ng th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("huodongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("huodongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "OUTPUT_COEF"))
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "LINGPAI_PRICE"))
		aLevelDiziCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_DZLIM"))
		aLevelDiziDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_DZDOU"))
		aLevelNianshouCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_NSLIM"))
		aLevelNianshouDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_NSDOU"))
		aLevelAuraPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_AURA"))
	end
	--TabFile_UnLoad("huodongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------

function ws_main(nTongID, nWorkshopID)
	-- TODO: liaozhishan 
	-- 11/7 �˴�������Ҫ�޸ģ�����Relayֻ�ܴ���CallBoss���ƣ����»����������۽��������쳣������Ҫ��Ϊ�ܴ�����������
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n Ho�t ��ng ph��ng") ~= 1 then
		return 0
	end
	local aryszContent = {
			"Bang v�t/#use_g_4_ok("..nTongID..","..nWorkshopID..")", 
			"Ho�t ��ng chi�u m� �� t�/#use_g_2_ok("..nTongID..","..nWorkshopID..")", 
			"Ho�t ��ng ��nh ni�n th�/#use_g_3_ok("..nTongID..","..nWorkshopID..")", 
			--"����ռ���Ʒ�/#use_g_5_ok("..nTongID..","..nWorkshopID..")", 	
			};
			
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "Nh�n l�nh b�i g�i Boss/#use_g_1_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "Kh�ng c�n ��u/cancel");
	
	Say("<#>T�ng qu�n Ho�t ��ng ph��ng: Ta ph� tr�ch c�c ho�t ��ng chung c�a to�n th� bang, l�m h�ng ph�n kh�ng kh� bang h�i v� tinh th�n bang ch�ng, m�i ng��i h�y c�ng nhau tham gia ho�t ��ng!",
		getn(aryszContent),
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --��ʼ������ȡ������
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLinPaiLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLinPaiLeft < 100) then
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		return 0
	end
	if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) == 1) then
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
		return 1
	end
	return 0	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>T�ng qu�n Ho�t ��ng ph��ng: L�nh b�i g�i Boss ��i h�i ��ng c�p ki�n thi�t ph�i ��t c�p <color=red>2<color> m�i c� th� ch� t�o, tr��c m�t c�n ph�i ra s�c x�y d�ng bang ��!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>T�ng qu�n Ho�t ��ng ph��ng: Ng��i kh�ng c� quy�n h�n qu�n l� t�c ph��ng, kh�ng th� nh�n L�nh b�i g�i Boss!", 0)
		return
	end
	_dbgMsg("S� l�n nh�n c�n l�i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n Ho�t ��ng ph��ng: H�m nay l�nh b�i g�i Boss �� ph�n ph�t h�t r�i, ng�y mai h�y ��n nh�!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n Ho�t ��ng ph��ng: Ph�i ti�u t�n <color=water>"..aLevelLingPaiPrice[nLevel].."<color> v�n ng�n s�ch ki�n thi�t bang �� nh�n 1 l�nh b�i g�i Boss, ng��i ��ng � kh�ng?", 2,
		"Ti�p nh�n/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "H�y b� /cancel")
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>T�ng qu�n Ho�t ��ng ph��ng: Kh�ng ���c r�i, ng�n s�ch ki�n thi�t bang kh�ng ��!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function use_g_2_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 2)
end

function use_g_3_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 3)
end

function use_g_4_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 4)
end

function use_g_5_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 5)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." ti�u t�n "..aLevelLingPaiPrice[nLevel].." v�n ng�n s�ch ki�n thi�t bang �� ��i l�y 1 l�nh b�i g�i Boss c�p "..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	elseif (nUse == 2)then	
		Sel_ZhaoDizhi(nTongID, nWorkshopID)	--��ļ����
	elseif (nUse == 3)then
		Sel_DaNianShou(nTongID, nWorkshopID)	--������
	elseif (nUse == 4)then
		Sel_techan(nTongID, nWorkshopID)		--�ز�
	elseif (nUse == 5) then
		Sel_shoujiwupin(nTongID, nWorkshopID);	--�ռ���Ʒ
	end	
end

function cancel()
end

--�⻷�ı�
tc_detail = {[5] = {"V�ng s�ng Th��ng D�ng", "T�ng qu�n Ho�t ��ng ph��ng: Mu�n tr�i nghi�m c�m gi�c ��n ru�i qu�y quanh kh�ng? Tr��c ��y ch� c� �� t� C�i Bang m�i hi�u ���c c�m gi�c n�y. Nh�n v�ng Th��ng D�ng c�n b� ra <color=yellow>50<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."},
			[6] = {"V�ng s�ng H��ng Ti�u", "T�ng qu�n Ho�t ��ng ph��ng: ��y l� v�ng danh hi�u mang s�c th�i ph��ng Nam. Nh�n v�ng H��ng Ti�u c�n b� ra <color=yellow>65<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."},
			[7] = {"V�ng s�ng Th��ng �ng", "T�ng qu�n Ho�t ��ng ph��ng: Ng��i th�ch bay l��n kh�ng? v�ng danh hi�u n�y mang l�i c�m gi�c m�t con chim �ng bay � ph�a sau. Mu�n nh�n v�ng danh hi�u n�y c�n b� ra <color=yellow>80<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."},
			[8] = {"V�ng s�ng H�a Di�m", "T�ng qu�n Ho�t ��ng ph��ng: Nghe ��n c� m�t s� cao nh�n v� l�m khi v�n c�ng th� to�n th�n s� t�a ra l�n kh�i tr�ng. v�ng danh hi�u n�y s� gi�p ng��i th� nghi�m ���c c�m gi�c m� c�c cao nh�n �� tr�i qua. Mu�n nh�n v�ng danh hi�u n�y c�n b� ra <color=yellow>100<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."},
			[9] = {"V�ng s�ng �m �nh", "T�ng qu�n Ho�t ��ng ph��ng: V�ng danh hi�u n�y s� cho ng��i m�t c�m gi�c th�m s�u huy�n �o. Mu�n nh�n v�ng danh hi�u n�y c�n b� ra <color=yellow>115<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."},
			[10] = {"V�ng s�ng Th�t Ki�m", "T�ng qu�n Ho�t ��ng ph��ng: V�ng danh hi�u n�y l� bi�u tr�ng c�a nh�ng bang h�i danh ti�ng. Mu�n nh�n v�ng danh hi�u n�y c�n b� ra <color=yellow>130<color> �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n."}
};

function Sel_techan(nTongID, nWorkshopID)--����ز�����
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	
	Say("Ng��i mu�n t�m hi�u <color=yellow>V�ng danh hi�u bang h�i<color> ��c nh�t v� nh� n�y hay kh�ng?", 2,
	"V�ng danh hi�u bang h�i/#enter_guanghuan("..nLevel..")",
	"K�t th�c ��i tho�i/oncancel");
end;


function enter_guanghuan(nLevel)
	if (nLevel < 5) then
		Say("Ho�t ��ng ph��ng v�n ch�a ��t ��n c�p <color=yellow>5<color>, khi ��t ��n c�p 5 h�y quay l�i nh�.", 0);
		return
	end;
	local tab_gh_content = {};
	tinsert(tab_gh_content, "T�m hi�u V�ng danh hi�u/tong_gh_about");
	tinsert(tab_gh_content, "Nh�n v�ng danh hi�u �� c�/#tong_gh_getagain(0, 1)");
	for i = 5, nLevel do
		tinsert(tab_gh_content, "Ta mu�n mua "..tc_detail[i][1].."/#tong_gh_get("..i..")");
	end;
	tinsert(tab_gh_content, "H�y b� v�ng danh hi�u/#delguanghuan( 1 )");
	tinsert(tab_gh_content, "Ta bi�t r�i!/oncancel");
	Say("Ho�t ��ng ph��ng �ang ph�n ph�t c�c lo�i v�ng danh hi�u, ng��i mu�n l�m g�?", getn(tab_gh_content), tab_gh_content);
end;

function delguanghuan(IsWantCancel)--ȥ���⻷Ч��
	if (IsWantCancel == 1) then	--�����ȡ���⻷�������ȡ���⻷������ȡ�����������
		SetTask(TK_ISCANCEL, 1);
	end;
	
	for i = 726, 731 do
		AddSkillState(i, 1, 0, 0);
	end;
end;

function tong_gh_getagain(bExchangeIn, bPlayer)	--�õ�ԭ�еĹ⻷��
	local nRemainSec = getremaintime();
	if (nRemainSec == 0) then
		if (bPlayer == 1 and bExchangeIn ~= 1) then	--�Ƿ�Ҫ��ʾ
			Say("Ch�a s� h�u v�ng danh hi�u n�o.", 0);
			Msg2Player("Ch�a s� h�u v�ng danh hi�u n�o.");
		end;
		return
	end;
	
	if (bPlayer == 1 or GetTask(TK_ISCANCEL) ~= 1) then
		local nSkillID = GetTask(TK_GUANGHUAN);
		AddSkillState(nSkillID, 1, 0, nRemainSec * 18);
		SetTask(TK_ISCANCEL, 0);
	end;
end;


tab_Level = {[5] = 5, [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10}
function tong_gh_get(nLevel)
	Say(tc_detail[nLevel][2], 2, "Ta mu�n mua /#tong_gh_buy("..tab_Level[nLevel]..")", "R�i kh�i/oncancel");
end;

function tong_gh_buy(nLevel)
	local nPrice = aLevelAuraPrice[nLevel];
	if (GetContribution() < nPrice) then
		Say("�i�m c�ng hi�n kh�ng �� <color=yellow>"..nPrice.."<color> �i�m, kh�ng th� ��i l�y v�ng danh hi�u.");
		Msg2Player("�i�m c�ng hi�n c�a b�n kh�ng ��.");
		return
	end;
	SetTask(TK_ISCANCEL, 0);
	AddContribution(-1 * nPrice);--���ٹ��׶ȡ�
	Msg2Player(format("B�n d�ng <color=yellow>%d<color> �i�m c�ng hi�n ��i l�y 1 <color=yellow>%s<color>.", nPrice, tc_detail[nLevel][1]));

	local nSkillID = nLevel + 726 - 5;
	SetTask(TK_GUANGHUAN, nSkillID);
	local nLimitDate = GetCurrentTime() + SEC_OF_DAY * 7;--�⻷ʱ��Ϊ7��
	SetTask(TK_SHIJIAN, nLimitDate)

	delguanghuan();
	AddSkillState(726 + nLevel - 5, 1, 0, SEC_OF_DAY * 7 * 18);
end;

function getremaintime()	--�õ��⻷��ʣ����ʱ��,���ػ��ж��ٸ�Сʱ
	local nRemainTime = GetTask(TK_SHIJIAN) - GetCurrentTime();
	if (nRemainTime < 0) then
		nRemainTime = 0;
	end;
	return nRemainTime;
end;

function tong_gh_about()
	Say("<#>T�ng qu�n Ho�t ��ng ph��ng: K� t� c�p 5 tr� �i, Ho�t ��ng ph��ng s� cung c�p c�c lo�i v�ng danh hi�u (<color=green>c�p 5: v�ng th��ng d�ng, c�p 6: v�ng h��ng ti�u, c�p 7: v�ng th��ng �ng, c�p 8: v�ng h�a di�m, c�p 9: v�ng �m �nh, c�p 10: v�ng th�t ki�m.<color>). V�ng danh hi�u c� th�i h�n s� d�ng l� 1 tu�n, trong v�ng 1 tu�n, n�u v�ng danh hi�u b� m�t th� c� th� �� �� nh�n l�i b�t c� l�c n�o.", 0);
end;

if (MODEL_GAMESERVER == 1) then --�����GameServer
---------------һ����Сɽ��------------------------
Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include([[\script\missions\tong\tong_disciple\dis_gmscript.lua]]);
Include([[\script\missions\tong\tong_disciple\award.lua]]);
Include([[\script\missions\tong\tong_springfestival\head.lua]]);
Include([[\script\missions\tong\tong_springfestival\sf_gmscript.lua]]);
Include([[\script\missions\tong\tong_springfestival\award.lua]]);

Include([[\script\missions\tong\collectgoods\head.lua]]);
Include([[\script\missions\tong\collectgoods\collg_gmscript.lua]]);
Include([[\script\missions\tong\collectgoods\award.lua]]);
end

--�������
function Sel_ZhaoDizhi(nTongID, nWorkshopID)
	Describe("<#>T�ng qu�n Ho�t ��ng ph��ng: Ho�t ��ng chi�u m� �� t� b�t ��u v�o m�i 0h, 3h, 6h�21h v� b�t ��u cho b�o danh v�o ph�t th� 15, 30, 45. C�ng ��n l�c bang h�i ch�ng ta ph�i chi�u m� th�m nh�n t�i r�i.", 
		4, 
		"Tham gia ho�t ��ng chi�u m� �� t�/#wantjoin_disciple("..nTongID..","..nWorkshopID..")",
--		 "���������ļ���ӻ/#tong_opendisciple(821)", 
		"Nh�n ph�n th��ng/#disciple_aword("..nTongID..","..nWorkshopID..")",
		"T�m hi�u ho�t ��ng chi�u m� �� t�/disciple_about", "Nh�n ti�n gh� qua th�i/festival06_Cancal");
end;

function wantjoin_disciple(nTongID, nWorkshopID)
	Describe("T�ng qu�n Ho�t ��ng ph��ng:  Tham gia ho�t ��ng chi�u m� �� t� ti�u hao <color=yellow>800<color> �i�m c�ng hi�n bang h�i, ng��i mu�n tham gia kh�ng?", 2, 
	"Tham gia ho�t ��ng chi�u m� �� t�/#joindisciple("..nTongID..","..nWorkshopID..")",
	"�� ta suy ngh� k� l�i xem/festival06_Cancal");
end;

function disciple_about()
	Describe("T�ng qu�n Ho�t ��ng ph��ng: M�t ��t ho�t ��ng chi�u m� �� t� s� m�t <color=yellow>15<color> ph�t, trong �� bao g�m <color=yellow>5<color> ph�t �� chu�n b�, "..
		"sau khi b�o danh ng��i s� ���c ��a ��n khu v�c chu�n b�, khi ho�t ��ng b�t ��u s� ti�p t�c ���c chuy�n ��n n�i c�c �� t� t� t�p. "..
			"Trong th�i gian n�y, n�u tr�ng th�y <color=yellow>�� t�<color> n�o n�i chuy�n ch� c�n nh�p tr�i chu�t<color=yellow>"..
			" <color>v�o ng��i �� t� �y l� ���c, d� nhi�n ng��i c�ng s� b� nh�ng ng��i ch�i kh�c ng�n c�n. "..
			"L�c n�y ng��i c� th� d�ng ��o c� �� ch�ng tr�, ch� c�n t�m th�y �� s� <color=yellow>"..
			"�� t�<color> th� s� nh�n ���c nh�ng l� v�t x�ng ��ng.", 1,
			"Ta mu�n th� m�t chuy�n./oncancel");
end;

--������
function Sel_DaNianShou(nTongID, nWorkshopID)
	Describe("<#>T�ng qu�n Ho�t ��ng ph��ng: Ho�t ��ng ��nh ni�n th� s� di�n ra l�c 1h, 4h, 7h�22h v� b�t ��u cho b�o danh v�o ph�t th� 14, 30 v� 45. N�m nay qu� th�t l� n�m ni�n th� xu�t hi�n nhi�u h�i d�n l�nh.", 4, 
		"Ho�t ��ng ��nh ni�n th�/#wantjoin_springfestival("..nTongID.. ","..nWorkshopID..")",
--		"�����������޻/#tong_openspringfestival(823)", 
		"Nh�n ph�n th��ng/#springfestival_aword("..nTongID..","..nWorkshopID..")", 
		"T�m hi�u ho�t ��ng ��nh ni�n th�/springfestival_about", "Nh�n ti�n gh� qua th�i/festival06_Cancal");
end;

function wantjoin_springfestival(nTongID, nWorkshopID)
	Describe("Th�ng gi�ng c�ng �� qua �i, ni�n th� g�y h�i �� b� b�t nh�t t�i nha m�n, nh�ng ng��i b� h�i �� d�n kh�i ph�c tinh th�n v� s�c kh�e. Th� nh�ng, nh�ng t� ni�m m� ni�n th� �� l�i tr�n ng��i h� v�n c�n ti�m �n. M�t ng�y kia, m�t thi�u ph� t�ng b� ni�n th� b�m v�o ng��i �� ��n n�i ni�n th� xu�t hi�n �� m�c ni�m ng��i ch�ng v� anh em trong cu�c chi�n kinh ho�ng ��...V�o th�i kh�c �au bu�n n�y, b� �� ph�t hi�n nh�ng d�u ch�n ni�n th� �an xen th�nh nh�ng h�nh th� k� l�, tr�ng nh� l� t� ", 2, "sau �� th� sao /#wantjoin_springfestival_next("..nTongID..","..nWorkshopID..")",
	"kh�ng mu�n nh�c l�i chuy�n x�a/festival06_Cancal");
end;

function wantjoin_springfestival_next(nTongID, nWorkshopID)
	Describe("ch�. Theo c�u ni�m c�a thi�u ph�, b�a ch� khi�n cho t� ni�m m� ni�n th� �� l�i tr�n ng��i b� tho�t ra...T�i nha m�n, t� ch� t�ng qu�n �ang ng�, ��t nhi�n c� m�t b�n tay ng�c th� th� v�o chi�c ch�a kh�a ng�c giam c�m ni�n th�....Bu�i chi�u h�m sau, m�t s� ��a tr� ngo�i th�nh b� m�t t�ch kh�ng r� nguy�n do, ch� ch�a l�i s�i d�y v�i v� chi�c b�ng v� n�m ��. V� m�t gi�c m�ng tr� th�...<enter>Tham gia ho�t ��ng ��nh ni�n th� c�n ti�u ph� <color=yellow>500<color> �i�m c�ng hi�n, ng��i mu�n tham gia kh�ng?", 2, "Ho�t ��ng ��nh ni�n th�/#joinspringfestival("..nTongID..","..nWorkshopID..")",
	"�� ta suy ngh� k� l�i xem/festival06_Cancal");
end;

function springfestival_about()
	Describe("T�ng qu�n Ho�t ��ng ph��ng: M�t ��t ho�t ��ng ��nh ni�n th� l� <color=yellow>15<color>ph�t, trong �� bao g�m <color=yellow>5<color> ph�t �� chu�n b�. "..
		"Sau khi b�o danh tham gia, ng��i s� ���c ��a ��n khu v�c chu�n b�. Khi ho�t ��ng b�t ��u s� ti�p t�c ���c ��a ��n n�i ni�n th� th��ng xu�t hi�n."..
		"color=yellow>15<color> gi�y sau khi ho�t ��ng b�t ��u, trong s� nh�ng ng��i tham gia s� c� 1 ��n 2 ng��i b� ni�n th� b�m v�o ng��i "..
		"v� bi�n th�nh ni�n th�. H� s� �i quanh khu v�c �� b�t nh�ng '<color=yellow>��a tr� m�t t�ch<color>'.", 2, 
		"Trang k� /festival06_next", "K�t th�c ��i tho�i./festival06_Cancal");
end;

function festival06_next()
    Describe("T�ng qu�n Ho�t ��ng ph��ng: Trong khi nh�ng ng��i kh�c s� s� d�ng '<color=yellow>ph�o hoa<color>' �� ��nh �u�i ni�n th�, "..
    	"��ng th�i ng�n c�n ni�n th� b�t nh�ng ��a tr�. Sau khi ho�t ��ng k�t th�c, '<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>' "..
    	"s� d�a tr�n b�ng x�p h�ng s� l�n n�m tr�ng <color=yellow>ph�o hoa<color> v�o ni�n th� �� ph�t th��ng.", 1,  
    	"Ta �� bi�t r�i. /festival06_Cancal");
end

function Sel_shoujiwupin(nTongID, nWorkshopID)	--����ռ���Ʒ�
	local tab_gh_content = {
			"Tham gia ho�t ��ng thu th�p v�t ph�m/#wantjoin_collection("..nTongID..","..nWorkshopID..")",
--			"��������ռ���Ʒ�/#collg_opencellectgoods( 827 )", 
			"Nh�n ph�n th��ng/#collg_aword("..nTongID..","..nWorkshopID..")",
			"T�m hi�u ho�t ��ng thu th�p v�t ph�m/collg_about",
			"Nh�n ti�n gh� qua th�i/festival06_Cancal"
	};

	Say("<#>T�ng qu�n Ho�t ��ng ph��ng:  Ho�t ��ng thu th�p v�t ph�m b�t ��u l�c 2h, 5h, 8h�22h v� b�t ��u cho b�o danh v�o ph�t th� 15, 30, 45. Mong m�i ng��i h�y g�p s�c tham gia ho�t ��ng.", getn(tab_gh_content), tab_gh_content);
end;

function wantjoin_collection(nTongID, nWorkshopID)
	Say("T�ng qu�n Ho�t ��ng ph��ng: Ng��i ��ng � gi�p �� th�t qu� t�t r�i, c� �i�u ta nghe nh�ng th��ng nh�n c�n s�ng s�t n�i l� t�i n�i c�m ��a �y c� m�t c� quan b� hi�m, tr�ng nh� m�t vi�n ph�o, ch�ng s� b�m ch�t v�o th�n ng��i, tr� khi ng��i n�m n� v�o ng��i kh�c th� th�i, kh�ng th� n� c� b�m v�o ng��i kh�ng d�t ra ���c, xin h�y h�t s�c c�n th�n.", 2, 
	"Ta s� c�n th�n, h�y mau ��a ta ��n n�i �y./#collg_joindisciple("..nTongID..","..nWorkshopID..")", 
	"N�u �� nh� th�, ta c�n c� th�i gian �� chu�n b�./OnCancel");
end;

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh�ng c� bang h�i"	
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local nPrice  --��ǰ��ȡboss�ٻ����Ľ������
	local dTokenCount	--��ǰÿ��boss�ٻ��������������
	local nDoubleOdds  --��ǰ�ٻ���2���ƽ�Boss�ļ���
	local dDiziCount	--��ǰÿ�ղμ���ļ���ӻ�˴����
	local nDiziDoubleOdds	--��ǰ��ļ���ӻ����˫�������ļ���
	local dNianshouCount	--��ǰÿ�ղμӰ������޻�˴����
	local nNianshouDoubleOdds		--��ǰ�������޻����˫�������ļ���
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then		
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
			dDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel] / aLevelDiziCoef[1])	
			nDiziDoubleOdds = floor(aLevelDiziDouble[nUseLevel] * 100)
			dNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel] / aLevelNianshouCoef[1])	
			nNianshouDoubleOdds = floor(aLevelNianshouDouble[nUseLevel] * 100)
		else
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
			dDiziCount = "--"
			nDiziDoubleOdds = "--"
			dNianshouCount = "--"
			nNianshouDoubleOdds = "--"
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount,nNextDoubleOdds,dNextDiziCount,nNextDiziDoubleOdds,dNextNianshouCount,nNextNianshouDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --�¼���ȡboss�ٻ����Ľ������
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --�¼�ÿ��boss�ٻ��������������
		nNextDoubleOdds = 160 - nCurLevel * 10 --�¼��ٻ���2���ƽ�Boss�ļ���
		dNextDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel + 1] / aLevelDiziCoef[1])	
		nNextDiziDoubleOdds = format(aLevelDiziDouble[nUseLevel + 1] * 100)
		dNextNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel + 1] / aLevelNianshouCoef[1])	
		nNextNianshouDoubleOdds = format(aLevelNianshouDouble[nUseLevel + 1] * 100)
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
		dNextDiziCount = "--"
		nNextDiziDoubleOdds = "--"
		dNextNianshouCount = "--"
		nNextNianshouDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			--"Boss�ٻ����ղ���������ߣ�<color=gold>"..dTokenCount.."<color>��\n"..	
			--"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=gold>1/"..nDoubleOdds.."<color>\n"..		
			--"��ȡBoss�ٻ������轨�����<color=gold>"..nPrice.."��<color>\n"..
			"L��t ng��i m�i ng�y c� th� tham gia ho�t ��ng t�ng: <color=gold>"..dDiziCount.."<color> l�n\n"..
			"X�c su�t bang h�i nh�n ���c ph�n th��ng nh�n ��i: <color=gold>"..nDiziDoubleOdds.."%<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			--"<color=water>Boss�ٻ����ղ���������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..
			--"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			--"��ȡBoss�ٻ������轨�����<color=Violet>"..nNextPrice.."��<color>\n"..
			"<color=water>L��t ng��i m�i ng�y c� th� tham gia ho�t ��ng t�ng: <color=Violet>"..dNextDiziCount.."<color> l�n\n"..
			"X�c su�t ho�t ��ng bang h�i nh�n ���c ph�n th��ng nh�n ��i: <color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"

		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>Ch�a th�nh l�p<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			--"<color=water>Boss�ٻ����ղ���������ߣ�<color=Violet>"..dNextTokenCount.."<color>��\n"..
			--"�ٻ����ٳ���2��Boss�ļ��ʣ�<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			--"��ȡBoss�ٻ������轨�����<color=Violet>"..nNextPrice.."��<color>\n"..
			"<color=water>L��t ng��i m�i ng�y c� th� tham gia ho�t ��ng t�ng: <color=Violet>"..dNextDiziCount.."<color> l�n\n"..
			"X�c su�t ho�t ��ng bang h�i nh�n ���c ph�n th��ng nh�n ��i: <color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end
----------------------------------------------
end