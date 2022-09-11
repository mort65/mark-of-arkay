Scriptname zzzmoarespawnscript extends Quest

import zzzmoautilscript

Objectreference property CellLoadMarker auto
Objectreference property CellLoadMarker2 auto
Formlist property CityMarkersList auto
zzzmoaReviveMCM property ConfigMenu auto
Faction property CrimeFactionEastmarch auto
Faction property CrimeFactionFalkreath auto
Faction property CrimeFactionHaafingar auto
Faction property CrimeFactionHjaalmarch auto
Faction property CrimeFactionPale auto
Faction property CrimeFactionReach auto
Faction property CrimeFactionRift auto
Faction property CrimeFactionWhiterun auto
Faction property CrimeFactionWinterhold auto
FormList property CustomRespawnPoints auto
Location property DLC1HunterHQLocation auto
Location property DLC1VampireCastleLocation auto
Faction property DLC2CrimeRavenRockFaction auto
Objectreference property DLC2RavenRockJailMarker auto
Objectreference property DawnstarJailMarker auto
Float property DefaultTimeScale=20.0 auto Hidden
ReferenceAlias property DestinationCenter auto
Quest property DestinationCenterDetector auto
LocationAlias property DestinationLocation auto
ReferenceAlias property DestinationMarkerAlias auto
Formlist property Destinations auto
ObjectReference property DetachMarker1 auto
ObjectReference property DetachMarker2 auto
ObjectReference property DetachMarker3 auto
Formlist property DisabledLocations auto
ObjectReference[] property DynamicMarkerList auto Hidden
ObjectReference[] property ExcludedMarkerList auto Hidden
FormList property ExtInnMarkers auto
FormList property ExteriorMarkers auto
Formlist property ExternalLocationList auto
Formlist property ExternalLocationMarkerList auto
Formlist property ExternalMarkerList auto
Formlist property ExtraCustomMarkerList auto
Formlist property FailedDestinations auto
Objectreference property FalkreathJailMarker auto
Location property HjaalmarchHoldLocation auto
Keyword property HoldKeyword auto
FormList property InnHoldLocations auto
FormList property InnLocations auto
FormList property InnLocationsCapital auto
FormList property InnParentLocations auto
FormList property InteriorMarkers auto
Quest property LocMarkerDetector auto
FormList property LocationBlackList auto
ObjectReference property LocationMarker auto
ObjectReference property LocationMarker2 auto
FormList property LocationsList auto
Objectreference property MarkarthJailMarker auto
FormList property MarkerList auto
Formlist property MergedExternalMarkerList auto
Formlist property MergedExternalMarkerSubList auto
Objectreference property MorthalJailMarker auto
Location property PaleHoldLocation auto
ObjectReference property PlayerMarker auto
Actor property PlayerRef auto
ReferenceAlias property PlayerRefMarker auto
FormList property QuestBlackList auto
ReferenceAlias property RandomCityTeleportRef auto
ReferenceAlias property RandomTeleportRef auto
zzzmoaReviverScript property ReviveScript auto
Objectreference property RiftenJailMarker auto
ObjectReference property SleepMarker auto
Objectreference property SolitudeJailMarker auto
ObjectReference property TOWMarker auto
Location property TamrielLocation auto
Form[] property TavernCapitalMarkers auto Hidden
Form[] property TavernMarkers auto Hidden
Formlist property TeleportDestination auto
ReferenceAlias property TeleportRef auto
GlobalVariable property TimeScale auto
Objectreference property WhiterunJailMarker auto
Objectreference property WindhelmJailMarker auto
Objectreference property WinterholdJailMarker auto
FormList property WorldspacesInterior auto
Float property fRPMinDistance=2500.0 auto Hidden
Int property iCustomRPSlot auto Hidden
Int property iExternalIndex auto Hidden
Int property iTavernIndex auto Hidden
Int property iTeleportLocation auto Hidden
GlobalVariable property moaCheckingMarkers auto
Message property moaCustomRespawnMenu auto
GlobalVariable property moaERPCount auto
Quest property moaNearbyDetector auto
Quest property moaRandomCityDetector auto
GlobalVariable property moaRandomDestination auto
Quest property moaRandomMarkerDetector auto
Message property moaRespawnMenu0 auto
Message property moaRespawnMenu1 auto
Message property moaRespawnMenu10 auto
Message property moaRespawnMenu11 auto
Message property moaRespawnMenu110 auto
Message property moaRespawnMenu111 auto
Message property moaRespawnMenu112 auto
Message property moaRespawnMenu113 auto
Message property moaRespawnMenu114 auto
Message property moaRespawnMenu115 auto
Message property moaRespawnMenu116 auto
Message property moaRespawnMenu117 auto
Message property moaRespawnMenu118 auto
Message property moaRespawnMenu1180 auto
Message property moaRespawnMenu1181 auto
Message property moaRespawnMenu13 auto
Message property moaRespawnMenu13_Alt auto

Bool bFirstTry = False
Bool bFirstTryFailed = False

event OnCheckingMarkers(Form sender, Bool bTavern, Bool bExtra, Bool bCustom, Bool bFast)
  if sender == (self As Quest) As Form
    checkMarkers(bTavern, bExtra, bCustom, bFast)
    checkJsonBlackListedLocations()
  endif
endevent

event OnRespawn(Form akSender)
  if akSender == (self As Quest) As Form
    Respawn()
    ReviveScript.bReadyForRespawn = False
  endif
endevent

function AddExternalMarkers(Bool bFast=False)
  Debug.TraceConditional("MarkOfArkay: Adding extra markers...", ConfigMenu.bIsLoggingEnabled)
  Int i = 0
  if !bFast
    ObjectReference LocMarker
    ExternalLocationMarkerList.Revert()
    while i < ExternalLocationList.GetSize()
      if ExternalLocationList.GetAt(i) As Location
        LocMarker = getLocationMarker(ExternalLocationList.GetAt(i) As Location)
        if LocMarker As ObjectReference
          ExternalLocationMarkerList.AddForm(LocMarker)
        endif
      endif
      i += 1
    endwhile
    MergedExternalMarkerList.Revert()
    MergedExternalMarkerSubList.Revert()
    MergedExternalMarkerList.AddForm(checkAndFixFormList(ExternalMarkerList, True, True, True, akOtherList=MergedExternalMarkerSubList))
    MergedExternalMarkerList.AddForm(checkAndFixFormList(ExternalLocationMarkerList, True, True, True))
    MergedExternalMarkerList.AddForm(checkAndFixFormList(ExtraCustomMarkerList, True, True, True, 34))
    i = MergedExternalMarkerSubList.GetSize() + ExternalLocationMarkerList.GetSize() + ExtraCustomMarkerList.GetSize()
  endif
  moaERPCount.SetValue(i)
  ConfigMenu.setExtraRPs(i, bFast)
  Debug.TraceConditional("MarkOfArkay: Adding extra markers finished.", ConfigMenu.bIsLoggingEnabled)
endfunction

Bool function BIsRefInCurrentCell(ObjectReference MarkerRef)
  return ((MarkerRef).GetParentCell() == PlayerRef.GetParentCell())
endfunction

ObjectReference function FindCityMarkerByDistance(float fMaxDistance=100000.0)
  float fDistance
  ObjectReference Marker
  Int iIndex
  Int iLast
  if moaERPCount.GetValueInt() > 0
    iLast = iMin(128, moaERPCount.GetValueInt())
    iIndex = 0
    ObjectReference tempMarker
    while iIndex < iLast
      tempMarker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if (ExcludedMarkerList.find(tempMarker) < 0)
        if (!fDistance || (fDistance > PlayerMarker.GetDistance(tempMarker))) && (PlayerMarker.GetDistance(tempMarker) >= fRPMinDistance)
          fDistance = PlayerMarker.GetDistance(tempMarker)
          Marker = tempMarker
        endif
      endif
      iIndex += 1
    endwhile
  endif
  if PlayerMarker.IsInInterior()
    iIndex = MarkerList.GetSize()
    while iIndex > 0
      iIndex -= 1

      ;If ConfigMenu.bRespawnPointsFlags[iIndex]
      if (PlayerMarker.GetParentCell() == (MarkerList.GetAt(iIndex) As ObjectReference).GetParentCell())
        if (ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0)
          if (!fDistance || (fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference))) && (PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance)
            fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
            Marker = MarkerList.GetAt(iIndex) As ObjectReference
          endif
        endif
      endif

      ;EndIf
    endwhile
  else
    iIndex = CityMarkersList.GetSize()
    while iIndex > 0
      iIndex -= 1

      ;If ConfigMenu.bRespawnPointsFlags[iIndex]
      if (!fDistance || (fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)))
        fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
        Marker = MarkerList.GetAt(iIndex) As ObjectReference
      endif

      ;EndIf
    endwhile
  endif
  if (Marker && fDistance && fDistance <= fMaxDistance)
    return Marker
  endif
  return None
