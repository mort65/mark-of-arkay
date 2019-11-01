Scriptname zzzmoaGhostFearApplierScript extends activemagiceffect  

Spell Property NPCGhostFearAbility Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Debug.Trace(Self + " adding monitor spell to " + akTarget)
	akTarget.AddSpell(NPCGhostFearAbility)
EndEvent
