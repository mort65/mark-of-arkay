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
Location Property DLC1VampireCastleLocation Auto
Location Property DLC1HunterHQLocation Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker3 Auto
Objectreference Property CellLoadMarker Auto
Objectreference Property CellLoadMarker2 Auto
ObjectReference Property LocationMarker2 Auto
Message Property moaTeleportMenu0 Auto
Message Property moaTeleportMenu1 Auto
Message Property moaTeleportMenu13 Auto
Keyword property HoldKeyword Auto
Actor Caster
Int iMarkerIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( !ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled() ) 
		If ( akCaster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider )
			Caster = akCaster
			Int iTeleportLocation = ConfigMenu.iTeleportLocation
			Int iExternalIndex = ConfigMenu.iExternalIndex
			If ( ConfigMenu.bTeleportMenu )
				ReviveScript.moaERPCount.SetValue(ExternalMarkerList.GetSize())
				Utility.Wait(0.5)
				iTeleportLocation = TeleportMenu()
				If (( iTeleportLocation == -1 ) || ( iTeleportLocation > ( ConfigMenu.sRespawnPoints.Length - 1 )))
					If ( iTeleportLocation == -1 )
						iExternalIndex = iTeleportLocation
					Else
						iExternalIndex = ( iTeleportLocation - ( ConfigMenu.sRespawnPoints.Length ))
					EndIf
					iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 2 )
				EndIf
			EndIf
			If iTeleportLocation > -1
				If (iTeleportLocation < (ConfigMenu.sRespawnPoints.Length - 5))
					Caster.MoveTo( MarkerList.GetAt( iTeleportLocation ) As Objectreference, abMatchRotation = true)
				ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 5))
					RandomTeleport()
				ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 4))
					If !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
						Caster.MoveTo(SleepMarker, abMatchRotation = true)
					ElseIf ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(CustomMarker, abMatchRotation = true)
					Else
						 SendToAnotherLocation()
					EndIf
				ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 3))
					If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
						Caster.MoveTo(CustomMarker, abMatchRotation = true)
					ElseIf !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell )
						Caster.MoveTo(SleepMarker, abMatchRotation = true)
					Else
						 SendToAnotherLocation()
					EndIf
				ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 2))
					If ExternalMarkerList.GetSize() > 0
						If ExternalMarkerList.GetSize() > 1  && ( iExternalIndex == -1 || ( iExternalIndex >= ExternalMarkerList.GetSize() ) || ( !ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) || ( ExternalMarkerList.GetAt( iExternalIndex ).GetType() != 61 ) ) )
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
						ElseIf ( ( ExternalMarkerList.GetAt( iExternalIndex ).GetType() == 61 ) && ( ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) ) )
							Caster.MoveTo(  ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference, abMatchRotation = true )	
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
			EndIf
		Else
			Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
		EndIf
	Else
		Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_Off")
	EndIf
EndEvent

Bool Function bIsCurrentCell(int iIndex)
	Return ((( MarkerList.GetAt(iIndex))  As Objectreference ).GetParentCell() == Caster.GetParentCell() )
EndFunction

Int Function iGetRandomWithExclusionArray( Int iFrom, Int iTo, Bool[] iFlagArray) 
	Int ExcludeCount = 0
	int iIndex = 0
	Int iRandom = 0
	While iIndex < iFlagArray.Length
		If (!iFlagArray[iIndex] || bIsCurrentCell(iIndex))
			ExcludeCount += 1
		EndIf
		iIndex += 1
	Endwhile
	iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = 0 
	 While (iIndex < iFlagArray.Length)
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Function RandomTeleport()
	Caster.MoveTo( MarkerList.GetAt( iGetRandomWithExclusionArray( 0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags) ) As Objectreference, abMatchRotation = true )
EndFunction

