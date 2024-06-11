//=============================================================================
// KFPawn_ZedDAR_Laser
//=============================================================================
// Pawn for Evulz Lazer DAR
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedDAR_Laser2 extends KFPawn_ZedDAR_Laser;



defaultproperties
{
	LocalizationKey=KFPawn_ZedDAR_Laser
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedSiren2')
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedHusk2')
	ControllerClass=class'KFAIController_ZedDAR_Laser'
	MonsterArchPath="ZED_ARCH.ZED_DAR_Laser_Archetype"
	DifficultySettings=class'KFDifficulty_DAR_Laser2'

	RangedProjectileClass=class'KFProj_EvilDAR_Laser'

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
		SpecialMoveClasses(SM_StandAndShootAttack)=class'KFSM_DAR_LaserAttack'
	End Object

	FiringSocketRName=Laser_R
	FiringSocketLName=Laser_L
}
