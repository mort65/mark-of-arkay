Scriptname zzzmoaskillcursescript extends Quest

import zzzmoautilscript

zzzmoaReviveMCM property ConfigMenu auto
Spell property Dumbness auto
Int property PerkPointDebt=0 auto Hidden
Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto
Int[] property SkillIndex auto Hidden
Bool[] property SkillsFlags auto Hidden
Float[] property fPrevSkillLevel auto Hidden
Float[] property fPrevSkillUseMult auto Hidden
Float[] property fPrevSkillXP auto Hidden
Int[] property iAttBase auto Hidden
Int[] property iLostSkills auto Hidden
Int[] property iSkillCap auto Hidden
GlobalVariable property moaAlchemyCap auto
GlobalVariable property moaAlterationCap auto
GlobalVariable property moaBlockCap auto
GlobalVariable property moaConjurationCap auto
GlobalVariable property moaDestructionCap auto
GlobalVariable property moaEnchantingCap auto
GlobalVariable property moaHeavyArmorCap auto
GlobalVariable property moaIllusionCap auto
GlobalVariable property moaLightArmorCap auto
GlobalVariable property moaLockpickingCap auto
GlobalVariable property moaMarksmanCap auto
GlobalVariable property moaOneHandedCap auto
GlobalVariable property moaPerkPerLevel auto
GlobalVariable property moaPickpocketCap auto
GlobalVariable property moaReduceCarryWeight auto
GlobalVariable property moaReduceHMS auto
GlobalVariable property moaRestorationCap auto
GlobalVariable property moaSmithingCap auto
GlobalVariable property moaSneakCap auto
GlobalVariable property moaSpeechcraftCap auto
GlobalVariable property moaTwoHandedCap auto
String[] property sAttName auto Hidden
String[] property sSkillName auto Hidden

event OnInit()
  SetVars()
endevent

;Function RegisterForLevel()
;	dsl_levelincreaseevent.RegisterForLevelIncrease(Self As Form, "OnLevelIncrease")
;Endfunction
;Function UnRegisterForLevel()
;	dsl_levelincreaseevent.UnregisterForLevelIncrease(Self As Form, "OnLevelIncrease")
;Endfunction
event OnLevelIncrease(Int aiNewLevel)
  if (ReviveScript.moaState.GetValue() == 0)
    return
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Level increased to " + aiNewLevel)
  Int iPerkPoints = Game.GetPerkPoints()
  Int toRemove = PerkPointDebt
  if toRemove > iPerkPoints
    toRemove = iPerkPoints
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Has " + iPerkPoints + " points, want to remove " + PerkPointDebt + ", will remove " + toRemove)
  Game.ModPerkPoints(-toRemove)
  ChangePerkDept(-toRemove)
endevent

function ChangePerkDept(Int toChange)
  PerkPointDebt += toChange
endfunction

function DisableAllXP()
  Int i = fPrevSkillUseMult.Length
  while i > 0
    i -= 1
    if !fPrevSkillUseMult[i]
      DisableXP(i)
    endif
  endwhile
  PlayerRef.AddSpell(Dumbness)
endfunction

function DisableXP(Int iSkillIndex)
  ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[iSkillIndex])
  float curSkillUseMult = skillInfo.GetSkillUseMult()
  if curSkillUseMult > 0.0
    fPrevSkillUseMult[iSkillIndex] = curSkillUseMult
    skillInfo.SetSkillUseMult(0.0)
  endif
endfunction

function EnableAllXP()
  Int i = fPrevSkillUseMult.Length
  while i > 0
    i -= 1
    EnableXP(i)
  endwhile
  if PlayerRef.HasSpell(Dumbness)
    PlayerRef.RemoveSpell(Dumbness)
  endif
endfunction

function EnableXP(Int iSkillIndex)
  if fPrevSkillUseMult[iSkillIndex] > 0.0
    ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[iSkillIndex])
    skillInfo.SetSkillUseMult(fPrevSkillUseMult[iSkillIndex])
    fPrevSkillUseMult[iSkillIndex] = 0.0
  endif
