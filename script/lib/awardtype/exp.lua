Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
ExpType = SimpleType:new("nExp")
ExpType.pFun = AddOwnExp
--Fix l�i hi�n th� sai n�u s� qu� l�n - Modified By DinhHQ - 20110926
ExpType.szMsgFormat = "��t ���c kinh nghi�m kh�ng th� c�ng d�n %s"
ExpType:Reg()

Exp_tlType = SimpleType:new("nExp_tl")
Exp_tlType.pFun = tl_addPlayerExp
--Fix l�i hi�n th� sai n�u s� qu� l�n - Modified By DinhHQ - 20110926
Exp_tlType.szMsgFormat = "Nh�n ���c �i�m kinh nghi�m c�ng d�n %s."
Exp_tlType:Reg()