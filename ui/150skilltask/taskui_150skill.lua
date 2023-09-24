IncludeLib("FILESYS")
Include("\\script\\lib\\string.lua")
Include("\\UI\\npcpos.lua")


tb150skillTask = {
	nTaskId_CurStep = 2885,
	tbTaskList = {},
}

function AddTaskInfo(g_Task, tbTask)
	if tbTask ~= nil then
		g_Task.tbTaskList[tbTask.nFact] = tbTask
	end
end

--����������
tbTaskCuiYan = {
	szName = "Th�y Y�n",
	nFact = 5,
	nFinishStep = 6,
	tbStep = {},
}

tbTaskCuiYan.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nh��c Lan"] = tbNpcPosSet.RuoLan},
}

tbTaskCuiYan.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Thay Nh��c Lan s� t� �i h�i Chu V�n Tuy�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Chu V�n Tuy�n"] = tbNpcPosSet.ZhouYunQuan},
}

tbTaskCuiYan.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H� s�n t�m Chu V�n Tuy�n �� tr�t b� �u t� cho Nh��c Lan t� t�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["C��ng Nh�n"] = tbNpcPosSet.QiangRen},
}

tbTaskCuiYan.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Chu V�n Tuy�n qu� nhi�n l�a ta, v� V� �ang xem h�n c� c�n d�m n�i g� n�a kh�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Chu V�n Tuy�n"] = tbNpcPosSet.ZhouYunQuan},
}

tbTaskCuiYan.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Thay Chu V�n Tuy�n �i T��ng D��ng m�t chuy�n, l�y Bao Nang ��a cho L�u H�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["L�u H�ng"] = tbNpcPosSet.LiuHeng},
}

tbTaskCuiYan.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "N�i cho Nh��c Lan s� t� bi�t nh�ng g� m�nh m�t th�y tai nghe",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nh��c Lan"] = tbNpcPosSet.RuoLan},
}

AddTaskInfo(tb150skillTask, tbTaskCuiYan)

--����������
tbTaskTangMen = {
	szName = "���ng M�n",
	nFact = 2,
	nFinishStep = 7,
	tbStep = {},
}

tbTaskTangMen.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["���ng B�t Nhi�m"] = tbNpcPosSet.DialogFightTangBuRan},
}

tbTaskTangMen.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i D��ng Ch�u t�m D� Kh�ng Kh�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["D� Kh�ng Kh�ng"] = tbNpcPosSet.YuKongKong},
}

tbTaskTangMen.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i D��ng Gi�c ��ng t�m D��ng Ch� B�ch Ng�c",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["S�n T�c ��u M�c"] = tbNpcPosSet.ShanZeiTouMu},
}

tbTaskTangMen.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "L�y D��ng Ch� B�ch Ng�c ��a cho D� Kh�ng Kh�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["D� Kh�ng Kh�ng"] = tbNpcPosSet.YuKongKong},
}

tbTaskTangMen.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "L�y �� ph� ��a cho ���ng B�t Nhi�m",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["���ng B�t Nhi�m"] = tbNpcPosSet.DialogFightTangBuRan},
}

tbTaskTangMen.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ra ngo�i ���ng M�n xem ���ng B�t Nhi�m �ang l�m danh ���ng g�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["���ng B�t Nhi�m"] = tbNpcPosSet.FightTangBuRan},
}

tbTaskTangMen.tbStep[6] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "���ng B�t Nhi�m qu� nhi�n d�m nu�t l�i, tr� v� t�m h�n h�i cho ph�i tr�i",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["���ng B�t Nhi�m"] = tbNpcPosSet.DialogFightTangBuRan},
}

AddTaskInfo(tb150skillTask, tbTaskTangMen)

--����������
tbTaskEMei = {
	szName = "Nga Mi",
	nFact = 4,
	nFinishStep = 7,
	tbStep = {},
}

tbTaskEMei.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�u Nh� "] = tbNpcPosSet.MiaoRu},
}

tbTaskEMei.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ra tr��c s�n m�n ��nh b�i Gia Lu�t T� Ly",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Gia Lu�t T� Ly"] = tbNpcPosSet.YelvPiLi},
}

tbTaskEMei.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Di�u Nh�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�u Nh� "] = tbNpcPosSet.MiaoRu},
}

