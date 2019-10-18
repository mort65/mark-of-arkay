Scriptname zzzmoa_RecallScript extends activemagiceffect

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
FormList property MarkerList Auto
Formlist property ExternalMarkerList Auto
Formlist property MergedExternalMarkerList Auto
Formlist Property CityMarkersList Auto
FormList Property LocationsList Auto
FormList Property DisabledLocations Auto
Formlist Property Destinations Auto
Formlist Property TeleportDestination Auto
FormList property CustomRespawnPoints Auto
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
ObjectReference[] Property DynamicMarkerList Auto Hidden
ObjectReference Property TOWMarker Auto
Message Property moaTeleportMenu0 Auto
Message Property moaTeleportMenu1 Auto
Message Property moaTeleportMenu13 Auto
Message Property moaCustomRecallMenu Auto
Keyword property HoldKeyword Auto
Quest Property moaNearbyDetector Auto
Quest Property moaRandomCityDetector Auto
Quest Property moaRandomMarkerDetector Auto
ReferenceAlias Property TeleportRef Auto
ReferenceAlias Property RandomTeleportRef Auto
ReferenceAlias Property RandomCityTeleportRef Auto
ObjectReference Property PlayerMarker Auto
GlobalVariable Property moaRandomDestination Auto
Int iTavernIndex
Actor Caster
Int iMarkerIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akCaster == Game.GetPlayer()
		Caster = Game.GetPlayer()
	Else
		Return
	EndIf
	If ( !ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled() ) 
		If ( Caster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider )
			Int iTeleportLocation = ConfigMenu.iTeleportLocation
			Int iExternalIndex = ConfigMenu.iExternalIndex
			Int iCustomRPSlot = ConfigMenu.iSelectedCustomRPSlot
			iTavernIndex = ConfigMenu.iTavernIndex
			If ( ConfigMenu.bTeleportMenu )
				ReviveScript.RespawnScript.moaERPCount.SetValue(MergedExternalMarkerList.GetSize())
				Utility.Wait(0.5)
				iTeleportLocation = TeleportMenu()
				If (( iTeleportLocation == -1 ) || ( iTeleportLocation > ( ConfigMenu.sRespawnPoints.Length - 1 )))
					If ( iTeleportLocation == -1 )
						iExternalIndex = iTeleportLocation
					Else
						iExternalIndex = ( iTeleportLocation - ( ConfigMenu.sRespawnPoints.Length ))
					EndIf
					iTeleportLocation = ConfigMenu.getExternalRPIndex() ;External
				ElseIf iTeleportLocation < -2
					iCustomRPSlot = (iTeleportLocation * -1) - 3   ; -3-> 0, -4-> 1, -5-> 2
					iTeleportLocation = ConfigMenu.getCustomRPIndex() ;Custom
				EndIf
			EndIf
			If iTeleportLocation > -1
				PlayerMarker.Enable()
				PlayerMarker.MoveTo(Caster)
				If iTeleportLocation < ConfigMenu.getNearbyCityRPIndex()
					If ConfigMenu.bMoreRandomRespawn
						moaRandomDestination.SetValueInt(0)
						TeleportDestination.Revert()
						TeleportDestination.AddForm(LocationsList.GetAt(iTeleportLocation) As Location)
						DisabledLocations.Revert()
						Int i = LocationsList.GetSize()
						While i > 0
							i -= 1
							If !ConfigMenu.bRespawnPointsFlags[i] && (i != iTeleportLocation)
								DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
							EndIf
						Endwhile
						Bool bResult = bMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 5)
						If bResult
							If ConfigMenu.fRecallCastSlider > 0.0 && \
							(Caster.GetParentCell() != PlayerMarker.GetParentCell() || (Caster.GetDistance(PlayerMarker) > 499.0))
								Caster.RemoveItem(MarkOfArkay,ConfigMenu.fRecallCastSlider As Int,False)
							EndIf
							PlayerMarker.MoveToMyEditorLocation()
							PlayerMarker.Disable()
							Return
						EndIf
					EndIf
					Caster.MoveTo( MarkerList.GetAt( iTeleportLocation ) As Objectreference, abMatchRotation = true)
				ElseIf iTeleportLocation == ConfigMenu.getNearbyCityRPIndex()
					SendToNearbyCity()
				ElseIf iTeleportLocation == ConfigMenu.getRandCityRPIndex()
					SendToRandomCity()
				ElseIf iTeleportLocation == (ConfigMenu.getTavernRPIndex())
					If iTavernIndex == ConfigMenu.getNearbyInnRPIndex()
						ReviveScript.RespawnScript.sendToNearbyInn()
					ElseIf iTavernIndex == ConfigMenu.getRandInnRPIndex()
						ReviveScript.RespawnScript.sendToRandomInn()
					Else
						ObjectReference Marker = ReviveScript.RespawnScript.getCenterMarker(ReviveScript.RespawnScript.InnLocations.GetAt(iTavernIndex) As Location)
						If Marker
							Caster.MoveTo(Marker)
							Return
						Else
							SendToAnotherLocation()	
						EndIf
					EndIf
				ElseIf iTeleportLocation == ConfigMenu.getSleepRPIndex()
					If !bSendToSleepMarker()
						If !bSendToCustomMarker(iCustomRPSlot)
							SendToAnotherLocation()
						EndIf
					EndIf
				ElseIf iTeleportLocation == ConfigMenu.getCustomRPIndex()
					If !bSendToCustomMarker(iCustomRPSlot)
						If !bSendToSleepMarker()
							SendToAnotherLocation()
						EndIf
					EndIf
				ElseIf iTeleportLocation == ConfigMenu.getExternalRPIndex()
					If !bSendToExternalMarker(iExternalIndex)
						If !bSendToSleepMarker()
							If !bSendToCustomMarker(iCustomRPSlot)
								SendToAnotherLocation()
							EndIf
						EndIf
					EndIf
				ElseIf iTeleportLocation == ConfigMenu.getCheckpointRPIndex()
					SendToCheckPoint()
				ElseIf iTeleportLocation == ConfigMenu.getNearbyRPIndex()
					SendToNearbyLocation()
				ElseIf iTeleportLocation == ConfigMenu.getRandomRPIndex()
					RandomTeleport()
				ElseIf iTeleportLocation == ConfigMenu.getThroatRPIndex()
					sendToTOW()	
				EndIf
				If ConfigMenu.fRecallCastSlider > 0.0 && \
				(Caster.GetParentCell() != PlayerMarker.GetParentCell() || (Caster.GetDistance(PlayerMarker) > 499.0))	
					Caster.RemoveItem(MarkOfArkay,ConfigMenu.fRecallCastSlider As Int,False)
				EndIf
				PlayerMarker.MoveToMyEditorLocation()
				PlayerMarker.Disable()
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
	If iFrom == iTo
		If iFlagArray[iFrom]
			Return iFrom
		EndIf
		Return -1
	ElseIf iFrom > iTo
		Int iTemp = iFrom
		iFrom = iTo
		iTo = iTemp
	EndIf
	Int ExcludeCount = 0
	int iIndex = iFrom
	While iIndex <= iTo
		If (!iFlagArray[iIndex] || bIsCurrentCell(iIndex))
			ExcludeCount += 1
		EndIf
		iIndex += 1
	Endwhile
	If ExcludeCount > (iTo - iFrom)
		Return -1
	EndIf
	Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = iFrom 
	 While ( iIndex <= iTo )
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Function SendToRandomCity()
	Int i
	If ConfigMenu.bMoreRandomRespawn
		PlayerMarker.Enable()
		PlayerMarker.MoveTo(Caster)
		moaRandomDestination.SetValueInt(1)
		DisabledLocations.Revert()
		i = LocationsList.GetSize()
		While i > 0
			i -= 1
			If !ConfigMenu.bRespawnPointsFlags[i]
				DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
			EndIf
		Endwhile
		If !ConfigMenu.bRespawnPointsFlags[8]
			DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(8) As Location)
		EndIf
		If !ConfigMenu.bRespawnPointsFlags[9]
			DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(9) As Location)
		EndIf
		Bool bResult = bMoveByQuest(moaRandomCityDetector,RandomCityTeleportRef, 5)
		PlayerMarker.MoveToMyEditorLocation()
		PlayerMarker.Disable()
		If bResult
			Return
		EndIf
	EndIf
	i = iGetRandomWithExclusionArray(0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags)
	If i > -1
		Caster.MoveTo( MarkerList.GetAt(i) As Objectreference, abMatchRotation = true )
	;Else
	;	sendToTOW()
	EndIf
