-- ���ڽ��2005��11�·��ν�ˢ�ֵ�bug���º���,����������������ν����а�Ĺ���
TAB_SJ_LADDERID = 
{	10008	,
	10009	,
	10011	,
	10012	,
	10013	,
	10014	,
	10017	,
	10018	,
	10020	,
	10021	,
	10022	,
	10023	,
	10036	,
	10037	,
	10038	,
	10039	,
	10040	,
	10041	,
	10044	,
	10045	,
	10046	,
	10047	,
	10048	,
	10049	,
	10052	,
	10053	,
	10054	,
	10055	,
	10056	,
	10057	,
	10060	,
	10061	,
	10062	,
	10063	,
	10064	,
	10065	,
	10068	,
	10069	,
	10070	,
	10071	,
	10072	,
	10073	,
	10076	,
	10077	,
	10078	,
	10079	,
	10080	,
	10081	,
	10084	,
	10085	,
	10085	,
	10086	,
	10086	,
	10087	,
	10088	,
	10089	,
	10090	,
	10097	,
	10098	,
	10099	,
	10100	,
	10101	,
	10102	,
	10103	,
	10104	,
	10105	,
	10106	,
	10107	,
	10108	,
	10109	,
	10110	,
	10111	,
	10112	,
	10113	,
	10114	,
	10115	,
	10116	,
	10147	,
	10148	,
	10149	,
	10150	,
	10151	,
	10152	,
	10153	,
	10154	,
	10155	,
	10156	,
	10157	,
	10158	,
	10159	,
	10160	,
	10161	,
	10162	,
	};
	
function sj_ClearAllLadder()
	for i = 1, getn(TAB_SJ_LADDERID) do 
		Ladder_ClearLadder(TAB_SJ_LADDERID[i])
	end
	OutputMsg("X�a s� li�u b�ng x�p h�ng T�ng Kim t��ng quan!")
end

function TaskShedule()
	-- ���÷�������
	TaskName( "X�a t�t c� b�ng x�p h�ng T�ng Kim!" );
	-- ִֻ��һ�Σ����ڽ��2005��11�·��ν�ˢ�ֵ�bug���º���
	TaskInterval( 244000 );
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit(1);
	-- ���������Ϣ
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20051116) then
		OutputMsg(" [X�a s� li�u b�ng x�p h�ng T�ng Kim] Nhi�m v� �� qu� h�n, kh�ng th� ch�p h�nh.")		
		return
	end
	sj_ClearAllLadder();
	OutputMsg( "�� x�a xong t�t c� c�c s� li�u x�p h�ng T�ng Kim! ");
end
