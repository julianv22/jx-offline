
-- 战役系统
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- 设置方案名称
	TaskName( "Tin t鴆 t� ng - th玭g b竜" );
	-- 10分钟一次
	TaskInterval( 1440 );
	-- 0时0分开始（不设TaskTme, 则是Relay启动时就开始）
	TaskTime( 12, 50 );
	-- 设置触发次数，0表示无限次数
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE OLD startup..." );
end

function TaskContent()
	RemoteExecute("\\script\\missions\\宋金战场pk战\\定时任务触发.lua",	"main", 0)
	OutputMsg("---------Start Tong Kim C� -------------------------")
end