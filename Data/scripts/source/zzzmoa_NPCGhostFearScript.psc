Scriptname zzzmoa_NPCGhostFearScript extends activemagiceffect  

Spell Property NPCGhostFear Auto
Actor Property PlayerRef Auto
Quest Property PlayerGhostQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	While PlayerGhostQuest.IsRunning() && akTarget && akTarget.GetParentCell() && akTarget.GetParentCell().IsAttached()
		If !akTarget.IsInCombat()
			If akTarget.HasLos(PlayerRef)
				If !PlayerRef.IsDead() && !PlayerRef.IsBleedingOut()
					akTarget && akTarget.StartCombat(PlayerRef)
				EndIf
			EndIf
		EndIf
		PlayerRef.SetAttackActorOnSight(True)
		Utility.Wait(5)
	EndWhile
	akTarget && akTarget.DispelSpell(NPCGhostFear)
EndEvent
