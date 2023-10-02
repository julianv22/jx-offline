-- Battle system
-- Fanghao_Wu 2004-12-6
function TaskShedule()
    -- Set the scheme name
    TaskName("Tin tøc tù ®éng - th«ng b¸o");
    -- once every 10 minutes
    TaskInterval(1);
    -- Start at 0:00 (if TaskTme is not set, it will start when Relay starts)
    --	TaskTime( 18, 32 );
    -- Set the number of triggers, 0 means unlimited times
    TaskCountLimit(0);
    -- Output startup message
    OutputMsg("BATTLE 1 startup...");
end

function TaskContent()
    Battle_StartNewRound(1, 1); -- GM instructions to start a new battle situation
end
