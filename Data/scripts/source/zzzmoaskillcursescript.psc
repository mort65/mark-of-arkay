Scriptname zzzmoaskillcursescript extends Quest

Import zzzmoautilscript
Int[] Property iLostSkills Auto Hidden
Float[] Property fPrevSkillLevel Auto Hidden
Float[] Property fPrevSkillXP Auto Hidden
String[] Property sSkillName Auto Hidden
Int[] Property iSkillCap Auto Hidden
Float[] Property fPrevSkillUseMult Auto Hidden
String[] Property sAttName Auto Hidden
Int Property PerkPointDebt = 0 Auto Hidden
Int[] Property iAttBase Auto Hidden
Int[] Property SkillIndex Auto Hidden
Bool[] Property SkillsFlags Auto Hidden
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
Actor Property PlayerRef Auto
Spell Property Dumbness Auto
GlobalVariable Property moaAlchemyCap Auto
GlobalVariable Property moaAlterationCap Auto
GlobalVariable Property moaBlockCap Auto
GlobalVariable Property moaConjurationCap Auto
GlobalVariable Property moaDestructionCap Auto
GlobalVariable Property moaEnchantingCap Auto
GlobalVariable Property moaHeavyArmorCap Auto
GlobalVariable Property moaIllusionCap Auto
GlobalVariable Property moaLightArmorCap Auto
GlobalVariable Property moaLockpickingCap Auto
GlobalVariable Property moaMarksmanCap Auto
GlobalVariable Property moaOneHandedCap Auto
GlobalVariable Property moaPickpocketCap Auto
GlobalVariable Property moaRestorationCap Auto
GlobalVariable Property moaSmithingCap Auto
GlobalVariable Property moaSneakCap Auto
GlobalVariable Property moaSpeechcraftCap Auto
GlobalVariable Property moaTwoHandedCap Auto
GlobalVariable Property moaReduceHMS Auto
GlobalVariable Property moaReduceCarryWeight Auto
GlobalVariable Property moaPerkPerLevel Auto

Event OnInit()
	SetVars()
EndEvent

Function SetVars()
	If sSkillName.Length != 18
		sSkillName = New String[18]
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
	EndIf
	If iSkillCap.Length != 18
		iSkillCap = New Int[18]
	EndIf
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
	If sAttName.Length != 3
		sAttName = New String[3]
		sAttName[0] = "Health"
		sAttName[1] = "Magicka"
		sAttName[2] = "Stamina"
	EndIf
	If iAttBase.Length != 3
		iAttBase = New Int[3]
		iAttBase[0] = (Game.GetGameSettingFloat("fDefaultHealth") + 50) as int
		iAttBase[1] = (Game.GetGameSettingFloat("fDefaultMagicka") + 50) as int
		iAttBase[2] = (Game.GetGameSettingFloat("fDefaultStamina") + 50) as int
	EndIf
	If (SkillIndex.Length != 18)
		SkillIndex = New Int[18]
		Int i = 0
		While i < SkillIndex.Length
			SkillIndex[i] = i
			i += 1
		Endwhile
	EndIf
	If iLostSkills.Length != 18
		iLostSkills = New Int[18]
	EndIf
	If fPrevSkillLevel.Length != 18
		fPrevSkillLevel = New Float[18]
	EndIf
	If fPrevSkillXP.Length != 18
		fPrevSkillXP = New Float[18]
	EndIf
	If fPrevSkillUseMult.Length != 18
		fPrevSkillUseMult = New Float[18]
	EndIf
EndFunction

