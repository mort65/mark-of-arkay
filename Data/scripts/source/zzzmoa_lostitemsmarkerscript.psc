Scriptname zzzmoa_LostItemsMarkerScript extends ObjectReference

Spell property ArkayCurse auto
Spell property ArkayCurseAlt auto
zzzmoaReviveMCM property ConfigMenu auto
ObjectReference property LostItemsChest auto
Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto
Quest property moaRetrieveLostItems auto
Quest property moaRetrieveLostItems01 auto

event OnActivate(ObjectReference akActionRef)
  if !PlayerRef.IsGhost()
    PlayerRef.SetGhost(True)
  endif
  if (akActionRef As Actor) == PlayerRef
    if ReviveScript.ItemScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.skillscript.bSkillReduced() || ReviveScript.moaPlayerVoicelessQuest.IsRunning() || ReviveScript.moaPlayerGhostQuest.IsRunning()
      Debug.Notification("$mrt_MarkofArkay_Notification_SoulMark_Activated")
      Self.MoveToMyEditorLocation()
      if ConfigMenu.bSoulMarkCureDiseases
        ReviveScript.DiseaseScript.cureAllDiseases(False)
      endif
      ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
      if moaRetrieveLostItems.IsRunning()
        moaRetrieveLostItems.SetStage(20)
      endif
      if moaRetrieveLostItems01.IsRunning()
        moaRetrieveLostItems01.SetStage(20)
      endif
      ReviveScript.moaSoulMark01.Stop()
      ReviveScript.moaThiefNPC01.Stop()
      ReviveScript.moaBossChest01.Stop()
      Self.Disable()
    endif
  endif
  PlayerRef.SetGhost(False)
endevent
