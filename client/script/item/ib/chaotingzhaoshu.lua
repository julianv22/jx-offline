function main(nItemIdx) 
if (GetPK() == 0) then 
Say("Ng��i kh�ng c� t�i tr�ng g� sao c�n ph�i Th� ��c X�.", 0); 
Msg2Player("Hi�n th�i PK b�n l� 0 n�n kh�ng th� s� d�ng Th� ��c X�."); 
return 1; 
end; 
SetPK(0); 
Say("Ng��i �� s� d�ng<color=yellow> Th� ��c X� Tri�u ��nh<color>, Gi� tr� pk �� tr� v� 0.", 0); 
Msg2Player("Ng��i �� s� d�ng<color=yellow> Th� ��c X� Tri�u ��nh<color>, Gi� tr� pk �� tr� v� 0. "); 
if (GetWorldPos() == 208) then 
SetTask(96,100) 
end; 
end; 