Function ReduceSkills(String Skill = "Random",Int Percent = -1, Int  MinAmount = 1, Int MaxAmount = 1, Bool bOnlyXP = False)
	Float[] fSkillUseMult
	Int i
	If bSkillReduced()
		If !bOnlyXP && (ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Can't lose skills forever when they are already reduced")
			Return
		Else
			fSkillUseMult = new Float[18]
			i = fPrevSkillUseMult.Length
			While i > 0
				i -= 1
				fSkillUseMult[i] = fPrevSkillUseMult[i]
				EnableXP(i)
			EndWhile
		EndIf
	EndIf
	Int CurrentLevel = PlayerRef.GetLevel()
	Float CurrentXP = Game.GetPlayerExperience()
	Float[] Result = New Float[2]
	If ConfigMenu.bIsLoggingEnabled
		If !bOnlyXP
			Debug.Trace("MarkOfArkay: Reducing skill...")
		Else
			Debug.Trace("MarkOfArkay: Reducing skill xp...")
		EndIf
	EndIf
	Int _amount
	Int Min = 0
	Int Max = 0
	Int minIndex = -1
	Int maxIndex = -1
	Int skillLevel = 0
	SkillsFlags = New Bool[18]
	Bool bBreak = False
	i = sSkillName.Length
	While i > 0
		i -= 1
		skillLevel = PlayerRef.GetBaseActorValue(sSkillName[i]) As Int
		If  (bOnlyXP && skillLevel > 0) || (!bOnlyXP && skillLevel > 1 && ((ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK) || (iSkillCap[i] <= 0 || skillLevel < iSkillCap[i])))
			SkillsFlags[i] = True
			If Skill == "Highest"
				If skillLevel > Max || (skillLevel == Max && Utility.RandomInt(0,1))
					Max = skillLevel
					maxIndex = i
				EndIf
			ElseIf Skill == "Highest_All"
				If skillLevel > Max
					Max = skillLevel
				EndIf
			ElseIf Skill == "Lowest"
				If !Min || (skillLevel < Min || (skillLevel == Min && Utility.RandomInt(0,1)))
					Min = skillLevel
					minIndex = i
				EndIf
			ElseIf Skill == "Lowest_All"
				If !Min || skillLevel < Min
					Min = skillLevel
				EndIf
			EndIf
		Else
			SkillsFlags[i] = False
		EndIf
	Endwhile
	If Skill && (Skill != "Random")
		If Skill == "Highest" && maxIndex > -1
			If bOnlyXP
				reduceSkillXP(sSkillName[maxIndex])
			Else
				ReduceSkill(sSkillName[maxIndex],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
			EndIf
		ElseIf Skill == "Lowest" && minIndex > -1
			If bOnlyXP
				reduceSkillXP(sSkillName[minIndex])
			Else
				ReduceSkill(sSkillName[minIndex],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
			EndIf
		ElseIf (Skill == "All_Random") || (Max && Skill == "Highest_All") || (Min && Skill == "Lowest_All")
			i = 0
			Int len = SkillIndex.length
			While i < len && !bBreak
				If  i < len - 1
					Int j = Utility.RandomInt(i + 1, len - 1)
					Int t = SkillIndex[i]
					SkillIndex[i] = SkillIndex[j]
					SkillIndex[j] = t
				EndIf
				If Skill == "Highest_All"
					If ((PlayerRef.GetBaseActorValue(sSkillName[SkillIndex[i]]) As Int) == Max)
						If bOnlyXP
							reduceSkillXP(sSkillName[SkillIndex[i]])
						Else
							Result = ReduceSkill(sSkillName[SkillIndex[i]],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
							CurrentLevel = Result[0] As Int
							CurrentXP = Result[1]
						EndIf
					EndIf
				ElseIf Skill == "Lowest_All"
					If ((PlayerRef.GetBaseActorValue(sSkillName[SkillIndex[i]]) As Int) == Min)
						If bOnlyXP
							reduceSkillXP(sSkillName[SkillIndex[i]])
						Else
							Result = ReduceSkill(sSkillName[SkillIndex[i]],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
							CurrentLevel = Result[0] As Int
							CurrentXP = Result[1]
						EndIf
					EndIf
				ElseIf SkillsFlags[SkillIndex[i]]
					If bOnlyXP
						reduceSkillXP(sSkillName[SkillIndex[i]])
					Else
						Result = ReduceSkill(sSkillName[SkillIndex[i]],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
						CurrentLevel = Result[0] As Int
						CurrentXP = Result[1]
					EndIf
				EndIf
				If CurrentLevel <= 1 && CurrentXP <= 0.0
					bBreak = True
				EndIf
				i += 1
			Endwhile
		ElseIf (Skill == "All_High" || Skill == "All_Low")
			i = sSkillName.length
			int j
			Int iIndex
			While i > 0 && !bBreak
				i -= 1
				j = sSkillName.length
				iIndex = -1
				While j > 0
					j -= 1
					If SkillsFlags[j] && (iIndex < 0 || \
					(Skill == "All_High" && PlayerRef.GetBaseActorValue(sSkillName[j]) < PlayerRef.GetBaseActorValue(sSkillName[iIndex])) || \
					(Skill == "All_Low" && PlayerRef.GetBaseActorValue(sSkillName[j]) > PlayerRef.GetBaseActorValue(sSkillName[iIndex])))
						iIndex = j
					EndIf
				Endwhile
				If iIndex > -1
					If bOnlyXP
						reduceSkillXP(sSkillName[iIndex])
					Else
						Result = ReduceSkill(sSkillName[iIndex],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
						CurrentLevel = Result[0] As Int
						CurrentXP = Result[1]
						SkillsFlags[iIndex] = False
						If CurrentLevel <= 1 && CurrentXP <= 0.0
							bBreak = True
						EndIf
					EndIf
				Else
					bBreak = True
				EndIf
			Endwhile
		ElseIf (Skill == "All_One_By_One")
			Int[] iNum = New Int[18]
			Int len = iNum.Length
			i = len
			While i > 0
				i -= 1
				If SkillsFlags[i] 
					Int iCurrent = PlayerRef.GetBaseActorValue(sSkillName[i]) As Int
					Int num = 0
					If bOnlyXP
						num = 1
					Else
						If Percent > 0
							If iCurrent > 0
								num = imax(1,(( Percent * (iCurrent- 1 )) / 100 ) As Int)
							EndIf
						Else
							num = randIntFromlimitedRange(MinAmount,MaxAmount,iCurrent,0,iCurrent - 1)
						EndIf
					EndIf
					iNum[i] = num
				Else
					iNum[i] = 0
				EndIf
			EndWhile
			Bool bBreak1 = False
			While !bBreak && !bBreak1
				i = 0
				bBreak = True
				While i < len && !bBreak1
					If SkillsFlags[SkillIndex[i]]
						If  i < len - 1
							Int j = RandomIntWithShuffledExclusionArray( i + 1, len - 1, SkillsFlags,SkillIndex)
							If j > -1
								Int t = SkillIndex[i]
								SkillIndex[i] = SkillIndex[j]
								SkillIndex[j] = t
							EndIf
						EndIf
						If iNum[SkillIndex[i]] && !bBreak1
							If bOnlyXP
								reduceSkillXP(sSkillName[SkillIndex[i]])
								iNum[SkillIndex[i]] = 0
							Else
								Result = ReduceSkill(sSkillName[SkillIndex[i]],-1,1,1,CurrentLevel,CurrentXP)
								CurrentLevel = Result[0] As Int
								CurrentXP = Result[1]
								;Debug.Trace("lvl:" + CurrentLevel+","+CurrentXP)
								iNum[SkillIndex[i]] = iNum[SkillIndex[i]] - 1
								If CurrentLevel <= 1 && CurrentXP <= 0.0
									bBreak = True
									bBreak1 = True
								Else
									bBreak = False
								EndIf
							EndIf
						EndIf
					EndIf
					i += 1		
				EndWhile
			EndWhile
		Else
			i = sSkillName.Find(Skill)
			If (i > -1) && SkillsFlags[i]
				If bOnlyXP
					reduceSkillXP(Skill)
				Else
					ReduceSkill(Skill,Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
				EndIf
			EndIf
		EndIf
	Else
		i = RandomIntWithExclusionArray(0,sSkillName.Length - 1, SkillsFlags)
		If i > -1
			If bOnlyXP
				reduceSkillXP(sSkillName[i])
			Else
				ReduceSkill(sSkillName[i],Percent,MinAmount,MaxAmount,CurrentLevel,CurrentXP)
			EndIf
		EndIf
	EndIf
	If fSkillUseMult.Length == 18
		i = 18
		While i > 0
			i -= 1
			fPrevSkillUseMult[i] = fSkillUseMult[i]
			DisableXP(i)		
		EndWhile
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reducing skill/skill xp finished.")
EndFunction

Function ReduceSkillXP(String Skill)
	Int iIndex = sSkillName.Find(Skill)
	If iIndex > -1
		ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(Skill)
		skillInfo.SetSkillExperience(0.0)
	EndIf
EndFunction

Float[] Function ReduceSkill(String Skill ,Int Percent = -1, Int  MinAmount = 1, Int MaxAmount = 1, Int CurrentLevel, Float CurrentXP)
		;Reduce Skill level and skill's xp.
		;If bLoseSkillForever and bLevelReduce is on, 
		;then reduce player level and player level's xp
		Int _amount = 0
		Int iLevelToLose = 0
		Int currentSkillLevel = PlayerRef.GetBaseActorValue(Skill) As Int
		If (Percent <= 0) && (MinAmount <= 0) && (MaxAmount <= 0)
			Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
		EndIf
		If Percent > 0
			If currentSkillLevel > 0
				_amount = imax(1,(( Percent * ( currentSkillLevel - 1 )) / 100 ) As Int)
			EndIf
		Else
			_amount = randIntFromlimitedRange(MinAmount,MaxAmount,currentSkillLevel,0,currentSkillLevel - 1)
		EndIf
		If _amount > 0
			Int iIndex = sSkillName.Find(Skill)
			If iIndex > -1
				ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(Skill)
				float fXPPerSkillRank = Game.GetGameSettingFloat("fXPPerSkillRank")
				float fXPToLose = currentSkillLevel * fXPPerSkillRank
				float fOldSkillXP = skillInfo.GetSkillExperience()
				float fSkillProgress = fOldSkillXP / skillInfo.GetExperienceForLevel(currentSkillLevel)
				If _amount >= currentSkillLevel
					_amount = currentSkillLevel - 1
				EndIf
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: CurrentXP/ExperienceForLevel(" + currentLevel + ") = " + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel))
				If _amount < 1
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose 0 skill level")
					Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
				ElseIf fSkillProgress > 1.0
					SkillsFlags[sSkillName.Find(Skill)] = False
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + "'s XP is invalid (" + fOldSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel) + ")")
					Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
				ElseIf ((!CurrentXP && currentLevel < 2) || CurrentXP >= Game.GetExperienceForLevel(currentLevel))
					SkillsFlags[sSkillName.Find(Skill)] = False
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP is invalid  (" + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel) + ")" )
					Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
				ElseIf (CurrentXP < fXPToLose && (CurrentLevel < 2 || !ConfigMenu.bLevelReduce))
					SkillsFlags[sSkillName.Find(Skill)] = False
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose " + Skill + " skill level without losing a level")
					Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
				Else
					Int i = 0
					Bool bBreak = False
					While !bBreak && i < _amount
						if (CurrentXP - fXPToLose) < 0
							If ConfigMenu.bLevelReduce
								If (currentLevel - (iLevelToLose + 1)) > 0
									iLevelToLose += 1
									CurrentXP = Game.GetExperienceForLevel(currentLevel - iLevelToLose) - (fXPToLose - CurrentXP)
									If CurrentXP < 0.0
										float fPrevXP = CurrentXP
										Int iPrevLevelToLose = iLevelToLose
										While CurrentXP < 0.0 && (currentLevel - (iLevelToLose + 1)) > 0
											iLevelToLose += 1
											CurrentXP = Game.GetExperienceForLevel(currentLevel - iLevelToLose) + CurrentXP
										EndWhile
										If (currentLevel - (iLevelToLose + 1)) <= 0 ||  CurrentXP < 0.0
											CurrentXP = fPrevXP
											iLevelToLose = iPrevLevelToLose
											fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
											SkillsFlags[sSkillName.Find(Skill)] = False
											bBreak = True
											ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP is invalid  (" + CurrentXP + "/" + Game.GetExperienceForLevel(currentLevel) + ")" )
										EndIf
									Else
										i += 1
										fXPToLose = ((currentSkillLevel - i) * fXPPerSkillRank)	
									EndIf
								Else
									fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
									SkillsFlags[sSkillName.Find(Skill)] = False
									bBreak = True
									ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose more than " + iLevelToLose + " level(s)")
								EndIf
							Else
								fXPToLose -= ((currentSkillLevel - i) * fXPPerSkillRank)
								SkillsFlags[sSkillName.Find(Skill)] = False
								bBreak = True
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You can't lose more than " + i + " point(s) in "+ Skill + " skill without losing a level")
							EndIf
						Else
							i += 1
							fXPToLose += ((currentSkillLevel - i) * fXPPerSkillRank)
						EndIf
					Endwhile
					_amount = i
					If _amount > 0
						If fOldSkillXP > 0.0
							float newSkillXP = fSkillProgress * skillInfo.GetExperienceForLevel((currentSkillLevel - _amount) as int)
							skillInfo.SetSkillExperience(newSkillXP)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + "'s XP changed from " + \
							fOldSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel) + " to " + \
							newSkillXP + "/" + skillInfo.GetExperienceForLevel(currentSkillLevel - _amount))
						EndIf
						If (fXPToLose > 0)
							If (CurrentXP < fXPToLose) 
								fXPToLose = CurrentXP
							EndIf
							CurrentXP = CurrentXP - fXPToLose
						EndIf
						If ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK
							Bool bLevelReduced = False
							Game.SetPlayerExperience(CurrentXP)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player's XP changed to " + (CurrentXP))
							If iLevelToLose > 0
								Game.SetPlayerLevel(currentLevel - iLevelToLose)
								bLevelReduced = True
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You have lost " + iLevelToLose + " level(s)")
							EndIf
							If iLevelToLose > 0 && bLevelReduced
								ReducePerk((iLevelToLose * moaPerkPerLevel.GetValue()) As Int)
								ReduceHMS(iLevelToLose)
							EndIf
						Else
							If !fPrevSkillLevel[iIndex]
								fPrevSkillLevel[iIndex] = currentSkillLevel
							EndIf
							iLostSkills[iIndex] = iLostSkills[iIndex] + _amount
							If !fPrevSkillXP[iIndex]
								fPrevSkillXP[iIndex] = fOldSkillXP
							EndIf
						EndIf
						PlayerRef.SetActorValue(Skill, PlayerRef.GetBaseActorValue(Skill) - _amount)
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Skill + " reduced by " + _amount + " to " + PlayerRef.GetBaseActorValue(Skill))
						Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
					EndIf					
				EndIf	
			EndIf
		EndIf
		Return fGetLevelArray(CurrentLevel - iLevelToLose,CurrentXP)
EndFunction

Float[] Function fGetLevelArray(Float CurrentLevel,Float CurrentXP)
	Float[] Result = New Float[2]
	Result[0] = CurrentLevel
	Result[1] = CurrentXP
	Return Result
EndFunction

Function ReduceHMS(Int iLevelToLose = 1)
	If !moaReduceHMS.GetValue()
		Return
	EndIf
	While iLevelToLose > 0
		Float[] fHMSWeights = New Float[3]
		Int iAttrIncrement = Game.GetGameSettingInt("iAVDhmsLevelUp")
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Att Increment = " + iAttrIncrement)
		
		; Set weights
		Int i = 0
		Float fTotalWeight = 0
		While i < fHMSWeights.Length
			Float fWeight = (PlayerRef.GetBaseActorValue(sAttName[i]) - iAttBase[i]) / iAttrIncrement
			If fWeight < 0
				fWeight = 0
			EndIf
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + sAttName[i] + " has base " + iAttBase[i])
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + sAttName[i] + " has weight " + fWeight)
			fTotalWeight += fWeight
			fHMSWeights[i] = fTotalWeight
			i += 1
		EndWhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Total weight = " + fTotalWeight)
		If fTotalWeight < 1
			Return
		EndIf
		int r = Utility.RandomInt(1, fTotalWeight as Int)
		int iAttToLose = -1
		i = 0
		While (i < fHMSWeights.Length) && (iAttToLose < 0)
			If r <= fHMSWeights[i]
				iAttToLose = i
			EndIf
			i += 1
		Endwhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rolled " + r)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Losing " + sAttName[iAttToLose])
		
		PlayerRef.SetActorValue(sAttName[iAttToLose], PlayerRef.GetBaseActorValue(sAttName[iAttToLose]) - iAttrIncrement)
		If moaReduceCarryWeight.GetValue() && sAttName[iAttToLose] == "Stamina"
			Float fNewCarryWeight = PlayerRef.GetBaseActorValue("CarryWeight") - Game.GetGameSettingFloat("fLevelUpCarryWeightMod")
			If fNewCarryWeight > 0.0
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Also losing CarryWeight")
				PlayerRef.SetActorValue("CarryWeight", fNewCarryWeight)
			EndIf
		EndIf
		iLevelToLose -= 1
	EndWhile
