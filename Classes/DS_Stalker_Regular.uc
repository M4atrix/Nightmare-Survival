//=============================================================================
// CD_DS_Stalker_Regular
// Sets the special spawnchance to zero on all difficulties
//=============================================================================
class DS_Stalker_Regular extends KFDifficulty_Stalker
	abstract;

static function float GetSpecialSpawnChance(KFGameReplicationInfo KFGRI)
{
	return 0.8f; //0.6
}

defaultproperties
{
	
	// Evil DAR spawn chances
	ChanceToSpawnAsSpecial(`DIFFICULTY_HellOnEarth)	=0.00 //0.25

}
