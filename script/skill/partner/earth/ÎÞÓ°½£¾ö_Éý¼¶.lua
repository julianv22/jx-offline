IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 60 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("Hi�n nay <color=yellow>'V� �nh Ki�m Quy�t' c�a <color=blue>��ng h�nh<color> �� luy�n ��n 100%, nh�ng c�n ��ng h�nh<color=blue>"..requirlevel.."<color> m�i c� th� th�ng c�p.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,581,uplevel);
	Msg2Player("Hi�n nay <color=yellow>'V� �nh Ki�m Quy�t' c�a <color=blue>��ng h�nh<color> �� luy�n ��n 100%, �� t�ng c�p <color=blue>"..uplevel.."<color>");
end