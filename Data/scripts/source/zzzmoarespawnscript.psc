Scriptname zzzmoarespawnscript extends Quest

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
FormList property WorldspacesInterior auto
Formlist property ExternalMarkerList Auto
Formlist Property Destinations Auto
Formlist Property DisabledLocations Auto
Formlist Property TeleportDestination Auto
Formlist Property FailedDestinations Auto
FormList property MarkerList Auto
FormList Property QuestBlackList Auto
FormList Property LocationBlackList Auto
FormList Property LocationsList Auto
Formlist Property CityMarkersList Auto
Location Property PaleHoldLocation  Auto
Location Property HjaalmarchHoldLocation  Auto
Location Property DLC1VampireCastleLocation Auto
Location Property DLC1HunterHQLocation Auto
Location Property TamrielLocation Auto
Keyword property HoldKeyword Auto
ObjectReference Property PlayerMarker Auto
ObjectReference Property SleepMarker Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker3 Auto
Objectreference Property CellLoadMarker Auto
ObjectReference Property LocationMarker Auto
Objectreference Property CellLoadMarker2 Auto
ObjectReference Property LocationMarker2 Auto
Objectreference Property RiftenJailMarker Auto
Objectreference Property WhiterunJailMarker Auto
Objectreference Property FalkreathJailMarker Auto
Objectreference Property WindhelmJailMarker Auto
Objectreference Property MarkarthJailMarker Auto
Objectreference Property WinterholdJailMarker Auto
Objectreference Property DawnstarJailMarker Auto
Objectreference Property MorthalJailMarker Auto
Objectreference Property SolitudeJailMarker Auto
Objectreference Property DLC2RavenRockJailMarker Auto
Faction Property CrimeFactionPale  Auto
Faction Property CrimeFactionFalkreath  Auto
Faction Property CrimeFactionReach  Auto
Faction Property CrimeFactionHjaalmarch  Auto
Faction Property CrimeFactionHaafingar  Auto
Faction Property CrimeFactionRift  Auto
Faction Property CrimeFactionWhiterun  Auto
Faction Property CrimeFactionEastmarch  Auto
Faction Property CrimeFactionWinterhold  Auto
Faction Property DLC2CrimeRavenRockFaction Auto
Message Property moaRespawnMenu0 Auto
Message Property moaRespawnMenu1 Auto
Message Property moaRespawnMenu13 Auto
Message Property moaRespawnMenu13_Alt Auto
Message Property moaCustomRespawnMenu Auto
GlobalVariable Property moaERPCount Auto
Int Property iTeleportLocation Auto Hidden
Int Property iCustomRPSlot Auto Hidden
Int Property iExternalIndex Auto Hidden
Actor Property PlayerRef Auto
Float Property fRPMinDistance = 2500.0 Auto Hidden
ObjectReference[] Property DynamicMarkerList Auto Hidden
ObjectReference[] Property ExcludedMarkerList Auto Hidden
Quest Property moaNearbyDetector Auto
Quest Property moaRandomCityDetector Auto
Quest Property moaRandomMarkerDetector Auto
ReferenceAlias Property TeleportRef Auto
ReferenceAlias Property RandomTeleportRef Auto
ReferenceAlias Property RandomCityTeleportRef Auto
GlobalVariable Property TimeScale Auto
GlobalVariable Property moaRandomDestination Auto
Float Property DefaultTimeScale = 20.0 Auto Hidden
FormList Property InteriorMarkers Auto
FormList Property ExteriorMarkers Auto
ObjectReference Property TOWMarker Auto
FormList property CustomRespawnPoints Auto
ReferenceAlias Property PlayerRefMarker Auto
Bool bFirstTry = False
Bool bFirstTryFailed = False


Function SetVars()
	fRPMinDistance = ConfigMenu.fRPMinDistanceSlider
	iTeleportLocation = ConfigMenu.iTeleportLocation
	iExternalIndex = ConfigMenu.iExternalIndex
	iCustomRPSlot = ConfigMenu.iSelectedCustomRPSlot
Endfunction

