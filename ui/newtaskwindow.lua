
Include("\\ui\\taskui_master.lua");
Include("\\ui\\taskui_random.lua");
Include("\\ui\\taskui_world.lua");
Include("\\ui\\taskui_killer.lua");
Include("\\ui\\taskui_messenger.lua");
Include("\\ui\\taskui_partner_education.lua");
Include("\\ui\\taskui_partner_master.lua");
Include("\\ui\\taskui_partner_random.lua");
Include("\\ui\\taskui_wlls.lua");

Include("\\ui\\taskui_besttong.lua");

Include("\\ui\\taskui_tong_randomlingpai.lua");	--����������������
Include("\\UI\\150skilltask\\taskui_150skill.lua")

--��ʾ�Ѿ����
AEXP_TASKDESCCOMPLETE = "<tab><pic=10>"
--��ʾ����ִ��
AEXP_TASKDESCWORKING = "<tab><pic=20>"
--��ʾף����
AEXP_TASKDESCCOMPLETEALL = "<pic = 3>"
--��ʾ֧�������ͷ
AEXP_TASKDESAUX = "<tab>"

-- VN_MODIFY_20060427
-- �ر� ��������/��������/��ʹ����Ϣ/ͬ���������
-- �����б�
--	[1]��������,	[2]�������(0:����, 1:����, 2:�¼�),	[3]�����������(0:���, 1:ͬ��),	[4]�����������,	[5]�Ƿ�ǿ����ʾͼ��,	[6]ͼ��·��,	[7]��ʾ�ص�����
ARY_TASK =
{
--	  1,					2,	3,	4,											5,	6,															7
	{ "Long Ng� luy�n th�c",			0,	0,	{ {1000,1000} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_tutor.spr",	"showpasstaskdesc_tutor" },
	{ "B� m�t T�m Long h�i",		0,	0,	{ {1001,1001}, {1050,1053} },				1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_zheng.spr",	"showpasstaskdesc_zheng" },
	{ "C�u chuy�n L�m Uy�n Nhai",		0,	0,	{ {1002,1002}, {1054,1057} },				1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_zhong.spr",	"showpasstaskdesc_zhong" },
	{ "Long kh� chi h�a",			0,	0,	{ {1003,1003}, {1058,1061} },				1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_xiepai.spr",	"showpasstaskdesc_xie" },
	{ "Nhi�m v� D� T�u",			1,	0,	{ {1020,1037} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_task_001.spr",		"showrandraskdesc" },
	{ " Th� gi�i ",			1,	0,	{ {1064,1068}, {1569, 1569}, {1661,1710} },	1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_shijie.spr",	"showworldtaskdesc" },
	{ "Nhi�m v� S�t th� ",			1,	0,	{ {1082,1082} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\juanzhou_icon_025.spr",	"showkillertaskdesc" },
	{ "Th�ch th�c th�i gian",			1,	0,	{ {1201,1225} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_bangpai.spr",	"showmessengerdesc" },
--	{ "ͬ�������������",	1,	0,	{ {1226,1246} },							0,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\teshu_icon_027.spr",		"showpartnerdesc" },
--	{ "ͬ���������",		1,	1,	{ {3,80} },									0,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\teshu_icon_027.spr",		"showpartnermaster" },
	{ "V� l�m li�n ��u",			1,	0,	{ {1715,1735} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_quest_menpai.spr",	"showbwtaskdesc" },
	{ "Nhi�m v� ng�u nhi�n",       2,  0,  { {1301,1306} },							1,  "\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_task_001.spr",      "show_partner_randomdesc" },
	{ "Thi�n H� �� Nh�t Bang",			1,	0,	{ {1,2} },							1,	"\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_task_001.spr",	"showbwtaskbesttong" },
	{ "Nhi�m v� L�nh b�i nhi�m v� ��c bi�t",       2,  0,  { {1744,1746} },							1,  "\\spr\\ui3\\������ϵͳ\\����ͼ��\\juanzhou_icon_025.spr",      "show_tong_lingpaidesc" },
	{ "Nhi�m v� k� n�ng c�p 150",			0,  0,  { {2885,2885}},                 						1,  "\\spr\\ui3\\������ϵͳ\\����ͼ��\\icon_task_001.spr",	"show_150skill_taskinfo"},
};

-- ��������
g_nTaskCount = getn(ARY_TASK);	
	

-- ��������ʼ��ʱ����
function newtaskmain()
	for i = 1, g_nTaskCount do
		local sCurTask = ARY_TASK[i];
		if (sCurTask[5] == 1 or _isInTask(i) == 1) then
			NewTask_AddIcon(sCurTask[2], sCurTask[6], i);
		end
	end
end

-- ������� ��������tip
function newtaskmousetip(nTaskIdx)
	NewTask_ChangeMouseTip(ARY_TASK[nTaskIdx][1]);
end

-- ��ʾ�����ĺ��������ݴ���ID�����в�ͬ�Ľ���
function newtaskrequestinfo(nTaskIdx)
	dostring(ARY_TASK[nTaskIdx][7].."("..nTaskIdx..", "..ARY_TASK[nTaskIdx][2]..")");
end

-- �����������ı�ʱ���õĺ���
function taskvaluechange(nTaskValueID, nTaskValue)
	local nTaskIdx = _findTaskByTaskValueID(0, nTaskValueID);
	if (nTaskIdx > 0) then
		NewTask_AddIcon(ARY_TASK[nTaskIdx][2], ARY_TASK[nTaskIdx][6], nTaskIdx);
		NewTask_ShowTask(ARY_TASK[nTaskIdx][2], nTaskIdx);
	end
end

-- ��ͬ����������ı�ʱ���ô˹���
function partnertaskvaluechange(nPartnerIdx, nTaskValueID, nTaskValue)
	if (nPartnerIdx ~= PARTNER_GetCurPartner()) then
		return
	end
	local nTaskIdx = _findTaskByTaskValueID(1, nTaskValueID);
	if (nTaskIdx > 0) then
		NewTask_AddIcon(ARY_TASK[nTaskIdx][2], ARY_TASK[nTaskIdx][6], nTaskIdx);
		NewTask_ShowTask(ARY_TASK[nTaskIdx][2], nTaskIdx);
	end
end

-- �ж��Ƿ��ѽ���ָ������
function _isInTask(nTaskIdx)
	local nTaskValRangeCount = getn(ARY_TASK[nTaskIdx][4]);
	for i = 1, nTaskValRangeCount do
		local aryCurTaskValRange = ARY_TASK[nTaskIdx][4][i];
		for j = aryCurTaskValRange[1], aryCurTaskValRange[2] do
			local nTaskVal;
			if (ARY_TASK[nTaskIdx][3] == 0) then
				nTaskVal = GetTask(j);
			elseif (ARY_TASK[nTaskIdx][3] == 1) then
				local nCurPartnerIdx = PARTNER_GetCurPartner();
				if (nCurPartnerIdx > 0) then
					nTaskVal = PARTNER_GetTaskValue(nCurPartnerIdx, j);
				end
			end
			if (nTaskVal ~= nil and nTaskVal ~= 0) then
				return 1
			end
		end
	end
	
	return 0
end

-- ��ȡָ����������������ĸ������
function _findTaskByTaskValueID(nTaskValueType, nTaskValueID)
	for i = 1, g_nTaskCount do
		local sCurTask = ARY_TASK[i];
		if (sCurTask[3] == nTaskValueType) then
			local nTaskValRangeCount = getn(sCurTask[4]);
			for j = 1, nTaskValRangeCount do
				local aryCurTaskValRange = sCurTask[4][j];
				if (aryCurTaskValRange[1] <= nTaskValueID and nTaskValueID <= aryCurTaskValRange[2]) then
					return i
				end
			end
		end
	end
	return 0
end