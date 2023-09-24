--IncludeLib("TITLE");
Include("\\script\\lib\\file.lua")

--����trapfile���ļ������꼯�ϱ��������е�trap�㣬������scriptfile�Ľű�		
function addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;	

--"123,234" -> 123 , 234,��һ���ַ���д�ɵ���������ת�����������ֱ���
function str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

--��tab�������ļ�������õ�һ��������������tab,���nCount����
--�ļ�ӵ������ĸ������򷵻��ļ����������ꣻ
function getndata(tabfile, nCount)
	local nTotalCount = GetTabFileHeight(tabfile);
	local CoordinateTab = {};
	local i;
	local nPosX, nPosY;
	
	if (nTotalCount <= nCount) then --�����е�������з��أ�
		for i = 1, nTotalCount do
			CoordinateTab[i] = {};
			CoordinateTab[i][1] = GetTabFileData(tabfile, i + 1, 1); --nPosX
			CoordinateTab[i][2] = GetTabFileData(tabfile, i + 1, 2); --nPosY
		end;
	else --���nCount���ص㣻�����ĸ�������3W��ʱ���ã�
		local nBeginPos = random(1, nTotalCount);
		local nDistance = floor(nTotalCount / nCount);
		local nPos;
		
		for i = 1, nCount do
			CoordinateTab[i] = {};
			nPos = nBeginPos + nDistance * (i - 1);
			nPos = mod(nPos, nTotalCount) + 1;
			CoordinateTab[i][1] = GetTabFileData(tabfile, nPos + 1, 1); --nPosX
			CoordinateTab[i][2] = GetTabFileData(tabfile, nPos + 1, 2); --nPosY
		end;
	end;
	
	return CoordinateTab;
end;

--��tab�������ļ���������һ������
function getadata(tabfile)
	local totalcount = GetTabFileHeight(tabfile);
	id = random(totalcount);
	x = GetTabFileData(tabfile, id + 1, 1);
	y = GetTabFileData(tabfile, id + 1, 2);
	return x,y
end

--��tab�������ļ���������һ������
function getadatatow(tabfile, minline, maxline)
	local totalcount = GetTabFileHeight(tabfile);
	
	if (minline < 1) then
		minline = 1;
	end;
	
	if (maxline > totalcount) then
		print("maxline:"..maxline..",totalcount:"..totalcount)
		maxline = totalcount;
	end;
	
	id = random(minline, maxline);
	x = GetTabFileData(tabfile, id, 2);
	y = GetTabFileData(tabfile, id, 3);
	return x,y
end

--����npcfile���ļ������꼯�ϱ��������е�npcģ���Ϊtnpcid�ĶԻ�npc��������scriptfile�Ľű�
function adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x * 32, y * 32, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x * 32, y * 32);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		end
	end;
	return addcount
end;

--����NpcTab�����꼯�ϱ��������е�npcģ���Ϊtnpcid�ĶԻ�npc��������scriptfile�Ľű�
function tabadddiagnpc(NpcTab, scriptfile, tnpcid, name)
	if ("table" ~= type(NpcTab)) then
		print("chrismas actives error! function 'tabadddiagnpc()' param NpcTab is not a table value.")
		return
	end;
	
	local addcount = 0;
	local count = getn(NpcTab);
	
	local i;
	for i = 1, count - 1 do
		x = NpcTab[i][1];
		y = NpcTab[i][2];
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			SetNpcParam(npcidx,4,1)
			addcount = addcount + 1
		end
	end;
	return addcount
end;

--����NpcTab�����꼯�ϱ��������е�npcģ���Ϊtnpcid�ĶԻ�npc��������scriptfile�Ľű�
function tabaddgoods(NpcTab)
	if ("table" ~= type(NpcTab)) then
		print("springfestival2006 actives error! function 'tabadddiagnpc()' param NpcTab is not a table value.")
		return
	end;
	
	local addcount = 0;
	local count = getn(NpcTab);
	
	local i;
	for i = 1, count - 1 do
		x = NpcTab[i][1];
		y = NpcTab[i][2];
		nItemIdx = DropItem(SubWorld, x, y, -1, 6, 1, 1086, 1, 0, 0, 0);
        if (nItemIdx >= 1) then
            SetSpecItemParam(nItemIdx, 1, 1); --1��ʾ��ģ�2��ʾ�ٵ�
            SetSpecItemParam(nItemIdx, 2, 1); --ֻ��һ����Ҽ�
        end;
	end;
	return addcount
	--nItemIdx = DropItem(subworld, x, y, -1, 6, 1, 1050, 1, 0, 0, 0);
end;

--����һ������NPC
function add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		end
		return npcidx
end

--����npcfile���ļ������꼯�ϱ��������е�npcģ���Ϊtnpcid��ս������npc
function addfightnpc (npcfile, tnpcid, level, camp, removewhendeath, name, boss)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end
	
	for i = 1, count  do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			addcount = addcount + 1
		end
	end;
	return addcount
end;	

-- ���ַ������ָ���ָ���ظ��ָ����ɵ�����
-- ��1��strsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- ��2��strsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end

--ȡ��Ini�ļ�������
function getinifiledata(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end



function gettabfilestring(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tostring(TabFile_GetCell(mapfile, row, col))
	end
end
	
