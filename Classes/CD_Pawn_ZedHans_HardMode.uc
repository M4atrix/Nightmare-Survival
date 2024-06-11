class CD_Pawn_ZedHans_HardMode extends KFPawn_ZedHans
    config(Game)
    hidecategories(Navigation);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}



static function string GetLocalizedName()
{
    return "Harder Hans";
    //return ReturnValue;    
}

defaultproperties
{   

    
    
    ExplosiveGrenadeClass=class'CD_Proj_HEGrenade_Hans_HardMode'
    NerveGasGrenadeClass=class'CD_Proj_NerveGasGrenade_Hans_HardMode'
    SmokeTossCooldown=4.0
    
    
    
    SprintSpeed=975.0
    
    GroundSpeed=425.0
    Health=12000
    ControllerClass=class'CD_AIController_Hans_HardMode'
  
}