Include("\\script\\battles\\battlehead.lua")
BALANCE_MAMCOUNT = 5
strbattleinfo=
{
	"T�ng Kim c� nh�ng h�nh th�c tham chi�n sau, ng��i mu�n t�m hi�u��",
	"Ng��i mu�n h�i g�?",
	"C�c ��o c� li�n quan/info_sjthing",
	"�i�m t�ch l�y /info_adduppoint2",--�����info_adduppoint2
	"L�m sao �� theo d�i tin t�c chi�n tr��ng/info_reportface",
	"Nh�ng �i�m c�n ch� �./info_note",
	"Ta �� bi�t h�t r�i!/cancel",
	"C�ch xem tin t�c chi�n s�: trong l�c tham chi�n, c� th� d�ng ph�m ~ (ph�m tr�n ph�m Tab) �� b�t t�t b�o c�o t�m t�t, th�ng qua �� c� th� bi�t ���c th�nh t�ch c�a ch�nh m�nh, v� th�ng tin chi�n t�ch c�a 10 ng��i ch�i cao nh�t.",--��ʱս������
--	"����ν���Ϣ����˵�������F12������ҿ��Կ����Լ����ν��ս�е���ϸͳ����Ϣ����ǰս����Ϣ��������ڵ�ǰս�������ڵľ�����֣���ʷ��Ϣ����������μӵ�����ս�۵��ۼ���Ϣ��<enter>Crtl+����Ҽ����������ң���ѡ���ν���Ϣ�����Բ鿴������ҵ��ν��ս��Ϣ��"--����ν���Ϣ����
}


function help_sjbattle()--���ֶ������
	Say(strbattleinfo[1],5,"Qui t�c �o�t k� (c� ��nh) /info_fixation1","Qui t�c �o�t k� (ng�u nhi�n) /info_random1","Qui t�c b�o v� Nguy�n So�i/info_marshal","Qui t�c T�ng Kim ��i Chi�n/help_more","Ta hi�u r�i, c�m �n!/cancel")
end


function help_more()--�ν��ս���������Ϣ
	Say(strbattleinfo[2],5,strbattleinfo[3],strbattleinfo[4],strbattleinfo[5],strbattleinfo[6],strbattleinfo[7])
end

