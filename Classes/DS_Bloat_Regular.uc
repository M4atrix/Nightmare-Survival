//=============================================================================
// CD_DS_Stalker_Regular
// Sets the special spawnchance to zero on all difficulties
//=============================================================================
class DS_Bloat_Regular extends KFDifficulty_Bloat
	abstract;

static function float GetSpecialSpawnChance(KFGameReplicationInfo KFGRI)
{
	return 0.5f; //0.4 //0.8
}
