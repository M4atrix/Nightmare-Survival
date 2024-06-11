class KFPawn_Human2 extends KFPawn_Human;

/* function AddDefaultInventory()
{
    local KFPerk MyPerk;

    MyPerk = GetPerk();

	if( MyPerk != none )
	{
        MyPerk.AddDefaultInventory(self);
    }
	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("KFGameContent.KFWeap_Pistol_9mm", class'Class')));
	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("Rebalance.KFWeap_Healer_Syringe2", class'Class')));
	DefaultInventory.AddItem(class<Weapon>(DynamicLoadObject("KFGameContent.KFWeap_Welder", class'Class')));
	DefaultInventory.AddItem(class<Inventory>(DynamicLoadObject("KFGameContent.KFInventory_Money", class'Class')));
	AddDefaultInventory2();
}
function AddDefaultInventory2()
{
	local KFInventoryManager KFIM;
	local class<Inventory> InvClass;
	local Inventory Inv;

	foreach DefaultInventory(InvClass)
	{
		// Ensure we don't give duplicate items
		Inv = FindInventoryType(InvClass);

		// if item not found
		if( Inv == None )
		{
			// Create it and add to inventory chain, only activate if we don't have a weapon currently selected
			Inv = CreateInventory(InvClass, Weapon != None);

			if ( KFWeapon( Inv ) != none )
			{
             	KFWeapon( Inv ).bGivenAtStart = true;
			}
		}
	}

	KFIM = KFInventoryManager(InvManager);
	foreach DefaultInventoryArchetypes(Inv)
	{
		// Create it and add to inventory chain, only activate if we don't have a weapon currently selected
		KFIM.CreateInventoryArchetype(Inv, Weapon != None);
	}

	if(Role == ROLE_Authority)
	{
		KFIM.ShowAllHUDGroups();
	}
} */


function UpdateGroundSpeed()
{
	local KFInventoryManager InvM;
	local float WeightMod;

	if ( Role < ROLE_Authority )
		return;

	InvM = KFInventoryManager(InvManager);
	WeightMod = (InvM != None) ? InvM.GetEncumbranceSpeedMod() : 1.f;

	// First reset to default so multipliers do not stack
	GroundSpeed = default.GroundSpeed * WeightMod;
	// reset sprint too, because perk may want to scale it
	SprintSpeed = default.SprintSpeed * WeightMod;

	//Knives speed up!
	if(KFWeap_Edged_Knife(MyKFWeapon) != None)
	{
		GroundSpeed *= 1.15;
		SprintSpeed *= 1.11;
	}

	// Ask our perk to set the new ground speed based on weapon type
	if( GetPerk() != none )
	{
		GetPerk().ModifySpeed(GroundSpeed);
		GetPerk().ModifySpeed(SprintSpeed);
	}
}


defaultproperties
{
	GroundSpeed=383.f
	SprintSpeed=460.f
	BatteryDrainRate=0
	NVGBatteryDrainRate=0

	InventoryManagerClass=class'KFInventoryManager2'
}