Function RandomTeleport()
	If ConfigMenu.bMoreRandomRespawn
		DisabledLocations.Revert()
		Int i = LocationsList.GetSize()
		While i > 0
			i -= 1
			If !ConfigMenu.bRespawnPointsFlags[i]
				DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
			EndIf
		Endwhile
		If bTryToMoveByQuest(moaRandomMarkerDetector,RandomTeleportRef, 7, FailedDestinations)
			Return
		EndIf
	EndIf
	Destinations.Revert()
	int iIndex = 0
	Int iRandom = 0
	While iIndex < ConfigMenu.bRespawnPointsFlags.Length
		If ConfigMenu.bRespawnPointsFlags[iIndex] && PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As Objectreference) >= fRPMinDistance
			Destinations.AddForm(MarkerList.GetAt(iIndex) As Objectreference)
		EndIf
		iIndex += 1
	Endwhile
	If bCanTeleportToDynMarker(SleepMarker) && PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance
		Destinations.AddForm(SleepMarker)
	EndIf
	iIndex = 0
	While iIndex < CustomRespawnPoints.GetSize()
		If bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
			If PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference) >= fRPMinDistance
				Destinations.AddForm(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
			EndIf
		EndIf
		iIndex += 1
	Endwhile
	If ExternalMarkerList.GetSize() > 0
		iIndex = ExternalMarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If !(( ExternalMarkerList.GetAt( iIndex ).GetType() != 61 ) || \
			!bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) || \
			( PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < fRPMinDistance ))
				Destinations.AddForm(ExternalMarkerList.GetAt( iIndex ) As ObjectReference)
			EndIf
		EndWhile
	EndIf
	If bCanTeleportToDynMarker(CellLoadMarker2) && PlayerMarker.GetDistance(CellLoadMarker2) >= fRPMinDistance
		Destinations.AddForm(CellLoadMarker2)
	EndIf
	If bCanTeleportToDynMarker(DetachMarker3) && PlayerMarker.GetDistance(DetachMarker3) >= fRPMinDistance
		Destinations.AddForm(DetachMarker3)
	EndIf
	If bCanTeleportToDynMarker(LocationMarker2) && PlayerMarker.GetDistance(LocationMarker2) >= fRPMinDistance
		Destinations.AddForm(LocationMarker2)
	EndIf
	If bCanTeleportToDynMarker(CellLoadMarker) && PlayerMarker.GetDistance(CellLoadMarker) >= fRPMinDistance
		Destinations.AddForm(CellLoadMarker)
	EndIf
	If bCanTeleportToDynMarker(LocationMarker) && PlayerMarker.GetDistance(LocationMarker) >= fRPMinDistance
		Destinations.AddForm(LocationMarker)
	EndIf
	If bCanTeleportToDynMarker(DetachMarker1) && PlayerMarker.GetDistance(DetachMarker1) >= fRPMinDistance
		Destinations.AddForm(DetachMarker1)
	EndIf
	If bCanTeleportToDynMarker(DetachMarker2) && PlayerMarker.GetDistance(DetachMarker2) >= fRPMinDistance
		Destinations.AddForm(DetachMarker2)
	EndIf
	iIndex = Destinations.GetSize()
	While iIndex > 0
		iRandom = Utility.RandomInt(0, Destinations.GetSize() - 1)
		If bIsArrived(Destinations.GetAt(iRandom) As ObjectReference)
			Return
		Else
			Destinations.RemoveAddedForm(Destinations.GetAt(iRandom))
		EndIf
		iIndex -= 1
	EndWhile
	If !bSendToTOW()
		SendToDefaultMarker()
	EndIf
EndFunction

Bool Function bTryToMoveByQuest(Quest aTargetDetector, ReferenceAlias akTarget, Int aiTry = 1, FormList akFailedTargets = None)
	Int i = aiTry
	Int j
	ObjectReference Marker
	If akFailedTargets
		akFailedTargets.Revert()
	EndIf
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
					If bIsArrived(Marker)
						If akFailedTargets
							akFailedTargets.Revert()
						EndIf
						aTargetDetector.Stop()
						Return True
					ElseIf akFailedTargets && !akFailedTargets.HasForm(Marker)
						akFailedTargets.AddForm(Marker)
					EndIf
				EndIf
			EndIf
		EndIf
	EndWhile
	If akFailedTargets
		akFailedTargets.Revert()
	EndIf
	aTargetDetector.Stop()
	Return False
Endfunction

Bool Function bIsTeleportSafe(ObjectReference akMarker)
	If bFirstTryFailed
		bFirstTryFailed = False
		Return False
	EndIf
	Return !(PlayerRef.GetAnimationVariableBool("bIsSynced") || PlayerRef.GetActorValue("paralysis"))
EndFunction

