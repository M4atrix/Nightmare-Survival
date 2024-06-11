class KFPawn_ZedMatriarch2 extends KFPawn_ZedMatriarch;

static function string GetLocalizedName()
{
    return "Nancy";   
}

defaultproperties
{
	// Stats
	XPValues(0)=1291
	XPValues(1)=1694
	XPValues(2)=1790
	XPValues(3)=1843

	// ---------------------------------------------
	//Movement / Physics
	Begin Object Name=CollisionCylinder
		CollisionRadius=+0055.000000
	End Object

	RotationRate=(Pitch=50000,Yaw=50000,Roll=50000)

	GroundSpeed=500.f
	SprintSpeed=750.f

	KnockdownImpulseScale=1.0f


    // ---------------------------------------------
    // Content
    LocalizationKey=KFPawn_ZedMatriarch
    MonsterArchPath = "ZED_ARCH.ZED_Matriarch_Archetype"
	PawnAnimInfo=KFPawnAnimInfo'ZED_Matriarch_ANIM.Matriarch_AnimGroup'

    Begin Object Name=KFPawnSkeletalMeshComponent
        // Enabling kinematic for physics interaction while alive.  (see also MinDistFactorForKinematicUpdate)
        bUpdateKinematicBonesFromAnimation = true

		// Enabling skel controls when not rendered (for guntracking on server)
		bIgnoreControllersWhenNotRendered=false

		// Beam weapons (microwave gun, flamey things, etc.) won't hit her hand armor without this
		BlockNonZeroExtent=true
    End Object

	DefaultInventory(0) = class'KFWeap_PowerClaw_Matriarch'

	// ---------------------------------------------
	//Gameplay
	Health=12500
	Mass=200.f
	DoshValue=500
	ParryResistance=4

	TentacleDamageType=class'KFDT_Slashing_MatriarchTentacle'
	DifficultySettings=class'KFDifficulty_Matriarch'

	Begin Object Name=MeleeHelper_0
		BaseDamage=66.f //55
		MaxHitRange=375.f
		MomentumTransfer=40000.f
		MyDamageType=class'KFDT_Bludgeon_Matriarch'
	End Object

    PenetrationResistance=4.0

	TickDialogInterval=0.5

	CloakPercent=2.0f //1
	DeCloakSpeed=4.5f
	CloakSpeed=3.f
	CloakShimmerAmount=0.2f //0.6

	bEnableAimOffset=true

    // ---------------------------------------------
    // Special Moves
    Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Custom1)=class'KFSM_Matriarch_SweepingClaw'
		SpecialMoveClasses(SM_StandAndShootAttack)=class'KFSM_Matriarch_TeslaBlast'
		SpecialMoveClasses(SM_HoseWeaponAttack)=class'KFSM_Matriarch_PlasmaCannon'
		SpecialMoveClasses(SM_Custom2)=class'KFSM_Matriarch_LightningStorm'
        SpecialMoveClasses(SM_GrappleAttack)=class'KFSM_Matriarch_ScorpionWhip'
		SpecialMoveClasses(SM_SonicAttack)=class'KFSM_Matriarch_WarningSiren'
		SpecialMoveClasses(SM_Taunt)=class'KFSM_Matriarch_Taunt'
    End Object

    // ---------------------------------------------
    // AI / Nav
    ControllerClass = class'KFGameContent.KFAIController_ZedMatriarch'
    BumpDamageType=class'KFDT_NPCBump_Large'
	DamageRecoveryTimeHeavy=0.65f
	DamageRecoveryTimeMedium=0.85f

	// ---------------------------------------------
	// Battle Phases

	BattlePhases(0)={(
		NextPhaseHealthPctThreshold=0.75f,
		bCanUseSweepingClaw=true, //Deprecated, Sweeping Claw is not a special move anymore.
		bCanUseTeslaBlast=true,
		bCanUsePlasmaCannon=true,
		bCanUseLightningStorm=true,
		bCanUseWarningSiren=false,
		MeleeDamageScale=1.f,
		GroundSpeedScale=1.f,
		SprintSpeedScale=1.f,
		bCanCloak=false,
		bUseAltSprintAnim=false,
		IncapSettings={(
			// for reference: Vulnerability=(default, head, legs, arms, special)
			/*AF_EMP*/		(Vulnerability=(1.0),                       Cooldown=10.0, Duration=2.5),
			/*AF_FirePanic*/(Vulnerability=(0.0),                       Cooldown=15.0, Duration=1.2),
			/*AF_MeleeHit*/	(Vulnerability=(0.0),                       Cooldown=2.0),
			/*AF_GunHit*/	(Vulnerability=(0.0),                       Cooldown=2.0),
			/*AF_Stumble*/	(Vulnerability=(0.0),                       Cooldown=10.0),
			/*AF_Stun*/		(Vulnerability=(0.0),                       Cooldown=17.0, Duration=1.25),
			/*AF_Poison*/	(Vulnerability=(0.0),						Cooldown=15.0, Duration=1.2),
			/*AF_Snare*/	(Vulnerability=(1.0, 2.0, 1.0, 1.0, 2.0),	Cooldown=10.5, Duration=3.0),
			/*AF_Knockdown*/(Vulnerability=(0.0),						Cooldown=20.0),
			/*AF_Freeze*/	(Vulnerability=(0.0),						Cooldown=10.0, Duration=1.0),
			/*AF_Microwave*/(Vulnerability=(0.08),						Cooldown=10.0, Duration=3.0),
			/*AF_Bleed*/	(Vulnerability=(0.15),						Cooldown=10.0),
			/*AF_Bighead*/  (Vulnerability=(0.0)),
			/*AF_Shrink*/   (Vulnerability=(1.0))
		)}
	)}
	BattlePhases(1)={(
		NextPhaseHealthPctThreshold=0.5f,
		bCanUseSweepingClaw=true, //Deprecated, Sweeping Claw is not a special move anymore.
		bCanUseTeslaBlast=true,
		bCanUsePlasmaCannon=true,
		bCanUseLightningStorm=true,
		bCanUseWarningSiren=false,
		MeleeDamageScale=1.f,
		GroundSpeedScale=2.f, //1.5
		SprintSpeedScale=2.f, //1
		bCanCloak=false,
		bUseAltSprintAnim=false,
		bShouldTaunt=false, //true
		IncapSettings={(
			// for reference: Vulnerability=(default, head, legs, arms, special)
			/*AF_EMP*/		(Vulnerability=(1.0),                       Cooldown=10.0, Duration=2.5),
			/*AF_FirePanic*/(Vulnerability=(0.0),                       Cooldown=15.0, Duration=1.2),
			/*AF_MeleeHit*/	(Vulnerability=(0.1, 0.95, 0.1, 0.1, 0.75), Cooldown=2.0),
			/*AF_GunHit*/	(Vulnerability=(0.1, 0.1, 0.1, 0.1, 0.5),   Cooldown=2.0),
			/*AF_Stumble*/	(Vulnerability=(0.1, 0.3, 0.1, 0.1, 0.4),   Cooldown=10.0),
			/*AF_Stun*/		(Vulnerability=(0.0),                       Cooldown=17.0, Duration=1.25),
			/*AF_Poison*/	(Vulnerability=(0.0),						Cooldown=15.0, Duration=1.2),
			/*AF_Snare*/	(Vulnerability=(1.0, 2.0, 1.0, 1.0, 2.0),   Cooldown=10.5, Duration=3.0),
			/*AF_Knockdown*/(Vulnerability=(0.0),                       Cooldown=20.0),
			/*AF_Freeze*/	(Vulnerability=(0.65),                      Cooldown=10.0, Duration=1.0),
			/*AF_Microwave*/(Vulnerability=(0.08),                      Cooldown=10.0, Duration=3.0),
			/*AF_Bleed*/	(Vulnerability=(0.15),                      Cooldown=10.0),
			/*AF_Bighead*/  (Vulnerability=(0.0)),
			/*AF_Shrink*/   (Vulnerability=(1.0))
		)},
		DamageFX={(
			FXInfo={(
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',
					Sockets=(FX_LeftKnee,Hand_FX_Start_R,FX_RightHip)
				)},
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Medium_Damage_01',
					Sockets=(FX_LeftKnee)
				)},
			)}
		)}
	)}
	BattlePhases(2)={(
		NextPhaseHealthPctThreshold=0.65f, //0.25
		bCanUseSweepingClaw=true, //Deprecated, Sweeping Claw is not a special move anymore.
		bCanUseTeslaBlast=false,
		bCanUsePlasmaCannon=false,
		bCanUseLightningStorm=true,
		bCanUseWarningSiren=true,
		MeleeDamageScale=1.f,
		GroundSpeedScale=2.25f,
		SprintSpeedScale=1.05f,
		bCanCloak=false,
		bUseAltSprintAnim=true,
		bShouldTaunt=true,
		IncapSettings={(
			// for reference: Vulnerability=(default, head, legs, arms, special)
			/*AF_EMP*/		(Vulnerability=(1.0),                       Cooldown=10.0, Duration=2.5),
			/*AF_FirePanic*/(Vulnerability=(0.65),                      Cooldown=15.0, Duration=1.2),
			/*AF_MeleeHit*/	(Vulnerability=(0.1, 0.95, 0.1, 0.1, 0.75), Cooldown=2.0),
			/*AF_GunHit*/	(Vulnerability=(0.1, 0.1, 0.1, 0.1, 0.5),   Cooldown=2.0),
			/*AF_Stumble*/	(Vulnerability=(0.1, 0.3, 0.1, 0.1, 0.4),   Cooldown=10.0),
			/*AF_Stun*/		(Vulnerability=(0.1, 0.55, 0.1, 0.1, 0.55), Cooldown=17.0, Duration=1.25),
			/*AF_Poison*/	(Vulnerability=(0.0),						Cooldown=15.0, Duration=1.2),
			/*AF_Snare*/	(Vulnerability=(1.0, 2.0, 1.0, 1.0, 2.0),   Cooldown=10.5, Duration=3.0),
			/*AF_Knockdown*/(Vulnerability=(0.1, 0.4, 0.1, 0.1, 0.25),  Cooldown=20.0),
			/*AF_Freeze*/	(Vulnerability=(0.65),                      Cooldown=10.0, Duration=1.0),
			/*AF_Microwave*/(Vulnerability=(0.08),                      Cooldown=10.0, Duration=3.0),
			/*AF_Bleed*/	(Vulnerability=(0.15),                      Cooldown=10.0),
			/*AF_Bighead*/  (Vulnerability=(0.0)),
			/*AF_Shrink*/   (Vulnerability=(1.0))
		)},
		DamageFX={(
			FXInfo={(
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',
					Sockets=(Hand_FX_Start_R,FX_RightHip)
				)},
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Medium_Damage_01',
					Sockets=(FX_LeftKnee)
				)},
				{(
					Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_LowD_01',
					Sockets=(FX_Armor_Chest)
				)},
				{(
					Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_MidD_01',
					Sockets=(FX_LeftForearm)
				)},
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Damage_Shoulder_02',
					Sockets=(Head_Attach)
				)}
			)}
		)}
	)}
	BattlePhases(3)={(
		NextPhaseHealthPctThreshold=0, // Set to 0, she doesn't have a phase after this one.
		bCanUseSweepingClaw=true, //Deprecated, Sweeping Claw is not a special move anymore.
		bCanUseTeslaBlast=false,
		bCanUsePlasmaCannon=false,
		bCanUseLightningStorm=false,
		bCanUseWarningSiren=true,
		MeleeDamageScale=1.2f,
		GroundSpeedScale=2.5f,
		SprintSpeedScale=1.15f,
		bCanCloak=true,
		bUseAltSprintAnim=true,
		bShouldTaunt=true,
		IncapSettings={(
			// for reference: Vulnerability=(default, head, legs, arms, special)
			/*AF_EMP*/		(Vulnerability=(1.0),                       Cooldown=10.0, Duration=2.5),
			/*AF_FirePanic*/(Vulnerability=(0.65),                      Cooldown=15.0, Duration=1.2),
			/*AF_MeleeHit*/	(Vulnerability=(0.1, 0.95, 0.1, 0.1, 0.75), Cooldown=2.0),
			/*AF_GunHit*/	(Vulnerability=(0.1, 0.1, 0.1, 0.1, 0.5),   Cooldown=2.0),
			/*AF_Stumble*/	(Vulnerability=(0.1, 0.3, 0.1, 0.1, 0.4),   Cooldown=10.0),
			/*AF_Stun*/		(Vulnerability=(0.1, 0.55, 0.1, 0.1, 0.55), Cooldown=17.0, Duration=1.25),
			/*AF_Poison*/	(Vulnerability=(0.0),						Cooldown=15.0, Duration=1.2),
			/*AF_Snare*/	(Vulnerability=(1.0, 2.0, 1.0, 1.0, 2.0),   Cooldown=10.5, Duration=3.0),
			/*AF_Knockdown*/(Vulnerability=(0.1, 0.4, 0.1, 0.1, 0.25),  Cooldown=20.0),
			/*AF_Freeze*/	(Vulnerability=(0.65),                      Cooldown=10.0, Duration=1.0),
			/*AF_Microwave*/(Vulnerability=(0.08),                      Cooldown=10.0, Duration=3.0),
			/*AF_Bleed*/	(Vulnerability=(0.15),                      Cooldown=10.0),
			/*AF_Bighead*/  (Vulnerability=(0.0)),
			/*AF_Shrink*/   (Vulnerability=(1.0))
		)},
		DamageFX={(
			FXInfo={(
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_High_Damage_01',
					Sockets=(FX_LeftKnee,Hand_FX_Start_R,FX_RightHip)
				)},
				{(
					Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01',
					Sockets=(FX_Armor_Chest)
				)},
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Low_Damage_01',
					Sockets=(FX_Armor_Chest)
				)},
				{(
					Template=ParticleSystem'ZED_Patriarch_EMIT.FX_Patriarch_tentacle_HighD_01',
					Sockets=(FX_LeftForearm)
				)},
				{(
					Template=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Damage_Shoulder_01',
					Sockets=(Head_Attach)
				)}
			)}
		)}
	)}

	// Summon squads by difficulty @TODO: Switch to Matriarch
	SummonWaves(0)={(
		PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_One',
		PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_Two',
		PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Normal_Three'
	)}
	SummonWaves(1)={(
		PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_One',
		PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_Two',
		PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Hard_Three'
	)}
	SummonWaves(2)={(
		PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_One',
		PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_Two',
		PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_Suicidal_Three'
	)}
	SummonWaves(3)={(
		PhaseOneWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_One',
		PhaseTwoWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_Two',
		PhaseThreeWave=KFAIWaveInfo'GP_Spawning_ARCH.Matriarch.Mat_Minions_HOE_Three'
	)}
	NumMinionsToSpawn=(X=3, Y=5)
	MinionSpawnDuration=30.f

	// ---------------------------------------------
    // Shield

	bShieldUp=true

    // invulnerable effects
    Begin Object Class=KFSkinTypeEffects_InvulnerabilityShield Name=ShieldEffects
		ImpactFXArray[0]={(
			Type=FXG_Ballistic,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[1]={(
			Type=FXG_Bludgeon,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[2]={(
			Type=FXG_Piercing,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[3]={(
			Type=FXG_Slashing,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[4]={(
			Type=FXG_Fire,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[5]={(
			Type=FXG_Toxic,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[6]={(
			Type=FXG_Healing,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[7]={(
			Type=FXG_Sawblade,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[8]={(
			Type=FXG_DrainLife,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[9]={(
			Type=FXG_IncendiaryRound,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[10]={(
			Type=FXG_UnexplodedGrenade,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[11]={(
			Type=FXG_MicrowaveBlast,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[12]={(
			Type=FXG_ShieldBash,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[13]={(
			Type=FXG_MetalMace,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[14]={(
			Type=FXG_Flare,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[15]={(
			Type=FXG_Freeze,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[16]={(
			Type=FXG_Bludgeon_Chains,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[17]={(
			Type=FXG_MicrowaveProj,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[18]={(
			Type=FXG_Electricity,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
		ImpactFXArray[19]={(
			Type=FXG_Slashing_Ion,
			DefaultParticle=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield_Hit',
			DefaultSound=AkEvent'WW_Skin_Impacts.Play_IMP_Ballistic_Machine_Local')}
    End Object

    // Shield FX
    ShieldImpactEffects=ShieldEffects
    InvulnerableShieldFX=ParticleSystem'ZED_Matriarch_EMIT.FX_Matriarch_Shield'
    ShieldSocketName=Root

    // Shield colors
    ShieldColorGreen=(R=50,G=255,B=50)
    ShieldCoreColorGreen=(R=0,G=255,B=0)
    ShieldColorYellow=(R=255,G=255,B=20)
    ShieldCoreColorYellow=(R=255,G=255,B=0)
    ShieldColorOrange=(R=255,G=110,B=10)
    ShieldCoreColorOrange=(R=255,G=105,B=0)
    ShieldColorRed=(R=255,G=20,B=20)
    ShieldCoreColorRed=(R=255,G=10,B=10)

	// Glow colors
	GlowColor_Phase1=(R=0.1, G=1.0)
    GlowColor_Phase2=(R=1.0, G=0.5)
    GlowColor_Phase3=(R=1.0, G=0.1)
    GlowColor_Phase4=(R=2.0)

	
    ShieldShatterExplosionTemplate=ShatterExploTemplate0

    ShieldHealthMaxDefaults[0]=2000
    ShieldHealthMaxDefaults[1]=3000
    ShieldHealthMaxDefaults[2]=4500
    ShieldHealthMaxDefaults[3]=5600
	ShieldHealthScale=1.f

	ShieldBreakPawnHealthPct=0.75f

	// ---------------------------------------------
	// Hit Zones

	HitZones.Empty

	// Dome needs to be first to count as the "head" (HZI_HEAD)
	// We'll remove the dome entry when the head armor breaks so that her real head gets to be the head, too.
	HitZones.Add((ZoneName=dome, 		  BoneName=dome,	 	    Limb=BP_Head, 		GoreHealth=MaxInt,	DmgScale=1.0,	SkinID=2))
	HitZones.Add((ZoneName=head, 		  BoneName=head, 			Limb=BP_Head, 		GoreHealth=MaxInt,	DmgScale=1.3,	SkinID=1))

	HitZones.Add((ZoneName=chest, 		  BoneName=Spine,		    Limb=BP_Torso,		GoreHealth=150,	    DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=abdomen, 	  BoneName=hips,	 		Limb=BP_Torso,		GoreHealth=MaxInt,	DmgScale=0.5,	SkinID=0))
	HitZones.Add((ZoneName=stomach, 	  BoneName=SpineDisc,	 	Limb=BP_Torso,		GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))

	HitZones.Add((ZoneName=lupperarm,	  BoneName=LeftShoulder,	Limb=BP_LeftArm,	GoreHealth=50,	    DmgScale=0.5,	SkinID=0))
	HitZones.Add((ZoneName=lupperauldron, BoneName=LeftPauldron,	Limb=BP_LeftArm,	GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=lforearm, 	  BoneName=LeftForearm,	    Limb=BP_LeftArm,	GoreHealth=20,	    DmgScale=1.0,	SkinID=0))
	HitZones.Add((ZoneName=lhandcap, 	  BoneName=LeftHandCap,	    Limb=BP_LeftArm,	GoreHealth=MaxInt,	DmgScale=1.0,	SkinID=2))
	HitZones.Add((ZoneName=lhand, 		  BoneName=LeftHandMain,    Limb=BP_LeftArm,	GoreHealth=MaxInt,	DmgScale=1.3,	SkinID=3))

	HitZones.Add((ZoneName=rupperarm,	  BoneName=RightShoulder,	Limb=BP_RightArm,	GoreHealth=50,	    DmgScale=0.5,	SkinID=0))
	HitZones.Add((ZoneName=rupperpauldron,BoneName=RightPauldron,	Limb=BP_RightArm,	GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=rupperhose,	  BoneName=RightArmHose1,	Limb=BP_RightArm,	GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=rforearm, 	  BoneName=RightForearm, 	Limb=BP_RightArm,	GoreHealth=20,	    DmgScale=0.25,	SkinID=2))

	HitZones.Add((ZoneName=lthigh,		  BoneName=LeftUpLeg,		Limb=BP_LeftLeg,	GoreHealth=100,	    DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=lcalf,	      BoneName=LeftLeg,		    Limb=BP_LeftLeg,	GoreHealth=50,	    DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=lfoot,	      BoneName=LeftFoot,		Limb=BP_LeftLeg,	GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))

	HitZones.Add((ZoneName=rthigh,		  BoneName=RightUpLeg,	    Limb=BP_RightLeg,	GoreHealth=100,	    DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=rcalf,		  BoneName=RightLeg,		Limb=BP_RightLeg,	GoreHealth=50,	    DmgScale=0.25,	SkinID=2))
	HitZones.Add((ZoneName=rfoot,	      BoneName=RightFoot,		Limb=BP_RightLeg,	GoreHealth=MaxInt,	DmgScale=0.25,	SkinID=2))

	HitZones.Add((ZoneName=heart, 		  BoneName=Tentacle1,		Limb=BP_Special,	GoreHealth=MaxInt,	DmgScale=1.3,	SkinID=3))
	HitZones.Add((ZoneName=teslacoil, 	  BoneName=EMP_Main,		Limb=BP_Special,	GoreHealth=MaxInt,	DmgScale=1.0,	SkinID=2))

	WeakSpotSocketNames.Empty()
	WeakSpotSocketNames.Add(FX_Dazed) // head weak spot
	WeakSpotSocketNames.Add(Hand_FX_End_L) // Left arm weakspot

	// ---------------------------------------------
	// Damage Type Modifiers

	// Resistant damage types
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun', 	DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle', 	DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun', 	        DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun', 	        DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle', 	        DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing',	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon', 	                DamageScale=(1.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Fire', 	                    DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave', 	                DamageScale=(0.9)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive', 	                DamageScale=(0.4)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing', 	                DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic', 	                    DamageScale=(0.05)))

    //special case
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MicrowaveRifle',   DamageScale=(0.7)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_HRGHealthrower',       DamageScale=(0.5)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRGTeslauncher',   DamageScale=(0.7)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Minigun',          DamageScale=(0.75)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_MineReconstructorExplosion',       	DamageScale=(0.6)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_EMP_ArcGenerator_Beam',       				DamageScale=(1.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_EMP_ArcGeneratorSphereImpact',       		DamageScale=(2)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_EMP_ArcGenerator_DefaultFiremodeZapDamage', 	DamageScale=(1.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_EMP_ArcGenerator_AltFiremodeZapDamage',		DamageScale=(1.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Shrink_ShrinkRayGun',						DamageScale=(3.0)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRGScorcherLightingImpact', 	    DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Fire_HRGScorcherDoT',		                DamageScale=(0.4)))

	//DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRG_Vampire_BloodBallImpact',		DamageScale=(0.3)))
	//DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRG_Vampire_BloodBallHeavyImpact',	DamageScale=(0.3)))
	//DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing_HRG_Vampire_CrystalSpike',			DamageScale=(0.25)))
	//DamageTypeModifiers.Add((DamageType=class'KFDT_Bleeding_HRG_Vampire_BloodSuck',				DamageScale=(0.5)))

	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRG_Vampire_BloodBallImpact',		DamageScale=(0.4)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRG_Vampire_BloodBallHeavyImpact',	DamageScale=(0.4)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing_HRG_Vampire_CrystalSpike',			DamageScale=(0.3)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Bleeding_HRG_Vampire_BloodSuck',				DamageScale=(0.7)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing_HRG_CranialPopper',					DamageScale=(2.0)))

	// ---------------------------------------------
    // Armor

	ArmorZoneStatus=3 // 0b00000011
    PreviousArmorZoneStatus=3

	ArmorInfoClass=class'KFZedArmorInfo_Matriarch'
	RepArmorPct[0]=255
	RepArmorPct[1]=255
	OverrideArmorFXIndex=200

	// ---------------------------------------------
    // Cloaking

	bCanCloak=true
	bCloakOnMeleeEnd=true

	CloakedLoop=AkEvent'WW_ZED_Matriarch.Play_Matriarch_SFX_Cloak'
	CloakedLoopEnd=AkEvent'WW_ZED_Matriarch.Stop_Matriarch_SFX_Cloak'
    Components.Add(BeamHitAC0)
    BeamHitAC=BeamHitAC0

	// ---------------------------------------------
    // Achievements
	OnDeathAchievementID=KFACHID_DefeatMatriarch

	// ---------------------------------------------
    // Bump
	HeavyBumpDamageType=class'KFGameContent.KFDT_HeavyZedBump'

	// ---------------------------------------------
	// Gun tracking
	bUseServerSideGunTracking=true
	GunTargetBoneName=Spine2

	ZEDCowboyHatAttachName=Hat_Attach

	ShrinkEffectModifier = 0.15f

	// Only used in Volter Castle for now when the spawn volume has bForceUseMapReplacePawn set to true
	// If we need to reuse it more we'll have to connect map to zed here (here defaults to this same class)
	MapReplacePawnClass.Add(class'KFPawn_ZedMatriarch')
}