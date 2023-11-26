
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �Ի��ַ��������ļ�
-- Edited by peres
-- 2005/09/01 PM 16:40

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================


-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

function TaskSay(caption, option)
	local str = caption;
	local strGenKey = strsub(str, 1, 5);
	if strGenKey=="<dec>" then
		str = strsub(str, 6, strlen(str));
		str = SetTaskSayColor(str);  -- ת���ؼ���
		Describe(str, getn(option), option)
	else
		str = SetTaskSayColor(str);  -- ת���ؼ���
		Say(str, getn(option), option)
	end;
end;

function TaskSayList(caption, ...)
	TaskSay(caption, arg)
end

-- �ô����������ֹ���һ�ζԻ����鲢ִ��
function CreateTaskSay(tb)
	local option = {}
	for i = 2, getn(tb) do
		tinsert(option, tb[i])
	end
	TaskSay(tb[1], option)
end;

KEY_TASKSAY = {
	key_left 	= "{{",					-- "<color=yellow>" �򻯱�ʶ
	key_right	= "}}",					-- "<color>" �򻯱�ʶ
	key_sex		= "<sex>",				-- �Ա��ʶ
	key_pan		= "<pan>",				-- ͬ��ͼ�����ӱ�ʶ
	key_npc		= "<npc>",				-- �Ի����� NPC ��ͼ����������ӱ�ʶ
	txt_left	= "<color=yellow>",
	txt_right	= "<color>"
}

-- ���ڴ����ı��ڵĹؼ��֣��磺�Ա��ʶ��ͬ��ͼ�����ӱ�ʶ���ص���ɫ��ʶ�ȡ�
function SetTaskSayColor(str)
	local strPan = CreatePartnerStringLink()
	local strNpc = CreateNpcStringLink()
	local strSex = GetPlayerSex();
				
	PushString(str)
	-- �����ص��ʶ��ɫ
	ReplaceString(KEY_TASKSAY.key_left, KEY_TASKSAY.txt_left)
	ReplaceString(KEY_TASKSAY.key_right, KEY_TASKSAY.txt_right)	
	
	-- �����Ա��ʶ
	ReplaceString(KEY_TASKSAY.key_sex, strSex)
	
	-- ����ͬ���ʶ
	ReplaceString(KEY_TASKSAY.key_pan, strPan)
	
	-- ���� NPC ���ֱ�ʶ
	ReplaceString(KEY_TASKSAY.key_npc, strNpc)

	return PopString()
end;


-- ���ڴ���һ��ѡ��ĶԻ����� Say(""...);
function SelectSay(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Say(caption, getn(option), option)
end;


-- ���ڴ���һ��ѡ��� Describe ����
function SelectDescribe(strSay)
	if (getn(strSay) < 2) then
		return
	end
	local caption = SetTaskSayColor(strSay[1])
	local option = {}
	for i = 2, getn(strSay) do
		tinsert(option, strSay[i])
	end
	Describe(caption, getn(option), option)
end


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TalkEx(fun,szMsg)

	local num = getn(szMsg);
	local szmsg = "";
	PushString(szmsg)
	for i=1,num-1 do
		-- szmsg = szmsg..format("%q",szMsg[i])..",";
		AppendString(format("%q",szMsg[i]))
		AppendString(",")
	end;
	szmsg = PopString()
	szmsg = szmsg .. format("%q",SetTaskSayColor(szMsg[num]));
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
	dostring(szmsg);
	
end;


-- �������� Describe �����ʾ��ͬ������ͼ��
function CreatePartnerStringLink()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local nSettingIdx = PARTNER_GetSettingIdx(partnerindex)         -- ��ȡͬ������� ID

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";

	if partnerindex<1 or partnerstate==0 then
		return "";
	end;

	-- ��󷵻ش�ͬ��������ͼ�������ַ���
	return strLink..PARTNER_GetName(partnerindex).."<link>: ";

end;


-- �������� Describe �����ʾ�� NPC ����ͼ��
function CreateNpcStringLink()

local nNpcIndex = GetLastDiagNpc();  -- �õ����Ի��� NPC INDEX

local nSettingIdx = GetNpcSettingIdx(nNpcIndex);  -- �õ��� NPC INDEX �� NPCS SETTINGS

local NpcName = GetNpcName(nNpcIndex);  -- �õ��� NPC ������

local strLink = "<#><link=image[0,8]:#npcspr:?NPCSID="..tostring(nSettingIdx).."?ACTION="..tostring(0)..">";


	if nNpcIndex==0 or nNpcIndex==nil then
		return "";
	end;
	
	return strLink.."<<"..NpcName..">><link>: ";

end;


-- �Ӻ��������Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()

local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 0) then
		mySex = "C�ng t� ";
	elseif (GetSex() == 1) then
		mySex = "N� hi�p";
	end
	
	return mySex;
	
end;
