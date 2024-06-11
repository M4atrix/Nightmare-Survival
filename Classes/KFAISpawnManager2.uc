
class KFAISpawnManager2 extends KFAISpawnManager
	hidecategories(Object);

	struct native PerPlayerMaxMonsters
{
	var array<int> MaxMonsters;
};
var array<PerPlayerMaxMonsters> PerDifficultyMaxMonsters;

	function int GetMaxMonsters()
{
	local int LivingPlayerCount;
	local int Difficulty;

	LivingPlayerCount = Clamp(GetLivingPlayerCount() - 1, 0, 5);
	Difficulty = Clamp(GameDifficulty, 0, 3);
	return PerDifficultyMaxMonsters[Difficulty].MaxMonsters[LivingPlayerCount];
}



defaultproperties
{

	EarlyWaveIndex=3
	//This is a list of per-player count per-difficulty max monsters, starting with
	//Normal
	PerDifficultyMaxMonsters[0]={(
			MaxMonsters[0]=10,
			MaxMonsters[1]=14,
			MaxMonsters[2]=32,
			MaxMonsters[3]=32,
			MaxMonsters[4]=32,
			MaxMonsters[5]=32
		)}

	//Hard
	PerDifficultyMaxMonsters[1]={(
			MaxMonsters[0]=11,
			MaxMonsters[1]=18,
			MaxMonsters[2]=32,
			MaxMonsters[3]=32,
			MaxMonsters[4]=32,
			MaxMonsters[5]=32
		)}

	//Suicidial
	PerDifficultyMaxMonsters[2]={(
			MaxMonsters[0]=12,
			MaxMonsters[1]=18,
			MaxMonsters[2]=32,
			MaxMonsters[3]=32,
			MaxMonsters[4]=32,
			MaxMonsters[5]=32
		)}

	//Hell on Earth
	PerDifficultyMaxMonsters[3]={(
			MaxMonsters[0]=24, //16
			MaxMonsters[1]=32,
			MaxMonsters[2]=56,  //22
			MaxMonsters[3]=72,  //26 //56
			MaxMonsters[4]=88,  //30 // 64
			MaxMonsters[5]=112  //72 //88
		)}

	// Normal
    SoloWaveSpawnRateModifier(0)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Hard
    SoloWaveSpawnRateModifier(1)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Suicidal
    SoloWaveSpawnRateModifier(2)={(RateModifier[0]=1.0,     // Wave 1
                                   RateModifier[1]=1.0,     // Wave 2
                                   RateModifier[2]=1.0,     // Wave 3
                                   RateModifier[3]=1.0)}    // Wave 4

	// Hell On Earth
    SoloWaveSpawnRateModifier(3)={(RateModifier[0]=0.0,     // Wave 1
                                   RateModifier[1]=0.0,     // Wave 2
                                   RateModifier[2]=0.0,     // Wave 3
                                   RateModifier[3]=0.0)}    // Wave 4

	EarlyWavesSpawnTimeModByPlayers(0)=1.0     // 1 player
	EarlyWavesSpawnTimeModByPlayers(1)=1.3     // 2 players  //1.0 //1.38  //1.0--Aug15th
	EarlyWavesSpawnTimeModByPlayers(2)=0.9    // 3 players  //1.0  //1.11
	EarlyWavesSpawnTimeModByPlayers(3)=0.7    // 4 players  //0.85 //0.84
	EarlyWavesSpawnTimeModByPlayers(4)=0.4     // 5 players //0.65  //0.57 //0.5--Aug15th
	EarlyWavesSpawnTimeModByPlayers(5)=0.3     // 6 players

	LateWavesSpawnTimeModByPlayers(0)=1.1      // 1 player   //1.1
	LateWavesSpawnTimeModByPlayers(1)=1.45     // 2 players  //1.1  //1.2--Aug15th 1.35
	LateWavesSpawnTimeModByPlayers(2)=0.9      // 3 players  //1.1
	LateWavesSpawnTimeModByPlayers(3)=0.4      // 4 players  //1.0
	LateWavesSpawnTimeModByPlayers(4)=0.3     // 5 players  //0.75
	LateWavesSpawnTimeModByPlayers(5)=0.1      // 6 players  //0.6 // 0.5 //0.3

	EarlyWaveSpawnRateModifier(0)=0.8 // Normal //1.0 //0.6
	EarlyWaveSpawnRateModifier(1)=0.6 // Hard
	EarlyWaveSpawnRateModifier(2)=0.5 // Suicidal   //0.8
	EarlyWaveSpawnRateModifier(3)=0.0 // Hell on Earth  //0.7  //!!!!!0.5!!!!!! change back

	//LateWaveSpawnRateModifier(0)=1.0 // Normal
	//LateWaveSpawnRateModifier(1)=0.8 // Hard
	//LateWaveSpawnRateModifier(2)=0.8 // Suicidal
	LateWaveSpawnRateModifier(3)=0.1 // Hell on Earth

	RecycleSpecialSquad(0)=false   // Normal
	RecycleSpecialSquad(1)=false   // Hard
	RecycleSpecialSquad(2)=true    // Suicidal
	RecycleSpecialSquad(3)=true    // Hell on Earth

    MaxSpecialSquadRecycles=-1

	MaxBossMinionScaleByPlayers(0)=1.0      // 1 player
	MaxBossMinionScaleByPlayers(1)=1.5      // 2 players
	MaxBossMinionScaleByPlayers(2)=1.5      // 3 players
	MaxBossMinionScaleByPlayers(3)=1.875    // 4 players
	MaxBossMinionScaleByPlayers(4)=2    // 5 players
	MaxBossMinionScaleByPlayers(5)=4.0      // 6 players

	bForceRequiredSquad=false

	VIP_CurrentSpawnCounter = 0
	VIP_MaxSpawnCounter = 5
}
