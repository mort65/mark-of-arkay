Scriptname zzzmoa_RecallScript extends activemagiceffect

import zzzmoautilscript

Objectreference property CellLoadMarker auto
Objectreference property CellLoadMarker2 auto
Formlist property CityMarkersList auto
zzzmoaReviveMCM property ConfigMenu auto
FormList property CustomRespawnPoints auto
Location property DLC1HunterHQLocation auto
Location property DLC1VampireCastleLocation auto
Formlist property Destinations auto
ObjectReference property DetachMarker1 auto
ObjectReference property DetachMarker2 auto
ObjectReference property DetachMarker3 auto
FormList property DisabledLocations auto
ObjectReference[] property DynamicMarkerList auto Hidden
Formlist property ExternalMarkerList auto
Location property HjaalmarchHoldLocation auto
Keyword property HoldKeyword auto
ObjectReference property LocationMarker auto
ObjectReference property LocationMarker2 auto
FormList property LocationsList auto
MiscObject property MarkOfArkay auto
FormList property MarkerList auto
Formlist property MergedExternalMarkerList auto
Location property PaleHoldLocation auto
ObjectReference property PlayerMarker auto
ReferenceAlias property RandomCityTeleportRef auto
ReferenceAlias property RandomTeleportRef auto
zzzmoaReviverScript property ReviveScript auto
ObjectReference property SleepMarker auto
ObjectReference property TOWMarker auto
Formlist property TeleportDestination auto
ReferenceAlias property TeleportRef auto
Message property moaCustomRecallMenu auto
GlobalVariable property moaERPCount auto
Quest property moaNearbyDetector auto
Quest property moaRandomCityDetector auto
GlobalVariable property moaRandomDestination auto
Quest property moaRandomMarkerDetector auto
Message property moaTeleportMenu0 auto
Message property moaTeleportMenu1 auto
Message property moaTeleportMenu13 auto

Actor Caster
Int iMarkerIndex
Int iTavernIndex

