//=============================================================================
// KFPlayerController
//=============================================================================
// Player Controller for KFGame
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPlayerController2 extends KFPlayerController;

/*reliable server final function ServerModifyWeaponsAmmo(KFWeapon KFW, float Multiplier)
{
    KFW.SpareAmmoCapacity[0] = int(float(KFW.default.SpareAmmoCapacity[0]) * 5.0);
    //if(KFW.SpareAmmoCount[0]==KFW.default.SpareAmmoCapacity[0]) KFW.SpareAmmoCount[0]= KFW.SpareAmmoCapacity[0];
    //return;    
}

function NotifyAddInventory(Inventory NewItem)
{
    local KFWeapon KFW;

    super(Controller).NotifyAddInventory(NewItem);
    KFW = KFWeapon(NewItem);
    
    if (KFW != none)
    {
        KFW.SpareAmmoCapacity[0] = int(float(KFW.default.SpareAmmoCapacity[0]) * 5.0);
        KFW.AmmoCount[0] = 5.0; // Set the MagazineCapacity to 5.0
    }
}  

/*function NotifyAddInventory(Inventory NewItem)
{
    local PlayerController PC;
    local KFWeapon KFW;

    super(Controller).NotifyAddInventory(NewItem);
    KFW = KFWeapon(NewItem);

    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        if((((PC.PlayerReplicationInfo != none) && PC.Pawn != none) && PC.Pawn.Health > 0) && PC.Pawn.InvManager != none)
        {
            foreach KFInventoryManager(PC.Pawn.InvManager).InventoryActors(Class'KFWeapon', KFW)
            {
                KFW.InitializeAmmoCapacity();
                KFW.SpareAmmoCapacity[0] = int(float(KFW.default.SpareAmmoCapacity[0]) * 5.0); // Set SpareAmmoCapacity to 5.0
                KFW.AmmoCount[0] = 5.0; // Set MagazineCapacity and initial ammo count to 5.0
            }
        }
    }
} */

reliable server function ServerSetSpareAmmoMultiplier(float Value)
{
    AmmoMultiplier = Value;
    //return;    
}

reliable client simulated function ClientSetSpareAmmoMultiplier(float Value)
{
    AmmoMultiplier = Value;
    //return;    
} */


defaultproperties
{
CurrentZEDTimeEffectIntensity=0.5f

    PerkList.Remove((PerkClass=class'KFPerk_Berserker'))
    PerkList.Remove((PerkClass=class'KFPerk_Demolitionist'))
    PerkList.Remove((PerkClass=class'KFPerk_Firebug'))
    PerkList.Remove((PerkClass=class'KFPerk_Survivalist')) 
}
