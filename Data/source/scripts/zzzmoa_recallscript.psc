Scriptname zzzmoa_RecallScript extends activemagiceffect

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
FormList property MarkerList Auto
Formlist property ExternalMarkerList Auto
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
Actor Caster
Int iMarkerIndex

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( !ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled() ) 
		If ( akCaster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider )
			Caster = akCaster
			Int iTeleportLocation = ConfigMenu.iTeleportLocation
			Int iExternalIndex = ConfigMenu.iExternalIndex
			Int iCustomRPSlot = ConfigMenu.iSelectedCustomRPSlot
			If ( ConfigMenu.bTeleportMenu )
				ReviveScript.RespawnScript.moaERPCount.SetValue(ExternalMarkerList.GetSize())
				Utility.Wait(0.5)
				iTeleportLocation = TeleportMenu() ;-1-> exxternal and random | > total sRespawnPoints -> external && not random | < -2 -> custom | -2 -> cancel
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
				If iTeleportLocation < ConfigMenu.getRandCityRPIndex()
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
				ElseIf iTeleportLocation == ConfigMenu.getRandCityRPIndex()
					SendToRandomCity()
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
	While iIndex < ConfigMenu.bRespawnPointsFlags.Length
		If ConfigMenu.bRespawnPointsFlags[iIndex] && Caster.GetDistance(MarkerList.GetAt(iIndex) As Objectreference) >= ConfigMenu.fRPMinDistanceSlider
			Destinations.AddForm(MarkerList.GetAt(iIndex) As Objectreference)
		EndIf
		iIndex += 1
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
	If ExternalMarkerList.GetSize() > 0
		iIndex = ExternalMarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If !(( ExternalMarkerList.GetAt( iIndex ).GetType() != 61 ) || \
			!ReviveScript.RespawnScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) || \
			( Caster.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < ConfigMenu.fRPMinDistanceSlider ))
				Destinations.AddForm(ExternalMarkerList.GetAt( iIndex ) As ObjectReference)
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

Function SendToAnotherLocation()
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
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
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
	SendToRandomCity()
EndFunction

Function SendToNearbyLocation()
		PlayerMarker.Enable()
		PlayerMarker.MoveTo(Caster)
		PlayerMarker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
		PlayerMarker.SetAngle(0.0, 0.0, Caster.GetAnglez())
		If !bMoveByQuest(moaNearbyDetector,TeleportRef, 5)
			SendToCheckPoint()
		EndIf
		PlayerMarker.MoveToMyEditorLocation()
		PlayerMarker.Disable()
Endfunction

Function SendToCheckPoint()
	Float fDistance
	ObjectReference Marker
	DynamicMarkerList = New ObjectReference[11]
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
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If ( ExternalMarkerList.GetAt( iIndex ).GetType() == 61 ) 
				If ReviveScript.RespawnScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					If ( Caster.GetParentCell() == ( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ).GetParentCell() )
						If ( !fDistance || ( fDistance > Caster.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
							If ( Caster.GetDistance(ExternalMarkerList.GetAt( iIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
								fDistance = Caster.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
								Marker = ExternalMarkerList.GetAt( iIndex ) As ObjectReference
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
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If ( ExternalMarkerList.GetAt( iIndex ).GetType() == 61 ) 
				If ReviveScript.RespawnScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					If bInSameLocation( ( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ).GetCurrentLocation() )
						If ( Caster.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider )
							Caster.MoveTo( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
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
			ElseIf aiButton < ConfigMenu.getRandCityRPIndex() ;Whiterun,...,Raven Rock
				Return aiButton
			ElseIf aiButton == ConfigMenu.getRandCityRPIndex() ;More
				aiMessage = 1
			ElseIf aiButton == (ConfigMenu.getRandCityRPIndex() + 1) ;Cancel
				Return -2
			EndIf
		ElseIf aiMessage == 1
			aiButton = moaTeleportMenu1.Show()
			If aiButton == -1
			ElseIf aiButton == 2 ;Custom
				aiMessage = 2
			ElseIf aiButton == 3 ;External
				aiMessage = 3
			ElseIf aiButton < 8 ;Random City,...,Throat of the World
				Return aiButton + ConfigMenu.getRandCityRPIndex()
			ElseIf aiButton == 8 ;Less
				aiMessage = 0
			EndIf
		ElseIf aiMessage == 2 ;Custom
			aiButton = moaCustomRecallMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
			If aiButton == -1
			ElseIf aiButton == 3 ;Details
				ConfigMenu.ShowCustomSlotsInfo()
			ElseIf aiButton == 4 ;Back
				aiMessage = 1
			ElseIf aiButton == 5 ;Cancel
				Return -2
			Else
				Return -3 - aiButton ;0-> -3, 1-> -4, 2-> -5
			EndIf			
		ElseIf aiMessage == 3
			If ExternalMarkerList.GetSize() > 8
				aiButton = ReviveScript.RespawnScript.moaRespawnMenu13_Alt.Show(iIndex)
				If aiButton == -1
				ElseIf aiButton == 0 ;Prev
					iIndex = ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),-1)
				ElseIf aiButton == 1 ;Next 
					iIndex = ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),1)
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
	If ExternalMarkerList.GetSize() > 0
		If ExternalMarkerList.GetSize() > 1  && ( iExternalIndex == -1 || ( iExternalIndex >= ExternalMarkerList.GetSize() ) || ( !ReviveScript.RespawnScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) || ( ExternalMarkerList.GetAt( iExternalIndex ).GetType() != 61 ) ) )
			iMarkerIndex = ReviveScript.RespawnScript.iGetRandomRefFromListWithExclusions(0, ExternalMarkerList.GetSize() - 1, ExternalMarkerList)
			If iMarkerIndex != -1
				Caster.MoveTo(  ExternalMarkerList.GetAt(iMarkerIndex) As ObjectReference, abMatchRotation = true )
				Return True
			EndIf
		ElseIf ( ( ExternalMarkerList.GetAt( iExternalIndex ).GetType() == 61 ) && ( ReviveScript.RespawnScript.bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) ) )
			Caster.MoveTo(  ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference, abMatchRotation = true )	
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
