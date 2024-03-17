Scriptname zzzmoaitemcheckerscriptA extends Quest

zzzmoaReviveMCM property ConfigMenu auto
Actor property PlayerRef auto
FormList property QuestItems auto
zzzmoaReviverScript property ReviveScript auto

Bool bRemoveAllItems
ObjectReference chest
Int iNum

event OnCheckItemsA(Form akSender, Int aiCount, Form akMyChest, Bool abRemoveAll)
  iNum = aiCount
  chest = akMyChest As ObjectReference
  bRemoveAllItems = abRemoveAll
  GoToState("Checking")
endevent

function removeitems(ObjectReference akInChest, ObjectReference akOutChest, Form[] Tradables, Form[] Equipment, Bool bRemoveAll)
endfunction

state Checking
  event OnBeginState()
    removeitems(chest, ReviveScript.ItemScript.LostItemsChest, ReviveScript.ItemScript.Tradables, ReviveScript.ItemScript.Equipment, bRemoveAllItems)
    ReviveScript.ItemScript.iItemCheckers = ReviveScript.ItemScript.iItemCheckers - 1
    GoToState("")
  endevent

  event OnCheckItemsA(Form akSender, Int aiCount, Form akMyChest, Bool abRemoveAll)
  endevent

  function removeitems(ObjectReference akInChest, ObjectReference akOutChest, Form[] Tradables, Form[] Equipment, Bool bRemoveAll)
    Int iTotal = akInChest.GetNumItems()
    Int iIndex = Utility.RandomInt(0, iTotal - 1)
    Int iLast
    if iIndex > 0
      iLast = iIndex - 1
    else
      iLast = -1
    endif
    Bool bContinue = False
    Bool bNext = False
    Bool bBreak = False
    Form kItem = None
    Int iValue = 0
    Int iAmount = 0
    Int iToRemove = 0
    Int iChecked = 0
    Int checked = -1
    Bool bIsLoggingEnabled = ConfigMenu.bIsLoggingEnabled
    while (!bBreak)
      bNext = True
      if bContinue
        bContinue = False
      endif
      kItem = akInChest.GetNthForm(iIndex)
      if !kItem || !kItem.GetName()
        Debug.TraceConditional("MarkOfArkay: Unknown item at index(" + iIndex + ")", bIsLoggingEnabled)
        bContinue = True
      endif
      if !bContinue
        if ReviveScript.ItemScript.isItemBlacklisted(kItem)
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsInBlackList()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if !bContinue
        if Tradables.Find(kItem) > -1
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsTradable()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if !bContinue
        if QuestItems.HasForm(kItem)
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsQuestItem()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if !bContinue
        checked = ReviveScript.ItemScript.checkedStatus(kItem)
        if (checked == 0)
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsChecked()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if !bContinue ;Only A which is the Player needs to check for this, for other containers equippments will be excluded when transfering items inside them. 
        if ConfigMenu.iLoseInclusion == 2 ;unequipped items
          if Equipment.Find(kItem) > -1
            Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsEquipped()", bIsLoggingEnabled)
            bContinue = true
          endif
        endif
      endif
      if !bContinue
        iAmount = akInChest.GetItemCount(kItem)
        if ConfigMenu.iLoseInclusion == 1
          if Equipment.Find(kItem) > -1
            if ConfigMenu.bRandomItemCurse
              iToRemove = Utility.RandomInt(0, 1)
            else
              iToRemove = 1
            endif
          else
            iToRemove = 0
          endif
        elseif ConfigMenu.bRandomItemCurse
          iToRemove = Utility.RandomInt(0, iAmount)
        else
          iToRemove = iAmount
        endif
        if (!iToRemove)
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> Amount is 0", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if (!bContinue && (checked == -1))
        if !bRemoveAll
          if (ConfigMenu.iValidTypes.Find(kItem.GetType()) < 0)
            Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> InvalidType(" + kItem.GetType() + ")", bIsLoggingEnabled)
            bContinue = True
          endif
        endif
      endif
      if (!bContinue && (checked == -1))
        if ((kItem As Armor) && (((kItem as Armor).GetSlotMask() == 0) || ((kItem as Armor).GetNumArmorAddons() == 0)))
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsUnequipable()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
      if (!bContinue && (checked == -1))
        if ConfigMenu.bCheckKeyword
          if ReviveScript.ItemScript.hasInvalidKeyword(kItem)
            Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> InvalidKeyword()", bIsLoggingEnabled)
            bContinue = True
          endif
        endif
      endif
      if (!bContinue && (checked == -1))
        if ConfigMenu.bCheckWeight
          if !kItem.GetWeight()
            Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> NoWeight()", bIsLoggingEnabled)
            bContinue = True
          endif
        endif
      endif
      if bContinue
        if ((checked == -1) && (iToRemove > 0))
          if (akInChest.GetItemCount(kItem) > 0)
            ReviveScript.ItemScript.addInvalidItem(kItem)
          endif
        endif
      else
        if (ConfigMenu.fLoseOtherMinValueSlider > 0) || (ConfigMenu.fLoseOtherTotalValueSlider > 0)
          iValue = kItem.GetGoldValue()
          if ConfigMenu.fLoseOtherMinValueSlider > 0
            if iValue < (ConfigMenu.fLoseOtherMinValueSlider As Int)
              Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsCheap(" + iValue + ")", bIsLoggingEnabled)
              bContinue = True
            endif
          endif
          if !bContinue
            if ConfigMenu.fLoseOtherTotalValueSlider > 0
              if (ReviveScript.ItemScript.iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
                Int iCount = iToRemove
                while iCount > 0 && ((ReviveScript.ItemScript.iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
                  iCount -= 1
                endwhile
                if iCount
                  iToRemove = iCount
                else
                  Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue + "," + ReviveScript.ItemScript.iTotalValues + ")", bIsLoggingEnabled)
                  bContinue = True
                endif
              endif
            endif
          endif
        endif
      endif
      if !bContinue
        akInChest.RemoveItem(kItem, iToRemove, True, akOutChest)
        if (checked == -1)
          ReviveScript.ItemScript.addValiditem(kItem)
          checked = 1
        endif
        if akInChest.GetNthForm(iIndex) && (kItem != akInChest.GetNthForm(iIndex)) ;size of inventory reduced
          bNext = False ;item at current index is another item, because the size of inventory reduced
          if iIndex < iLast ;item with an index lower than ilast removed so index of ilast decreased
            iLast -= 1
          endif
        endif
        Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + ReviveScript.ItemScript.iTotalValues + "+" + iValue + ")", bIsLoggingEnabled)
        if ConfigMenu.fLoseOtherTotalValueSlider > 0
          if ReviveScript.ItemScript.iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
            ReviveScript.ItemScript.iTotalValues = ReviveScript.ItemScript.iTotalValues + (iValue * iToRemove)
            if ReviveScript.ItemScript.iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
              Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
              bBreak = True
            endif
          else
            Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
            bBreak = True
          endif
          if !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
            if (ReviveScript.ItemScript.iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
              Debug.TraceConditional("MarkOfArkay: " + "Values(" + ReviveScript.ItemScript.iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")", bIsLoggingEnabled)
              bBreak = True
            endif
          endif
        endif
      endif
      iChecked += 1
      if (iNum <= iChecked)
        bBreak = True
      endif
      if !bBreak && bNext
        iTotal = akInChest.GetNumItems()
        if iTotal == 0 ;Everything removed
          bBreak = True
        elseif iIndex == iLast ;not starting from beginning and all items checked
          bBreak = True
        elseif iIndex > (iTotal - 2) ;End of array
          iIndex = 0
        else
          iIndex += 1
        endif
      endif
      if bBreak
        Debug.TraceConditional("MarkOfArkay: " + iChecked + " items checked by ItemCheckerA", bIsLoggingEnabled)
      endif
    endwhile
    if akInChest != PlayerRef
      akInChest.RemoveAllItems(PlayerRef, True, True)
    endif
  endfunction
endstate
