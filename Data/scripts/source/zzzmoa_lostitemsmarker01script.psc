Scriptname zzzmoa_LostItemsMarker01Script extends ReferenceAlias

Spell property ArkayCurse auto
Spell property ArkayCurseAlt auto
zzzmoaReviveMCM property ConfigMenu auto
ObjectReference property LostItemsChest auto
Actor property PlayerRef auto
EffectShader property TurnUnDisintegrate01FXS auto
Quest property moaRetrieveLostItems auto
Quest property moaRetrieveLostItems01 auto

Bool bIsActive

event OnActivate(ObjectReference akActionRef)
  if bIsActive
    return
  endif
  bIsActive = True
  if !PlayerRef.IsGhost()
    PlayerRef.SetGhost(True)
  endif
  if (akActionRef As Actor) == PlayerRef
    if ConfigMenu.ReviveScript.ItemScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ConfigMenu.ReviveScript.skillscript.bSkillReduced() || ConfigMenu.ReviveScript.moaPlayerVoicelessQuest.IsRunning() || ConfigMenu.ReviveScript.moaPlayerGhostQuest.IsRunning()
      Debug.Notification("$mrt_MarkofArkay_Notification_SoulMark_Activated")
      GetActorReference().SetCriticalStage(GetActorReference().CritStage_DisintegrateStart)
      TurnUnDisintegrate01FXS.Play(GetActorReference(), 2.0)
      Utility.Wait(2.0)
      TurnUnDisintegrate01FXS.Stop(GetActorReference())
      GetActorReference().SetCriticalStage(GetActorReference().CritStage_DisintegrateEnd)
      GetActorReference().SetAlpha(0.0)
      Utility.Wait(0.5)
      GetActorReference().MoveTo(ConfigMenu.ReviveScript.LostItemsChest)
      if ConfigMenu.bSoulMarkCureDiseases
        ConfigMenu.ReviveScript.DiseaseScript.cureAllDiseases(False)
      endif
      ConfigMenu.ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
      if moaRetrieveLostItems.IsRunning()
        moaRetrieveLostItems.SetStage(20)
      endif
      if moaRetrieveLostItems01.IsRunning()
        moaRetrieveLostItems01.SetStage(20)
      endif
    endif
  endif
  bIsActive = False
  PlayerRef.SetGhost(False)
endevent

event OnUpdate()
  if GetActorReference() && GetActorReference().GetParentCell() != ConfigMenu.ReviveScript.DefaultCell
    RegisterForSingleUpdate(30.0)
  endif
endevent
