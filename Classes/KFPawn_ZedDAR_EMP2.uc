//=============================================================================
// KFPawn_ZedDAR_EMP
//=============================================================================
// Pawn for Evulz EMP DAR
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFPawn_ZedDAR_EMP2 extends KFPawn_ZedDAR_EMP;

static function float GetSpecialSpawnChance(KFGameReplicationInfo KFGRI)
{
	return 1.0f;
}

defaultproperties
{
	LocalizationKey=KFPawn_ZedDAR_EMP
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedSiren2')
	ElitePawnClass.Add(class'Rebalance.KFPawn_ZedHusk2')
	ControllerClass=class'KFAIController_ZedDAR_EMP'
	MonsterArchPath="ZED_ARCH.ZED_DAR_EMP_Archetype"
	DifficultySettings=class'KFDifficulty_DAR_EMP2'

	Begin Object Name=SpecialMoveHandler_0
		SpecialMoveClasses(SM_Taunt)=class'KFGame.KFSM_Zed_Taunt'
		SpecialMoveClasses(SM_Evade)=class'KFSM_Evade'
		SpecialMoveClasses(SM_Evade_Fear)=class'KFSM_Evade_Fear'
		SpecialMoveClasses(SM_StandAndShootAttack)=class'KFSM_DAR_EMPAttack'
	End Object

	Begin Object Name=Afflictions_0
		AfflictionClasses(AF_EMP)=class'KFGame.KFAffliction_EvilDAR_EMP'
	End Object

}
