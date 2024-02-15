Scriptname zzzmoa_enablesavescript extends ActiveMagicEffect

event OnEffectFinish(Actor akTarget, Actor akCaster)
  Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
endevent

event OnEffectStart(Actor akTarget, Actor akCaster)
  Game.SetInChargen(False, False, False)
endevent
