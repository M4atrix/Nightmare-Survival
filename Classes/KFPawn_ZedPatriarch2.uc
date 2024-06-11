
class KFPawn_ZedPatriarch2 extends KFPawn_ZedPatriarch;

static function string GetLocalizedName()
{
    return "TunSeekerSama";
    //return ReturnValue;    
}

defaultproperties
{
	Health=12000 //3500 //8000
	ResistantDamageTypes.Add((DamageType=class'KFDT_Explosive', DamageScale=0.5f))
	SyringeInjectTimeDuration=0.05 //0.10
	FleeSprintSpeedModifier=2 //1.90
    ParryResistance=6
    SprintSpeed=950.0
    GroundSpeed=450.0
    
}