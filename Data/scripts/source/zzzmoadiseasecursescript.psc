Scriptname zzzmoadiseasecursescript extends Quest  

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
Quest Property DiseaseCurseHandler Auto
FormList Property CursedDiseasesI Auto
FormList Property CursedDiseasesII Auto
FormList Property CursedDiseasesIII Auto
FormList Property CursedDiseasesIV Auto
Formlist Property BaseDiseaseEffects Auto
Formlist Property BaseTrapDiseaseEffects Auto
Formlist Property BaseDiseases Auto
Formlist Property BaseTrapDiseases Auto
Formlist Property CursedDiseasesStages Auto
GlobalVariable Property moaCureDiseasesCost Auto
Potion Property CureDiseasePotion Auto
Actor Property PlayerRef Auto

Event OnInit()
	If DiseaseCurseHandler.IsRunning()
		RegisterForModEvent("MOA_RecalcCursedDisCureCost", "RecalcCursedDisCureCost")
	EndIf
EndEvent

Event OnInfectPlayer(Form akSender)
	If akSender == ConfigMenu.ReviveScript.GetOwningQuest() As Form
		Debug.TraceConditional("MarkOfArkay: Infecting player with a cursed disease...", ConfigMenu.bIsLoggingEnabled)
		Float fStart = Utility.GetCurrentRealTime()
		infectPlayer()
		ConfigMenu.ReviveScript.bInfectingPlayer = False
		Debug.TraceConditional("MarkOfArkay: Infection completed in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.", ConfigMenu.bIsLoggingEnabled)
	EndIf
EndEvent

Function infectPlayer()
	If CursedDiseasesI.GetSize() == 0
		Return
	EndIf
	Int iIndex = CursedDiseasesI.GetSize()
	Bool[] bFlagArr = Utility.CreateBoolArray(iIndex,True)
	Form[] diseaseArr = Utility.CreateFormArray(iIndex)
	Int iStage = 0
	Int iCanInfect = 0
	If !ConfigMenu.fDisChanceSlider
		iCanInfect = -1
	EndIf
	Bool bProgressed = False
	Bool bHasCursedDisease = False
	While iIndex > 0
		iIndex -= 1
		iStage = bGetDiseaseStage(iIndex)
		If iStage > -1
			If !bHasCursedDisease
				bHasCursedDisease = True
			EndIf
			If (!bProgressed || ConfigMenu.bMultipleDisProg) && (Utility.RandomInt(0,99) < ConfigMenu.fDisProgChanceSlider)
				addCursedDisease(getDisease(iIndex,iStage) As Spell, iIndex)
				bProgressed = True
			EndIf
			bFlagArr[iIndex] = False
		ElseIf iStage == -1
			If iCanInfect != -1
				If !ConfigMenu.bMultipleDis && bHasCursedDisease
					iCanInfect = -1
				EndIf
			EndIf
			If iCanInfect != -1
				If ConfigMenu.bOnlyInfectIfHasBaseDis
					If !bHasBaseDisease(iIndex)
						bFlagArr[iIndex] = False
					EndIf
				EndIf
			EndIf
		EndIf
		If bFlagArr[iIndex] && (iCanInfect != -1)
			diseaseArr[iIndex] = getDisease(iIndex,iStage)
			If !diseaseArr[iIndex]
				bFlagArr[iIndex] = False
			Else
				iCanInfect = 1
			EndIf
		EndIf
	EndWhile
	If (iCanInfect == 1) && (Utility.RandomInt(0,99) < ConfigMenu.fDisChanceSlider)
		iIndex = randomIntWithExclusionArray( 0, diseaseArr.Length - 1, bFlagArr)
		addCursedDisease(diseaseArr[iIndex] As Spell, iIndex)
	EndIf
EndFunction

Function addCursedDisease(Spell aiDisease,Int iIndex)
		If !aiDisease
			Return
		EndIf
		removeBaseDisease(iIndex)
		removeOtherStages(iIndex)
		PlayerRef.AddSpell(aiDisease)
		Float fWait = 3.0
		While !PlayerRef.HasSpell(aiDisease) && fWait > 0
			Utility.Wait(0.2)
			fWait -= 0.2
		EndWhile
		setCureCost()
