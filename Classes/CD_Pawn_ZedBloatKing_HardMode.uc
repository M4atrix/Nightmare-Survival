class CD_Pawn_ZedBloatKing_HardMode extends KFPawn_ZedBloatKing
    config(Game)
    hidecategories(Navigation);

var int PoopCount;

simulated function PostBeginPlay()
{
    super(KFPawn_ZedBloat).PostBeginPlay();
    PoopCount = 0;
    //return;    
}

static function string GetLocalizedName()
{
    return "Nightmare Abomination";
    //return ReturnValue;    
}



simulated function SpawnPoopMonster()
{
    local CD_Pawn_ZedBloatKingSubspawn_HardMode NewZed;
    local Vector X, Y, Z;

    // End:0x12
    if(PoopCount >= 40)
    {
        return;
    }
    // End:0x23
    if(IsDoingSpecialMove(38))
    {
        return;
    }
    // End:0x47
    if(IsTimerActive('AllowNextPoopMonster'))
    {
        ++ CurrentDelayedSpawns;
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    NewZed = Spawn(class'CD_Pawn_ZedBloatKingSubspawn_HardMode',,, Location + (X * PoopMonsterOffset), Rotation,, true);
    // End:0x2B9
    if(NewZed != none)
    {
        NewZed.SetPhysics(2);
        KFGameInfo(WorldInfo.Game).SetMonsterDefaults(NewZed);
        NewZed.SpawnDefaultController();
      
        // End:0x284
        if(KFAIController(NewZed.Controller) != none)
        {
            KFGameInfo(WorldInfo.Game).GetAIDirector().AIList.AddItem(KFAIController(NewZed.Controller));
            KFAIController(NewZed.Controller).SetTeam(1);
        }
        ++ PoopMonsterFXNotify;
        PlayPoopSpawnFX();
        NewZed.GetDaddy(self);
    }
    SetTimer(PoopMonsterSpawnDelay, false, 'AllowNextPoopMonster');
    //return;    
}

simulated function NewPoop(CD_Pawn_ZedBloatKingSubspawn_HardMode poop)
{
    // End:0x1A
    if(poop != none)
    {
        ++ PoopCount;
    }
    //return;    
}

simulated function PoopDied(CD_Pawn_ZedBloatKingSubspawn_HardMode poop)
{
    // End:0x1A
    if(poop != none)
    {
        -- PoopCount;
    }
    //return;    
}

defaultproperties
{
    Begin Object Class=KFGameExplosion Name=ExploTemplate0
        Damage=20.0
        DamageRadius=700.0
        DamageFalloffExponent=0.0 
        KnockDownStrength=0.0
        MomentumTransferScale=100.0
        FractureMeshRadius=0.0
        FracturePartVel=0.0
        CamShakeInnerRadius=700.0
        CamShakeOuterRadius=1200.0
    End Object
    FartExplosionTemplate =ExploTemplate0
    PoopMonsterSpawnDelay=0.50
    RageSprintSpeedMultiplier=1.350
    
   
    // Reference: KFMeleeHelperAI'Default__CD_Pawn_ZedBloatKing_HardMode.MeleeHelper'
    
    DifficultySettings=class'CD_DS_BloatKing_HardMode'
    
   
    SprintSpeed=750.0
    
    GroundSpeed=600.0
    Health=14000
    ControllerClass=class'CD_AIController_ZedBloatKingHardMode'
    
}