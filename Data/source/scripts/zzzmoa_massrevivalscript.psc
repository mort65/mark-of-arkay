Scriptname zzzmoa_massrevivalscript extends activemagiceffect

event OnEffectStart(Actor akTarget, Actor akCaster)
  akTarget.Resurrect()
endevent