endfunction

ObjectReference function FindCityMarkerByLocation()
  Int iIndex = LocationsList.GetSize()
  while (iIndex > 0)
    iIndex -= 1
    if (iIndex == 3)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
        ;If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif

        ;EndIf
      endif
    elseif (iIndex == 4)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
        ;If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif

        ;EndIf
      endif
    elseif (iIndex == 6)
      if (bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation)) ;Winterhold or Dawnstar
        ;If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif

        ;EndIf
      endif
    elseif bInSameLocation(LocationsList.GetAt(iIndex) As Location)
      ;If ConfigMenu.bRespawnPointsFlags[iIndex]
      if (PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance)
        return MarkerList.GetAt(iIndex) As ObjectReference
      endif

      ;EndIf
    endif
  endwhile
  return None
endfunction

ObjectReference function FindInnMarkerByDistance(float fMaxDistance=100000.0)
  float fDistance
  Int MarkerIndex
  Int iIndex
  ObjectReference Marker
  if !PlayerMarker.IsInInterior()
    iIndex = ExtInnMarkers.GetSize()
    while iIndex > 0
      iIndex -= 1
      if (!fDistance || (fDistance > PlayerMarker.GetDistance(ExtInnMarkers.GetAt(iIndex) As ObjectReference)))
        fDistance = PlayerMarker.GetDistance(ExtInnMarkers.GetAt(iIndex) As ObjectReference)
        MarkerIndex = iIndex
      endif
    endwhile
  endif
  if (fDistance && fDistance <= fMaxDistance)
    return TavernMarkers[MarkerIndex] As ObjectReference
  endif
  return None
endfunction

ObjectReference function FindInnMarkerByLocation()
  ObjectReference akMarker
  Int iIndex = InnLocations.GetSize()
  while iIndex > 0
    iIndex -= 1
    if PlayerMarker.IsInLocation(InnLocations.GetAt(iIndex) As Location) || PlayerMarker.IsInLocation(InnParentLocations.GetAt(iIndex) As Location)
      akMarker = TavernMarkers[iIndex] As ObjectReference
      if (PlayerMarker.GetDistance(akMarker) >= fRPMinDistance)
        return akMarker
      endif
    endif
  endwhile
  iIndex = InnHoldLocations.GetSize()
  while iIndex > 0
    iIndex -= 1
    akMarker = TavernCapitalMarkers[iIndex] As ObjectReference
    if (iIndex == 3)
      if bInSameLocation(InnHoldLocations.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
        if (PlayerMarker.GetDistance(akMarker) >= fRPMinDistance)
          return akMarker
        endif
      endif
    elseif (iIndex == 4)
      if bInSameLocation(InnHoldLocations.GetAt(iIndex) As Location) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Castle Volkihar
        if (PlayerMarker.GetDistance(akMarker) >= fRPMinDistance)
          return akMarker
        endif
      endif
    elseif bInSameLocation(InnHoldLocations.GetAt(iIndex) As Location)
      if (PlayerMarker.GetDistance(akMarker) >= fRPMinDistance)
        return akMarker
      endif
    endif
  endwhile
  return None
endfunction

ObjectReference function FindMarkerByDistance()
  Float fDistance
  ObjectReference Marker
  Int iIndex = DynamicMarkerList.Length
  while iIndex > 0
    iIndex -= 1
    if (ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0)
      if (!PlayerMarker.IsInInterior() || (PlayerMarker.GetParentCell() == DynamicMarkerList[iIndex].GetParentCell()))
        if (!fDistance || (fDistance > PlayerMarker.GetDistance(DynamicMarkerList[iIndex])))
          fDistance = PlayerMarker.GetDistance(DynamicMarkerList[iIndex])
          Marker = DynamicMarkerList[iIndex]
        endif
      endif
    endif
  endwhile
  if (Marker && fDistance && fDistance <= 50000.0)
    return Marker
  endif
  return None
endfunction

ObjectReference function FindMarkerByLocation()
  Int iIndex = DynamicMarkerList.Length
  while iIndex > 0
    iIndex -= 1
    if (ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0)
      if (iIndex >= (DynamicMarkerList.Length - 2)) ;DetachMarker2 or DetachMarker1
        if (bInSameLocation(DynamicMarkerList[iIndex].GetCurrentLocation()) || (IsInInteriorActual(PlayerMarker) != IsInInteriorActual(DynamicMarkerList[iIndex])))
          return DynamicMarkerList[iIndex]
        endif
      else
        if bInSameLocation(DynamicMarkerList[iIndex].GetCurrentLocation())
          return DynamicMarkerList[iIndex]
        endif
      endif
    endif
  endwhile
  iIndex = LocationsList.GetSize()
  while (iIndex > 0)
    iIndex -= 1
    if (ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0)
      if (iIndex == 3)
        if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
          if ConfigMenu.bRespawnPointsFlags[iIndex]
            return (MarkerList.GetAt(iIndex) As ObjectReference)
          endif
        endif
      elseif (iIndex == 4)
        if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
          if ConfigMenu.bRespawnPointsFlags[iIndex]
            return (MarkerList.GetAt(iIndex) As ObjectReference)
          endif
        endif
      elseif (iIndex == 6)
        if (bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation)) ;Winterhold or Dawnstar
          if ConfigMenu.bRespawnPointsFlags[iIndex]
            return (MarkerList.GetAt(iIndex) As ObjectReference)
          endif
        endif
      elseif bInSameLocation(LocationsList.GetAt(iIndex) As Location)
        if ConfigMenu.bRespawnPointsFlags[iIndex]
          return (MarkerList.GetAt(iIndex) As ObjectReference)
        endif
      endif
    endif
  endwhile
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    Int jIndex = 0
    ObjectReference Marker
    while jIndex < iLast
      Marker = getFromMergedFormList(MergedExternalMarkerList, jIndex) As ObjectReference
      if (ExcludedMarkerList.find(Marker) < 0)
        if bInSameLocation((Marker).GetCurrentLocation())
          return Marker
        endif
      endif
      jIndex += 1
    endwhile
  endif
endfunction

ObjectReference function FindMarkerByOrder()
  if (ExcludedMarkerList.find(DetachMarker2) < 0)
    return DetachMarker2
  endif
  if (ExcludedMarkerList.find(DetachMarker1) < 0)
    return DetachMarker1
  endif
  if (ExcludedMarkerList.find(LocationMarker) < 0)
    return LocationMarker
  endif
  if (ExcludedMarkerList.find(CellLoadMarker) < 0)
    return CellLoadMarker
  endif
  if (ExcludedMarkerList.find(LocationMarker2) < 0)
    return LocationMarker2
  endif
  if (ExcludedMarkerList.find(DetachMarker3) < 0)
    return DetachMarker3
  endif
  if (ExcludedMarkerList.find(CellLoadMarker2) < 0)
    return CellLoadMarker2
  endif
  return None
endfunction

function InitializeDynamicMarkers()
  DynamicMarkerList = new ObjectReference[12]
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
endfunction

