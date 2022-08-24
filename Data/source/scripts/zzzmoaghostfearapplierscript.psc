Scriptname zzzmoaGhostFearApplierScript extends activemagiceffect

Spell property NPCGhostFearAbility auto

event OnEffectStart(Actor akTarget, Actor akCaster)
  ;Debug.Trace(Self + " adding monitor spell to " + akTarget)
  akTarget.AddSpell(NPCGhostFearAbility)
endevent
