Scriptname zzzmoautilscript

import StringUtil

Int function RandomIntWithExclusionArray(Int iFrom, Int iTo, Bool[] iFlagArray) Global
{Generates a random integer between iFrom and iTo (inclusive), excluding false values with the same index in a bool array}
  if iFrom == iTo
    if iFlagArray[iFrom]
      return iFrom
    endif
    return -1
  elseif iFrom > iTo
    Int iTemp = iFrom
    iFrom = iTo
    iTo = iTemp
  endif
  Int ExcludeCount = 0
  Int iIndex = iFrom
  while iIndex <= iTo
    if (!iFlagArray[iIndex])
      ExcludeCount += 1
    endif
    iIndex += 1
  endwhile
  if ExcludeCount > (iTo - iFrom)
    return -1
  endif
  Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
  if ExcludeCount > 0
    iIndex = iFrom
    while (iIndex <= iTo)
      if (iRandom < iIndex)
        return iRandom
      elseif ((iRandom >= iIndex) && !iFlagArray[iIndex])
        iRandom += 1
      endif
      iIndex += 1
    endwhile
  endif
  return iRandom
endfunction

Int function RandomIntWithShuffledExclusionArray(Int iFrom, Int iTo, Bool[] iFlagArray, Int[] iIndexArray) Global
{Generates a random integer between iFrom and iTo (inclusive), excluding false values in a bool array with the same index using a Int array for mapping indexes.}
  if iFrom == iTo
    if iFlagArray[iIndexArray[iFrom]]
      return iFrom
    endif
    return -1
  elseif iFrom > iTo
    Int iTemp = iFrom
    iFrom = iTo
    iTo = iTemp
  endif
  Int ExcludeCount = 0
  int iIndex = iFrom
  while iIndex <= iTo
    if (!iFlagArray[iIndexArray[iIndex]])
      ExcludeCount += 1
    endif
    iIndex += 1
  endwhile
  if ExcludeCount > (iTo - iFrom)
    return -1
  endif
  Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
  if ExcludeCount > 0
    iIndex = iFrom
    while (iIndex <= iTo)
      if (iRandom < iIndex)
        return iRandom
      elseif ((iRandom >= iIndex) && !iFlagArray[iIndexArray[iIndex]])
        iRandom += 1
      endif
      iIndex += 1
    endwhile
  endif
  return iRandom
endfunction

Bool function bIsFormArrEmpty(Form[] Arr) Global
{Checking if a form array is empty.}
  if Arr
    Int i = Arr.Length
    while i > 0
      i -= 1
      if Arr[i]
        return False
      endif
    endwhile
  endif
  return True
endfunction

Bool function bIsInteger(String s) Global
{Checking if a string is an integer or not.}
  Int i = GetLength(s)
  if i == 0
    return False
  endif
  String c = ""
  while i > 0
    i -= 1
    c = GetNthChar(s, i)
    if i > 0
      if !StringUtil.IsDigit(c)
        return False
      endif
    elseif GetLength(s) > 1
      if !StringUtil.IsDigit(c) && c != "-" && c != "+"
        return False
      endif
    endif
  endwhile
  return True
endfunction

FormList function checkAndFixFormList(FormList akList, Bool abCheckSize=False, Bool abOnlyRef=False, Bool abCheckRefPlace=False, Int aiBaseType=-1, FormList akOtherList=None) Global
{Checking a Form list for nones, invalid refs, reducing number of forms to 128 and removing invalids in place or adding valid forms to another form list.}
  Bool bHasNone = False
  Int i = 0
  while i < akList.GetSize() && !bHasNone
    bHasNone = !akList.GetAt(i)
    i += 1
  endwhile
  if bHasNone || abOnlyRef || (abCheckSize && akList.GetSize() > 128) || akOtherList
    Form[] kArr
    if abCheckSize && akList.GetSize() > 128
      kArr = new Form[128]
      i = 0
      while i < 128
        kArr[i] = akList.GetAt(i) As Form
        i += 1
      endwhile
    else
      kArr = akList.ToArray()
    endif
    if !akOtherList
      akList.Revert()
    endif
    ObjectReference kRef
    i = 0
    while i < kArr.Length
      if kArr[i]
        if abOnlyRef
          if kArr[i].GetType() == 61
            kRef = kArr[i] As ObjectReference
            if (!abCheckRefPlace || (kRef.GetParentCell() || kRef.GetWorldSpace())) && ((aiBaseType < 1) || (kRef.GetBaseObject().GetType() == aiBaseType))
              if akOtherList
                akOtherList.AddForm(kArr[i])
              else
                akList.AddForm(kArr[i])
              endif
            endif
          endif
        else
          if akOtherList
            akOtherList.AddForm(kArr[i])
          else
            akList.AddForm(kArr[i])
          endif
        endif
      endif
      i += 1
    endwhile
  endif
  if akOtherList
    return akOtherList
  endif
  return akList
