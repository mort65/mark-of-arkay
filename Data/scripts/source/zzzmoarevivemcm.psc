Scriptname zzzmoaReviveMCM extends SKI_ConfigBase

Import Game
Import StringUtil
Import FISSFactory
Import zzzmoautilscript

Int oidRevivalEnabled
Int oidDragonSoulRevivalEnabled
Int oidMarkOfArkayRevivalEnabled
Int oidBSoulGemRevivalEnabled
Int oidGSoulGemRevivalEnabled
Int oidGoldRevivalEnabled
Int oidPotionRevivalEnabled
Int oidAutoDrinkPotion
Int oidDragonSoulSlider
Int oidBSoulGemSlider
Int oidGSoulGemSlider
Int oidMenuEnabled
Int oidGoldSlider
Int oidMarkSlider
Int oidMarkPSlider
Int oidSnoozeSlider
Int oidDragonSoulPSlider
Int oidBSoulGemPSlider
Int oidGSoulGemPSlider
Int oidGoldPSlider
Int oidStatus
Int oidReset
int oidLootChanceSlider
int oidScrollChanceSlider
Int oidRPMinDistanceSlider
Int oidNotification
Int oidLogging
Int oidLoseforever
Int oidRecoveryTime
Int oidNoFallDamageEnabled
Int oidRevivalRequireBlessing
Int oidQuitToMainMenu
Int oidRespawnNaked
Int oidLostItemQuest
Int oidRecallRestriction
Int oidEffect
Int oidShiftBack
Int oidShiftBackRespawn
Int oidSoulMarkStay
Int oidArkayCurse
Int oidTempArkayCurse
Int oidFollowerProtectPlayer
Int oidInvisibility
Int oidDeathEffect
Int oidRespawnMenu
Int oidTeleportMenu
Int oidSpawnByLocation
Int oidSpawnCheckRelation
Int oidSpawnBringAllies
Int flags
Int oidRespawnPoint0
Int oidRespawnPoint1
Int oidRespawnPoint2
Int oidRespawnPoint3
Int oidRespawnPoint4
Int oidRespawnPoint5
Int oidRespawnPoint6
Int oidRespawnPoint7
Int oidExternalTeleportLocation
Int oidTeleportLocation_M
Int oidNoTradingAftermath_M
Int oidArkayCurses_M
Int oidInformation
Int oidResetHistory
Int oidRestoreItems
Int oidResetPlayer
Int oidHistory
Int oidAutoSwitchRP
int oidRecallCost
int oidMarkCost
int oidBleedoutTime
Int oidRecallByArkayMark
Int oidJail
Int oidKillIfCantRespawn
Int oidTogglePowers
Int oidToggleSpells
Int oidEnableSave_M
Int oidHealActors
Int oidResurrectActors
Int oidFadeToBlack
Int oidCreaturesCanSteal
Int oidSavePreset_M
Int oidLoadPreset_M
Int oidLoadPreset1
Int oidSavePreset1
Int oidLoadPreset2
Int oidSavePreset2
Int oidLoadPreset3
Int oidSavePreset3
Int oidLoadPreset4
Int oidSavePreset4
Int oidTradeEnabled
Int oidAltEyeFix
Int oidLoadDefaultPreset
Int oidMoralityMatters
Int oidPlayerProtectFollower
Int oidSkillReduce_M
Int oidSkillReduceRandomVal
Int oidSkillReduceValSlider
Int oidSkillReduceMinValSlider
Int oidSkillReduceMaxValSlider
Int oidLoseSkillForever
Int oidShowRaceMenu
Int oidLostItemsInfo
Int oidLostSkillsInfo
Int oidRagdollEffect
Int oidTotalCustomRPSlotSlider
Int oidSelectedCustomRPSlot_M
Int oidHostileOptions_M
Int oidCorpseAsSoulMark
Int oidSpawnMinLevel_M
Int oidSpawnMaxLevel_M
Int oidSpawns_M
Int oidDoNotStopCombat
Int oidDoNotStopCombatAfterRevival
Int oidRetrySpawnWithoutLocation
Int oidSpawnCountSlider
Int oidSpawnWeightSlider
Int oidSpawnHostile
Int oidDisableUnsafe
Int oidRespawnTimeSlider
Int oidRandomItemCurse
Int oidMoreRandomRespawn
Int oidEquipInclude_M
Int oidLoseItem
Int oidLoseGold
Int oidLoseAmmo
Int oidLoseBook
Int oidLoseArmor
Int oidLoseWeapon
Int oidLoseMisc
Int oidLoseKey
Int oidLoseSoulgem
Int oidLosePotion
Int oidLoseScroll
Int oidLoseIngredient
Int oidLoseArkayMark
Int oidLoseDragonSoul
Int oidLoseBlackSoulGem
Int oidLoseGrandSoulGem
Int oidLoseOthers
Int oidCheckKeyword
Int oidCheckWeight
Int oidLevelReduce
Int oidMinLoseGoldSlider
Int oidMaxLoseGoldSlider
Int oidLoseGoldAll
Int oidLoseArkayMarkAll
Int oidMinLoseArkayMarkSlider
Int oidMaxLoseArkayMarkSlider
Int oidLoseDragonSoulAll
Int oidMinLoseDragonSoulSlider
Int oidMaxLoseDragonSoulSlider
Int oidLoseBlackSoulGemAll
Int oidMinLoseBlackSoulGemSlider
Int oidMaxLoseBlackSoulGemSlider
Int oidLoseGrandSoulGemAll
Int oidMaxLoseGrandSoulGemSlider
Int oidMinLoseGrandSoulGemSlider
Int oidLoseOtherMinValueSlider
Int oidLoseOtherTotalValueSlider
Int oidExcludeQuestItems
Int oidTriggerOnHealthPerc
Int oidTriggerOnBleedout
Int oidAlwaysSpawn
Int oidOnlySpawn
Int oidHealthTriggerSlider
Int oidDisChanceSlider
Int oidOnlyLoseSkillXP
Int oidDisProgChanceSlider
Int oidDisPriceMultSlider
Int oidDisPriceSlider
Int oidMultipleDis
Int oidMultipleDisProg
Int oidOnlyInfectIfHasBaseDis
Int oidCureDisIfHasBlessing
Int oidDiseaseCurse
Int oidBossChestChanceSlider
Int oidBossChestOnlyCurLoc
Int oidBossChestNotClearedLoc
Int oidMarkScaleSlider
Int oidGSoulScaleGemSlider
Int oidBSoulScaleGemSlider
int oidDragonScaleSoulSlider
Int oidGoldScaleSlider
Int oidMaxItemsToCheckSlider
Int oidCanbeKilledbyUnarmed
Int oidTradeLock
Int oidCurseLock
Int oidMarkRecallCostLock
Int oidLootChanceLock
Int oidSaveLock
Int oidRespawnCounter
Int oidLockPermaDeath
Bool Property bLockPermaDeath = False Auto Hidden
Bool Property bRespawnCounter = False Auto Hidden
Float Property fRespawnCounterSlider = 0.0 Auto Hidden
Bool Property bSaveLock = False Auto Hidden
Bool Property bLootChanceLock = False Auto Hidden
Bool Property bTradeLock = False Auto Hidden
Bool Property bCurseLock = False Auto Hidden
Bool Property bMarkRecallCostLock = False Auto Hidden
Float Property fMaxItemsToCheckSlider = 1000.0 Auto Hidden
Float Property fValueMarkScaleSlider = 0.0 Auto Hidden
Float Property fValueGSoulGemScaleSlider = 0.0 Auto Hidden
Float Property fValueBSoulGemScaleSlider = 0.0 Auto Hidden
Float Property fValueSoulScaleSlider = 0.0 Auto Hidden
Float Property fValueGoldScaleSlider = 0.0 Auto Hidden
Bool Property bBossChestNotInClearedLoc = True Auto Hidden
Bool Property bBossChestOnlyCurLoc = False Auto Hidden
Float Property fBossChestChanceSlider = 0.0 Auto Hidden
Float Property fDisChanceSlider = 25.0 Auto Hidden
Float Property fDisProgChanceSlider = 50.0 Auto Hidden
Bool Property bCureDisIfHasBlessing = False Auto Hidden
Bool Property bOnlyInfectIfHasBaseDis = True Auto Hidden
Float Property fDisPriceMultSlider = 0.5 Auto Hidden
Float Property fDisPriceSlider = 100.0 Auto Hidden
Bool Property bMultipleDis = True Auto Hidden
Bool Property bMultipleDisProg = True Auto Hidden
Bool Property bRetrySpawnWithoutLocation = True Auto Hidden
Int Property iSpawn = 0 Auto Hidden
Float Property fTotalCustomRPSlotSlider = 1.0 Auto Hidden
Int Property iSelectedCustomRPSlot = 0 Auto Hidden
zzzmoaReviverScript Property ReviveScript Auto
String[] Property sRespawnPoints Auto Hidden
Int[] Property iSpawnWeights Auto Hidden
Int Property iHostileOption = 0 Auto Hidden
Bool[] Property bRespawnPointsFlags Auto Hidden
Int[] Property iSpawnCounts Auto Hidden
Int[] Property iValidTypes Auto Hidden
Actor Property PlayerRef Auto
Bool Property bCanbeKilledbyUnarmed = True auto Hidden
GlobalVariable Property moaOnlyInCurLocChest Auto
GlobalVariable Property moaBossChestNotInclearedLoc Auto
GlobalVariable Property moaState Auto
GlobalVariable Property moaLootChance Auto
GlobalVariable Property moaScrollChance Auto
GlobalVariable Property moaBleedoutHandlerState Auto
GlobalVariable Property moaBleedouAnimation Auto
GlobalVariable Property moaCureDisIfHasBlessing Auto
GlobalVariable Property moaPraytoSave Auto
GlobalVariable Property moaCreaturesCanSteal Auto
GlobalVariable Property moaSnoozeState Auto
GlobalVariable Property moaMoralityMatters Auto
GlobalVariable Property moaRPMinDistance Auto
Quest Property moaReviverQuest Auto
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
Quest Property moaFollowerDetector Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaGuardDetector Auto
Quest Property moaHealthMonitor Auto
Float Property fJumpFallHeightMinDefault = 600.00 Auto Hidden
Float Property fSkillReduceMinValSlider = 0.0 Auto Hidden
Float Property fSkillReduceMaxValSlider = 1.0 Auto Hidden
Float Property fSkillReduceValSlider = 10.0 Auto Hidden
Bool Property bIsRevivalEnabled = True Auto Hidden
Bool Property bIsEffectEnabled = False Auto Hidden
Bool Property bIsDragonSoulEnabled = True Auto Hidden
Bool Property bIsBSoulGemEnabled = True Auto Hidden
Bool Property bIsGSoulGemEnabled = True Auto Hidden
Bool Property bIsPotionEnabled = False Auto Hidden
Bool Property bAutoDrinkPotion = False Auto Hidden
Bool Property bIsGoldEnabled = True Auto Hidden
Bool Property bIsTradeEnabled = True Auto Hidden
Bool Property bFollowerProtectPlayer = False Auto Hidden
Bool Property bRecallByArkayMark = False Auto Hidden ;
Bool Property bIsMarkEnabled = True Auto Hidden
Bool Property bIsMenuEnabled = True Auto Hidden
Bool Property bRespawnMenu = False Auto Hidden
Bool Property bShowRaceMenu = False Auto Hidden
Bool Property bTeleportMenu = True Auto Hidden
Bool Property bAltEyeFix = False Auto Hidden
Bool Property bArkayCurse = False Auto Hidden
Bool Property bSpawnByLocation = True Auto Hidden
Bool Property bSpawnCheckRelation = True Auto Hidden
Bool Property bSpawnBringAllies = True Auto Hidden
Bool Property bIsArkayCurseTemporary = False Auto Hidden
Bool Property bIsRagdollEnabled = False Auto Hidden
Bool Property bIsNotificationEnabled = False Auto Hidden
Bool Property bIsLoggingEnabled = False Auto Hidden
Bool Property bIsNoFallDamageEnabled = False Auto Hidden
Bool Property bIsRevivalRequiresBlessing = False Auto Hidden
Bool Property bIsQuitToMainMenuEnabled = False Auto Hidden
Bool Property bRespawnNaked = False Auto Hidden
Bool Property bLostItemQuest = True Auto Hidden
Bool Property bIsRecallRestricted = True Auto Hidden
Bool Property bAutoSwitchRP = False Auto Hidden
Bool Property bDoNotStopCombat = False Auto Hidden
Bool Property bDoNotStopCombatAfterRevival = True Auto Hidden
Int Property iNotTradingAftermath = 0 Auto Hidden
Int Property iArkayCurse = 0 Auto Hidden
Int Property iReducedSkill = 0 Auto Hidden
Bool Property bLoseForever = False Auto Hidden
Bool Property bDeathEffect = True Auto Hidden
Bool Property bSoulMarkStay = False Auto Hidden
Bool Property bIsInfoEnabled = False Auto Hidden
Bool Property bIsHistoryEnabled = False Auto Hidden
Bool property bHealActors = False Auto Hidden
Bool property bResurrectActors = False Auto Hidden
Bool Property bSendToJail = False Auto Hidden
Bool Property bKillIfCantRespawn = False Auto Hidden
Bool Property bPlayerProtectFollower = False Auto Hidden
Bool Property bSkillReduceRandomVal = False Auto Hidden
Bool Property bMoralityMatters = True Auto Hidden
Int Property iTeleportLocation = 0 Auto Hidden
Int Property iSaveOption = 1 Auto Hidden
Int Property iLoadPreset = 0 Auto Hidden
Int Property iSavePreset = 0 Auto Hidden
Int Property iLoseInclusion = 0 Auto Hidden
Float Property fValueSoulSlider = 1.0 Auto Hidden
Float Property fValueGoldSlider = 1000.0 Auto Hidden
Float Property fValueBSoulGemSlider = 1.0 Auto Hidden
Float Property fValueGSoulGemSlider = 1.0 Auto Hidden
Float Property fValueMarkSlider = 1.0 Auto Hidden
Float Property fValueSnoozeSlider = 0.0 Auto Hidden
Float Property fBSoulgemPSlider = 1.0 Auto Hidden
Float Property fGSoulgemPSlider = 2.0 Auto Hidden
Float Property fMarkPSlider = 5.0 Auto Hidden
Float Property fDragonSoulPSlider = 3.0 Auto Hidden
Float Property fGoldPSlider = 4.0 Auto Hidden
Float Property fRecoveryTimeSlider = 1.0 Auto Hidden
Float Property fBleedoutTimeSlider = 6.0 Auto Hidden
Float Property fLootChanceSlider = 50.0 Auto Hidden
Float Property fScrollChanceSlider = 25.0 Auto Hidden
Float Property fRecallCastSlider = 0.0 Auto Hidden
Float Property fMarkCastSlider = 0.0 Auto Hidden
Float Property fRPMinDistanceSlider = 2000.0 Auto Hidden
Int Property iExternalIndex = -1 Auto Hidden
Int Property iSpawnMinLevel = 4 Auto Hidden
Int Property iSpawnMaxLevel = 4 Auto Hidden
Spell Property RevivalPower Auto
Spell Property SacrificePower Auto
Spell Property MoveCustomMarker Auto
Spell Property RecallMarker Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
Spell Property ArkayCurseTemp Auto
Spell Property ArkayCurseTempAlt Auto
Spell Property ArkayBlessing Auto
Bool Property bShiftBack = False Auto Hidden
Bool Property bShiftBackRespawn = True Auto Hidden
Bool Property bInvisibility = False Auto Hidden
Bool Property bCreaturesCanSteal = False Auto Hidden
Bool Property bLoseSkillForever = False Auto Hidden
String Property sResetHistory = "" Auto Hidden
FormList property MarkerList Auto
FormList property CustomRespawnPoints Auto
ObjectReference Property SleepMarker Auto
ObjectReference Property LocationMarker Auto
ObjectReference Property LostItemsMarker Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker3 Auto
Objectreference Property CellLoadMarker Auto
Objectreference Property CellLoadMarker2 Auto
Objectreference Property LocationMarker2 Auto
ObjectReference Property LostItemsChest Auto
ObjectReference Property ThiefMarker Auto
Formlist property ExternalMarkerList Auto
Bool Property bDiseaseCurse = False Auto Hidden
Int Property iTotalBleedOut = 0 Auto Hidden
Int Property iTotalRespawn = 0 Auto Hidden
Int Property iTotalRevives = 0 Auto Hidden
Int Property iRevivesByTrade = 0 Auto Hidden
Int Property iRevivesByRevivalSpell = 0 Auto Hidden
Int Property iRevivesBySacrificeSpell = 0 Auto Hidden
Int Property iRevivesByPotion = 0 Auto Hidden
Int Property iRevivesByFollower = 0 Auto Hidden
Int Property iDestroyedItems = 0 Auto Hidden
Bool Property bFadeToBlack = True Auto Hidden
Message Property moaLostItemMenu Auto
Float Property fRespawnTimeSlider = 0.0 Auto Hidden
Bool Property bDisableUnsafe = True Auto Hidden
Bool Property bShowRagdollWarning = True Auto Hidden
Bool Property bShowTimeScaleWarning = True Auto Hidden
Bool Property bShowBleedoutTimeWarning = True Auto Hidden
Bool Property bSpawnHostile = False Auto Hidden
Bool Property bIsUpdating = False Auto Hidden
Bool Property bTriggerOnHealthPerc = False Auto Hidden
Bool Property bTriggerOnBleedout = True Auto Hidden
Bool Property bAlwaysSpawn = False Auto Hidden
Bool Property bOnlySpawn = False Auto Hidden
Float Property fHealthPercTrigger = 0.00 Auto Hidden
Bool Property bLoseItem = False Auto Hidden
Bool Property bLoseGold = True Auto Hidden
Bool Property bLoseArkayMark = False Auto Hidden
Bool Property bLoseBlackSoulGem = False Auto Hidden
Bool Property bLoseGrandSoulGem = False Auto Hidden
Bool Property bLoseDragonSoul = False Auto Hidden
Bool Property bLoseOthers = False Auto Hidden
Bool Property bLoseAmmo = False Auto Hidden
Bool Property bLoseBook = False Auto Hidden
Bool Property bLoseArmor = True Auto Hidden
Bool Property bLoseWeapon = True Auto Hidden
Bool Property bLoseMisc = False Auto Hidden
Bool Property bLoseKey = False Auto Hidden
Bool Property bLoseSoulgem = False Auto Hidden
Bool Property bLosePotion = False Auto Hidden
Bool Property bLoseScroll = False Auto Hidden
Bool Property bLoseIngredient = False Auto Hidden
Bool Property bExcludeQuestItems = True Auto Hidden
Bool Property bCheckKeyword = True Auto Hidden
Bool Property bCheckWeight = True Auto Hidden
Bool Property bLevelReduce = False Auto Hidden
Bool Property bMoreRandomRespawn = False Auto Hidden
Bool Property bRandomItemCurse = False Auto Hidden
Bool Property bSKSEOK Auto Hidden
Bool Property bSKSELoaded Auto Hidden
Bool Property bARCCOK Auto Hidden ;ARCC
Bool Property bFISSOK Auto Hidden ;FISS
Bool Property bDLIEOK Auto Hidden ;Level Up Event Plugin
Bool Property bUIEOK Auto Hidden ;uiextensions
Bool Property bPUOK Auto Hidden ;papyrusutil
Bool Property bClone = True Auto Hidden
Bool Property bCorpseAsSoulMark = False Auto Hidden
Float Property fMaxLoseGoldSlider = 250.0 Auto Hidden
Float Property fMaxLoseArkayMarkSlider = 1.0 Auto Hidden
Float Property fMaxLoseDragonSoulSlider = 1.0 Auto Hidden
Float Property fMaxLoseBlackSoulGemSlider = 1.0 Auto Hidden
Float Property fMaxLoseGrandSoulGemSlider = 1.0 Auto Hidden
Float Property fMinLoseGoldSlider = 50.0 Auto Hidden
Float Property fMinLoseArkayMarkSlider = 0.0 Auto Hidden
Float Property fMinLoseDragonSoulSlider = 0.0 Auto Hidden
Float Property fMinLoseBlackSoulGemSlider = 0.0 Auto Hidden
Float Property fMinLoseGrandSoulGemSlider = 0.0 Auto Hidden
Float Property fLoseOtherMinValueSlider = 0.0 Auto Hidden
Float Property fLoseOtherTotalValueSlider = 0.0 Auto Hidden
Bool Property bLoseGoldAll = False Auto Hidden
Bool Property bLoseArkayMarkAll = False Auto Hidden
Bool Property bLoseDragonSoulAll = False Auto Hidden
Bool Property bLoseGrandSoulGemAll = False Auto Hidden
Bool Property bLoseBlackSoulGemAll = False Auto Hidden
Bool Property bOnlyLoseSkillXP = False Auto Hidden
Message Property ModVersionError Auto
GlobalVariable Property moaIsBusy Auto
GlobalVariable Property moaNoKillMoveOnPlayer Auto
Int Property iNameTagBackup Auto Hidden