function info_book()--�ν�گ��
	Say("T�ng Kim Chi�u Th�: S� d�ng s� ���c ��a th�ng ��n ��a �i�m b�o danh. C� th� mua t�i ti�m t�p h�a trong c�c th�nh, gi� <color=yellow>5000<color>l��ng",2,"T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end
function info_flag()
	Say("C� hi�u: Sau khi di chuy�n So�i k� ��n ��ch, nh�p v�o C� hi�u �� c�m c�. L�c �ang di chuy�n c� th� nh�p v�o C� hi�u �� x�c ��nh l�i t�a ��. M�i C� hi�u ch� d�ng ���c 1 l�n. C� th� mua � Qu�n Nhu Quan, gi� <color=yellow>5000<color>l��ng.",2,"T�m hi�u c�c th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

function info_sjthing()
	Say("��o c� T�ng Kim ��i chi�n:",3,"C� hi�u /info_flag","T�ng Kim Chi�u Th� /info_book","Ta hi�u r�i!/cancel")
end

stradduppointhelp=
{
--	"����˵������һ�õĻ��ֲ���ȡ�����Լ���ս���еĹ�������ȡ����ս�ѵı��ֺ�˫����������ÿ���˻�õĻ��ֶ���ֳɸ��Լ���ս��һ���֡�",
	"Ng��i ch�i gi�t ���c c�c lo�i NPC kh�c nhau (ph�n theo c�p b�c) , ho�c PK th�ng qu�n ��ch (l� ng��i ch�i) , PK th�ng li�n ti�p, �o�t b�u v�t, ho�n th�nh nhi�m v� �o�t k�, phe gi�nh ���c chi�n th�ng cu�i c�ng s� ���c c�ng th�m �i�m t�ch l�y. <enter>Khi ch�a khai chi�n, c� th� d�ng �i�m t�ch l�y �� mua c�c ��o c� chuy�n d�ng. Sau khi khai chi�n, kh�ng th� ti�n h�nh giao d�ch. ",
	"Qu�n s� l� m�t �u th� trong chi�n tr��ng, nh�ng th�ng b�i l�i c�n c� v�o �i�m t�ch l�y.",
	"Li�n tr�m: Khi PK th�ng qu�n ��ch 3 l�n li�n ti�p (��i ph��ng th�p h�n m�nh kh�ng qu� 3 c�p) s� ���c t�nh th�m �i�m t�ch l�y.",
	"Khi v�o tham chi�n, d�a theo t�ng �i�m t�ch l�y, tr�n ��u ng��i ch�i s� xu�t hi�n t��c hi�u. Th�p nh�t l� Binh s�; 1000 �i�m = Hi�u �y; 3000 �i�m = Th�ng L�nh; 6000 �i�m = Ph� t��ng; 10 000 �i�m = ��i T��ng.",
	"Sau khi k�t th�c, phe th�ng m�i ng��i t�ng 3 �i�m danh v�ng v� 1000 �i�m t�ch l�y + 1 ph�n qu� ng�u nhi�n; phe thua m�i ng��i 300 �i�m. N�u h�a nhau, m�i b�n ���c th��ng 500 �i�m/ng��i. �i�m th��ng c�n c�n c� v�o l�c l��ng c�a 2 b�n.B�n n�o �t ng��i �i�m th��ng s� cao h�n.",
	
}

function info_adduppoint2()--���ֻ��
	Say(stradduppointhelp[1],3,"Trang k� /info_adduppoint2_1","T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

function info_adduppoint2_1()
	Say(stradduppointhelp[2],3,"Trang k� /info_adduppoint2_2","T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

function info_adduppoint2_2()
	Say(stradduppointhelp[3],3,"Trang k� /info_adduppoint2_3","T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

function info_adduppoint2_3()
	Say(stradduppointhelp[4],3,"Trang k� /info_adduppoint2_4","T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

function info_adduppoint2_4()
	Say(stradduppointhelp[5],2,"T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end



function info_reportface()--��ʱս������
	Say(strbattleinfo[8],2,"T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end


strinfo_note=
{
	"Ch� �: sau khi b�o danh s� ���c ��a v�o h�u doanh. T� �� c� th� ��n h�u doanh. Nh�ng tr��c khi khai chi�n kh�ng ���c r�i kh�i ��i doanh. Sau khi khai chi�n c� th� t�y � x�ng ra chi�n tuy�n, c�ng c� th� t�y � quay l�i h�u doanh. Nh�ng kh�ng th� x�m nh�p v�o h�u donah c�a ��i ph��ng.",--�ں�Ӫ����Ҳ���������ͳ�ơ�",
	"Khi ng��i ch�i �ang � trong tr�ng th�i gi� So�i K�, s� kh�ng th� �i ng��c l�i h�u doanh mua d��c ho�c m� r��ng"--<enter>Ҫע�����ν��ս����ǰ5���ӣ���ر��ν��սս����ں�ս���еĺ�Ӫ����ڡ����ں�Ӫ����ҿ��������뿪ս���������뿪ս������Ҳ���������ͳ�ơ�",
}
function info_note()
	Say(strinfo_note[1],1,"Trang k� /info_note1")	
end

function info_note1()
	Say(strinfo_note[2],2,"T�m hi�u th�ng tin kh�c/help_more","Ta hi�u r�i!/cancel")
end

strfixationhelp=
{
	"Ph��ng th�c �o�t c� c� ��nh: Sau khi khai chi�n, song ph��ng s� ng�u nhi�n xu�t hi�n 1 So�i K� (h�nh d�ng binh s� c�m c�) , tr�n vi�t 1 ch� T�ng ho�c Kim. Nh�p v�o So�i K� ng��i ch�i s� bi�n th�nh gi�ng nh� NPC, ��ng th�i h� th�ng s� th�ng b�o t�a �� c�n ��n (C� th� xem t�a �� tr�n b�n �� nh�!) ",
	"C�ng c� th� nh�p v�o <color=red>C� hi�u<color> �� xem t�a ��. Sau khi �� ��n ��ch, nh�p v�o <color=red>C� hi�u<color> �� c�m So�i K�.. N�u tr�n ���ng �i b� tr�ng th��ng, c� s� ���c c�m t�i n�i ��, ng��i kh�c c� th� ti�p t�c chuy�n c� v� ��ch.",
	"Sau khi So�i K� �� chuy�n ��n ��ch, trong doanh tr�i phe m�nh s� xu�t hi�n 1 So�i K� m�i. Phe chuy�n nhi�u c� nh�t s� gi�nh th�ng l�i chung cu�c"
}
function info_fixation1()--�̶��������1
	Say(strfixationhelp[1],1,"Trang k� /info_fixation2")
end

function info_fixation2()--�̶��������2
	Say(strfixationhelp[2],1,"Trang k� /info_fixation3")
end

function info_fixation3()
	Say(strfixationhelp[3],2,"T�m hi�u th�ng tin kh�c/help_sjbattle","Ta hi�u r�i!/cancel")
end


strrandomhelp=
{
	"Ph��ng th�c �o�t c� ng�u nhi�n: Sau khi khai chi�n, trong ��i doanh v� ti�n tuy�n s� ng�u nhi�n xu�t hi�n So�i K�, (h�nh d�ng binh s� c�m c�) , tr�n vi�t 1 ch� ho�c Kim. Nh�p v�o So�i K� ng��i ch�i s� bi�n th�nh gi�ng nh� NPC, ��ng th�i h� th�ng s� th�ng b�o t�a �� c�n ��n (C� th� xem t�a �� tr�n b�n �� nh�!) . C�ng c� th� nh�p ph�i v�o <color=red>C� hi�u<color> �� xem t�a ��.",
	"Sau khi �� ��n ��ch,  nh�p v�o <color=red>C� hi�u<color> �� c�m So�i K�. N�u tr�n ���ng �i b� tr�ng th��ng, c� s� ���c c�m t�i n�i ��, ng��i kh�c c� th� ti�p t�c chuy�n c� v� ��ch.",
}
function info_random1()--����������1
	Say(strrandomhelp[1],1,"Trang k� /info_random2")
end

function info_random2()
	Say(strrandomhelp[2],2,"T�m hi�u th�ng tin kh�c/help_sjbattle","Ta hi�u r�i!/cancel")
end

strmarshalhelp="Ph��ng th�c b�o v� Nguy�n So�i: N�a gi� sau khi khai chi�n,  t�i Doanh tr�i phe �t �i�m t�ch l�y nh�t s� xu�t hi�n Nguy�n So�i,  10 ph�t sau Nguy�n so�i phe kia c�ng s� xu�t hi�n. N�u �i�m t�ch l�y b�ng nhau th� 2 Nguy�n So�i s� c�ng xu�t hi�n. M�c ti�u l�c n�y l� ti�u di�t Nguy�n So�i phe ��ch. K�t th�c chi�n tr�n,  n�u 2 Nguy�n so�i v�n c�n th� s� c�n c� v�o �i�m t�ch l�y c�a 2 b�n ��n ph�n th�ng b�i."

function info_marshal()
	Say(strmarshalhelp, 2, "T�m hi�u th�ng tin kh�c/help_sjbattle","Ta hi�u r�i!/cancel")
end

TIMELIST = "10:50,12:50,14:50,16:50,18:50,20:50,22:50"
strbt_info=
{
	"V� tr� chi�n tr��ng/bt_infoaddress",
	"Th�i gian khai chi�n/bt_infotime",
	"�i�u ki�n b�o danh/bt_infoneed",
	"Quy t�c b�o danh/bt_infobaomingrule",
	"C�c v�t ph�m c�n thi�t/bt_infoflag",
	"C�c ��o c� li�n quan/bt_infothing",
	"C�c ch�c n�ng m�i khi b�o danh?/bt_infonew",
	"�i�m b�o danh phe T�ng n�m � h��ng B�c T��ng D��ng, c�a phe Kim l� � h��ng Nam Chu Ti�n tr�n",
	format("Chi�n tr��ng T�ng Kim ch�nh th�c b�o danh l�c %s. Th�i gian b�o danh l� %d ph�t, h� th�ng s� li�n t�c th�ng b�o. <enter>Th�i gian chi�n ��u l� %d ph�t, c� m�i %d ph�t h� th�ng s� c�ng b�o t�nh h�nh. N�u h�t th�i gian b�o danh s� ng��i tham gia v�n ch�a ��, ng��i ch�i v�n c� th� ti�p t�c b�o danh.",TIMELIST, BAOMING_TIME, FIGHTING_TIME, ANNOUNCE_TIME),
--	"�ν�ս������ÿ��11��00��13��00��15��00��17��00��19��00��21��00��23��00׼ʱ���ű�����ϵͳ�㲥����֪ͨ��������ʱ��Ϊ30���ӡ�<enter>������������ʽ��ս��ս��ʱ��Ϊ60���ӣ�ÿ20�빫��һ��ս������������������ս����δ�ﵽ���ޣ���ɼ�����������ս����",
	"Ng��i ch�i ph�i ��t ��n ho�c cao h�n c�p <color=yellow>40<color> m�i c� th� b�o danh, ph� b�o danh <color=yellow>100000<color> l��ng. T�ng kim ��i chi�n ph�n ra l�m ba c�p b�c: s� c�p (c�p 40~79), trung c�p (c�p 80~119), cao c�p (c�p 120 tr� l�n).",
	"S� l��ng t�i �a l�: <color=yellow>400<color>ng��i. H�t th�i gian b�o danh n�u v�n ch�a �� nh�n s� v�n c� th� b�o danh, nh�ng n�u m�t phe nhi�u h�n phe kia <color=yellow>"..BALANCE_MAMCOUNT.."ng��i<color>, th� s� kh�ng th� tham gia v�o phe ��, c�n ph�i �t h�n phe kia<color=yellow>"..BALANCE_MAMCOUNT.."ng��i<color> m�i ���c nh�n th�m.",
	"Qui t�c b�o danh: Th�i gian c�a 1 chi�n d�ch l� 1 tu�n. M�i l�n m� 1 chi�n d�ch m�i, s� �i�m t�ch l�y c�a tu�n tr��c s� tr� v� 0. Tr�n 1 chi�n d�ch ch� ���c tham gia cho 1 phe, mu�n thay ��i, ph�i ��i ��n tu�n sau.",--����ʱ�����ҪȨ��˫���������أ�ϵͳ���Զ�����˫�������Ķ��ٵ��ڻ��֡�����ռ�ŷ��Ļ��ֽ���˥�����������Ʒ��Ļ��ֽ��мӳɡ�",
	"Nh�ng ch�c n�ng m�i: tr��c khi ch�nh th�c khai chi�n, c� th� d�ng �i�m t�ch l�y ��n Qu�n Nhu quan �� mua c�c ��o c� chuy�n d�ng. Sau khi khai chi�n s� kh�ng th� mua",
}
function bt_onbattleinfo()
	Say(strbattleinfo[2],9,"Qui t�c tham chi�n/bt_infohelprule",strbt_info[1],strbt_info[2],strbt_info[3],strbt_info[4],strbt_info[5],strbt_info[6],strbt_info[7],"Ta hi�u r�i! C�m �n!/cancel")
end


function bt_infoaddress()--�ν��ս��λ��
	Say(strbt_info[8],2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i!/cancel")
end

function bt_infotime()--�ν�ʱ��
	Say(strbt_info[9],2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i/cancel")
end

function bt_infoneed()--��������
	Say(strbt_info[10],3,"Trang k� /bt_infoneed1","T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i/cancel")
end

function bt_infoneed1()--��������
	Say(strbt_info[11],2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i/cancel")
end

function bt_infobaomingrule()
	Say(strbt_info[12],2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i/cancel")
end


function bt_infonew()--��������������
	Say(strbt_info[13],2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i/cancel")
end

function bt_infothing()--�ν��ս����
	Say("��o c� T�ng Kim ��i chi�n:",3,"C� hi�u /bt_infoflag","T�ng Kim Chi�u Th� /bt_infobook","Ta hi�u r�i!/cancel")
end

function bt_infobook()--�ν�گ��
	Say("T�ng Kim Chi�u Th�: S� d�ng s� ���c ��a th�ng ��n ��a �i�m b�o danh. C� th� mua t�i ti�m t�p h�a trong c�c th�nh, gi� <color=yellow>5000<color>l��ng",2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i!/cancel")
end

function bt_infoflag()--���
	Say("C� hi�u: Sau khi di chuy�n So�i k� ��n ��ch, nh�p v�o C� hi�u �� c�m c�. L�c �ang di chuy�n c� th� nh�p v�o C� hi�u �� x�c ��nh l�i t�a ��. M�i C� hi�u ch� d�ng ���c 1 l�n. C� th� mua � Qu�n Nhu Quan, gi� <color=yellow>5000<color>l��ng.",2,"T�m hi�u th�ng tin kh�c/bt_onbattleinfo","Ta hi�u r�i!/cancel")
end

function bt_infohelprule()--���ֶ������
	Say("Ng��i mu�n t�m hi�u quy t�c n�o?",5,"Qui t�c �o�t k� (c� ��nh) /info_fixation1","Qui t�c �o�t k� (ng�u nhi�n) /info_random1","Qui t�c b�o v� Nguy�n So�i/info_marshal","Qui t�c T�ng Kim ��i Chi�n/bt_onbattleinfo","Ta hi�u r�i, c�m �n!/cancel")
end

function cancel()
end