Bool Function bIsArrived(ObjectReference akMarker)
	Float fMinDistance = 1000.0
	If ConfigMenu.bIsRagdollEnabled
		fMinDistance = 4000.0
	EndIf
	PlayerRef.DispelAllSpells()
	If PlayerRef.IsBleedingOut() || (PlayerRef.GetActorValue("Health") < PlayerRef.GetBaseActorValue("Health"))
		PlayerRef.DispelSpell(ReviveScript.Bleed)
		PlayerRef.ResetHealthAndLimbs()
		PlayerRef.RestoreActorValue("health",10000)
	EndIf
	If !ReviveScript.bIsCameraStateSafe()
		Game.ForceThirdPerson()
	EndIf
	If !bIsTeleportSafe(akMarker)
		If PlayerRef.GetActorValue("paralysis")
			PlayerRef.SetActorValue("paralysis",0)
			If PlayerRef.GetActorValue("paralysis")
				PlayerRef.ForceActorValue("paralysis",0)
			EndIf
			Utility.Wait(6.5)
		EndIf
		Float i = 5.0
		While ( !bIsTeleportSafe(akMarker) && ( i > 0.0 ))
			Utility.Wait(0.2)
			i -= 0.2
		Endwhile
	EndIf
	Float fTravel = PlayerMarker.GetDistance(akMarker)
	PlayerRef.MoveTo(akMarker,afZOffset = 15.0)
	Utility.Wait(0.5)
	Float fFrom = PlayerRef.GetDistance(PlayerMarker)
	Float fTo = PlayerRef.GetDistance(akMarker)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance between two Points: "+ fTravel)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance Traveled: "+ fFrom)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance from Destination: "+ fTo)
	
	If fTo < fMinDistance
		If fTravel < 1500.0 || fFrom > fTo
			If bFirstTry
				bFirstTry = False
			EndIf
			Return True
		EndIf
	EndIf
	If bFirstTry
		bFirstTryFailed = True
		bFirstTry = False
	EndIf
	Return False
EndFunction

Bool Function bSendToSleepMarker()
	If bCanTeleportToDynMarker(SleepMarker)
		If PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance
			Return bIsArrived(SleepMarker)
		EndIf
	EndIf
	Return False
Endfunction

Bool Function bSendToCustomMarker(Int iSlot)
	Int iSelectedSlot = iSlot
	Int i = iSelectedSlot
	If bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(i) As ObjectReference)
		If PlayerRef.GetDistance(CustomRespawnPoints.GetAt(i) As ObjectReference) >= fRPMinDistance
			If bIsArrived(CustomRespawnPoints.GetAt(i) As ObjectReference)
				Return True
			EndIf
		EndIf
	EndIf
	i = 0
	While i < CustomRespawnPoints.getSize()
		If i != iSelectedSlot
			If bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(i) As ObjectReference)
				If PlayerRef.GetDistance(CustomRespawnPoints.GetAt(i) As ObjectReference) >= fRPMinDistance
					If bIsArrived(CustomRespawnPoints.GetAt(i) As ObjectReference)
						Return True
					EndIf
				EndIf
			EndIf
		EndIf
		i += 1
	EndWhile
	Return False
EndFunction

Function SendToDefaultMarker()
	If ConfigMenu.bKillIfCantRespawn
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is dying because respawn is not possible.")
		PlayerRef.EndDeferredKill()
		Utility.Wait(0.1)
		If !PlayerRef.IsDead()
			killPlayer()
		EndIf
	Else
		If PlayerMarker.GetParentCell() != ReviveScript.DefaultCell
			bIsArrived(PlayerMarker)
		Else
			bIsArrived(PlayerRef As ObjectReference)
		EndIf
	EndIf
Endfunction

Bool Function bSendToTOW()
	Return (PlayerRef.GetDistance(TOWMarker) >= fRPMinDistance) && bIsArrived(TOWMarker)
Endfunction

Bool Function bSendToExternalMarker(Int iExternalIndex)
	If ExternalMarkerList.GetSize() > 0
		If ( ExternalMarkerList.GetSize() > 1 ) && ( iExternalIndex == -1 || ( iExternalIndex >= ExternalMarkerList.GetSize() ) ||\
		( !bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) ||\
		(PlayerRef.GetDistance(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference) < fRPMinDistance) ||\
		( ExternalMarkerList.GetAt( iExternalIndex ).GetType() != 61 ) ) )
			Int iMarkerIndex = iGetRandomRefFromListWithExclusions( 0, ExternalMarkerList.GetSize() - 1, ExternalMarkerList )
			If iMarkerIndex != -1
				If bIsArrived(ExternalMarkerList.GetAt( iMarkerIndex ) As ObjectReference)
					Return True
				EndIf
			EndIf
		ElseIf ( bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) &&\
		(PlayerRef.GetDistance(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference) >= fRPMinDistance) &&\
		( ExternalMarkerList.GetAt( iExternalIndex ).GetType() == 61 ) )
			If bIsArrived(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference)
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction


Function Teleport()
	PlayerMarker.Enable()
	PlayerMarker.MoveTo(playerRef)
	PlayerMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
	PlayerMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
	If iTeleportLocation < (ConfigMenu.getNearbyCityRPIndex())
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
			If bTryToMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 7, FailedDestinations)
				Return
			EndIf
		EndIf
		If (PlayerRef.GetDistance(MarkerList.GetAt(iTeleportLocation) As Objectreference) >= fRPMinDistance)
			If !bIsArrived(MarkerList.GetAt(iTeleportLocation) As Objectreference)
				SendToAnotherLocation()
			EndIf 
		Else
			 SendToAnotherLocation()
		EndIf
	ElseIf iTeleportLocation == (ConfigMenu.getNearbyCityRPIndex())
		sendToNearbyCity()
	ElseIf iTeleportLocation == (ConfigMenu.getRandCityRPIndex())
		sendToRandomCity()
	ElseIf iTeleportLocation == (ConfigMenu.getSleepRPIndex())
		If !bSendToSleepMarker()
			If !bSendToCustomMarker(iCustomRPSlot)
				SendToAnotherLocation()	
			EndIf
		EndIf
	ElseIf iTeleportLocation == (ConfigMenu.getCustomRPIndex())
		If !bSendToCustomMarker(iCustomRPSlot)
			If !bSendToSleepMarker()
				SendToAnotherLocation()	
			EndIf
		EndIf
	ElseIf iTeleportLocation == (ConfigMenu.getExternalRPIndex())
		If !bSendToExternalMarker(iExternalIndex)
			If !bSendToSleepMarker()
				If !bSendToCustomMarker(iCustomRPSlot)
					SendToAnotherLocation()	
				EndIf
			EndIf
		EndIf
	ElseIf iTeleportLocation == (ConfigMenu.getCheckpointRPIndex())
		SendToCheckPoint()
	ElseIf iTeleportLocation == (ConfigMenu.getNearbyRPIndex())
		SendToNearbyLocation()	
	ElseIf iTeleportLocation == (ConfigMenu.getRandomRPIndex())
		RandomTeleport()
	ElseIf iTeleportLocation == (ConfigMenu.getThroatRPIndex())
		If !bSendToTOW()
			SendToAnotherLocation()	
		EndIf
	EndIf
	PlayerMarker.MoveToMyEditorLocation()
	PlayerMarker.Disable()
EndFunction

Bool Function bIsCurrentCell(int iIndex)
	Return ((( MarkerList.GetAt(iIndex))  As Objectreference ).GetParentCell() == PlayerMarker.GetParentCell() )
EndFunction

Bool Function bCanTeleport()
	Int iIndex = QuestBlackList.GetSize()
	While iIndex > 0
		iIndex -= 1
		Quest ForbidenQuest = QuestBlackList.GetAt(iIndex) As Quest
		If ForbidenQuest
			If ForbidenQuest.IsRunning()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't Respawn while " + ForbidenQuest + " is running.")
				Return False
			EndIf
		EndIf
	EndWhile
	Location CurrLoc = PlayerRef.GetCurrentLocation()
	If CurrLoc
		If CurrLoc.HasKeywordString("loctypejail")
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn from jail is disabled.")
			Return False
		EndIf
		If bIsLocForbidden(CurrLoc)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn from " + CurrLoc + " is disabled.")
			Return False
		EndIf
	EndIf
	Return True
EndFunction

Bool Function bCanTeleportToExtMarker( Objectreference ExternalMarker )
	If ExternalMarker
		Int iIndex = LocationBlackList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ExternalMarker.IsInLocation(LocationBlackList.GetAt(iIndex) As Location)
				Return False
			EndIf
		EndWhile
		If ( !ExternalMarker.IsDisabled() && ( ExternalMarker.GetParentCell() != ReviveScript.DefaultCell ) )
			Return True
		EndIf
	EndIf
	Return False
EndFunction


Bool Function bIsLocForbidden(Location akLoc)
	Int iIndex = LocationBlackList.GetSize()
	While iIndex > 0
		iIndex -= 1
		Location ForbiddenLocation = LocationBlackList.GetAt(iIndex) As Location
		If ForbiddenLocation
			If akLoc == ForbiddenLocation || ForbiddenLocation.IsChild(akLoc)
				Return True
			EndIf
		EndIf
	EndWhile
	Return False
Endfunction