event OnEffectStart(Actor akTarget, Actor akCaster)
  if akCaster == Game.GetPlayer()
    Caster = Game.GetPlayer()
  else
    return
  endif
  if (!ConfigMenu.bIsRecallRestricted || Game.IsFastTravelEnabled())
    if (Caster.GetItemCount(MarkOfArkay) >= ConfigMenu.fRecallCastSlider)
      Int iTeleportLocation = ConfigMenu.iTeleportLocation
      Int iExternalIndex = ConfigMenu.iExternalIndex
      Int iCustomRPSlot = ConfigMenu.iSelectedCustomRPSlot
      iTavernIndex = ConfigMenu.iTavernIndex
      if (ConfigMenu.bTeleportMenu)
        moaERPCount.SetValue(ReviveScript.RespawnScript.MergedExternalMarkerSubList.GetSize() + ReviveScript.RespawnScript.ExternalLocationMarkerList.GetSize() + ReviveScript.RespawnScript.ExtraCustomMarkerList.GetSize())
        Utility.Wait(0.5)
        iTeleportLocation = TeleportMenu()
        if ((iTeleportLocation == -1) || (iTeleportLocation > (ConfigMenu.sRespawnPoints.Length - 1)))
          if (iTeleportLocation == -1)
            iExternalIndex = iTeleportLocation
          else
            iExternalIndex = (iTeleportLocation - (ConfigMenu.sRespawnPoints.Length))
          endif
          iTeleportLocation = ConfigMenu.getExternalRPIndex() ;External
        elseif iTeleportLocation < -2
          iCustomRPSlot = (iTeleportLocation * -1) - 3 ; -3-> 0, -4-> 1, -5-> 2
          iTeleportLocation = ConfigMenu.getCustomRPIndex() ;Custom
        endif
      endif
      if iTeleportLocation > -1
        PlayerMarker.Enable()
        PlayerMarker.MoveTo(Caster)
        ReviveScript.bReadyForRespawn = True
        if iTeleportLocation < ConfigMenu.getNearbyCityRPIndex()
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
            Bool bResult = bMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 5)
            if bResult
              if ConfigMenu.fRecallCastSlider > 0.0 && (Caster.GetParentCell() != PlayerMarker.GetParentCell() || (Caster.GetDistance(PlayerMarker) > 499.0))
                Caster.RemoveItem(MarkOfArkay, ConfigMenu.fRecallCastSlider As Int, False)
              endif
              PlayerMarker.MoveToMyEditorLocation()
              PlayerMarker.Disable()
              return
            endif
          endif
          Caster.MoveTo(MarkerList.GetAt(iTeleportLocation) As Objectreference, abMatchRotation=true)
        elseif iTeleportLocation == ConfigMenu.getNearbyCityRPIndex()
          SendToNearbyCity()
        elseif iTeleportLocation == ConfigMenu.getRandCityRPIndex()
          SendToRandomCity()
        elseif iTeleportLocation == (ConfigMenu.getTavernRPIndex())
          if iTavernIndex == ConfigMenu.getNearbyInnRPIndex()
            ReviveScript.RespawnScript.sendToNearbyInn()
          elseif iTavernIndex == ConfigMenu.getRandInnRPIndex()
            ReviveScript.RespawnScript.sendToRandomInn()
          else
            ObjectReference Marker = ReviveScript.RespawnScript.getCenterMarker(ReviveScript.RespawnScript.InnLocations.GetAt(iTavernIndex) As Location)
            if Marker
              Caster.MoveTo(Marker)
              return
            else
              SendToAnotherLocation()
            endif
          endif
        elseif iTeleportLocation == ConfigMenu.getSleepRPIndex()
          if !bSendToSleepMarker()
            if !bSendToCustomMarker(iCustomRPSlot)
              SendToAnotherLocation()
            endif
          endif
        elseif iTeleportLocation == ConfigMenu.getCustomRPIndex()
          if !bSendToCustomMarker(iCustomRPSlot)
            if !bSendToSleepMarker()
              SendToAnotherLocation()
            endif
          endif
        elseif iTeleportLocation == ConfigMenu.getExternalRPIndex()
          if !bSendToExternalMarker(iExternalIndex)
            if !bSendToSleepMarker()
              if !bSendToCustomMarker(iCustomRPSlot)
                SendToAnotherLocation()
              endif
            endif
          endif
        elseif iTeleportLocation == ConfigMenu.getCheckpointRPIndex()
          SendToCheckPoint()
        elseif iTeleportLocation == ConfigMenu.getNearbyRPIndex()
          SendToNearbyLocation()
        elseif iTeleportLocation == ConfigMenu.getRandomRPIndex()
          RandomTeleport()
        elseif iTeleportLocation == ConfigMenu.getThroatRPIndex()
          sendToTOW()
        endif
        if ConfigMenu.fRecallCastSlider > 0.0 && (Caster.GetParentCell() != PlayerMarker.GetParentCell() || (Caster.GetDistance(PlayerMarker) > 499.0))
          Caster.RemoveItem(MarkOfArkay, ConfigMenu.fRecallCastSlider As Int, False)
        endif
        PlayerMarker.MoveToMyEditorLocation()
        PlayerMarker.Disable()
      endif
    else
      Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
    endif
  else
    Debug.notification("$mrt_MarkofArkay_Notification_Teleportation_Off")
  endif
endevent

