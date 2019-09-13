Scriptname zzzmoautilscript

import StringUtil

Int Function iMin(Int a,Int b) Global
	If a <= b
		Return a
	EndIf
	Return b
EndFunction

Float Function fMin(Float a,Float b) Global
	If a <= b
		Return a
	EndIf
	Return b
EndFunction

Float Function fMax(Float a,Float b) Global
	If a >= b
		Return a
	EndIf
	Return b
EndFunction

Int Function iMax(Int a,Int b) Global
	If a >= b
		Return a
	EndIf
	Return b
EndFunction

Int Function iGetRandomWithExclusion( Int iFrom, Int iTo, Int iExclude) Global
	If ( iExclude > iTo ) || ( iExclude < iFrom )
		Return Utility.RandomInt(iFrom, iTo)
	EndIf
	Int iRandom = Utility.RandomInt(iFrom, iTo - 1)
	If iRandom >= iExclude
		iRandom += 1
	EndIf
	Return iRandom
EndFunction

Int Function ichangeVar(Int iVar,Int iMin,Int iMax, Int iAmount ) Global
	iVar = ( iVar + iAmount )
	If ( iVar > iMax )
		iVar = iMin
	ElseIf ( iVar < iMin )
		iVar = iMax
	EndIf
	Return iVar
EndFunction

Int Function RandomIntWithExclusionArray( Int iFrom, Int iTo, Bool[] iFlagArray) Global
	If iFrom == iTo
		If iFlagArray[iFrom]
			Return iFrom
		EndIf
		Return -1
	ElseIf iFrom > iTo
		Int iTemp = iFrom
		iFrom = iTo
		iTo = iTemp
	EndIf
	Int ExcludeCount = 0
	Int iIndex = iFrom
	While iIndex <= iTo
		If (!iFlagArray[iIndex])
			ExcludeCount += 1
		EndIf
		iIndex += 1
	Endwhile
	If ExcludeCount > (iTo - iFrom)
		Return -1
	EndIf
	Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = iFrom 
	 While (iIndex <= iTo)
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && !iFlagArray[iIndex])
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Int Function RandomIntWithShuffledExclusionArray( Int iFrom, Int iTo, Bool[] iFlagArray, Int[] iIndexArray) Global
	If iFrom == iTo
		If iFlagArray[iIndexArray[iFrom]]
			Return iFrom
		EndIf
		Return -1
	ElseIf iFrom > iTo
		Int iTemp = iFrom
		iFrom = iTo
		iTo = iTemp
	EndIf
	Int ExcludeCount = 0
	int iIndex = iFrom
	While iIndex <= iTo
		If (!iFlagArray[iIndexArray[iIndex]])
			ExcludeCount += 1
		EndIf
		iIndex += 1
	Endwhile
	If ExcludeCount > (iTo - iFrom)
		Return -1
	EndIf
	Int iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = iFrom 
	 While (iIndex <= iTo)
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && !iFlagArray[iIndexArray[iIndex]])
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Function iArrayClear(Int[] Arr) Global
	If Arr
		int i = Arr.Length
		While i > 0 
			i -= 1
			Arr[i] = 0
		EndWhile
	EndIf
EndFunction

Function fArrayClear(Float[] Arr) Global
	If Arr
		Int i = Arr.Length
		While i > 0 
			i -= 1
			Arr[i] = 0
		EndWhile
	EndIf
EndFunction 

Function kArrayClear(Form[] Arr) Global
	If Arr
		Int i = Arr.Length
		While i > 0 
			i -= 1
			Arr[i] = None
		EndWhile
	EndIf
EndFunction 

String Function sDecToHex(Int iDec) Global
	Bool bNegetive = False
	If iDec <= 0
		If iDec == 0
			Return "00000000"
		Else
			iDec *= -1
			bNegetive = True
		EndIf
	EndIf
	String sHexes = "0123456789ABCDEF"
	String r = ""
	Bool bAddOne = True
	Int n = iDec
	Int i
	While True
		If bNegetive
			i = 15 - (n % 16)
			If bAddOne
				i += 1
				If i == 16
					i = 0
				Else
					bAddOne = False
				EndIf
			EndIf
		Else
			i = n % 16
		EndIf
		r += GetNthChar(sHexes,i)
		n = (n / 16) As Int
		if n == 0
			String sResult = ""
			n = GetLength(r)
			While n > 0
				n -= 1
				sResult += GetNthChar(r, n)
			EndWhile
			If GetLength(sResult) < 8
				If bNegetive
					Return Substring("FFFFFFFF", 0, 8 - GetLength(sResult)) + sResult
				Else
					Return Substring("00000000", 0, 8 - GetLength(sResult)) + sResult
				EndIf
			EndIf
			Return sResult
		EndIf
	EndWhile
EndFunction

Bool Function bIsInteger(String s) Global
	Int i = GetLength(s)
	If i == 0
		Return False
	EndIf
	String c = ""
	While i > 0
		i -= 1
		c = GetNthChar(s,i)
		If i > 0
			If !StringUtil.IsDigit(c)
				Return False
			EndIf
		ElseIf GetLength(s) > 1 ;s should not be '-' or '+'
			If !StringUtil.IsDigit(c) && c != "-" && c != "+"
				Return False
			EndIf
		EndIf
	EndWhile
	Return True
EndFunction

Bool Function stopAndConfirm(Quest akQuest, Float afSecs = 3.0, Int aiStage = -1) Global
	If !akQuest.IsRunning()
		Return True
	EndIf
	If aiStage > -1
		akQuest.SetStage(aiStage)
	Else
		akQuest.Stop()
	EndIf
	Int i = 0
	While (i * 0.1) < afSecs && akQuest.IsRunning()
		Utility.Wait(0.1)
		i += 1
	EndWhile
	Return !akQuest.IsRunning() 
EndFunction

Function disintegrateWhenAble(Actor akActor) Global
	While akActor && akActor.GetParentCell() && akActor.GetParentCell().IsAttached()
		Utility.Wait(5)
	EndWhile
	akActor && akActor.RemoveAllItems()
	akActor && akActor.SetCriticalStage(akActor.CritStage_DisintegrateEnd)
	akActor && akActor.DisableNoWait()
EndFunction

Function stopBrawlQuest(Quest akBrawlQuest, Int akEndStage) Global
	akBrawlQuest.SetStage(akEndStage)
	Utility.Wait(1.0)
	Game.GetPlayer().ResetHealthAndLimbs()
	Game.GetPlayer().StopCombatAlarm()
EndFunction