EndFunction

Function ReducePerk(Int iPerkPointsToLose = 1)
	If iPerkPointsToLose <= 0
		Return
	EndIf
	If Game.GetPerkPoints() > 0
		If iPerkPointsToLose > Game.GetPerkPoints()
			PerkPointDebt += (iPerkPointsToLose - Game.GetPerkPoints())
			iPerkPointsToLose = Game.GetPerkPoints()
		EndIf
		Game.ModPerkPoints(-iPerkPointsToLose)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Perk points decreased from " + \
		(Game.GetPerkPoints() + iPerkPointsToLose) + \
		" to " + Game.GetPerkPoints())
	Else
		PerkPointDebt += iPerkPointsToLose
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Perk point dept increased from " + \
		(PerkPointDebt - iPerkPointsToLose) + \
		" to " + PerkPointDebt)
	EndIf
EndFunction

Bool Function bSkillReduced()
	Int i = iLostSkills.Length
	While i > 0
		i -= 1
		If iLostSkills[i] > 0
			Return True
		EndIf
	Endwhile
	Return False
EndFunction

Int Function iGetReducedSkillsCount(Bool bCountPoints = True)
	Int i = iLostSkills.Length
	Int Count = 0
	While i > 0
		i -= 1
		If iLostSkills[i] > 0
			If bCountPoints
				Count += iLostSkills[i]
			Else
				Count +=1
			EndIf
		EndIf
	Endwhile
	Return Count
