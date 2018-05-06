Scriptname zzzmoa_MarkScript extends activemagiceffect  

ObjectReference property Marker auto
zzzmoaReviveMCM Property ConfigMenu Auto
MiscObject Property MarkOfArkay Auto
Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( akCaster.GetItemCount(MarkOfArkay) >= ConfigMenu.fMarkCastSlider )
		Caster = akCaster
		Marker.Enable()
		Marker.MoveTo(Caster)
		Marker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
		Marker.SetAngle(0.0, 0.0, Caster.GetAnglez())
		If ConfigMenu.bAutoSwitchRP
			ConfigMenu.iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 3 )
		EndIf
		If ConfigMenu.fMarkCastSlider > 0.0	
			Caster.RemoveItem(MarkOfArkay,ConfigMenu.fMarkCastSlider As Int,False)
		EndIf
	Else
		Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
	EndIf
EndEvent