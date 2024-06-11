//=============================================================================
// CD_DS_Stalker_Regular
// Sets the special spawnchance to zero on all difficulties
//=============================================================================
class DS_Gorefast_Regular extends KFDifficulty_Gorefast
	abstract;

static function float GetSpecialSpawnChance(KFGameReplicationInfo KFGRI)
{
	return 0.1f;
}