endfunction

Float function checkFloat(Float fVar, Float fMin, Float fMax, Float fDefault) Global
{Checks if a float is between the minimum and maximum value, if not, returns the default value.}
  if fMin > fMax
    Float fTemp = fMin
    fMin = fMax
    fMax = fTemp
  endif
  if ((fVar >= fMin) && (fVar <= fMax))
    return fVar
  endif
  return fDefault
endfunction

Int function checkInt(Int iVar, Int iMin, Int iMax, Int iDefault) Global
{Checks if an int is between the minimum and maximum value, if not, returns the default value.}
  if iMin > iMax
    Int iTemp = iMin
    iMin = iMax
    iMax = iTemp
  endif
  if ((iVar >= iMin) && (iVar <= iMax))
    return iVar
  endif
  return iDefault
endfunction

function disintegrateNow(Actor akActor) Global
{Removes a leveled actor from the game instantly.}
  akActor && akActor.RemoveAllItems()
  akActor && akActor.SetCriticalStage(akActor.CritStage_DisintegrateEnd)
  akActor && akActor.DisableNoWait()
endfunction

function disintegrateWhenAble(Actor akActor) Global
{Removes a leveled actor from the game when player is not around.}
  while akActor && akActor.GetParentCell() && akActor.GetParentCell().IsAttached()
    Utility.Wait(5)
  endwhile
  akActor && akActor.RemoveAllItems()
  akActor && akActor.SetCriticalStage(akActor.CritStage_DisintegrateEnd)
  akActor && akActor.DisableNoWait()
endfunction

function fArrayClear(Float[] Arr) Global
{clears a float array.}
  if Arr
    Int i = Arr.Length
    while i > 0
      i -= 1
      Arr[i] = 0
    endwhile
  endif
endfunction

Float function fMax(Float a, Float b) Global
{Finds maximum of two floats.}
  if a >= b
    return a
  endif
  return b
endfunction

Float function fMin(Float a, Float b) Global
{Finds minimum of two floats.}
  if a <= b
    return a
  endif
  return b
endfunction

Form function getFromMergedFormList(FormList akMergedlist, Int aiIndex=0) Global
{Gets a value by index from a formlist of formlists by using an index that is betwwen 0 and sum of the size of all formlists in the formlist minus 1.}
  Int i = 0
  while i < akMergedlist.GetSize() && aiIndex > -1
    if aiIndex < (akMergedlist.GetAt(i) As FormList).GetSize()
      return (akMergedlist.GetAt(i) As FormList).GetAt(aiIndex)
    endif
    aiIndex -= (akMergedlist.GetAt(i) As FormList).GetSize()
    i += 1
  endwhile
  return None
endfunction

function iArrayClear(Int[] Arr) Global
{Clears an int array.}
  if Arr
    int i = Arr.Length
    while i > 0
      i -= 1
      Arr[i] = 0
    endwhile
  endif
endfunction

Int function iGetRandomWithExclusion(Int iFrom, Int iTo, Int iExclude) Global
{Generates a random integer between iFrom and iTo (inclusive), excluding one value}
  if (iExclude == iFrom) && (iExclude == iTo)
    return iExclude
  endif
  if (iExclude > iTo) || (iExclude < iFrom)
    return Utility.RandomInt(iFrom, iTo)
  endif
  Int iRandom = Utility.RandomInt(iFrom, iTo - 1)
  if iRandom >= iExclude
    iRandom += 1
  endif
  return iRandom
