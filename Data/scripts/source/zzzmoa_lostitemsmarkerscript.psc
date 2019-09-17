Scriptname zzzmoa_LostItemsMarkerScript extends ObjectReference  

ObjectReference Property LostItemsChest Auto
Actor Property PlayerRef Auto
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
zzzmoaReviverScript Property ReviveScript Auto
zzzmoaReviveMCM Property ConfigMenu Auto

Event OnActivate(ObjectReference akActionRef)
	If !PlayerRef.IsGhost()
		PlayerRef.SetGhost(True)
	EndIf
	If (akActionRef As Actor) == PlayerRef
		If ReviveScript.ItemScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.skillscript.bSkillReduced()
			Self.MoveToMyEditorLocation()
			ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
			Debug.Notification("$mrt_MarkofArkay_Notification_SoulMark_Activated")
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
			ReviveScript.moaSoulMark01.Stop()
			ReviveScript.moaThiefNPC01.Stop()
			ReviveScript.moaBossChest01.Stop()
			Self.Disable()
		EndIf
	EndIf
	PlayerRef.SetGhost(False)
EndEvent