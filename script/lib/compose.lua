--====��Ʒ�ϳɸ�ʽ====--
--
--�ϳɹ�ʽ��
--	COMPOSE = {Material, Award, Result_su, Result_er, Result_fa}
--
--	Award	�ϳɵõ�����Ʒ������� award.lua
--
--	Result_su, Result_er, Result_fa	�ֱ��Ǻϳɳɹ�������ʧ��ʱ�Ľ����ʾ���������ֱ��ʽ��
--		Result == "" ʱ	Say("�ϳɳɹ���", 0) / Say("ԭ�ϲ��ԣ�", 0) / Say("�ϳ�ʧ�ܣ�", 0)
--		type(Result) == "string"ʱ	Say(Result, 0)
--
--	Material	�ϳ��������
--	Material = {nAmount, tbProp, [strName]}
--		nAmount	�������������
--		tbProp	�������������
--			tbProp = {nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck}
--			6��Ԫ��ͬAddItem��6������������ģ�
--				���ĳ��Ԫ��Ϊnil�����ʾ�����Ƹ�����
--				���ĳ��Ԫ��Ϊ"+n"�����ʾ��������Ҫ >= n
--				���ĳ��Ԫ��Ϊ"-n"�����ʾ��������Ҫ <= n
--		strName	�ǲ��ϵ����ƣ���ѡ�ģ��������д��material_name������Ч��
--
--	��� Material = {Material1, Material2, ����} ���ʾ��Ҫ ���ֲ���
--	
--	�ص㣺�ύ��Ʒ�����ص�����Ҫ���Ͽ�����ģ���ġ���Ҫ����������Զ��ַ�ʽ���

if not COMPOSE_HEAD then
COMPOSE_HEAD = 1

Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\award.lua");

TB_PLCOMPOSE = {}

--���ָ����Ʒ�����Ƿ����Ҫ��
function __checkprop(tb_needprop, tb_itemprop)
	for i = 1, 6 do
		if (type(tb_needprop[i]) == "string") then
			if (strsub(tb_needprop[i],1,1) == "-") then
				if (tb_itemprop[i] > tonumber(strsub(tb_needprop[i],2))) then
					return nil
				end
			else
				if (tb_itemprop[i] < tonumber(tb_needprop[i])) then
					return nil
				end
			end
		elseif (tb_needprop[i] ~= nil and tb_needprop[i] ~= tb_itemprop[i]) then
			return nil
		end
	end
	return 1
end

--�����һ����Ʒ�Ƿ�����Ҫ�ģ���������Ҫ����
function __checkone(tb_need, tb_needcount, tb_itemprop, tb_itemcount)
	if (type(tb_needcount[1]) ==  "table") then
		for i = 1, getn(tb_needcount) do
			if __checkone(tb_need[i], tb_needcount[i], tb_itemprop, tb_itemcount) then
				return 1
			end
		end
		return nil
	else
		if (tb_needcount[1] > 0 and __checkprop(tb_need[2], tb_itemprop)) then
			if (tb_needcount[1] >= tb_itemcount[1]) then
				tb_needcount[1] = tb_needcount[1] - tb_itemcount[1]
				return 1
			else
				tb_itemcount[1] = tb_itemcount[1] - tb_needcount[1]
				return nil
			end
		end
	end
end

--�õ�һ����Ҫ������Ʒ��������Ӧ��������������
function __checkneed(tb_material)
	if (type(tb_material[1]) ==  "table") then
		local tb_cound = {}
		local n_count = 0
		local n
		for i = 1, getn(tb_material) do
			n, tb_cound[i] = __checkneed(tb_material[i])
			n_count = n_count + n
		end
		return n_count, tb_cound
	else
		return tb_material[1], {tb_material[1]}
	end
end

--���������Ʒ�Ƿ���Ϻϳ�Ҫ���������Ҫ����ɾ��
function __checkall(tb_need, n_count)
	local n_needcount, tb_count = __checkneed(tb_need)

	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		local tb_p = {}
		tb_p[1], tb_p[2], tb_p[3], tb_p[4], tb_p[5], tb_p[6] = GetItemProp(n_itemidx)
		local n_itemcount = GetItemStackCount(n_itemidx)
		n_needcount = n_needcount - n_itemcount
		--print(i..": idx="..n_itemidx .. "("..n_itemcount..")")
		if (not __checkone(tb_need, tb_count, tb_p, {n_itemcount})) then
			return nil
		end
	end
	
	if (n_needcount ~= 0) then
		return nil
	end
	
	for i=1, n_count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	return 1
end

--����Ի��ص�����
function __compose(n_count)
	local tb_compose = TB_PLCOMPOSE[PlayerIndex]
	if (__checkall(tb_compose[1], n_count)) then
		if (award_give(tb_compose[2]) > 0) then
			__tellresult(tb_compose[3], "H�p th�nh th�nh c�ng!")
		else
			__tellresult(tb_compose[5], "H�p th�nh th�t b�i!")
		end
	else
		__tellresult(tb_compose[4], "Kh�ng ��ng nguy�n li�u!")
	end
	TB_PLCOMPOSE[PlayerIndex] = nil	--�������ˢ
end

--��֪���
function __tellresult(var_result, str)
	local str_type = type(var_result)
	if (str_type == "string") then
		if (var_result == "") then
			Say(str, 0)
			Msg2Player(str)
		else
			Say(var_result, 0)
			Msg2Player(var_result)
		end
	elseif (str_type == "function") then
		var_result()
	elseif (str_type == "table" and type(var_result[1]) == "function") then
		var_result[1](unpack(var_error,2))
	end
end


--�򿪸������
function material_compose(tb_compose, str_title, str_text)
	TB_PLCOMPOSE[PlayerIndex] = tb_compose
	if (str_text == nil) then
		str_text = "C�n nguy�n li�u:"..material_name(tb_compose[1])
	end
	GiveItemUI(totext(str_title), totext(str_text), "__compose")
end

--�õ�������Ʒ����������
function material_name(tb_material, b_front)
	if (type(tb_material[1]) ==  "table") then
		local str = ""
		local n_materials = getn(tb_material)
		for i = 1, n_materials do
			local b_f = i < n_materials
			if (i > 1) then
				if (b_front or b_f) then
					str = str .. ", "
				else
					str = str .. "H�a "
				end
			end
			str = str .. material_name(tb_material[i], b_f)
		end
		return str
	else
		return tb_material[1] .. "c�i" .. tb_material[3]
	end
end


end