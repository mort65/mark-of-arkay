Scriptname zzzmoa_CellDetachMarkerScript extends objectreference

Actor Property PlayerRef Auto
GlobalVariable Property moaState Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker3 Auto
GlobalVariable Property moaBleedoutHandlerState Auto
zzzmoaReviveMCM Property ConfigMenu Auto

Event OnCellDetach()
	;Debug.Trace("Detached1")
	If moaState.GetValue() == 1
		If moaBleedoutHandlerState.GetValue() == 0
			If DetachMarker1.IsInInterior()
				DetachMarker3.Enable()
				DetachMarker3.MoveTo(DetachMarker1)
				DetachMarker3.SetPosition(DetachMarker1.GetPositionx(), DetachMarker1.GetPositiony(), DetachMarker1.GetPositionz())
				DetachMarker3.SetAngle(0.0, 0.0, DetachMarker1.GetAnglez())
			EndIf
			DetachMarker1.Enable()
			DetachMarker1.MoveTo(DetachMarker2)
			DetachMarker1.SetPosition(DetachMarker2.GetPositionx(), DetachMarker2.GetPositiony(), DetachMarker2.GetPositionz())
			DetachMarker1.SetAngle(0.0, 0.0, DetachMarker2.GetAnglez())
			If ( ConfigMenu.iSaveOption > 1 )
				Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
			EndIf
		EndIf
		Enable()
		MoveTo(PlayerRef)
		SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
		SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
	EndIf
	;Debug.Trace("Detached2")
EndEvent