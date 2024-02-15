Scriptname zzzmoa_sacrificescript extends ActiveMagicEffect

Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto

actor CasterActor
actor Victim

event OnEffectFinish(Actor Target, Actor Caster)
  if ((ReviveScript.Victim == Victim) && !PlayerRef.IsBleedingOut())
    ReviveScript.Victim = None
    Victim = None
  endif
endevent

event OnEffectStart(Actor Target, Actor Caster)
  Victim = target
  CasterActor = Caster
  if (CasterActor != PlayerRef)
    Self.Dispel()
  elseif (Victim.GetLevel() > CasterActor.GetLevel())
    Utility.Wait(3)
    Debug.Notification("$mrt_MarkofArkay_Notification_Sacrifice_Failed")
    Self.Dispel()
  else
    ReviveScript.Victim = Victim
    Debug.Notification("$mrt_MarkofArkay_Notification_Sacrifice_Success")
  endif
endevent
