IncludeLib("PARTNER");
function OnLevelUp(uplevel,nPartnerIdx)
	local partnerlevel = PARTNER_GetLevel(nPartnerIdx);
	local requirlevel = 30 + (uplevel - 1) * 1;
	if(partnerlevel < requirlevel) then
		Msg2Player("Hi�n nay <color=yellow>'Tr��ng H� L�c Nh�t' c�a <color=blue>��ng h�nh<color> �� luy�n ��n 100%, nh�ng c�n ��ng h�nh<color=blue>"..requirlevel.."<color> m�i c� th� th�ng c�p.");
		return	
	end
	PARTNER_AddSkill(nPartnerIdx,1,579,uplevel);
	Msg2Player("Hi�n nay <color=yellow>'Tr��ng H� L�c Nh�t' c�a <color=blue>��ng h�nh<color> �� luy�n ��n 100%, �� t�ng c�p <color=blue>"..uplevel.."<color>");
end