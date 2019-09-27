Scriptname zzzmoa_SpawnTestScript extends activemagiceffect  

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akCaster != Game.GetPlayer()
		Return
	EndIf
	Int iListIndex = -1
	Int iCount = 1
	Int iLevel = 2
	FormList SpawnList
	String sText
	String sResult
	Int iResult
	Bool[] bSpawnFlags = Utility.CreateBoolArray(iMax(1,ConfigMenu.iSpawnCounts.Length), True)
	If ConfigMenu.bUIEOK
		UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
		String[] sNames = ConfigMenu.sGetSpawns()
		Int i = 0
		While i < sNames.Length
			listMenu.AddEntryItem(sNames[i], -1, -1, False)
			i += 1
		EndWhile
		listMenu.OpenMenu(none, none)
		iResult = listMenu.GetResultInt()
		If iResult == -1
			Return
		EndIf
		iListIndex = iResult
		listMenu.ResetMenu()
		String[] sLevels = ConfigMenu.sGetSpawnLevels()
		i = 0
		While i < sLevels.Length
			listMenu.AddEntryItem(sLevels[i], -1, -1, False)
			i+= 1
		EndWhile
		listMenu.OpenMenu(none, none)
		iResult = listMenu.GetResultInt()
		If iResult == -1
			Return
		EndIf
		iLevel = iResult
		listMenu.ResetMenu()
		UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
		sText = "1"
		TextMenu.SetPropertyString("text", sText)
		TextMenu.OpenMenu(none, none)
		sResult = TextMenu.GetResultString()
		If !sResult
			Return
		EndIf
		If bIsInteger(sResult)
			iCount = sResult As Int
		EndIf
		TextMenu.ResetMenu()
		SpawnList = ReviveScript.NPCScript.SelectSpawnList(Game.GetPlayer() As ObjectReference, iListIndex, bSpawnFlags)
	Else
		SpawnList = ReviveScript.NPCScript.SelectSpawnList(Game.GetPlayer() As ObjectReference, -1, bSpawnFlags)
	EndIf
	If SpawnList && iCount > 0 && iLevel >= 0 && iLevel <= 4
		ReviveScript.NPCScript.SpawnActorsFromList(SpawnList, Game.GetPlayer() As ObjectReference, iCount, iLevel,iLevel)
	EndIf
EndEvent
