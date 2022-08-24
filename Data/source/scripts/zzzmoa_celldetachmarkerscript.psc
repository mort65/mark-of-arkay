Scriptname zzzmoa_CellDetachMarkerScript extends objectreference

zzzmoaReviveMCM property ConfigMenu auto
ObjectReference property DetachMarker1 auto
ObjectReference property DetachMarker2 auto
ObjectReference property DetachMarker3 auto
Actor property PlayerRef auto
GlobalVariable property moaBleedoutHandlerState auto
GlobalVariable property moaState auto

event OnCellDetach()
  ;Debug.Trace("Detached1")
  if moaState.GetValue() == 1
    if moaBleedoutHandlerState.GetValue() == 0
      if DetachMarker1.IsInInterior()
        DetachMarker3.Enable()
        DetachMarker3.MoveTo(DetachMarker1)
        DetachMarker3.SetPosition(DetachMarker1.GetPositionx(), DetachMarker1.GetPositiony(), DetachMarker1.GetPositionz())
        DetachMarker3.SetAngle(0.0, 0.0, DetachMarker1.GetAnglez())
      endif
      DetachMarker1.Enable()
      DetachMarker1.MoveTo(DetachMarker2)
      DetachMarker1.SetPosition(DetachMarker2.GetPositionx(), DetachMarker2.GetPositiony(), DetachMarker2.GetPositionz())
      DetachMarker1.SetAngle(0.0, 0.0, DetachMarker2.GetAnglez())
      if (ConfigMenu.iSaveOption > 1)
        Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
      endif
    endif
    Enable()
    MoveTo(PlayerRef)
    SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
    SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
  endif

  ;Debug.Trace("Detached2")
endevent
