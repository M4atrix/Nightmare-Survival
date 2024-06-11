class CD_Pawn_ZedBloatKingSubspawn_HardMode extends KFPawn_ZedBloatKingSubspawn
    config(Game)
    hidecategories(Navigation);

var CD_Pawn_ZedBloatKing_HardMode Daddy;

function GetDaddy(CD_Pawn_ZedBloatKing_HardMode hardabom)
{
    Daddy = hardabom;
    Daddy.NewPoop(self);
    //return;    
}

function bool Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x2F
    if(Daddy != none)
    {
        Daddy.PoopDied(self);
    }
    return super.Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

defaultproperties
{
    
    // Reference: KFMeleeHelperAI'Default__CD_Pawn_ZedBloatKingSubspawn_HardMode.MeleeHelper'
    
    DifficultySettings=class'CD_DS_BloatKingSubspawn_HardMode'
    
    SprintSpeed=700.0
    
    GroundSpeed=500.0
    
}