class Nightmare_Survival extends KFGameInfo_Survival
Config(NightmareSurvival);

//var private AmmoMulti AmmoMulti;
var array<sGameMode> HoEPlusGameModes;
var KFPlayerController2 KFController;
var float MagSizeMultiplier;

var globalconfig float fWeaponSpareAmmoMultiplier;

//var float fWeaponSpareAmmoMultiplier;
//var GlobalInterface KFGI;

enum EAIType
{
	AT_Clot,
	AT_SlasherClot,
	AT_AlphaClot,
	AT_Crawler,
	AT_GoreFast,
	AT_Stalker,
	AT_Scrake,
	AT_FleshPound,
    AT_FleshpoundMini,
	AT_Bloat,
	AT_Siren,
	AT_Husk,
	AT_BossRandom,
	AT_EliteClot,
	AT_EliteCrawler,
	AT_EliteGoreFast,
	//AT_EDAR_EMP,
	//AT_EDAR_Laser,
	//AT_EDAR_Rocket,
	AT_HansClot
};

function InitKFGI()
{
    KFGI = GlobalInterface(class'GlobalInterface'.static);
}

function PostBeginPlay()
{
	Super.PostBeginPlay();

	  // Initialize KFGI
    	InitKFGI();
	
		if ( fWeaponSpareAmmoMultiplier == float(0) )
    {
        fWeaponSpareAmmoMultiplier = 2.f;
	}
}

/*function NotifyLogin(Controller C)
{
    AmmoMulti.NotifyLogin(C);
   // super.NotifyLogin(C);
    //return;    
}

function NotifyLogout(Controller C)
{
    AmmoMulti.NotifyLogout(C);
   // super.NotifyLogout(C);
    //return;    
} 

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return string(Class'AmmoMulti');
    //return ReturnValue;    
} */

static simulated function Nightmare_Survival GetInstance()
{
    local Nightmare_Survival Instance;
    
    foreach class'WorldInfo'.static.GetWorldInfo().DynamicActors(class'Nightmare_Survival', Instance)
    {
        return Instance;
    }
    
    return Instance;
}

// Function to modify spare ammo capacity
reliable server final function ModifySpareAmmoCapacity(KFWeapon KFW)
{
    local array<int> DefaultSpareAmmoCapacity;
    local float WeaponSpareAmmoMultiplier;

    WeaponSpareAmmoMultiplier = class'Nightmare_Survival'.static.GetInstance().fWeaponSpareAmmoMultiplier;

    if (KFW.UsesAmmo() && WeaponSpareAmmoMultiplier > 0)
    {
        DefaultSpareAmmoCapacity.Length = 2;  // Ensure array has the correct length
        DefaultSpareAmmoCapacity[0] = KFW.default.SpareAmmoCapacity[0];
        DefaultSpareAmmoCapacity[1] = KFW.default.SpareAmmoCapacity[1];

        KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[0], 0);
        KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[1], 1);

        if (float(KFW.SpareAmmoCapacity[0]) != (float(DefaultSpareAmmoCapacity[0]) * WeaponSpareAmmoMultiplier))
        {
            KFW.SpareAmmoCapacity[0] = int(float(DefaultSpareAmmoCapacity[0]) * WeaponSpareAmmoMultiplier);
            KFW.AddAmmo(0);
        }

        if (KFW.UsesSecondaryAmmo())
        {
            if (float(KFW.SpareAmmoCapacity[1]) != (float(DefaultSpareAmmoCapacity[1]) * WeaponSpareAmmoMultiplier))
            {
                KFW.SpareAmmoCapacity[1] = int(float(DefaultSpareAmmoCapacity[1]) * WeaponSpareAmmoMultiplier);
                KFW.AddAmmo(0);
            }
        }
    }
}


