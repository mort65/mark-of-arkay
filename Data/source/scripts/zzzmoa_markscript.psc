Scriptname zzzmoa_MarkScript extends activemagiceffect

import zzzmoautilscript

zzzmoaReviveMCM property ConfigMenu auto
FormList property CustomRespawnPoints auto
Formlist property ExtraCustomMarkerList auto
MiscObject property MarkOfArkay auto
Actor property PlayerRef auto
Static property XMarkerHeading auto
Message property moaMarkMenu auto
Message property moaMarkMenu08 auto
Message property moaMarkMenu080 auto
Message property moaMarkOverwriteConfirm auto
Message property moaRemoveAllExtraMarksConfirm auto
Message property moaRemoveExtraMarkerConfirm auto

ObjectReference Marker
Bool bCanAddPlayerCell = False
Bool bCellIsMarked = False
Bool bCustomMarkersChanged = False
Bool bExtraAdded = False
Bool bExtraMarkersChanged = False
Bool bExtraRemoved = False
Int iExtraNumLimit = 128

event OnEffectStart(Actor akTarget, Actor akCaster)
  if akCaster != PlayerRef
    return
  endif
  if PlayerRef.GetParentCell() == ConfigMenu.ReviveScript.DefaultCell
    Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
    return
  endif
  if (PlayerRef.GetItemCount(MarkOfArkay) < ConfigMenu.fMarkCastSlider)
    Debug.Notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
    return
  endif
  Int iIndex = -1
  Utility.Wait(0.5)
  Bool bBreak = False
  bExtraAdded = False
  bCellIsMarked = False
  bExtraRemoved = False
  bExtraMarkersChanged = False
  bCanAddPlayerCell = bCanAddPlayerCell()
  Int iMessage = 0
  Int iButton = 0
  Int aiButton = 0
  while !bBreak
    if iButton == -1
    elseif iMessage == 0
      iButton = moaMarkMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
      if iButton == -1
      elseif iButton < 8
        iIndex = iButton / 2 ;(0,1)=0,(2,3)=1,(4,5)=2,(6,7)=3
        bBreak = True
      elseif iButton == 8
        iMessage = 1
      else
        bBreak = True
      endif
    elseif iMessage == 1
      iButton = moaMarkMenu08.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
      if iButton == -1
      elseif iButton == 0 ;Detail
        ConfigMenu.ShowCustomSlotsInfo()
      elseif iButton == 1 ;Extra
        iMessage = 2
      elseif iButton == 2 ;Back
        iMessage = 0
      elseif iButton == 3 ;Cancel
        bBreak = True
      endif
    elseif iMessage == 2
      iButton = moaMarkMenu080.Show()
      if iButton == -1
      elseif iButton == 0 ;Add
        if bCanAddPlayerCell
          if iIsCurentCellMarked(1)
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Already_Marked")
          elseif ExtraCustomMarkerList.GetSize() > iExtraNumLimit - 1
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Num_Limit")
          else
            Marker = PlayerRef.PlaceAtMe(XMarkerHeading, abForcePersist=False) ;Persist or not?
            Marker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
            Marker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
            ExtraCustomMarkerList.AddForm(Marker)
            bExtraAdded = True
            bExtraMarkersChanged = True
          endif
          if bExtraAdded
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Added")
          else
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Cannot_Mark")
          endif
        else
          Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
        endif
      elseif iButton == 1 ;Remove this place
        if ExtraCustomMarkerList.GetSize() > 0
          Int i = ExtraCustomMarkerList.GetSize()
          bExtraRemoved = False
          while i > 0
            i -= 1
            if ExtraCustomMarkerList.GetAt(i) As ObjectReference
              if (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
                if ExtraCustomMarkerList.GetAt(i).GetType() == 61 && (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetBaseObject().GetType() == 34
                  Marker = ExtraCustomMarkerList.GetAt(i) As ObjectReference
                  ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i))
                  Marker.DisableNoWait()
                  Marker.Delete()
                else
                  ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i))
                endif
                Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Removed")
                bExtraMarkersChanged = True
                bExtraRemoved = True
              endif
            else
              ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i))
              bExtraMarkersChanged = True
            endif
          endwhile
          if !bExtraRemoved
            if iIsCurentCellMarked(2) > 1
              Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Cannot_Remove_External_Markers")
            else
              Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
            endif
          endif
        else
          Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Already_Removed")
        endif
      elseif iButton == 2 ;Remove by index
        if ExtraCustomMarkerList.GetSize() > 0
          Int i = 1
          Bool abBreak = False
          while !abBreak
            aiButton = ConfigMenu.ReviveScript.RespawnScript.moaRespawnMenu13_Alt.Show(i)
            if aiButton == -1
            elseif aiButton == 0 ;Prev
              i = ichangeVar(i, 1, ExtraCustomMarkerList.GetSize(), -1)
            elseif aiButton == 1 ;Next
              i = ichangeVar(i, 1, ExtraCustomMarkerList.GetSize(), 1)
            elseif aiButton == 2 ;Input
              if ConfigMenu.bUIEOK
                UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
                TextMenu.SetPropertyString("text", (i) As String)
                TextMenu.OpenMenu(none, none)
                String sResult = TextMenu.GetResultString()
                TextMenu.ResetMenu()
                if sResult && bIsInteger(sResult) && ((sResult As Int) - 1) > -1 && ((sResult As Int) - 1) < ExtraCustomMarkerList.GetSize()
                  i = (sResult As Int)
                endif
              endif
            elseif aiButton == 3 ;Check
              ConfigMenu.ShowExtraRPInfo(i - 1, 1, 2)
            elseif aiButton == 4 ;OK
              if moaRemoveExtraMarkerConfirm.Show()
                if ExtraCustomMarkerList.GetAt(i - 1).GetType() == 61 && (ExtraCustomMarkerList.GetAt(i - 1) As ObjectReference).GetBaseObject().GetType() == 34
                  Marker = ExtraCustomMarkerList.GetAt(i - 1) As ObjectReference
                  ExtraCustomMarkerList.RemoveAddedForm(Marker)
                  Marker.DisableNoWait()
                  Marker.Delete()
                else
                  ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i - 1))
                endif
                Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Removed")
                if ExtraCustomMarkerList.GetSize() > 0
                  if i > ExtraCustomMarkerList.GetSize()
                    i = ExtraCustomMarkerList.GetSize()
                  endif
                else
                  Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
                  abBreak = True
                endif
                bExtraMarkersChanged = True
              endif
            elseif aiButton == 5 ;Random
              if ExtraCustomMarkerList.GetSize() > 1
                i = iGetRandomWithExclusion(1, ExtraCustomMarkerList.GetSize(), i)
              endif
            elseif aiButton == 6 ;Back
              abBreak = True
            endif
          endwhile
        else
          Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Already_Removed")
        endif
      elseif iButton == 3 ;Remove all
        if ExtraCustomMarkerList.GetSize() > 0
          if moaRemoveAllExtraMarksConfirm.Show()
            Int i = ExtraCustomMarkerList.GetSize()
            while i > 0
              i -= 1
              if ExtraCustomMarkerList.GetAt(i).GetType() == 61 && (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetBaseObject().GetType() == 34
                Marker = ExtraCustomMarkerList.GetAt(i) As ObjectReference
                ExtraCustomMarkerList.RemoveAddedForm(Marker)
                Marker.DisableNoWait()
                Marker.Delete()
              else
                ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i))
              endif
            endwhile
            ExtraCustomMarkerList.Revert()
            bExtraMarkersChanged = True
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
          endif
        else
          Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Already_Removed")
        endif
      elseif iButton == 4 ;Check
        if bCanAddPlayerCell
          bCellIsMarked = False
          if iIsCurentCellMarked(1) > 0
            bCellIsMarked = True
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked")
          endif
          if iIsCurentCellMarked(2) > 0
            bCellIsMarked = True
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Externally_Marked")
          endif
          Int i = ConfigMenu.CustomRespawnPoints.GetSize()
          Bool bFound = False
          while i > 0 && !bFound
            i -= 1
            if (CustomRespawnPoints.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
              Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked_As_Custom")
              bFound = True
            endif
          endwhile
          if !bFound && !bCellIsMarked
            Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
          endif
        else
          Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
        endif
      elseif iButton == 5 ;Back
        iMessage = 1
      elseif iButton == 6 ;Cancel
        bBreak = True
      endif
    endif
  endwhile
  Marker = None
  if iIndex > -1 && iIndex < CustomRespawnPoints.getSize() && (ConfigMenu.isCustomSlotEmpty(iIndex) || moaMarkOverwriteConfirm.Show())
    Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
    bCustomMarkersChanged = True
  else
    ConfigMenu.ReviveScript.checkMarkers(False, bExtraMarkersChanged, False, False)
    if bExtraAdded && ConfigMenu.fMarkCastSlider > 0.0
      PlayerRef.RemoveItem(MarkOfArkay, ConfigMenu.fMarkCastSlider As Int, False)
    endif
    return
  endif
  Marker.Enable()
  Marker.MoveTo(PlayerRef)
  Marker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
  Marker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
  if ConfigMenu.bAutoSwitchRP
    ConfigMenu.iTeleportLocation = ConfigMenu.getCustomRPIndex()
    ConfigMenu.iSelectedCustomRPSlot = iIndex
    ConfigMenu.SetCustomRPFlags()
  endif
  ConfigMenu.ReviveScript.checkMarkers(False, bExtraMarkersChanged, bCustomMarkersChanged, False)
  if ConfigMenu.fMarkCastSlider > 0.0
    PlayerRef.RemoveItem(MarkOfArkay, ConfigMenu.fMarkCastSlider As Int, False)
  endif
endevent

Bool function bCanAddPlayerCell()
  if PlayerRef.GetCurrentLocation()
    Int iIndex = ConfigMenu.ReviveScript.RespawnScript.LocationBlackList.GetSize()
    while iIndex > 0
      iIndex -= 1
      if PlayerRef.IsInLocation(ConfigMenu.ReviveScript.RespawnScript.LocationBlackList.GetAt(iIndex) As Location)
        return False
      endif
    endwhile
  endif
  if PlayerRef.GetParentCell() != ConfigMenu.ReviveScript.DefaultCell
    return True
  endif
  return False
endfunction

Bool function bIsMarkerInList(ObjectReference akMarker, Int iList=0)
  if iList == 1
    return ExtraCustomMarkerList.HasForm(akMarker)
  elseif iList == 2
    return ConfigMenu.ReviveScript.RespawnScript.MergedExternalMarkerSubList.HasForm(akMarker) || ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(akMarker)
  else
    return ExtraCustomMarkerList.HasForm(akMarker) || ConfigMenu.ReviveScript.RespawnScript.MergedExternalMarkerSubList.HasForm(akMarker) || ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(akMarker)
  endif
endfunction

Int function iIsCurentCellMarked(Int iList=0)
  Int i
  if !iList || (iList == 1)
    i = ExtraCustomMarkerList.GetSize()
    while i > 0
      i -= 1
      if ExtraCustomMarkerList.GetAt(i) As ObjectReference
        if (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
          return 1
        endif
      endif
    endwhile
  endif
  if !iList || (iList == 2)
    i = ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetSize()
    while i > 0
      i -= 1
      if (ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
        return 2
      endif
    endwhile
    i = ConfigMenu.ReviveScript.RespawnScript.MergedExternalMarkerSubList.GetSize()
    while i > 0
      i -= 1
      if (ConfigMenu.ReviveScript.RespawnScript.MergedExternalMarkerSubList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
        return 3
      endif
    endwhile
  endif
  return 0
endfunction
