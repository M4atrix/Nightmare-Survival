class KFPawn_ZedCrawler2 extends KFPawn_ZedCrawler;

defaultproperties
{
	//ElitePawnClass.Add(class'Rebalance.KFPawn_ZedFleshpound2')
	ElitePawnClass.Add(class'KFPawn_ZedScrake2')
	ElitePawnClass.Add(class'KFPawn_ZedHusk2')
	ElitePawnClass.Add(class'KFPawn_ZedSiren2')
	DifficultySettings=class'DS_Crawler_Regular'
	ControllerClass=class'KFAIController_ZedCrawler2'
	ResistantDamageTypes.Add((DamageType=class'KFDT_Slashing', DamageScale=1.0f))
	
	Begin Object Name=MeleeHelper_0
		BaseDamage=7.f
		MaxHitRange=180.f
		MomentumTransfer=5000.f
		MyDamageType=class'KFDT_Slashing_ZedWeak'
	End Object
}
