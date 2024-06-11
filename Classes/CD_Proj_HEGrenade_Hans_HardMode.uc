class CD_Proj_HEGrenade_Hans_HardMode extends KFProj_HansHEGrenade
    hidecategories(Navigation);

defaultproperties
{
    FuseTime=2.50
    Begin Object Class=KFGameExplosion Name=ExploTemplate0
        Damage=98
        DamageRadius=850
        DamageFalloffExponent=2.f
        DamageDelay=0.f
    End Object
    ExplosionTemplate=ExploTemplate0
}