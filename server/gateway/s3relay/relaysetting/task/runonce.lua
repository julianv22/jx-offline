-- �ύ���ļ��м�ͬʱ�ύTaskLit.ini������

RUNONCE_NAME	= "X�a ��i chi�n ��u v� d�ng"

function TaskShedule()
	-- ���÷�������
	TaskName(RUNONCE_NAME)
	-- ִֻ��һ��
	TaskInterval( 244000 )
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit(1)
	-- ���������Ϣ
end

function TaskContent()
	if (tonumber(date("%Y%m%d")) > 20060228) then
		OutputMsg("["..RUNONCE_NAME.."] Nhi�m v� �� qu� h�n, n�n kh�ng th� ch�p h�nh.")
		return
	end
	
	for n_lgtype = 2, 4 do
		local n_count	= 0
		local n_lid		= LG_GetFirstLeague(n_lgtype)
		while (n_lid ~= 0) do 
			local str_lgname = LG_GetLeagueInfo(n_lid)
			n_lid = LG_GetNextLeague(n_lgtype, n_lid)
			LG_ApplyRemoveLeague(n_lgtype, str_lgname)
			n_count	= n_count + 1
		end
		OutputMsg("X�a ��i chi�n ��u, lo�i h�nh:"..n_lgtype..". S� l��ng:"..n_count)
	end

	OutputMsg("�� ho�n th�nh nhi�m v� ["..RUNONCE_NAME.."]!")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
