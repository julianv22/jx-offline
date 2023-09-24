
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���ѡȡһ����Ʒ����
-- Edited by peres
-- 2006/08/01 AM 09:52

-- I hope you still feel small when you stand beside the ocean,
-- Whenever one door closes I hope one more opens,
-- Promise me that youll give faith a fighting chance,
-- And when you get the choice to sit it out or dance.

-- ======================================================

IL("ITEM");

-- ��չ����ļ����֧��
Include("\\script\\class\\ktabex.lua");

-- ����һ�������Ʒ��������
function openRandomItem(tabItem, szBoxName)

local nRow = tabItem:countArrayRate("ItemRate");
local szName,nQuality,nGenre,nDetail,nParticular,nLevel,nGoodsFive = "", 0, 0, 0, 0, 0, 0;
local nIndex, nLimitTime = 0;
local nIsPublic = 0;

	szName      = tabItem:getCell("Name", nRow);
	nQuality    = tonumber(tabItem:getCell("Quality", nRow));
	nGenre      = tonumber(tabItem:getCell("Genre", nRow));
	nDetail     = tonumber(tabItem:getCell("Detail", nRow));
	nParticular = tonumber(tabItem:getCell("Particular", nRow));
	nLevel      = tonumber(tabItem:getCell("Level", nRow));
	nGoodsFive  = tonumber(tabItem:getCell("GoodsFive", nRow));
	
	nLimitTime  = tonumber(tabItem:getCell("LimitTime", nRow));
	
	-- �Ƿ񹫸�
	nIsPublic = tonumber(tabItem:getCell("IsPublic", nRow));
	
	if nQuality==1 then
		nIndex = AddGoldItem(0, nGenre);
		if nLimitTime~=nil and nLimitTime>0 then
			ITEM_SetLeftUsageTime(nIndex, nLimitTime * 60);
			SyncItem(nIndex);
		end;
	else
		AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
	end;
	
	Msg2Player(format("B�n m� %s nh�n ���c <color=green>%s<color>", szBoxName, szName));
	
	if nIsPublic==1 then
		AddGlobalCountNews(format("C�ng b�: Ng��i ch�i %s �� m�  %s v� nh�n ���c %s!", GetName(), szBoxName, szName), 1);
	end;
	
	WriteTaskLog(format("M� %s nh�n ���c %s", szBoxName, szName));

end;

-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog(" [H� th�ng nhi�m v�]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]").." [m�t m�:"..GetAccount().."] [nh�n v�t:"..GetName().."]"..strMain);
end;
