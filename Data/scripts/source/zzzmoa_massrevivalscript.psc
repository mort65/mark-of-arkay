Scriptname zzzmoa_massrevivalscript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.Resurrect()
EndEvent