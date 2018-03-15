Scriptname zzzmoa_RecallScript extends activemagiceffect

zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
FormList property MarkerList Auto
Formlist property ExternalMarkerList Auto
Formlist Property CityMarkersList Auto
FormList Property LocationsList Auto
ObjectReference Property CustomMarker Auto
ObjectReference Property SleepMarker Auto
ObjectReference Property LocationMarker Auto
MiscObject Property MarkOfArkay Auto
Location Property PaleHoldLocation  Auto
Location Property HjaalmarchHoldLocation  Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
Objectreference Property CellLoadMarker Auto
Keyword property HoldKeyword Auto
Actor Caster
Int iMarkerIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( !ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled() ) 
		If ( akCaster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider )
			Caster = akCaster
			If (ConfigMenu.iTeleportLocation < (ConfigMenu.sRespawnPoints.Length - 5))
				Caster.MoveTo( MarkerList.GetAt( ConfigMenu.iTeleportLocation ) As Objectreference, abMatchRotation = true)
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 5))
				RandomTeleport()
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 4))
				If !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				Else
					 SendToAnotherLocation()
				EndIf
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 3))
				If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				ElseIf !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				Else
					 SendToAnotherLocation()
				EndIf
			ElseIf (ConfigMenu.iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 2))
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
							SendToAnotherLocation()
						EndIf
					ElseIf ( ( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ).GetType() == 61 ) && ( ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ) As ObjectReference ) ) )
						Caster.MoveTo(  ExternalMarkerList.GetAt( ConfigMenu.iExternalIndex ) As ObjectReference, abMatchRotation = true )	
					ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(CustomMarker, abMatchRotation = true)
					ElseIf ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(SleepMarker, abMatchRotation = true)
					Else
						SendToAnotherLocation()
					EndIf
				ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(CustomMarker, abMatchRotation = true)
				ElseIf ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
					Caster.MoveTo(SleepMarker, abMatchRotation = true)
				Else
					 SendToAnotherLocation()
				EndIf
			Else
				SendToNearestLocation()
			EndIf
			If ConfigMenu.fRecallCastSlider > 0.0	
				Caster.RemoveItem(MarkOfArkay,ConfigMenu.fRecallCastSlider As Int,False)
			EndIf
		Else
			Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
		EndIf
	Else
		Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_Off")
	EndIf
EndEvent

Function RandomTeleport()
	Caster.MoveTo( MarkerList.GetAt( ReviveScript.iGetRandomWithExclusionArray( 0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags) ) As Objectreference, abMatchRotation = true )
EndFunction

Function SendToAnotherLocation()
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( iIndex == 4 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) ) ;Solitude or Morthal
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= 3000.0 )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= 3000.0 )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= 3000.0 )
					Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
					Return
				EndIf
			EndIf
		EndIf
	EndWhile
	RandomTeleport()
EndFunction

