//=============================================================================
// KFPawn_ZedBloatKing
//=============================================================================
// Boss king variant of the bloat.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2017 Tripwire Interactive LLC
//=============================================================================

class KFPawn_ZedBloatKing2 extends KFPawn_ZedBloatKing;

static function string GetLocalizedName()
{
    return "PoliceDom";
    //return ReturnValue;    
}

defaultproperties
{
    LocalizationKey=KFPawn_ZedBloatKing

    //-----------------------------------------------------
    // Gameplay
    ArmorZoneStatus=7 // 0b00000111
    PreviousArmorZoneStatus=7
    bCanRage=true

	//There can be as many thresholds here as you want.  Just do them in order from highest -> lowest
	EnrageHealthThresholds=(0.8,0.6,0.4,0.2)

    //Fart is base timer +/- some random amount of the variance, giving you a range of say 25-35 seconds with a base of 30 and variance of 5
	//		These values are X = 0 health, Y = 100% health
	DifficultyFartAttackTimers(0)=(X=4.0,Y=7.0) // Normal				//(X=5.0,Y=9.0)
	DifficultyFartAttackTimers(1)=(X=3.5,Y=6.0) // Hard					//(X=4.5,Y=8.5)
	DifficultyFartAttackTimers(2)=(X=3.0,Y=5.5) // Suicidal				//(X=4.0,Y=8.0)
	DifficultyFartAttackTimers(3)=(X=3.0,Y=5.0) // Hell On Earth		//(X=4.0,Y=7.0)

	DifficultyVarianceFartTimers(0)=(X=2.5,Y=3.5) // Normal				//(X=3.0,Y=4.0) 
	DifficultyVarianceFartTimers(1)=(X=2.0,Y=3.0) // Hard				//(X=2.5,Y=3.5)
	DifficultyVarianceFartTimers(2)=(X=1.5,Y=2.5) // Suicidal			//(X=2.0,Y=3.0)
	DifficultyVarianceFartTimers(3)=(X=1.5,Y=2.5) // Hell On Earth		//(X=2.0,Y=3.0)

	DifficultyRageFartTimers(0)=(X=1.5,Y=2.25) // Normal 				//(X=1.75,Y=2.5) 
	DifficultyRageFartTimers(1)=(X=1.0,Y=1.75) // Hard					//(X=1.25,Y=2.0)
	DifficultyRageFartTimers(2)=(X=0.5,Y=1.25) // Suicidal				//(X=0.75,Y=1.5)
	DifficultyRageFartTimers(3)=(X=0.5,Y=1.25) // Hell On Earth			//(X=0.75,Y=1.5)

	DifficultyVarianceRageFartTimers(0)=(X=1.65,Y=2.1) // Normal		//(X=1.65,Y=2.1) 
	DifficultyVarianceRageFartTimers(1)=(X=1.15,Y=1.6) // Hard			//(X=1.15,Y=1.6)
	DifficultyVarianceRageFartTimers(2)=(X=0.65,Y=1.1) // Suicidal		//(X=0.65,Y=1.1)
	DifficultyVarianceRageFartTimers(3)=(X=0.65,Y=1.1) // Hell On Earth	//(X=0.65,Y=1.1) 

	//Offset from center of the BK to spawn the poop monster
	PoopMonsterOffset=-100
	PoopMonsterFXTemplate=ParticleSystem'CHR_Bile_EMIT.FX_Bile_Birth_01'
	PoopMonsterSFXTemplate=AkEvent'WW_ZED_Abomination.Play_Abomination_Bile_Spawn'
	PoopMonsterFXSocket=Poop_Attach

	//Amount of time between spawns
	PoopMonsterSpawnDelay=0.50 //2.f //1.5

    // Used for special crawler gas AOE attack "explosion" template  FART ATTACK
    Begin Object Class=KFGameExplosion Name=ExploTemplate0
        Damage=20
        DamageRadius=700 //600 //450
        DamageFalloffExponent=0.f
        DamageDelay=0.f
        MyDamageType=class'KFDT_Toxic_BloatKingFart'

        // Damage Effects
        KnockDownStrength=0
        KnockDownRadius=0
        FractureMeshRadius=0
        FracturePartVel=0
        ExplosionEffects=KFImpactEffectInfo'ZED_BloatKing_ARCH.FX_GasAoE_Explosion_01'
        ExplosionSound=AkEvent'WW_ZED_Abomination.Play_Abomination_AOE_Explo'
        MomentumTransferScale=100

        // Dynamic Light
        ExploLight=none

        // Camera Shake
        CamShake=CameraShake'FX_CameraShake_Arch.Grenades.Default_Grenade'
        CamShakeInnerRadius=700  //450
        CamShakeOuterRadius=1200 //900
        CamShakeFalloff=1.f
        bOrientCameraShakeTowardsEpicenter=true
    End Object
    FartExplosionTemplate =ExploTemplate0

	FartFXTemplate=ParticleSystem'ZED_BloatKing_EMIT.FX_Bloatking_Fart_01'
	FartFXSocket=Poop_Attach

	// ---------------------------------------------
    // effects
	Begin Object Class=CameraShake Name=FootstepCameraShake0
		bSingleInstance=true
		OscillationDuration=0.25f
		RotOscillation={(Pitch=(Amplitude=120.f,Frequency=60.f),Roll=(Amplitude=60.f,Frequency=40.f))}
	End Object
	FootstepCameraShake=FootstepCameraShake0
	FootstepCameraShakePitchAmplitude=120.f
	FootstepCameraShakeRollAmplitude=60.f
	FootstepCameraShakeInnerRadius=200
	FootstepCameraShakeOuterRadius=900

    // ---------------------------------------------
	// Special Moves
	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_GrappleAttack)=class'KFSM_BloatKing_Gorge'
		SpecialMoveClasses(SM_Custom1)=class'KFSM_BloatKing_Enrage'
	End Object

    //-----------------------------------------------------
    // Content
    MonsterArchPath="ZED_ARCH.ZED_BloatKing_Archetype"
    PawnAnimInfo=KFPawnAnimInfo'ZED_BloatKing_ANIM.BloatKing_AnimGroup'
    DifficultySettings=class'KFDifficulty_BloatKing'
	OverrideArmorFXIndex=200
	PukeMineProjectileClass=class'KFGameContent.KFProj_BloatKingPukeMine'

    //-----------------------------------------------------
    // AI / Nav
    ControllerClass=class'KFAIController_ZedBloatKing'

    Begin Object Name=MeleeHelper_0
        BaseDamage=55.f
        MaxHitRange=375.f
        MomentumTransfer=40000.f
        MyDamageType=class'KFDT_Bludgeon_BloatKing'
    End Object

    // Stats
    XPValues(0)=1291
    XPValues(1)=1694
    XPValues(2)=1790
    XPValues(3)=1843

    Health=14000  //11250
    DoshValue=500
    Mass=400.f

    RotationRate=(Pitch=50000,Yaw=20000,Roll=50000)
    GroundSpeed=600.0f  //160 //210 //231 //255
    SprintSpeed=750.0f   //260 //210  410 //315 //330 //345 //380
	RageSprintSpeedMultiplier=1.350f //1.3f //1.25 1.45 //1.55

	VomitRange=440.f //400.f
	VomitDamage=20

	ArmorInfoClass=class'KFZedArmorInfo_BloatKing'
	RepArmorPct[0]=255
	RepArmorPct[1]=255
	RepArmorPct[2]=255

	HitZones[HZI_HEAD]=(ZoneName=head, BoneName=Head, Limb=BP_Head, GoreHealth=MaxInt, DmgScale=1.2, SkinID=1)
	HitZones[2]=(ZoneName=chest, BoneName=Spine2, Limb=BP_Torso, GoreHealth=150, DmgScale=1.2)
	HitZones[10]=(ZoneName=stomach,	  BoneName=Spine1,		 Limb=BP_Torso, GoreHealth=150, DmgScale=1.2)
	HitZones[11]=(ZoneName=abdomen,	  BoneName=Hips,		 Limb=BP_Torso, GoreHealth=150, DmgScale=1.2)

    // for reference: Vulnerability=(default, head, legs, arms, special)
    // cutting everything in half to make it harder to stumble except the head.
    IncapSettings(AF_Stun)=     (Vulnerability=(0.1, 0.55, 0.1, 0.1, 0.55), Cooldown=17.0, Duration=1.25)
    IncapSettings(AF_Knockdown)=(Vulnerability=(0.1, 0.4, 0.1, 0.1, 0.25),  Cooldown=20.0)
    IncapSettings(AF_Stumble)=  (Vulnerability=(0.1, 0.3, 0.1, 0.1, 0.4),   Cooldown=10.0)
    IncapSettings(AF_GunHit)=   (Vulnerability=(0.1, 0.1, 0.1, 0.1, 0.5),   Cooldown=1.7)
    IncapSettings(AF_MeleeHit)= (Vulnerability=(0.1, 0.95, 0.1, 0.1, 0.75), Cooldown=2.0)
    IncapSettings(AF_Poison)=   (Vulnerability=(0))
    IncapSettings(AF_Microwave)=(Vulnerability=(0.08),                      Cooldown=10.0, Duration=3.0)
    IncapSettings(AF_FirePanic)=(Vulnerability=(0.65),                      Cooldown=15.0, Duration=1.2)
    IncapSettings(AF_EMP)=      (Vulnerability=(0.5),                       Cooldown=10.0, Duration=2.2)
    IncapSettings(AF_Freeze)=   (Vulnerability=(0.3),                       Cooldown=15.0, Duration=1.0)
    IncapSettings(AF_Snare)=    (Vulnerability=(1.0, 2.0, 1.0, 1.0, 2.0),   Cooldown=10.5, Duration=3.0)
    IncapSettings(AF_Bleed)=    (Vulnerability=(0.15),                      Cooldown=10.0)
    IncapSettings(AF_Shrink)=   (Vulnerability=(1.0))
	
	ShrinkEffectModifier = 0.15f

    // Resistant damage types
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Submachinegun',    DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_AssaultRifle',     DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Shotgun',          DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Handgun',          DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Rifle',            DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Slashing',                   DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Bludgeon',                   DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Fire',                       DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Microwave',                  DamageScale=(0.9)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Explosive',                  DamageScale=(0.4)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Piercing',                   DamageScale=(0.5)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic',                      DamageScale=(0.05))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_BloatKingFart',        DamageScale=(0.00)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_BloatKingPukeMine',    DamageScale=(0.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_BloatKingSubspawnExplosion',    DamageScale=(0.75)))

    //Special cases
    DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_HRGHealthrower',       DamageScale=(1.0)))
    DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_MicrowaveRifle',   DamageScale=(0.7)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_HRGTeslauncher',   DamageScale=(0.6)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Ballistic_Minigun',			DamageScale=(0.6)))
	DamageTypeModifiers.Add((DamageType=class'KFDT_Toxic_MineReconstructorExplosion',       	DamageScale=(1.2)))
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

    ParryResistance=4

    	// Penetration
    PenetrationResistance=10.0

	bCanBePinned=false

	bCanBeKilledByShrinking=false
}