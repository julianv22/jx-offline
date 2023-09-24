--------------------------------------------------------------
-- FileName		: gmhelp.lua
-- Function		:
-- Author by	: AloneScript @ 15.07.2018
-- Description	: T�m hi�u v� c�c t�nh n�ng c�a GM
--------------------------------------------------------------

Include("\\script\\lib\\common.lua")

function TakeSpecifiedItem()
	Describe("<color=yellow>H��ng d�n s� d�ng t�nh n�ng �L�y v�t ph�m ch� ��nh�:<color>"
		.."\n\n<*> B��c ��u ti�n, b�n h�y nh�p <color=red>th�ng s� item c�n l�y<color>, m�i th�ng s� ���c ng�n c�ch b�i d�u ','\n"
		.."\n<color=green>"..strfill_center(" L�y trang b� ho�ng kim ", 50, "-").."<color>"
		.."\n* NOTE: y�u c�u GM nh�p v�o 1 ho�c 2 th�ng s�"
		.."\n\t+ Th�ng s� 1: Quality (1: Ho�ng Kim, 2: Thi�n T�)"
		.."\n\t+ Th�ng s� 2: Index"
		.."\n\t<color=red>KQ: (Index) or (Quality, Index)<color>"
		.."\n<color=green>"..strfill_center(" L�y v�t ph�m, ��o c� ", 50, "-").."<color>"
		.."\n* NOTE: y�u c�u GM nh�p v�o ��ng 6 th�ng s� (1-6)"
		.."\n\t+ Th�ng s� 1: Genre (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 2: DetailType (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 3: Particular (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 4: Level (��ng c�p)"
		.."\n\t+ Th�ng s� 5: Series (ng� h�nh)"
		.."\n\t+ Th�ng s� 6: Magic (ch� s� may m�n)"
		.."\n\t<color=red>KQ: (Genre, Detail, Particular, Level, Series, Magic)<color>"
		.."\n<color=green>"..strfill_center(" L�y trang b� �� t�m ", 50, "-").."<color>"
		.."\n* NOTE: y�u c�u GM nh�p v�o 7 th�ng s� tr� l�n (1-12)"
		.."\n\t+ Th�ng s� 1: Genre (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 2: DetailType (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 3: Particular (th�ng s� c� b�n)"
		.."\n\t+ Th�ng s� 4: Level (��ng c�p)"
		.."\n\t+ Th�ng s� 5: Series (ng� h�nh)"
		.."\n\t+ Th�ng s� 6: Magic (ch� s� may m�n)"
		.."\n\t+ Th�ng s� 7: MagicIndex 1 (ID option hi�n 1)"
		.."\n\t+ Th�ng s� 8: MagicIndex 2 (ID option �n 1)"
		.."\n\t+ Th�ng s� 9: MagicIndex 3 (ID option hi�n 2)"
		.."\n\t+ Th�ng s� 10: MagicIndex 4 (ID option �n 2)"
		.."\n\t+ Th�ng s� 11: MagicIndex 5 (ID option hi�n 3)"
		.."\n\t+ Th�ng s� 12: MagicIndex 6 (ID option �n 3)"
		.."\n\t<color=red>KQ: (Genre, Detail, Particular, Level, Series, Magic, MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6)<color>"
	, 1,
	"B��c ti�p theo/TakeSpecifiedItem_Page2")
end

function TakeSpecifiedItem_Page2()
	Describe("<color=yellow>H��ng d�n s� d�ng t�nh n�ng �L�y v�t ph�m ch� ��nh�:<color>"
		.."\n\n<*> B��c th� hai: nh�p <color=red>s� l��ng<color> c�n l�y"
		.."\n\n<*> B��c th� ba: n�u mu�n <color=red>th�m option<color> v�o m�n ��, nh� �kh�a b�o hi�m v�nh vi�n�, �kh�a b�o hi�m�, �th�i h�n s� d�ng�,� th� h�y l�a ch�n theo � mu�n. C�n kh�ng mu�n l�a ch�n th�m option th� ch�n d�ng ����c r�i, kh�ng c�n th�m option�"
		.."\n* L�u �: Trong hai option �kh�a b�o hi�m v�nh vi�n�, �kh�a b�o hi�m� n�y ch� ���c l�a ch�n 1 trong 2 option"
		.."\n\n<*> B��c th� t�: sau khi l�a ch�n th�m option xong. N�u th�y ���c r�i, ch�n d�ng ��� xong, ta mu�n l�y ngay b�y gi� �� nh�n ���c v�t ph�m v�a t�o. C�n n�u th�y c�n ch�n option l�i, th� ch�n d�ng �Ch�n l�i option�. Xong, v�y l� GM c� th� c� ���c m�n m�nh c�n."
	, 1,
	"Ta hi�u r�i!/OnCancel")
end

function MoveToPosition()
	Describe("<color=yellow>H��ng d�n s� d�ng t�nh n�ng �D�ch chuy�n ��n v� tr݅�:<color>\n\n"
		.."<*> ��u ti�n, GM nh�p 3 th�ng s� v� tr� c�n ��n bao g�m: b�n ��, v� tr� x, v� tr� y"
		.."\n\t<color=red>KQ: (Map, PosX, PosY)<color>"
		.."\n* L�u �: khi xu�t hi�n l�i �Th�t b�i! V� tr� kh�ng h�p l�, vui l�ng ki�m tra l�i.� th� c� ngh�a l� v� tr� t�a �� x, y c�a b�n �� �� kh�ng ��ng ho�c kh�ng t�n t�i."
	,1,
	"Ta hi�u r�i!/OnCancel")
end

function OnCancel()
	return
end