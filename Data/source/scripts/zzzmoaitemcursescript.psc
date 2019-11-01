Scriptname zzzmoaitemcursescript extends Quest  

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
zzzmoaitemcheckerscriptA Property ItemcheckerA Auto Hidden
zzzmoaitemcheckerscriptB Property ItemcheckerB Auto Hidden
zzzmoaitemcheckerscriptC Property ItemcheckerC Auto Hidden
zzzmoaitemcheckerscriptD Property ItemcheckerD Auto Hidden
zzzmoaitemcheckerscriptE Property ItemcheckerE Auto Hidden
zzzmoaitemcheckerscriptF Property ItemcheckerF Auto Hidden
zzzmoaitemcheckerscriptG Property ItemcheckerG Auto Hidden
zzzmoaitemcheckerscriptH Property ItemcheckerH Auto Hidden
zzzmoaitemcheckerscriptI Property ItemcheckerI Auto Hidden
zzzmoaitemcheckerscriptJ Property ItemcheckerJ Auto Hidden
MiscObject Property Gold001 Auto
MiscObject Property MarkOfArkay Auto
SoulGem Property BlackFilledGem Auto
SoulGem Property GrandFilledGem Auto
Actor Property PlayerRef Auto
ObjectReference Property LostItemsChest Auto
ObjectReference Property ValuableItemsChest Auto
Faction Property PlayerEnemyFaction Auto
MiscObject Property StolenItemsMisc Auto
MiscObject Property StolenSoulsMisc Auto
Float Property fLostSouls Auto Hidden
Bool Property bIsItemsRemoved Auto Hidden
Form[] Property Equipment Auto Hidden
Form[] Property Tradables Auto Hidden
FormList Property QuestItems Auto
Bool Property bIsBusy = False Auto Hidden
Int Property iCheckLimit = 0 Auto Hidden;
Int Property iTotalValues = 0 Auto Hidden;
Int Property iItemCheckers = 0 Auto Hidden
Container Property ItemChest Auto
Bool Property bEquipmentRegistered = False Auto Hidden

Function SetVars()
	If Equipment.Length != 35
		Equipment = New Form[35]
	EndIf
	bEquipmentRegistered = False
Endfunction

Function RestoreLostItems(Actor ActorRef)
	bIsBusy = True ;prevent loop if runed from thiefnpc
	If (ReviveScript.ThiefNPC.GetReference() As Actor)
		RemoveStolenItemMarkers(ReviveScript.ThiefNPC.GetReference() As Actor)
	EndIf
	If ReviveScript.Thief
		RemoveStolenItemMarkers(ReviveScript.Thief)
	EndIf
	RemoveStolenItemMarkers(PlayerRef)
	ReviveScript.Thief = None
	ActorRef.RemoveSpell(ReviveScript.ArkayCurse)
	ActorRef.RemoveSpell(ReviveScript.ArkayCurseAlt)
	stopandConfirm(ReviveScript.moaPlayerVoicelessQuest)
	stopandConfirm(ReviveScript.moaPlayerGhostQuest,3,10)
	If ReviveScript.moaSoulMark01.IsRunning()
		ReviveScript.NPCScript.RemoveDeadClone()
		stopandConfirm(ReviveScript.moaSoulMark01,1)
		ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
		ReviveScript.LostItemsMarker.Disable()
	EndIf
	If ReviveScript.moaThiefNPC01.IsRunning() && ReviveScript.moaThiefNPC01.GetStage() < 15
		stopandConfirm(ReviveScript.moaThiefNPC01,1,25) ;Setting this to 15 or 20 would make a loop
	EndIf
	stopandConfirm(ReviveScript.moaBossChest01,1,20)
	ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
	ReviveScript.LostItemsMarker.Disable()
	LostItemsChest.RemoveAllItems(ActorRef, True, True)
	If fLostSouls > 0.0
		ActorRef.ModActorValue("DragonSouls", fLostSouls)
		fLostSouls = 0.0
	EndIf
	ReviveScript.SkillScript.RestoreSkills()
	bIsItemsRemoved = False
	Debug.Notification("$mrt_MarkofArkay_Notification_RestoreLostItems")
	bIsBusy = False
EndFunction