Function SendToAnotherLocation()
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( iIndex == 3 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) ||  bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 4 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) ||  bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
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
		If ( Caster.GetDistance(DetachMarker1) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DetachMarker1.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker1) ) )
					fDistance = Caster.GetDistance(DetachMarker1)
					Marker = DetachMarker1
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(DetachMarker2) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DetachMarker2.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker2) ) )
					fDistance = Caster.GetDistance(DetachMarker2)
					Marker = DetachMarker2
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !DetachMarker3.IsDisabled() && ( DetachMarker3.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(DetachMarker3) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DetachMarker3.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(DetachMarker3) ) )
					fDistance = Caster.GetDistance(DetachMarker3)
					Marker = DetachMarker3
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !LocationMarker.IsDisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(LocationMarker) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !LocationMarker.IsInInterior() || ( LocationMarker.GetParentCell() == LocationMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(LocationMarker) ) )
					fDistance = Caster.GetDistance(LocationMarker)
					Marker = LocationMarker
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !CellLoadMarker.IsDisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(CellLoadMarker) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == CellLoadMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(CellLoadMarker) ) )
					fDistance = Caster.GetDistance(CellLoadMarker)
					Marker = CellLoadMarker
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !LocationMarker2.IsDisabled() && ( LocationMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(LocationMarker2) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !LocationMarker2.IsInInterior() || ( LocationMarker2.GetParentCell() == LocationMarker2.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(LocationMarker2) ) )
					fDistance = Caster.GetDistance(LocationMarker2)
					Marker = LocationMarker2
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !CellLoadMarker2.IsDisabled() && ( CellLoadMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(CellLoadMarker2) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == CellLoadMarker2.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(CellLoadMarker2) ) )
					fDistance = Caster.GetDistance(CellLoadMarker2)
					Marker = CellLoadMarker2
				EndIf
			EndIf			
		EndIf
	EndIf
	If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(CustomMarker) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == CustomMarker.GetParentCell() ) )
				If ( !fDistance || ( fDistance > Caster.GetDistance(CustomMarker) ) )
					fDistance = Caster.GetDistance(CustomMarker)
					Marker = CustomMarker
				EndIf
			EndIf
		EndIf
	EndIf
	If ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
		If ( Caster.GetDistance(SleepMarker) >= ConfigMenu.fRPMinDistanceSlider )
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
		Int jIndex = ReviveScript.iMin(100,ExternalMarkerList.GetSize())
		While jIndex > 0
			jIndex -= 1
			If ( ExternalMarkerList.GetAt( jIndex ).GetType() == 61 ) 
				If ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
					If ( Caster.GetParentCell() == ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetParentCell() )
						If ( !fDistance || ( fDistance > Caster.GetDistance( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ) ) )
							If ( Caster.GetDistance(ExternalMarkerList.GetAt( jIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
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
	If ( Caster.GetDistance(DetachMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			If ( bInSameLocation( DetachMarker2.GetCurrentLocation() ) || ( ReviveScript.IsInInteriorActual(Caster) && !ReviveScript.IsInInteriorActual(DetachMarker2) ) )
				Caster.MoveTo( DetachMarker2 )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker1) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker1.IsDisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) )
			If ( bInSameLocation( DetachMarker1.GetCurrentLocation() ) || ( ReviveScript.IsInInteriorActual(Caster) && !ReviveScript.IsInInteriorActual(DetachMarker1) ) )
				Caster.MoveTo( DetachMarker1 )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(LocationMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !LocationMarker.IsDisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( LocationMarker.GetCurrentLocation() )
				Caster.MoveTo( LocationMarker )
				Return
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(CellLoadMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !CellLoadMarker.IsDisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( CellLoadMarker.GetCurrentLocation() )
				Caster.MoveTo( CellLoadMarker )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(CustomMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !CustomMarker.IsDisabled() && ( CustomMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( CustomMarker.GetCurrentLocation() )
				Caster.MoveTo( CustomMarker )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(SleepMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !SleepMarker.IsDisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( SleepMarker.GetCurrentLocation() )
				Caster.MoveTo( SleepMarker )
				Return
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(LocationMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !LocationMarker2.IsDisabled() && ( LocationMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( LocationMarker2.GetCurrentLocation() )
				Caster.MoveTo( LocationMarker2 )
				Return
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker3) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker3.IsDisabled() && ( DetachMarker3.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( DetachMarker3.GetCurrentLocation() )
				Caster.MoveTo( DetachMarker3 )
				Return	
			EndIf
		EndIf
	EndIf
	If ( Caster.GetDistance(CellLoadMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !CellLoadMarker2.IsDisabled() && ( CellLoadMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			If bInSameLocation( CellLoadMarker2.GetCurrentLocation() )
				Caster.MoveTo( CellLoadMarker2 )
				Return	
			EndIf
		EndIf
	EndIf
	If ExternalMarkerList.GetSize() > 0
		Int jIndex = ReviveScript.iMin(100,ExternalMarkerList.GetSize())
		While jIndex > 0
			jIndex -= 1
			If ( ExternalMarkerList.GetAt( jIndex ).GetType() == 61 ) 
				If ReviveScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
					If bInSameLocation( ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetCurrentLocation() )
						If ( Caster.GetDistance( ExternalMarkerList.GetAt( jIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
							Caster.MoveTo( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile	
	EndIf
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( iIndex == 3 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 4 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
						Return
					EndIf
				EndIf
			EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
					Caster.MoveTo( MarkerList.GetAt(iIndex) As ObjectReference )
					Return
				EndIf
			EndIf
		EndIf
	EndWhile
	If ( Caster.GetDistance(DetachMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker2.IsDisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(DetachMarker2)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker1) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker1.IsDisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(DetachMarker1)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(LocationMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !LocationMarker.IsDisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(LocationMarker)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(CellLoadMarker) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !CellLoadMarker.IsDisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(CellLoadMarker)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(LocationMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !LocationMarker2.IsDisabled() && ( LocationMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(LocationMarker2)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(DetachMarker3) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !DetachMarker3.IsDisabled() && ( DetachMarker3.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(DetachMarker3)
			Return
		EndIf
	EndIf
	If ( Caster.GetDistance(CellLoadMarker2) >= ConfigMenu.fRPMinDistanceSlider )
		If ( !CellLoadMarker2.IsDisabled() && ( CellLoadMarker2.GetParentCell() != ReviveScript.DefaultCell ) )
			Caster.MoveTo(CellLoadMarker2)
			Return
		EndIf
	EndIf
	RandomTeleport()
EndFunction

Bool Function bInSameLocation(Location Loc)
    If Loc
		If Caster.IsInLocation(Loc)
			Return True
		EndIf
		If Caster.GetCurrentLocation()
			If Caster.GetCurrentLocation().IsSameLocation(Loc,HoldKeyword)
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Int Function TeleportMenu(Int aiMessage = 0, Int aiButton = 0)
	Int iIndex = 1
	While True
		If aiButton == -1 ; Can prevent problems if recycling aiButton
		ElseIf aiMessage == 0
			aiButton = moaTeleportMenu0.Show()
			If aiButton == -1
			ElseIf aiButton < ( ConfigMenu.sRespawnPoints.Length - 5 ) ;Whiterun,...,Raven Rock
				Return aiButton
			ElseIf aiButton == ( ConfigMenu.sRespawnPoints.Length - 5 ) ;More
				aiMessage = 1
			ElseIf aiButton == ( ConfigMenu.sRespawnPoints.Length - 4 ) ;Cancel
				Return -2
			EndIf
		ElseIf aiMessage == 1
			aiButton = moaTeleportMenu1.Show()
			If aiButton == -1
			ElseIf aiButton == 3
				aiMessage = 2
			ElseIf aiButton < 5 ;Random,...,Nearby
				Return ( aiButton + ( ConfigMenu.sRespawnPoints.Length - 5 ))
			ElseIf aiButton == 5 ;Less
				aiMessage = 0
			EndIf
		ElseIf aiMessage == 2
			If ExternalMarkerList.GetSize() > 8
				aiButton = ReviveScript.moaRespawnMenu13_Alt.Show(iIndex)
				If aiButton == -1
				ElseIf aiButton == 0 ;Prev
					iIndex = ReviveScript.ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),-1)
				ElseIf aiButton == 1 ;Next 
					iIndex = ReviveScript.ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),1)
				ElseIf aiButton == 2 ;OK
					Return ( iIndex + ( ConfigMenu.sRespawnPoints.Length - 1 ))
				ElseIf aiButton == 3 ;External(Random)
					Return -1
				ElseIf aiButton == 4 ;Back
					aiMessage = 1
				EndIf
			Else
				aiButton = moaTeleportMenu13.Show()
				If aiButton == -1
				ElseIf aiButton < 8 ;External(1,...,8)
					Return ( aiButton + ( ConfigMenu.sRespawnPoints.Length ))
				ElseIf aiButton == 8 ;External(Random)
					Return -1
				ElseIf aiButton == 9 ;Back
					aiMessage = 1
				EndIf
			EndIf
		EndIf
	EndWhile
EndFunction
