IncludeLib("FILESYS")

------------------------------------------------------------------------------------

-- �������ļ�
function ini_loadfile(filename, is_create)
	if (IniFile_Load(filename, filename) == 0) and (is_create ~= nil) then
		File_Create(filename)
	end
end

--����ļ��е�szSection��key��ֵ
function ini_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function ini_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

-- �����ļ��浵
function ini_save(filename)
	IniFile_Save(filename, filename)
end

--------------------------------------------------------------------------------------

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

--�������ļ���������һ������
function GetRandomAData(mapfile)
	local totalcount = %GetTabFileHeight(mapfile);
	if (totalcount == 0) then
		return 0
	end
	local id = random(totalcount);
	local x = GetTabFileData(mapfile, id + 1, 1);
	local y = GetTabFileData(mapfile, id + 1, 2);
	return x,y
end