Function DestroyLostItems(Actor ActorRef)
	bIsBusy = True
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Destroying previously lost items...")
	If ( ( LostItemsChest.GetNumItems() > 0 ) || ( fLostSouls > 0.0 ) )
		If ConfigMenu.iDestroyedItems < 99999999
			ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
			If fLostSouls > 0.0
				ConfigMenu.iDestroyedItems += 1
			EndIf
		EndIf
	EndIf
	ReviveScript.SkillScript.LoseSkills()
	LostItemsChest.RemoveAllItems()
	fLostSouls = 0.0
	If (ReviveScript.ThiefNPC.GetReference() As Actor)
		RemoveStolenItemMarkers(ReviveScript.ThiefNPC.GetReference() As Actor)
	EndIf
	If ReviveScript.Thief
		RemoveStolenItemMarkers(ReviveScript.Thief)
	EndIf
	RemoveStolenItemMarkers(ActorRef)
	ReviveScript.Thief = None
	ActorRef.RemoveSpell(ReviveScript.ArkayCurse)
	ActorRef.RemoveSpell(ReviveScript.ArkayCurseAlt)
	stopandConfirm(ReviveScript.moaPlayerVoicelessQuest)
	stopandConfirm(ReviveScript.moaPlayerGhostQuest,3,10)
	If ReviveScript.moaSoulMark01.IsRunning()
		ReviveScript.NPCScript.RemoveDeadClone()
		stopandConfirm(ReviveScript.moaSoulMark01,1)
		ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
		ReviveScript.LostItemsMarker.Disable()
	EndIf
	If ReviveScript.moaThiefNPC01.IsRunning() && ReviveScript.moaThiefNPC01.GetStage() < 15
		stopandConfirm(ReviveScript.moaThiefNPC01,1,25)
	EndIf
	stopandConfirm(ReviveScript.moaBossChest01,1,15)
	bIsItemsRemoved = False
	ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
	ReviveScript.LostItemsMarker.Disable()
	LostItemsChest.RemoveAllItems(ActorRef, True, True)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Previously lost items are destroyed.")
	bIsBusy = False
EndFunction

Form[] Function RegisterEquipments(Actor refActor, Bool bRightArm, Bool bLeftArm)
	Int iEmpty
	Form akArmor
	Form[] EquipmentArray = New Form[35]
	Int itemIndex = 30
	If bRightArm
		iEmpty = EquipmentArray.find(None)
		If iEmpty > -1
			EquipmentArray[iEmpty] = ReviveScript.RightHandEquipedItem
		EndIf
	EndIf
	If bLeftArm
		iEmpty = EquipmentArray.find(None)
		If iEmpty > -1
			EquipmentArray[iEmpty] = ReviveScript.LeftHandEquippedItem
		EndIf
	EndIf
	While itemIndex < 62
		akArmor = refActor.GetWornForm(Armor.GetMaskForSlot(itemIndex))
		If akArmor As Armor
			If EquipmentArray.find(akArmor) < 0
				iEmpty = EquipmentArray.Find(None)
				If iEmpty > -1
					EquipmentArray[iEmpty] = akArmor
				EndIf
			EndIf
		EndIf
		itemIndex += 1
	EndWhile
	If ReviveScript.EquippedAmmo && refActor.IsEquipped(ReviveScript.EquippedAmmo As Form)
		iEmpty = EquipmentArray.Find(None)
		If iEmpty > -1
			EquipmentArray[iEmpty] = ReviveScript.EquippedAmmo
		EndIf
	EndIf
	Return EquipmentArray
EndFunction

Function EquipItems(Actor ActorRef, Bool RightHand, Bool LeftHand)
	If ConfigMenu.bSKSEOK	
		Bool bLW = False
		If RightHand 
			If	ActorRef.GetItemCount(ReviveScript.RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.RightHandEquipedItem)
				ActorRef.EquipItemEx(ReviveScript.RightHandEquipedItem, 1)
				Utility.Wait(0.2)
			EndIf
		ElseIf LeftHand && !(ReviveScript.RightHandEquipedItem As Spell)
			If	ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.LeftHandEquippedItem)
				ActorRef.EquipItemEx(ReviveScript.LeftHandEquippedItem, 1)
				bLW = True
				Utility.Wait(0.2)
			EndIf
		EndIf
		If LeftHand && !bLW && ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0
			ActorRef.EquipItemEx(ReviveScript.LeftHandEquippedItem, 2)
			Utility.Wait(0.2)
		EndIf
		Int i = Equipment.length
		While i > 0
			i -= 1
			If Equipment[i] As Armor || Equipment[i] As Ammo
				If ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
					ActorRef.EquipItemEx(Equipment[i])
					Utility.Wait(0.2)
				EndIf
			EndIf
		EndWhile
	Else
		If RightHand 
			If	ActorRef.GetItemCount(ReviveScript.RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.RightHandEquipedItem)
				ActorRef.EquipItem(ReviveScript.RightHandEquipedItem, False, True)
				Utility.Wait(0.2)
			EndIf
		ElseIf LeftHand && !(ReviveScript.RightHandEquipedItem As Spell)
			If	ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.LeftHandEquippedItem)
				ActorRef.EquipItem(ReviveScript.LeftHandEquippedItem, False, True)
				Utility.Wait(0.2)
			EndIf
		EndIf
		Int i = Equipment.length
		While i > 0
			i -= 1
			If Equipment[i] As Armor || Equipment[i] As Ammo
				If ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
					ActorRef.EquipItem(Equipment[i],False, True)
					Utility.Wait(0.2)
				EndIf
			EndIf
		EndWhile
	EndIf
