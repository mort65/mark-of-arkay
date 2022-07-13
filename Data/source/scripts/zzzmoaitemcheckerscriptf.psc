Scriptname zzzmoaitemcheckerscriptF extends Quest  

zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
Actor Property PlayerRef Auto
FormList Property QuestItems Auto
Int iNum

Event OnCheckItemsF(Form akSender, Int aiCount, Form akMyChest, Bool abRemoveAll)
	iNum = aiCount
	removeitems(akMyChest As ObjectReference, ReviveScript.ItemScript.LostItemsChest, ReviveScript.ItemScript.Tradables, ReviveScript.ItemScript.Equipment, abRemoveAll)
	ReviveScript.ItemScript.iItemCheckers = ReviveScript.ItemScript.iItemCheckers - 1
EndEvent

Function removeitems(ObjectReference akInChest, ObjectReference akOutChest, Form[] Tradables, Form[] Equipment, Bool bRemoveAll)
	Int iTotal = akInChest.GetNumItems()
	Int iIndex = Utility.RandomInt(0,iTotal - 1)
	Int iLast
	If iIndex > 0
		iLast = iIndex - 1
	Else
		iLast = -1
	EndIf
	Bool bContinue = False
	Bool bNext = False
	Bool bBreak = False
	Form kItem = None
	Int iValue = 0
	Int iAmount = 0
	Int iToRemove = 0
	Int iChecked = 0
	Bool bIsLoggingEnabled = ConfigMenu.bIsLoggingEnabled
	While (!bBreak )
		bNext = True
		If bContinue
			bContinue = False
		EndIf
		kItem = akInChest.GetNthForm(iIndex)
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
			If QuestItems.HasForm(kItem)
				Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName()+ ") Skipped -> IsQuestItem()",bIsLoggingEnabled)
				bContinue = True
			EndIf
		EndIf
		If !bContinue
			iAmount = akInChest.GetItemCount(kItem)
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
			If !bRemoveAll 
				If (ConfigMenu.iValidTypes.Find(kItem.GetType()) < 0)
					Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> InvalidType(" + kItem.GetType() +")",bIsLoggingEnabled)	
					bContinue = True
				EndIf
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
						If (ReviveScript.ItemScript.iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
							Int iCount = iToRemove
							While iCount > 0 && ((ReviveScript.ItemScript.iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
								iCount -= 1
							Endwhile
							If iCount
								iToRemove = iCount									
							Else
								Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue +"," + ReviveScript.ItemScript.iTotalValues + ")",bIsLoggingEnabled)	
								bContinue = True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
		If !bContinue
			akInChest.RemoveItem(kItem, iToRemove, True, akOutChest )
			If akInChest.GetNthForm(iIndex) && (kItem != akInChest.GetNthForm(iIndex)) ;size of inventory reduced
				bNext = False ;item at current index is another item, because the size of inventory reduced
				If iIndex < iLast ;item with an index lower tan ilast removed so index of ilast decreased
					iLast -= 1
				EndIf
			EndIf
			Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + ReviveScript.ItemScript.iTotalValues + "+" + iValue + ")",bIsLoggingEnabled )	
			If ConfigMenu.fLoseOtherTotalValueSlider > 0  
				If ReviveScript.ItemScript.iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
					ReviveScript.ItemScript.iTotalValues = ReviveScript.ItemScript.iTotalValues + (iValue * iToRemove)
					If ReviveScript.ItemScript.iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)	
						bBreak = True
					EndIf
				Else
					Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int,bIsLoggingEnabled)
					bBreak = True
				EndIf
				If !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
					If (ReviveScript.ItemScript.iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
						Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")",bIsLoggingEnabled)	
						bBreak = True
					EndIf
				EndIf
			EndIf						
		EndIf
		iChecked += 1
		If (iNum <= iChecked)
			bBreak = True
		EndIf
		If !bBreak && bNext
			iTotal = akInChest.GetNumItems()
			If iTotal == 0 ;Everything removed
				bBreak = True
			ElseIf iIndex == iLast ;not starting from beginning and all items checked
				bBreak = True
			ElseIf iIndex > (iTotal - 2) ;End of array
				iIndex = 0
			Else
				iIndex += 1
			EndIf
		EndIf
		If bBreak
			Debug.TraceConditional("MarkOfArkay: "+ iChecked +" items checked by ItemCheckerF",bIsLoggingEnabled)
		EndIf
	Endwhile
	If akInChest != PlayerRef
		akInChest.RemoveAllItems(PlayerRef, True, True)
	EndIf
EndFunction
