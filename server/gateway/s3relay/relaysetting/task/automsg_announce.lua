-- ��ʱ��һ�������������Gameserver��ϵͳ����
function TaskShedule()
	TaskName("Tin t�c t� ��ng - th�ng b�o");
	
	-- 20����һ��
	TaskInterval(20);
	
	-- ����TaskTme, ����Relay����ʱ�Ϳ�ʼ
	-- 0��00�ֿ�ʼ
	-- TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	OutputMsg("T� ��ng cu�n th�ng b�o");
end

g_strTipMsg = 
	{
		--"ÿ��������2-3�������ļ��ܷ�չ·�ߣ�����·�ߵ��ص��Ϊ����",
		--"����Ϸ�������������еĳ������������ִ�����ɽ������ӶԻ������˽Ȿ�ŵļ��ܷ�չ·�ߺ����ʺ������ĳ���",
		--"����Ϸ�������������еĳ������������ִ�����ɽ������ӶԻ������˽Ȿ�ŵļ��ܷ�չ·�ߺ����ʺ������ĳ���",
		--"����Ϸ�������������еĳ������������ִ�����ɽ������ӶԻ������˽Ȿ�ŵļ��ܷ�չ·�ߺ����ʺ������ĳ���",
		--"����Ϸ�������������еĳ������������ִ�����ɽ������ӶԻ������˽Ȿ�ŵļ��ܷ�չ·�ߺ����ʺ������ĳ���",
		"Trong tr� ch�i khi ��i tho�i v�i V� binh Th�nh m�n c�a c�c th�nh th� v� �� t� ti�p d�n c�c m�n ph�i � c�c T�n Th� th�n �� hi�u ���c c�c h��ng ph�t tri�n k� n�ng c�a t�ng m�n ph�i v� khu v�c luy�n c�ng th�ch h�p.",
		--"���롼���ܼӳɡ��ĸ���ȼ��߼��ܵ��Ľ�ɫ�����ƽ����ӵõ�����",
		--"�����ܼӳɡ��ͼ�ս�����ܶԸ߼�ս��������ָ�ӳɸ߼����ܵ��˺�",
		--"ȫ�µġ�������ˡ�ϵͳ���κ������ںͱ��Լ��˵�����PKʱ����ӵ�и������Ե�����",
		--"7��16��֮���һ�ε�½��Ϸ���磬ϵͳ����ݽ�ɫ�ľɼ���״���Զ�����Ϊ�µļ��ܣ�Ǳ�ܵ�ָ���ԭʼδ����״̬",
		--"�����������ȡ�ͨ������ʹ�ô˼��ܹ������˻������������˵ȼ�����һ�õ����������޹�",
		--"����Ƶ�NPC���ϣ�����ʾ����������ͼ�꡽",
		--"NPCֻ������Ӧ�������Եı������Ҫ�õ���ǹ������ȥ��ˮϵ��NPC",
		--"NPCֻ������Ӧ�������Եı������Ҫ�õ�����װ��������ȥ��ľϵ��NPC",
		--"NPC��������ͼ�꣺��ɫ-��ϵ����ɫ-ˮϵ����ɫ-ľϵ����ɫ-��ϵ����ɫ-��ϵ",
		--"��NPC������ɳĮ�Թ�NPC�����ȼ��ߡ�����ࡢˢ�¿죬���ҵ���������ͨNPC�Ķ�������",
		-- "����ӡ����һ������ҵõ��ľ��齫�ǵ��˾����1.3��",		
		--"����ӡ������Ա������ֵ�����ݶ����������õ���Ӧ����",
		--"����ӡ������Ա������ֵ�����ݶ����������õ���Ӧ����������װ�������Խ��������һ����ҽ�ɫ����ֵ������",
		--"����ӽ��顽�ߵȼ���Ҵ��͵ȼ���ң��ȼ����70������ʱ�����Ե������ٶȽ����20������",
		--"����������ͷ����������Խ�࣬��������ľ���Խ�٣��������������ﵽ���ˣ������󽫲�������",
		--"���һ��������һ���ʿ���������࣬���ŵ��ϵ�����������������湦Ч����������������",
		"N�u b�n ph�t hi�n m�nh b� m�t nh�ng k� n�ng �� h�c ���c, h�y h�i s� s� h�c ���c c�c k� n�ng nh� Huy�t Chi�n B�t Ph��ng, V� T�m Tr�m, Thi�n V��ng Chi�n � (Thi�n V��ng Bang) , c�ng v�i T�m Nh�n v� Thi�n La ��a V�ng (���ng M�n) .",
		--"��ϴ�赺����ʽ���ţ�50�������ϵķǰ�������С�һ����ѡ�������ᡣ�����������ϴ��Ǳ�ܵ㡽�롼���ܵ㡽�������ڵ��ϻ�����붴����ӵ�Ч��",
		--"��ѽ��롼ϴ�赺���Ļ���ֻ��һ�Ρ��뿪ϴ�赺����ġ�Ǳ��/���ܡ����佫�ʹ�ȷ�����뿪ʱ����˼����˼����",	
		"M�t b� ph�n ng��i ch�i sau khi ho�n th�nh [Nhi�m v� c�p 90] c�a m�n ph�i ch�a th� nh�n ���c k� n�ng, sau khi [h�i s�] v� [Vi�n Quan tho�i nhi�m] L�m An �� ch�nh s�a l�i [183,182]) ",
		"M�t b� ph�n ng��i ch�i ���ng M�n sau khi h�c [T� ti�n thu�t. B�o V� L� Hoa] g�p t�nh tr�ng kh�ng th� s� d�ng B�o V� L� Hoa, sau khi tr� v� [h�i s�] l�i ��n [Vi�n quan Tho�i Nhi�m] L�m An �� ch�nh s�a l�i [183,182]) .",
		"M�t b� ph�n ng��i ch�i V� �ang g�p t�nh tr�ng b� m�t �i�m k� n�ng, sau khi v� [h�i s�] ��n [Vi�n Quan Tho�i Nhi�m] l�m An �� ch�nh s�a l�i (L�m An [183,182]) ",
		--"��������ѯ���뵽������е����������������졽��������[192,193]",
		--"��ˮ���籩��2004��7��22����11��00�Ժ󣬳�ֵ35Ԫ�鿨����ʵ�������������ִ�Ұ�����������ȡһ��ˮ������ӳٵ�2004��8��8�ս���",
		--"������ͼ�ס�����ԭ���ֵ����桼ˮ�������������������˻�ȡ������ͼ�ס������á�����������ͼ�ף��ٷְٵذ������������һ���ȼ�",
		--"������ͼ�ס������������˳���������[207,193]���ٰ�[164,177]���أ�Ҫ��ͼ����������������������ж�",
		--"������������ֽ���(������ʾΪ��ɫ)��Я�����ٽ�Ǯ��װ���������ܴ��С�ˮ���������ɺ챦ʯ�������ƽ�װ�������������顽",
		--"���ƽ�װ������������������ƽ�װ����װ��������������������л����á��μӰ��˾��»��ÿ��Ҳ�����һ��",
		" [T�ng qu� nh�n d�p Olympic]M�i l�n ��i Trung Qu�c nh�n ���c ph�n th��ng, ng��i ch�i c� th� ��n [L� Quan] � c�c th�nh th� �� nh�n v�t ph�m: Kim b�i-Kim Th�o L�, Ng�n b�i-B�ch C�u ho�n,��ng b�i-L� Hoa",
		"�����˽����ʹ�����ȡ��Ʒ��һʱ��Σ�����ʱ��10��00~14��00��ȡǰһ��22��00~����4��00�Ľ�Ʒ",
		"�����˽����ʹ�����ȡ��Ʒ�ڶ�ʱ��Σ�19��00~20��00��ȡ����14��00~18��00�Ľ�Ʒ",
		"�����˽����ʹ�����ȡ��Ʒ����ʱ��Σ�23��00~����0:00��ȡ����18��00~22��00�Ľ�Ʒ",
		" [T�ng qu� nh�n d�p Olympic]Vi�c nh�n v�t ph�m l� c� th�i h�n,ng��i ch�i n�n ch� � theo d�i cu�c thi d�u c�a ��i nh� v� ��n [L� Quan] nh�n th��ng k�p th�i.",
		"S� d�ng [Kim Th�o L�] luy�n c�p trong v�ng 1 gi� s� ���c �i�m kinh nghi�m g�p ��i: S� d�ng [B�ch C�u ho�n] trong v�ng 1 gi� s� ���c [t� ��ng ��nh qu�i]. C�ng n�ng c�a 2 lo�i d��c ph�m n�y s� ���c m� v�o ng�y ",
		" [D� �o�n thi ��u Olympic]��i tho�i v�i [L� Quan] � c�c th�nh th� �� tham gia ho�t ��ng d� �o�n Olympic",
		"���������¾��¡������н�������ڻ�ý���ر���ͬʱ�����п��ܻ�á������������ϵ�лƽ�װ���е�һ��",
		"�������½�����ϵͳ���ڲ����й��ӻ�õĽ�����ͭ������������в���һλ����������ң���������ϵ�лƽ�װ����װ",
		"�����˽��ƾ��¡��й�������Ŀ���£�����2004.8.17������ά��ǰ��ֹ��Ҫ�μӵ������ץ��ʱ�乺������Ʊ",
		" [B� trang b� ho�ng kim Olympic]g�m 2 b� Athens 2004- [H�n Olympic], B�c Kinh 2008- [L�ng Olympic]",
		"������֮�꡽��������֮�ġ����Ծ�Ϊ�������书�ȼ���1����������Զ�����ȫ��װ�������а�����",
		" [H� th�ng ph�c duy�n] th�ng qua th�i gian ch�i t�ng d�n �� ��i l�y �i�m ph�c duy�n. D�ng �i�m ph�c duy�n ��n [Th�n b� th��ng nh�n Li�u �t] T��ng D��ng �� ��i l�y c�c lo�i v�t ph�m ��c th�.",
		" [H� th�ng ph�c duy�n] ��i tho�i v�i [V� L�m truy�n nh�n] � c�c th�nh th� �� bi�t th�ng tin chi ti�t.",
		" [Ho�t ��ng Trung Thu] �n b�nh trung thu, ng�m tr�ng s�ng, v�nh th�, gi�i c�u �� ch�-----ho�t ��ng �ang tri�n khai to�n di�n, nhi�u ph�n th��ng �ang ch� ��n b�n! Vui l�ng ��n L� Quan c�c th�nh th� �� h�i th�m chi ti�t.",
		" [��o Hoa ��o] Olympic v�n ng��i c�ng vui,tr��c khi h� th�ng d�ng m�y b�o tr� t� ng�y 14/8/2004 ��n 30/8/2004, mi�n ph� tu luy�n � ��o Hoa ��o."
	};
	