EndFunction

Function LoseItems()
	If ConfigMenu.bLoseItem
		If ConfigMenu.bLoseDragonSoul
			Int iItemCount =  PlayerRef.GetActorValue("DragonSouls") As Int
			Int iAmount = 0
			If ConfigMenu.bLoseDragonSoulAll
				iAmount = iItemCount
			ElseIf PlayerRef.GetActorValue("DragonSouls")
				Int iMin = ConfigMenu.fMinLoseDragonSoulSlider As Int
				Int iMax = ConfigMenu.fMaxLoseDragonSoulSlider As Int
				iAmount = randIntFromlimitedRange(iMin,iMax,iItemCount,0,iItemCount)
			EndIf
			If iAmount > 0
				PlayerRef.ModActorValue("DragonSouls", -(iAmount As Float))
				fLostSouls += iAmount
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + iAmount + " DragonSouls removed.")
			EndIf
		EndIf
	EndIf
	Bool RightHand = ( ReviveScript.RightHandEquipedItem && !( ReviveScript.RightHandEquipedItem As Spell ) )
	Bool LeftHand =  ( ReviveScript.LeftHandEquippedItem && !( ReviveScript.LeftHandEquippedItem As Spell ) && !( ReviveScript.LeftHandEquippedItem == ReviveScript.RightHandEquipedItem ) )
	Equipment = RegisterEquipments(PlayerRef,True,True)
	bEquipmentRegistered = True
	ValuableItemsChest.RemoveAllItems()
	If ConfigMenu.bLoseItem
		If ConfigMenu.bLoseGold
			LoseItem(Gold001,ConfigMenu.bLoseGoldAll,ConfigMenu.fMinLoseGoldSlider As Int,ConfigMenu.fMaxLoseGoldSlider As Int)
		EndIf
		If ConfigMenu.bLoseArkayMark
			LoseItem(MarkOfArkay,ConfigMenu.bLoseArkayMarkAll,ConfigMenu.fMinLoseArkayMarkSlider As Int,ConfigMenu.fMaxLoseArkayMarkSlider As Int)
		EndIf
		If ConfigMenu.bLoseBlackSoulGem
			LoseItem(BlackFilledGem,ConfigMenu.bLoseBlackSoulGemAll,ConfigMenu.fMinLoseBlackSoulGemSlider As Int,ConfigMenu.fMaxLoseBlackSoulGemSlider As Int)
		EndIf
		If ConfigMenu.bLoseGrandSoulGem
			LoseItem(GrandFilledGem,ConfigMenu.bLoseGrandSoulGem,ConfigMenu.fMinLoseGrandSoulGemSlider As Int,ConfigMenu.fMaxLoseGrandSoulGemSlider As Int)
		EndIf
	EndIf
	If ConfigMenu.bLoseItem && ConfigMenu.bLoseOthers
		LoseOtherItems()
	EndIf
	ValuableItemsChest.RemoveAllItems(PlayerRef, True, True)
	If ConfigMenu.bRespawnNaked
		If !ConfigMenu.bExcludeQuestItems
			PlayerRef.Unequipall()
		EndIf
	Else
		EquipItems(PlayerRef, RightHand , LeftHand)
	EndIf
	bIsItemsRemoved = True 
EndFunction

Function LoseItem(Form kItem,Bool bLoseAll,Int iMin,Int iMax)
	Int iItemCount = PlayerRef.GetItemCount(kItem)
	Int iAmount = 0
	If bLoseAll
		iAmount = iItemCount
	ElseIf iItemCount > 0
		iAmount = randIntFromlimitedRange(iMin,iMax,iItemCount,0,iItemCount)
	EndIf
	If iAmount > 0
		PlayerRef.RemoveItem(kItem,iAmount,True,LostItemsChest)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + iAmount + " ( " + kItem.GetName() + "," + kItem + ") removed.")
	EndIf