EndFunction

Function RestoreSkills()
	If PlayerRef.HasSpell(Dumbness)
		PlayerRef.RemoveSpell(Dumbness)
	EndIf
	Int i = iLostSkills.Length
	ActorValueInfo skillInfo
	float newSkillXP = 0.0
	While i > 0
		i -= 1
		If iLostSkills[i] > 0
			skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[i])
			float currentSkillLevel = skillInfo.GetBaseValue(playerRef)
			float fNewSkillLevel = currentSkillLevel + iLostSkills[i]
			If iSkillCap[i] > 0 && fNewSkillLevel > iSkillCap[i]
				fNewSkillLevel = iSkillCap[i]
			EndIf
			If currentSkillLevel == (fPrevSkillLevel[i] - iLostSkills[i])
				float prevskillprogress = fPrevSkillXP[i] / skillInfo.GetExperienceForLevel(fPrevSkillLevel[i] As Int)
				float curskillprogress = skillInfo.GetSkillExperience() / skillInfo.GetExperienceForLevel(currentSkillLevel As Int)
				newSkillXP = (prevskillprogress * skillInfo.GetExperienceForLevel((currentSkillLevel + iLostSkills[i]) as int))
				if curskillprogress > prevskillprogress
					newSkillXP += ((curskillprogress - prevskillprogress) * skillInfo.GetExperienceForLevel(currentSkillLevel As Int))
				EndIf
				skillInfo.SetSkillExperience(newSkillXP)
			Else
				newSkillXP = fPrevSkillXP[i]
				float fReducedSkillLevel = (fPrevSkillLevel[i] As Int) - iLostSkills[i]
				Int j = fReducedSkillLevel As Int
				while (j + 1) < currentSkillLevel As Int
					j += 1
					newSkillXP += skillInfo.GetExperienceForLevel(j)
				Endwhile
				newSkillXP += (skillInfo.GetSkillExperience() - skillInfo.GetExperienceForLevel((currentSkillLevel as int) - 1))
				skillInfo.SetSkillExperience(newSkillXP)
			EndIf
			PlayerRef.SetActorValue(sSkillName[i], fNewSkillLevel)
			fPrevSkillXP[i] = 0.0
			iLostSkills[i] = 0
		EndIf
		EnableXP(i)
	Endwhile
