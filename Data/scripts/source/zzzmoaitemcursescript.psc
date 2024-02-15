Scriptname zzzmoaitemcursescript extends Quest

import zzzmoautilscript

SoulGem property BlackFilledGem auto
zzzmoaReviveMCM property ConfigMenu auto
Form[] property Equipment auto Hidden
MiscObject property Gold001 auto
SoulGem property GrandFilledGem auto
Container property ItemChest auto
zzzmoaitemcheckerscriptA property ItemcheckerA auto
zzzmoaitemcheckerscriptB property ItemcheckerB auto
zzzmoaitemcheckerscriptC property ItemcheckerC auto
zzzmoaitemcheckerscriptD property ItemcheckerD auto
zzzmoaitemcheckerscriptE property ItemcheckerE auto
zzzmoaitemcheckerscriptF property ItemcheckerF auto
zzzmoaitemcheckerscriptG property ItemcheckerG auto
zzzmoaitemcheckerscriptH property ItemcheckerH auto
zzzmoaitemcheckerscriptI property ItemcheckerI auto
zzzmoaitemcheckerscriptJ property ItemcheckerJ auto
ObjectReference property LostItemsChest auto
MiscObject property MarkOfArkay auto
Faction property PlayerEnemyFaction auto
Actor property PlayerRef auto
FormList property QuestItems auto
zzzmoaReviverScript property ReviveScript auto
Quest property ReviverQuest auto
MiscObject property StolenItemsMisc auto
MiscObject property StolenSoulsMisc auto
Form[] property Tradables auto Hidden
ObjectReference property ValuableItemsChest auto
Bool property bEquipmentRegistered=False auto Hidden
Bool property bIsBusy=False auto Hidden
Bool property bIsItemsRemoved auto Hidden
FormList property checkedItemsInvalid auto
FormList property checkedItemsValid auto
Float property fLostSouls auto Hidden
Int property iCheckLimit=0 auto Hidden
Int property iItemCheckers=0 auto Hidden
Int property iTotalValues=0 auto Hidden
FormList property ItemBlackList auto
FormList property ItemBlackList2 auto

event On_MOA_checkCachedItems(string eventName, string strArg, float numArg, Form sender)
  Debug.trace("MarkOfArkay: On_MOA_checkCachedItems() triggered by " + sender)
  Int i = checkedItemsValid.GetSize()
  Form kItem
  while (i > 0)
    i -= 1
    kItem = checkedItemsValid.GetAt(i)
    if (questitems.Find(kItem) == -1)
      if (equipment.find(kItem) == -1)
        if (PlayerRef.GetItemCount(kItem) == 0)
          if (lostItemschest.GetItemCount(kItem) == 0)
            checkedItemsValid.RemoveAddedForm(kItem)
          endif
        endif
      endif
    endif
  endwhile
  i = checkedItemsInvalid.GetSize()
  while (i > 0)
    i -= 1
    kItem = checkedItemsInvalid.GetAt(i)
    if (questitems.Find(kItem) == -1)
      if (equipment.find(kItem) == -1)
        if (PlayerRef.GetItemCount(kItem) == 0)
          if (lostItemschest.GetItemCount(kItem) == 0)
            checkedItemsInvalid.RemoveAddedForm(kItem)
          endif
        endif
      endif
    endif
  endwhile
  checkBlackListedItems()
  checkAndFixFormList(checkedItemsValid, abCheckSize=True)
  checkAndFixFormList(checkedItemsInvalid, abCheckSize=True)
  Debug.trace("MarkOfArkay: checking cached items finished.")
endevent

function checkBlackListedItems()
  if !ConfigMenu.bPUOK
      checkAndFixFormList(ItemBlackList2, abCheckSize=True)
  endif
endfunction

function AddStolenItemMarker(Actor ActorRef) ;Thief can only steal souls or only no physical item stolen
  if ActorRef
    if LostItemsChest.GetNumItems() == 0 || ActorRef.HasKeywordString("ActorTypeDragon") || ActorRef.HasKeywordString("ActorTypeGhost")
      ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent=True)
      if !ActorRef.GetItemCount(StolenSoulsMisc)
        ActorRef.AddItem(StolenSoulsMisc)
      endif
    else
      ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent=True)
      if !ActorRef.GetItemCount(StolenItemsMisc)
        ActorRef.AddItem(StolenItemsMisc)
      endif
    endif
  endif
endfunction

