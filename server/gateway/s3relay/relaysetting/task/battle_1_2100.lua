-- 战役系统
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    TaskName("Chi課 d辌h Tng Dng (T鑞g Kim) 21:00");
    TaskInterval(1440);
    TaskTime(20, 50);
    TaskCountLimit(0);
    -- 输出启动消息
    OutputMsg("[Chien truong Tong-Kim] 21:00 startup...");
end

function TaskContent()

    local nWeekday = tonumber(date("%w"));

    if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and
        (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
        return -- 星期一 关闭一场高级宋金，用国战宋金替代
    else
        Battle_StartNewRound(1, 1); -- GM指令，启动低级新战局
        Battle_StartNewRound(1, 2); -- GM指令，启动中级新战局
        Battle_StartNewRound(1, 3); -- GM指令，启动高级新战局	
    end

end

function GameSvrConnected( dwGameSvrIP ) end
function GameSvrReady( dwGameSvrIP ) end