function MultiplierManager()
{
	local PlayerController PC;
	local KFWeapon KFWep;

	/*if (CurrentWave < KFGI.WaveNum && KFGI.WaveNum != KFGI.WaveMax) // KFGameInfo_Survival(KFGI).WaveNum
	{
		CurrentWave = KFGI.WaveNum;

		/**KFGI.SpawnManager.WaveTotalAI = KFGI.SpawnManager.WaveTotalAI * fWaveZedCountMultiplier;
		KFGI.MyKFGRI.WaveTotalAICount = KFGI.SpawnManager.WaveTotalAI;
		KFGI.MyKFGRI.AIRemaining = KFGI.SpawnManager.WaveTotalAI;

		KFGI.RefreshMonsterAliveCount();*/

		if (CurrentWave == 1)
		{
			FirstWaveSupply = false;
		}
	} */

	foreach WorldInfo.AllControllers(class'PlayerController', PC)
	{
		if (PC.PlayerReplicationInfo != None && PC.Pawn != None && PC.Pawn.Health > 0 && PC.Pawn.InvManager != None)
		{
			foreach KFInventoryManager(PC.Pawn.InvManager).InventoryActors(class'KFWeapon', KFWep)
			{
				if (fWeaponSpareAmmoMultiplier > 1.f)
				{
					KFWep.InitializeAmmoCapacity();

					/** Maximum amount of amount that can be carried for this gun, not counting what is in the magazine. Total amount this weapon can carry is SpareAmmoCapacity + MagazineCapacity */
					KFWep.SpareAmmoCapacity[0] *= fWeaponSpareAmmoMultiplier;
					/** Spare ammo, contained in extra magazines (outside of what's currently in the weapon) */
					// KFWep.SpareAmmoCount[0] *= fWeaponSpareAmmoMultiplier;
					/** Number of additional magazines to start with. Starting ammo total is (InitialSpareMags * MagazineCapacity) + MagazineCapacity */
					// KFWep.InitialSpareMags[0] *= fWeaponSpareAmmoMultiplier;
					/** What percentage of a full single magazine capacity to give when resupplying this weapon from an ammo pickup */
					// KFWep.AmmoPickupScale[0] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[0] = KFWep.SpareAmmoCapacity[0];

					KFWep.SpareAmmoCapacity[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.InitialSpareMags[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.AmmoPickupScale[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[1] = KFWep.SpareAmmoCapacity[1];

					// KFWep.AddAmmo(0);
				}

				//if (!FirstWaveSupply)
				
					KFWep.AmmoCount[0] = KFWep.MagazineCapacity[0];
					KFWep.AmmoCount[1] = KFWep.MagazineCapacity[1];

					KFWep.SpareAmmoCount[0] = KFWep.SpareAmmoCapacity[0] + KFWep.MagazineCapacity[0] - KFWep.AmmoCount[0];
					KFWep.SpareAmmoCount[1] = KFWep.SpareAmmoCapacity[1] + KFWep.MagazineCapacity[1] - KFWep.AmmoCount[1];
						
					KFWep.ClientForceAmmoUpdate(KFWep.AmmoCount[0], KFWep.SpareAmmoCount[0]);
					KFWep.ClientForceSecondaryAmmoUpdate(KFWep.AmmoCount[1]);

					KFInventoryManager(PC.Pawn.InvManager).AddGrenades(100);
				}
			}
		}
	

	/*if (!FirstWaveSupply)
	{
		FirstWaveSupply = true;
	} */
}

function OpenTraderMenu(KFPlayerController KFPC)
{
    if (KFGI != None && !KFGI.MyKFGRI.bWaveIsActive && KFGI.MyKFGRI.bTraderIsOpen)
    {
        KFPC.OpenTraderMenu();
    }
}

function CheckTraderState()
{
    if (KFGI != None && KFGI.MyKFGRI.bTraderIsOpen)
    {
        if (bDisableBoss && KFGI.MyKFGRI.WaveNum == (KFGI.MyKFGRI.WaveMax - 1))
		{
			//KFGI.DramaticEvent(1, 6.f);
			KFGI.SetWonGameCamera();
			KFGI.EndOfMatch(true);

			ClearTimer( nameof(CheckTraderState) );
		}

		if ( fWeaponSpareAmmoMultiplier > 1.f && !bBossBattleMode && KFGI.MyKFGRI.WaveNum == (KFGI.MyKFGRI.WaveMax - 1) )
		{
			fWeaponSpareAmmoMultiplier += 1.f;
			bBossBattleMode = true;
		}

		/*if (bEnabledAutoExtension)
        {
            if (!bZedTimeAllowed || iAutoZedTimeExtensionCount != 0)
            {
                if ( IsTimerActive( nameof(AutoZedTimeExtension) ) )
                {
                    ClearTimer( nameof(AutoZedTimeExtension) );
                }

                bZedTimeAllowed = false;
                iAutoZedTimeExtensionCount = 0;
                
                SetTimer( 3.f, false, nameof(EnableZedTime) );
            }
        } */

		//TraderDash(true);
	}
	else
	{
		//TraderDash(false);
	}
}

function ModifyAmmo(KFWeapon KFW)
{
	KFW.SpareAmmoCapacity[0] *= fWeaponSpareAmmoMultiplier;
	KFW.InitialSpareMags[0] *= fWeaponSpareAmmoMultiplier;
	KFW.AmmoPickupScale[0] *= fWeaponSpareAmmoMultiplier;

	KFW.SpareAmmoCapacity[1] *= fWeaponSpareAmmoMultiplier;
	KFW.InitialSpareMags[1] *= fWeaponSpareAmmoMultiplier;
	KFW.AmmoPickupScale[1] *= fWeaponSpareAmmoMultiplier;
}

function SetPlayerDefaults(Pawn PlayerPawn)
{
    local KFPawn KFP;
    local KFWeapon W;

    KFP = KFPawn(PlayerPawn);
    
    if((KFP != none) && KFP.GetPerk() != none)
    {
        KFP.GetPerk().SetPlayerDefaults(KFP);
        
            foreach KFP.InvManager.InventoryActors(class'KFWeapon', W)
            {
                if(W != none)
                {
                    //W.AddAmmo(W.GetMaxAmmoAmount(0));
                    W.SpareAmmoCount[0]=int(float(W.default.SpareAmmoCapacity[0]) * 4.0); //3.0
                    W.AmmoCount[0]=W.default.MagazineCapacity[0];
                }                
            }            
        
        KFP.bIgnoreTeamCollision = true;
    } 
    
    if(BaseMutator != none)
    {
        BaseMutator.ModifyPlayer(PlayerPawn);
    }
    PlayerPawn.PhysicsVolume.ModifyPlayer(PlayerPawn);   
} 

/*function UpdateClientsSpareAmmo()
{
    local KFPlayerController2 KFPC2;

    // End:0x85
    foreach WorldInfo.AllControllers(class'KFPlayerController2', KFPC2)
    {
        KFPC2.ServerSetSpareAmmoMultiplier(50.0);
        KFPC2.ClientSetSpareAmmoMultiplier(50.0);        
    }    
    //return;    
} */

/*function MultiplierManager()
{
	local PlayerController PC;
	local KFWeapon KFWep;

	if (CurrentWave < KFGI.WaveNum && KFGI.WaveNum != KFGI.WaveMax) // KFGameInfo_Survival(KFGI).WaveNum
	{
		CurrentWave = KFGI.WaveNum;

		/**KFGI.SpawnManager.WaveTotalAI = KFGI.SpawnManager.WaveTotalAI * fWaveZedCountMultiplier;
		KFGI.MyKFGRI.WaveTotalAICount = KFGI.SpawnManager.WaveTotalAI;
		KFGI.MyKFGRI.AIRemaining = KFGI.SpawnManager.WaveTotalAI;

		KFGI.RefreshMonsterAliveCount();*/

		if (CurrentWave == 1)
		{
			FirstWaveSupply = false;
		}
	}

	foreach WorldInfo.AllControllers(class'PlayerController', PC)
	{
		if (PC.PlayerReplicationInfo != None && PC.Pawn != None && PC.Pawn.Health > 0 && PC.Pawn.InvManager != None)
		{
			foreach KFInventoryManager(PC.Pawn.InvManager).InventoryActors(class'KFWeapon', KFWep)
			{
				if (fWeaponSpareAmmoMultiplier > 1.f)
				{
					KFWep.InitializeAmmoCapacity();

					/** Maximum amount of amount that can be carried for this gun, not counting what is in the magazine. Total amount this weapon can carry is SpareAmmoCapacity + MagazineCapacity */
					KFWep.SpareAmmoCapacity[0] *= fWeaponSpareAmmoMultiplier;
					/** Spare ammo, contained in extra magazines (outside of what's currently in the weapon) */
					// KFWep.SpareAmmoCount[0] *= fWeaponSpareAmmoMultiplier;
					/** Number of additional magazines to start with. Starting ammo total is (InitialSpareMags * MagazineCapacity) + MagazineCapacity */
					// KFWep.InitialSpareMags[0] *= fWeaponSpareAmmoMultiplier;
					/** What percentage of a full single magazine capacity to give when resupplying this weapon from an ammo pickup */
					// KFWep.AmmoPickupScale[0] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[0] = KFWep.SpareAmmoCapacity[0];

					KFWep.SpareAmmoCapacity[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.InitialSpareMags[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.AmmoPickupScale[1] *= fWeaponSpareAmmoMultiplier;
					// KFWep.SpareAmmoCount[1] = KFWep.SpareAmmoCapacity[1];

					// KFWep.AddAmmo(0);
				}

				if (!FirstWaveSupply)
				{
					KFWep.AmmoCount[0] = KFWep.MagazineCapacity[0];
					KFWep.AmmoCount[1] = KFWep.MagazineCapacity[1];

					KFWep.SpareAmmoCount[0] = KFWep.SpareAmmoCapacity[0] + KFWep.MagazineCapacity[0] - KFWep.AmmoCount[0];
					KFWep.SpareAmmoCount[1] = KFWep.SpareAmmoCapacity[1] + KFWep.MagazineCapacity[1] - KFWep.AmmoCount[1];
						
					KFWep.ClientForceAmmoUpdate(KFWep.AmmoCount[0], KFWep.SpareAmmoCount[0]);
					KFWep.ClientForceSecondaryAmmoUpdate(KFWep.AmmoCount[1]);

					KFInventoryManager(PC.Pawn.InvManager).AddGrenades(100);
				}
			}
		}
	}

	if (!FirstWaveSupply)
	{
		FirstWaveSupply = true;
	}
} */

/*function ModifyAmmo(KFWeapon KFW)
{
	KFW.SpareAmmoCapacity[0] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;
	KFW.InitialSpareMags[0] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;
	KFW.AmmoPickupScale[0] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;

	KFW.SpareAmmoCapacity[1] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;
	KFW.InitialSpareMags[1] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;
	KFW.AmmoPickupScale[1] *= Nightmare_Survival.fWeaponSpareAmmoMultiplier;
} */


defaultproperties
{
	StartingDosh=450

	//SpawnManagerClasses(0)=class'KFGame.KFAISpawnManager_Short'
	//SpawnManagerClasses(1)=class'KFGame.KFAISpawnManager_Normal'
	SpawnManagerClasses(0)=class'NightmareSurvival.KFAISpawnManager_Long2'

	MaxRespawnDosh(3)=1750.f // Hell On Earth //1000.0

	GameLengthDoshScale(0)=1.75 // Short
    GameLengthDoshScale(1)=1.0  // Medium
    GameLengthDoshScale(2)=0.95  // Long

	TimeBetweenWaves=80
	bCanPerkAlwaysChange=false
	DefaultPawnClass=class'NightmareSurvival.KFPawn_Human2'
	DifficultyInfoClass=class'NightmareSurvival.KFDifficultyInfo2'
	PlayerControllerClass=class'NightmareSurvival.KFPlayerController2'
	GameReplicationInfoClass=class'NightmareSurvival.KFGameReplicationInfo2'
    //GameConductorClass=class'NightmareSurvival.DummyGameConductor'
	//DifficultyTemplate=KFDifficultyInfo2'NightmareSurvival_Trader_ARCH.Difficulty2'
	AIClassList(0)=Class'NightmareSurvival.KFPawn_ZedClot_Cyst2'
	AIClassList(1)=Class'NightmareSurvival.KFPawn_ZedClot_Slasher2'
	AIClassList(2)=Class'NightmareSurvival.KFPawn_ZedClot_Alpha2'
	AIClassList(3)=Class'NightmareSurvival.KFPawn_ZedCrawler2'
	AIClassList(4)=Class'NightmareSurvival.KFPawn_ZedGorefast2'
	AIClassList(5)=Class'NightmareSurvival.KFPawn_ZedStalker2'
	AIClassList(6)=Class'NightmareSurvival.KFPawn_ZedScrake2'
	AIClassList(7)=Class'NightmareSurvival.KFPawn_ZedFleshpound2'
    AIClassList(8)=class'KFGameContent.KFPawn_ZedFleshpoundMini'
   	AIClassList(9)=Class'NightmareSurvival.KFPawn_ZedBloat2'
   	AIClassList(10)=Class'NightmareSurvival.KFPawn_ZedSiren2'
	AIClassList(11)=Class'NightmareSurvival.KFPawn_ZedHusk2'

    /*AIClassList(AT_EDAR_EMP)=class'KFGameContent.KFPawn_ZedDAR_Emp'
	AIClassList(AT_EDAR_Laser)=class'KFGameContent.KFPawn_ZedDAR_Laser'
	AIClassList(AT_EDAR_Rocket)=class'KFGameContent.KFPawn_ZedDAR_Rocket'
	AIClassList(AT_HansClot)=class'KFGameContent.KFPawn_ZedHansClot' */

	NonSpawnAIClassList(0)=class'KFGameContent.KFPawn_ZedBloatKingSubspawn'

	AIBossClassList(0)=Class'NightmareSurvival.KFPawn_ZedFleshpoundKing2',bRandom=true
	AIBossClassList(1)=Class'NightmareSurvival.KFPawn_ZedPatriarch2',bRandom=true
    AIBossClassList(2)=Class'NightmareSurvival.KFPawn_ZedHans2',bRandom=true
    AIBossClassList(3)=Class'NightmareSurvival.KFPawn_ZedBloatKing2',bRandom=true
    AIBossClassList(4)=Class'NightmareSurvival.KFPawn_ZedMatriarch2',bRandom=true

    /*AIBossClassList(BAT_Hans)=Class'NightmareSurvival.KFPawn_ZedHans2',bRandom=true
	AIBossClassList(BAT_Patriarch)=Class'NightmareSurvival.KFPawn_ZedPatriarch2',bRandom=true
    AIBossClassList(BAT_KingFleshpound)=Class'NightmareSurvival.KFPawn_ZedFleshpoundKing2',bRandom=true */

	/*AIBossClassList(BAT_Hans)=class'CDD.CD_Pawn_ZedHans_HardMode'
	AIBossClassList(BAT_Patriarch)=class'CDD.CD_Pawn_ZedPatriarch_HardMode'
    AIBossClassList(BAT_KingFleshpound)=class'CDD.CD_Pawn_ZedFleshpoundKing_HardMode'
	AIBossClassList(BAT_KingBloat)=class'CDD.CD_Pawn_ZedBloatKing_HardMode' */

    SpawnModEpsilon=0.0001
	SpawnPollEpsilon=0.0001
	ZTSpawnSlowdownEpsilon=0.0001

	XPMultiplier=1.5 //2.0

    HoEPlusGameModes.Add((FriendlyName="Nightmare_Survival",ClassNameAndPath="NightmareSurvival.Nightmare_Survival",bSoloPlaySupported=True,DifficultyLevels=4,Lengths=4,LocalizeID=0))

    GameInfoClassAliases.Add((ShortName="Nightmare_Survival", GameClassName="NightmareSurvival.Nightmare_Survival"))

	fWeaponSpareAmmoMultiplier = 2.0
}