Scriptname zzzmoadiseasecursescript extends Quest

import zzzmoautilscript

Formlist property BaseDiseaseEffects auto
Formlist property BaseDiseases auto
Formlist property BaseTrapDiseaseEffects auto
Formlist property BaseTrapDiseases auto
zzzmoaReviveMCM property ConfigMenu auto
Potion property CureDiseasePotion auto
FormList property CursedDiseasesI auto
FormList property CursedDiseasesII auto
FormList property CursedDiseasesIII auto
FormList property CursedDiseasesIV auto
Formlist property CursedDiseasesStages auto
Quest property DiseaseCurseHandler auto
Actor property PlayerRef auto
GlobalVariable property moaCureDiseasesCost auto

event OnInfectPlayer(Form akSender)
  if akSender == ConfigMenu.ReviveScript.GetOwningQuest() As Form
    Debug.TraceConditional("MarkOfArkay: Infecting player with a cursed disease...", ConfigMenu.bIsLoggingEnabled)
    Float fStart = Utility.GetCurrentRealTime()
    infectPlayer()
    ConfigMenu.ReviveScript.bInfectingPlayer = False
    Debug.TraceConditional("MarkOfArkay: Infection completed in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.", ConfigMenu.bIsLoggingEnabled)
  endif
endevent

event OnInit()
  if DiseaseCurseHandler.IsRunning()
    RegisterForModEvent("MOA_RecalcCursedDisCureCost", "RecalcCursedDisCureCost")
  endif
endevent

event RecalcCursedDisCureCost(Form sender)
  setCureCost()
endevent

function addCursedDisease(Spell aiDisease, Int iIndex)
  if !aiDisease
    return
  endif
  removeBaseDisease(iIndex)
  removeOtherStages(iIndex)
  PlayerRef.AddSpell(aiDisease)
  Debug.TraceConditional("MarkOfArkay: player infected with " + aiDisease, ConfigMenu.bIsLoggingEnabled)
  Float fWait = 3.0
  while !PlayerRef.HasSpell(aiDisease) && fWait > 0
    Utility.Wait(0.2)
    fWait -= 0.2
  endwhile
  setCureCost()
endfunction

Int function bGetDiseaseStage(Int aiIndex)
  if PlayerRef.HasSpell(CursedDiseasesIV.GetAt(aiIndex) As Spell)
    return 3
  elseif PlayerRef.HasSpell(CursedDiseasesIII.GetAt(aiIndex) As Spell)
    return 2
  elseif PlayerRef.HasSpell(CursedDiseasesII.GetAt(aiIndex) As Spell)
    return 1
  elseif PlayerRef.HasSpell(CursedDiseasesI.GetAt(aiIndex) As Spell)
    return 0
  endif
  return -1
endfunction

Bool function bHasBaseDisease(Int iIndex)
  return (iIndex < BaseDiseaseEffects.GetSize() && PlayerRef.HasMagicEffect(BaseDiseaseEffects.GetAt(iIndex) As MagicEffect)) || (iIndex < BaseTrapDiseaseEffects.GetSize() && PlayerRef.HasMagicEffect(BaseTrapDiseaseEffects.GetAt(iIndex) As MagicEffect))
endfunction

