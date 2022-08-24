Scriptname zzzmoa_stolenitemscript extends ObjectReference

Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto

event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if !PlayerRef.IsGhost()
    PlayerRef.SetGhost(True)
  endif
  if akNewContainer == PlayerRef
    if ReviveScript.moaRetrieveLostItems.IsRunning()
      ReviveScript.moaRetrieveLostItems.setStage(20)
    endif
    if ReviveScript.moaRetrieveLostItems01.IsRunning()
      ReviveScript.moaRetrieveLostItems01.setStage(20)
    endif
    if ReviveScript.ConfigMenu.bSoulMarkCureDiseases
      ReviveScript.DiseaseScript.cureAllDiseases(False)
    endif
    ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
  endif
  PlayerRef.SetGhost(False)
endevent