Bool Function bCanTeleportToDynMarker(Objectreference Marker)
	If Marker 
		Location CurrLoc = Marker.GetCurrentLocation()
		If CurrLoc && (CurrLoc.HasKeywordString("loctypejail") || bIsLocForbidden(CurrLoc))
			Return False
		EndIf	
		If !Marker.IsDisabled()
			If ( Marker.GetParentCell() != ReviveScript.DefaultCell )
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Int Function iGetRandomRefFromListWithExclusions( Int iFrom, Int iTo, Formlist RefList) 
	Int ExcludeCount = 0
	int iIndex = 0
	Int iRandom = 0
	ObjectReference MarkerRef
	While iIndex < RefList.GetSize()
		If RefList.GetAt(iIndex).GetType() != 61
			ExcludeCount += 1
		Else
			MarkerRef = ( RefList.GetAt(iIndex) As ObjectReference )
			If ( !bCanTeleportToExtMarker( MarkerRef ) || BIsRefInCurrentCell( MarkerRef ) )
				ExcludeCount += 1
			EndIf
		EndIf
		iIndex += 1
	Endwhile
	If ( ExcludeCount == RefList.GetSize() )
		Return -1
	EndIf
	iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = 0 
	 While ( iIndex < RefList.GetSize() )
		MarkerRef = ( RefList.GetAt(iIndex) As ObjectReference )
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (( RefList.GetAt(iIndex).GetType() != 61 ) || !bCanTeleportToExtMarker( MarkerRef ) || BIsRefInCurrentCell( MarkerRef ) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Bool Function BIsRefInCurrentCell ( ObjectReference MarkerRef)
	Return (( MarkerRef ).GetParentCell() == PlayerRef.GetParentCell() )
EndFunction

Function sendToRandomCity()
	Int i
	If ConfigMenu.bMoreRandomRespawn
		moaRandomDestination.SetValueInt(1)
		DisabledLocations.Revert()
		i = LocationsList.GetSize()
		While i > 0
			i -= 1
			If !ConfigMenu.bRespawnPointsFlags[i]
				DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
			EndIf
		Endwhile
		If bTryToMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 7, FailedDestinations)
			Return
		EndIf
	EndIf
	i = iGetRandomWithExclusionArray(0, ( MarkerList.GetSize() - 1 ), ConfigMenu.bRespawnPointsFlags)
	If i > -1
		bIsArrived( MarkerList.GetAt(i) As Objectreference )
	Else
		SendToDefaultMarker()
	EndIf
EndFunction

ObjectReference Function FindCityMarkerByLocation()
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If (iIndex == 3)
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 4 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						Return MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
					Return MarkerList.GetAt(iIndex) As ObjectReference
				EndIf
			EndIf
		EndIf
	EndWhile
	Return None
Endfunction

Function SendToNearbyCity()
	ObjectReference Marker = FindCityMarkerByLocation()
	If Marker && bIsArrived(Marker)
		Return 
	EndIf
	If !IsInInteriorActual(PlayerMarker)
		Marker = FindCityMarkerByDistance(500000.0)
		If Marker && bIsArrived(Marker)
			Return 
		EndIf
	EndIf
	sendToRandomCity()
Endfunction

Function SendToAnotherLocation()
	ObjectReference Marker = FindCityMarkerByLocation()
	If Marker && bIsArrived(Marker)
		Return 
	EndIf
	sendToRandomCity()
EndFunction

Bool Function IsInInteriorActual(ObjectReference akObjectReference)
    If akObjectReference.IsInInterior()
	    Return True
	EndIf
    If WorldspacesInterior.HasForm(akObjectReference.GetWorldSpace())
		Return True
	EndIf
	Return False
EndFunction

Bool Function bInSameLocation(Location akLoc, ObjectReference akMarker = None)
    If akLoc
		If !akMarker
			akMarker = PlayerMarker
		EndIf
		If akMarker.IsInLocation(akLoc)
			Return True
		EndIf
		If akMarker.GetCurrentLocation()
			If akMarker.GetCurrentLocation().IsSameLocation(akLoc,HoldKeyword)
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

ObjectReference Function FindMarkerByDistance()
	Float fDistance
	ObjectReference Marker
	Int iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0 )
			If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == DynamicMarkerList[iIndex].GetParentCell() ) )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(DynamicMarkerList[iIndex]) ) ) 
					fDistance = PlayerMarker.GetDistance(DynamicMarkerList[iIndex])
					Marker = DynamicMarkerList[iIndex]
				EndIf
			EndIf
		EndIf			
	Endwhile
	If ( Marker && fDistance && fDistance <= 50000.0 )
		Return Marker
	EndIf
	Return None
EndFunction

ObjectReference Function FindCityMarkerByDistance(float fMaxDistance = 100000.0)
	float fDistance
	ObjectReference Marker
	Int iIndex
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If( ExcludedMarkerList.find( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < 0 )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
					fDistance = PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					Marker = ExternalMarkerList.GetAt( iIndex ) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If PlayerMarker.IsInInterior()
		iIndex = MarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetParentCell() == ( MarkerList.GetAt(iIndex) As ObjectReference ).GetParentCell() )
					If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
						If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) ) )
							fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
							Marker = MarkerList.GetAt(iIndex) As ObjectReference
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile
	Else
		iIndex = CityMarkersList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) )
					fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
					Marker = MarkerList.GetAt(iIndex) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If ( Marker && fDistance && fDistance <= fMaxDistance )
		Return Marker
	EndIf
	Return None
Endfunction