function InitializeExcludedMarkers()
  ExcludedMarkerList = new ObjectReference[128]
  Int i
  int j = DynamicMarkerList.Length
  while j > 0
    j -= 1
    if (!bCanTeleportToDynMarker(DynamicMarkerList[j]) || (PlayerMarker.GetDistance(DynamicMarkerList[j]) < fRPMinDistance))
      i = ExcludedMarkerList.Find(None)
      if i > -1
        ExcludedMarkerList[i] = DynamicMarkerList[j]
      endif
    endif
  endwhile
  j = MarkerList.GetSize()
  while j > 0
    j -= 1
    if (PlayerMarker.GetDistance(MarkerList.GetAt(j) As ObjectReference) < fRPMinDistance)
      i = ExcludedMarkerList.Find(None)
      if i > -1
        ExcludedMarkerList[i] = (MarkerList.GetAt(j) As ObjectReference)
      endif
    endif
  endwhile
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(90, moaERPCount.GetValueInt())
    ObjectReference marker
    j = 0
    while j < iLast
      marker = getFromMergedFormList(MergedExternalMarkerList, j) As ObjectReference
      if ((marker.GetType() != 61) || !bCanTeleportToExtMarker(marker) || (PlayerMarker.GetDistance(marker) < fRPMinDistance))
        i = ExcludedMarkerList.Find(None)
        if i > -1
          ExcludedMarkerList[i] = marker
        endif
      endif
      j += 1
    endwhile
  endif
endfunction

Bool function IsInInteriorActual(ObjectReference akObjectReference)
  if akObjectReference.IsInInterior()
    return True
  endif
  if WorldspacesInterior.HasForm(akObjectReference.GetWorldSpace())
    return True
  endif
  return False
endfunction

function PassTime(Float fGameHours, Float fRealSecs)
  if !ConfigMenu.bDisableUnsafe && fGameHours > 0.0 && fRealSecs > 0.0
    DefaultTimeScale = TimeScale.GetValue()
    TimeScale.SetValue((3600.0 / fRealSecs) * fGameHours)
    Utility.Wait(fRealSecs)
    TimeScale.SetValue(DefaultTimeScale)
    PlayerRef.StopCombatalarm()
  else
    Utility.Wait(fRealSecs)
  endif
endfunction

