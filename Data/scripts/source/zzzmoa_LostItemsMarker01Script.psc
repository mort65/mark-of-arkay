Scriptname zzzmoa_LostItemsMarker01Script extends ReferenceAlias  

ObjectReference Property LostItemsChest Auto
Actor Property PlayerRef Auto
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
EffectShader property TurnUnDisintegrate01FXS auto
zzzmoaReviveMCM Property ConfigMenu Auto
Bool bIsActive

Event OnUpdate()
	If GetActorReference() && GetActorReference().GetParentCell() != ConfigMenu.ReviveScript.DefaultCell
		RegisterForSingleUpdate(30.0)
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If bIsActive
		Return
	EndIf
	bIsActive = True
	If !PlayerRef.IsGhost()
		PlayerRef.SetGhost(True)
	EndIf
	If (akActionRef As Actor) == PlayerRef
		If ConfigMenu.ReviveScript.ItemScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ConfigMenu.ReviveScript.skillscript.bSkillReduced()
			Debug.Notification("$mrt_MarkofArkay_Notification_SoulMark_Activated")
			GetActorReference().SetCriticalStage(GetActorReference().CritStage_DisintegrateStart)
			TurnUnDisintegrate01FXS.Play(GetActorReference(),2.0)
			Utility.Wait(2.0)
			TurnUnDisintegrate01FXS.Stop(GetActorReference())
			GetActorReference().SetCriticalStage(GetActorReference().CritStage_DisintegrateEnd)
			GetActorReference().SetAlpha(0.0)
			Utility.Wait(0.5)
			GetActorReference().MoveTo(ConfigMenu.ReviveScript.LostItemsChest)		
			If ConfigMenu.bSoulMarkCureDiseases 
				ConfigMenu.ReviveScript.DiseaseScript.cureAllDiseases(False)
			EndIf			
			ConfigMenu.ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
		EndIf
	EndIf
	bIsActive = False
	PlayerRef.SetGhost(False)
EndEvent
