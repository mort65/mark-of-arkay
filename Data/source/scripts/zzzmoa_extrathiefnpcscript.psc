Scriptname zzzmoa_extrathiefnpcscript extends ReferenceAlias  

Import zzzmoautilscript

Event OnDisintegrating(Form sender)
	GoToState("Disintegrate")
EndEvent

Event OnDisintegratingFast(Form sender)
		Actor myself = GetActorReference()
		myself && disintegrateNow(myself)
EndEvent

State Disintegrate
	Event OnBeginState()
		Actor myself = GetActorReference()
		myself && disintegrateWhenAble(myself)
	EndEvent
EndState