endfunction

Int function iGetRandomWithExclusionIntArray(Int iFrom, Int iTo, Int[] iExcludes) Global
{Generates a random integer between iFrom and iTo (inclusive), excluding values in an array}
  if iFrom == iTo
    return iFrom
  endif
  if iFrom > iTo
    Int iTemp = iTo
    iTo = iFrom
    iFrom = iTemp
  endif
  Int[] iArr = Utility.CreateIntArray((iTo - iFrom) + 1, iFrom)
  Int i = 0
  Int j = 0
  int c = 0
  Int iIndex = 0
  Int iNum
  Bool bConflict = False
  while iIndex < iArr.Length
    iNum = iIndex + iFrom
    bConflict = False
    j = 0
    while !bConflict && j < iExcludes.Length
      if iExcludes[j] == iNum
        bConflict = True
      endif
      j += 1
    endwhile
    if !bConflict
      iArr[i] = iNum
      i += 1
      c += 1
    endif
    iIndex += 1
  endwhile
  if c == 0
    return iFrom
  endif
  return iArr[Utility.RandomInt(iFrom, iFrom + c - 1)]
endfunction

Int function iMax(Int a, Int b) Global
{Finds maximum of two ints.}
  if a >= b
    return a
  endif
  return b
endfunction

Int function iMin(Int a, Int b) Global
{Finds minimum of two ints.}
  if a <= b
    return a
  endif
  return b
endfunction

Int function ichangeVar(Int iVar, Int iMin, Int iMax, Int iAmount) Global
{Increase or decrease a global variable by an amount in a circle between iMin and iMax.}
  iVar = (iVar + iAmount)
  if (iVar > iMax)
    iVar = iMin
  elseif (iVar < iMin)
    iVar = iMax
  endif
  return iVar
endfunction

bool function isPlayerControlsEnabled(bool bMovement=false, bool bFighting=false, bool bCamSwitch=false, bool bLooking=false, bool bSneaking=false, bool bMenu=false, bool bActivate=false, bool bJournalTabs=False, bool bFastTravel=False) Global
{Checks whether the specified player controls are enabled or not.}
  return ((bMovement && Game.IsMovementControlsEnabled()) || (bFighting && Game.IsFightingControlsEnabled()) || (bCamSwitch && Game.IsCamSwitchControlsEnabled()) || (bLooking && Game.IsLookingControlsEnabled()) || (bSneaking && Game.IsSneakingControlsEnabled()) || (bMenu && Game.IsMenuControlsEnabled()) || (bActivate && Game.IsActivateControlsEnabled()) || (bJournalTabs && Game.IsJournalControlsEnabled()) || (bFastTravel && Game.IsFastTravelControlsEnabled()))
endfunction

function kArrayClear(Form[] Arr) Global
{clears a form array.}
  if Arr
    Int i = Arr.Length
    while i > 0
      i -= 1
      Arr[i] = None
    endwhile
  endif
endfunction

function keepControlsDisabled(float fDuration, bool bMovement=true, bool bFighting=true, bool bCamSwitch=false, bool bLooking=false, bool bSneaking=false, bool bMenu=true, bool bActivate=true, bool bJournalTabs=false, bool bFastTravel=false) Global
{Keeps player controls disabled for the specified duration.}
  float f = 0.0
  while f < fDuration
    if isPlayerControlsEnabled(bMovement, bFighting, bCamSwitch, bLooking, bSneaking, bMenu, bActivate, bJournalTabs, false)
      game.DisablePlayerControls(abMovement=bMovement, abFighting=bFighting, abCamSwitch=bCamSwitch, abLooking=bLooking, abSneaking=bSneaking, abMenu=bMenu, abActivate=bActivate, abJournalTabs=bJournalTabs)
    endif
    if (bFastTravel && Game.IsFastTravelControlsEnabled())
      Game.EnableFastTravel(false)
    endif
    utility.wait(0.2)
    f += 0.2
  endwhile
endfunction