function RandomTeleport()
  if ConfigMenu.bMoreRandomRespawn
    DisabledLocations.Revert()
    Int i = LocationsList.GetSize()
    while i > 0
      i -= 1
      if !ConfigMenu.bRespawnPointsFlags[i]
        DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
      endif
    endwhile
    if !ConfigMenu.bRespawnPointsFlags[8]
      DisabledLocations.AddForm(InnHoldLocations.GetAt(8) As Location)
    endif
    if !ConfigMenu.bRespawnPointsFlags[9]
      DisabledLocations.AddForm(InnHoldLocations.GetAt(9) As Location)
    endif
    if bTryToMoveByQuest(moaRandomMarkerDetector, RandomTeleportRef, 7, FailedDestinations)
      return
    endif
  endif
  Destinations.Revert()
  int iIndex = 0
  Int iRandom = 0
  while iIndex < MarkerList.GetSize()
    if ConfigMenu.bRespawnPointsFlags[iIndex] && PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As Objectreference) >= fRPMinDistance
      Destinations.AddForm(MarkerList.GetAt(iIndex) As Objectreference)
    endif
    iIndex += 1
  endwhile
  Bool[] bInnFlags = bGetTavernFlags()
  iIndex = InnLocations.GetSize()
  while iIndex > 0
    iIndex -= 1
    if bInnFlags[iIndex]
      Destinations.AddForm(TavernMarkers[iIndex] As ObjectReference)
    endif
  endwhile
  if bCanTeleportToDynMarker(SleepMarker) && PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance
    Destinations.AddForm(SleepMarker)
  endif
  iIndex = 0
  while iIndex < CustomRespawnPoints.GetSize()
    if bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
      if PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference) >= fRPMinDistance
        Destinations.AddForm(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
      endif
    endif
    iIndex += 1
  endwhile
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    iIndex = 0
    ObjectReference Marker
    while iIndex < iLast
      Marker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if !((Marker.GetType() != 61) || !bCanTeleportToExtMarker(Marker) || (PlayerMarker.GetDistance(Marker) < fRPMinDistance))
        Destinations.AddForm(Marker)
      endif
      iIndex += 1
    endwhile
  endif
  if bCanTeleportToDynMarker(CellLoadMarker2) && PlayerMarker.GetDistance(CellLoadMarker2) >= fRPMinDistance
    Destinations.AddForm(CellLoadMarker2)
  endif
  if bCanTeleportToDynMarker(DetachMarker3) && PlayerMarker.GetDistance(DetachMarker3) >= fRPMinDistance
    Destinations.AddForm(DetachMarker3)
  endif
  if bCanTeleportToDynMarker(LocationMarker2) && PlayerMarker.GetDistance(LocationMarker2) >= fRPMinDistance
    Destinations.AddForm(LocationMarker2)
  endif
  if bCanTeleportToDynMarker(CellLoadMarker) && PlayerMarker.GetDistance(CellLoadMarker) >= fRPMinDistance
    Destinations.AddForm(CellLoadMarker)
  endif
  if bCanTeleportToDynMarker(LocationMarker) && PlayerMarker.GetDistance(LocationMarker) >= fRPMinDistance
    Destinations.AddForm(LocationMarker)
  endif
  if bCanTeleportToDynMarker(DetachMarker1) && PlayerMarker.GetDistance(DetachMarker1) >= fRPMinDistance
    Destinations.AddForm(DetachMarker1)
  endif
  if bCanTeleportToDynMarker(DetachMarker2) && PlayerMarker.GetDistance(DetachMarker2) >= fRPMinDistance
    Destinations.AddForm(DetachMarker2)
  endif
  iIndex = Destinations.GetSize()
  while iIndex > 0
    iRandom = Utility.RandomInt(0, Destinations.GetSize() - 1)
    if bIsArrived(Destinations.GetAt(iRandom) As ObjectReference)
      return
    else
      Destinations.RemoveAddedForm(Destinations.GetAt(iRandom))
    endif
    iIndex -= 1
  endwhile
  if !bSendToTOW()
    SendToDefaultMarker()
  endif
endfunction

function Respawn()
  bFirstTry = True
  bFirstTryFailed = False
  if (ConfigMenu.bSendToJail && !ReviveScript.NPCScript.bInBeastForm() && ReviveScript.NPCScript.bGuardCanSendToJail())
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Sending Player to jail...")
    Faction CrimeFaction = ReviveScript.Guard.GetCrimeFaction()
    if (CrimeFaction)
      if (CrimeFaction == CrimeFactionPale)
        bIsArrived(DawnstarJailMarker)
      elseif (CrimeFaction == CrimeFactionFalkreath)
        bIsArrived(FalkreathJailMarker)
      elseif (CrimeFaction == CrimeFactionHjaalmarch)
        bIsArrived(MorthalJailMarker)
      elseif (CrimeFaction == CrimeFactionHaafingar)
        bIsArrived(SolitudeJailMarker)
      elseif (CrimeFaction == CrimeFactionRift)
        bIsArrived(RiftenJailMarker)
      elseif (CrimeFaction == CrimeFactionWhiterun)
        bIsArrived(WhiterunJailMarker)
      elseif (CrimeFaction == CrimeFactionEastmarch)
        bIsArrived(WindhelmJailMarker)
      elseif (CrimeFaction == CrimeFactionWinterhold)
        bIsArrived(WinterholdJailMarker)
      elseif (CrimeFaction == CrimeFactionReach)
        bIsArrived(MarkarthJailMarker)
        ReviveScript.bCidhnaJail = True
      elseif (CrimeFaction == DLC2CrimeRavenRockFaction)
        bIsArrived(DLC2RavenRockJailMarker)
      endif
      ReviveScript.NPCScript.ReleaseFollowers()
      Utility.Wait(0.5)
      CrimeFaction.SendPlayerToJail(abRemoveInventory=True, abRealJail=True)
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is jailed")
    else
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
      Teleport()
      ReviveScript.NPCScript.RespawnFollowers()
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
    endif
  else
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
    Teleport()
    ReviveScript.NPCScript.RespawnFollowers()
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
  endif
endfunction

Int function RespawnMenu(Int aiMessage=0, Int aiButton=0)
  Int iIndex = 1
  while True
    if aiButton == -1 ; Can prevent problems if recycling aiButton
    elseif aiMessage == 0
      aiButton = moaRespawnMenu0.Show()
      if aiButton == -1
      elseif aiButton < ConfigMenu.getNearbyCityRPIndex() ;Whiterun,...,Raven Rock
        return aiButton
      elseif aiButton == ConfigMenu.getNearbyCityRPIndex() ;More
        aiMessage = 1
      endif
    elseif aiMessage == 1
      aiButton = moaRespawnMenu1.Show()
      if aiButton == -1
      elseif aiButton == 0 ;City
        aiMessage = 4
      elseif aiButton == 1 ;Inn
        aiMessage = 5
      elseif aiButton == 3 ;Custom
        aiMessage = 2
      elseif aiButton == 4
        aiMessage = 3 ;External
      elseif aiButton < 9 ;Nearby City,...,TOW
        return (aiButton + ConfigMenu.getRandCityRPIndex()) ;aibutton+9
      elseif aiButton == 9 ;Less
        aiMessage = 0
      endif
    elseif aiMessage == 2 ;Custom
      aiButton = moaCustomRespawnMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
      if aiButton == -1
      elseif aiButton == 4 ;Details
        ConfigMenu.ShowCustomSlotsInfo()
      elseif aiButton == 5 ;Back
        aiMessage = 1
      else
        return -3 - aiButton ;0-> -3, 1-> -4, 2-> -5
      endif
    elseif aiMessage == 3
      if moaERPCount.GetValueInt() > 7
        aiButton = moaRespawnMenu13_Alt.Show(iIndex)
        if aiButton == -1
        elseif aiButton == 0 ;Prev
          iIndex = ichangeVar(iIndex, 1, moaERPCount.GetValueInt(), -1)
        elseif aiButton == 1 ;Next
          iIndex = ichangeVar(iIndex, 1, moaERPCount.GetValueInt(), 1)
        elseif aiButton == 2 ;Input
          if ConfigMenu.bUIEOK
            UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
            TextMenu.SetPropertyString("text", (iIndex) As String)
            TextMenu.OpenMenu(none, none)
            String sResult = TextMenu.GetResultString()
            TextMenu.ResetMenu()
            if sResult && bIsInteger(sResult) && ((sResult As Int) - 1) > -1 && ((sResult As Int) - 1) < moaERPCount.GetValueInt()
              iIndex = (sResult As Int)
            endif
          endif
        elseif aiButton == 3 ;Check
          ConfigMenu.ShowExtraRPInfo(iIndex - 1, 1)
        elseif aiButton == 4 ;OK
          return (iIndex + (ConfigMenu.sRespawnPoints.Length - 1))
        elseif aiButton == 5 ;External(Random)
          return -1
        elseif aiButton == 6 ;Back
          aiMessage = 1
        endif
      else
        aiButton = moaRespawnMenu13.Show()
        if aiButton == -1
        elseif aiButton < 7 ;External(1,...,7)
          return (aiButton + (ConfigMenu.sRespawnPoints.Length))
        elseif aiButton == 7 ;External(Random)
          return -1
        elseif aiButton == 8 ;Details
          ConfigMenu.ShowExtraRPInfo(0, 7)
        elseif aiButton == 9 ;Back
          aiMessage = 1
        endif
      endif
    elseif aiMessage == 4
      aiButton = moaRespawnMenu10.Show()
      if aiButton == -1
      elseif aiButton == 0
        return ConfigMenu.getNearbyCityRPIndex()
      elseif aiButton == 1
        return ConfigMenu.getRandCityRPIndex()
      elseif aiButton == 2
        aiMessage = 1
      endif
    elseif aiMessage == 5
      aiButton = moaRespawnMenu11.Show()
      if aiButton == -1
      elseif aiButton == 0
        aiMessage = 6
      elseif aiButton == 1
        aiMessage = 7
      elseif aiButton == 2
        aiMessage = 8
      elseif aiButton == 3
        aiMessage = 9
      elseif aiButton == 4
        aiMessage = 10
      elseif aiButton == 5
        aiMessage = 11
      elseif aiButton == 6
        aiMessage = 12
      elseif aiButton == 7
        aiMessage = 13
      elseif aiButton == 8 ;more
        aiMessage = 14
      elseif aiButton == 9 ;back
        aiMessage = 1
      endif
    elseif aiMessage == 6 ;Whiterun Inns (3)
      aiButton = moaRespawnMenu110.Show()
      if aiButton == -1
      elseif aiButton < 3
        iTavernIndex = aiButton
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 3
        aiMessage = 5
      endif
    elseif aiMessage == 7 ;Falkreath Inn (1)
      aiButton = moaRespawnMenu111.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 3
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 8 ;Markarth Inn (2)
      aiButton = moaRespawnMenu112.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 4
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 9 ;Riften Inn (1)
      aiButton = moaRespawnMenu113.Show()
      if aiButton == -1
      elseif aiButton == 0 ;The Bee and Barb
        iTavernIndex = 6
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1 ;Vilemyr Inn
        iTavernIndex = 16
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 10 ;Solitude Inn (2)
      aiButton = moaRespawnMenu114.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 7
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 11 ;Windhelm Inn (2)
      aiButton = moaRespawnMenu115.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 9
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 12 ;Winterhold Inn (1)
      aiButton = moaRespawnMenu116.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 11
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 13 ;Raven Rock Inn (1)
      aiButton = moaRespawnMenu117.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 12
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 14
      aiButton = moaRespawnMenu118.Show()
      if aiButton == -1
      elseif aiButton == 0 ;morthal inn
        aiMessage = 15
      elseif aiButton == 1 ;dawnstar inn
        aiMessage = 16
      elseif aiButton == 2
        iTavernIndex = ConfigMenu.getNearbyInnRPIndex()
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 3
        iTavernIndex = ConfigMenu.getRandInnRPIndex()
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 4 ;Less
        aiMessage = 5
      elseif aiButton == 5 ;Back
        aiMessage = 1
      endif
    elseif aiMessage == 15
      aiButton = moaRespawnMenu1180.Show() ;Morthal Inn (1)
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 13
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 16
      aiButton = moaRespawnMenu1181.Show() ;Dawnstar Inn (2)
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 14
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    endif
  endwhile
endfunction

function SelectRespawnPointbyMenu()
  moaERPCount.SetValue(MergedExternalMarkerSubList.GetSize() + ExternalLocationMarkerList.GetSize() + ExtraCustomMarkerList.GetSize())
  iTeleportLocation = RespawnMenu()
  if ((iTeleportLocation == -1) || (iTeleportLocation > (ConfigMenu.sRespawnPoints.Length - 1)))
    if (iTeleportLocation == -1)
      iExternalIndex = iTeleportLocation
    else
      iExternalIndex = (iTeleportLocation - (ConfigMenu.sRespawnPoints.Length))
    endif
    iTeleportLocation = ConfigMenu.getExternalRPIndex()
  elseif iTeleportLocation < -2
    iCustomRPSlot = (iTeleportLocation * -1) - 3 ; -3-> 0, -4-> 1, -5-> 2, -6->3
    iTeleportLocation = ConfigMenu.getCustomRPIndex() ;Custom
  endif
endfunction

function SendToAnotherLocation()
  ObjectReference Marker = FindInnMarkerByLocation()
  if Marker && bIsArrived(Marker)
    return
  endif
  Marker = FindCityMarkerByLocation()
  if Marker && bIsArrived(Marker)
    return
  endif
  sendToRandomInn()
endfunction

function SendToCheckPoint()
  InitializeDynamicMarkers()
  InitializeExcludedMarkers()
  if !TryToMoveByDistanceNear()
    if !TryToMoveByLocation()
      if !TryToMoveByDistanceCity()
        if !TryToMoveByOrder()
          if !TryToMoveByDistanceFar()
            if (ExcludedMarkerList.find(SleepMarker) < 0)
              if bIsArrived(SleepMarker)
                return
              endif
            endif
            Int i = 0
            while i < CustomRespawnPoints.getSize()
              if ExcludedMarkerList.find(CustomRespawnPoints.GetAt(i) As ObjectReference) < 0
                if bSendToCustomMarker(iCustomRPSlot)
                  return
                endif
              endif
              i += 1
            endwhile
            sendToRandomCity()
          endif
        endif
      endif
    endif
  endif
endfunction

function SendToDefaultMarker()
  while !ReviveScript.bReadyForRespawn
    Utility.Wait(0.1)
  endwhile
  if ConfigMenu.bKillIfCantRespawn
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is dying because respawn is not possible.")
    PlayerRef.EndDeferredKill()
    Utility.Wait(0.1)
    if !PlayerRef.IsDead()
      killPlayer()
    endif
  else
    if PlayerMarker.GetParentCell() != ReviveScript.DefaultCell
      bIsArrived(PlayerMarker)
    else
      bIsArrived(PlayerRef As ObjectReference)
    endif
  endif
endfunction

function SendToNearbyCity()
  ObjectReference Marker
  if !IsInInteriorActual(PlayerMarker)
    Marker = FindCityMarkerByDistance(500000.0)
    if Marker && bIsArrived(Marker)
      return
    endif
  endif
  Marker = FindCityMarkerByLocation()
  if Marker && bIsArrived(Marker)
    return
  endif
  sendToRandomCity()
endfunction

function SendToNearbyInn()
  ObjectReference Marker
  if !IsInInteriorActual(PlayerMarker)
    Marker = FindInnMarkerByDistance(500000.0)
    if Marker && bIsArrived(Marker)
      return
    endif
  endif
  Marker = FindInnMarkerByLocation()
  if Marker && bIsArrived(Marker)
    return
  endif
  sendToRandomInn()
endfunction

function SendToNearbyLocation()
  findNearbyMarker()
  if !bTryToMoveByQuest(moaNearbyDetector, TeleportRef, 5, FailedDestinations)
    SendToCheckPoint()
  endif
endfunction

function SetVars()
  fRPMinDistance = ConfigMenu.fRPMinDistanceSlider
  iTeleportLocation = ConfigMenu.iTeleportLocation
  iExternalIndex = ConfigMenu.iExternalIndex
  iTavernIndex = ConfigMenu.iTavernIndex
  iCustomRPSlot = ConfigMenu.iSelectedCustomRPSlot
endfunction

function Teleport()
  PlayerMarker.Enable()
  PlayerMarker.MoveTo(playerRef)
  PlayerMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
  PlayerMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
  moaERPCount.SetValue(MergedExternalMarkerSubList.GetSize() + ExternalLocationMarkerList.GetSize() + ExtraCustomMarkerList.GetSize())
  if iTeleportLocation < (ConfigMenu.getNearbyCityRPIndex())
    if ConfigMenu.bMoreRandomRespawn
      moaRandomDestination.SetValueInt(0)
      TeleportDestination.Revert()
      TeleportDestination.AddForm(LocationsList.GetAt(iTeleportLocation) As Location)
      DisabledLocations.Revert()
      Int i = LocationsList.GetSize()
      while i > 0
        i -= 1
        if !ConfigMenu.bRespawnPointsFlags[i] && (i != iTeleportLocation)
          DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
        endif
      endwhile
      if !ConfigMenu.bRespawnPointsFlags[8]
        DisabledLocations.AddForm(InnHoldLocations.GetAt(8) As Location)
      endif
      if !ConfigMenu.bRespawnPointsFlags[9]
        DisabledLocations.AddForm(InnHoldLocations.GetAt(9) As Location)
      endif
      if bTryToMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 7, FailedDestinations)
        return
      endif
    endif
    if (PlayerRef.GetDistance(MarkerList.GetAt(iTeleportLocation) As Objectreference) >= fRPMinDistance)
      if !bIsArrived(MarkerList.GetAt(iTeleportLocation) As Objectreference)
        SendToAnotherLocation()
      endif
    else
      SendToAnotherLocation()
    endif
  elseif iTeleportLocation == (ConfigMenu.getNearbyCityRPIndex())
    sendToNearbyCity()
  elseif iTeleportLocation == (ConfigMenu.getRandCityRPIndex())
    sendToRandomCity()
  elseif iTeleportLocation == (ConfigMenu.getTavernRPIndex())
    if iTavernIndex == ConfigMenu.getNearbyInnRPIndex()
      sendToNearbyInn()
    elseif iTavernIndex == ConfigMenu.getRandInnRPIndex()
      sendToRandomInn()
    else
      ObjectReference Marker = TavernMarkers[iTavernIndex] As ObjectReference
      if (PlayerMarker.GetDistance(Marker) >= fRPMinDistance) && bIsArrived(Marker)
        return
      else
        SendToAnotherLocation()
      endif
    endif
  elseif iTeleportLocation == (ConfigMenu.getSleepRPIndex())
    if !bSendToSleepMarker()
      if !bSendToCustomMarker(iCustomRPSlot)
        SendToAnotherLocation()
      endif
    endif
  elseif iTeleportLocation == (ConfigMenu.getCustomRPIndex())
    if !bSendToCustomMarker(iCustomRPSlot)
      if !bSendToSleepMarker()
        SendToAnotherLocation()
      endif
    endif
  elseif iTeleportLocation == (ConfigMenu.getExternalRPIndex())
    if !bSendToExternalMarker(iExternalIndex)
      if !bSendToSleepMarker()
        if !bSendToCustomMarker(iCustomRPSlot)
          SendToAnotherLocation()
        endif
      endif
    endif
  elseif iTeleportLocation == (ConfigMenu.getCheckpointRPIndex())
    SendToCheckPoint()
  elseif iTeleportLocation == (ConfigMenu.getNearbyRPIndex())
    SendToNearbyLocation()
  elseif iTeleportLocation == (ConfigMenu.getRandomRPIndex())
    RandomTeleport()
  elseif iTeleportLocation == (ConfigMenu.getThroatRPIndex())
    if !bSendToTOW()
      SendToAnotherLocation()
    endif
  endif
  PlayerMarker.MoveToMyEditorLocation()
  PlayerMarker.Disable()
