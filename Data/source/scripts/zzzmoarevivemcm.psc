Scriptname zzzmoaReviveMCM extends SKI_ConfigBase

import FISSFactory
import Game
import StringUtil
import zzzmoautilscript

Spell property ArkayBlessing auto
Spell property ArkayCurse auto
Spell property ArkayCurseAlt auto
Spell property ArkayCurseTemp auto
Spell property ArkayCurseTempAlt auto
Objectreference property CellLoadMarker auto
Objectreference property CellLoadMarker2 auto
FormList property CustomRespawnPoints auto
ObjectReference property DetachMarker1 auto
ObjectReference property DetachMarker2 auto
ObjectReference property DetachMarker3 auto
Formlist property ExternalMarkerList auto
Spell property GhostVisual auto
ObjectReference property LocationMarker auto
Objectreference property LocationMarker2 auto
ObjectReference property LostItemsChest auto
ObjectReference property LostItemsMarker auto
FormList property MarkerList auto
Formlist property MergedExternalMarkerList auto
Message property ModVersionError auto
Spell property MoveCustomMarker auto
Actor property PlayerRef auto
Spell property RecallMarker auto
Spell property RevivalPower auto
zzzmoaReviverScript property ReviveScript auto
Spell property SacrificePower auto
ObjectReference property SleepMarker auto
ObjectReference property ThiefMarker auto
Bool property bARCCOK auto Hidden ;ARCC
Bool property bAltEyeFix=False auto Hidden
Bool property bAlwaysSpawn=False auto Hidden
Bool property bArkayCurse=False auto Hidden
Bool property bAutoDrinkPotion=False auto Hidden
Bool property bAutoSwitchRP=False auto Hidden
Bool property bBossChestNotInClearedLoc=True auto Hidden
Bool property bBossChestOnlyCurLoc=False auto Hidden
Bool property bCanbeKilledbyUnarmed=True auto Hidden
Bool property bCheckKeyword=True auto Hidden
Bool property bCheckWeight=True auto Hidden
Bool property bClone=True auto Hidden
Bool property bCorpseAsSoulMark=False auto Hidden
Bool property bCreaturesCanSteal=False auto Hidden
Bool property bCureDisIfHasBlessing=False auto Hidden
Bool property bCurseLock=False auto Hidden
Bool property bDLIEOK auto Hidden ;Level Up Event Plugin
Bool property bDeathEffect=True auto Hidden
Bool property bDisableUnsafe=True auto Hidden
Bool property bDiseaseCurse=False auto Hidden
Bool property bDoNotStopCombat=False auto Hidden
Bool property bDoNotStopCombatAfterRevival=True auto Hidden
Bool property bExcludeQuestItems=True auto Hidden
Bool property bFISSOK auto Hidden ;FISS
Bool property bFadeToBlack=True auto Hidden
Bool property bFollowerProtectPlayer=False auto Hidden
Bool property bGhostCurse=False auto Hidden
Bool property bHealActors=False auto Hidden
Bool property bInvisibility=False auto Hidden
Bool property bIsArkayCurseTemporary=False auto Hidden
Bool property bIsBSoulGemEnabled=True auto Hidden
Bool property bIsDragonSoulEnabled=True auto Hidden
Bool property bIsEffectEnabled=False auto Hidden
Bool property bIsFlowerGirlsActive=False auto Hidden
Bool property bIsGSoulGemEnabled=True auto Hidden
Bool property bIsGoldEnabled=True auto Hidden
Bool property bIsHistoryEnabled=False auto Hidden
Bool property bIsInfoEnabled=True auto Hidden
Bool property bIsLoggingEnabled=False auto Hidden
Bool property bIsMarkEnabled=True auto Hidden
Bool property bIsMenuEnabled=True auto Hidden
Bool property bIsNoFallDamageEnabled=False auto Hidden
Bool property bIsNotificationEnabled=False auto Hidden
Bool property bIsOStimActive=False auto Hidden
Bool property bIsPotionEnabled=False auto Hidden
Bool property bIsQuitToMainMenuEnabled=False auto Hidden
Bool property bIsRagdollEnabled=False auto Hidden
Bool property bIsRecallRestricted=True auto Hidden
Bool property bIsRevivalEnabled=True auto Hidden
Bool property bIsRevivalRequiresBlessing=False auto Hidden
Bool property bIsSexlabActive=False auto Hidden
Bool property bIsTradeEnabled=True auto Hidden
Bool property bIsUpdating=False auto Hidden
Bool property bKillIfCantRespawn=False auto Hidden
Bool property bLevelReduce=False auto Hidden
Bool property bLiteGhostCurse auto Hidden
Bool property bLocBlackListJsonChecked=False auto Hidden
Bool property bLockPermaDeath=False auto Hidden
Bool property bLootChanceLock=False auto Hidden
Bool property bLoseAmmo=False auto Hidden
Bool property bLoseArkayMark=False auto Hidden
Bool property bLoseArkayMarkAll=False auto Hidden
Bool property bLoseArmor=True auto Hidden
Bool property bLoseBlackSoulGem=False auto Hidden
Bool property bLoseBlackSoulGemAll=False auto Hidden
Bool property bLoseBook=False auto Hidden
Bool property bLoseDragonSoul=False auto Hidden
Bool property bLoseDragonSoulAll=False auto Hidden
Bool property bLoseForever=False auto Hidden
Bool property bLoseGold=True auto Hidden
Bool property bLoseGoldAll=False auto Hidden
Bool property bLoseGrandSoulGem=False auto Hidden
Bool property bLoseGrandSoulGemAll=False auto Hidden
Bool property bLoseIngredient=False auto Hidden
Bool property bLoseItem=False auto Hidden
Bool property bLoseKey=False auto Hidden
Bool property bLoseMisc=False auto Hidden
Bool property bLoseOthers=False auto Hidden
Bool property bLosePotion=False auto Hidden
Bool property bLoseScroll=False auto Hidden
Bool property bLoseSkillForever=False auto Hidden
Bool property bLoseSoulgem=False auto Hidden
Bool property bLoseWeapon=True auto Hidden
Bool property bLostItemQuest=True auto Hidden
Bool property bMarkRecallCostLock=False auto Hidden
Bool property bMoralityMatters=True auto Hidden
Bool property bMoreRandomRespawn=False auto Hidden
Bool property bMultipleDis=True auto Hidden
Bool property bMultipleDisProg=True auto Hidden
Bool property bNPCHasLevelRange=False auto Hidden
Bool property bOnlyEnslavedByEnemyFaction=False auto Hidden
Bool property bOnlyHostilesRape=True auto Hidden
Bool property bOnlyInfectIfHasBaseDis=False auto Hidden
Bool property bOnlyLoseSkillXP=False auto Hidden
Bool property bOnlySpawn=False auto Hidden
Bool property bPO3OK auto Hidden ;PO3 Extender
Bool property bPUOK auto Hidden ;papyrusutil
Bool property bPlayerProtectFollower=False auto Hidden
Bool property bRandomItemCurse=False auto Hidden
Bool property bRecallByArkayMark=False auto Hidden ;
Bool property bRespawnCounter=False auto Hidden
Bool property bRespawnMenu=False auto Hidden
Bool property bRespawnNaked=False auto Hidden
Bool[] property bRespawnPointsFlags auto Hidden
Bool property bResurrectActors=False auto Hidden
Bool property bRetrySpawnWithoutLocation=True auto Hidden
Bool property bSKSELoaded auto Hidden
Bool property bSKSEOK auto Hidden
Bool property bSaveLock=False auto Hidden
Bool property bSendToJail=False auto Hidden
Bool property bShiftBack=False auto Hidden
Bool property bShiftBackRespawn=False auto Hidden
Bool property bShowBleedoutTimeWarning=True auto Hidden
Bool property bShowRaceMenu=False auto Hidden
Bool property bShowRagdollWarning=True auto Hidden
Bool property bShowTimeScaleWarning=True auto Hidden
Bool property bSkillReduceRandomVal=False auto Hidden
Bool property bSlaveryOnlyAfterRape=False auto Hidden
Bool property bSoulMarkCureDiseases=False auto Hidden
Bool property bSoulMarkStay=False auto Hidden
Bool property bSpawnBringAllies=True auto Hidden
Bool property bSpawnByLocation=True auto Hidden
Bool property bSpawnCheckRelation=True auto Hidden
Bool property bSpawnHostile=False auto Hidden
Bool property bTeleportMenu=True auto Hidden
Bool property bTradeLock=False auto Hidden
Bool property bTriggerOnBleedout=True auto Hidden
Bool property bTriggerOnHealthPerc=False auto Hidden
Bool property bUIEOK auto Hidden ;uiextensions
Bool property bVoicelessCurse=False auto Hidden
Float property fBSoulgemPSlider=1.0 auto Hidden
Float property fBleedoutTimeSlider=6.0 auto Hidden
Float property fBossChestChanceSlider=0.0 auto Hidden
Float property fDisChanceSlider=25.0 auto Hidden
Float property fDisPriceMultSlider=0.5 auto Hidden
Float property fDisPriceSlider=100.0 auto Hidden
Float property fDisProgChanceSlider=50.0 auto Hidden
Float property fDragonSoulPSlider=3.0 auto Hidden
Float property fGSoulgemPSlider=2.0 auto Hidden
Float property fGoldPSlider=4.0 auto Hidden
Float property fHealthPercTrigger=0.00 auto Hidden
Float property fHigherNPCMaxLvlDiff=10.0 auto Hidden
Float property fJumpFallHeightMinDefault=600.00 auto Hidden
Float property fLootChanceSlider=50.0 auto Hidden
Float property fLoseOtherMinValueSlider=0.0 auto Hidden
Float property fLoseOtherTotalValueSlider=0.0 auto Hidden
Float property fLowerNPCMaxLvlDiff=10.0 auto Hidden
Float property fMarkCastSlider=0.0 auto Hidden
Float property fMarkPSlider=5.0 auto Hidden
Float property fMaxItemsToCheckSlider=100.0 auto Hidden
Float property fMaxLoseArkayMarkSlider=1.0 auto Hidden
Float property fMaxLoseBlackSoulGemSlider=1.0 auto Hidden
Float property fMaxLoseDragonSoulSlider=1.0 auto Hidden
Float property fMaxLoseGoldSlider=250.0 auto Hidden
Float property fMaxLoseGrandSoulGemSlider=1.0 auto Hidden
Float property fMaxRapes=1.0 auto Hidden
Float property fMaxRapists=1.0 auto Hidden
Float property fMinLoseArkayMarkSlider=0.0 auto Hidden
Float property fMinLoseBlackSoulGemSlider=0.0 auto Hidden
Float property fMinLoseDragonSoulSlider=0.0 auto Hidden
Float property fMinLoseGoldSlider=50.0 auto Hidden
Float property fMinLoseGrandSoulGemSlider=0.0 auto Hidden
Float property fRPMinDistanceSlider=500.0 auto Hidden
Float property fRapeChanceSlider=0.0 auto Hidden
Float property fRecallCastSlider=0.0 auto Hidden
Float property fRecoveryTimeSlider=1.0 auto Hidden
Float property fRespawnCounterSlider=0.0 auto Hidden
Float property fRespawnTimeSlider=0.0 auto Hidden
Float property fScrollChanceSlider=25.0 auto Hidden
Float property fSimpleSlaveryChanceSlider=0.0 auto Hidden
Float property fSkillReduceMaxValSlider=1.0 auto Hidden
Float property fSkillReduceMinValSlider=0.0 auto Hidden
Float property fSkillReduceValSlider=10.0 auto Hidden
Float property fTotalCustomRPSlotSlider=1.0 auto Hidden
Float property fValueBSoulGemScaleSlider=0.0 auto Hidden
Float property fValueBSoulGemSlider=1.0 auto Hidden
Float property fValueGSoulGemScaleSlider=0.0 auto Hidden
Float property fValueGSoulGemSlider=1.0 auto Hidden
Float property fValueGoldScaleSlider=0.0 auto Hidden
Float property fValueGoldSlider=1000.0 auto Hidden
Float property fValueMarkScaleSlider=0.0 auto Hidden
Float property fValueMarkSlider=1.0 auto Hidden
Float property fValueSnoozeSlider=0.0 auto Hidden
Float property fValueSoulScaleSlider=0.0 auto Hidden
Float property fValueSoulSlider=1.0 auto Hidden
Int property iArkayCurse=0 auto Hidden
Int property iDestroyedItems=0 auto Hidden
Int property iExternalIndex=-1 auto Hidden
Int property iGhostShader=0 auto Hidden
Int property iHostileOption=0 auto Hidden
Int property iLoadPreset=0 auto Hidden
Int property iLoseInclusion=0 auto Hidden
Int property iNameTagBackup auto Hidden
Int property iNotTradingAftermath=1 auto Hidden
Int property iRapistGender=0 auto Hidden
Int property iReducedSkill=0 auto Hidden
Int property iRevivesByFollower=0 auto Hidden
Int property iRevivesByPotion=0 auto Hidden
Int property iRevivesByRevivalSpell=0 auto Hidden
Int property iRevivesBySacrificeSpell=0 auto Hidden
Int property iRevivesByTrade=0 auto Hidden
Int property iSaveOption=1 auto Hidden
Int property iSavePreset=0 auto Hidden
Int property iSelectedCustomRPSlot=0 auto Hidden
Int property iSexInterface=0 auto Hidden
Int property iSpawn=0 auto Hidden
Int[] property iSpawnCounts auto Hidden
Int property iSpawnMaxLevel=4 auto Hidden
Int property iSpawnMinLevel=4 auto Hidden
Int[] property iSpawnWeights auto Hidden
Int property iTavernIndex=0 auto Hidden
Int property iTeleportLocation=14 auto Hidden
Int property iTotalBleedOut=0 auto Hidden
Int property iTotalRespawn=0 auto Hidden
Int property iTotalRevives=0 auto Hidden
Int[] property iValidTypes auto Hidden
GlobalVariable property moaBleedouAnimation auto
GlobalVariable property moaBleedoutHandlerState auto
GlobalVariable property moaBossChestNotInclearedLoc auto
GlobalVariable property moaCheckingMarkers auto
GlobalVariable property moaCreaturesCanSteal auto
GlobalVariable property moaCureDisIfHasBlessing auto
GlobalVariable property moaERPCount auto
Quest property moaFollowerDetector auto
GlobalVariable property moaGhostShader auto
Quest property moaGuardDetector auto
Quest property moaHealthMonitor auto
GlobalVariable property moaHigherNPCMaxLvlDiff auto
Quest property moaHostileNPCDetector auto
Quest property moaHostileNPCDetector01 auto
GlobalVariable property moaIsBusy auto
GlobalVariable property moaLootChance auto
Message property moaLostItemMenu auto
GlobalVariable property moaLowerNPCMaxLvlDiff auto
GlobalVariable property moaMoralityMatters auto
GlobalVariable property moaNPCHasLevelRange auto
GlobalVariable property moaNoKillMoveOnPlayer auto
GlobalVariable property moaOnlyInCurLocChest auto
GlobalVariable property moaPraytoSave auto
GlobalVariable property moaRPMinDistance auto
Quest property moaRetrieveLostItems auto
Quest property moaRetrieveLostItems01 auto
Quest property moaReviverQuest auto
GlobalVariable property moaScrollChance auto
GlobalVariable property moaSnoozeState auto
GlobalVariable property moaState auto
GlobalVariable property moaUIExtensionStatus auto
String[] property sCustomRPs auto Hidden
String[] property sExtraRPs auto Hidden
String property sResetHistory="" auto Hidden
String[] property sRespawnPoints auto Hidden
String[] property sTaverns auto Hidden

Int flags
Int oidAltEyeFix
Int oidAlwaysSpawn
Int oidArkayCurse
Int oidArkayCurses_M
Int oidAutoDrinkPotion
Int oidAutoSwitchRP
Int oidBSoulGemPSlider
Int oidBSoulGemRevivalEnabled
Int oidBSoulGemSlider
Int oidBSoulScaleGemSlider
int oidBleedoutTime
Int oidBossChestChanceSlider
Int oidBossChestNotClearedLoc
Int oidBossChestOnlyCurLoc
Int oidCanbeKilledbyUnarmed
Int oidCheckKeyword
Int oidCheckWeight
Int oidCorpseAsSoulMark
Int oidCreaturesCanSteal
Int oidCureDisIfHasBlessing
Int oidCurseLock
Int oidDeathEffect
Int oidDisChanceSlider
Int oidDisPriceMultSlider
Int oidDisPriceSlider
Int oidDisProgChanceSlider
Int oidDisableUnsafe
Int oidDiseaseCurse
Int oidDoNotStopCombat
Int oidDoNotStopCombatAfterRevival
int oidDragonScaleSoulSlider
Int oidDragonSoulPSlider
Int oidDragonSoulRevivalEnabled
Int oidDragonSoulSlider
Int oidEffect
Int oidEnableSave_M
Int oidEquipInclude_M
Int oidExcludeQuestItems
Int oidExternalTeleportLocation
Int oidExtraTeleportLocation_M
Int oidFadeToBlack
Int oidFollowerProtectPlayer
Int oidGSoulGemPSlider
Int oidGSoulGemRevivalEnabled
Int oidGSoulGemSlider
Int oidGSoulScaleGemSlider
Int oidGhostCurse
Int oidGhostShader
Int oidGoldPSlider
Int oidGoldRevivalEnabled
Int oidGoldScaleSlider
Int oidGoldSlider
Int oidHealActors
Int oidHealthTriggerSlider
Int oidHigherNPCMaxLvlDiff
Int oidHistory
Int oidHostileOptions_M
Int oidInformation
Int oidInvisibility
Int oidJail
Int oidKillIfCantRespawn
Int oidLevelReduce
Int oidLiteGhostCurse
Int oidLoadDefaultPreset
Int oidLoadPreset1
Int oidLoadPreset2
Int oidLoadPreset3
Int oidLoadPreset4
Int oidLoadPreset_M
Int oidLockPermaDeath
Int oidLogging
Int oidLootChanceLock
int oidLootChanceSlider
Int oidLoseAmmo
Int oidLoseArkayMark
Int oidLoseArkayMarkAll
Int oidLoseArmor
Int oidLoseBlackSoulGem
Int oidLoseBlackSoulGemAll
Int oidLoseBook
Int oidLoseDragonSoul
Int oidLoseDragonSoulAll
Int oidLoseGold
Int oidLoseGoldAll
Int oidLoseGrandSoulGem
Int oidLoseGrandSoulGemAll
Int oidLoseIngredient
Int oidLoseItem
Int oidLoseKey
Int oidLoseMisc
Int oidLoseOtherMinValueSlider
Int oidLoseOtherTotalValueSlider
Int oidLoseOthers
Int oidLosePotion
Int oidLoseScroll
Int oidLoseSkillForever
Int oidLoseSoulgem
Int oidLoseWeapon
Int oidLoseforever
Int oidLostItemQuest
Int oidLostItemsInfo
Int oidLostSkillsInfo
Int oidLowerNPCMaxLvlDiff
int oidMarkCost
Int oidMarkOfArkayRevivalEnabled
Int oidMarkPSlider
Int oidMarkRecallCostLock
Int oidMarkScaleSlider
Int oidMarkSlider
Int oidMaxItemsToCheckSlider
Int oidMaxLoseArkayMarkSlider
Int oidMaxLoseBlackSoulGemSlider
Int oidMaxLoseDragonSoulSlider
Int oidMaxLoseGoldSlider
Int oidMaxLoseGrandSoulGemSlider
Int oidMenuEnabled
Int oidMinLoseArkayMarkSlider
Int oidMinLoseBlackSoulGemSlider
Int oidMinLoseDragonSoulSlider
Int oidMinLoseGoldSlider
Int oidMinLoseGrandSoulGemSlider
Int oidMoralityMatters
Int oidMoreRandomRespawn
Int oidMultipleDis
Int oidMultipleDisProg
Int oidNPCHasLevelRange
Int oidNoFallDamageEnabled
Int oidNoTradingAftermath_M
Int oidNotification
Int oidOnlyEnslavedByEnemyFaction
Int oidOnlyHostilesRape
Int oidOnlyInfectIfHasBaseDis
Int oidOnlyLoseSkillXP
Int oidOnlySpawn
Int oidPlayerProtectFollower
Int oidPotionRevivalEnabled
Int oidQuitToMainMenu
Int oidRPMinDistanceSlider
Int oidRagdollEffect
Int oidRandomItemCurse
Int oidRapeChanceSlider
Int oidRapesMaxSlider
Int oidRapistGender_M
Int oidRapistsMaxSlider
Int oidRecallByArkayMark
int oidRecallCost
Int oidRecallRestriction
Int oidRecoveryTime
Int oidReset
Int oidResetHistory
Int oidResetPlayer
Int oidRespawnBlackListLocation
Int oidRespawnCounter
Int oidRespawnMenu
Int oidRespawnNaked
Int oidRespawnPoint0
Int oidRespawnPoint1
Int oidRespawnPoint2
Int oidRespawnPoint3
Int oidRespawnPoint4
Int oidRespawnPoint5
Int oidRespawnPoint6
Int oidRespawnPoint7
Int oidRespawnPoint8
Int oidRespawnPoint9
Int oidRespawnTimeSlider
Int oidRestoreItems
Int oidResurrectActors
Int oidRetrySpawnWithoutLocation
Int oidRevivalEnabled
Int oidRevivalRequireBlessing
Int oidSaveLock
Int oidSavePreset1
Int oidSavePreset2
Int oidSavePreset3
Int oidSavePreset4
Int oidSavePreset_M
int oidScrollChanceSlider
Int oidSelectedCustomRPSlot_M
Int oidSexInterface_M
Int oidShiftBack
Int oidShiftBackRespawn
Int oidShowRaceMenu
Int oidSimpleSlaveryChanceSlider
Int oidSkillReduceMaxValSlider
Int oidSkillReduceMinValSlider
Int oidSkillReduceRandomVal
Int oidSkillReduceValSlider
Int oidSkillReduce_M
Int oidSlaveryOnlyAfterRape
Int oidSnoozeSlider
Int oidSoulMarkCureDiseases
Int oidSoulMarkStay
Int oidSpawnBringAllies
Int oidSpawnByLocation
Int oidSpawnCheckRelation
Int oidSpawnCountSlider
Int oidSpawnHostile
Int oidSpawnMaxLevel_M
Int oidSpawnMinLevel_M
Int oidSpawnWeightSlider
Int oidSpawns_M
Int oidStatus
Int oidTavern_M
Int oidTeleportLocation_M
Int oidTeleportMenu
Int oidTempArkayCurse
Int oidTogglePowers
Int oidToggleSpells
Int oidTotalCustomRPSlotSlider
Int oidTradeEnabled
Int oidTradeLock
Int oidTriggerOnBleedout
Int oidTriggerOnHealthPerc
Int oidVoicelessCurse

event OnConfigInit()
  Utility.Wait(0.1)
  if moaIsBusy.GetValue()
    return
  endif
  moaIsBusy.SetValueInt(1)
  init()
endevent

event OnConfigRegister()
  RegisterForSingleUpdate(3.0)
endevent

event OnGameReload()
  Parent.OnGameReload()
  OnVersionUpdate(GetVersion())
endevent

