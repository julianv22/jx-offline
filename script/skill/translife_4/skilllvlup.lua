-- �ļ�������skilllvlup.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������ת��ؼ��ܵ� 8 �����ܵ�����
-- ����ʱ�䣺2011-07-30 17:50:05

Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

tbZhuansheng_4_Skill = {}

function tbZhuansheng_4_Skill.skilllvelup(nSkillId)
	local mlvl = HaveMagic(nSkillId)
	local nMaxLevel = GetSkillMaxLevel(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	if mlvl > nMaxLevel then
		Msg2Player(format(" [%s] c�a b�n �� ��n t�i �a, kh�ng th� ti�p t�c th�ng c�p ���c!", szSkillName))
		return 0
	end 
	
	updataSkillPoint_4()		-- ����ʣ����õļ��ܵ�
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	if nLeaveSkillPoint < 1 then
		Msg2Player("Ng��i kh�ng c� �i�m k� n�ng tr�ng sinh 4, k� n�ng kh�ng th� n�ng l�n.")
		return 0
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint - 1
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint) -- ���ٿ�ʹ�õļ��ܵ���
	SetTask(TSK_USED_SKILL_POINT_4, (GetTask(TSK_USED_SKILL_POINT_4) + 1))	-- ������ʹ�õļ��ܵ�ֵ
	AddMagic(nSkillId, mlvl + 1)
	Msg2Player(format("Tu luy�n [%s]c�a ng��i �� ���c th�ng c�p, V�n c� th� s� d�ng �i�m k� n�ng tr�ng sinh 4 l� %d.", szSkillName, nLeaveSkillPoint))
	return 1
end