ObjectReference Function FindMarkerByLocation()
	Int iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0 )
			If ( iIndex >= ( DynamicMarkerList.Length - 2 )) ;DetachMarker2 or DetachMarker1
				If ( bInSameLocation( DynamicMarkerList[iIndex].GetCurrentLocation() ) ||\
				( IsInInteriorActual(PlayerMarker) != IsInInteriorActual(DynamicMarkerList[iIndex]) ) ) 
					Return DynamicMarkerList[iIndex]
				EndIf
			Else
				If bInSameLocation( DynamicMarkerList[iIndex].GetCurrentLocation() )
					Return DynamicMarkerList[iIndex]
				EndIf
			EndIf
		EndIf
	Endwhile
	iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0 )
			If (iIndex == 3)
				If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf ( iIndex == 4 )
				If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf ( iIndex == 6 )
				If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					Return ( MarkerList.GetAt(iIndex) As ObjectReference )
				EndIf
			EndIf
		EndIf
	EndWhile
	If ExternalMarkerList.GetSize() > 0
		Int jIndex = iMin(100, ExternalMarkerList.GetSize())
		While jIndex > 0
			jIndex -= 1
			If ( ExcludedMarkerList.find(ExternalMarkerList.GetAt( jIndex ) As ObjectReference) < 0 )
				If bInSameLocation( ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetCurrentLocation() )
					Return ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
				EndIf
			EndIf
		EndWhile	
	EndIf
EndFunction

ObjectReference Function FindMarkerByOrder()
	If ( ExcludedMarkerList.find(DetachMarker2) < 0 )
		Return DetachMarker2
	EndIf
	If ( ExcludedMarkerList.find(DetachMarker1) < 0 )
		Return DetachMarker1
	EndIf
	If ( ExcludedMarkerList.find(LocationMarker) < 0 )
		Return LocationMarker
	EndIf
	If ( ExcludedMarkerList.find(CellLoadMarker) < 0 )
		Return CellLoadMarker
	EndIf
	If ( ExcludedMarkerList.find(LocationMarker2) < 0 )
		Return LocationMarker2
	EndIf
	If ( ExcludedMarkerList.find(DetachMarker3) < 0 )
			Return DetachMarker3
	EndIf
	If ( ExcludedMarkerList.find(CellLoadMarker2) < 0 )
			Return CellLoadMarker2
	EndIf
	Return None
EndFunction

Bool Function TryToMoveByDistanceFar()
	float fDistance
	ObjectReference Marker
	Int iIndex
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100, ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If( ExcludedMarkerList.find( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < 0 )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
					fDistance = PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					Marker = ExternalMarkerList.GetAt( iIndex ) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If PlayerMarker.IsInInterior()
		iIndex = MarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetParentCell() == ( MarkerList.GetAt(iIndex) As ObjectReference ).GetParentCell() )
					If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
						If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) ) )
							fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
							Marker = MarkerList.GetAt(iIndex) As ObjectReference
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile
	Else
		iIndex = CityMarkersList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
					If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) ) 
						fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
						Marker = MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			EndIf
		EndWhile
	EndIf
	iIndex = 0
	While iIndex < CustomRespawnPoints.getSize()
		If ( ExcludedMarkerList.find(CustomRespawnPoints.GetAt(iIndex) As ObjectReference) < 0 )
			If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == (CustomRespawnPoints.GetAt(iIndex) As ObjectReference).GetParentCell() ) )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference) ) )
					fDistance = PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
					Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
				EndIf
			EndIf
		EndIf
		iIndex += 1
	EndWhile
	If ( ExcludedMarkerList.find(SleepMarker) < 0 )
		If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == SleepMarker.GetParentCell() ) )
			If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(SleepMarker) ) ) 
				fDistance = PlayerMarker.GetDistance(SleepMarker)
				Marker = SleepMarker
			EndIf
		EndIf
	EndIf
	If ( Marker && fDistance && fDistance <= 500000.0 )
		If bIsArrived(Marker)
			Return True
		EndIf
		Int i = ExcludedMarkerList.Find(None)
		If i > -1
			ExcludedMarkerList[i] = Marker
		EndIf
	EndIf
	Return False
EndFunction

Bool Function TryToMoveByDistanceNear()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 9 )
		i += 1
		Marker = FindMarkerByDistance()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByLocation()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 12 )
		i += 1
		Marker = FindMarkerByLocation()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByOrder()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 7 )
		i += 1
		Marker = FindMarkerByOrder()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByDistanceCity()
	ObjectReference Marker
	Marker = FindCityMarkerByDistance()
	If Marker
		If bIsArrived(Marker)
			Return True
		EndIf
		Int i = ExcludedMarkerList.Find(None)
		If i > -1
			ExcludedMarkerList[i] = Marker
		EndIf
	EndIf
	Return False
EndFunction

