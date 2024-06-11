
class KFGameReplicationInfo2 extends KFGameReplicationInfo;

event Tick(float DeltaTime)
{
    local name SessionName;
    local bool bUpdateGameSettings;
    local KFGameInfo_Survival KFGI;
    local KFOnlineGameSettings GameSettings;

    KFGI = KFGameInfo_Survival(WorldInfo.Game);
    // End:0x471
    if((WorldInfo.NetMode == NM_DedicatedServer) || WorldInfo.NetMode == NM_ListenServer)
    {
        // End:0x471
        if((KFGI != none) && NotEqual_InterfaceInterface(KFGI.GameInterface, (none)))
        {
            SessionName = KFGI.PlayerReplicationInfoClass.default.SessionName;
            // End:0x1B2
            if((KFGI.PlayfabInter != none) && KFGI.PlayfabInter.GetGameSettings() != none)
            {
                GameSettings = KFOnlineGameSettings(KFGI.PlayfabInter.GetGameSettings());
            }
            // End:0x203
            else
            {
                GameSettings = KFOnlineGameSettings(KFGI.GameInterface.GetGameSettings(SessionName));
            }
            // End:0x471
            if(GameSettings != none)
            {
                bUpdateGameSettings = false;
                // End:0x2CF
                if((GameSettings.bCustom || !GameSettings.bUsesStats) || bCustom)
                {
                    GameSettings.bCustom = false;
                    GameSettings.bUsesStats = true;
                    bCustom = false;
                    bUpdateGameSettings = true;
                }
                // End:0x31E
                if(GameSettings.bServerExiled)
                {
                    GameSettings.bServerExiled = false;
                    bUpdateGameSettings = true;
                }
                // End:0x471
                if(bUpdateGameSettings)
                {
                    // End:0x429
                    if((KFGI.PlayfabInter != none) && KFGI.PlayfabInter.IsRegisteredWithPlayfab())
                    {
                        KFGI.PlayfabInter.ServerUpdateOnlineGame();
                        // End:0x426
                        if(WorldInfo.IsEOSDedicatedServer())
                        {
                            KFGI.GameInterface.UpdateOnlineGame(SessionName, GameSettings, true);
                        }
                    }
                    // End:0x471
                    else
                    {
                        KFGI.GameInterface.UpdateOnlineGame(SessionName, GameSettings, true);
                    }
                }
            }
        }
    }
      
}

defaultproperties
{
	//TraderItems=KFGFxObject_TraderItems'Rebalance_Trader_ARCH.DefaultTraderItems'
}