Event OnPageReset(String page)
	setArrays()
	SetCursorFillMode(LEFT_TO_RIGHT)
	Int iCurStatus = iGetModStatus()
	If iCurStatus == 1
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Mod_Status_1")
		Return
	ElseIf iCurStatus == 2
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Mod_Status_2")
		Return
	EndIf
	If (page == "$General")
		SetCursorPosition(0)
		AddHeaderOption("$General")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_RevivalEnabled", bIsRevivalEnabled, flags )
		SetCursorPosition(4)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( bIsMenuEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSnoozeSlider = AddSliderOption("$mrt_MarkofArkay_SnoozeSoulSlider_1", fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(10)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTradeEnabled = AddToggleOption("$mrt_MarkofArkay_TradeEnabled", bIsTradeEnabled, flags )
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bTradeLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkOfArkayRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_MarkOfArkayRevivalEnabled", bIsMarkEnabled, flags )
		SetCursorPosition(14)
		oidGSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GSoulGemRevivalEnabled", bIsGSoulGemEnabled, flags )
		SetCursorPosition(16)
		oidBSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_BSoulGemRevivalEnabled", bIsBSoulGemEnabled, flags )
		SetCursorPosition(18)
		oidDragonSoulRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_DragonSoulRevivalEnabled", bIsDragonSoulEnabled, flags )
		SetCursorPosition(20)
		oidGoldRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GoldRevivalEnabled", bIsGoldEnabled, flags )
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 ) && (!ReviveScript.NPCScript.bInBeastForm() && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTriggerOnBleedout = AddToggleOption("$mrt_MarkofArkay_TriggerOnBleedout", bTriggerOnBleedout, flags)
		SetCursorPosition(5)
		oidTriggerOnHealthPerc = AddToggleOption("$mrt_MarkofArkay_TriggerOnHealthPerc", bTriggerOnHealthPerc, flags)
		SetCursorPosition(7)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( bTriggerOnHealthPerc )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidHealthTriggerSlider = AddSliderOption("$mrt_MarkofArkay_HealthPercSlider_1", fHealthPercTrigger * 100.0, "$mrt_MarkofArkay_HealthPercSlider_2", flags)
		SetCursorPosition(13)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bTradeLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkSlider = AddSliderOption("$mrt_MarkofArkay_MarkSlider_1", fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2", flags)
		SetCursorPosition(15)
		oidGSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_GSoulGemSlider_1", fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2", flags)
		SetCursorPosition(17)
		oidBSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_BSoulGemSlider_1", fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2", flags)
		SetCursorPosition(19)
		oidDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_DragonSoulSlider_1", fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2", flags)
		SetCursorPosition(21)
		oidGoldSlider = AddSliderOption("$mrt_MarkofArkay_GoldSlider_1", fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2", flags)
		SetCursorPosition(25)
		oidMarkScaleSlider = AddSliderOption("$mrt_MarkofArkay_MarkScaleSlider_1", fValueMarkScaleSlider, "$mrt_MarkofArkay_MarkScaleSlider_2", flags)
		SetCursorPosition(27)
		oidGSoulScaleGemSlider = AddSliderOption("$mrt_MarkofArkay_GSoulGemScaleSlider_1", fValueGSoulGemScaleSlider, "$mrt_MarkofArkay_GSoulGemScaleSlider_2", flags)
		SetCursorPosition(29)
		oidBSoulScaleGemSlider = AddSliderOption("$mrt_MarkofArkay_BSoulGemScaleSlider_1", fValueBSoulGemScaleSlider, "$mrt_MarkofArkay_BSoulGemScaleSlider_2", flags)
		SetCursorPosition(31)
		oidDragonScaleSoulSlider = AddSliderOption("$mrt_MarkofArkay_DragonSoulScaleSlider_1", fValueSoulScaleSlider, "$mrt_MarkofArkay_DragonSoulScaleSlider_2", flags)
		SetCursorPosition(33)
		oidGoldScaleSlider = AddSliderOption("$mrt_MarkofArkay_GoldScaleSlider_1", fValueGoldScaleSlider, "$mrt_MarkofArkay_GoldScaleSlider_2", flags)
	ElseIf (page == "$Extra")
		SetCursorPosition(0)
		AddHeaderOption("$Extra")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 ) && !bSaveLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidEnableSave_M = AddMenuOption("$mrt_MarkofArkay_EnableSave_M", sGetSaveOptions()[iSaveOption], flags)
		SetCursorPosition(4)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidNoFallDamageEnabled = AddToggleOption("$mrt_MarkofArkay_NoFallDamageEnabled", bIsNoFallDamageEnabled, flags )
		SetCursorPosition(6)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidEffect = AddToggleOption("$mrt_MarkofArkay_Effect", bIsEffectEnabled, flags )
		SetCursorPosition(8)
		oidPotionRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_PotionRevivalEnabled", bIsPotionEnabled, flags )
		SetCursorPosition(10)
		If  ( moaState.getValue() == 1 ) && ( bIsRevivalEnabled )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidAutoDrinkPotion = AddToggleOption("$mrt_MarkofArkay_AutoDrinkPotion", bAutoDrinkPotion, flags )
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRevivalRequireBlessing = AddToggleOption("$mrt_MarkofArkay_RevivalRequireBlessing", bIsRevivalRequiresBlessing, flags )
		SetCursorPosition(14)
		oidShiftBack = AddToggleOption("$mrt_MarkofArkay_ShiftBack", bShiftBack,flags)
		SetCursorPosition(16)
		oidShiftBackRespawn = AddToggleOption("$mrt_MarkofArkay_ShiftBackRespawn", bShiftBackRespawn,flags)
		SetCursorPosition(18)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRecallRestriction = AddToggleOption("$mrt_MarkofArkay_RecallRestriction", bIsRecallRestricted, flags)
		SetCursorPosition(20)
		oidAutoSwitchRP = AddToggleOption("$mrt_MarkofArkay_AutoSwitchRP",bAutoSwitchRP,flags)
		SetCursorPosition(22)
		If ( moaState.getValue() == 1 ) && !bMarkRecallCostLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkCost = AddSliderOption("$mrt_MarkofArkay_MarkCast",fMarkCastSlider,"$mrt_MarkofArkay_MarkSlider_2", flags)
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMenuEnabled = AddToggleOption("$mrt_MarkofArkay_MenuEnabled", bIsMenuEnabled, flags )
		SetCursorPosition(5)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( !bIsMenuEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkPSlider = AddSliderOption("$mrt_MarkofArkay_MarkPSlider", fMarkPSlider, "{0}", flags)
		SetCursorPosition(7)
		oidGoldPSlider = AddSliderOption("$mrt_MarkofArkay_GoldPSlider", fGoldPSlider, "{0}", flags)
		SetCursorPosition(9)
		oidDragonSoulPSlider = AddSliderOption("$mrt_MarkofArkay_DragonSoulPSlider", fDragonSoulPSlider, "{0}", flags)
		SetCursorPosition(11)
		oidGSoulGemPSlider = AddSliderOption("$mrt_MarkofArkay_GSoulGemPSlider", fGSoulgemPSlider, "{0}", flags)
		SetCursorPosition(13)
		oidBSoulGemPSlider = AddSliderOption("$mrt_MarkofArkay_BSoulGemPSlider", fBSoulgemPSlider, "{0}", flags)
		SetCursorPosition(15)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidBleedoutTime = AddSliderOption("$mrt_MarkofArkay_BleedoutTime_1", fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(17)
		oidRecoveryTime = AddSliderOption("$mrt_MarkofArkay_RecoveryTime_1", fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(19)
		If ( moaState.getValue() == 1 ) && !bLootChanceLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLootChanceSlider = AddSliderOption("$mrt_MarkofArkay_LootChanceSlider_1" ,fLootChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2", flags)
		SetCursorPosition(21)
		oidScrollChanceSlider = AddSliderOption("$mrt_MarkofArkay_ScrollChanceSlider_1" ,fScrollChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2", flags)
		SetCursorPosition(23)
		If ( moaState.getValue() == 1 ) && !bMarkRecallCostLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRecallCost = AddSliderOption("$mrt_MarkofArkay_RecallCast",fRecallCastSlider,"$mrt_MarkofArkay_MarkSlider_2", flags)
	ElseIf (page == "$Aftermath")
		SetCursorPosition(0)
		AddHeaderOption("$Aftermath")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidNoTradingAftermath_M = AddMenuOption("Aftermath", sGetAftermathOptions()[iNotTradingAftermath], flags)
		SetCursorPosition(6)
		AddHeaderOption("$Respawn")
		SetCursorPosition(8)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnNaked = AddToggleOption("$mrt_MarkofArkay_RespawnNaked", bRespawnNaked, flags)
		SetCursorPosition(10)
		oidJail = AddToggleOption("$mrt_MarkofArkay_Jail",bSendToJail,flags)
		SetCursorPosition(12)
		oidShowRaceMenu = AddToggleOption("$mrt_MarkofArkay_ShowRaceMenu", bShowRaceMenu,flags)
		SetCursorPosition(14)
		oidKillIfCantRespawn = AddToggleOption("$mrt_MarkofArkay_KillIfCantRespawn",bKillIfCantRespawn,flags)
		SetCursorPosition(16)
		oidCanbeKilledbyUnarmed = AddToggleOption("$mrt_MarkofArkay_CanbeKilledbyUnarmed",bCanbeKilledbyUnarmed,flags)
		SetCursorPosition(18)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMoreRandomRespawn = AddToggleOption("$mrt_MarkofArkay_MoreRandomRespawn",bMoreRandomRespawn,flags)
		SetCursorPosition(20)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidCorpseAsSoulMark = AddToggleOption("$mrt_MarkofArkay_CorpseAsSoulMark", bCorpseAsSoulMark, flags)
		SetCursorPosition(22)
		oidHealActors = AddToggleOption("$mrt_MarkofArkay_HealActors",bHealActors,flags)
		SetCursorPosition(24)
		oidResurrectActors = AddToggleOption("$mrt_MarkofArkay_ResurrectActors",bResurrectActors,flags)
		SetCursorPosition(26)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDoNotStopCombatAfterRevival = AddToggleOption("$mrt_MarkofArkay_DoNotStopCombatAfterRevival",bDoNotStopCombatAfterRevival, flags)
		SetCursorPosition(28)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDoNotStopCombat = AddToggleOption("$mrt_MarkofArkay_DoNotStopCombat",bDoNotStopCombat, flags)
		SetCursorPosition(1)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Destination")
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTeleportMenu = AddToggleOption("$mrt_MarkofArkay_TeleportMenu", bTeleportMenu, flags)
		SetCursorPosition(5)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnMenu = AddToggleOption("$mrt_MarkofArkay_RespawnMenu", bRespawnMenu, flags)
		SetCursorPosition(7)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTeleportLocation_M = AddMenuOption("$mrt_MarkofArkay_TeleportLocation_M", sRespawnPoints[iTeleportLocation], flags)
		SetCursorPosition(9)
		oidSelectedCustomRPSlot_M = AddMenuOption("$mrt_MarkofArkay_SelectedCustomRPSlot_M", sGetCustomRPs()[iSelectedCustomRPSlot], flags)
		SetCursorPosition(11)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTotalCustomRPSlotSlider = AddSliderOption("$mrt_MarkofArkay_TotalCustomRPSlotSlider_1", fTotalCustomRPSlotSlider, "{0}", flags)
		SetCursorPosition(13)
		If (( moaState.getValue() == 1 ) && ( iTeleportLocation == getExternalRPIndex()) && ( ExternalMarkerList.GetSize() > 1 ))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		If iExternalIndex >= ExternalMarkerList.GetSize()
			iExternalIndex = -1
		EndIf
		If iExternalIndex == -1
			oidExternalTeleportLocation = AddTextOption("$mrt_MarkofArkay_ExternalTeleportLocation", "$Random", flags)
		Else
			oidExternalTeleportLocation = AddTextOption("$mrt_MarkofArkay_ExternalTeleportLocation", ( (iExternalIndex + 1) As String ), flags)
		EndIf
		SetCursorPosition(15)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRPMinDistanceSlider = AddSliderOption("$mrt_MarkofArkay_RPMinDistanceSlider_1", fRPMinDistanceSlider, "{0}", flags)
		SetCursorPosition(17)
		If ( moaState.getValue() == 1 ) && !bDisableUnsafe
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnTimeSlider = AddSliderOption("$mrt_MarkofArkay_RespawnTimeSlider_1", fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2", flags)
		SetCursorPosition(21)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_City")
		SetCursorPosition(23)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnPoint0 = AddToggleOption(sRespawnPoints[0], bRespawnPointsFlags[0], flags )
		SetCursorPosition(25)
		oidRespawnPoint1 = AddToggleOption(sRespawnPoints[1], bRespawnPointsFlags[1], flags )
		SetCursorPosition(27)
		oidRespawnPoint2 = AddToggleOption(sRespawnPoints[2], bRespawnPointsFlags[2], flags )
		SetCursorPosition(29)
		oidRespawnPoint3 = AddToggleOption(sRespawnPoints[3], bRespawnPointsFlags[3], flags )
		SetCursorPosition(31)
		oidRespawnPoint4 = AddToggleOption(sRespawnPoints[4], bRespawnPointsFlags[4], flags )
		SetCursorPosition(33)
		oidRespawnPoint5 = AddToggleOption(sRespawnPoints[5], bRespawnPointsFlags[5], flags )
		SetCursorPosition(35)
		oidRespawnPoint6 = AddToggleOption(sRespawnPoints[6], bRespawnPointsFlags[6], flags )
		SetCursorPosition(37)
		oidRespawnPoint7 = AddToggleOption(sRespawnPoints[7], bRespawnPointsFlags[7], flags )
	ElseIf (page == "$Curse")
		SetCursorPosition(0)
		AddHeaderOption("$Curse")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidArkayCurse = AddToggleOption("$mrt_MarkofArkay_ArkayCurse", bArkayCurse, flags)
		SetCursorPosition(4)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bArkayCurse) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTempArkayCurse = AddToggleOption("$mrt_MarkofArkay_TempArkayCurse",bIsArkayCurseTemporary, flags)
		SetCursorPosition(6)
		oidArkayCurses_M = AddMenuOption("$mrt_MarkofArkay_ArkayCurses_M", sGetArkayCurses()[iArkayCurse], flags)
		SetCursorPosition(10)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Disease_Curse")
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDiseaseCurse = AddToggleOption("$mrt_MarkofArkay_DiseaseCurse", bDiseaseCurse, flags)
		SetCursorPosition(14)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bDiseaseCurse && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDisChanceSlider = AddSliderOption("$mrt_MarkofArkay_DisChanceSlider_1",fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2", flags)
		SetCursorPosition(16)
		oidDisProgChanceSlider = AddSliderOption("$mrt_MarkofArkay_DisProgChanceSlider_1",fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2", flags)
		SetCursorPosition(18)
		oidDisPriceSlider = AddSliderOption("$mrt_MarkofArkay_DisPriceSlider_1",fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2", flags)
		SetCursorPosition(20)
		oidDisPriceMultSlider = AddSliderOption("$mrt_MarkofArkay_DisPriceMultSlider_1",fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2", flags)
		SetCursorPosition(22)
		oidCureDisIfHasBlessing = AddToggleOption("$mrt_MarkofArkay_CureDisIfHasBlessing", bCureDisIfHasBlessing , flags)		
		SetCursorPosition(24)
		oidMultipleDis = AddToggleOption("$mrt_MarkofArkay_MultipleDis", bMultipleDis, flags)
		SetCursorPosition(26)
		oidMultipleDisProg = AddToggleOption("$mrt_MarkofArkay_MultipleDisProg", bMultipleDisProg, flags)
		SetCursorPosition(28)
		oidOnlyInfectIfHasBaseDis = AddToggleOption("$mrt_MarkofArkay_OnlyInfectIfHasBaseDis", bOnlyInfectIfHasBaseDis , flags)
		SetCursorPosition(32)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Skill_Reduction")
		SetCursorPosition(34)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduce_M = AddMenuOption("$mrt_MarkofArkay_SkillReduce_M", sGetSkills()[iReducedSkill], flags)
		SetCursorPosition(36)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidOnlyLoseSkillXP = AddToggleOption("$mrt_MarkofArkay_OnlyLoseSkillXP", bOnlyLoseSkillXP, flags)
		SetCursorPosition(38)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && !bOnlyLoseSkillXP && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLevelReduce = AddToggleOption("$mrt_MarkofArkay_LevelReduce", bLevelReduce, flags)
		SetCursorPosition(40)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && !bSkillReduceRandomVal && !bOnlyLoseSkillXP && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceValSlider = AddSliderOption("$mrt_MarkofArkay_SkillReduceValSlider_1", fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2", flags)
		SetCursorPosition(42)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && !bOnlyLoseSkillXP && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceRandomVal = AddToggleOption("$mrt_MarkofArkay_SkillReduceRandomVal",bSkillReduceRandomVal, flags)
		SetCursorPosition(44)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && bSkillReduceRandomVal && !bOnlyLoseSkillXP && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceMinValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMinValSlider_1", fSkillReduceMinValSlider , "{0}", flags)
		SetCursorPosition(46)
		oidSkillReduceMaxValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMaxValSlider_1", fSkillReduceMaxValSlider , "{0}", flags)
		SetCursorPosition(48)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && !bDisableUnsafe && (iReducedSkill != 0) && bDLIEOK && !bOnlyLoseSkillXP && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseSkillForever = AddToggleOption("$mrt_MarkofArkay_LoseSkillForever",bLoseSkillForever, flags)
		SetCursorPosition(52)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Curse_Recovery")
		SetCursorPosition(54)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLostItemQuest = AddToggleOption("$mrt_MarkofArkay_LostItemQuest",bLostItemQuest,flags)
		SetCursorPosition(56)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1)) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSoulMarkStay = AddToggleOption("$mrt_MarkofArkay_SoulMarkStay",bSoulMarkStay,flags)
		SetCursorPosition(58)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1)) && !bDisableUnsafe && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseforever = AddToggleOption("$mrt_MarkofArkay_Loseforever",bLoseForever, flags)
		SetCursorPosition(1)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Item_Curse")
		SetCursorPosition(3)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1)) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseItem = AddToggleOption("$mrt_MarkofArkay_Lose_Items", bLoseItem,flags)
		SetCursorPosition(5)
		AddHeaderOption("")
		SetCursorPosition(7)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseGold = AddToggleOption("$mrt_MarkofArkay_Lose_Gold", bLoseGold,flags)
		SetCursorPosition(9)
		oidLoseGoldAll = AddToggleOption("$mrt_MarkofArkay_LoseGoldAll", bLoseGoldAll,flags)
		SetCursorPosition(11)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && !bLoseGoldAll) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMinLoseGoldSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseGoldSlider", fMinLoseGoldSlider, "{0}", flags)
		SetCursorPosition(13)
		oidMaxLoseGoldSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseGoldSlider", fMaxLoseGoldSlider, "{0}", flags)
		SetCursorPosition(15)
		AddHeaderOption("")
		SetCursorPosition(17)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem ) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseArkayMark = AddToggleOption("$mrt_MarkofArkay_LoseArkayMark", bLoseArkayMark,flags)
		SetCursorPosition(19)
		oidLoseArkayMarkAll = AddToggleOption("$mrt_MarkofArkay_LoseArkayMarkAll", bLoseArkayMarkAll,flags)
		SetCursorPosition(21)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && !bLoseArkayMarkAll) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMinLoseArkayMarkSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseArkayMarkSlider", fMinLoseArkayMarkSlider, "{0}", flags)
		SetCursorPosition(23)
		oidMaxLoseArkayMarkSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseArkayMarkSlider", fMaxLoseArkayMarkSlider, "{0}", flags)
		SetCursorPosition(25)
		AddHeaderOption("")
		SetCursorPosition(27)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseDragonSoul = AddToggleOption("$mrt_MarkofArkay_LoseDragonSoul", bLoseDragonSoul,flags)
		SetCursorPosition(29)
		oidLoseDragonSoulAll = AddToggleOption("$mrt_MarkofArkay_LoseDragonSoulAll", bLoseDragonSoulAll,flags)
		SetCursorPosition(31)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && !bLoseDragonSoulAll) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMinLoseDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseDragonSoulSlider", fMinLoseDragonSoulSlider, "{0}", flags)
		SetCursorPosition(33)
		oidMaxLoseDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseDragonSoulSlider", fMaxLoseDragonSoulSlider, "{0}", flags)
		SetCursorPosition(35)
		AddHeaderOption("")
		SetCursorPosition(37)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseBlackSoulGem = AddToggleOption("$mrt_MarkofArkay_LoseBlackSoulGem", bLoseBlackSoulGem,flags)
		SetCursorPosition(39)
		oidLoseBlackSoulGemAll = AddToggleOption("$mrt_MarkofArkay_LoseBlackSoulGemAll", bLoseBlackSoulGemAll,flags)
		SetCursorPosition(41)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && !bLoseBlackSoulGemAll) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMinLoseBlackSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseBlackSoulGemSlider", fMinLoseBlackSoulGemSlider, "{0}", flags)
		SetCursorPosition(43)
		oidMaxLoseBlackSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseBlackSoulGemSlider", fMaxLoseBlackSoulGemSlider, "{0}", flags)
		SetCursorPosition(45)
		AddHeaderOption("")
		SetCursorPosition(47)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseGrandSoulGem = AddToggleOption("$mrt_MarkofArkay_LoseGrandSoulGem", bLoseGrandSoulGem,flags)
		SetCursorPosition(49)
		oidLoseGrandSoulGemAll = AddToggleOption("$mrt_MarkofArkay_LoseGrandSoulGemAll", bLoseGrandSoulGemAll,flags)
		SetCursorPosition(51)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && !bLoseGrandSoulGemAll) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMinLoseGrandSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseGrandSoulGemSlider", fMinLoseGrandSoulGemSlider, "{0}", flags)
		SetCursorPosition(53)
		oidMaxLoseGrandSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseGrandSoulGemSlider", fMaxLoseGrandSoulGemSlider, "{0}", flags)
		SetCursorPosition(55)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Extra_Item_Curse")
		SetCursorPosition(57)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseOthers = AddToggleOption("$mrt_MarkofArkay_LoseOthers", bLoseOthers,flags)
		SetCursorPosition(59)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && bLoseOthers) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidEquipInclude_M = AddMenuOption("$mrt_MarkofArkay_EquipInclude_M", sGetLoseInclusions()[iLoseInclusion], flags)
		SetCursorPosition(61)
		oidCheckWeight = AddToggleOption("$mrt_MarkofArkay_CheckWeight", bCheckWeight,flags)
		SetCursorPosition(63)
		oidCheckKeyword = AddToggleOption("Exclude by Keyword", bCheckKeyword,flags)
		SetCursorPosition(65)
		oidExcludeQuestItems = AddToggleOption("$mrt_MarkofArkay_ExcludeQuestItems", bExcludeQuestItems, flags)
		SetCursorPosition(67)
		oidRandomItemCurse = AddToggleOption("$mrt_MarkofArkay_RandomItemCurse",bRandomItemCurse,flags)
		SetCursorPosition(69)
		oidLoseOtherMinValueSlider = AddSliderOption("$mrt_MarkofArkay_LoseOtherMinValueSlider", fLoseOtherMinValueSlider, "{0}", flags)
		SetCursorPosition(71)
		oidLoseOtherTotalValueSlider = AddSliderOption("$mrt_MarkofArkay_LoseOtherTotalValueSlider", fLoseOtherTotalValueSlider, "{0}", flags)
		SetCursorPosition(73)
		oidMaxItemsToCheckSlider = AddSliderOption("$mrt_MarkofArkay_MaxItemsToCheckSlider", fMaxItemsToCheckSlider, "{0}", flags)
		SetCursorPosition(75)
		AddHeaderOption("")
		SetCursorPosition(77)
		oidLoseArmor = AddToggleOption("$mrt_MarkofArkay_LoseArmor", bLoseArmor,flags)
		SetCursorPosition(79)
		oidLoseWeapon = AddToggleOption("$mrt_MarkofArkay_LoseWeapon", bLoseWeapon,flags)
		SetCursorPosition(81)
		oidLoseAmmo = AddToggleOption("$mrt_MarkofArkay_LoseAmmo", bLoseAmmo,flags)
		SetCursorPosition(83)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bLoseItem && bLoseOthers && (iLoseInclusion != 1)) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseBook = AddToggleOption("$mrt_MarkofArkay_LoseBook", bLoseBook,flags)
		SetCursorPosition(85)
		oidLoseMisc = AddToggleOption("$mrt_MarkofArkay_LoseMisc", bLoseMisc,flags)
		SetCursorPosition(87)
		oidLoseKey = AddToggleOption("$mrt_MarkofArkay_LoseKey", bLoseKey,flags)
		SetCursorPosition(89)
		oidLoseSoulgem = AddToggleOption("$mrt_MarkofArkay_LoseSoulgem", bLoseSoulgem,flags)
		SetCursorPosition(91)
		oidLosePotion = AddToggleOption("$mrt_MarkofArkay_LosePotion", bLosePotion,flags)
		SetCursorPosition(93)
		oidLoseScroll = AddToggleOption("$mrt_MarkofArkay_LoseScroll", bLoseScroll,flags)
		SetCursorPosition(95)
		oidLoseIngredient = AddToggleOption("$mrt_MarkofArkay_LoseIngredient", bLoseIngredient,flags)
	ElseIf (page == "NPC")
		SetCursorPosition(0)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_NPC")
		SetCursorPosition(2)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidHostileOptions_M = AddMenuOption("$mrt_MarkofArkay_HostileOptions_M", sGetHostileOptions()[iHostileOption], flags)
		SetCursorPosition(4)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && (iHostileOption == 2))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMoralityMatters = AddToggleOption("$mrt_MarkofArkay_MoralityMatters", bMoralityMatters,flags)
		SetCursorPosition(6)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( iHostileOption == 1 || iHostileOption == 2 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidCreaturesCanSteal  = AddToggleOption("$mrt_MarkofArkay_CreaturesCanSteal",bCreaturesCanSteal,flags)
		SetCursorPosition(10)
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Spawn")
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && iHostileOption == 2
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSpawnHostile = AddToggleOption("$mrt_MarkofArkay_SpawnHostile",bSpawnHostile, flags)
		SetCursorPosition(14)
		oidOnlySpawn = AddToggleOption("$mrt_MarkofArkay_OnlySpawn",bOnlySpawn, flags)
		SetCursorPosition(16)
		oidAlwaysSpawn = AddToggleOption("$mrt_MarkofArkay_AlwaysSpawn",bAlwaysSpawn, flags)
		SetCursorPosition(18)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && iHostileOption == 2 &&  bSpawnHostile
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSpawnByLocation = AddToggleOption("$mrt_MarkofArkay_SpawnByLocation", bSpawnByLocation, flags)
		SetCursorPosition(20)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && iHostileOption == 2 &&  bSpawnHostile && bSpawnByLocation
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRetrySpawnWithoutLocation = AddToggleOption("$mrt_MarkofArkay_RetrySpawnWithoutLocation", bRetrySpawnWithoutLocation, flags)
		SetCursorPosition(22)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && iHostileOption == 2 && bSpawnHostile
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSpawnCheckRelation = AddToggleOption("$mrt_MarkofArkay_SpawnCheckRelation", bSpawnCheckRelation, flags)
		SetCursorPosition(24)
		oidSpawnBringAllies = AddToggleOption("$mrt_MarkofArkay_SpawnBringAllies", bSpawnBringAllies, flags)
		SetCursorPosition(26)
		oidSpawnMinLevel_M = AddMenuOption("$mrt_MarkofArkay_SpawnMinLevel_M", sGetSpawnLevels()[iSpawnMinLevel], flags)
		SetCursorPosition(28)
		oidSpawnMaxLevel_M = AddMenuOption("$mrt_MarkofArkay_SpawnMaxLevel_M", sGetSpawnLevels()[iSpawnMaxLevel], flags)
		SetCursorPosition(30)
		AddHeaderOption("")
		SetCursorPosition(32)
		oidSpawns_M = AddMenuOption("$mrt_MarkofArkay_Spawns_M", sGetSpawns()[iSpawn], flags)
		SetCursorPosition(34)
		oidSpawnWeightSlider = AddSliderOption("$mrt_MarkofArkay_SpawnWeightSlider_1", iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2", flags)
		SetCursorPosition(36)
		oidSpawnCountSlider = AddSliderOption("$mrt_MarkofArkay_SpawnCountSlider_1", iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2", flags)		
		SetCursorPosition(1)
		AddHeaderOption("$Follower")
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidPlayerProtectFollower = AddToggleOption("$mrt_MarkofArkay_PlayerProtectFollower", bPlayerProtectFollower, flags)
		SetCursorPosition(5)
		oidFollowerProtectPlayer = AddToggleOption("$mrt_MarkofArkay_FollowerProtectPlayer", bFollowerProtectPlayer, flags)
		SetCursorPosition(9)
		AddHeaderOption("$mrt_MarkofArkay_Boss_Chest")
		SetCursorPosition(11)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidBossChestChanceSlider = AddSliderOption("$mrt_MarkofArkay_BossChestChanceSlider_1", fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2", flags)
		SetCursorPosition(13)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && fBossChestChanceSlider > 0.0
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf		
		oidBossChestNotClearedLoc = AddToggleOption("$mrt_MarkofArkay_BossChestNotClearedLoc", bBossChestNotInClearedLoc, flags)
		SetCursorPosition(15)
		oidBossChestOnlyCurLoc = AddToggleOption("$mrt_MarkofArkay_BossChestOnlyCurLoc",bBossChestOnlyCurLoc,flags)
	ElseIf (page == "$Debug")
		SetCursorPosition(0)
		AddHeaderOption("$Debug")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidResetPlayer = addTextOption("$mrt_MarkofArkay_ResetPlayer", "", flags)
		SetCursorPosition(4)
		If moaState.getValue() == 0
			oidStatus = AddTextOption("$mrt_MarkofArkay_Status_Off", "")
		Else
			oidStatus = AddTextOption("$mrt_MarkofArkay_Status_On", "")
		EndIf
		SetCursorPosition(6)
		oidReset = AddTextOption("$mrt_MarkofArkay_Reset", "", flags)
		SetCursorPosition(8)
		If ( moaState.getValue() == 1 ) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRestoreItems = AddTextOption("$mrt_MarkofArkay_RestoreItems", "", flags )
		SetCursorPosition(10)
		AddHeaderOption("")
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		If ( PlayerRef.HasSpell(MoveCustomMarker ) || PlayerRef.HasSpell(RecallMarker ) )
			oidToggleSpells = AddTextOption("$mrt_MarkofArkay_ToggleSpells1", "", flags) 
		Else
			oidToggleSpells = AddTextOption("$mrt_MarkofArkay_ToggleSpells2", "", flags) 
		EndIf
		SetCursorPosition(14)
		If ( PlayerRef.HasSpell(RevivalPower) || PlayerRef.HasSpell(SacrificePower) )
			oidTogglePowers = AddTextOption("$mrt_MarkofArkay_TogglePowers1", "", flags) 
		Else
			oidTogglePowers = AddTextOption("$mrt_MarkofArkay_TogglePowers2", "", flags) 
		EndIf
		SetCursorPosition(16)
		sResetHistory = ""
		oidResetHistory = AddTextOption("$mrt_MarkofArkay_ResetHistory", sResetHistory, flags)
		SetCursorPosition(18)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDisableUnsafe = AddToggleOption("$mrt_MarkofArkay_DisableUnsafe", bDisableUnsafe, flags)
		SetCursorPosition(20)
		oidLogging = AddToggleOption("$mrt_MarkofArkay_Logging", bIsLoggingEnabled, flags )
		SetCursorPosition(22)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidInformation = AddToggleOption("$mrt_MarkofArkay_Info", bIsInfoEnabled, flags )
		SetCursorPosition(24)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidNotification = AddToggleOption("$mrt_MarkofArkay_Notification", bIsNotificationEnabled, flags )
		SetCursorPosition(26)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRagdollEffect = AddToggleOption("$mrt_MarkofArkay_RagdollEffect", bIsRagdollEnabled,flags)
		SetCursorPosition(28)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidFadeToBlack = AddToggleOption("$mrt_MarkofArkay_FadeToBlack", bFadeToBlack, flags )
		SetCursorPosition(30)
		oidInvisibility = AddToggleOption("$mrt_MarkofArkay_Invisibility", bInvisibility, flags)
		SetCursorPosition(32)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDeathEffect = AddToggleOption("$mrt_MarkofArkay_DeathEffect", bDeathEffect,flags)		
		SetCursorPosition(34)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && bARCCOK
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidAltEyeFix = AddToggleOption("$mrt_MarkofArkay_AltEyeFix", bAltEyeFix, flags)
		SetCursorPosition(36)
		AddHeaderOption("$mrt_MarkofArkay_Locks")
		SetCursorPosition(38)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bTradeLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTradeLock = AddToggleOption("$mrt_MarkofArkay_TradeLock",bTradeLock,flags)
		SetCursorPosition(40)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && !bCurseLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidCurseLock = AddToggleOption("$mrt_MarkofArkay_CurseLock",bCurseLock,flags)
		SetCursorPosition(42)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bSaveLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSaveLock = AddToggleOption("$mrt_MarkofArkay_SaveLock",bSaveLock,flags)
		SetCursorPosition(44)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bLootChanceLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLootChanceLock = AddToggleOption("$mrt_MarkofArkay_LootChanceLock",bLootChanceLock,flags)
		SetCursorPosition(46)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bMarkRecallCostLock
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkRecallCostLock = AddToggleOption("$mrt_MarkofArkay_MarkRecallCostLock",bMarkRecallCostLock,flags)
		SetCursorPosition(48)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bRespawnCounter
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnCounter = AddSliderOption("$mrt_MarkofArkay_RespawnCounter1", fRespawnCounterSlider, "$mrt_MarkofArkay_RespawnCounter2", flags)
		SetCursorPosition(50)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bLockPermaDeath && bPUOK
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLockPermaDeath = AddToggleOption("$mrt_MarkofArkay_PermaDeathLock",bLockPermaDeath,flags)
		SetCursorPosition(1)
		If  ( iNotTradingAftermath == 1 && !ReviveScript.RespawnScript.bCanTeleport() )
			AddHeaderOption("$mrt_MarkofArkay_HEAD_CanNotRespawn")
		Else
			AddHeaderOption("")
		EndIf
		SetCursorPosition(3)
		flags = OPTION_FLAG_DISABLED
		String sText
		Int iCount
		If bIsInfoEnabled
			iCount = LostItemsChest.GetNumItems()
			If iCount <= 999999
				sText = iCount As String
				If iCount > 0 && bUIEOK
					flags = OPTION_FLAG_NONE
				Else
					flags = OPTION_FLAG_DISABLED
				EndIf
			Else
				sText = "+999999"
			EndIf
		Else
			sText = "$Disabled"
		EndIf
		oidLostItemsInfo = AddTextOption("$mrt_MarkofArkay_Cur_Lost_Items", sText, flags)
		SetCursorPosition(5)
		flags = OPTION_FLAG_DISABLED
		If bIsInfoEnabled
			iCount = ReviveScript.SkillScript.iGetReducedSkillsCount(False)
			sText = iCount As String
			If iCount > 0 && bUIEOK
				flags = OPTION_FLAG_NONE
			EndIf
		Else
			sText = "$Disabled"
		EndIf
		oidLostSkillsInfo = AddTextOption("$mrt_MarkofArkay_LostSkillsInfo", sText, flags)
		SetCursorPosition(7)
		flags = OPTION_FLAG_DISABLED
		If bIsInfoEnabled
			sText = ReviveScript.ItemScript.fLostSouls As Int
		Else
			sText = "$Disabled"
		EndIf
		AddTextOption("$mrt_MarkofArkay_Lost_Dragon_Souls", sText, flags)		
		SetCursorPosition(9)
		AddHeaderOption("")
		SetCursorPosition(11)
		flags = OPTION_FLAG_DISABLED
		If ( moaState.getValue() == 1 ) && bIsInfoEnabled
			If iTeleportLocation < getRandCityRPIndex()
				If (MarkerList.GetAt(iTeleportLocation) As Objectreference)
					Float fDistance = PlayerRef.GetDistance(MarkerList.GetAt(iTeleportLocation) As Objectreference)
					If fDistance
						If fDistance <= 999999
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
						Else
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
						EndIf
					Else
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
					EndIf
				Else
					AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
				EndIf
			ElseIf (iTeleportLocation == getSleepRPIndex())
				If ( SleepMarker && !SleepMarker.Isdisabled() )
					Float fDistance = PlayerRef.GetDistance(SleepMarker)
					If fDistance
						If fDistance <= 999999
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
						Else
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
						EndIf
					Else
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
					EndIf
				Else
					AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
				EndIf
			ElseIf (iTeleportLocation == getCustomRPIndex())
				Float fDistance
				If (CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference).IsEnabled()
					fDistance = PlayerRef.GetDistance((CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference))
				EndIf
				If fDistance
					If fDistance <= 999999
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
					Else
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
					EndIf
				Else
					AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
				EndIf
			ElseIf (iTeleportLocation == getExternalRPIndex()) && (ExternalMarkerList.GetSize() > 1) && (iExternalIndex != -1)
				ObjectReference ExtMarker = ExternalMarkerList.GetAt(iExternalIndex) As ObjectReference
				If ( ExtMarker && !ExtMarker.Isdisabled() )
					Float fDistance = PlayerRef.GetDistance(ExtMarker)
					If fDistance
						If fDistance <= 999999
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
						Else
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
						EndIf
					Else
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
					EndIf
				Else
					AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
				EndIf
			ElseIf (iTeleportLocation == getExternalRPIndex()) && (ExternalMarkerList.GetSize() == 1)
				ObjectReference ExtMarker = ExternalMarkerList.GetAt(0) As ObjectReference
				If ( ExtMarker && !ExtMarker.Isdisabled() )
					Float fDistance = PlayerRef.GetDistance(ExtMarker)
					If fDistance
						If fDistance <= 999999
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
						Else
							AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
						EndIf
					Else
						AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
					EndIf
				Else
					AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
				EndIf
			Else
				AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Unknown", flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "$Disabled", flags)
		EndIf
		SetCursorPosition(13)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalBleedOut > 99999999
				AddTextOption("$Bleedouts", "+99999999", flags)
			Else
				AddTextOption("$Bleedouts", iTotalBleedOut, flags)
			EndIf
		Else
			AddTextOption("$Bleedouts", "$Disabled", flags)
		EndIf
		SetCursorPosition(15)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalRevives > 99999999
				AddTextOption("$Revivals", "+99999999", flags)
			Else
				AddTextOption("$Revivals", iTotalRevives, flags)
			EndIf
		Else
			AddTextOption("$Revivals", "$Disabled", flags)
		EndIf
		SetCursorPosition(17)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByFollower > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", iRevivesByFollower, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "$Disabled", flags)
		EndIf
		SetCursorPosition(19)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByPotion > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", iRevivesByPotion, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "$Disabled", flags)
		EndIf
		SetCursorPosition(21)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByRevivalSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", iRevivesByRevivalSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(23)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesBySacrificeSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", iRevivesBySacrificeSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(25)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByTrade > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", iRevivesByTrade, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "$Disabled", flags)
		EndIf
		SetCursorPosition(27)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalRespawn > 99999999
				AddTextOption("$Respawns", "+99999999", flags)
			Else
				AddTextOption("$Respawns", iTotalRespawn, flags)
			EndIf
		Else
			AddTextOption("$Respawns", "$Disabled", flags)
		EndIf
		SetCursorPosition(29)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iDestroyedItems > 99999999
				AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Destroyed_Items", iDestroyedItems, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "$Disabled", flags)
		EndIf
	ElseIf (page == "$Presets")
		SetCursorPosition(0)
		AddHeaderOption("$Presets")
		SetCursorPosition(2)
		If moaState.getValue() == 1 && bFISSOK && !bIsLocked()
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoadPreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sGetPresets()[iLoadPreset], flags)
		SetCursorPosition(3)
		If moaState.getValue() == 1 && bFISSOK
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSavePreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sGetPresets()[iSavePreset], flags)
		SetCursorPosition(4)
		If moaState.getValue() == 1 && bFISSOK && !bIsLocked()
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoadPreset1 = AddTextOption("$mrt_MarkofArkay_Load_Preset", "", flags)
		SetCursorPosition(5)
		If moaState.getValue() == 1 && bFISSOK
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSavePreset1 = AddTextOption("$mrt_MarkofArkay_Save_Preset", "", flags)
		SetCursorPosition(8)
		If moaState.getValue() == 1 && !bIsLocked()
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoadDefaultPreset = AddTextOption("$mrt_MarkofArkay_Load_Default_Preset", "", flags)
	EndIf
EndEvent

Event OnOptionSelect(Int option)
	string page = CurrentPage
	If (option == oidRevivalEnabled)
		bIsRevivalEnabled = !bIsRevivalEnabled
		SetToggleOptionValue(oidRevivalEnabled, bIsRevivalEnabled)
		ForcePageReset()
	ElseIf (option == oidMenuEnabled)
		bIsMenuEnabled = !bIsMenuEnabled
		SetToggleOptionValue(oidMenuEnabled, bIsMenuEnabled)
		If  ( bIsRevivalEnabled ) && ( !bIsMenuEnabled )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags)
	ElseIf (option == oidMarkOfArkayRevivalEnabled)
		bIsMarkEnabled = !bIsMarkEnabled
		SetToggleOptionValue(oidMarkOfArkayRevivalEnabled, bIsMarkEnabled)
	ElseIf (option == oidDragonSoulRevivalEnabled)
		bIsDragonSoulEnabled = !bIsDragonSoulEnabled
		SetToggleOptionValue(oidDragonSoulRevivalEnabled, bIsDragonSoulEnabled)
	ElseIf (option == oidBSoulGemRevivalEnabled)
		bIsBSoulGemEnabled = !bIsBSoulGemEnabled
		SetToggleOptionValue(oidBSoulGemRevivalEnabled, bIsBSoulGemEnabled)
	ElseIf (option == oidGSoulGemRevivalEnabled)
		bIsGSoulGemEnabled = !bIsGSoulGemEnabled
		SetToggleOptionValue(oidGSoulGemRevivalEnabled, bIsGSoulGemEnabled)
	ElseIf (option == oidTradeEnabled)
		bIsTradeEnabled = !bIsTradeEnabled
		SetToggleOptionValue(oidTradeEnabled, bIsTradeEnabled)
	ElseIf (option == oidTriggerOnBleedout)
		If !bTriggerOnBleedout && self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
			moaIsBusy.SetValueInt(1)
			bTriggerOnBleedout = True
			bTriggerOnHealthPerc = False
			ForceCloseMenu()
			setTriggerMethod(1)
			moaIsBusy.SetValueInt(0)
		EndIf
	ElseIf (option == oidTriggerOnHealthPerc)
		If !bTriggerOnHealthPerc && self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
			moaIsBusy.SetValueInt(1)
			bTriggerOnBleedout = False
			bTriggerOnHealthPerc = True
			ForceCloseMenu()
			SetTriggerMethod(2)
			moaIsBusy.SetValueInt(0)
		EndIf
	ElseIf (option == oidTradeLock)
		If !bTradeLock && self.ShowMessage("$Are_You_Sure_Lock_Trade", true, "$Yes", "$No")
			bTradeLock = True
			ForcePageReset()
		EndIf
	ElseIf (option == oidCurseLock)
		If !bCurseLock && self.ShowMessage("$Are_You_Sure_Lock_Curse", true, "$Yes", "$No")
			bCurseLock = True
			ForcePageReset()
		EndIf
	ElseIf (option == oidMarkRecallCostLock)
		If !bMarkRecallCostLock && self.ShowMessage("$Are_You_Sure_Lock_MarkRecallCost", true, "$Yes", "$No")
			bMarkRecallCostLock = True
			ForcePageReset()
		EndIf
	ElseIf (option == oidLootChanceLock)
		If !bLootChanceLock && self.ShowMessage("$Are_You_Sure_Lock_LootChance", true, "$Yes", "$No")
			bLootChanceLock = True
			ForcePageReset()
		EndIf
	ElseIf (option == oidLockPermaDeath)
		If !bLockPermaDeath && self.ShowMessage("$Are_You_Sure_Lock_Death", true, "$Yes", "$No")
			bLockPermaDeath = True
			bCanbeKilledbyUnarmed = False
			bKillIfCantRespawn = False
			ForcePageReset()
		EndIf
	ElseIf (option == oidSaveLock)
		If !bSaveLock && self.ShowMessage("$Are_You_Sure_Lock_SaveLock", true, "$Yes", "$No")
			bSaveLock = True
			ForcePageReset()
		EndIf
	ElseIf (option == oidGoldRevivalEnabled)
		bIsGoldEnabled = !bIsGoldEnabled
		SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
	ElseIf (option == oidFollowerProtectPlayer)
		bFollowerProtectPlayer = !bFollowerProtectPlayer
		SetToggleOptionValue(oidFollowerProtectPlayer, bFollowerProtectPlayer)
	ElseIf (option == oidPlayerProtectFollower)
		bPlayerProtectFollower = !bPlayerProtectFollower
		SetToggleOptionValue(oidPlayerProtectFollower, bPlayerProtectFollower)
	ElseIf (option == oidSpawnByLocation)
		bSpawnByLocation = !bSpawnByLocation
		SetToggleOptionValue(oidSpawnByLocation, bSpawnByLocation)
		ForcePageReset()
	ElseIf (option == oidRetrySpawnWithoutLocation)
		bRetrySpawnWithoutLocation = !bRetrySpawnWithoutLocation
		SetToggleOptionValue(oidRetrySpawnWithoutLocation, bRetrySpawnWithoutLocation)
	ElseIf (option == oidSpawnCheckRelation)
		bSpawnCheckRelation = !bSpawnCheckRelation
		SetToggleOptionValue(oidSpawnCheckRelation, bSpawnCheckRelation)
	ElseIf (option == oidSpawnBringAllies)
		bSpawnBringAllies = !bSpawnBringAllies
		SetToggleOptionValue(oidSpawnBringAllies, bSpawnBringAllies)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = !bIsNotificationEnabled
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
	ElseIf (option == oidFadeToBlack)
		bFadeToBlack = !bFadeToBlack
		SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
		If !bFadeToBlack
			ReviveScript.Fadeout.Remove()
			ReviveScript.FastFadeOut.Remove()
			ReviveScript.BlackScreen.Remove()
			ReviveScript.FadeIn.Remove()
		EndIf
	ElseIf (option == oidInvisibility)
		bInvisibility = !bInvisibility
		SetToggleOptionValue(oidInvisibility, bInvisibility)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
		If !bInvisibility
			PlayerRef.SetAlpha(1.0)
		EndIf
	ElseIf (option == oidDeathEffect)
		bDeathEffect = !bDeathEffect
		SetToggleOptionValue(oidDeathEffect, bDeathEffect)
	ElseIf (option == oidRagdollEffect)
		bIsRagdollEnabled = !bIsRagdollEnabled
		SetToggleOptionValue(oidRagdollEffect, bIsRagdollEnabled)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
	ElseIf (option == oidAltEyeFix)
		bAltEyeFix = !bAltEyeFix
		SetToggleOptionValue(oidAltEyeFix,bAltEyeFix)
		If bAltEyeFix
			ForceCloseMenu()
			ReviveScript.ExecuteCommand("player.say 0142b5",1,0,1)
		EndIf
	ElseIf (option == oidDisableUnsafe)
		bDisableUnsafe = !bDisableUnsafe
		If bDisableUnsafe
			bLoseForever = False
			bLoseSkillForever = False
			fRespawnTimeSlider = 0.0
		EndIf
		SetToggleOptionValue(oidDisableUnsafe,bDisableUnsafe)
		ForcePageReset()
	ElseIf (option == oidLogging)
		bIsLoggingEnabled = !bIsLoggingEnabled
		SetToggleOptionValue(oidLogging, bIsLoggingEnabled)
	ElseIf (option == oidPotionRevivalEnabled)
		bIsPotionEnabled = !bIsPotionEnabled
		SetToggleOptionValue(oidPotionRevivalEnabled, bIsPotionEnabled)
	ElseIf (option == oidAutoDrinkPotion)
		bAutoDrinkPotion = !bAutoDrinkPotion
		SetToggleOptionValue(oidAutoDrinkPotion, bAutoDrinkPotion)
	ElseIf (option == oidNoFallDamageEnabled)
		ToggleFallDamage(!bIsNoFallDamageEnabled)
		SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
	ElseIf (option == oidEffect)
		bIsEffectEnabled = !bIsEffectEnabled
		SetToggleOptionValue(oidEffect, bIsEffectEnabled)
	ElseIf (option == oidRevivalRequireBlessing)
		bIsRevivalRequiresBlessing = !bIsRevivalRequiresBlessing
		SetToggleOptionValue(oidRevivalRequireBlessing, bIsRevivalRequiresBlessing)
	ElseIf (option == oidRecallRestriction)
		bIsRecallRestricted = !bIsRecallRestricted
		SetToggleOptionValue(oidRecallRestriction,bIsRecallRestricted)
	ElseIf (option == oidShiftBack )
		bShiftBack = !bShiftBack
		SetToggleOptionValue(oidShiftBack,bShiftBack)
	ElseIf (option == oidShiftBackRespawn )
		bShiftBackRespawn = !bShiftBackRespawn
		SetToggleOptionValue(oidShiftBackRespawn,bShiftBackRespawn)
	ElseIf (option == oidExternalTeleportLocation)
		iExternalIndex += 1
		If iExternalIndex >= ExternalMarkerList.GetSize()
			iExternalIndex = -1
		EndIf
		If iExternalIndex == -1
			SetTextOptionValue(option, "$Random")
		Else
			SetTextOptionValue(option, ( (iExternalIndex + 1) As String ))
		EndIf
	ElseIf (option == oidRespawnPoint0)
		bRespawnPointsFlags[0] = !bRespawnPointsFlags[0]
		SetToggleOptionValue(oidRespawnPoint0,bRespawnPointsFlags[0])
	ElseIf (option == oidRespawnPoint1)
		bRespawnPointsFlags[1] = !bRespawnPointsFlags[1]
		SetToggleOptionValue(oidRespawnPoint1,bRespawnPointsFlags[1])
	ElseIf (option == oidRespawnPoint2)
		bRespawnPointsFlags[2] = !bRespawnPointsFlags[2]
		SetToggleOptionValue(oidRespawnPoint2,bRespawnPointsFlags[2])
	ElseIf (option == oidRespawnPoint3)
		bRespawnPointsFlags[3] = !bRespawnPointsFlags[3]
		SetToggleOptionValue(oidRespawnPoint3,bRespawnPointsFlags[3])
	ElseIf (option == oidRespawnPoint4)
		bRespawnPointsFlags[4] = !bRespawnPointsFlags[4]
		SetToggleOptionValue(oidRespawnPoint4,bRespawnPointsFlags[4])
	ElseIf (option == oidRespawnPoint5)
		bRespawnPointsFlags[5] = !bRespawnPointsFlags[5]
		SetToggleOptionValue(oidRespawnPoint5,bRespawnPointsFlags[5])
	ElseIf (option == oidRespawnPoint6)
		bRespawnPointsFlags[6] = !bRespawnPointsFlags[6]
		SetToggleOptionValue(oidRespawnPoint6,bRespawnPointsFlags[6])
	ElseIf (option == oidRespawnPoint7)
		bRespawnPointsFlags[7] = !bRespawnPointsFlags[7]
		SetToggleOptionValue(oidRespawnPoint7,bRespawnPointsFlags[7])
	ElseIf (option == oidRespawnNaked)
		bRespawnNaked = !bRespawnNaked
		SetToggleOptionValue(oidRespawnNaked, bRespawnNaked)
	ElseIf (option == oidCorpseAsSoulMark)
		bCorpseAsSoulMark = !bCorpseAsSoulMark
		SetToggleOptionValue(oidCorpseAsSoulMark, bCorpseAsSoulMark)
	ElseIf (option == oidRespawnMenu)
		bRespawnMenu = !bRespawnMenu
		SetToggleOptionValue(oidRespawnMenu, bRespawnMenu)
	ElseIf (option == oidTeleportMenu)
		bTeleportMenu = !bTeleportMenu
		SetToggleOptionValue(oidTeleportMenu, bTeleportMenu)
	ElseIf (option == oidMultipleDis)
		bMultipleDis = !bMultipleDis
		SetToggleOptionValue(oidMultipleDis, bMultipleDis)
	ElseIf (option == oidDiseaseCurse)
		bDiseaseCurse = !bDiseaseCurse
		SetToggleOptionValue(oidDiseaseCurse, bDiseaseCurse)
		ForcePageReset()
	ElseIf (option == oidMultipleDisProg)
		bMultipleDisProg = !bMultipleDisProg
		SetToggleOptionValue(oidMultipleDisProg, bMultipleDisProg)
	ElseIf (option == oidOnlyInfectIfHasBaseDis)
		bOnlyInfectIfHasBaseDis = !bOnlyInfectIfHasBaseDis
		SetToggleOptionValue(oidOnlyInfectIfHasBaseDis, bOnlyInfectIfHasBaseDis)
	ElseIf (option == oidCureDisIfHasBlessing)
		bCureDisIfHasBlessing = !bCureDisIfHasBlessing
		moaCureDisIfHasBlessing.SetValue(bCureDisIfHasBlessing As Int)
		SetToggleOptionValue(oidCureDisIfHasBlessing, bCureDisIfHasBlessing)
	ElseIf (option == oidJail)
		bSendToJail = !bSendToJail
		SetToggleOptionValue(oidJail, bSendToJail)
	ElseIf (option == oidDoNotStopCombat)
		bDoNotStopCombat = !bDoNotStopCombat
		SetToggleOptionValue(oidDoNotStopCombat, bDoNotStopCombat)
	ElseIf (option == oidDoNotStopCombatAfterRevival)
		bDoNotStopCombatAfterRevival = !bDoNotStopCombatAfterRevival
		SetToggleOptionValue(oidDoNotStopCombatAfterRevival, bDoNotStopCombatAfterRevival)
	ElseIf (option == oidKillIfCantRespawn)
		bKillIfCantRespawn = !bKillIfCantRespawn
		SetToggleOptionValue(oidKillIfCantRespawn, bKillIfCantRespawn)
	ElseIf (option == oidCanbeKilledbyUnarmed)
		bCanbeKilledbyUnarmed = !bCanbeKilledbyUnarmed
		SetToggleOptionValue(oidCanbeKilledbyUnarmed, bCanbeKilledbyUnarmed)
	ElseIf (option == oidLoseSkillForever)
		bLoseSkillForever = !bLoseSkillForever
		SetToggleOptionValue(oidLoseSkillForever, bLoseSkillForever)
	ElseIf (option == oidHealActors)
		bHealActors = !bHealActors
		SetToggleOptionValue(oidHealActors, bHealActors)
	ElseIf (option == oidResurrectActors)
		bResurrectActors = !bResurrectActors
		SetToggleOptionValue(oidResurrectActors, bResurrectActors)
	ElseIf (option == oidShowRaceMenu)
		bShowRaceMenu = !bShowRaceMenu
		SetToggleOptionValue(oidShowRaceMenu, bShowRaceMenu)
	ElseIf (option == oidArkayCurse)
		bArkayCurse = !bArkayCurse
		SetToggleOptionValue(oidArkayCurse, bArkayCurse)
		If  ( bIsRevivalEnabled ) && ( iNotTradingAftermath == 1) && ( bArkayCurse )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidTempArkayCurse,flags)
	ElseIf (option == oidTempArkayCurse)
		bIsArkayCurseTemporary = !bIsArkayCurseTemporary
		SetToggleOptionValue(oidTempArkayCurse, bIsArkayCurseTemporary)
	ElseIf (Option == oidSkillReduceRandomVal)
		bSkillReduceRandomVal = !bSkillReduceRandomVal
		SetToggleOptionValue(oidSkillReduceRandomVal, bSkillReduceRandomVal)
		If  ( bIsRevivalEnabled ) && ( iNotTradingAftermath == 1) && (iReducedSkill != 0 && !bSkillReduceRandomVal)
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceValSlider, flags, True)
		If  ( bIsRevivalEnabled ) && ( iNotTradingAftermath == 1) && (iReducedSkill != 0) && bSkillReduceRandomVal
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceMinValSlider, flags, True)
		SetOptionFlags(oidSkillReduceMaxValSlider, flags)	
	ElseIf (option == oidLevelReduce)
		bLevelReduce = !bLevelReduce
		SetToggleOptionValue(oidLevelReduce,bLevelReduce)
		If bLevelReduce
			ReviveScript.SkillScript.RegisterForLevel()
		EndIf
	ElseIf (option == oidOnlyLoseSkillXP)
		bOnlyLoseSkillXP = !bOnlyLoseSkillXP
		SetToggleOptionValue(oidOnlyLoseSkillXP,bOnlyLoseSkillXP)
		ForcePageReset()
	ElseIf (option == oidLoseforever)
		bLoseForever = !bLoseForever
		SetToggleOptionValue(oidLoseforever, bLoseForever)
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = !bLostItemQuest
		SetToggleOptionValue(oidLostItemQuest, bLostItemQuest)
		If bLostItemQuest 
			If ( ( LostItemsChest.GetNumItems() > 0 ) || ( ReviveScript.ItemScript.fLostSouls > 0.0 ) || \
			PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.SkillScript.bSkillReduced() )
				If ( ReviveScript.bSoulMark() )
					If ReviveScript.moaSoulMark01.IsRunning()
						moaRetrieveLostItems.start()
						moaRetrieveLostItems.SetStage(1)
					EndIf
				ElseIf ReviveScript.moaThiefNPC01.IsRunning()
					moaRetrieveLostItems01.start()
					moaRetrieveLostItems01.SetStage(1)
				EndIf
			EndIf
		Else
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
			If ReviveScript.moaThiefNPC01.IsRunning()
				If (ReviveScript.ThiefNPC.GetReference() As Actor)
					(ReviveScript.ThiefNPC.GetReference() As Actor).AddToFaction(ReviveScript.PlayerEnemyFaction)
				EndIf
			EndIf
		EndIf
	ElseIf (option == oidAutoSwitchRP)
		bAutoSwitchRP = !bAutoSwitchRP
		SetToggleOptionValue(oidAutoSwitchRP,bAutoSwitchRP)
	ElseIf (option == oidMoreRandomRespawn)
		bMoreRandomRespawn = !bMoreRandomRespawn
		SetToggleOptionValue(oidMoreRandomRespawn,bMoreRandomRespawn)
	ElseIf (option == oidRandomItemCurse)
		bRandomItemCurse = !bRandomItemCurse
		SetToggleOptionValue(oidRandomItemCurse,bRandomItemCurse)
	ElseIf (option == oidSoulMarkStay)
		bSoulMarkStay = !bSoulMarkStay
		SetToggleOptionValue(oidSoulMarkStay,bSoulMarkStay)
	ElseIf (option == oidCreaturesCanSteal)
		bCreaturesCanSteal = !bCreaturesCanSteal
		moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
		SetToggleOptionValue(oidCreaturesCanSteal,bCreaturesCanSteal)
	ElseIf (option == oidSpawnHostile)
		bSpawnHostile = !bSpawnHostile
		SetToggleOptionValue(oidSpawnHostile,bSpawnHostile)
		ForcePageReset()
	ElseIf (option == oidBossChestOnlyCurLoc)
		bBossChestOnlyCurLoc = !bBossChestOnlyCurLoc
		moaOnlyInCurLocChest.SetValueInt(bBossChestOnlyCurLoc As Int)
		SetToggleOptionValue(oidBossChestOnlyCurLoc,bBossChestOnlyCurLoc)
	ElseIf (option == oidBossChestNotClearedLoc)
		bBossChestNotInClearedLoc = !bBossChestNotInClearedLoc
		moaBossChestNotInclearedLoc.SetValueInt(bBossChestNotInClearedLoc As Int)
		SetToggleOptionValue(oidBossChestNotClearedLoc,bBossChestNotInClearedLoc)
	ElseIf (option == oidAlwaysSpawn)
		bAlwaysSpawn = !bAlwaysSpawn
		SetToggleOptionValue(oidAlwaysSpawn,bAlwaysSpawn)
	ElseIf (option == oidOnlySpawn)
		bOnlySpawn = !bOnlySpawn
		SetToggleOptionValue(oidOnlySpawn,bOnlySpawn)
	ElseIf (option == oidMoralityMatters)
		bMoralityMatters = !bMoralityMatters
		moaMoralityMatters.SetValue(bMoralityMatters As Int)
		SetToggleOptionValue(oidMoralityMatters,bMoralityMatters)
	ElseIf (option == oidLoseItem)
		bLoseItem = !bLoseItem
		SetToggleOptionValue(oidLoseItem,bLoseItem)
		ForcePageReset()
	ElseIf (option == oidLoseOthers)
		bLoseOthers = !bLoseOthers
		SetToggleOptionValue(oidLoseOthers,bLoseOthers)
		ForcePageReset()
	ElseIf (option == oidLoseAmmo)
		bLoseAmmo = !bLoseAmmo
		iValidTypes[6] = iGetType(42,bLoseAmmo)
		SetToggleOptionValue(oidLoseAmmo,bLoseAmmo)
		ForcePageReset()
	ElseIf (option == oidCheckKeyword)
		bCheckKeyword = !bCheckKeyword
		SetToggleOptionValue(oidCheckKeyword,bCheckKeyword)
		ForcePageReset()
	ElseIf (option == oidExcludeQuestItems)
		bExcludeQuestItems = !bExcludeQuestItems
		SetToggleOptionValue(oidExcludeQuestItems,bExcludeQuestItems)
	ElseIf (option == oidCheckWeight)
		bCheckWeight = !bCheckWeight
		SetToggleOptionValue(oidCheckWeight,bCheckWeight)
		ForcePageReset()
	ElseIf (option == oidLoseArkayMark)
		bLoseArkayMark = !bLoseArkayMark
		SetToggleOptionValue(oidLoseArkayMark,bLoseArkayMark)
		ForcePageReset()
	ElseIf (option == oidLoseBlackSoulGem)
		bLoseBlackSoulGem = !bLoseBlackSoulGem
		SetToggleOptionValue(oidLoseBlackSoulGem,bLoseBlackSoulGem)
		ForcePageReset()
	ElseIf (option == oidLoseGrandSoulGem)
		bLoseGrandSoulGem = !bLoseGrandSoulGem
		SetToggleOptionValue(oidLoseGrandSoulGem,bLoseGrandSoulGem)
		ForcePageReset()
	ElseIf (option == oidLoseGold)
		bLoseGold = !bLoseGold
		SetToggleOptionValue(oidLoseGold,bLoseGold)
		ForcePageReset()
	ElseIf (option == oidLoseDragonSoul)
		bLoseDragonSoul = !bLoseDragonSoul
		SetToggleOptionValue(oidLoseDragonSoul,bLoseDragonSoul)
		ForcePageReset()
	ElseIf (option == oidLoseScroll)
		bLoseScroll = !bLoseScroll
		iValidTypes[0] = iGetType(23,bLoseScroll)
		SetToggleOptionValue(oidLoseScroll,bLoseScroll)
		ForcePageReset()
	ElseIf (option == oidLoseBook)
		bLoseBook = !bLoseBook
		iValidTypes[2] = iGetType(27,bLoseBook)
		SetToggleOptionValue(oidLoseBook,bLoseBook)
		ForcePageReset()
	ElseIf (option == oidLoseMisc)
		bLoseMisc = !bLoseMisc
		iValidTypes[4] = iGetType(32,bLoseMisc)
		SetToggleOptionValue(oidLoseMisc,bLoseMisc)
		ForcePageReset()
	ElseIf (option == oidLoseKey)
		bLoseKey = !bLoseKey
		iValidTypes[7] = iGetType(45,bLoseKey)
		SetToggleOptionValue(oidLoseKey,bLoseKey)
		ForcePageReset()
	ElseIf (option == oidLoseIngredient)
		bLoseIngredient = !bLoseIngredient
		iValidTypes[3] = iGetType(30,bLoseIngredient)
		SetToggleOptionValue(oidLoseIngredient,bLoseIngredient)
		ForcePageReset()
	ElseIf (option == oidLosePotion)
		bLosePotion = !bLosePotion
		iValidTypes[8] = iGetType(46,bLosePotion)
		SetToggleOptionValue(oidLosePotion,bLosePotion)
		ForcePageReset()
	ElseIf (option == oidLoseSoulgem)
		bLoseSoulgem = !bLoseSoulgem
		iValidTypes[9] = iGetType(52,bLoseSoulgem)
		SetToggleOptionValue(oidLoseSoulgem,bLoseSoulgem)
		ForcePageReset()
	ElseIf (option == oidLoseArmor)
		bLoseArmor = !bLoseArmor
		iValidTypes[1] = iGetType(26,bLoseArmor)
		SetToggleOptionValue(oidLoseArmor,bLoseArmor)
		ForcePageReset()
	ElseIf (option == oidLoseWeapon)
		bLoseWeapon = !bLoseWeapon
		iValidTypes[5] = iGetType(41,bLoseWeapon)
		SetToggleOptionValue(oidLoseWeapon,bLoseWeapon)
		ForcePageReset()
	ElseIf (option == oidLoseGoldAll)
		bLoseGoldAll = !bLoseGoldAll
		SetToggleOptionValue(oidLoseGoldAll,bLoseGoldAll)
		ForcePageReset()
	ElseIf (option == oidLoseDragonSoulAll)
		bLoseDragonSoulAll = !bLoseDragonSoulAll
		SetToggleOptionValue(oidLoseDragonSoulAll,bLoseDragonSoulAll)
		ForcePageReset()
	ElseIf (option == oidLoseBlackSoulGemAll)
		bLoseBlackSoulGemAll = !bLoseBlackSoulGemAll
		SetToggleOptionValue(oidLoseBlackSoulGemAll,bLoseBlackSoulGemAll)
		ForcePageReset()
	ElseIf (option == oidLoseGrandSoulGemAll)
		bLoseGrandSoulGemAll = !bLoseGrandSoulGemAll
		SetToggleOptionValue(oidLoseGrandSoulGemAll,bLoseGrandSoulGemAll)
		ForcePageReset()
	ElseIf (option == oidLoseArkayMarkAll)
		bLoseArkayMarkAll = !bLoseArkayMarkAll
		SetToggleOptionValue(oidLoseArkayMarkAll,bLoseArkayMarkAll)
		ForcePageReset()
	ElseIf (option == oidInformation)
		bIsInfoEnabled = !bIsInfoEnabled
		SetToggleOptionValue(oidInformation,bIsInfoEnabled)
		ForcePageReset()
	ElseIf (option == oidLostItemsInfo)
		If !bUIEOK
			Return
		EndIf
		ShowLostItems()
	ElseIf (option == oidLostSkillsInfo)
		If !bUIEOK
			Return
		EndIf
		ShowLostSkills()
	ElseIf (option == oidTogglePowers)
		If ( PlayerRef.HasSpell(RevivalPower) || PlayerRef.HasSpell(SacrificePower) )
			PlayerRef.RemoveSpell(RevivalPower)
			PlayerRef.RemoveSpell(SacrificePower)
		Else
			PlayerRef.AddSpell(RevivalPower)
			PlayerRef.AddSpell(SacrificePower)
		EndIf
		ForcePageReset()
	ElseIf (option == oidToggleSpells)
		If ( PlayerRef.HasSpell(MoveCustomMarker ) || PlayerRef.HasSpell(RecallMarker) )
			PlayerRef.RemoveSpell(MoveCustomMarker )
			PlayerRef.RemoveSpell(RecallMarker )
		Else
			PlayerRef.AddSpell(MoveCustomMarker )
			PlayerRef.AddSpell(RecallMarker )
		EndIf
		ForcePageReset()
	ElseIf (option == oidResetHistory)
		If sResetHistory == ""
			sResetHistory = "$Are_You_Sure"
			SetTextOptionValue(option, sResetHistory)
		Else
			sResetHistory = ""
			SetTextOptionValue(option, sResetHistory)
			iTotalBleedOut = 0
			iTotalRespawn = 0
			iTotalRevives = 0
			iRevivesByTrade = 0
			iRevivesByRevivalSpell = 0
			iRevivesBySacrificeSpell = 0
			iRevivesByPotion = 0
			iRevivesByFollower = 0
			iDestroyedItems = 0
			ForcePageReset()
		EndIf
	ElseIf (option == oidRestoreItems)
		If !self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
			Return
		EndIf
		moaIsBusy.SetValueInt(1)
		ForceCloseMenu()
		ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
		If moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
		If moaRetrieveLostItems01.IsRunning()
			moaRetrieveLostItems01.SetStage(20)
		EndIf
		moaIsBusy.SetValueInt(0)
	ElseIf (option == oidLoadPreset1)
		If !FISSFactory.getFISS()
			ShowMessage("$mrt_MarkofArkay_MESG_FISS_Error", False)
			Return
		EndIf
		String fName = "MarkofArkayUserSettings" + (iLoadPreset + 1) + ".xml"
		If ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset", True, "$Yes", "$No")
			If bLoadUserSettings(fName)
				ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset_Success", False)
			Else
				ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset_Failure", False)
			EndIf
		EndIf
		ForcePageReset()
	ElseIf (option == oidSavePreset1)
		FISSInterface fiss = FISSFactory.getFISS()
		If !fiss
			ShowMessage("$mrt_MarkofArkay_MESG_FISS_Error", False)
			Return
		EndIf
		String fName = "MarkofArkayUserSettings" + (iSavePreset + 1) + ".xml"
		fiss.beginLoad(fName)
		If fiss.endLoad() == ""
			If !ShowMessage("$mrt_MarkofArkay_MESG_Already_Preset", True, "$Yes", "$No")
				Return
			EndIf
		EndIf
		If bSaveUserSettings(fName)
			ShowMessage("$mrt_MarkofArkay_MESG_Save_Preset_Success", False)
		Else
			ShowMessage("$mrt_MarkofArkay_MESG_Save_Preset_Failure", False)
		EndIf
		ForcePageReset()
	ElseIf (option == oidLoadDefaultPreset)
		If ShowMessage("$mrt_MarkofArkay_MESG_Load_Default_Preset", True, "$Yes", "$No")
			LoadDefaultSettings()
			ShowMessage("$mrt_MarkofArkay_MESG_Load_Default_Preset_Finish", False)
		EndIf
		ForcePageReset()
	ElseIf (option == oidStatus)
		If moaState.GetValue() == 1
			If !self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
				Return
			EndIf
		EndIf
		moaIsBusy.SetValueInt(1)
		ForceCloseMenu()
		If moaState.getValue() == 1
			moaStop()
		Else
			moaStart()
		EndIf
		Utility.Wait(1)
		moaIsBusy.SetValueInt(0)
	ElseIf (option == oidReset)
		If !self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
			Return
		EndIf
		moaIsBusy.SetValueInt(1)
		ForceCloseMenu()
		moaStop(True)
		Utility.Wait(1)
		moaStart()
		moaIsBusy.SetValueInt(0)
	ElseIf (option == oidResetPlayer)
		If !self.ShowMessage("$Are_You_Sure", true, "$Yes", "$No")
			Return
		EndIf
		moaIsBusy.SetValueInt(1)
		ForceCloseMenu()
		If moaState.GetValue() == 1
			If bTriggerOnBleedout
				setTriggerMethod(1)
			ElseIf bTriggerOnHealthPerc
				SetTriggerMethod(2)
			EndIf
			ReviveScript.RegisterForSleep()
			If bLevelReduce
				ReviveScript.SkillScript.RegisterForLevel()
			EndIf
		Else
			setTriggerMethod(0)
		EndIf
		PlayerRef.SetAlpha(1.0)
		PlayerRef.DispelSpell(ReviveScript.Bleed)
		PlayerRef.RemoveSpell(ReviveScript.Bleed)
		PlayerRef.ResetHealthAndLimbs()
		If PlayerRef.GetActorValue("paralysis")
			PlayerRef.SetActorValue("paralysis",0)
			If PlayerRef.GetActorValue("paralysis")
				PlayerRef.ForceActorValue("paralysis",0)
			EndIf
		EndIf
		ReviveScript.RefreshFace()
		If PlayerRef.IsSwimming()
			Debug.SendAnimationEvent(PlayerRef, "SwimStart")
		Else
			Debug.SendAnimationEvent(PlayerRef, "SwimStop")
		EndIf
		PlayerRef.DispelAllSpells()
		PlayerRef.ClearExtraArrows()
		ReviveScript.LowHealthImod.Remove()
		Game.EnablePlayerControls()
		Game.EnableFastTravel(True)
		PlayerRef.RemovePerk(ReviveScript.Invulnerable)
		Debug.SetGodMode(False)
		PlayerRef.SetGhost(False)
		Utility.Wait(0.5)
		Game.ForceThirdPerson()
		moaIsBusy.SetValueInt(0)
	EndIf