Function InitializeExcludedMarkers()
	 ExcludedMarkerList = New ObjectReference[128]
	Int i
	int j = DynamicMarkerList.Length
	While j > 0
		j -= 1
		If ( !bCanTeleportToDynMarker(DynamicMarkerList[j]) ||\
		( PlayerMarker.GetDistance(DynamicMarkerList[j]) < fRPMinDistance ))
			i = ExcludedMarkerList.Find(None)
			If i > -1
				ExcludedMarkerList[i] = DynamicMarkerList[j]
			EndIf
		EndIf
	Endwhile
	j = MarkerList.GetSize()
	While j > 0
		j -= 1
		If ( PlayerMarker.GetDistance( MarkerList.GetAt( j ) As ObjectReference ) < fRPMinDistance )
			i = ExcludedMarkerList.Find(None)
			If i > -1
				ExcludedMarkerList[i] = ( MarkerList.GetAt( j ) As ObjectReference )
			EndIf
		EndIf
	Endwhile
	If ExternalMarkerList.GetSize() > 0
		j = iMin(100,ExternalMarkerList.GetSize())
		While j > 0
			j -= 1
			If ( ( ExternalMarkerList.GetAt( j ).GetType() != 61 ) ||\
			!bCanTeleportToExtMarker( ExternalMarkerList.GetAt( j ) As ObjectReference ) ||\
			( PlayerMarker.GetDistance( ExternalMarkerList.GetAt( j ) As ObjectReference ) < fRPMinDistance ))
				i = ExcludedMarkerList.Find(None)
				If i > -1
					ExcludedMarkerList[i] = ExternalMarkerList.GetAt( j ) As ObjectReference 
				EndIf
			EndIf
		EndWhile
	EndIf		
Endfunction

Function InitializeDynamicMarkers()
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
EndFunction

Function SendToCheckPoint()
	InitializeDynamicMarkers()
	InitializeExcludedMarkers()
	If !TryToMoveByDistanceNear()
		If !TryToMoveByLocation()
			If !TryToMoveByDistanceCity()
				If !TryToMoveByOrder()
					If !TryToMoveByDistanceFar()
						If ( ExcludedMarkerList.find(SleepMarker) < 0 )
							If bIsArrived(SleepMarker)
								Return
							EndIf
						EndIf
						Int i = 0
						While i < CustomRespawnPoints.getSize()
							If ExcludedMarkerList.find(CustomRespawnPoints.GetAt(i) As ObjectReference) < 0
								If bSendToCustomMarker(iCustomRPSlot)
									Return
								EndIf
							EndIf
							i += 1
						EndWhile
						sendToRandomCity()
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Bool Function bHasEditorLocation(ObjectReference akMarker,Location akLocation)
	Return akMarker.GetEditorLocation() && akMarker.GetEditorLocation() == akLocation
Endfunction

Function findNearbyMarker()
	Location Curlocation
	If PlayerMarker.GetCurrentLocation()
		Curlocation = PlayerMarker.GetCurrentLocation()
	Else
		PlayerRefMarker.ForceRefTo(PlayerMarker)
		Return
	EndIf
	FormList Markers
	If PlayerRef.IsInInterior()
		Markers = InteriorMarkers
	Else
		Markers = ExteriorMarkers
	EndIf
	ObjectReference Marker
	Marker = Game.FindClosestReferenceOfAnyTypeInListFromRef(Markers, PlayerMarker, 50000.0)
	If !Marker || !bHasEditorLocation(Marker, Curlocation)
		Int i
		If Marker
			ObjectReference[] PrevMarkers = New ObjectReference[5]
			i = 5
			While i > 0 && Marker && !bHasEditorLocation(Marker, Curlocation)
				i -= 1
				PrevMarkers[i] = Marker
				Marker = Game.FindRandomReferenceOfAnyTypeInListFromRef(Markers, PrevMarkers[i], 50000.0)
				If PrevMarkers.Find(Marker) > -1 || (PlayerMarker.GetDistance(Marker) > 50000.0)
					Marker = None
				EndIf
			EndWhile
		EndIf
		If !Marker || !bHasEditorLocation(Marker, Curlocation)
			i = 5
			While i > 0 && (!Marker || !bHasEditorLocation(Marker, Curlocation))
				i -= 1
				Marker = Game.FindRandomReferenceOfAnyTypeInListFromRef(Markers, PlayerMarker, 50000.0)
			EndWhile
		EndIf
	EndIf
	If Marker && bHasEditorLocation(Marker, Curlocation)
		PlayerRefMarker.ForceRefTo(Marker)
	Else
		PlayerRefMarker.ForceRefTo(PlayerMarker)
	EndIf
Endfunction

Function SendToNearbyLocation()
	findNearbyMarker()
	If !bTryToMoveByQuest(moaNearbyDetector, TeleportRef, 5, FailedDestinations)
		SendToCheckPoint()
	EndIf
Endfunction

