
-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ���÷�������
	TaskName( "Tin t�c t� ��ng - th�ng b�o" );
	-- 10����һ��
	TaskInterval( 1440 );
	-- 0ʱ0�ֿ�ʼ������TaskTme, ����Relay����ʱ�Ϳ�ʼ��
	TaskTime( 14, 30 );
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "BATTLE OLD startup..." );
end

function TaskContent()
	RemoteExecute("\\script\\missions\\�ν�ս��pkս\\��ʱ���񴥷�.lua",	"main", 0)
	OutputMsg("---------Start Tong Kim C� -------------------------")
end