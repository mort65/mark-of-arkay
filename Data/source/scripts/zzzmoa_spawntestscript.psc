Scriptname zzzmoa_SpawnTestScript extends activemagiceffect

import zzzmoautilscript

zzzmoaReviveMCM property ConfigMenu auto
zzzmoaReviverScript property ReviveScript auto

event OnEffectStart(Actor akTarget, Actor akCaster)
  if akCaster != Game.GetPlayer()
    return
  endif
  Int iListIndex = -1
  Int iCount = 1
  Int iLevel = 2
  FormList SpawnList
  String sText
  String sResult
  Int iResult
  Bool[] bSpawnFlags = Utility.CreateBoolArray(iMax(1, ConfigMenu.iSpawnCounts.Length), True)
  if ConfigMenu.bUIEOK
    UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
    String[] sNames = ConfigMenu.sGetSpawns()
    Int i = 0
    while i < sNames.Length
      listMenu.AddEntryItem(sNames[i], -1, -1, False)
      i += 1
    endwhile
    listMenu.OpenMenu(none, none)
    iResult = listMenu.GetResultInt()
    if iResult == -1
      return
    endif
    iListIndex = iResult
    listMenu.ResetMenu()
    String[] sLevels = ConfigMenu.sGetSpawnLevels()
    i = 0
    while i < sLevels.Length
      listMenu.AddEntryItem(sLevels[i], -1, -1, False)
      i += 1
    endwhile
    listMenu.OpenMenu(none, none)
    iResult = listMenu.GetResultInt()
    if iResult == -1
      return
    endif
    iLevel = iResult
    listMenu.ResetMenu()
    UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
    sText = "1"
    TextMenu.SetPropertyString("text", sText)
    TextMenu.OpenMenu(none, none)
    sResult = TextMenu.GetResultString()
    if !sResult
      return
    endif
    if bIsInteger(sResult)
      iCount = sResult As Int
    endif
    TextMenu.ResetMenu()
    SpawnList = ReviveScript.NPCScript.SelectSpawnList(Game.GetPlayer() As ObjectReference, iListIndex, bSpawnFlags)
  else
    SpawnList = ReviveScript.NPCScript.SelectSpawnList(Game.GetPlayer() As ObjectReference, -1, bSpawnFlags)
  endif
  if SpawnList && iCount > 0 && iLevel >= 0 && iLevel <= 4
    ReviveScript.NPCScript.SpawnActorsFromList(SpawnList, Game.GetPlayer() As ObjectReference, iCount, iLevel, iLevel)
  endif
endevent