EndEvent

Event OnOptionSliderOpen(Int option)
	string page = CurrentPage
	If (option == oidDragonSoulSlider)
		SetSliderDialogStartValue(fValueSoulSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMarkSlider)
		SetSliderDialogStartValue(fValueMarkSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidBSoulGemSlider)
		SetSliderDialogStartValue(fValueBSoulGemSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidGSoulGemSlider)
		SetSliderDialogStartValue(fValueGSoulGemSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidGoldSlider)
		SetSliderDialogStartValue(fValueGoldSlider)
		SetSliderDialogDefaultValue(1000.0)
		SetSliderDialogRange(0.0, 100000.0)
		SetSliderDialogInterval(250.0)
	ElseIf (option == oidDragonSoulPSlider)
		SetSliderDialogStartValue(fDragonSoulPSlider)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMarkPSlider)
		SetSliderDialogStartValue(fMarkPSlider)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidBSoulGemPSlider)
		SetSliderDialogStartValue(fBSoulgemPSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidGSoulGemPSlider)
		SetSliderDialogStartValue(fGSoulgemPSlider)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidGoldPSlider)
		SetSliderDialogStartValue(fGoldPSlider)
		SetSliderDialogDefaultValue(4.0)
		SetSliderDialogRange(1.0, 5.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidRecoveryTime)
		SetSliderDialogStartValue(fRecoveryTimeSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0, 20.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidBleedoutTime)
		SetSliderDialogStartValue(fBleedoutTimeSlider)
		SetSliderDialogDefaultValue(6.0)
		SetSliderDialogRange(3.0, 20.0)
		SetSliderDialogInterval(1.0)	
	ElseIf (option == oidLootChanceSlider)
		SetSliderDialogStartValue(fLootChanceSlider)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidScrollChanceSlider)
		SetSliderDialogStartValue(fScrollChanceSlider)
		SetSliderDialogDefaultValue(25.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf(option == oidRecallCost)
		SetSliderDialogStartValue(fRecallCastSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf(option == oidMarkCost)
		SetSliderDialogStartValue(fMarkCastSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf(option == oidRPMinDistanceSlider)
		SetSliderDialogStartValue(fRPMinDistanceSlider)
		SetSliderDialogDefaultValue(2000.0)
		SetSliderDialogRange(0.0, 10000.0)
		SetSliderDialogInterval(250.0)
	ElseIf(option == oidDisChanceSlider)
		SetSliderDialogStartValue(fDisChanceSlider)
		SetSliderDialogDefaultValue(25.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf(option == oidDisProgChanceSlider)
		SetSliderDialogStartValue(fDisProgChanceSlider)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf(option == oidDisPriceSlider)
		SetSliderDialogStartValue(fDisPriceSlider)
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(0.0, 10000.0)
		SetSliderDialogInterval(25)
	ElseIf(option == oidDisPriceMultSlider)
		SetSliderDialogStartValue(fDisPriceMultSlider)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf (option == oidSnoozeSlider)
		SetSliderDialogStartValue(fValueSnoozeSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 60.0)
		SetSliderDialogInterval(5.0)
	ElseIf (option == oidSkillReduceValSlider)
		SetSliderDialogStartValue(fSkillReduceValSlider)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidSkillReduceMaxValSlider)
		SetSliderDialogStartValue(fSkillReduceMaxValSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 99.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidSkillReduceMinValSlider)
		SetSliderDialogStartValue(fSkillReduceMinValSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 99.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMinLoseGoldSlider)
		SetSliderDialogStartValue(fMinLoseGoldSlider)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100000.0)
		SetSliderDialogInterval(50.0)
	ElseIf (option == oidMaxLoseGoldSlider)
		SetSliderDialogStartValue(fMaxLoseGoldSlider)
		SetSliderDialogDefaultValue(250.0)
		SetSliderDialogRange(0.0, 100000.0)
		SetSliderDialogInterval(50.0)
	ElseIf (option == oidMinLoseArkayMarkSlider)
		SetSliderDialogStartValue(fMinLoseArkayMarkSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMaxLoseArkayMarkSlider)
		SetSliderDialogStartValue(fMaxLoseArkayMarkSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMinLoseDragonSoulSlider)
		SetSliderDialogStartValue(fMinLoseDragonSoulSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMaxLoseDragonSoulSlider)
		SetSliderDialogStartValue(fMaxLoseDragonSoulSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMinLoseBlackSoulGemSlider)
		SetSliderDialogStartValue(fMinLoseBlackSoulGemSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMaxLoseBlackSoulGemSlider)
		SetSliderDialogStartValue(fMaxLoseBlackSoulGemSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMinLoseGrandSoulGemSlider)
		SetSliderDialogStartValue(fMinLoseGrandSoulGemSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidMaxLoseGrandSoulGemSlider)
		SetSliderDialogStartValue(fMaxLoseGrandSoulGemSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidLoseOtherMinValueSlider)
		SetSliderDialogStartValue(fLoseOtherMinValueSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidLoseOtherTotalValueSlider)
		SetSliderDialogStartValue(fLoseOtherTotalValueSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1000000.0)
		SetSliderDialogInterval(25.0)
	ElseIf (option == oidMaxItemsToCheckSlider)
		SetSliderDialogStartValue(fMaxItemsToCheckSlider)
		SetSliderDialogDefaultValue(1000.0)
		SetSliderDialogRange(0.0, 1000000.0)
		SetSliderDialogInterval(10.0)
	ElseIf (option == oidRespawnCounter)
		SetSliderDialogStartValue(100)
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidBossChestChanceSlider)
		SetSliderDialogStartValue(fBossChestChanceSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)	
	ElseIf (option == oidRespawnTimeSlider)
		SetSliderDialogStartValue(fRespawnTimeSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 744.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidSpawnCountSlider)
		SetSliderDialogStartValue(iSpawnCounts[iSpawn])
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidTotalCustomRPSlotSlider)
		SetSliderDialogStartValue(fTotalCustomRPSlotSlider)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0,4.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidSpawnWeightSlider)
		SetSliderDialogStartValue(iSpawnWeights[iSpawn])
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidHealthTriggerSlider)
		SetSliderDialogStartValue((fHealthPercTrigger * 100.0) As Int)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(1.0)	
	ElseIf(option == oidMarkScaleSlider)
		SetSliderDialogStartValue(fValueMarkScaleSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)
	ElseIf(option == oidGSoulScaleGemSlider)
		SetSliderDialogStartValue(fValueGSoulGemScaleSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)	
	ElseIf(option == oidBSoulScaleGemSlider)
		SetSliderDialogStartValue(fValueBSoulGemScaleSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)	
	ElseIf(option == oidDragonScaleSoulSlider)
		SetSliderDialogStartValue(fValueSoulScaleSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)	
	ElseIf(option == oidGoldScaleSlider)
		SetSliderDialogStartValue(fValueGoldScaleSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.1)			
	EndIf
