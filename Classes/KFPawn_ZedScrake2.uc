class KFPawn_ZedScrake2 extends KFPawn_ZedScrake;

defaultproperties
{
	ControllerClass=class'KFAIController_ZedScrake2'
	ResistantDamageTypes.Add((DamageType=class'KFDT_Fire'))
	ResistantDamageTypes.Add((DamageType=class'KFDT_Microwave'))
	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=750, DmgScale=1.1, SkinID=1)
}
