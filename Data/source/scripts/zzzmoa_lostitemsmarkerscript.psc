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
	If (akActionRef As Actor) == PlayerRef
		If ReviveScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.bSkillReduced()
			Self.MoveToMyEditorLocation()
			If (ReviveScript.ThiefNPC.GetReference() As Actor)
				ReviveScript.RemoveStolenItemMarkers(ReviveScript.ThiefNPC.GetReference() As Actor)
				(ReviveScript.ThiefNPC.GetReference() As Actor).RemoveFromFaction(ReviveScript.PlayerEnemyFaction)
			EndIf
			If ReviveScript.Thief
				ReviveScript.RemoveStolenItemMarkers(ReviveScript.Thief)
				ReviveScript.Thief.RemoveFromFaction(ReviveScript.PlayerEnemyFaction)
			EndIf
			ReviveScript.RemoveStolenItemMarkers(PlayerRef)
			ReviveScript.Thief = None
			ReviveScript.bStealSoul = False
			PlayerRef.RemoveSpell(ArkayCurse)
			PlayerRef.RemoveSpell(ArkayCurseAlt)
			LostItemsChest.RemoveAllItems(PlayerRef, True, True)
			If ReviveScript.fLostSouls > 0.0
				PlayerRef.ModActorValue("DragonSouls", ReviveScript.fLostSouls)
				ReviveScript.fLostSouls = 0.0
			EndIf
			ReviveScript.RestoreSkills()
			ReviveScript.bIsItemsRemoved = False
			Debug.Notification("$mrt_MarkofArkay_Notification_SoulMark_Activated")
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
			ReviveScript.moaSoulMark01.Stop()
			ReviveScript.moaThiefNPC01.Stop()
			Self.Disable()
		EndIf
	EndIf
EndEvent