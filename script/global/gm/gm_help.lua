--------------------------------------------------------------
-- FileName		: gmhelp.lua
-- Function		:
-- Author by	: AloneScript @ 15.07.2018
-- Description	: T×m hiÓu vÒ c¸c tİnh n¨ng cña GM
--------------------------------------------------------------

Include("\\script\\lib\\common.lua")

function TakeSpecifiedItem()
	Describe("<color=yellow>H­íng dÉn sö dông tİnh n¨ng “LÊy vËt phÈm chØ ®Şnh”:<color>"
		.."\n\n<*> B­íc ®Çu tiªn, b¹n h·y nhËp <color=red>th«ng sè item cÇn lÊy<color>, mçi th«ng sè ®­îc ng¨n c¸ch bëi dÊu ','\n"
		.."\n<color=green>"..strfill_center(" LÊy trang bŞ hoµng kim ", 50, "-").."<color>"
		.."\n* NOTE: yªu cÇu GM nhËp vµo 1 hoÆc 2 th«ng sè"
		.."\n\t+ Th«ng sè 1: Quality (1: Hoµng Kim, 2: Thiªn Tø)"
		.."\n\t+ Th«ng sè 2: Index"
		.."\n\t<color=red>KQ: (Index) or (Quality, Index)<color>"
		.."\n<color=green>"..strfill_center(" LÊy vËt phÈm, ®¹o cô ", 50, "-").."<color>"
		.."\n* NOTE: yªu cÇu GM nhËp vµo ®óng 6 th«ng sè (1-6)"
		.."\n\t+ Th«ng sè 1: Genre (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 2: DetailType (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 3: Particular (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 4: Level (®¼ng cÊp)"
		.."\n\t+ Th«ng sè 5: Series (ngò hµnh)"
		.."\n\t+ Th«ng sè 6: Magic (chØ sè may m¾n)"
		.."\n\t<color=red>KQ: (Genre, Detail, Particular, Level, Series, Magic)<color>"
		.."\n<color=green>"..strfill_center(" LÊy trang bŞ ®å tİm ", 50, "-").."<color>"
		.."\n* NOTE: yªu cÇu GM nhËp vµo 7 th«ng sè trë lªn (1-12)"
		.."\n\t+ Th«ng sè 1: Genre (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 2: DetailType (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 3: Particular (th«ng sè c¬ b¶n)"
		.."\n\t+ Th«ng sè 4: Level (®¼ng cÊp)"
		.."\n\t+ Th«ng sè 5: Series (ngò hµnh)"
		.."\n\t+ Th«ng sè 6: Magic (chØ sè may m¾n)"
		.."\n\t+ Th«ng sè 7: MagicIndex 1 (ID option hiÖn 1)"
		.."\n\t+ Th«ng sè 8: MagicIndex 2 (ID option Èn 1)"
		.."\n\t+ Th«ng sè 9: MagicIndex 3 (ID option hiÖn 2)"
		.."\n\t+ Th«ng sè 10: MagicIndex 4 (ID option Èn 2)"
		.."\n\t+ Th«ng sè 11: MagicIndex 5 (ID option hiÖn 3)"
		.."\n\t+ Th«ng sè 12: MagicIndex 6 (ID option Èn 3)"
		.."\n\t<color=red>KQ: (Genre, Detail, Particular, Level, Series, Magic, MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6)<color>"
	, 1,
	"B­íc tiÕp theo/TakeSpecifiedItem_Page2")
end

function TakeSpecifiedItem_Page2()
	Describe("<color=yellow>H­íng dÉn sö dông tİnh n¨ng “LÊy vËt phÈm chØ ®Şnh”:<color>"
		.."\n\n<*> B­íc thø hai: nhËp <color=red>sè l­îng<color> cÇn lÊy"
		.."\n\n<*> B­íc thø ba: nÕu muèn <color=red>thªm option<color> vµo mãn ®ã, nh­ “khãa b¶o hiÓm vÜnh viÔn”, “khãa b¶o hiÓm”, “thêi h¹n sö dông”,… th× h·y lùa chän theo ı muèn. Cßn kh«ng muèn lùa chän thªm option th× chän dßng “§­îc råi, kh«ng cÇn thªm option”"
		.."\n* L­u ı: Trong hai option “khãa b¶o hiÓm vÜnh viÔn”, “khãa b¶o hiÓm” nµy chØ ®­îc lùa chän 1 trong 2 option"
		.."\n\n<*> B­íc thø t­: sau khi lùa chän thªm option xong. NÕu thÊy ®­îc råi, chän dßng “§· xong, ta muèn lÊy ngay b©y giê” ®Ó nhËn ®­îc vËt phÈm võa t¹o. Cßn nÕu thÊy cÇn chän option l¹i, th× chän dßng “Chän l¹i option”. Xong, vËy lµ GM cã thÓ cã ®­îc mãn m×nh cÇn."
	, 1,
	"Ta hiÓu råi!/OnCancel")
end

function MoveToPosition()
	Describe("<color=yellow>H­íng dÉn sö dông tİnh n¨ng “DŞch chuyÓn ®Õn vŞ trİ…”:<color>\n\n"
		.."<*> §Çu tiªn, GM nhËp 3 th«ng sè vŞ trİ cÇn ®Õn bao gåm: b¶n ®å, vŞ trİ x, vŞ trİ y"
		.."\n\t<color=red>KQ: (Map, PosX, PosY)<color>"
		.."\n* L­u ı: khi xuÊt hiÖn lçi “ThÊt b¹i! VŞ trİ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.” th× cã nghÜa lµ vŞ trİ täa ®é x, y cña b¶n ®å ®ã kh«ng ®óng hoÆc kh«ng tån t¹i."
	,1,
	"Ta hiÓu råi!/OnCancel")
end

function OnCancel()
	return
end