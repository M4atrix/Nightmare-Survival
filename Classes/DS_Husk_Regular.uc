//=============================================================================
// CD_DS_Husk_Regular
// Sets the special spawnchance to zero on all difficulties (always husk)
//=============================================================================
class DS_Husk_Regular extends KFDifficulty_Husk
	abstract;

static function float GetSpecialSpawnChance(KFGameReplicationInfo KFGRI)
{
	return 0.00f;
}

defaultproperties
{
	
	// Evil DAR spawn chances
	ChanceToSpawnAsSpecial(`DIFFICULTY_HellOnEarth)	=0.00 //0.25
	HellOnEarth=(SprintChance=0,SoloDamageMod=1,RallySettings=(TakenDamageModifier=1))

}
