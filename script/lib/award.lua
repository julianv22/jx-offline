--====��Ʒ��ʽ====--
--
--	Award = {type, detail, amount}
--
--	type:	��Ʒ����
--		nil�������Ʒ��0��function��1��AddItem��2��AddGoldItem��3������Ʒ��
--		4�������������Ʒ��5���������漴��Ʒ��
--
--	detail:	������Ʒ	��type�Ĳ�ͬ���в�ͬ����͸�ʽ��
--		�� type = nil ʱ��detail Ϊ��
--			{Award1, Award2, ����}	һ�����ж�� Award �����飬��������θ������е�ÿ����Ʒ
--		�� type = 0 ʱ��detail ���������ַ�ʽ��
--			function	�ú���������ɸ���ĳ������Ľ����Ĺ���
--			{function, param1, param2, ����}	���к������������������
--		�� type = 1 ʱ��detail Ϊ��
--			{x1,x2,x3,x4,x5,x6}	��6��Ԫ�ص����飬��ʾAddItem(x1,x2,x3,x4,x5,x6)��6������
--		�� type = 2 ʱ��detail Ϊ��
--			{x1,x2}		��2��Ԫ�ص����飬��ʾAddGoldItem(x1,x2)��2������
--		�� type = 3 ʱ��detail Ϊ��
--			1��AddOwnExp��
--			������ֵ������չ
--		�� type = 4 ʱ��detail Ϊ��
--			{Award1, Award2, ����}	����ᰴ��ƽ���ĸ��ʴ����漴ѡ��һ����Ʒ
--		�� type = 5 ʱ��detail Ϊ��
--			{{p1, Award1}, {p2, Award2}, ����} ����ᰴ��ָ���ĸ���p�����漴ѡ��һ����Ʒ
--
--	amount:	�ý�Ʒ�������������AddOwnExp�����ʾ�Ǿ���ֵ�������function�����ʾ���д�����
--
--��
--	����� Award = {Award1, Award2, ����} ��Ϊ��Ʒ��
--	���򽫻����Ϊ type = nil; amount = 1 ��һ�齱Ʒ���Դ˷��㽱Ʒ������д
--	������д����ЧΪ��Award = {nil, {Award1, Award2, ����}, 0}

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

__award_log_HEAD = {"[AWARD_GIVE]", {date, "%y-%m-%d,%H:%M"}, GetAccount, GetName}
__award_log_HEAD.sep = "\t"
__award_log_HEAD.bra = {"", "\t"}

if (not AWARD_HEAD) then
AWARD_HEAD = 1

Include("\\script\\lib\\basic.lua");
IL("FILESYS")

--��¼��־
function __award_log(str)
	--Msg2Player("<color=white>"..str.."<color>")
	if __award_log_HEAD then
		str = totext(__award_log_HEAD)..str
	end
	WriteLog(str)
	--print(str)
end

--�������ļӾ���
function award_addexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--���뽱Ʒ
function award_give(tb_award)
	local n_type, var_detail, n_count
	if (type(tb_award[1]) == "table") then
		n_type = nil
		var_detail = tb_award
		n_count = 1
	else
		n_type = tb_award[1]
		var_detail = tb_award[2]
		n_count = tb_award[3]
	end
	local all_count = 0
	if (n_type == nil) then	--�����Ʒ
		while (n_count > 0) do
			for i = 1, getn(var_detail) do
				all_count = all_count + award_give(var_detail[i])
			end
			n_count = n_count - 1
		end
	elseif (n_type == 0) then	--function
		while (n_count > 0) do
			if (type(var_detail) == "table") then
				__award_log("function("..join(pack(unpack(var_detail,2)))..")")
				all_count = all_count + tonum(var_detail[1](unpack(var_detail,2)))
			else
				__award_log(tostring(var_detail))
				all_count = all_count + tonum(var_detail())
			end
			n_count = n_count - 1
		end
	elseif (n_type == 1) then	--��ͨ��Ʒ
		all_count = n_count
		while (n_count > 0) do
			__award_log("AddItem("..join(var_detail)..")")
			AddItem(unpack(var_detail))
			n_count = n_count - 1
		end
	elseif (n_type == 2) then	--�ƽ���Ʒ
		all_count = n_count
		while (n_count > 0) do
			__award_log("AddGoldItem("..join(var_detail)..")")
			AddGoldItem(unpack(var_detail))
			n_count = n_count - 1
		end
	elseif (n_type == 3) then	--����Ʒ
		all_count = 1
		if (var_detail == 1) then	--AddOwnExp
			__award_log("AddOwnExp("..n_count..")")
			award_addexp(n_count)
		else	--������չ
			__award_log("award_give : error var_detail:"..tostring(var_detail))
		end
	elseif (n_type == 4) then	--�����Ʒ
		while (n_count > 0) do
			local giveindex = random(getn(var_detail))
			all_count = all_count + award_give(var_detail[giveindex])
			n_count = n_count - 1
		end
	else
		__award_log("award_give : error n_type:"..tostring(n_type))
	end
	return all_count
end

--����ȫ��������Ʒռ����������׼��
function award_count(tb_award)
	local n_type, var_detail, n_count
	if (type(tb_award[1]) == "table") then
		n_type = nil
		var_detail = tb_award
		n_count = 1
	else
		n_type = tb_award[1]
		var_detail = tb_award[2]
		n_count = tb_award[3]
	end
	local all_count = 0
	if (n_type == nil) then	--�����Ʒ
		while (n_count > 0) do
			for i = 1, getn(var_detail) do
				all_count = all_count + award_count(var_detail[i])
			end
			n_count = n_count - 1
		end
	elseif (n_type == 0) then	--function
		all_count = n_count
	elseif (n_type == 1) then	--��ͨ��Ʒ
		all_count = n_count
	elseif (n_type == 2) then	--�ƽ���Ʒ
		all_count = n_count * 2
	elseif (n_type == 3) then	--����Ʒ
		all_count = 0
	elseif (n_type == 4) then	--�����Ʒ
		all_count = 2
	else
		__award_log("award_count : error n_type:"..tostring(n_type))
	end
	return all_count
end


end