function DestroyLostItems(Actor ActorRef)
  bIsBusy = True
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Destroying previously lost items...")
  if ((LostItemsChest.GetNumItems() > 0) || (fLostSouls > 0.0))
    if ConfigMenu.iDestroyedItems < 99999999
      ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
      if fLostSouls > 0.0
        ConfigMenu.iDestroyedItems += 1
      endif
    endif
  endif
  ReviveScript.SkillScript.LoseSkills()
  LostItemsChest.RemoveAllItems()
  fLostSouls = 0.0
  if (ReviveScript.ThiefNPC.GetReference() As Actor)
    RemoveStolenItemMarkers(ReviveScript.ThiefNPC.GetReference() As Actor)
  endif
  if ReviveScript.Thief
    RemoveStolenItemMarkers(ReviveScript.Thief)
  endif
  RemoveStolenItemMarkers(ActorRef)
  ReviveScript.Thief = None
  ActorRef.RemoveSpell(ReviveScript.ArkayCurse)
  ActorRef.RemoveSpell(ReviveScript.ArkayCurseAlt)
  stopandConfirm(ReviveScript.moaPlayerVoicelessQuest)
  stopandConfirm(ReviveScript.moaPlayerGhostQuest, 3, 10)
  PlayerRef.SetVoiceRecoveryTime(0.0)
  ReviveScript.bPlayerIsVoiceless = False
  if ReviveScript.moaSoulMark01.IsRunning()
    ReviveScript.NPCScript.RemoveDeadClone()
    stopandConfirm(ReviveScript.moaSoulMark01, 1)
    ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
    ReviveScript.LostItemsMarker.Disable()
  endif
  if ReviveScript.moaThiefNPC01.IsRunning() && ReviveScript.moaThiefNPC01.GetStage() < 15
    stopandConfirm(ReviveScript.moaThiefNPC01, 1, 25)
  endif
  stopandConfirm(ReviveScript.moaBossChest01, 1, 15)
  bIsItemsRemoved = False
  ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
  ReviveScript.LostItemsMarker.Disable()
  transferItems(LostItemsChest, ActorRef As ObjectReference)
  LostItemsChest.RemoveAllItems(ActorRef as ObjectReference, true, true)
  utility.wait(1.0)
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Previously lost items are destroyed.")
  bIsBusy = False
endfunction

function EquipItems(Actor ActorRef, Bool RightHand, Bool LeftHand)
  if ConfigMenu.bSKSEOK
    Bool bLW = False
    if RightHand
      if ActorRef.GetItemCount(ReviveScript.RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.RightHandEquipedItem)
        ActorRef.EquipItemEx(ReviveScript.RightHandEquipedItem, 1)
        Utility.Wait(0.2)
      endif
    elseif LeftHand && !(ReviveScript.RightHandEquipedItem As Spell)
      if ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.LeftHandEquippedItem)
        ActorRef.EquipItemEx(ReviveScript.LeftHandEquippedItem, 1)
        bLW = True
        Utility.Wait(0.2)
      endif
    endif
    if LeftHand && !bLW && ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0
      ActorRef.EquipItemEx(ReviveScript.LeftHandEquippedItem, 2)
      Utility.Wait(0.2)
    endif
    Int i = Equipment.length
    while i > 0
      i -= 1
      if Equipment[i] As Armor || Equipment[i] As Ammo
        if ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
          ActorRef.EquipItemEx(Equipment[i])
          Utility.Wait(0.2)
        endif
      endif
    endwhile
  else
    if RightHand
      if ActorRef.GetItemCount(ReviveScript.RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.RightHandEquipedItem)
        ActorRef.EquipItem(ReviveScript.RightHandEquipedItem, False, True)
        Utility.Wait(0.2)
      endif
    elseif LeftHand && !(ReviveScript.RightHandEquipedItem As Spell)
      if ActorRef.GetItemCount(ReviveScript.LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(ReviveScript.LeftHandEquippedItem)
        ActorRef.EquipItem(ReviveScript.LeftHandEquippedItem, False, True)
        Utility.Wait(0.2)
      endif
    endif
    Int i = Equipment.length
    while i > 0
      i -= 1
      if Equipment[i] As Armor || Equipment[i] As Ammo
        if ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
          ActorRef.EquipItem(Equipment[i], False, True)
          Utility.Wait(0.2)
        endif
      endif
    endwhile
  endif
endfunction

function LoseItem(Form kItem, Bool bLoseAll, Int iMin, Int iMax)
  Int iItemCount = PlayerRef.GetItemCount(kItem)
  Int iAmount = 0
  if bLoseAll
    iAmount = iItemCount
  elseif iItemCount > 0
    iAmount = randIntFromlimitedRange(iMin, iMax, iItemCount, 0, iItemCount)
  endif
  if iAmount > 0
    PlayerRef.RemoveItem(kItem, iAmount, True, LostItemsChest)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + iAmount + " ( " + kItem.GetName() + "," + kItem + ") removed.")
  endif
