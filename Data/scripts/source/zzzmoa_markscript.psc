Scriptname zzzmoa_MarkScript extends activemagiceffect  

ObjectReference property Marker auto
zzzmoaReviveMCM Property ConfigMenu Auto
Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	Marker.Enable()
	;Debug.Notification(Caster.GetDistance(Marker))
	Marker.MoveTo(Caster)
	Marker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
	Marker.SetAngle(0.0, 0.0, Caster.GetAnglez())
	If ConfigMenu.bAutoSwitchRP
		ConfigMenu.iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 2 )
	EndIf
EndEvent