tbTaskEMei.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n ch� M�c V�n T� nh� c� ta tr� th��ng cho ng��i",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�c V�n T�"] = tbNpcPosSet.MuYunCi},
}

tbTaskEMei.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n H��ng Th�y ��ng thay Ti�n T� t�m Tri�m Tuy�t B�ng Li�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n n�i c�n ��n.",
	tbAutoFindPath = {["Tri�m Tuy�t B�ng Li�n"] = tbNpcPosSet.BingLian},
}

tbTaskEMei.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Giao B�ng Li�n cho M�c V�n T�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�c V�n T�"] = tbNpcPosSet.MuYunCi},
}

tbTaskEMei.tbStep[6] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "V� g�p Thanh Hi�u S� Th�i b�m b�o",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Thanh Hi�u S� Th�i "] = tbNpcPosSet.XiaoQingShiTai},
}


AddTaskInfo(tb150skillTask, tbTaskEMei)

--�嶾������
tbTaskWudu = {
	szName = "Ng� ��c",
	nFact = 3,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskWudu.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["V�n B�t T� "] = tbNpcPosSet.YunBuXie},
}

tbTaskWudu.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "T��ng k� t�u k� t�m B�ch Doanh Doanh th� n�i V�n B�t T� mu�n l�y ��u c�a c� ta",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["B�ch Doanh Doanh"] = tbNpcPosSet.BaiYingYing},
}

tbTaskWudu.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Theo l�i c�a B�ch Doanh Doanh t�m M�c V� T�n b�n b�c",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�c V� Ng�n"] = tbNpcPosSet.MuWuYan},
}

tbTaskWudu.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "L�y Th� C�n giao cho V�n B�t T�, �� � xem b� ta c� n�i g� kh�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["V�n B�t T� "] = tbNpcPosSet.YunBuXie},
}

tbTaskWudu.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Tr� v� t�m B�ch Doanh Doanh, �em t�t c� chuy�n n�y �� cho c� ta h�t",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["B�ch Doanh Doanh"] = tbNpcPosSet.BaiYingYing},
}

AddTaskInfo(tb150skillTask, tbTaskWudu)

--ؤ��������
tbTaskGaiBang = {
	szName = "C�i Bang",
	nFact = 6,
	nFinishStep = 9,
	tbStep = {},
}

tbTaskGaiBang.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["H� Nh�n Ng� "] = tbNpcPosSet.HeRenWo},
}

tbTaskGaiBang.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "T�m Ng�y Li�u �ng h�i xem t�nh h�nh ��i h�i c�a C�i Bang",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ng�y Li�u �ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n ch� M�nh Tinh t�m h�n ta t� th�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�nh tinh:"] = tbNpcPosSet.FightMengXing},
}

tbTaskGaiBang.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Ng�y Li�u �ng k�t qu� t� th�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ng�y Li�u �ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n ch� c�a M�nh Th��ng L��ng ph� gi�i �� C�u Tr�n Ph�p",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�nh Th��ng L��ng"] = tbNpcPosSet.MengChangLang},
}

tbTaskGaiBang.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Ng�y Li�u �ng k�t qu� t� th�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ng�y Li�u �ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[6] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n ch� c�a M�nh Tinh gi�p y ph� tr�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["M�nh tinh:"] = tbNpcPosSet.DialogMengXing},
}

tbTaskGaiBang.tbStep[7] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p k�t qu� v�i Ng�y Li�u �ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ng�y Li�u �ng"] = tbNpcPosSet.WeiLiaoWeng},
}

tbTaskGaiBang.tbStep[8] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "T�m ai quy�t ��nh k�t qu� t� v� c�a ta",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["H� Nh�n Ng� "] = tbNpcPosSet.HeRenWo},
}

AddTaskInfo(tb150skillTask, tbTaskGaiBang)

--����������
tbTaskTianRen = {
	szName = "Thi�n Nh�n",
	nFact = 7,
	nFinishStep = 9,
	tbStep = {},
}

tbTaskTianRen.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["�oan M�c Du� "] = tbNpcPosSet.DuanMuRui},
}

tbTaskTianRen.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n L�m An t�m di�t Di�p H�nh Ki�m",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�p H�nh Ki�m Di�p H�nh Ki�m"] = tbNpcPosSet.YeXingJian},
}

