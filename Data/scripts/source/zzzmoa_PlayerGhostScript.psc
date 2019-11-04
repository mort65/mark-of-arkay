Scriptname zzzmoa_PlayerGhostScript Extends Quest  

zzzmoaReviveMCM Property ConfigMenu Auto
Actor Property PlayeRref Auto
Spell Property GhostVisual Auto
Faction Property PlayerGhostFaction Auto
Formlist Property CrimeFactions Auto
Faction Property HunterFaction Auto
Spell Property NPCGhostFearCloak Auto

Event OnUpdate()
	If IsRunning() && GetStage() < 10
		PlayerRef.SetAlpha(0.25)
		If !ConfigMenu.bLiteGhostCurse
			PlayerRef.AddSpell(NPCGhostFearCloak,False)
			Utility.Wait(1.0)
			PlayerRef.RemoveSpell(NPCGhostFearCloak)
		EndIf
		PlayerRef.SetAttackActorOnSight(True)
		RegisterForSingleUpdate(4.0)
	EndIf
EndEvent

Function setPlayerGhost(Bool bToggle = True)
	If bToggle 
		PlayerRef.AddSpell(GhostVisual,False)
		PlayerRef.SetAlpha (0.25, True)
		PlayerRef.AddToFaction(PlayerGhostFaction)
		RegisterForSingleUpdate(3.0)
	Else
		PlayerRef.RemoveSpell(GhostVisual)
		PlayerRef.SetAlpha (1.0, True)
		PlayerRef.RemoveFromFaction(PlayerGhostFaction)
	EndIf
	int cfIndex = 0
	while (cfIndex < CrimeFactions.GetSize())
		(CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(bToggle)
		cfIndex += 1
	endwhile
	HunterFaction.SetPlayerEnemy(bToggle)
	PlayerRef.SetAttackActorOnSight(bToggle)
	Game.SetPlayerReportCrime(!bToggle)
EndFunction