EndFunction

Bool Function bHasBaseDisease(Int iIndex)
	Return (iIndex < BaseDiseaseEffects.GetSize() && PlayerRef.HasMagicEffect(BaseDiseaseEffects.GetAt(iIndex) As MagicEffect)) || \
	(iIndex < BaseTrapDiseaseEffects.GetSize() && PlayerRef.HasMagicEffect(BaseTrapDiseaseEffects.GetAt(iIndex) As MagicEffect))
EndFunction

Function removeOtherStages(Int iIndex)
	Int jIndex = CursedDiseasesStages.GetSize()
	While jIndex > 0
		jIndex -= 1
		PlayerRef.RemoveSpell((CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell)
	EndWhile
EndFunction

Function removeBaseDisease(Int iIndex)
	If iIndex < BaseDiseaseEffects.GetSize()
		PlayerRef.DispelSpell(BaseDiseases.GetAt(iIndex) As Spell)
	EndIf
	If iIndex < BaseTrapDiseaseEffects.GetSize()
		PlayerRef.DispelSpell(BaseTrapDiseases.GetAt(iIndex) As Spell)
	EndIf
EndFunction

Int Function bGetDiseaseStage(Int aiIndex)
	If PlayerRef.HasSpell(CursedDiseasesIV.GetAt(aiIndex) As Spell)
		Return 3
	ElseIf PlayerRef.HasSpell(CursedDiseasesIII.GetAt(aiIndex) As Spell)
		Return 2
	ElseIf PlayerRef.HasSpell(CursedDiseasesII.GetAt(aiIndex) As Spell)
		Return 1
	ElseIf PlayerRef.HasSpell(CursedDiseasesI.GetAt(aiIndex) As Spell)
		Return 0
	EndIf
	Return -1
EndFunction

Form Function getDisease(Int aiIndex, Int aiCurStage)
	If aiCurStage > 2 || aiCurStage < -1
		Return None
	EndIf
	aiCurStage += 1
	Return (CursedDiseasesStages.GetAt(aiCurStage) As FormList).GetAt(aiIndex)
EndFunction

Function setCureCost()
	Bool bBreak
	Int iTotal = 0
	Int iBaseCost = ConfigMenu.fDisPriceSlider As Int
	Float fMultCost = ConfigMenu.fDisPriceMultSlider
	Int iIndex = CursedDiseasesI.GetSize()
	Bool bHasDisease = False
	Int jIndex
	While iIndex > 0
		iIndex -= 1
		jIndex = CursedDiseasesStages.GetSize()
		bBreak = False
		While jIndex > 0 && !bBreak
			jIndex -= 1
			If PlayerRef.HasSpell((CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell)
				iTotal += ((iBaseCost + ((fMultCost * jIndex) * iBaseCost)) As Int)
				bHasDisease = True
				bBreak = True
			EndIf
		EndWhile
	EndWhile
	moaCureDiseasesCost.SetValueInt(iMax(iTotal,ConfigMenu.fDisPriceSlider As Int))
	If bHasDisease && !DiseaseCurseHandler.IsRunning()
		DiseaseCurseHandler.Start()
	EndIf
	UpdateCurrentInstanceGlobal(moaCureDiseasesCost)
EndFunction

Event RecalcCursedDisCureCost(Form sender)
	setCureCost()
EndEvent
	
Function cureAllDiseases(Bool bCureBaseDiseases = True)
	Int iIndex = CursedDiseasesI.GetSize()
	Spell akTempSpell
	Int jIndex
	While iIndex > 0
		iIndex -= 1
		jIndex = CursedDiseasesStages.GetSize()
		While jIndex > 0
			jIndex -= 1
			akTempSpell = (CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell
			If PlayerRef.HasSpell(akTempSpell)
				PlayerRef.RemoveSpell(akTempSpell)
			EndIf
		EndWhile
	EndWhile
	If bCureBaseDiseases
		PlayerRef.EquipItem(CureDiseasePotion,False,True)
	EndIf
	moaCureDiseasesCost.SetValueInt(ConfigMenu.fDisPriceSlider As Int)
	DiseaseCurseHandler.Stop()
EndFunction