Scriptname zzzmoaitemcursescript extends Quest  

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
zzzmoaitemcheckerscriptA Property ItemcheckerA Auto
zzzmoaitemcheckerscriptB Property ItemcheckerB Auto
zzzmoaitemcheckerscriptC Property ItemcheckerC Auto
zzzmoaitemcheckerscriptD Property ItemcheckerD Auto
zzzmoaitemcheckerscriptE Property ItemcheckerE Auto
zzzmoaitemcheckerscriptF Property ItemcheckerF Auto
zzzmoaitemcheckerscriptG Property ItemcheckerG Auto
zzzmoaitemcheckerscriptH Property ItemcheckerH Auto
zzzmoaitemcheckerscriptI Property ItemcheckerI Auto
zzzmoaitemcheckerscriptJ Property ItemcheckerJ Auto
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
Quest Property ReviverQuest Auto

Function SetVars()
	If Equipment.Length != 35
		Equipment = New Form[35]
	EndIf
	bEquipmentRegistered = False
Endfunction

Function RegisterItemCheckers()
	ItemcheckerA.RegisterForModEvent("MOA_CheckItemsA","OnCheckItemsA")
	ItemcheckerB.RegisterForModEvent("MOA_CheckItemsB","OnCheckItemsB")
	ItemcheckerC.RegisterForModEvent("MOA_CheckItemsC","OnCheckItemsC")
	ItemcheckerD.RegisterForModEvent("MOA_CheckItemsD","OnCheckItemsD")
	ItemcheckerE.RegisterForModEvent("MOA_CheckItemsE","OnCheckItemsE")
	ItemcheckerF.RegisterForModEvent("MOA_CheckItemsF","OnCheckItemsF")
	ItemcheckerG.RegisterForModEvent("MOA_CheckItemsG","OnCheckItemsG")
	ItemcheckerH.RegisterForModEvent("MOA_CheckItemsH","OnCheckItemsH")
	ItemcheckerI.RegisterForModEvent("MOA_CheckItemsI","OnCheckItemsI")
	ItemcheckerJ.RegisterForModEvent("MOA_CheckItemsJ","OnCheckItemsJ")