EndFunction

Function LoseOtherItems()
	If !PlayerRef.GetNumItems() || ((ConfigMenu.iLoseInclusion == 1) && !(ConfigMenu.bLoseArmor || ConfigMenu.bLoseWeapon || ConfigMenu.bLoseAmmo))
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay:  Nothing else can be removed.")
		Return
	EndIf
	Int iIndex
	Form kItem = None
	QuestItems.Revert()
	If ConfigMenu.bExcludeQuestItems
		PlayerRef.RemoveAllItems(ValuableItemsChest,True,False)
		Utility.Wait(0.2)
		iIndex = PlayerRef.GetNumItems()
		While iIndex > 0
			iIndex -= 1
			kItem = PlayerRef.GetNthForm(iIndex)
			If kItem
				QuestItems.AddForm(kItem)
			EndIf
		Endwhile
		ValuableItemsChest.RemoveAllItems(PlayerRef,True,True)
		Utility.Wait(0.2)
	EndIf
	If ConfigMenu.iLoseInclusion == 2 ;Exclude Equipped Items
		iIndex = Equipment.Length
		While iIndex > 0
			iIndex -= 1
			If Equipment[iIndex] && !QuestItems.HasForm(Equipment[iIndex])
				If Equipment[iIndex] == ReviveScript.EquippedAmmo
					PlayerRef.RemoveItem(Equipment[iIndex],PlayerRef.GetItemCount(Equipment[iIndex]),True,ValuableItemsChest)
				Else
					PlayerRef.RemoveItem(Equipment[iIndex],1,True,ValuableItemsChest)
				EndIf
			EndIf
		EndWhile
	EndIf
	Utility.Wait(0.2)
	Bool bRemove = False
	Bool bRemoveAll = True
	iIndex = ConfigMenu.iValidTypes.Length
	While iIndex > 0
		iIndex -= 1
		If ConfigMenu.iValidTypes[iIndex] > 0
			bRemove = True
		Else
			bRemoveAll = False
		EndIf
	Endwhile
	If bRemove
		If bRemoveAll && (ConfigMenu.iLoseInclusion != 1) && \
		(ConfigMenu.fLoseOtherMinValueSlider <= 0) && \
		(ConfigMenu.fLoseOtherTotalValueSlider <= 0) && \
		!ConfigMenu.bRandomItemCurse
			PlayerRef.RemoveAllItems(LostItemsChest, True, !ConfigMenu.bExcludeQuestItems)
		Else
			Int iTotal = PlayerRef.GetNumItems()
			iCheckLimit = ConfigMenu.fMaxItemsToCheckSlider As Int
			If (iCheckLimit == 0) || (iCheckLimit > iTotal)
				iCheckLimit = iTotal
			EndIf
			Tradables = New Form[4]
			Tradables[0] = Gold001 As Form
			Tradables[1] = MarkOfArkay As Form
			Tradables[2] = BlackFilledGem As Form
			Tradables[3] = GrandFilledGem As Form 
			iItemCheckers = 10
			While iItemCheckers > 1 && (iCheckLimit / iItemCheckers) < 50
				iItemCheckers -= 1 
			EndWhile
			Form[] containerArr = Utility.CreateFormArray(iItemCheckers)
			containerArr[0] = PlayerRef
			iIndex = iItemCheckers
			Int handle
			String sModEvent
			Int iNum = iCheckLimit / iItemCheckers
			Int iChecked = iCheckLimit
			iTotalValues = 0
			While iIndex > 0
				iIndex -= 1
				If iIndex > 8
					sModEvent = "MOA_CheckItemsJ"
					If !ItemcheckerJ
						ItemcheckerJ = (Self As Quest) As zzzmoaitemcheckerscriptJ
					EndIf
					ItemcheckerJ.RegisterForModEvent(sModEvent,"OnCheckItemsJ")
				ElseIf iIndex > 7
					sModEvent = "MOA_CheckItemsI"
					If !ItemcheckerI
						ItemcheckerI = (Self As Quest) As zzzmoaitemcheckerscriptI
					EndIf
					ItemcheckerI.RegisterForModEvent(sModEvent,"OnCheckItemsI")
				ElseIf iIndex > 6
					sModEvent = "MOA_CheckItemsH"
					If !ItemcheckerH
						ItemcheckerH = (Self As Quest) As zzzmoaitemcheckerscriptH
					EndIf
					ItemcheckerH.RegisterForModEvent(sModEvent,"OnCheckItemsH")
				ElseIf iIndex > 5
					sModEvent = "MOA_CheckItemsG"
					If !ItemcheckerG
						ItemcheckerG = (Self As Quest) As zzzmoaitemcheckerscriptG
					EndIf
					ItemcheckerG.RegisterForModEvent(sModEvent,"OnCheckItemsG")
				ElseIf iIndex > 4
					sModEvent = "MOA_CheckItemsF"
					If !ItemcheckerF
						ItemcheckerF = (Self As Quest) As zzzmoaitemcheckerscriptF
					EndIf
					ItemcheckerF.RegisterForModEvent(sModEvent,"OnCheckItemsF")
				ElseIf iIndex > 3
					sModEvent = "MOA_CheckItemsE"
					If !ItemcheckerE
						ItemcheckerE = (Self As Quest) As zzzmoaitemcheckerscriptE
					EndIf
					ItemcheckerE.RegisterForModEvent(sModEvent,"OnCheckItemsE")
				ElseIf iIndex > 2
					sModEvent = "MOA_CheckItemsD"
					If !ItemcheckerD
						ItemcheckerD = (Self As Quest) As zzzmoaitemcheckerscriptD
					EndIf
					ItemcheckerD.RegisterForModEvent(sModEvent,"OnCheckItemsD")
				ElseIf iIndex > 1
					sModEvent = "MOA_CheckItemsC"
					If !ItemcheckerC
						ItemcheckerC = (Self As Quest) As zzzmoaitemcheckerscriptC
					EndIf
					ItemcheckerC.RegisterForModEvent(sModEvent,"OnCheckItemsC")
				ElseIf iIndex > 0
					sModEvent = "MOA_CheckItemsB"
					If !ItemcheckerB
						ItemcheckerB = (Self As Quest) As zzzmoaitemcheckerscriptB
					EndIf
					ItemcheckerB.RegisterForModEvent(sModEvent,"OnCheckItemsB")
				Else
					sModEvent = "MOA_CheckItemsA"
					If !ItemcheckerA
						ItemcheckerA = (Self As Quest) As zzzmoaitemcheckerscriptA
					EndIf
					ItemcheckerA.RegisterForModEvent(sModEvent,"OnCheckItemsA")
				EndIf
				handle = ModEvent.Create(sModEvent)
				If (handle)
					ModEvent.PushForm(handle, Self)
					If iIndex > 0
						containerArr[iIndex] = LostItemsChest.PlaceAtMe(ItemChest,abForcePersist = True)
						transferItems(PlayerRef, containerArr[iIndex] As ObjectReference, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
						Int iCount = iMin(iNum,(containerArr[iIndex] As ObjectReference).GetNumItems())
						iChecked -= iCount
						ModEvent.PushInt(handle, iCount)
					Else
						ModEvent.PushInt(handle, iChecked)
					EndIf
					ModEvent.PushForm(handle, containerArr[iIndex])
					ModEvent.PushBool(handle, bRemoveAll)
					If (containerArr[iIndex] As ObjectReference).GetNumItems() > 0
						ModEvent.Send(Handle)
					EndIf
				EndIf
			EndWhile
			While iItemCheckers > 0
				Utility.Wait(0.1)
			Endwhile
			iIndex = containerArr.Length
			While iIndex > 1
				iIndex -= 1
				(containerArr[iIndex] As ObjectReference).DisableNoWait()
				(containerArr[iIndex] As ObjectReference).Delete()
				containerArr[iIndex] = None
			EndWhile
			ValuableItemsChest.RemoveAllItems(PlayerRef, True, True)
		EndIf
	EndIf
	QuestItems.Revert()
EndFunction

Function RemoveStolenItemMarkers(Actor ActorRef)
	ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent = True)
	ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent = True)
EndFunction

Function AddStolenItemMarker(Actor ActorRef) ;Thief can only steal souls or only no physical item stolen
	If ActorRef
		If LostItemsChest.GetNumItems() == 0 || ActorRef.HasKeywordString("ActorTypeDragon") || ActorRef.HasKeywordString("ActorTypeGhost")
			ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent = True)
			If !ActorRef.GetItemCount(StolenSoulsMisc )
				ActorRef.AddItem(StolenSoulsMisc)
			EndIf
		Else
			ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent = True)
			If !ActorRef.GetItemCount(StolenItemsMisc )
				ActorRef.AddItem(StolenItemsMisc)
			EndIf
		EndIf
	EndIf
EndFunction

Bool Function bInventoryReduced()
	Return LostItemsChest.GetNumItems() > 0
Endfunction

Bool Function bSoulReduced()
	Return fLostSouls > 0
Endfunction
