class CD_AIController_Hans_HardMode extends KFAIController_Hans
    config(AI)
    hidecategories(Navigation);

defaultproperties
{
    RetargetWaitTimeRange=(X=5.0,Y=8.0)
    MaxBurstAmount=15
    BarrageWaitTime=0.8
    BarrageLength=7.0
    GrenadeGunInterruptDelay=2.0
    MinDistanceToPerformGrabAttack=400.0
    MinTimeBetweenGrabAttacks=1.50
    AggroEnemySwitchWaitTime=3.0
}