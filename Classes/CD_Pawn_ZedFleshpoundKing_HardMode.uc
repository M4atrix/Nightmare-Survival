class CD_Pawn_ZedFleshpoundKing_HardMode extends KFPawn_ZedFleshpoundKing
    config(Game)
    hidecategories(Navigation);

simulated event PostBeginPlay()
{
    super(KFPawn_Monster).PostBeginPlay();
    //return;    
}



static function string GetLocalizedName()
{
    return "Harder KingFleshpound";
    //return ReturnValue;    
}

function SpawnSubWave()
{
    local KFGameInfo KFGI;
    local int Num;

    KFGI = KFGameInfo(WorldInfo.Game);
    // End:0x118
    if(CurrentPhase >= 3)
    {
        Num = KFGI.GetLivingPlayerCount() * 4;
        // End:0x115
        if(IsAliveAndWell())
        {
            KFGI.SpawnManager.SummonBossMinions(GetWaveInfo(CurrentPhase, KFGI.GetModifiedGameDifficulty()).Squads, Num, false);
            SetTimer(60.0, false, 'SpawnSubWave');
        }
    }
    // End:0x1A2
    else
    {
        KFGI.SpawnManager.SummonBossMinions(GetWaveInfo(CurrentPhase, KFGI.GetModifiedGameDifficulty()).Squads, GetNumMinionsToSpawn(), false);
    }
    SetTimer(2.0, true, 'PauseBossWave');
    //return;    
}

function ActivateShield()
{
    super.ActivateShield();
    //return;    
}

function KFAIWaveInfo GetWaveInfo(int BattlePhase, int Difficulty)
{
    switch(BattlePhase)
    {
        // End:0x3E
        case 0:
            return SummonWaves[Difficulty].PhaseTwoWave;
        // End:0x69
        case 1:
            return SummonWaves[Difficulty].PhaseThreeWave;
        // End:0x95
        case 2:
            return SummonWaves[Difficulty].PhaseFourWave;
        // End:0xFFFF
        default:
            return SummonWaves[Difficulty].PhaseThreeWave;
    }
    return none;
    //return ReturnValue;    
}

defaultproperties
{   
   
    RageExplosionMinPhase=0
    NumMinionsToSpawn=(X=8.0,Y=40.0)
    
    ParryResistance=6
    
    DifficultySettings=class'CD_DS_FleshpoundKing_HardMode'
    
    
    
    SprintSpeed=1090.0
   
    GroundSpeed=500.0
    Health=8500
    ControllerClass=class'CD_AIController_FleshpoundKing_HardMode'
   
}