endfunction

function LoseSkills()
  iArrayClear(iLostSkills)
  fArrayClear(fPrevSkillLevel)
  fArrayClear(fPrevSkillXP)
  EnableAllXP()
endfunction

function ReduceHMS(Int iLevelToLose=1)
  if !moaReduceHMS.GetValue()
    return
  endif
  while iLevelToLose > 0
    Float[] fHMSWeights = new Float[3]
    Int iAttrIncrement = Game.GetGameSettingInt("iAVDhmsLevelUp")
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Att Increment = " + iAttrIncrement)

    ; Set weights
    Int i = 0
    Float fTotalWeight = 0
    while i < fHMSWeights.Length
      Float fWeight = (PlayerRef.GetBaseActorValue(sAttName[i]) - iAttBase[i]) / iAttrIncrement
      if fWeight < 0
        fWeight = 0
      endif
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + sAttName[i] + " has base " + iAttBase[i])
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + sAttName[i] + " has weight " + fWeight)
      fTotalWeight += fWeight
      fHMSWeights[i] = fTotalWeight
      i += 1
    endwhile
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Total weight = " + fTotalWeight)
    if fTotalWeight < 1
      return
    endif
    int r = Utility.RandomInt(1, fTotalWeight as Int)
    int iAttToLose = -1
    i = 0
    while (i < fHMSWeights.Length) && (iAttToLose < 0)
      if r <= fHMSWeights[i]
        iAttToLose = i
      endif
      i += 1
    endwhile
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rolled " + r)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Losing " + sAttName[iAttToLose])
    PlayerRef.SetActorValue(sAttName[iAttToLose], PlayerRef.GetBaseActorValue(sAttName[iAttToLose]) - iAttrIncrement)
    if moaReduceCarryWeight.GetValue() && sAttName[iAttToLose] == "Stamina"
      Float fNewCarryWeight = PlayerRef.GetBaseActorValue("CarryWeight") - Game.GetGameSettingFloat("fLevelUpCarryWeightMod")
      if fNewCarryWeight > 0.0
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Also losing CarryWeight")
        PlayerRef.SetActorValue("CarryWeight", fNewCarryWeight)
      endif
    endif
    iLevelToLose -= 1
  endwhile
endfunction

function ReducePerk(Int iPerkPointsToLose=1)
  if iPerkPointsToLose <= 0
    return
  endif
  if Game.GetPerkPoints() > 0
    if iPerkPointsToLose > Game.GetPerkPoints()
      PerkPointDebt += (iPerkPointsToLose - Game.GetPerkPoints())
      iPerkPointsToLose = Game.GetPerkPoints()
    endif
    Game.ModPerkPoints(-iPerkPointsToLose)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Perk points decreased from " + (Game.GetPerkPoints() + iPerkPointsToLose) + " to " + Game.GetPerkPoints())
  else
    PerkPointDebt += iPerkPointsToLose
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Perk point dept increased from " + (PerkPointDebt - iPerkPointsToLose) + " to " + PerkPointDebt)
  endif
endfunction

