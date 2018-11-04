Scriptname zzzmoaReviveMCM extends SKI_ConfigBase  

Import Game
Import FISSFactory

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
Int flags
Int oidRespawnPoint0
Int oidRespawnPoint1
Int oidRespawnPoint2
Int oidRespawnPoint3
Int oidRespawnPoint4
Int oidRespawnPoint5
Int oidRespawnPoint6
;Int oidRespawnPoint7
Int oidExternalTeleportLocation
Int oidTeleportLocation_M
Int oidRemovableItems_M
Int oidNoTradingAftermath_M
Int oidArkayCurses_M
Int oidInformation
Int oidResetHistory
Int oidHistory
Int oidAutoSwitchRP
int oidRecallCost
int oidMarkCost
int oidBleedoutTime
Int oidRecallByArkayMark
Int oidJail
Int oidTogglePowers
Int oidToggleSpells
Int oidRespawnTimeSlider
Int oidEnableSave_M
Int oidHealActors
Int oidResurrectActors
Int oidNPCStealItems
Int oidFadeToBlack
Int oidHostileNPC
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
Bool Property bInit = False Auto Hidden
String[] Property sRespawnPoints Auto
String[] Property sLoseOptions Auto
String[] Property sAftermathOptions Auto
Bool[] Property bRespawnPointsFlags Auto
String[] Property sArkayCurses Auto
String[] Property sSaveOptions Auto
String[] Property sPresets Auto Hidden
String[] Property sSkills Auto Hidden
Actor Property PlayerRef Auto
GlobalVariable Property moaState Auto
GlobalVariable Property moaLootChance Auto
GlobalVariable Property moaScrollChance Auto
GlobalVariable Property moaBleedoutHandlerState Auto
GlobalVariable Property moaBleedouAnimation Auto
GlobalVariable Property moaPraytoSave Auto
GlobalVariable Property moaCreaturesCanSteal Auto
GlobalVariable Property moaSnoozeState Auto
GlobalVariable Property moaMoralityMatters Auto
Quest Property moaReviverQuest Auto
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
Quest Property moaFollowerDetector Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaGuardDetector Auto
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
Bool Property bTeleportMenu = False Auto Hidden
Bool Property bAltEyeFix = False Auto Hidden
Bool Property bArkayCurse = False Auto Hidden
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
Bool Property bNPCStealItems = False Auto Hidden
Bool Property bHostileNPC = False Auto Hidden
Int Property iNotTradingAftermath = 0 Auto Hidden
Int Property iRemovableItems = 0 Auto Hidden
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
Bool Property bPlayerProtectFollower = False Auto Hidden
Bool Property bSkillReduceRandomVal = False Auto Hidden
Bool Property bMoralityMatters = True Auto Hidden
Int Property iTeleportLocation = 0 Auto Hidden
Int Property iSaveOption = 1 Auto Hidden
Int Property iLoadPreset = 0 Auto Hidden
Int Property iSavePreset = 0 Auto Hidden
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
Float Property fRespawnTimeSlider = 0.0 Auto Hidden
Float Property fRPMinDistanceSlider = 2500.0 Auto Hidden
Int Property iExternalIndex = -1 Auto Hidden
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
ObjectReference Property SleepMarker Auto
ObjectReference Property LocationMarker Auto
ObjectReference Property LostItemsMarker Auto
ObjectReference Property CustomMarker Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker3 Auto
Objectreference Property CellLoadMarker Auto
Objectreference Property CellLoadMarker2 Auto
Objectreference Property LocationMarker2 Auto
ObjectReference Property LostItemsChest Auto
zzzmoaReviverScript Property ReviveScript Auto
Formlist property ExternalMarkerList Auto
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
Bool bToggling

