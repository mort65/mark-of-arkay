Scriptname zzzmoaReviveMCM extends SKI_ConfigBase  

import Game

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
Int oidDragonSoulPSlider
Int oidBSoulGemPSlider
Int oidGSoulGemPSlider
Int oidGoldPSlider
Int oidStatus
Int oidReset
int oidLootChanceSlider
int oidScrollChanceSlider
Int oidNotification
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
Int oidRemovableItems_M
Int oidNoTradingAftermath_M
Int oidArkayCurses_M
Int oidInformation
Int oidResetHistory
Int oidHistory
Int oidAutoSwitchRP
int oidRecallCost
int oidBleedoutTime
Int oidRecallByArkayMark
Int oidJail
Int oidTogglePowers
Int oidToggleSpells
Int oidRespawnTimeSlider
String[] Property sRespawnPoints Auto
String[] Property sLoseOptions Auto
String[] Property sAftermathOptions Auto
Bool[] Property bRespawnPointsFlags Auto
String[] Property sArkayCurses Auto
Actor Property PlayerRef Auto
GlobalVariable Property moaState Auto
GlobalVariable Property moaLootChance Auto
GlobalVariable Property moaScrollChance Auto
GlobalVariable Property moaBleedoutHandlerState Auto
GlobalVariable Property moaBleedouAnimation Auto
Quest Property moaReviverQuest Auto
Quest Property moaRetrieveLostItems Auto
Float Property fJumpFallHeightMinDefault = 600.00 Auto Hidden
Bool Property bIsRevivalEnabled = True Auto Hidden
Bool Property bIsEffectEnabled = True Auto Hidden
Bool Property bIsDragonSoulEnabled = True Auto Hidden
Bool Property bIsBSoulGemEnabled = True Auto Hidden
Bool Property bIsGSoulGemEnabled = True Auto Hidden
Bool Property bIsPotionEnabled = False Auto Hidden
Bool Property bAutoDrinkPotion = False Auto Hidden
Bool Property bIsGoldEnabled = True Auto Hidden 
Bool Property bRecallByArkayMark = False Auto Hidden ;
Bool Property bIsMarkEnabled = True Auto Hidden
Bool Property bIsMenuEnabled = True Auto Hidden
Bool Property bArkayCurse = False Auto Hidden
Bool Property bIsRagdollEnabled = False Auto Hidden
Bool Property bIsNotificationEnabled = False Auto Hidden
Bool Property bIsNoFallDamageEnabled = False Auto Hidden
Bool Property bIsRevivalRequiresBlessing = False Auto Hidden
Bool Property bIsQuitToMainMenuEnabled = False Auto Hidden
Bool Property bRespawnNaked = False Auto Hidden
Bool Property bLostItemQuest = False Auto Hidden
Bool Property bIsRecallRestricted = True Auto Hidden
Bool Property bAutoSwitchRP = False Auto Hidden
Int Property iNotTradingAftermath = 0 Auto Hidden
Int Property iRemovableItems = 0 Auto Hidden
Int Property iArkayCurse = 0 Auto Hidden
Bool Property bLoseForever = False Auto Hidden
Bool Property bSoulMarkStay = False Auto Hidden
Bool Property bIsHistoryEnabled = False Auto Hidden
Bool Property bIsInfoEnabled = False Auto Hidden
Bool Property bSendToJail = False Auto Hidden
Int Property iTeleportLocation = 0 Auto Hidden
Float Property fValueSoulSlider = 1.0 Auto Hidden
Float Property fValueGoldSlider = 1000.0 Auto Hidden
Float Property fValueBSoulGemSlider = 1.0 Auto Hidden
Float Property fValueGSoulGemSlider = 1.0 Auto Hidden
Float Property fValueMarkSlider = 1.0 Auto Hidden
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
Float Property fRespawnTimeSlider = 0.0 Auto Hidden
Int Property iExternalIndex = -1 Auto Hidden
Spell Property RevivalPower Auto
Spell Property SacrificePower Auto
Spell Property MoveCustomMarker Auto
Spell Property RecallMarker Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
Bool Property bShiftBack = False Auto Hidden
Bool Property bShiftBackRespawn = True Auto Hidden
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
Bool bToggling