function killPlayer() Global
{Kills the player even if the player is essential or Invulnerable or god mod is active.}
  Actor player = Game.GetPlayer()
  ActorBase playerBase = player.GetBaseObject() As ActorBase
  Debug.SetGodMode(False)
  playerBase.SetInvulnerable(False)
  playerBase.SetEssential(0)
  player.Kill()
endfunction

Int function randIntFromlimitedRange(Int iMin, Int iMax, Int iLimit, Int iMinValue, Int iMaxValue) Global
{Generates a random integer between iMin and iMax (inclusive), and limit the result between a range.}
  Int MinAmount = iMin
  Int MaxAmount = iMax
  if MinAmount > iLimit
    return 0
  else
    if MinAmount > iMaxValue
      MinAmount = iMaxValue
    endif
    if MinAmount < iMinValue
      MinAmount = iMinValue
    endif
    if MaxAmount > iMaxValue || MaxAmount <= iMinValue
      MaxAmount = iMaxValue
    endif
    if MaxAmount < MinAmount
      Int tmp = MinAmount
      MinAmount = MaxAmount
      MaxAmount = tmp
    endif
  endif
  return Utility.RandomInt(MinAmount, MaxAmount)
endfunction

String function sDecToHex(Int iDec) Global
{Converts a decimal integer to hexadecimal}
  Bool bNegetive = False
  if iDec <= 0
    if iDec == 0
      return "00000000"
    else
      iDec *= -1
      bNegetive = True
    endif
  endif
  String sHexes = "0123456789ABCDEF"
  String r = ""
  Bool bAddOne = True
  Int n = iDec
  Int i
  while True
    if bNegetive
      i = 15 - (n % 16)
      if bAddOne
        i += 1
        if i == 16
          i = 0
        else
          bAddOne = False
        endif
      endif
    else
      i = n % 16
    endif
    r += GetNthChar(sHexes, i)
    n = (n / 16) As Int
    if n == 0
      String sResult = ""
      n = GetLength(r)
      while n > 0
        n -= 1
        sResult += GetNthChar(r, n)
      endwhile
      if GetLength(sResult) < 8
        if bNegetive
          return Substring("FFFFFFFF", 0, 8 - GetLength(sResult)) + sResult
        else
          return Substring("00000000", 0, 8 - GetLength(sResult)) + sResult
        endif
      endif
      return sResult
    endif
  endwhile
endfunction

String function shortenString(String sString, Int iLimit) Global
{Shortens the input string and put ... at the end of it.}
  Int iLen = GetLength(sString)
  if iLimit < 4
    if iLimit < 1
      return sString
    endif
    if iLen > iLimit
      return Substring(sString, 0, iLimit)
    endif
    return sString
  elseif iLen < 4
    return sString
  endif
  if iLen > iLimit
    return Substring(sString, 0, len=iLimit - 3) + "..."
  endif
  return sString
endfunction

Bool function stopAndConfirm(Quest akQuest, Float afSecs=3.0, Int aiStage=-1) Global
{Stops a quest and wait for it to stop, optionaly set stage of the quest to a stage that would stop it.}
  if !akQuest.IsRunning()
    return True
  endif
  if aiStage > -1
    akQuest.SetStage(aiStage)
  else
    akQuest.Stop()
  endif
  Int i = 0
  while (i * 0.1) < afSecs && akQuest.IsRunning()
    Utility.Wait(0.1)
    i += 1
  endwhile
  return !akQuest.IsRunning()
endfunction

function stopBrawlQuest(Quest akBrawlQuest, Int akEndStage) Global
{Stops a brawling quest by setting the stage to the stop stage and revive the player character from bleedout.}
  akBrawlQuest.SetStage(akEndStage)
  Utility.Wait(1.0)
  Game.GetPlayer().ResetHealthAndLimbs()
  Game.GetPlayer().StopCombatAlarm()
endfunction

