//=============================================================================
// CD_DummyGameConductor
//=============================================================================
// Lobotomized game conductor
//=============================================================================

class DummyGameConductor extends KFGameConductor
	within Nightmare_Survival;

/** Conductor's periodic "think" method **/
/*function TimerUpdate()
{
	CurrentSpawnRateModification = GetSpawnMod();
	CurrentAIMovementSpeedMod = DifficultyInfo.GetAIGroundSpeedMod();
}*/

/**
 * At the time I wrote this file, the only entry point for
 * the Evaluate***() family of methods was TimerUpdate().
 * So, making TimerUpdate() do nothing should turn the
 * Evaluate***() methods into dead code.  However, I'm
 * overriding them anyway in case I missed a call site,
 * or in case a future patch introduces a new call site.
 */

function EvaluateSpawnRateModification()
{
	// do nothing
}

function EvaluateAIMovementSpeedModification()
{
	// do nothing
}

/*function float GetSpawnMod()
{
	return Outer.SpawnModFloat;
} */

defaultproperties
{
    TargetPerkRankRange(`DIFFICULTY_NORMAL)     =(X=0,Y=7)
    TargetPerkRankRange(`DIFFICULTY_HARD)       =(X=0,Y=12)
    TargetPerkRankRange(`DIFFICULTY_SUICIDAL)   =(X=12,Y=25)
    TargetPerkRankRange(`DIFFICULTY_HELLONEARTH)=(X=24.999,Y=25)

    SpawnRateModificationRangeCurve(`DIFFICULTY_NORMAL)     =(Points=((InVal=0.f,OutVal=1.25f),(InVal=0.5f, OutVal=1.0),(InVal=1.f, OutVal=0.75f)))
    SpawnRateModificationRangeCurve(`DIFFICULTY_HARD)       =(Points=((InVal=0.f,OutVal=1.25f),(InVal=0.5f, OutVal=1.0),(InVal=1.f, OutVal=0.75f)))
    SpawnRateModificationRangeCurve(`DIFFICULTY_SUICIDAL)   =(Points=((InVal=0.f,OutVal=1.25f),(InVal=0.5f, OutVal=1.0),(InVal=1.f, OutVal=0.5f)))
    SpawnRateModificationRangeCurve(`DIFFICULTY_HELLONEARTH)=(Points=((InVal=0.f,OutVal=1.0f),(InVal=0.5f, OutVal=1.0),(InVal=1.f, OutVal=0.75f)))

    AIMovementSpeedModificationRange(`DIFFICULTY_NORMAL)        =(X=0.5,Y=0.5)
    AIMovementSpeedModificationRange(`DIFFICULTY_HARD)          =(X=0.5,Y=0.5)
    AIMovementSpeedModificationRange(`DIFFICULTY_SUICIDAL)      =(X=0.5,Y=0.65)
    AIMovementSpeedModificationRange(`DIFFICULTY_HELLONEARTH)   =(X=0.0,Y=0.0)

    AllowLowIntensityZedModeByDifficulty(`DIFFICULTY_NORMAL)        =1
    AllowLowIntensityZedModeByDifficulty(`DIFFICULTY_HARD)          =1
    AllowLowIntensityZedModeByDifficulty(`DIFFICULTY_SUICIDAL)      =1
    AllowLowIntensityZedModeByDifficulty(`DIFFICULTY_HELLONEARTH)   =0

    CurrentSpawnRateModification=0.0
    CurrentAIMovementSpeedMod=1.0
    CurrentVersusZedHealthMod=1.0
    CurrentVersusZedDamageMod=1.0

    ParShotAccuracy=48.0
    ParHeadshotAccuracy=10.0
    ParZedLifeSpan(`DIFFICULTY_NORMAL)      =35.0
    ParZedLifeSpan(`DIFFICULTY_HARD)        =32.0
    ParZedLifeSpan(`DIFFICULTY_SUICIDAL)    =28.0
    ParZedLifeSpan(`DIFFICULTY_HELLONEARTH) =22.0
    ParZedLifeSpanSolo(`DIFFICULTY_NORMAL)      =23.0
    ParZedLifeSpanSolo(`DIFFICULTY_HARD)        =23.0
    ParZedLifeSpanSolo(`DIFFICULTY_SUICIDAL)    =22.0
    ParZedLifeSpanSolo(`DIFFICULTY_HELLONEARTH) =17.0

    HighlySkilledAccuracyMod=1.25
    HighlySkilledAccuracyModMax=1.5
    LessSkilledAccuracyMod=0.75
    LessSkilledAccuracyModMin=0.5
    ZedLifeSpanHighlySkilledThreshold=0.75
    ZedLifeSpanLessSkilledThreshold=1.25
    ZedLifeSpanHighlySkilledThresholdMin=0.5
    ZedLifeSpanLessSkilledThresholdMax=1.5

    ShootingAccuracySkillWeight=0.25
    HeadShootingAccuracySkillWeight=0.75

    PerkRankPercentOfOverallSkill=0.25
    AccuracyPercentOfOverallSkill=0.25
    ZedLifeSpanPercentOfOverallSkill=0.5
    PlayersLowHealthThreshold=0.5

    LullSettings(`DIFFICULTY_NORMAL)        ={(MaxDuration=10.0, Cooldown=12.0)}
    LullSettings(`DIFFICULTY_HARD)          ={(MaxDuration=8.0, Cooldown=14.0)}
    LullSettings(`DIFFICULTY_SUICIDAL)      ={(MaxDuration=6.0, Cooldown=16.0)}
    LullSettings(`DIFFICULTY_HELLONEARTH)   ={(MaxDuration=5.0, Cooldown=18.0)}

    bLogGameConductor=true
    bBypassGameConductor=false
    GameConductorStatus=GCS_Normal
    PlayerDeathForceLullLength=15.0
    SoloPlayerSurroundedForceLullLength=10.0
}