Include("\\script\\global\\login_head.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");

function LoginMessage()
    local nLevel = GetLevel();
    if (nLevel >= 1) then
        Msg2Player("Ch�o m�ng b�n ��n v�i <color=yellow>V� L�m Truy�n K�<color>")
    end
end

if login_add then login_add(LoginMessage, 1) end
