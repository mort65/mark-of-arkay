Scriptname zzzmoa_RecallScript extends activemagiceffect

zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
FormList property MarkerList Auto
Formlist property ExternalMarkerList Auto
ObjectReference Property CustomMarker Auto
ObjectReference Property SleepMarker Auto
MiscObject Property MarkOfArkay Auto
Actor Caster
Int iMarkerIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( !ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled() ) 
		If ( akCaster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider )
			Caster = akCaster
			If (ConfigMenu.iTeleportLocation < (ConfigMenu.sRespawnPoints.Length - 4))
				Caster.MoveTo( MarkerList.GetAt( ConfigMenu.iTeleportLocation ) As Objectreference, abMatchRotation = true)
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 4))
				RandomTeleport()
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 3))
				If !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				Else
					 RandomTeleport()
				Endif
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 2))
				If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				ElseIf !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				Else
					 RandomTeleport()
				Endif
			Else
				If ExternalMarkerList.GetSize() > 0
					If ExternalMarkerList.GetSize() > 1  && ( ConfigMenu.iExternalIndex == -1 || ( ConfigMenu.iExternalIndex >= ExternalMarkerList.GetSize() ) || ( !ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ) As ObjectReference ) || ( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ).GetType() != 61 ) ) )
						iMarkerIndex = ReviveScript.iGetRandomRefFromListWithExclusions(0, ExternalMarkerList.GetSize() - 1, ExternalMarkerList)
						If iMarkerIndex != -1
							Caster.MoveTo(  ExternalMarkerList.GetAt(iMarkerIndex) As ObjectReference, abMatchRotation = true )
						ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
							Caster.MoveTo(CustomMarker, abMatchRotation = true)
						ElseIf ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
							Caster.MoveTo(SleepMarker, abMatchRotation = true)
						Else
							RandomTeleport()
						Endif
					ElseIf ( ( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ).GetType() == 61 ) && ( ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ) As ObjectReference ) ) )
						Caster.MoveTo(  ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ) As ObjectReference, abMatchRotation = true )	
					ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(CustomMarker, abMatchRotation = true)
					ElseIf ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(SleepMarker, abMatchRotation = true)
					Else
						RandomTeleport()
					Endif
				ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				ElseIf ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				Else
					 RandomTeleport()
				Endif
			Endif
			If ConfigMenu.fRecallCastSlider > 0.0	
				Caster.RemoveItem(MarkOfArkay,ConfigMenu.fRecallCastSlider As Int,False)
			Endif
		Else
			Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
		Endif
	Else
		Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_Off")
	Endif
EndEvent

Function RandomTeleport()
	Caster.MoveTo( MarkerList.GetAt( ReviveScript.iGetRandomWithExclusionArray( 0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags) ) As Objectreference, abMatchRotation = true )
EndFunction