event OnOptionDefault(Int option)
  string page = CurrentPage
  if (option == oidRevivalEnabled)
    bIsRevivalEnabled = True
    _SetToggleOptionValue(oidRevivalEnabled, bIsRevivalEnabled)
    ForcePageReset()
  elseif (option == oidMarkOfArkayRevivalEnabled)
    bIsMarkEnabled = True
  elseif (option == oidMenuEnabled)
    bIsMenuEnabled = True
    _SetToggleOptionValue(oidMenuEnabled, bIsMenuEnabled)
    flags = OPTION_FLAG_DISABLED
    _SetOptionFlags(oidMarkPSlider, flags, True)
    _SetOptionFlags(oidDragonSoulPSlider, flags, True)
    _SetOptionFlags(oidBSoulGemPSlider, flags, True)
    _SetOptionFlags(oidGSoulGemPSlider, flags, True)
    _SetOptionFlags(oidGoldPSlider, flags)
  elseif (option == oidBSoulGemRevivalEnabled)
    bIsBSoulGemEnabled = True
    _SetToggleOptionValue(oidBSoulGemRevivalEnabled, bIsBSoulGemEnabled)
  elseif (option == oidGSoulGemRevivalEnabled)
    bIsGSoulGemEnabled = True
    _SetToggleOptionValue(oidGSoulGemRevivalEnabled, bIsGSoulGemEnabled)
  elseif (option == oidTradeEnabled)
    bIsTradeEnabled = True
    _SetToggleOptionValue(oidTradeEnabled, bIsTradeEnabled)
  elseif (option == oidGoldRevivalEnabled)
    bIsGoldEnabled = True
    _SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
  elseif (option == oidFollowerProtectPlayer)
    bFollowerProtectPlayer = False
    _SetToggleOptionValue(oidFollowerProtectPlayer, bFollowerProtectPlayer)
  elseif (option == oidPlayerProtectFollower)
    bPlayerProtectFollower = False
    _SetToggleOptionValue(oidPlayerProtectFollower, bPlayerProtectFollower)
  elseif (option == oidRetrySpawnWithoutLocation)
    bRetrySpawnWithoutLocation = True
    _SetToggleOptionValue(oidRetrySpawnWithoutLocation, bRetrySpawnWithoutLocation)
  elseif (option == oidSpawnByLocation)
    bSpawnByLocation = True
    _SetToggleOptionValue(oidSpawnByLocation, bSpawnByLocation)
    ForcePageReset()
  elseif (option == oidSpawnCheckRelation)
    bSpawnCheckRelation = True
    _SetToggleOptionValue(oidSpawnCheckRelation, bSpawnCheckRelation)
  elseif (option == oidSpawnBringAllies)
    bSpawnBringAllies = True
    _SetToggleOptionValue(oidSpawnBringAllies, bSpawnBringAllies)
  elseif (option == oidNoFallDamageEnabled)
    ToggleFallDamage(False)
    _SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
  elseif (option == oidNotification)
    bIsNotificationEnabled = False
    _SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
  elseif (option == oidRespawnTimeSlider)
    fRespawnTimeSlider = 0.0
    _SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2")
  elseif (option == oidSpawnCountSlider)
    iSpawnCounts[iSpawn] = 1
    _SetSliderOptionValue(oidSpawnCountSlider, iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2")
  elseif (option == oidSpawnWeightSlider)
    iSpawnWeights[iSpawn] = 50
    _SetSliderOptionValue(oidSpawnWeightSlider, iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2")
  elseif (option == oidFadeToBlack)
    bFadeToBlack = True
    _SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
  elseif (option == oidRagdollEffect)
    bIsRagdollEnabled = False
    _SetToggleOptionValue(oidRagdollEffect, bIsRagdollEnabled)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (bFadeToBlack || bInvisibility)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
  elseif (option == oidDisableUnsafe)
    bDisableUnsafe = True
    fRespawnTimeSlider = 0.0
    _SetToggleOptionValue(oidDisableUnsafe, bDisableUnsafe)
    ForcePageReset()
  elseif (option == oidInvisibility)
    bInvisibility = False
    _SetToggleOptionValue(oidInvisibility, bInvisibility)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bIsRagdollEnabled && bFadeToBlack
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
    if !ReviveScript.moaPlayerGhostQuest.IsRunning()
      PlayerRef.SetAlpha(1.0)
    endif
  elseif (option == oidDeathEffect)
    bDeathEffect = True
    _SetToggleOptionValue(oidDeathEffect, bDeathEffect)
  elseif (option == oidAltEyeFix)
    bAltEyeFix = False
    _SetToggleOptionValue(oidAltEyeFix, bAltEyeFix)
  elseif (option == oidLogging)
    bIsLoggingEnabled = False
    _SetToggleOptionValue(oidLogging, bIsLoggingEnabled)
  elseif (option == oidSkillReduceValSlider)
    fSkillReduceValSlider = 10.0
    _SetSliderOptionValue(oidSkillReduceValSlider, fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2")
  elseif (option == oidPotionRevivalEnabled)
    bIsPotionEnabled = False
    _SetToggleOptionValue(oidPotionRevivalEnabled, bIsPotionEnabled)
  elseif (option == oidAutoDrinkPotion)
    bAutoDrinkPotion = False
    _SetToggleOptionValue(oidAutoDrinkPotion, bAutoDrinkPotion)
  elseif (option == oidDragonSoulSlider)
    fValueSoulSlider = 1.0
    _SetSliderOptionValue(oidDragonSoulSlider, fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2")
  elseif (option == oidMarkSlider)
    fValueMarkSlider = 1.0
    _SetSliderOptionValue(oidMarkSlider, fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidBSoulGemSlider)
    fValueBSoulGemSlider = 1.0
    _SetSliderOptionValue(oidBSoulGemSlider, fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2")
  elseif (option == oidGSoulGemSlider)
    fValueGSoulGemSlider = 1.0
    _SetSliderOptionValue(oidBSoulGemSlider, fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2")
  elseif (option == oidGoldSlider)
    fValueGoldSlider = 1000.0
    _SetSliderOptionValue(oidGoldSlider, fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2")
  elseif (option == oidGoldPSlider)
    fGoldPSlider = 4.0
    _SetSliderOptionValue(oidGoldPSlider, fGoldPSlider, "{0}")
  elseif (option == oidDragonSoulPSlider)
    fDragonSoulPSlider = 3.0
    _SetSliderOptionValue(oidDragonSoulPSlider, fDragonSoulPSlider, "{0}")
  elseif (option == oidBSoulGemPSlider)
    fBSoulgemPSlider = 1.0
    _SetSliderOptionValue(oidBSoulGemPSlider, fBSoulgemPSlider, "{0}")
  elseif (option == oidGSoulGemPSlider)
    fGSoulgemPSlider = 2.0
    _SetSliderOptionValue(oidGSoulGemPSlider, fGSoulgemPSlider, "{0}")
  elseif (option == oidMarkPSlider)
    fMarkPSlider = 5.0
    _SetSliderOptionValue(oidMarkPSlider, fMarkPSlider, "{0}")
  elseif (option == oidSnoozeSlider)
    fValueSnoozeSlider = 0.0
    moaSnoozeState.SetValue(0.0)
    _SetSliderOptionValue(oidSnoozeSlider, fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
  elseif (option == oidRecoveryTime)
    fRecoveryTimeSlider = 1.0
    _SetSliderOptionValue(oidRecoveryTime, fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
  elseif (option == oidRPMinDistanceSlider)
    fRPMinDistanceSlider = 500.0
    moaRPMinDistance.SetValue(fRPMinDistanceSlider)
    _SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
  elseif (option == oidDisChanceSlider)
    fDisChanceSlider = 25.0
    _SetSliderOptionValue(oidDisChanceSlider, fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2")
  elseif (option == oidDisProgChanceSlider)
    fDisProgChanceSlider = 50.0
    _SetSliderOptionValue(oidDisProgChanceSlider, fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2")
  elseif (option == oidDisPriceSlider)
    fDisPriceSlider = 100.0
    recalcCursedDisCureCosts()
    _SetSliderOptionValue(oidDisPriceSlider, fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2")
  elseif (option == oidDisPriceMultSlider)
    fDisPriceMultSlider = 0.5
    recalcCursedDisCureCosts()
    _SetSliderOptionValue(oidDisPriceMultSlider, fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2")
  elseif (option == oidMarkScaleSlider)
    fValueMarkScaleSlider = 0.0
    _SetSliderOptionValue(oidMarkScaleSlider, fValueMarkScaleSlider, "$mrt_MarkofArkay_MarkScaleSlider_2")
  elseif (option == oidGSoulScaleGemSlider)
    fValueGSoulGemScaleSlider = 0.0
    _SetSliderOptionValue(oidGSoulScaleGemSlider, fValueGSoulGemScaleSlider, "$mrt_MarkofArkay_GSoulGemScaleSlider_2")
  elseif (option == oidBSoulScaleGemSlider)
    fValueBSoulGemScaleSlider = 0.0
    _SetSliderOptionValue(oidBSoulScaleGemSlider, fValueBSoulGemScaleSlider, "$mrt_MarkofArkay_BSoulGemScaleSlider_2")
  elseif (option == oidDragonScaleSoulSlider)
    fValueSoulScaleSlider = 0.0
    _SetSliderOptionValue(oidDragonScaleSoulSlider, fValueSoulScaleSlider, "$mrt_MarkofArkay_DragonSoulScaleSlider_2")
  elseif (option == oidGoldScaleSlider)
    fValueGoldScaleSlider = 0.0
    _SetSliderOptionValue(oidGoldScaleSlider, fValueGoldScaleSlider, "$mrt_MarkofArkay_GoldScaleSlider_2")
  elseif (option == oidBleedoutTime)
    fBleedoutTimeSlider = 6.0
    _SetSliderOptionValue(oidBleedoutTime, fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
  elseif (option == oidRecallCost)
    fRecallCastSlider = 0.0
    _SetSliderOptionValue(oidRecallCost, fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidMarkCost)
    fMarkCastSlider = 0.0
    _SetSliderOptionValue(oidMarkCost, fMarkCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidLootChanceSlider)
    fLootChanceSlider = 50.0
    _SetSliderOptionValue(oidLootChanceSlider, fLootChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
    moaLootChance.SetValue(100.0 - fLootChanceSlider)
  elseif (option == oidScrollChanceSlider)
    fScrollChanceSlider = 25.0
    _SetSliderOptionValue(oidScrollChanceSlider, fScrollChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
    moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
  elseif (option == oidEffect)
    bIsEffectEnabled = False
    _SetToggleOptionValue(oidEffect, bIsEffectEnabled)
  elseif (option == oidRespawnPoint0)
    bRespawnPointsFlags[0] = True
    _SetToggleOptionValue(oidRespawnPoint0, bRespawnPointsFlags[0])
  elseif (option == oidRespawnPoint1)
    bRespawnPointsFlags[1] = True
    _SetToggleOptionValue(oidRespawnPoint1, bRespawnPointsFlags[1])
  elseif (option == oidRespawnPoint2)
    bRespawnPointsFlags[2] = True
    _SetToggleOptionValue(oidRespawnPoint2, bRespawnPointsFlags[2])
  elseif (option == oidRespawnPoint3)
    bRespawnPointsFlags[3] = True
    _SetToggleOptionValue(oidRespawnPoint3, bRespawnPointsFlags[3])
  elseif (option == oidRespawnPoint4)
    bRespawnPointsFlags[4] = True
    _SetToggleOptionValue(oidRespawnPoint4, bRespawnPointsFlags[4])
  elseif (option == oidRespawnPoint5)
    bRespawnPointsFlags[5] = True
    _SetToggleOptionValue(oidRespawnPoint5, bRespawnPointsFlags[5])
  elseif (option == oidRespawnPoint6)
    bRespawnPointsFlags[6] = True
    _SetToggleOptionValue(oidRespawnPoint6, bRespawnPointsFlags[6])
  elseif (option == oidRespawnPoint7)
    bRespawnPointsFlags[7] = False
    _SetToggleOptionValue(oidRespawnPoint7, bRespawnPointsFlags[7])
  elseif (option == oidRespawnPoint8)
    bRespawnPointsFlags[8] = True
    _SetToggleOptionValue(oidRespawnPoint8, bRespawnPointsFlags[8])
  elseif (option == oidRespawnPoint9)
    bRespawnPointsFlags[9] = True
    _SetToggleOptionValue(oidRespawnPoint9, bRespawnPointsFlags[9])
  elseif (option == oidRevivalRequireBlessing)
    bIsRevivalRequiresBlessing = False
    _SetToggleOptionValue(oidRevivalRequireBlessing, bIsRevivalRequiresBlessing)
  elseif (option == oidRecallRestriction)
    bIsRecallRestricted = True
    _SetToggleOptionValue(oidRecallRestriction, bIsRecallRestricted)
  elseif (option == oidShiftBack)
    bShiftBack = False
    _SetToggleOptionValue(oidShiftBack, bShiftBack)
  elseif (option == oidShiftBackRespawn)
    bShiftBackRespawn = False
    _SetToggleOptionValue(oidShiftBackRespawn, bShiftBackRespawn)
  elseif (option == oidRespawnNaked)
    bRespawnNaked = False
    _SetToggleOptionValue(oidRespawnNaked, bRespawnNaked)
  elseif (option == oidCorpseAsSoulMark)
    bCorpseAsSoulMark = False
    _SetToggleOptionValue(oidCorpseAsSoulMark, bCorpseAsSoulMark)
  elseif (option == oidRespawnMenu)
    bRespawnMenu = False
    _SetToggleOptionValue(oidRespawnMenu, bRespawnMenu)
    flags = OPTION_FLAG_NONE
  elseif (option == oidTeleportMenu)
    bTeleportMenu = True
    _SetToggleOptionValue(oidTeleportMenu, bTeleportMenu)
  elseif (option == oidMultipleDis)
    bMultipleDis = True
    _SetToggleOptionValue(oidMultipleDis, bMultipleDis)
  elseif (option == oidDiseaseCurse)
    bDiseaseCurse = False
    _SetToggleOptionValue(oidDiseaseCurse, bDiseaseCurse)
    ForcePageReset()
  elseif (option == oidMultipleDisProg)
    bMultipleDisProg = True
    _SetToggleOptionValue(oidMultipleDisProg, bMultipleDisProg)
  elseif (option == oidOnlyInfectIfHasBaseDis)
    bOnlyInfectIfHasBaseDis = False
    _SetToggleOptionValue(oidOnlyInfectIfHasBaseDis, bOnlyInfectIfHasBaseDis)
  elseif (option == oidSoulMarkCureDiseases)
    bSoulMarkCureDiseases = False
    _SetToggleOptionValue(oidSoulMarkCureDiseases, bSoulMarkCureDiseases)
  elseif (option == oidCureDisIfHasBlessing)
    bCureDisIfHasBlessing = False
    moaCureDisIfHasBlessing.SetValueInt(0)
    _SetToggleOptionValue(oidCureDisIfHasBlessing, bCureDisIfHasBlessing)
  elseif (option == oidTotalCustomRPSlotSlider)
    fTotalCustomRPSlotSlider = 1.0
    SetCustomRPFlags()
    _SetSliderOptionValue(oidTotalCustomRPSlotSlider, fTotalCustomRPSlotSlider, "$mrt_MarkofArkay_TotalCustomRPSlotSlider_1")
  elseif (option == oidSelectedCustomRPSlot_M)
    iSelectedCustomRPSlot = 0
    SetCustomRPFlags()
    _SetMenuOptionValue(oidSelectedCustomRPSlot_M, shortenString(sCustomRPs[iSelectedCustomRPSlot], 19), False)
  elseif (option == oidExtraTeleportLocation_M)
    iExternalIndex = moaERPCount.GetValueInt()
    _SetMenuOptionValue(oidExtraTeleportLocation_M, shortenString(sExtraRPs[iExternalIndex], 19), False)
  elseif (option == oidJail)
    bSendToJail = False
    _SetToggleOptionValue(oidJail, bSendToJail)
  elseif (option == oidDoNotStopCombat)
    bDoNotStopCombat = False
    _SetToggleOptionValue(oidDoNotStopCombat, bDoNotStopCombat)
  elseif (option == oidDoNotStopCombatAfterRevival)
    bDoNotStopCombatAfterRevival = True
    _SetToggleOptionValue(oidDoNotStopCombatAfterRevival, bDoNotStopCombatAfterRevival)
  elseif (option == oidKillIfCantRespawn)
    bKillIfCantRespawn = False
    _SetToggleOptionValue(oidKillIfCantRespawn, bKillIfCantRespawn)
  elseif (option == oidCanbeKilledbyUnarmed)
    bCanbeKilledbyUnarmed = True
    _SetToggleOptionValue(oidCanbeKilledbyUnarmed, bCanbeKilledbyUnarmed)

    ;ElseIf (option == oidLoseSkillForever)
    ;	bLoseSkillForever = False
    ;	_SetToggleOptionValue(oidLoseSkillForever,bLoseSkillForever)
  elseif (option == oidHealActors)
    bHealActors = False
    _SetToggleOptionValue(oidHealActors, bHealActors)
  elseif (option == oidResurrectActors)
    bResurrectActors = False
    _SetToggleOptionValue(oidResurrectActors, bResurrectActors)
  elseif (option == oidShowRaceMenu)
    bShowRaceMenu = False
    _SetToggleOptionValue(oidShowRaceMenu, bShowRaceMenu)
  elseif (option == oidArkayCurse)
    bArkayCurse = False
    _SetToggleOptionValue(oidArkayCurse, bArkayCurse)
    flags = OPTION_FLAG_DISABLED
    _SetOptionFlags(oidArkayCurses_M, flags, True)
    _SetOptionFlags(oidTempArkayCurse, flags, True)
    if ((bIsRevivalEnabled) && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidSoulMarkStay, flags)
  elseif (option == oidTempArkayCurse)
    bIsArkayCurseTemporary = False
    _SetToggleOptionValue(oidTempArkayCurse, bIsArkayCurseTemporary)
  elseif (option == oidSkillReduce_M)
    iReducedSkill = 0
    _SetMenuOptionValue(oidSkillReduce_M, sGetSkills()[iReducedSkill], False)
    flags = OPTION_FLAG_DISABLED
    _SetOptionFlags(oidLevelReduce, flags, True)
    _SetOptionFlags(oidOnlyLoseSkillXP, flags, True)

    ;_SetOptionFlags(oidLoseSkillForever,flags,True)
    _SetOptionFlags(oidSkillReduceRandomVal, flags, True)
    _SetOptionFlags(oidSkillReduceValSlider, flags, True)
    _SetOptionFlags(oidSkillReduceMinValSlider, flags, True)
    _SetOptionFlags(oidSkillReduceMaxValSlider, flags)
    ForcePageReset()
  elseif (option == oidEquipInclude_M)
    iLoseInclusion = 0
    _SetMenuOptionValue(oidEquipInclude_M, sGetLoseInclusions()[iLoseInclusion], False)
    ForcePageReset()
  elseif (option == oidRapistGender_M)
    iRapistGender = 0
    _SetMenuOptionValue(oidRapistGender_M, sGetGenders()[iRapistGender], False)
    ForcePageReset()
  elseif (option == oidSexInterface_M)
    iSexInterface = 0
    _SetMenuOptionValue(oidSexInterface_M, sGetSexInterface()[iSexInterface], False)
    ForcePageReset()
  elseif (option == oidSkillReduceRandomVal)
    bSkillReduceRandomVal = False
    _SetToggleOptionValue(oidSkillReduceRandomVal, bSkillReduceRandomVal)
    _SetOptionFlags(oidSkillReduceMinValSlider, OPTION_FLAG_DISABLED, True)
    _SetOptionFlags(oidSkillReduceMaxValSlider, OPTION_FLAG_DISABLED, True)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidSkillReduceValSlider, Flags)
  elseif (option == oidCreaturesCanSteal)
    bCreaturesCanSteal = False
    moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
    _SetToggleOptionValue(oidCreaturesCanSteal, bCreaturesCanSteal)
  elseif (option == oidNPCHasLevelRange)
    bNPCHasLevelRange = False
    moaNPCHasLevelRange.SetValue(bNPCHasLevelRange As Int)
    _SetToggleOptionValue(oidNPCHasLevelRange, bNPCHasLevelRange)
    ForcePageReset()
  elseif (option == oidSpawnHostile)
    bSpawnHostile = False
    _SetToggleOptionValue(oidSpawnHostile, bSpawnHostile)
    ForcePageReset()
  elseif (option == oidBossChestOnlyCurLoc)
    bBossChestOnlyCurLoc = False
    moaOnlyInCurLocChest.SetValueInt(0)
    _SetToggleOptionValue(oidBossChestOnlyCurLoc, bBossChestOnlyCurLoc)
  elseif (option == oidBossChestNotClearedLoc)
    bBossChestNotInClearedLoc = True
    moaBossChestNotInclearedLoc.SetValueInt(0)
    _SetToggleOptionValue(oidBossChestNotClearedLoc, bBossChestNotInClearedLoc)
  elseif (option == oidOnlyEnslavedByEnemyFaction)
    bOnlyEnslavedByEnemyFaction = False
    _SetToggleOptionValue(oidOnlyEnslavedByEnemyFaction, bOnlyEnslavedByEnemyFaction)
  elseif (option == oidSlaveryOnlyAfterRape)
    bSlaveryOnlyAfterRape = False
    _SetToggleOptionValue(oidSlaveryOnlyAfterRape, bSlaveryOnlyAfterRape)
  elseif (option == oidOnlyHostilesRape)
    bOnlyHostilesRape = True
    _SetToggleOptionValue(oidOnlyHostilesRape, bOnlyHostilesRape)
  elseif (option == oidAlwaysSpawn)
    bAlwaysSpawn = False
    _SetToggleOptionValue(oidAlwaysSpawn, bAlwaysSpawn)
  elseif (option == oidOnlySpawn)
    bOnlySpawn = False
    _SetToggleOptionValue(oidOnlySpawn, bOnlySpawn)
  elseif (option == oidMoralityMatters)
    bMoralityMatters = True
    moaMoralityMatters.SetValue(bMoralityMatters As Int)
    _SetToggleOptionValue(oidMoralityMatters, bMoralityMatters)
  elseif (option == oidLoseforever)
    bLoseForever = False
    _SetToggleOptionValue(oidLoseforever, bLoseForever)
  elseif (option == oidRandomItemCurse)
    bRandomItemCurse = False
    _SetToggleOptionValue(oidRandomItemCurse, bRandomItemCurse)
  elseif (option == oidMoreRandomRespawn)
    bMoreRandomRespawn = False
    _SetToggleOptionValue(oidMoreRandomRespawn, bMoreRandomRespawn)
  elseif (option == oidMinLoseGoldSlider)
    fMinLoseGoldSlider = 50.0
    _SetSliderOptionValue(oidMinLoseGoldSlider, fMinLoseGoldSlider, "{0}")
  elseif (option == oidMaxLoseGoldSlider)
    fMaxLoseGoldSlider = 250.0
    _SetSliderOptionValue(oidMaxLoseGoldSlider, fMaxLoseGoldSlider, "{0}")
  elseif (option == oidLoseGoldAll)
    bLoseGoldAll = False
    _SetToggleOptionValue(oidLoseGoldAll, bLoseGoldAll)
  elseif (option == oidLoseItem)
    bLoseItem = False
    _SetToggleOptionValue(oidLoseItem, bLoseItem)
    forcePageReset()
  elseif (option == oidLoseArkayMarkAll)
    bLoseArkayMarkAll = False
    _SetToggleOptionValue(oidLoseArkayMarkAll, bLoseArkayMarkAll)
    forcePageReset()
  elseif (option == oidMinLoseArkayMarkSlider)
    fMinLoseArkayMarkSlider = 0.0
    _SetSliderOptionValue(oidMinLoseArkayMarkSlider, fMinLoseArkayMarkSlider, "{0}")
  elseif (option == oidMaxLoseArkayMarkSlider)
    fMaxLoseArkayMarkSlider = 1.0
    _SetSliderOptionValue(oidMaxLoseArkayMarkSlider, fMaxLoseArkayMarkSlider, "{0}")
  elseif (option == oidLoseDragonSoulAll)
    bLoseDragonSoulAll = False
    _SetToggleOptionValue(oidLoseDragonSoulAll, bLoseDragonSoulAll)
    forcePageReset()
  elseif (option == oidMinLoseDragonSoulSlider)
    fMinLoseDragonSoulSlider = 0.0
    _SetSliderOptionValue(oidMinLoseDragonSoulSlider, fMinLoseDragonSoulSlider, "{0}")
  elseif (option == oidMaxLoseDragonSoulSlider)
    fMaxLoseDragonSoulSlider = 1.0
    _SetSliderOptionValue(oidMaxLoseDragonSoulSlider, fMaxLoseDragonSoulSlider, "{0}")
  elseif (option == oidLoseBlackSoulGemAll)
    bLoseBlackSoulGemAll = False
    _SetToggleOptionValue(oidLoseBlackSoulGemAll, bLoseBlackSoulGemAll)
    forcePageReset()
  elseif (option == oidMinLoseBlackSoulGemSlider)
    fMinLoseBlackSoulGemSlider = 0.0
    _SetSliderOptionValue(oidMinLoseBlackSoulGemSlider, fMinLoseBlackSoulGemSlider, "{0}")
  elseif (option == oidMaxLoseBlackSoulGemSlider)
    fMaxLoseBlackSoulGemSlider = 1.0
    _SetSliderOptionValue(oidMaxLoseBlackSoulGemSlider, fMaxLoseBlackSoulGemSlider, "{0}")
  elseif (option == oidLoseGrandSoulGemAll)
    bLoseGrandSoulGemAll = False
    _SetToggleOptionValue(oidLoseGrandSoulGemAll, bLoseGrandSoulGemAll)
    forcePageReset()
  elseif (option == oidMinLoseGrandSoulGemSlider)
    fMinLoseGrandSoulGemSlider = 0.0
    _SetSliderOptionValue(oidMinLoseGrandSoulGemSlider, fMinLoseGrandSoulGemSlider, "{0}")
  elseif (option == oidMaxLoseGrandSoulGemSlider)
    fMaxLoseGrandSoulGemSlider = 1.0
    _SetSliderOptionValue(oidMaxLoseGrandSoulGemSlider, fMaxLoseGrandSoulGemSlider, "{0}")
  elseif (option == oidLoseOtherMinValueSlider)
    fLoseOtherMinValueSlider = 0.0
    _SetSliderOptionValue(oidLoseOtherMinValueSlider, fLoseOtherMinValueSlider, "{0}")
  elseif (option == oidLoseOtherTotalValueSlider)
    fLoseOtherTotalValueSlider = 0.0
    _SetSliderOptionValue(oidLoseOtherTotalValueSlider, fLoseOtherTotalValueSlider, "{0}")
  elseif (option == oidMaxItemsToCheckSlider)
    fMaxItemsToCheckSlider = 100.0
    _SetSliderOptionValue(oidMaxItemsToCheckSlider, fMaxItemsToCheckSlider, "{0}")
  elseif (option == oidLowerNPCMaxLvlDiff)
    fLowerNPCMaxLvlDiff = 10.0
    _SetSliderOptionValue(oidLowerNPCMaxLvlDiff, fLowerNPCMaxLvlDiff, "{0}")
  elseif (option == oidHigherNPCMaxLvlDiff)
    fHigherNPCMaxLvlDiff = 10.0
    _SetSliderOptionValue(oidHigherNPCMaxLvlDiff, fHigherNPCMaxLvlDiff, "{0}")
  elseif (option == oidBossChestChanceSlider)
    fBossChestChanceSlider = 0.0
    _SetSliderOptionValue(oidBossChestChanceSlider, fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2")
    ForcePageReset()
  elseif (option == oidSimpleSlaveryChanceSlider)
    fSimpleSlaveryChanceSlider = 0.0
    _SetSliderOptionValue(oidSimpleSlaveryChanceSlider, fSimpleSlaveryChanceSlider, "$mrt_MarkofArkay_SimpleSlaveryChanceSlider_2")
    ForcePageReset()
  elseif (option == oidRapeChanceSlider)
    fRapeChanceSlider = 0.0
    _SetSliderOptionValue(oidRapeChanceSlider, fRapeChanceSlider, "$mrt_MarkofArkay_RapeChanceSlider_2")
    ForcePageReset()
  elseif (option == oidRapesMaxSlider)
    fMaxRapes = 1.0
    _SetSliderOptionValue(oidRapesMaxSlider, fMaxRapes, "$mrt_MarkofArkay_RapesMaxSlider_2")
    ForcePageReset()
  elseif (option == oidRapistsMaxSlider)
    fMaxRapists = 1.0
    _SetSliderOptionValue(oidRapistsMaxSlider, fMaxRapists, "$mrt_MarkofArkay_RapistsMaxSlider_2")
    ForcePageReset()
  elseif (option == oidHealthTriggerSlider)
    fHealthPercTrigger = 0.00
    _SetSliderOptionValue(oidHealthTriggerSlider, fHealthPercTrigger * 100, "mrt_MarkofArkay_HealthPercSlider_2")
  elseif (option == oidExcludeQuestItems)
    bExcludeQuestItems = True
    _SetToggleOptionValue(oidExcludeQuestItems, bExcludeQuestItems, False)
  elseif (option == oidLoseGold)
    bLoseGold = True
    _SetToggleOptionValue(oidLoseGold, bLoseGold, False)
    forcePageReset()
  elseif (option == oidLoseArkayMark)
    bLoseArkayMark = False
    _SetToggleOptionValue(oidLoseArkayMark, bLoseArkayMark, False)
    forcePageReset()
  elseif (option == oidLoseBlackSoulGem)
    bLoseBlackSoulGem = False
    _SetToggleOptionValue(oidLoseBlackSoulGem, bLoseBlackSoulGem, False)
    forcePageReset()
  elseif (option == oidLoseGrandSoulGem)
    bLoseGrandSoulGem = False
    _SetToggleOptionValue(oidLoseGrandSoulGem, bLoseGrandSoulGem, False)
    forcePageReset()
  elseif (option == oidLoseDragonSoul)
    bLoseDragonSoul = False
    _SetToggleOptionValue(oidLoseDragonSoul, bLoseDragonSoul, False)
    forcePageReset()
  elseif (option == oidLoseOthers)
    bLoseOthers = False
    _SetToggleOptionValue(oidLoseOthers, bLoseOthers, False)
    forcePageReset()
  elseif (option == oidLoseAmmo)
    bLoseAmmo = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseAmmo, bLoseAmmo, False)
  elseif (option == oidLoseBook)
    bLoseBook = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseBook, bLoseBook, False)
  elseif (option == oidLoseArmor)
    bLoseArmor = True
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseArmor, bLoseArmor, False)
  elseif (option == oidLoseWeapon)
    bLoseWeapon = True
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseWeapon, bLoseWeapon, False)
  elseif (option == oidLoseMisc)
    bLoseMisc = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseMisc, bLoseMisc, False)
  elseif (option == oidLoseKey)
    bLoseKey = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseKey, bLoseKey, False)
  elseif (option == oidLoseSoulgem)
    bLoseSoulgem = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseSoulgem, bLoseSoulgem, False)
  elseif (option == oidLosePotion)
    bLosePotion = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLosePotion, bLosePotion, False)
  elseif (option == oidLoseScroll)
    bLoseScroll = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseScroll, bLoseScroll, False)
  elseif (option == oidLoseIngredient)
    bLoseIngredient = False
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseIngredient, bLoseIngredient, False)
  elseif (option == oidCheckKeyword)
    bCheckKeyword = True
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidCheckKeyword, bCheckKeyword, False)
  elseif (option == oidCheckWeight)
    bCheckWeight = True
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidCheckWeight, bCheckWeight, False)
  elseif (option == oidLevelReduce)
    bLevelReduce = False
    _SetToggleOptionValue(oidLevelReduce, bLevelReduce, False)
  elseif (option == oidOnlyLoseSkillXP)
    bOnlyLoseSkillXP = False
    _SetToggleOptionValue(oidOnlyLoseSkillXP, bOnlyLoseSkillXP, False)
    ForcePageReset()
  elseif (option == oidVoicelessCurse)
    bVoicelessCurse = False
    _SetToggleOptionValue(oidVoicelessCurse, bVoicelessCurse, False)
  elseif (option == oidGhostCurse)
    bGhostCurse = False
    _SetToggleOptionValue(oidGhostCurse, bGhostCurse, False)
    ForcePageReset()
  elseif (option == oidLiteGhostCurse)
    bLiteGhostCurse = False
    _SetToggleOptionValue(oidLiteGhostCurse, bLiteGhostCurse, False)
  elseif (option == oidLostItemQuest)
    bLostItemQuest = True
    _SetToggleOptionValue(oidLostItemQuest, bLostItemQuest, False)
    if ((LostItemsChest.GetNumItems() > 0) || (ReviveScript.ItemScript.fLostSouls > 0.0) || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.SkillScript.bSkillReduced())
      if (ReviveScript.bSoulMark())
        if ReviveScript.moaSoulMark01.IsRunning()
          moaRetrieveLostItems.start()
          moaRetrieveLostItems.SetStage(1)
        endif
      elseif ReviveScript.moaThiefNPC01.IsRunning()
        moaRetrieveLostItems01.start()
        moaRetrieveLostItems01.SetStage(1)
      endif
    else
      if moaRetrieveLostItems.IsRunning()
        moaRetrieveLostItems.SetStage(20)
      endif
      if moaRetrieveLostItems01.IsRunning()
        moaRetrieveLostItems01.SetStage(20)
      endif
      if ReviveScript.moaThiefNPC01.IsRunning()
        if (ReviveScript.ThiefNPC.GetReference() As Actor)
          (ReviveScript.ThiefNPC.GetReference() As Actor).AddToFaction(ReviveScript.PlayerEnemyFaction)
        endif
      endif
    endif
  elseif (option == oidSoulMarkStay)
    bSoulMarkStay = False
    _SetToggleOptionValue(oidSoulMarkStay, bSoulMarkStay, False)
  elseif (option == oidTeleportLocation_M)
    iTeleportLocation = 14
    _SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation], False)
    ForcePageReset()
  elseif (option == oidNoTradingAftermath_M)
    iNotTradingAftermath = 1
    _SetMenuOptionValue(oidNoTradingAftermath_M, sGetAftermathOptions()[iNotTradingAftermath], False)
    ForcePageReset()
  elseif (option == oidInformation)
    bIsInfoEnabled = True
    _SetToggleOptionValue(oidInformation, bIsInfoEnabled, False)
    ForcePageReset()
  elseif (option == oidAutoSwitchRP)
    bAutoSwitchRP = False
    _SetToggleOptionValue(oidAutoSwitchRP, bAutoSwitchRP, False)
  elseif (option == oidArkayCurses_M)
    iArkayCurse = 0
    _SetMenuOptionValue(oidArkayCurses_M, sGetArkayCurses()[iArkayCurse], False)
  elseif (option == oidEnableSave_M)
    iSaveOption = 1
    _SetMenuOptionValue(oidEnableSave_M, sGetSaveOptions()[iSaveOption], False)
    moaPraytoSave.SetValue(0.0)
    SetInChargen(False, False, False)
  elseif (option == oidHostileOptions_M)
    iHostileOption = 0
    _SetMenuOptionValue(oidHostileOptions_M, sGetHostileOptions()[iHostileOption], False)
    ForcePageReset()
  elseif option == oidSpawnMinLevel_M
    iSpawnMinLevel = 4
    _SetMenuOptionValue(oidSpawnMinLevel_M, sGetSpawnLevels()[iSpawnMinLevel], False)
  elseif option == oidSpawnMaxLevel_M
    iSpawnMaxLevel = 4
    _SetMenuOptionValue(oidSpawnMaxLevel_M, sGetSpawnLevels()[iSpawnMaxLevel], False)
  endif
endevent

event OnOptionHighlight(Int option)
  string page = CurrentPage
  if (option == oidRevivalEnabled)
    if bIsRevivalEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_RevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_RevivalEnabled_Off")
    endif
  elseif (option == oidTradeEnabled)
    SetInfoText("$mrt_MarkofArkay_DESC_TradeEnabled")
  elseif (option == oidTriggerOnBleedout)
    SetInfoText("$mrt_MarkofArkay_DESC_TriggerOnBleedout")
  elseif (option == oidTriggerOnHealthPerc)
    SetInfoText("$mrt_MarkofArkay_DESC_TriggerOnHealthPerc")
  elseif (option == oidDragonSoulSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulSlider")
  elseif (option == oidMenuEnabled)
    if bIsMenuEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_MenuEnabled_Off")
    endif
  elseif (option == oidBSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemSlider")
  elseif (option == oidGoldSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GoldSlider")
  elseif (option == oidMarkSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MarkSlider")
  elseif (option == oidGSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemSlider")
  elseif (option == oidDragonSoulRevivalEnabled)
    if bIsDragonSoulEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulRevivalEnabled_Off")
    endif
  elseif (option == oidMarkOfArkayRevivalEnabled)
    if bIsMarkEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_MarkOfArkayRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_MarkOfArkayRevivalEnabled_Off")
    endif
  elseif (option == oidBSoulGemRevivalEnabled)
    if bIsBSoulGemEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemRevivalEnabled_Off")
    endif
  elseif (option == oidGSoulGemRevivalEnabled)
    if bIsGSoulGemEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemRevivalEnabled_Off")
    endif
  elseif (option == oidGoldRevivalEnabled)
    if bIsGoldEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_GoldRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_GoldRevivalEnabled_Off")
    endif
  elseif (option == oidFollowerProtectPlayer)
    SetInfoText("$mrt_MarkofArkay_DESC_FollowerProtectPlayer")
  elseif (option == oidPlayerProtectFollower)
    SetInfoText("$mrt_MarkofArkay_DESC_PlayerProtectFollower")
  elseif (option == oidSpawnByLocation)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnByLocation")
  elseif (option == oidRetrySpawnWithoutLocation)
    SetInfoText("$mrt_MarkofArkay_DESC_RetrySpawnWithoutLocation")
  elseif (option == oidSpawnCheckRelation)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnCheckRelation")
  elseif (option == oidNoFallDamageEnabled)
    if bIsNoFallDamageEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_NoFallDamageEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_NoFallDamageEnabled_Off")
    endif
  elseif (option == oidNotification)
    if bIsNotificationEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_Notification_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_Notification_Off")
    endif
  elseif (option == oidFadeToBlack)
    SetInfoText("$mrt_MarkofArkay_DESC_FadeToBlack")
  elseif (option == oidInvisibility)
    SetInfoText("$mrt_MarkofArkay_DESC_Invisibility")
  elseif (option == oidDeathEffect)
    SetInfoText("$mrt_MarkofArkay_DESC_DeathEffect")
  elseif (option == oidAltEyeFix)
    SetInfoText("$mrt_MarkofArkay_DESC_AltEyeFix")
  elseif (option == oidLogging)
    SetInfoText("$mrt_MarkofArkay_DESC_Logging")
  elseif (option == oidDragonSoulPSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DragonSoulPSlider")
  elseif (option == oidBSoulGemPSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_BSoulGemPSlider")
  elseif (option == oidGSoulGemPSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GSoulGemPSlider")
  elseif (option == oidSnoozeSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SnoozeSlider")
  elseif (option == oidMarkPSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MarkPSlider")
  elseif (option == oidGoldPSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GoldPSlider")
  elseif (option == oidRecoveryTime)
    SetInfoText("$mrt_MarkofArkay_DESC_RecoveryTime")
  elseif (option == oidRPMinDistanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_RPMinDistanceSlider")
  elseif (option == oidDisChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DisChanceSlider")
  elseif (option == oidDisProgChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DisProgChanceSlider")
  elseif (option == oidDisPriceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DisPriceSlider")
  elseif (option == oidDisPriceMultSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DisPriceMultSlider")
  elseif (option == oidMarkScaleSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MarkScaleSlider")
  elseif (option == oidGSoulScaleGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GSoulScaleGemSlider")
  elseif (option == oidBSoulScaleGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_BSoulScaleGemSlider")
  elseif (option == oidDragonScaleSoulSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_DragonScaleSoulSlider")
  elseif (option == oidGoldScaleSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_GoldScaleSlider")
  elseif (option == oidBleedoutTime)
    SetInfoText("$mrt_MarkofArkay_DESC_BleedoutTime")
  elseif (option == oidLootChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_LootChanceSlider")
  elseif (option == oidScrollChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_ScrollChanceSlider")
  elseif (option == oidEffect)
    if bIsEffectEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_Effect_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_Effect_Off")
    endif
  elseif (option == oidRevivalRequireBlessing)
    if bIsRevivalRequiresBlessing
      SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_RevivalRequireBlessing_Off")
    endif
  elseif (option == oidPotionRevivalEnabled)
    if bIsPotionEnabled
      SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_On")
    else
      SetInfoText("$mrt_MarkofArkay_DESC_PotionRevivalEnabled_Off")
    endif
  elseif (option == oidAutoDrinkPotion)
    SetInfoText("$mrt_MarkofArkay_DESC_AutoDrinkPotion")
  elseif (option == oidStatus)
    SetInfoText("$mrt_MarkofArkay_DESC_Status")
  elseif (option == oidRespawnBlackListLocation)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnBlackListLocation")
  elseif (option == oidReset)
    SetInfoText("$mrt_MarkofArkay_DESC_Reset")
  elseif (option == oidResetPlayer)
    SetInfoText("$mrt_MarkofArkay_DESC_ResetPlayer")
  elseif (option == oidNoTradingAftermath_M)
    SetInfoText("$mrt_MarkofArkay_DESC_NoTradingAftermath_M")
  elseif (option == oidTeleportLocation_M)
    SetInfoText("$mrt_MarkofArkay_DESC_TeleportLocation_M")
  elseif (option == oidTavern_M)
    SetInfoText("$mrt_MarkofArkay_DESC_Tavern_M")
  elseif (option == oidRespawnPoint0)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint0")
  elseif (option == oidRespawnPoint1)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint1")
  elseif (option == oidRespawnPoint2)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint2")
  elseif (option == oidRespawnPoint3)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint3")
  elseif (option == oidRespawnPoint4)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint4")
  elseif (option == oidRespawnPoint5)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint5")
  elseif (option == oidRespawnPoint6)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint6")
  elseif (option == oidRespawnPoint7)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint7")
  elseif (option == oidRespawnPoint8)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint8")
  elseif (option == oidRespawnPoint9)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnPoint9")
  elseif (option == oidRespawnNaked)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnNaked")
  elseif (option == oidCorpseAsSoulMark)
    SetInfoText("$mrt_MarkofArkay_DESC_CorpseAsSoulMark")
  elseif (option == oidRespawnMenu)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnMenu")
  elseif (option == oidTeleportMenu)
    SetInfoText("$mrt_MarkofArkay_DESC_TeleportMenu")
  elseif (option == oidMultipleDis)
    SetInfoText("$mrt_MarkofArkay_DESC_MultipleDis")
  elseif (option == oidDiseaseCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_DiseaseCurse")
  elseif (option == oidMultipleDisProg)
    SetInfoText("$mrt_MarkofArkay_DESC_MultipleDisProg")
  elseif (option == oidJail)
    SetInfoText("$mrt_MarkofArkay_DESC_Jail")
  elseif (option == oidDoNotStopCombat)
    SetInfoText("$mrt_MarkofArkay_DESC_DoNotStopCombat")
  elseif (option == oidDoNotStopCombatAfterRevival)
    SetInfoText("$mrt_MarkofArkay_DESC_DoNotStopCombatAfterRevival")
  elseif (option == oidKillIfCantRespawn)
    SetInfoText("$mrt_MarkofArkay_DESC_KillIfCantRespawn")
  elseif (option == oidCanbeKilledbyUnarmed)
    SetInfoText("$mrt_MarkofArkay_DESC_CanbeKilledbyUnarmed")

    ;ElseIf (option == oidLoseSkillForever)
    ;	SetInfoText("$mrt_MarkofArkay_DESC_LoseSkillForever")
  elseif (option == oidHealActors)
    SetInfoText("$mrt_MarkofArkay_DESC_HealActors")
  elseif (option == oidResurrectActors)
    SetInfoText("$mrt_MarkofArkay_DESC_ResurrectActors")
  elseif (option == oidShowRaceMenu)
    SetInfoText("$mrt_MarkofArkay_DESC_ShowRaceMenu")
  elseif (option == oidArkayCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_ArkayCurse")
  elseif (option == oidTempArkayCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_TempArkayCurse")
  elseif (option == oidSkillReduceRandomVal)
    SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceRandomVal")
  elseif (option == oidSkillReduce_M)
    SetInfoText("$mrt_MarkofArkay_DESC_SkillReduce_M")
  elseif (option == oidSkillReduceValSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceValSlider")
  elseif (option == oidSkillReduceMinValSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceMinValSlider")
  elseif (option == oidSkillReduceMaxValSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SkillReduceMaxValSlider")
  elseif (option == oidCreaturesCanSteal)
    SetInfoText("$mrt_MarkofArkay_DESC_CreaturesCanSteal")
  elseif (option == oidNPCHasLevelRange)
    SetInfoText("$mrt_MarkofArkay_DESC_NPCHasLevelRange")
  elseif (option == oidMoralityMatters)
    SetInfoText("$mrt_MarkofArkay_DESC_MoralityMatters")
  elseif (option == oidLoseforever)
    SetInfoText("$mrt_MarkofArkay_DESC_Loseforever")
  elseif (option == oidLostItemQuest)
    SetInfoText("$mrt_MarkofArkay_DESC_LostItemQuest")
  elseif (option == oidVoicelessCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_VoicelessCurse")
  elseif (option == oidGhostCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_GhostCurse")
  elseif (option == oidLiteGhostCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_LiteGhostCurse")
  elseif (option == oidSoulMarkStay)
    SetInfoText("$mrt_MarkofArkay_DESC_SoulMarkStay")
  elseif (option == oidRecallRestriction)
    SetInfoText("$mrt_MarkofArkay_DESC_RecallRestriction")
  elseif (option == oidShiftBack)
    SetInfoText("$mrt_MarkofArkay_DESC_ShiftBack")
  elseif (option == oidShiftBackRespawn)
    SetInfoText("$mrt_MarkofArkay_DESC_ShiftBackRespawn")
  elseif (option == oidHistory)
    SetInfoText("$mrt_MarkofArkay_DESC_History")
  elseif (option == oidInformation)
    SetInfoText("$mrt_MarkofArkay_DESC_Info")
  elseif (option == oidResetHistory)
    SetInfoText("$mrt_MarkofArkay_DESC_ResetHistory")
  elseif (option == oidRestoreItems)
    SetInfoText("$mrt_MarkofArkay_DESC_RestoreItems")
  elseif (option == oidTogglePowers)
    SetInfoText("$mrt_MarkofArkay_DESC_TogglePowers")
  elseif (option == oidToggleSpells)
    SetInfoText("$mrt_MarkofArkay_DESC_ToggleSpells")
  elseif (option == oidAutoSwitchRP)
    SetInfoText("$mrt_MarkofArkay_DESC_AutoSwitchRP")
  elseif (option == oidRecallCost)
    SetInfoText("$mrt_MarkofArkay_DESC_RecallCost")
  elseif (option == oidMarkCost)
    SetInfoText("$mrt_MarkofArkay_DESC_MarkCost")
  elseif (option == oidArkayCurses_M)
    setInfotext("$mrt_MarkofArkay_DESC_ArkayCurses_M")
  elseif (option == oidEnableSave_M)
    setInfotext("$mrt_MarkofArkay_DESC_EnableSave_M")
  elseif (option == oidHostileOptions_M)
    setInfotext("$mrt_MarkofArkay_DESC_HostileOptions_M")
  elseif (option == oidSpawns_M)
    setInfotext("$mrt_MarkofArkay_DESC_Spawns_M")
  elseif (option == oidSpawnMinLevel_M)
    setInfotext("$mrt_MarkofArkay_DESC_SpawnMinLevel_M")
  elseif (option == oidSpawnMaxLevel_M)
    setInfotext("$mrt_MarkofArkay_DESC_SpawnMaxLevel_M")
  elseif (option == oidLoadPreset1)
    SetInfoText("$mrt_MarkofArkay_DESC_Load_Preset")
  elseif (option == oidSavePreset1)
    SetInfoText("$mrt_MarkofArkay_DESC_Save_Preset")
  elseif (option == oidLoadDefaultPreset)
    SetInfoText("$mrt_MarkofArkay_DESC_Load_Default_Preset")
  elseif (option == oidLoadPreset_M)
    SetInfoText("$mrt_MarkofArkay_DESC_Load_Preset_M")
  elseif (option == oidGhostShader)
    SetInfoText("$mrt_MarkofArkay_DESC_GhostShader_M")
  elseif (option == oidSavePreset_M)
    SetInfoText("$mrt_MarkofArkay_DESC_Save_Preset_M")
  elseif (option == oidRagdollEffect)
    SetInfoText("$mrt_MarkofArkay_DESC_RagdollEffect")
  elseif (option == oidRespawnTimeSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnTimeSlider")
  elseif (option == oidRespawnCounter)
    SetInfoText("$mrt_MarkofArkay_DESC_RespawnCounter")
  elseif (option == oidSpawnCountSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnCountSlider")
  elseif (option == oidSpawnWeightSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnWeightSlider")
  elseif (option == oidRandomItemCurse)
    SetInfoText("$mrt_MarkofArkay_DESC_RandomItemCurse")
  elseif (option == oidMoreRandomRespawn)
    SetInfoText("$mrt_MarkofArkay_DESC_MoreRandomRespawn")
  elseif (option == oidEquipInclude_M)
    SetInfoText("$mrt_MarkofArkay_DESC_EquipInclude_M")
  elseif (option == oidRapistGender_M)
    SetInfoText("$mrt_MarkofArkay_DESC_RapistGender_M")
  elseif (option == oidSexInterface_M)
    SetInfoText("$mrt_MarkofArkay_DESC_SexInterface_M")
  elseif (option == oidDisableUnsafe)
    SetInfoText("$mrt_MarkofArkay_DESC_DisableUnsafe")
  elseif (option == oidMinLoseGoldSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MinLoseGoldSlider")
  elseif (option == oidMaxLoseGoldSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseGoldSlider")
  elseif (option == oidLoseGoldAll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseGoldAll")
  elseif (option == oidLoseArkayMarkAll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseArkayMarkAll")
  elseif (option == oidMinLoseArkayMarkSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MinLoseArkayMarkSlider")
  elseif (option == oidMaxLoseArkayMarkSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseArkayMarkSlider")
  elseif (option == oidLoseDragonSoulAll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseDragonSoulAll")
  elseif (option == oidMinLoseDragonSoulSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MinLoseDragonSoulSlider")
  elseif (option == oidMaxLoseDragonSoulSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseDragonSoulSlider")
  elseif (option == oidLoseBlackSoulGemAll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseBSoulgemAll")
  elseif (option == oidMinLoseBlackSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MinLoseBSoulgemSlider")
  elseif (option == oidMaxLoseBlackSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseBSoulgemSlider")
  elseif (option == oidLoseGrandSoulGemAll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseGSoulgemAll")
  elseif (option == oidMaxLoseGrandSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxLoseGSoulgemSlider")
  elseif (option == oidMinLoseGrandSoulGemSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MinLoseGSoulgemSlider")
  elseif (option == oidLoseOtherMinValueSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseOtherMinValueSlider")
  elseif (option == oidLoseOtherTotalValueSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseOtherTotalValueSlider")
  elseif (option == oidMaxItemsToCheckSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_MaxItemsToCheckSlider")
  elseif (option == oidHigherNPCMaxLvlDiff)
    SetInfoText("$mrt_MarkofArkay_DESC_HigherNPCMaxLvlDiff")
  elseif (option == oidLowerNPCMaxLvlDiff)
    SetInfoText("$mrt_MarkofArkay_DESC_LowerNPCMaxLvlDiff")
  elseif (option == oidBossChestChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_BossChestChanceSlider")
  elseif (option == oidSimpleSlaveryChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_SimpleSlaveryChanceSlider")
  elseif (option == oidRapeChanceSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_RapeChanceSlider")
  elseif (option == oidRapesMaxSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_RapesMaxSlider")
  elseif (option == oidRapistsMaxSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_RapistsMaxSlider")
  elseif (option == oidHealthTriggerSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_HealthPercSlider")
  elseif (option == oidExcludeQuestItems)
    SetInfoText("$mrt_MarkofArkay_DESC_ExcludeQuestItems")
  elseif (option == oidLoseItem)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseItem")
  elseif (option == oidLoseGold)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseGold")
  elseif (option == oidLoseArkayMark)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseArkayMark")
  elseif (option == oidLoseBlackSoulGem)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseBSoulGem")
  elseif (option == oidLoseGrandSoulGem)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseGSoulGem")
  elseif (option == oidLoseDragonSoul)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseDragonSoul")
  elseif (option == oidLoseOthers)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseOthers")
  elseif (option == oidLoseAmmo)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseAmmo")
  elseif (option == oidLoseBook)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseBook")
  elseif (option == oidLoseArmor)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseArmor")
  elseif (option == oidLoseWeapon)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseWeapon")
  elseif (option == oidLoseMisc)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseMisc")
  elseif (option == oidLoseKey)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseKey")
  elseif (option == oidLoseSoulgem)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseSoulgem")
  elseif (option == oidLosePotion)
    SetInfoText("$mrt_MarkofArkay_DESC_LosePotion")
  elseif (option == oidLoseScroll)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseScroll")
  elseif (option == oidLoseIngredient)
    SetInfoText("$mrt_MarkofArkay_DESC_LoseIngredient")
  elseif (option == oidCheckKeyword)
    SetInfoText("$mrt_MarkofArkay_DESC_CheckKeyword")
  elseif (option == oidCheckWeight)
    SetInfoText("$mrt_MarkofArkay_DESC_CheckWeight")
  elseif (option == oidLevelReduce)
    SetInfoText("$mrt_MarkofArkay_DESC_LevelReduce")
  elseif (option == oidOnlyLoseSkillXP)
    SetInfoText("$mrt_MarkofArkay_DESC_OnlyLoseSkillXP")
  elseif (option == oidLostItemsInfo)
    SetInfoText("$mrt_MarkofArkay_DESC_LostItemsInfo")
  elseif (option == oidLostSkillsInfo)
    SetInfoText("$mrt_MarkofArkay_DESC_LostSkillsInfo")
  elseif (option == oidTotalCustomRPSlotSlider)
    SetInfoText("$mrt_MarkofArkay_DESC_TotalCustomRPSlotSlider")
  elseif (option == oidSelectedCustomRPSlot_M)
    SetInfoText("$mrt_MarkofArkay_DESC_SelectedCustomRPSlot_M")
  elseif (option == oidExtraTeleportLocation_M)
    SetInfoText("$mrt_MarkofArkay_DESC_ExtraTeleportLocation_M")
  elseif (option == oidSpawnBringAllies)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnBringAllies")
  elseif (option == oidSpawnHostile)
    SetInfoText("$mrt_MarkofArkay_DESC_SpawnHostile")
  elseif (option == oidBossChestOnlyCurLoc)
    SetInfoText("$mrt_MarkofArkay_DESC_BossChestOnlyCurLoc")
  elseif (option == oidBossChestNotClearedLoc)
    SetInfoText("$mrt_MarkofArkay_DESC_BossChestNotClearedLoc")
  elseif (option == oidOnlyEnslavedByEnemyFaction)
    SetInfoText("$mrt_MarkofArkay_DESC_OnlyEnslavedByEnemyFaction")
  elseif (option == oidSlaveryOnlyAfterRape)
    SetInfoText("$mrt_MarkofArkay_DESC_SlaveryOnlyAfterRape")
  elseif (option == oidOnlyHostilesRape)
    SetInfoText("$mrt_MarkofArkay_DESC_OnlyHostilesRape")
  elseif (option == oidAlwaysSpawn)
    SetInfoText("$mrt_MarkofArkay_DESC_AlwaysSpawn")
  elseif (option == oidOnlySpawn)
    SetInfoText("$mrt_MarkofArkay_DESC_OnlySpawn")
  elseif (option == oidOnlyInfectIfHasBaseDis)
    SetInfoText("$mrt_MarkofArkay_DESC_OnlyInfectIfHasBaseDis")
  elseif (option == oidSoulMarkCureDiseases)
    SetInfoText("$mrt_MarkofArkay_DESC_SoulMarkCureDiseases")
  elseif (option == oidCureDisIfHasBlessing)
    SetInfoText("$mrt_MarkofArkay_DESC_CureDisIfHasBlessing")
  elseif (option == oidTradeLock)
    SetInfoText("$mrt_MarkofArkay_DESC_TradeLock")
  elseif (option == oidCurseLock)
    SetInfoText("$mrt_MarkofArkay_DESC_CurseLock")
  elseif (option == oidMarkRecallCostLock)
    SetInfoText("$mrt_MarkofArkay_DESC_MarkRecallCostLock")
  elseif (option == oidLootChanceLock)
    SetInfoText("$mrt_MarkofArkay_DESC_LootChanceLock")
  elseif (option == oidLockPermaDeath)
    SetInfoText("$mrt_MarkofArkay_DESC_LockDeath")
  elseif (option == oidSaveLock)
    SetInfoText("$mrt_MarkofArkay_DESC_SaveLock")
  endif
endevent

event OnOptionMenuAccept(Int option, Int index)
  if (option == oidTeleportLocation_M)
    iTeleportLocation = index
    _SetMenuOptionValue(oidTeleportLocation_M, sRespawnPoints[iTeleportLocation])
    ForcePageReset()
  elseif (option == oidTavern_M)
    iTavernIndex = index
    _SetMenuOptionValue(oidTavern_M, sTaverns[iTavernIndex])
    ForcePageReset()
  elseif (option == oidNoTradingAftermath_M)
    iNotTradingAftermath = index
    _SetMenuOptionValue(oidNoTradingAftermath_M, sGetAftermathOptions()[iNotTradingAftermath])
    ForcePageReset()
  elseif (option == oidArkayCurses_M)
    iArkayCurse = index
    _SetMenuOptionValue(oidArkayCurses_M, sGetArkayCurses()[iArkayCurse])
  elseif (option == oidSelectedCustomRPSlot_M)
    iSelectedCustomRPSlot = index
    SetCustomRPFlags()
    _SetMenuOptionValue(oidSelectedCustomRPSlot_M, shortenString(sCustomRPs[iSelectedCustomRPSlot], 19))
  elseif (option == oidExtraTeleportLocation_M)
    iExternalIndex = index
    _SetMenuOptionValue(oidExtraTeleportLocation_M, shortenString(sExtraRPs[iExternalIndex], 19))
  elseif (option == oidEnableSave_M)
    iSaveOption = index
    SetSavingOption(iSaveOption)
    _SetMenuOptionValue(oidEnableSave_M, sGetSaveOptions()[iSaveOption])
  elseif (option == oidLoadPreset_M)
    iLoadPreset = index
    _SetMenuOptionValue(oidLoadPreset_M, sGetPresets()[iLoadPreset])
  elseif (option == oidSavePreset_M)
    iSavePreset = index
    _SetMenuOptionValue(oidSavePreset_M, sGetPresets()[iSavePreset])
  elseif (option == oidGhostShader)
    iGhostShader = index
    moaGhostShader.SetValueInt(iGhostShader)
    _SetMenuOptionValue(oidGhostShader, sGetGhostShader()[iGhostShader])
  elseif (option == oidEquipInclude_M)
    iLoseInclusion = index
    _SetMenuOptionValue(oidEquipInclude_M, sGetLoseInclusions()[iLoseInclusion])
    ForcePageReset()
  elseif (option == oidRapistGender_M)
    iRapistGender = index
    _SetMenuOptionValue(oidRapistGender_M, sGetGenders()[iRapistGender])
    ForcePageReset()
  elseif (option == oidSexInterface_M)
    iSexInterface = index
    _SetMenuOptionValue(oidSexInterface_M, sGetSexInterface()[iSexInterface])
    ForcePageReset()
  elseif (option == oidHostileOptions_M)
    iHostileOption = index
    _SetMenuOptionValue(oidHostileOptions_M, sGetHostileOptions()[iHostileOption])
    ForcePageReset()
  elseif (option == oidSpawns_M)
    iSpawn = index
    _SetMenuOptionValue(oidSpawns_M, sGetSpawns()[iSpawn])
    ForcePageReset()
  elseif (option == oidSpawnMinLevel_M)
    iSpawnMinLevel = index
    _SetMenuOptionValue(oidSpawnMinLevel_M, sGetSpawnLevels()[iSpawnMinLevel])
  elseif (option == oidSpawnMaxLevel_M)
    iSpawnMaxLevel = index
    _SetMenuOptionValue(oidSpawnMaxLevel_M, sGetSpawnLevels()[iSpawnMaxLevel])
  elseif (option == oidSkillReduce_M)
    iReducedSkill = index
    _SetMenuOptionValue(oidSkillReduce_M, sGetSkills()[iReducedSkill])
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0)
      flags = OPTION_FLAG_NONE
      _SetOptionFlags(oidOnlyLoseSkillXP, flags, True)
      if bOnlyLoseSkillXP
        _SetOptionFlags(oidLevelReduce, flags, True)
        _SetOptionFlags(oidSkillReduceRandomVal, flags, True)

        ;If bDLIEOK
        ;	flags =	OPTION_FLAG_NONE
        ;Else
        ;	flags =	OPTION_FLAG_DISABLED
        ;EndIf
        ;_SetOptionFlags(oidLoseSkillForever,flags,True)
        if !bSkillReduceRandomVal
          flags = OPTION_FLAG_NONE
        else
          flags = OPTION_FLAG_DISABLED
        endif
        _SetOptionFlags(oidSkillReduceValSlider, flags, True)
        if bSkillReduceRandomVal
          flags = OPTION_FLAG_NONE
        else
          flags = OPTION_FLAG_DISABLED
        endif
        _SetOptionFlags(oidSkillReduceMinValSlider, flags, True)
        _SetOptionFlags(oidSkillReduceMaxValSlider, flags)
      endif
    else
      flags = OPTION_FLAG_DISABLED
      _SetOptionFlags(oidLevelReduce, flags, True)
      _SetOptionFlags(oidOnlyLoseSkillXP, flags, True)

      ;_SetOptionFlags(oidLoseSkillForever,flags,True)
      _SetOptionFlags(oidSkillReduceRandomVal, flags, True)
      _SetOptionFlags(oidSkillReduceValSlider, flags, True)
      _SetOptionFlags(oidSkillReduceMinValSlider, flags, True)
      _SetOptionFlags(oidSkillReduceMaxValSlider, flags)
    endif
    ForcePageReset()
  endif
endevent

event OnOptionMenuOpen(Int option)
  if (option == oidTeleportLocation_M)
    SetMenuDialogoptions(sRespawnPoints)
    SetMenuDialogStartIndex(iTeleportLocation)
    SetMenuDialogDefaultIndex(14)
  elseif (option == oidTavern_M)
    SetMenuDialogoptions(sTaverns)
    SetMenuDialogStartIndex(iTavernIndex)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidNoTradingAftermath_M)
    SetMenuDialogoptions(sGetAftermathOptions())
    SetMenuDialogStartIndex(iNotTradingAftermath)
    SetMenuDialogDefaultIndex(1)
  elseif (option == oidArkayCurses_M)
    SetMenuDialogoptions(sGetArkayCurses())
    SetMenuDialogStartIndex(iArkayCurse)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidEnableSave_M)
    SetMenuDialogoptions(sGetSaveOptions())
    SetMenuDialogStartIndex(iSaveOption)
    SetMenuDialogDefaultIndex(1)
  elseif (option == oidLoadPreset_M)
    SetMenuDialogoptions(sGetPresets())
    SetMenuDialogStartIndex(iLoadPreset)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSavePreset_M)
    SetMenuDialogoptions(sGetPresets())
    SetMenuDialogStartIndex(iSavePreset)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidGhostShader)
    SetMenuDialogoptions(sGetGhostShader())
    SetMenuDialogStartIndex(iGhostShader)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSkillReduce_M)
    SetMenuDialogoptions(sGetSkills())
    SetMenuDialogStartIndex(iReducedSkill)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidEquipInclude_M)
    SetMenuDialogoptions(sGetLoseInclusions())
    SetMenuDialogStartIndex(iLoseInclusion)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidRapistGender_M)
    SetMenuDialogoptions(sGetGenders())
    SetMenuDialogStartIndex(iRapistGender)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSexInterface_M)
    SetMenuDialogoptions(sGetSexInterface())
    SetMenuDialogStartIndex(iSexInterface)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSelectedCustomRPSlot_M)
    SetMenuDialogoptions(sCustomRPs)
    SetMenuDialogStartIndex(iSelectedCustomRPSlot)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidExtraTeleportLocation_M)
    SetMenuDialogoptions(sExtraRPs)
    SetMenuDialogStartIndex(iExternalIndex)
    SetMenuDialogDefaultIndex(moaERPCount.GetValueInt())
  elseif (option == oidHostileOptions_M)
    SetMenuDialogoptions(sGetHostileOptions())
    SetMenuDialogStartIndex(iHostileOption)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSpawns_M)
    SetMenuDialogoptions(sGetSpawns())
    SetMenuDialogStartIndex(iSpawn)
    SetMenuDialogDefaultIndex(0)
  elseif (option == oidSpawnMinLevel_M)
    SetMenuDialogoptions(sGetSpawnLevels())
    SetMenuDialogStartIndex(iSpawnMinLevel)
    SetMenuDialogDefaultIndex(4)
  elseif (option == oidSpawnMaxLevel_M)
    SetMenuDialogoptions(sGetSpawnLevels())
    SetMenuDialogStartIndex(iSpawnMaxLevel)
    SetMenuDialogDefaultIndex(4)
  endif
endevent

event OnOptionSelect(Int option)
  string page = CurrentPage
  if (option == oidRevivalEnabled)
    bIsRevivalEnabled = !bIsRevivalEnabled
    _SetToggleOptionValue(oidRevivalEnabled, bIsRevivalEnabled)
    ForcePageReset()
  elseif (option == oidMenuEnabled)
    bIsMenuEnabled = !bIsMenuEnabled
    _SetToggleOptionValue(oidMenuEnabled, bIsMenuEnabled)
    if (bIsRevivalEnabled) && (!bIsMenuEnabled)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidMarkPSlider, flags, True)
    _SetOptionFlags(oidDragonSoulPSlider, flags, True)
    _SetOptionFlags(oidBSoulGemPSlider, flags, True)
    _SetOptionFlags(oidGSoulGemPSlider, flags, True)
    _SetOptionFlags(oidGoldPSlider, flags)
  elseif (option == oidMarkOfArkayRevivalEnabled)
    bIsMarkEnabled = !bIsMarkEnabled
    _SetToggleOptionValue(oidMarkOfArkayRevivalEnabled, bIsMarkEnabled)
  elseif (option == oidDragonSoulRevivalEnabled)
    bIsDragonSoulEnabled = !bIsDragonSoulEnabled
    _SetToggleOptionValue(oidDragonSoulRevivalEnabled, bIsDragonSoulEnabled)
  elseif (option == oidBSoulGemRevivalEnabled)
    bIsBSoulGemEnabled = !bIsBSoulGemEnabled
    _SetToggleOptionValue(oidBSoulGemRevivalEnabled, bIsBSoulGemEnabled)
  elseif (option == oidGSoulGemRevivalEnabled)
    bIsGSoulGemEnabled = !bIsGSoulGemEnabled
    _SetToggleOptionValue(oidGSoulGemRevivalEnabled, bIsGSoulGemEnabled)
  elseif (option == oidTradeEnabled)
    bIsTradeEnabled = !bIsTradeEnabled
    _SetToggleOptionValue(oidTradeEnabled, bIsTradeEnabled)
  elseif (option == oidTriggerOnBleedout)
    if !bTriggerOnBleedout && self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
      moaIsBusy.SetValueInt(1)
      bTriggerOnBleedout = True
      bTriggerOnHealthPerc = False
      ForceCloseMenu()
      setTriggerMethod(1)
      moaIsBusy.SetValueInt(0)
    endif
  elseif (option == oidTriggerOnHealthPerc)
    if !bTriggerOnHealthPerc && self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
      moaIsBusy.SetValueInt(1)
      bTriggerOnBleedout = False
      bTriggerOnHealthPerc = True
      ForceCloseMenu()
      SetTriggerMethod(2)
      moaIsBusy.SetValueInt(0)
    endif
  elseif (option == oidTradeLock)
    if !bTradeLock && self._ShowMessage("$Are_You_Sure_Lock_Trade", True, "$Yes", "$No")
      bTradeLock = True
      ForcePageReset()
    endif
  elseif (option == oidCurseLock)
    if !bCurseLock && self._ShowMessage("$Are_You_Sure_Lock_Curse", True, "$Yes", "$No")
      bCurseLock = True
      ForcePageReset()
    endif
  elseif (option == oidMarkRecallCostLock)
    if !bMarkRecallCostLock && self._ShowMessage("$Are_You_Sure_Lock_MarkRecallCost", True, "$Yes", "$No")
      bMarkRecallCostLock = True
      ForcePageReset()
    endif
  elseif (option == oidLootChanceLock)
    if !bLootChanceLock && self._ShowMessage("$Are_You_Sure_Lock_LootChance", True, "$Yes", "$No")
      bLootChanceLock = True
      ForcePageReset()
    endif
  elseif (option == oidLockPermaDeath)
    if !bLockPermaDeath && self._ShowMessage("$Are_You_Sure_Lock_Death", True, "$Yes", "$No")
      bLockPermaDeath = True
      bCanbeKilledbyUnarmed = False
      bKillIfCantRespawn = False
      ForcePageReset()
    endif
  elseif (option == oidSaveLock)
    if !bSaveLock && self._ShowMessage("$Are_You_Sure_Lock_SaveLock", True, "$Yes", "$No")
      bSaveLock = True
      ForcePageReset()
    endif
  elseif (option == oidGoldRevivalEnabled)
    bIsGoldEnabled = !bIsGoldEnabled
    _SetToggleOptionValue(oidGoldRevivalEnabled, bIsGoldEnabled)
  elseif (option == oidFollowerProtectPlayer)
    bFollowerProtectPlayer = !bFollowerProtectPlayer
    _SetToggleOptionValue(oidFollowerProtectPlayer, bFollowerProtectPlayer)
  elseif (option == oidPlayerProtectFollower)
    bPlayerProtectFollower = !bPlayerProtectFollower
    _SetToggleOptionValue(oidPlayerProtectFollower, bPlayerProtectFollower)
  elseif (option == oidSpawnByLocation)
    bSpawnByLocation = !bSpawnByLocation
    _SetToggleOptionValue(oidSpawnByLocation, bSpawnByLocation)
    ForcePageReset()
  elseif (option == oidRetrySpawnWithoutLocation)
    bRetrySpawnWithoutLocation = !bRetrySpawnWithoutLocation
    _SetToggleOptionValue(oidRetrySpawnWithoutLocation, bRetrySpawnWithoutLocation)
  elseif (option == oidSpawnCheckRelation)
    bSpawnCheckRelation = !bSpawnCheckRelation
    _SetToggleOptionValue(oidSpawnCheckRelation, bSpawnCheckRelation)
  elseif (option == oidSpawnBringAllies)
    bSpawnBringAllies = !bSpawnBringAllies
    _SetToggleOptionValue(oidSpawnBringAllies, bSpawnBringAllies)
  elseif (option == oidNotification)
    bIsNotificationEnabled = !bIsNotificationEnabled
    _SetToggleOptionValue(oidNotification, bIsNotificationEnabled)
  elseif (option == oidFadeToBlack)
    bFadeToBlack = !bFadeToBlack
    _SetToggleOptionValue(oidFadeToBlack, bFadeToBlack)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
    if !bFadeToBlack
      ReviveScript.Fadeout.Remove()
      ReviveScript.FastFadeOut.Remove()
      ReviveScript.BlackScreen.Remove()
      ReviveScript.FadeIn.Remove()
    endif
  elseif (option == oidInvisibility)
    bInvisibility = !bInvisibility
    _SetToggleOptionValue(oidInvisibility, bInvisibility)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
    if !bInvisibility && !ReviveScript.moaPlayerGhostQuest.IsRunning()
      PlayerRef.SetAlpha(1.0)
    endif
  elseif (option == oidDeathEffect)
    bDeathEffect = !bDeathEffect
    _SetToggleOptionValue(oidDeathEffect, bDeathEffect)
  elseif (option == oidRagdollEffect)
    bIsRagdollEnabled = !bIsRagdollEnabled
    _SetToggleOptionValue(oidRagdollEffect, bIsRagdollEnabled)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidDeathEffect, flags)
  elseif (option == oidAltEyeFix)
    bAltEyeFix = !bAltEyeFix
    _SetToggleOptionValue(oidAltEyeFix, bAltEyeFix)
    if bAltEyeFix
      ForceCloseMenu()
      ReviveScript.ExecuteCommand("player.say 0142b5", 1, 0, 1)
    endif
  elseif (option == oidDisableUnsafe)
    bDisableUnsafe = !bDisableUnsafe
    if bDisableUnsafe
      fRespawnTimeSlider = 0.0
    endif
    _SetToggleOptionValue(oidDisableUnsafe, bDisableUnsafe)
    ForcePageReset()
  elseif (option == oidLogging)
    bIsLoggingEnabled = !bIsLoggingEnabled
    _SetToggleOptionValue(oidLogging, bIsLoggingEnabled)
  elseif (option == oidPotionRevivalEnabled)
    bIsPotionEnabled = !bIsPotionEnabled
    _SetToggleOptionValue(oidPotionRevivalEnabled, bIsPotionEnabled)
  elseif (option == oidAutoDrinkPotion)
    bAutoDrinkPotion = !bAutoDrinkPotion
    _SetToggleOptionValue(oidAutoDrinkPotion, bAutoDrinkPotion)
  elseif (option == oidNoFallDamageEnabled)
    ToggleFallDamage(!bIsNoFallDamageEnabled)
    _SetToggleOptionValue(oidNoFallDamageEnabled, bIsNoFallDamageEnabled)
  elseif (option == oidEffect)
    bIsEffectEnabled = !bIsEffectEnabled
    _SetToggleOptionValue(oidEffect, bIsEffectEnabled)
  elseif (option == oidRevivalRequireBlessing)
    bIsRevivalRequiresBlessing = !bIsRevivalRequiresBlessing
    _SetToggleOptionValue(oidRevivalRequireBlessing, bIsRevivalRequiresBlessing)
  elseif (option == oidRecallRestriction)
    bIsRecallRestricted = !bIsRecallRestricted
    _SetToggleOptionValue(oidRecallRestriction, bIsRecallRestricted)
  elseif (option == oidShiftBack)
    bShiftBack = !bShiftBack
    _SetToggleOptionValue(oidShiftBack, bShiftBack)
  elseif (option == oidShiftBackRespawn)
    bShiftBackRespawn = !bShiftBackRespawn
    _SetToggleOptionValue(oidShiftBackRespawn, bShiftBackRespawn)
  elseif (option == oidRespawnPoint0)
    bRespawnPointsFlags[0] = !bRespawnPointsFlags[0]
    _SetToggleOptionValue(oidRespawnPoint0, bRespawnPointsFlags[0])
  elseif (option == oidRespawnPoint1)
    bRespawnPointsFlags[1] = !bRespawnPointsFlags[1]
    _SetToggleOptionValue(oidRespawnPoint1, bRespawnPointsFlags[1])
  elseif (option == oidRespawnPoint2)
    bRespawnPointsFlags[2] = !bRespawnPointsFlags[2]
    _SetToggleOptionValue(oidRespawnPoint2, bRespawnPointsFlags[2])
  elseif (option == oidRespawnPoint3)
    bRespawnPointsFlags[3] = !bRespawnPointsFlags[3]
    _SetToggleOptionValue(oidRespawnPoint3, bRespawnPointsFlags[3])
  elseif (option == oidRespawnPoint4)
    bRespawnPointsFlags[4] = !bRespawnPointsFlags[4]
    _SetToggleOptionValue(oidRespawnPoint4, bRespawnPointsFlags[4])
  elseif (option == oidRespawnPoint5)
    bRespawnPointsFlags[5] = !bRespawnPointsFlags[5]
    _SetToggleOptionValue(oidRespawnPoint5, bRespawnPointsFlags[5])
  elseif (option == oidRespawnPoint6)
    bRespawnPointsFlags[6] = !bRespawnPointsFlags[6]
    _SetToggleOptionValue(oidRespawnPoint6, bRespawnPointsFlags[6])
  elseif (option == oidRespawnPoint7)
    bRespawnPointsFlags[7] = !bRespawnPointsFlags[7]
    _SetToggleOptionValue(oidRespawnPoint7, bRespawnPointsFlags[7])
  elseif (option == oidRespawnPoint8)
    bRespawnPointsFlags[8] = !bRespawnPointsFlags[8]
    _SetToggleOptionValue(oidRespawnPoint8, bRespawnPointsFlags[8])
  elseif (option == oidRespawnPoint9)
    bRespawnPointsFlags[9] = !bRespawnPointsFlags[9]
    _SetToggleOptionValue(oidRespawnPoint9, bRespawnPointsFlags[9])
  elseif (option == oidRespawnNaked)
    bRespawnNaked = !bRespawnNaked
    _SetToggleOptionValue(oidRespawnNaked, bRespawnNaked)
  elseif (option == oidCorpseAsSoulMark)
    bCorpseAsSoulMark = !bCorpseAsSoulMark
    _SetToggleOptionValue(oidCorpseAsSoulMark, bCorpseAsSoulMark)
  elseif (option == oidRespawnMenu)
    bRespawnMenu = !bRespawnMenu
    _SetToggleOptionValue(oidRespawnMenu, bRespawnMenu)
  elseif (option == oidTeleportMenu)
    bTeleportMenu = !bTeleportMenu
    _SetToggleOptionValue(oidTeleportMenu, bTeleportMenu)
  elseif (option == oidMultipleDis)
    bMultipleDis = !bMultipleDis
    _SetToggleOptionValue(oidMultipleDis, bMultipleDis)
  elseif (option == oidDiseaseCurse)
    bDiseaseCurse = !bDiseaseCurse
    _SetToggleOptionValue(oidDiseaseCurse, bDiseaseCurse)
    ForcePageReset()
  elseif (option == oidMultipleDisProg)
    bMultipleDisProg = !bMultipleDisProg
    _SetToggleOptionValue(oidMultipleDisProg, bMultipleDisProg)
  elseif (option == oidOnlyInfectIfHasBaseDis)
    bOnlyInfectIfHasBaseDis = !bOnlyInfectIfHasBaseDis
    _SetToggleOptionValue(oidOnlyInfectIfHasBaseDis, bOnlyInfectIfHasBaseDis)
  elseif (option == oidSoulMarkCureDiseases)
    bSoulMarkCureDiseases = !bSoulMarkCureDiseases
    _SetToggleOptionValue(oidSoulMarkCureDiseases, bSoulMarkCureDiseases)
  elseif (option == oidCureDisIfHasBlessing)
    bCureDisIfHasBlessing = !bCureDisIfHasBlessing
    moaCureDisIfHasBlessing.SetValue(bCureDisIfHasBlessing As Int)
    _SetToggleOptionValue(oidCureDisIfHasBlessing, bCureDisIfHasBlessing)
  elseif (option == oidJail)
    bSendToJail = !bSendToJail
    _SetToggleOptionValue(oidJail, bSendToJail)
  elseif (option == oidDoNotStopCombat)
    bDoNotStopCombat = !bDoNotStopCombat
    _SetToggleOptionValue(oidDoNotStopCombat, bDoNotStopCombat)
  elseif (option == oidDoNotStopCombatAfterRevival)
    bDoNotStopCombatAfterRevival = !bDoNotStopCombatAfterRevival
    _SetToggleOptionValue(oidDoNotStopCombatAfterRevival, bDoNotStopCombatAfterRevival)
  elseif (option == oidKillIfCantRespawn)
    bKillIfCantRespawn = !bKillIfCantRespawn
    _SetToggleOptionValue(oidKillIfCantRespawn, bKillIfCantRespawn)
  elseif (option == oidCanbeKilledbyUnarmed)
    bCanbeKilledbyUnarmed = !bCanbeKilledbyUnarmed
    _SetToggleOptionValue(oidCanbeKilledbyUnarmed, bCanbeKilledbyUnarmed)

    ;ElseIf (option == oidLoseSkillForever)
    ;	bLoseSkillForever = !bLoseSkillForever
    ;	_SetToggleOptionValue(oidLoseSkillForever, bLoseSkillForever)
  elseif (option == oidHealActors)
    bHealActors = !bHealActors
    _SetToggleOptionValue(oidHealActors, bHealActors)
  elseif (option == oidResurrectActors)
    bResurrectActors = !bResurrectActors
    _SetToggleOptionValue(oidResurrectActors, bResurrectActors)
  elseif (option == oidShowRaceMenu)
    bShowRaceMenu = !bShowRaceMenu
    _SetToggleOptionValue(oidShowRaceMenu, bShowRaceMenu)
  elseif (option == oidArkayCurse)
    bArkayCurse = !bArkayCurse
    _SetToggleOptionValue(oidArkayCurse, bArkayCurse)
    if (bIsRevivalEnabled) && (iNotTradingAftermath == 1) && (bArkayCurse)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidArkayCurses_M, flags, True)
    _SetOptionFlags(oidTempArkayCurse, flags)
  elseif (option == oidTempArkayCurse)
    bIsArkayCurseTemporary = !bIsArkayCurseTemporary
    _SetToggleOptionValue(oidTempArkayCurse, bIsArkayCurseTemporary)
  elseif (Option == oidSkillReduceRandomVal)
    bSkillReduceRandomVal = !bSkillReduceRandomVal
    _SetToggleOptionValue(oidSkillReduceRandomVal, bSkillReduceRandomVal)
    if (bIsRevivalEnabled) && (iNotTradingAftermath == 1) && (iReducedSkill != 0 && !bSkillReduceRandomVal)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidSkillReduceValSlider, flags, True)
    if (bIsRevivalEnabled) && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && bSkillReduceRandomVal
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    _SetOptionFlags(oidSkillReduceMinValSlider, flags, True)
    _SetOptionFlags(oidSkillReduceMaxValSlider, flags)
  elseif (option == oidLevelReduce)
    bLevelReduce = !bLevelReduce
    _SetToggleOptionValue(oidLevelReduce, bLevelReduce)

    ;If bLevelReduce
    ;	ReviveScript.SkillScript.RegisterForLevel()
    ;EndIf
  elseif (option == oidOnlyLoseSkillXP)
    bOnlyLoseSkillXP = !bOnlyLoseSkillXP
    _SetToggleOptionValue(oidOnlyLoseSkillXP, bOnlyLoseSkillXP)
    ForcePageReset()
  elseif (option == oidLoseforever)
    bLoseForever = !bLoseForever
    _SetToggleOptionValue(oidLoseforever, bLoseForever)
  elseif (option == oidVoicelessCurse)
    bVoicelessCurse = !bVoicelessCurse
    _SetToggleOptionValue(oidVoicelessCurse, bVoicelessCurse)
  elseif (option == oidGhostCurse)
    bGhostCurse = !bGhostCurse
    _SetToggleOptionValue(oidGhostCurse, bGhostCurse)
    ForcePageReset()
  elseif (option == oidLiteGhostCurse)
    bLiteGhostCurse = !bLiteGhostCurse
    _SetToggleOptionValue(oidLiteGhostCurse, bLiteGhostCurse)
  elseif (option == oidLostItemQuest)
    bLostItemQuest = !bLostItemQuest
    _SetToggleOptionValue(oidLostItemQuest, bLostItemQuest)
    if bLostItemQuest
      if ((LostItemsChest.GetNumItems() > 0) || (ReviveScript.ItemScript.fLostSouls > 0.0) || PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) || ReviveScript.SkillScript.bSkillReduced())
        if (ReviveScript.bSoulMark())
          if ReviveScript.moaSoulMark01.IsRunning()
            moaRetrieveLostItems.start()
            moaRetrieveLostItems.SetStage(1)
          endif
        elseif ReviveScript.moaThiefNPC01.IsRunning()
          moaRetrieveLostItems01.start()
          moaRetrieveLostItems01.SetStage(1)
        endif
      endif
    else
      if moaRetrieveLostItems.IsRunning()
        moaRetrieveLostItems.SetStage(20)
      endif
      if moaRetrieveLostItems01.IsRunning()
        moaRetrieveLostItems01.SetStage(20)
      endif
      if ReviveScript.moaThiefNPC01.IsRunning()
        if (ReviveScript.ThiefNPC.GetReference() As Actor)
          (ReviveScript.ThiefNPC.GetReference() As Actor).AddToFaction(ReviveScript.PlayerEnemyFaction)
        endif
      endif
    endif
  elseif (option == oidAutoSwitchRP)
    bAutoSwitchRP = !bAutoSwitchRP
    _SetToggleOptionValue(oidAutoSwitchRP, bAutoSwitchRP)
  elseif (option == oidMoreRandomRespawn)
    bMoreRandomRespawn = !bMoreRandomRespawn
    _SetToggleOptionValue(oidMoreRandomRespawn, bMoreRandomRespawn)
  elseif (option == oidRandomItemCurse)
    bRandomItemCurse = !bRandomItemCurse
    _SetToggleOptionValue(oidRandomItemCurse, bRandomItemCurse)
  elseif (option == oidSoulMarkStay)
    bSoulMarkStay = !bSoulMarkStay
    _SetToggleOptionValue(oidSoulMarkStay, bSoulMarkStay)
  elseif (option == oidCreaturesCanSteal)
    bCreaturesCanSteal = !bCreaturesCanSteal
    moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
    _SetToggleOptionValue(oidCreaturesCanSteal, bCreaturesCanSteal)
  elseif (option == oidNPCHasLevelRange)
    bNPCHasLevelRange = !bNPCHasLevelRange
    moaNPCHasLevelRange.SetValue(bNPCHasLevelRange As Int)
    _SetToggleOptionValue(oidNPCHasLevelRange, bNPCHasLevelRange)
    ForcePageReset()
  elseif (option == oidSpawnHostile)
    bSpawnHostile = !bSpawnHostile
    _SetToggleOptionValue(oidSpawnHostile, bSpawnHostile)
    ForcePageReset()
  elseif (option == oidBossChestOnlyCurLoc)
    bBossChestOnlyCurLoc = !bBossChestOnlyCurLoc
    moaOnlyInCurLocChest.SetValueInt(bBossChestOnlyCurLoc As Int)
    _SetToggleOptionValue(oidBossChestOnlyCurLoc, bBossChestOnlyCurLoc)
  elseif (option == oidBossChestNotClearedLoc)
    bBossChestNotInClearedLoc = !bBossChestNotInClearedLoc
    moaBossChestNotInclearedLoc.SetValueInt(bBossChestNotInClearedLoc As Int)
    _SetToggleOptionValue(oidBossChestNotClearedLoc, bBossChestNotInClearedLoc)
  elseif (option == oidOnlyEnslavedByEnemyFaction)
    bOnlyEnslavedByEnemyFaction = !bOnlyEnslavedByEnemyFaction
    _SetToggleOptionValue(oidOnlyEnslavedByEnemyFaction, bOnlyEnslavedByEnemyFaction)
  elseif (option == oidSlaveryOnlyAfterRape)
    bSlaveryOnlyAfterRape = !bSlaveryOnlyAfterRape
    _SetToggleOptionValue(oidSlaveryOnlyAfterRape, bSlaveryOnlyAfterRape)
  elseif (option == oidOnlyHostilesRape)
    bOnlyHostilesRape = !bOnlyHostilesRape
    _SetToggleOptionValue(oidOnlyHostilesRape, bOnlyHostilesRape)
  elseif (option == oidAlwaysSpawn)
    bAlwaysSpawn = !bAlwaysSpawn
    _SetToggleOptionValue(oidAlwaysSpawn, bAlwaysSpawn)
  elseif (option == oidOnlySpawn)
    bOnlySpawn = !bOnlySpawn
    _SetToggleOptionValue(oidOnlySpawn, bOnlySpawn)
  elseif (option == oidMoralityMatters)
    bMoralityMatters = !bMoralityMatters
    moaMoralityMatters.SetValue(bMoralityMatters As Int)
    _SetToggleOptionValue(oidMoralityMatters, bMoralityMatters)
  elseif (option == oidLoseItem)
    bLoseItem = !bLoseItem
    _SetToggleOptionValue(oidLoseItem, bLoseItem)
    ForcePageReset()
  elseif (option == oidLoseOthers)
    bLoseOthers = !bLoseOthers
    _SetToggleOptionValue(oidLoseOthers, bLoseOthers)
    ForcePageReset()
  elseif (option == oidLoseAmmo)
    bLoseAmmo = !bLoseAmmo
    iValidTypes[6] = iGetType(42, bLoseAmmo)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseAmmo, bLoseAmmo)
    ForcePageReset()
  elseif (option == oidCheckKeyword)
    bCheckKeyword = !bCheckKeyword
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidCheckKeyword, bCheckKeyword)
    ForcePageReset()
  elseif (option == oidExcludeQuestItems)
    bExcludeQuestItems = !bExcludeQuestItems
    _SetToggleOptionValue(oidExcludeQuestItems, bExcludeQuestItems)
  elseif (option == oidCheckWeight)
    bCheckWeight = !bCheckWeight
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidCheckWeight, bCheckWeight)
    ForcePageReset()
  elseif (option == oidLoseArkayMark)
    bLoseArkayMark = !bLoseArkayMark
    _SetToggleOptionValue(oidLoseArkayMark, bLoseArkayMark)
    ForcePageReset()
  elseif (option == oidLoseBlackSoulGem)
    bLoseBlackSoulGem = !bLoseBlackSoulGem
    _SetToggleOptionValue(oidLoseBlackSoulGem, bLoseBlackSoulGem)
    ForcePageReset()
  elseif (option == oidLoseGrandSoulGem)
    bLoseGrandSoulGem = !bLoseGrandSoulGem
    _SetToggleOptionValue(oidLoseGrandSoulGem, bLoseGrandSoulGem)
    ForcePageReset()
  elseif (option == oidLoseGold)
    bLoseGold = !bLoseGold
    _SetToggleOptionValue(oidLoseGold, bLoseGold)
    ForcePageReset()
  elseif (option == oidLoseDragonSoul)
    bLoseDragonSoul = !bLoseDragonSoul
    _SetToggleOptionValue(oidLoseDragonSoul, bLoseDragonSoul)
    ForcePageReset()
  elseif (option == oidLoseScroll)
    bLoseScroll = !bLoseScroll
    iValidTypes[0] = iGetType(23, bLoseScroll)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseScroll, bLoseScroll)
    ForcePageReset()
  elseif (option == oidLoseBook)
    bLoseBook = !bLoseBook
    iValidTypes[2] = iGetType(27, bLoseBook)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseBook, bLoseBook)
    ForcePageReset()
  elseif (option == oidLoseMisc)
    bLoseMisc = !bLoseMisc
    iValidTypes[4] = iGetType(32, bLoseMisc)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseMisc, bLoseMisc)
    ForcePageReset()
  elseif (option == oidLoseKey)
    bLoseKey = !bLoseKey
    iValidTypes[7] = iGetType(45, bLoseKey)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseKey, bLoseKey)
    ForcePageReset()
  elseif (option == oidLoseIngredient)
    bLoseIngredient = !bLoseIngredient
    iValidTypes[3] = iGetType(30, bLoseIngredient)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseIngredient, bLoseIngredient)
    ForcePageReset()
  elseif (option == oidLosePotion)
    bLosePotion = !bLosePotion
    iValidTypes[8] = iGetType(46, bLosePotion)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLosePotion, bLosePotion)
    ForcePageReset()
  elseif (option == oidLoseSoulgem)
    bLoseSoulgem = !bLoseSoulgem
    iValidTypes[9] = iGetType(52, bLoseSoulgem)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseSoulgem, bLoseSoulgem)
    ForcePageReset()
  elseif (option == oidLoseArmor)
    bLoseArmor = !bLoseArmor
    iValidTypes[1] = iGetType(26, bLoseArmor)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseArmor, bLoseArmor)
    ForcePageReset()
  elseif (option == oidLoseWeapon)
    bLoseWeapon = !bLoseWeapon
    iValidTypes[5] = iGetType(41, bLoseWeapon)
    revivescript.itemscript.resetChecked()
    _SetToggleOptionValue(oidLoseWeapon, bLoseWeapon)
    ForcePageReset()
  elseif (option == oidLoseGoldAll)
    bLoseGoldAll = !bLoseGoldAll
    _SetToggleOptionValue(oidLoseGoldAll, bLoseGoldAll)
    ForcePageReset()
  elseif (option == oidLoseDragonSoulAll)
    bLoseDragonSoulAll = !bLoseDragonSoulAll
    _SetToggleOptionValue(oidLoseDragonSoulAll, bLoseDragonSoulAll)
    ForcePageReset()
  elseif (option == oidLoseBlackSoulGemAll)
    bLoseBlackSoulGemAll = !bLoseBlackSoulGemAll
    _SetToggleOptionValue(oidLoseBlackSoulGemAll, bLoseBlackSoulGemAll)
    ForcePageReset()
  elseif (option == oidLoseGrandSoulGemAll)
    bLoseGrandSoulGemAll = !bLoseGrandSoulGemAll
    _SetToggleOptionValue(oidLoseGrandSoulGemAll, bLoseGrandSoulGemAll)
    ForcePageReset()
  elseif (option == oidLoseArkayMarkAll)
    bLoseArkayMarkAll = !bLoseArkayMarkAll
    _SetToggleOptionValue(oidLoseArkayMarkAll, bLoseArkayMarkAll)
    ForcePageReset()
  elseif (option == oidInformation)
    bIsInfoEnabled = !bIsInfoEnabled
    _SetToggleOptionValue(oidInformation, bIsInfoEnabled)
    ForcePageReset()
  elseif (option == oidLostItemsInfo)
    if !bUIEOK
      return
    endif
    ShowLostItems()
  elseif (option == oidLostSkillsInfo)
    if !bUIEOK
      return
    endif
    ShowLostSkills()
  elseif (option == oidTogglePowers)
    if (PlayerRef.HasSpell(RevivalPower) || PlayerRef.HasSpell(SacrificePower))
      PlayerRef.RemoveSpell(RevivalPower)
      PlayerRef.RemoveSpell(SacrificePower)
    else
      PlayerRef.AddSpell(RevivalPower)
      PlayerRef.AddSpell(SacrificePower)
    endif
    ForcePageReset()
  elseif (option == oidToggleSpells)
    if (PlayerRef.HasSpell(MoveCustomMarker) || PlayerRef.HasSpell(RecallMarker))
      PlayerRef.RemoveSpell(MoveCustomMarker)
      PlayerRef.RemoveSpell(RecallMarker)
    else
      PlayerRef.AddSpell(MoveCustomMarker)
      PlayerRef.AddSpell(RecallMarker)
    endif
    ForcePageReset()
  elseif (option == oidResetHistory)
    if sResetHistory == ""
      sResetHistory = "$Are_You_Sure"
      _SetTextOptionValue(option, sResetHistory)
    else
      sResetHistory = ""
      _SetTextOptionValue(option, sResetHistory)
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
    endif
  elseif (option == oidRestoreItems)
    if !self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
      return
    endif
    moaIsBusy.SetValueInt(1)
    ForceCloseMenu()
    ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
    if moaRetrieveLostItems.IsRunning()
      moaRetrieveLostItems.SetStage(20)
    endif
    if moaRetrieveLostItems01.IsRunning()
      moaRetrieveLostItems01.SetStage(20)
    endif
    moaIsBusy.SetValueInt(0)
  elseif (option == oidLoadPreset1)
    if !FISSFactory.getFISS()
      _ShowMessage("$mrt_MarkofArkay_MESG_FISS_Error", False, "$Accept")
      return
    endif
    String fName = "MarkofArkayUserSettings" + (iLoadPreset + 1) + ".xml"
    if _ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset", True, "$Yes", "$No")
      if bLoadUserSettings(fName)
        _ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset_Success", False, "$Accept")
      else
        _ShowMessage("$mrt_MarkofArkay_MESG_Load_Preset_Failure", False, "$Accept")
      endif
    endif
    ForcePageReset()
  elseif (option == oidSavePreset1)
    FISSInterface fiss = FISSFactory.getFISS()
    if !fiss
      _ShowMessage("$mrt_MarkofArkay_MESG_FISS_Error", False, "$Accept")
      return
    endif
    String fName = "MarkofArkayUserSettings" + (iSavePreset + 1) + ".xml"
    fiss.beginLoad(fName)
    if fiss.endLoad() == ""
      if !_ShowMessage("$mrt_MarkofArkay_MESG_Already_Preset", True, "$Yes", "$No")
        return
      endif
    else
      _ShowMessage("$mrt_MarkofArkay_MESG_Save_Preset", False, "$Accept")
    endif
    if bSaveUserSettings(fName)
      _ShowMessage("$mrt_MarkofArkay_MESG_Save_Preset_Success", False, "$Accept")
    else
      _ShowMessage("$mrt_MarkofArkay_MESG_Save_Preset_Failure", False, "$Accept")
    endif
    ForcePageReset()
  elseif (option == oidLoadDefaultPreset)
    if _ShowMessage("$mrt_MarkofArkay_MESG_Load_Default_Preset", True, "$Yes", "$No")
      LoadDefaultSettings()
      _ShowMessage("$mrt_MarkofArkay_MESG_Load_Default_Preset_Finish", False, "$Accept")
    endif
    ForcePageReset()
  elseif (option == oidStatus)
    if moaState.GetValue() == 1
      if !self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
        return
      endif
    endif
    moaIsBusy.SetValueInt(1)
    ForceCloseMenu()
    if moaState.getValue() == 1
      moaStop()
    else
      moaStart()
    endif
    Utility.Wait(1)
    moaIsBusy.SetValueInt(0)
  elseif (option == oidRespawnBlackListLocation)
    if PlayerRef.GetCurrentLocation() && !ReviveScript.LocationBlackList.HasForm(PlayerRef.GetCurrentLocation())
      if !self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
        return
      endif
      if ReviveScript.LocationBlackList2.Find(PlayerRef.GetCurrentLocation()) > -1 || (bPUOK && JsonUtil.FormListHas("/MarkofArkay/MOA_BlackLists", "LocationBlackList", PlayerRef.GetCurrentLocation()))
        ReviveScript.LocationBlackList2.RemoveAddedForm(PlayerRef.GetCurrentLocation())
        if bPUOK
          JsonUtil.FormListRemove("/MarkofArkay/MOA_BlackLists", "LocationBlackList", PlayerRef.GetCurrentLocation(), True)
        endif
      else
        ReviveScript.LocationBlackList2.AddForm(PlayerRef.GetCurrentLocation())
        if bPUOK
          JsonUtil.FormListAdd("/MarkofArkay/MOA_BlackLists", "LocationBlackList", PlayerRef.GetCurrentLocation(), False)
        endif
      endif
      if bPUOK
        JsonUtil.Save("/MarkofArkay/MOA_BlackLists")
      endif
      ForcePageReset()
    endif
  elseif (option == oidReset)
    if !self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
      return
    endif
    moaIsBusy.SetValueInt(1)
    ForceCloseMenu()
    moaStop(True)
    Utility.Wait(1)
    moaStart()
    moaIsBusy.SetValueInt(0)
  elseif (option == oidResetPlayer)
    if !self._ShowMessage("$Are_You_Sure", True, "$Yes", "$No")
      return
    endif
    moaIsBusy.SetValueInt(1)
    ForceCloseMenu()
    if moaState.GetValue() == 1
      if bTriggerOnBleedout
        setTriggerMethod(1)
      elseif bTriggerOnHealthPerc
        SetTriggerMethod(2)
      endif
      ReviveScript.RegisterForSleep()

      ;If bLevelReduce
      ;	ReviveScript.SkillScript.RegisterForLevel()
      ;EndIf
    else
      setTriggerMethod(0)
    endif
    if !ReviveScript.moaPlayerGhostQuest.IsRunning()
      PlayerRef.SetAlpha(1.0)
    endif
    PlayerRef.DispelSpell(ReviveScript.Bleed)
    PlayerRef.RemoveSpell(ReviveScript.Bleed)
    PlayerRef.ResetHealthAndLimbs()
    if PlayerRef.GetActorValue("paralysis")
      PlayerRef.SetActorValue("paralysis", 0)
      if PlayerRef.GetActorValue("paralysis")
        PlayerRef.ForceActorValue("paralysis", 0)
      endif
    endif
    ReviveScript.RefreshFace()
    if PlayerRef.IsSwimming()
      Debug.SendAnimationEvent(PlayerRef, "SwimStart")
    else
      Debug.SendAnimationEvent(PlayerRef, "SwimStop")
    endif
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
  endif
endevent

event OnOptionSliderAccept(int option, Float value)
  string page = CurrentPage
  if (option == oidDragonSoulSlider)
    fValueSoulSlider = value
    _SetSliderOptionValue(oidDragonSoulSlider, fValueSoulSlider, "$mrt_MarkofArkay_DragonSoulSlider_2")
  elseif (option == oidMarkSlider)
    fValueMarkSlider = value
    _SetSliderOptionValue(oidMarkSlider, fValueMarkSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidBSoulGemSlider)
    fValueBSoulGemSlider = value
    _SetSliderOptionValue(oidBSoulGemSlider, fValueBSoulGemSlider, "$mrt_MarkofArkay_BSoulGemSlider_2")
  elseif (option == oidGSoulGemSlider)
    fValueGSoulGemSlider = value
    _SetSliderOptionValue(oidGSoulGemSlider, fValueGSoulGemSlider, "$mrt_MarkofArkay_GSoulGemSlider_2")
  elseif (option == oidGoldSlider)
    fValueGoldSlider = value
    _SetSliderOptionValue(oidGoldSlider, fValueGoldSlider, "$mrt_MarkofArkay_GoldSlider_2")
  elseif (option == oidGoldPSlider)
    fGoldPSlider = value
    _SetSliderOptionValue(oidGoldPSlider, fGoldPSlider, "{0}")
  elseif (option == oidMarkPSlider)
    fMarkPSlider = value
    _SetSliderOptionValue(oidMarkPSlider, fMarkPSlider, "{0}")
  elseif (option == oidSnoozeSlider)
    fValueSnoozeSlider = value
    _SetSliderOptionValue(oidSnoozeSlider, fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
    if fValueSnoozeSlider > 0
      moaSnoozeState.SetValue(1.0)
    else
      moaSnoozeState.SetValue(0.0)
    endif
  elseif (option == oidDragonSoulPSlider)
    fDragonSoulPSlider = value
    _SetSliderOptionValue(oidDragonSoulPSlider, fDragonSoulPSlider, "{0}")
  elseif (option == oidBSoulGemPSlider)
    fBSoulgemPSlider = value
    _SetSliderOptionValue(oidBSoulGemPSlider, fBSoulgemPSlider, "{0}")
  elseif (option == oidGSoulGemPSlider)
    fGSoulgemPSlider = value
    _SetSliderOptionValue(oidGSoulGemPSlider, fGSoulgemPSlider, "{0}")
  elseif (option == oidRecoveryTime)
    fRecoveryTimeSlider = value
    _SetSliderOptionValue(oidRecoveryTime, fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
  elseif (option == oidSpawnCountSlider)
    iSpawnCounts[iSpawn] = value As Int
    _SetSliderOptionValue(oidSpawnCountSlider, iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2")
    ForcePageReset()
  elseif (option == oidSpawnWeightSlider)
    iSpawnWeights[iSpawn] = value As Int
    _SetSliderOptionValue(oidSpawnWeightSlider, iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2")
    ForcePageReset()
  elseif (option == oidRespawnTimeSlider)
    if value > 0.0 && bShowTimeScaleWarning
      if !Self._ShowMessage("$mrt_MarkofArkay_MESG_TimeScaleConfirm", True, "$Yes", "$No")
        value = 0.0
      else
        bShowTimeScaleWarning = False
      endif
    endif
    fRespawnTimeSlider = value
    _SetSliderOptionValue(oidRespawnTimeSlider, fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2")
  elseif (option == oidBleedoutTime)
    fBleedoutTimeSlider = value
    _SetSliderOptionValue(oidBleedoutTime, fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2")
  elseif (option == oidLootChanceSlider)
    fLootChanceSlider = value
    _SetSliderOptionValue(oidLootChanceSlider, fLootChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
    moaLootChance.SetValue(100.0 - fLootChanceSlider)
  elseif (option == oidScrollChanceSlider)
    fScrollChanceSlider = value
    _SetSliderOptionValue(oidScrollChanceSlider, fScrollChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2")
    moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
  elseif (option == oidRecallCost)
    fRecallCastSlider = value
    _SetSliderOptionValue(oidRecallCost, fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidMarkCost)
    fMarkCastSlider = value
    _SetSliderOptionValue(oidMarkCost, fMarkCastSlider, "$mrt_MarkofArkay_MarkSlider_2")
  elseif (option == oidRPMinDistanceSlider)
    fRPMinDistanceSlider = value
    moaRPMinDistance.SetValue(fRPMinDistanceSlider)
    _SetSliderOptionValue(oidRPMinDistanceSlider, fRPMinDistanceSlider, "{0}")
  elseif (option == oidDisChanceSlider)
    fDisChanceSlider = value
    _SetSliderOptionValue(oidDisChanceSlider, fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2")
  elseif (option == oidDisProgChanceSlider)
    fDisProgChanceSlider = value
    _SetSliderOptionValue(oidDisProgChanceSlider, fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2")
  elseif (option == oidDisPriceSlider)
    fDisPriceSlider = value
    recalcCursedDisCureCosts()
    _SetSliderOptionValue(oidDisPriceSlider, fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2")
  elseif (option == oidDisPriceMultSlider)
    fDisPriceMultSlider = value
    recalcCursedDisCureCosts()
    _SetSliderOptionValue(oidDisPriceMultSlider, fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2")
  elseif (option == oidMarkScaleSlider)
    fValueMarkScaleSlider = value
    _SetSliderOptionValue(oidMarkScaleSlider, fValueMarkScaleSlider, "$mrt_MarkofArkay_MarkScaleSlider_2")
  elseif (option == oidGSoulScaleGemSlider)
    fValueGSoulGemScaleSlider = value
    _SetSliderOptionValue(oidGSoulScaleGemSlider, fValueGSoulGemScaleSlider, "$mrt_MarkofArkay_GSoulGemScaleSlider_2")
  elseif (option == oidBSoulScaleGemSlider)
    fValueBSoulGemScaleSlider = value
    _SetSliderOptionValue(oidBSoulScaleGemSlider, fValueBSoulGemScaleSlider, "$mrt_MarkofArkay_BSoulGemScaleSlider_2")
  elseif (option == oidDragonScaleSoulSlider)
    fValueSoulScaleSlider = value
    _SetSliderOptionValue(oidDragonScaleSoulSlider, fValueSoulScaleSlider, "$mrt_MarkofArkay_DragonSoulScaleSlider_2")
  elseif (option == oidGoldScaleSlider)
    fValueGoldScaleSlider = value
    _SetSliderOptionValue(oidGoldScaleSlider, fValueGoldScaleSlider, "$mrt_MarkofArkay_GoldScaleSlider_2")
  elseif (option == oidSkillReduceValSlider)
    fSkillReduceValSlider = value
    _SetSliderOptionValue(oidSkillReduceValSlider, fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2")
  elseif (option == oidSkillReduceMaxValSlider)
    fSkillReduceMaxValSlider = value
    _SetSliderOptionValue(oidSkillReduceMaxValSlider, fSkillReduceMaxValSlider, "{0}")
  elseif (option == oidSkillReduceMinValSlider)
    fSkillReduceMinValSlider = value
    _SetSliderOptionValue(oidSkillReduceMinValSlider, fSkillReduceMinValSlider, "{0}")
  elseif (option == oidMinLoseGoldSlider)
    fMinLoseGoldSlider = value
    _SetSliderOptionValue(oidMinLoseGoldSlider, fMinLoseGoldSlider, "{0}")
  elseif (option == oidMaxLoseGoldSlider)
    fMaxLoseGoldSlider = value
    _SetSliderOptionValue(oidMaxLoseGoldSlider, fMaxLoseGoldSlider, "{0}")
  elseif (option == oidMinLoseDragonSoulSlider)
    fMinLoseDragonSoulSlider = value
    _SetSliderOptionValue(oidMinLoseDragonSoulSlider, fMinLoseDragonSoulSlider, "{0}")
  elseif (option == oidMaxLoseDragonSoulSlider)
    fMaxLoseDragonSoulSlider = value
    _SetSliderOptionValue(oidMaxLoseDragonSoulSlider, fMaxLoseDragonSoulSlider, "{0}")
  elseif (option == oidMinLoseBlackSoulGemSlider)
    fMinLoseBlackSoulGemSlider = value
    _SetSliderOptionValue(oidMinLoseBlackSoulGemSlider, fMinLoseBlackSoulGemSlider, "{0}")
  elseif (option == oidMaxLoseBlackSoulGemSlider)
    fMaxLoseBlackSoulGemSlider = value
    _SetSliderOptionValue(oidMaxLoseBlackSoulGemSlider, fMaxLoseBlackSoulGemSlider, "{0}")
  elseif (option == oidMinLoseGrandSoulGemSlider)
    fMinLoseGrandSoulGemSlider = value
    _SetSliderOptionValue(oidMinLoseGrandSoulGemSlider, fMinLoseGrandSoulGemSlider, "{0}")
  elseif (option == oidMaxLoseGrandSoulGemSlider)
    fMaxLoseGrandSoulGemSlider = value
    _SetSliderOptionValue(oidMaxLoseGrandSoulGemSlider, fMaxLoseGrandSoulGemSlider, "{0}")
  elseif (option == oidMinLoseArkayMarkSlider)
    fMinLoseArkayMarkSlider = value
    _SetSliderOptionValue(oidMinLoseArkayMarkSlider, fMinLoseArkayMarkSlider, "{0}")
  elseif (option == oidMaxLoseArkayMarkSlider)
    fMaxLoseArkayMarkSlider = value
    _SetSliderOptionValue(oidMaxLoseArkayMarkSlider, fMaxLoseArkayMarkSlider, "{0}")
  elseif (option == oidLoseOtherMinValueSlider)
    fLoseOtherMinValueSlider = value
    _SetSliderOptionValue(oidLoseOtherMinValueSlider, fLoseOtherMinValueSlider, "{0}")
  elseif (option == oidLoseOtherTotalValueSlider)
    fLoseOtherTotalValueSlider = value
    _SetSliderOptionValue(oidLoseOtherTotalValueSlider, fLoseOtherTotalValueSlider, "{0}")
  elseif (option == oidMaxItemsToCheckSlider)
    fMaxItemsToCheckSlider = value
    _SetSliderOptionValue(oidMaxItemsToCheckSlider, fMaxItemsToCheckSlider, "{0}")
  elseif (option == oidLowerNPCMaxLvlDiff)
    fLowerNPCMaxLvlDiff = value
    _SetSliderOptionValue(oidLowerNPCMaxLvlDiff, fLowerNPCMaxLvlDiff, "{0}")
  elseif (option == oidHigherNPCMaxLvlDiff)
    fHigherNPCMaxLvlDiff = value
    _SetSliderOptionValue(oidHigherNPCMaxLvlDiff, fHigherNPCMaxLvlDiff, "{0}")
  elseif (option == oidRespawnCounter)
    if !Self._ShowMessage("$mrt_MarkofArkay_MESG_RespawnCounterConfirm", True, "$Yes", "$No")
      return
    endif
    fRespawnCounterSlider = value
    _SetSliderOptionValue(oidRespawnCounter, fRespawnCounterSlider, "$mrt_MarkofArkay_RespawnCounter2")
    bRespawnCounter = True
    bCanbeKilledbyUnarmed = False
    bKillIfCantRespawn = False
    ForcePageReset()
  elseif (option == oidBossChestChanceSlider)
    fBossChestChanceSlider = value
    _SetSliderOptionValue(oidBossChestChanceSlider, fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2")
    ForcePageReset()
  elseif (option == oidSimpleSlaveryChanceSlider)
    fSimpleSlaveryChanceSlider = value
    _SetSliderOptionValue(oidSimpleSlaveryChanceSlider, fSimpleSlaveryChanceSlider, "$mrt_MarkofArkay_SimpleSlaveryChanceSlider_2")
    ForcePageReset()
  elseif (option == oidRapeChanceSlider)
    fRapeChanceSlider = value
    _SetSliderOptionValue(oidRapeChanceSlider, fRapeChanceSlider, "$mrt_MarkofArkay_RapeChanceSlider_2")
    ForcePageReset()
  elseif (option == oidRapesMaxSlider)
    fMaxRapes = value
    _SetSliderOptionValue(oidRapesMaxSlider, fMaxRapes, "$mrt_MarkofArkay_RapesMaxSlider_2")
    ForcePageReset()
  elseif (option == oidRapistsMaxSlider)
    fMaxRapists = value
    _SetSliderOptionValue(oidRapistsMaxSlider, fMaxRapists, "$mrt_MarkofArkay_RapistsMaxSlider_2")
    ForcePageReset()
  elseif (option == oidTotalCustomRPSlotSlider)
    fTotalCustomRPSlotSlider = value
    SetCustomRPFlags()
    _SetSliderOptionValue(oidTotalCustomRPSlotSlider, fTotalCustomRPSlotSlider, "{0}")
  elseif (option == oidHealthTriggerSlider)
    fHealthPercTrigger = value / 100.0
    _SetSliderOptionValue(oidHealthTriggerSlider, value, "$mrt_MarkofArkay_HealthPercSlider_2")
  endif
endevent

event OnOptionSliderOpen(Int option)
  string page = CurrentPage
  if (option == oidDragonSoulSlider)
    SetSliderDialogStartValue(fValueSoulSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMarkSlider)
    SetSliderDialogStartValue(fValueMarkSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidBSoulGemSlider)
    SetSliderDialogStartValue(fValueBSoulGemSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidGSoulGemSlider)
    SetSliderDialogStartValue(fValueGSoulGemSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidGoldSlider)
    SetSliderDialogStartValue(fValueGoldSlider)
    SetSliderDialogDefaultValue(1000.0)
    SetSliderDialogRange(0.0, 100000.0)
    SetSliderDialogInterval(250.0)
  elseif (option == oidDragonSoulPSlider)
    SetSliderDialogStartValue(fDragonSoulPSlider)
    SetSliderDialogDefaultValue(3.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMarkPSlider)
    SetSliderDialogStartValue(fMarkPSlider)
    SetSliderDialogDefaultValue(5.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidBSoulGemPSlider)
    SetSliderDialogStartValue(fBSoulgemPSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidGSoulGemPSlider)
    SetSliderDialogStartValue(fGSoulgemPSlider)
    SetSliderDialogDefaultValue(2.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidGoldPSlider)
    SetSliderDialogStartValue(fGoldPSlider)
    SetSliderDialogDefaultValue(4.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRecoveryTime)
    SetSliderDialogStartValue(fRecoveryTimeSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 20.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidBleedoutTime)
    SetSliderDialogStartValue(fBleedoutTimeSlider)
    SetSliderDialogDefaultValue(6.0)
    SetSliderDialogRange(3.0, 20.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidLootChanceSlider)
    SetSliderDialogStartValue(fLootChanceSlider)
    SetSliderDialogDefaultValue(50.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidScrollChanceSlider)
    SetSliderDialogStartValue(fScrollChanceSlider)
    SetSliderDialogDefaultValue(25.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRecallCost)
    SetSliderDialogStartValue(fRecallCastSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMarkCost)
    SetSliderDialogStartValue(fMarkCastSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRPMinDistanceSlider)
    SetSliderDialogStartValue(fRPMinDistanceSlider)
    SetSliderDialogDefaultValue(500.0)
    SetSliderDialogRange(0.0, 10000.0)
    SetSliderDialogInterval(250.0)
  elseif (option == oidDisChanceSlider)
    SetSliderDialogStartValue(fDisChanceSlider)
    SetSliderDialogDefaultValue(25.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidDisProgChanceSlider)
    SetSliderDialogStartValue(fDisProgChanceSlider)
    SetSliderDialogDefaultValue(50.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidDisPriceSlider)
    SetSliderDialogStartValue(fDisPriceSlider)
    SetSliderDialogDefaultValue(100.0)
    SetSliderDialogRange(0.0, 10000.0)
    SetSliderDialogInterval(25)
  elseif (option == oidDisPriceMultSlider)
    SetSliderDialogStartValue(fDisPriceMultSlider)
    SetSliderDialogDefaultValue(0.5)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  elseif (option == oidSnoozeSlider)
    SetSliderDialogStartValue(fValueSnoozeSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 60.0)
    SetSliderDialogInterval(5.0)
  elseif (option == oidSkillReduceValSlider)
    SetSliderDialogStartValue(fSkillReduceValSlider)
    SetSliderDialogDefaultValue(10.0)
    SetSliderDialogRange(1.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidSkillReduceMaxValSlider)
    SetSliderDialogStartValue(fSkillReduceMaxValSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 99.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidSkillReduceMinValSlider)
    SetSliderDialogStartValue(fSkillReduceMinValSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 99.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMinLoseGoldSlider)
    SetSliderDialogStartValue(fMinLoseGoldSlider)
    SetSliderDialogDefaultValue(50.0)
    SetSliderDialogRange(0.0, 100000.0)
    SetSliderDialogInterval(50.0)
  elseif (option == oidMaxLoseGoldSlider)
    SetSliderDialogStartValue(fMaxLoseGoldSlider)
    SetSliderDialogDefaultValue(250.0)
    SetSliderDialogRange(0.0, 100000.0)
    SetSliderDialogInterval(50.0)
  elseif (option == oidMinLoseArkayMarkSlider)
    SetSliderDialogStartValue(fMinLoseArkayMarkSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMaxLoseArkayMarkSlider)
    SetSliderDialogStartValue(fMaxLoseArkayMarkSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMinLoseDragonSoulSlider)
    SetSliderDialogStartValue(fMinLoseDragonSoulSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMaxLoseDragonSoulSlider)
    SetSliderDialogStartValue(fMaxLoseDragonSoulSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMinLoseBlackSoulGemSlider)
    SetSliderDialogStartValue(fMinLoseBlackSoulGemSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMaxLoseBlackSoulGemSlider)
    SetSliderDialogStartValue(fMaxLoseBlackSoulGemSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMinLoseGrandSoulGemSlider)
    SetSliderDialogStartValue(fMinLoseGrandSoulGemSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMaxLoseGrandSoulGemSlider)
    SetSliderDialogStartValue(fMaxLoseGrandSoulGemSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidLoseOtherMinValueSlider)
    SetSliderDialogStartValue(fLoseOtherMinValueSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 1000.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidLoseOtherTotalValueSlider)
    SetSliderDialogStartValue(fLoseOtherTotalValueSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 1000000.0)
    SetSliderDialogInterval(25.0)
  elseif (option == oidMaxItemsToCheckSlider)
    SetSliderDialogStartValue(fMaxItemsToCheckSlider)
    SetSliderDialogDefaultValue(100.0)
    SetSliderDialogRange(0.0, 10000.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidLowerNPCMaxLvlDiff)
    SetSliderDialogStartValue(fLowerNPCMaxLvlDiff)
    SetSliderDialogDefaultValue(10.0)
    SetSliderDialogRange(0.0, 200.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidHigherNPCMaxLvlDiff)
    SetSliderDialogStartValue(fHigherNPCMaxLvlDiff)
    SetSliderDialogDefaultValue(10.0)
    SetSliderDialogRange(0.0, 200.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRespawnCounter)
    SetSliderDialogStartValue(100)
    SetSliderDialogDefaultValue(100.0)
    SetSliderDialogRange(0.0, 1000.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidBossChestChanceSlider)
    SetSliderDialogStartValue(fBossChestChanceSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidSimpleSlaveryChanceSlider)
    SetSliderDialogStartValue(fSimpleSlaveryChanceSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRapeChanceSlider)
    SetSliderDialogStartValue(fRapeChanceSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRapesMaxSlider)
    SetSliderDialogStartValue(fMaxRapes)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 5.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRapistsMaxSlider)
    SetSliderDialogStartValue(fMaxRapists)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 4.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidRespawnTimeSlider)
    SetSliderDialogStartValue(fRespawnTimeSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 744.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidSpawnCountSlider)
    SetSliderDialogStartValue(iSpawnCounts[iSpawn])
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 10.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidTotalCustomRPSlotSlider)
    SetSliderDialogStartValue(fTotalCustomRPSlotSlider)
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(1.0, 4.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidSpawnWeightSlider)
    SetSliderDialogStartValue(iSpawnWeights[iSpawn])
    SetSliderDialogDefaultValue(1.0)
    SetSliderDialogRange(0.0, 100.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidHealthTriggerSlider)
    SetSliderDialogStartValue((fHealthPercTrigger * 100.0) As Int)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 25.0)
    SetSliderDialogInterval(1.0)
  elseif (option == oidMarkScaleSlider)
    SetSliderDialogStartValue(fValueMarkScaleSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  elseif (option == oidGSoulScaleGemSlider)
    SetSliderDialogStartValue(fValueGSoulGemScaleSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  elseif (option == oidBSoulScaleGemSlider)
    SetSliderDialogStartValue(fValueBSoulGemScaleSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  elseif (option == oidDragonScaleSoulSlider)
    SetSliderDialogStartValue(fValueSoulScaleSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  elseif (option == oidGoldScaleSlider)
    SetSliderDialogStartValue(fValueGoldScaleSlider)
    SetSliderDialogDefaultValue(0.0)
    SetSliderDialogRange(0.0, 10.0)
    SetSliderDialogInterval(0.01)
  endif
endevent

event OnPageReset(String page)
  SetCursorFillMode(LEFT_TO_RIGHT)
  Int iCurStatus = iGetModStatus()
  if iCurStatus == 1
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Mod_Status_1")
    return
  elseif iCurStatus == 2
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Mod_Status_2")
    return
  endif
  setArrays()
  if (page == "$General")
    SetCursorPosition(0)
    _AddHeaderOption("$General")
    SetCursorPosition(2)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_RevivalEnabled", bIsRevivalEnabled, flags)
    SetCursorPosition(4)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (bIsMenuEnabled)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSnoozeSlider = AddSliderOption("$mrt_MarkofArkay_SnoozeSoulSlider_1", fValueSnoozeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
    SetCursorPosition(10)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTradeEnabled = AddToggleOption("$mrt_MarkofArkay_TradeEnabled", bIsTradeEnabled, flags)
    SetCursorPosition(12)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bTradeLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMarkOfArkayRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_MarkOfArkayRevivalEnabled", bIsMarkEnabled, flags)
    SetCursorPosition(14)
    oidGSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GSoulGemRevivalEnabled", bIsGSoulGemEnabled, flags)
    SetCursorPosition(16)
    oidBSoulGemRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_BSoulGemRevivalEnabled", bIsBSoulGemEnabled, flags)
    SetCursorPosition(18)
    oidDragonSoulRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_DragonSoulRevivalEnabled", bIsDragonSoulEnabled, flags)
    SetCursorPosition(20)
    oidGoldRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_GoldRevivalEnabled", bIsGoldEnabled, flags)
    SetCursorPosition(3)
    if (moaState.getValue() == 1) && (!ReviveScript.NPCScript.bInBeastForm() && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTriggerOnBleedout = AddToggleOption("$mrt_MarkofArkay_TriggerOnBleedout", bTriggerOnBleedout, flags)
    SetCursorPosition(5)
    oidTriggerOnHealthPerc = AddToggleOption("$mrt_MarkofArkay_TriggerOnHealthPerc", bTriggerOnHealthPerc, flags)
    SetCursorPosition(7)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (bTriggerOnHealthPerc)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidHealthTriggerSlider = AddSliderOption("$mrt_MarkofArkay_HealthPercSlider_1", fHealthPercTrigger * 100.0, "$mrt_MarkofArkay_HealthPercSlider_2", flags)
    SetCursorPosition(13)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bTradeLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
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
  elseif (page == "$Extra")
    SetCursorPosition(0)
    _AddHeaderOption("$Extra")
    SetCursorPosition(2)
    if (moaState.getValue() == 1) && !bSaveLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidEnableSave_M = AddMenuOption("$mrt_MarkofArkay_EnableSave_M", sGetSaveOptions()[iSaveOption], flags)
    SetCursorPosition(4)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidNoFallDamageEnabled = AddToggleOption("$mrt_MarkofArkay_NoFallDamageEnabled", bIsNoFallDamageEnabled, flags)
    SetCursorPosition(6)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidEffect = AddToggleOption("$mrt_MarkofArkay_Effect", bIsEffectEnabled, flags)
    SetCursorPosition(8)
    oidPotionRevivalEnabled = AddToggleOption("$mrt_MarkofArkay_PotionRevivalEnabled", bIsPotionEnabled, flags)
    SetCursorPosition(10)
    if (moaState.getValue() == 1) && (bIsRevivalEnabled)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidAutoDrinkPotion = AddToggleOption("$mrt_MarkofArkay_AutoDrinkPotion", bAutoDrinkPotion, flags)
    SetCursorPosition(12)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRevivalRequireBlessing = AddToggleOption("$mrt_MarkofArkay_RevivalRequireBlessing", bIsRevivalRequiresBlessing, flags)
    SetCursorPosition(14)
    oidShiftBack = AddToggleOption("$mrt_MarkofArkay_ShiftBack", bShiftBack, flags)
    SetCursorPosition(16)
    oidShiftBackRespawn = AddToggleOption("$mrt_MarkofArkay_ShiftBackRespawn", bShiftBackRespawn, flags)
    SetCursorPosition(18)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRecallRestriction = AddToggleOption("$mrt_MarkofArkay_RecallRestriction", bIsRecallRestricted, flags)
    SetCursorPosition(20)
    oidAutoSwitchRP = AddToggleOption("$mrt_MarkofArkay_AutoSwitchRP", bAutoSwitchRP, flags)
    SetCursorPosition(22)
    if (moaState.getValue() == 1) && !bMarkRecallCostLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMarkCost = AddSliderOption("$mrt_MarkofArkay_MarkCast", fMarkCastSlider, "$mrt_MarkofArkay_MarkSlider_2", flags)
    SetCursorPosition(3)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMenuEnabled = AddToggleOption("$mrt_MarkofArkay_MenuEnabled", bIsMenuEnabled, flags)
    SetCursorPosition(5)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (!bIsMenuEnabled)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
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
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidBleedoutTime = AddSliderOption("$mrt_MarkofArkay_BleedoutTime_1", fBleedoutTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
    SetCursorPosition(17)
    oidRecoveryTime = AddSliderOption("$mrt_MarkofArkay_RecoveryTime_1", fRecoveryTimeSlider, "$mrt_MarkofArkay_RecoveryTime_2", flags)
    SetCursorPosition(19)
    if (moaState.getValue() == 1) && !bLootChanceLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLootChanceSlider = AddSliderOption("$mrt_MarkofArkay_LootChanceSlider_1", fLootChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2", flags)
    SetCursorPosition(21)
    oidScrollChanceSlider = AddSliderOption("$mrt_MarkofArkay_ScrollChanceSlider_1", fScrollChanceSlider, "$mrt_MarkofArkay_LootChanceSlider_2", flags)
    SetCursorPosition(23)
    if (moaState.getValue() == 1) && !bMarkRecallCostLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRecallCost = AddSliderOption("$mrt_MarkofArkay_RecallCast", fRecallCastSlider, "$mrt_MarkofArkay_MarkSlider_2", flags)
  elseif (page == "$Aftermath")
    SetCursorPosition(0)
    _AddHeaderOption("$Aftermath")
    SetCursorPosition(2)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidNoTradingAftermath_M = AddMenuOption("Aftermath", sGetAftermathOptions()[iNotTradingAftermath], flags)
    SetCursorPosition(6)
    _AddHeaderOption("$Respawn")
    SetCursorPosition(8)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRespawnNaked = AddToggleOption("$mrt_MarkofArkay_RespawnNaked", bRespawnNaked, flags)
    SetCursorPosition(10)
    oidJail = AddToggleOption("$mrt_MarkofArkay_Jail", bSendToJail, flags)
    SetCursorPosition(12)
    oidShowRaceMenu = AddToggleOption("$mrt_MarkofArkay_ShowRaceMenu", bShowRaceMenu, flags)
    SetCursorPosition(14)
    oidKillIfCantRespawn = AddToggleOption("$mrt_MarkofArkay_KillIfCantRespawn", bKillIfCantRespawn, flags)
    SetCursorPosition(16)
    oidCanbeKilledbyUnarmed = AddToggleOption("$mrt_MarkofArkay_CanbeKilledbyUnarmed", bCanbeKilledbyUnarmed, flags)
    SetCursorPosition(18)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMoreRandomRespawn = AddToggleOption("$mrt_MarkofArkay_MoreRandomRespawn", bMoreRandomRespawn, flags)
    SetCursorPosition(20)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidCorpseAsSoulMark = AddToggleOption("$mrt_MarkofArkay_CorpseAsSoulMark", bCorpseAsSoulMark, flags)
    SetCursorPosition(22)
    oidHealActors = AddToggleOption("$mrt_MarkofArkay_HealActors", bHealActors, flags)
    SetCursorPosition(24)
    oidResurrectActors = AddToggleOption("$mrt_MarkofArkay_ResurrectActors", bResurrectActors, flags)
    SetCursorPosition(26)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDoNotStopCombatAfterRevival = AddToggleOption("$mrt_MarkofArkay_DoNotStopCombatAfterRevival", bDoNotStopCombatAfterRevival, flags)
    SetCursorPosition(28)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDoNotStopCombat = AddToggleOption("$mrt_MarkofArkay_DoNotStopCombat", bDoNotStopCombat, flags)
    SetCursorPosition(1)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Destination")
    SetCursorPosition(3)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTeleportMenu = AddToggleOption("$mrt_MarkofArkay_TeleportMenu", bTeleportMenu, flags)
    SetCursorPosition(5)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRespawnMenu = AddToggleOption("$mrt_MarkofArkay_RespawnMenu", bRespawnMenu, flags)
    SetCursorPosition(7)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTeleportLocation_M = AddMenuOption("$mrt_MarkofArkay_TeleportLocation_M", sRespawnPoints[iTeleportLocation], flags)
    SetCursorPosition(9)
    if (moaState.getValue() == 1) && (iTeleportLocation == getTavernRPIndex())
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTavern_M = AddMenuOption("$mrt_MarkofArkay_Taverns_M", sTaverns[iTavernIndex], flags)
    SetCursorPosition(11)
    if (moaState.getValue() == 1) && (iTeleportLocation == getCustomRPIndex())
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSelectedCustomRPSlot_M = AddMenuOption("$mrt_MarkofArkay_SelectedCustomRPSlot_M", shortenString(sCustomRPs[iSelectedCustomRPSlot], 19), flags)
    SetCursorPosition(13)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTotalCustomRPSlotSlider = AddSliderOption("$mrt_MarkofArkay_TotalCustomRPSlotSlider_1", fTotalCustomRPSlotSlider, "{0}", flags)
    SetCursorPosition(15)
    if ((moaState.getValue() == 1) && (iTeleportLocation == getExternalRPIndex()) && (moaERPCount.GetValueInt() > 0))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    if (iExternalIndex >= moaERPCount.GetValueInt()) || (iExternalIndex < 0)
      iExternalIndex = moaERPCount.GetValueInt()
    elseif moaERPCount.GetValueInt() == 1
      iExternalIndex = 0
    endif
    oidExtraTeleportLocation_M = AddMenuOption("$mrt_MarkofArkay_ExtraTeleportLocation_M", shortenString(sExtraRPs[iExternalIndex], 19), flags)
    SetCursorPosition(17)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRPMinDistanceSlider = AddSliderOption("$mrt_MarkofArkay_RPMinDistanceSlider_1", fRPMinDistanceSlider, "{0}", flags)
    SetCursorPosition(19)
    if (moaState.getValue() == 1) && !bDisableUnsafe
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRespawnTimeSlider = AddSliderOption("$mrt_MarkofArkay_RespawnTimeSlider_1", fRespawnTimeSlider, "$mrt_MarkofArkay_RespawnTimeSlider_2", flags)
    SetCursorPosition(23)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_City")
    SetCursorPosition(25)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRespawnPoint0 = AddToggleOption(sRespawnPoints[0], bRespawnPointsFlags[0], flags)
    SetCursorPosition(27)
    oidRespawnPoint1 = AddToggleOption(sRespawnPoints[1], bRespawnPointsFlags[1], flags)
    SetCursorPosition(29)
    oidRespawnPoint2 = AddToggleOption(sRespawnPoints[2], bRespawnPointsFlags[2], flags)
    SetCursorPosition(31)
    oidRespawnPoint3 = AddToggleOption(sRespawnPoints[3], bRespawnPointsFlags[3], flags)
    SetCursorPosition(33)
    oidRespawnPoint4 = AddToggleOption(sRespawnPoints[4], bRespawnPointsFlags[4], flags)
    SetCursorPosition(35)
    oidRespawnPoint5 = AddToggleOption(sRespawnPoints[5], bRespawnPointsFlags[5], flags)
    SetCursorPosition(37)
    oidRespawnPoint6 = AddToggleOption(sRespawnPoints[6], bRespawnPointsFlags[6], flags)
    SetCursorPosition(39)
    oidRespawnPoint7 = AddToggleOption(sRespawnPoints[7], bRespawnPointsFlags[7], flags)
    SetCursorPosition(41)
    oidRespawnPoint8 = AddToggleOption("$Morthal", bRespawnPointsFlags[8], flags)
    SetCursorPosition(43)
    oidRespawnPoint9 = AddToggleOption("$Dawnstar", bRespawnPointsFlags[9], flags)
  elseif (page == "$Curse")
    SetCursorPosition(0)
    _AddHeaderOption("$Curse")
    SetCursorPosition(2)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidArkayCurse = AddToggleOption("$mrt_MarkofArkay_ArkayCurse", bArkayCurse, flags)
    SetCursorPosition(4)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bArkayCurse) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTempArkayCurse = AddToggleOption("$mrt_MarkofArkay_TempArkayCurse", bIsArkayCurseTemporary, flags)
    SetCursorPosition(6)
    oidArkayCurses_M = AddMenuOption("$mrt_MarkofArkay_ArkayCurses_M", sGetArkayCurses()[iArkayCurse], flags)
    SetCursorPosition(10)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Disease_Curse")
    SetCursorPosition(12)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDiseaseCurse = AddToggleOption("$mrt_MarkofArkay_DiseaseCurse", bDiseaseCurse, flags)
    SetCursorPosition(14)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bDiseaseCurse && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDisChanceSlider = AddSliderOption("$mrt_MarkofArkay_DisChanceSlider_1", fDisChanceSlider, "$mrt_MarkofArkay_DisChanceSlider_2", flags)
    SetCursorPosition(16)
    oidDisProgChanceSlider = AddSliderOption("$mrt_MarkofArkay_DisProgChanceSlider_1", fDisProgChanceSlider, "$mrt_MarkofArkay_DisProgChanceSlider_2", flags)
    SetCursorPosition(18)
    oidDisPriceSlider = AddSliderOption("$mrt_MarkofArkay_DisPriceSlider_1", fDisPriceSlider, "$mrt_MarkofArkay_DisPriceSlider_2", flags)
    SetCursorPosition(20)
    oidDisPriceMultSlider = AddSliderOption("$mrt_MarkofArkay_DisPriceMultSlider_1", fDisPriceMultSlider, "$mrt_MarkofArkay_DisPriceMultSlider_2", flags)
    SetCursorPosition(22)
    oidCureDisIfHasBlessing = AddToggleOption("$mrt_MarkofArkay_CureDisIfHasBlessing", bCureDisIfHasBlessing, flags)
    SetCursorPosition(24)
    oidMultipleDis = AddToggleOption("$mrt_MarkofArkay_MultipleDis", bMultipleDis, flags)
    SetCursorPosition(26)
    oidMultipleDisProg = AddToggleOption("$mrt_MarkofArkay_MultipleDisProg", bMultipleDisProg, flags)
    SetCursorPosition(28)
    oidOnlyInfectIfHasBaseDis = AddToggleOption("$mrt_MarkofArkay_OnlyInfectIfHasBaseDis", bOnlyInfectIfHasBaseDis, flags)
    SetCursorPosition(30)
    oidSoulMarkCureDiseases = AddToggleOption("$mrt_MarkofArkay_SoulMarkCureDiseases", bSoulMarkCureDiseases, flags)
    SetCursorPosition(34)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Skill_Reduction")
    SetCursorPosition(36)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSkillReduce_M = AddMenuOption("$mrt_MarkofArkay_SkillReduce_M", sGetSkills()[iReducedSkill], flags)
    SetCursorPosition(38)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidOnlyLoseSkillXP = AddToggleOption("$mrt_MarkofArkay_OnlyLoseSkillXP", bOnlyLoseSkillXP, flags)
    SetCursorPosition(40)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && !bOnlyLoseSkillXP && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLevelReduce = AddToggleOption("$mrt_MarkofArkay_LevelReduce", bLevelReduce, flags)
    SetCursorPosition(42)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && !bSkillReduceRandomVal && !bOnlyLoseSkillXP && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSkillReduceValSlider = AddSliderOption("$mrt_MarkofArkay_SkillReduceValSlider_1", fSkillReduceValSlider, "$mrt_MarkofArkay_SkillReduceValSlider_2", flags)
    SetCursorPosition(44)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && !bOnlyLoseSkillXP && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSkillReduceRandomVal = AddToggleOption("$mrt_MarkofArkay_SkillReduceRandomVal", bSkillReduceRandomVal, flags)
    SetCursorPosition(46)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iReducedSkill != 0) && bSkillReduceRandomVal && !bOnlyLoseSkillXP && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSkillReduceMinValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMinValSlider_1", fSkillReduceMinValSlider, "{0}", flags)
    SetCursorPosition(48)
    oidSkillReduceMaxValSlider = AddSliderOption("$mrt_MarkofArkay_killReduceMaxValSlider_1", fSkillReduceMaxValSlider, "{0}", flags)
    SetCursorPosition(50)

    ;If ( moaState.getValue() == 1 ) && bIsRevivalEnabled && ( iNotTradingAftermath == 1 ) && (iReducedSkill != 0) && bDLIEOK && !bOnlyLoseSkillXP && !bCurseLock
    ;	flags =	OPTION_FLAG_NONE
    ;Else
    ;	flags = OPTION_FLAG_DISABLED
    ;EndIf
    ;oidLoseSkillForever = AddToggleOption("$mrt_MarkofArkay_LoseSkillForever",bLoseSkillForever, flags)
    SetCursorPosition(54)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Other_Curses")
    SetCursorPosition(56)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidVoicelessCurse = AddToggleOption("$mrt_MarkofArkay_VoicelessCurse", bVoicelessCurse, flags)
    SetCursorPosition(58)
    oidGhostCurse = AddToggleOption("$mrt_MarkofArkay_GhostCurse", bGhostCurse, flags)
    SetCursorPosition(60)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bGhostCurse
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLiteGhostCurse = AddToggleOption("$mrt_MarkofArkay_LiteGhostCurse", bLiteGhostCurse, flags)
    SetCursorPosition(62)
    oidGhostShader = AddMenuOption("$mrt_MarkofArkay_GhostShader_M", sGetGhostShader()[iGhostShader], flags)
    SetCursorPosition(66)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Curse_Recovery")
    SetCursorPosition(68)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLostItemQuest = AddToggleOption("$mrt_MarkofArkay_LostItemQuest", bLostItemQuest, flags)
    SetCursorPosition(70)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1)) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSoulMarkStay = AddToggleOption("$mrt_MarkofArkay_SoulMarkStay", bSoulMarkStay, flags)
    SetCursorPosition(72)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1)) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseforever = AddToggleOption("$mrt_MarkofArkay_Loseforever", bLoseForever, flags)
    SetCursorPosition(1)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Item_Curse")
    SetCursorPosition(3)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1)) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseItem = AddToggleOption("$mrt_MarkofArkay_Lose_Items", bLoseItem, flags)
    SetCursorPosition(5)
    _AddHeaderOption("")
    SetCursorPosition(7)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseGold = AddToggleOption("$mrt_MarkofArkay_Lose_Gold", bLoseGold, flags)
    SetCursorPosition(9)
    oidLoseGoldAll = AddToggleOption("$mrt_MarkofArkay_LoseGoldAll", bLoseGoldAll, flags)
    SetCursorPosition(11)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && !bLoseGoldAll) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMinLoseGoldSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseGoldSlider", fMinLoseGoldSlider, "{0}", flags)
    SetCursorPosition(13)
    oidMaxLoseGoldSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseGoldSlider", fMaxLoseGoldSlider, "{0}", flags)
    SetCursorPosition(15)
    _AddHeaderOption("")
    SetCursorPosition(17)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseArkayMark = AddToggleOption("$mrt_MarkofArkay_LoseArkayMark", bLoseArkayMark, flags)
    SetCursorPosition(19)
    oidLoseArkayMarkAll = AddToggleOption("$mrt_MarkofArkay_LoseArkayMarkAll", bLoseArkayMarkAll, flags)
    SetCursorPosition(21)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && !bLoseArkayMarkAll) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMinLoseArkayMarkSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseArkayMarkSlider", fMinLoseArkayMarkSlider, "{0}", flags)
    SetCursorPosition(23)
    oidMaxLoseArkayMarkSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseArkayMarkSlider", fMaxLoseArkayMarkSlider, "{0}", flags)
    SetCursorPosition(25)
    _AddHeaderOption("")
    SetCursorPosition(27)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseDragonSoul = AddToggleOption("$mrt_MarkofArkay_LoseDragonSoul", bLoseDragonSoul, flags)
    SetCursorPosition(29)
    oidLoseDragonSoulAll = AddToggleOption("$mrt_MarkofArkay_LoseDragonSoulAll", bLoseDragonSoulAll, flags)
    SetCursorPosition(31)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && !bLoseDragonSoulAll) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMinLoseDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseDragonSoulSlider", fMinLoseDragonSoulSlider, "{0}", flags)
    SetCursorPosition(33)
    oidMaxLoseDragonSoulSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseDragonSoulSlider", fMaxLoseDragonSoulSlider, "{0}", flags)
    SetCursorPosition(35)
    _AddHeaderOption("")
    SetCursorPosition(37)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseBlackSoulGem = AddToggleOption("$mrt_MarkofArkay_LoseBlackSoulGem", bLoseBlackSoulGem, flags)
    SetCursorPosition(39)
    oidLoseBlackSoulGemAll = AddToggleOption("$mrt_MarkofArkay_LoseBlackSoulGemAll", bLoseBlackSoulGemAll, flags)
    SetCursorPosition(41)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && !bLoseBlackSoulGemAll) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMinLoseBlackSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseBlackSoulGemSlider", fMinLoseBlackSoulGemSlider, "{0}", flags)
    SetCursorPosition(43)
    oidMaxLoseBlackSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseBlackSoulGemSlider", fMaxLoseBlackSoulGemSlider, "{0}", flags)
    SetCursorPosition(45)
    _AddHeaderOption("")
    SetCursorPosition(47)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseGrandSoulGem = AddToggleOption("$mrt_MarkofArkay_LoseGrandSoulGem", bLoseGrandSoulGem, flags)
    SetCursorPosition(49)
    oidLoseGrandSoulGemAll = AddToggleOption("$mrt_MarkofArkay_LoseGrandSoulGemAll", bLoseGrandSoulGemAll, flags)
    SetCursorPosition(51)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && !bLoseGrandSoulGemAll) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMinLoseGrandSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MinLoseGrandSoulGemSlider", fMinLoseGrandSoulGemSlider, "{0}", flags)
    SetCursorPosition(53)
    oidMaxLoseGrandSoulGemSlider = AddSliderOption("$mrt_MarkofArkay_MaxLoseGrandSoulGemSlider", fMaxLoseGrandSoulGemSlider, "{0}", flags)
    SetCursorPosition(55)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Extra_Item_Curse")
    SetCursorPosition(57)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseOthers = AddToggleOption("$mrt_MarkofArkay_LoseOthers", bLoseOthers, flags)
    SetCursorPosition(59)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && bLoseOthers) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidEquipInclude_M = AddMenuOption("$mrt_MarkofArkay_EquipInclude_M", sGetLoseInclusions()[iLoseInclusion], flags)
    SetCursorPosition(61)
    oidCheckWeight = AddToggleOption("$mrt_MarkofArkay_CheckWeight", bCheckWeight, flags)
    SetCursorPosition(63)
    oidCheckKeyword = AddToggleOption("Exclude by Keyword", bCheckKeyword, flags)
    SetCursorPosition(65)
    oidExcludeQuestItems = AddToggleOption("$mrt_MarkofArkay_ExcludeQuestItems", bExcludeQuestItems, flags)
    SetCursorPosition(67)
    oidRandomItemCurse = AddToggleOption("$mrt_MarkofArkay_RandomItemCurse", bRandomItemCurse, flags)
    SetCursorPosition(69)
    oidLoseOtherMinValueSlider = AddSliderOption("$mrt_MarkofArkay_LoseOtherMinValueSlider", fLoseOtherMinValueSlider, "{0}", flags)
    SetCursorPosition(71)
    oidLoseOtherTotalValueSlider = AddSliderOption("$mrt_MarkofArkay_LoseOtherTotalValueSlider", fLoseOtherTotalValueSlider, "{0}", flags)
    SetCursorPosition(73)
    oidMaxItemsToCheckSlider = AddSliderOption("$mrt_MarkofArkay_MaxItemsToCheckSlider", fMaxItemsToCheckSlider, "{0}", flags)
    SetCursorPosition(75)
    _AddHeaderOption("")
    SetCursorPosition(77)
    oidLoseArmor = AddToggleOption("$mrt_MarkofArkay_LoseArmor", bLoseArmor, flags)
    SetCursorPosition(79)
    oidLoseWeapon = AddToggleOption("$mrt_MarkofArkay_LoseWeapon", bLoseWeapon, flags)
    SetCursorPosition(81)
    oidLoseAmmo = AddToggleOption("$mrt_MarkofArkay_LoseAmmo", bLoseAmmo, flags)
    SetCursorPosition(83)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && bLoseItem && bLoseOthers && (iLoseInclusion != 1)) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoseBook = AddToggleOption("$mrt_MarkofArkay_LoseBook", bLoseBook, flags)
    SetCursorPosition(85)
    oidLoseMisc = AddToggleOption("$mrt_MarkofArkay_LoseMisc", bLoseMisc, flags)
    SetCursorPosition(87)
    oidLoseKey = AddToggleOption("$mrt_MarkofArkay_LoseKey", bLoseKey, flags)
    SetCursorPosition(89)
    oidLoseSoulgem = AddToggleOption("$mrt_MarkofArkay_LoseSoulgem", bLoseSoulgem, flags)
    SetCursorPosition(91)
    oidLosePotion = AddToggleOption("$mrt_MarkofArkay_LosePotion", bLosePotion, flags)
    SetCursorPosition(93)
    oidLoseScroll = AddToggleOption("$mrt_MarkofArkay_LoseScroll", bLoseScroll, flags)
    SetCursorPosition(95)
    oidLoseIngredient = AddToggleOption("$mrt_MarkofArkay_LoseIngredient", bLoseIngredient, flags)
  elseif (page == "NPC")
    SetCursorPosition(0)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_NPC")
    SetCursorPosition(2)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidHostileOptions_M = AddMenuOption("$mrt_MarkofArkay_HostileOptions_M", sGetHostileOptions()[iHostileOption], flags)
    SetCursorPosition(4)
    if ((moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iHostileOption == 2))
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMoralityMatters = AddToggleOption("$mrt_MarkofArkay_MoralityMatters", bMoralityMatters, flags)
    SetCursorPosition(6)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iHostileOption == 1 || iHostileOption == 2)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidCreaturesCanSteal = AddToggleOption("$mrt_MarkofArkay_CreaturesCanSteal", bCreaturesCanSteal, flags)
    SetCursorPosition(8)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iHostileOption == 2)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidNPCHasLevelRange = AddToggleOption("$mrt_MarkofArkay_NPCHasLevelRange", bNPCHasLevelRange, Flags)
    SetCursorPosition(10)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (iHostileOption == 2) && bNPCHasLevelRange
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLowerNPCMaxLvlDiff = AddSliderOption("$mrt_MarkofArkay_LowerNPCMaxLvlDiff", fLowerNPCMaxLvlDiff, "{0}", flags)
    SetCursorPosition(12)
    oidHigherNPCMaxLvlDiff = AddSliderOption("$mrt_MarkofArkay_HigherNPCMaxLvlDiff", fHigherNPCMaxLvlDiff, "{0}", flags)
    SetCursorPosition(16)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_Spawn")
    SetCursorPosition(18)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && iHostileOption == 2
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSpawnHostile = AddToggleOption("$mrt_MarkofArkay_SpawnHostile", bSpawnHostile, flags)
    SetCursorPosition(20)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && iHostileOption == 2 && bSpawnHostile
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidOnlySpawn = AddToggleOption("$mrt_MarkofArkay_OnlySpawn", bOnlySpawn, flags)
    SetCursorPosition(22)
    oidAlwaysSpawn = AddToggleOption("$mrt_MarkofArkay_AlwaysSpawn", bAlwaysSpawn, flags)
    SetCursorPosition(24)
    oidSpawnByLocation = AddToggleOption("$mrt_MarkofArkay_SpawnByLocation", bSpawnByLocation, flags)
    SetCursorPosition(26)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && iHostileOption == 2 && bSpawnHostile && bSpawnByLocation
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRetrySpawnWithoutLocation = AddToggleOption("$mrt_MarkofArkay_RetrySpawnWithoutLocation", bRetrySpawnWithoutLocation, flags)
    SetCursorPosition(28)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && iHostileOption == 2 && bSpawnHostile
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSpawnCheckRelation = AddToggleOption("$mrt_MarkofArkay_SpawnCheckRelation", bSpawnCheckRelation, flags)
    SetCursorPosition(30)
    oidSpawnBringAllies = AddToggleOption("$mrt_MarkofArkay_SpawnBringAllies", bSpawnBringAllies, flags)
    SetCursorPosition(32)
    oidSpawnMinLevel_M = AddMenuOption("$mrt_MarkofArkay_SpawnMinLevel_M", sGetSpawnLevels()[iSpawnMinLevel], flags)
    SetCursorPosition(34)
    oidSpawnMaxLevel_M = AddMenuOption("$mrt_MarkofArkay_SpawnMaxLevel_M", sGetSpawnLevels()[iSpawnMaxLevel], flags)
    SetCursorPosition(36)
    _AddHeaderOption("")
    SetCursorPosition(38)
    oidSpawns_M = AddMenuOption("$mrt_MarkofArkay_Spawns_M", sGetSpawns()[iSpawn], flags)
    SetCursorPosition(40)
    oidSpawnWeightSlider = AddSliderOption("$mrt_MarkofArkay_SpawnWeightSlider_1", iSpawnWeights[iSpawn], "$mrt_MarkofArkay_SpawnWeightSlider_2", flags)
    SetCursorPosition(42)
    oidSpawnCountSlider = AddSliderOption("$mrt_MarkofArkay_SpawnCountSlider_1", iSpawnCounts[iSpawn], "$mrt_MarkofArkay_SpawnCountSlider_2", flags)
    SetCursorPosition(1)
    _AddHeaderOption("$Follower")
    SetCursorPosition(3)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidPlayerProtectFollower = AddToggleOption("$mrt_MarkofArkay_PlayerProtectFollower", bPlayerProtectFollower, flags)
    SetCursorPosition(5)
    oidFollowerProtectPlayer = AddToggleOption("$mrt_MarkofArkay_FollowerProtectPlayer", bFollowerProtectPlayer, flags)
    SetCursorPosition(9)
    _AddHeaderOption("$Rape")
    SetCursorPosition(11)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && (bIsSexlabActive || bIsOStimActive || bIsFlowerGirlsActive)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSexInterface_M = AddMenuOption("$mrt_MarkofArkay_SexInterface_M", sGetSexInterface()[iSexInterface], flags)
    SetCursorPosition(13)
    oidRapeChanceSlider = AddSliderOption("$mrt_MarkofArkay_RapeChanceSlider_1", fRapeChanceSlider, "$mrt_MarkofArkay_RapeChanceSlider_2", flags)
    SetCursorPosition(15)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && fRapeChanceSlider > 0.0
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRapistGender_M = AddMenuOption("$mrt_MarkofArkay_RapistGender_M", sGetGenders()[iRapistGender], flags)
    SetCursorPosition(17)
    oidRapesMaxSlider = AddSliderOption("$mrt_MarkofArkay_RapesMaxSlider_1", fMaxRapes, "$mrt_MarkofArkay_RapesMaxSlider_2", flags)
    SetCursorPosition(19)
    oidRapistsMaxSlider = AddSliderOption("$mrt_MarkofArkay_RapistsMaxSlider_1", fMaxRapists, "$mrt_MarkofArkay_RapistsMaxSlider_2", flags)
    SetCursorPosition(21)
    oidOnlyHostilesRape = AddToggleOption("$mrt_MarkofArkay_OnlyHostilesRape", bOnlyHostilesRape, flags)
    SetCursorPosition(25)
    _AddHeaderOption("$mrt_MarkofArkay_Simple_Slavery")
    SetCursorPosition(27)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSimpleSlaveryChanceSlider = AddSliderOption("$mrt_MarkofArkay_SimpleSlaveryChanceSlider_1", fSimpleSlaveryChanceSlider, "$mrt_MarkofArkay_SimpleSlaveryChanceSlider_2", flags)
    SetCursorPosition(29)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && fRapeChanceSlider > 0.0 && fSimpleSlaveryChanceSlider > 0.0
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSlaveryOnlyAfterRape = AddToggleOption("$mrt_MarkofArkay_SlaveryOnlyAfterRape", bSlaveryOnlyAfterRape, flags)
    SetCursorPosition(31)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && fSimpleSlaveryChanceSlider > 0.0
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidOnlyEnslavedByEnemyFaction = AddToggleOption("$mrt_MarkofArkay_OnlyEnslavedByEnemyFaction", bOnlyEnslavedByEnemyFaction, flags)
    SetCursorPosition(35)
    _AddHeaderOption("$mrt_MarkofArkay_Boss_Chest")
    SetCursorPosition(37)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidBossChestChanceSlider = AddSliderOption("$mrt_MarkofArkay_BossChestChanceSlider_1", fBossChestChanceSlider, "$mrt_MarkofArkay_BossChestChanceSlider_2", flags)
    SetCursorPosition(39)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && fBossChestChanceSlider > 0.0
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidBossChestNotClearedLoc = AddToggleOption("$mrt_MarkofArkay_BossChestNotClearedLoc", bBossChestNotInClearedLoc, flags)
    SetCursorPosition(41)
    oidBossChestOnlyCurLoc = AddToggleOption("$mrt_MarkofArkay_BossChestOnlyCurLoc", bBossChestOnlyCurLoc, flags)
  elseif (page == "$Debug")
    SetCursorPosition(0)
    _AddHeaderOption("$Debug")
    SetCursorPosition(2)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidResetPlayer = _AddTextOption("$mrt_MarkofArkay_ResetPlayer", "", flags)
    SetCursorPosition(4)
    if moaState.getValue() == 0
      oidStatus = _AddTextOption("$mrt_MarkofArkay_Status_Off", "")
    else
      oidStatus = _AddTextOption("$mrt_MarkofArkay_Status_On", "")
    endif
    SetCursorPosition(6)
    oidReset = _AddTextOption("$mrt_MarkofArkay_Reset", "", flags)
    SetCursorPosition(8)
    if (moaState.getValue() == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRestoreItems = _AddTextOption("$mrt_MarkofArkay_RestoreItems", "", flags)
    SetCursorPosition(10)
    if PlayerRef.GetCurrentLocation() && !ReviveScript.LocationBlackList.HasForm(PlayerRef.GetCurrentLocation())
      _AddHeaderOption(shortenString(PlayerRef.GetCurrentLocation().GetName(), 59))
      SetCursorPosition(12)
      if (ReviveScript.LocationBlackList2.Find(PlayerRef.GetCurrentLocation()) > -1) || (bPUOK && JsonUtil.FormListHas("/MarkofArkay/MOA_BlackLists", "LocationBlackList", PlayerRef.GetCurrentLocation()))
        oidRespawnBlackListLocation = _AddTextOption("$mrt_MarkofArkay_RespawnBlackListLocation_Remove", "")
      else
        oidRespawnBlackListLocation = _AddTextOption("$mrt_MarkofArkay_RespawnBlackListLocation_Add", "")
      endif
    else
      _AddHeaderOption("")
      SetCursorPosition(12)
      oidRespawnBlackListLocation = _AddTextOption("$mrt_MarkofArkay_RespawnBlackListLocation_Remove", "", OPTION_FLAG_DISABLED)
    endif
    SetCursorPosition(14)
    _AddHeaderOption("")
    SetCursorPosition(16)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    if (PlayerRef.HasSpell(MoveCustomMarker) || PlayerRef.HasSpell(RecallMarker))
      oidToggleSpells = _AddTextOption("$mrt_MarkofArkay_ToggleSpells1", "", flags)
    else
      oidToggleSpells = _AddTextOption("$mrt_MarkofArkay_ToggleSpells2", "", flags)
    endif
    SetCursorPosition(18)
    if (PlayerRef.HasSpell(RevivalPower) || PlayerRef.HasSpell(SacrificePower))
      oidTogglePowers = _AddTextOption("$mrt_MarkofArkay_TogglePowers1", "", flags)
    else
      oidTogglePowers = _AddTextOption("$mrt_MarkofArkay_TogglePowers2", "", flags)
    endif
    SetCursorPosition(20)
    sResetHistory = ""
    oidResetHistory = _AddTextOption("$mrt_MarkofArkay_ResetHistory", sResetHistory, flags)
    SetCursorPosition(22)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDisableUnsafe = AddToggleOption("$mrt_MarkofArkay_DisableUnsafe", bDisableUnsafe, flags)
    SetCursorPosition(24)
    oidLogging = AddToggleOption("$mrt_MarkofArkay_Logging", bIsLoggingEnabled, flags)
    SetCursorPosition(26)
    if (moaState.getValue() == 1)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidInformation = AddToggleOption("$mrt_MarkofArkay_Info", bIsInfoEnabled, flags)
    SetCursorPosition(28)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidNotification = AddToggleOption("$mrt_MarkofArkay_Notification", bIsNotificationEnabled, flags)
    SetCursorPosition(30)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRagdollEffect = AddToggleOption("$mrt_MarkofArkay_RagdollEffect", bIsRagdollEnabled, flags)
    SetCursorPosition(32)
    if (moaState.getValue() == 1) && bIsRevivalEnabled
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidFadeToBlack = AddToggleOption("$mrt_MarkofArkay_FadeToBlack", bFadeToBlack, flags)
    SetCursorPosition(34)
    oidInvisibility = AddToggleOption("$mrt_MarkofArkay_Invisibility", bInvisibility, flags)
    SetCursorPosition(36)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bIsRagdollEnabled && (bFadeToBlack || bInvisibility)
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidDeathEffect = AddToggleOption("$mrt_MarkofArkay_DeathEffect", bDeathEffect, flags)
    SetCursorPosition(38)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && bARCCOK
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidAltEyeFix = AddToggleOption("$mrt_MarkofArkay_AltEyeFix", bAltEyeFix, flags)
    SetCursorPosition(40)
    _AddHeaderOption("$mrt_MarkofArkay_Locks")
    SetCursorPosition(42)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bTradeLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidTradeLock = AddToggleOption("$mrt_MarkofArkay_TradeLock", bTradeLock, flags)
    SetCursorPosition(44)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bCurseLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidCurseLock = AddToggleOption("$mrt_MarkofArkay_CurseLock", bCurseLock, flags)
    SetCursorPosition(46)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bSaveLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSaveLock = AddToggleOption("$mrt_MarkofArkay_SaveLock", bSaveLock, flags)
    SetCursorPosition(48)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bLootChanceLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLootChanceLock = AddToggleOption("$mrt_MarkofArkay_LootChanceLock", bLootChanceLock, flags)
    SetCursorPosition(50)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bMarkRecallCostLock
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidMarkRecallCostLock = AddToggleOption("$mrt_MarkofArkay_MarkRecallCostLock", bMarkRecallCostLock, flags)
    SetCursorPosition(52)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && (iNotTradingAftermath == 1) && !bRespawnCounter
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidRespawnCounter = AddSliderOption("$mrt_MarkofArkay_RespawnCounter1", fRespawnCounterSlider, "$mrt_MarkofArkay_RespawnCounter2", flags)
    SetCursorPosition(54)
    if (moaState.getValue() == 1) && bIsRevivalEnabled && !bLockPermaDeath && bPUOK
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLockPermaDeath = AddToggleOption("$mrt_MarkofArkay_PermaDeathLock", bLockPermaDeath, flags)
    SetCursorPosition(1)
    if (iNotTradingAftermath == 1 && !ReviveScript.RespawnScript.bCanTeleport())
      _AddHeaderOption("$mrt_MarkofArkay_HEAD_CanNotRespawn")
    else
      _AddHeaderOption("$mrt_MarkofArkay_HEAD_Curses")
    endif
    SetCursorPosition(3)
    flags = OPTION_FLAG_DISABLED
    String sText
    Int iCount
    String sRPDistance = "$Disabled"
    String sRPCellName = "$Disabled"
    String sRPCellFormID = "$Disabled"
    Float fDistance = -1.0
    if bIsInfoEnabled
      iCount = LostItemsChest.GetNumItems()
      if iCount <= 999999
        sText = iCount As String
        if iCount > 0 && bUIEOK
          flags = OPTION_FLAG_NONE
        else
          flags = OPTION_FLAG_DISABLED
        endif
      else
        sText = "+999999"
      endif
    else
      sText = "$Disabled"
    endif
    oidLostItemsInfo = _AddTextOption("$mrt_MarkofArkay_Cur_Lost_Items", sText, flags)
    SetCursorPosition(5)
    flags = OPTION_FLAG_DISABLED
    if bIsInfoEnabled
      iCount = ReviveScript.SkillScript.iGetReducedSkillsCount(False)
      sText = iCount As String
      if iCount > 0 && bUIEOK
        flags = OPTION_FLAG_NONE
      endif
    else
      sText = "$Disabled"
    endif
    oidLostSkillsInfo = _AddTextOption("$mrt_MarkofArkay_LostSkillsInfo", sText, flags)
    SetCursorPosition(7)
    flags = OPTION_FLAG_DISABLED
    if bIsInfoEnabled
      sText = ReviveScript.ItemScript.fLostSouls As Int
    else
      sText = "$Disabled"
    endif
    _AddTextOption("$mrt_MarkofArkay_Lost_Dragon_Souls", sText, flags)
    SetCursorPosition(9)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_RespawnPoint")
    SetCursorPosition(11)
    flags = OPTION_FLAG_DISABLED
    if (moaState.getValue() == 1) && bIsInfoEnabled
      sRPCellName = "$Unknown"
      sRPCellFormID = "$Unknown"
      sRPDistance = "$Unknown"
      String[] sPlaceInfos
      if iTeleportLocation < getNearbyCityRPIndex()
        if (MarkerList.GetAt(iTeleportLocation) As Objectreference)
          fDistance = PlayerRef.GetDistance(MarkerList.GetAt(iTeleportLocation) As Objectreference)
          sPlaceInfos = getRefPlaceInfo(MarkerList.GetAt(iTeleportLocation) As Objectreference)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getTavernRPIndex())
        if iTavernIndex < getNearbyInnRPIndex()
          fDistance = PlayerRef.GetDistance(ReviveScript.RespawnScript.TavernMarkers[iTavernIndex] As Objectreference)
          sPlaceInfos = getRefPlaceInfo(ReviveScript.RespawnScript.TavernMarkers[iTavernIndex] As Objectreference)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getSleepRPIndex())
        if SleepMarker && !SleepMarker.Isdisabled() && (SleepMarker.GetParentCell() != ReviveScript.DefaultCell)
          fDistance = PlayerRef.GetDistance(SleepMarker)
          sPlaceInfos = getRefPlaceInfo(SleepMarker)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getCustomRPIndex())
        if (CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference).IsEnabled() && (CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference).GetParentCell() != ReviveScript.DefaultCell
          fDistance = PlayerRef.GetDistance((CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference))
          sPlaceInfos = getRefPlaceInfo(CustomRespawnPoints.GetAt(iSelectedCustomRPSlot) As ObjectReference)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getExternalRPIndex()) && (moaERPCount.GetValueInt() > 1) && (iExternalIndex != -1)
        ObjectReference ExtMarker = getFromMergedFormList(MergedExternalMarkerList, iExternalIndex) As ObjectReference
        if ExtMarker
          fDistance = PlayerRef.GetDistance(ExtMarker)
          sPlaceInfos = getRefPlaceInfo(ExtMarker)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getExternalRPIndex()) && (moaERPCount.GetValueInt() == 1)
        ObjectReference ExtMarker = getFromMergedFormList(MergedExternalMarkerList, 0) As ObjectReference
        if ExtMarker
          fDistance = PlayerRef.GetDistance(ExtMarker)
          sPlaceInfos = getRefPlaceInfo(ExtMarker)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      elseif (iTeleportLocation == getThroatRPIndex())
        if ReviveScript.RespawnScript.TOWMarker As ObjectReference
          fDistance = PlayerRef.GetDistance(ReviveScript.RespawnScript.TOWMarker)
          sPlaceInfos = getRefPlaceInfo(ReviveScript.RespawnScript.TOWMarker)
          if sPlaceInfos[0] || sPlaceInfos[1]
            sRPCellName = sPlaceInfos[0]
            sRPCellFormID = sDecToHex(sPlaceInfos[1] As Int)
          endif
        endif
      endif
    endif
    _AddTextOption("$mrt_MarkofArkay_Respawn_Cell_Name", sRPCellName, flags)
    SetCursorPosition(13)
    _AddTextOption("$mrt_MarkofArkay_Respawn_Cell_FormID", sRPCellFormID, flags)
    SetCursorPosition(15)
    if fDistance < 0.0
      _AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", sRPDistance, flags)
    else
      if fDistance <= 999999
        _AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", fDistance As Int, flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Dis_From_Respawn", "+999999", flags)
      endif
    endif
    SetCursorPosition(17)
    _AddHeaderOption("$mrt_MarkofArkay_HEAD_History")
    SetCursorPosition(19)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iTotalBleedOut > 99999999
        _AddTextOption("$Bleedouts", "+99999999", flags)
      else
        _AddTextOption("$Bleedouts", iTotalBleedOut, flags)
      endif
    else
      _AddTextOption("$Bleedouts", "$Disabled", flags)
    endif
    SetCursorPosition(21)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iTotalRevives > 99999999
        _AddTextOption("$Revivals", "+99999999", flags)
      else
        _AddTextOption("$Revivals", iTotalRevives, flags)
      endif
    else
      _AddTextOption("$Revivals", "$Disabled", flags)
    endif
    SetCursorPosition(23)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iRevivesByFollower > 99999999
        _AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", iRevivesByFollower, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Revive_By_Follower", "$Disabled", flags)
    endif
    SetCursorPosition(25)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iRevivesByPotion > 99999999
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", iRevivesByPotion, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Revive_With_Potion", "$Disabled", flags)
    endif
    SetCursorPosition(27)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iRevivesByRevivalSpell > 99999999
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", iRevivesByRevivalSpell, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Revive_With_Revival_Spell", "$Disabled", flags)
    endif
    SetCursorPosition(29)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iRevivesBySacrificeSpell > 99999999
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", iRevivesBySacrificeSpell, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Revive_With_Sacrifice_Spell", "$Disabled", flags)
    endif
    SetCursorPosition(31)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iRevivesByTrade > 99999999
        _AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", iRevivesByTrade, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Revive_By_Trading", "$Disabled", flags)
    endif
    SetCursorPosition(33)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iTotalRespawn > 99999999
        _AddTextOption("$Respawns", "+99999999", flags)
      else
        _AddTextOption("$Respawns", iTotalRespawn, flags)
      endif
    else
      _AddTextOption("$Respawns", "$Disabled", flags)
    endif
    SetCursorPosition(35)
    if bIsInfoEnabled && (moaState.getValue() == 1)
      if iDestroyedItems > 99999999
        _AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "+99999999", flags)
      else
        _AddTextOption("$mrt_MarkofArkay_Destroyed_Items", iDestroyedItems, flags)
      endif
    else
      _AddTextOption("$mrt_MarkofArkay_Destroyed_Items", "$Disabled", flags)
    endif
  elseif (page == "$Presets")
    SetCursorPosition(0)
    _AddHeaderOption("$Presets")
    SetCursorPosition(2)
    if moaState.getValue() == 1 && bFISSOK && !bIsLocked()
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoadPreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sGetPresets()[iLoadPreset], flags)
    SetCursorPosition(3)
    if moaState.getValue() == 1 && bFISSOK
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSavePreset_M = AddMenuOption("$mrt_MarkofArkay_Preset_M", sGetPresets()[iSavePreset], flags)
    SetCursorPosition(4)
    if moaState.getValue() == 1 && bFISSOK && !bIsLocked()
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoadPreset1 = _AddTextOption("$mrt_MarkofArkay_Load_Preset", "", flags)
    SetCursorPosition(5)
    if moaState.getValue() == 1 && bFISSOK
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidSavePreset1 = _AddTextOption("$mrt_MarkofArkay_Save_Preset", "", flags)
    SetCursorPosition(8)
    if moaState.getValue() == 1 && !bIsLocked()
      flags = OPTION_FLAG_NONE
    else
      flags = OPTION_FLAG_DISABLED
    endif
    oidLoadDefaultPreset = _AddTextOption("$mrt_MarkofArkay_Load_Default_Preset", "", flags)
  endif
endevent

event OnUpdate()
  moaIsBusy.SetValueInt(0)
  if moaState.GetValue() == 1
    Debug.notification("$mrt_MarkofArkay_Notification_Init")
  endif
endevent

event OnVersionUpdate(int a_version)
  bIsUpdating = True
  if CurrentVersion > 0 && CurrentVersion < 300
    Debug.Trace("MarkOfArkay: [Error] Can't update because too old(" + CurrentVersion + "<" + a_version + ")")
    ModVersionError.Show()
    return
  endif

  ; a_version is the new version, CurrentVersion is the old version
  if (a_version >= 301 && CurrentVersion < 301)
    Debug.Trace(self + ": Updating script to version " + 301)
    setTaverns()

    ;init()
  endif
  bIsUpdating = False
  ForcePageReset()
endevent

function ForceCloseMenu()
  ;ForcePageReset()
  UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.ConfigPanelClose") ; mcm
  UI.Invoke("Journal Menu", "_root.QuestJournalFader.Menu_mc.CloseMenu") ; quest journal
  Utility.Wait(0.5)
endfunction

Int function GetVersion()
  return 301
endfunction

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
  bShiftBackRespawn = False
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
  moaLootChance.SetValue(100.0 - fLootChanceSlider)
  fScrollChanceSlider = 25.0
  moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
  iNotTradingAftermath = 1
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
  bOnlyInfectIfHasBaseDis = False
  bSoulMarkCureDiseases = False
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
  bVoicelessCurse = False
  bGhostCurse = False
  bLiteGhostCurse = False
  bCreaturesCanSteal = False
  moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
  bNPCHasLevelRange = False
  moaNPCHasLevelRange.SetValue(bNPCHasLevelRange As Int)
  bMoralityMatters = True
  moaMoralityMatters.SetValue(bMoralityMatters As Int)
  iTeleportLocation = 14
  iExternalIndex = -1
  fRPMinDistanceSlider = 500.0
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
  fLowerNPCMaxLvlDiff = 10.0
  fHigherNPCMaxLvlDiff = 10.0
  iSpawnMinLevel = 4
  iSpawnMaxLevel = 4
  bIsLoggingEnabled = False
  bIsInfoEnabled = True
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
  iRapistGender = 0
  iSexInterface = 0
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
  fMaxItemsToCheckSlider = 100.0
  fBossChestChanceSlider = 0.0
  fSimpleSlaveryChanceSlider = 0.0
  fRapeChanceSlider = 0.0
  fMaxRapes = 1.0
  fMaxRapists = 1.0
  bOnlyEnslavedByEnemyFaction = False
  bSlaveryOnlyAfterRape = False
  bOnlyHostilesRape = True
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
  setTypes(True)
  revivescript.itemscript.resetChecked()
  setRPFlags(True)
  setSpawnCounts(True)
  setSpawnWeights(True)
  SetCustomRPFlags()
  recalcCursedDisCureCosts()
endfunction

function SetCustomRPFlags()
  Bool[] bSlotflags = new Bool[4]
  bSlotflags[0] = False
  bSlotflags[1] = False
  bSlotflags[2] = False
  bSlotflags[3] = False
  Int i = 0
  while i < fTotalCustomRPSlotSlider As Int
    bSlotflags[i] = True
    i += 1
  endwhile
  if iSelectedCustomRPSlot + 1 > fTotalCustomRPSlotSlider As Int
    bSlotflags[(fTotalCustomRPSlotSlider As Int) - 1] = False
    bSlotflags[iSelectedCustomRPSlot] = True
  endif
  i = CustomRespawnPoints.GetSize()
  while i > 0
    i -= 1
    if bSlotflags[i]
      (CustomRespawnPoints.GetAt(i) As ObjectReference).Enable()
    else
      (CustomRespawnPoints.GetAt(i) As ObjectReference).Disable()
    endif
  endwhile
endfunction

function SetSavingOption(Int iIndex)
  PlayerRef.DispelSpell(ArkayBlessing)
  SetInChargen(False, False, False)
  if (iIndex == 3 || iIndex == 4) ;PrayToSave
    SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
    moaPraytoSave.SetValue(1.0)
  else
    moaPraytoSave.SetValue(0.0)
    if (iIndex == 2) ;After Sleep
      SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
    endif
  endif
endfunction

function SetTypes(Bool bForce=False)
  if bIsUpdating || iValidTypes.Length != 10 || bForce
    iValidTypes = new Int[10]
    iValidTypes[0] = iGetType(23, bLoseScroll)
    iValidTypes[1] = iGetType(26, bLoseArmor)
    iValidTypes[2] = iGetType(27, bLoseBook)
    iValidTypes[3] = iGetType(30, bLoseIngredient)
    iValidTypes[4] = iGetType(32, bLoseMisc)
    iValidTypes[5] = iGetType(41, bLoseWeapon)
    iValidTypes[6] = iGetType(42, bLoseAmmo)
    iValidTypes[7] = iGetType(45, bLoseKey)
    iValidTypes[8] = iGetType(46, bLosePotion)
    iValidTypes[9] = iGetType(52, bLoseSoulgem)
  endif
endfunction

function ShowCustomSlotsInfo()
  Int i = 0
  String sParentName
  String sType
  while i < CustomRespawnPoints.GetSize()
    if !isCustomSlotEmpty(i)
      sParentName = getRefPlaceName(CustomRespawnPoints.GetAt(i) As ObjectReference)
      if !sParentName
        sParentName = "No Name"
      endif
      if (CustomRespawnPoints.GetAt(i) As ObjectReference).IsInInterior()
        sType = "Interior"
      else
        sType = "Exterior"
      endif
      Debug.Notification("Mark of Arkay - " + (i + 1) + ": " + sParentName + " (" + sType + ")")
    else
      Debug.Notification("Mark of Arkay - " + (i + 1) + ": Empty")
    endif
    i += 1
  endwhile
endfunction

function ShowExtraRPInfo(Int iFirstIndex=0, Int iLen=0, Int iList=0)
  FormList kList
  if iList == 1
    kList = ReviveScript.RespawnScript.MergedExternalMarkerSubList
  elseif iList == 2
    kList = ReviveScript.RespawnScript.ExtraCustomMarkerList
  endif
  Int i = iFirstIndex
  Int iLast
  if kList
    iLast = kList.GetSize() - 1
  else
    iLast = moaERPCount.GetValueInt() - 1
  endif
  if iLen > 0
    iLast = imin(iFirstIndex + (iLen - 1), iLast)
  endif
  String sParentName
  String sParentType
  ObjectReference kMarker
  while i < iLast + 1
    if kList
      kMarker = kList.GetAt(i) As ObjectReference
    else
      kMarker = getFromMergedFormList(MergedExternalMarkerList, i) As ObjectReference
    endif
    if kMarker
      sParentName = getRefPlaceName(kMarker)
      if !sParentName
        sParentName = "No Name"
      endif
      if kMarker.IsInInterior()
        sParentType = "Interior"
      else
        sParentType = "Exterior"
      endif
      Debug.Notification("Mark of Arkay - " + (i + 1) + ": " + sParentName + " (" + sParentType + ")")
    else
      Debug.Notification("Mark of Arkay - " + (i + 1) + ": Empty")
    endif
    i += 1
  endwhile
endfunction

function ShowLostItems()
  UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
  if !ListMenu || LostItemsChest.GetNumItems() == 0
    return
  endif
  String sText
  int count = LostItemsChest.GetNumItems()
  Int iResult = 0
  if count < 128
    Int i = 0
    Form kItem
    while i < LostItemsChest.GetNumItems()
      kItem = LostItemsChest.GetNthForm(i)
      if kItem
        if kItem.GetName()
          sText = LostItemsChest.GetItemCount(kItem) + " " + kItem.GetName()
        else
          sText = LostItemsChest.GetItemCount(kItem) + " ?"
        endif
      else
        sText = "?"
      endif
      if GetLength(sText) > 40
        sText = Substring(sText, 0, 37) + "..."
      endif
      listMenu.AddEntryItem(sText, -1, -1, False)
      i += 1
    endwhile
    listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_Exit", -1, -1, False)
    ForceCloseMenu()
    listMenu.OpenMenu(none, none)
    iResult = listMenu.GetResultInt()
    while iResult > -1 && iResult < LostItemsChest.GetNumItems()
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
      moaLostItemMenu.Show(iType, kItem.GetGoldValue(), LostItemsChest.GetItemCount(kItem), kItem.GetWeight(), iFormID)
      Debug.Notification("Mark of Arkay - Name: " + kItem.GetName())
      Debug.Notification("Mark of Arkay - Type: " + sType)
      Debug.Notification("Mark of Arkay - Form ID: " + sDecToHex(iFormID))
      listMenu.OpenMenu(none, none)
      iResult = listMenu.GetResultInt()
    endwhile
    listMenu.ResetMenu()
  else
    Int iPage = 1
    Int iPrevPage = -1
    Int iTotal = 124
    Int iTotalPages = (Count / iTotal) As Int
    Int iLast = 127 ;Index of last item in last page
    if (Count % iTotal) > 0
      iTotalPages += 1
      iLast = (Count % iTotal) + 3
    endif
    ForceCloseMenu()
    Int i
    Form kItem
    while iPage > 0
      if iPrevPage != iPage
        iPrevPage = iPage
        listMenu.ResetMenu()
        if iPage == 1
          listMenu.AddEntryItem((iPage + 1) + "/" + iTotalPages + " >", -1, -1, False)
        else
          listMenu.AddEntryItem("< " + (iPage - 1) + "/" + iTotalPages + "", -1, -1, False)
        endif
        listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_GoToPage", -1, -1, False)
        i = ((iPage - 1) * iTotal)
        while i < iMin((iPage * iTotal), LostItemsChest.GetNumItems())
          kItem = LostItemsChest.GetNthForm(i)
          if kItem
            if kItem.GetName()
              sText = LostItemsChest.GetItemCount(kItem) + " " + kItem.GetName()
            else
              sText = LostItemsChest.GetItemCount(kItem) + " ?"
            endif
          else
            sText = "?"
          endif
          if GetLength(sText) > 40
            sText = Substring(sText, 0, 37) + "..."
          endif
          listMenu.AddEntryItem(sText, -1, -1, False)
          i += 1
        endwhile
        if iPage < iTotalPages
          listMenu.AddEntryItem((iPage + 1) + "/" + iTotalPages + " >", -1, -1, False)
        else
          listMenu.AddEntryItem("< " + (iPage - 1) + "/" + iTotalPages, -1, -1, False)
        endif
        listMenu.AddEntryItem("$mrt_MarkofArkay_TXT_Exit", -1, -1, False)
      endif
      listMenu.OpenMenu(none, none)
      iResult = listMenu.GetResultInt()
      if iResult == -1
        iPage = 0
        listMenu.ResetMenu()
      else
        if (iPage < iTotalPages && iResult == 126) || (iPage == iTotalPages && iResult == (iLast - 1))
          if iPage < iTotalPages
            iPage += 1
          else
            iPage -= 1
          endif
        elseif (iPage < iTotalPages && iResult == 127) || (iPage == iTotalPages && iResult == iLast)
          iPage = 0
          listMenu.ResetMenu()
        elseif iResult == 0
          if iPage > 1
            iPage -= 1
          else
            iPage += 1
          endif
        elseif iResult == 1
          UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
          TextMenu.OpenMenu(none, none)
          String sResult = TextMenu.GetResultString()
          i = 0
          Bool bIsDigit = True
          while (i < getLength(sResult) && bIsDigit)
            if !IsDigit(GetNthChar(sResult, i))
              bIsDigit = False
            endif
            i += 1
          endwhile
          if bIsDigit
            if ((sResult As Int) >= 1 && (sResult As Int) <= iTotalPages)
              iPage = sResult As Int
            endif
          endif
        else
          Int iIndex = ((iPage - 1) * iTotal) + (iResult - 2)
          kItem = LostItemsChest.GetNthForm(iIndex)
          Int iType = kItem.GetType()
          String sType = sType(iType)
          Int iFormID = kItem.GetFormID()
          Debug.Notification("Mark of Arkay - Name: " + kItem.GetName())
          Debug.Notification("Mark of Arkay - Type: " + sType)
          Debug.Notification("Mark of Arkay - Form ID: " + sDecToHex(iFormID))
          moaLostItemMenu.Show(iType, kItem.GetGoldValue(), LostItemsChest.GetItemCount(kItem), kItem.GetWeight(), iFormID)
        endif
      endif
    endwhile
  endif
endfunction

function ShowLostSkills()
  UIListMenu ListMenu = uiextensions.GetMenu("UIListMenu", True) as UIListMenu
  if !ListMenu || !ReviveScript.SkillScript.bSkillReduced()
    return
  endif
  String sText
  Int i = 0
  while i < ReviveScript.SkillScript.sSKillName.Length
    sText = ReviveScript.SkillScript.iLostSkills[i] + " " + ReviveScript.SkillScript.sSKillName[i]
    listMenu.AddEntryItem(sText, -1, -1, false)
    i += 1
  endwhile
  sText = ReviveScript.SkillScript.iGetReducedSkillsCount(True) + " Skills"
  listMenu.AddEntryItem(sText, -1, -1, false)
  ForceCloseMenu()
  listMenu.OpenMenu(none, none)
  listMenu.ResetMenu()
endfunction

function ToggleDeferredKill(Bool bToggle)
  if bToggle
    PlayerRef.StartDeferredKill()
  else
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
    PlayerRef.RestoreActorValue("health", 10000)
    if !bWasEssential
      Utility.Wait(0.1)
      PlayerRef.GetActorBase().SetEssential(False)
    endif
    ReviveScript.moaIgnoreBleedout.SetValue(0)
  endif
endfunction

function ToggleFallDamage(Bool bFallDamage)
  if !bFallDamage
    if !(fJumpFallHeightMinDefault == 100000.00)
      SetGameSettingFloat("fJumpFallHeightMin", fJumpFallHeightMinDefault)
    else
      SetGameSettingFloat("fJumpFallHeightMin", 600.00)
    endif
  else
    if !(GetGameSettingFloat("fJumpFallHeightMin") == 100000.00)
      fJumpFallHeightMinDefault = GetGameSettingFloat("fJumpFallHeightMin")
    else
      fJumpFallHeightMinDefault = 600.00
    endif
    SetGameSettingFloat("fJumpFallHeightMin", 100000.00)
  endif
  bIsNoFallDamageEnabled = bFallDamage
endfunction

int function _AddHeaderOption(string a_text, int a_flags=0)
  return AddHeaderOption(a_text, a_flags)
endfunction

int function _AddTextOption(string a_text, string a_value, int a_flags=0)
  return AddTextOption(a_text, a_value, a_flags)
endfunction

function _SetMenuOptionValue(int a_option, string a_value, bool a_noUpdate=false)
  SetMenuOptionValue(a_option, a_value, a_noUpdate)
endfunction

function _SetOptionFlags(int a_option, int a_flags, bool a_noUpdate=false)
  SetOptionFlags(a_option, a_flags, a_noUpdate)
endfunction

function _SetSliderOptionValue(int a_option, float a_value, string a_formatString="{0}", bool a_noUpdate=false)
  SetSliderOptionValue(a_option, a_value, a_formatString, a_noUpdate)
endfunction

function _SetTextOptionValue(int a_option, string a_value, bool a_noUpdate=false)
  SetTextOptionValue(a_option, a_value, a_noUpdate)
endfunction

; -----------------because papyrus compiler nags about default values ----------------
function _SetToggleOptionValue(Int option, bool checked, Bool noupdate=False)
  SetToggleOptionValue(option, checked, noupdate)
endfunction

bool function _ShowMessage(string a_message, bool a_withCancel=true, string a_acceptLabel="$Accept", string a_cancelLabel="$Cancel")
  return ShowMessage(a_message, a_withCancel, a_acceptLabel, a_cancelLabel)
endfunction

Bool function bCanContinue()
  return ((!bRespawnCounter && !bLockPermaDeath) || (fRespawnCounterSlider > 0))
endfunction

Bool function bCheckARCC()
  Int iARCCIndex = Game.GetModByName("mrt_ARCC.esp")
  return (iARCCIndex > 0 && iARCCIndex < 255)
endfunction

Bool function bCheckFISS()
  Int iFissIndex = Game.GetModByName("FISS.esp")
  return (iFissIndex > 0 && iFissIndex < 255 && bSKSELoaded && ((SKSE.GetVersion() == 1 && SKSE.GetPluginVersion("fiss") != -1) || (SKSE.GetVersion() == 2 && SKSE.GetPluginVersion("fisses") != -1)))
endfunction

Bool function bCheckFissErrors(String strErrors)
  String[] resultArr = Split(strErrors, "\n")
  Int index = resultArr.Length
  Bool Result = True
  String strError
  while index > 0
    index -= 1
    strError = resultArr[index]
    if strError == "Element bDoNotStopCombat not found"
      bDoNotStopCombat = False
    elseif strError == "Element bDoNotStopCombatAfterRevival not found"
      bDoNotStopCombatAfterRevival = True
    elseif strError == "Element bAlwaysSpawn not found"
      bAlwaysSpawn = False
    elseif strError == "Element bOnlySpawn not found"
      bOnlySpawn = False
    elseif strError == "Element bOnlyLoseSkillXP not found"
      bOnlyLoseSkillXP = False
    elseif strError == "Element fHealthPercTrigger not found"
      fHealthPercTrigger = 0.00
    elseif strError == "Element fSimpleSlaveryChanceSlider not found"
      fSimpleSlaveryChanceSlider = 0.00
    elseif strError == "Element fRapeChanceSlider not found"
      fRapeChanceSlider = 0.00
    elseif strError == "Element fMaxRapes not found"
      fMaxRapes = 1.00
    elseif strError == "Element fMaxRapists not found"
      fMaxRapists = 1.00
    elseif strError == "Element fDisChanceSlider not found"
      fDisChanceSlider = 25.00
    elseif strError == "Element fDisProgChanceSlider not found"
      fDisProgChanceSlider = 50.00
    elseif strError == "Element fDisPriceSlider not found"
      fDisPriceSlider = 100.00
      recalcCursedDisCureCosts()
    elseif strError == "Element fValueMarkScaleSlider not found"
      fValueMarkScaleSlider = 0.00
    elseif strError == "Element fValueGSoulGemScaleSlider not found"
      fValueGSoulGemScaleSlider = 0.00
    elseif strError == "Element fValueBSoulGemScaleSlider not found"
      fValueBSoulGemScaleSlider = 0.00
    elseif strError == "Element fValueSoulScaleSlider not found"
      fValueSoulScaleSlider = 0.00
    elseif strError == "Element fValueGoldScaleSlider not found"
      fValueGoldScaleSlider = 0.00
    elseif strError == "Element fDisPriceMultSlider not found"
      fDisPriceMultSlider = 0.5
      recalcCursedDisCureCosts()
    elseif strError == "Element fBossChestChanceSlider not found"
      fBossChestChanceSlider = 0.0
    elseif strError == "Element bMultipleDis not found"
      bMultipleDis = True
    elseif strError == "Element bDiseaseCurse not found"
      bDiseaseCurse = False
    elseif strError == "Element bMultipleDisProg not found"
      bMultipleDisProg = True
    elseif strError == "Element bOnlyInfectIfHasBaseDis not found"
      bOnlyInfectIfHasBaseDis = False
    elseif strError == "Element bSoulMarkCureDiseases not found"
      bSoulMarkCureDiseases = False
    elseif strError == "Element bGhostCurse not found"
      bGhostCurse = False
    elseif strError == "Element bLiteGhostCurse not found"
      bLiteGhostCurse = False
    elseif strError == "Element bVoicelessCurse not found"
      bVoicelessCurse = False
    elseif strError == "Element bCureDisIfHasBlessing not found"
      bCureDisIfHasBlessing = False
      moaCureDisIfHasBlessing.SetValueInt(0)
    elseif strError == "Element bBossChestOnlyCurLoc not found"
      bBossChestOnlyCurLoc = False
      moaOnlyInCurLocChest.SetValueInt(0)
    elseif strError == "Element bBossChestNotInClearedLoc not found"
      bBossChestNotInClearedLoc = True
      moaBossChestNotInclearedLoc.SetValueInt(0)
    elseif strError == "Element bOnlyEnslavedByEnemyFaction not found"
      bOnlyEnslavedByEnemyFaction = False
    elseif strError == "Element bSlaveryOnlyAfterRape not found"
      bSlaveryOnlyAfterRape = False
    elseif strError == "Element bOnlyHostilesRape not found"
      bOnlyHostilesRape = True
    elseif strError == "Element bNPCHasLevelRange not found"
      bNPCHasLevelRange = True
      moaNPCHasLevelRange.SetValueInt(0)
    elseif strError == "Element fHigherNPCMaxLvlDiff not found"
      fHigherNPCMaxLvlDiff = 10.0
    elseif strError == "Element fLowerNPCMaxLvlDiff not found"
      fLowerNPCMaxLvlDiff = 10.0
    elseif strError == "Element fMaxItemsToCheckSlider not found"
      fMaxItemsToCheckSlider = 100.0
    elseif strError == "Element bCanbeKilledbyUnarmed not found"
      bCanbeKilledbyUnarmed = True
    elseif strError == "Element bRespawnPointsFlags8 not found"
      bRespawnPointsFlags[8] = True
    elseif strError == "Element bRespawnPointsFlags9 not found"
      bRespawnPointsFlags[9] = True
    else
      Debug.Trace("Mark of Arkay: Error loading user settings -> " + strError)
      Result = False
    endif
  endwhile
  return Result
endfunction

Bool function bCheckPO3()
  Int[] PO3Ver = PO3_SKSEFunctions.GetPapyrusExtenderVersion()

  ;if PO3Ver.Length > 2
  ;	Debug.trace("powerofthree's Papyrus Extender version: "+PO3Ver[0]+"."+PO3Ver[1]+"."+PO3Ver[2])
  ;EndIf
  return (PO3Ver.Length > 2 && PO3Ver[0] > 4)
endfunction

;Bool Function bCheckDLIE()
;	Return bSKSELoaded && SKSE.GetPluginVersion("DSL Level Up Event Plugin") != -1 && DSL_LevelIncreaseEvent.bIsDLIELoaded()
;EndFunction
Bool function bCheckPUtil()
  return bSKSELoaded && ((SKSE.GetPluginVersion("papyrusutil plugin") != -1) || (SKSE.GetPluginVersion("papyrusutil") != -1))
endfunction

Bool function bCheckPreset(FISSInterface fiss, String sFileName)
  fiss.beginLoad(sFileName)
  String Result = fiss.endLoad()
  if Result != ""
    Debug.Trace("Mark of Arkay: Error loading user settings -> " + Result)
    return False
  endif
  return True
endfunction

Bool function bCheckSKSE()
  bSKSELoaded = SKSE.GetVersion()
  if bSKSELoaded
    return (SKSE.GetVersion() == 1 && SKSE.GetVersionRelease() >= 43) || (SKSE.GetVersion() == 2 && SKSE.GetVersionRelease() >= 54)
  else
    Debug.Notification("$mrt_MarkofArkay_Notification_SKSE_Error")
    Debug.Trace("MarkOfArkay: [Error] SKSE not found.")
    return False
  endif
endfunction

Bool function bCheckUIE()
  Int iExtsIndex = Game.GetModByName("UIExtensions.esp")
  return (iExtsIndex > 0 && iExtsIndex < 255)
endfunction

Bool function bIsLocked()
  return (bMarkRecallCostLock || bTradeLock || bLootChanceLock || bCurseLock || bSaveLock)
endfunction

Bool function bLoadUserSettings(String sFileName)
  FISSInterface fiss = FISSFactory.getFISS()
  if !fiss
    Debug.Trace("Mark of Arkay: Error saving user settings -> FISS not installed. Loading disabled.")
    return False
  endif
  if !bCheckPreset(fiss, sFileName)
    return False
  endif
  fiss.beginLoad(sFileName)
  bIsRevivalEnabled = fiss.loadBool("bIsRevivalEnabled")
  fValueSnoozeSlider = checkFloat(fiss.loadFloat("fValueSnoozeSlider"), 0, 60, 0)
  bIsMarkEnabled = fiss.loadBool("bIsMarkEnabled")
  bIsGSoulGemEnabled = fiss.loadBool("bIsGSoulGemEnabled")
  bIsBSoulGemEnabled = fiss.loadBool("bIsBSoulGemEnabled")
  bIsDragonSoulEnabled = fiss.loadBool("bIsDragonSoulEnabled")
  bIsGoldEnabled = fiss.loadBool("bIsGoldEnabled")
  fValueMarkSlider = checkFloat(fiss.loadFloat("fValueMarkSlider"), 0, 100, 1)
  fValueGSoulGemSlider = checkFloat(fiss.loadFloat("fValueGSoulGemSlider"), 0, 100, 1)
  fValueBSoulGemSlider = checkFloat(fiss.loadFloat("fValueBSoulGemSlider"), 0, 100, 1)
  fValueSoulSlider = checkFloat(fiss.loadFloat("fValueSoulSlider"), 0, 100, 1)
  fValueGoldSlider = checkFloat(fiss.loadFloat("fValueGoldSlider"), 0, 100000, 1000)
  iSaveOption = checkInt(fiss.loadInt("iSaveOption"), 0, sGetSaveOptions().Length - 1, 1)
  SetSavingOption(iSaveOption)
  iHostileOption = checkInt(fiss.loadInt("iHostileOption"), 0, sGetHostileOptions().Length - 1, 0)
  bIsNoFallDamageEnabled = fiss.loadBool("bIsNoFallDamageEnabled")
  ToggleFallDamage(!bIsNoFallDamageEnabled)
  bIsEffectEnabled = fiss.loadBool("bIsEffectEnabled")
  bIsPotionEnabled = fiss.loadBool("bIsPotionEnabled")
  bAutoDrinkPotion = fiss.loadBool("bAutoDrinkPotion")
  bShiftBackRespawn = fiss.loadBool("bShiftBackRespawn")
  bIsRecallRestricted = fiss.loadBool("bIsRecallRestricted")
  bAutoSwitchRP = fiss.loadBool("bAutoSwitchRP")
  fMarkCastSlider = checkFloat(fiss.loadFloat("fMarkCastSlider"), 0, 100, 0)
  fRecallCastSlider = checkFloat(fiss.loadFloat("fRecallCastSlider"), 0, 100, 0)
  bIsMenuEnabled = fiss.loadBool("bIsMenuEnabled")
  fMarkPSlider = checkFloat(fiss.loadFloat("fMarkPSlider"), 1, 5, 5)
  fGoldPSlider = checkFloat(fiss.loadFloat("fGoldPSlider"), 1, 5, 4)
  fDragonSoulPSlider = checkFloat(fiss.loadFloat("fDragonSoulPSlider"), 1, 5, 3)
  fGSoulgemPSlider = checkFloat(fiss.loadFloat("fGSoulgemPSlider"), 1, 5, 2)
  fBSoulgemPSlider = checkFloat(fiss.loadFloat("fBSoulgemPSlider"), 1, 5, 1)
  fBleedoutTimeSlider = checkFloat(fiss.loadFloat("fBleedoutTimeSlider"), 3, 20, 6)
  fRecoveryTimeSlider = checkFloat(fiss.loadFloat("fRecoveryTimeSlider"), 1, 20, 1)
  fLootChanceSlider = checkFloat(fiss.loadFloat("fLootChanceSlider"), 0, 100, 50)
  moaLootChance.SetValue(100.0 - fLootChanceSlider)
  fScrollChanceSlider = checkFloat(fiss.loadFloat("fScrollChanceSlider"), 0, 100, 25)
  moaScrollChance.SetValue(100.0 - fScrollChanceSlider)
  iNotTradingAftermath = checkInt(fiss.loadInt("iNotTradingAftermath"), 0, sGetAftermathOptions().Length - 1, 1)
  iArkayCurse = checkInt(fiss.loadInt("iArkayCurse"), 0, sGetArkayCurses().Length - 1, 0)
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
  bSoulMarkCureDiseases = fiss.loadBool("bSoulMarkCureDiseases")
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
  bVoicelessCurse = fiss.loadBool("bVoicelessCurse")
  bGhostCurse = fiss.loadBool("bGhostCurse")
  bLiteGhostCurse = fiss.LoadBool("bLiteGhostCurse")
  bCreaturesCanSteal = fiss.loadBool("bCreaturesCanSteal")
  moaCreaturesCanSteal.SetValue(bCreaturesCanSteal As Int)
  bNPCHasLevelRange = fiss.loadBool("bNPCHasLevelRange")
  moaNPCHasLevelRange.SetValue(bNPCHasLevelRange As Int)
  iTeleportLocation = checkInt(fiss.loadInt("iTeleportLocation"), 0, sRespawnPoints.Length - 1, 14)
  iExternalIndex = checkInt(fiss.loadInt("iExternalIndex"), 0, sExtraRPs.Length - 1, -1)
  fRPMinDistanceSlider = checkFloat(fiss.loadFloat("fRPMinDistanceSlider"), 0, 10000, 500)
  moaRPMinDistance.SetValue(fRPMinDistanceSlider)
  fDisChanceSlider = checkFloat(fiss.loadFloat("fDisChanceSlider"), 0, 100, 25)
  fDisPriceSlider = checkFloat(fiss.loadFloat("fDisPriceSlider"), 0, 10000, 100)
  fValueMarkScaleSlider = checkFloat(fiss.loadFloat("fValueMarkScaleSlider"), 0, 10, 0)
  fValueGSoulGemScaleSlider = checkFloat(fiss.loadFloat("fValueGSoulGemScaleSlider"), 0, 10, 0)
  fValueBSoulGemScaleSlider = checkFloat(fiss.loadFloat("fValueBSoulGemScaleSlider"), 0, 10, 0)
  fValueSoulScaleSlider = checkFloat(fiss.loadFloat("fValueSoulScaleSlider"), 0, 10, 0)
  fValueGoldScaleSlider = checkFloat(fiss.loadFloat("fValueGoldScaleSlider"), 0, 10, 0)
  fDisPriceMultSlider = checkFloat(fiss.loadFloat("fDisPriceMultSlider"), 0, 10, 0.5)
  fDisProgChanceSlider = checkFloat(fiss.loadFloat("fDisProgChanceSlider"), 0, 100, 50)
  bRespawnPointsFlags[0] = fiss.loadBool("bRespawnPointsFlags0")
  bRespawnPointsFlags[1] = fiss.loadBool("bRespawnPointsFlags1")
  bRespawnPointsFlags[2] = fiss.loadBool("bRespawnPointsFlags2")
  bRespawnPointsFlags[3] = fiss.loadBool("bRespawnPointsFlags3")
  bRespawnPointsFlags[4] = fiss.loadBool("bRespawnPointsFlags4")
  bRespawnPointsFlags[5] = fiss.loadBool("bRespawnPointsFlags5")
  bRespawnPointsFlags[6] = fiss.loadBool("bRespawnPointsFlags6")
  bRespawnPointsFlags[7] = fiss.loadBool("bRespawnPointsFlags7")
  bRespawnPointsFlags[8] = fiss.loadBool("bRespawnPointsFlags8")
  bRespawnPointsFlags[9] = fiss.loadBool("bRespawnPointsFlags9")
  iSpawnCounts[0] = checkInt(fiss.loadInt("iSpawnCounts0"), 1, 10, 1)
  iSpawnCounts[1] = checkInt(fiss.loadInt("iSpawnCounts1"), 1, 10, 1)
  iSpawnCounts[2] = checkInt(fiss.loadInt("iSpawnCounts2"), 1, 10, 1)
  iSpawnCounts[3] = checkInt(fiss.loadInt("iSpawnCounts3"), 1, 10, 1)
  iSpawnCounts[4] = checkInt(fiss.loadInt("iSpawnCounts4"), 1, 10, 1)
  iSpawnCounts[5] = checkInt(fiss.loadInt("iSpawnCounts5"), 1, 10, 1)
  iSpawnCounts[6] = checkInt(fiss.loadInt("iSpawnCounts6"), 1, 10, 1)
  iSpawnCounts[7] = checkInt(fiss.loadInt("iSpawnCounts7"), 1, 10, 1)
  iSpawnCounts[8] = checkInt(fiss.loadInt("iSpawnCounts8"), 1, 10, 1)
  iSpawnCounts[9] = checkInt(fiss.loadInt("iSpawnCounts9"), 1, 10, 1)
  iSpawnCounts[10] = checkInt(fiss.loadInt("iSpawnCounts10"), 1, 10, 1)
  iSpawnCounts[11] = checkInt(fiss.loadInt("iSpawnCounts11"), 1, 10, 1)
  iSpawnCounts[12] = checkInt(fiss.loadInt("iSpawnCounts12"), 1, 10, 1)
  iSpawnCounts[13] = checkInt(fiss.loadInt("iSpawnCounts13"), 1, 10, 1)
  iSpawnCounts[14] = checkInt(fiss.loadInt("iSpawnCounts14"), 1, 10, 1)
  iSpawnCounts[15] = checkInt(fiss.loadInt("iSpawnCounts15"), 1, 10, 1)
  iSpawnCounts[16] = checkInt(fiss.loadInt("iSpawnCounts16"), 1, 10, 1)
  iSpawnCounts[17] = checkInt(fiss.loadInt("iSpawnCounts17"), 1, 10, 1)
  iSpawnCounts[18] = checkInt(fiss.loadInt("iSpawnCounts18"), 1, 10, 1)
  iSpawnCounts[19] = checkInt(fiss.loadInt("iSpawnCounts19"), 1, 10, 1)
  iSpawnCounts[20] = checkInt(fiss.loadInt("iSpawnCounts20"), 1, 10, 1)
  iSpawnCounts[21] = checkInt(fiss.loadInt("iSpawnCounts21"), 1, 10, 1)
  iSpawnCounts[22] = checkInt(fiss.loadInt("iSpawnCounts22"), 1, 10, 1)
  iSpawnCounts[23] = checkInt(fiss.loadInt("iSpawnCounts23"), 1, 10, 1)
  iSpawnCounts[24] = checkInt(fiss.loadInt("iSpawnCounts24"), 1, 10, 1)
  iSpawnCounts[25] = checkInt(fiss.loadInt("iSpawnCounts25"), 1, 10, 1)
  iSpawnCounts[26] = checkInt(fiss.loadInt("iSpawnCounts26"), 1, 10, 1)
  iSpawnCounts[27] = checkInt(fiss.loadInt("iSpawnCounts27"), 1, 10, 1)
  iSpawnWeights[0] = checkInt(fiss.loadInt("iSpawnWeights0"), 0, 100, 1)
  iSpawnWeights[1] = checkInt(fiss.loadInt("iSpawnWeights1"), 0, 100, 1)
  iSpawnWeights[2] = checkInt(fiss.loadInt("iSpawnWeights2"), 0, 100, 1)
  iSpawnWeights[3] = checkInt(fiss.loadInt("iSpawnWeights3"), 0, 100, 1)
  iSpawnWeights[4] = checkInt(fiss.loadInt("iSpawnWeights4"), 0, 100, 1)
  iSpawnWeights[5] = checkInt(fiss.loadInt("iSpawnWeights5"), 0, 100, 1)
  iSpawnWeights[6] = checkInt(fiss.loadInt("iSpawnWeights6"), 0, 100, 1)
  iSpawnWeights[7] = checkInt(fiss.loadInt("iSpawnWeights7"), 0, 100, 1)
  iSpawnWeights[8] = checkInt(fiss.loadInt("iSpawnWeights8"), 0, 100, 1)
  iSpawnWeights[9] = checkInt(fiss.loadInt("iSpawnWeights9"), 0, 100, 1)
  iSpawnWeights[10] = checkInt(fiss.loadInt("iSpawnWeights10"), 0, 100, 1)
  iSpawnWeights[11] = checkInt(fiss.loadInt("iSpawnWeights11"), 0, 100, 1)
  iSpawnWeights[12] = checkInt(fiss.loadInt("iSpawnWeights12"), 0, 100, 1)
  iSpawnWeights[13] = checkInt(fiss.loadInt("iSpawnWeights13"), 0, 100, 1)
  iSpawnWeights[14] = checkInt(fiss.loadInt("iSpawnWeights14"), 0, 100, 1)
  iSpawnWeights[15] = checkInt(fiss.loadInt("iSpawnWeights15"), 0, 100, 1)
  iSpawnWeights[16] = checkInt(fiss.loadInt("iSpawnWeights16"), 0, 100, 1)
  iSpawnWeights[17] = checkInt(fiss.loadInt("iSpawnWeights17"), 0, 100, 1)
  iSpawnWeights[18] = checkInt(fiss.loadInt("iSpawnWeights18"), 0, 100, 1)
  iSpawnWeights[19] = checkInt(fiss.loadInt("iSpawnWeights19"), 0, 100, 1)
  iSpawnWeights[20] = checkInt(fiss.loadInt("iSpawnWeights20"), 0, 100, 1)
  iSpawnWeights[21] = checkInt(fiss.loadInt("iSpawnWeights21"), 0, 100, 1)
  iSpawnWeights[22] = checkInt(fiss.loadInt("iSpawnWeights22"), 0, 100, 1)
  iSpawnWeights[23] = checkInt(fiss.loadInt("iSpawnWeights23"), 0, 100, 1)
  iSpawnWeights[24] = checkInt(fiss.loadInt("iSpawnWeights24"), 0, 100, 1)
  iSpawnWeights[25] = checkInt(fiss.loadInt("iSpawnWeights25"), 0, 100, 1)
  iSpawnWeights[26] = checkInt(fiss.loadInt("iSpawnWeights26"), 0, 100, 1)
  iSpawnWeights[27] = checkInt(fiss.loadInt("iSpawnWeights27"), 0, 100, 1)
  iSpawnMinLevel = checkInt(fiss.loadInt("iSpawnMinLevel"), 0, sGetSpawnLevels().Length - 1, 4)
  iSpawnMaxLevel = checkInt(fiss.loadInt("iSpawnMaxLevel"), 0, sGetSpawnLevels().Length - 1, 4)
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
  iReducedSkill = checkInt(fiss.loadInt("iReducedSkill"), 0, sGetSkills().Length - 1, 0)
  bSkillReduceRandomVal = fiss.loadBool("bSkillReduceRandomVal")
  fSkillReduceValSlider = checkFloat(fiss.loadFloat("fSkillReduceValSlider"), 1, 100, 10)
  fSkillReduceMinValSlider = checkFloat(fiss.loadFloat("fSkillReduceMinValSlider"), 0, 99, 0)
  fSkillReduceMaxValSlider = checkFloat(fiss.loadFloat("fSkillReduceMaxValSlider"), 0, 99, 1)
  bShowRaceMenu = fiss.loadBool("bShowRaceMenu")
  bLoseSkillForever = fiss.loadBool("bLoseSkillForever")
  bIsRagdollEnabled = fiss.loadBool("bIsRagdollEnabled")
  iLoseInclusion = checkInt(fiss.loadInt("iLoseInclusion"), 0, sGetLoseInclusions().Length - 1, 0)
  iRapistGender = checkInt(fiss.loadInt("iRapistGender"), 0, sGetGenders().Length - 1, 0)
  iSexInterface = checkInt(fiss.loadInt("iSexInterface"), 0, sGetSexInterface().Length - 1, 0)
  fRespawnTimeSlider = checkFloat(fiss.loadFloat("fRespawnTimeSlider"), 0, 744, 0)
  if fRespawnTimeSlider > 0.0
    bShowTimeScaleWarning = False
  endif
  bRandomItemCurse = fiss.loadBool("bRandomItemCurse")
  bMoreRandomRespawn = fiss.loadBool("bMoreRandomRespawn")
  fMinLoseGoldSlider = checkFloat(fiss.loadFloat("fMinLoseGoldSlider"), 0, 100000, 50)
  fMaxLoseGoldSlider = checkFloat(fiss.loadFloat("fMaxLoseGoldSlider"), 0, 100000, 250)
  bLoseGoldAll = fiss.loadBool("bLoseGoldAll")
  bLoseArkayMarkAll = fiss.loadBool("bLoseArkayMarkAll")
  fMinLoseArkayMarkSlider = checkFloat(fiss.loadFloat("fMinLoseArkayMarkSlider"), 0, 100, 0)
  fMaxLoseArkayMarkSlider = checkFloat(fiss.loadFloat("fMaxLoseArkayMarkSlider"), 0, 100, 1)
  bLoseDragonSoulAll = fiss.loadBool("bLoseDragonSoulAll")
  fMinLoseDragonSoulSlider = checkFloat(fiss.loadFloat("fMinLoseDragonSoulSlider"), 0, 100, 0)
  fMaxLoseDragonSoulSlider = checkFloat(fiss.loadFloat("fMaxLoseDragonSoulSlider"), 0, 100, 1)
  bLoseBlackSoulGemAll = fiss.loadBool("bLoseBlackSoulGemAll")
  fMinLoseBlackSoulGemSlider = checkFloat(fiss.loadFloat("fMinLoseBlackSoulGemSlider"), 0, 100, 0)
  fMaxLoseBlackSoulGemSlider = checkFloat(fiss.loadFloat("fMaxLoseBlackSoulGemSlider"), 0, 100, 1)
  bLoseGrandSoulGemAll = fiss.loadBool("bLoseGrandSoulGemAll")
  fMaxLoseGrandSoulGemSlider = checkFloat(fiss.loadFloat("fMaxLoseGrandSoulGemSlider"), 0, 100, 1)
  fMinLoseGrandSoulGemSlider = checkFloat(fiss.loadFloat("fMinLoseGrandSoulGemSlider"), 0, 100, 0)
  fLoseOtherMinValueSlider = checkFloat(fiss.loadFloat("fLoseOtherMinValueSlider"), 0, 1000, 0)
  fLoseOtherTotalValueSlider = checkFloat(fiss.loadFloat("fLoseOtherTotalValueSlider"), 0, 1000000, 0)
  fMaxItemsToCheckSlider = checkFloat(fiss.loadFloat("fMaxItemsToCheckSlider"), 0, 10000, 100)
  fHigherNPCMaxLvlDiff = checkFloat(fiss.loadFloat("fHigherNPCMaxLvlDiff"), 0, 200, 10)
  fLowerNPCMaxLvlDiff = checkFloat(fiss.loadFloat("fLowerNPCMaxLvlDiff"), 0, 200, 10)
  fHealthPercTrigger = checkFloat(fiss.loadFloat("fHealthPercTrigger"), 0, 25, 0)
  fSimpleSlaveryChanceSlider = checkFloat(fiss.loadFloat("fSimpleSlaveryChanceSlider"), 0, 100, 0)
  fRapeChanceSlider = checkFloat(fiss.loadFloat("fRapeChanceSlider"), 0, 100, 0)
  fMaxRapes = checkFloat(fiss.loadFloat("fMaxRapes"), 1, 5, 1)
  fMaxRapists = checkFloat(fiss.loadFloat("fMaxRapists"), 1, 4, 1)
  fBossChestChanceSlider = checkFloat(fiss.loadFloat("fBossChestChanceSlider"), 0, 100, 0)
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

  ;If bLevelReduce
  ;	ReviveScript.SkillScript.RegisterForLevel()
  ;EndIf
  bOnlyLoseSkillXP = fiss.loadBool("bOnlyLoseSkillXP")
  bSpawnHostile = fiss.loadBool("bSpawnHostile")
  bBossChestOnlyCurLoc = fiss.loadBool("bBossChestOnlyCurLoc")
  moaOnlyInCurLocChest.SetValueInt(bBossChestOnlyCurLoc As Int)
  bBossChestNotInClearedLoc = fiss.loadBool("bBossChestNotInClearedLoc")
  moaBossChestNotInclearedLoc.SetValue(bBossChestNotInClearedLoc As Int)
  bOnlyEnslavedByEnemyFaction = fiss.loadBool("bOnlyEnslavedByEnemyFaction")
  bSlaveryOnlyAfterRape = fiss.loadBool("bSlaveryOnlyAfterRape")
  bOnlyHostilesRape = fiss.loadBool("bOnlyHostilesRape")
  bAlwaysSpawn = fiss.loadBool("bAlwaysSpawn")
  bOnlySpawn = fiss.loadBool("bOnlySpawn")
  bDisableUnsafe = fiss.loadBool("bDisableUnsafe")
  iSelectedCustomRPSlot = checkInt(fiss.loadInt("iSelectedCustomRPSlot"), 0, sCustomRPs.Length - 1, 0)
  fTotalCustomRPSlotSlider = checkFloat(fiss.loadFloat("fTotalCustomRPSlotSlider"), 1, 4, 1)
  bDoNotStopCombat = fiss.loadBool("bDoNotStopCombat")
  bDoNotStopCombatAfterRevival = fiss.loadBool("bDoNotStopCombatAfterRevival")
  setTypes(True)
  revivescript.itemscript.resetChecked()
  SetCustomRPFlags()
  recalcCursedDisCureCosts()
  if bDisableUnsafe
    fRespawnTimeSlider = 0.0
  endif
  String Result = fiss.endLoad()
  if Result != ""
    if bCheckFissErrors(Result)
      bSaveUserSettings(sFileName)
      return True
    endif
    return False
  endif
  return True
endfunction

bool function bSaveUserSettings(String sFileName)
  FISSInterface fiss = FISSFactory.getFISS()
  if !fiss
    Debug.Trace("Mark of Arkay: Error saving user settings -> FISS not installed. Saving disabled.")
    return False
  endif
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
  fiss.saveBool("bSoulMarkCureDiseases", bSoulMarkCureDiseases)
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
  fiss.saveBool("bVoicelessCurse", bVoicelessCurse)
  fiss.saveBool("bGhostCurse", bGhostCurse)
  fiss.saveBool("bLiteGhostCurse", bLiteGhostCurse)
  fiss.saveBool("bCreaturesCanSteal", bCreaturesCanSteal)
  fiss.saveBool("bNPCHasLevelRange", bNPCHasLevelRange)
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
  fiss.saveBool("bRespawnPointsFlags8", bRespawnPointsFlags[8])
  fiss.saveBool("bRespawnPointsFlags9", bRespawnPointsFlags[9])
  fiss.SaveInt("iSpawnCounts0", iSpawnCounts[0])
  fiss.SaveInt("iSpawnCounts1", iSpawnCounts[1])
  fiss.SaveInt("iSpawnCounts2", iSpawnCounts[2])
  fiss.SaveInt("iSpawnCounts3", iSpawnCounts[3])
  fiss.SaveInt("iSpawnCounts4", iSpawnCounts[4])
  fiss.SaveInt("iSpawnCounts5", iSpawnCounts[5])
  fiss.SaveInt("iSpawnCounts6", iSpawnCounts[6])
  fiss.SaveInt("iSpawnCounts7", iSpawnCounts[7])
  fiss.SaveInt("iSpawnCounts8", iSpawnCounts[8])
  fiss.SaveInt("iSpawnCounts9", iSpawnCounts[9])
  fiss.SaveInt("iSpawnCounts10", iSpawnCounts[10])
  fiss.SaveInt("iSpawnCounts11", iSpawnCounts[11])
  fiss.SaveInt("iSpawnCounts12", iSpawnCounts[12])
  fiss.SaveInt("iSpawnCounts13", iSpawnCounts[13])
  fiss.SaveInt("iSpawnCounts14", iSpawnCounts[14])
  fiss.SaveInt("iSpawnCounts15", iSpawnCounts[15])
  fiss.SaveInt("iSpawnCounts16", iSpawnCounts[16])
  fiss.SaveInt("iSpawnCounts17", iSpawnCounts[17])
  fiss.SaveInt("iSpawnCounts18", iSpawnCounts[18])
  fiss.SaveInt("iSpawnCounts19", iSpawnCounts[19])
  fiss.SaveInt("iSpawnCounts20", iSpawnCounts[20])
  fiss.SaveInt("iSpawnCounts21", iSpawnCounts[21])
  fiss.SaveInt("iSpawnCounts22", iSpawnCounts[22])
  fiss.SaveInt("iSpawnCounts23", iSpawnCounts[23])
  fiss.SaveInt("iSpawnCounts24", iSpawnCounts[24])
  fiss.SaveInt("iSpawnCounts25", iSpawnCounts[25])
  fiss.SaveInt("iSpawnCounts26", iSpawnCounts[26])
  fiss.SaveInt("iSpawnCounts27", iSpawnCounts[27])
  fiss.SaveInt("iSpawnWeights0", iSpawnWeights[0])
  fiss.SaveInt("iSpawnWeights1", iSpawnWeights[1])
  fiss.SaveInt("iSpawnWeights2", iSpawnWeights[2])
  fiss.SaveInt("iSpawnWeights3", iSpawnWeights[3])
  fiss.SaveInt("iSpawnWeights4", iSpawnWeights[4])
  fiss.SaveInt("iSpawnWeights5", iSpawnWeights[5])
  fiss.SaveInt("iSpawnWeights6", iSpawnWeights[6])
  fiss.SaveInt("iSpawnWeights7", iSpawnWeights[7])
  fiss.SaveInt("iSpawnWeights8", iSpawnWeights[8])
  fiss.SaveInt("iSpawnWeights9", iSpawnWeights[9])
  fiss.SaveInt("iSpawnWeights10", iSpawnWeights[10])
  fiss.SaveInt("iSpawnWeights11", iSpawnWeights[11])
  fiss.SaveInt("iSpawnWeights12", iSpawnWeights[12])
  fiss.SaveInt("iSpawnWeights13", iSpawnWeights[13])
  fiss.SaveInt("iSpawnWeights14", iSpawnWeights[14])
  fiss.SaveInt("iSpawnWeights15", iSpawnWeights[15])
  fiss.SaveInt("iSpawnWeights16", iSpawnWeights[16])
  fiss.SaveInt("iSpawnWeights17", iSpawnWeights[17])
  fiss.SaveInt("iSpawnWeights18", iSpawnWeights[18])
  fiss.SaveInt("iSpawnWeights19", iSpawnWeights[19])
  fiss.SaveInt("iSpawnWeights20", iSpawnWeights[20])
  fiss.SaveInt("iSpawnWeights21", iSpawnWeights[21])
  fiss.SaveInt("iSpawnWeights22", iSpawnWeights[22])
  fiss.SaveInt("iSpawnWeights23", iSpawnWeights[23])
  fiss.SaveInt("iSpawnWeights24", iSpawnWeights[24])
  fiss.SaveInt("iSpawnWeights25", iSpawnWeights[25])
  fiss.SaveInt("iSpawnWeights26", iSpawnWeights[26])
  fiss.SaveInt("iSpawnWeights27", iSpawnWeights[27])
  fiss.SaveInt("iSpawnMinLevel", iSpawnMinLevel)
  fiss.SaveInt("iSpawnMaxLevel", iSpawnMaxLevel)
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
  fiss.saveInt("iRapistGender", iRapistGender)
  fiss.saveInt("iSexInterface", iSexInterface)
  fiss.saveBool("bSkillReduceRandomVal", bSkillReduceRandomVal)
  fiss.saveFloat("fSkillReduceValSlider", fSkillReduceValSlider)
  fiss.saveFloat("fSkillReduceMinValSlider", fSkillReduceMinValSlider)
  fiss.saveFloat("fSkillReduceMaxValSlider", fSkillReduceMaxValSlider)
  fiss.saveBool("bShowRaceMenu", bShowRaceMenu)
  fiss.saveBool("bLoseSkillForever", bLoseSkillForever)
  fiss.saveBool("bIsRagdollEnabled", bIsRagdollEnabled)
  fiss.SaveFloat("fRespawnTimeSlider", fRespawnTimeSlider)
  fiss.SaveBool("bDisableUnsafe", bDisableUnsafe)
  fiss.SaveBool("bRandomItemCurse", bRandomItemCurse)
  fiss.SaveBool("bMoreRandomRespawn", bMoreRandomRespawn)
  fiss.saveFloat("fMinLoseGoldSlider", fMinLoseGoldSlider)
  fiss.saveFloat("fMaxLoseGoldSlider", fMaxLoseGoldSlider)
  fiss.saveBool("bLoseGoldAll", bLoseGoldAll)
  fiss.saveBool("bLoseArkayMarkAll", bLoseArkayMarkAll)
  fiss.saveFloat("fMinLoseArkayMarkSlider", fMinLoseArkayMarkSlider)
  fiss.saveFloat("fMaxLoseArkayMarkSlider", fMaxLoseArkayMarkSlider)
  fiss.saveBool("bLoseDragonSoulAll", bLoseDragonSoulAll)
  fiss.saveFloat("fMinLoseDragonSoulSlider", fMinLoseDragonSoulSlider)
  fiss.saveFloat("fMaxLoseDragonSoulSlider", fMaxLoseDragonSoulSlider)
  fiss.saveBool("bLoseBlackSoulGemAll", bLoseBlackSoulGemAll)
  fiss.saveFloat("fMinLoseBlackSoulGemSlider", fMinLoseBlackSoulGemSlider)
  fiss.saveFloat("fMaxLoseBlackSoulGemSlider", fMaxLoseBlackSoulGemSlider)
  fiss.saveBool("bLoseGrandSoulGemAll", bLoseGrandSoulGemAll)
  fiss.saveFloat("fMaxLoseGrandSoulGemSlider", fMaxLoseGrandSoulGemSlider)
  fiss.saveFloat("fMinLoseGrandSoulGemSlider", fMinLoseGrandSoulGemSlider)
  fiss.saveFloat("fLoseOtherMinValueSlider", fLoseOtherMinValueSlider)
  fiss.saveFloat("fLoseOtherTotalValueSlider", fLoseOtherTotalValueSlider)
  fiss.saveFloat("fMaxItemsToCheckSlider", fMaxItemsToCheckSlider)
  fiss.saveFloat("fBossChestChanceSlider", fBossChestChanceSlider)
  fiss.saveFloat("fHealthPercTrigger", fHealthPercTrigger)
  fiss.saveFloat("fSimpleSlaveryChanceSlider", fSimpleSlaveryChanceSlider)
  fiss.saveFloat("fRapeChanceSlider", fRapeChanceSlider)
  fiss.saveFloat("fMaxRapes", fMaxRapes)
  fiss.saveFloat("fMaxRapists", fMaxRapists)
  fiss.saveBool("bExcludeQuestItems", bExcludeQuestItems)
  fiss.saveBool("bLoseItem", bLoseItem)
  fiss.saveBool("bLoseGold", bLoseGold)
  fiss.saveBool("bLoseArkayMark", bLoseArkayMark)
  fiss.saveBool("bLoseBlackSoulGem", bLoseBlackSoulGem)
  fiss.saveBool("bLoseGrandSoulGem", bLoseGrandSoulGem)
  fiss.saveBool("bLoseDragonSoul", bLoseDragonSoul)
  fiss.saveBool("bLoseOthers", bLoseOthers)
  fiss.saveBool("bLoseAmmo", bLoseAmmo)
  fiss.saveBool("bLoseBook", bLoseBook)
  fiss.saveBool("bLoseArmor", bLoseArmor)
  fiss.saveBool("bLoseWeapon", bLoseWeapon)
  fiss.saveBool("bLoseMisc", bLoseMisc)
  fiss.saveBool("bLoseKey", bLoseKey)
  fiss.saveBool("bLoseSoulgem", bLoseSoulgem)
  fiss.saveBool("bLosePotion", bLosePotion)
  fiss.saveBool("bLoseScroll", bLoseScroll)
  fiss.saveBool("bLoseIngredient", bLoseIngredient)
  fiss.saveBool("bCheckKeyword", bCheckKeyword)
  fiss.saveBool("bCheckWeight", bCheckWeight)
  fiss.saveBool("bLevelReduce", bLevelReduce)
  fiss.saveBool("bOnlyLoseSkillXP", bOnlyLoseSkillXP)
  fiss.saveInt("iSelectedCustomRPSlot", iSelectedCustomRPSlot)
  fiss.SaveFloat("fTotalCustomRPSlotSlider", fTotalCustomRPSlotSlider)
  fiss.SaveFloat("fHigherNPCMaxLvlDiff", fHigherNPCMaxLvlDiff)
  fiss.SaveFloat("fLowerNPCMaxLvlDiff", fLowerNPCMaxLvlDiff)
  fiss.SaveBool("bSpawnHostile", bSpawnHostile)
  fiss.SaveBool("bBossChestOnlyCurLoc", bBossChestOnlyCurLoc)
  fiss.SaveBool("bBossChestNotInClearedLoc", bBossChestNotInClearedLoc)
  fiss.SaveBool("bOnlyEnslavedByEnemyFaction", bOnlyEnslavedByEnemyFaction)
  fiss.SaveBool("bSlaveryOnlyAfterRape", bSlaveryOnlyAfterRape)
  fiss.SaveBool("bOnlyHostilesRape", bOnlyHostilesRape)
  fiss.SaveBool("bAlwaysSpawn", bAlwaysSpawn)
  fiss.SaveBool("bOnlySpawn", bOnlySpawn)
  fiss.saveBool("bDoNotStopCombat", bDoNotStopCombat)
  fiss.saveBool("bDoNotStopCombatAfterRevival", bDoNotStopCombatAfterRevival)
  String Result = fiss.endSave()
  if Result != ""
    Debug.Trace("Mark of Arkay: Error saving user settings -> " + Result)
    return False
  endif
  return True
endfunction

function checkMods()
  bSKSEOK = bCheckSKSE()

  ;bDLIEOK = bCheckDLIE()
  bUIEOK = bCheckUIE()
  bFISSOK = bCheckFISS()
  bARCCOK = bCheckARCC()
  bPUOK = bCheckPUtil()
  moaUIExtensionStatus.SetValueInt(bUIEOK As Int)
  bPO3Ok = bCheckPO3()
endfunction

Int function getCheckpointRPIndex()
  return sRespawnPoints.Length - 4
endfunction

Int function getCustomRPIndex()
  return sRespawnPoints.Length - 6
endfunction

Int function getExternalRPIndex()
  return sRespawnPoints.Length - 5
endfunction

Int function getNearbyCityRPIndex()
  return sRespawnPoints.Length - 10
endfunction

Int function getNearbyInnRPIndex()
  return sTaverns.Length - 2
endfunction

Int function getNearbyRPIndex()
  return sRespawnPoints.Length - 3
endfunction

Int function getRandCityRPIndex()
  return sRespawnPoints.Length - 9
endfunction

Int function getRandInnRPIndex()
  return sTaverns.Length - 1
endfunction

Int function getRandomRPIndex()
  return sRespawnPoints.Length - 2
endfunction

String[] function getRefPlaceInfo(ObjectReference akRef)
  String[] sInfos = new String[2]
  if akRef.GetParentCell() && akRef.GetParentCell().GetName()
    sInfos[0] = akRef.GetParentCell().GetName()
    sInfos[1] = akRef.GetParentCell().GetFormID()
  elseif akRef.GetCurrentLocation() && akRef.GetCurrentLocation().GetName()
    sInfos[0] = akRef.GetCurrentLocation().GetName()
    sInfos[1] = akRef.GetCurrentLocation().GetFormID()
  elseif akRef.GetWorldSpace() && akRef.GetWorldSpace().GetName()
    sInfos[0] = akRef.GetWorldSpace().GetName()
    sInfos[1] = akRef.GetWorldSpace().GetFormID()
  endif
  return sInfos
endfunction

String function getRefPlaceName(ObjectReference akRef)
  if akRef.GetParentCell() && akRef.GetParentCell().GetName()
    return akRef.GetParentCell().GetName()
  elseif akRef.GetCurrentLocation() && akRef.GetCurrentLocation().GetName()
    return akRef.GetCurrentLocation().GetName()
  elseif akRef.GetWorldSpace() && akRef.GetWorldSpace().GetName()
    return akRef.GetWorldSpace().GetName()
  endif
  return ""
endfunction

Int function getSleepRPIndex()
  return sRespawnPoints.Length - 7
endfunction

Int function getTavernRPIndex()
  return sRespawnPoints.Length - 8
endfunction

Int function getThroatRPIndex()
  return sRespawnPoints.Length - 1
endfunction

Int function iGetCurSexInterface()
  String[] interfs = sGetSexInterface()
  if interfs[iSexInterface] == "$sexlab"
    return 0
  elseif interfs[iSexInterface] == "$ostim"
    return 1
  elseif interfs[iSexInterface] == "$flowergirls"
    return 2
  endif
  return -1
endfunction

Int function iGetModStatus()
  if moaIsBusy.GetValue() || (moaState.GetValue() == 1 && (PlayerRef.IsBleedingOut() || moaBleedoutHandlerState.GetValue() != 0 || ReviveScript.GetState() != "" || (moaCheckingMarkers.GetValue() != 0.0)))
    return 2
  endif
  PlayerRef.GetCombatState()
  if PlayerRef.GetCombatState() == 1
    return 1
  endif
  return 0
endfunction

Int function iGetType(Int iType, Bool bEnabled)
  return ((iType + iType) * (bEnabled As Int)) - iType
endfunction

function init()
  setArrays()
  SetCustomRPFlags()
endfunction

Bool function isCustomSlotAvailable(Int aiIndex)
  return (CustomRespawnPoints.GetAt(aiIndex) As ObjectReference).IsEnabled()
endfunction

Bool function isCustomSlotEmpty(Int aiIndex)
  return (CustomRespawnPoints.GetAt(aiIndex) As ObjectReference).GetParentCell() == ReviveScript.DefaultCell
endfunction

Bool function isCustomSlotSelected(Int aiIndex)
  return aiIndex == iSelectedCustomRPSlot
endfunction

function moaStart()
  if moaState.GetValue() == 0
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
  endif
endfunction

function moaStop(Bool bReset=False)
  ToggleFallDamage(False)
  if moaState.GetValue() == 1
    moaState.SetValue(0)
    ReviveScript.ItemScript.RestoreLostItems(PlayerRef)
    ReviveScript.NPCScript.RemoveSpawnedThiefs()
    if moaRetrieveLostItems.IsRunning()
      moaRetrieveLostItems.SetStage(20)
    endif
    if moaRetrieveLostItems01.IsRunning()
      moaRetrieveLostItems01.SetStage(20)
    endif
    Int i = CustomRespawnPoints.GetSize()
    while i > 0
      i -= 1
      (CustomRespawnPoints.GetAt(i) As ObjectReference).Enable()
      (CustomRespawnPoints.GetAt(i) As ObjectReference).MoveToMyEditorLocation()
      (CustomRespawnPoints.GetAt(i) As ObjectReference).Disable()
    endwhile
    SleepMarker.MoveToMyEditorLocation()
    SleepMarker.Disable()
    ReviveScript.Fadeout.Remove()
    ReviveScript.FastFadeOut.Remove()
    ReviveScript.BlackScreen.Remove()
    ReviveScript.FadeIn.Remove()
    moaFollowerDetector.Stop()
    moaHostileNPCDetector.Stop()
    moaHostileNPCDetector01.Stop()
    moaGuardDetector.Stop()
    if !bReset
      setTriggerMethod(0)
    else
      StopAndConfirm(moaHealthMonitor, 3)
    endif
    PlayerRef.DispelSpell(GhostVisual)
    PlayerRef.RemoveSpell(GhostVisual)
    StopAndConfirm(moaReviverQuest, 3)
    if !ReviveScript.moaPlayerGhostQuest.IsRunning()
      PlayerRef.SetAlpha(1.0)
    endif
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
    ReviveScript.DiseaseScript.cureAllDiseases(False)
    ReviveScript.RapeScript.unPacify()
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
    SetInChargen(False, False, False)
    moaPraytoSave.SetValue(0.0)
    Debug.SetGodMode(False)
    PlayerRef.SetGhost(False)
    Utility.Wait(1.0)
    Debug.notification("$mrt_MarkofArkay_Notification_Stopped")
  endif
endfunction

function recalcCursedDisCureCosts()
  Int handle = ModEvent.Create("MOA_RecalcCursedDisCureCost")
  if (handle)
    ModEvent.PushForm(handle, self)
    ModEvent.Send(Handle)
  endif
endfunction

String[] function sGetAftermathOptions()
  String[] sAftermathOptions = new String[3]
  sAftermathOptions[0] = "$mrt_MarkofArkay_AftermathOptions_0"
  sAftermathOptions[1] = "$mrt_MarkofArkay_AftermathOptions_1"
  sAftermathOptions[2] = "$mrt_MarkofArkay_AftermathOptions_2"
  return sAftermathOptions
endfunction

String[] function sGetArkayCurses()
  String[] sArkayCurses = new String[3]
  sArkayCurses[0] = "$mrt_MarkofArkay_ArkayCurses_0"
  sArkayCurses[1] = "$mrt_MarkofArkay_ArkayCurses_1"
  sArkayCurses[2] = "$mrt_MarkofArkay_ArkayCurses_2"
  return sArkayCurses
endfunction

String[] function sGetCustomRPs(Bool bFast=False)
  String[] sGetCustomRPSlot = new String[4]
  sGetCustomRPSlot[0] = "$CustopRP_Slot1"
  sGetCustomRPSlot[1] = "$CustopRP_Slot2"
  sGetCustomRPSlot[2] = "$CustopRP_Slot3"
  sGetCustomRPSlot[3] = "$CustopRP_Slot4"
  if !bFast
    Int i = 0
    while i < sGetCustomRPSlot.Length
      if ((CustomRespawnPoints.GetAt(i) As ObjectReference).GetParentCell() != ReviveScript.DefaultCell)
        String[] sPlaceInfos = getRefPlaceInfo(CustomRespawnPoints.GetAt(i) As ObjectReference)
        if sPlaceInfos[0] || sPlaceInfos[1]
          sGetCustomRPSlot[i] = shortenString(((i + 1) As String + ": " + sDecToHex(sPlaceInfos[1] As Int) + " " + sPlaceInfos[0]), 59)
        endif
      endif
      i += 1
    endwhile
  endif
  return sGetCustomRPSlot
endfunction

String[] function sGetGenders()
  String[] sGenders = new String[3]
  sGenders[0] = "$Both"
  sGenders[1] = "$Male"
  sGenders[2] = "$Female"
  return sGenders
endfunction

String[] function sGetGhostShader()
  String[] sGhostShader = new String[13]
  sGhostShader[0] = "$mrt_MarkofArkay_GhostShader_0"
  sGhostShader[1] = "$mrt_MarkofArkay_GhostShader_1"
  sGhostShader[2] = "$mrt_MarkofArkay_GhostShader_2"
  sGhostShader[3] = "$mrt_MarkofArkay_GhostShader_3"
  sGhostShader[4] = "$mrt_MarkofArkay_GhostShader_4"
  sGhostShader[5] = "$mrt_MarkofArkay_GhostShader_5"
  sGhostShader[6] = "$mrt_MarkofArkay_GhostShader_6"
  sGhostShader[7] = "$mrt_MarkofArkay_GhostShader_7"
  sGhostShader[8] = "$mrt_MarkofArkay_GhostShader_8"
  sGhostShader[9] = "$mrt_MarkofArkay_GhostShader_9"
  sGhostShader[10] = "$mrt_MarkofArkay_GhostShader_10"
  sGhostShader[11] = "$mrt_MarkofArkay_GhostShader_11"
  sGhostShader[12] = "$mrt_MarkofArkay_GhostShader_12"
  return sGhostShader
endfunction

String[] function sGetHostileOptions()
  String[] sHostileOptions = new String[3]
  sHostileOptions[0] = "$mrt_MarkofArkay_HostileOptions_0"
  sHostileOptions[1] = "$mrt_MarkofArkay_HostileOptions_1"
  sHostileOptions[2] = "$mrt_MarkofArkay_HostileOptions_2"
  return sHostileOptions
endfunction

String[] function sGetLoseInclusions()
  String[] sLoseInclusions = new String[3]
  sLoseInclusions[0] = "$mrt_MarkofArkay_LoseInclusions_0"
  sLoseInclusions[1] = "$mrt_MarkofArkay_LoseInclusions_1"
  sLoseInclusions[2] = "$mrt_MarkofArkay_LoseInclusions_2"
  return sLoseInclusions
endfunction

String[] function sGetPresets()
  String[] sPresets = new String[10]
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
  return sPresets
endfunction

String[] function sGetSaveOptions()
  String[] sSaveOptions = new String[5]
  sSaveOptions[0] = "$mrt_MarkofArkay_SaveOptions_0"
  sSaveOptions[1] = "$mrt_MarkofArkay_SaveOptions_1"
  sSaveOptions[2] = "$mrt_MarkofArkay_SaveOptions_2"
  sSaveOptions[3] = "$mrt_MarkofArkay_SaveOptions_3"
  sSaveOptions[4] = "$mrt_MarkofArkay_SaveOptions_4"
  return sSaveOptions
endfunction

String[] function sGetSexInterface()
  Int i = 0
  if bIsSexlabActive
    i += 1
  endif
  if bIsOStimActive
    i += 1
  endif
  if bIsFlowerGirlsActive
    i += 1
  endif
  String[] sSexInterfaces = Utility.CreateStringArray(i)
  i = 0
  if bIsSexlabActive
    sSexInterfaces[i] = "$sexlab"
    i += 1
  endif
  if bIsOStimActive
    sSexInterfaces[i] = "$ostim"
    i += 1
  endif
  if bIsFlowerGirlsActive
    sSexInterfaces[i] = "$flowergirls"
    i += 1
  endif
  if iSexInterface > (sSexInterfaces.length - 1)
    iSexInterface = 0
  endif
  return sSexInterfaces
endfunction

String[] function sGetSkills()
  String[] sSkills = new String[28]
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
  return sSkills
endfunction

String[] function sGetSpawnLevels()
  String[] sSpawnLevel = new String[5]
  sSpawnLevel[0] = "$mrt_MarkofArkay_SpawnLevel_0"
  sSpawnLevel[1] = "$mrt_MarkofArkay_SpawnLevel_1"
  sSpawnLevel[2] = "$mrt_MarkofArkay_SpawnLevel_2"
  sSpawnLevel[3] = "$mrt_MarkofArkay_SpawnLevel_3"
  sSpawnLevel[4] = "$mrt_MarkofArkay_SpawnLevel_4"
  return sSpawnLevel
endfunction

String[] function sGetSpawns()
  String[] sSpawns = new String[28]
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
  return sSpawns
endfunction

String function sType(Int iType)
  if iType == 23
    return "Scroll"
  elseif iType == 26
    return "Armor"
  elseif iType == 27
    return "Book"
  elseif iType == 30
    return "Ingredient"
  elseif iType == 32
    return "Misc"
  elseif iType == 41
    return "Weapon"
  elseif iType == 42
    return "Ammo"
  elseif iType == 45
    return "Key"
  elseif iType == 46
    return "Potion"
  elseif iType == 52
    return "Soulgem"
  endif
  return ""
endfunction

function setArrays()
  setPages()
  setRPs()
  setTaverns()
  setRPFlags() ;Only if Changing order without changing length need update
  SetTypes() ;Only if Changing order without changing length need update
  setSpawnCounts() ;Only if Changing order without changing length need update
  setSpawnWeights() ;Only if Changing order without changing length need update
endfunction

function setCustomRPS(Bool bFast=False)
  Debug.TraceConditional("MarkOfArkay: Setting custom markers...", bIsLoggingEnabled)
  sCustomRPs = sGetCustomRPs(bFast)
  Debug.TraceConditional("MarkOfArkay: Setting custom markers finished.", bIsLoggingEnabled)
endfunction

function setExtraRPs(Int aiSize, Bool bFast=False)
  Debug.TraceConditional("MarkOfArkay: Setting extra custom markers...", bIsLoggingEnabled)
  sExtraRPs = Utility.CreateStringArray(aiSize + 1)
  Int i = 0
  while i < aiSize
    sExtraRPs[i] = (i + 1) As String
    if !bFast
      String[] sPlaceInfos = getRefPlaceInfo(getFromMergedFormList(MergedExternalMarkerList, i) As ObjectReference)
      if sPlaceInfos[0] || sPlaceInfos[1]
        sExtraRPs[i] = shortenString(sExtraRPs[i] + ": " + sDecToHex(sPlaceInfos[1] As Int) + " " + sPlaceInfos[0], 59)
      endif
    endif
    i += 1
  endwhile
  sExtraRPs[i] = "$Random"
  Debug.TraceConditional("MarkOfArkay: Setting extra custom markers finished.", bIsLoggingEnabled)
endfunction

function setPages()
  Pages = new String[7]
  pages[0] = "$General"
  pages[1] = "$Extra"
  pages[2] = "$Aftermath"
  pages[3] = "$Curse"
  pages[4] = "NPC"
  pages[5] = "$Debug"
  pages[6] = "$Presets"
endfunction

function setRPFlags(Bool bForce=False)
  if bForce || bIsUpdating || bRespawnPointsFlags.Length != 10
    bRespawnPointsFlags = new Bool[10]
    bRespawnPointsFlags[0] = True
    bRespawnPointsFlags[1] = True
    bRespawnPointsFlags[2] = True
    bRespawnPointsFlags[3] = True
    bRespawnPointsFlags[4] = True
    bRespawnPointsFlags[5] = True
    bRespawnPointsFlags[6] = True
    bRespawnPointsFlags[7] = False
    bRespawnPointsFlags[8] = True
    bRespawnPointsFlags[9] = True
  endif
endfunction

function setRPs()
  sRespawnPoints = new String[18]
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
  sRespawnPoints[10] = "$Inn"
  sRespawnPoints[11] = "$LastSleepLocation"
  sRespawnPoints[12] = "$Custom"
  sRespawnPoints[13] = "$Extra"
  sRespawnPoints[14] = "$Checkpoint"
  sRespawnPoints[15] = "$Nearby"
  sRespawnPoints[16] = "$Random"
  sRespawnPoints[17] = "$ThroatOfTheWorld"
endfunction

function setSpawnCounts(Bool bForce=False)
  if bForce || bIsUpdating || iSpawnCounts.Length != 28
    iSpawnCounts = new Int[28]
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
  endif
endfunction

function setSpawnWeights(Bool bForce=False)
  if bForce || bIsUpdating || iSpawnWeights.Length != 28
    iSpawnWeights = new Int[28]
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
  endif
endfunction

function setTaverns()
  sTaverns = new String[19]
  sTaverns[0] = "$SleepingGiantInn"
  sTaverns[1] = "$TheBanneredMare"
  sTaverns[2] = "$FrostfruitInn"
  sTaverns[3] = "$DeadManDrink"
  sTaverns[4] = "$SilverBloodInn"
  sTaverns[5] = "$OldHroldanInn"
  sTaverns[6] = "$TheBeeandBarb"
  sTaverns[7] = "$TheWinkingSkeever"
  sTaverns[8] = "$FourShieldsTavern"
  sTaverns[9] = "$CandlehearthHall"
  sTaverns[10] = "$BraidwoodInn"
  sTaverns[11] = "$TheFrozenHearth"
  sTaverns[12] = "$TheRetchingNetch"
  sTaverns[13] = "$MoorsideInn"
  sTaverns[14] = "$WindpeakInn"
  sTaverns[15] = "$NightgateInn"
  sTaverns[16] = "$VilemyrInn"
  sTaverns[17] = "$NearbyInn"
  sTaverns[18] = "$RandomInn"
endfunction

function setTriggerMethod(Int iIndex)
  if iIndex == 0
    PlayerRef.GetActorBase().SetEssential(False)
    moaNoKillMoveOnPlayer.SetValue(0)
    StopAndConfirm(moaHealthMonitor)
    ToggleDeferredKill(False)
  elseif iIndex == 1
    PlayerRef.GetActorBase().SetEssential(True)
    PlayerRef.SetNoBleedoutRecovery(True)
    StopAndConfirm(moaHealthMonitor)
    ToggleDeferredKill(False)
  elseif iIndex == 2
    PlayerRef.GetActorBase().SetEssential(False)
    moaNoKillMoveOnPlayer.SetValue(1)
    moaHealthMonitor.Start()
    ToggleDeferredKill(True)
  endif
endfunction
