IncludeLib("TASKSYS");
Include("\\script\\task\\random\\task_head.lua")
Include("\\script\\task\\system\\task_main.lua");

function main()
    local szTitle = "B�n mu�n th� nhi�m v� b�n ��ng h�nh kh�ng?"
    local tbOpt = {"Nh�n 1 nhi�m v� ng�u nhi�n/initRandomTask",
                   "Tr� nhi�m v� ��ng h�nh ng�u nhi�n/#diaglog_ongoingtask(1301)",
                   "Tr� nhi�m v� ��ng h�nh theo l�nh b�i/#diaglog_ongoingtask(1304)", "Tho�t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

---------------------------Nhi�m v� Partner ---------------------------------

function diaglog_ongoingtask(task_id)
    local taskID = GetTask(task_id)
    if taskID == 0 then
        Talk(1, "", "<color=yellow>Hi�n t�i kh�ng nh�n nhi�m v� n�o.<color>")
        return
    else
        local task_name = TaskName(taskID)
        local task_state = GetTaskStatus(task_name)
        if task_state < 3 then
            OnTaskSay_Call(task_name, task_state)
        else
            Talk(1, "", "<color=yellow>�� ho�n th�nh nhi�m v�.<color>")
            return
        end
    end
end
