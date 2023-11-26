IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua");

function main(battleid, mapid, ruleid, level, seriesid)
oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --���ø�ȫ�ֱ���Ϊ1����־��ǰ�������������ν�ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ������ν�ս�۵ı����㣬����������ԭ�ν�ս����ͼ
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 3) then
		print("battle level must 1 to 3, but now is "..level..", so it is error!");
		return
	end;
	battlekey = random(100000)
	signidx = SubWorldID2Idx(tbGAME_SIGNMAP[level]);

	SubWorld = idx
	round = BT_GetGameData(GAME_ROUND)

	if (signidx >= 0) then
		SubWorld = signidx
		BT_SetGameData(GAME_KEY, battlekey) --��ű���ս�۵�Key��
		BT_SetGameData(GAME_BATTLEID, battleid);
		BT_SetGameData(GAME_MAPID, mapid);
		BT_SetGameData(GAME_RULEID, ruleid);
		BT_SetGameData(GAME_LEVEL, level)
		BT_SetGameData(GAME_BATTLESERIES, seriesid)
		BT_SetGameData(GAME_ROUND, round)
	end
		
	SubWorld = idx;
	--���ø�ս�ֵ�����
	BT_SetGameData(GAME_KEY, battlekey) --��ű���ս�۵�Key��
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level);
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	OpenMission(ruleid);
	local logstr_d = "Battle Start :"..battleid.."rule"..ruleid.."Issue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d);
	SubWorld = oldSubWorld
end;