tbTaskTianRen.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Xem Th� T�n",
}

tbTaskTianRen.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i V� Di S�n t�m Nh�c Hoa L�o Nh�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ti�u Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Mua b�nh k�o t�ng cho Ti�u Nhan",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["H�ng D�u"] = tbNpcPosSet.MaiYouHuo,
										["Di�p Ti�u Ng�c"] = tbNpcPosSet.YeXiaoYu,
										["T� Tam N��ng"] = tbNpcPosSet.SuSanNiang,},
}

tbTaskTianRen.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "V� V� Di S�n t�m Ti�u Nhan, ��a k�o cho c� ta",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ti�u Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[6] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "C�c b�c l� n�i b�ng tuy�t chi ��a, h�y �i Tr��ng B�ch S�n xem m�t chuy�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nh�c Hoa l�o nh�n"] = tbNpcPosSet.YueHuaLaoRen},
}

tbTaskTianRen.tbStep[7] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Tr�n th� t�n n�i c�i g� �� kh�ng hi�u cho l�m, chi b�ng b�t ch�u g�i c�a l�o gi� n�y l�m con tin b�t h�n c�u nguy",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ti�u Nhan"] = tbNpcPosSet.XiaoYan},
}

tbTaskTianRen.tbStep[8] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Vi�c n�y c�c h� ��nh ph�i l�y th� t�n ��a cho �oan M�c Du�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["�oan M�c Du� "] = tbNpcPosSet.DuanMuRui},
}

AddTaskInfo(tb150skillTask, tbTaskTianRen)


--����������
tbTaskShaoLin = {
	szName = "Thi�u L�m",
	nFact = 0,
	nFinishStep = 6,
	tbStep = {},
}

tbTaskShaoLin.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ph��ngTr��ng T� Nh�n"] = tbNpcPosSet.XuanYin},
}

tbTaskShaoLin.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Xu�ng n�i ��i tho�i v�i N� T�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["S�n H� N� T�"] = tbNpcPosSet.NvZi},
}

tbTaskShaoLin.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p ph��ng tr��ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ph��ngTr��ng T� Nh�n"] = tbNpcPosSet.XuanYin},
}

tbTaskShaoLin.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Xu�ng n�i ��i tho�i v�i N� T�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["S�n H� N� T�"] = tbNpcPosSet.NvZi},
}

tbTaskShaoLin.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��nh b�i Ph� Nh�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ph� Nh�n"] = tbNpcPosSet.FeiRen},
}

tbTaskShaoLin.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p ph��ng tr��ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ph��ngTr��ng T� Nh�n"] = tbNpcPosSet.XuanYin},
}

AddTaskInfo(tb150skillTask, tbTaskShaoLin)

--�䵱������
tbTaskWuDang = {
	szName = "V� �ang",
	nFact = 8,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskWuDang.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�p Ti�p M� "] = tbNpcPosSet.YeJiMei},
}

tbTaskWuDang.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Xu�ng n�i ��nh lui C��ng Nh�n ��u L�nh",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["C��ng Nh�n ��u L�nh"] = tbNpcPosSet.QiangRenTouLing},
}

tbTaskWuDang.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Di�p K� M�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�p Ti�p M� "] = tbNpcPosSet.YeJiMei},
}

tbTaskWuDang.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��n T��ng D��ng t�m Ngu Do�n V�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ngu Do�n V�n"] = tbNpcPosSet.YuYunWen},
}

tbTaskWuDang.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Di�p K� M�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�p Ti�p M� "] = tbNpcPosSet.YeJiMei},
}

AddTaskInfo(tb150skillTask, tbTaskWuDang)

--����������
tbTaskTianWang = {
	szName = "Thi�n V��ng",
	nFact = 1,
	nFinishStep = 4,
	tbStep = {},
}

tbTaskTianWang.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["D��ng Anh"] = tbNpcPosSet.YangYing},
}

tbTaskTianWang.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "T�m ���c Di�p H�nh Ki�m",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Di�p H�nh Ki�m Di�p H�nh Ki�m"] = tbNpcPosSet.LinAnYeXingJian},
}

tbTaskTianWang.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��nh b�i Ho�n Nhan Kh� H�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Ho�n Nhan Kh� H�"] = tbNpcPosSet.WanYanKeXi},
}

