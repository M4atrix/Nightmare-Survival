class KFInventoryManager2 extends KFInventoryManager;

var KFAnimNotify_MeleeImpact_1P PendingMeleeNotify;
var KFWeapon PendingMeleeWeapon;

simulated function bool AddInventory(Inventory NewItem, optional bool bDoNotActivate)
{
    local KFWeapon KFW;

    KFW = KFWeapon(NewItem);
    
    if (KFW != none)
    {
        ModifySpareAmmoCapacity(KFW);
        
        if (Role == ROLE_Authority)
        {
            AddWeaponToGroup(KFW);
        }

        NewItem.SetOwner(Instigator);
        NewItem.Instigator = Instigator;
        NewItem.InvManager = self;
        NewItem.GivenTo(Instigator, bDoNotActivate);
        Instigator.TriggerEventClass(Class'SeqEvent_GetInventory', NewItem);

        return true;
    }
    else
    {
        return super(InventoryManager).AddInventory(NewItem, bDoNotActivate);
    }
}

/**reliable server function ServerCloseTraderMenu()
{
    super.ServerCloseTraderMenu();

    SetTimer(0.1, false, 'ModifyAllWeaponsSpareAmmoCapacity');
}*/

/**function bool GiveWeaponAmmo(KFWeapon KFW)
{
    local int AmountToAdd;
    local float AmmoMod;
    local bool bAddedAmmo;

    // AmmoMod = float(Round(Class'UMHelper'.static.GetUMHelper().default.AmmoCountMod));
    AmmoMod = 2;
    // End:0x69
    if(AmmoMod < 2)
    {
        //return super.GiveWeaponAmmo(KFW);
    }
    switch(AmmoMod)
    {
        case 2:
            AmountToAdd = Max(int((KFW.AmmoPickupScale[0] + KFW.AmmoPickupScale[0]) * float(KFW.MagazineCapacity[0])), 1);
            break;
        case 3:
            AmountToAdd = Max(int(((KFW.AmmoPickupScale[0] + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) * float(KFW.MagazineCapacity[0])), 1);
            
            break;
        
        case 4:
            AmountToAdd = Max(int((((KFW.AmmoPickupScale[0] + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) * float(KFW.MagazineCapacity[0])), 1);
            
            break;
        
        case 5:
            AmountToAdd = Max(int(((((KFW.AmmoPickupScale[0] + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) + KFW.AmmoPickupScale[0]) * float(KFW.MagazineCapacity[0])), 1);
            
            break;
        
        default:
            break;
    }
    
    if(KFW.GetTotalAmmoAmount(0) < Min(KFW.GetTotalAmmoAmount(0) + AmountToAdd, KFW.GetMaxAmmoAmount(0)))
    {
        
        if(KFW.AddAmmo(AmountToAdd) > 0)
        {
            bAddedAmmo = true;
        }
    }
    
    if(KFW.CanRefillSecondaryAmmo())
    {
        switch(AmmoMod)
        {
            
            case 2:
                AmountToAdd = Max(int((KFW.AmmoPickupScale[1] + KFW.AmmoPickupScale[1]) * float(KFW.MagazineCapacity[1])), 1);
                
                break;
            
            case 3:
                AmountToAdd = Max(int(((KFW.AmmoPickupScale[1] + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) * float(KFW.MagazineCapacity[1])), 1);
                
                break;
            
            case 4:
                AmountToAdd = Max(int((((KFW.AmmoPickupScale[1] + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) * float(KFW.MagazineCapacity[1])), 1);
                
                break;
            
            case 5:
                AmountToAdd = Max(int(((((KFW.AmmoPickupScale[1] + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) + KFW.AmmoPickupScale[1]) * float(KFW.MagazineCapacity[1])), 1);
                
                break;
            
            default:
                break;
        }

        if(KFW.GetTotalAmmoAmount(1) < Min(KFW.GetTotalAmmoAmount(1) + AmountToAdd, KFW.GetMaxAmmoAmount(1)))
        {
            if(KFW.AddSecondaryAmmo(AmountToAdd) > 0)
            {
                bAddedAmmo = true;
            }
        }
    }

    return bAddedAmmo;
}*/

reliable server final function ModifySpareAmmoCapacity(KFWeapon KFW)
{
    local array<int> DefaultSpareAmmoCapacity;
    local float WeaponSpareAmmoMultiplier;
    
    /**if(Class'UMHelper'.static.GetUMHelper() != none)
    {
        MaxSpareAmmoMod = Class'UMHelper'.static.GetUMHelper().default.AmmoCountMod;
    }*/
    WeaponSpareAmmoMultiplier = class'Nightmare_Survival'.static.GetInstance().fWeaponSpareAmmoMultiplier;
    
    if (KFW.UsesAmmo() && WeaponSpareAmmoMultiplier > 0)
    {
        DefaultSpareAmmoCapacity[0] = KFW.default.SpareAmmoCapacity[0];
        DefaultSpareAmmoCapacity[1] = KFW.default.SpareAmmoCapacity[1];

        KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[0], 0);
        KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[1], 1);
        
        if ( float(KFW.SpareAmmoCapacity[0]) != (float(DefaultSpareAmmoCapacity[0]) * WeaponSpareAmmoMultiplier) )
        {
            KFW.SpareAmmoCapacity[0] = int(float(DefaultSpareAmmoCapacity[0]) * WeaponSpareAmmoMultiplier);

            KFW.AddAmmo(0);
        }
        
        if ( KFW.UsesSecondaryAmmo() )
        {
            if ( float(KFW.SpareAmmoCapacity[1]) != (float(DefaultSpareAmmoCapacity[1]) * WeaponSpareAmmoMultiplier) )
            {
                KFW.SpareAmmoCapacity[1] = int(float(DefaultSpareAmmoCapacity[1]) * WeaponSpareAmmoMultiplier);

                KFW.AddAmmo(0);
            }
        }
    }
}

