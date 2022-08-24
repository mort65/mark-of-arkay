Scriptname zzzmoa_extrathiefnpcscript extends ReferenceAlias

import zzzmoautilscript

event OnDisintegrating(Form sender)
  GoToState("Disintegrate")
endevent

event OnDisintegratingFast(Form sender)
  Actor myself = GetActorReference()
  myself && disintegrateNow(myself)
endevent

state Disintegrate
  event OnBeginState()
    Actor myself = GetActorReference()
    myself && disintegrateWhenAble(myself)
  endevent
endstate