EndFunction

Function RandomTeleport()
	If ConfigMenu.bMoreRandomRespawn
		PlayerMarker.Enable()
		PlayerMarker.MoveTo(Caster)
		DisabledLocations.Revert()
		Int i = LocationsList.GetSize()
		While i > 0
			i -= 1
			If !ConfigMenu.bRespawnPointsFlags[i]
				DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
			EndIf
		Endwhile
		If !ConfigMenu.bRespawnPointsFlags[8]
			DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(8) As Location)
		EndIf
		If !ConfigMenu.bRespawnPointsFlags[9]
			DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(9) As Location)
		EndIf
		Bool bResult = bMoveByQuest(moaRandomMarkerDetector,RandomTeleportRef, 5)
		PlayerMarker.MoveToMyEditorLocation()
		PlayerMarker.Disable()
		If bResult
			Return
		EndIf
	EndIf
	Destinations.Revert()
	int iIndex = 0
	Int iRandom = 0
	While iIndex < MarkerList.GetSize()
		If ConfigMenu.bRespawnPointsFlags[iIndex] && Caster.GetDistance(MarkerList.GetAt(iIndex) As Objectreference) >= ConfigMenu.fRPMinDistanceSlider
			Destinations.AddForm(MarkerList.GetAt(iIndex) As Objectreference)
		EndIf
		iIndex += 1
	Endwhile
	Bool[] bInnFlags = ReviveScript.RespawnScript.bGetTavernFlags()
	iIndex = ReviveScript.RespawnScript.InnLocations.GetSize()
	While iIndex > 0
		iIndex -= 1
		If bInnFlags[iIndex]
			Destinations.AddForm(ReviveScript.RespawnScript.TavernMarkers[iIndex] As ObjectReference)
		EndIf
	Endwhile	
	If !SleepMarker.Isdisabled() && ( SleepMarker.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(SleepMarker) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(SleepMarker)
	EndIf
	iIndex = 0
	While iIndex < CustomRespawnPoints.GetSize()
		If ConfigMenu.isCustomSlotAvailable(iIndex) && !ConfigMenu.isCustomSlotEmpty(iIndex)
			If Caster.GetDistance((CustomRespawnPoints.GetAt(iIndex) As ObjectReference)) >= ConfigMenu.fRPMinDistanceSlider
				Destinations.AddForm(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
			EndIf
		EndIf
		iIndex += 1
	EndWhile
	If MergedExternalMarkerList.GetSize() > 0
		iIndex = MergedExternalMarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If !(( MergedExternalMarkerList.GetAt( iIndex ).GetType() != 61 ) || \
			!ReviveScript.RespawnScript.bCanTeleportToExtMarker( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ) || \
			( Caster.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < ConfigMenu.fRPMinDistanceSlider ))
				Destinations.AddForm(MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference)
			EndIf
		EndWhile
	EndIf
	If !CellLoadMarker2.Isdisabled() && ( CellLoadMarker2.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(CellLoadMarker2) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(CellLoadMarker2)
	EndIf
	If !DetachMarker3.Isdisabled() && ( DetachMarker3.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(DetachMarker3) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(DetachMarker3)
	EndIf
	If !LocationMarker2.Isdisabled() && ( LocationMarker2.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(LocationMarker2) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(LocationMarker2)
	EndIf
	If CellLoadMarker.Isdisabled() && ( CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(CellLoadMarker) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(CellLoadMarker)
	EndIf
	If LocationMarker.Isdisabled() && ( LocationMarker.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(LocationMarker) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(LocationMarker)
	EndIf
	If DetachMarker1.Isdisabled() && ( DetachMarker1.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(DetachMarker1) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(DetachMarker1)
	EndIf
	If DetachMarker2.Isdisabled() && ( DetachMarker2.GetParentCell() != ReviveScript.DefaultCell ) && Caster.GetDistance(DetachMarker2) >= ConfigMenu.fRPMinDistanceSlider
		Destinations.AddForm(DetachMarker2)
	EndIf
	If Destinations.GetSize() > 0
		iRandom = Utility.RandomInt(0, Destinations.GetSize() - 1)
		Caster.MoveTo(Destinations.GetAt(iRandom) As ObjectReference)
	Else
		sendToTOW()
	EndIf
EndFunction

ObjectReference Function findCityMarkerByLocation()
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( iIndex == 3 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
			;	If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			;EndIf
		ElseIf ( iIndex == 4 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
			;	If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			;EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
			;	If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			;EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			;If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( Caster.GetDistance( MarkerList.GetAt(iIndex) As ObjectReference ) >= ConfigMenu.fRPMinDistanceSlider )
					Return MarkerList.GetAt(iIndex) As ObjectReference
				EndIf
			;EndIf
		EndIf
	EndWhile
	Return None
EndFunction

Function SendToNearbyCity()
	ObjectReference Marker = FindCityMarkerByLocation()
	If Marker
		Caster.MoveTo(Marker)
		Return 
	EndIf
	If !ReviveScript.RespawnScript.IsInInteriorActual(PlayerMarker)
		float fDistance
		Int iIndex
		If MergedExternalMarkerList.GetSize() > 0
			iIndex = iMin(100,MergedExternalMarkerList.GetSize())
			While iIndex > 0
			iIndex -= 1
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
					fDistance = PlayerMarker.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					Marker = MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference
				EndIf
			EndWhile
		EndIf
		If PlayerMarker.IsInInterior()
			iIndex = MarkerList.GetSize()
			While iIndex > 0
				iIndex -= 1
				;If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetParentCell() == ( MarkerList.GetAt(iIndex) As ObjectReference ).GetParentCell() )
						If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) ) )
							fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
							Marker = MarkerList.GetAt(iIndex) As ObjectReference
						EndIf
					EndIf
				;EndIf
			EndWhile
		Else
			iIndex = CityMarkersList.GetSize()
			While iIndex > 0
				iIndex -= 1
				;If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) )
						fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
						Marker = MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				;EndIf
			EndWhile
		EndIf
		If ( Marker && fDistance && fDistance < 500001 )
			Caster.MoveTo(Marker)
			Return
		EndIf
	EndIf
	sendToRandomCity()
Endfunction

Function SendToAnotherLocation()
	ObjectReference Marker = ReviveScript.RespawnScript.FindInnMarkerByLocation()
	If Marker
		Caster.MoveTo(Marker)
		Return 
	EndIf
	Marker = FindCityMarkerByLocation()
	If Marker
		Caster.MoveTo(Marker)
		Return 
	EndIf	
	ReviveScript.RespawnScript.sendToRandomInn()
EndFunction

Function SendToNearbyLocation()
		PlayerMarker.Enable()
		PlayerMarker.MoveTo(Caster)
		PlayerMarker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
		PlayerMarker.SetAngle(0.0, 0.0, Caster.GetAnglez())
		Utility.Wait(0.5)
		ReviveScript.RespawnScript.findNearbyMarker()
		If !bMoveByQuest(moaNearbyDetector,TeleportRef, 5)
			SendToCheckPoint()
		EndIf
		PlayerMarker.MoveToMyEditorLocation()
		PlayerMarker.Disable()
Endfunction

Function SendToCheckPoint()
	Float fDistance
	ObjectReference Marker
	DynamicMarkerList = New ObjectReference[12]
	DynamicMarkerList[0] = CellLoadMarker2
	DynamicMarkerList[1] = DetachMarker3
	DynamicMarkerList[2] = LocationMarker2
	DynamicMarkerList[3] = SleepMarker
	DynamicMarkerList[4] = CellLoadMarker
	DynamicMarkerList[5] = LocationMarker
	DynamicMarkerList[6] = DetachMarker1
	DynamicMarkerList[7] = DetachMarker2
	DynamicMarkerList[8] = CustomRespawnPoints.GetAt(0) As ObjectReference
	DynamicMarkerList[9] = CustomRespawnPoints.GetAt(1) As ObjectReference
	DynamicMarkerList[10] = CustomRespawnPoints.GetAt(2) As ObjectReference
	DynamicMarkerList[11] = CustomRespawnPoints.GetAt(3) As ObjectReference
	
	Int iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( !DynamicMarkerList[iIndex].IsDisabled() && ( DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell ))
			If ( Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider )
				If ( !Caster.IsInInterior() || ( Caster.GetParentCell() == DynamicMarkerList[iIndex].GetParentCell() ))
					If ( !fDistance || ( fDistance > Caster.GetDistance(DynamicMarkerList[iIndex]) ))
						fDistance = Caster.GetDistance(DynamicMarkerList[iIndex])
						Marker = DynamicMarkerList[iIndex]
					EndIf
				EndIf
			EndIf
		EndIf
	EndWhile
	If ( Marker && fDistance < 999999999.0 )
		Caster.MoveTo( Marker )
		return
	EndIf
	If MergedExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,MergedExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If ( MergedExternalMarkerList.GetAt( iIndex ).GetType() == 61 ) 
				If ReviveScript.RespawnScript.bCanTeleportToExtMarker( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					If ( Caster.GetParentCell() == ( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ).GetParentCell() )
						If ( !fDistance || ( fDistance > Caster.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
							If ( Caster.GetDistance(MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
								fDistance = Caster.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference )
								Marker = MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile	
	EndIf
	If !Caster.IsInInterior()
		iIndex = CityMarkersList.GetSize()
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
	iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !DynamicMarkerList[iIndex].IsDisabled() && ( DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell ) )
				If ( bInSameLocation( DynamicMarkerList[iIndex].GetCurrentLocation() ) || ( ReviveScript.RespawnScript.IsInInteriorActual(Caster) && !ReviveScript.RespawnScript.IsInInteriorActual(DynamicMarkerList[iIndex]) ) )
					Caster.MoveTo( DynamicMarkerList[iIndex] )
					Return	
				EndIf
			EndIf
		EndIf
	EndWhile
	If MergedExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,MergedExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If ( MergedExternalMarkerList.GetAt( iIndex ).GetType() == 61 ) 
				If ReviveScript.RespawnScript.bCanTeleportToExtMarker( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					If bInSameLocation( ( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference ).GetCurrentLocation() )
						If ( Caster.GetDistance( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
							Caster.MoveTo( MergedExternalMarkerList.GetAt( iIndex ) As ObjectReference )
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile	
	EndIf
	iIndex = LocationsList.GetSize()
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
	iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider )
			If ( !DynamicMarkerList[iIndex].IsDisabled() && ( DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell ) )
				Caster.MoveTo(DynamicMarkerList[iIndex])
				Return
			EndIf
		EndIf
	EndWhile
	SendToRandomCity()
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
			ElseIf aiButton < ConfigMenu.getNearbyCityRPIndex() ;Whiterun,...,Raven Rock
				Return aiButton
			ElseIf aiButton == ConfigMenu.getNearbyCityRPIndex() ;More
				aiMessage = 1
			ElseIf aiButton == (ConfigMenu.getNearbyCityRPIndex() + 1) ;Cancel
				Return -2
			EndIf
		ElseIf aiMessage == 1
			aiButton = moaTeleportMenu1.Show()
			If aiButton == -1
			ElseIf aiButton == 0 ;City
				aiMessage = 4
			ElseIf aiButton == 1 ;Inn
				aiMessage = 5
			ElseIf aiButton == 3 ;Custom
				aiMessage = 2
			ElseIf aiButton == 4 ;External
				aiMessage = 3
			ElseIf aiButton < 9 ;City,...,Throat of the World
				Return aiButton + ConfigMenu.getRandCityRPIndex()
			ElseIf aiButton == 9 ;Less
				aiMessage = 0
			EndIf
		ElseIf aiMessage == 2 ;Custom
			aiButton = moaCustomRecallMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
			If aiButton == -1
			ElseIf aiButton == 4 ;Details
				ConfigMenu.ShowCustomSlotsInfo()
			ElseIf aiButton == 5 ;Back
				aiMessage = 1
			ElseIf aiButton == 6 ;Cancel
				Return -2
			Else
				Return -3 - aiButton ;0-> -3, 1-> -4, 2-> -5
			EndIf			
		ElseIf aiMessage == 3
			If MergedExternalMarkerList.GetSize() > 7
				aiButton = ReviveScript.RespawnScript.moaRespawnMenu13_Alt.Show(iIndex)
				If aiButton == -1
				ElseIf aiButton == 0 ;Prev
					iIndex = ichangeVar(iIndex,1,MergedExternalMarkerList.GetSize(),-1)
				ElseIf aiButton == 1 ;Next 
					iIndex = ichangeVar(iIndex,1,MergedExternalMarkerList.GetSize(),1)
				ElseIf aiButton == 2 ;Input
					If ConfigMenu.bUIEOK
						UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
						TextMenu.SetPropertyString("text", (iIndex) As String)
						TextMenu.OpenMenu(none, none)
						String sResult = TextMenu.GetResultString()
						TextMenu.ResetMenu()
						If sResult && bIsInteger(sResult) && ((sResult As Int) - 1) > - 1 && ((sResult As Int) - 1) < MergedExternalMarkerList.GetSize()
							iIndex = (sResult As Int)
						EndIf
					EndIf
				ElseIf aiButton == 3 ;Check
					ConfigMenu.ShowExtraRPInfo(iIndex - 1,1)
				ElseIf aiButton == 4 ;OK
					Return ( iIndex + ( ConfigMenu.sRespawnPoints.Length - 1 ))
				ElseIf aiButton == 5 ;External(Random)
					Return -1
				ElseIf aiButton == 6 ;Back
					aiMessage = 1
				EndIf
			Else
				aiButton = moaTeleportMenu13.Show()
				If aiButton == -1
				ElseIf aiButton < 7 ;External(1,...,7)
					Return ( aiButton + ( ConfigMenu.sRespawnPoints.Length ))
				ElseIf aiButton == 7 ;External(Random)
					Return -1
				ElseIf aiButton == 8 ;Details
					ConfigMenu.ShowExtraRPInfo(0,7)
				ElseIf aiButton == 9 ;Back
					aiMessage = 1
				EndIf
			EndIf
		ElseIf aiMessage == 4
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu10.Show()
			If aiButton == -1
			ElseIf aiButton == 0
				Return ConfigMenu.getNearbyCityRPIndex()
			ElseIf aiButton == 1
				Return ConfigMenu.getRandCityRPIndex()
			ElseIf aiButton == 2
				aiMessage = 1
			EndIf
		ElseIf aiMessage == 5
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu11.Show()
			If aiButton == -1
			ElseIf aiButton == 0
				aiMessage = 6
			ElseIf aiButton == 1
				aiMessage = 7				
			ElseIf aiButton == 2
				aiMessage = 8				
			ElseIf aiButton == 3
				aiMessage = 9					
			ElseIf aiButton == 4
				aiMessage = 10		
			ElseIf aiButton == 5
				aiMessage = 11
			ElseIf aiButton == 6
				aiMessage = 12
			ElseIf aiButton == 7
				aiMessage = 13
			ElseIf aiButton == 8 ;more
				aiMessage = 14
			ElseIf aiButton == 9 ;back
				aiMessage = 1
			EndIf
		ElseIf aiMessage == 6 ;Whiterun Inns (3)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu110.Show()
			If aiButton == -1
			ElseIf aiButton < 3
				iTavernIndex = aiButton
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 3
				aiMessage = 5
			EndIf
		ElseIf aiMessage == 7 ;Falkreath Inn (1)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu111.Show()
			If aiButton == -1
			ElseIf aiButton < 1
				iTavernIndex = aiButton + 3
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 1
				aiMessage = 5
			EndIf	
		ElseIf aiMessage == 8 ;Markarth Inn (2)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu112.Show()
			If aiButton == -1
			ElseIf aiButton < 2
				iTavernIndex = aiButton + 4
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 2
				aiMessage = 5
			EndIf				
		ElseIf aiMessage == 9 ;Riften Inn (1)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu113.Show()
			If aiButton == -1
			ElseIf aiButton < 1
				iTavernIndex = aiButton + 6
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 1
				aiMessage = 5
			EndIf	
		ElseIf aiMessage == 10 ;Solitude Inn (2)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu114.Show()
			If aiButton == -1
			ElseIf aiButton < 2
				iTavernIndex = aiButton + 7
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 2
				aiMessage = 5
			EndIf
		ElseIf aiMessage == 11 ;Windhelm Inn (2)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu115.Show()
			If aiButton == -1
			ElseIf aiButton < 2
				iTavernIndex = aiButton + 9
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 2
				aiMessage = 5
			EndIf
		ElseIf aiMessage == 12 ;Winterhold Inn (1)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu116.Show()
			If aiButton == -1
			ElseIf aiButton < 1
				iTavernIndex = aiButton + 11
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 1
				aiMessage = 5
			EndIf
		ElseIf aiMessage == 13 ;Raven Rock Inn (1)
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu117.Show()
			If aiButton == -1
			ElseIf aiButton < 1
				iTavernIndex = aiButton + 12
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 1
				aiMessage = 5
			EndIf
		ElseIf aiMessage == 14
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu118.Show()
			If aiButton == -1
			ElseIf aiButton == 0 ;morthal inn
				aiMessage = 15
			ElseIf aiButton == 1 ;dawnstar inn
				aiMessage = 16
			ElseIf aiButton == 2
				iTavernIndex = ConfigMenu.getNearbyInnRPIndex()
				Return ConfigMenu.getTavernRPIndex()		
			ElseIf aiButton == 3
				iTavernIndex = ConfigMenu.getRandInnRPIndex()
				Return ConfigMenu.getTavernRPIndex()				
			ElseIf aiButton == 4 ;Less
				aiMessage = 5
			ElseIf aiButton == 5 ;Back
				aiMessage = 1
			EndIf
		ElseIf aiMessage == 15
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu1180.Show() ;Morthal Inn (1)
			If aiButton == -1
			ElseIf aiButton < 1
				iTavernIndex = aiButton + 13
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 1
				aiMessage = 5
			EndIf	
		ElseIf aiMessage == 16
			aiButton = ReviveScript.RespawnScript.moaRespawnMenu1181.Show() ;Dawnstar Inn (2)
			If aiButton == -1
			ElseIf aiButton < 2
				iTavernIndex = aiButton + 14
				Return ConfigMenu.getTavernRPIndex()
			ElseIf aiButton == 2
				aiMessage = 5
			EndIf
		EndIf
	EndWhile
EndFunction

Bool Function bMoveByQuest(Quest aTargetDetector, ReferenceAlias akTarget, Int aiTry = 1)
	Int i = aiTry
	Int j
	ObjectReference Marker
	While i > 0
		i -= 1
		If !aTargetDetector.IsRunning()
			aTargetDetector.Start()
		Else
			j = 0
			aTargetDetector.Stop()
			While !aTargetDetector.IsStopped() && j < 30
				Utility.Wait(0.1)
				j += 1
			EndWhile
			aTargetDetector.Start()
		EndIf
		If aTargetDetector.IsRunning()
			If (!Marker || (Marker != (akTarget.GetReference() As ObjectReference)))
				Marker = akTarget.GetReference() As ObjectReference
				If Marker
					Caster.MoveTo(Marker)
					aTargetDetector.Stop()
					Return True
				EndIf
			EndIf
		EndIf
	EndWhile
	aTargetDetector.Stop()
	Return False
Endfunction

Function sendToTOW()
	Caster.MoveTo(TOWMarker)
Endfunction

Bool Function bSendToExternalMarker(Int iExternalIndex)
	If MergedExternalMarkerList.GetSize() > 0
		If MergedExternalMarkerList.GetSize() > 1  && (( iExternalIndex == -1 || ( iExternalIndex >= MergedExternalMarkerList.GetSize() )) || ( !ReviveScript.RespawnScript.bCanTeleportToExtMarker( MergedExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) || ( MergedExternalMarkerList.GetAt( iExternalIndex ).GetType() != 61 )))
			iMarkerIndex = ReviveScript.RespawnScript.iGetRandomRefFromListWithExclusions(0, MergedExternalMarkerList.GetSize() - 1, MergedExternalMarkerList)
			If iMarkerIndex != -1
				Caster.MoveTo(  MergedExternalMarkerList.GetAt(iMarkerIndex) As ObjectReference, abMatchRotation = true )
				Return True
			EndIf
		ElseIf ( ( MergedExternalMarkerList.GetAt( iExternalIndex ).GetType() == 61 ) && ( ReviveScript.RespawnScript.bCanTeleportToExtMarker( MergedExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) ) )
			Caster.MoveTo(  MergedExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference, abMatchRotation = true )	
			Return True
		EndIf
	EndIf
	Return False
EndFunction

Bool Function bSendToCustomMarker(Int iSlot)
	Int iSelectedSlot = iSlot
	Int i = iSelectedSlot
	If ConfigMenu.isCustomSlotAvailable(i) && !ConfigMenu.isCustomSlotEmpty(i)
		Caster.MoveTo((CustomRespawnPoints.GetAt(i) As ObjectReference), abMatchRotation = true)
		Return True
	EndIf
	i = 0
	While i < CustomRespawnPoints.getSize()
		If i != iSelectedSlot
			If ConfigMenu.isCustomSlotAvailable(i) && !ConfigMenu.isCustomSlotEmpty(i)
				Caster.MoveTo((CustomRespawnPoints.GetAt(i) As ObjectReference), abMatchRotation = true)
				Return True
			EndIf
		EndIf
		i += 1
	EndWhile
	Return False
EndFunction

Bool Function bSendToSleepMarker()
	If !SleepMarker.IsDisabled() && (SleepMarker.GetParentCell() != ReviveScript.DefaultCell)
		Caster.MoveTo(SleepMarker, abMatchRotation = true)
		Return True
	EndIf
	Return False
EndFunction