/*reliable server final function ModifyAllWeaponsSpareAmmoCapacity()
{
    local float MaxSpareAmmoMod;
    local array<int> DefaultSpareAmmoCapacity;
    local KFGameInfo_Survival KFGI;
    local KFWeapon KFW;

    // End:0x40
    if(KFGI == none)
    {
        KFGI = KFGameInfo_Survival(WorldInfo.Game);
    }
    // End:0xA3
    if(Class'UMHelper'.static.GetUMHelper() != none)
    {
        // MaxSpareAmmoMod = Class'UMHelper'.static.GetUMHelper().default.AmmoCountMod;
    }
    MaxSpareAmmoMod = 2.f;
    // End:0x301
    if(MaxSpareAmmoMod > 0)
    {
        // End:0x300
        foreach InventoryActors(Class'KFWeapon', KFW)
        {
            // End:0x2FF
            if(KFW.UsesAmmo())
            {
                DefaultSpareAmmoCapacity[0] = KFW.default.SpareAmmoCapacity[0];
                DefaultSpareAmmoCapacity[1] = KFW.default.SpareAmmoCapacity[1];
                KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[0], 0);
                KFW.ModifySpareAmmoCapacity(DefaultSpareAmmoCapacity[1], 1);
                // End:0x243
                if(float(KFW.SpareAmmoCapacity[0]) != (float(DefaultSpareAmmoCapacity[0]) * MaxSpareAmmoMod))
                {
                    KFW.SpareAmmoCapacity[0] = int(float(DefaultSpareAmmoCapacity[0]) * MaxSpareAmmoMod);
                    KFW.AddAmmo(0);
                }
                // End:0x2FF
                if(KFW.UsesSecondaryAmmo())
                {
                    // End:0x2FF
                    if(float(KFW.SpareAmmoCapacity[1]) != (float(DefaultSpareAmmoCapacity[1]) * MaxSpareAmmoMod))
                    {
                        KFW.SpareAmmoCapacity[1] = int(float(DefaultSpareAmmoCapacity[1]) * MaxSpareAmmoMod);
                        KFW.AddAmmo(0);
                    }
                }
            }            
        }        
    }
}*/

simulated function SetPendingFire(Weapon InWeapon, int InFiringMode)
{
    local int i;
    local AnimSequence AnimSeq;
    local float MeleeDamageTime;
    local KFWeapon KFW;
    local KFPawn Pawn;
    
    Pawn = KFPawn(Instigator);
    if( Pawn != None && !Pawn.IsFirstPerson() && Pawn.IsLocallyControlled() )
    {
        KFW = KFWeapon(InWeapon);
        if( KFW != None && KFW.MySkelMesh != None && KFW.MeleeAttackHelper != None )
        {
            AnimSeq = KFW.MySkelMesh.FindAnimSequence(KFW.GetMeleeAnimName(KFW.MeleeAttackHelper.CurrentAttackDir, ATK_Normal));
            if( AnimSeq != None && AnimSeq.RateScale > 0.f )
            {
                for(i=0; i<AnimSeq.Notifies.Length; i++)
                {
                    PendingMeleeNotify = KFAnimNotify_MeleeImpact_1P(AnimSeq.Notifies[i].Notify);
                    if( PendingMeleeNotify!=None )
                    {
                        MeleeDamageTime = (AnimSeq.Notifies[i].Time / AnimSeq.RateScale);
                        KFW.ModifyMeleeAttackSpeed(MeleeDamageTime, KFW.CurrentFireMode);
                        
                        break;
                    }
                }
            }
            
            if( MeleeDamageTime>0.f )
            {
                PendingMeleeWeapon = KFW;
                
                if( IsTimerActive(nameof(CheckMeleeDamage)) )
                    CheckMeleeDamage();
                    
                SetTimer(MeleeDamageTime,false,nameof(CheckMeleeDamage));
            }
        }
    }
    
    Super.SetPendingFire(InWeapon, InFiringMode);
}

simulated function CheckMeleeDamage()
{
    if( PendingMeleeNotify == None || PendingMeleeWeapon == None || PendingMeleeWeapon.MeleeAttackHelper == None )
        return;
    
    if( PendingMeleeWeapon.IsMeleeing() )
        PendingMeleeWeapon.MeleeAttackHelper.MeleeImpactNotify(PendingMeleeNotify);
        
    PendingMeleeNotify = None;
    PendingMeleeWeapon = None;
}