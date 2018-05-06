Scriptname zzzmoa_enablesavescript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Game.SetInChargen(False,False,False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
EndEvent