tbTaskTianWang.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p D��ng Anh",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["D��ng Anh"] = tbNpcPosSet.YangYing},
}

AddTaskInfo(tb150skillTask, tbTaskTianWang)

--����������
tbTaskKunLun = {
	szName = "C�n L�n",
	nFact = 9,
	nFinishStep = 5,
	tbStep = {},
}

tbTaskKunLun.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��ng c�p ��t ��n 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Tuy�n C� T� "] = tbNpcPosSet.DialogXuanJiZi},
}

tbTaskKunLun.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ra ngo�i �i�n t� th� v�i Ch��ng M�n �� �n ch�ng v� h�c c�a m�nh",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Tuy�n C� T� "] = tbNpcPosSet.FightXuanJiZi},
}

tbTaskKunLun.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "V� l�i ch�nh �i�n t�m ch��ng m�n th�nh gi�o",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Tuy�n C� T� "] = tbNpcPosSet.DialogXuanJiZi},
}

tbTaskKunLun.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "T�m Th�n T�c L�o Nh�n th�nh gi�o v� ki�m kh�ng g�y",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Th�n T�c L�o Nh�n"] = tbNpcPosSet.TanXiLaoRen},
}

tbTaskKunLun.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i ��p Ch��ng M�n",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Tuy�n C� T� "] = tbNpcPosSet.DialogXuanJiZi},
}


AddTaskInfo(tb150skillTask, tbTaskKunLun)

tbTaskHuaShan = {
	szName = "Hoa S�n",
	nFact = 10,
	nFinishStep = 0,
	tbStep = {},
}
AddTaskInfo(tb150skillTask, tbTaskHuaShan)

tbTaskWuHon = {
	szName = "V� H�n",
	nFact = 11,
	nFinishStep = 0,
	tbStep = {},
}
AddTaskInfo(tb150skillTask, tbTaskWuHon)

--�¸赺������
tbTaskYueGeDao = {
	szName = "Nguy�t Ca ��o",
	nFact = 20,
	nFinishStep = 14,
	tbStep = {},
}

tbTaskYueGeDao.tbStep[0] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "C� Nguy�t Ca L�nh �i ��n Nguy�t Ca ��o �i�u tra m�t phen",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Thuy�n Phu D��ng Ch�u"] = tbNpcPosSet.YangZhouChuanFu},
}

tbTaskYueGeDao.tbStep[1] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ��n ch� Nguy�t Ca V� V�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca V� V�"] = tbNpcPosSet.YueGeWuWei1},
}

tbTaskYueGeDao.tbStep[2] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ��n ch� T�y Ki�m Tr� Nguy�t Ca ��o",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca V� V�"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[3] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Ph�a tr��c l� T�y Ki�m Tr�, xin h�y ��n �� thanh t�y c� ki�m. Sau khi ��n T�y Ki�m Tr� r�i h�y m� c�m nang ra nh�n v�o c� ki�m th� c� th� thanh t�y",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n T�y Ki�m Tr�.",
	tbAutoFindPath = {["T�y Ki�m Tr�"] = tbNpcPosSet.XiJianChi},
}

tbTaskYueGeDao.tbStep[4] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "H�i Nguy�t Ca V� V� xem thanh t�y c� ki�m nh� th� n�o",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca V� V�"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[5] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ��n trong r�ng c�y xem c� m�n �� g� ��ng �� d�ng hay kh�ng",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n Th� M�c ph�a tr��c",
	tbAutoFindPath = {["Th� M�c"] = tbNpcPosSet.ShuMu},
}

tbTaskYueGeDao.tbStep[6] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "S� d�ng Th� B� Th�nh Th�y thanh t�y c� ki�m. ��n T�y Ki�m Tr� r�i m� c�m nang nh�n chu�t v�o s� ti�n h�nh thanh t�y.",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n T�y Ki�m Tr�.",
	tbAutoFindPath = {["T�y Ki�m Tr�"] = tbNpcPosSet.XiJianChi},
}

tbTaskYueGeDao.tbStep[7] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "C� ki�m �� ���c thanh t�y s�ch s�, h�i ��p V� V� b�n c�nh",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca V� V�"] = tbNpcPosSet.YueGeWuWei2},
}

