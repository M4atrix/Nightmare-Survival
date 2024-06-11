class KFPawn_ZedSiren2 extends KFPawn_ZedSiren;

defaultproperties
{
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedFleshpound2')
	ElitePawnClass.Add(class'KFPawn_ZedScrake2')
	ControllerClass=class'KFAIController_ZedSiren2'
	DifficultySettings=class'DS_Siren_Regular'
	HitZones[2]=(ZoneName=chest, BoneName=Spine2, Limb=BP_Torso, GoreHealth=200, DmgScale=1.0, SkinID=3)
}