endfunction

function LoseItems()
  if ConfigMenu.bLoseItem
    if ConfigMenu.bLoseDragonSoul
      Int iItemCount = PlayerRef.GetActorValue("DragonSouls") As Int
      Int iAmount = 0
      if ConfigMenu.bLoseDragonSoulAll
        iAmount = iItemCount
      elseif PlayerRef.GetActorValue("DragonSouls")
        Int iMin = ConfigMenu.fMinLoseDragonSoulSlider As Int
        Int iMax = ConfigMenu.fMaxLoseDragonSoulSlider As Int
        iAmount = randIntFromlimitedRange(iMin, iMax, iItemCount, 0, iItemCount)
      endif
      if iAmount > 0
        PlayerRef.ModActorValue("DragonSouls", -(iAmount As Float))
        fLostSouls += iAmount
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + iAmount + " DragonSouls removed.")
      endif
    endif
  endif
  Bool RightHand = (ReviveScript.RightHandEquipedItem && !(ReviveScript.RightHandEquipedItem As Spell))
  Bool LeftHand = (ReviveScript.LeftHandEquippedItem && !(ReviveScript.LeftHandEquippedItem As Spell) && !(ReviveScript.LeftHandEquippedItem == ReviveScript.RightHandEquipedItem))
  Utility.Wait(1.0)
  Equipment = RegisterEquipments(PlayerRef, True, True)
  bEquipmentRegistered = True
  ValuableItemsChest.RemoveAllItems()
  if ConfigMenu.bLoseItem
    if ConfigMenu.bLoseGold
      LoseItem(Gold001, ConfigMenu.bLoseGoldAll, ConfigMenu.fMinLoseGoldSlider As Int, ConfigMenu.fMaxLoseGoldSlider As Int)
    endif
    if ConfigMenu.bLoseArkayMark
      LoseItem(MarkOfArkay, ConfigMenu.bLoseArkayMarkAll, ConfigMenu.fMinLoseArkayMarkSlider As Int, ConfigMenu.fMaxLoseArkayMarkSlider As Int)
    endif
    if ConfigMenu.bLoseBlackSoulGem
      LoseItem(BlackFilledGem, ConfigMenu.bLoseBlackSoulGemAll, ConfigMenu.fMinLoseBlackSoulGemSlider As Int, ConfigMenu.fMaxLoseBlackSoulGemSlider As Int)
    endif
    if ConfigMenu.bLoseGrandSoulGem
      LoseItem(GrandFilledGem, ConfigMenu.bLoseGrandSoulGem, ConfigMenu.fMinLoseGrandSoulGemSlider As Int, ConfigMenu.fMaxLoseGrandSoulGemSlider As Int)
    endif
  endif
  if ConfigMenu.bLoseItem && ConfigMenu.bLoseOthers
    ;If ConfigMenu.bPUOK && ConfigMenu.bPO3OK
    ;	PO3LoseOtherItems()
    ;Else
    LoseOtherItems()

    ;EndIf
  endif
  transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
  ValuableItemsChest.RemoveAllItems(playerRef as ObjectReference, true, true)
  utility.wait(1.0)
  if ConfigMenu.bRespawnNaked
    if !ConfigMenu.bExcludeQuestItems
      PlayerRef.Unequipall()
    endif
  else
    EquipItems(PlayerRef, RightHand, LeftHand)
  endif
  bIsItemsRemoved = True
endfunction

