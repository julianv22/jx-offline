Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\awardtype\\simple.lua")
VngEnergyType = SimpleType:new("nVngEnergy")
VngEnergyType.pFun = AddEnergy
VngEnergyType.szMsgFormat = "Nh�n ���c %d �i�m tinh l�c"
VngEnergyType:Reg()