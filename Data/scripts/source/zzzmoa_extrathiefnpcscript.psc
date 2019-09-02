Scriptname zzzmoa_extrathiefnpcscript extends ReferenceAlias  

Import zzzmoautilscript

Event OnDisintegrating(Form sender)
	GoToState("Disintegrate")
EndEvent

State Disintegrate
	Event OnBeginState()
		Actor myself = GetActorReference()
		myself && disintegrateWhenAble(myself)
	EndEvent
EndState