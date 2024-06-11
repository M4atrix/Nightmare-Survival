class CD_Pawn_ZedPatriarch_HardMode extends KFPawn_ZedPatriarch
    config(Game)
    hidecategories(Navigation);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}


static function string GetLocalizedName()
{
    return "Harder Patriarch";
    //return ReturnValue;    
}
simulated function SetFleeAndHealMode(bool bNewFleeAndHealStatus)
{
    SetCollision(!bNewFleeAndHealStatus);
    super.SetFleeAndHealMode(bNewFleeAndHealStatus);
    //return;    
}

static simulated function SetupHealthBar(KFInterface_MonsterBoss BossRef)
{
    local KFPawn_Monster BossMonster;
    local KFPlayerController LocalKFPC;

    BossMonster = KFPawn_Monster(BossRef);
    // End:0x1F0
    if((BossMonster != none) && BossMonster.WorldInfo.NetMode != NM_DedicatedServer)
    {
        LocalKFPC = KFPlayerController(BossMonster.GetALocalPlayerController());
        // End:0x1F0
        if((LocalKFPC.myGfxHUD != none) && LocalKFPC.myGfxHUD.bossHealthBar != none)
        {
            LocalKFPC.myGfxHUD.bossHealthBar.SetBossPawn(BossRef);
            // End:0x1F0
            if(!KFGameReplicationInfo(BossMonster.WorldInfo.GRI).ShouldSetBossCamOnBossSpawn())
            {
                LocalKFPC.myGfxHUD.bossHealthBar.OnNamePlateHidden();
            }
        }
    }
    //return;    
}

defaultproperties
{
    
    SyringeInjectTimeDuration=0.10
   
    MissileProjectileClass=class'CD_Proj_Missile_HardModePatriarch'
    FleeSprintSpeedModifier=1.90
    ParryResistance=6
   
    DoshValue=1337
    
    SprintSpeed=950.0
    
    GroundSpeed=450.0
    Health=7750
    
    RotationRate=(Pitch=100000,Yaw=100000,Roll=100000)
    Begin Object Name=SpecialMoveHandler_0
        
        SpecialMoveClasses(SM_HoseWeaponAttack)=class'CD_Patriarch_MinigunBarrage'
        
    End Object
}