tbTaskYueGeDao.tbStep[8] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ��n T�ng Ki�m C�c",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n Bia ��",
	tbAutoFindPath = {["Bia ��"] = tbNpcPosSet.ShiBei},
}

tbTaskYueGeDao.tbStep[9] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Ch� t�o kh�ng ch�ng cho binh kh� c�a m�nh",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng ��n Bia ��",
	tbAutoFindPath = {["Bia �� Ki�m Gia"] = tbNpcPosSet.ShiBeiEx},
}

tbTaskYueGeDao.tbStep[10] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Ti�p t�c l�n n�i �i�u tra",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca Ki�m Th�"] = tbNpcPosSet.YueGeJianShi},
}

tbTaskYueGeDao.tbStep[11] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "�i ��n Lu�n Ki�m Phong t�m ��o Ch�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca ��o Ch�"] = tbNpcPosSet.YueGeDaoZhu},
}

tbTaskYueGeDao.tbStep[12] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "Sau khi chu�n b� xong xu�i th� khi�u chi�n v�i ��o Ch�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca ��o Ch�"] = tbNpcPosSet.YueGeDaoZhu},
}

tbTaskYueGeDao.tbStep[13] = {
	szName = "Nhi�m v� k� n�ng c�p 150",
	szInfo = "��i tho�i v�i ��o ch�",
	szReminder = "Nh�n chu�t tr�i v�o hi�n th� t�m ���ng th� c� th� t� ��ng �i ��n tr��c m�t ng��i ��.",
	tbAutoFindPath = {["Nguy�t Ca ��o Ch�"] = tbNpcPosSet.YueGeDaoZhu},
}


AddTaskInfo(tb150skillTask, tbTaskYueGeDao)

tbFactSkill = {
	[0] = {[90] = {318, 319, 321}, [120] = {709},},
	[1] = {[90] = {322, 325, 323}, [120] = {708},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710},},
	[3] = {[90] = {353, 355, 390}, [120] = {711},},
	[4] = {[90] = {380, 328, 332}, [120] = {712},},
	[5] = {[90] = {336, 337}, [120] = {713},},
	[6] = {[90] = {357, 359}, [120] = {714},},
	[7] = {[90] = {361, 362, 391}, [120] = {715},},
	[8] = {[90] = {365, 368}, [120] = {716},},
	[9] = {[90] = {372, 375, 394}, [120] = {717},},
	[10] = {[90] = {1364, 1382}, [120] = {1365},},
	[11] = {[90] = {1967, 1969}, [120] = {1984},},
}

function checkcondition()
	if GetLevel() < 150 then
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil then
		return
	end
	local tbFact = tbFactSkill[nFact]
	if tbFact == nil then
		return
	end
	local nFlag = 0
	for i = 1, getn(tbFact[90]) do
		if HaveMagic(tbFact[90][i]) >= 0 then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		return
	end
	if HaveMagic(tbFact[120][1]) < 0 then
		return
	end
	return 1
end