Float[] function ReduceSkill(String Skill, Int Percent=-1, Int MinAmount=1, Int MaxAmount=1, Int CurrentLevel, Float CurrentXP)
  ;Reduce Skill level and skill's xp.
  ;If bLoseSkillForever and bLevelReduce is on,
  ;then reduce player level and player level's xp
  Int _amount = 0
  Int iLevelToLose = 0
  Int currentSkillLevel = PlayerRef.GetBaseActorValue(Skill) As Int
  if (Percent <= 0) && (MinAmount <= 0) && (MaxAmount <= 0)
    return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
  endif
  if Percent > 0
    if currentSkillLevel > 0
      _amount = imax(1, ((Percent * (currentSkillLevel - 1)) / 100) As Int)
    endif
  else
    _amount = randIntFromlimitedRange(MinAmount, MaxAmount, currentSkillLevel, 0, currentSkillLevel - 1)
  endif
  if _amount > 0
    Int iIndex = sSkillName.Find(Skill)
    if iIndex > -1
      ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(Skill)
      float fXPPerSkillRank = Game.GetGameSettingFloat("fXPPerSkillRank")
      float fXPToLose = currentSkillLevel * fXPPerSkillRank
      float fOldSkillXP = skillInfo.GetSkillExperience()
      float fSkillProgress = fOldSkillXP / skillInfo.GetExperienceForLevel(currentSkillLevel)
      if _amount >= currentSkillLevel
        _amount = currentSkillLevel - 1
      endif
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: CurrentXP/ExperienceForLevel(" + currentLevel + ") = " + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel))
      if _amount < 1
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose 0 skill level")
        return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
      elseif fSkillProgress > 1.0
        SkillsFlags[sSkillName.Find(Skill)] = False
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + "'s XP is invalid (" + fOldSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel) + ")")
        return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
      elseif ((!CurrentXP && currentLevel < 2) || CurrentXP >= Game.GetExperienceForLevel(currentLevel))
        SkillsFlags[sSkillName.Find(Skill)] = False
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP is invalid  (" + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel) + ")")
        return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
      elseif (CurrentXP < fXPToLose && (CurrentLevel < 2 || !ConfigMenu.bLevelReduce))
        SkillsFlags[sSkillName.Find(Skill)] = False
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose " + Skill + " skill level without losing a level")
        return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
      else
        Int i = 0
        Bool bBreak = False
        while !bBreak && i < _amount
          if (CurrentXP - fXPToLose) < 0
            if ConfigMenu.bLevelReduce
              if (currentLevel - (iLevelToLose + 1)) > 0
                iLevelToLose += 1
                CurrentXP = Game.GetExperienceForLevel(currentLevel - iLevelToLose) - (fXPToLose - CurrentXP)
                if CurrentXP < 0.0
                  float fPrevXP = CurrentXP
                  Int iPrevLevelToLose = iLevelToLose
                  while CurrentXP < 0.0 && (currentLevel - (iLevelToLose + 1)) > 0
                    iLevelToLose += 1
                    CurrentXP = Game.GetExperienceForLevel(currentLevel - iLevelToLose) + CurrentXP
                  endwhile
                  if (currentLevel - (iLevelToLose + 1)) <= 0 || CurrentXP < 0.0
                    CurrentXP = fPrevXP
                    iLevelToLose = iPrevLevelToLose
                    fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
                    SkillsFlags[sSkillName.Find(Skill)] = False
                    bBreak = True
                    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP is invalid  (" + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel) + ")")
                  endif
                else
                  i += 1
                  fXPToLose = ((currentSkillLevel - i) * fXPPerSkillRank)
                endif
              else
                fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
                SkillsFlags[sSkillName.Find(Skill)] = False
                bBreak = True
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose more than " + iLevelToLose + " level(s)")
              endif
            else
              fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
              SkillsFlags[sSkillName.Find(Skill)] = False
              bBreak = True
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose more than " + i + " point(s) in " + Skill + " skill without losing a level")
            endif
          else
            i += 1
            fXPToLose += ((currentSkillLevel - i) * fXPPerSkillRank)
          endif
        endwhile
        _amount = i
        if _amount > 0
          if fOldSkillXP > 0.0
            float newSkillXP = fSkillProgress * skillInfo.GetExperienceForLevel((currentSkillLevel - _amount) as int)
            skillInfo.SetSkillExperience(newSkillXP)
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + "'s XP changed from " + fOldSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel) + " to " + newSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel - _amount))
          endif
          if (fXPToLose > 0)
            if (CurrentXP < fXPToLose)
              fXPToLose = CurrentXP
            endif
            CurrentXP = CurrentXP - fXPToLose
          endif
          if ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK
            Bool bLevelReduced = False
            Game.SetPlayerExperience(CurrentXP)
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP changed to " + (CurrentXP))
            if iLevelToLose > 0
              Game.SetPlayerLevel(currentLevel - iLevelToLose)
              bLevelReduced = True
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You have lost " + iLevelToLose + " level(s)")
            endif
            if iLevelToLose > 0 && bLevelReduced
              ReducePerk((iLevelToLose * moaPerkPerLevel.GetValue()) As Int)
              ReduceHMS(iLevelToLose)
            endif
          else
            if !fPrevSkillLevel[iIndex]
              fPrevSkillLevel[iIndex] = currentSkillLevel
            endif
            iLostSkills[iIndex] = iLostSkills[iIndex] + _amount
            if !fPrevSkillXP[iIndex]
              fPrevSkillXP[iIndex] = fOldSkillXP
            endif
          endif
          PlayerRef.SetActorValue(Skill, PlayerRef.GetBaseActorValue(Skill) - _amount)
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + " reduced by " + _amount + " to " + PlayerRef.GetBaseActorValue(Skill))
          return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
        endif
      endif
    endif
  endif
  return fGetLevelArray(CurrentLevel - iLevelToLose, CurrentXP)