function cureAllDiseases(Bool bCureBaseDiseases=True)
  Int iIndex = CursedDiseasesI.GetSize()
  Spell akTempSpell
  Int jIndex
  while iIndex > 0
    iIndex -= 1
    jIndex = CursedDiseasesStages.GetSize()
    while jIndex > 0
      jIndex -= 1
      akTempSpell = (CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell
      if PlayerRef.HasSpell(akTempSpell)
        PlayerRef.RemoveSpell(akTempSpell)
      endif
    endwhile
  endwhile
  if bCureBaseDiseases
    PlayerRef.EquipItem(CureDiseasePotion, False, True)
  endif
  moaCureDiseasesCost.SetValueInt(ConfigMenu.fDisPriceSlider As Int)
  DiseaseCurseHandler.Stop()
endfunction

Form function getDisease(Int aiIndex, Int aiCurStage)
  if aiCurStage > 2 || aiCurStage < -1
    return None
  endif
  aiCurStage += 1
  return (CursedDiseasesStages.GetAt(aiCurStage) As FormList).GetAt(aiIndex)
endfunction

function infectPlayer()
  if CursedDiseasesI.GetSize() == 0
    return
  endif
  Int iIndex = CursedDiseasesI.GetSize()
  Bool[] bFlagArr = Utility.CreateBoolArray(iIndex, True)
  Form[] diseaseArr = Utility.CreateFormArray(iIndex)
  Int iStage = 0
  Int iCanInfect = 0
  if !ConfigMenu.fDisChanceSlider
    iCanInfect = -1
  endif
  Bool bProgressed = False
  Bool bHasCursedDisease = False
  while iIndex > 0
    iIndex -= 1
    iStage = bGetDiseaseStage(iIndex)
    if iStage > -1
      if !bHasCursedDisease
        bHasCursedDisease = True
      endif
      if (!bProgressed || ConfigMenu.bMultipleDisProg) && (Utility.RandomInt(0, 99) < ConfigMenu.fDisProgChanceSlider)
        addCursedDisease(getDisease(iIndex, iStage) As Spell, iIndex)
        bProgressed = True
      endif
      bFlagArr[iIndex] = False
    elseif iStage == -1
      if iCanInfect != -1
        if !ConfigMenu.bMultipleDis && bHasCursedDisease
          iCanInfect = -1
        endif
      endif
      if iCanInfect != -1
        if ConfigMenu.bOnlyInfectIfHasBaseDis
          if !bHasBaseDisease(iIndex)
            bFlagArr[iIndex] = False
          endif
        endif
      endif
    endif
    if bFlagArr[iIndex] && (iCanInfect != -1)
      diseaseArr[iIndex] = getDisease(iIndex, iStage)
      if !diseaseArr[iIndex]
        bFlagArr[iIndex] = False
      else
        iCanInfect = 1
      endif
    endif
  endwhile
  if (iCanInfect == 1) && (Utility.RandomInt(0, 99) < ConfigMenu.fDisChanceSlider)
    iIndex = randomIntWithExclusionArray(0, diseaseArr.Length - 1, bFlagArr)
    addCursedDisease(diseaseArr[iIndex] As Spell, iIndex)
  endif
endfunction

function removeBaseDisease(Int iIndex)
  if iIndex < BaseDiseaseEffects.GetSize()
    PlayerRef.DispelSpell(BaseDiseases.GetAt(iIndex) As Spell)
  endif
  if iIndex < BaseTrapDiseaseEffects.GetSize()
    PlayerRef.DispelSpell(BaseTrapDiseases.GetAt(iIndex) As Spell)
  endif
endfunction

function removeOtherStages(Int iIndex)
  Int jIndex = CursedDiseasesStages.GetSize()
  while jIndex > 0
    jIndex -= 1
    PlayerRef.RemoveSpell((CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell)
  endwhile
endfunction

function setCureCost()
  Bool bBreak
  Int iTotal = 0
  Int iBaseCost = ConfigMenu.fDisPriceSlider As Int
  Float fMultCost = ConfigMenu.fDisPriceMultSlider
  Int iIndex = CursedDiseasesI.GetSize()
  Bool bHasDisease = False
  Int jIndex
  while iIndex > 0
    iIndex -= 1
    jIndex = CursedDiseasesStages.GetSize()
    bBreak = False
    while jIndex > 0 && !bBreak
      jIndex -= 1
      if PlayerRef.HasSpell((CursedDiseasesStages.GetAt(jIndex) As FormList).GetAt(iIndex) As Spell)
        iTotal += ((iBaseCost + ((fMultCost * jIndex) * iBaseCost)) As Int)
        bHasDisease = True
        bBreak = True
      endif
    endwhile
  endwhile
  moaCureDiseasesCost.SetValueInt(iMax(iTotal, ConfigMenu.fDisPriceSlider As Int))
  if bHasDisease && !DiseaseCurseHandler.IsRunning()
    DiseaseCurseHandler.Start()
  endif
  UpdateCurrentInstanceGlobal(moaCureDiseasesCost)
endfunction