function LoseOtherItems()
  if !PlayerRef.GetNumItems() || ((ConfigMenu.iLoseInclusion == 1) && !(ConfigMenu.bLoseArmor || ConfigMenu.bLoseWeapon || ConfigMenu.bLoseAmmo))
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay:  Nothing else can be removed.")
    return
  endif
  Int iIndex
  Form kItem = None
  QuestItems.Revert()
  if ConfigMenu.bExcludeQuestItems
    if ConfigMenu.bPO3OK
      Form[] QuestItemsArr = PO3_SKSEFunctions.GetQuestItems(PlayerRef As ObjectReference)
      iIndex = QuestItemsArr.Length
      while iIndex > 0
        iIndex -= 1
        kItem = QuestItemsArr[iIndex]
        if kItem && (kItem != None)
          QuestItems.AddForm(kItem)
        endif
      endwhile
    else
      PlayerRef.RemoveAllItems(ValuableItemsChest, True, False)
      Utility.Wait(0.2)
      iIndex = PlayerRef.GetNumItems()
      while iIndex > 0
        iIndex -= 1
        kItem = PlayerRef.GetNthForm(iIndex)
        if kItem && (kItem != None)
          QuestItems.AddForm(kItem)
        endif
      endwhile
    endif
  endif

  ;RemoveAllItems sometimes Causes the script to halt until opening and closing a menu
  transferItems(ValuableItemsChest, PlayerRef As ObjectReference)
  ValuableItemsChest.RemoveAllItems(playerRef as ObjectReference, true, true)
  utility.wait(1.0)
  Bool bRemove = False
  Bool bRemoveAll = True
  iIndex = ConfigMenu.iValidTypes.Length
  while iIndex > 0
    iIndex -= 1
    if ConfigMenu.iValidTypes[iIndex] > 0
      bRemove = True
    else
      bRemoveAll = False
    endif
  endwhile
  if bRemove
    if bRemoveAll && (ConfigMenu.iLoseInclusion == 0) && (ConfigMenu.fLoseOtherMinValueSlider <= 0) && (ConfigMenu.fLoseOtherTotalValueSlider <= 0) && !ConfigMenu.bRandomItemCurse && !ItemBlackList.GetSize() && !ItemBlackList2.GetSize()
      PlayerRef.RemoveAllItems(LostItemsChest, True, !ConfigMenu.bExcludeQuestItems)
    else
      Tradables = new Form[4]
      Tradables[0] = Gold001 As Form
      Tradables[1] = MarkOfArkay As Form
      Tradables[2] = BlackFilledGem As Form
      Tradables[3] = GrandFilledGem As Form
      iCheckLimit = ConfigMenu.fMaxItemsToCheckSlider As Int
      transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
      ValuableItemsChest.RemoveAllItems(playerRef as ObjectReference, true, true)
      utility.wait(1.0)
      if (ConfigMenu.iLoseInclusion == 1)
        removeEquipments(PlayerRef As ObjectReference, LostItemsChest, Tradables, Equipment)
      else
        Int iTotal = PlayerRef.GetNumItems()
        if (iCheckLimit == 0) || (iCheckLimit > iTotal)
          iCheckLimit = iTotal
        endif
        iItemCheckers = 10
        while iItemCheckers > 1 && (iCheckLimit / iItemCheckers) < 50
          iItemCheckers -= 1
        endwhile
        Form[] containerArr = Utility.CreateFormArray(iItemCheckers)
        containerArr[0] = PlayerRef
        iIndex = iItemCheckers
        Int handle
        String sModEvent
        Int iNum = iCheckLimit / iItemCheckers
        Int iChecked = iCheckLimit
        iTotalValues = 0
        while iIndex > 0
          iIndex -= 1
          if iIndex > 8
            sModEvent = "MOA_CheckItemsJ"
          elseif iIndex > 7
            sModEvent = "MOA_CheckItemsI"
          elseif iIndex > 6
            sModEvent = "MOA_CheckItemsH"
          elseif iIndex > 5
            sModEvent = "MOA_CheckItemsG"
          elseif iIndex > 4
            sModEvent = "MOA_CheckItemsF"
          elseif iIndex > 3
            sModEvent = "MOA_CheckItemsE"
          elseif iIndex > 2
            sModEvent = "MOA_CheckItemsD"
          elseif iIndex > 1
            sModEvent = "MOA_CheckItemsC"
          elseif iIndex > 0
            sModEvent = "MOA_CheckItemsB"
          else
            sModEvent = "MOA_CheckItemsA"
          endif
          handle = ModEvent.Create(sModEvent)
          if (handle)
            ModEvent.PushForm(handle, ReviverQuest)
            if iIndex > 0
              containerArr[iIndex] = LostItemsChest.PlaceAtMe(ItemChest, abForcePersist=True)
              if ConfigMenu.bExcludeQuestItems
                if ConfigMenu.iLoseInclusion == 2
                  transferItemsWithExclusions(PlayerRef, containerArr[iIndex] As ObjectReference, QuestItems, Equipment, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
                else
                  transferItemsWithExclusions(PlayerRef, containerArr[iIndex] As ObjectReference, QuestItems, None, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
                endif
              else
                if ConfigMenu.iLoseInclusion == 2
                  transferItemsWithExclusionArr(PlayerRef, containerArr[iIndex] As ObjectReference, Equipment, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
                else
                  transferItemsWithExclusionArr(PlayerRef, containerArr[iIndex] As ObjectReference, None, Utility.RandomInt(0, PlayerRef.GetNumItems() - iNum), iNum)
                endif
              endif
              Int iCount = iMin(iNum, (containerArr[iIndex] As ObjectReference).GetNumItems())
              iChecked -= iCount
              ModEvent.PushInt(handle, iCount)
            else
              ModEvent.PushInt(handle, iChecked)
            endif
            ModEvent.PushForm(handle, containerArr[iIndex])
            ModEvent.PushBool(handle, bRemoveAll)
            if (containerArr[iIndex] As ObjectReference).GetNumItems() > 0
              ModEvent.Send(Handle)
            else
              iItemCheckers -= 1
            endif
          endif
          Utility.WaitMenuMode(0.1)
        endwhile
        while iItemCheckers > 0
          Utility.WaitMenuMode(0.2)
        endwhile
        iIndex = containerArr.Length
        while iIndex > 1
          iIndex -= 1
          (containerArr[iIndex] As ObjectReference).DisableNoWait()
          (containerArr[iIndex] As ObjectReference).Delete()
          containerArr[iIndex] = None
        endwhile
      endif
      transferItems(ValuableItemsChest, PlayerRef as ObjectReference)
      ValuableItemsChest.RemoveAllItems(playerRef as ObjectReference, true, true)
      utility.wait(1.0)
    endif
  endif
  QuestItems.Revert()
endfunction

function PO3LoseOtherItems() ;Slower
  if !PlayerRef.GetNumItems() || ((ConfigMenu.iLoseInclusion == 1) && !(ConfigMenu.bLoseArmor || ConfigMenu.bLoseWeapon || ConfigMenu.bLoseAmmo))
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay:  Nothing else can be removed.")
    return
  endif
  Int iIndex
  Form[] RemovableItemsArr
  if ConfigMenu.iLoseInclusion == 1
    RemovableItemsArr = Equipment
  else
    RemovableItemsArr = PO3_SKSEFunctions.AddAllItemsToArray(akRef=PlayerRef, abNoEquipped=(ConfigMenu.iLoseInclusion == 2), abNoFavorited=false, abNoQuestItem=ConfigMenu.bExcludeQuestItems)
  endif
  Bool bRemove = False
  Bool bRemoveAll = True
  iIndex = ConfigMenu.iValidTypes.Length
  while iIndex > 0
    iIndex -= 1
    if ConfigMenu.iValidTypes[iIndex] > 0
      bRemove = True
    else
      bRemoveAll = False
      RemovableItemsArr = PapyrusUtil.GetDiffForm(RemovableItemsArr, PO3_SKSEFunctions.AddItemsOfTypeToArray(PlayerRef, ConfigMenu.iValidTypes[iIndex], abNoEquipped=(ConfigMenu.iLoseInclusion == 2), abNoFavorited=false, abNoQuestItem=ConfigMenu.bExcludeQuestItems))
    endif
  endwhile
  if !(bRemove)
    return
  endif
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
  if Tradables.length != 4
    Tradables = new Form[4]
    Tradables[0] = Gold001 As Form
    Tradables[1] = MarkOfArkay As Form
    Tradables[2] = BlackFilledGem As Form
    Tradables[3] = GrandFilledGem As Form
  endif
  if (ConfigMenu.fMaxItemsToCheckSlider <= 0.0) || (ConfigMenu.fMaxItemsToCheckSlider As Int > iTotal)
    ExcludedIndexArrLen = iTotal
  else
    ExcludedIndexArrLen = ConfigMenu.fMaxItemsToCheckSlider As Int
  endif
  Int[] ExcludedIndexArr = Utility.CreateIntArray(size=ExcludedIndexArrLen, fill=-1)
  while (!bBreak)
    if bContinue
      bContinue = False
    endif
    if iChecked == 0
      iIndex = Utility.RandomInt(0, iTotal - 1)
    else
      iIndex = iGetRandomWithExclusionIntArray(0, iTotal - 1, papyrusUtil.SliceIntArray(ExcludedIndexArr, 0, iChecked))
    endif
    ExcludedIndexArr[iChecked] = iIndex
    kItem = RemovableItemsArr[iIndex]
    if (!kItem)
      Debug.TraceConditional("MarkOfArkay: Unknown item at index(" + iIndex + ")", bIsLoggingEnabled)
      bContinue = True
    endif
    if !bContinue
      if isItemBlacklisted(kItem)
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
      iAmount = PlayerRef.GetItemCount(kItem)
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
    if !bContinue
      if ConfigMenu.bCheckKeyword
        if (kItem.HasKeywordString("zzzmoa_ignoreitem") || kItem.HasKeywordString("vendornosale") || kItem.HasKeywordString("magicdisallowenchanting") || kItem.HasKeywordString("sos_underwear") || kItem.HasKeywordString("sos_genitals"))
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> InvalidKeyword()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
    endif
    if !bContinue
      if ConfigMenu.bCheckWeight
        if !kItem.GetWeight()
          Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> NoWeight()", bIsLoggingEnabled)
          bContinue = True
        endif
      endif
    endif
    if !bContinue
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
            if (iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
              Int iCount = iToRemove
              while iCount > 0 && ((iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
                iCount -= 1
              endwhile
              if iCount
                iToRemove = iCount
              else
                Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue + "," + iTotalValues + ")", bIsLoggingEnabled)
                bContinue = True
              endif
            endif
          endif
        endif
      endif
    endif
    if !bContinue
      playerRef.RemoveItem(kItem, iToRemove, True, LostItemsChest)
      Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + iTotalValues + "+" + iValue + ")", bIsLoggingEnabled)
      if ConfigMenu.fLoseOtherTotalValueSlider > 0
        if iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
          iTotalValues = iTotalValues + (iValue * iToRemove)
          if iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
            Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
            bBreak = True
          endif
        else
          Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
          bBreak = True
        endif
        if !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
          if (iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
            Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")", bIsLoggingEnabled)
            bBreak = True
          endif
        endif
      endif
    endif
    iChecked += 1
    if (iTotal <= iChecked)
      bBreak = True
    endif
    if bBreak
      Debug.TraceConditional("MarkOfArkay: " + iChecked + " items checked", bIsLoggingEnabled)
    endif
  endwhile
endfunction

Form[] function RegisterEquipments(Actor refActor, Bool bRightArm, Bool bLeftArm)
  Int iEmpty
  Form akArmor
  Form[] EquipmentArray = new Form[35]
  Int itemIndex = 30
  if bRightArm
    iEmpty = EquipmentArray.find(None)
    if iEmpty > -1
      EquipmentArray[iEmpty] = ReviveScript.RightHandEquipedItem
    endif
  endif
  if bLeftArm
    iEmpty = EquipmentArray.find(None)
    if iEmpty > -1
      EquipmentArray[iEmpty] = ReviveScript.LeftHandEquippedItem
    endif
  endif
  while itemIndex < 62
    akArmor = refActor.GetWornForm(Armor.GetMaskForSlot(itemIndex))
    if akArmor As Armor
      if EquipmentArray.find(akArmor) < 0
        iEmpty = EquipmentArray.Find(None)
        if iEmpty > -1
          EquipmentArray[iEmpty] = akArmor
        endif
      endif
    endif
    itemIndex += 1
  endwhile
  if ReviveScript.EquippedAmmo && refActor.IsEquipped(ReviveScript.EquippedAmmo As Form)
    iEmpty = EquipmentArray.Find(None)
    if iEmpty > -1
      EquipmentArray[iEmpty] = ReviveScript.EquippedAmmo
    endif
  endif
  return EquipmentArray
endfunction

function RegisterItemCheckers()
  ItemcheckerA.RegisterForModEvent("MOA_CheckItemsA", "OnCheckItemsA")
  ItemcheckerB.RegisterForModEvent("MOA_CheckItemsB", "OnCheckItemsB")
  ItemcheckerC.RegisterForModEvent("MOA_CheckItemsC", "OnCheckItemsC")
  ItemcheckerD.RegisterForModEvent("MOA_CheckItemsD", "OnCheckItemsD")
  ItemcheckerE.RegisterForModEvent("MOA_CheckItemsE", "OnCheckItemsE")
  ItemcheckerF.RegisterForModEvent("MOA_CheckItemsF", "OnCheckItemsF")
  ItemcheckerG.RegisterForModEvent("MOA_CheckItemsG", "OnCheckItemsG")
  ItemcheckerH.RegisterForModEvent("MOA_CheckItemsH", "OnCheckItemsH")
  ItemcheckerI.RegisterForModEvent("MOA_CheckItemsI", "OnCheckItemsI")
  ItemcheckerJ.RegisterForModEvent("MOA_CheckItemsJ", "OnCheckItemsJ")
endfunction

function RemoveStolenItemMarkers(Actor ActorRef)
  ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent=True)
  ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent=True)
endfunction

function RestoreLostItems(Actor ActorRef)
  bIsBusy = True ;prevent loop if runed from thiefnpc
  if (ReviveScript.ThiefNPC.GetReference() As Actor)
    RemoveStolenItemMarkers(ReviveScript.ThiefNPC.GetReference() As Actor)
  endif
  if ReviveScript.Thief
    RemoveStolenItemMarkers(ReviveScript.Thief)
  endif
  RemoveStolenItemMarkers(PlayerRef)
  ReviveScript.Thief = None
  ActorRef.RemoveSpell(ReviveScript.ArkayCurse)
  ActorRef.RemoveSpell(ReviveScript.ArkayCurseAlt)
  stopandConfirm(ReviveScript.moaPlayerVoicelessQuest)
  stopandConfirm(ReviveScript.moaPlayerGhostQuest, 3, 10)
  PlayerRef.SetVoiceRecoveryTime(0.0)
  ReviveScript.bPlayerIsVoiceless = False
  if ReviveScript.moaSoulMark01.IsRunning()
    ReviveScript.NPCScript.RemoveDeadClone()
    stopandConfirm(ReviveScript.moaSoulMark01, 1)
    ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
    ReviveScript.LostItemsMarker.Disable()
  endif
  if ReviveScript.moaThiefNPC01.IsRunning() && ReviveScript.moaThiefNPC01.GetStage() < 15
    stopandConfirm(ReviveScript.moaThiefNPC01, 1, 25) ;Setting this to 15 or 20 would make a loop
  endif
  stopandConfirm(ReviveScript.moaBossChest01, 1, 20)
  ReviveScript.LostItemsMarker.MoveToMyEditorLocation()
  ReviveScript.LostItemsMarker.Disable()
  transferItems(LostItemsChest, ActorRef as ObjectReference)
  LostItemsChest.RemoveAllItems(ActorRef as ObjectReference, true, true)
  utility.wait(1.0)
  if fLostSouls > 0.0
    ActorRef.ModActorValue("DragonSouls", fLostSouls)
    fLostSouls = 0.0
  endif
  ReviveScript.SkillScript.RestoreSkills()
  bIsItemsRemoved = False
  Debug.Notification("$mrt_MarkofArkay_Notification_RestoreLostItems")
  bIsBusy = False
endfunction

function SetVars()
  if Equipment.Length != 35
    Equipment = new Form[35]
  endif
  bEquipmentRegistered = False
endfunction

function addInvalidItem(Form kItem)
  if kItem
    int i = checkedItemsInvalid.getsize()
    if i > 127
      int j = 0
      while ((i - j) > 127)
        checkedItemsInvalid.RemoveAddedForm(checkedItemsInvalid.getat(j))
        j += 1
      endwhile
    endif
    checkedItemsInvalid.AddForm(kItem)
  endif
endfunction

function addValidItem(Form kItem)
  if kItem
    int i = checkedItemsValid.getsize()
    if i > 127
      int j = 0
      while ((i - j) > 127)
        checkedItemsValid.RemoveAddedForm(checkedItemsValid.getat(j))
        j += 1
      endwhile
    endif
    checkedItemsValid.AddForm(kItem)
  endif
endfunction

Bool function bInventoryReduced()
  return LostItemsChest.GetNumItems() > 0
endfunction

Bool function bSoulReduced()
  return fLostSouls > 0
endfunction

Int function checkedStatus(Form kItem)
  if kItem
    if (checkedItemsValid.Find(kItem) > -1)
      return 1
    elseif (checkedItemsInvalid.Find(kItem) > -1)
      return 0
    endif
  endif
  return -1
endfunction

Bool function isItemBlacklisted(form akItem)
  if ConfigMenu.bPUOK 
    if JsonUtil.FormListHas("/MarkofArkay/MOA_BlackLists", "ItemBlackList", akItem)
      return true
    endif
  elseif ItemBlackList2.HasForm(akItem) || ((akItem As ObjectReference) && ItemBlackList2.HasForm((akItem As ObjectReference).GetBaseObject()))
    return True
  endif
  if ItemBlackList.HasForm(akItem) || ((akItem As ObjectReference) && ItemBlackList.HasForm((akItem As ObjectReference).GetBaseObject()))
    return True
  endif
  return False
endfunction

function removeEquipments(ObjectReference akInChest, ObjectReference akOutChest, Form[] Tradables, Form[] Equipment)
  Bool bContinue = False
  Bool bBreak = False
  Form kItem = None
  Int iValue = 0
  Int iAmount = 0
  Int iToRemove = 0
  Int iChecked = 0
  Bool bIsLoggingEnabled = ConfigMenu.bIsLoggingEnabled
  int checked = -1
  Int i = Equipment.Length
  while !bBreak && (i > 0)
    i -= 1
    bContinue = False
    kItem = Equipment[i]
    if (!kItem)
      iChecked -= 1
      bContinue = True
    endif
    if !bContinue
      if isItemBlacklisted(kItem)
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
      checked = checkedStatus(kItem)
      if (checked == 0)
        Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> IsChecked()", bIsLoggingEnabled)
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
      iAmount = akInChest.GetItemCount(kItem)
      if ConfigMenu.bRandomItemCurse
        iToRemove = Utility.RandomInt(0, 1)
      else
        iToRemove = 1
      endif
      if (!iToRemove) || (!iAmount)
        Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> Amount is 0", bIsLoggingEnabled)
        bContinue = True
      endif
    endif
    if (!bContinue && (checked == -1))
      if (ConfigMenu.iValidTypes.Find(kItem.GetType()) < 0)
        Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") Skipped -> InvalidType(" + kItem.GetType() + ")", bIsLoggingEnabled)
        bContinue = True
      endif
    endif
    if (!bContinue && (checked == -1))
      if ConfigMenu.bCheckKeyword
        if (kItem.HasKeywordString("zzzmoa_ignoreitem") || kItem.HasKeywordString("vendornosale") || kItem.HasKeywordString("magicdisallowenchanting") || kItem.HasKeywordString("sos_underwear") || kItem.HasKeywordString("sos_genitals"))
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
      if (checked == -1) && (iToRemove > 0)
        if (akInChest.GetItemCount(kItem) > 0)
          addInvalidItem(kItem)
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
            if (iTotalValues + (iValue * iToRemove)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int)
              Int iCount = iToRemove
              while iCount > 0 && ((iTotalValues + (iValue * iCount)) > (ConfigMenu.fLoseOtherTotalValueSlider As Int))
                iCount -= 1
              endwhile
              if iCount
                iToRemove = iCount
              else
                Debug.TraceConditional("MarkOfArkay: (" + kItem + "," + kItem.GetName() + ") skipped -> IsExpensive(" + iValue + "," + iTotalValues + ")", bIsLoggingEnabled)
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
        addValiditem(kItem)
        checked = 1
      endif
      Debug.TraceConditional("MarkOfArkay: " + iToRemove + " (" + kItem + "," + kItem.GetName() + ") removed. Values = (" + iTotalValues + "+" + iValue + ")", bIsLoggingEnabled)
      if ConfigMenu.fLoseOtherTotalValueSlider > 0
        if iTotalValues < ConfigMenu.fLoseOtherTotalValueSlider As Int
          iTotalValues = iTotalValues + (iValue * iToRemove)
          if iTotalValues >= ConfigMenu.fLoseOtherTotalValueSlider As Int
            Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
            bBreak = True
          endif
        else
          Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " >= " + ConfigMenu.fLoseOtherTotalValueSlider As Int, bIsLoggingEnabled)
          bBreak = True
        endif
        if !bBreak && ConfigMenu.fLoseOtherMinValueSlider > 0
          if (iTotalValues + ConfigMenu.fLoseOtherMinValueSlider) > ConfigMenu.fLoseOtherTotalValueSlider
            Debug.TraceConditional("MarkOfArkay: " + "Values(" + iTotalValues + ")" + " + MinValue(" + ConfigMenu.fLoseOtherMinValueSlider As Int + ") >= TotalValue(" + ConfigMenu.fLoseOtherTotalValueSlider As Int + ")", bIsLoggingEnabled)
            bBreak = True
          endif
        endif
      endif
    endif
    iChecked += 1
    if (iCheckLimit > 0)
      if (iChecked >= iCheckLimit)
        bBreak = True
      endif
    endif
    if bBreak || (i <= 0)
      Debug.TraceConditional("MarkOfArkay: " + iChecked + " items checked by ItemCheckerA", bIsLoggingEnabled)
    endif
  endwhile
  if akInChest != PlayerRef
    akInChest.RemoveAllItems(PlayerRef, True, True)
  endif
endfunction

function resetChecked()
  checkedItemsValid.Revert()
  checkedItemsInvalid.Revert()
endfunction
