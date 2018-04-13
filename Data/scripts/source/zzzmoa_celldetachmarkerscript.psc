Scriptname zzzmoa_CellDetachMarkerScript extends objectreference

Actor Property PlayerRef Auto
GlobalVariable Property moaState Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker3 Auto
GlobalVariable Property moaBleedoutHandlerState Auto

Event OnCellDetach()
	If moaState.GetValue() == 1
		If moaBleedoutHandlerState.GetValue() == 0
			If DetachMarker1.IsInInterior()
				DetachMarker3.Enable()
				DetachMarker3.MoveTo(DetachMarker1)
			EndIf
			DetachMarker1.Enable()
			DetachMarker1.MoveTo(DetachMarker2)
		EndIf
		Enable()
		MoveTo(PlayerRef)
	EndIf
EndEvent