EndFunction

Function LoseSkills()
	iArrayClear(iLostSkills)
	fArrayClear(fPrevSkillLevel)
	fArrayClear(fPrevSkillXP)
	EnableAllXP()
EndFunction

Function ChangePerkDept(Int toChange)
	PerkPointDebt += toChange
EndFunction

Function RegisterForLevel()
	dsl_levelincreaseevent.RegisterForLevelIncrease(Self As Form, "OnLevelIncrease")
Endfunction

Function UnRegisterForLevel()
	dsl_levelincreaseevent.UnregisterForLevelIncrease(Self As Form, "OnLevelIncrease")
Endfunction

Event OnLevelIncrease(Int aiNewLevel)
	If (ReviveScript.moaState.GetValue() == 0 )
		Return
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Level increased to " + aiNewLevel)
	Int iPerkPoints = Game.GetPerkPoints()
	Int toRemove = PerkPointDebt
	If toRemove > iPerkPoints
		toRemove = iPerkPoints
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Has " + iPerkPoints + " points, want to remove " + PerkPointDebt + ", will remove " + toRemove)
	
	Game.ModPerkPoints(-toRemove)
	ChangePerkDept(-toRemove)
Endevent

Function EnableAllXP()
	Int i = fPrevSkillUseMult.Length
	While i > 0
		i -= 1
		EnableXP(i)
	Endwhile
	If PlayerRef.HasSpell(Dumbness)
		PlayerRef.RemoveSpell(Dumbness)
	EndIf
EndFunction

Function EnableXP(Int iSkillIndex)
	If fPrevSkillUseMult[iSkillIndex] > 0.0
		ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[iSkillIndex])
		skillInfo.SetSkillUseMult(fPrevSkillUseMult[iSkillIndex])
		fPrevSkillUseMult[iSkillIndex] = 0.0
	EndIf
EndFunction

Function DisableAllXP()
	Int i = fPrevSkillUseMult.Length
	While i > 0
		i -= 1
		If !fPrevSkillUseMult[i]
			DisableXP(i)
		EndIf
	Endwhile
	PlayerRef.AddSpell(Dumbness)
EndFunction

Function DisableXP(Int iSkillIndex)
	ActorValueInfo skillInfo = ActorValueInfo.GetActorValueInfoByName(sSkillName[iSkillIndex])
	float curSkillUseMult = skillInfo.GetSkillUseMult()
	If curSkillUseMult > 0.0
		fPrevSkillUseMult[iSkillIndex] = curSkillUseMult
		skillInfo.SetSkillUseMult(0.0)
	EndIf
EndFunction