-- �¹���Ԥ����Ϣ
g_nFutureDate = 20040723;
STR_HEAD_FUTURE = " [Giang h� truy�n r�ng]";
g_strFutureMsg = 
	{
		--"�������š�������ͼ�������򱦵�ͼ��",
		--"��ϴ�赺��ϴ���ܵ㹦�ܽ���2004��7��24�տ��ţ�50�������ϵķǰ��������һ����ѽ������",
		--"��������ˮ���������ء�����ͼ�ס��������������ȼ�"
		--"���������(������ʾΪ��ɫ)������������˵��Я�����ٽ�Ǯ��װ����ɽ�������ܴ��С�ˮ���������ɺ챦ʯ�������ƽ�װ�������������顽",
		--"���ƽ�װ������������������ƽ�װ����װ��������������������л�����",
		--"��˫����Ǯ˫�����顽90�����ܾ���Ψ����������ӳɷ磬��������𱬡���л������ң����ڽ�����˫����Ǯ˫������",
		
	};
function TaskContent()
	str = "";
	nFutureCount = getn(g_strFutureMsg);
	nCount = getn(g_strTipMsg) + nFutureCount;
	nIndex = random(1, nCount);
	if (nIndex <= nFutureCount) then -- 1-ȡԤ����Ϣ��2-ȡ��ʾ��Ϣ
		str = getFutureMsg();
		if (strlen(str) <= 0) then -- û��Ԥ����Ϣ����ȡ��ʾ��Ϣ
			str = getTipMsg();
		end
	else
		str = getTipMsg();
	end
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- ȡ��ʾ��Ϣ
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- ȡԤ����Ϣ
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- �Ƿ���ָ������֮ǰ�����򲻷�
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end
