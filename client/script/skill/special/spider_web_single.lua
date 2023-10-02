Include("\\script\\skill\\head.lua")
szScript = "\\script\\skill\\special\\spider_web_single.lua"
nScriptId = FileName2Id(szScript)
SKILLS =  
{
	spider_web={
			execscript=
			{
				[1]={{1,nScriptId},{20,nScriptId}},
				[2]={{1,1},{20,1}},
				[3]={{1,1},{20,1}}
			},
			
			frozen_action=
			{
				[1]={{1,1},{20,1}},
				[2]={{1,18},{20,18}},
				[3]={{1,1},{20,1}}
			},
			--��ڣ����ģʽ�ɹ���Ч��
			--forbit_attack={
				--[1]={{1,1},{20,1}},
				--[2]={{1,18},{20,18}},
				--[3]={{1,1},{20,1}}
			--},
			forbit_takemedicine=
			{
				[1]={{1,1},{20,1}},
				[2]={{1,18},{20,18}},
				[3]={{1,1},{20,1}}
			},
			missle_speed_v={{{1,28},{20,40}}},
			missle_hitcount={{{1,1},{20,1}}},
			skill_attackradius={{{1,1200},{20,1200}}},
			skill_cost_v={{{1,0},{20,0}}}
	},
}
DATA = {}
function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)
	
	local nX, nY, nMapIndex = GetNpcPos(nTargetNpcIndex)
	
	
	local nNpcIndex = AddNpcEx(1632,95,random(0,4),nMapIndex,nX,nY,1, "", 1)
	local nTmpCamp = GetTmpCamp(nLauncherNpcIndex)
	if nTmpCamp and nTmpCamp > 0 then
		SetTmpCamp(nTmpCamp, nNpcIndex)
	end
	local nCurCamp = GetNpcCurCamp(nLauncherNpcIndex)
	if nCurCamp then
		SetNpcCurCamp(nNpcIndex, nCurCamp)
	end
	DATA[nNpcIndex] = {nTargetNpcIndex, GetNpcName(nTargetNpcIndex)}
	AddNpcSkillState(nTargetNpcIndex, 1538, 1, 1,18*15)
	--AddNpcSkillState(nTargetNpcIndex, 1027, 1, 1,18*15)
	SetNpcTimer(nNpcIndex, 18*15)
	SetNpcScript(nNpcIndex, szScript)
	local szName = GetNpcName(nTargetNpcIndex)
	local _,_, nMapIndex = GetNpcPos(nTargetNpcIndex)
	
	Msg2Map(SubWorldIdx2ID(nMapIndex), format("m�ng nh�n do Ng� S�c Long Th� nh� ra b� qu�n l�i, h�y mau ph� h�y m�ng nh�n."))
end

function OnTimer(nNpcIndex)
	
	--local tb = DATA[nNpcIndex]
	--local szNpc = GetNpcName(tb[1])

	--if szNpc == tb[2] then
	--	KillNpcWithIdx(tb[1], nNpcIndex)
	--end
	
	DATA[nNpcIndex] = nil
	if nNpcIndex <= 0 then
		return 
	end
	DelNpc(nNpcIndex)
end

function OnDeath(nNpcIndex)
	
	local tb = DATA[nNpcIndex]
	local szNpc = GetNpcName(tb[1])

	if szNpc == tb[2] then
		RemoveNpcSkillState(tb[1], 1538)
	end
	DATA[nNpcIndex] = nil
end