Include("\\script\\lib\\common.lua")

TONGWAR_LGTYPE = 10		-- ս������

--ս�ӹ���Task
TONGWAR_LGTASK_TONGCNT	= 1	-- ��������(��Ч)
TONGWAR_LGTASK_WIN		= 2	-- ʤ������
TONGWAR_LGTASK_LOSE		= 3	-- ʧ�ܴ���
TONGWAR_LGTASK_TIE		= 4	-- ƽ�ִ���
TONGWAR_LGTASK_RESULT	= 5	-- ��������
TONGWAR_LGTASK_POINT	= 6	-- �ۼӾ�����
TONGWAR_SCORELOG = "relay_log\\tongwar"

-- �������Ʊ�
TONGWAR_LGNAME = {"Ph��ng T��ng", "Th�nh ��", "��i L�", "Bi�n Kinh", "T��ng D��ng", "D��ng Ch�u", "L�m An"}

RESULT_WIN	= 1		-- ʤ��
RESULT_LOSE	= 2		-- ʧ��
RESULT_TIE	= 3		-- ƽ��

function tongwar_score(szParam)		-- szParam[1]: ս�Ӽ�; szParam[2]: ս����; szParam[3]: ʤ�����; szParam[4]: ��ʤ��.
	local szlogfile = TONGWAR_SCORELOG..date("%y%m").."\\score.log"
	local params = split(szParam, " ")
	local team1 = tonumber(params[1])
	local team2 = tonumber(params[2])
	local result = tonumber(params[3])
	local net_score = tonumber(params[4])
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	OutputMsg("Recieve "..team1.." VS "..team2.." result: "..result.." net_score: "..net_score);
	OutputMsg("-------------------TONGWAR MSG---------------------------")
	local win_side, lose_side
	if (result == RESULT_WIN) then		-- �׷�ʤ
		win_side = team1
		lose_side = team2

	elseif (result == RESULT_LOSE) then
		win_side = team2				-- �ҷ�ʤ
		lose_side = team1
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOST !\n")
	elseif (result == RESULT_TIE) then		-- ˫��սƽ
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_TIE, 1)			-- �׷�ƽ�ֳ��μ�1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_TIE, 1)			-- �ҷ�ƽ�ֳ��μ�1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT, 1)		-- �׷��������ּ�1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT, 1)		-- �ҷ��������ּ�1
	end
	if (win_side and lose_side) then
		OutputMsg(win_side)
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_WIN, 1)		-- ʤ����ʤ���μ�1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_LOSE, 1)		-- �����ø����μ�1
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[win_side], TONGWAR_LGTASK_RESULT, 3)	-- ʤ���������ּ�3
--		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[lose_side], TONGWAR_LGTASK_RESULT, 0)	-- �����������ּ�0
	end
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT, net_score)	-- �ۼӼ׷�������
	LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT, -net_score)	-- �ۼ��ҷ�������
	local result1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_RESULT)
	local result2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_RESULT)
	local point1 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team1], TONGWAR_LGTASK_POINT)
	local point2 = LG_GetLeagueTask(TONGWAR_LGTYPE, TONGWAR_LGNAME[team2], TONGWAR_LGTASK_POINT)

	if (result == RESULT_WIN) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." WIN ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_LOSE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." LOSE ! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	elseif (result == RESULT_TIE) then
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." TIE! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	else
		WriteStringToFile(szlogfile , date()..TONGWAR_LGNAME[team1].." VS "..TONGWAR_LGNAME[team2].." ERROR?! SCORE:"..result1..","..result2.." Gain Point:"..net_score.."\n")
	end


	-- �ܻ�������
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team1], result1)
	Ladder_NewLadder(10225, TONGWAR_LGNAME[team2], result2)
	-- ����������
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team1], point1)
	Ladder_NewLadder(10226, TONGWAR_LGNAME[team2], point2)
end
