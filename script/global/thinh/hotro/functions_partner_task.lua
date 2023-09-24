IncludeLib("TASKSYS");
Include("\\script\\task\\random\\task_head.lua")
Include("\\script\\task\\system\\task_main.lua");

function main()
    local szTitle = "B¹n muèn thö nhiÖm vô b¹n ®ång hµnh kh«ng?"
    local tbOpt = {"NhËn 1 nhiÖm vô ngÉu nhiªn/initRandomTask",
                   "Tr¶ nhiÖm vô ®ång hµnh ngÉu nhiªn/#diaglog_ongoingtask(1301)",
                   "Tr¶ nhiÖm vô ®ång hµnh theo lÖnh bµi/#diaglog_ongoingtask(1304)", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

---------------------------NhiÖm vô Partner ---------------------------------

function diaglog_ongoingtask(task_id)
    local taskID = GetTask(task_id)
    if taskID == 0 then
        Talk(1, "", "<color=yellow>HiÖn t¹i kh«ng nhËn nhiÖm vô nµo.<color>")
        return
    else
        local task_name = TaskName(taskID)
        local task_state = GetTaskStatus(task_name)
        if task_state < 3 then
            OnTaskSay_Call(task_name, task_state)
        else
            Talk(1, "", "<color=yellow>§· hoµn thµnh nhiÖm vô.<color>")
            return
        end
    end
end
