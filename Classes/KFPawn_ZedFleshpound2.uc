class KFPawn_ZedFleshpound2 extends KFPawn_ZedFleshpound;

defaultproperties
{
	ControllerClass=class'KFAIController_ZedFleshpound2'
	DifficultySettings=class'DS_Fleshpound_Regular'
	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=775, DmgScale=1.1, SkinID=1)
	VulnerableDamageTypes.Add((DamageType=class'KFDT_Microwave', DamageScale=0.5))

}
