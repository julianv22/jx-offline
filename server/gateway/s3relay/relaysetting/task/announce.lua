-- ��ʱ��һ�������������Gameserver��ϵͳ����
-- Խ�ϰ治��������  by peres 2006/05/11

function TaskShedule()
	TaskName("Tin t�c t� ��ng - th�ng b�o");
	
	-- 10����һ��
	TaskInterval(10);
	
	-- ����TaskTme, ����Relay����ʱ�Ϳ�ʼ
	-- x��y�ֿ�ʼ(y%10==0)
	local n_cur_h	= tonumber(date("%H"));
	local n_cur_m	= tonumber(date("%M"));
	
	if (n_cur_m > 50) then
		n_cur_h = mod((n_cur_h + 1), 24); 
	end
	
	n_cur_m = mod((n_cur_m - mod(n_cur_m, 10) + 10), 60);
	TaskTime( n_cur_h, n_cur_m );
	TaskCountLimit(0);
	
	OutputMsg("T� ��ng cu�n th�ng b�o");
end

g_strTipMsg = 
	{
--		"���������š�Ϊ��ӭ�����꣬���չٸ�����֯�����ϻ���С��Ϸ���������Ż���19��00~23��00��֯����ȥ���������ά���ڻ�нܳ�����ʿ����λ��ʱ���Ե�������е����Ų��۴������μӡ�",
--		"���һ��������һ���ʿ�����򡼿�䡽���������һ���������ͬʱ���ڵ����ֲ�ͬ����������󣡴�����ɫװ�����Ӵ˸����㣡",
--		"���һ������һ����Ͽ�ʹ��(��)�׾�����С������йܡ����������ڿ��������һ������������������йܾ�����Ӽ��㣬����Ӱ��",
--		"���һ��������ߴ���еĴ����������ɵ����һ�������ҽ���ȼ�������50�����ƣ�5�����Ҳ���ڵ������󣻵�50�����µ�����޷������������",
--		--"���һ�����������������������ң������һ�������������Чʱ���Զ�ת��Ϊ���ڿ�ʱ��(�������鲻��˫��)",
--		"����ʹ�����������ڸ�����е���ٴ���ȡ��ȫ�µ���ʹ������~(����μ�������jx.xoyo.com)",
--		"��װ��ĥ���������װ���;ö�ĥ��0���Զ�������ж�£����<�𻵵�װ��>�����ڱ�����(װ������ʧ)��<�𻵵�װ��>�ɵ��ٰ����������ˡ�����ԭ",
--		"���������š����˷��������������ֳ�����7�������Χ���Ʊؽ������ֽ�����һ����Ȼ�󲨡�",
--		"����ս��֮������ǻ��ÿ���������յ�15:00~17:00���š���ҿ���ͨ����ɶ��������������ٰ��������������ݸ��ĳ��������Ի����μ��η��س�ս�ۣ�ͨ������踮���꾩���ĳ��������Ի����μӽ��س�ս�ۡ�",
--		--"�����彭����12��31�գ��ڶ����������������Ъ�ڡ������ɻ��ǰ32����ѡ�ֽ�������ȡ������������06��1��8�յ�������������������ʼ����������Ϊʦͽ˫������",
--		--"�����彭����12��8�յڶ�������������ʽ��ʼ����������Ϊ���ɵ�������������Ϊ12��8��-12��28�գ�����������ǰ32��ս�Ӿ����÷�������������������μ��������������������ؽ��ܡ�",
--		--"��������������Ƭ�����彭������2005-10-31ȫ��ȫ��ͬʱ���ţ��������⣬������μ�������",
--		--"�����彭������ͬ��ϵͳȼ�鿪�ţ���ҿ�����7����еĳ��������˴���ȡͬ������ͬʱ�ɵ��������ִ����崦��ȡͬ���������",
--		"�����彭������ͬ��ϵͳȼ�鿪�ţ���ҿ�����7����еĳ��������˴���ȡͬ������ͬʱ�ɵ��������ִ����崦��ȡͬ���������",
--		"������¼�ϵͳ��������¼�ϵͳȫ�濪�ţ�ͬ�鴦���ٻ�״̬�¼��п��ܴ�����",
--		"���Ի�֮ҹ������Ի�֮ҹ���ÿ��19:30��20:00��20:30��22:30��ʱ������(����μ�������jx.xoyo.com)",
--		"�����زر�ͼ�������زر�ͼ���ֽ��������ޱ��ؾ�����ǰ��(����μ�������jx.xoyo.com)",
--		"�������������ʿ���н����ˡ��㷷����ϻ������һ�Ұ������̡���<color=yellow>�����<color>(������½ǰ�ť)���´��ڼ���Ʒ�Ż�����(�Ż�ʱ�䣺2006��1��24����2��7��)��(����μ�������jx.xoyo.com)",
	};
	
-- �¹���Ԥ����Ϣ
g_nFutureDate = 2009010424;
STR_HEAD_FUTURE = " [Ho�t ��ng Phong ba th�ng 9]";
g_strFutureMsg = 
	{
		"Ho�t ��ng Phong ba th�ng 9 �ang ti�n h�nh, m�i ng�y, m�i tu�n, m�i th�ng ��u c� nh�ng ph�n th��ng h�p d�n �ang ch� ��i b�n! Trong th�i gian t�   ��n, tham gia c�c ho�t ��ng nh� T�ng Kim ��i chi�n, Nhi�m v� D� T�u, Nhi�m v� s�t th� th� luy�n h�ng 3 ��u c� th� t�ng th�m �i�m t�ch l�y trong t�ng ho�t ��ng s�i n�i. C� th� ��n g�p V� L�m Truy�n nh�n ho�c xem chi ti�t tr�n trang ch� ",
		"Ho�t ��ng Phong ba th�ng 9 �ang ti�n h�nh, �i�m t�ch l�y m�i ng�y c� th� ��i ph�n th��ng trong ng�y: 10 t�n c� t�ng �i�m t�ch l�y ��ng ��u trong tu�n s� nh�n ���c ph�n th��ng tu�n: 10 t�n c� t�ng �i�m t�ch ph�n ��ng ��u trong su�t th�i gian ho�t ��ng c�ng c� th� nh�n ���c ph�n th��ng c�a th�ng. Gi�i th��ng qu�n qu�n l� m�t ��i nh�n ��i M� H� ho�c ng�u nhi�n nh�n ���c m�t b� ��i trang b� ho�ng kim c�a m�n ph�i c� K� n�ng + 1!",
		"�i�u ch�nh gi� B�ch C�u ho�n: T� ng�y 8/9, h�ng rong L�m An c� b�n B�ch C�u ho�n gi� l� 1 ti�n ��ng/1 c�i: m�i ng�y t� 0:00 ��n 12:00 r�i m�ng kinh nghi�m v�n t�ng ��i!",
	};
function TaskContent()
	str = "";
	local ndateH 	= tonumber(date("%H"));
	local ndateM	= tonumber(date("%M"));
	local ndateD	= tonumber(date("%Y%m%d"));
	if (ndateH < 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "Hi�n t�i v� l�m nh�n s� c� th� ��n NPC Th�n T�i �� t�ng qu� v� nh�n Ph�o Hoa"
	elseif (ndateH == 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "V� l�m nh�n s� h�y mau ��n nh�n th��ng ��ng th�i s� c� c� h�i nh�n nhi�u ph�n qu� may m�n!";
	else
		return
		--str = getTipMsg();
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
	nCurDate = tonumber(date("%Y%m%d%H"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- �Ƿ���ָ������֮ǰ�����򲻷�
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
