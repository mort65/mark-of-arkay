Scriptname zzzmoa_CellDetachMarkerScript extends objectreference

Actor Property PlayerRef Auto
GlobalVariable Property moaState Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker1 Auto
GlobalVariable Property moaBleedoutHandlerState Auto

Event OnCellDetach()
	If moaState.GetValue() == 1
		If moaBleedoutHandlerState.GetValue() == 0
			DetachMarker1.Enable()
			DetachMarker1.MoveTo(DetachMarker2)
		EndIf
		Enable()
		MoveTo(PlayerRef)
	EndIf
EndEvent