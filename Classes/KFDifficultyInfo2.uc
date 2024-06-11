
class KFDifficultyInfo2 extends KFGameDifficultyInfo
	hidecategories(Object);


function float GetAIRandomSpeedMod()
{
	return RandRange(0.97f, 1.03f);
}

defaultproperties
{
	
	
	NumPlayers_WaveSize={(PlayersMod[0]=3.000, //4.000
		PlayersMod[1]=3.75, //4.000
		PlayersMod[2]=4.750000,
		PlayersMod[3]=5.750000,
		PlayersMod[4]=5.750000,
		PlayersMod[5]=6.750000,
		ModCap=20.000000)}

	NumPlayers_WeaponPickupRespawnTime={(PlayersMod[0]=300.000000,
		PlayersMod[1]=300.000000,
		PlayersMod[2]=330.000000,
		PlayersMod[3]=337.500000,
		PlayersMod[4]=336.000000,
		PlayersMod[5]=335.000000,
		ModCap=1000.000000)}

	NumPlayers_AmmoPickupRespawnTime={(PlayersMod[0]=30.000000,
		PlayersMod[1]=15.000000,
		PlayersMod[2]=10.000000,
		PlayersMod[3]=7.500000,
		PlayersMod[4]=6.000000,
		PlayersMod[5]=5.000000,
		ModCap=1.000000)}

//resistance
	NumPlayers_ZedDamageResistance={(PlayersMod[0]=0.75,
		PlayersMod[1]=1.0,
		PlayersMod[2]=1.0,
		PlayersMod[3]=1.0,
		PlayersMod[4]=1.0,
		PlayersMod[5]=1.0,
		ModCap=1.000000)}

		HellOnEarth={(MovementSpeedMod=0.95, //1.05  
         SpawnRateModifier=0.0, //1.0        //0.68    //0.4
   		WaveCountMod=1.700000,
   		DoshKillMod=1.050000, //0.950000
   		StartingDosh=450, //200
   		//RespawnDosh=200, this doesn't do anything
   		AmmoPickupsMod=0.250000,
   		ItemPickupsMod=0.100000,
   		MediumAttackChance=1.000000,
   		HardAttackChance=1.000000,
         SelfInflictedDamageMod=0.50000)}
}