EndEvent

Event OnOptionSliderAccept(int option, Float value)
	string page = CurrentPage
	If (option == oidDragonSoulSlider)
		fValueSoulSlider = value
		SetSliderOptionValue(oidDragonSoulSlider, fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2")
	ElseIf (option == oidMarkSlider)
		fValueMarkSlider = value
		SetSliderOptionValue(oidMarkSlider, fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidBSoulGemSlider)
		fValueBSoulGemSlider = value
		SetSliderOptionValue(oidBSoulGemSlider, fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2")
	ElseIf (option == oidGSoulGemSlider)
		fValueGSoulGemSlider = value
		SetSliderOptionValue(oidGSoulGemSlider, fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2")
	ElseIf (option == oidGoldSlider)
		fValueGoldSlider = value
		SetSliderOptionValue(oidGoldSlider, fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2")
	ElseIf (option == oidGoldPSlider)
		fGoldPSlider = value
		SetSliderOptionValue(oidGoldPSlider, fGoldPSlider, "{0}")
	ElseIf (option == oidMarkPSlider)
		fMarkPSlider = value
		SetSliderOptionValue(oidMarkPSlider, fMarkPSlider, "{0}")
	ElseIf (option == oidSnoozeSlider)
		fValueSnoozeSlider = value
		SetSliderOptionValue(oidSnoozeSlider, fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
		If fValueSnoozeSlider > 0
			moaSnoozeState.SetValue(1.0)
		Else
			moaSnoozeState.SetValue(0.0)
		EndIf
	ElseIf (option == oidDragonSoulPSlider)
		fDragonSoulPSlider = value
		SetSliderOptionValue(oidDragonSoulPSlider, fDragonSoulPSlider, "{0}")
	ElseIf (option == oidBSoulGemPSlider)
		fBSoulgemPSlider = value
		SetSliderOptionValue(oidBSoulGemPSlider, fBSoulgemPSlider, "{0}")
	ElseIf (option == oidGSoulGemPSlider)
		fGSoulgemPSlider = value
		SetSliderOptionValue(oidGSoulGemPSlider, fGSoulgemPSlider, "{0}")
	ElseIf (option == oidRecoveryTime)
		fRecoveryTimeSlider = value
		SetSliderOptionValue(oidRecoveryTime, fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
	ElseIf (option == oidSpawnCountSlider)
		iSpawnCounts[iSpawn] = value As Int
		SetSliderOptionValue(oidSpawnCountSlider, iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2")
		ForcePageReset()
	ElseIf (option == oidSpawnWeightSlider)
		iSpawnWeights[iSpawn] = value As Int
		SetSliderOptionValue(oidSpawnWeightSlider, iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2")
		ForcePageReset()
	ElseIf (option == oidRespawnTimeSlider)
		If value > 0.0 && bShowTimeScaleWarning
			If !Self.ShowMessage("$mrt_MarkofArkay_MESG_TimeScaleConfirm", True, "$Yes", "$No")
				value = 0.0
			Else
				bShowTimeScaleWarning = False
			EndIf
		EndIf
		fRespawnTimeSlider = value
		SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2")
	ElseIf (option == oidBleedoutTime)
		fBleedoutTimeSlider = value
		SetSliderOptionValue(oidBleedoutTime, fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")	
	ElseIf (option == oidLootChanceSlider)
		fLootChanceSlider = value
		SetSliderOptionValue(oidLootChanceSlider, fLootChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
		moaLootChance.SetValue(100.0 -  fLootChanceSlider)
	ElseIf (option == oidScrollChanceSlider)
		fScrollChanceSlider = value
		SetSliderOptionValue(oidScrollChanceSlider, fScrollChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
		moaScrollChance.SetValue(100.0 -  fScrollChanceSlider)
	ElseIf (option == oidRecallCost)
		fRecallCastSlider = value
		SetSliderOptionValue(oidRecallCost, fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidMarkCost)
		fMarkCastSlider = value
		SetSliderOptionValue(oidMarkCost, fMarkCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidRPMinDistanceSlider)
		fRPMinDistanceSlider = value
		moaRPMinDistance.SetValue(fRPMinDistanceSlider)
		SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
	ElseIf (option == oidDisChanceSlider)
		fDisChanceSlider = value
		SetSliderOptionValue(oidDisChanceSlider, fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2")
	ElseIf (option == oidDisProgChanceSlider)
		fDisProgChanceSlider = value
		SetSliderOptionValue(oidDisProgChanceSlider, fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2")
	ElseIf (option == oidDisPriceSlider)
		fDisPriceSlider = value
		recalcCursedDisCureCosts()
		SetSliderOptionValue(oidDisPriceSlider, fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2")
	ElseIf (option == oidDisPriceMultSlider)
		fDisPriceMultSlider = value
		recalcCursedDisCureCosts()
		SetSliderOptionValue(oidDisPriceMultSlider, fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2")
	ElseIf (option == oidMarkScaleSlider)
		fValueMarkScaleSlider = value
		SetSliderOptionValue(oidMarkScaleSlider, fValueMarkScaleSlider, "$mrt_MarkofArkay_MarkScaleSlider_2")
	ElseIf (option == oidGSoulScaleGemSlider)
		fValueGSoulGemScaleSlider = value
		SetSliderOptionValue(oidGSoulScaleGemSlider, fValueGSoulGemScaleSlider, "$mrt_MarkofArkay_GSoulGemScaleSlider_2")
	ElseIf (option == oidBSoulScaleGemSlider)
		fValueBSoulGemScaleSlider = value
		SetSliderOptionValue(oidBSoulScaleGemSlider, fValueBSoulGemScaleSlider, "$mrt_MarkofArkay_BSoulGemScaleSlider_2")
	ElseIf (option == oidDragonScaleSoulSlider)
		fValueSoulScaleSlider = value
		SetSliderOptionValue(oidDragonScaleSoulSlider, fValueSoulScaleSlider, "$mrt_MarkofArkay_DragonSoulScaleSlider_2")
	ElseIf (option == oidGoldScaleSlider)
		fValueGoldScaleSlider = value
		SetSliderOptionValue(oidGoldScaleSlider, fValueGoldScaleSlider, "$mrt_MarkofArkay_GoldScaleSlider_2")
	ElseIf (option == oidSkillReduceValSlider)
		fSkillReduceValSlider = value
		SetSliderOptionValue(oidSkillReduceValSlider, fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2")
	ElseIf (option == oidSkillReduceMaxValSlider)
		fSkillReduceMaxValSlider = value
		SetSliderOptionValue(oidSkillReduceMaxValSlider, fSkillReduceMaxValSlider, "{0}")
	ElseIf (option == oidSkillReduceMinValSlider)
		fSkillReduceMinValSlider = value
		SetSliderOptionValue(oidSkillReduceMinValSlider, fSkillReduceMinValSlider, "{0}")
	ElseIf (option == oidMinLoseGoldSlider)
		fMinLoseGoldSlider = value
		SetSliderOptionValue(oidMinLoseGoldSlider, fMinLoseGoldSlider, "{0}")
	ElseIf (option == oidMaxLoseGoldSlider)
		fMaxLoseGoldSlider = value
		SetSliderOptionValue(oidMaxLoseGoldSlider, fMaxLoseGoldSlider, "{0}")
	ElseIf (option == oidMinLoseDragonSoulSlider)
		fMinLoseDragonSoulSlider = value
		SetSliderOptionValue(oidMinLoseDragonSoulSlider, fMinLoseDragonSoulSlider, "{0}")
	ElseIf (option == oidMaxLoseDragonSoulSlider)
		fMaxLoseDragonSoulSlider = value
		SetSliderOptionValue(oidMaxLoseDragonSoulSlider, fMaxLoseDragonSoulSlider, "{0}")
	ElseIf (option == oidMinLoseBlackSoulGemSlider)
		fMinLoseBlackSoulGemSlider = value
		SetSliderOptionValue(oidMinLoseBlackSoulGemSlider, fMinLoseBlackSoulGemSlider, "{0}")
	ElseIf (option == oidMaxLoseBlackSoulGemSlider)
		fMaxLoseBlackSoulGemSlider = value
		SetSliderOptionValue(oidMaxLoseBlackSoulGemSlider, fMaxLoseBlackSoulGemSlider, "{0}")
	ElseIf (option == oidMinLoseGrandSoulGemSlider)
		fMinLoseGrandSoulGemSlider = value
		SetSliderOptionValue(oidMinLoseGrandSoulGemSlider, fMinLoseGrandSoulGemSlider, "{0}")
	ElseIf (option == oidMaxLoseGrandSoulGemSlider)
		fMaxLoseGrandSoulGemSlider = value
		SetSliderOptionValue(oidMaxLoseGrandSoulGemSlider, fMaxLoseGrandSoulGemSlider, "{0}")
	ElseIf (option == oidMinLoseArkayMarkSlider)
		fMinLoseArkayMarkSlider = value
		SetSliderOptionValue(oidMinLoseArkayMarkSlider, fMinLoseArkayMarkSlider, "{0}")
	ElseIf (option == oidMaxLoseArkayMarkSlider)
		fMaxLoseArkayMarkSlider = value
		SetSliderOptionValue(oidMaxLoseArkayMarkSlider, fMaxLoseArkayMarkSlider, "{0}")
	ElseIf (option == oidLoseOtherMinValueSlider)
		fLoseOtherMinValueSlider = value
		SetSliderOptionValue(oidLoseOtherMinValueSlider, fLoseOtherMinValueSlider, "{0}")
	ElseIf (option == oidLoseOtherTotalValueSlider)
		fLoseOtherTotalValueSlider = value
		SetSliderOptionValue(oidLoseOtherTotalValueSlider, fLoseOtherTotalValueSlider, "{0}")
	ElseIf (option == oidMaxItemsToCheckSlider)
		fMaxItemsToCheckSlider = value
		SetSliderOptionValue(oidMaxItemsToCheckSlider, fMaxItemsToCheckSlider, "{0}")
	ElseIf (option == oidRespawnCounter)
		If !Self.ShowMessage("$mrt_MarkofArkay_MESG_RespawnCounterConfirm", True, "$Yes", "$No")
			Return
		EndIf
		fRespawnCounterSlider = value
		SetSliderOptionValue(oidRespawnCounter, fRespawnCounterSlider, "$mrt_MarkofArkay_RespawnCounter2")
		bRespawnCounter = True
		bCanbeKilledbyUnarmed = False
		bKillIfCantRespawn = False
		ForcePageReset()
	ElseIf (option == oidBossChestChanceSlider)
		fBossChestChanceSlider = value
		SetSliderOptionValue(oidBossChestChanceSlider, fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2")
		ForcePageReset()
	ElseIf (option == oidTotalCustomRPSlotSlider)
		fTotalCustomRPSlotSlider = value
		SetCustomRPFlags()
		SetSliderOptionValue(oidTotalCustomRPSlotSlider, fTotalCustomRPSlotSlider, "{0}")
	ElseIf (option == oidHealthTriggerSlider)
		fHealthPercTrigger = value / 100.0
		SetSliderOptionValue(oidHealthTriggerSlider, value, "$mrt_MarkofArkay_HealthPercSlider_2")
	EndIf
EndEvent

Event OnOptionMenuOpen(Int option)
	If (option == oidTeleportLocation_M)
		SetMenuDialogoptions(sRespawnPoints)
		SetMenuDialogStartIndex(iTeleportLocation)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidNoTradingAftermath_M)
		SetMenuDialogoptions(sGetAftermathOptions())
		SetMenuDialogStartIndex(iNotTradingAftermath)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidArkayCurses_M)
		SetMenuDialogoptions(sGetArkayCurses())
		SetMenuDialogStartIndex(iArkayCurse)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidEnableSave_M)
		SetMenuDialogoptions(sGetSaveOptions())
		SetMenuDialogStartIndex(iSaveOption)
		SetMenuDialogDefaultIndex(1)
	ElseIf (option == oidLoadPreset_M)
		SetMenuDialogoptions(sGetPresets())
		SetMenuDialogStartIndex(iLoadPreset)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSavePreset_M)
		SetMenuDialogoptions(sGetPresets())
		SetMenuDialogStartIndex(iSavePreset)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSkillReduce_M)
		SetMenuDialogoptions(sGetSkills())
		SetMenuDialogStartIndex(iReducedSkill)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidEquipInclude_M)
		SetMenuDialogoptions(sGetLoseInclusions())
		SetMenuDialogStartIndex(iLoseInclusion)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSelectedCustomRPSlot_M)
		SetMenuDialogoptions(sGetCustomRPs())
		SetMenuDialogStartIndex(iSelectedCustomRPSlot)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidHostileOptions_M)
		SetMenuDialogoptions(sGetHostileOptions())
		SetMenuDialogStartIndex(iHostileOption)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSpawns_M)
		SetMenuDialogoptions(sGetSpawns())
		SetMenuDialogStartIndex(iSpawn)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSpawnMinLevel_M)
		SetMenuDialogoptions(sGetSpawnLevels())
		SetMenuDialogStartIndex(iSpawnMinLevel)
		SetMenuDialogDefaultIndex(4)
	ElseIf (option == oidSpawnMaxLevel_M)
		SetMenuDialogoptions(sGetSpawnLevels())
		SetMenuDialogStartIndex(iSpawnMaxLevel)
		SetMenuDialogDefaultIndex(4)
	EndIf
EndEvent

Event OnOptionMenuAccept(Int option, Int index)
	If (option == oidTeleportLocation_M)
		iTeleportLocation = index
		SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation])
		ForcePageReset()
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = index
		SetMenuOptionValue(oidNoTradingAftermath_M, sGetAftermathOptions()[iNotTradingAftermath])
		ForcePageReset()
	ElseIf (option == oidArkayCurses_M)
	    iArkayCurse = index
		SetMenuOptionValue(oidArkayCurses_M, sGetArkayCurses()[iArkayCurse])
	ElseIf (option == oidSelectedCustomRPSlot_M)
	    iSelectedCustomRPSlot = index
		SetCustomRPFlags()
		SetMenuOptionValue(oidSelectedCustomRPSlot_M, sGetCustomRPs()[iSelectedCustomRPSlot])
	ElseIf (option == oidEnableSave_M)
	    iSaveOption = index
		SetSavingOption(iSaveOption)
		SetMenuOptionValue(oidEnableSave_M, sGetSaveOptions()[iSaveOption])
	ElseIf (option == oidLoadPreset_M)
		iLoadPreset = index
		SetMenuOptionValue(oidLoadPreset_M, sGetPresets()[iLoadPreset])
	ElseIf (option == oidSavePreset_M)
		iSavePreset = index
		SetMenuOptionValue(oidSavePreset_M, sGetPresets()[iSavePreset])
	ElseIf (option == oidEquipInclude_M)
		iLoseInclusion = index
		SetMenuOptionValue(oidEquipInclude_M, sGetLoseInclusions()[iLoseInclusion])
		ForcePageReset()
	ElseIf (option == oidHostileOptions_M)
		iHostileOption = index
		SetMenuOptionValue(oidHostileOptions_M, sGetHostileOptions()[iHostileOption])
		ForcePageReset()
	ElseIf (option == oidSpawns_M)
		iSpawn = index
		SetMenuOptionValue(oidSpawns_M, sGetSpawns()[iSpawn])
		ForcePageReset()
	ElseIf (option == oidSpawnMinLevel_M)
		iSpawnMinLevel = index
		SetMenuOptionValue(oidSpawnMinLevel_M, sGetSpawnLevels()[iSpawnMinLevel])
	ElseIf (option == oidSpawnMaxLevel_M)
		iSpawnMaxLevel = index
		SetMenuOptionValue(oidSpawnMaxLevel_M, sGetSpawnLevels()[iSpawnMaxLevel])
	ElseIf (option == oidSkillReduce_M)
		iReducedSkill = index
		SetMenuOptionValue(oidSkillReduce_M, sGetSkills()[iReducedSkill])
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0)
			flags = OPTION_FLAG_NONE
			SetOptionFlags(oidOnlyLoseSkillXP,flags,True)
			If bOnlyLoseSkillXP
				SetOptionFlags(oidLevelReduce,flags,True)
				SetOptionFlags(oidSkillReduceRandomVal,flags,True)
				If !bDisableUnsafe && bDLIEOK
					flags =	OPTION_FLAG_NONE
				Else
					flags =	OPTION_FLAG_DISABLED
				EndIf
				SetOptionFlags(oidLoseSkillForever,flags,True)
				If !bSkillReduceRandomVal
					flags =	OPTION_FLAG_NONE
				Else
					flags =	OPTION_FLAG_DISABLED
				EndIf
				SetOptionFlags(oidSkillReduceValSlider,flags,True)
				If bSkillReduceRandomVal
					flags =	OPTION_FLAG_NONE
				Else
					flags = OPTION_FLAG_DISABLED
				EndIf
				SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
				SetOptionFlags(oidSkillReduceMaxValSlider,flags)
			EndIf
		Else
			flags = OPTION_FLAG_DISABLED
			SetOptionFlags(oidLevelReduce,flags,True)
			SetOptionFlags(oidOnlyLoseSkillXP,flags,True)
			SetOptionFlags(oidLoseSkillForever,flags,True)
			SetOptionFlags(oidSkillReduceRandomVal,flags,True)
			SetOptionFlags(oidSkillReduceValSlider,flags,True)
			SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
			SetOptionFlags(oidSkillReduceMaxValSlider,flags)
		EndIf
		ForcePageReset()
	EndIf
EndEvent

Event OnOptionDefault(Int option)
	string page = CurrentPage
	If (option == oidRevivalEnabled)
		bIsRevivalEnabled = True
		SetToggleOptionValue(oidRevivalEnabled, bIsRevivalEnabled)
		ForcePageReset()
	ElseIf (option == oidMarkOfArkayRevivalEnabled)
		bIsMarkEnabled = True
	ElseIf (option == oidMenuEnabled)
		bIsMenuEnabled = True
		SetToggleOptionValue(oidMenuEnabled, bIsMenuEnabled)
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags)
	ElseIf (option == oidBSoulGemRevivalEnabled)
		bIsBSoulGemEnabled = True
		SetToggleOptionValue(oidBSoulGemRevivalEnabled, bIsBSoulGemEnabled)
	ElseIf (option == oidGSoulGemRevivalEnabled)
		bIsGSoulGemEnabled = True
		SetToggleOptionValue(oidGSoulGemRevivalEnabled, bIsGSoulGemEnabled)
	ElseIf (option == oidTradeEnabled)
		bIsTradeEnabled = True
		SetToggleOptionValue(oidTradeEnabled, bIsTradeEnabled)
	ElseIf (option == oidGoldRevivalEnabled)
		bIsGoldEnabled = True
		SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
	ElseIf (option == oidFollowerProtectPlayer)
		bFollowerProtectPlayer = False
		SetToggleOptionValue(oidFollowerProtectPlayer, bFollowerProtectPlayer)
	ElseIf (option == oidPlayerProtectFollower)
		bPlayerProtectFollower = False
		SetToggleOptionValue(oidPlayerProtectFollower, bPlayerProtectFollower)
	ElseIf (option == oidRetrySpawnWithoutLocation)
		bRetrySpawnWithoutLocation = True
		SetToggleOptionValue(oidRetrySpawnWithoutLocation, bRetrySpawnWithoutLocation)
	ElseIf (option == oidSpawnByLocation)
		bSpawnByLocation = True
		SetToggleOptionValue(oidSpawnByLocation, bSpawnByLocation)
		ForcePageReset()
	ElseIf (option == oidSpawnCheckRelation)
		bSpawnCheckRelation = True
		SetToggleOptionValue(oidSpawnCheckRelation, bSpawnCheckRelation)
	ElseIf (option == oidSpawnBringAllies)
		bSpawnBringAllies = True
		SetToggleOptionValue(oidSpawnBringAllies, bSpawnBringAllies)
	ElseIf (option == oidNoFallDamageEnabled)
		ToggleFallDamage(False)
		SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = False
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
	ElseIf (option == oidRespawnTimeSlider)
		fRespawnTimeSlider = 0.0
		SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2")
	ElseIf (option == oidSpawnCountSlider)
		iSpawnCounts[iSpawn] = 1
		SetSliderOptionValue(oidSpawnCountSlider, iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2")
	ElseIf (option == oidSpawnWeightSlider)
		iSpawnWeights[iSpawn] = 50
		SetSliderOptionValue(oidSpawnWeightSlider, iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2")
	ElseIf (option == oidFadeToBlack)
		bFadeToBlack = True
		SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
	ElseIf (option == oidRagdollEffect)
		bIsRagdollEnabled = False
		SetToggleOptionValue(oidRagdollEffect, bIsRagdollEnabled)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
	ElseIf (option == oidDisableUnsafe)
		bDisableUnsafe = True
		bLoseForever = False
		bLoseSkillForever = False
		fRespawnTimeSlider = 0.0
		SetToggleOptionValue(oidDisableUnsafe, bDisableUnsafe)
		ForcePageReset()
	ElseIf (option == oidInvisibility)
		bInvisibility = False
		SetToggleOptionValue(oidInvisibility, bInvisibility)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && !bIsRagdollEnabled && bFadeToBlack
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
		PlayerRef.SetAlpha(1.0)
	ElseIf (option == oidDeathEffect)
		bDeathEffect = True
		SetToggleOptionValue(oidDeathEffect, bDeathEffect)
	ElseIf (option == oidAltEyeFix)
		bAltEyeFix = False
		SetToggleOptionValue(oidAltEyeFix,bAltEyeFix)
	ElseIf (option == oidLogging)
		bIsLoggingEnabled = False
		SetToggleOptionValue(oidLogging, bIsLoggingEnabled)
	ElseIf (option == oidSkillReduceValSlider)
		fSkillReduceValSlider = 10.0
		SetSliderOptionValue(oidSkillReduceValSlider, fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2")	
	ElseIf (option == oidPotionRevivalEnabled)
		bIsPotionEnabled = False
		SetToggleOptionValue(oidPotionRevivalEnabled, bIsPotionEnabled)
	ElseIf (option == oidAutoDrinkPotion)
		bAutoDrinkPotion = False
		SetToggleOptionValue(oidAutoDrinkPotion, bAutoDrinkPotion) 
	ElseIf (option == oidDragonSoulSlider)
		fValueSoulSlider = 1.0
		SetSliderOptionValue(oidDragonSoulSlider, fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2")
    ElseIf (option == oidMarkSlider)
		fValueMarkSlider = 1.0
		SetSliderOptionValue(oidMarkSlider, fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2")
    ElseIf (option == oidBSoulGemSlider)
		fValueBSoulGemSlider = 1.0
		SetSliderOptionValue(oidBSoulGemSlider, fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2")
	ElseIf (option == oidGSoulGemSlider)
		fValueGSoulGemSlider = 1.0
		SetSliderOptionValue(oidBSoulGemSlider, fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2")
	ElseIf (option == oidGoldSlider)
		fValueGoldSlider = 1000.0
		SetSliderOptionValue(oidGoldSlider, fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2")
	ElseIf (option == oidGoldPSlider)
		fGoldPSlider = 4.0
		SetSliderOptionValue(oidGoldPSlider, fGoldPSlider, "{0}")
	ElseIf (option == oidDragonSoulPSlider)
		fDragonSoulPSlider = 3.0
		SetSliderOptionValue(oidDragonSoulPSlider, fDragonSoulPSlider, "{0}")
	ElseIf (option == oidBSoulGemPSlider)
		fBSoulgemPSlider = 1.0
		SetSliderOptionValue(oidBSoulGemPSlider, fBSoulgemPSlider, "{0}")
	ElseIf (option == oidGSoulGemPSlider)
		fGSoulgemPSlider = 2.0
		SetSliderOptionValue(oidGSoulGemPSlider, fGSoulgemPSlider, "{0}")
	ElseIf (option == oidMarkPSlider)
		fMarkPSlider = 5.0
		SetSliderOptionValue(oidMarkPSlider, fMarkPSlider, "{0}")
	ElseIf (option == oidSnoozeSlider)
		fValueSnoozeSlider = 0.0
		moaSnoozeState.SetValue(0.0)
		SetSliderOptionValue(oidSnoozeSlider, fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
	ElseIf (option == oidRecoveryTime)
		fRecoveryTimeSlider = 1.0
		SetSliderOptionValue(oidRecoveryTime, fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
	ElseIf (option == oidRPMinDistanceSlider)
		fRPMinDistanceSlider = 2000.0
		moaRPMinDistance.SetValue(fRPMinDistanceSlider)
		SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
	ElseIf (option == oidDisChanceSlider)
		fDisChanceSlider = 25.0
		SetSliderOptionValue(oidDisChanceSlider, fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2")
	ElseIf (option == oidDisProgChanceSlider)
		fDisProgChanceSlider = 50.0
		SetSliderOptionValue(oidDisProgChanceSlider, fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2")
	ElseIf (option == oidDisPriceSlider)
		fDisPriceSlider = 100.0
		recalcCursedDisCureCosts()
		SetSliderOptionValue(oidDisPriceSlider, fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2")
	ElseIf (option == oidDisPriceMultSlider)
		fDisPriceMultSlider = 0.5
		recalcCursedDisCureCosts()
		SetSliderOptionValue(oidDisPriceMultSlider, fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2")
	ElseIf (option == oidMarkScaleSlider)
		fValueMarkScaleSlider = 0.0
		SetSliderOptionValue(oidMarkScaleSlider, fValueMarkScaleSlider, "$mrt_MarkofArkay_MarkScaleSlider_2")
	ElseIf (option == oidGSoulScaleGemSlider)
		fValueGSoulGemScaleSlider = 0.0
		SetSliderOptionValue(oidGSoulScaleGemSlider, fValueGSoulGemScaleSlider, "$mrt_MarkofArkay_GSoulGemScaleSlider_2")
	ElseIf (option == oidBSoulScaleGemSlider)
		fValueBSoulGemScaleSlider = 0.0
		SetSliderOptionValue(oidBSoulScaleGemSlider, fValueBSoulGemScaleSlider, "$mrt_MarkofArkay_BSoulGemScaleSlider_2")
	ElseIf (option == oidDragonScaleSoulSlider)
		fValueSoulScaleSlider = 0.0
		SetSliderOptionValue(oidDragonScaleSoulSlider, fValueSoulScaleSlider, "$mrt_MarkofArkay_DragonSoulScaleSlider_2")
	ElseIf (option == oidGoldScaleSlider)
		fValueGoldScaleSlider = 0.0
		SetSliderOptionValue(oidGoldScaleSlider, fValueGoldScaleSlider, "$mrt_MarkofArkay_GoldScaleSlider_2")
	ElseIf (option == oidBleedoutTime)
		fBleedoutTimeSlider = 6.0
		SetSliderOptionValue(oidBleedoutTime, fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")	
	ElseIf (option == oidRecallCost)
		fRecallCastSlider = 0.0
		SetSliderOptionValue(oidRecallCost, fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidMarkCost)
		fMarkCastSlider = 0.0
		SetSliderOptionValue(oidMarkCost, fMarkCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidLootChanceSlider)
		fLootChanceSlider = 50.0
		SetSliderOptionValue(oidLootChanceSlider,fLootChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2")
		moaLootChance.SetValue(100.0 - fLootChanceSlider)
	ElseIf (option == oidScrollChanceSlider)
		fScrollChanceSlider = 25.0
		SetSliderOptionValue(oidScrollChanceSlider,fScrollChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2")
		moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
	ElseIf (option == oidEffect)
		bIsEffectEnabled = False
		SetToggleOptionValue(oidEffect, bIsEffectEnabled)
	ElseIf (option == oidExternalTeleportLocation)
		iExternalIndex = -1
		SetTextOptionValue(option,"$Random")
	ElseIf (option == oidRespawnPoint0)
		bRespawnPointsFlags[0] = True
		SetToggleOptionValue(oidRespawnPoint0,bRespawnPointsFlags[0])
	ElseIf (option == oidRespawnPoint1)
		bRespawnPointsFlags[1] = True
		SetToggleOptionValue(oidRespawnPoint1,bRespawnPointsFlags[1])
	ElseIf (option == oidRespawnPoint2)
		bRespawnPointsFlags[2] = True
		SetToggleOptionValue(oidRespawnPoint2,bRespawnPointsFlags[2])
	ElseIf (option == oidRespawnPoint3)
		bRespawnPointsFlags[3] = True
		SetToggleOptionValue(oidRespawnPoint3,bRespawnPointsFlags[3])
	ElseIf (option == oidRespawnPoint4)
		bRespawnPointsFlags[4] = True
		SetToggleOptionValue(oidRespawnPoint4,bRespawnPointsFlags[4])
	ElseIf (option == oidRespawnPoint5)
		bRespawnPointsFlags[5] = True
		SetToggleOptionValue(oidRespawnPoint5,bRespawnPointsFlags[5])
	ElseIf (option == oidRespawnPoint6)
		bRespawnPointsFlags[6] = True
		SetToggleOptionValue(oidRespawnPoint6,bRespawnPointsFlags[6])
	ElseIf (option == oidRespawnPoint7)
		bRespawnPointsFlags[7] = False
		SetToggleOptionValue(oidRespawnPoint7,bRespawnPointsFlags[7])
	ElseIf (option == oidRevivalRequireBlessing)
		bIsRevivalRequiresBlessing = False
		SetToggleOptionValue(oidRevivalRequireBlessing, bIsRevivalRequiresBlessing)	
	ElseIf (option == oidRecallRestriction)
		bIsRecallRestricted = True
		SetToggleOptionValue(oidRecallRestriction, bIsRecallRestricted)	
	ElseIf (option == oidShiftBack)
		bShiftBack = False
		SetToggleOptionValue(oidShiftBack,bShiftBack)
	ElseIf (option == oidShiftBackRespawn)
		bShiftBackRespawn = True
		SetToggleOptionValue(oidShiftBackRespawn,bShiftBackRespawn)
	ElseIf (option == oidRespawnNaked)
		bRespawnNaked = False
		SetToggleOptionValue(oidRespawnNaked,bRespawnNaked)
	ElseIf (option == oidCorpseAsSoulMark)
		bCorpseAsSoulMark = False
		SetToggleOptionValue(oidCorpseAsSoulMark,bCorpseAsSoulMark)
	ElseIf (option == oidRespawnMenu)
		bRespawnMenu = False
		SetToggleOptionValue(oidRespawnMenu,bRespawnMenu)
		flags = OPTION_FLAG_NONE
	ElseIf (option == oidTeleportMenu)
		bTeleportMenu = True
		SetToggleOptionValue(oidTeleportMenu,bTeleportMenu)
	ElseIf (option == oidMultipleDis)
		bMultipleDis = True
		SetToggleOptionValue(oidMultipleDis,bMultipleDis)
	ElseIf (option == oidDiseaseCurse)
		bDiseaseCurse = False
		SetToggleOptionValue(oidDiseaseCurse,bDiseaseCurse)
		ForcePageReset()
	ElseIf (option == oidMultipleDisProg)
		bMultipleDisProg = True
		SetToggleOptionValue(oidMultipleDisProg,bMultipleDisProg)
	ElseIf (option == oidOnlyInfectIfHasBaseDis)
		bOnlyInfectIfHasBaseDis = True
		SetToggleOptionValue(oidOnlyInfectIfHasBaseDis,bOnlyInfectIfHasBaseDis)
	ElseIf (option == oidCureDisIfHasBlessing)
		bCureDisIfHasBlessing = False
		moaCureDisIfHasBlessing.SetValueInt(0)
		SetToggleOptionValue(oidCureDisIfHasBlessing,bCureDisIfHasBlessing)
	ElseIf (option == oidTotalCustomRPSlotSlider)
		fTotalCustomRPSlotSlider = 1.0
		SetCustomRPFlags()
		SetSliderOptionValue(oidTotalCustomRPSlotSlider,fTotalCustomRPSlotSlider,"$mrt_MarkofArkay_TotalCustomRPSlotSlider_1")
	ElseIf (option == oidSelectedCustomRPSlot_M)
		iSelectedCustomRPSlot = 0
		SetCustomRPFlags()
		SetMenuOptionValue(oidSelectedCustomRPSlot_M, sGetCustomRPs()[iSelectedCustomRPSlot])
	ElseIf (option == oidJail)
		bSendToJail = False
		SetToggleOptionValue(oidJail,bSendToJail)
	ElseIf (option == oidDoNotStopCombat)
		bDoNotStopCombat = False
		SetToggleOptionValue(oidDoNotStopCombat,bDoNotStopCombat)
	ElseIf (option == oidDoNotStopCombatAfterRevival)
		bDoNotStopCombatAfterRevival = True
		SetToggleOptionValue(oidDoNotStopCombatAfterRevival,bDoNotStopCombatAfterRevival)
	ElseIf (option == oidKillIfCantRespawn)
		bKillIfCantRespawn = False
		SetToggleOptionValue(oidKillIfCantRespawn,bKillIfCantRespawn)
	ElseIf (option == oidCanbeKilledbyUnarmed)
		bCanbeKilledbyUnarmed = True
		SetToggleOptionValue(oidCanbeKilledbyUnarmed,bCanbeKilledbyUnarmed)
	ElseIf (option == oidLoseSkillForever)
		bLoseSkillForever = False
		SetToggleOptionValue(oidLoseSkillForever,bLoseSkillForever)
	ElseIf (option == oidHealActors)
		bHealActors = False
		SetToggleOptionValue(oidHealActors,bHealActors)
	ElseIf (option == oidResurrectActors)
		bResurrectActors = False
		SetToggleOptionValue(oidResurrectActors,bResurrectActors)
	ElseIf (option == oidShowRaceMenu)
		bShowRaceMenu = False
		SetToggleOptionValue(oidShowRaceMenu,bShowRaceMenu)
	ElseIf (option == oidArkayCurse)
		bArkayCurse = False
		SetToggleOptionValue(oidArkayCurse,bArkayCurse)
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidArkayCurses_M, flags,True)
		SetOptionFlags(oidTempArkayCurse, flags,True)
		If  (( bIsRevivalEnabled ) && ( iNotTradingAftermath == 1 ))
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSoulMarkStay, flags)
	ElseIf (option == oidTempArkayCurse)
		bIsArkayCurseTemporary = False
		SetToggleOptionValue(oidTempArkayCurse,bIsArkayCurseTemporary)
	ElseIf (option == oidSkillReduce_M)
		iReducedSkill = 0
		SetMenuOptionValue(oidSkillReduce_M, sGetSkills()[iReducedSkill])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidLevelReduce,flags,True)
		SetOptionFlags(oidOnlyLoseSkillXP,flags,True)
		SetOptionFlags(oidLoseSkillForever,flags,True)
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,flags)
		ForcePageReset()
	ElseIf (option == oidEquipInclude_M)
		iLoseInclusion = 0
		SetMenuOptionValue(oidEquipInclude_M, sGetLoseInclusions()[iLoseInclusion])
		ForcePageReset()
	ElseIf (option == oidSkillReduceRandomVal)
		bSkillReduceRandomVal = False
		SetToggleOptionValue(oidSkillReduceRandomVal,bSkillReduceRandomVal)
		SetOptionFlags(oidSkillReduceMinValSlider,OPTION_FLAG_DISABLED,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,OPTION_FLAG_DISABLED,True)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceValSlider,Flags)
	ElseIf (option == oidCreaturesCanSteal )
		bCreaturesCanSteal = False
		moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
		SetToggleOptionValue(oidCreaturesCanSteal ,bCreaturesCanSteal)
	ElseIf (option == oidSpawnHostile )
		bSpawnHostile = False
		SetToggleOptionValue(oidSpawnHostile ,bSpawnHostile)
		ForcePageReset()
	ElseIf (option == oidBossChestOnlyCurLoc )
		bBossChestOnlyCurLoc = False
		moaOnlyInCurLocChest.SetValueInt(0)
		SetToggleOptionValue(oidBossChestOnlyCurLoc ,bBossChestOnlyCurLoc)
	ElseIf (option == oidBossChestNotClearedLoc )
		bBossChestNotInClearedLoc = True
		moaBossChestNotInclearedLoc.SetValueInt(0)
		SetToggleOptionValue(oidBossChestNotClearedLoc ,bBossChestNotInClearedLoc)
	ElseIf (option == oidAlwaysSpawn )
		bAlwaysSpawn = False
		SetToggleOptionValue(oidAlwaysSpawn ,bAlwaysSpawn)
	ElseIf (option == oidOnlySpawn )
		bOnlySpawn = False
		SetToggleOptionValue(oidOnlySpawn ,bOnlySpawn)
	ElseIf (option == oidMoralityMatters )
		bMoralityMatters = True
		moaMoralityMatters.SetValue(bMoralityMatters As Int)
		SetToggleOptionValue(oidMoralityMatters ,bMoralityMatters)
	ElseIf (option == oidLoseforever)
		bLoseForever = False
		SetToggleOptionValue(oidLoseforever,bLoseForever)
	ElseIf (option == oidRandomItemCurse)
		bRandomItemCurse = False
		SetToggleOptionValue(oidRandomItemCurse,bRandomItemCurse)
	ElseIf (option == oidMoreRandomRespawn)
		bMoreRandomRespawn = False
		SetToggleOptionValue(oidMoreRandomRespawn,bMoreRandomRespawn)
	ElseIf (option == oidMinLoseGoldSlider)
		fMinLoseGoldSlider = 50.0
		SetSliderOptionValue(oidMinLoseGoldSlider, fMinLoseGoldSlider, "{0}")
	ElseIf (option == oidMaxLoseGoldSlider)
		fMaxLoseGoldSlider = 250.0
		SetSliderOptionValue(oidMaxLoseGoldSlider, fMaxLoseGoldSlider, "{0}")
	ElseIf (option == oidLoseGoldAll)
		bLoseGoldAll = False
		SetToggleOptionValue(oidLoseGoldAll,bLoseGoldAll)
	ElseIf (option == oidLoseItem)
		bLoseItem = False
		SetToggleOptionValue(oidLoseItem,bLoseItem)
		forcePageReset()
	ElseIf (option == oidLoseArkayMarkAll)
		bLoseArkayMarkAll = False
		SetToggleOptionValue(oidLoseArkayMarkAll,bLoseArkayMarkAll)
		forcePageReset()
	ElseIf (option == oidMinLoseArkayMarkSlider)
		fMinLoseArkayMarkSlider = 0.0
		SetSliderOptionValue(oidMinLoseArkayMarkSlider, fMinLoseArkayMarkSlider, "{0}")
	ElseIf (option == oidMaxLoseArkayMarkSlider)
		fMaxLoseArkayMarkSlider = 1.0
		SetSliderOptionValue(oidMaxLoseArkayMarkSlider, fMaxLoseArkayMarkSlider, "{0}")
	ElseIf (option == oidLoseDragonSoulAll)
		bLoseDragonSoulAll = False
		SetToggleOptionValue(oidLoseDragonSoulAll,bLoseDragonSoulAll)
		forcePageReset()
	ElseIf (option == oidMinLoseDragonSoulSlider)
		fMinLoseDragonSoulSlider = 0.0
		SetSliderOptionValue(oidMinLoseDragonSoulSlider, fMinLoseDragonSoulSlider, "{0}")
	ElseIf (option == oidMaxLoseDragonSoulSlider)
		fMaxLoseDragonSoulSlider = 1.0
		SetSliderOptionValue(oidMaxLoseDragonSoulSlider, fMaxLoseDragonSoulSlider, "{0}")
	ElseIf (option == oidLoseBlackSoulGemAll)
		bLoseBlackSoulGemAll = False
		SetToggleOptionValue(oidLoseBlackSoulGemAll,bLoseBlackSoulGemAll)
		forcePageReset()
	ElseIf (option == oidMinLoseBlackSoulGemSlider)
		fMinLoseBlackSoulGemSlider = 0.0
		SetSliderOptionValue(oidMinLoseBlackSoulGemSlider, fMinLoseBlackSoulGemSlider, "{0}")
	ElseIf (option == oidMaxLoseBlackSoulGemSlider)
		fMaxLoseBlackSoulGemSlider = 1.0
		SetSliderOptionValue(oidMaxLoseBlackSoulGemSlider, fMaxLoseBlackSoulGemSlider, "{0}")
	ElseIf (option == oidLoseGrandSoulGemAll)
		bLoseGrandSoulGemAll = False
		SetToggleOptionValue(oidLoseGrandSoulGemAll,bLoseGrandSoulGemAll)
		forcePageReset()
	ElseIf (option == oidMinLoseGrandSoulGemSlider)
		fMinLoseGrandSoulGemSlider = 0.0
		SetSliderOptionValue(oidMinLoseGrandSoulGemSlider, fMinLoseGrandSoulGemSlider, "{0}")
	ElseIf (option == oidMaxLoseGrandSoulGemSlider)
		fMaxLoseGrandSoulGemSlider = 1.0
		SetSliderOptionValue(oidMaxLoseGrandSoulGemSlider, fMaxLoseGrandSoulGemSlider, "{0}")
	ElseIf (option == oidLoseOtherMinValueSlider)
		fLoseOtherMinValueSlider = 0.0
		SetSliderOptionValue(oidLoseOtherMinValueSlider, fLoseOtherMinValueSlider, "{0}")
	ElseIf (option == oidLoseOtherTotalValueSlider)
		fLoseOtherTotalValueSlider = 0.0
		SetSliderOptionValue(oidLoseOtherTotalValueSlider, fLoseOtherTotalValueSlider, "{0}")
	ElseIf (option == oidMaxItemsToCheckSlider)
		fMaxItemsToCheckSlider = 1000.0
		SetSliderOptionValue(oidMaxItemsToCheckSlider, fMaxItemsToCheckSlider, "{0}")
	ElseIf (option == oidBossChestChanceSlider)
		fBossChestChanceSlider = 0.0
		SetSliderOptionValue(oidBossChestChanceSlider, fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2")
		ForcePageReset()
	ElseIf (option == oidHealthTriggerSlider)
		fHealthPercTrigger = 0.00
		SetSliderOptionValue(oidHealthTriggerSlider, fHealthPercTrigger * 100, "mrt_MarkofArkay_HealthPercSlider_2")
	ElseIf (option == oidExcludeQuestItems)		
		bExcludeQuestItems = True
		SetToggleOptionValue(oidExcludeQuestItems,bExcludeQuestItems)
	ElseIf (option == oidLoseGold)
		bLoseGold = True
		SetToggleOptionValue(oidLoseGold,bLoseGold)
		forcePageReset()
	ElseIf (option == oidLoseArkayMark)
		bLoseArkayMark = False
		SetToggleOptionValue(oidLoseArkayMark,bLoseArkayMark)
		forcePageReset()
	ElseIf (option == oidLoseBlackSoulGem)
		bLoseBlackSoulGem = False
		SetToggleOptionValue(oidLoseBlackSoulGem,bLoseBlackSoulGem)
		forcePageReset()
	ElseIf (option == oidLoseGrandSoulGem)
		bLoseGrandSoulGem = False
		SetToggleOptionValue(oidLoseGrandSoulGem,bLoseGrandSoulGem)
		forcePageReset()
	ElseIf (option == oidLoseDragonSoul)
		bLoseDragonSoul = False
		SetToggleOptionValue(oidLoseDragonSoul,bLoseDragonSoul)
		forcePageReset()
	ElseIf (option == oidLoseOthers)
		bLoseOthers = False
		SetToggleOptionValue(oidLoseOthers,bLoseOthers)
		forcePageReset()
	ElseIf (option == oidLoseAmmo)
		bLoseAmmo = False
		SetToggleOptionValue(oidLoseAmmo,bLoseAmmo)
	ElseIf (option == oidLoseBook)
		bLoseBook = False
		SetToggleOptionValue(oidLoseBook,bLoseBook)
	ElseIf (option == oidLoseArmor)
		bLoseArmor = True
		SetToggleOptionValue(oidLoseArmor,bLoseArmor)
	ElseIf (option == oidLoseWeapon)
		bLoseWeapon = True
		SetToggleOptionValue(oidLoseWeapon,bLoseWeapon)
	ElseIf (option == oidLoseMisc)
		bLoseMisc = False
		SetToggleOptionValue(oidLoseMisc,bLoseMisc)
	ElseIf (option == oidLoseKey)
		bLoseKey = False
		SetToggleOptionValue(oidLoseKey,bLoseKey)
	ElseIf (option == oidLoseSoulgem)
		bLoseSoulgem = False
		SetToggleOptionValue(oidLoseSoulgem,bLoseSoulgem)
	ElseIf (option == oidLosePotion)
		bLosePotion = False
		SetToggleOptionValue(oidLosePotion,bLosePotion)
	ElseIf (option == oidLoseScroll)
		bLoseScroll = False
		SetToggleOptionValue(oidLoseScroll,bLoseScroll)
	ElseIf (option == oidLoseIngredient)
		bLoseIngredient = False
		SetToggleOptionValue(oidLoseIngredient,bLoseIngredient)
	ElseIf (option == oidCheckKeyword)
		bCheckKeyword = True
		SetToggleOptionValue(oidCheckKeyword,bCheckKeyword)
	ElseIf (option == oidCheckWeight)
		bCheckWeight = True
		SetToggleOptionValue(oidCheckWeight,bCheckWeight)
	ElseIf (option == oidLevelReduce)
		bLevelReduce = False
		SetToggleOptionValue(oidLevelReduce,bLevelReduce)
	ElseIf (option == oidOnlyLoseSkillXP)
		bOnlyLoseSkillXP = False
		SetToggleOptionValue(oidOnlyLoseSkillXP,bOnlyLoseSkillXP)
		ForcePageReset()
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = True
		SetToggleOptionValue(oidLostItemQuest,bLostItemQuest)
		If ( ( LostItemsChest.GetNumItems() > 0 ) || ( ReviveScript.ItemScript.fLostSouls > 0.0 ) || \
		PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.SkillScript.bSkillReduced())
			If ( ReviveScript.bSoulMark() )
				If ReviveScript.moaSoulMark01.IsRunning()
					moaRetrieveLostItems.start()
					moaRetrieveLostItems.SetStage(1)
				EndIf
			ElseIf ReviveScript.moaThiefNPC01.IsRunning()
				moaRetrieveLostItems01.start()
				moaRetrieveLostItems01.SetStage(1)
			EndIf
		Else
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
			If ReviveScript.moaThiefNPC01.IsRunning()
				If (ReviveScript.ThiefNPC.GetReference() As Actor)
					(ReviveScript.ThiefNPC.GetReference() As Actor).AddToFaction(ReviveScript.PlayerEnemyFaction)
				EndIf
			EndIf
		EndIf
	ElseIf (option == oidSoulMarkStay)
		bSoulMarkStay = False
		SetToggleOptionValue(oidSoulMarkStay,bSoulMarkStay)
	ElseIf (option == oidTeleportLocation_M)
		iTeleportLocation = 0
		SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation])
		ForcePageReset()
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = 0
		SetMenuOptionValue(oidNoTradingAftermath_M, sGetAftermathOptions()[iNotTradingAftermath])
		ForcePageReset()
	ElseIf (option == oidInformation)
		bIsInfoEnabled = False
		SetToggleOptionValue(oidInformation,bIsInfoEnabled)
		ForcePageReset()
	ElseIf (option == oidAutoSwitchRP)
		bAutoSwitchRP = False
		SetToggleOptionValue(oidAutoSwitchRP,bAutoSwitchRP)
	ElseIf (option == oidArkayCurses_M)
		iArkayCurse = 0
		SetMenuOptionValue(oidArkayCurses_M, sGetArkayCurses()[iArkayCurse])
	ElseIf (option == oidEnableSave_M)
		iSaveOption = 1
		SetMenuOptionValue(oidEnableSave_M, sGetSaveOptions()[iSaveOption])
		moaPraytoSave.SetValue(0.0)
		SetInChargen(False,False,False)
	ElseIf (option == oidHostileOptions_M)
		iHostileOption = 0
		SetMenuOptionValue(oidHostileOptions_M, sGetHostileOptions()[iHostileOption])
		ForcePageReset()
	ElseIf option == oidSpawnMinLevel_M
		iSpawnMinLevel = 4
		SetMenuOptionValue(oidSpawnMinLevel_M, sGetSpawnLevels()[iSpawnMinLevel])
	ElseIf option == oidSpawnMaxLevel_M
		iSpawnMaxLevel = 4
		SetMenuOptionValue(oidSpawnMaxLevel_M, sGetSpawnLevels()[iSpawnMaxLevel])
	EndIf
EndEvent

Event OnOptionHighlight(Int option)
	string page = CurrentPage
	If (option == oidRevivalEnabled)
		If bIsRevivalEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalEnabled_On") 
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalEnabled_Off")
		EndIf
	ElseIf (option == oidTradeEnabled)
		SetInfoText("$mrt_MarkofArkay_DESC_TradeEnabled")
	ElseIf (option == oidTriggerOnBleedout)
		SetInfoText("$mrt_MarkofArkay_DESC_TriggerOnBleedout")
	ElseIf (option == oidTriggerOnHealthPerc)
		SetInfoText("$mrt_MarkofArkay_DESC_TriggerOnHealthPerc")
	ElseIf (option == oidDragonSoulSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulSlider") 
	ElseIf (option == oidMenuEnabled)
		If bIsMenuEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_Off")
		EndIf
	ElseIf (option == oidBSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemSlider")
	ElseIf (option == oidGoldSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GoldSlider")
	ElseIf (option == oidMarkSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkSlider")
	ElseIf (option == oidGSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemSlider")
	ElseIf (option == oidDragonSoulRevivalEnabled)
		If bIsDragonSoulEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidMarkOfArkayRevivalEnabled)
		If bIsMarkEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_MarkOfArkayRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_MarkOfArkayRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidBSoulGemRevivalEnabled)
		If bIsBSoulGemEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidGSoulGemRevivalEnabled)
		If bIsGSoulGemEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidGoldRevivalEnabled)
		If bIsGoldEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_GoldRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_GoldRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidFollowerProtectPlayer)
			SetInfoText("$mrt_MarkofArkay_DESC_FollowerProtectPlayer")
	ElseIf (option == oidPlayerProtectFollower)
			SetInfoText("$mrt_MarkofArkay_DESC_PlayerProtectFollower")
	ElseIf (option == oidSpawnByLocation)
			SetInfoText("$mrt_MarkofArkay_DESC_SpawnByLocation")
	ElseIf (option == oidRetrySpawnWithoutLocation)
			SetInfoText("$mrt_MarkofArkay_DESC_RetrySpawnWithoutLocation")
	ElseIf (option == oidSpawnCheckRelation)
			SetInfoText("$mrt_MarkofArkay_DESC_SpawnCheckRelation")
	ElseIf (option == oidNoFallDamageEnabled)
		If bIsNoFallDamageEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_NoFallDamageEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_NoFallDamageEnabled_Off")
		EndIf
	ElseIf (option == oidNotification)
		If bIsNotificationEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_Notification_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_Notification_Off")
		EndIf
	ElseIf (option == oidFadeToBlack)
		SetInfoText("$mrt_MarkofArkay_DESC_FadeToBlack")
	ElseIf (option == oidInvisibility)
		SetInfoText("$mrt_MarkofArkay_DESC_Invisibility")
	ElseIf (option == oidDeathEffect)
		SetInfoText("$mrt_MarkofArkay_DESC_DeathEffect")
	ElseIf (option == oidAltEyeFix)
		SetInfoText("$mrt_MarkofArkay_DESC_AltEyeFix")
	ElseIf (option == oidLogging)
		SetInfoText("$mrt_MarkofArkay_DESC_Logging")
	ElseIf (option == oidDragonSoulPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulPSlider")
	ElseIf (option == oidBSoulGemPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemPSlider")
	ElseIf (option == oidGSoulGemPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemPSlider")
	ElseIf (option == oidSnoozeSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SnoozeSlider")
	ElseIf (option == oidMarkPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkPSlider")
	ElseIf (option == oidGoldPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GoldPSlider")
	ElseIf (option == oidRecoveryTime)
		SetInfoText("$mrt_MarkofArkay_DESC_RecoveryTime")
	ElseIf (option == oidRPMinDistanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_RPMinDistanceSlider")
	ElseIf (option == oidDisChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DisChanceSlider")
	ElseIf (option == oidDisProgChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DisProgChanceSlider")
	ElseIf (option == oidDisPriceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DisPriceSlider")
	ElseIf (option == oidDisPriceMultSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DisPriceMultSlider")
	ElseIf (option == oidMarkScaleSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkScaleSlider")
	ElseIf (option == oidGSoulScaleGemSlider )
		SetInfoText("$mrt_MarkofArkay_DESC_GSoulScaleGemSlider")
	ElseIf (option == oidBSoulScaleGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_BSoulScaleGemSlider")
	ElseIf (option == oidDragonScaleSoulSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DragonScaleSoulSlider")
	ElseIf (option == oidGoldScaleSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GoldScaleSlider")
	ElseIf (option == oidBleedoutTime)
		SetInfoText("$mrt_MarkofArkay_DESC_BleedoutTime")
	ElseIf (option == oidLootChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_LootChanceSlider")
	ElseIf (option == oidScrollChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_ScrollChanceSlider")
	ElseIf (option == oidEffect)
		If bIsEffectEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_Effect_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_Effect_Off")
		EndIf
	ElseIf (option == oidRevivalRequireBlessing)
		If bIsRevivalRequiresBlessing
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_Off")
		EndIf
	ElseIf (option == oidPotionRevivalEnabled)
		If bIsPotionEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_Off")
		EndIf
	ElseIf (option == oidAutoDrinkPotion)
		SetInfoText("$mrt_MarkofArkay_DESC_AutoDrinkPotion")
	ElseIf (option == oidStatus)
		SetInfoText("$mrt_MarkofArkay_DESC_Status")
	ElseIf (option == oidReset)
		SetInfoText("$mrt_MarkofArkay_DESC_Reset")
	ElseIf (option == oidResetPlayer)
		SetInfoText("$mrt_MarkofArkay_DESC_ResetPlayer")
	ElseIf (option == oidNoTradingAftermath_M)
			SetInfoText("$mrt_MarkofArkay_DESC_NoTradingAftermath_M")
	ElseIf (option == oidTeleportLocation_M)
		SetInfoText("$mrt_MarkofArkay_DESC_TeleportLocation_M")
	ElseIf (option == oidRespawnPoint0)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint0")
	ElseIf (option == oidRespawnPoint1)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint1")
	ElseIf (option == oidRespawnPoint2)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint2")
	ElseIf (option == oidRespawnPoint3)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint3")
	ElseIf (option == oidRespawnPoint4)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint4")
	ElseIf (option == oidRespawnPoint5)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint5")
	ElseIf (option == oidRespawnPoint6)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint6")
	ElseIf (option == oidRespawnPoint7)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint7")
	ElseIf (option == oidRespawnNaked)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnNaked")
	ElseIf (option == oidCorpseAsSoulMark)
		SetInfoText("$mrt_MarkofArkay_DESC_CorpseAsSoulMark")
	ElseIf (option == oidRespawnMenu)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnMenu")
	ElseIf (option == oidTeleportMenu)
		SetInfoText("$mrt_MarkofArkay_DESC_TeleportMenu")
	ElseIf (option == oidMultipleDis)
		SetInfoText("$mrt_MarkofArkay_DESC_MultipleDis")
	ElseIf (option == oidDiseaseCurse)
		SetInfoText("$mrt_MarkofArkay_DESC_DiseaseCurse")
	ElseIf (option == oidMultipleDisProg)
		SetInfoText("$mrt_MarkofArkay_DESC_MultipleDisProg")
	ElseIf (option == oidJail)
		SetInfoText("$mrt_MarkofArkay_DESC_Jail")
	ElseIf (option == oidDoNotStopCombat)
		SetInfoText("$mrt_MarkofArkay_DESC_DoNotStopCombat")
	ElseIf (option == oidDoNotStopCombatAfterRevival)
		SetInfoText("$mrt_MarkofArkay_DESC_DoNotStopCombatAfterRevival")
	ElseIf (option == oidKillIfCantRespawn)
		SetInfoText("$mrt_MarkofArkay_DESC_KillIfCantRespawn")
	ElseIf (option == oidCanbeKilledbyUnarmed)
		SetInfoText("$mrt_MarkofArkay_DESC_CanbeKilledbyUnarmed")
	ElseIf (option == oidLoseSkillForever)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseSkillForever")
	ElseIf (option == oidHealActors)
		SetInfoText("$mrt_MarkofArkay_DESC_HealActors")
	ElseIf (option == oidResurrectActors)
		SetInfoText("$mrt_MarkofArkay_DESC_ResurrectActors")
	ElseIf (option == oidShowRaceMenu)
		SetInfoText("$mrt_MarkofArkay_DESC_ShowRaceMenu")
	ElseIf (option == oidArkayCurse)
		SetInfoText("$mrt_MarkofArkay_DESC_ArkayCurse")
	ElseIf (option == oidTempArkayCurse)
		SetInfoText("$mrt_MarkofArkay_DESC_TempArkayCurse")
	ElseIf (option == oidSkillReduceRandomVal)
		SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceRandomVal")
	ElseIf (option == oidSkillReduce_M)
		SetInfoText("$mrt_MarkofArkay_DESC_SkillReduce_M")
	ElseIf (option == oidSkillReduceValSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceValSlider")
	ElseIf (option == oidSkillReduceMinValSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceMinValSlider")
	ElseIf (option == oidSkillReduceMaxValSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceMaxValSlider")
	ElseIf (option == oidCreaturesCanSteal )
		SetInfoText("$mrt_MarkofArkay_DESC_CreaturesCanSteal")
	ElseIf (option == oidMoralityMatters )
		SetInfoText("$mrt_MarkofArkay_DESC_MoralityMatters")
	ElseIf (option == oidLoseforever)
		SetInfoText("$mrt_MarkofArkay_DESC_Loseforever")
	ElseIf (option == oidLostItemQuest)
		SetInfoText("$mrt_MarkofArkay_DESC_LostItemQuest")
	ElseIf (option == oidSoulMarkStay)
		SetInfoText("$mrt_MarkofArkay_DESC_SoulMarkStay")
	ElseIf (option == oidRecallRestriction)
		SetInfoText("$mrt_MarkofArkay_DESC_RecallRestriction")
	ElseIf (option == oidExternalTeleportLocation)
		SetInfoText("$mrt_MarkofArkay_DESC_ExternalTeleportLocation")
	ElseIf (option == oidShiftBack)
		SetInfoText("$mrt_MarkofArkay_DESC_ShiftBack")
	ElseIf (option == oidShiftBackRespawn)
		SetInfoText("$mrt_MarkofArkay_DESC_ShiftBackRespawn")
	ElseIf (option == oidHistory)
		SetInfoText("$mrt_MarkofArkay_DESC_History")
	ElseIf (option == oidInformation)
		SetInfoText("$mrt_MarkofArkay_DESC_Info")
	ElseIf (option == oidResetHistory)
		SetInfoText("$mrt_MarkofArkay_DESC_ResetHistory")
	ElseIf (option == oidRestoreItems)
		SetInfoText("$mrt_MarkofArkay_DESC_RestoreItems")
	ElseIf (option == oidTogglePowers)
		SetInfoText("$mrt_MarkofArkay_DESC_TogglePowers")
	ElseIf (option == oidToggleSpells)
		SetInfoText("$mrt_MarkofArkay_DESC_ToggleSpells")
	ElseIf (option == oidAutoSwitchRP)
		SetInfoText("$mrt_MarkofArkay_DESC_AutoSwitchRP")
	ElseIf (option == oidRecallCost)
		SetInfoText("$mrt_MarkofArkay_DESC_RecallCost")
	ElseIf (option == oidMarkCost)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkCost")
	ElseIf (option == oidArkayCurses_M)
	    setInfotext("$mrt_MarkofArkay_DESC_ArkayCurses_M")
	ElseIf (option == oidEnableSave_M)
	    setInfotext("$mrt_MarkofArkay_DESC_EnableSave_M")
	ElseIf (option == oidHostileOptions_M)
	    setInfotext("$mrt_MarkofArkay_DESC_HostileOptions_M")
	ElseIf (option == oidSpawns_M)
	    setInfotext("$mrt_MarkofArkay_DESC_Spawns_M")
	ElseIf (option == oidSpawnMinLevel_M)
	    setInfotext("$mrt_MarkofArkay_DESC_SpawnMinLevel_M")
	ElseIf (option == oidSpawnMaxLevel_M)
	    setInfotext("$mrt_MarkofArkay_DESC_SpawnMaxLevel_M")
	ElseIf (option == oidLoadPreset1)
		SetInfoText("$mrt_MarkofArkay_DESC_Load_Preset")
	ElseIf (option == oidSavePreset1)
		SetInfoText("$mrt_MarkofArkay_DESC_Save_Preset")
	ElseIf (option == oidLoadDefaultPreset)
		SetInfoText("$mrt_MarkofArkay_DESC_Load_Default_Preset")
	ElseIf (option == oidLoadPreset_M)
		SetInfoText("$mrt_MarkofArkay_DESC_Load_Preset_M")
	ElseIf (option == oidSavePreset_M)
		SetInfoText("$mrt_MarkofArkay_DESC_Save_Preset_M")
	ElseIf (option == oidRagdollEffect)
		SetInfoText("$mrt_MarkofArkay_DESC_RagdollEffect")
	ElseIf (option == oidRespawnTimeSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnTimeSlider")
	ElseIf (option == oidRespawnCounter)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnCounter")
	ElseIf (option == oidSpawnCountSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SpawnCountSlider")
	ElseIf (option == oidSpawnWeightSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_SpawnWeightSlider")
	ElseIf (option == oidRandomItemCurse)
		SetInfoText("$mrt_MarkofArkay_DESC_RandomItemCurse")
	ElseIf (option == oidMoreRandomRespawn)
		SetInfoText("$mrt_MarkofArkay_DESC_MoreRandomRespawn")
	ElseIf (option == oidEquipInclude_M)
		SetInfoText("$mrt_MarkofArkay_DESC_EquipInclude_M")
	ElseIf (option == oidDisableUnsafe)
		SetInfoText("$mrt_MarkofArkay_DESC_DisableUnsafe")
	ElseIf (option == oidMinLoseGoldSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MinLoseGoldSlider")
	ElseIf (option == oidMaxLoseGoldSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseGoldSlider")
	ElseIf (option == oidLoseGoldAll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseGoldAll")
	ElseIf (option == oidLoseArkayMarkAll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseArkayMarkAll")	
	ElseIf (option == oidMinLoseArkayMarkSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MinLoseArkayMarkSlider")	
	ElseIf (option == oidMaxLoseArkayMarkSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseArkayMarkSlider")	
	ElseIf (option == oidLoseDragonSoulAll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseDragonSoulAll")	
	ElseIf (option == oidMinLoseDragonSoulSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MinLoseDragonSoulSlider")	
	ElseIf (option == oidMaxLoseDragonSoulSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseDragonSoulSlider")		
	ElseIf (option == oidLoseBlackSoulGemAll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseBSoulgemAll")	
	ElseIf (option == oidMinLoseBlackSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MinLoseBSoulgemSlider")	
	ElseIf (option == oidMaxLoseBlackSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseBSoulgemSlider")	
	ElseIf (option == oidLoseGrandSoulGemAll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseGSoulgemAll")	
	ElseIf (option == oidMaxLoseGrandSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseGSoulgemSlider")	
	ElseIf (option == oidMinLoseGrandSoulGemSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MinLoseGSoulgemSlider")	
	ElseIf (option == oidLoseOtherMinValueSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseOtherMinValueSlider")	
	ElseIf (option == oidLoseOtherTotalValueSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseOtherTotalValueSlider")
	ElseIf (option == oidMaxItemsToCheckSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MaxItemsToCheckSlider")	
	ElseIf (option == oidBossChestChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_BossChestChanceSlider")	
	ElseIf (option == oidHealthTriggerSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_HealthPercSlider")	
	ElseIf (option == oidExcludeQuestItems)		
		SetInfoText("$mrt_MarkofArkay_DESC_ExcludeQuestItems")
	ElseIf (option == oidLoseItem)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseItem")
	ElseIf (option == oidLoseGold)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseGold")
	ElseIf (option == oidLoseArkayMark)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseArkayMark")
	ElseIf (option == oidLoseBlackSoulGem)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseBSoulGem")
	ElseIf (option == oidLoseGrandSoulGem)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseGSoulGem")
	ElseIf (option == oidLoseDragonSoul)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseDragonSoul")
	ElseIf (option == oidLoseOthers)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseOthers")
	ElseIf (option == oidLoseAmmo)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseAmmo")
	ElseIf (option == oidLoseBook)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseBook")
	ElseIf (option == oidLoseArmor)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseArmor")
	ElseIf (option == oidLoseWeapon)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseWeapon")
	ElseIf (option == oidLoseMisc)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseMisc")
	ElseIf (option == oidLoseKey)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseKey")
	ElseIf (option == oidLoseSoulgem)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseSoulgem")
	ElseIf (option == oidLosePotion)
		SetInfoText("$mrt_MarkofArkay_DESC_LosePotion")
	ElseIf (option == oidLoseScroll)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseScroll")
	ElseIf (option == oidLoseIngredient)
		SetInfoText("$mrt_MarkofArkay_DESC_LoseIngredient")
	ElseIf (option == oidCheckKeyword)
		SetInfoText("$mrt_MarkofArkay_DESC_CheckKeyword")
	ElseIf (option == oidCheckWeight)
		SetInfoText("$mrt_MarkofArkay_DESC_CheckWeight")
	ElseIf (option == oidLevelReduce)
		SetInfoText("$mrt_MarkofArkay_DESC_LevelReduce")
	ElseIf (option == oidOnlyLoseSkillXP)
		SetInfoText("$mrt_MarkofArkay_DESC_OnlyLoseSkillXP")
	ElseIf (option == oidLostItemsInfo)
		SetInfoText("$mrt_MarkofArkay_DESC_LostItemsInfo")
	ElseIf (option == oidLostSkillsInfo)
		SetInfoText("$mrt_MarkofArkay_DESC_LostSkillsInfo")
	ElseIf (option == oidTotalCustomRPSlotSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_TotalCustomRPSlotSlider")
	ElseIf (option == oidSelectedCustomRPSlot_M)
		SetInfoText("$mrt_MarkofArkay_DESC_SelectedCustomRPSlot_M")
	ElseIf (option == oidSpawnBringAllies)
		SetInfoText("$mrt_MarkofArkay_DESC_SpawnBringAllies")
	ElseIf (option == oidSpawnHostile)
		SetInfoText("$mrt_MarkofArkay_DESC_SpawnHostile")
	ElseIf (option == oidBossChestOnlyCurLoc)
		SetInfoText("$mrt_MarkofArkay_DESC_BossChestOnlyCurLoc")
	ElseIf (option == oidBossChestNotClearedLoc)
		SetInfoText("$mrt_MarkofArkay_DESC_BossChestNotClearedLoc")
	ElseIf (option == oidAlwaysSpawn)
		SetInfoText("$mrt_MarkofArkay_DESC_AlwaysSpawn")
	ElseIf (option == oidOnlySpawn)
		SetInfoText("$mrt_MarkofArkay_DESC_OnlySpawn")
	ElseIf (option == oidOnlyInfectIfHasBaseDis)
		SetInfoText("$mrt_MarkofArkay_DESC_OnlyInfectIfHasBaseDis")
	ElseIf (option == oidCureDisIfHasBlessing)
		SetInfoText("$mrt_MarkofArkay_DESC_CureDisIfHasBlessing")
	ElseIf (option == oidTradeLock)
		SetInfoText("$mrt_MarkofArkay_DESC_TradeLock")
	ElseIf (option == oidCurseLock)
		SetInfoText("$mrt_MarkofArkay_DESC_CurseLock")
	ElseIf (option == oidMarkRecallCostLock)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkRecallCostLock")
	ElseIf (option == oidLootChanceLock)
		SetInfoText("$mrt_MarkofArkay_DESC_LootChanceLock")
	ElseIf (option == oidLockPermaDeath)
		SetInfoText("$mrt_MarkofArkay_DESC_LockDeath")
	ElseIf (option == oidSaveLock)
		SetInfoText("$mrt_MarkofArkay_DESC_SaveLock")
	EndIf
EndEvent

Function moaStart()
	If moaState.GetValue() == 0
		moaState.SetValue(1)
		;setPages()
		moaBleedoutHandlerState.SetValue(0)
		moaReviverQuest.Start()
		moaLootChance.SetValue(100.0 - fLootChanceSlider)
		moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
		ToggleFallDamage(True)
		ToggleFallDamage(False)
		SetSavingOption(iSaveOption)
		Utility.Wait(1.0)
		Debug.notification("$mrt_MarkofArkay_Notification_Started")
	EndIf
Endfunction

Function moaStop(Bool bReset = False)
	ToggleFallDamage(False)
	If moaState.GetValue() == 1
		moaState.SetValue(0)
		ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
		ReviveScript.NPCScript.RemoveSpawnedThiefs()
		If moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
		If moaRetrieveLostItems01.IsRunning()
			moaRetrieveLostItems01.SetStage(20)
		EndIf
		Int i = CustomRespawnPoints.GetSize()
		While i > 0
			i -= 1
			(CustomRespawnPoints.GetAt(i) As ObjectReference).Enable()
			(CustomRespawnPoints.GetAt(i) As ObjectReference).MoveToMyEditorLocation()
			(CustomRespawnPoints.GetAt(i) As ObjectReference).Disable()
		EndWhile
		SleepMarker.MoveToMyEditorLocation()
		SleepMarker.Disable()
		ReviveScript.Fadeout.Remove()
		ReviveScript.FastFadeOut.Remove()
		ReviveScript.BlackScreen.Remove()
		ReviveScript.FadeIn.Remove()
		PlayerRef.SetAlpha(1.0)
		moaFollowerDetector.Stop()
		moaHostileNPCDetector.Stop()
		moaHostileNPCDetector01.Stop()
		moaGuardDetector.Stop()
		If !bReset
			setTriggerMethod(0)
		Else
			StopAndConfirm(moaHealthMonitor,3)
		EndIf
		StopAndConfirm(moaReviverQuest,3)
		PlayerRef.GetActorBase().SetEssential(False)
		PlayerRef.SetNoBleedoutRecovery(False)
		PlayerRef.RemovePerk(ReviveScript.Invulnerable)
		moaBleedoutHandlerState.SetValue(0)
		PlayerRef.DispelSpell(ArkayBlessing)
		PlayerRef.RemoveSpell(ReviveScript.Bleed)
		PlayerRef.DispelSpell(RevivalPower)
		PlayerRef.RemoveSpell(SacrificePower)
		PlayerRef.RemoveSpell(RevivalPower)
		PlayerRef.RemoveSpell(ArkayCurse)
		PlayerRef.RemoveSpell(ArkayCurseAlt)
		PlayerRef.RemoveSpell(ArkayCurseTemp)
		PlayerRef.RemoveSpell(ArkayCurseTempAlt)
		PlayerRef.RemoveSpell(MoveCustomMarker)
		PlayerRef.RemoveSpell(RecallMarker)
		ReviveScript.DiseaseScript.cureAllDiseases()
		DetachMarker1.MoveToMyEditorLocation()
		DetachMarker2.MoveToMyEditorLocation()
		DetachMarker3.MoveToMyEditorLocation()
		CellLoadMarker.MoveToMyEditorLocation()
		LocationMarker.MoveToMyEditorLocation()
		CellLoadMarker2.MoveToMyEditorLocation()
		LocationMarker2.MoveToMyEditorLocation()
		ThiefMarker.MoveToMyEditorLocation()
		DetachMarker1.Disable()
		DetachMarker2.Disable()
		DetachMarker3.Disable()
		CellLoadMarker.Disable()
		LocationMarker.Disable()
		CellLoadMarker2.Disable()
		LocationMarker2.Disable()
		ThiefMarker.Disable()
		moaLootChance.SetValue(100.0)
		moaScrollChance.SetValue(100.0)
		SetInChargen(False,False,False)
		moaPraytoSave.SetValue(0.0)
		Debug.SetGodMode(False)
		PlayerRef.SetGhost(False)
		Utility.Wait(1.0)
		Debug.notification("$mrt_MarkofArkay_Notification_Stopped")
	EndIf
EndFunction

Int Function iGetModStatus()
	If moaIsBusy.GetValue() || (moaState.GetValue() == 1 && (PlayerRef.IsBleedingOut() || moaBleedoutHandlerState.GetValue() != 0 || ReviveScript.GetState() != ""))
		Return 2
	EndIf
	PlayerRef.GetCombatState()
	If PlayerRef.GetCombatState() == 1
		Return 1
	EndIf
	Return 0
EndFunction

Function ToggleDeferredKill(Bool bToggle)
	If bToggle
		PlayerRef.StartDeferredKill()
	Else
		bool bWasEssential = PlayerRef.IsEssential()
		PlayerRef.GetActorBase().SetEssential(true)
		Utility.Wait(0.1)
		ReviveScript.moaIgnoreBleedout.SetValue(1)
		PlayerRef.EndDeferredKill()
		Utility.Wait(0.1)
		PlayerRef.DamageActorValue("health", 10000)
		Utility.Wait(0.1)
		PlayerRef.DispelSpell(ReviveScript.Bleed)
		PlayerRef.RemoveSpell(ReviveScript.Bleed)
		PlayerRef.ResetHealthAndLimbs()
		PlayerRef.RestoreActorValue("health",10000)
		If !bWasEssential
			Utility.Wait(0.1)
			PlayerRef.GetActorBase().SetEssential(False)
		EndIf
		ReviveScript.moaIgnoreBleedout.SetValue(0)
	EndIf
EndFunction

Function ToggleFallDamage(Bool bFallDamage)
	If !bFallDamage
		If !(fJumpFallHeightMinDefault == 100000.00)
			SetGameSettingFloat("fJumpFallHeightMin", fJumpFallHeightMinDefault)
		Else
			SetGameSettingFloat("fJumpFallHeightMin", 600.00)
		EndIf
	Else
		If !(GetGameSettingFloat("fJumpFallHeightMin") == 100000.00)
			fJumpFallHeightMinDefault = GetGameSettingFloat("fJumpFallHeightMin")
		Else
			fJumpFallHeightMinDefault = 600.00
		EndIf
		SetGameSettingFloat("fJumpFallHeightMin", 100000.00)
	EndIf
	bIsNoFallDamageEnabled = bFallDamage
EndFunction

Function SetSavingOption(Int iIndex)
	PlayerRef.DispelSpell(ArkayBlessing)
	SetInChargen(False,False,False)
	If ( iIndex == 3 || iIndex == 4 ) ;PrayToSave
		SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		moaPraytoSave.SetValue(1.0)
	Else
		moaPraytoSave.SetValue(0.0)
		If ( iIndex == 2 );After Sleep
			SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		EndIf
	EndIf
EndFunction

Function SetCustomRPFlags()
	Bool[] bSlotflags = New Bool[4]
	bSlotflags[0] = False
	bSlotflags[1] = False
	bSlotflags[2] = False
	bSlotflags[3] = False
	Int i = 0
	While i < fTotalCustomRPSlotSlider As Int
		bSlotflags[i] = True
		i += 1
	EndWhile
	If iSelectedCustomRPSlot + 1 > fTotalCustomRPSlotSlider As Int
		bSlotflags[(fTotalCustomRPSlotSlider As Int) - 1] = False
		bSlotflags[iSelectedCustomRPSlot] = True
	EndIf
	i = CustomRespawnPoints.GetSize()
	While i > 0
		i -= 1
		If bSlotflags[i]
			(CustomRespawnPoints.GetAt(i) As ObjectReference).Enable()
		Else
			(CustomRespawnPoints.GetAt(i) As ObjectReference).Disable()
		EndIf
	EndWhile
EndFunction

Event OnConfigInit()
	If moaIsBusy.GetValue()
		Return
	EndIf
	moaIsBusy.SetValueInt(1)
	init()
EndEvent

Event OnConfigRegister()
	RegisterForSingleUpdate(3.0)
EndEvent

Int Function GetVersion()
	Return 300
EndFunction

Event OnVersionUpdate(int a_version)
	bIsUpdating = True
	If CurrentVersion > 0 && CurrentVersion < 300
		Debug.Trace("MarkOfArkay: [Error] Can't update because too old("+CurrentVersion+"<"+a_version+")")
		ModVersionError.Show()
		Return
	EndIf
	; a_version is the new version, CurrentVersion is the old version
	If (a_version >= 300 && CurrentVersion < 300)
		Debug.Trace(self + ": Updating script to version " + 300)
		;init()
	EndIf
	bIsUpdating = False
	ForcePageReset()
EndEvent

Event OnUpdate()
	moaIsBusy.SetValueInt(0)
	If moaState.GetValue() == 1
		Debug.notification("$mrt_MarkofArkay_Notification_Init")
	EndIf
EndEvent

Event OnGameReload()
	Parent.OnGameReload()
	OnVersionUpdate(GetVersion())
EndEvent

Function init()
	setArrays()
	SetCustomRPFlags()
EndFunction

Function setArrays()
	setPages()
	setRPs()
	setRPFlags() ;Only if Changing order without changing length need update
	SetTypes() ;Only if Changing order without changing length need update
	setSpawnCounts() ;Only if Changing order without changing length need update
	setSpawnWeights() ;Only if Changing order without changing length need update
EndFunction

Function setPages()
	Pages = new String[7]
	pages[0] = "$General"
	pages[1] = "$Extra"
	pages[2] = "$Aftermath"
	pages[3] = "$Curse"
	pages[4] = "NPC"
	pages[5] = "$Debug"
	pages[6] = "$Presets"
EndFunction

Function setRPs()
	sRespawnPoints = New String[17]
	sRespawnPoints[0] = "$Whiterun"
	sRespawnPoints[1] = "$Falkreath"
	sRespawnPoints[2] = "$Markarth"
	sRespawnPoints[3] = "$Riften"
	sRespawnPoints[4] = "$Solitude"
	sRespawnPoints[5] = "$Windhelm"
	sRespawnPoints[6] = "$Winterhold"
	sRespawnPoints[7] = "$RavenRock"
	sRespawnPoints[8] = "$NearbyCity"
	sRespawnPoints[9] = "$RandomCity"
	sRespawnPoints[10] = "$LastSleepLocation"
	sRespawnPoints[11] = "$Custom"
	sRespawnPoints[12] = "$External"
	sRespawnPoints[13] = "$Checkpoint"
	sRespawnPoints[14] = "$Nearby"
	sRespawnPoints[15] = "$Random"
	sRespawnPoints[16] = "$ThroatOfTheWorld"
EndFunction

Function setRPFlags(Bool bForce = False)
	if bForce || bIsUpdating || bRespawnPointsFlags.Length != 8
		bRespawnPointsFlags = New Bool[8]
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
		bRespawnPointsFlags[7] = False
	EndIf
EndFunction

String[] Function sGetAftermathOptions()
	String[] sAftermathOptions = New String[3]
	sAftermathOptions[0] = "$mrt_MarkofArkay_AftermathOptions_0"
	sAftermathOptions[1] = "$mrt_MarkofArkay_AftermathOptions_1"
	sAftermathOptions[2] = "$mrt_MarkofArkay_AftermathOptions_2"
	Return sAftermathOptions
EndFunction

String[] Function sGetArkayCurses()
	String[] sArkayCurses = New String[3]
	sArkayCurses[0] = "$mrt_MarkofArkay_ArkayCurses_0"
	sArkayCurses[1] = "$mrt_MarkofArkay_ArkayCurses_1"
	sArkayCurses[2] = "$mrt_MarkofArkay_ArkayCurses_2"
	Return sArkayCurses
EndFunction

String[] Function sGetSaveOptions()
	String[] sSaveOptions = new String[5]
	sSaveOptions[0] = "$mrt_MarkofArkay_SaveOptions_0"
	sSaveOptions[1] = "$mrt_MarkofArkay_SaveOptions_1"
	sSaveOptions[2] = "$mrt_MarkofArkay_SaveOptions_2"
	sSaveOptions[3] = "$mrt_MarkofArkay_SaveOptions_3"
	sSaveOptions[4] = "$mrt_MarkofArkay_SaveOptions_4"
	Return sSaveOptions
EndFunction

String[] Function sGetHostileOptions()
	String[] sHostileOptions = new String[3]
	sHostileOptions[0] = "$mrt_MarkofArkay_HostileOptions_0"
	sHostileOptions[1] = "$mrt_MarkofArkay_HostileOptions_1"
	sHostileOptions[2] = "$mrt_MarkofArkay_HostileOptions_2"
	Return sHostileOptions
EndFunction

String[] Function sGetPresets()
	String[] sPresets = New String[10]
	sPresets[0] = "$Preset1"
	sPresets[1] = "$Preset2"
	sPresets[2] = "$Preset3"
	sPresets[3] = "$Preset4"
	sPresets[4] = "$Preset5"
	sPresets[5] = "$Preset6"
	sPresets[6] = "$Preset7"
	sPresets[7] = "$Preset8"
	sPresets[8] = "$Preset9"
	sPresets[9] = "$Preset10"
	Return sPresets
EndFunction

String[] Function sGetLoseInclusions()
	String[] sLoseInclusions = New String[3]
	sLoseInclusions[0] = "$mrt_MarkofArkay_LoseInclusions_0"
	sLoseInclusions[1] = "$mrt_MarkofArkay_LoseInclusions_1"
	sLoseInclusions[2] = "$mrt_MarkofArkay_LoseInclusions_2"
	Return sLoseInclusions
EndFunction

String[] Function sGetSkills()
	String[] sSkills = New String[28]
	sSkills[0] = "$Disabled"
	sSkills[1] = "$Alchemy"
	sSkills[2] = "$Alteration"
	sSkills[3] = "$Block"
	sSkills[4] = "$Conjuration"
	sSkills[5] = "$Destruction"
	sSkills[6] = "$Enchanting"
	sSkills[7] = "$HeavyArmor"
	sSkills[8] = "$Illusion"
	sSkills[9] = "$LightArmor"
	sSkills[10] = "$Lockpicking"
	sSkills[11] = "$Marksman"
	sSkills[12] = "$OneHanded"
	sSkills[13] = "$Pickpocket"
	sSkills[14] = "$Restoration"
	sSkills[15] = "$Smithing"
	sSkills[16] = "$Sneak"
	sSkills[17] = "$Speechcraft"
	sSkills[18] = "$TwoHanded"
	sSkills[19] = "$Random"
	sSkills[20] = "$Lowest"
	sSkills[21] = "$Highest"
	sSkills[22] = "$Lowest_All"
	sSkills[23] = "$Highest_All"
	sSkills[24] = "$All_Low"
	sSkills[25] = "$All_High"
	sSkills[26] = "$All_Random"
	sSkills[27] = "$All_One_By_One"
	Return sSkills
EndFunction

String[] Function sGetCustomRPs()
	String[] sGetCustomRPSlot = New String[4]
	sGetCustomRPSlot[0] = "$CustopRP_Slot1"
	sGetCustomRPSlot[1] = "$CustopRP_Slot2"
	sGetCustomRPSlot[2] = "$CustopRP_Slot3"
	sGetCustomRPSlot[3] = "$CustopRP_Slot4"
	Return sGetCustomRPSlot
Endfunction

Function SetTypes()
	If bIsUpdating || iValidTypes.Length != 10
		iValidTypes = New Int[10]
		iValidTypes[0] = iGetType(23,bLoseScroll)
		iValidTypes[1] = iGetType(26,bLoseArmor)
		iValidTypes[2] = iGetType(27,bLoseBook)
		iValidTypes[3] = iGetType(30,bLoseIngredient)
		iValidTypes[4] = iGetType(32,bLoseMisc)
		iValidTypes[5] = iGetType(41,bLoseWeapon)
		iValidTypes[6] = iGetType(42,bLoseAmmo)
		iValidTypes[7] = iGetType(45,bLoseKey)
		iValidTypes[8] = iGetType(46,bLosePotion)
		iValidTypes[9] = iGetType(52,bLoseSoulgem)
	EndIf
Endfunction

Function setSpawnCounts(Bool bForce = False)
	if bForce || bIsUpdating || iSpawnCounts.Length != 28
		iSpawnCounts = New Int[28]
		iSpawnCounts[0] = 1
		iSpawnCounts[1] = 1
		iSpawnCounts[2] = 1
		iSpawnCounts[3] = 1
		iSpawnCounts[4] = 1
		iSpawnCounts[5] = 1
		iSpawnCounts[6] = 1
		iSpawnCounts[7] = 1
		iSpawnCounts[8] = 1
		iSpawnCounts[9] = 1
		iSpawnCounts[10] = 1
		iSpawnCounts[11] = 1
		iSpawnCounts[12] = 1
		iSpawnCounts[13] = 1
		iSpawnCounts[14] = 1
		iSpawnCounts[15] = 1
		iSpawnCounts[16] = 1
		iSpawnCounts[17] = 1
		iSpawnCounts[18] = 1
		iSpawnCounts[19] = 1
		iSpawnCounts[20] = 1
		iSpawnCounts[21] = 1
		iSpawnCounts[22] = 1
		iSpawnCounts[23] = 1
		iSpawnCounts[24] = 1
		iSpawnCounts[25] = 1
		iSpawnCounts[26] = 1
		iSpawnCounts[27] = 1
	EndIf
EndFunction

Function setSpawnWeights(Bool bForce = False)
	If bForce || bIsUpdating || iSpawnWeights.Length != 28
		iSpawnWeights = New Int[28]
		iSpawnWeights[0] = 50
		iSpawnWeights[1] = 50
		iSpawnWeights[2] = 50
		iSpawnWeights[3] = 50
		iSpawnWeights[4] = 50
		iSpawnWeights[5] = 50
		iSpawnWeights[6] = 50
		iSpawnWeights[7] = 50
		iSpawnWeights[8] = 50
		iSpawnWeights[9] = 50
		iSpawnWeights[10] = 50
		iSpawnWeights[11] = 50
		iSpawnWeights[12] = 50
		iSpawnWeights[13] = 50
		iSpawnWeights[14] = 50
		iSpawnWeights[15] = 50
		iSpawnWeights[16] = 50
		iSpawnWeights[17] = 50
		iSpawnWeights[18] = 50
		iSpawnWeights[19] = 50
		iSpawnWeights[20] = 50
		iSpawnWeights[21] = 50
		iSpawnWeights[22] = 50
		iSpawnWeights[23] = 50
		iSpawnWeights[24] = 50
		iSpawnWeights[25] = 50
		iSpawnWeights[26] = 50
		iSpawnWeights[27] = 50
	EndIf
EndFunction

String[] Function sGetSpawnLevels()
	String[] sSpawnLevel = New String[5]
	sSpawnLevel[0] = "$mrt_MarkofArkay_SpawnLevel_0"
	sSpawnLevel[1] = "$mrt_MarkofArkay_SpawnLevel_1"
	sSpawnLevel[2] = "$mrt_MarkofArkay_SpawnLevel_2"
	sSpawnLevel[3] = "$mrt_MarkofArkay_SpawnLevel_3"
	sSpawnLevel[4] = "$mrt_MarkofArkay_SpawnLevel_4"
	Return sSpawnLevel
EndFunction

String[] Function sGetSpawns()
	String[] sSpawns = New String[28]
	sSpawns[0] = "$Afflicted"
	sSpawns[1] = "$Assassin"
	sSpawns[2] = "$Atronach"
	sSpawns[3] = "$Bandit"
	sSpawns[4] = "$Chaurus"
	sSpawns[5] = "$Dawnguard"
	sSpawns[6] = "$DragonPriest"
	sSpawns[7] = "$Dragon"
	sSpawns[8] = "$Draugrs"
	sSpawns[9] = "$Dremoras"
	sSpawns[10] = "$Dwarven"
	sSpawns[11] = "$Falmer"
	sSpawns[12] = "$Forsworn"
	sSpawns[13] = "$Ghost"
	sSpawns[14] = "$Giant"
	sSpawns[15] = "$Hagraven"
	sSpawns[16] = "$SilverHand"
	sSpawns[17] = "$Skeleton"
	sSpawns[18] = "$Spider"
	sSpawns[19] = "$Spriggan"
	sSpawns[20] = "$Thalmors"
	sSpawns[21] = "$Thief"
	sSpawns[22] = "$Troll"
	sSpawns[23] = "$Vampire"
	sSpawns[24] = "$Warlock"
	sSpawns[25] = "$Werewolf"
	sSpawns[26] = "$Wisp"
	sSpawns[27] = "$Witch"
	Return sSpawns
EndFunction

Int Function iGetType(Int iType, Bool bEnabled)
	Return  ((iType + iType) * (bEnabled As Int)) - iType
Endfunction

String Function sType(Int iType)
	If iType == 23
		Return "Scroll"
	ElseIf iType == 26
		Return "Armor"
	ElseIf iType == 27
		Return "Book"
	ElseIf iType == 30
		Return "Ingredient"
	ElseIf iType == 32
		Return "Misc"
	ElseIf iType == 41
		Return "Weapon"
	ElseIf iType == 42
		Return "Ammo"
	ElseIf iType == 45
		Return "Key"
	ElseIf iType == 46
		Return "Potion"
	ElseIf iType == 52
		Return "Soulgem"
	EndIf
	Return ""
Endfunction


Bool function bLoadUserSettings(String sFileName)
	FISSInterface fiss = FISSFactory.getFISS()
	If !fiss
		Debug.Trace("Mark of Arkay: Error saving user settings -> FISS not installed. Loading disabled.")
		Return False
	EndIf
	If !bCheckPreset(fiss,sFileName)
		Return False
	EndIf
	fiss.beginLoad(sFileName)
	bIsRevivalEnabled = fiss.loadBool("bIsRevivalEnabled")
	fValueSnoozeSlider = fiss.loadFloat("fValueSnoozeSlider")
	bIsMarkEnabled = fiss.loadBool("bIsMarkEnabled")
	bIsGSoulGemEnabled = fiss.loadBool("bIsGSoulGemEnabled")
	bIsBSoulGemEnabled = fiss.loadBool("bIsBSoulGemEnabled")
	bIsDragonSoulEnabled = fiss.loadBool("bIsDragonSoulEnabled")
	bIsGoldEnabled = fiss.loadBool("bIsGoldEnabled")
	fValueMarkSlider = fiss.loadFloat("fValueMarkSlider")
	fValueGSoulGemSlider = fiss.loadFloat("fValueGSoulGemSlider")
	fValueBSoulGemSlider = fiss.loadFloat("fValueBSoulGemSlider")
	fValueSoulSlider = fiss.loadFloat("fValueSoulSlider")
	fValueGoldSlider = fiss.loadFloat("fValueGoldSlider")
	iSaveOption = fiss.loadInt("iSaveOption")
	SetSavingOption(iSaveOption)
	iHostileOption = fiss.loadInt("iHostileOption")
	bIsNoFallDamageEnabled = fiss.loadBool("bIsNoFallDamageEnabled")
	ToggleFallDamage(!bIsNoFallDamageEnabled)
	bIsEffectEnabled = fiss.loadBool("bIsEffectEnabled")
	bIsPotionEnabled = fiss.loadBool("bIsPotionEnabled")
	bAutoDrinkPotion = fiss.loadBool("bAutoDrinkPotion")
	bShiftBackRespawn = fiss.loadBool("bShiftBackRespawn")
	bIsRecallRestricted = fiss.loadBool("bIsRecallRestricted")
	bAutoSwitchRP = fiss.loadBool("bAutoSwitchRP")
	fMarkCastSlider = fiss.loadFloat("fMarkCastSlider")
	fRecallCastSlider = fiss.loadFloat("fRecallCastSlider")
	bIsMenuEnabled = fiss.loadBool("bIsMenuEnabled")
	fMarkPSlider = fiss.loadFloat("fMarkPSlider")
	fGoldPSlider = fiss.loadFloat("fGoldPSlider")
	fDragonSoulPSlider = fiss.loadFloat("fDragonSoulPSlider")
	fGSoulgemPSlider = fiss.loadFloat("fGSoulgemPSlider")
	fBSoulgemPSlider = fiss.loadFloat("fBSoulgemPSlider")
	fBleedoutTimeSlider = fiss.loadFloat("fBleedoutTimeSlider")
	fRecoveryTimeSlider = fiss.loadFloat("fRecoveryTimeSlider")
	fLootChanceSlider = fiss.loadFloat("fLootChanceSlider")
	moaLootChance.SetValue(100.0 -  fLootChanceSlider)
	fScrollChanceSlider = fiss.loadFloat("fScrollChanceSlider")
	moaScrollChance.SetValue(100.0 -  fScrollChanceSlider)
	iNotTradingAftermath = fiss.loadInt("iNotTradingAftermath")
	iArkayCurse = fiss.loadInt("iArkayCurse")
	bRespawnNaked = fiss.loadBool("bRespawnNaked")
	bCorpseAsSoulMark = fiss.loadBool("bCorpseAsSoulMark")
	bSendToJail = fiss.loadBool("bSendToJail")
	bKillIfCantRespawn = fiss.loadBool("bKillIfCantRespawn")
	bCanbeKilledbyUnarmed = fiss.loadBool("bCanbeKilledbyUnarmed")
	bTeleportMenu = fiss.loadBool("bTeleportMenu")
	bMultipleDis = fiss.loadBool("bMultipleDis")
	bDiseaseCurse = fiss.loadBool("bDiseaseCurse")
	bMultipleDisProg = fiss.loadBool("bMultipleDisProg")
	bOnlyInfectIfHasBaseDis = fiss.loadBool("bOnlyInfectIfHasBaseDis")
	bCureDisIfHasBlessing = fiss.loadBool("bCureDisIfHasBlessing")
	moaCureDisIfHasBlessing.SetValueInt(bCureDisIfHasBlessing As Int)
	bRespawnMenu = fiss.loadBool("bRespawnMenu")
	bFollowerProtectPlayer = fiss.loadBool("bFollowerProtectPlayer")
	bArkayCurse = fiss.loadBool("bArkayCurse")
	bIsArkayCurseTemporary = fiss.loadBool("bIsArkayCurseTemporary")
	bHealActors = fiss.loadBool("bHealActors")
	bResurrectActors = fiss.loadBool("bResurrectActors")
	bLoseForever = fiss.loadBool("bLoseForever")
	bSoulMarkStay = fiss.loadBool("bSoulMarkStay")
	;bLostItemQuest = fiss.loadBool("bLostItemQuest")
	bCreaturesCanSteal = fiss.loadBool("bCreaturesCanSteal")
	moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
	iTeleportLocation = fiss.loadInt("iTeleportLocation")
	iExternalIndex = fiss.loadInt("iExternalIndex")
	fRPMinDistanceSlider = fiss.loadFloat("fRPMinDistanceSlider")
	moaRPMinDistance.SetValue(fRPMinDistanceSlider)
	fDisChanceSlider = fiss.loadFloat("fDisChanceSlider")
	fDisPriceSlider = fiss.loadFloat("fDisPriceSlider")
	fValueMarkScaleSlider = fiss.loadFloat("fValueMarkScaleSlider")
	fValueGSoulGemScaleSlider = fiss.loadFloat("fValueGSoulGemScaleSlider")
	fValueBSoulGemScaleSlider = fiss.loadFloat("fValueBSoulGemScaleSlider")
	fValueSoulScaleSlider = fiss.loadFloat("fValueSoulScaleSlider")
	fValueGoldScaleSlider = fiss.loadFloat("fValueGoldScaleSlider")
	fDisPriceMultSlider = fiss.loadFloat("fDisPriceMultSlider")
	fDisProgChanceSlider = fiss.loadFloat("fDisProgChanceSlider")
	bRespawnPointsFlags[0] = fiss.loadBool("bRespawnPointsFlags0")
	bRespawnPointsFlags[1] = fiss.loadBool("bRespawnPointsFlags1")
	bRespawnPointsFlags[2] = fiss.loadBool("bRespawnPointsFlags2")
	bRespawnPointsFlags[3] = fiss.loadBool("bRespawnPointsFlags3")
	bRespawnPointsFlags[4] = fiss.loadBool("bRespawnPointsFlags4")
	bRespawnPointsFlags[5] = fiss.loadBool("bRespawnPointsFlags5")
	bRespawnPointsFlags[6] = fiss.loadBool("bRespawnPointsFlags6")
	bRespawnPointsFlags[7] = fiss.loadBool("bRespawnPointsFlags7")
	iSpawnCounts[0] = fiss.loadInt("iSpawnCounts0")
	iSpawnCounts[1] = fiss.loadInt("iSpawnCounts1")
	iSpawnCounts[2] = fiss.loadInt("iSpawnCounts2")
	iSpawnCounts[3] = fiss.loadInt("iSpawnCounts3")
	iSpawnCounts[4] = fiss.loadInt("iSpawnCounts4")
	iSpawnCounts[5] = fiss.loadInt("iSpawnCounts5")
	iSpawnCounts[6] = fiss.loadInt("iSpawnCounts6")
	iSpawnCounts[7] = fiss.loadInt("iSpawnCounts7")
	iSpawnCounts[8] = fiss.loadInt("iSpawnCounts8")
	iSpawnCounts[9] = fiss.loadInt("iSpawnCounts9")
	iSpawnCounts[10] = fiss.loadInt("iSpawnCounts10")
	iSpawnCounts[11] = fiss.loadInt("iSpawnCounts11")
	iSpawnCounts[12] = fiss.loadInt("iSpawnCounts12")
	iSpawnCounts[13] = fiss.loadInt("iSpawnCounts13")
	iSpawnCounts[14] = fiss.loadInt("iSpawnCounts14")
	iSpawnCounts[15] = fiss.loadInt("iSpawnCounts15")
	iSpawnCounts[16] = fiss.loadInt("iSpawnCounts16")
	iSpawnCounts[17] = fiss.loadInt("iSpawnCounts17")
	iSpawnCounts[18] = fiss.loadInt("iSpawnCounts18")
	iSpawnCounts[19] = fiss.loadInt("iSpawnCounts19")
	iSpawnCounts[20] = fiss.loadInt("iSpawnCounts20")
	iSpawnCounts[21] = fiss.loadInt("iSpawnCounts21")
	iSpawnCounts[22] = fiss.loadInt("iSpawnCounts22")
	iSpawnCounts[23] = fiss.loadInt("iSpawnCounts23")
	iSpawnCounts[24] = fiss.loadInt("iSpawnCounts24")
	iSpawnCounts[25] = fiss.loadInt("iSpawnCounts25")
	iSpawnCounts[26] = fiss.loadInt("iSpawnCounts26")
	iSpawnCounts[27] = fiss.loadInt("iSpawnCounts27")
	iSpawnWeights[0] = fiss.loadInt("iSpawnWeights0")
	iSpawnWeights[1] = fiss.loadInt("iSpawnWeights1")
	iSpawnWeights[2] = fiss.loadInt("iSpawnWeights2")
	iSpawnWeights[3] = fiss.loadInt("iSpawnWeights3")
	iSpawnWeights[4] = fiss.loadInt("iSpawnWeights4")
	iSpawnWeights[5] = fiss.loadInt("iSpawnWeights5")
	iSpawnWeights[6] = fiss.loadInt("iSpawnWeights6")
	iSpawnWeights[7] = fiss.loadInt("iSpawnWeights7")
	iSpawnWeights[8] = fiss.loadInt("iSpawnWeights8")
	iSpawnWeights[9] = fiss.loadInt("iSpawnWeights9")
	iSpawnWeights[10] = fiss.loadInt("iSpawnWeights10")
	iSpawnWeights[11] = fiss.loadInt("iSpawnWeights11")
	iSpawnWeights[12] = fiss.loadInt("iSpawnWeights12")
	iSpawnWeights[13] = fiss.loadInt("iSpawnWeights13")
	iSpawnWeights[14] = fiss.loadInt("iSpawnWeights14")
	iSpawnWeights[15] = fiss.loadInt("iSpawnWeights15")
	iSpawnWeights[16] = fiss.loadInt("iSpawnWeights16")
	iSpawnWeights[17] = fiss.loadInt("iSpawnWeights17")
	iSpawnWeights[18] = fiss.loadInt("iSpawnWeights18")
	iSpawnWeights[19] = fiss.loadInt("iSpawnWeights19")
	iSpawnWeights[20] = fiss.loadInt("iSpawnWeights20")
	iSpawnWeights[21] = fiss.loadInt("iSpawnWeights21")
	iSpawnWeights[22] = fiss.loadInt("iSpawnWeights22")
	iSpawnWeights[23] = fiss.loadInt("iSpawnWeights23")
	iSpawnWeights[24] = fiss.loadInt("iSpawnWeights24")
	iSpawnWeights[25] = fiss.loadInt("iSpawnWeights25")
	iSpawnWeights[26] = fiss.loadInt("iSpawnWeights26")
	iSpawnWeights[27] = fiss.loadInt("iSpawnWeights27")
	iSpawnMinLevel = fiss.loadInt("iSpawnMinLevel")
	iSpawnMaxLevel = fiss.loadInt("iSpawnMaxLevel")
	bIsLoggingEnabled = fiss.loadBool("bIsLoggingEnabled")
	bIsInfoEnabled = fiss.loadBool("bIsInfoEnabled")
	bIsNotificationEnabled = fiss.loadBool("bIsNotificationEnabled")
	bFadeToBlack = fiss.loadBool("bFadeToBlack")
	bInvisibility = fiss.loadBool("bInvisibility")
	bIsTradeEnabled = fiss.loadBool("bIsTradeEnabled")
	bDeathEffect = fiss.loadBool("bDeathEffect")
	bAltEyeFix = fiss.loadBool("bAltEyeFix")
	bPlayerProtectFollower = fiss.loadBool("bPlayerProtectFollower")
	bSpawnByLocation = fiss.loadBool("bSpawnByLocation")
	bRetrySpawnWithoutLocation = fiss.loadBool("bRetrySpawnWithoutLocation")
	bSpawnCheckRelation = fiss.loadBool("bSpawnCheckRelation")
	bSpawnBringAllies = fiss.loadBool("bSpawnBringAllies")
	bMoralityMatters = fiss.loadBool("bMoralityMatters")
	moaMoralityMatters.SetValue(bMoralityMatters As Int)
	iReducedSkill = fiss.loadInt("iReducedSkill")
	bSkillReduceRandomVal = fiss.loadBool("bSkillReduceRandomVal")
	fSkillReduceValSlider = fiss.loadFloat("fSkillReduceValSlider")
	fSkillReduceMinValSlider = fiss.loadFloat("fSkillReduceMinValSlider")
	fSkillReduceMaxValSlider = fiss.loadFloat("fSkillReduceMaxValSlider")
	bShowRaceMenu = fiss.loadBool("bShowRaceMenu")
	bLoseSkillForever = fiss.loadBool("bLoseSkillForever")
	bIsRagdollEnabled = fiss.loadBool("bIsRagdollEnabled")
	iLoseInclusion = fiss.loadInt("iLoseInclusion")
	fRespawnTimeSlider = fiss.loadFloat("fRespawnTimeSlider")
	If fRespawnTimeSlider > 0.0
		bShowTimeScaleWarning = False
	EndIf
	bRandomItemCurse = fiss.loadBool("bRandomItemCurse")
	bMoreRandomRespawn = fiss.loadBool("bMoreRandomRespawn")
	fMinLoseGoldSlider = fiss.loadFloat("fMinLoseGoldSlider")
	fMaxLoseGoldSlider = fiss.loadFloat("fMaxLoseGoldSlider")
	bLoseGoldAll = fiss.loadBool("bLoseGoldAll")
	bLoseArkayMarkAll = fiss.loadBool("bLoseArkayMarkAll")
	fMinLoseArkayMarkSlider = fiss.loadFloat("fMinLoseArkayMarkSlider")
	fMaxLoseArkayMarkSlider = fiss.loadFloat("fMaxLoseArkayMarkSlider")
	bLoseDragonSoulAll = fiss.loadBool("bLoseDragonSoulAll")
	fMinLoseDragonSoulSlider = fiss.loadFloat("fMinLoseDragonSoulSlider")
	fMaxLoseDragonSoulSlider = fiss.loadFloat("fMaxLoseDragonSoulSlider")
	bLoseBlackSoulGemAll = fiss.loadBool("bLoseBlackSoulGemAll")
	fMinLoseBlackSoulGemSlider = fiss.loadFloat("fMinLoseBlackSoulGemSlider")
	fMaxLoseBlackSoulGemSlider = fiss.loadFloat("fMaxLoseBlackSoulGemSlider")
	bLoseGrandSoulGemAll = fiss.loadBool("bLoseGrandSoulGemAll")
	fMaxLoseGrandSoulGemSlider = fiss.loadFloat("fMaxLoseGrandSoulGemSlider")
	fMinLoseGrandSoulGemSlider = fiss.loadFloat("fMinLoseGrandSoulGemSlider")
	fLoseOtherMinValueSlider = fiss.loadFloat("fLoseOtherMinValueSlider")
	fLoseOtherTotalValueSlider = fiss.loadFloat("fLoseOtherTotalValueSlider")
	fMaxItemsToCheckSlider = fiss.loadFloat("fMaxItemsToCheckSlider")
	fHealthPercTrigger = fiss.loadFloat("fHealthPercTrigger")
	fBossChestChanceSlider = fiss.loadFloat("fBossChestChanceSlider")
	bLoseItem = fiss.loadBool("bLoseItem")
	bExcludeQuestItems = fiss.loadBool("bExcludeQuestItems")
	bLoseGold = fiss.loadBool("bLoseGold")
	bLoseArkayMark = fiss.loadBool("bLoseArkayMark")
	bLoseBlackSoulGem = fiss.loadBool("bLoseBlackSoulGem")
	bLoseGrandSoulGem = fiss.loadBool("bLoseGrandSoulGem")
	bLoseDragonSoul = fiss.loadBool("bLoseDragonSoul")
	bLoseOthers = fiss.loadBool("bLoseOthers")
	bLoseAmmo = fiss.loadBool("bLoseAmmo")
	bLoseBook = fiss.loadBool("bLoseBook")
	bLoseArmor = fiss.loadBool("bLoseArmor")
	bLoseWeapon = fiss.loadBool("bLoseWeapon")
	bLoseMisc = fiss.loadBool("bLoseMisc")
	bLoseKey = fiss.loadBool("bLoseKey")
	bLoseSoulgem = fiss.loadBool("bLoseSoulgem")
	bLosePotion = fiss.loadBool("bLosePotion")
	bLoseScroll = fiss.loadBool("bLoseScroll")
	bLoseIngredient = fiss.loadBool("bLoseIngredient")
	bCheckKeyword = fiss.loadBool("bCheckKeyword")
	bCheckWeight = fiss.loadBool("bCheckWeight")
	bLevelReduce = fiss.loadBool("bLevelReduce")
	If bLevelReduce
		ReviveScript.SkillScript.RegisterForLevel()
	EndIf
	bOnlyLoseSkillXP = fiss.loadBool("bOnlyLoseSkillXP")
	bSpawnHostile = fiss.loadBool("bSpawnHostile")
	bBossChestOnlyCurLoc = fiss.loadBool("bBossChestOnlyCurLoc")
	moaOnlyInCurLocChest.SetValueInt(bBossChestOnlyCurLoc As Int)
	bBossChestNotInClearedLoc = fiss.loadBool("bBossChestNotInClearedLoc")
	moaBossChestNotInclearedLoc.SetValue(bBossChestNotInClearedLoc As Int)
	bAlwaysSpawn = fiss.loadBool("bAlwaysSpawn")
	bOnlySpawn = fiss.loadBool("bOnlySpawn")
	bDisableUnsafe = fiss.loadBool("bDisableUnsafe")
	iSelectedCustomRPSlot = fiss.loadInt("iSelectedCustomRPSlot")
	fTotalCustomRPSlotSlider = fiss.loadFloat("fTotalCustomRPSlotSlider")
	bDoNotStopCombat = fiss.loadBool("bDoNotStopCombat")
	bDoNotStopCombatAfterRevival = fiss.loadBool("bDoNotStopCombatAfterRevival")
	SetCustomRPFlags()
	recalcCursedDisCureCosts()
	If bDisableUnsafe
		bLoseForever = False
		bLoseSkillForever = False
		fRespawnTimeSlider = 0.0
	EndIf
	String Result = fiss.endLoad()
	if Result != ""
		If bCheckFissErrors(Result)
			bSaveUserSettings(sFileName)
			Return True
		EndIf
		Return False
	EndIf
	Return True
EndFunction

Bool Function bCheckFissErrors(String strErrors)
	String[] resultArr = Split(strErrors,"\n")
	Int index = resultArr.Length
	Bool Result = True
	String strError
	While index > 0
		index -= 1
		strError = resultArr[index]
		If strError == "Element bDoNotStopCombat not found"
			bDoNotStopCombat = False
		ElseIf strError == "Element bDoNotStopCombatAfterRevival not found"
			bDoNotStopCombatAfterRevival = True
		ElseIf strError == "Element bAlwaysSpawn not found"
			bAlwaysSpawn = False
		ElseIf strError == "Element bOnlySpawn not found"
			bOnlySpawn = False
		ElseIf strError == "Element bOnlyLoseSkillXP not found"
			bOnlyLoseSkillXP = False
		ElseIf strError == "Element fHealthPercTrigger not found"
			fHealthPercTrigger = 0.00
		ElseIf strError == "Element fDisChanceSlider not found"
			fDisChanceSlider = 25.00
		ElseIf strError == "Element fDisProgChanceSlider not found"
			fDisProgChanceSlider = 50.00
		ElseIf strError == "Element fDisPriceSlider not found"
			fDisPriceSlider = 100.00
			recalcCursedDisCureCosts()
		ElseIf strError == "Element fValueMarkScaleSlider not found"
			fValueMarkScaleSlider = 0.00
		ElseIf strError == "Element fValueGSoulGemScaleSlider,  not found"
			fValueGSoulGemScaleSlider  = 0.00
		ElseIf strError == "Element fValueBSoulGemScaleSlider not found"
			fValueBSoulGemScaleSlider = 0.00
		ElseIf strError == "Element fValueSoulScaleSlider,  not found"
			fValueSoulScaleSlider = 0.00
		ElseIf strError == "Element fValueGoldScaleSlider,  not found"
			fValueGoldScaleSlider = 0.00
		ElseIf strError == "Element fDisPriceMultSlider not found"
			fDisPriceMultSlider = 0.5
			recalcCursedDisCureCosts()
		ElseIf strError == "Element fBossChestChanceSlider not found"
			fBossChestChanceSlider = 0.0
		ElseIf strError == "Element bMultipleDis not found"
			bMultipleDis = True
		ElseIf strError == "Element bDiseaseCurse not found"
			bDiseaseCurse = False
		ElseIf strError == "Element bMultipleDisProg not found"
			bMultipleDisProg = True
		ElseIf strError == "Element bOnlyInfectIfHasBaseDis not found"
			bOnlyInfectIfHasBaseDis = True
		ElseIf strError == "Element bCureDisIfHasBlessing not found"
			bCureDisIfHasBlessing = False
			moaCureDisIfHasBlessing.SetValueInt(0)
		ElseIf strError == "Element bBossChestOnlyCurLoc not found"
			bBossChestOnlyCurLoc = False
			moaOnlyInCurLocChest.SetValueInt(0)
		ElseIf strError == "Element bBossChestNotInClearedLoc not found"
			bBossChestNotInClearedLoc = True
			moaBossChestNotInclearedLoc.SetValueInt(0)
		ElseIf strError == "Element fMaxItemsToCheckSlider not found"
			fMaxItemsToCheckSlider = 1000.0
		ElseIf strError == "Element bCanbeKilledbyUnarmed not found"
			bCanbeKilledbyUnarmed = True
		Else
			Debug.Trace("Mark of Arkay: Error loading user settings -> " + strError)
			Result = False
		EndIf
	EndWhile
	Return Result
EndFunction

Bool Function bCheckPreset(FISSInterface fiss, String sFileName)
	fiss.beginLoad(sFileName)
	String Result = fiss.endLoad()
	If Result != ""
		Debug.Trace("Mark of Arkay: Error loading user settings -> " + Result)
		Return False
	EndIf
	Return True
EndFunction

bool function bSaveUserSettings(String sFileName)
	FISSInterface fiss = FISSFactory.getFISS()
	If !fiss
		Debug.Trace("Mark of Arkay: Error saving user settings -> FISS not installed. Saving disabled.")
		Return False
	EndIf
	fiss.beginSave(sFileName, "Mark of Arkay")
	fiss.saveBool("bIsRevivalEnabled", bIsRevivalEnabled)
	fiss.saveFloat("fValueSnoozeSlider", fValueSnoozeSlider)
	fiss.saveBool("bIsMarkEnabled", bIsMarkEnabled)
	fiss.saveBool("bIsGSoulGemEnabled", bIsGSoulGemEnabled)
	fiss.saveBool("bIsBSoulGemEnabled", bIsBSoulGemEnabled)
	fiss.saveBool("bIsDragonSoulEnabled", bIsDragonSoulEnabled)
	fiss.saveBool("bIsGoldEnabled", bIsGoldEnabled)
	fiss.saveFloat("fValueMarkSlider", fValueMarkSlider)
	fiss.saveFloat("fValueGSoulGemSlider", fValueGSoulGemSlider)
	fiss.saveFloat("fValueBSoulGemSlider", fValueBSoulGemSlider)
	fiss.saveFloat("fValueSoulSlider", fValueSoulSlider)
	fiss.saveFloat("fValueGoldSlider", fValueGoldSlider)
	fiss.saveInt("iSaveOption", iSaveOption)
	fiss.saveInt("iHostileOption", iHostileOption)
	fiss.saveBool("bIsNoFallDamageEnabled", bIsNoFallDamageEnabled)
	fiss.saveBool("bIsEffectEnabled", bIsEffectEnabled)
	fiss.saveBool("bIsPotionEnabled", bIsPotionEnabled)
	fiss.saveBool("bAutoDrinkPotion", bAutoDrinkPotion)
	fiss.saveBool("bIsRevivalRequiresBlessing", bIsRevivalRequiresBlessing)
	fiss.saveBool("bShiftBackRespawn", bShiftBackRespawn)
	fiss.saveBool("bIsRecallRestricted", bIsRecallRestricted)
	fiss.saveBool("bAutoSwitchRP", bAutoSwitchRP)
	fiss.saveFloat("fMarkCastSlider", fMarkCastSlider)
	fiss.saveFloat("fRecallCastSlider", fRecallCastSlider)
	fiss.saveBool("bIsMenuEnabled", bIsMenuEnabled)
	fiss.saveFloat("fMarkPSlider", fMarkPSlider)
	fiss.saveFloat("fGoldPSlider", fGoldPSlider)
	fiss.saveFloat("fDragonSoulPSlider", fDragonSoulPSlider)
	fiss.saveFloat("fGSoulgemPSlider", fGSoulgemPSlider)
	fiss.saveFloat("fBSoulgemPSlider", fBSoulgemPSlider)
	fiss.saveFloat("fBleedoutTimeSlider", fBleedoutTimeSlider)
	fiss.saveFloat("fRecoveryTimeSlider", fRecoveryTimeSlider)
	fiss.saveFloat("fLootChanceSlider", fLootChanceSlider)
	fiss.saveFloat("fScrollChanceSlider", fScrollChanceSlider)
	fiss.saveInt("iNotTradingAftermath", iNotTradingAftermath)
	fiss.saveInt("iArkayCurse", iArkayCurse)
	fiss.saveBool("bRespawnNaked", bRespawnNaked)
	fiss.saveBool("bCorpseAsSoulMark", bCorpseAsSoulMark)
	fiss.saveBool("bSendToJail", bSendToJail)
	fiss.saveBool("bKillIfCantRespawn", bKillIfCantRespawn)
	fiss.saveBool("bCanbeKilledbyUnarmed", bCanbeKilledbyUnarmed)
	fiss.saveBool("bTeleportMenu", bTeleportMenu)
	fiss.saveBool("bMultipleDis", bMultipleDis)
	fiss.saveBool("bDiseaseCurse", bDiseaseCurse)
	fiss.saveBool("bMultipleDisProg", bMultipleDisProg)
	fiss.saveBool("bOnlyInfectIfHasBaseDis", bOnlyInfectIfHasBaseDis)
	fiss.saveBool("bCureDisIfHasBlessing", bCureDisIfHasBlessing)
	fiss.saveBool("bRespawnMenu", bRespawnMenu)
	fiss.saveBool("bFollowerProtectPlayer", bFollowerProtectPlayer)
	fiss.saveBool("bPlayerProtectFollower", bPlayerProtectFollower)
	fiss.saveBool("bSpawnByLocation", bSpawnByLocation)
	fiss.saveBool("bRetrySpawnWithoutLocation", bRetrySpawnWithoutLocation)
	fiss.saveBool("bSpawnCheckRelation", bSpawnCheckRelation)
	fiss.saveBool("bSpawnBringAllies", bSpawnBringAllies)
	fiss.saveBool("bArkayCurse", bArkayCurse)
	fiss.saveBool("bIsArkayCurseTemporary", bIsArkayCurseTemporary)
	fiss.saveBool("bHealActors", bHealActors)
	fiss.saveBool("bResurrectActors", bResurrectActors)
	fiss.saveBool("bLoseForever", bLoseForever)
	fiss.saveBool("bSoulMarkStay", bSoulMarkStay)
	;fiss.saveBool("bLostItemQuest", bLostItemQuest)
	fiss.saveBool("bCreaturesCanSteal", bCreaturesCanSteal)
	fiss.saveBool("bMoralityMatters", bMoralityMatters)
	fiss.saveInt("iTeleportLocation", iTeleportLocation)
	fiss.saveInt("iExternalIndex", iExternalIndex)
	fiss.saveFloat("fRPMinDistanceSlider", fRPMinDistanceSlider)
	fiss.saveFloat("fDisChanceSlider", fDisChanceSlider)
	fiss.saveFloat("fDisPriceSlider", fDisPriceSlider)
	fiss.saveFloat("fValueMarkScaleSlider", fValueMarkScaleSlider)
	fiss.saveFloat("fValueGSoulGemScaleSlider", fValueGSoulGemScaleSlider)
	fiss.saveFloat("fValueBSoulGemScaleSlider", fValueBSoulGemScaleSlider)
	fiss.saveFloat("fValueSoulScaleSlider", fValueSoulScaleSlider)
	fiss.saveFloat("fValueGoldScaleSlider", fValueGoldScaleSlider)
	fiss.saveFloat("fDisPriceMultSlider", fDisPriceMultSlider)
	fiss.saveFloat("fDisProgChanceSlider", fDisProgChanceSlider)
	fiss.saveBool("bRespawnPointsFlags0", bRespawnPointsFlags[0])
	fiss.saveBool("bRespawnPointsFlags1", bRespawnPointsFlags[1])
	fiss.saveBool("bRespawnPointsFlags2", bRespawnPointsFlags[2])
	fiss.saveBool("bRespawnPointsFlags3", bRespawnPointsFlags[3])
	fiss.saveBool("bRespawnPointsFlags4", bRespawnPointsFlags[4])
	fiss.saveBool("bRespawnPointsFlags5", bRespawnPointsFlags[5])
	fiss.saveBool("bRespawnPointsFlags6", bRespawnPointsFlags[6])
	fiss.saveBool("bRespawnPointsFlags7", bRespawnPointsFlags[7])
	fiss.SaveInt("iSpawnCounts0",iSpawnCounts[0])
	fiss.SaveInt("iSpawnCounts1",iSpawnCounts[1])
	fiss.SaveInt("iSpawnCounts2",iSpawnCounts[2])
	fiss.SaveInt("iSpawnCounts3",iSpawnCounts[3])
	fiss.SaveInt("iSpawnCounts4",iSpawnCounts[4])
	fiss.SaveInt("iSpawnCounts5",iSpawnCounts[5])
	fiss.SaveInt("iSpawnCounts6",iSpawnCounts[6])
	fiss.SaveInt("iSpawnCounts7",iSpawnCounts[7])
	fiss.SaveInt("iSpawnCounts8",iSpawnCounts[8])
	fiss.SaveInt("iSpawnCounts9",iSpawnCounts[9])
	fiss.SaveInt("iSpawnCounts10",iSpawnCounts[10])
	fiss.SaveInt("iSpawnCounts11",iSpawnCounts[11])
	fiss.SaveInt("iSpawnCounts12",iSpawnCounts[12])
	fiss.SaveInt("iSpawnCounts13",iSpawnCounts[13])
	fiss.SaveInt("iSpawnCounts14",iSpawnCounts[14])
	fiss.SaveInt("iSpawnCounts15",iSpawnCounts[15])
	fiss.SaveInt("iSpawnCounts16",iSpawnCounts[16])
	fiss.SaveInt("iSpawnCounts17",iSpawnCounts[17])
	fiss.SaveInt("iSpawnCounts18",iSpawnCounts[18])
	fiss.SaveInt("iSpawnCounts19",iSpawnCounts[19])
	fiss.SaveInt("iSpawnCounts20",iSpawnCounts[20])
	fiss.SaveInt("iSpawnCounts21",iSpawnCounts[21])
	fiss.SaveInt("iSpawnCounts22",iSpawnCounts[22])
	fiss.SaveInt("iSpawnCounts23",iSpawnCounts[23])
	fiss.SaveInt("iSpawnCounts24",iSpawnCounts[24])
	fiss.SaveInt("iSpawnCounts25",iSpawnCounts[25])
	fiss.SaveInt("iSpawnCounts26",iSpawnCounts[26])
	fiss.SaveInt("iSpawnCounts27",iSpawnCounts[27])
	fiss.SaveInt("iSpawnWeights0",iSpawnWeights[0])
	fiss.SaveInt("iSpawnWeights1",iSpawnWeights[1])
	fiss.SaveInt("iSpawnWeights2",iSpawnWeights[2])
	fiss.SaveInt("iSpawnWeights3",iSpawnWeights[3])
	fiss.SaveInt("iSpawnWeights4",iSpawnWeights[4])
	fiss.SaveInt("iSpawnWeights5",iSpawnWeights[5])
	fiss.SaveInt("iSpawnWeights6",iSpawnWeights[6])
	fiss.SaveInt("iSpawnWeights7",iSpawnWeights[7])
	fiss.SaveInt("iSpawnWeights8",iSpawnWeights[8])
	fiss.SaveInt("iSpawnWeights9",iSpawnWeights[9])
	fiss.SaveInt("iSpawnWeights10",iSpawnWeights[10])
	fiss.SaveInt("iSpawnWeights11",iSpawnWeights[11])
	fiss.SaveInt("iSpawnWeights12",iSpawnWeights[12])
	fiss.SaveInt("iSpawnWeights13",iSpawnWeights[13])
	fiss.SaveInt("iSpawnWeights14",iSpawnWeights[14])
	fiss.SaveInt("iSpawnWeights15",iSpawnWeights[15])
	fiss.SaveInt("iSpawnWeights16",iSpawnWeights[16])
	fiss.SaveInt("iSpawnWeights17",iSpawnWeights[17])
	fiss.SaveInt("iSpawnWeights18",iSpawnWeights[18])
	fiss.SaveInt("iSpawnWeights19",iSpawnWeights[19])
	fiss.SaveInt("iSpawnWeights20",iSpawnWeights[20])
	fiss.SaveInt("iSpawnWeights21",iSpawnWeights[21])
	fiss.SaveInt("iSpawnWeights22",iSpawnWeights[22])
	fiss.SaveInt("iSpawnWeights23",iSpawnWeights[23])
	fiss.SaveInt("iSpawnWeights24",iSpawnWeights[24])
	fiss.SaveInt("iSpawnWeights25",iSpawnWeights[25])
	fiss.SaveInt("iSpawnWeights26",iSpawnWeights[26])
	fiss.SaveInt("iSpawnWeights27",iSpawnWeights[27])
	fiss.SaveInt("iSpawnMinLevel",iSpawnMinLevel)
	fiss.SaveInt("iSpawnMaxLevel",iSpawnMaxLevel)
	fiss.saveBool("bIsLoggingEnabled", bIsLoggingEnabled)
	fiss.saveBool("bIsInfoEnabled", bIsInfoEnabled)
	fiss.saveBool("bIsNotificationEnabled", bIsNotificationEnabled)
	fiss.saveBool("bFadeToBlack", bFadeToBlack)
	fiss.saveBool("bInvisibility", bInvisibility)
	fiss.saveBool("bIsTradeEnabled", bIsTradeEnabled)
	fiss.saveBool("bDeathEffect", bDeathEffect)
	fiss.saveBool("bAltEyeFix", bAltEyeFix)
	fiss.saveInt("iReducedSkill", iReducedSkill)
	fiss.saveInt("iLoseInclusion", iLoseInclusion)
	fiss.saveBool("bSkillReduceRandomVal", bSkillReduceRandomVal)
	fiss.saveFloat("fSkillReduceValSlider", fSkillReduceValSlider)
	fiss.saveFloat("fSkillReduceMinValSlider", fSkillReduceMinValSlider)
	fiss.saveFloat("fSkillReduceMaxValSlider", fSkillReduceMaxValSlider)
	fiss.saveBool("bShowRaceMenu",bShowRaceMenu)
	fiss.saveBool("bLoseSkillForever",bLoseSkillForever)
	fiss.saveBool("bIsRagdollEnabled",bIsRagdollEnabled)
	fiss.SaveFloat("fRespawnTimeSlider",fRespawnTimeSlider)
	fiss.SaveBool("bDisableUnsafe",bDisableUnsafe)
	fiss.SaveBool("bRandomItemCurse",bRandomItemCurse)
	fiss.SaveBool("bMoreRandomRespawn",bMoreRandomRespawn)
	fiss.saveFloat("fMinLoseGoldSlider",fMinLoseGoldSlider)
	fiss.saveFloat("fMaxLoseGoldSlider",fMaxLoseGoldSlider)
	fiss.saveBool("bLoseGoldAll",bLoseGoldAll)
	fiss.saveBool("bLoseArkayMarkAll",bLoseArkayMarkAll)
	fiss.saveFloat("fMinLoseArkayMarkSlider",fMinLoseArkayMarkSlider)
	fiss.saveFloat("fMaxLoseArkayMarkSlider",fMaxLoseArkayMarkSlider)
	fiss.saveBool("bLoseDragonSoulAll",bLoseDragonSoulAll)
	fiss.saveFloat("fMinLoseDragonSoulSlider",fMinLoseDragonSoulSlider)
	fiss.saveFloat("fMaxLoseDragonSoulSlider",fMaxLoseDragonSoulSlider)
	fiss.saveBool("bLoseBlackSoulGemAll",bLoseBlackSoulGemAll)
	fiss.saveFloat("fMinLoseBlackSoulGemSlider",fMinLoseBlackSoulGemSlider)
	fiss.saveFloat("fMaxLoseBlackSoulGemSlider",fMaxLoseBlackSoulGemSlider)
	fiss.saveBool("bLoseGrandSoulGemAll",bLoseGrandSoulGemAll)
	fiss.saveFloat("fMaxLoseGrandSoulGemSlider",fMaxLoseGrandSoulGemSlider)
	fiss.saveFloat("fMinLoseGrandSoulGemSlider",fMinLoseGrandSoulGemSlider)
	fiss.saveFloat("fLoseOtherMinValueSlider",fLoseOtherMinValueSlider)
	fiss.saveFloat("fLoseOtherTotalValueSlider",fLoseOtherTotalValueSlider)
	fiss.saveFloat("fMaxItemsToCheckSlider",fMaxItemsToCheckSlider)
	fiss.saveFloat("fBossChestChanceSlider",fBossChestChanceSlider)
	fiss.saveFloat("fHealthPercTrigger",fHealthPercTrigger)
	fiss.saveBool("bExcludeQuestItems",bExcludeQuestItems)
	fiss.saveBool("bLoseItem",bLoseItem)
	fiss.saveBool("bLoseGold",bLoseGold)
	fiss.saveBool("bLoseArkayMark",bLoseArkayMark)
	fiss.saveBool("bLoseBlackSoulGem",bLoseBlackSoulGem)
	fiss.saveBool("bLoseGrandSoulGem",bLoseGrandSoulGem)
	fiss.saveBool("bLoseDragonSoul",bLoseDragonSoul)
	fiss.saveBool("bLoseOthers",bLoseOthers)
	fiss.saveBool("bLoseAmmo",bLoseAmmo)
	fiss.saveBool("bLoseBook",bLoseBook)
	fiss.saveBool("bLoseArmor",bLoseArmor)
	fiss.saveBool("bLoseWeapon",bLoseWeapon)
	fiss.saveBool("bLoseMisc",bLoseMisc)
	fiss.saveBool("bLoseKey",bLoseKey)
	fiss.saveBool("bLoseSoulgem",bLoseSoulgem)
	fiss.saveBool("bLosePotion",bLosePotion)
	fiss.saveBool("bLoseScroll",bLoseScroll)
	fiss.saveBool("bLoseIngredient",bLoseIngredient)
	fiss.saveBool("bCheckKeyword",bCheckKeyword)
	fiss.saveBool("bCheckWeight",bCheckWeight)
	fiss.saveBool("bLevelReduce",bLevelReduce)
	fiss.saveBool("bOnlyLoseSkillXP",bOnlyLoseSkillXP)
	fiss.saveInt("iSelectedCustomRPSlot",iSelectedCustomRPSlot)
	fiss.SaveFloat("fTotalCustomRPSlotSlider",fTotalCustomRPSlotSlider)
	fiss.SaveBool("bSpawnHostile", bSpawnHostile)
	fiss.SaveBool("bBossChestOnlyCurLoc", bBossChestOnlyCurLoc)
	fiss.SaveBool("bBossChestNotInClearedLoc", bBossChestNotInClearedLoc)
	fiss.SaveBool("bAlwaysSpawn", bAlwaysSpawn)
	fiss.SaveBool("bOnlySpawn", bOnlySpawn)
	fiss.saveBool("bDoNotStopCombat", bDoNotStopCombat)
	fiss.saveBool("bDoNotStopCombatAfterRevival", bDoNotStopCombatAfterRevival)
	String Result = fiss.endSave()
	If Result != ""
		Debug.Trace("Mark of Arkay: Error saving user settings -> " + Result)
		Return False
	EndIf
	Return True
EndFunction

function LoadDefaultSettings()
	bIsRevivalEnabled = True
	fValueSnoozeSlider = 0.0
	bIsMarkEnabled = True
	bIsGSoulGemEnabled = True
	bIsBSoulGemEnabled = True
	bIsDragonSoulEnabled = True
	bIsGoldEnabled = True
	fValueMarkSlider = 1.0
	fValueGSoulGemSlider = 1.0
	fValueBSoulGemSlider = 1.0
	fValueSoulSlider = 1.0
	fValueGoldSlider = 1000.0
	iSaveOption = 1
	SetSavingOption(iSaveOption)
	iHostileOption = 0
	bIsNoFallDamageEnabled = False
	ToggleFallDamage(!bIsNoFallDamageEnabled)
	bIsEffectEnabled = False
	bIsPotionEnabled = False
	bAutoDrinkPotion = False
	bShiftBackRespawn = True
	bIsRecallRestricted = True
	bAutoSwitchRP = False
	fMarkCastSlider = 0.0
	fRecallCastSlider = 0.0
	bIsMenuEnabled = True
	fMarkPSlider = 5.0
	fGoldPSlider = 4.0
	fDragonSoulPSlider = 3.0
	fGSoulgemPSlider = 2.0
	fBSoulgemPSlider = 1.0
	fBleedoutTimeSlider = 6.0
	fRecoveryTimeSlider = 1.0
	fLootChanceSlider = 50.0
	moaLootChance.SetValue(100.0 -  fLootChanceSlider)
	fScrollChanceSlider = 25.0
	moaScrollChance.SetValue(100.0 -  fScrollChanceSlider)
	iNotTradingAftermath = 0
	iArkayCurse = 0
	bRespawnNaked = False
	bCorpseAsSoulMark = False
	bSendToJail = False
	bDoNotStopCombat = False
	bDoNotStopCombatAfterRevival = True
	bKillIfCantRespawn = False
	bTeleportMenu = True
	bMultipleDis = True
	bDiseaseCurse = False
	bMultipleDisProg = True
	bOnlyInfectIfHasBaseDis = True
	bCureDisIfHasBlessing = False
	moaCureDisIfHasBlessing.SetValueInt(0)
	bRespawnMenu = False
	bFollowerProtectPlayer = False
	bPlayerProtectFollower = False
	bSpawnByLocation = True
	bRetrySpawnWithoutLocation = True
	bSpawnCheckRelation = True
	bSpawnBringAllies = True
	bArkayCurse = False
	bIsArkayCurseTemporary = False
	bHealActors = False
	bResurrectActors = False
	bLoseForever = False
	bSoulMarkStay = False
	bLostItemQuest = True
	bCreaturesCanSteal = False
	moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
	bMoralityMatters = True
	moaMoralityMatters.SetValue(bMoralityMatters As Int)
	iTeleportLocation = 0
	iExternalIndex = -1
	fRPMinDistanceSlider = 2000.0
	moaRPMinDistance.SetValue(fRPMinDistanceSlider)
	fDisChanceSlider = 25.0
	fDisProgChanceSlider = 50.0
	fDisPriceSlider = 100.0
	fDisPriceMultSlider = 0.5
	fValueMarkScaleSlider = 0.0
	fValueGSoulGemScaleSlider = 0.0
	fValueBSoulGemScaleSlider = 0.0
	fValueSoulScaleSlider = 0.0
	fValueGoldScaleSlider = 0.0
	setRPFlags(True)
	setSpawnCounts(True)
	setSpawnWeights(True)
	iSpawnMinLevel = 4
	iSpawnMaxLevel = 4
	bIsLoggingEnabled = False
	bIsInfoEnabled = False
	bIsNotificationEnabled = False
	bFadeToBlack = True
	bInvisibility = False
	bIsTradeEnabled = True
	bDeathEffect = True
	bAltEyeFix = False
	iReducedSkill = 0
	bSkillReduceRandomVal = False
	fSkillReduceValSlider = 10.0
	fSkillReduceMinValSlider = 0.0
	fSkillReduceMaxValSlider = 1.0
	bShowRaceMenu = False
	bLoseSkillForever = False
	bIsRagdollEnabled = False
	fRespawnTimeSlider = 0.0
	bDisableUnsafe = True
	bRandomItemCurse = False
	bMoreRandomRespawn = False
	iLoseInclusion = 0
	fMinLoseGoldSlider = 50.0
	fMaxLoseGoldSlider = 250.0
	bLoseGoldAll = False
	bLoseArkayMarkAll = False
	fMinLoseArkayMarkSlider = 0.0
	fMaxLoseArkayMarkSlider = 1.0
	bLoseDragonSoulAll = False
	fMinLoseDragonSoulSlider = 0.0
	fMaxLoseDragonSoulSlider = 1.0
	bLoseBlackSoulGemAll = False
	fMinLoseBlackSoulGemSlider = 0.0
	fMaxLoseBlackSoulGemSlider = 1.0
	bLoseGrandSoulGemAll = False
	fMaxLoseGrandSoulGemSlider = 1.0
	fMinLoseGrandSoulGemSlider = 0.0
	fLoseOtherMinValueSlider = 0.0
	fLoseOtherTotalValueSlider = 0.0
	fMaxItemsToCheckSlider = 1000.0
	fBossChestChanceSlider = 0.0
	fHealthPercTrigger = 0.00
	bExcludeQuestItems = True
	bLoseItem = False
	bLoseGold = True
	bLoseArkayMark = False
	bLoseBlackSoulGem = False
	bLoseGrandSoulGem = False
	bLoseDragonSoul = False
	bLoseOthers = False
	bLoseAmmo = False
	bLoseBook = False
	bLoseArmor = True
	bLoseWeapon = True
	bLoseMisc = False
	bLoseKey = False
	bLoseSoulgem = False
	bLosePotion = False
	bLoseScroll = False
	bLoseIngredient = False
	bCheckKeyword = True
	bCheckWeight = True
	bLevelReduce = False
	bOnlyLoseSkillXP = False
	bSpawnHostile = False
	bBossChestOnlyCurLoc = False
	bBossChestNotInClearedLoc = True
	bAlwaysSpawn = False
	bOnlySpawn = False
	fTotalCustomRPSlotSlider = 1.0
	iSelectedCustomRPSlot = 0
	SetCustomRPFlags()
	recalcCursedDisCureCosts()
EndFunction

Function ForceCloseMenu()
	;ForcePageReset()
	UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.ConfigPanelClose") ; mcm
	UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.CloseMenu") ; quest journal
	Utility.Wait(0.5)
EndFunction

Bool Function isCustomSlotAvailable(Int aiIndex)
	Return (CustomRespawnPoints.GetAt(aiIndex) As ObjectReference).IsEnabled()
EndFunction

Bool Function isCustomSlotEmpty(Int aiIndex)
	Return (CustomRespawnPoints.GetAt(aiIndex) As ObjectReference).GetParentCell() == ReviveScript.DefaultCell
EndFunction

Bool Function isCustomSlotSelected(Int aiIndex)
	Return aiIndex == iSelectedCustomRPSlot
EndFunction

Function ShowCustomSlotsInfo()
	Int i = 0
	String sCellName
	Cell aCell
	String sType
	While i < CustomRespawnPoints.GetSize()
		sCellName = "No Name"
		aCell = None
		sType = "Unknown"
		If !isCustomSlotEmpty(i)
			If (CustomRespawnPoints.GetAt(i) As ObjectReference).GetParentCell()
				aCell = (CustomRespawnPoints.GetAt(i) As ObjectReference).GetParentCell()
			EndIf
			If aCell
				If aCell.GetName()
					sCellName = aCell.GetName()
				EndIf
				If aCell.IsInterior()
					sType = "Interior"
				Else
					sType = "Exterior"
				EndIf
			EndIf
			Debug.Notification("Mark of Arkay - " + (i + 1) + ": " + sCellName + " (" + sType + ")")
		Else
			Debug.Notification("Mark of Arkay - " + (i + 1) + ": Empty")
		EndIf
		i += 1
	EndWhile
EndFunction

Function checkMods()
	bSKSEOK = bCheckSKSE()
	bDLIEOK = bCheckDLIE()
	bUIEOK = bCheckUIE()
	bFISSOK = bCheckFISS()
	bARCCOK = bCheckARCC()
	bPUOK = bCheckPUtil()
EndFunction

Bool Function bCheckSKSE()
	bSKSELoaded = SKSE.GetVersion()
	If bSKSELoaded
		Return ( SKSE.GetVersion() == 1 && SKSE.GetVersionRelease() >= 43 ) || ( SKSE.GetVersion() == 2 && SKSE.GetVersionRelease() >= 54 )
	Else
		Debug.Notification("$mrt_MarkofArkay_Notification_SKSE_Error")
		Debug.Trace("MarkOfArkay: [Error] SKSE not found.")
		Return False
	EndIf
EndFunction

Bool Function bCheckFISS()
	Int iFissIndex = Game.GetModByName("FISS.esp")
	Return (iFissIndex > 0 && iFissIndex < 255 && bSKSELoaded && \
	((SKSE.GetVersion() == 1 && SKSE.GetPluginVersion("fiss") != -1) || (SKSE.GetVersion() == 2 && SKSE.GetPluginVersion("fisses") != -1)))
EndFunction

Bool Function bCheckUIE()
	Int iExtsIndex = Game.GetModByName("UIExtensions.esp")
	Return (iExtsIndex > 0 && iExtsIndex < 255)
EndFunction

Bool Function bCheckARCC()
	Int iARCCIndex = Game.GetModByName("mrt_ARCC.esp")
	Return (iARCCIndex > 0 && iARCCIndex < 255)
EndFunction

Bool Function bCheckDLIE()
	Return bSKSELoaded && SKSE.GetPluginVersion("DSL Level Up Event Plugin") != -1 && DSL_LevelIncreaseEvent.bIsDLIELoaded()
EndFunction

Bool Function bCheckPUtil()
	Return bSKSELoaded && SKSE.GetPluginVersion("papyrusutil plugin") != -1
EndFunction

Function ShowLostItems()
	UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
	If !ListMenu || LostItemsChest.GetNumItems() == 0
		Return
	EndIf
	String sText
	int count = LostItemsChest.GetNumItems()
	Int iResult = 0
	If count < 128
		Int i = 0
		Form kItem
		While i < LostItemsChest.GetNumItems()
			kItem = LostItemsChest.GetNthForm(i)
			If kItem
				If kItem.GetName()
					sText = LostItemsChest.GetItemCount(kItem) + " " + kItem.GetName()
				Else
					sText = LostItemsChest.GetItemCount(kItem) + " ?"
				EndIf
			Else
				sText = "?"
			EndIf
			If GetLength(sText) > 40
				sText = Substring(sText,0, 37) + "..."
			EndIf
			listMenu.AddEntryItem(sText, -1, -1, False)
			i += 1
		EndWhile
		listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_Exit", -1, -1, False)
		ForceCloseMenu()
		listMenu.OpenMenu(none, none)
		iResult = listMenu.GetResultInt()
		While iResult > -1 && iResult < LostItemsChest.GetNumItems()
				kItem = LostItemsChest.GetNthForm(iResult)
				;UIWheelMenu wheelMenu = uiextensions.GetMenu("UIWheelMenu", True) as UIWheelMenu
				;wheelMenu.SetPropertyIndexString("optionText", 0, "Name")
				;wheelMenu.SetPropertyIndexString("optionLabelText", 0, "Name")
				;wheelMenu.SetPropertyIndexBool("optionEnabled", 0, True)
				;wheelMenu.SetPropertyIndexString("optionText", 1, "Type")
				;wheelMenu.SetPropertyIndexString("optionLabelText", 1, "Type")
				;wheelMenu.SetPropertyIndexBool("optionEnabled", 1, True)
				;iResult = wheelMenu.OpenMenu(none, none)
				;If iResult == 0 || iResult == 1
				;	do something
				;EndIf
				Int iType = kItem.GetType()
				String sType = sType(iType)
				Int iFormID = kItem.GetFormID()
				moaLostItemMenu.Show(iType,kItem.GetGoldValue(),LostItemsChest.GetItemCount(kItem),kItem.GetWeight(),iFormID)
				Debug.Notification("Mark of Arkay - Name: " + kItem.GetName())
				Debug.Notification("Mark of Arkay - Type: " + sType)
				Debug.Notification("Mark of Arkay - FormID: " + sDecToHex(iFormID))
				listMenu.OpenMenu(none, none)
				iResult = listMenu.GetResultInt()
		EndWhile
		listMenu.ResetMenu()
	Else
		Int iPage = 1
		Int iPrevPage = -1
		Int iTotal = 124
		Int iTotalPages = (Count / iTotal) As Int
		Int iLast = 127 ;Index of last item in last page
		If (Count % iTotal) > 0
			iTotalPages += 1
			iLast = (Count % iTotal) + 3
		EndIf
		ForceCloseMenu()
		Int i
		Form kItem
		While iPage > 0
			If iPrevPage != iPage
				iPrevPage = iPage
				listMenu.ResetMenu()
				If iPage == 1
					listMenu.AddEntryItem((iPage + 1) + "/" + iTotalPages + " >", -1, -1, False)
				Else 
					listMenu.AddEntryItem("< " + (iPage - 1) + "/" + iTotalPages + "", -1, -1, False)
				EndIf
				listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_GoToPage", -1, -1, False)
				i = ((iPage - 1) * iTotal)
				While i < iMin((iPage * iTotal),LostItemsChest.GetNumItems())
					kItem = LostItemsChest.GetNthForm(i)
					If kItem
						If kItem.GetName()
							sText = LostItemsChest.GetItemCount(kItem) + " " + kItem.GetName()
						Else
							sText = LostItemsChest.GetItemCount(kItem) + " ?"
						EndIf
					Else
						sText = "?"
					EndIf
					If GetLength(sText) > 40
						sText = Substring(sText,0, 37) + "..."
					EndIf
					listMenu.AddEntryItem(sText, -1, -1, False)
					i += 1
				EndWhile
				If iPage < iTotalPages
					listMenu.AddEntryItem((iPage + 1) + "/" + iTotalPages + " >", -1, -1, False)
				Else
					listMenu.AddEntryItem("< " + (iPage - 1) + "/" + iTotalPages, -1, -1, False)
				EndIf
				listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_Exit", -1, -1, False)
			EndIf
			listMenu.OpenMenu(none, none)
			iResult = listMenu.GetResultInt()
			If iResult == -1
				iPage = 0
				listMenu.ResetMenu()
			Else
				If (iPage < iTotalPages && iResult == 126) || (iPage == iTotalPages && iResult == (iLast - 1))
					If iPage < iTotalPages
						iPage += 1
					Else
						iPage -= 1
					EndIf
				ElseIf (iPage < iTotalPages && iResult == 127) || (iPage == iTotalPages && iResult == iLast)
					iPage = 0
					listMenu.ResetMenu()
				ElseIf iResult == 0
					If iPage > 1
						iPage -= 1
					Else
						iPage += 1
					EndIf
				ElseIf iResult == 1
					UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
					TextMenu.OpenMenu(none,none)
					String sResult = TextMenu.GetResultString()
					i = 0
					Bool bIsDigit = True
					While ( i < getLength(sResult) && bIsDigit )
						If !IsDigit(GetNthChar(sResult,i))
							bIsDigit = False
						EndIf
						i += 1
					EndWhile
					If bIsDigit
						If ((sResult As Int) >= 1 && (sResult As Int) <= iTotalPages)
							iPage = sResult As Int
						EndIf
					EndIf
				Else
					Int iIndex = ((iPage - 1) * iTotal) + (iResult - 2)
					kItem = LostItemsChest.GetNthForm(iIndex)
					Int iType = kItem.GetType()
					String sType = sType(iType)
					Int iFormID = kItem.GetFormID()
					Debug.Notification("Mark of Arkay - Name: " + kItem.GetName())
					Debug.Notification("Mark of Arkay - Type: " + sType)
					Debug.Notification("Mark of Arkay - FormID: " + sDecToHex(iFormID))
					moaLostItemMenu.Show(iType,kItem.GetGoldValue(),LostItemsChest.GetItemCount(kItem),kItem.GetWeight(),iFormID)
				EndIf
			EndIf
		EndWhile
	EndIf
EndFunction

Function ShowLostSkills()
	UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
	If !ListMenu || !ReviveScript.SkillScript.bSkillReduced()
		Return
	EndIf
	String sText
	Int i = 0
	While i < ReviveScript.SkillScript.sSKillName.Length
		sText = ReviveScript.SkillScript.iLostSkills[i] + " " + ReviveScript.SkillScript.sSKillName[i]
		listMenu.AddEntryItem(sText, -1, -1, false)
		i += 1
	EndWhile
	sText =  ReviveScript.SkillScript.iGetReducedSkillsCount(True) + " Skills"
	listMenu.AddEntryItem(sText, -1, -1, false)
	ForceCloseMenu()
	listMenu.OpenMenu(none, none)
	listMenu.ResetMenu()
EndFunction

Int Function getNearbyCityRPIndex()
	Return sRespawnPoints.Length - 9
EndFunction

Int Function getRandCityRPIndex()
	Return sRespawnPoints.Length - 8
EndFunction

Int Function getSleepRPIndex()
	Return sRespawnPoints.Length - 7
EndFunction

Int Function getCustomRPIndex()
	Return sRespawnPoints.Length - 6
EndFunction

Int Function getExternalRPIndex()
	Return sRespawnPoints.Length - 5
EndFunction

Int Function getCheckpointRPIndex()
	Return sRespawnPoints.Length - 4
EndFunction

Int Function getNearbyRPIndex()
	Return sRespawnPoints.Length - 3
EndFunction

Int Function getRandomRPIndex()
	Return sRespawnPoints.Length - 2
EndFunction

Int Function getThroatRPIndex()
	Return sRespawnPoints.Length - 1
EndFunction

Function setTriggerMethod(Int iIndex)
	If iIndex == 0
		PlayerRef.GetActorBase().SetEssential(False)
		moaNoKillMoveOnPlayer.SetValue(0)
		StopAndConfirm(moaHealthMonitor)
		ToggleDeferredKill(False)
	ElseIf iIndex == 1
		PlayerRef.GetActorBase().SetEssential(True)
		PlayerRef.SetNoBleedoutRecovery(True)
		StopAndConfirm(moaHealthMonitor)
		ToggleDeferredKill(False)
	ElseIf iIndex == 2
		PlayerRef.GetActorBase().SetEssential(False)
		moaNoKillMoveOnPlayer.SetValue(1)
		moaHealthMonitor.Start()
		ToggleDeferredKill(True)
	EndIf
EndFunction

Function recalcCursedDisCureCosts()
	Int handle = ModEvent.Create("MOA_RecalcCursedDisCureCost")
	If (handle)
		ModEvent.PushForm(handle, self)
		ModEvent.Send(Handle)
	EndIf
EndFunction

Bool Function bIsLocked()
	Return (bMarkRecallCostLock || bTradeLock || bLootChanceLock || bCurseLock || bSaveLock)
EndFunction

Bool Function bCanContinue()
	Return ((!bRespawnCounter && !bLockPermaDeath) || (fRespawnCounterSlider > 0))
EndFunction