endfunction

Bool function TryToMoveByDistanceCity()
  ObjectReference Marker
  Marker = FindCityMarkerByDistance()
  if Marker
    if bIsArrived(Marker)
      return True
    endif
    Int i = ExcludedMarkerList.Find(None)
    if i > -1
      ExcludedMarkerList[i] = Marker
    endif
  endif
  return False
endfunction

Bool function TryToMoveByDistanceFar()
  float fDistance
  ObjectReference Marker
  ObjectReference tempMarker
  Int iIndex
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    iIndex = 0
    while iIndex < iLast
      tempMarker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if (ExcludedMarkerList.find(tempMarker) < 0)
        if (!fDistance || (fDistance > PlayerMarker.GetDistance(tempMarker)))
          fDistance = PlayerMarker.GetDistance(tempMarker)
          Marker = tempMarker
        endif
      endif
      iIndex += 1
    endwhile
  endif
  if PlayerMarker.IsInInterior()
    iIndex = MarkerList.GetSize()
    while iIndex > 0
      iIndex -= 1
      if ConfigMenu.bRespawnPointsFlags[iIndex]
        if (PlayerMarker.GetParentCell() == (MarkerList.GetAt(iIndex) As ObjectReference).GetParentCell())
          if (ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0)
            if (!fDistance || (fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)))
              fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
              Marker = MarkerList.GetAt(iIndex) As ObjectReference
            endif
          endif
        endif
      endif
    endwhile
  else
    iIndex = CityMarkersList.GetSize()
    while iIndex > 0
      iIndex -= 1
      if ConfigMenu.bRespawnPointsFlags[iIndex]
        if (ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0)
          if (!fDistance || (fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)))
            fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
            Marker = MarkerList.GetAt(iIndex) As ObjectReference
          endif
        endif
      endif
    endwhile
  endif
  iIndex = 0
  while iIndex < CustomRespawnPoints.getSize()
    if (ExcludedMarkerList.find(CustomRespawnPoints.GetAt(iIndex) As ObjectReference) < 0)
      if (!PlayerMarker.IsInInterior() || (PlayerMarker.GetParentCell() == (CustomRespawnPoints.GetAt(iIndex) As ObjectReference).GetParentCell()))
        if (!fDistance || (fDistance > PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)))
          fDistance = PlayerMarker.GetDistance(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
          Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
        endif
      endif
    endif
    iIndex += 1
  endwhile
  if (ExcludedMarkerList.find(SleepMarker) < 0)
    if (!PlayerMarker.IsInInterior() || (PlayerMarker.GetParentCell() == SleepMarker.GetParentCell()))
      if (!fDistance || (fDistance > PlayerMarker.GetDistance(SleepMarker)))
        fDistance = PlayerMarker.GetDistance(SleepMarker)
        Marker = SleepMarker
      endif
    endif
  endif
  if (Marker && fDistance && fDistance <= 500000.0)
    if bIsArrived(Marker)
      return True
    endif
    Int i = ExcludedMarkerList.Find(None)
    if i > -1
      ExcludedMarkerList[i] = Marker
    endif
  endif
  return False
endfunction

Bool function TryToMoveByDistanceNear()
  Int i = 0
  Int j = 0
  ObjectReference Marker
  while (i < 9)
    i += 1
    Marker = FindMarkerByDistance()
    if Marker
      if bIsArrived(Marker)
        return True
      endif
      j = ExcludedMarkerList.Find(None)
      if j > -1
        ExcludedMarkerList[j] = Marker
      endif
    else
      return False
    endif
  endwhile
  return False
endfunction

Bool function TryToMoveByLocation()
  Int i = 0
  Int j = 0
  ObjectReference Marker
  while (i < 12)
    i += 1
    Marker = FindMarkerByLocation()
    if Marker
      if bIsArrived(Marker)
        return True
      endif
      j = ExcludedMarkerList.Find(None)
      if j > -1
        ExcludedMarkerList[j] = Marker
      endif
    else
      return False
    endif
  endwhile
  return False
endfunction

Bool function TryToMoveByOrder()
  Int i = 0
  Int j = 0
  ObjectReference Marker
  while (i < 7)
    i += 1
    Marker = FindMarkerByOrder()
    if Marker
      if bIsArrived(Marker)
        return True
      endif
      j = ExcludedMarkerList.Find(None)
      if j > -1
        ExcludedMarkerList[j] = Marker
      endif
    else
      return False
    endif
  endwhile
  return False
endfunction

Bool function bCanTeleport()
  Int iIndex = QuestBlackList.GetSize()
  while iIndex > 0
    iIndex -= 1
    Quest ForbidenQuest = QuestBlackList.GetAt(iIndex) As Quest
    if ForbidenQuest
      if ForbidenQuest.IsRunning()
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't Respawn while " + ForbidenQuest + " is running.")
        return False
      endif
    endif
  endwhile
  if isJsonBlacklistedQuestsRunning()
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't Respawn while a blacklisted quest is running.")
    return False
  endif
  Location CurrLoc = PlayerRef.GetCurrentLocation()
  if CurrLoc
    if CurrLoc.HasKeywordString("loctypejail")
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn from jail is disabled.")
      return False
    endif
    if bIsLocForbidden(CurrLoc) || bIsRespawnForbidden(CurrLoc)
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn from " + CurrLoc + " is disabled.")
      return False
    endif
  endif
  return True
endfunction

Bool function bCanTeleportToDynMarker(Objectreference Marker)
  if Marker
    Location CurrLoc = Marker.GetCurrentLocation()
    if CurrLoc && (CurrLoc.HasKeywordString("loctypejail") || bIsLocForbidden(CurrLoc))
      return False
    endif
    if !Marker.IsDisabled()
      if (Marker.GetParentCell() != ReviveScript.DefaultCell)
        return True
      endif
    endif
  endif
  return False
endfunction

Bool function bCanTeleportToExtMarker(Objectreference ExternalMarker)
  if ExternalMarker
    Int iIndex = LocationBlackList.GetSize()
    while iIndex > 0
      iIndex -= 1
      if ExternalMarker.IsInLocation(LocationBlackList.GetAt(iIndex) As Location)
        return False
      endif
    endwhile
    if (!ExternalMarker.IsDisabled() && (ExternalMarker.GetParentCell() != ReviveScript.DefaultCell))
      return True
    endif
  endif
  return False
endfunction

Bool function bCheckTavernMarkers()
  if TavernMarkers.Length != InnLocations.GetSize()
    return False
  endif
  if TavernCapitalMarkers.Length != InnLocationsCapital.GetSize()
    return False
  endif
  Int i = TavernMarkers.Length
  Int j = TavernCapitalMarkers.Length
  while (i > 0) || (j > 0)
    if i > 0
      i -= 1
      if !TavernMarkers[i] As ObjectReference
        return False
      endif
    endif
    if j > 0
      j -= 1
      if !TavernCapitalMarkers[j] As ObjectReference
        return False
      endif
    endif
  endwhile
  return True
endfunction

Bool[] function bGetTavernFlags()
  Bool[] flagArr = Utility.CreateBoolArray(InnLocations.GetSize(), True)
  Int i = InnLocations.GetSize()
  while i > 0
    i -= 1
    if PlayerRef.IsInLocation(InnLocations.GetAt(i) As Location)
      flagArr[i] = False
    endif
  endwhile
  if !ConfigMenu.bRespawnPointsFlags[0] ;Whiterun
    flagArr[0] = False ;Sleeping Giant Inn
    flagArr[1] = False ;The Bannered Mare
    flagArr[2] = False ;Frostfruit Inn
  endif
  if !ConfigMenu.bRespawnPointsFlags[1] ;Falkreath
    flagArr[3] = False ;Dead Man's Drink
  endif
  if !ConfigMenu.bRespawnPointsFlags[2] ;Markarth
    flagArr[4] = False ;Silver-Blood Inn
    flagArr[5] = False ;Old Hroldan Inn
  endif
  if !ConfigMenu.bRespawnPointsFlags[3] ;Riften
    flagArr[6] = False ;The Bee and Barb
    flagArr[16] = False ;Vilemyr Inn
  endif
  if !ConfigMenu.bRespawnPointsFlags[4] ;Solitude
    flagArr[7] = False ;The Winking Skeever
    flagArr[8] = False ;Four Shields Tavern
  endif
  if !ConfigMenu.bRespawnPointsFlags[5] ;Windhelm
    flagArr[9] = False ;Candlehearth Hall
    flagArr[10] = False ;Braidwood Inn
  endif
  if !ConfigMenu.bRespawnPointsFlags[6] ;Winterhold
    flagArr[11] = False ;The Frozen Hearth
  endif
  if !ConfigMenu.bRespawnPointsFlags[7] ;RavenRock
    flagArr[12] = False ;The Retching Netch
  endif
  if !ConfigMenu.bRespawnPointsFlags[8] ;Morthal
    flagArr[13] = False ;Moorside Inn
  endif
  if !ConfigMenu.bRespawnPointsFlags[9] ;Dawnstar
    flagArr[14] = False ;Windpeak Inn
    flagArr[15] = False ;Nightgate Inn
  endif
  return flagArr
endfunction

Bool function bHasEditorLocation(ObjectReference akMarker, Location akLocation)
  return akMarker.GetEditorLocation() && akMarker.GetEditorLocation() == akLocation
endfunction

Bool function bInSameLocation(Location akLoc, ObjectReference akMarker=None)
  if akLoc
    if !akMarker
      akMarker = PlayerMarker
    endif
    if akMarker.IsInLocation(akLoc)
      return True
    endif
    if akMarker.GetCurrentLocation()
      if akMarker.GetCurrentLocation().IsSameLocation(akLoc, HoldKeyword)
        return True
      endif
    endif
  endif
  return False
endfunction

Bool function bIsArrived(ObjectReference akMarker)
  while !ReviveScript.bReadyForRespawn
    Utility.WaitMenuMode(0.2)
  endwhile
  Float fMinDistance = 1000.0
  if ConfigMenu.bIsRagdollEnabled
    fMinDistance = 4000.0
  endif
  PlayerRef.DispelAllSpells()
  if PlayerRef.IsBleedingOut() || (PlayerRef.GetActorValue("Health") < PlayerRef.GetBaseActorValue("Health"))
    PlayerRef.DispelSpell(ReviveScript.Bleed)
    PlayerRef.ResetHealthAndLimbs()
    PlayerRef.RestoreActorValue("health", 10000)
  endif
  if !ReviveScript.bIsCameraStateSafe()
    Game.ForceThirdPerson()
  endif
  if !bIsTeleportSafe(akMarker)
    if PlayerRef.GetActorValue("paralysis")
      PlayerRef.SetActorValue("paralysis", 0)
      if PlayerRef.GetActorValue("paralysis")
        PlayerRef.ForceActorValue("paralysis", 0)
      endif
      Utility.Wait(6.5)
    endif
    Float i = 10.0
    while (!bIsTeleportSafe(akMarker) && (i > 0.0))
      Utility.Wait(0.2)
      i -= 0.2
    endwhile
    if ReviveScript.SexLabInterface.IsActorActive(PlayerRef)
      Debug.Trace("MarkOfArkay: The player is in a Sexlab animation and cannot teleport.")
      return True
    endif
  endif
    Game.SetPlayerAIDriven(False)  
  playerRef.SetDontMove(False)
  Float fTravel = PlayerMarker.GetDistance(akMarker)
  PlayerRef.MoveTo(akMarker, afZOffset=15.0)
  Utility.Wait(0.5)
  Float fFrom = PlayerRef.GetDistance(PlayerMarker)
  Float fTo = PlayerRef.GetDistance(akMarker)
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance between two Points: " + fTravel)
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance Traveled: " + fFrom)
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Distance from Destination: " + fTo)
  if fTo < fMinDistance
    if fTravel < 1500.0 || fFrom > fTo
      if bFirstTry
        bFirstTry = False
      endif
      return True
    endif
  endif
  if bFirstTry
    bFirstTryFailed = True
    bFirstTry = False
  endif
  return False
endfunction

Bool function bIsCurrentCell(int iIndex, Bool bTavernMarker=False)
  if bTavernMarker
    return ((TavernMarkers[iIndex] As Objectreference).GetParentCell() == PlayerMarker.GetParentCell())
  endif
  return (((MarkerList.GetAt(iIndex)) As Objectreference).GetParentCell() == PlayerMarker.GetParentCell())
endfunction

Bool function bIsLocForbidden(Location akLoc)
  Int iIndex = LocationBlackList.GetSize()
  while iIndex > 0
    iIndex -= 1
    Location ForbiddenLocation = LocationBlackList.GetAt(iIndex) As Location
    if ForbiddenLocation
      if akLoc == ForbiddenLocation || ForbiddenLocation.IsChild(akLoc)
        return True
      endif
    endif
  endwhile
  return False
endfunction

Bool function bIsRespawnForbidden(Location akLoc)
  Int iIndex = ReviveScript.LocationBlackList2.GetSize()
  while iIndex > 0
    iIndex -= 1
    Location ForbiddenLocation = ReviveScript.LocationBlackList2.GetAt(iIndex) As Location
    if ForbiddenLocation
      if akLoc == ForbiddenLocation || ForbiddenLocation.IsChild(akLoc)
        return True
      endif
    endif
  endwhile
  return False
endfunction

Bool function bIsTeleportSafe(ObjectReference akMarker)
  if bFirstTryFailed
    bFirstTryFailed = False
    return False
  endif
  return !(PlayerRef.GetAnimationVariableBool("bIsSynced") || PlayerRef.GetActorValue("paralysis") || ReviveScript.SexLabInterface.IsActorActive(PlayerRef))
endfunction

Bool function bSendToCustomMarker(Int iSlot)
  Int iSelectedSlot = iSlot
  Int i = iSelectedSlot
  if bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(i) As ObjectReference)
    if PlayerRef.GetDistance(CustomRespawnPoints.GetAt(i) As ObjectReference) >= fRPMinDistance
      if bIsArrived(CustomRespawnPoints.GetAt(i) As ObjectReference)
        return True
      endif
    endif
  endif
  i = 0
  while i < CustomRespawnPoints.getSize()
    if i != iSelectedSlot
      if bCanTeleportToDynMarker(CustomRespawnPoints.GetAt(i) As ObjectReference)
        if PlayerRef.GetDistance(CustomRespawnPoints.GetAt(i) As ObjectReference) >= fRPMinDistance
          if bIsArrived(CustomRespawnPoints.GetAt(i) As ObjectReference)
            return True
          endif
        endif
      endif
    endif
    i += 1
  endwhile
  return False
