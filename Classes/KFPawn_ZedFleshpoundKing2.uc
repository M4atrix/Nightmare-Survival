class KFPawn_ZedFleshpoundKing2 extends KFPawn_ZedFleshpoundKing;

static function string GetLocalizedName()
{
    return "KitanoV PrO";
    //return ReturnValue;    
}

static function string GetLocalizedDescription()
{
    return "Gu moho la na";
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


	Begin Object Name=MeleeHelper_0
		BaseDamage=85.f //55 //75
		MaxHitRange=350.f //250
	    MomentumTransfer=75000.f
		MyDamageType=class'KFDT_Bludgeon_Fleshpound'
	End Object

	Health=16000 //1500 //13000
	Mass=2000.f
    ShieldHealthMaxDefaults[0]=1800 //2000
    ShieldHealthMaxDefaults[1]=2700 //3000
    ShieldHealthMaxDefaults[2]=4000//2000 //3000
    ShieldHealthMaxDefaults[3]=5000
	ShieldHealthScale=1.1f //1.f

	// Penetration
    PenetrationResistance=5.0

    CamShakeInnerRadius=500 //200 //300
		CamShakeOuterRadius=1700 //900 //1200
		CamShakeFalloff=3.5f //1.5 //2.5

        GroundSpeed=500.f //300.f //260 //345
	SprintSpeed=1090.f //700.f     //600 //805
	ReachedEnemyThresholdScale=1.f
    
	DifficultySettings=class'CD_DS_FleshpoundKing_HardMode'
	ControllerClass=class'CD_AIController_FleshpoundKing_HardMode'
}
    