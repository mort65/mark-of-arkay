Scriptname zzzmoa_LostItemsMarkerScript extends ObjectReference  

ObjectReference Property LostItemsChest Auto
Actor Property PlayerRef Auto
Quest Property moaRetrieveLostItems Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
zzzmoaReviverScript Property ReviveScript Auto
zzzmoaReviveMCM Property ConfigMenu Auto

Event OnActivate(ObjectReference akActionRef)
	If (akActionRef As Actor) == PlayerRef
		If ReviveScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt)
			Self.MoveToMyEditorLocation()
			If ReviveScript.bIsItemsRemoved 
				LostItemsChest.RemoveAllItems(PlayerRef, True, True)
				If ReviveScript.fLostSouls > 0.0
					PlayerRef.ModActorValue("DragonSouls", ReviveScript.fLostSouls)
					ReviveScript.fLostSouls = 0.0
				EndIf
				ReviveScript.bIsItemsRemoved = False
				Debug.Notification("$mrt_MarkofArkay_Notification_RestoreLostItems")
			EndIf
			PlayerRef.RemoveSpell(ArkayCurse)
			PlayerRef.RemoveSpell(ArkayCurseAlt)
			If ConfigMenu.bLostItemQuest || moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			Self.Disable()
		EndIf
	EndIf
EndEvent