endfunction

Bool function bSendToExternalMarker(Int iExternalIndex)
  ObjectReference akMarker
  Int iIndex = -1
  if moaERPCount.GetValueInt() > 0
    if iExternalIndex > -1 && iExternalIndex < moaERPCount.GetValueInt()
      akMarker = getFromMergedFormList(MergedExternalMarkerList, iExternalIndex) As ObjectReference
      if akMarker && (akMarker.GetParentCell() != PlayerRef.GetParentCell()) && bCanTeleportToExtMarker(akMarker) && (PlayerRef.GetDistance(akMarker) >= fRPMinDistance)
        if bIsArrived(akMarker)
          return True
        endif
      endif
      iIndex = iExternalIndex
    endif
    Int i = iMin(3, moaERPCount.GetValueInt() - 1)
    Bool[] bExcludes = Utility.CreateBoolArray(moaERPCount.GetValueInt(), True)
    if iIndex > -1 && iIndex < moaERPCount.GetValueInt()
      bExcludes[iIndex] = False
    endif
    while i > 0
      i -= 1
      iIndex = RandomIntWithExclusionArray(0, moaERPCount.GetValueInt() - 1, bExcludes)
      akMarker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if akMarker && (akMarker.GetParentCell() != PlayerRef.GetParentCell()) && bCanTeleportToExtMarker(akMarker) && (PlayerRef.GetDistance(akMarker) >= fRPMinDistance)
        if bIsArrived(akMarker)
          return True
        endif
      endif
      bExcludes[iIndex] = False
    endwhile
  endif
  return False