Int Function RespawnMenu(Int aiMessage = 0, Int aiButton = 0)
	Int iIndex = 1
	While True
		If aiButton == -1 ; Can prevent problems if recycling aiButton
		ElseIf aiMessage == 0
			aiButton = moaRespawnMenu0.Show()
			If aiButton == -1
			ElseIf aiButton < ConfigMenu.getNearbyCityRPIndex() ;Whiterun,...,Raven Rock
				Return aiButton
			ElseIf aiButton == ConfigMenu.getNearbyCityRPIndex() ;More
				aiMessage = 1
			EndIf
		ElseIf aiMessage == 1
			aiButton = moaRespawnMenu1.Show()
			If aiButton == -1
			ElseIf aiButton == 3 ;Custom
				aiMessage = 2
			ElseIf aiButton == 4
				aiMessage = 3 ;External
			ElseIf aiButton < 9 ;Nearby City,...,TOW
				Return ( aiButton + ConfigMenu.getNearbyCityRPIndex())
			ElseIf aiButton == 9 ;Less
				aiMessage = 0
			EndIf
		ElseIf aiMessage == 2 ;Custom
			aiButton = moaCustomRespawnMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
			If aiButton == -1
			ElseIf aiButton == 4 ;Details
				ConfigMenu.ShowCustomSlotsInfo()
			ElseIf aiButton == 5 ;Back
				aiMessage = 1
			Else
				Return -3 - aiButton ;0-> -3, 1-> -4, 2-> -5
			EndIf
		ElseIf aiMessage == 3
			If ExternalMarkerList.GetSize() > 8
				aiButton = moaRespawnMenu13_Alt.Show(iIndex)
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
				aiButton = moaRespawnMenu13.Show()
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
	 While (iIndex <= iTo)
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Function SelectRespawnPointbyMenu()
	moaERPCount.SetValue(ExternalMarkerList.GetSize())
	iTeleportLocation = RespawnMenu()
	If (( iTeleportLocation == -1 ) || ( iTeleportLocation > ( ConfigMenu.sRespawnPoints.Length - 1 )))
		If ( iTeleportLocation == -1 )
			iExternalIndex = iTeleportLocation
		Else
			iExternalIndex = ( iTeleportLocation - ( ConfigMenu.sRespawnPoints.Length ))
		EndIf
		iTeleportLocation = ConfigMenu.getExternalRPIndex()
	ElseIf iTeleportLocation < -2
		iCustomRPSlot = (iTeleportLocation * -1) - 3   ; -3-> 0, -4-> 1, -5-> 2
		iTeleportLocation = ConfigMenu.getCustomRPIndex() ;Custom
	EndIf
Endfunction

Function Respawn()
	bFirstTry = True
	bFirstTryFailed = False
	If ( ConfigMenu.bSendToJail && !ReviveScript.NPCScript.bInBeastForm() && ReviveScript.NPCScript.bGuardCanSendToJail() )
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Sending Player to jail...")
		Faction CrimeFaction = ReviveScript.Guard.GetCrimeFaction()
		If ( CrimeFaction )
			If ( CrimeFaction == CrimeFactionPale )
				bIsArrived(DawnstarJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionFalkreath )
				bIsArrived(FalkreathJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionHjaalmarch )
				bIsArrived(MorthalJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionHaafingar )
				bIsArrived(SolitudeJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionRift )
				bIsArrived(RiftenJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionWhiterun )
				bIsArrived(WhiterunJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionEastmarch )
				bIsArrived(WindhelmJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionWinterhold )
				bIsArrived(WinterholdJailMarker)
			ElseIf ( CrimeFaction == CrimeFactionReach )
				bIsArrived(MarkarthJailMarker)
				ReviveScript.bCidhnaJail = True
			ElseIf ( CrimeFaction == DLC2CrimeRavenRockFaction )
				bIsArrived(DLC2RavenRockJailMarker)
			EndIf
			ReviveScript.NPCScript.ReleaseFollowers()
			Utility.Wait(0.5)
			CrimeFaction.SendPlayerToJail( abRemoveInventory = True, abRealJail = True )
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is jailed")
		Else
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
			Teleport()
			ReviveScript.NPCScript.RespawnFollowers()
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
		EndIf
	Else
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
		Teleport()
		ReviveScript.NPCScript.RespawnFollowers()
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
	EndIf
Endfunction

Function PassTime(Float fGameHours,Float fRealSecs)
      If !ConfigMenu.bDisableUnsafe && fGameHours > 0.0 && fRealSecs > 0.0
              DefaultTimeScale = TimeScale.GetValue()
              TimeScale.SetValue( (3600.0 / fRealSecs) * fGameHours )
              Utility.Wait(fRealSecs)
              TimeScale.SetValue(DefaultTimeScale)
              PlayerRef.StopCombatalarm()
      Else
              Utility.Wait(fRealSecs)
      EndIf
EndFunction