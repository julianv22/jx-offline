-- Battle process header file
-- Fanghao Wu
-- 2004.12.15
DBKEY_BATTLE = "BATTLE_%d_%d"; -- Database KEY of battle information
DBKEY_BATTLE_LATEST_INFO = "BATTLE_LATEST_INFO"; -- database KEY for the information of the last game of the battle

-- Generate database KEY for specified campaign information
function makeBattleDBKey( nBattleID, nBattleLevel )
    return format(DBKEY_BATTLE, nBattleID, nBattleLevel);
end

-- Start a new round of battle
function battle_StartNewIssue( nBattleID, nBattleLevel )
    local bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, nBattleMapID,
          nWorldMapID, strMapName, nRuleID;
    local arynMapPatternID, arynFollowingRoundID, arynRuleID;

    bDBSuccess, nLatestIssueID, nRoundCount, nRoundID =
        battle_GetLatestIssueInfo(nBattleID, nBattleLevel);
    if (bDBSuccess ~= 1) then -- 第一期战役
        nLatestIssueID = 1;
    else
        nLatestIssueID = nLatestIssueID + 1;
    end
    nRoundCount = 1;
    nRoundID = 1;

    arynMapPatternID, arynFollowingRoundID = Battle_GetRoundInfo(nBattleID, nRoundID);
    nMapPatternID = arynMapPatternID[Random(getn(arynMapPatternID)) + 1];
    nBattleMapID, arynRuleID = Battle_GetMapPatternInfo(nBattleID, nMapPatternID);
    nWorldMapID, arystrMapName = Battle_GetBattleMapInfo(nBattleID, nBattleMapID, nBattleLevel);
    strMapName = arystrMapName[Random(getn(arystrMapName)) + 1];
    nRuleID = arynRuleID[Random(getn(arynRuleID)) + 1];

    battle_SaveRoundInfo(nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID,
        nMapPatternID, strMapName, nRuleID, 0);
    battle_Msg_NewRound(nBattleID, nBattleLevel, nLatestIssueID, nRoundCount, nRoundID,
        nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID);

    return nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID;
end

-- Obtain the period and game information of the last game of the specified campaign
function battle_GetLatestIssueInfo( nBattleID, nBattleLevel )
    local bDBSuccess;
    local nLatestIssueID, nRoundCount;
    bDBSuccess, nLatestIssueID, nRoundCount = GetCustomDataFromSDB(DBKEY_BATTLE_LATEST_INFO,
                                                  nBattleID, nBattleLevel, "ii");
    return bDBSuccess, nLatestIssueID, nRoundCount;
end

-- Obtain the detailed information of the specified battle situation
function battle_GetSpecRoundInfo( nBattleID, nBattleLevel, nIssueID, nRoundCount )
    local strBattleDBKey;
    local bDBSuccess;
    local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;

    strBattleDBKey = makeBattleDBKey(nBattleID, nBattleLevel);
    bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult = GetCustomDataFromSDB(
                                                                                  strBattleDBKey,
                                                                                  nIssueID,
                                                                                  nRoundCount,
                                                                                  "iisii");

    return bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;
end

-- Obtain the detailed information of the last game of the specified campaign
function battle_GetLatestRoundInfo( nBattleID, nBattleLevel )
    local bDBSuccess;
    local nLatestIssueID, nRoundCount;
    local nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult;

    bDBSuccess, nLatestIssueID, nRoundCount = battle_GetLatestIssueInfo(nBattleID, nBattleLevel);

    if (bDBSuccess == 1) then
        bDBSuccess, nRoundID, nMapPatternID, strMapName, nRuleID, nBattleResult =
            battle_GetSpecRoundInfo(nBattleID, nBattleLevel, nLatestIssueID, nRoundCount);
    end

    return bDBSuccess, nLatestIssueID, nRoundCount, nRoundID, nMapPatternID, strMapName, nRuleID,
        nBattleResult;
end

-- Save battle details
function battle_SaveRoundInfo(nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID,
                              nMapPatternID, strMapName, nRuleID, nBattleResult )
    SaveCustomDataToSDBOw(DBKEY_BATTLE_LATEST_INFO, nBattleID, nBattleLevel, "ii", nIssueID,
        nRoundCount);
    local strBattleDBKey = makeBattleDBKey(nBattleID, nBattleLevel);
    SaveCustomDataToSDBOw(strBattleDBKey, nIssueID, nRoundCount, "iisii", nRoundID, nMapPatternID,
        strMapName, nRuleID, nBattleResult);
end

-- Output log separator
function battle_Msg_Separator()
    OutputMsg(
        "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
end

-- Output new battle log
function battle_Msg_NewRound(nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID,
                             nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID,
                             strExtraMsg )
    battle_Msg_Separator();
    OutputMsg(format("[%s]  NEW BATTLE START", date("%Y-%m-%d %H:%M:%S")));
    OutputMsg(format("BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round", nBattleID,
                  nBattleLevel, nIssueID, nRoundCount));
    OutputMsg(format(
                  "RoundID: %d   MapPattern: %d   BattleMapID:  %d   WorldMapID: %d   MapName: %s   RuleID: %d",
                  nRoundID, nMapPatternID, nBattleMapID, nWorldMapID, strMapName, nRuleID));
    if (strExtraMsg ~= nil) then OutputMsg(strExtraMsg); end
    battle_Msg_Separator();
end

-- Output the log of the end of the battle
function battle_Msg_RoundResult(nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID,
                                nBattleResult, strExtraMsg )
    battle_Msg_Separator();
    OutputMsg(format("[%s]  BATTLE END", date("%Y-%m-%d %H:%M:%S")));
    OutputMsg(format(
                  "BattleID: %d   BattleLevel: %d   Issue: %d   %dth.Round RoundId: %d   Result: %d",
                  nBattleID, nBattleLevel, nIssueID, nRoundCount, nRoundID, nBattleResult));
    if (strExtraMsg ~= nil) then OutputMsg(strExtraMsg); end
    battle_Msg_Separator();
end
