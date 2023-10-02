if (not _H_FESTIVAL_) then
    _H_FESTIVAL_ = 1;

    function TaskShedule()
        TaskName(SPRINGFESTIVAL);

        local nNowTimeHour = tonumber(date("%H"));
        local nNowTimeMin = tonumber(date("%M"));

        local nRemain = floor(nNowTimeMin / INTERVAL) + 1;
        if (nRemain >= 4) then
            nRemain = 0;
            nNowTimeHour = nNowTimeHour + 1
        end
        nNowTimeMin = nRemain * INTERVAL;

        if (nNowTimeHour >= 24) then nNowTimeHour = 0 end
        -- �����������0
        for i = 1, 5 do gb_SetTask(SPRINGFESTIVAL, i, 0) end

        TaskTime(nNowTimeHour, nNowTimeMin);
        TaskInterval(INTERVAL); -- 15���Ӵ���һ�Σ�
        TaskCountLimit(0);
        OutputMsg("the " .. SPRINGFESTIVAL .. " will start up at " .. nNowTimeHour .. ":" ..
                      nNowTimeMin .. ".");
    end

    function TaskContent()
        local nDay = tonumber(date("%Y%m%d"));
        if (nDay > DATEEND or nDay < DATEBEGIN) then -- 2006��2��3��
            return
        end

        if (righttime_add() == 0) then --	ÿһ������������һ��add_righttime�ĺ���
            return
        end
        gb_SetTask(SPRINGFESTIVAL, 1, 1);
        OutputMsg(NEWS);

        GlobalExecute(STREXECUTE);
    end

end --	end of _H_FESTIVAL_