Event OnPageReset(String page)
	SetCursorFillMode(LEFT_TO_RIGHT)
	If ( bIsModBusy() )
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Locked")
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
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( bIsMenuEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSnoozeSlider = AddSliderOption("$mrt_MarkofArkay_SnoozeSoulSlider_1", fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(6)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTradeEnabled = AddToggleOption("$mrt_MarkofArkay_TradeEnabled", bIsTradeEnabled, flags )
		SetCursorPosition(8)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMarkOfArkayRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_MarkOfArkayRevivalEnabled", bIsMarkEnabled, flags )
		SetCursorPosition(10)
		oidGSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GSoulGemRevivalEnabled", bIsGSoulGemEnabled, flags )
		SetCursorPosition(12)
		oidBSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_BSoulGemRevivalEnabled", bIsBSoulGemEnabled, flags )
		SetCursorPosition(14)
		oidDragonSoulRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_DragonSoulRevivalEnabled", bIsDragonSoulEnabled, flags )
		SetCursorPosition(16)
		oidGoldRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GoldRevivalEnabled", bIsGoldEnabled, flags )
		SetCursorPosition(9)
		oidMarkSlider = AddSliderOption("$mrt_MarkofArkay_MarkSlider_1", fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2", flags)
		SetCursorPosition(11)
		oidGSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_GSoulGemSlider_1", fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2", flags)
		SetCursorPosition(13)
		oidBSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_BSoulGemSlider_1", fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2", flags)
		SetCursorPosition(15)
		oidDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_DragonSoulSlider_1", fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2", flags)
		SetCursorPosition(17)
		oidGoldSlider = AddSliderOption("$mrt_MarkofArkay_GoldSlider_1", fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2", flags)
	ElseIf (page == "$Extra")
		SetCursorPosition(0)
		AddHeaderOption("$Extra")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidEnableSave_M = AddMenuOption("$mrt_MarkofArkay_EnableSave_M", sSaveOptions[iSaveOption], flags)
		SetCursorPosition(4)
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
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLootChanceSlider = AddSliderOption("$mrt_MarkofArkay_LootChanceSlider_1" ,fLootChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2", flags)
		SetCursorPosition(21)
		oidScrollChanceSlider = AddSliderOption("$mrt_MarkofArkay_ScrollChanceSlider_1" ,fScrollChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2", flags)
		SetCursorPosition(23)
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
		oidNoTradingAftermath_M = AddMenuOption("$mrt_MarkofArkay_NoTradingAftermath_M", sAftermathOptions[iNotTradingAftermath], flags)
		SetCursorPosition(4)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRemovableItems_M = AddMenuOption("$mrt_MarkofArkay_RemovableItems_M", sLoseOptions[iRemovableItems], flags)
		SetCursorPosition(8)
		AddHeaderOption("$Respawn")
		SetCursorPosition(10)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnNaked = AddToggleOption("$mrt_MarkofArkay_RespawnNaked", bRespawnNaked, flags)
		SetCursorPosition(12)
		oidJail = AddToggleOption("$mrt_MarkofArkay_Jail",bSendToJail,flags)
		SetCursorPosition(14)
		oidShowRaceMenu = AddToggleOption("$mrt_MarkofArkay_ShowRaceMenu", bShowRaceMenu,flags)
		SetCursorPosition(16)
		oidHealActors = AddToggleOption("$mrt_MarkofArkay_HealActors",bHealActors,flags)
		SetCursorPosition(18)
		oidResurrectActors = AddToggleOption("$mrt_MarkofArkay_ResurrectActors",bResurrectActors,flags)
		SetCursorPosition(22)
		AddHeaderOption("$Curse")
		SetCursorPosition(24)
		oidArkayCurse = AddToggleOption("$mrt_MarkofArkay_ArkayCurse", bArkayCurse, flags)
		SetCursorPosition(26)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bArkayCurse)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTempArkayCurse = AddToggleOption("$mrt_MarkofArkay_TempArkayCurse",bIsArkayCurseTemporary, flags)
		SetCursorPosition(28)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bArkayCurse )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidArkayCurses_M = AddMenuOption("$mrt_MarkofArkay_ArkayCurses_M", sArkayCurses[iArkayCurse], flags)
		SetCursorPosition(32)
		AddHeaderOption("$Skill_Reduction")
		SetCursorPosition(34)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduce_M = AddMenuOption("$mrt_MarkofArkay_SkillReduce_M", sSkills[iReducedSkill], flags)
		SetCursorPosition(36)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && !bSkillReduceRandomVal
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceValSlider = AddSliderOption("$mrt_MarkofArkay_SkillReduceValSlider_1", fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2", flags)
		SetCursorPosition(38)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceRandomVal = AddToggleOption("$mrt_MarkofArkay_SkillReduceRandomVal",bSkillReduceRandomVal, flags)
		SetCursorPosition(40)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && bSkillReduceRandomVal
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSkillReduceMinValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMinValSlider_1", fSkillReduceMinValSlider , "{0}", flags)
		SetCursorPosition(42)
		oidSkillReduceMaxValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMaxValSlider_1", fSkillReduceMaxValSlider , "{0}", flags)
		SetCursorPosition(44)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseSkillForever = AddToggleOption("$mrt_MarkofArkay_LoseSkillForever",bLoseSkillForever, flags)
		SetCursorPosition(48)
		AddHeaderOption("$Lost_Item_Retrieval")
		SetCursorPosition(50)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLostItemQuest = AddToggleOption("$mrt_MarkofArkay_LostItemQuest",bLostItemQuest,flags)
		SetCursorPosition(52)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidSoulMarkStay = AddToggleOption("$mrt_MarkofArkay_SoulMarkStay",bSoulMarkStay,flags)
		SetCursorPosition(54)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoseforever = AddToggleOption("$mrt_MarkofArkay_Loseforever",bLoseForever, flags)
		SetCursorPosition(1)
		AddHeaderOption("$Destination")
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
		If (( moaState.getValue() == 1 ) && ( !bRespawnMenu || !bTeleportMenu ))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidTeleportLocation_M = AddMenuOption("$mrt_MarkofArkay_TeleportLocation_M", sRespawnPoints[iTeleportLocation], flags)
		SetCursorPosition(9)
		If (( moaState.getValue() == 1 ) && ( iTeleportLocation == ( sRespawnPoints.Length - 3 )) && ( ExternalMarkerList.GetSize() > 1 ) && ( !bRespawnMenu || !bTeleportMenu ))
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
		SetCursorPosition(11)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRPMinDistanceSlider = AddSliderOption("$mrt_MarkofArkay_RPMinDistanceSlider_1", fRPMinDistanceSlider, "{0}", flags)
		SetCursorPosition(15)
		AddHeaderOption("$City")
		SetCursorPosition(17)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidRespawnPoint0 = AddToggleOption(sRespawnPoints[0], bRespawnPointsFlags[0], flags )
		SetCursorPosition(19)
		oidRespawnPoint1 = AddToggleOption(sRespawnPoints[1], bRespawnPointsFlags[1], flags )
		SetCursorPosition(21)
		oidRespawnPoint2 = AddToggleOption(sRespawnPoints[2], bRespawnPointsFlags[2], flags )
		SetCursorPosition(23)
		oidRespawnPoint3 = AddToggleOption(sRespawnPoints[3], bRespawnPointsFlags[3], flags )
		SetCursorPosition(25)
		oidRespawnPoint4 = AddToggleOption(sRespawnPoints[4], bRespawnPointsFlags[4], flags )
		SetCursorPosition(27)
		oidRespawnPoint5 = AddToggleOption(sRespawnPoints[5], bRespawnPointsFlags[5], flags )
		SetCursorPosition(29)
		oidRespawnPoint6 = AddToggleOption(sRespawnPoints[6], bRespawnPointsFlags[6], flags )
		;SetCursorPosition(31)
		;oidRespawnPoint7 = AddToggleOption(sRespawnPoints[7], bRespawnPointsFlags[7], flags )
		SetCursorPosition(35)
		AddHeaderOption("$Follower")
		SetCursorPosition(37)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidPlayerProtectFollower = AddToggleOption("$mrt_MarkofArkay_PlayerProtectFollower", bPlayerProtectFollower, flags)
		SetCursorPosition(39)
		oidFollowerProtectPlayer = AddToggleOption("$mrt_MarkofArkay_FollowerProtectPlayer", bFollowerProtectPlayer, flags)
		SetCursorPosition(43)
		AddHeaderOption("$Hostile_NPC")
		SetCursorPosition(45)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidHostileNPC =  AddToggleOption("$mrt_MarkofArkay_HostileNPC",bHostileNPC,flags)
		SetCursorPosition(47)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidNPCStealItems = AddToggleOption("$mrt_MarkofArkay_NPCStealItems",bNPCStealItems,flags)
		SetCursorPosition(49)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( bNPCStealItems )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidMoralityMatters = AddToggleOption("$mrt_MarkofArkay_MoralityMatters", bMoralityMatters,flags)
		SetCursorPosition(51)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( bHostileNPC || bNPCStealItems )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidCreaturesCanSteal  = AddToggleOption("$mrt_MarkofArkay_CreaturesCanSteal",bCreaturesCanSteal,flags)
	ElseIf (page == "$Debug")
		SetCursorPosition(0)
		AddHeaderOption("$Debug")
		SetCursorPosition(2)
		If moaState.getValue() == 0
			oidStatus = AddTextOption("$mrt_MarkofArkay_Status_Off", "")
		Else
			oidStatus = AddTextOption("$mrt_MarkofArkay_Status_On", "")
		EndIf
		SetCursorPosition(4)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidReset = AddTextOption("$mrt_MarkofArkay_Reset", "", flags)
		SetCursorPosition(6)
			If ( PlayerRef.HasSpell(MoveCustomMarker ) || PlayerRef.HasSpell(RecallMarker ) )
			oidToggleSpells = AddTextOption("$mrt_MarkofArkay_ToggleSpells1", "", flags) 
		Else
			oidToggleSpells = AddTextOption("$mrt_MarkofArkay_ToggleSpells2", "", flags) 
		EndIf
		SetCursorPosition(8)
		If ( PlayerRef.HasSpell(RevivalPower) || PlayerRef.HasSpell(SacrificePower) )
			oidTogglePowers = AddTextOption("$mrt_MarkofArkay_TogglePowers1", "", flags) 
		Else
			oidTogglePowers = AddTextOption("$mrt_MarkofArkay_TogglePowers2", "", flags) 
		EndIf
		SetCursorPosition(10)
		sResetHistory = ""
		oidResetHistory = AddTextOption("$mrt_MarkofArkay_ResetHistory", sResetHistory, flags)
		SetCursorPosition(12)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLogging = AddToggleOption("$mrt_MarkofArkay_Logging", bIsLoggingEnabled, flags )
		SetCursorPosition(14)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidInformation = AddToggleOption("$mrt_MarkofArkay_Info", bIsInfoEnabled, flags )
		SetCursorPosition(16)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidNotification = AddToggleOption("$mrt_MarkofArkay_Notification", bIsNotificationEnabled, flags )
		SetCursorPosition(18)
		oidFadeToBlack = AddToggleOption("$mrt_MarkofArkay_FadeToBlack", bFadeToBlack, flags )
		SetCursorPosition(20)
		oidInvisibility = AddToggleOption("$mrt_MarkofArkay_Invisibility", bInvisibility, flags)
		SetCursorPosition(22)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && (bFadeToBlack || bInvisibility)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidDeathEffect = AddToggleOption("$mrt_MarkofArkay_DeathEffect", bDeathEffect,flags)
		SetCursorPosition(24)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidAltEyeFix = AddToggleOption("$mrt_MarkofArkay_AltEyeFix", bAltEyeFix, flags)
		SetCursorPosition(1)
		AddHeaderOption("$Info")
		SetCursorPosition(3)
		flags = OPTION_FLAG_DISABLED
		If bIsInfoEnabled
			Int iCount = LostItemsChest.GetNumItems()
			If ReviveScript.fLostSouls > 0
				iCount += 1
			EndIf
			If iCount <= 999999
				AddTextOption("$mrt_MarkofArkay_Cur_Lost_Items", iCount, flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Cur_Lost_Items", "+999999", flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Cur_Lost_Items", "$Disabled", flags)
		EndIf
		SetCursorPosition(5)
		If ( moaState.getValue() == 1 ) && bIsInfoEnabled
			If iTeleportLocation < sRespawnPoints.Length - 6
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 5)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 4)
				If ( CustomMarker && !CustomMarker.Isdisabled() )
					Float fDistance = PlayerRef.GetDistance(CustomMarker)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 3) && (ExternalMarkerList.GetSize() > 1) && (iExternalIndex != -1)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 3) && (ExternalMarkerList.GetSize() == 1)
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
		SetCursorPosition(7)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalBleedOut > 99999999
				AddTextOption("$Bleedouts", "+99999999", flags)
			Else
				AddTextOption("$Bleedouts", iTotalBleedOut, flags)
			EndIf
		Else
			AddTextOption("$Bleedouts", "$Disabled", flags)
		EndIf
		SetCursorPosition(9)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalRevives > 99999999
				AddTextOption("$Revivals", "+99999999", flags)
			Else
				AddTextOption("$Revivals", iTotalRevives, flags)
			EndIf
		Else
			AddTextOption("$Revivals", "$Disabled", flags)
		EndIf
		SetCursorPosition(11)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByFollower > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", iRevivesByFollower, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "$Disabled", flags)
		EndIf
		SetCursorPosition(13)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByPotion > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", iRevivesByPotion, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "$Disabled", flags)
		EndIf
		SetCursorPosition(15)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByRevivalSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", iRevivesByRevivalSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(17)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesBySacrificeSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", iRevivesBySacrificeSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(19)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iRevivesByTrade > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", iRevivesByTrade, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "$Disabled", flags)
		EndIf
		SetCursorPosition(21)
		If bIsInfoEnabled && ( moaState.getValue() == 1 )
			If iTotalRespawn > 99999999
				AddTextOption("$Respawns", "+99999999", flags)
			Else
				AddTextOption("$Respawns", iTotalRespawn, flags)
			EndIf
		Else
			AddTextOption("$Respawns", "$Disabled", flags)
		EndIf
		SetCursorPosition(23)
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
		Int iFissIndex = GetModByName("FISS.esp")
		SetCursorPosition(0)
		AddHeaderOption("$Presets")
		SetCursorPosition(2)
		If moaState.getValue() == 1 && ( 0 < iFissIndex && iFissIndex < 255 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		oidLoadPreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sPresets[iLoadPreset], flags)
		SetCursorPosition(3)
		oidSavePreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sPresets[iSavePreset], flags)
		SetCursorPosition(4)
		oidLoadPreset1 = AddTextOption("$mrt_MarkofArkay_Load_Preset", "", flags)
		SetCursorPosition(5)
		oidSavePreset1 = AddTextOption("$mrt_MarkofArkay_Save_Preset", "", flags)
		SetCursorPosition(8)
		If moaState.getValue()
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
	ElseIf (option == oidGoldRevivalEnabled)
		bIsGoldEnabled = !bIsGoldEnabled
		SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
	ElseIf (option == oidFollowerProtectPlayer)
		bFollowerProtectPlayer = !bFollowerProtectPlayer
		SetToggleOptionValue(oidFollowerProtectPlayer, bFollowerProtectPlayer)
	ElseIf (option == oidPlayerProtectFollower)
		bPlayerProtectFollower = !bPlayerProtectFollower
		SetToggleOptionValue(oidPlayerProtectFollower, bPlayerProtectFollower)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = !bIsNotificationEnabled
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
	ElseIf (option == oidFadeToBlack)
		bFadeToBlack = !bFadeToBlack
		SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && (bFadeToBlack || bInvisibility)
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
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && (bFadeToBlack || bInvisibility)
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
	ElseIf (option == oidAltEyeFix)
		bAltEyeFix = !bAltEyeFix
		SetToggleOptionValue(oidAltEyeFix,bAltEyeFix)
		If bAltEyeFix
			Utility.Wait(1.0)
			ReviveScript.ExecuteCommand("player.say 0142b5",1,0,1)
		EndIf
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
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[0])
			bRespawnPointsFlags[0] = !bRespawnPointsFlags[0]
			SetToggleOptionValue(oidRespawnPoint0,bRespawnPointsFlags[0])
		EndIf
	ElseIf (option == oidRespawnPoint1)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[1])
			bRespawnPointsFlags[1] = !bRespawnPointsFlags[1]
			SetToggleOptionValue(oidRespawnPoint1,bRespawnPointsFlags[1])
		EndIf
	ElseIf (option == oidRespawnPoint2)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[2])
			bRespawnPointsFlags[2] = !bRespawnPointsFlags[2]
			SetToggleOptionValue(oidRespawnPoint2,bRespawnPointsFlags[2])
		EndIf
	ElseIf (option == oidRespawnPoint3)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[3])
			bRespawnPointsFlags[3] = !bRespawnPointsFlags[3]
			SetToggleOptionValue(oidRespawnPoint3,bRespawnPointsFlags[3])
		EndIf
	ElseIf (option == oidRespawnPoint4)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[4])
			bRespawnPointsFlags[4] = !bRespawnPointsFlags[4]
			SetToggleOptionValue(oidRespawnPoint4,bRespawnPointsFlags[4])
		EndIf
	ElseIf (option == oidRespawnPoint5)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[5])
			bRespawnPointsFlags[5] = !bRespawnPointsFlags[5]
			SetToggleOptionValue(oidRespawnPoint5,bRespawnPointsFlags[5])
		EndIf
	ElseIf (option == oidRespawnPoint6)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[6])
			bRespawnPointsFlags[6] = !bRespawnPointsFlags[6]
			SetToggleOptionValue(oidRespawnPoint6,bRespawnPointsFlags[6])
		EndIf
	;ElseIf (option == oidRespawnPoint7)
	;	If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[7])
	;		bRespawnPointsFlags[7] = !bRespawnPointsFlags[7]
	;		SetToggleOptionValue(oidRespawnPoint7,bRespawnPointsFlags[7])
	;	EndIf
	ElseIf (option == oidRespawnNaked)
		bRespawnNaked = !bRespawnNaked
		SetToggleOptionValue(oidRespawnNaked, bRespawnNaked)
	ElseIf (option == oidRespawnMenu)
		bRespawnMenu = !bRespawnMenu
		SetToggleOptionValue(oidRespawnMenu, bRespawnMenu)
		If ( !bTeleportMenu || !bRespawnMenu )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		If (( iTeleportLocation == ( sRespawnPoints.Length - 3 )) && ( ExternalMarkerList.GetSize() > 1 ) && ( !bRespawnMenu || !bTeleportMenu ))
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags)
	ElseIf (option == oidTeleportMenu)
		bTeleportMenu = !bTeleportMenu
		SetToggleOptionValue(oidTeleportMenu, bTeleportMenu)
		If ( !bTeleportMenu || !bRespawnMenu )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		If (( iTeleportLocation == ( sRespawnPoints.Length - 3 )) && ( ExternalMarkerList.GetSize() > 1 ) && ( !bRespawnMenu || !bTeleportMenu ))
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags)
	ElseIf (option == oidJail)
		bSendToJail = !bSendToJail
		SetToggleOptionValue(oidJail, bSendToJail)
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
	ElseIf (option == oidLoseforever)
		bLoseForever = !bLoseForever
		SetToggleOptionValue(oidLoseforever, bLoseForever)
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = !bLostItemQuest
		SetToggleOptionValue(oidLostItemQuest, bLostItemQuest)
		If bLostItemQuest 
			If ( ( LostItemsChest.GetNumItems() > 0 ) || ( ReviveScript.fLostSouls > 0.0 ) || \
			PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.bSkillReduced() )
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
	ElseIf (option == oidSoulMarkStay)
		bSoulMarkStay = !bSoulMarkStay
		SetToggleOptionValue(oidSoulMarkStay,bSoulMarkStay)
	ElseIf (option == oidNPCStealItems)
		bNPCStealItems = !bNPCStealItems
		SetToggleOptionValue(oidNPCStealItems,bNPCStealItems)
		If bNPCStealItems
			bHostileNPC = False
		EndIf
		SetToggleOptionValue(oidHostileNPC,bHostileNPC)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && bNPCStealItems
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidMoralityMatters, flags, True)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( bHostileNPC || bNPCStealItems )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidCreaturesCanSteal, flags)
	ElseIf (option == oidHostileNPC)
		bHostileNPC = !bHostileNPC
		SetToggleOptionValue(oidHostileNPC,bHostileNPC)
		If bHostileNPC
			bNPCStealItems = False
		EndIf
		SetToggleOptionValue(oidNPCStealItems,bNPCStealItems)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && bNPCStealItems
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidMoralityMatters, flags, True)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1)&& ( bHostileNPC || bNPCStealItems )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidCreaturesCanSteal, flags)
	ElseIf (option == oidCreaturesCanSteal)
		bCreaturesCanSteal = !bCreaturesCanSteal
		moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
		SetToggleOptionValue(oidCreaturesCanSteal,bCreaturesCanSteal)
	ElseIf (option == oidMoralityMatters)
		bMoralityMatters = !bMoralityMatters
		moaMoralityMatters.SetValue(bMoralityMatters As Int)
		SetToggleOptionValue(oidMoralityMatters,bMoralityMatters)
	ElseIf (option == oidInformation)
		bIsInfoEnabled = !bIsInfoEnabled
		SetToggleOptionValue(oidInformation,bIsInfoEnabled)
		ForcePageReset()
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
	ElseIf (option == oidStatus)
		SetTextOptionValue(option, "$mrt_MarkofArkay_Status_Busy",True)
		bToggling = True
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidRevivalEnabled, flags, True)
		SetOptionFlags(oidMenuEnabled, flags, True)
		SetOptionFlags(oidDragonSoulRevivalEnabled, flags, True)
		SetOptionFlags(oidDragonSoulSlider, flags, True)
		SetOptionFlags(oidGoldRevivalEnabled, flags, True)
		SetOptionFlags(oidFollowerProtectPlayer, flags, True)
		SetOptionFlags(oidPlayerProtectFollower, flags, True)
		SetOptionFlags(oidNoFallDamageEnabled, flags, True)	
		SetOptionFlags(oidGoldSlider, flags, True)
		SetOptionFlags(oidMarkOfArkayRevivalEnabled, flags, True)
		SetOptionFlags(oidMarkSlider, flags, True)
		SetOptionFlags(oidBSoulGemRevivalEnabled, flags, True)
		SetOptionFlags(oidBSoulGemSlider, flags, True) 
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidSnoozeSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags, True)
		SetOptionFlags(oidRecoveryTime,flags,True)
		SetOptionFlags(oidRPMinDistanceSlider,flags,True)
		SetOptionFlags(oidBleedoutTime,flags,True)
		SetOptionFlags(oidRecallCost,flags,True)
		SetOptionFlags(oidMarkCost,flags,True)
		SetOptionFlags(oidNotification, flags,True)
		SetOptionFlags(oidFadeToBlack, flags,True)
		SetOptionFlags(oidInvisibility, flags,True)
		SetOptionFlags(oidDeathEffect, flags,True)
		SetOptionFlags(oidAltEyeFix, flags,True)
		SetOptionFlags(oidLogging, flags,True)
		SetOptionFlags(oidGSoulGemPSlider, flags,True)
		SetOptionFlags(oidGSoulGemSlider, flags,True)
		SetOptionFlags(oidGSoulGemRevivalEnabled, flags,True)
		SetOptionFlags(oidTradeEnabled, flags,True)
		SetOptionFlags(oidEffect, flags,True)
		SetOptionFlags(oidRevivalRequireBlessing,flags,True)
		SetOptionFlags(oidRecallRestriction,flags,True)
		SetOptionFlags(oidPotionRevivalEnabled, flags,True)
		SetOptionFlags(oidAutoDrinkPotion, flags,True)
		SetOptionFlags(oidNoTradingAftermath_M, flags,True)
		SetOptionFlags(oidEnableSave_M, flags,True)
		SetOptionFlags(oidLootChanceSlider,flags,True)
		SetOptionFlags(oidScrollChanceSlider,flags,True)
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidRespawnMenu,flags,True)
		SetOptionFlags(oidTeleportMenu,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidLoseSkillForever,flags,True)
		SetOptionFlags(oidHealActors,flags,True)
		SetOptionFlags(oidResurrectActors,flags,True)
		SetOptionFlags(oidShowRaceMenu,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidTempArkayCurse,flags,True)
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,flags,True)
		SetOptionFlags(oidSkillReduce_M,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidLostItemQuest,flags,True)
		SetOptionFlags(oidAutoSwitchRP,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
		SetOptionFlags(oidNPCStealItems,flags,True)
		SetOptionFlags(oidHostileNPC,flags,True)
		SetOptionFlags(oidCreaturesCanSteal,flags,True)
		SetOptionFlags(oidMoralityMatters,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags,True)
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		SetOptionFlags(oidShiftBack,flags,True)
		SetOptionFlags(oidShiftBackRespawn,flags,True)
		SetOptionFlags(oidInformation,flags,True)
		SetOptionFlags(oidHistory,flags,True)
		SetOptionFlags(oidTogglePowers,flags,True)
		SetOptionFlags(oidToggleSpells,flags,True)
		SetOptionFlags(oidResetHistory,flags,True)
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidReset,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags)
		;SetOptionFlags(oidRespawnPoint7,flags)
		ForcePageReset()
		If moaState.getValue() == 1
			moaStop()
		Else
			moaStart()
		EndIf
		bToggling = False
	ElseIf (option == oidReset)
		SetTextOptionValue(option, "$mrt_MarkofArkay_Status_Busy",True)
		bToggling = True
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidRevivalEnabled, flags, True)
		SetOptionFlags(oidMenuEnabled, flags, True)
		SetOptionFlags(oidDragonSoulRevivalEnabled, flags, True)
		SetOptionFlags(oidDragonSoulSlider, flags, True)
		SetOptionFlags(oidGoldRevivalEnabled, flags, True)
		SetOptionFlags(oidFollowerProtectPlayer, flags, True)
		SetOptionFlags(oidPlayerProtectFollower, flags, True)
		SetOptionFlags(oidNoFallDamageEnabled, flags, True)	
		SetOptionFlags(oidGoldSlider, flags, True)
		SetOptionFlags(oidMarkOfArkayRevivalEnabled, flags, True)
		SetOptionFlags(oidMarkSlider, flags, True)
		SetOptionFlags(oidBSoulGemRevivalEnabled, flags, True)
		SetOptionFlags(oidBSoulGemSlider, flags, True) 
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidSnoozeSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags, True)
		SetOptionFlags(oidRecoveryTime,flags,True)
		SetOptionFlags(oidRPMinDistanceSlider,flags,True)
		SetOptionFlags(oidBleedoutTime,flags,True)
		SetOptionFlags(oidRecallCost,flags,True)
		SetOptionFlags(oidMarkCost,flags,True)
		SetOptionFlags(oidNotification, flags,True)
		SetOptionFlags(oidFadeToBlack, flags,True)
		SetOptionFlags(oidInvisibility, flags,True)
		SetOptionFlags(oidDeathEffect, flags,True)
		SetOptionFlags(oidAltEyeFix, flags,True)
		SetOptionFlags(oidLogging, flags,True)
		SetOptionFlags(oidGSoulGemPSlider, flags,True)
		SetOptionFlags(oidGSoulGemSlider, flags,True)
		SetOptionFlags(oidGSoulGemRevivalEnabled, flags,True)
		SetOptionFlags(oidTradeEnabled, flags,True)
		SetOptionFlags(oidEffect, flags,True)
		SetOptionFlags(oidRevivalRequireBlessing,flags,True)
		SetOptionFlags(oidRecallRestriction,flags,True)
		SetOptionFlags(oidPotionRevivalEnabled, flags,True)
		SetOptionFlags(oidAutoDrinkPotion, flags,True)
		SetOptionFlags(oidNoTradingAftermath_M, flags,True)
		SetOptionFlags(oidEnableSave_M, flags,True)
		SetOptionFlags(oidLootChanceSlider,flags,True)
		SetOptionFlags(oidScrollChanceSlider,flags,True)
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidRespawnMenu,flags,True)
		SetOptionFlags(oidTeleportMenu,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidLoseSkillForever,flags,True)
		SetOptionFlags(oidHealActors,flags,True)
		SetOptionFlags(oidResurrectActors,flags,True)
		SetOptionFlags(oidShowRaceMenu,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidTempArkayCurse,flags,True)
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,flags,True)
		SetOptionFlags(oidSkillReduce_M,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidLostItemQuest,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
		SetOptionFlags(oidNPCStealItems,flags,True)
		SetOptionFlags(oidHostileNPC,flags,True)
		SetOptionFlags(oidCreaturesCanSteal,flags,True)
		SetOptionFlags(oidMoralityMatters,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags,True)
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		SetOptionFlags(oidAutoSwitchRP,flags,True)
		SetOptionFlags(oidInformation,flags,True)
		SetOptionFlags(oidHistory,flags,True)
		SetOptionFlags(oidShiftBack,flags,True)
		SetOptionFlags(oidShiftBackRespawn,flags,True)
		SetOptionFlags(oidResetHistory,flags,True)
		SetOptionFlags(oidTogglePowers,flags,True)
		SetOptionFlags(oidToggleSpells,flags,True)
		SetOptionFlags(oidResetHistory,flags,True)
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidStatus,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags)
		;SetOptionFlags(oidRespawnPoint7,flags)
		ForcePageReset()
		moaStop()
		Utility.Wait(2.0)
		moaStart()
		bToggling = False
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
		SetSliderDialogRange(6.0, 20.0)
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
		SetSliderDialogDefaultValue(2500.0)
		SetSliderDialogRange(1000.0, 10000.0)
		SetSliderDialogInterval(250.0)
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
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(1.0)
	ElseIf (option == oidSkillReduceMinValSlider)
		SetSliderDialogStartValue(fSkillReduceMinValSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
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
		SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
	ElseIf (option == oidSkillReduceValSlider)
		fSkillReduceValSlider = value
		SetSliderOptionValue(oidSkillReduceValSlider, fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2")	
	ElseIf (option == oidSkillReduceMaxValSlider)
		fSkillReduceMaxValSlider = value
		SetSliderOptionValue(oidSkillReduceMaxValSlider, fSkillReduceMaxValSlider, "{0}")
	ElseIf (option == oidSkillReduceMinValSlider)
		fSkillReduceMinValSlider = value
		SetSliderOptionValue(oidSkillReduceMinValSlider, fSkillReduceMinValSlider, "{0}")
	EndIf
EndEvent

Event OnOptionMenuOpen(Int option)
	If (option == oidTeleportLocation_M)
		SetMenuDialogoptions(sRespawnPoints)
		SetMenuDialogStartIndex(iTeleportLocation)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidRemovableItems_M)
		SetMenuDialogoptions(sLoseOptions)
		SetMenuDialogStartIndex(iRemovableItems)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidNoTradingAftermath_M)
		SetMenuDialogoptions(sAftermathOptions)
		SetMenuDialogStartIndex(iNotTradingAftermath)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidArkayCurses_M)
		SetMenuDialogoptions(sArkayCurses)
		SetMenuDialogStartIndex(iArkayCurse)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidEnableSave_M)
		SetMenuDialogoptions(sSaveOptions)
		SetMenuDialogStartIndex(iSaveOption)
		SetMenuDialogDefaultIndex(1)
	ElseIf (option == oidLoadPreset_M)
		SetMenuDialogoptions(sPresets)
		SetMenuDialogStartIndex(iLoadPreset)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSavePreset_M)
		SetMenuDialogoptions(sPresets)
		SetMenuDialogStartIndex(iSavePreset)
		SetMenuDialogDefaultIndex(0)
	ElseIf (option == oidSkillReduce_M)
		SetMenuDialogoptions(sSkills)
		SetMenuDialogStartIndex(iReducedSkill)
		SetMenuDialogDefaultIndex(0)
	EndIf
