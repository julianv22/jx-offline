Include("\\script\\mission\\boss\\bigboss.lua")

function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE BIG BOSS 19��45" );
	TaskInterval( 1440 );
	TaskTime( 19, 45 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE BIG BOSS AT :  19:45" );
	OutputMsg( format("GOLD BOSS COUNT :  %d", BigBoss.gold_boss_count) );
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		return 0;
	end;
	
	BigBoss.isBigBossDead = 0;
	OutputMsg( format("GOLD BOSS COUNT :  %d", BigBoss.gold_boss_count) );
	if (BigBoss.gold_boss_count == 0) then
		local bossname = "��c C� Thi�n Phong";
		local series = random(0, 4);
		local bossid = BigBoss.BIG_BOSS_SER[series];
		local bosslvl = 95;
	
		local nPosIdx = random(1,getn(BigBoss.BIG_BOSS_POS));
		local nPosIdx2 = random(1,getn(BigBoss.BIG_BOSS_POS[nPosIdx][2]));
		local worldname = BigBoss.BIG_BOSS_POS[nPosIdx][3];
		local world = BigBoss.BIG_BOSS_POS[nPosIdx][1];
		local posx = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][1];
		local posy = BigBoss.BIG_BOSS_POS[nPosIdx][2][nPosIdx2][2];
		local str = format("Giang h� truy�n r�ng  <color=yellow>%s<color>  �� xu�t hi�n � <color=yellow>%s<color> ! Giang h� �t s� c� m�t tr�n ��m m�u!", bossname, worldname);
		
		GlobalExecute(format("dwf \\script\\missions\\boss\\call_big_boss.lua BigBoss:Make_Big_Boss(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]] )",bossid, bosslvl, series, world, posx, posy, bossname, str ));
		OutputMsg("Create Boss "..bossname..","..bossid..","..bosslvl..","..world..","..posx..","..posy..","..series..date("----%Y%m%d%H%M"))
	else
		
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end