--Creator:yfeng
--Date:2004-8-27


--����������

--���´���ģ����������new,����lua�ṩ��tableģ�����������
if not MEM_HEAD then
MEM_HEAD = 1

function __clone (org,des) --����һ���µ��ڴ�ռ䣬����֤��ģ��class������ͬ
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			des[i]={}
			__clone(j,des[i])
		else
			des[i]=j
		end
	end
end

function __cclone(org,des)
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				__cclone(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
end
		

function new(class,...) --ģ��new,����һ���µ�ʵ��,��ִ��α���캯��:new(...)
	local obj={}
	__clone(class,obj)
	if(type(obj.__new)=="function") then
--		if(DEBUG) then
--			print("call function new")
--			print("arg num:"..getn(arg))
--			for i=1,getn(arg) do
--				print("\targ["..i.."]��"..arg[i])
--			end
--		end
		obj:__new(arg)
	end
	return obj
end

function inherit(base,class) --��new�������ǣ�class���еĳ�Ա�����ٴ�base����
	__cclone(base,class)
	return class
end


end