endfunction

Bool function bSendToSleepMarker()
  if bCanTeleportToDynMarker(SleepMarker)
    if PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance
      return bIsArrived(SleepMarker)
    endif
  endif
  return False
endfunction

Bool function bSendToTOW()
  return (PlayerRef.GetDistance(TOWMarker) >= fRPMinDistance) && bIsArrived(TOWMarker)
endfunction

Bool function bTryToMoveByQuest(Quest aTargetDetector, ReferenceAlias akTarget, Int aiTry=1, FormList akFailedTargets=None)
  Int i = aiTry
  Int j
  ObjectReference Marker
  if akFailedTargets
    akFailedTargets.Revert()
  endif
  while i > 0
    i -= 1
    if !aTargetDetector.IsRunning()
      aTargetDetector.Start()
    else
      j = 0
      aTargetDetector.Stop()
      while !aTargetDetector.IsStopped() && j < 30
        Utility.Wait(0.1)
        j += 1
      endwhile
      aTargetDetector.Start()
    endif
    if aTargetDetector.IsRunning()
      if (!Marker || (Marker != (akTarget.GetReference() As ObjectReference)))
        Marker = akTarget.GetReference() As ObjectReference
        if Marker
          if bIsArrived(Marker)
            if akFailedTargets
              akFailedTargets.Revert()
            endif
            aTargetDetector.Stop()
            return True
          elseif akFailedTargets && !akFailedTargets.HasForm(Marker)
            akFailedTargets.AddForm(Marker)
          endif
        endif
      endif
    endif
  endwhile
  if akFailedTargets
    akFailedTargets.Revert()
  endif
  aTargetDetector.Stop()
  return False
endfunction

function checkJsonBlackListedLocations()
  if !ConfigMenu.bLocBlackListJsonChecked
    if ConfigMenu.bPUOK
      if JsonUtil.JsonExists("/MarkofArkay/MOA_BlackLists")
        Form[] LocArr = JsonUtil.FormListToArray("/MarkofArkay/MOA_BlackLists", "LocationBlackList")
        Int i = LocArr.Length
        while i > 0
          i -= 1
          if !ReviveScript.LocationBlackList2.HasForm(LocArr[i])
            ReviveScript.LocationBlackList2.AddForm(LocArr[i])
          endif
        endwhile
        ConfigMenu.bLocBlackListJsonChecked = True
      endif
    endif
  endif
