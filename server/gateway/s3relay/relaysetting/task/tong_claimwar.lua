--�����ս��������
function ClaimWar(nClaimWarSrcTongID, nClaimWarDestTongID, nLeftMinutes)
	local strSrcTongName  = GetTongNameByID(nClaimWarSrcTongID);
	local strDestTongName = GetTongNameByID(nClaimWarDestTongID);
	
	local szMsg = format("Bang h�i %s  �� tuy�n chi�n v�i bang h�i %s, th�i gian chi�n ��u c�n %d ph�t.", strSrcTongName, strDestTongName, nLeftMinutes);
	local szEndMsg = format("Bang h�i %s k�t th�c tuy�n chi�n v�i bang h�i %s.", strSrcTongName, strDestTongName);
	if (nLeftMinutes == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szEndMsg));
	else
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
	end;
end