function transferItems(ObjectReference akInContainer, ObjectReference akOutContainer, Int aiIndex=0, Int aiCount=-1, Int aiNumber=-1) Global
{Transfers specified numbers or all of each item from an object reference to another}
  if aiIndex > akInContainer.GetNumItems() - 1
    return
  endif
  if aiCount == -1
    aiCount = akInContainer.GetNumItems()
  endif
  Int aiLast = iMin(akInContainer.GetNumItems() - 1, (aiIndex + aiCount) - 1)
  Bool bNext = False
  Form kItem
  while aiIndex < aiLast + 1
    bNext = true
    kItem = akInContainer.GetNthForm(aiIndex)
    if kItem
      if (aiNumber <= -1) || (aiNumber > akInContainer.GetItemCount(kItem))
        akInContainer.RemoveItem(kItem, akInContainer.GetItemCount(kItem), True, akOutContainer)
      else
        akInContainer.RemoveItem(kItem, aiNumber, True, akOutContainer)
      endif
      if (akInContainer.GetNthForm(aiIndex) && (kItem != akInContainer.GetNthForm(aiIndex)))
        bNext = false ;current item replaced by the next item
        if aiIndex < aiLast
          aiLast -= 1
        endif
      endif
    endif
    if bNext
      aiIndex += 1
    endif
  endwhile
endfunction

function transferItemsWithExclusionArr(ObjectReference akInContainer, ObjectReference akOutContainer, Form[] excludesArr, Int aiIndex=0, Int aiCount=-1, Int aiNumber=-1) Global
{Transfers specified numbers or all of each item from an object reference to another excluding the items that are in excludesArr}
  if aiIndex > akInContainer.GetNumItems() - 1
    return
  endif
  if aiCount == -1
    aiCount = akInContainer.GetNumItems()
  endif
  Int aiLast = iMin(akInContainer.GetNumItems() - 1, (aiIndex + aiCount) - 1)
  Bool bExcludeArr = (excludesArr && (excludesArr.Length > 0))
  Form kItem
  Bool bNext = False
  while aiIndex < aiLast + 1
    bNext = true
    kItem = akInContainer.GetNthForm(aiIndex)
    if kItem
      if (!bExcludeArr || (excludesArr.Find(kItem) < 0))
        if (aiNumber <= -1) || (aiNumber > akInContainer.GetItemCount(kItem))
          akInContainer.RemoveItem(kItem, akInContainer.GetItemCount(kItem), True, akOutContainer)
        else
          akInContainer.RemoveItem(kItem, aiNumber, True, akOutContainer)
        endif
        if (akInContainer.GetNthForm(aiIndex) && (kItem != akInContainer.GetNthForm(aiIndex)))
          bNext = false ;current item replaced by the next item
          if aiIndex < aiLast
            aiLast -= 1
          endif
        endif
      endif
    endif
    if bNext
      aiIndex += 1
    endif
  endwhile
endfunction

function transferItemsWithExclusions(ObjectReference akInContainer, ObjectReference akOutContainer, FormList excludeList, Form[] excludesArr, Int aiIndex=0, Int aiCount=-1, Int aiNumber=-1) Global
{Transfers specified numbers or all of each item from an object reference to another excluding the items that are in excludeList or excludesArr}
  if aiIndex > akInContainer.GetNumItems() - 1
    return
  endif
  if aiCount == -1
    aiCount = akInContainer.GetNumItems()
  endif
  Int aiLast = iMin(akInContainer.GetNumItems() - 1, (aiIndex + aiCount) - 1)
  Bool bExcludeArr = (excludesArr && (excludesArr.Length > 0))
  Bool bNext = False
  Form kItem
  while aiIndex < aiLast + 1
    bNext = True
    kItem = akInContainer.GetNthForm(aiIndex)
    if kItem
      if (!bExcludeArr || (excludesArr.Find(kItem) < 0)) && (!excludeList || excludeList.Find(kItem) < 0)
        if (aiNumber <= -1) || (aiNumber > akInContainer.GetItemCount(kItem))
          akInContainer.RemoveItem(kItem, akInContainer.GetItemCount(kItem), True, akOutContainer)
        else
          akInContainer.RemoveItem(kItem, aiNumber, True, akOutContainer)
        endif
        if (akInContainer.GetNthForm(aiIndex) && (kItem != akInContainer.GetNthForm(aiIndex)))
          bNext = false ;current item replaced by the next item
          if aiIndex < aiLast
            aiLast -= 1
          endif
        endif
      endif
    endif
    if bNext
      aiIndex += 1
    endif
  endwhile
endfunction