Event OnPageReset(String page)
	SetCursorFillMode(LEFT_TO_RIGHT)
	If ( bIsModBusy() )
		AddHeaderOption("$mrt_MarkofArkay_HEAD_Locked")
		Return
	Endif
	If (page == "$General")
		SetCursorPosition(0)
		AddHeaderOption("$General")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_RevivalEnabled", bIsRevivalEnabled, flags )
		SetCursorPosition(6)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidMarkOfArkayRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_MarkOfArkayRevivalEnabled", bIsMarkEnabled, flags )
		SetCursorPosition(8)
		oidGSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GSoulGemRevivalEnabled", bIsGSoulGemEnabled, flags )
		SetCursorPosition(10)
		oidBSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_BSoulGemRevivalEnabled", bIsBSoulGemEnabled, flags )
		SetCursorPosition(12)
		oidDragonSoulRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_DragonSoulRevivalEnabled", bIsDragonSoulEnabled, flags )
		SetCursorPosition(14)
		oidGoldRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GoldRevivalEnabled", bIsGoldEnabled, flags )
		SetCursorPosition(7)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidMarkSlider = AddSliderOption("$mrt_MarkofArkay_MarkSlider_1", fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2", flags)
		SetCursorPosition(9)
		oidGSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_GSoulGemSlider_1", fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2", flags)
		SetCursorPosition(11)
		oidBSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_BSoulGemSlider_1", fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2", flags)
		SetCursorPosition(13)
		oidDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_DragonSoulSlider_1", fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2", flags)
		SetCursorPosition(15)
		oidGoldSlider = AddSliderOption("$mrt_MarkofArkay_GoldSlider_1", fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2", flags)
	ElseIf (page == "$Extra")
		SetCursorPosition(0)
		AddHeaderOption("$Extra")
		SetCursorPosition(2)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidNoFallDamageEnabled = AddToggleOption("$mrt_MarkofArkay_NoFallDamageEnabled", bIsNoFallDamageEnabled, flags )
		SetCursorPosition(4)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidEffect = AddToggleOption("$mrt_MarkofArkay_Effect", bIsEffectEnabled, flags )
		SetCursorPosition(6)
		oidPotionRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_PotionRevivalEnabled", bIsPotionEnabled, flags )
		SetCursorPosition(8)
		If  ( moaState.getValue() == 1 ) && ( bIsRevivalEnabled )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidAutoDrinkPotion = AddToggleOption("$mrt_MarkofArkay_AutoDrinkPotion", bAutoDrinkPotion, flags )
		SetCursorPosition(10)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRevivalRequireBlessing = AddToggleOption("$mrt_MarkofArkay_RevivalRequireBlessing", bIsRevivalRequiresBlessing, flags )
		SetCursorPosition(12)
		oidShiftBack = AddToggleOption("$mrt_MarkofArkay_ShiftBack", bShiftBack,flags)
		SetCursorPosition(14)
		oidShiftBackRespawn = AddToggleOption("$mrt_MarkofArkay_ShiftBackRespawn", bShiftBackRespawn,flags)
		SetCursorPosition(16)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRecallRestriction = AddToggleOption("$mrt_MarkofArkay_RecallRestriction", bIsRecallRestricted, flags)
		SetCursorPosition(18)
		oidAutoSwitchRP = AddToggleOption("$mrt_MarkofArkay_AutoSwitchRP",bAutoSwitchRP,flags)
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidMenuEnabled = AddToggleOption("$mrt_MarkofArkay_MenuEnabled", bIsMenuEnabled, flags )
		SetCursorPosition(5)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( !bIsMenuEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
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
		Endif
		oidBleedoutTime = AddSliderOption("$mrt_MarkofArkay_BleedoutTime_1", fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(17)
		oidRecoveryTime = AddSliderOption("$mrt_MarkofArkay_RecoveryTime_1", fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
		SetCursorPosition(19)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
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
		Endif
		oidNoTradingAftermath_M = AddMenuOption("$mrt_MarkofArkay_NoTradingAftermath_M", sAftermathOptions[iNotTradingAftermath], flags)
		SetCursorPosition(3)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidTeleportLocation_M = AddMenuOption("$mrt_MarkofArkay_TeleportLocation_M", sRespawnPoints[iTeleportLocation], flags)
		SetCursorPosition(4)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRemovableItems_M = AddMenuOption("$mrt_MarkofArkay_RemovableItems_M", sLoseOptions[iRemovableItems], flags)
		SetCursorPosition(6)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bArkayCurse )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidArkayCurses_M = AddMenuOption("$mrt_MarkofArkay_ArkayCurses_M", sArkayCurses[iArkayCurse], flags)
		SetCursorPosition(10)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRespawnNaked = AddToggleOption("$mrt_MarkofArkay_RespawnNaked", bRespawnNaked, flags)
		SetCursorPosition(12)
		oidJail = AddToggleOption("$mrt_MarkofArkay_Jail",bSendToJail,flags)
		SetCursorPosition(14)
		oidArkayCurse = AddToggleOption("$mrt_MarkofArkay_ArkayCurse", bArkayCurse, flags)
		SetCursorPosition(16)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( iRemovableItems != 0 ))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidLoseforever = AddToggleOption("$mrt_MarkofArkay_Loseforever",bLoseForever, flags)
		SetCursorPosition(18)
		oidSoulMarkStay = AddToggleOption("$mrt_MarkofArkay_SoulMarkStay",bSoulMarkStay,flags)
		SetCursorPosition(20)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidLostItemQuest = AddToggleOption("$mrt_MarkofArkay_LostItemQuest",bLostItemQuest,flags)
		SetCursorPosition(5)
		If (( moaState.getValue() == 1 ) && ( iTeleportLocation == (sRespawnPoints.Length - 2) ) && ExternalMarkerList.GetSize() > 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		If iExternalIndex >= ExternalMarkerList.GetSize()
			iExternalIndex = -1
		Endif
		If iExternalIndex == -1
			oidExternalTeleportLocation = AddTextOption("$mrt_MarkofArkay_ExternalTeleportLocation", "$Random", flags)
		Else
			oidExternalTeleportLocation = AddTextOption("$mrt_MarkofArkay_ExternalTeleportLocation", ( (iExternalIndex + 1) As String ), flags)
		Endif
		SetCursorPosition(7)
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRespawnTimeSlider = AddSliderOption("$mrt_MarkofArkay_RespawnTimeSlider", fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider2", flags)
		SetCursorPosition(9)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidRespawnPoint0 = AddToggleOption(sRespawnPoints[0], bRespawnPointsFlags[0], flags )
		SetCursorPosition(11)
		oidRespawnPoint1 = AddToggleOption(sRespawnPoints[1], bRespawnPointsFlags[1], flags )
		SetCursorPosition(13)
		oidRespawnPoint2 = AddToggleOption(sRespawnPoints[2], bRespawnPointsFlags[2], flags )
		SetCursorPosition(15)
		oidRespawnPoint3 = AddToggleOption(sRespawnPoints[3], bRespawnPointsFlags[3], flags )
		SetCursorPosition(17)
		oidRespawnPoint4 = AddToggleOption(sRespawnPoints[4], bRespawnPointsFlags[4], flags )
		SetCursorPosition(19)
		oidRespawnPoint5 = AddToggleOption(sRespawnPoints[5], bRespawnPointsFlags[5], flags )
		SetCursorPosition(21)
		oidRespawnPoint6 = AddToggleOption(sRespawnPoints[6], bRespawnPointsFlags[6], flags )
		SetCursorPosition(23)
		oidRespawnPoint7 = AddToggleOption(sRespawnPoints[7], bRespawnPointsFlags[7], flags )
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
		Endif
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
		Endif
		oidNotification = AddToggleOption("$mrt_MarkofArkay_Notification", bIsNotificationEnabled, flags )
		SetCursorPosition(14)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		oidInformation = AddToggleOption("$mrt_MarkofArkay_Info", bIsInfoEnabled, flags )
		SetCursorPosition(16)
		oidHistory = AddToggleOption("$mrt_MarkofArkay_History", bIsHistoryEnabled, flags )
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
			If iTeleportLocation < sRespawnPoints.Length - 5
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
			Elseif (iTeleportLocation == sRespawnPoints.Length - 4)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 3)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 2) && (ExternalMarkerList.GetSize() > 1) && (iExternalIndex != -1)
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
			ElseIf (iTeleportLocation == sRespawnPoints.Length - 2) && (ExternalMarkerList.GetSize() == 1)
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
		AddHeaderOption("$History")
		SetCursorPosition(9)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iTotalBleedOut > 99999999
				AddTextOption("$Bleedouts", "+99999999", flags)
			Else
				AddTextOption("$Bleedouts", ReviveScript.iTotalBleedOut, flags)
			EndIf
		Else
			AddTextOption("$Bleedouts", "$Disabled", flags)
		EndIf
		SetCursorPosition(11)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iTotalRevives > 99999999
				AddTextOption("$Revivals", "+99999999", flags)
			Else
				AddTextOption("$Revivals", ReviveScript.iTotalRevives, flags)
			EndIf
		Else
			AddTextOption("$Revivals", "$Disabled", flags)
		EndIf
		SetCursorPosition(13)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iRevivesByPotion > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", ReviveScript.iRevivesByPotion, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "$Disabled", flags)
		EndIf
		SetCursorPosition(15)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iRevivesByRevivalSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", ReviveScript.iRevivesByRevivalSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(17)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iRevivesBySacrificeSpell > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", ReviveScript.iRevivesBySacrificeSpell, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "$Disabled", flags)
		EndIf
		SetCursorPosition(19)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iRevivesByTrade > 99999999
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", ReviveScript.iRevivesByTrade, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "$Disabled", flags)
		EndIf
		SetCursorPosition(21)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iTotalRespawn > 99999999
				AddTextOption("$Respawns", "+99999999", flags)
			Else
				AddTextOption("$Respawns", ReviveScript.iTotalRespawn, flags)
			EndIf
		Else
			AddTextOption("$Respawns", "$Disabled", flags)
		EndIf
		SetCursorPosition(23)
		If bIsHistoryEnabled && ( moaState.getValue() == 1 )
			If ReviveScript.iDestroyedItems > 99999999
				AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "+99999999", flags)
			Else
				AddTextOption("$mrt_MarkofArkay_Destroyed_Items", ReviveScript.iDestroyedItems, flags)
			EndIf
		Else
			AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "$Disabled", flags)
		EndIf
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
		Endif
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
	ElseIf (option == oidGoldRevivalEnabled)
		bIsGoldEnabled = !bIsGoldEnabled
		SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = !bIsNotificationEnabled
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
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
		Endif
		If iExternalIndex == -1
			SetTextOptionValue(option, "$Random")
		Else
			SetTextOptionValue(option, ( (iExternalIndex + 1) As String ))
		Endif
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
	ElseIf (option == oidRespawnPoint7)
		If !( (iGetRespawnPointsCount() < 3) && bRespawnPointsFlags[7])
			bRespawnPointsFlags[7] = !bRespawnPointsFlags[7]
			SetToggleOptionValue(oidRespawnPoint7,bRespawnPointsFlags[7])
		EndIf
	ElseIf (option == oidRespawnNaked)
		bRespawnNaked = !bRespawnNaked
		SetToggleOptionValue(oidRespawnNaked, bRespawnNaked)
	ElseIf (option == oidJail)
		bSendToJail = !bSendToJail
		SetToggleOptionValue(oidJail, bSendToJail)
	ElseIf (option == oidArkayCurse)
		bArkayCurse = !bArkayCurse
		SetToggleOptionValue(oidArkayCurse, bArkayCurse)
		If  ( bIsRevivalEnabled ) && ( iNotTradingAftermath == 1) && ( bArkayCurse )
			flags = OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidArkayCurses_M, flags)
	ElseIf (option == oidLoseforever)
		bLoseForever = !bLoseForever
		SetToggleOptionValue(oidLoseforever, bLoseForever)
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = !bLostItemQuest
		SetToggleOptionValue(oidLostItemQuest, bLostItemQuest)
		If bLostItemQuest && ( ReviveScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
			moaRetrieveLostItems.start()
			moaRetrieveLostItems.SetStage(1)
		ElseIf moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
	ElSeIf (option == oidAutoSwitchRP)
		bAutoSwitchRP = !bAutoSwitchRP
		SetToggleOptionValue(oidAutoSwitchRP,bAutoSwitchRP)
	ElseIf (option == oidSoulMarkStay)
		bSoulMarkStay = !bSoulMarkStay
		SetToggleOptionValue(oidSoulMarkStay,bSoulMarkStay)
	Elseif (option == oidInformation)
		bIsInfoEnabled = !bIsInfoEnabled
		SetToggleOptionValue(oidInformation,bIsInfoEnabled)
		ForcePageReset()
	Elseif (option == oidHistory)
		bIsHistoryEnabled = !bIsHistoryEnabled
		SetToggleOptionValue(oidHistory,bIsHistoryEnabled)
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
			ReviveScript.iTotalBleedOut = 0
			ReviveScript.iTotalRespawn = 0
			ReviveScript.iTotalRevives = 0
			ReviveScript.iRevivesByTrade = 0
			ReviveScript.iRevivesByRevivalSpell = 0
			ReviveScript.iRevivesBySacrificeSpell = 0
			ReviveScript.iRevivesByPotion = 0
			ReviveScript.iDestroyedItems = 0
			ForcePageReset()
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
		SetOptionFlags(oidNoFallDamageEnabled, flags, True)	
		SetOptionFlags(oidGoldSlider, flags, True)
		SetOptionFlags(oidMarkOfArkayRevivalEnabled, flags, True)
		SetOptionFlags(oidMarkSlider, flags, True)
		SetOptionFlags(oidBSoulGemRevivalEnabled, flags, True)
		SetOptionFlags(oidBSoulGemSlider, flags, True) 
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags, True)
		SetOptionFlags(oidRecoveryTime,flags,True)
		SetOptionFlags(oidBleedoutTime,flags,True)
		SetOptionFlags(oidRecallCost,flags,True)
		SetOptionFlags(oidNotification, flags,True)
		SetOptionFlags(oidGSoulGemPSlider, flags,True)
		SetOptionFlags(oidGSoulGemSlider, flags,True)
		SetOptionFlags(oidGSoulGemRevivalEnabled, flags,True)
		SetOptionFlags(oidEffect, flags,True)
		SetOptionFlags(oidRevivalRequireBlessing,flags,True)
		SetOptionFlags(oidRecallRestriction,flags,True)
		SetOptionFlags(oidPotionRevivalEnabled, flags,True)
		SetOptionFlags(oidAutoDrinkPotion, flags,True)
		SetOptionFlags(oidNoTradingAftermath_M, flags,True)
		SetOptionFlags(oidLootChanceSlider,flags,True)
		SetOptionFlags(oidScrollChanceSlider,flags,True)
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		SetOptionFlags(oidRespawnTimeSlider,flags,True)
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidLostItemQuest,flags,True)
		SetOptionFlags(oidAutoSwitchRP,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
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
		SetOptionFlags(oidRespawnPoint6,flags,True)
		SetOptionFlags(oidRespawnPoint7,flags)
		ForcePageReset()
		If moaState.getValue() == 1
			moaStop()
		Else
			moaStart()
		Endif
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
		SetOptionFlags(oidNoFallDamageEnabled, flags, True)	
		SetOptionFlags(oidGoldSlider, flags, True)
		SetOptionFlags(oidMarkOfArkayRevivalEnabled, flags, True)
		SetOptionFlags(oidMarkSlider, flags, True)
		SetOptionFlags(oidBSoulGemRevivalEnabled, flags, True)
		SetOptionFlags(oidBSoulGemSlider, flags, True) 
		SetOptionFlags(oidMarkPSlider, flags, True)
		SetOptionFlags(oidDragonSoulPSlider, flags, True)
		SetOptionFlags(oidBSoulGemPSlider, flags, True)
		SetOptionFlags(oidGoldPSlider, flags, True)
		SetOptionFlags(oidRecoveryTime,flags,True)
		SetOptionFlags(oidBleedoutTime,flags,True)
		SetOptionFlags(oidRecallCost,flags,True)
		SetOptionFlags(oidNotification, flags,True)
		SetOptionFlags(oidGSoulGemPSlider, flags,True)
		SetOptionFlags(oidGSoulGemSlider, flags,True)
		SetOptionFlags(oidGSoulGemRevivalEnabled, flags,True)
		SetOptionFlags(oidEffect, flags,True)
		SetOptionFlags(oidRevivalRequireBlessing,flags,True)
		SetOptionFlags(oidRecallRestriction,flags,True)
		SetOptionFlags(oidPotionRevivalEnabled, flags,True)
		SetOptionFlags(oidAutoDrinkPotion, flags,True)
		SetOptionFlags(oidNoTradingAftermath_M, flags,True)
		SetOptionFlags(oidLootChanceSlider,flags,True)
		SetOptionFlags(oidScrollChanceSlider,flags,True)
		SetOptionFlags(oidTeleportLocation_M,flags,True)
		SetOptionFlags(oidRespawnTimeSlider,flags,True)
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidLostItemQuest,flags,True)
		SetOptionFlags(oidLostItemQuest,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
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
		SetOptionFlags(oidRespawnPoint6,flags,True)
		SetOptionFlags(oidRespawnPoint7,flags)
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
	Elseif(option == oidRecallCost)
		SetSliderDialogStartValue(fRecallCastSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	Elseif(option == oidRespawnTimeSlider)
		SetSliderDialogStartValue(fRespawnTimeSlider)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 744.0)
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
	ElseIf (option == oidRespawnTimeSlider)
		fRespawnTimeSlider = value
		SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider2")
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
	EndIf
EndEvent

Event OnOptionMenuAccept(Int option, Int index)
	If (option == oidTeleportLocation_M)
		iTeleportLocation = index
		SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation])
		If ( ( moaState.getValue() == 1 ) && ( iTeleportLocation == (sRespawnPoints.Length - 2 ) ) && ExternalMarkerList.GetSize() > 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		If ( moaState.getValue() == 1 )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags,True)
		SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidRemovableItems_M)
		iRemovableItems = index
		SetMenuOptionValue(oidRemovableItems_M, sLoseOptions[iRemovableItems])
		If (( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1) && ( iRemovableItems != 0 ))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidLoseforever, flags,True)
		SetOptionFlags(oidSoulMarkStay, flags,True)
		If ( moaState.getValue() == 1 ) && bIsRevivalEnabled
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidLostItemQuest, flags)
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = index
		SetMenuOptionValue(oidNoTradingAftermath_M, sAftermathOptions[iNotTradingAftermath])
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1)
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags,True)
		SetOptionFlags(oidRespawnTimeSlider,flags,True)
		If bIsRevivalEnabled && ( iNotTradingAftermath == 1) && bArkayCurse
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		Endif
		SetOptionFlags(oidArkayCurses_M,flags,True)
		If ( bIsRevivalEnabled && ( iNotTradingAftermath == 1) && !( iRemovableItems == 0 ))
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
		If ( bIsRevivalEnabled )
			flags =	OPTION_FLAG_NONE
		Else
			flags = OPTION_FLAG_DISABLED
		EndIf
		SetOptionFlags(oidLostItemQuest,flags,True)
		If ( ( iTeleportLocation == (sRespawnPoints.Length - 2 ) ) && ExternalMarkerList.GetSize() > 1 )
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
		SetOptionFlags(oidRespawnPoint6,flags,True)
		SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidArkayCurses_M)
	    iArkayCurse = index
		SetMenuOptionValue(oidArkayCurses_M, sArkayCurses[iArkayCurse])
	Endif
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
	ElseIf (option == oidGoldRevivalEnabled)
		bIsGoldEnabled = True
		SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
	ElseIf (option == oidNoFallDamageEnabled)
		ToggleFallDamage(False)
		SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
	ElseIf (option == oidNotification)
		bIsNotificationEnabled = False
		SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
	ElseIf (option == oidPotionRevivalEnabled)
		bIsPotionEnabled = False
		SetToggleOptionValue(oidPotionRevivalEnabled, bIsPotionEnabled)
	ElSeIf (option == oidAutoDrinkPotion)
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
	ElseIf (option == oidRecoveryTime)
		fRecoveryTimeSlider = 1.0
		SetSliderOptionValue(oidRecoveryTime, fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
	ElseIf (option == oidBleedoutTime)
		fBleedoutTimeSlider = 6.0
		SetSliderOptionValue(oidBleedoutTime, fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")	
	ElseIf (option == oidRecallCost)
		fRecallCastSlider = 0.0
		SetSliderOptionValue(oidRecallCost, fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
	ElseIf (option == oidLootChanceSlider)
		fLootChanceSlider = 50.0
		SetSliderOptionValue(oidLootChanceSlider,fLootChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2")
		moaLootChance.SetValue(100.0 - fLootChanceSlider)
	ElseIf (option == oidScrollChanceSlider)
		fScrollChanceSlider = 25.0
		SetSliderOptionValue(oidScrollChanceSlider,fScrollChanceSlider,"$mrt_MarkofArkay_LootChanceSlider_2")
		moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
	ElseIf (option == oidRespawnTimeSlider)
		fRespawnTimeSlider = 0.0
		SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider2")	
	ElseIf (option == oidEffect)
		bIsEffectEnabled = True
		SetToggleOptionValue(oidEffect, bIsEffectEnabled)
	ElseIf (option == oidExternalTeleportLocation)
		iExternalIndex = -1
		SetTextOptionValue(option,"Random")
	ElseIf (option == oidRespawnPoint0)
		bRespawnPointsFlags[0] = True
		SetToggleOptionValue(oidRespawnPoint0,True)
	ElseIf (option == oidRespawnPoint1)
		bRespawnPointsFlags[1] = True
		SetToggleOptionValue(oidRespawnPoint1,True)
	ElseIf (option == oidRespawnPoint2)
		bRespawnPointsFlags[2] = True
		SetToggleOptionValue(oidRespawnPoint2,True)
	ElseIf (option == oidRespawnPoint3)
		bRespawnPointsFlags[3] = True
		SetToggleOptionValue(oidRespawnPoint3,True)
	ElseIf (option == oidRespawnPoint4)
		bRespawnPointsFlags[4] = True
		SetToggleOptionValue(oidRespawnPoint4,True)
	ElseIf (option == oidRespawnPoint5)
		bRespawnPointsFlags[5] = True
		SetToggleOptionValue(oidRespawnPoint5,True)
	ElseIf (option == oidRespawnPoint6)
		bRespawnPointsFlags[6] = True
		SetToggleOptionValue(oidRespawnPoint6,True)
	ElseIf (option == oidRespawnPoint7)
		bRespawnPointsFlags[7] = True
		SetToggleOptionValue(oidRespawnPoint7,True)
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
		bShiftBack = True
		SetToggleOptionValue(oidShiftBackRespawn,bShiftBackRespawn)
	ElseIf (option == oidRespawnNaked)
		bRespawnNaked = False
		SetToggleOptionValue(oidRespawnNaked,False)
	ElseIf (option == oidJail)
		bSendToJail = False
		SetToggleOptionValue(oidJail,False)
	ElseIf (option == oidArkayCurse)
		bArkayCurse = False
		SetToggleOptionValue(oidArkayCurse,False)
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidArkayCurses_M, flags)
	ElseIf (option == oidLoseforever)
		bLoseForever = False
		SetToggleOptionValue(oidLoseforever,False)
	ElseIf (option == oidLostItemQuest)
		bLostItemQuest = False
		SetToggleOptionValue(oidLostItemQuest,False)
		If moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
	ElseIf (option == oidSoulMarkStay)
		bSoulMarkStay = False
		SetToggleOptionValue(oidSoulMarkStay,False)
	ElseIf (option == oidTeleportLocation_M)
		iTeleportLocation = 0
		SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[0])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidExternalTeleportLocation,flags,True)
		SetOptionFlags(oidRespawnPoint0,flags,True)
		SetOptionFlags(oidRespawnPoint1,flags,True)
		SetOptionFlags(oidRespawnPoint2,flags,True)
		SetOptionFlags(oidRespawnPoint3,flags,True)
		SetOptionFlags(oidRespawnPoint4,flags,True)
		SetOptionFlags(oidRespawnPoint5,flags,True)
		SetOptionFlags(oidRespawnPoint6,flags,True)
		SetOptionFlags(oidRespawnPoint7,flags)
	ElseIf (option == oidNoTradingAftermath_M)
		iNotTradingAftermath = 0
		SetMenuOptionValue(oidNoTradingAftermath_M, sAftermathOptions[0])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidRespawnNaked,flags,True)
		SetOptionFlags(oidJail,flags,True)
		SetOptionFlags(oidArkayCurse,flags,True)
		SetOptionFlags(oidArkayCurses_M,flags,True)
		SetOptionFlags(oidLoseforever,flags,True)
		SetOptionFlags(oidSoulMarkStay,flags,True)
		SetOptionFlags(oidRespawnTimeSlider,flags,True)
		SetOptionFlags(oidRemovableItems_M,flags)
	ElseIf (option == oidRemovableItems_M)
		iRemovableItems = 0
		SetMenuOptionValue(oidRemovableItems_M, sLoseOptions[0])
		flags = OPTION_FLAG_DISABLED
		SetOptionFlags(oidLoseforever, flags,True)
		SetOptionFlags(oidSoulMarkStay,flags)
	ElseIf (option == oidHistory)
		bIsHistoryEnabled = False
		SetToggleOptionValue(oidHistory,False)
		ForcePageReset()
	ElseIf (option == oidInformation)
		bIsInfoEnabled = False
		SetToggleOptionValue(oidInformation,False)
		ForcePageReset()
	ElseIf (option == oidAutoSwitchRP)
		bAutoSwitchRP = False
		SetToggleOptionValue(oidAutoSwitchRP,False)
	ElseIf (option == oidArkayCurses_M)
		iArkayCurse = 0
		SetMenuOptionValue(oidArkayCurses_M, sArkayCurses[0])
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
	ElseIf (option == oidDragonSoulSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulSlider") 
	ElseIf (option == oidMenuEnabled)
		If bIsMenuEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_Off")
		Endif
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
		Endif
	ElseIf (option == oidDragonSoulPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulPSlider")
	ElseIf (option == oidBSoulGemPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemPSlider")
	ElseIf (option == oidGSoulGemPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemPSlider")
	ElseIf (option == oidMarkPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_MarkPSlider")
	ElseIf (option == oidGoldPSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_GoldPSlider")
	ElseIf (option == oidRecoveryTime)
		SetInfoText("$mrt_MarkofArkay_DESC_RecoveryTime")
	ElseIf (option == oidBleedoutTime)
		SetInfoText("$mrt_MarkofArkay_DESC_BleedoutTime")
	ElseIf (option == oidLootChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_LootChanceSlider")
	ElseIf (option == oidScrollChanceSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_ScrollChanceSlider")
	ElseIf (option == oidRespawnTimeSlider)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnTimeSlider")
	ElseIf (option == oidEffect)
		If bIsEffectEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_Effect_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_Effect_Off")
		Endif
	ElseIf (option == oidRevivalRequireBlessing)
		If bIsRevivalRequiresBlessing
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_Off")
		Endif
	ElseIf (option == oidPotionRevivalEnabled)
		If bIsPotionEnabled
			SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_On")
		Else
			SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_Off")
		Endif
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
	ElseIf (option == oidRespawnPoint7)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint7")
	ElseIf (option == oidRespawnNaked)
		SetInfoText("$mrt_MarkofArkay_DESC_RespawnNaked")
	ElseIf (option == oidJail)
		SetInfoText("$mrt_MarkofArkay_DESC_Jail")
	ElseIf (option == oidArkayCurse)
		SetInfoText("$mrt_MarkofArkay_DESC_ArkayCurse")
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
	ElseIf (option == oidArkayCurses_M)
	    setInfotext("$mrt_MarkofArkay_DESC_ArkayCurses_M")
	Endif
EndEvent

Function moaStart()
	If moaState.GetValue() == 0
		moaState.SetValue(1)
		moaBleedoutHandlerState.SetValue(0)
		moaReviverQuest.Start()
		PlayerRef.GetActorBase().SetEssential(True)
		PlayerRef.SetNoBleedoutRecovery(True)
		moaLootChance.SetValue(100.0 - fLootChanceSlider)
		moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
		ToggleFallDamage(True)
		ToggleFallDamage(False)
		Utility.Wait(2.0)
		Debug.notification("$mrt_MarkofArkay_Notification_Started")
	EndIf
Endfunction

Function moaStop()
	ToggleFallDamage(False)
	If moaState.GetValue() == 1
		If ( ReviveScript.bIsItemsRemoved == True )
			LostItemsMarker.MoveToMyEditorLocation()
			LostItemsMarker.Disable()
			LostItemsChest.RemoveAllItems(PlayerRef, True, True)
			If ReviveScript.fLostSouls > 0.0
				PlayerRef.ModActorValue("DragonSouls", ReviveScript.fLostSouls)
				ReviveScript.fLostSouls = 0.0
			EndIf
			ReviveScript.bIsItemsRemoved = False
		EndIf
		If moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
		CustomMarker.MoveToMyEditorLocation()
		SleepMarker.MoveToMyEditorLocation()
		CustomMarker.Disable()
		SleepMarker.Disable()
		moaState.SetValue(0)
		moaReviverQuest.Stop()
		PlayerRef.GetActorBase().SetEssential(False)
		PlayerRef.SetNoBleedoutRecovery(False)
		moaBleedoutHandlerState.SetValue(0)
		PlayerRef.DispelSpell(RevivalPower)
		PlayerRef.RemoveSpell(SacrificePower)
		PlayerRef.RemoveSpell(RevivalPower)
		PlayerRef.RemoveSpell(ArkayCurse)
		PlayerRef.RemoveSpell(ArkayCurseAlt)
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
		Utility.Wait(2.0)
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
		Endif
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

Event OnConfigInit()
	Pages = new String[2]
	pages[0] = "$Settings"
	pages[1] = "$Debug"
EndEvent

Function setPages()
	Pages = new String[4]
	pages[0] = "$General"
	pages[1] = "$Extra"
	pages[2] = "$Aftermath"
	pages[3] = "$Debug"
EndFunction

Int Function GetVersion()
	Return 27
EndFunction

Event OnVersionUpdate(int a_version)
	; a_version is the new version, CurrentVersion is the old version
	If (a_version >= 2 && CurrentVersion < 2)
		Debug.Trace(self + ": Updating script to version " + 2)
		Pages = new String[3]
		pages[0] = "$General"
		pages[1] = "$Extra"
		pages[2] = "$Debug"
	EndIf
	If (a_version >= 3 && CurrentVersion < 3)
		Debug.Trace(self + ": Updating script to version " + 3)
		setPages()
		sRespawnPoints = New String[8]
		bRespawnPointsFlags = New Bool[7]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$RavenRock"
		sRespawnPoints[7] = "$Random"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
	EndIf
	If (a_version >= 5 && CurrentVersion < 5)
		Debug.Trace(self + ": Updating script to version " + 5)
		setPages()
		sRespawnPoints = New String[9]
		bRespawnPointsFlags = New Bool[8]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Winterhold"
		sRespawnPoints[7] = "$RavenRock"
		sRespawnPoints[8] = "$Random"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
		bRespawnPointsFlags[7] = True
	Endif
	If (a_version >= 7 && CurrentVersion < 7)
		Debug.Trace(self + ": Updating script to version " + 7)
		sRespawnPoints = New String[10]
		bRespawnPointsFlags = New Bool[8]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Winterhold"
		sRespawnPoints[7] = "$RavenRock"
		sRespawnPoints[8] = "$Random"
		sRespawnPoints[9] = "$Custom"
		bRespawnPointsFlags[0] = True
		bRespawnPointsFlags[1] = True
		bRespawnPointsFlags[2] = True
		bRespawnPointsFlags[3] = True
		bRespawnPointsFlags[4] = True
		bRespawnPointsFlags[5] = True
		bRespawnPointsFlags[6] = True
		bRespawnPointsFlags[7] = True
		;If moaState.GetValue() == 1
		;	PlayerRef.AddSpell(MoveCustomMarker)
		;EndIf
	Endif
	If (a_version >= 9 && CurrentVersion < 9)
		Debug.Trace(self + ": Updating script to version " + 9)
		If bIsRagdollEnabled
			moaBleedouAnimation.SetValue(2)
		Else
			moaBleedouAnimation.SetValue(0)
		EndIf
		;If moaState.GetValue() == 1
		;	PlayerRef.AddSpell(RecallMarker)
		;EndIf
		If bLostItemQuest && ( ReviveScript.bIsItemsRemoved || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
			moaRetrieveLostItems.start()
			moaRetrieveLostItems.SetStage(1)
		ElseIf moaRetrieveLostItems.IsRunning()
			moaRetrieveLostItems.SetStage(20)
		EndIf
	EndIf
	If (a_version >= 13 && CurrentVersion < 13)
		Debug.Trace(self + ": Updating script to version "  + 13)
		If moaBleedouAnimation.GetValue() == 4
			bIsRagdollEnabled = False
		EndIf
	EndIf
	If (a_version >= 15 && CurrentVersion < 15)
		Debug.Trace(self + ": Updating script to version "  + 15)
		If iTeleportLocation >= sRespawnPoints.Length
			iTeleportLocation = ( sRespawnPoints.Length - 5 )
		Endif
	EndIf
	If (a_version >= 17 && CurrentVersion < 17)
		Debug.Trace(self + ": Updating script to version "  + 17)
		If iRemovableItems == 3
			iRemovableItems = 5
		ElseIf iRemovableItems == 4
			iRemovableItems = 9
		Endif
	Endif
	If (a_version >= 21 && CurrentVersion < 21)
		Debug.Trace(self + ": Updating script to version "  + 21)
		sRespawnPoints = New String[12]
		sRespawnPoints[0] = "$Whiterun"
		sRespawnPoints[1] = "$Falkreath"
		sRespawnPoints[2] = "$Markarth"
		sRespawnPoints[3] = "$Riften"
		sRespawnPoints[4] = "$Solitude"
		sRespawnPoints[5] = "$Windhelm"
		sRespawnPoints[6] = "$Winterhold"
		sRespawnPoints[7] = "$RavenRock"
		sRespawnPoints[8] = "$Random"
		sRespawnPoints[9] = "$LastSleepLocation"
		sRespawnPoints[10] = "$Custom"
		sRespawnPoints[11] = "$External"
		If iTeleportLocation == 9
			iTeleportLocation = 10
		Elseif iTeleportLocation == 10
			iTeleportLocation = 11
		Endif 
		ReviveScript.RegisterForSleep()
	EndIf
	If (a_version >= 23 && CurrentVersion < 23)
		Debug.Trace(self + ": Updating script to version "  + 23)
	EndIf
	If (a_version >= 25 && CurrentVersion < 25)
		Debug.Trace(self + ": Updating script to version "  + 25)
	EndIf
	If (a_version >= 27 && CurrentVersion < 27)
		Debug.Trace(self + ": Updating script to version "  + 27)
		setArrays()
		DetachMarker2.Enable()
		DetachMarker2.MoveTo(PlayerRef)
	EndIf
EndEvent

Function setRespawnPoints()
	sRespawnPoints = New String[13]
	bRespawnPointsFlags = New Bool[8]
	sRespawnPoints[0] = "$Whiterun"
	sRespawnPoints[1] = "$Falkreath"
	sRespawnPoints[2] = "$Markarth"
	sRespawnPoints[3] = "$Riften"
	sRespawnPoints[4] = "$Solitude"
	sRespawnPoints[5] = "$Windhelm"
	sRespawnPoints[6] = "$Winterhold"
	sRespawnPoints[7] = "$RavenRock"
	sRespawnPoints[8] = "$Random"
	sRespawnPoints[9] = "$LastSleepLocation"
	sRespawnPoints[10] = "$Custom"
	sRespawnPoints[11] = "$External"
	sRespawnPoints[12] = "$Nearby"
	bRespawnPointsFlags[0] = True
	bRespawnPointsFlags[1] = True
	bRespawnPointsFlags[2] = True
	bRespawnPointsFlags[3] = True
	bRespawnPointsFlags[4] = True
	bRespawnPointsFlags[5] = True
	bRespawnPointsFlags[6] = True
	bRespawnPointsFlags[7] = True
EndFunction

Function setArrays()
	setPages()
	setRespawnPoints()
	sLoseOptions = New String[12]
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
	sAftermathOptions = New String[3]
	sAftermathOptions[0] = "$mrt_MarkofArkay_AftermathOptions_0"
	sAftermathOptions[1] = "$mrt_MarkofArkay_AftermathOptions_1"
	sAftermathOptions[2] = "$mrt_MarkofArkay_AftermathOptions_2"
	sArkayCurses = New String[3]
	sArkayCurses[0]="$mrt_MarkofArkay_ArkayCurses_0"
	sArkayCurses[1]="$mrt_MarkofArkay_ArkayCurses_1"
	sArkayCurses[2]="$mrt_MarkofArkay_ArkayCurses_2"
EndFunction


Int Function iGetRespawnPointsCount()
	int iIndex = 0
	Int iCount = 0
	while( iIndex < ( sRespawnPoints.Length - 5 ))
		If bRespawnPointsFlags[iIndex]
			iCount += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iCount
EndFunction
 