endfunction

function checkMarkers(Bool bCheckInn, Bool bCheckExtra, Bool bCheckCustom, Bool bFast=False)
  if !bCheckInn && !bCheckExtra && !bCheckCustom
    return
  endif
  if moaCheckingMarkers.GetValue() != 1.0
    moaCheckingMarkers.SetValue(1.0)
  else
    return
  endif
  Debug.Notification("$mrt_MarkofArkay_Notification_Checking_Markers_Started")
  if bCheckInn
    setTavernMarkers(ConfigMenu.moaIsBusy.GetValue() As Bool)
  endif
  if bCheckExtra
    AddExternalMarkers(bFast)
  endif
  if bCheckCustom
    ConfigMenu.setCustomRPS(bFast)
  endif
  moaCheckingMarkers.SetValue(0.0)
  Debug.Notification("$mrt_MarkofArkay_Notification_Checking_Markers_Finished")
endfunction

function findNearbyMarker()
  Location Curlocation
  if PlayerMarker.GetCurrentLocation()
    Curlocation = PlayerMarker.GetCurrentLocation()
  else
    PlayerRefMarker.ForceRefTo(PlayerMarker)
    return
  endif
  FormList Markers
  if PlayerRef.IsInInterior()
    Markers = InteriorMarkers
  else
    Markers = ExteriorMarkers
  endif
  ObjectReference Marker
  Marker = Game.FindClosestReferenceOfAnyTypeInListFromRef(Markers, PlayerMarker, 50000.0)
  if !Marker || !bHasEditorLocation(Marker, Curlocation)
    Int i
    if Marker
      ObjectReference[] PrevMarkers = new ObjectReference[5]
      i = 5
      while i > 0 && Marker && !bHasEditorLocation(Marker, Curlocation)
        i -= 1
        PrevMarkers[i] = Marker
        Marker = Game.FindRandomReferenceOfAnyTypeInListFromRef(Markers, PrevMarkers[i], 50000.0)
        if PrevMarkers.Find(Marker) > -1 || (PlayerMarker.GetDistance(Marker) > 50000.0)
          Marker = None
        endif
      endwhile
    endif
    if !Marker || !bHasEditorLocation(Marker, Curlocation)
      i = 5
      while i > 0 && (!Marker || !bHasEditorLocation(Marker, Curlocation))
        i -= 1
        Marker = Game.FindRandomReferenceOfAnyTypeInListFromRef(Markers, PlayerMarker, 50000.0)
      endwhile
    endif
  endif
  if Marker && bHasEditorLocation(Marker, Curlocation)
    PlayerRefMarker.ForceRefTo(Marker)
  else
    PlayerRefMarker.ForceRefTo(PlayerMarker)
  endif
endfunction

ObjectReference function getCenterMarker(Location Loc)
  stopAndConfirm(DestinationCenterDetector)
  DestinationLocation.ForceLocationTo(Loc)
  DestinationCenterDetector.Start()
  return DestinationCenter.GetReference() As ObjectReference
endfunction

ObjectReference function getLocationMarker(Location Loc)
  stopAndConfirm(LocMarkerDetector)
  DestinationLocation.ForceLocationTo(Loc)
  LocMarkerDetector.Start()
  return DestinationMarkerAlias.GetReference() As ObjectReference
endfunction

Int function iGetRandomRefFromListWithExclusions(Int iFrom, Int iTo, Formlist RefList)
  Int ExcludeCount = 0
  int iIndex = 0
  Int iRandom = 0
  ObjectReference MarkerRef
  while iIndex < RefList.GetSize()
    if RefList.GetAt(iIndex).GetType() != 61
      ExcludeCount += 1
    else
      MarkerRef = (RefList.GetAt(iIndex) As ObjectReference)
      if (!bCanTeleportToExtMarker(MarkerRef) || bIsRefInCurrentCell(MarkerRef))
        ExcludeCount += 1
      endif
    endif
    iIndex += 1
  endwhile
  if (ExcludeCount == RefList.GetSize())
    return -1
  endif
  iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
  iIndex = 0
  while (iIndex < RefList.GetSize())
    MarkerRef = (RefList.GetAt(iIndex) As ObjectReference)
    if (iRandom < iIndex)
      return iRandom
    elseif ((iRandom >= iIndex) && ((RefList.GetAt(iIndex).GetType() != 61) || !bCanTeleportToExtMarker(MarkerRef) || BIsRefInCurrentCell(MarkerRef)))
      iRandom += 1
    endif
    iIndex += 1
  endwhile
  return iRandom
endfunction

Int function iGetRandomWithExclusionArray(Int iFrom, Int iTo, Bool[] iFlagArray, Bool bTavern=False)
  if iFrom == iTo
    if iFlagArray[iFrom]
      return iFrom
    endif
    return -1
  elseif iFrom > iTo
    Int iTemp = iFrom
    iFrom = iTo
    iTo = iTemp
  endif
  Int ExcludeCount = 0
  int iIndex = iFrom
  while iIndex <= iTo
    if (!iFlagArray[iIndex] || bIsCurrentCell(iIndex, bTavern))
      ExcludeCount += 1
    endif
    iIndex += 1
  endwhile
  if ExcludeCount > (iTo - iFrom)
    return -1
  endif
  Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
  iIndex = iFrom
  while (iIndex <= iTo)
    if (iRandom < iIndex)
      return iRandom
    elseif ((iRandom >= iIndex) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex, bTavern)))
      iRandom += 1
    endif
    iIndex += 1
  endwhile
  return iRandom
endfunction

Bool function isJsonBlacklistedQuestsRunning()
  if ConfigMenu.bPUOK
    if JsonUtil.JsonExists("/MarkofArkay/MOA_BlackLists")
      Form[] QuestArr = JsonUtil.FormListToArray("/MarkofArkay/MOA_BlackLists", "QuestBlackList")
      Int i = QuestArr.Length
      while i > 0
        i -= 1
        if (QuestArr[i] As Quest) && (QuestArr[i] As Quest).IsRunning()
          return True
        endif
      endwhile
    endif
  endif
  return False
endfunction

function sendToRandomCity()
  Int i
  if ConfigMenu.bMoreRandomRespawn
    moaRandomDestination.SetValueInt(1)
    DisabledLocations.Revert()
    i = LocationsList.GetSize()
    while i > 0
      i -= 1
      if !ConfigMenu.bRespawnPointsFlags[i]
        DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
      endif
    endwhile
    if bTryToMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 7, FailedDestinations)
      return
    endif
  endif
  i = iGetRandomWithExclusionArray(0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags)
  if i > -1
    bIsArrived(MarkerList.GetAt(i) As Objectreference)
  else
    SendToDefaultMarker()
  endif
endfunction

function sendToRandomInn()
  Int i = iGetRandomWithExclusionArray(0, InnLocations.GetSize() - 1, bGetTavernFlags(), True)
  if (i > -1) && bIsArrived(TavernMarkers[i] As ObjectReference)
    return
  else
    sendToRandomCity()
  endif
endfunction

function setTavernMarkers(Bool bReset=False)
  Debug.TraceConditional("MarkOfArkay: Adding inn markers ...", ConfigMenu.bIsLoggingEnabled)
  if !bReset && bCheckTavernMarkers()
    Debug.TraceConditional("MarkOfArkay: All inn markers are already added.", ConfigMenu.bIsLoggingEnabled)
    return
  endif
  TavernMarkers = Utility.CreateFormArray(InnLocations.GetSize())
  TavernCapitalMarkers = Utility.CreateFormArray(InnLocationsCapital.GetSize())
  Int i = InnLocations.GetSize()
  Int j = InnLocationsCapital.GetSize()
  while i > 0
    i -= 1
    TavernMarkers[i] = getCenterMarker(InnLocations.GetAt(i) As Location)
    if j > 0
      j -= 1
      TavernCapitalMarkers[j] = getCenterMarker(InnLocationsCapital.GetAt(j) As Location)
    endif
  endwhile
  Debug.TraceConditional("MarkOfArkay: Adding inn markers finished.", ConfigMenu.bIsLoggingEnabled)
endfunction