EndFunction

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
	PlayerRef.SetVoiceRecoveryTime(0.0)
	ReviveScript.bPlayerIsVoiceless = False
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
	transferItems(LostItemsChest,ActorRef as ObjectReference)
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
	PlayerRef.SetVoiceRecoveryTime(0.0)
	ReviveScript.bPlayerIsVoiceless = False
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
	transferItems(LostItemsChest, ActorRef As ObjectReference)
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
		;If ConfigMenu.bPUOK && ConfigMenu.bPO3OK
		;	PO3LoseOtherItems()
		;Else
			LoseOtherItems()
		;EndIf
	EndIf
	transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
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
		If ConfigMenu.bPO3OK
			Form[] QuestItemsArr = PO3_SKSEFunctions.GetQuestItems(PlayerRef As ObjectReference)
			iIndex = QuestItemsArr.Length
			While iIndex > 0
				iIndex -= 1
				kItem = QuestItemsArr[iIndex]
				If kItem && (kItem != None)
					QuestItems.AddForm(kItem)
				EndIf			
			EndWhile
		Else
			PlayerRef.RemoveAllItems(ValuableItemsChest,True,False)
			Utility.Wait(0.2)
			iIndex = PlayerRef.GetNumItems()
			While iIndex > 0
				iIndex -= 1
				kItem = PlayerRef.GetNthForm(iIndex)
				If kItem && (kItem != None)
					QuestItems.AddForm(kItem)
				EndIf
			Endwhile
		EndIf
	EndIf
	;RemoveAllItems Causes the script to halt until opening and closing a menu
	transferItems(ValuableItemsChest, PlayerRef As ObjectReference)	
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
			Tradables = New Form[4]
			Tradables[0] = Gold001 As Form
			Tradables[1] = MarkOfArkay As Form
			Tradables[2] = BlackFilledGem As Form
			Tradables[3] = GrandFilledGem As Form 
			transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
			If (ConfigMenu.iLoseInclusion == 1)
				iCheckLimit = ConfigMenu.fMaxItemsToCheckSlider As Int
				removeEquipments(PlayerRef As ObjectReference, LostItemsChest, Tradables, Equipment)
			Else
				Int iTotal = PlayerRef.GetNumItems()
				iCheckLimit = ConfigMenu.fMaxItemsToCheckSlider As Int
				If (iCheckLimit == 0) || (iCheckLimit > iTotal)
					iCheckLimit = iTotal
				EndIf
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
					ElseIf iIndex > 7
						sModEvent = "MOA_CheckItemsI"
					ElseIf iIndex > 6
						sModEvent = "MOA_CheckItemsH"
					ElseIf iIndex > 5
						sModEvent = "MOA_CheckItemsG"
					ElseIf iIndex > 4
						sModEvent = "MOA_CheckItemsF"
					ElseIf iIndex > 3
						sModEvent = "MOA_CheckItemsE"
					ElseIf iIndex > 2
						sModEvent = "MOA_CheckItemsD"
					ElseIf iIndex > 1
						sModEvent = "MOA_CheckItemsC"
					ElseIf iIndex > 0
						sModEvent = "MOA_CheckItemsB"
					Else
						sModEvent = "MOA_CheckItemsA"
					EndIf
					handle = ModEvent.Create(sModEvent)
					If (handle)
						ModEvent.PushForm(handle, ReviverQuest)
						If iIndex > 0
							containerArr[iIndex] = LostItemsChest.PlaceAtMe(ItemChest,abForcePersist = True)
							If ConfigMenu.bExcludeQuestItems
								transferItemsWithExclusions(PlayerRef, containerArr[iIndex] As ObjectReference, QuestItems, Equipment, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
							Else
								transferItemsWithExclusionArr(PlayerRef, containerArr[iIndex] As ObjectReference, Equipment, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
							EndIf
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
						Else
							iItemCheckers -= 1
						EndIf
					EndIf
					Utility.WaitMenuMode(0.1)
				EndWhile
				While iItemCheckers > 0
					Utility.WaitMenuMode(0.2)
				Endwhile
				iIndex = containerArr.Length
				While iIndex > 1
					iIndex -= 1
					(containerArr[iIndex] As ObjectReference).DisableNoWait()
					(containerArr[iIndex] As ObjectReference).Delete()
					containerArr[iIndex] = None
				EndWhile
			EndIf
			transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
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


Function PO3LoseOtherItems() ;Slow?
	If !PlayerRef.GetNumItems() || ((ConfigMenu.iLoseInclusion == 1) && !(ConfigMenu.bLoseArmor || ConfigMenu.bLoseWeapon || ConfigMenu.bLoseAmmo))
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay:  Nothing else can be removed.")
		Return
	EndIf
	Int iIndex	
	Form[] RemovableItemsArr
	If ConfigMenu.iLoseInclusion == 1
		RemovableItemsArr = Equipment
	Else
		RemovableItemsArr = PO3_SKSEFunctions.AddAllItemsToArray(akRef = PlayerRef, abNoEquipped = (ConfigMenu.iLoseInclusion == 2), abNoFavorited = false, abNoQuestItem = ConfigMenu.bExcludeQuestItems)
	EndIf
	Bool bRemove = False
	Bool bRemoveAll = True
	iIndex = ConfigMenu.iValidTypes.Length
	While iIndex > 0
		iIndex -= 1
		If ConfigMenu.iValidTypes[iIndex] > 0
			bRemove = True
		Else
			bRemoveAll = False
			RemovableItemsArr = PapyrusUtil.GetDiffForm(RemovableItemsArr, PO3_SKSEFunctions.AddItemsOfTypeToArray(PlayerRef, ConfigMenu.iValidTypes[iIndex], abNoEquipped = (ConfigMenu.iLoseInclusion == 2), abNoFavorited = false, abNoQuestItem = ConfigMenu.bExcludeQuestItems))
		EndIf
	Endwhile		
	If !(bRemove)
		Return
	EndIf	
	iIndex = 0
	Bool bContinue = False
	Bool bBreak = False
	Form kItem = None
	Int iValue = 0
	Int iAmount = 0
	Int iToRemove = 0
	Int iChecked = 0
	Bool bIsLoggingEnabled = ConfigMenu.bIsLoggingEnabled
	Int ExcludedIndexArrLen
	Int iTotal = RemovableItemsArr.Length
	If Tradables.length != 4
		Tradables = New Form[4]
		Tradables[0] = Gold001 As Form
		Tradables[1] = MarkOfArkay As Form
		Tradables[2] = BlackFilledGem As Form
		Tradables[3] = GrandFilledGem As Form 
	EndIf
	If (ConfigMenu.fMaxItemsToCheckSlider <= 0.0) || (ConfigMenu.fMaxItemsToCheckSlider As Int > iTotal)
		ExcludedIndexArrLen = iTotal
	Else
		ExcludedIndexArrLen = ConfigMenu.fMaxItemsToCheckSlider As Int
	EndIf
	
	Int[] ExcludedIndexArr = Utility.CreateIntArray(size = ExcludedIndexArrLen, fill = -1)
	While (!bBreak)
		If bContinue
			bContinue = False
		EndIf
		If iChecked == 0
			iIndex = Utility.RandomInt(0, iTotal - 1)
		Else
			iIndex = iGetRandomWithExclusionIntArray(0, iTotal - 1,  papyrusUtil.SliceIntArray(ExcludedIndexArr, 0, iChecked))
		EndIf
		ExcludedIndexArr[iChecked] = iIndex
		
		kItem = RemovableItemsArr[iIndex]
		
		If (!kItem)
			Debug.TraceConditional("MarkOfArkay: Unknown item at index(" + iIndex + ")",bIsLoggingEnabled)	
			bContinue = True
		EndIf
		
		If !bContinue
			If Tradables.Find(kItem) > -1
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> IsTradable()",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf
		
		If !bContinue
			iAmount = PlayerRef.GetItemCount(kItem)
			If ConfigMenu.iLoseInclusion == 1
				If Equipment.Find(kItem) > -1
					If ConfigMenu.bRandomItemCurse
						iToRemove = Utility.RandomInt(0,1)
					Else
						iToRemove = 1
					EndIf
				Else
					iToRemove = 0
				EndIf
			ElseIf ConfigMenu.bRandomItemCurse
				iToRemove = Utility.RandomInt(0,iAmount)
			Else
				iToRemove = iAmount
			EndIf
			If (!iToRemove)
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> Amount is 0",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf

		If !bContinue
			If ConfigMenu.bCheckKeyword
				If (kItem.HasKeywordString("zzzmoa_ignoreitem") || kItem.HasKeywordString("vendornosale") || kItem.HasKeywordString("magicdisallowenchanting") || kItem.HasKeywordString("sos_underwear") || kItem.HasKeywordString("sos_genitals"))
					Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> InvalidKeyword()",bIsLoggingEnabled)	
					bContinue = True
				EndIf
			EndIf
		EndIf
		
		If !bContinue
			If ConfigMenu.bCheckWeight
				If !kItem.GetWeight()
					Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> NoWeight()",bIsLoggingEnabled)	
					bContinue = True
				EndIf
			EndIf
		EndIf
		
		If !bContinue
			If (ConfigMenu.fLoseOtherMinValueSlider > 0) || (ConfigMenu.fLoseOtherTotalValueSlider > 0)
				iValue = kItem.GetGoldValue()
				If ConfigMenu.fLoseOtherMinValueSlider > 0
					If iValue < (ConfigMenu.fLoseOtherMinValueSlider As Int)
						Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsCheap(" + iValue +")",bIsLoggingEnabled)	
						bContinue = True
					EndIf
				EndIf
				If !bContinue
					If ConfigMenu.fLoseOtherTotalValueSlider > 0
						If (iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
							Int iCount = iToRemove
							While iCount > 0 && ((iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
								iCount -= 1
							Endwhile
							If iCount
								iToRemove = iCount									
							Else
								Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue +"," + iTotalValues + ")",bIsLoggingEnabled)	
								bContinue = True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		
		If !bContinue
			playerRef.RemoveItem(kItem, iToRemove, True, LostItemsChest )
			Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + iTotalValues + "+" + iValue + ")",bIsLoggingEnabled )	
			If ConfigMenu.fLoseOtherTotalValueSlider > 0  
				If iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
					iTotalValues = iTotalValues + (iValue * iToRemove)
					If iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)	
						bBreak = True
					EndIf
				Else
					Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)	
					bBreak = True
				EndIf
				If !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
					If (iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")",bIsLoggingEnabled)	
						bBreak = True
					EndIf
				EndIf
			EndIf						
		EndIf
		iChecked += 1
		
		If (iTotal <= iChecked)
			bBreak = True
		EndIf
		
		If bBreak
			Debug.TraceConditional("MarkOfArkay: "+ iChecked +" items checked",bIsLoggingEnabled)
		EndIf
	
	Endwhile
EndFunction


Function removeEquipments(ObjectReference akInChest, ObjectReference akOutChest, Form[] Tradables, Form[] Equipment)
	Bool bContinue = False
	Bool bBreak = False
	Form kItem = None
	Int iValue = 0
	Int iAmount = 0
	Int iToRemove = 0
	Int iChecked = 0
	Bool bIsLoggingEnabled = ConfigMenu.bIsLoggingEnabled
	Int i = Equipment.Length
	While !bBreak && (i > 0)
		i -= 1
		bContinue = False
		kItem = Equipment[i]
		If (!kItem)
			iChecked-=1
			;Debug.TraceConditional("MarkOfArkay: Unknown item at index(" + i + ")",bIsLoggingEnabled)	
			bContinue = True
		EndIf
		If !bContinue
			If Tradables.Find(kItem) > -1
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> IsTradable()",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf
		If !bContinue
			If QuestItems.HasForm(kItem)
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> IsQuestItem()",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf
		If !bContinue
			iAmount = akInChest.GetItemCount(kItem)
			If ConfigMenu.bRandomItemCurse
				iToRemove = Utility.RandomInt(0,1)
			Else
				iToRemove = 1
			EndIf
			If (!iToRemove) || (!iAmount)
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> Amount is 0",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf
		If !bContinue
			If (ConfigMenu.iValidTypes.Find(kItem.GetType()) < 0)
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> InvalidType(" + kItem.GetType() +")",bIsLoggingEnabled)	
				bContinue = True
			EndIf
		EndIf
		If !bContinue
			If ConfigMenu.bCheckKeyword
				If (kItem.HasKeywordString("zzzmoa_ignoreitem") || kItem.HasKeywordString("vendornosale") || kItem.HasKeywordString("magicdisallowenchanting") || kItem.HasKeywordString("sos_underwear") || kItem.HasKeywordString("sos_genitals"))
					Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> InvalidKeyword()",bIsLoggingEnabled)	
					bContinue = True
				EndIf
			EndIf
		EndIf
		If !bContinue
			If ConfigMenu.bCheckWeight
				If !kItem.GetWeight()
					Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> NoWeight()",bIsLoggingEnabled)	
					bContinue = True
				EndIf
			EndIf
		EndIf
		If !bContinue
			If (ConfigMenu.fLoseOtherMinValueSlider > 0) || (ConfigMenu.fLoseOtherTotalValueSlider > 0)
				iValue = kItem.GetGoldValue()
				If ConfigMenu.fLoseOtherMinValueSlider > 0
					If iValue < (ConfigMenu.fLoseOtherMinValueSlider As Int)
						Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsCheap(" + iValue +")",bIsLoggingEnabled)	
						bContinue = True
					EndIf
				EndIf
				If !bContinue
					If ConfigMenu.fLoseOtherTotalValueSlider > 0
						If (iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
							Int iCount = iToRemove
							While iCount > 0 && ((iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
								iCount -= 1
							Endwhile
							If iCount
								iToRemove = iCount									
							Else
								Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue +"," + iTotalValues + ")",bIsLoggingEnabled)	
								bContinue = True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		If !bContinue
			akInChest.RemoveItem(kItem, iToRemove, True, akOutChest )
			Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + iTotalValues + "+" + iValue + ")",bIsLoggingEnabled )	
			If ConfigMenu.fLoseOtherTotalValueSlider > 0  
				If iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
					iTotalValues = iTotalValues + (iValue * iToRemove)
					If iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)	
						bBreak = True
					EndIf
				Else
					Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)	
					bBreak = True
				EndIf
				If !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
					If (iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")",bIsLoggingEnabled)	
						bBreak = True
					EndIf
				EndIf
			EndIf						
		EndIf
		iChecked += 1
		If (iCheckLimit > 0)
			If (iChecked >= iCheckLimit)
				bBreak = True
			EndIf
		EndIf
		If bBreak || (i <=0)
			Debug.TraceConditional("MarkOfArkay: "+ iChecked +" items checked by ItemCheckerA",bIsLoggingEnabled)
		EndIf
	Endwhile
	If akInChest != PlayerRef
		akInChest.RemoveAllItems(PlayerRef, True, True)
	EndIf
EndFunction