Function SendToNearestLocation()
	Float fDistance
	ObjectReference Marker
	If ( !DetachMarker1.IsDisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(DetachMarker1) >= 3000.0 )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DetachMarker1.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker1) ) )
					fDistance = Caster.GetDistance(DetachMarker1)
					Marker = DetachMarker1
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(DetachMarker2) >= 3000.0 )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DetachMarker2.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker2) ) )
					fDistance = Caster.GetDistance(DetachMarker2)
					Marker = DetachMarker2
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !CellLoadMarker.IsDisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(CellLoadMarker) >= 3000.0 )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == CellLoadMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(CellLoadMarker) ) )
					fDistance = Caster.GetDistance(CellLoadMarker)
					Marker = CellLoadMarker
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !LocationMarker.IsDisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(LocationMarker) >= 3000.0 )
			If ( !LocationMarker.IsInInterior() || ( LocationMarker.GetParentCell() == LocationMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(LocationMarker) ) )
					fDistance = Caster.GetDistance(LocationMarker)
					Marker = LocationMarker
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(CustomMarker) >= 3000.0 )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == CustomMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(CustomMarker) ) )
					fDistance = Caster.GetDistance(CustomMarker)
					Marker = CustomMarker
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(SleepMarker) >= 3000.0 )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == SleepMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(SleepMarker) ) )
					fDistance = Caster.GetDistance(SleepMarker)
					Marker = SleepMarker
				EndIf
			EndIf
		EndIf
	EndIf
	If ( Marker && fDistance < 999999999.0 )
		Caster.MoveTo( Marker )
		return
	EndIf
	If ExternalMarkerList.GetSize() > 0
		Int jIndex = ExternalMarkerList.GetSize()
		While jIndex > 0
			jIndex -= 1
			If ( ExternalMarkerList.GetAt( jIndex ).GetType() == 61 ) 
				If ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
					If ( Caster.GetParentCell() == ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetParentCell() )
						If ( !fDistance || ( fDistance > Caster.GetDistance( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ) ) )
							If ( Caster.GetDistance(ExternalMarkerList.GetAt( jIndex ) As ObjectReference) >= 3000.0 )
								fDistance = Caster.GetDistance( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
								Marker = ExternalMarkerList.GetAt( jIndex ) As ObjectReference
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile	
	EndIf
	If !Caster.IsInInterior()
		Int iIndex = CityMarkersList.GetSize()
		While ( iIndex > 0 )
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( !fDistance || ( fDistance > Caster.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) )
					fDistance = Caster.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
					Marker = MarkerList.GetAt(iIndex) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If ( Marker && fDistance < 999999999.0 )
		Caster.MoveTo( Marker )
		return
	EndIf
	If ( Caster.GetDistance(DetachMarker1) >= 3000.0 )
		If ( !DetachMarker1.IsDisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( DetachMarker1.GetCurrentLocation() )
				Caster.MoveTo( DetachMarker1 )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker2) >= 3000.0 )
		If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( DetachMarker2.GetCurrentLocation() )
				Caster.MoveTo( DetachMarker2 )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(CellLoadMarker) >= 3000.0 )
		If ( !CellLoadMarker.IsDisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( CellLoadMarker.GetCurrentLocation() )
				Caster.MoveTo( CellLoadMarker )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(LocationMarker) >= 3000.0 )
		If ( !LocationMarker.IsDisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( LocationMarker.GetCurrentLocation() )
				Caster.MoveTo( LocationMarker )
				Return
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(CustomMarker) >= 3000.0 )
		If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( CustomMarker.GetCurrentLocation() )
				Caster.MoveTo( CustomMarker )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(SleepMarker) >= 3000.0 )
		If ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( SleepMarker.GetCurrentLocation() )
				Caster.MoveTo( SleepMarker )
				Return
			EndIf
		EndIf
	EndIf
	If ExternalMarkerList.GetSize() > 0
		Int jIndex = ExternalMarkerList.GetSize()
		While jIndex > 0
			jIndex -= 1
			If ( ExternalMarkerList.GetAt( jIndex ).GetType() == 61 ) 
				If ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
					If bInSameLocation( ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetCurrentLocation() )
						If ( Caster.GetDistance( ExternalMarkerList.GetAt( jIndex ) As ObjectReference) >= 3000.0 )
							Caster.MoveTo( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile	
	EndIf
	If ( Caster.GetDistance(DetachMarker1) >= 3000.0 )
		If ( !DetachMarker1.IsDisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) )
			If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker1) ) )
				fDistance = Caster.GetDistance(DetachMarker1)
				Marker = DetachMarker1
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker2) >= 3000.0 )
		If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker2) ) )
				Marker = DetachMarker2
			EndIf
		EndIf
	EndIf
	If ( Marker )
		Caster.MoveTo( Marker )
		return
	EndIf
	SendToAnotherLocation()
EndFunction

Bool Function bInSameLocation(Location Loc)
	If Caster.IsInLocation(Loc)
		Return True
	EndIf
	If Caster.GetCurrentLocation()
		If Caster.GetCurrentLocation().IsSameLocation(Loc,HoldKeyword)
			Return True
		EndIf
	EndIf
	Return False
EndFunction
