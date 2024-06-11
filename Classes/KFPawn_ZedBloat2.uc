
class KFPawn_ZedBloat2 extends KFPawn_ZedBloat;

function DealPukeDamage( Pawn Victim, Vector Origin )
{
	local Vector VectToEnemy;
	VectToEnemy = Victim.Location - Origin;
	VectToEnemy.Z = 0.f;
	VectToEnemy = Normal( VectToEnemy );

	Victim.TakeDamage( VomitDamage, Controller, Victim.Location, VectToEnemy, class'KFDT_BloatPuke2',, self );
}

DefaultProperties
{
	VomitDamage=8
	DifficultySettings=class'DS_Bloat_Regular'
	//ElitePawnClass.Add(class'Rebalance.KFPawn_ZedFleshpound2')
	ElitePawnClass.Add(class'KFPawn_ZedScrake2')
	
}
