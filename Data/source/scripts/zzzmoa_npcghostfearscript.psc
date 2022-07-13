Scriptname zzzmoa_NPCGhostFearScript extends activemagiceffect  

zzzmoaReviveMCM Property ConfigMenu Auto
Spell Property NPCGhostFear Auto
Actor Property PlayerRef Auto
MagicEffect Property ThisMagicEffect Auto
Quest Property PlayerGhostQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	While PlayerGhostQuest.IsRunning() && !ConfigMenu.bLiteGhostCurse \
	&& akTarget && !akTarget.IsDead() && akTarget.HasMagicEffect(ThisMagicEffect) && \
	akTarget.GetParentCell() && akTarget.GetParentCell().IsAttached()
		If !akTarget.IsInCombat()
			If akTarget.HasLos(PlayerRef)
				If !PlayerRef.IsDead() && !PlayerRef.IsBleedingOut()
					akTarget && !akTarget.IsDead() && akTarget.StartCombat(PlayerRef)
				EndIf
			EndIf
		EndIf
		Utility.Wait(6.0)
	EndWhile
	akTarget && akTarget.DispelSpell(NPCGhostFear)
EndEvent
