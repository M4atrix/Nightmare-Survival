class KFPawn_ZedStalker2 extends KFPawn_ZedStalker;

defaultproperties
{
	ControllerClass=class'KFAIController_ZedStalker2'
	DifficultySettings=class'DS_Stalker_Regular'
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedFleshpound2')
	ElitePawnClass.Add(class'KFPawn_ZedHusk2')
	ElitePawnClass.Add(class'KFPawn_ZedSiren2')
	//ElitePawnClass.Add(class'KFPawn_ZedScrake2')

	Begin Object Name=MeleeHelper_0
		BaseDamage=9.f
		MaxHitRange=180.f
		MomentumTransfer=5000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object
}
