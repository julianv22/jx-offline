
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���籭�ʵ�崦���ļ�
-- Edited by peres
-- 2006/05/31 PM 16:13

-- �賿��㣬�о�������ŵ�Ů��Ҫ�����뿪��
-- ��������ɨ��������ȹ�޷�������������
-- ��Ƥ��ɢ��������������С�޵���Ϣ��������Ϥ��
-- �����ѹ�����������������ǽ���ڴ�����ߣ������������������¹��һ֦�̡�
-- ������������΢Ц��
-- ˵���������
-- �һ�δ�ߡ�

-- ======================================================

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

IncludeLib("ITEM");

-- ����һ���봫��� Index �� nMagicType ���ƵĻƽ�װ��
-- �������
-- nIndex: ԭʼװ���� Index
-- nNeedGold: ��Ҫ���ɵĻƽ�װ������
-- nMagicType: ��Ҫ�̶���װ��ħ����������
-- nCount: ����Ĵ���
-- ����ֵ
-- int: ������Ϊ�ڷ������в���װ������ţ�0 ��Ϊʧ��
-- ary: ����������������װ���� Index ����
function createLikeEquip(nIndex, nNeedGold, nNeedMagicType, nCount)
	local nGoldIndex = 0;
	local nCreateIndex = 0;
	
	local nMagicIndex = 0;
	local nNeedValue = 0;
	
	local aryIndex = {};
	
	local nMagicType, nP1, nP2, nP3
	local i=0;
	
	if nIndex<1 or nIndex==nil then
		return 0;
	end;
	
	CDebug:MessageOut("B�t ��u t�o ra trang b� t�m th�i!");
	
	nGoldIndex = GetGlodEqIndex(nIndex);

	CDebug:MessageOut("Nh�n ���c s� hi�u trang b� ho�ng kim ��a v�o l�:"..nGoldIndex);
	
	-- ��ȡָ��ħ�����Ե�ֵ
	for i=1, 6 do
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nIndex, i);
		if nMagicType==nNeedMagicType then
			nMagicIndex = i;
			nNeedValue = nP1;
			CDebug:MessageOut("Nh�n ���c v� tr� thu�c t�nh ch� ��nh t�i:"..i.."  Gi� tr�:"..nNeedValue);
		end;
	end;
	
	if nNeedValue==0 then
		return 0;
	end;

	--  // ���ܣ�����ָ����ϸ��Ϣ����Ʒ����Ϸ���� // 
	-- // ��ʽ��NewItemEx( nVersion, uRandSeed, nQuality, nItemClass, nDetailType, nParticualrType, nLevel, nSeries, nLuck, nItemLevel..6 ) 
	--// ���أ�nItemIdx // Fanghao_Wu 2006.06.01 //--
	for i=1, nCount do
		
		nCreateIndex = NewItemEx(4, 0, 1, 0, nNeedGold - 1, 0, 0, 0, 0, 0);
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nCreateIndex, nMagicIndex);
		
		CDebug:MessageOut("T�o s� th� t� v�t ph�m:"..nCreateIndex.." Thu�c t�nh ma ph�p:"..nP1);
		
		tinsert(aryIndex, nCreateIndex);
		
			if nMagicType==nNeedMagicType and nP1==nNeedValue then
				CDebug:MessageOut("Ngang b�ng v�i thu�c t�nh ch� ��nh:"..nCreateIndex);
				return nCreateIndex, aryIndex;
			end;
	end;
	
	return 0, aryIndex;
end;