EndEvent

Event OnOptionMenuAccept(Int option, Int index)
	If (option == oidTeleportLocation_M)
		iTeleportLocation = index
		SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation])
		If ( ( moaState.getValue() == 1 ) && ( iTeleportLocation == (sRespawnPoints.Length - 3 ) ) && ExternalMarkerList.GetSize() > 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags)
	;	SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidRemovableItems_M)
		iRemovableItems = index
		SetMenuOptionValue(oidRemovableItems_M, sLoseOptions[iRemovableItems])
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidLostItemQuest, flags)
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = index
		SetMenuOptionValue(oidNoTradingAftermath_M, sAftermathOptions[iNotTradingAftermath])
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidRespawnMenu,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidHealActors,flags,True)
		SetOptionFlags(oidResurrectActors,flags,True)
		SetOptionFlags(oidShowRaceMenu,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags,True)
		SetOptionFlags(oidSkillReduce_M,flags,True)
		SetOptionFlags(oidLoseSkillForever,flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && bArkayCurse
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidTempArkayCurse,flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bHostileNPC
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidNPCStealItems, Flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bNPCStealItems
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidHostileNPC, Flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && bNPCStealItems
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidMoralityMatters, Flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && (bNPCStealItems || bHostileNPC)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidCreaturesCanSteal, Flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && !bSkillReduceRandomVal
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && bSkillReduceRandomVal
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSkillReduceMaxValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		If bIsRevivalEnabled && (iNotTradingAftermath == 1) && bArkayCurse
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidArkayCurses_M,flags,True)
		If ( bIsRevivalEnabled && (iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidLoseforever,flags,True)
		If ( bIsRevivalEnabled && (iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidSoulMarkStay,flags,True)
		If ( bIsRevivalEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidLostItemQuest,flags,True)
		If ( ( iTeleportLocation == (sRespawnPoints.Length - 3 ) ) && ExternalMarkerList.GetSize() > 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		flags =	OPTION_FLAG_NONE
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags)
	;	SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidArkayCurses_M)
	    iArkayCurse = index
		SetMenuOptionValue(oidArkayCurses_M, sArkayCurses[iArkayCurse])
	ElseIf (option == oidEnableSave_M)
	    iSaveOption = index
		SetSavingOption(iSaveOption)
		SetMenuOptionValue(oidEnableSave_M, sSaveOptions[iSaveOption])
	ElseIf (option == oidLoadPreset_M)
		iLoadPreset = index
		SetMenuOptionValue(oidLoadPreset_M, sPresets[iLoadPreset])
	ElseIf (option == oidSavePreset_M)
		iSavePreset = index
		SetMenuOptionValue(oidSavePreset_M, sPresets[iSavePreset])
	ElseIf (option == oidSkillReduce_M)
		iReducedSkill = index
		SetMenuOptionValue(oidSkillReduce_M, sSkills[iReducedSkill])
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0)
			flags = OPTION_FLAG_NONE
			SetOptionFlags(oidSkillReduceRandomVal,flags,True)
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
		Else
			flags = OPTION_FLAG_DISABLED
			SetOptionFlags(oidLoseSkillForever,flags,True)
			SetOptionFlags(oidSkillReduceRandomVal,flags,True)
			SetOptionFlags(oidSkillReduceValSlider,flags,True)
			SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
			SetOptionFlags(oidSkillReduceMaxValSlider,flags)
		EndIf
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
	ElseIf (option == oidNoFallDamageEnabled)
		ToggleFallDamage(False)
		SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = False
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
	ElseIf (option == oidFadeToBlack)
		bFadeToBlack = True
		SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidDeathEffect,flags)
	ElseIf (option == oidInvisibility)
		bInvisibility = False
		SetToggleOptionValue(oidInvisibility, bInvisibility)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && bFadeToBlack
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
		fRPMinDistanceSlider = 2500.0
		SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
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
		SetTextOptionValue(option,"Random")
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
	;ElseIf (option == oidRespawnPoint7)
	;	bRespawnPointsFlags[7] = True
	;	SetToggleOptionValue(oidRespawnPoint7,bRespawnPointsFlags[7])
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
	ElseIf (option == oidRespawnMenu)
		bRespawnMenu = False
		SetToggleOptionValue(oidRespawnMenu,bRespawnMenu)
		flags = OPTION_FLAG_NONE
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		If ( ( moaState.getValue() == 1 ) && ( iTeleportLocation == (sRespawnPoints.Length - 3 ) ) && ExternalMarkerList.GetSize() > 1 )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags)
	ElseIf (option == oidTeleportMenu)
		bTeleportMenu = False
		SetToggleOptionValue(oidTeleportMenu,bTeleportMenu)
		flags = OPTION_FLAG_NONE
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		If ( ( moaState.getValue() == 1 ) && ( iTeleportLocation == (sRespawnPoints.Length - 3 ) ) && ExternalMarkerList.GetSize() > 1 )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidExternalTeleportLocation,flags)
	ElseIf (option == oidJail)
		bSendToJail = False
		SetToggleOptionValue(oidJail,bSendToJail)
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
		SetMenuOptionValue(oidSkillReduce_M, sSkills[iReducedSkill])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidLoseSkillForever,flags,True)
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,flags)
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
	ElseIf (option == oidNPCStealItems)
		bNPCStealItems = False
		SetToggleOptionValue(oidNPCStealItems,bNPCStealItems)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && ( iRemovableItems != 0 ) && bHostileNPC
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidCreaturesCanSteal , flags, True)
		SetOptionFlags(oidMoralityMatters , OPTION_FLAG_DISABLED)
	ElseIf (option == oidHostileNPC)
		bHostileNPC = False
		SetToggleOptionValue(oidHostileNPC,bHostileNPC)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bNPCStealItems
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidMoralityMatters, flags, True)
		SetOptionFlags(oidCreaturesCanSteal , flags)
	ElseIf (option == oidCreaturesCanSteal )
		bCreaturesCanSteal = False
		moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
		SetToggleOptionValue(oidCreaturesCanSteal ,bCreaturesCanSteal)
	ElseIf (option == oidMoralityMatters )
		bMoralityMatters = True
		moaMoralityMatters.SetValue(bMoralityMatters As Int)
		SetToggleOptionValue(oidMoralityMatters ,bMoralityMatters)
	ElseIf (option == oidLoseforever)
		bLoseForever = False
		SetToggleOptionValue(oidLoseforever,bLoseForever)
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = True
		SetToggleOptionValue(oidLostItemQuest,bLostItemQuest)
		If ( ( LostItemsChest.GetNumItems() > 0 ) || ( ReviveScript.fLostSouls > 0.0 ) || \
		PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.bSkillReduced() )
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
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags)
	;	SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = 0
		SetMenuOptionValue(oidNoTradingAftermath_M, sAftermathOptions[iNotTradingAftermath])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidRespawnMenu,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidHealActors,flags,True)
		SetOptionFlags(oidResurrectActors,flags,True)
		SetOptionFlags(oidShowRaceMenu,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidTempArkayCurse,flags,True)
		SetOptionFlags(oidNPCStealItems,flags,True)
		SetOptionFlags(oidHostileNPC,flags,True)
		SetOptionFlags(oidMoralityMatters,flags,True)
		SetOptionFlags(oidCreaturesCanSteal,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidSkillReduce_M,flags,True)
		SetOptionFlags(oidSkillReduceRandomVal,flags,True)
		SetOptionFlags(oidSkillReduceMinValSlider,flags,True)
		SetOptionFlags(oidSkillReduceMaxValSlider,flags,True)
		SetOptionFlags(oidSkillReduceValSlider,flags,True)
		SetOptionFlags(oidLoseSkillForever,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags)
	ElseIf (option == oidRemovableItems_M)
		iRemovableItems = 0
		SetMenuOptionValue(oidRemovableItems_M, sLoseOptions[iRemovableItems])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidLoseforever, flags,True)
		SetOptionFlags(oidNPCStealItems,flags,True)
		SetOptionFlags(oidHostileNPC,flags,True)
		SetOptionFlags(oidMoralityMatters,flags,True)
		SetOptionFlags(oidCreaturesCanSteal,flags)
	ElseIf (option == oidInformation)
		bIsInfoEnabled = False
		SetToggleOptionValue(oidInformation,bIsInfoEnabled)
		ForcePageReset()
	ElseIf (option == oidAutoSwitchRP)
		bAutoSwitchRP = False
		SetToggleOptionValue(oidAutoSwitchRP,bAutoSwitchRP)
	ElseIf (option == oidArkayCurses_M)
		iArkayCurse = 0
		SetMenuOptionValue(oidArkayCurses_M, sArkayCurses[iArkayCurse])
	ElseIf (option == oidEnableSave_M)
		iSaveOption = 1
		SetMenuOptionValue(oidEnableSave_M, sSaveOptions[iSaveOption])
		moaPraytoSave.SetValue(0.0)
		SetInChargen(False,False,False)
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
	;ElseIf (option == oidRespawnPoint7)
	;	SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint7")
	ElseIf (option == oidRespawnNaked)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnNaked")
	ElseIf (option == oidRespawnMenu)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnMenu")
	ElseIf (option == oidTeleportMenu)
		SetInfoText("$mrt_MarkofArkay_DESC_TeleportMenu")
	ElseIf (option == oidJail)
		SetInfoText("$mrt_MarkofArkay_DESC_Jail")
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
	ElseIf (option == oidNPCStealItems)
		SetInfoText("$mrt_MarkofArkay_DESC_NPCStealItems")
	ElseIf (option == oidCreaturesCanSteal )
		SetInfoText("$mrt_MarkofArkay_DESC_CreaturesCanSteal")
	ElseIf (option == oidMoralityMatters )
		SetInfoText("$mrt_MarkofArkay_DESC_MoralityMatters")
	ElseIf (option == oidHostileNPC)
		SetInfoText("$mrt_MarkofArkay_DESC_HostileNPC")
	ElseIf (option == oidRemovableItems_M)
		SetInfoText("$mrt_MarkofArkay_DESC_RemovableItems_M")
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
	EndIf