function RandomTeleport()
  if ConfigMenu.bMoreRandomRespawn
    PlayerMarker.Enable()
    PlayerMarker.MoveTo(Caster)
    DisabledLocations.Revert()
    Int i = LocationsList.GetSize()
    while i > 0
      i -= 1
      if !ConfigMenu.bRespawnPointsFlags[i]
        DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
      endif
    endwhile
    if !ConfigMenu.bRespawnPointsFlags[8]
      DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(8) As Location)
    endif
    if !ConfigMenu.bRespawnPointsFlags[9]
      DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(9) As Location)
    endif
    Bool bResult = bMoveByQuest(moaRandomMarkerDetector, RandomTeleportRef, 5)
    PlayerMarker.MoveToMyEditorLocation()
    PlayerMarker.Disable()
    if bResult
      return
    endif
  endif
  Destinations.Revert()
  int iIndex = 0
  Int iRandom = 0
  while iIndex < MarkerList.GetSize()
    if ConfigMenu.bRespawnPointsFlags[iIndex] && Caster.GetDistance(MarkerList.GetAt(iIndex) As Objectreference) >= ConfigMenu.fRPMinDistanceSlider
      Destinations.AddForm(MarkerList.GetAt(iIndex) As Objectreference)
    endif
    iIndex += 1
  endwhile
  Bool[] bInnFlags = ReviveScript.RespawnScript.bGetTavernFlags()
  iIndex = ReviveScript.RespawnScript.InnLocations.GetSize()
  while iIndex > 0
    iIndex -= 1
    if bInnFlags[iIndex]
      Destinations.AddForm(ReviveScript.RespawnScript.TavernMarkers[iIndex] As ObjectReference)
    endif
  endwhile
  if !SleepMarker.Isdisabled() && (SleepMarker.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(SleepMarker) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(SleepMarker)
  endif
  iIndex = 0
  while iIndex < CustomRespawnPoints.GetSize()
    if ConfigMenu.isCustomSlotAvailable(iIndex) && !ConfigMenu.isCustomSlotEmpty(iIndex)
      if Caster.GetDistance((CustomRespawnPoints.GetAt(iIndex) As ObjectReference)) >= ConfigMenu.fRPMinDistanceSlider
        Destinations.AddForm(CustomRespawnPoints.GetAt(iIndex) As ObjectReference)
      endif
    endif
    iIndex += 1
  endwhile
  if moaERPCount.GetValueInt() > 0
    iIndex = 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    ObjectReference Marker
    while iIndex < iLast
      if !((Marker.GetType() != 61) || !ReviveScript.RespawnScript.bCanTeleportToExtMarker(Marker) || (Caster.GetDistance(Marker) < ConfigMenu.fRPMinDistanceSlider))
        Destinations.AddForm(Marker)
      endif
      iIndex += 1
    endwhile
  endif
  if !CellLoadMarker2.Isdisabled() && (CellLoadMarker2.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(CellLoadMarker2) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(CellLoadMarker2)
  endif
  if !DetachMarker3.Isdisabled() && (DetachMarker3.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(DetachMarker3) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(DetachMarker3)
  endif
  if !LocationMarker2.Isdisabled() && (LocationMarker2.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(LocationMarker2) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(LocationMarker2)
  endif
  if CellLoadMarker.Isdisabled() && (CellLoadMarker.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(CellLoadMarker) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(CellLoadMarker)
  endif
  if LocationMarker.Isdisabled() && (LocationMarker.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(LocationMarker) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(LocationMarker)
  endif
  if DetachMarker1.Isdisabled() && (DetachMarker1.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(DetachMarker1) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(DetachMarker1)
  endif
  if DetachMarker2.Isdisabled() && (DetachMarker2.GetParentCell() != ReviveScript.DefaultCell) && Caster.GetDistance(DetachMarker2) >= ConfigMenu.fRPMinDistanceSlider
    Destinations.AddForm(DetachMarker2)
  endif
  if Destinations.GetSize() > 0
    iRandom = Utility.RandomInt(0, Destinations.GetSize() - 1)
    Caster.MoveTo(Destinations.GetAt(iRandom) As ObjectReference)
  else
    sendToTOW()
  endif
endfunction

function SendToAnotherLocation()
  ObjectReference Marker = ReviveScript.RespawnScript.FindInnMarkerByLocation()
  if Marker
    Caster.MoveTo(Marker)
    return
  endif
  Marker = FindCityMarkerByLocation()
  if Marker
    Caster.MoveTo(Marker)
    return
  endif
  ReviveScript.RespawnScript.sendToRandomInn()
endfunction

function SendToCheckPoint()
  Float fDistance
  ObjectReference Marker
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
  Int iIndex = DynamicMarkerList.Length
  while iIndex > 0
    iIndex -= 1
    if (!DynamicMarkerList[iIndex].IsDisabled() && (DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell))
      if (Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider)
        if (!Caster.IsInInterior() || (Caster.GetParentCell() == DynamicMarkerList[iIndex].GetParentCell()))
          if (!fDistance || (fDistance > Caster.GetDistance(DynamicMarkerList[iIndex])))
            fDistance = Caster.GetDistance(DynamicMarkerList[iIndex])
            Marker = DynamicMarkerList[iIndex]
          endif
        endif
      endif
    endif
  endwhile
  if (Marker && fDistance < 999999999.0)
    Caster.MoveTo(Marker)
    return
  endif
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    ObjectReference tempMarker
    iIndex = 0
    while iIndex < iLast
      tempMarker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if (tempMarker.GetType() == 61)
        if ReviveScript.RespawnScript.bCanTeleportToExtMarker(tempMarker)
          if (Caster.GetParentCell() == tempMarker.GetParentCell())
            if (!fDistance || (fDistance > Caster.GetDistance(tempMarker)))
              if (Caster.GetDistance(tempMarker) >= ConfigMenu.fRPMinDistanceSlider)
                fDistance = Caster.GetDistance(tempMarker)
                Marker = tempMarker
              endif
            endif
          endif
        endif
      endif
      iIndex += 1
    endwhile
  endif
  if !Caster.IsInInterior()
    iIndex = CityMarkersList.GetSize()
    while (iIndex > 0)
      iIndex -= 1
      if ConfigMenu.bRespawnPointsFlags[iIndex]
        if (!fDistance || (fDistance > Caster.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)))
          fDistance = Caster.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
          Marker = MarkerList.GetAt(iIndex) As ObjectReference
        endif
      endif
    endwhile
  endif
  if (Marker && fDistance < 999999999.0)
    Caster.MoveTo(Marker)
    return
  endif
  iIndex = DynamicMarkerList.Length
  while iIndex > 0
    iIndex -= 1
    if (Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider)
      if (!DynamicMarkerList[iIndex].IsDisabled() && (DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell))
        if (bInSameLocation(DynamicMarkerList[iIndex].GetCurrentLocation()) || (ReviveScript.RespawnScript.IsInInteriorActual(Caster) && !ReviveScript.RespawnScript.IsInInteriorActual(DynamicMarkerList[iIndex])))
          Caster.MoveTo(DynamicMarkerList[iIndex])
          return
        endif
      endif
    endif
  endwhile
  if moaERPCount.GetValueInt() > 0
    Int iLast = iMin(128, moaERPCount.GetValueInt())
    iIndex = 0
    while iIndex < iLast
      Marker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
      if (Marker.GetType() == 61)
        if ReviveScript.RespawnScript.bCanTeleportToExtMarker(Marker)
          if bInSameLocation(Marker.GetCurrentLocation())
            if (Caster.GetDistance(Marker) >= ConfigMenu.fRPMinDistanceSlider)
              Caster.MoveTo(Marker)
              return
            endif
          endif
        endif
      endif
      iIndex += 1
    endwhile
  endif
  iIndex = LocationsList.GetSize()
  while (iIndex > 0)
    iIndex -= 1
    if (iIndex == 3)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
        if ConfigMenu.bRespawnPointsFlags[iIndex]
          if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
            Caster.MoveTo(MarkerList.GetAt(iIndex) As ObjectReference)
            return
          endif
        endif
      endif
    elseif (iIndex == 4)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal
        if ConfigMenu.bRespawnPointsFlags[iIndex]
          if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
            Caster.MoveTo(MarkerList.GetAt(iIndex) As ObjectReference)
            return
          endif
        endif
      endif
    elseif (iIndex == 6)
      if (bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation)) ;Winterhold or Dawnstar
        if ConfigMenu.bRespawnPointsFlags[iIndex]
          if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
            Caster.MoveTo(MarkerList.GetAt(iIndex) As ObjectReference)
            return
          endif
        endif
      endif
    elseif bInSameLocation(LocationsList.GetAt(iIndex) As Location)
      if ConfigMenu.bRespawnPointsFlags[iIndex]
        if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
          Caster.MoveTo(MarkerList.GetAt(iIndex) As ObjectReference)
          return
        endif
      endif
    endif
  endwhile
  iIndex = DynamicMarkerList.Length
  while iIndex > 0
    iIndex -= 1
    if (Caster.GetDistance(DynamicMarkerList[iIndex]) >= ConfigMenu.fRPMinDistanceSlider)
      if (!DynamicMarkerList[iIndex].IsDisabled() && (DynamicMarkerList[iIndex].GetParentCell() != ReviveScript.DefaultCell))
        Caster.MoveTo(DynamicMarkerList[iIndex])
        return
      endif
    endif
  endwhile
  SendToRandomCity()
endfunction

function SendToNearbyCity()
  ObjectReference Marker = FindCityMarkerByLocation()
  if Marker
    Caster.MoveTo(Marker)
    return
  endif
  if !ReviveScript.RespawnScript.IsInInteriorActual(PlayerMarker)
    float fDistance
    Int iIndex
    ObjectReference tempMarker
    if moaERPCount.GetValueInt() > 0
      Int iLast = iMin(128, moaERPCount.GetValueInt())
      while iIndex < iLast
        tempMarker = getFromMergedFormList(MergedExternalMarkerList, iIndex) As ObjectReference
        if (!fDistance || (fDistance > PlayerMarker.GetDistance(tempMarker)))
          fDistance = PlayerMarker.GetDistance(tempMarker)
          Marker = tempMarker
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
          if (!fDistance || (fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)))
            fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
            Marker = MarkerList.GetAt(iIndex) As ObjectReference
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
    if (Marker && fDistance && fDistance < 500001)
      Caster.MoveTo(Marker)
      return
    endif
  endif
  sendToRandomCity()
endfunction

function SendToNearbyLocation()
  PlayerMarker.Enable()
  PlayerMarker.MoveTo(Caster)
  PlayerMarker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
  PlayerMarker.SetAngle(0.0, 0.0, Caster.GetAnglez())
  Utility.Wait(0.5)
  ReviveScript.RespawnScript.findNearbyMarker()
  if !bMoveByQuest(moaNearbyDetector, TeleportRef, 5)
    SendToCheckPoint()
  endif
  PlayerMarker.MoveToMyEditorLocation()
  PlayerMarker.Disable()
endfunction

function SendToRandomCity()
  Int i
  if ConfigMenu.bMoreRandomRespawn
    PlayerMarker.Enable()
    PlayerMarker.MoveTo(Caster)
    moaRandomDestination.SetValueInt(1)
    DisabledLocations.Revert()
    i = LocationsList.GetSize()
    while i > 0
      i -= 1
      if !ConfigMenu.bRespawnPointsFlags[i]
        DisabledLocations.AddForm(LocationsList.GetAt(i) As Location)
      endif
    endwhile
    if !ConfigMenu.bRespawnPointsFlags[8]
      DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(8) As Location)
    endif
    if !ConfigMenu.bRespawnPointsFlags[9]
      DisabledLocations.AddForm(ReviveScript.RespawnScript.InnHoldLocations.GetAt(9) As Location)
    endif
    Bool bResult = bMoveByQuest(moaRandomCityDetector, RandomCityTeleportRef, 5)
    PlayerMarker.MoveToMyEditorLocation()
    PlayerMarker.Disable()
    if bResult
      return
    endif
  endif
  i = iGetRandomWithExclusionArray(0, (MarkerList.GetSize() - 1), ConfigMenu.bRespawnPointsFlags)
  if i > -1
    Caster.MoveTo(MarkerList.GetAt(i) As Objectreference, abMatchRotation=true)

    ;Else
    ;	sendToTOW()
  endif
endfunction

Int function TeleportMenu(Int aiMessage=0, Int aiButton=0)
  Int iIndex = 1
  while True
    if aiButton == -1 ; Can prevent problems if recycling aiButton
    elseif aiMessage == 0
      aiButton = moaTeleportMenu0.Show()
      if aiButton == -1
      elseif aiButton < ConfigMenu.getNearbyCityRPIndex() ;Whiterun,...,Raven Rock
        return aiButton
      elseif aiButton == ConfigMenu.getNearbyCityRPIndex() ;More
        aiMessage = 1
      elseif aiButton == (ConfigMenu.getNearbyCityRPIndex() + 1) ;Cancel
        return -2
      endif
    elseif aiMessage == 1
      aiButton = moaTeleportMenu1.Show()
      if aiButton == -1
      elseif aiButton == 0 ;City
        aiMessage = 4
      elseif aiButton == 1 ;Inn
        aiMessage = 5
      elseif aiButton == 3 ;Custom
        aiMessage = 2
      elseif aiButton == 4 ;External
        aiMessage = 3
      elseif aiButton < 9 ;City,...,Throat of the World
        return aiButton + ConfigMenu.getRandCityRPIndex()
      elseif aiButton == 9 ;Less
        aiMessage = 0
      endif
    elseif aiMessage == 2 ;Custom
      aiButton = moaCustomRecallMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
      if aiButton == -1
      elseif aiButton == 4 ;Details
        ConfigMenu.ShowCustomSlotsInfo()
      elseif aiButton == 5 ;Back
        aiMessage = 1
      elseif aiButton == 6 ;Cancel
        return -2
      else
        return -3 - aiButton ;0-> -3, 1-> -4, 2-> -5
      endif
    elseif aiMessage == 3
      if moaERPCount.GetValueInt() > 7
        aiButton = ReviveScript.RespawnScript.moaRespawnMenu13_Alt.Show(iIndex)
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
          ConfigMenu.ShowExtraRPInfo(iIndex - 1, 1, 0)
        elseif aiButton == 4 ;OK
          return (iIndex + (ConfigMenu.sRespawnPoints.Length - 1))
        elseif aiButton == 5 ;External(Random)
          return -1
        elseif aiButton == 6 ;Back
          aiMessage = 1
        endif
      else
        aiButton = moaTeleportMenu13.Show()
        if aiButton == -1
        elseif aiButton < 7 ;External(1,...,7)
          return (aiButton + (ConfigMenu.sRespawnPoints.Length))
        elseif aiButton == 7 ;External(Random)
          return -1
        elseif aiButton == 8 ;Details
          ConfigMenu.ShowExtraRPInfo(0, 7, 0)
        elseif aiButton == 9 ;Back
          aiMessage = 1
        endif
      endif
    elseif aiMessage == 4
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu10.Show()
      if aiButton == -1
      elseif aiButton == 0
        return ConfigMenu.getNearbyCityRPIndex()
      elseif aiButton == 1
        return ConfigMenu.getRandCityRPIndex()
      elseif aiButton == 2
        aiMessage = 1
      endif
    elseif aiMessage == 5
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu11.Show()
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
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu110.Show()
      if aiButton == -1
      elseif aiButton < 3
        iTavernIndex = aiButton
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 3
        aiMessage = 5
      endif
    elseif aiMessage == 7 ;Falkreath Inn (1)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu111.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 3
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 8 ;Markarth Inn (2)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu112.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 4
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 9 ;Riften Inn (1)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu113.Show()
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
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu114.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 7
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 11 ;Windhelm Inn (2)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu115.Show()
      if aiButton == -1
      elseif aiButton < 2
        iTavernIndex = aiButton + 9
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 2
        aiMessage = 5
      endif
    elseif aiMessage == 12 ;Winterhold Inn (1)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu116.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 11
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 13 ;Raven Rock Inn (1)
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu117.Show()
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 12
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 14
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu118.Show()
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
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu1180.Show() ;Morthal Inn (1)
      if aiButton == -1
      elseif aiButton < 1
        iTavernIndex = aiButton + 13
        return ConfigMenu.getTavernRPIndex()
      elseif aiButton == 1
        aiMessage = 5
      endif
    elseif aiMessage == 16
      aiButton = ReviveScript.RespawnScript.moaRespawnMenu1181.Show() ;Dawnstar Inn (2)
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

Bool function bInSameLocation(Location Loc)
  if Loc
    if Caster.IsInLocation(Loc)
      return True
    endif
    if Caster.GetCurrentLocation()
      if Caster.GetCurrentLocation().IsSameLocation(Loc, HoldKeyword)
        return True
      endif
    endif
  endif
  return False
endfunction

Bool function bIsCurrentCell(int iIndex)
  return (((MarkerList.GetAt(iIndex)) As Objectreference).GetParentCell() == Caster.GetParentCell())
endfunction

Bool function bMoveByQuest(Quest aTargetDetector, ReferenceAlias akTarget, Int aiTry=1)
  Int i = aiTry
  Int j
  ObjectReference Marker
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
          Caster.MoveTo(Marker)
          aTargetDetector.Stop()
          return True
        endif
      endif
    endif
  endwhile
  aTargetDetector.Stop()
  return False
endfunction

Bool function bSendToCustomMarker(Int iSlot)
  Int iSelectedSlot = iSlot
  Int i = iSelectedSlot
  if ConfigMenu.isCustomSlotAvailable(i) && !ConfigMenu.isCustomSlotEmpty(i)
    Caster.MoveTo((CustomRespawnPoints.GetAt(i) As ObjectReference), abMatchRotation=true)
    return True
  endif
  i = 0
  while i < CustomRespawnPoints.getSize()
    if i != iSelectedSlot
      if ConfigMenu.isCustomSlotAvailable(i) && !ConfigMenu.isCustomSlotEmpty(i)
        Caster.MoveTo((CustomRespawnPoints.GetAt(i) As ObjectReference), abMatchRotation=true)
        return True
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
      if akMarker && (akMarker.GetParentCell() != Caster.GetParentCell()) && ReviveScript.RespawnScript.bCanTeleportToExtMarker(akMarker)
        Caster.MoveTo(akMarker, abMatchRotation=true)
        return True
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
      if akMarker && (akMarker.GetParentCell() != Caster.GetParentCell()) && ReviveScript.RespawnScript.bCanTeleportToExtMarker(akMarker)
        Caster.MoveTo(akMarker, abMatchRotation=true)
        return True
      endif
      bExcludes[iIndex] = False
    endwhile
  endif
  return False
endfunction

Bool function bSendToSleepMarker()
  if !SleepMarker.IsDisabled() && (SleepMarker.GetParentCell() != ReviveScript.DefaultCell)
    Caster.MoveTo(SleepMarker, abMatchRotation=true)
    return True
  endif
  return False
endfunction

ObjectReference function findCityMarkerByLocation()
  Int iIndex = LocationsList.GetSize()
  while (iIndex > 0)
    iIndex -= 1
    if (iIndex == 3)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
        ;	If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif
      endif

      ;EndIf
    elseif (iIndex == 4)
      if bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) || bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
        ;	If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif
      endif

      ;EndIf
    elseif (iIndex == 6)
      if (bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation)) ;Winterhold or Dawnstar
        ;	If ConfigMenu.bRespawnPointsFlags[iIndex]
        if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
          return MarkerList.GetAt(iIndex) As ObjectReference
        endif
      endif

      ;EndIf
    elseif bInSameLocation(LocationsList.GetAt(iIndex) As Location)
      ;If ConfigMenu.bRespawnPointsFlags[iIndex]
      if (Caster.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= ConfigMenu.fRPMinDistanceSlider)
        return MarkerList.GetAt(iIndex) As ObjectReference
      endif

      ;EndIf
    endif
  endwhile
  return None
endfunction

Int function iGetRandomWithExclusionArray(Int iFrom, Int iTo, Bool[] iFlagArray)
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
    if (!iFlagArray[iIndex] || bIsCurrentCell(iIndex))
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
    elseif ((iRandom >= iIndex) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex)))
      iRandom += 1
    endif
    iIndex += 1
  endwhile
  return iRandom
endfunction

function sendToTOW()
  Caster.MoveTo(TOWMarker)
endfunction
