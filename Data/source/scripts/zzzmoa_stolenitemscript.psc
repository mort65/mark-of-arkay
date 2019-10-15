Scriptname zzzmoa_stolenitemscript extends ObjectReference

zzzmoaReviverScript Property ReviveScript Auto
Actor Property PlayerRef Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If !PlayerRef.IsGhost()
		PlayerRef.SetGhost(True)
	EndIf
	If akNewContainer == PlayerRef
		If ReviveScript.moaRetrieveLostItems.IsRunning()
			ReviveScript.moaRetrieveLostItems.setStage(20)
		EndIf
		If ReviveScript.moaRetrieveLostItems01.IsRunning()
			ReviveScript.moaRetrieveLostItems01.setStage(20)
		EndIf
		If ReviveScript.ConfigMenu.bSoulMarkCureDiseases 
			ReviveScript.DiseaseScript.cureAllDiseases(False)
		EndIf
		ReviveScript.ItemScript.RestoreLostItems(PlayerRef)		
	EndIf
	PlayerRef.SetGhost(False)
EndEvent