EndEvent

Function moaStart()
	If moaState.GetValue() == 0
		moaState.SetValue(1)
		setArrays()
		moaBleedoutHandlerState.SetValue(0)
		moaReviverQuest.Start()
		PlayerRef.GetActorBase().SetEssential(True)
		PlayerRef.SetNoBleedoutRecovery(True)
		moaLootChance.SetValue(100.0 - fLootChanceSlider)
		moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
		ToggleFallDamage(True)
		ToggleFallDamage(False)
		SetSavingOption(iSaveOption)
		Utility.Wait(1.0)
		Debug.notification("$mrt_MarkofArkay_Notification_Started")
	EndIf
Endfunction

Function moaStop()
	ToggleFallDamage(False)
	If moaState.GetValue() == 1
		If (ReviveScript.ThiefNPC.GetReference() As Actor)
			(ReviveScript.ThiefNPC.GetReference() As Actor).RemoveItem(ReviveScript.StolenItemsMisc,(ReviveScript.ThiefNPC.GetReference() As Actor ).GetItemCount(ReviveScript.StolenItemsMisc))
			(ReviveScript.ThiefNPC.GetReference() As Actor).RemoveFromFaction(ReviveScript.PlayerEnemyFaction)
		EndIf
		If ReviveScript.Thief
			ReviveScript.Thief.RemoveItem(ReviveScript.StolenItemsMisc,ReviveScript.Thief.GetItemCount(ReviveScript.StolenItemsMisc))
			ReviveScript.Thief.RemoveFromFaction(ReviveScript.PlayerEnemyFaction)
		EndIf
		PlayerRef.RemoveItem(ReviveScript.StolenItemsMisc,playerRef.GetItemCount(ReviveScript.StolenItemsMisc),abSilent = True)
		ReviveScript.Thief = None
		LostItemsMarker.MoveToMyEditorLocation()
		LostItemsMarker.Disable()
		LostItemsChest.RemoveAllItems(PlayerRef, True, True)
		If ReviveScript.fLostSouls > 0.0
			PlayerRef.ModActorValue("DragonSouls", ReviveScript.fLostSouls)
			ReviveScript.fLostSouls = 0.0
		EndIf
		ReviveScript.RestoreSkills()
		ReviveScript.bIsItemsRemoved = False
		If moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
		If moaRetrieveLostItems01.IsRunning()
			moaRetrieveLostItems01.SetStage(20)
		EndIf
		ReviveScript.moaSoulMark01.Stop()
		ReviveScript.moaThiefNPC01.Stop()
		CustomMarker.MoveToMyEditorLocation()
		SleepMarker.MoveToMyEditorLocation()
		CustomMarker.Disable()
		SleepMarker.Disable()
		ReviveScript.Fadeout.Remove()
		ReviveScript.FastFadeOut.Remove()
		ReviveScript.BlackScreen.Remove()
		ReviveScript.FadeIn.Remove()
		PlayerRef.SetAlpha(1.0)
		moaState.SetValue(0)
		moaReviverQuest.Stop()
		moaFollowerDetector.Stop()
		moaHostileNPCDetector.Stop()
		moaHostileNPCDetector01.Stop()
		moaGuardDetector.Stop()
		PlayerRef.GetActorBase().SetEssential(False)
		PlayerRef.SetNoBleedoutRecovery(False)
		moaBleedoutHandlerState.SetValue(0)
		PlayerRef.DispelSpell(ArkayBlessing)
		PlayerRef.DispelSpell(RevivalPower)
		PlayerRef.RemoveSpell(SacrificePower)
		PlayerRef.RemoveSpell(RevivalPower)
		PlayerRef.RemoveSpell(ArkayCurse)
		PlayerRef.RemoveSpell(ArkayCurseAlt)
		PlayerRef.RemoveSpell(ArkayCurseTemp)
		PlayerRef.RemoveSpell(ArkayCurseTempAlt)
		PlayerRef.RemoveSpell(MoveCustomMarker)
		PlayerRef.RemoveSpell(RecallMarker)
		DetachMarker1.MoveToMyEditorLocation()
		DetachMarker2.MoveToMyEditorLocation()
		DetachMarker3.MoveToMyEditorLocation()
		CellLoadMarker.MoveToMyEditorLocation()
		LocationMarker.MoveToMyEditorLocation()
		CellLoadMarker2.MoveToMyEditorLocation()
		LocationMarker2.MoveToMyEditorLocation()
		DetachMarker1.Disable()
		DetachMarker2.Disable()
		DetachMarker3.Disable()
		CellLoadMarker.Disable()
		LocationMarker.Disable()
		CellLoadMarker2.Disable()
		LocationMarker2.Disable()
		Debug.SetGodMode(False)
		moaLootChance.SetValue(100.0)
		moaScrollChance.SetValue(100.0)
		SetInChargen(False,False,False)
		moaPraytoSave.SetValue(0.0)
		Utility.Wait(1.0)
		Debug.notification("$mrt_MarkofArkay_Notification_Stopped")
	EndIf
