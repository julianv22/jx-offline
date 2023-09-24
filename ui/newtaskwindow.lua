
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

Include("\\ui\\taskui_tong_randomlingpai.lua");	--ÌØÊâÈÎÎñÁîÅÆÈÎÎñ
Include("\\UI\\150skilltask\\taskui_150skill.lua")

--ÏÔÊ¾ÒÑ¾­Íê³É
AEXP_TASKDESCCOMPLETE = "<tab><pic=10>"
--ÏÔÊ¾ÕıÔÚÖ´ĞĞ
AEXP_TASKDESCWORKING = "<tab><pic=20>"
--ÏÔÊ¾×£ºØÓï
AEXP_TASKDESCCOMPLETEALL = "<pic = 3>"
--ÏÔÊ¾Ö§ÏßÈÎÎñµÄÍ·
AEXP_TASKDESAUX = "<tab>"

-- VN_MODIFY_20060427
-- ¹Ø±Õ ´³¹ØÈÎÎñ/ÎäÁÖÁªÈü/ĞÅÊ¹µÄĞÅÏ¢/Í¬°éËæ»úÈÎÎñ
-- ÈÎÎñÁĞ±í
--	[1]ÈÎÎñÃèÊö,	[2]ÈÎÎñ·ÖÀà(0:¾çÇé, 1:ÈÎÎñ, 2:ÊÂ¼ş),	[3]ÈÎÎñ±äÁ¿ÀàĞÍ(0:Íæ¼Ò, 1:Í¬°é),	[4]ÈÎÎñ±äÁ¿Çø¼ä,	[5]ÊÇ·ñÇ¿ÖÆÏÔÊ¾Í¼±ê,	[6]Í¼±êÂ·¾¶,	[7]ÏÔÊ¾»Øµ÷º¯Êı
ARY_TASK =
{
--	  1,					2,	3,	4,											5,	6,															7
	{ "Long Ngò luyÖn thøc",			0,	0,	{ {1000,1000} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_tutor.spr",	"showpasstaskdesc_tutor" },
	{ "Bİ mËt TÇm Long héi",		0,	0,	{ {1001,1001}, {1050,1053} },				1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_zheng.spr",	"showpasstaskdesc_zheng" },
	{ "C©u chuyÖn L©m Uyªn Nhai",		0,	0,	{ {1002,1002}, {1054,1057} },				1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_zhong.spr",	"showpasstaskdesc_zhong" },
	{ "Long khİ chi häa",			0,	0,	{ {1003,1003}, {1058,1061} },				1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_xiepai.spr",	"showpasstaskdesc_xie" },
	{ "NhiÖm vô D· TÈu",			1,	0,	{ {1020,1037} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_task_001.spr",		"showrandraskdesc" },
	{ " ThÕ giíi ",			1,	0,	{ {1064,1068}, {1569, 1569}, {1661,1710} },	1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_shijie.spr",	"showworldtaskdesc" },
	{ "NhiÖm vô S¸t thñ ",			1,	0,	{ {1082,1082} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\juanzhou_icon_025.spr",	"showkillertaskdesc" },
	{ "Th¸ch thøc thêi gian",			1,	0,	{ {1201,1225} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_bangpai.spr",	"showmessengerdesc" },
--	{ "Í¬°é½ÌÓıĞŞÁ¶ÈÎÎñ",	1,	0,	{ {1226,1246} },							0,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\teshu_icon_027.spr",		"showpartnerdesc" },
--	{ "Í¬°é¾çÇéÈÎÎñ",		1,	1,	{ {3,80} },									0,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\teshu_icon_027.spr",		"showpartnermaster" },
	{ "Vâ l©m liªn ®Êu",			1,	0,	{ {1715,1735} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_quest_menpai.spr",	"showbwtaskdesc" },
	{ "NhiÖm vô ngÉu nhiªn",       2,  0,  { {1301,1306} },							1,  "\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_task_001.spr",      "show_partner_randomdesc" },
	{ "Thiªn H¹ §Ö NhÊt Bang",			1,	0,	{ {1,2} },							1,	"\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_task_001.spr",	"showbwtaskbesttong" },
	{ "NhiÖm vô LÖnh bµi nhiÖm vô ®Æc biÖt",       2,  0,  { {1744,1746} },							1,  "\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\juanzhou_icon_025.spr",      "show_tong_lingpaidesc" },
	{ "NhiÖm vô kü n¨ng cÊp 150",			0,  0,  { {2885,2885}},                 						1,  "\\spr\\ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\icon_task_001.spr",	"show_150skill_taskinfo"},
};

-- ÈÎÎñ×ÜÊı
g_nTaskCount = getn(ARY_TASK);	
	

-- ÈÎÎñÃæ°å³õÊ¼»¯Ê±µ÷ÓÃ
function newtaskmain()
	for i = 1, g_nTaskCount do
		local sCurTask = ARY_TASK[i];
		if (sCurTask[5] == 1 or _isInTask(i) == 1) then
			NewTask_AddIcon(sCurTask[2], sCurTask[6], i);
		end
	end
end

-- ¶ÔÍâÊä³ö ¸øÊó±êÌí¼Ótip
function newtaskmousetip(nTaskIdx)
	NewTask_ChangeMouseTip(ARY_TASK[nTaskIdx][1]);
end

-- ÏÔÊ¾ÃèÊöµÄº¯Êı£¬¸ù¾İ´«ÈëIDÀ´½øĞĞ²»Í¬µÄ½âÎö
function newtaskrequestinfo(nTaskIdx)
	dostring(ARY_TASK[nTaskIdx][7].."("..nTaskIdx..", "..ARY_TASK[nTaskIdx][2]..")");
end

-- Íæ¼ÒÈÎÎñ±äÁ¿¸Ä±äÊ±µ÷ÓÃµÄº¯Êı
function taskvaluechange(nTaskValueID, nTaskValue)
	local nTaskIdx = _findTaskByTaskValueID(0, nTaskValueID);
	if (nTaskIdx > 0) then
		NewTask_AddIcon(ARY_TASK[nTaskIdx][2], ARY_TASK[nTaskIdx][6], nTaskIdx);
		NewTask_ShowTask(ARY_TASK[nTaskIdx][2], nTaskIdx);
	end
end

-- µ±Í¬°éÈÎÎñ±äÁ¿¸Ä±äÊ±µ÷ÓÃ´Ë¹ı³Ì
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

-- ÅĞ¶ÏÊÇ·ñÒÑ½ÓÁËÖ¸¶¨ÈÎÎñ
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

-- »ñÈ¡Ö¸¶¨ÈÎÎñ±äÁ¿ÊÇÊôÓÚÄÄ¸öÈÎÎñµÄ
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