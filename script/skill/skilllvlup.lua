Include("\\script\\skill\\lvlup150_l21_limit.lua")

SOSkillLevelUp={}
MESSAGES={
	"V� c�n b�n c�a [%s] b�n qu� th�p, h�n ch� [%s] luy�n c�p.",
	"V� c�n b�n c�a [%s] b�n qu� th�p, h�n ch� [%s] t�ng c�p.",
	"C�p �� tu luy�n c�a b�n �� ��t ��nh r�i, kh�ng th� n�ng cao h�n n�a.",
	"Ng��i v�n ch�a l�nh h�i ���c ?%s? k� x�o tu luy�n c�p cao h�n, kh�ng th� tu luy�n k� n�ng n�y"
}

--�����ն�������������
function SOSkillLevelUp.Pudu_zhongsheng()
	local perSkills={{93,"T� H�ng Ph� D"},{89,"M�ng �i�p "},{86,"L�u Th�y "},{92,"Ph�t T�m T� H�u"},{282,"Thanh �m Ph�n X��ng"}}
	local mainSkill = {332,"Ph� �� Ch�ng Sinh "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�����һ�����������
function SOSkillLevelUp.Luanhuan_ji()
	local perSkills={{347,"��a Di�m H�a "},{303,"��c Th�ch C�t "},{343,"Xuy�n T�m Th�ch "},{345,"H�n B�ng Th�ch "},{349,"L�i K�ch Thu�t "}}
	local mainSkill = {351,"Lo�n Ho�n K�ch"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--���������һ�����������
function SOSkillLevelUp.Pililuanhuan_ji()
	local perSkills={{45,"T�ch L�ch ��n"},{351,"Lo�n Ho�n K�ch"}}
	local mainSkill = {1110,"T�ch L�ch Lo�n Ho�n K�ch"}
	local nMaxLevel = GetSkillMaxLevel(mainSkill[1])
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>=nMaxLevel) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	if mlvl == 20 and tbLvUp150L21Limit:IsAvailable(mainSkill[1]) == 0 then
		Msg2Player(format(MESSAGES[4],mainSkill[2]))
		return 0
	end
	
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�嶾�Ͻ����������
function SOSkillLevelUp.Duanjin_fugu()
	local perSkills={{67,"C�u Thi�n Cu�ng L�i "},{70,"X�ch Di�m Th�c Thi�n"},{64,"B�ng Lam Huy�n Tinh"},{356,"Xuy�n Y Ph� Gi�p "},{72,"Xuy�n T�m ��c Th�ch"}}
	local mainSkill = {390,"�o�n C�n H� C�t "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�������������������
function SOSkillLevelUp.Shehun_luanxin()
	local perSkills={{136,"H�a Ph�n Li�n Hoa"},{137,"�o �nh Phi H� "},{140,"Phi H�ng V� T�ch "},{364,"Bi T� Thanh Phong "},{143,"L�ch Ma �o�t H�n"}}
	local mainSkill = {391,"Nhi�p H�n Lo�n T�m "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�������ɴ����������
function SOSkillLevelUp.Zuixian_cuogu()
	local perSkills={{392,"Th�c Ph��c Ch� "},{174,"Ki B�n ph� "},{393,"B�c Minh ��o H�i"},{175,"Khi H�n Ng�o Tuy�t"},{90,"M� Tung �o �nh"}}
	local mainSkill = {394,"T�y Ti�n T� C�t"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end
