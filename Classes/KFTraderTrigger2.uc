//=============================================================================
// KFTraderTrigger
//=============================================================================
// Trigger used to start Trader interaction
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Christian "schneidzekk" Schneider
//=============================================================================
class KFTraderTrigger2 extends KFTraderTrigger;
	
defaultproperties
{
	Begin Object NAME=CollisionCylinder LegacyClassName=Trigger_TriggerCylinderComponent_Class
		CollisionRadius=+100400.000000
		CollisionHeight=+00160.000000
		BlockZeroExtent=false
	End Object

	// the GRI turns collision on during trader time
	bCollideActors=false

	OpenAnimName=Open
	IdleLoopAnimName=Printing
	DistanceOffNavMeshTheTragerIsAllowedToBe=11500
	TraderOpenSound=AkEvent'WW_UI_Menu.Play_UI_Trader_Build_Start'
	TraderCloseSound=AkEvent'WW_UI_Menu.Play_UI_Trader_Build_Stop'

	bEnabled=true
}
