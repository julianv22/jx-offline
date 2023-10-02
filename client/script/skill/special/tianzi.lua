TAB_SKILL = {
	-- ���Ӽ���
	emperor =
	{
		allres_p 	= {5, -1, -1},		-- ���ȫ��5%������ʱ��
		allskill_v  = {1, -1, 0},		-- ȫϵ���ܣ�1
	},
	-- �ʵۣ�����������
	king =
	{
		allskill_v = {1, -1, 0},		-- ȫϵ���ܣ�1
	},
	-- ��ة�༼��
	minister =
	{
		lifemax_p = {3, -1, -1},		-- Ѫ������3%
		manamax_p = {3, -1, -1},		-- ��������3%
	},
	-- �����Ԫ˧����
	marshal =
	{
		physicsres_p = {20, -1, -1},	-- ����շ�20%
		allskill_v	 = {1, -1, 0},		-- ȫϵ���ܣ�1
	},
	-- �ȷ�ټ���
	pioneer =
	{
		allskill_v	= {1, -1, 0},		-- ȫϵ���ܣ�1
	},
}

-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata�����ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	local skill = TAB_SKILL[data]
	if (not skill) then
		return ""
	end
	local tb = skill[levelname]
	if (not tb) then
		return ""
	end
	return format("%d,%d,%d", tb[1], tb[2], tb[3])
end
