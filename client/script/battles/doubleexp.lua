-- �ļ�������doubleexp.lua
-- �����ߡ���wangjingjun
-- ���ݡ��������ν��ʱ���ж��Ƿ���Ҫ��������
-- ����ʱ�䣺2012-03-02 13:08:16

local tbDouble = {
	{"\\script\\activitysys\\config\\41\\extend.lua", "pActivity:DoubleExp_Songjin",},
	}
function Songjin_checkdoubleexp(nExp)
	for i=1, getn(%tbDouble) do
		local tbfunc = %tbDouble[i]
		nExp = DynamicExecuteByPlayer(PlayerIndex, tbfunc[1], tbfunc[2], nExp)
	end
	return nExp
end