function show_150skill_taskinfo(nTaskIdx, nTaskGenre)

	local nTaskCurStep = GetTask(tb150skillTask.nTaskId_CurStep)
	if floor(nTaskCurStep/100) >= 14 then
		local szFinishMsg = "<color=gold>Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� k� n�ng c�p 150, ch�c ng��i danh ch�n giang h�! \n<color>"
		szFinishMsg = format("%s h�nh th�c tu luy�n k� n�ng c�p 150 nh� sau: \n",szFinishMsg)
		szFinishMsg = format("%s �i ��n <color=green> ��o Hoa Nguy�n <color> ( Ba L�ng Huy�n, V� Di S�n, Ph�c L�u ��ng, ��o Hoa Nguy�n ), t�m <color=green> V� Danh T�ng <color> ��a ng��i ��n <color=green> V� Danh M�t C�nh <color> n�ng cao �� tu luy�n ��i v�i k� n�ng c�p 150. \n",szFinishMsg)
		szFinishMsg = format("%s ch� �: C� th� th�ng qua mua ��o c� � K� Tr�n C�c <color=green> B�ch C�u Ho�n K� n�ng ��c Bi�t <color> �� n�ng cao �� tu luy�n k� n�ng c�p 150",szFinishMsg)
		NewTask_DetailTextOut(nTaskGenre, szFinishMsg)
		NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)	
		return
	end
	
	if checkcondition() ~= 1 then
		NewTask_DetailTextOut(nTaskGenre, "<enter><color=orange>Ng��i c�n ph�i  ��t ��n c�p 150, h�n n�a luy�n ���c k� n�ng c�p 90 v� 120 c�a m�n ph�i m�i c� th� nh�n ���c nhi�m v� k� n�ng c�p 150. <color> <enter>")
		return
	end


	local nFact = GetLastFactionNumber()
	local nMsgIndex = 0
	if tb150skillTask.tbTaskList[nFact] == nil then
		NewTask_DetailTextOut(nTaskGenre, format("L�i h� th�ng, xin h�y li�n h� v�i ng�nh kh�ch ���ng!"))
		return
	end
	
	if tb150skillTask.tbTaskList[nFact].tbStep == nil then
		NewTask_DetailTextOut(nTaskGenre, "L�i h� th�ng, xin h�y li�n h� v�i ng�nh kh�ch ���ng!")
		return
	end
	
	local nFinishStep = tb150skillTask.tbTaskList[nFact].nFinishStep
	if nFinishStep <= nTaskCurStep then
		nFact = 20
		nTaskCurStep = floor(nTaskCurStep/100)
		nFinishStep = tb150skillTask.tbTaskList[nFact].nFinishStep
		if nFinishStep <= nTaskCurStep then
			NewTask_DetailTextOut(nTaskGenre, "<color=gold>Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� k� n�ng 150, ch�c ng��i danh ch�n giang h�! <color>")
			NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)	
			return
		end
	end
	
	local tbStepInfo = tb150skillTask.tbTaskList[nFact].tbStep[nTaskCurStep]
	if tbStepInfo == nil then
		NewTask_DetailTextOut(nTaskGenre, format("L�i h� th�ng, xin h�y li�n h� v�i ng�nh kh�ch ���ng!"))
		return
	end
	
	if tbStepInfo.szName ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>T�n nhi�m v� <color>: %s", tbStepInfo.szName))
		nMsgIndex = nMsgIndex + 1
	end 
	
	if tbStepInfo.szInfo ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>B��c hi�n t�i <color> : %s", tbStepInfo.szInfo))
		nMsgIndex = nMsgIndex + 1
	end
	
	if tbStepInfo.szAward ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>Ph�n th��ng nhi�m v� <color>: %s", tbStepInfo.szAward))
		nMsgIndex = nMsgIndex + 1
	end	
	
	if tbStepInfo.szReminder ~= nil then
		NewTask_DetailTextOut(nTaskGenre, format("<color=green>Hi�n th� nhi�m v� <color>: %s", tbStepInfo.szReminder))
		nMsgIndex = nMsgIndex + 1
	end	
	

	if tbStepInfo.tbAutoFindPath ~= nil then
		NewTask_DetailTextOut(nTaskGenre, "<enter>")
		nMsgIndex = nMsgIndex + 1
		local w, x, y = GetWorldPos()
		for szNpcName, tbNpcPos in tbStepInfo.tbAutoFindPath do
			local bMapIndex = -1
			for i =1, getn(tbNpcPos.tbPosSet) do
				if w == tbNpcPos.tbPosSet[i][1] then
					bMapIndex = i
				end
			end
			local szMsg = ""
			if bMapIndex >= 0 then
				NewTask_AddNpcFindPath(nTaskGenre, nMsgIndex, tbNpcPos.tbPosSet[bMapIndex][1], tbNpcPos.tbPosSet[bMapIndex][2], tbNpcPos.tbPosSet[bMapIndex][3])
				szMsg = format("%s <color=green>��a ta �i t�m <color> <color=gold>%s<color>", AEXP_TASKDESCCOMPLETE, szNpcName)
				szMsg = format("%s <color><color=gold>(%d,%d)<color>", szMsg, tbNpcPos.tbPosSet[bMapIndex][2]/8, tbNpcPos.tbPosSet[bMapIndex][3]/16)
			else
				szMsg = format("%s <color=red>��u ti�n xin h�y ��n %s r�i ti�n h�nh t�m ���ng <color>", AEXP_TASKDESCCOMPLETE, tbNpcPos.szMapName)
			end
			NewTask_DetailTextOut(nTaskGenre, szMsg)
			nMsgIndex = nMsgIndex + 1
		end	
	
	end
	
end