EndFunction

Bool Function bIsModBusy()
	PlayerRef.GetCombatState()
	Return ((PlayerRef.GetCombatState() == 1) || (bToggling) || ( moaState.GetValue() == 1 && (PlayerRef.IsBleedingOut() || (moaBleedoutHandlerState.GetValue() != 0))))
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

Event OnConfigInit()
	If bInit
		Return
	EndIf
	bInit = True
	setPages()
EndEvent

Event OnConfigRegister()
	RegisterForSingleUpdate(3.0)
EndEvent

Int Function GetVersion()
	Return 40
EndFunction

Event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version
	If (a_version >= 2 && CurrentVersion < 2)
		Debug.Trace(self + ": Updating script to version " + 2)
	EndIf
	If (a_version >= 3 && CurrentVersion < 3)
		Debug.Trace(self + ": Updating script to version " + 3)
		sRespawnPoints = New String[7]
		bRespawnPointsFlags = New Bool[6]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Random"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
	EndIf
	If (a_version >= 4 && CurrentVersion < 4)
		Debug.Trace(self + ": Updating script to version " + 4)
		sRespawnPoints = New String[8]
		bRespawnPointsFlags = New Bool[7]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Winterhold"
		sRespawnPoints[7] = "$Random"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
	Endif
	If (a_version >= 6 && CurrentVersion < 6)
		Debug.Trace(self + ": Updating script to version " + 6)
		sRespawnPoints = New String[9]
		bRespawnPointsFlags = New Bool[7]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Winterhold"
		sRespawnPoints[7] = "$Random"
		sRespawnPoints[8] = "$Custom"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
	Endif
	If (a_version >= 8 && CurrentVersion < 8)
		Debug.Trace(self + ": Updating script to version " + 8)
		If bLostItemQuest && ( ReviveScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
			moaRetrieveLostItems.start()
			moaRetrieveLostItems.SetStage(1)
		ElseIf moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
	EndIf
	If (a_version >= 12 && CurrentVersion < 12)
		Debug.Trace(self + ": Updating script to version "  + 12)
	EndIf
	If (a_version >= 14 && CurrentVersion < 14)
		Debug.Trace(self + ": Updating script to version "  + 14)
		If iTeleportLocation >= sRespawnPoints.Length
			iTeleportLocation = ( sRespawnPoints.Length - 6 )
		Endif
	EndIf
	If (a_version >= 16 && CurrentVersion < 16)
		Debug.Trace(self + ": Updating script to version "  + 16)
		If iRemovableItems == 3
			iRemovableItems = 5
		ElseIf iRemovableItems == 4
			iRemovableItems = 9
		Endif
	Endif
	If (a_version >= 20 && CurrentVersion < 20)
		Debug.Trace(self + ": Updating script to version "  + 20)
		If iTeleportLocation == 8
			iTeleportLocation = 9
		Elseif iTeleportLocation == 9
			iTeleportLocation = 10
		Endif 
		ReviveScript.RegisterForSleep()
	EndIf
	If (a_version >= 26 && CurrentVersion < 26)
		Debug.Trace(self + ": Updating script to version "  + 26)
		DetachMarker2.Enable()
		DetachMarker2.MoveTo(PlayerRef)
	EndIf
	If (a_version >= 28 && CurrentVersion < 28)
		Debug.Trace(self + ": Updating script to version "  + 28)
		iTotalBleedOut = ReviveScript.iTotalBleedOut
		iTotalRespawn = ReviveScript.iTotalRespawn
		iTotalRevives = ReviveScript.iTotalRevives
		iRevivesByTrade = ReviveScript.iRevivesByTrade
		iRevivesByRevivalSpell = ReviveScript.iRevivesByRevivalSpell
		iRevivesBySacrificeSpell = ReviveScript.iRevivesBySacrificeSpell
		iRevivesByPotion = ReviveScript.iRevivesByPotion
		iDestroyedItems = ReviveScript.iDestroyedItems
	EndIf
	If (a_version >= 30 && CurrentVersion < 30)
		Debug.Trace(self + ": Updating script to version "  + 30)
	EndIf
	If (a_version >= 32 && CurrentVersion < 32)
		If ( LostItemsMarker.GetParentCell() != ReviveScript.DefaultCell )
			Debug.Trace(self + ": Updating script to version "  + 32)
			ReviveScript.moaSoulMark01.Start()
		EndIf
	EndIf
	If (a_version >= 34 && CurrentVersion < 34)
		Debug.Trace(self + ": Updating script to version "  + 34)
	EndIf
	If (a_version >= 36 && CurrentVersion < 36)
		Debug.Trace(self + ": Updating script to version "  + 36)
		If iRemovableItems > 1
			iRemovableItems += 1
		EndIf
	EndIf
	If (a_version >= 38 && CurrentVersion < 38)
		Debug.Trace(self + ": Updating script to version "  + 38)
	EndIf
	If (a_version >= 40 && CurrentVersion < 40)
		Debug.Trace(self + ": Updating script to version "  + 40)
		setArrays()
	EndIf
	ForcePageReset()
EndEvent

Event OnUpdate()
	bInit = False
	If moaState.GetValue() == 1
		Debug.notification("$mrt_MarkofArkay_Notification_Init")
	EndIf
EndEvent

Event OnGameReload()
	Parent.OnGameReload()
	OnVersionUpdate(GetVersion())
EndEvent

Function setArrays()
	setPages()
	setRespawnPoints()
	setLoseOptions()
	setAftermathOptions()
	setArkayCurses()
	setSaveOptions()
	setPresets()
	setSkills()
EndFunction

Function setPages()
	Pages = new String[5]
	pages[0] = "$General"
	pages[1] = "$Extra"
	pages[2] = "$Aftermath"
	pages[3] = "$Debug"
	pages[4] = "$Presets"
EndFunction

Function setRespawnPoints()
	sRespawnPoints = New String[13]
	bRespawnPointsFlags = New Bool[7]
	sRespawnPoints[0] = "$Whiterun"
	sRespawnPoints[1] = "$Falkreath"
	sRespawnPoints[2] = "$Markarth"
	sRespawnPoints[3] = "$Riften"
	sRespawnPoints[4] = "$Solitude"
	sRespawnPoints[5] = "$Windhelm"
	sRespawnPoints[6] = "$Winterhold"
	sRespawnPoints[7] = "$RandomCity"
	sRespawnPoints[8] = "$LastSleepLocation"
	sRespawnPoints[9] = "$Custom"
	sRespawnPoints[10] = "$External"
	sRespawnPoints[11] = "$Nearby"
	sRespawnPoints[12] = "$Random"
	bRespawnPointsFlags[0] = True
	bRespawnPointsFlags[1] = True
	bRespawnPointsFlags[2] = True
	bRespawnPointsFlags[3] = True
	bRespawnPointsFlags[4] = True
	bRespawnPointsFlags[5] = True
	bRespawnPointsFlags[6] = True
EndFunction

Function setLoseOptions()
	sLoseOptions = New String[14]
	sLoseOptions[0] = "$mrt_MarkofArkay_LoseOptions_0" 
	sLoseOptions[1] = "$mrt_MarkofArkay_LoseOptions_1" 
	sLoseOptions[2] = "$mrt_MarkofArkay_LoseOptions_2" 
	sLoseOptions[3] = "$mrt_MarkofArkay_LoseOptions_3" 
	sLoseOptions[4] = "$mrt_MarkofArkay_LoseOptions_4" 
	sLoseOptions[5] = "$mrt_MarkofArkay_LoseOptions_5" 
	sLoseOptions[6] = "$mrt_MarkofArkay_LoseOptions_6" 
	sLoseOptions[7] = "$mrt_MarkofArkay_LoseOptions_7" 
	sLoseOptions[8] = "$mrt_MarkofArkay_LoseOptions_8" 
	sLoseOptions[9] = "$mrt_MarkofArkay_LoseOptions_9" 
	sLoseOptions[10] = "$mrt_MarkofArkay_LoseOptions_10"
	sLoseOptions[11] = "$mrt_MarkofArkay_LoseOptions_11"
	sLoseOptions[12] = "$mrt_MarkofArkay_LoseOptions_12"
	sLoseOptions[13] = "$mrt_MarkofArkay_LoseOptions_13"
EndFunction

Function setAftermathOptions()
	sAftermathOptions = New String[3]
	sAftermathOptions[0] = "$mrt_MarkofArkay_AftermathOptions_0"
	sAftermathOptions[1] = "$mrt_MarkofArkay_AftermathOptions_1"
	sAftermathOptions[2] = "$mrt_MarkofArkay_AftermathOptions_2"
EndFunction

Function setArkayCurses()
	sArkayCurses = New String[3]
	sArkayCurses[0] = "$mrt_MarkofArkay_ArkayCurses_0"
	sArkayCurses[1] = "$mrt_MarkofArkay_ArkayCurses_1"
	sArkayCurses[2] = "$mrt_MarkofArkay_ArkayCurses_2"
EndFunction

Function setSaveOptions()
	sSaveOptions = new String[5]
	sSaveOptions[0] = "$mrt_MarkofArkay_SaveOptions_0"
	sSaveOptions[1] = "$mrt_MarkofArkay_SaveOptions_1"
	sSaveOptions[2] = "$mrt_MarkofArkay_SaveOptions_2"
	sSaveOptions[3] = "$mrt_MarkofArkay_SaveOptions_3"
	sSaveOptions[4] = "$mrt_MarkofArkay_SaveOptions_4"
EndFunction

Function setPresets()
	sPresets = New String[10]
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
EndFunction

Function setSkills()
	sSkills = New String[25]
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
	sSkills[24] = "$All"
EndFunction

Int Function iGetRespawnPointsCount()
	int iIndex = 0
	Int iCount = 0
	while( iIndex < ( sRespawnPoints.Length - 6 ))
		If bRespawnPointsFlags[iIndex]
			iCount += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iCount
EndFunction

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
	iRemovableItems = fiss.loadInt("iRemovableItems")
	iArkayCurse = fiss.loadInt("iArkayCurse")
	bRespawnNaked = fiss.loadBool("bRespawnNaked")
	bSendToJail = fiss.loadBool("bSendToJail")
	bTeleportMenu = fiss.loadBool("bTeleportMenu")
	bRespawnMenu = fiss.loadBool("bRespawnMenu")
	bFollowerProtectPlayer = fiss.loadBool("bFollowerProtectPlayer")
	bArkayCurse = fiss.loadBool("bArkayCurse")
	bIsArkayCurseTemporary = fiss.loadBool("bIsArkayCurseTemporary")
	bHealActors = fiss.loadBool("bHealActors")
	bResurrectActors = fiss.loadBool("bResurrectActors")
	bLoseForever = fiss.loadBool("bLoseForever")
	bSoulMarkStay = fiss.loadBool("bSoulMarkStay")
	;bLostItemQuest = fiss.loadBool("bLostItemQuest")
	bHostileNPC = fiss.loadBool("bHostileNPC")
	If bHostileNPC
		bNPCStealItems = False
	EndIf
	bNPCStealItems = fiss.loadBool("bNPCStealItems")
	If bNPCStealItems
		bHostileNPC = False
	EndIf
	bCreaturesCanSteal = fiss.loadBool("bCreaturesCanSteal")
	moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
	iTeleportLocation = fiss.loadInt("iTeleportLocation")
	iExternalIndex = fiss.loadInt("iExternalIndex")
	fRPMinDistanceSlider = fiss.loadFloat("fRPMinDistanceSlider")
	bRespawnPointsFlags[0] = fiss.loadBool("bRespawnPointsFlags0")
	bRespawnPointsFlags[1] = fiss.loadBool("bRespawnPointsFlags1")
	bRespawnPointsFlags[2] = fiss.loadBool("bRespawnPointsFlags2")
	bRespawnPointsFlags[3] = fiss.loadBool("bRespawnPointsFlags3")
	bRespawnPointsFlags[4] = fiss.loadBool("bRespawnPointsFlags4")
	bRespawnPointsFlags[5] = fiss.loadBool("bRespawnPointsFlags5")
	bRespawnPointsFlags[6] = fiss.loadBool("bRespawnPointsFlags6")
	;bRespawnPointsFlags[7] = fiss.loadBool("bRespawnPointsFlags7")
	bIsLoggingEnabled = fiss.loadBool("bIsLoggingEnabled")
	bIsInfoEnabled = fiss.loadBool("bIsInfoEnabled")
	bIsNotificationEnabled = fiss.loadBool("bIsNotificationEnabled")
	bFadeToBlack = fiss.loadBool("bFadeToBlack")
	bInvisibility = fiss.loadBool("bInvisibility")
	bIsTradeEnabled = fiss.loadBool("bIsTradeEnabled")
	bDeathEffect = fiss.loadBool("bDeathEffect")
	bAltEyeFix = fiss.loadBool("bAltEyeFix")
	bPlayerProtectFollower = fiss.loadBool("bPlayerProtectFollower")
	bMoralityMatters = fiss.loadBool("bMoralityMatters")
	moaMoralityMatters.SetValue(bMoralityMatters As Int)
	iReducedSkill = fiss.loadInt("iReducedSkill")
	bSkillReduceRandomVal = fiss.loadBool("bSkillReduceRandomVal")
	fSkillReduceValSlider = fiss.loadFloat("fSkillReduceValSlider")
	fSkillReduceMinValSlider = fiss.loadFloat("fSkillReduceMinValSlider")
	fSkillReduceMaxValSlider = fiss.loadFloat("fSkillReduceMaxValSlider")
	bShowRaceMenu = fiss.loadBool("bShowRaceMenu")
	bLoseSkillForever = fiss.loadBool("bLoseSkillForever")
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
	String[] resultArr = StringUtil.Split(strErrors,"\n")
	Int index = resultArr.Length
	Bool Result = True
	String strError
	While index > 0
		index -= 1
		strError = resultArr[index]
		If strError == "Element bIsTradeEnabled not found"
			bIsTradeEnabled = True
		ElseIf strError == "Element bDeathEffect not found"
			bDeathEffect = True
		ElseIf strError == "Element bAltEyeFix not found"
			bAltEyeFix = False
		ElseIf strError == "Element bPlayerProtectFollower not found"
			bPlayerProtectFollower = False
		ElseIf strError == "Element bMoralityMatters not found"
			bMoralityMatters = True
			moaMoralityMatters.SetValue(bMoralityMatters As Int)
		ElseIf strError == "Element iReducedSkill not found"
			iReducedSkill = 0
		ElseIf strError == "Element bSkillReduceRandomVal not found"
			bSkillReduceRandomVal = False
		ElseIf strError == "Element fSkillReduceValSlider not found"
			fSkillReduceValSlider = 10.0
		ElseIf strError == "Element fSkillReduceMinValSlider not found"
			fSkillReduceMinValSlider = 0.0
		ElseIf strError == "Element fSkillReduceMaxValSlider not found"
			fSkillReduceMaxValSlider = 1.0
		ElseIf strError == "Element bShowRaceMenu not found"
			bShowRaceMenu = False
		ElseIf strError == "Element bLoseSkillForever not found"
			bLoseSkillForever = False
		;ElseIf strError == "Element bRespawnPointsFlags7 not found"
		;	bRespawnPointsFlags[7] = True
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
	fiss.saveInt("iRemovableItems", iRemovableItems)
	fiss.saveInt("iArkayCurse", iArkayCurse)
	fiss.saveBool("bRespawnNaked", bRespawnNaked)
	fiss.saveBool("bSendToJail", bSendToJail)
	fiss.saveBool("bTeleportMenu", bTeleportMenu)
	fiss.saveBool("bRespawnMenu", bRespawnMenu)
	fiss.saveBool("bFollowerProtectPlayer", bFollowerProtectPlayer)
	fiss.saveBool("bPlayerProtectFollower", bPlayerProtectFollower)
	fiss.saveBool("bArkayCurse", bArkayCurse)
	fiss.saveBool("bIsArkayCurseTemporary", bIsArkayCurseTemporary)
	fiss.saveBool("bHealActors", bHealActors)
	fiss.saveBool("bResurrectActors", bResurrectActors)
	fiss.saveBool("bLoseForever", bLoseForever)
	fiss.saveBool("bSoulMarkStay", bSoulMarkStay)
	;fiss.saveBool("bLostItemQuest", bLostItemQuest)
	fiss.saveBool("bHostileNPC", bHostileNPC)
	fiss.saveBool("bNPCStealItems", bNPCStealItems)
	fiss.saveBool("bCreaturesCanSteal", bCreaturesCanSteal)
	fiss.saveBool("bMoralityMatters", bMoralityMatters)
	fiss.saveInt("iTeleportLocation", iTeleportLocation)
	fiss.saveInt("iExternalIndex", iExternalIndex)
	fiss.saveFloat("fRPMinDistanceSlider", fRPMinDistanceSlider)
	fiss.saveBool("bRespawnPointsFlags0", bRespawnPointsFlags[0])
	fiss.saveBool("bRespawnPointsFlags1", bRespawnPointsFlags[1])
	fiss.saveBool("bRespawnPointsFlags2", bRespawnPointsFlags[2])
	fiss.saveBool("bRespawnPointsFlags3", bRespawnPointsFlags[3])
	fiss.saveBool("bRespawnPointsFlags4", bRespawnPointsFlags[4])
	fiss.saveBool("bRespawnPointsFlags5", bRespawnPointsFlags[5])
	fiss.saveBool("bRespawnPointsFlags6", bRespawnPointsFlags[6])
	;fiss.saveBool("bRespawnPointsFlags7", bRespawnPointsFlags[7])
	fiss.saveBool("bIsLoggingEnabled", bIsLoggingEnabled)
	fiss.saveBool("bIsInfoEnabled", bIsInfoEnabled)
	fiss.saveBool("bIsNotificationEnabled", bIsNotificationEnabled)
	fiss.saveBool("bFadeToBlack", bFadeToBlack)
	fiss.saveBool("bInvisibility", bInvisibility)
	fiss.saveBool("bIsTradeEnabled", bIsTradeEnabled)
	fiss.saveBool("bDeathEffect", bDeathEffect)
	fiss.saveBool("bAltEyeFix", bAltEyeFix)
	fiss.saveInt("iReducedSkill", iReducedSkill)
	fiss.saveBool("bSkillReduceRandomVal", bSkillReduceRandomVal)
	fiss.saveFloat("fSkillReduceValSlider", fSkillReduceValSlider)
	fiss.saveFloat("fSkillReduceMinValSlider", fSkillReduceMinValSlider)
	fiss.saveFloat("fSkillReduceMaxValSlider", fSkillReduceMaxValSlider)
	fiss.saveBool("bShowRaceMenu",bShowRaceMenu)
	fiss.saveBool("bLoseSkillForever",bLoseSkillForever)
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
	iRemovableItems = 0
	iArkayCurse = 0
	bRespawnNaked = False
	bSendToJail = False
	bTeleportMenu = False
	bRespawnMenu = False
	bFollowerProtectPlayer = False
	bPlayerProtectFollower = False
	bArkayCurse = False
	bIsArkayCurseTemporary = False
	bHealActors = False
	bResurrectActors = False
	bLoseForever = False
	bSoulMarkStay = False
	bLostItemQuest = True
	bHostileNPC = False
	If bHostileNPC
		bNPCStealItems = False
	EndIf
	bNPCStealItems = False
	If bNPCStealItems
		bHostileNPC = False
	EndIf
	bCreaturesCanSteal = False
	moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
	bMoralityMatters = True
	moaMoralityMatters.SetValue(bMoralityMatters As Int)
	iTeleportLocation = 0
	iExternalIndex = -1
	fRPMinDistanceSlider = 2500.0
	bRespawnPointsFlags[0] = True
	bRespawnPointsFlags[1] = True
	bRespawnPointsFlags[2] = True
	bRespawnPointsFlags[3] = True
	bRespawnPointsFlags[4] = True
	bRespawnPointsFlags[5] = True
	bRespawnPointsFlags[6] = True
	;bRespawnPointsFlags[7] = True
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
EndFunction
