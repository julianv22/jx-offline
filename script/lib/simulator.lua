--Creator:yfeng
--Date:2004-8-31
--Comm:ģ��ϵͳ���������ڷ���Ϸ�����µ���

--Say����
function Say(content,num,...)
	local input
	print(content)
	if(arg==nil) then
		return
	end
	--����������ʽ	
	if(type(arg[1])=="table") then
		for i=1,num do
			print(format("[%s]",arg[1][i]))
		end
		flush()
		input=tonumber(read())
		if(not input) then
			return
		end
		return select(arg[1],input)
	end
	--����䳤������ʽ
	for i=1,num do
		print(format("[%s]",arg[i]))
	end
	flush()
	input=tonumber(read())
	if(not input) then
		return
	end
	return select(arg,input)
end
---Say�����ѡ��ص�
function select(buttons,index)
	local run,sp,ep
	if(index < 1 or index > getn(buttons)) then
		if(DEBUG) then
			print("select button index error.")
		end
		return
	end
	sp,ep = strfind(buttons[index],"/#")
	if(ep) then
		run = strsub(buttons[index],ep+1,strlen(buttons[index]))
		if(DEBUG) then
			print(run)
			print("dostring...")
		end
		return dostring(run)
	end
	sp,ep = strfind(buttons[index],"/")
	if(ep) then
		run = strsub(buttons[index],ep+1,strlen(buttons[index])).."()"
		if(DEBUG) then
			print(run)
			print("dostring...")
		end
		return dostring(run)
	end
	return
end
	
--�����ڴ澵�������
__memTempTask={}
__memTask={}

--����/�õ���ʱ�������
function SetTempTask(index,value)
	if(value==nil) then value = 0 end
	__memTempTask[index] = value
	if(DEBUG) then
		print(index,value)
	end
	return
end

function GetTempTask(index)
	local r = __memTempTask[index]
	if(r==nil) then return 0 end
	if(DEBUG) then print(r) end
	return r
end

