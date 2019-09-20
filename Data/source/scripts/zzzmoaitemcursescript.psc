Scriptname zzzmoaitemcursescript extends Quest  

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
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
FormList Property QuestItems Auto
Bool Property bIsBusy = False Auto Hidden


Function SetVars()
	If Equipment.Length != 35
		Equipment = New Form[35]
	EndIf
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
			iIndex = Utility.RandomInt(0,iTotal - 1)
			Int iLast
			If iIndex > 0
				iLast = iIndex - 1
			Else
				iLast = iTotal - 1
			EndIf
			Int iTotalValues = 0
			Bool bContinue = False
			Bool bBreak = False
			kItem = None
			Int iValue = 0
			Int iAmount = 0
			Int iToRemove = 0
			If (ConfigMenu.fLoseOtherTotalValueSlider > 0) && (ConfigMenu.fLoseOtherMinValueSlider > 0)
				If ConfigMenu.fLoseOtherTotalValueSlider < ConfigMenu.fLoseOtherMinValueSlider
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay:  TotalValue is invalid -> (TotalValue < MinValue)")	
					bBreak = True
				EndIf
			EndIf
			While (!bBreak )
				If bContinue
					bContinue = False
				EndIf
				kItem = PlayerRef.GetNthForm(iIndex)
				If (!kItem)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Unknown item at index(" + iIndex + ")")	
					bContinue = True
				EndIf
				If !bContinue
					If QuestItems.HasForm(kItem)
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> IsQuestItem()")
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
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> Amount is 0")
						bContinue = True
					EndIf
				EndIf
				If !bContinue
					If !bRemoveAll 
						If (ConfigMenu.iValidTypes.Find(kItem.GetType()) < 0)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> InvalidType(" + kItem.GetType() +")")	
							bContinue = True
						EndIf
					EndIf
				EndIf
				If !bContinue
					If ConfigMenu.bCheckKeyword
						If (kItem.HasKeywordString("zzzmoa_ignoreitem") || kItem.HasKeywordString("vendornosale") || kItem.HasKeywordString("magicdisallowenchanting") || kItem.HasKeywordString("sos_underwear") || kItem.HasKeywordString("sos_genitals"))
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> InvalidKeyword()")	
							bContinue = True
						EndIf
					EndIf
				EndIf
				If !bContinue
					If ConfigMenu.bCheckWeight
						If !kItem.GetWeight()
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> NoWeight()")	
							bContinue = True
						EndIf
					EndIf
				EndIf
				If !bContinue
					If (ConfigMenu.fLoseOtherMinValueSlider > 0) || (ConfigMenu.fLoseOtherTotalValueSlider > 0)
						iValue = kItem.GetGoldValue()
						If ConfigMenu.fLoseOtherMinValueSlider > 0
							If iValue < (ConfigMenu.fLoseOtherMinValueSlider As Int)
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsCheap(" + iValue +")")	
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
										ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue +"," + iTotalValues + ")")	
										bContinue = True
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
				If !bContinue
					PlayerRef.RemoveItem(kItem, iToRemove, True, LostItemsChest )
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + iTotalValues + "+" + iValue + ")" )	
					If ConfigMenu.fLoseOtherTotalValueSlider > 0  
						iTotalValues = iTotalValues + (iValue * iToRemove)
						If iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int)	
							bBreak = True
						EndIf
						If !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
							If (iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")")	
								bBreak = True
							EndIf
						EndIf
					EndIf						
				EndIf
				If !bBreak
					If (iIndex == iLast)
						bBreak = True
					ElseIf iIndex == iTotal - 1
						iIndex = 0
					Else
						iIndex += 1
					EndIf
				EndIf
			Endwhile
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
