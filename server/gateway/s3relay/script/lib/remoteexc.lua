Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")

if not tbRemoteExcClass then
	tbRemoteExcClass = tbBaseClass:new();
end

tbRemoteExcClass.tbCallBack = {};

-- ����szCallBackFun�Ĳ�������tbCallBackParam�ڵ�ֵ+Զ�̺����ķ���ֵ
function RemoteExc(szRemoteScript, szRemoteFun, tbRemoteParam, szCallBackScript, szCallBackFun, tbCallBackParam, dwGameSvrID)
	local handle = OB_Create();
	
	
	ObjBuffer:PushObject(handle, szRemoteScript);
	ObjBuffer:PushObject(handle, szRemoteFun);
	ObjBuffer:PushObject(handle, tbRemoteParam);
	
	if szCallBackScript and szCallBackScript ~= "" then
		local nCallBackID = getn(tbRemoteExcClass.tbCallBack) + 1;
		tbRemoteExcClass.tbCallBack[nCallBackID] = {szCallBackScript, szCallBackFun, tbCallBackParam};
		RemoteExecute("\\script\\lib\\remoteexc.lua", "ReceiveExc", handle, "RemoteExc_CallBack", nCallBackID, dwGameSvrID);	
	else
		RemoteExecute("\\script\\lib\\remoteexc.lua", "ReceiveExc", handle, nil, 0, dwGameSvrID);
	end
	OB_Release(handle);
end

function RemoteExc_CallBack(Param, ResultHandle)
	if (tbRemoteExcClass.tbCallBack[Param] ~= nil) then
		local szCallBackScript	= tbRemoteExcClass.tbCallBack[Param][1];
		local szCallBackFun	= tbRemoteExcClass.tbCallBack[Param][2];
		local tbCallBackParam = tbRemoteExcClass.tbCallBack[Param][3];
		local tbRemoteRet = {};
		if (OB_IsEmpty(ResultHandle) ~= 1) then
			tbRemoteRet = ObjBuffer:PopObject(ResultHandle);
		end
		
		if (szCallBackScript ~= nil and szCallBackScript ~= "" and 
				szCallBackFun ~= nil and szCallBackFun ~= "") then
				-- ��2��������ϲ�
				local tbParam = {szCallBackScript, szCallBackFun};
				if (type(tbCallBackParam) == "table") then
					for i=1, getn(tbCallBackParam) do
						tinsert(tbParam, tbCallBackParam[i]);
					end
				end
				if (type(tbRemoteRet) == "table") then
					for i=1, getn(tbRemoteRet) do
						tinsert(tbParam, tbRemoteRet[i]);
					end
				end
		
				--DynamicExecute(szCallBackScript, szCallBackFun, unpack(tbParam))
				call(DynamicExecute, tbParam);
		end
		
		tbRemoteExcClass.tbCallBack[Param] = nil;
	end
end

function ReceiveExc(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local szScript = ObjBuffer:PopObject(ParamHandle);
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local szFun = ObjBuffer:PopObject(ParamHandle);
	local tbParam = {};
	if (OB_IsEmpty(ParamHandle) ~= 1) then
		tbParam = ObjBuffer:PopObject(ParamHandle);
	end
	local dwGSID = nil;
	if (OB_IsEmpty(ParamHandle) ~= 1) then
		dwGSID = ObjBuffer:PopNumber(ParamHandle);
	end
	local tbCallParam = {szScript, szFun}
	if (type(tbParam) == "table") then
		for i=1, getn(tbParam) do
			tinsert(tbCallParam, tbParam[i]);
		end
	end
	tinsert(tbCallParam, dwGSID);
	
	local tbRet = pack(call(DynamicExecute, tbCallParam));
	if getn(tbRet) > 0 then
		ObjBuffer:PushObject(ResultHandle, tbRet);
	end
end