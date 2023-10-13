function main(nItemIdx) 
if (GetPK() == 0) then 
Say("Ng­¬i kh«ng cã téi tr¹ng g× sao cÇn ph¶i Th­ §Æc X¸.", 0); 
Msg2Player("HiÖn thêi PK b¹n lµ 0 nªn kh«ng thÓ sö dông Th­ §Æc X¸."); 
return 1; 
end; 
SetPK(0); 
Say("Ng­¬i ®· sö dông<color=yellow> Th­ §Æc X¸ TriÒu §×nh<color>, Gi¸ trÞ pk ®· trë vÒ 0.", 0); 
Msg2Player("Ng­¬i ®· sö dông<color=yellow> Th­ §Æc X¸ TriÒu §×nh<color>, Gi¸ trÞ pk ®· trë vÒ 0. "); 
if (GetWorldPos() == 208) then 
SetTask(96,100) 
end; 
end; 