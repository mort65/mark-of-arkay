Scriptname zzzmoa_stolenitemscript extends ObjectReference

zzzmoaReviverScript Property ReviveScript Auto
Actor Property PlayerRef Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		If ReviveScript.moaRetrieveLostItems.IsRunning()
			ReviveScript.moaRetrieveLostItems.setStage(20)
		EndIf
		If ReviveScript.moaRetrieveLostItems01.IsRunning()
			ReviveScript.moaRetrieveLostItems01.setStage(20)
		EndIf
		ReviveScript.RestoreLostItems(PlayerRef)		
	EndIf
EndEvent