endfunction

function ReduceSkillXP(String Skill)
  Int iIndex = sSkillName.Find(Skill)
  if iIndex > -1
    ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(Skill)
    skillInfo.SetSkillExperience(0.0)
  endif
endfunction

function ReduceSkills(String Skill="Random", Int Percent=-1, Int MinAmount=1, Int MaxAmount=1, Bool bOnlyXP=False)
  Float[] fSkillUseMult
  Int i
  if bSkillReduced()
    if !bOnlyXP && (ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Can't lose skills forever when they are already reduced")
      return
    else
      fSkillUseMult = new Float[18]
      i = fPrevSkillUseMult.Length
      while i > 0
        i -= 1
        fSkillUseMult[i] = fPrevSkillUseMult[i]
        EnableXP(i)
      endwhile
    endif
  endif
  Int CurrentLevel = PlayerRef.GetLevel()
  Float CurrentXP = Game.GetPlayerExperience()
  Float[] Result = new Float[2]
  if ConfigMenu.bIsLoggingEnabled
    if !bOnlyXP
      Debug.Trace("MarkOfArkay: Reducing skill...")
    else
      Debug.Trace("MarkOfArkay: Reducing skill xp...")
    endif
  endif
  Int _amount
  Int Min = 0
  Int Max = 0
  Int minIndex = -1
  Int maxIndex = -1
  Int skillLevel = 0
  SkillsFlags = new Bool[18]
  Bool bBreak = False
  i = sSkillName.Length
  while i > 0
    i -= 1
    skillLevel = PlayerRef.GetBaseActorValue(sSkillName[i]) As Int
    if (bOnlyXP && skillLevel > 0) || (!bOnlyXP && skillLevel > 1 && ((ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK) || (iSkillCap[i] <= 0 || skillLevel < iSkillCap[i])))
      SkillsFlags[i] = True
      if Skill == "Highest"
        if skillLevel > Max || (skillLevel == Max && Utility.RandomInt(0, 1))
          Max = skillLevel
          maxIndex = i
        endif
      elseif Skill == "Highest_All"
        if skillLevel > Max
          Max = skillLevel
        endif
      elseif Skill == "Lowest"
        if !Min || (skillLevel < Min || (skillLevel == Min && Utility.RandomInt(0, 1)))
          Min = skillLevel
          minIndex = i
        endif
      elseif Skill == "Lowest_All"
        if !Min || skillLevel < Min
          Min = skillLevel
        endif
      endif
    else
      SkillsFlags[i] = False
    endif
  endwhile
  if Skill && (Skill != "Random")
    if Skill == "Highest" && maxIndex > -1
      if bOnlyXP
        reduceSkillXP(sSkillName[maxIndex])
      else
        ReduceSkill(sSkillName[maxIndex], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
      endif
    elseif Skill == "Lowest" && minIndex > -1
      if bOnlyXP
        reduceSkillXP(sSkillName[minIndex])
      else
        ReduceSkill(sSkillName[minIndex], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
      endif
    elseif (Skill == "All_Random") || (Max && Skill == "Highest_All") || (Min && Skill == "Lowest_All")
      i = 0
      Int len = SkillIndex.length
      while i < len && !bBreak
        if i < len - 1
          Int j = Utility.RandomInt(i + 1, len - 1)
          Int t = SkillIndex[i]
          SkillIndex[i] = SkillIndex[j]
          SkillIndex[j] = t
        endif
        if Skill == "Highest_All"
          if ((PlayerRef.GetBaseActorValue(sSkillName[SkillIndex[i]]) As Int) == Max)
            if bOnlyXP
              reduceSkillXP(sSkillName[SkillIndex[i]])
            else
              Result = ReduceSkill(sSkillName[SkillIndex[i]], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
              CurrentLevel = Result[0] As Int
              CurrentXP = Result[1]
            endif
          endif
        elseif Skill == "Lowest_All"
          if ((PlayerRef.GetBaseActorValue(sSkillName[SkillIndex[i]]) As Int) == Min)
            if bOnlyXP
              reduceSkillXP(sSkillName[SkillIndex[i]])
            else
              Result = ReduceSkill(sSkillName[SkillIndex[i]], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
              CurrentLevel = Result[0] As Int
              CurrentXP = Result[1]
            endif
          endif
        elseif SkillsFlags[SkillIndex[i]]
          if bOnlyXP
            reduceSkillXP(sSkillName[SkillIndex[i]])
          else
            Result = ReduceSkill(sSkillName[SkillIndex[i]], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
            CurrentLevel = Result[0] As Int
            CurrentXP = Result[1]
          endif
        endif
        if CurrentLevel <= 1 && CurrentXP <= 0.0
          bBreak = True
        endif
        i += 1
      endwhile
    elseif (Skill == "All_High" || Skill == "All_Low")
      i = sSkillName.length
      int j
      Int iIndex
      while i > 0 && !bBreak
        i -= 1
        j = sSkillName.length
        iIndex = -1
        while j > 0
          j -= 1
          if SkillsFlags[j] && (iIndex < 0 || (Skill == "All_High" && PlayerRef.GetBaseActorValue(sSkillName[j]) < PlayerRef.GetBaseActorValue(sSkillName[iIndex])) || (Skill == "All_Low" && PlayerRef.GetBaseActorValue(sSkillName[j]) > PlayerRef.GetBaseActorValue(sSkillName[iIndex])))
            iIndex = j
          endif
        endwhile
        if iIndex > -1
          if bOnlyXP
            reduceSkillXP(sSkillName[iIndex])
          else
            Result = ReduceSkill(sSkillName[iIndex], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
            CurrentLevel = Result[0] As Int
            CurrentXP = Result[1]
            SkillsFlags[iIndex] = False
            if CurrentLevel <= 1 && CurrentXP <= 0.0
              bBreak = True
            endif
          endif
        else
          bBreak = True
        endif
      endwhile
    elseif (Skill == "All_One_By_One")
      Int[] iNum = new Int[18]
      Int len = iNum.Length
      i = len
      while i > 0
        i -= 1
        if SkillsFlags[i]
          Int iCurrent = PlayerRef.GetBaseActorValue(sSkillName[i]) As Int
          Int num = 0
          if bOnlyXP
            num = 1
          else
            if Percent > 0
              if iCurrent > 0
                num = imax(1, ((Percent * (iCurrent - 1)) / 100) As Int)
              endif
            else
              num = randIntFromlimitedRange(MinAmount, MaxAmount, iCurrent, 0, iCurrent - 1)
            endif
          endif
          iNum[i] = num
        else
          iNum[i] = 0
        endif
      endwhile
      Bool bBreak1 = False
      while !bBreak && !bBreak1
        i = 0
        bBreak = True
        while i < len && !bBreak1
          if SkillsFlags[SkillIndex[i]]
            if i < len - 1
              Int j = RandomIntWithShuffledExclusionArray(i + 1, len - 1, SkillsFlags, SkillIndex)
              if j > -1
                Int t = SkillIndex[i]
                SkillIndex[i] = SkillIndex[j]
                SkillIndex[j] = t
              endif
            endif
            if iNum[SkillIndex[i]] && !bBreak1
              if bOnlyXP
                reduceSkillXP(sSkillName[SkillIndex[i]])
                iNum[SkillIndex[i]] = 0
              else
                Result = ReduceSkill(sSkillName[SkillIndex[i]], -1, 1, 1, CurrentLevel, CurrentXP)
                CurrentLevel = Result[0] As Int
                CurrentXP = Result[1]

                ;Debug.Trace("lvl:" + CurrentLevel+","+CurrentXP)
                iNum[SkillIndex[i]] = iNum[SkillIndex[i]] - 1
                if CurrentLevel <= 1 && CurrentXP <= 0.0
                  bBreak = True
                  bBreak1 = True
                else
                  bBreak = False
                endif
              endif
            endif
          endif
          i += 1
        endwhile
      endwhile
    else
      i = sSkillName.Find(Skill)
      if (i > -1) && SkillsFlags[i]
        if bOnlyXP
          reduceSkillXP(Skill)
        else
          ReduceSkill(Skill, Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
        endif
      endif
    endif
  else
    i = RandomIntWithExclusionArray(0, sSkillName.Length - 1, SkillsFlags)
    if i > -1
      if bOnlyXP
        reduceSkillXP(sSkillName[i])
      else
        ReduceSkill(sSkillName[i], Percent, MinAmount, MaxAmount, CurrentLevel, CurrentXP)
      endif
    endif
  endif
  if fSkillUseMult.Length == 18
    i = 18
    while i > 0
      i -= 1
      fPrevSkillUseMult[i] = fSkillUseMult[i]
      DisableXP(i)
    endwhile
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reducing skill/skill xp finished.")
endfunction

function RestoreSkills()
  if PlayerRef.HasSpell(Dumbness)
    PlayerRef.RemoveSpell(Dumbness)
  endif
  Int i = iLostSkills.Length
  ActorValueInfo skillInfo
  float newSkillXP = 0.0
  while i > 0
    i -= 1
    if iLostSkills[i] > 0
      skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[i])
      float currentSkillLevel = skillInfo.GetBaseValue(playerRef)
      float fNewSkillLevel = currentSkillLevel + iLostSkills[i]
      if iSkillCap[i] > 0 && fNewSkillLevel > iSkillCap[i]
        fNewSkillLevel = iSkillCap[i]
      endif
      if currentSkillLevel == (fPrevSkillLevel[i] - iLostSkills[i])
        float prevskillprogress = fPrevSkillXP[i] / skillInfo.GetExperienceForLevel(fPrevSkillLevel[i] As Int)
        float curskillprogress = skillInfo.GetSkillExperience() / skillInfo.GetExperienceForLevel(currentSkillLevel As Int)
        newSkillXP = (prevskillprogress * skillInfo.GetExperienceForLevel((currentSkillLevel + iLostSkills[i]) as int))
        if curskillprogress > prevskillprogress
          newSkillXP += ((curskillprogress - prevskillprogress) * skillInfo.GetExperienceForLevel(currentSkillLevel As Int))
        endif
        skillInfo.SetSkillExperience(newSkillXP)
      else
        newSkillXP = fPrevSkillXP[i]
        float fReducedSkillLevel = (fPrevSkillLevel[i] As Int) - iLostSkills[i]
        Int j = fReducedSkillLevel As Int
        while (j + 1) < currentSkillLevel As Int
          j += 1
          newSkillXP += skillInfo.GetExperienceForLevel(j)
        endwhile
        newSkillXP += (skillInfo.GetSkillExperience() - skillInfo.GetExperienceForLevel((currentSkillLevel as int) - 1))
        skillInfo.SetSkillExperience(newSkillXP)
      endif
      PlayerRef.SetActorValue(sSkillName[i], fNewSkillLevel)
      fPrevSkillXP[i] = 0.0
      iLostSkills[i] = 0
    endif
    EnableXP(i)
  endwhile
endfunction

function SetVars()
  if sSkillName.Length != 18
    sSkillName = new String[18]
    sSkillName[0] = "Alchemy"
    sSkillName[1] = "Alteration"
    sSkillName[2] = "Block"
    sSkillName[3] = "Conjuration"
    sSkillName[4] = "Destruction"
    sSkillName[5] = "Enchanting"
    sSkillName[6] = "HeavyArmor"
    sSkillName[7] = "Illusion"
    sSkillName[8] = "LightArmor"
    sSkillName[9] = "Lockpicking"
    sSkillName[10] = "Marksman"
    sSkillName[11] = "OneHanded"
    sSkillName[12] = "Pickpocket"
    sSkillName[13] = "Restoration"
    sSkillName[14] = "Smithing"
    sSkillName[15] = "Sneak"
    sSkillName[16] = "Speechcraft"
    sSkillName[17] = "TwoHanded"
  endif
  if iSkillCap.Length != 18
    iSkillCap = new Int[18]
  endif
  iSkillCap[0] = moaAlchemyCap.GetValueInt()
  iSkillCap[1] = moaAlterationCap.GetValueInt()
  iSkillCap[2] = moaBlockCap.GetValueInt()
  iSkillCap[3] = moaConjurationCap.GetValueInt()
  iSkillCap[4] = moaDestructionCap.GetValueInt()
  iSkillCap[5] = moaEnchantingCap.GetValueInt()
  iSkillCap[6] = moaHeavyArmorCap.GetValueInt()
  iSkillCap[7] = moaIllusionCap.GetValueInt()
  iSkillCap[8] = moaLightArmorCap.GetValueInt()
  iSkillCap[9] = moaLockpickingCap.GetValueInt()
  iSkillCap[10] = moaMarksmanCap.GetValueInt()
  iSkillCap[11] = moaOneHandedCap.GetValueInt()
  iSkillCap[12] = moaPickpocketCap.GetValueInt()
  iSkillCap[13] = moaRestorationCap.GetValueInt()
  iSkillCap[14] = moaSmithingCap.GetValueInt()
  iSkillCap[15] = moaSneakCap.GetValueInt()
  iSkillCap[16] = moaSpeechcraftCap.GetValueInt()
  iSkillCap[17] = moaTwoHandedCap.GetValueInt()
  if sAttName.Length != 3
    sAttName = new String[3]
    sAttName[0] = "Health"
    sAttName[1] = "Magicka"
    sAttName[2] = "Stamina"
  endif
  if iAttBase.Length != 3
    iAttBase = new Int[3]
    iAttBase[0] = (Game.GetGameSettingFloat("fDefaultHealth") + 50) as int
    iAttBase[1] = (Game.GetGameSettingFloat("fDefaultMagicka") + 50) as int
    iAttBase[2] = (Game.GetGameSettingFloat("fDefaultStamina") + 50) as int
  endif
  if (SkillIndex.Length != 18)
    SkillIndex = new Int[18]
    Int i = 0
    while i < SkillIndex.Length
      SkillIndex[i] = i
      i += 1
    endwhile
  endif
  if iLostSkills.Length != 18
    iLostSkills = new Int[18]
  endif
  if fPrevSkillLevel.Length != 18
    fPrevSkillLevel = new Float[18]
  endif
  if fPrevSkillXP.Length != 18
    fPrevSkillXP = new Float[18]
  endif
  if fPrevSkillUseMult.Length != 18
    fPrevSkillUseMult = new Float[18]
  endif
endfunction

Bool function bSkillReduced()
  Int i = iLostSkills.Length
  while i > 0
    i -= 1
    if iLostSkills[i] > 0
      return True
    endif
  endwhile
  return False
endfunction

Float[] function fGetLevelArray(Float CurrentLevel, Float CurrentXP)
  Float[] Result = new Float[2]
  Result[0] = CurrentLevel
  Result[1] = CurrentXP
  return Result
endfunction

Int function iGetReducedSkillsCount(Bool bCountPoints=True)
  Int i = iLostSkills.Length
  Int Count = 0
  while i > 0
    i -= 1
    if iLostSkills[i] > 0
      if bCountPoints
        Count += iLostSkills[i]
      else
        Count += 1
      endif
    endif
  endwhile
  return Count
endfunction
