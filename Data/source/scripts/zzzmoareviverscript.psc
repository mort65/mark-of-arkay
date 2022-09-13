Scriptname zzzmoaReviverScript extends ReferenceAlias

import zzzmoautilscript

FormList property ArkayAmulets auto
Spell property ArkayCurse auto
Spell property ArkayCurseAlt auto
Spell property ArkayCurseTemp auto
Spell property ArkayCurseTempAlt auto
Actor property Attacker auto Hidden
ReferenceAlias property AttackerActor auto
ReferenceAlias property AttackerActor01 auto
MagicEffect property AutoReviveSelf auto
SoulGem property BlackFilledGem auto
ImageSpaceModifier property BlackScreen auto
Spell property Bleed auto
Spell property BleedoutProtection auto
LocationRefType property BossContainer auto
ObjectReference property CellLoadMarker auto
ObjectReference property CellLoadMarker2 auto
Quest property CidhnaMineJailEventScene auto
FormList property CityMarkersList auto
zzzmoaReviveMCM property ConfigMenu auto
Faction property CrimeFaction auto hidden
Int property CrimeGold auto hidden
Int property CrimeGoldViolent auto hidden
Quest property DGIntimidateQuest auto
Message property DeathMessage auto
Topic property DeathTopic auto
Cell property DefaultCell auto
Float property DefaultTimeScale=20.0 auto Hidden
ObjectReference property DetachMarker2 auto
zzzmoadiseasecursescript property DiseaseScript auto
Spell property Dumbness auto
Weapon property DummySword auto
EffectShader property EffectHealCirclFXS auto
Location property EmptyLocation auto
Form property EquippedAmmo auto Hidden
ImageSpaceModifier property FadeIn auto
ImageSpaceModifier property FadeOut auto
ImageSpaceModifier property FastFadeOut auto
Quest property Favor017 auto
zzzmoaflowergirlsinterface property FlowerGirlsInterface auto
MagicEffect property FortifyHealthFFSelf auto
Quest property FreeformRiften19 auto
MiscObject property Gold001 auto
SoulGem property GrandFilledGem auto
Actor property Guard auto Hidden
zzzmoa_HealthMonitor property HealthMonitorScript auto
Keyword property IgnoreItem auto
Perk property Invulnerable auto
zzzmoaitemcursescript property ItemScript auto Hidden
Faction property JobMerchantFaction auto
Form property LeftHandEquippedItem auto Hidden
FormList property LocationBlackList auto
FormList property LocationBlackList2 auto
ObjectReference property LocationMarker auto
ObjectReference property LocationMarker2 auto
ObjectReference property LostItemsChest auto
ObjectReference property LostItemsMarker auto
ImageSpaceModifier property LowHealthImod auto
MiscObject property MarkOfArkay auto
FormList property MarkerList auto
Spell property MassHealing auto
Spell property MassRevival auto
Spell property MoveCustomMarker auto
zzzmoanpcscript property NPCScript auto Hidden
zzzmoaostiminterface property OStimInterface auto
Quest property PermaDeathQuest auto
zzzmoaPermaDeathScript property PermaDeathScript auto Hidden
Faction property PlayerEnemyFaction auto
LocationAlias property PlayerLocRef auto
Actor property PlayerRef auto
FormList property PotionList auto
Actor property PreviousThief auto Hidden
FormList property QuestBlackList auto
zzzmoarapescript property RapeScript auto Hidden
Spell property RecallMarker auto
zzzmoarespawnscript property RespawnScript auto Hidden
Scroll property RevivalScroll auto
Quest property ReviverQuest auto
Form property RightHandEquipedItem auto Hidden
Actor property Runil auto
Faction property RunilMerchantFaction auto
zzzmoa_sd_interface property SDInterface auto
Scroll property SacrificeScroll auto
zzzmoasexlabinterface property SexLabInterface auto
zzzmoaskillcursescript property SkillScript auto Hidden
ObjectReference property SleepMarker auto
Sound property SoulAbsorbExplosion auto
Sound property SoulAbsorbWind auto
Sound property SoundNPCDragonDeathSequenceExplosion auto
Sound property SoundNPCDragonDeathSequenceWind auto
MiscObject property StolenItemsMisc auto
MiscObject property StolenSoulsMisc auto
Actor property Thief auto Hidden
ObjectReference property ThiefMarker auto
ReferenceAlias property ThiefNPC auto
ReferenceAlias property ThiefNPC01 auto
GlobalVariable property TimeScale auto
ObjectReference property ValuableItemsChest auto
Quest property VampireLordQuest auto
Keyword property VendorItemArrow auto
Keyword property VendorItemWeapon auto
Actor property Victim auto Hidden
VisualEffect property VisMagDragonAbsorbEffect auto
VisualEffect property VisMagDragonAbsorbManEffect auto
MagicEffect property VoiceMakeEthereal auto
Quest property WerewolfQuest auto
Bool property bCidhnaJail=False auto Hidden
Bool property bFinished=False auto Hidden
Bool property bInBleedout=False auto Hidden
Bool property bInBleedoutAnim=False auto Hidden
Bool property bInfectingPlayer=False auto Hidden
Bool property bIsConditionSafe=False auto Hidden
Bool property bIsraped=False auto Hidden
Bool property bPlayerIsVoiceless=False auto Hidden
Bool property bReadyForRespawn=False auto Hidden
Bool property bRemoveItems auto Hidden
Bool property bSoulMark=False auto Hidden
Float property fDragonSoulCount=0.0 auto Hidden
Int property iArkayMarkCost=0 auto Hidden
Int property iArkayMarkCount=0 auto Hidden
Int property iBSoulGemCost=0 auto Hidden
Int property iBSoulGemCount=0 auto Hidden
Int property iDragonSoulCost=0 auto Hidden
Int property iGSoulGemCost=0 auto Hidden
Int property iGSoulGemCount=0 auto Hidden
Int property iReducedSkill auto Hidden
Int property iSeptimCost=0 auto Hidden
Int property iSeptimCount=0 auto Hidden
GlobalVariable property moaArkayMarkRevive auto
GlobalVariable property moaBSoulGemRevive auto
GlobalVariable property moaBleedouAnimation auto
GlobalVariable property moaBleedoutHandlerState auto
Quest property moaBossChest01 auto
GlobalVariable property moaDragonSoulRevive auto
GlobalVariable property moaGSoulGemRevive auto
Quest property moaHostileNPCDetector auto
Quest property moaHostileNPCDetector01 auto
GlobalVariable property moaIgnoreBleedout auto
GlobalVariable property moaLockReset auto
Quest property moaPlayerGhostQuest auto
Quest property moaPlayerVoicelessQuest auto
Quest property moaRetrieveLostItems auto
Quest property moaRetrieveLostItems01 auto
Spell property moaReviveAfterEffect auto
Quest property moaReviveMCMscript auto
Message property moaReviveMenu1 auto
GlobalVariable property moaSeptimRevive auto
Quest property moaSoulMark01 auto
GlobalVariable property moaState auto
Quest property moaThiefNPC01 auto

Float[] PriorityArray
Bool UnarmedAttacker = False
Bool bArkayMarkRevive
Bool bBSoulGemRevive
Bool bDidItemsRemoved
Bool bDragonSoulRevive
Bool bGSoulGemRevive
Bool bHasAutoReviveEffect
Bool bIsBusy = False
Bool bParalyzed = False
Bool bPotionRevive
Bool bSacrifice = False
Bool bSeptimRevive
Bool bSheathed = False
Bool bWasSwimming
Float fHealrate = 0.0
Int iChoice
Int iIsBeast = 0
Int iRespawnPointsCount
String strRemovedItem

event OnCellLoad()
  if (Getstate() == "")
    CellLoadMarker2.Enable()
    CellLoadMarker2.MoveTo(CellLoadMarker)
    CellLoadMarker2.SetPosition(CellLoadMarker.GetPositionX(), CellLoadMarker.GetPositionY(), CellLoadMarker.GetPositionZ())
    CellLoadMarker2.SetAngle(0.0, 0.0, CellLoadMarker.GetAngleZ())
    CellLoadMarker.Enable()
    CellLoadMarker.MoveTo(PlayerRef)
    CellLoadMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
    CellLoadMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
    if (ConfigMenu.iSaveOption > 1)
      Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
    endif
  endif
endevent

event OnDeath(Actor akKiller)
  if bFinished
    Game.SetGameSettingFloat("fPlayerDeathReloadTime", 5.00000)
    Game.FadeOutGame(False, True, 2.50000, 3.0000)
    if ConfigMenu.bLockPermaDeath
      PermaDeathScript.PermaDeathMessage.Show()
      Game.PlayBink("CreditsRoll.bik", True, True, False, False)
      Game.QuitToMainMenu()
    else
      PermaDeathScript.NoRespawnMessage.Show()
    endif
  else
    DeathMessage.Show()
  endif
endevent

event OnDying(Actor akKiller)
  clearAll()
endevent

event OnEnterBleedout()
  if !PlayerRef.IsDead() && !bInBleedout && !moaIgnoreBleedout.GetValue()
    bInBleedout = True
    bInBleedoutAnim = False
    bSheathed = False
    Game.DisablePlayerControls()
    fHealrate = PlayerRef.GetActorValue("HealRate")
    PlayerRef.SetActorValue("HealRate", 0.0)
    PlayerRef.RemoveSpell(Bleed)
    PlayerRef.AddSpell(Bleed, False)
    PlayerRef.AddPerk(Invulnerable)
    Debug.SetGodMode(True)
    iIsBeast = NPCScript.iInBeastForm()
    BleedoutHandler(ToggleState())
    if GetState() == ""
      Attacker = None
      PlayerRef.RemoveSpell(Bleed)
      PlayerRef.SetActorValue("HealRate", fHealrate)
      PlayerRef.SetDontMove(False)
      Game.EnablePlayerControls()
      LowHealthImod.Remove()
      moaBleedoutHandlerState.SetValue(0)
      RegisterForSingleUpdate(3.0)
      Game.EnableFastTravel(True)
      ToggleSaving(True)
      bInBleedout = False
    endif
  endif
endevent

event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
  if GetState() == ""
    if (akAggressor As Actor)
      if (akAggressor As Actor) != PlayerRef
        Attacker = akAggressor As Actor
        if !ConfigMenu.bCanBeKilledbyUnarmed
          UnarmedAttacker = (!Attacker.GetEquippedItemType(0) && !Attacker.GetEquippedItemType(1))
        endif
      endif
    else
      Attacker = None
    endif
    checkHealth()
  endif
endevent

event OnInit()
  Utility.Wait(0.1)
  if bIsBusy
    return
  endif
  bIsBusy = True
  moaState.SetValue(1)
  if ConfigMenu.bTriggerOnBleedout
    PlayerRef.GetActorBase().SetEssential(True)
    PlayerRef.SetNoBleedoutRecovery(True)
  elseif ConfigMenu.bTriggerOnHealthPerc
    PlayerRef.StartDeferredKill()
    ConfigMenu.moaHealthMonitor.Start()
  endif
  moaBleedoutHandlerState.SetValue(0)
  PriorityArray = new Float[5]
  SkillScript = ReviverQuest As zzzmoaskillcursescript
  ItemScript = ReviverQuest As zzzmoaitemcursescript
  RespawnScript = ReviverQuest As zzzmoarespawnscript
  NPCScript = ReviverQuest As zzzmoanpcscript
  RapeScript = ReviverQuest As zzzmoarapescript
  PermaDeathScript = PermaDeathQuest As zzzmoaPermaDeathScript
  ConfigMenu.checkMods()
  SetGameVars(True)
  SetVars()
  RegisterForSleep()

  ;If ConfigMenu.bLevelReduce
  ;	SkillScript.RegisterForLevel()
  ;EndIf
  DetachMarker2.Enable()
  DetachMarker2.MoveTo(PlayerRef)
  DetachMarker2.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
  DetachMarker2.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
  if Runil && !Runil.IsDead()
    Runil.AddToFaction(JobMerchantFaction)
    Runil.AddToFaction(RunilMerchantFaction)
    Runil.GetActorBase().SetEssential(True)
  endif
  bIsBusy = False
endevent

event OnLocationChange(Location akOldLoc, Location akNewLoc)
  if (Getstate() == "")
    LocationMarker2.Enable()
    LocationMarker2.MoveTo(LocationMarker)
    LocationMarker2.SetPosition(LocationMarker.GetPositionX(), LocationMarker.GetPositionY(), LocationMarker.GetPositionZ())
    LocationMarker2.SetAngle(0.0, 0.0, LocationMarker.GetAngleZ())
    LocationMarker.Enable()
    LocationMarker.MoveTo(PlayerRef)
    LocationMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
    LocationMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
    if (ConfigMenu.iSaveOption > 1)
      Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
    endif
    if ConfigMenu.bTriggerOnBleedout && !PlayerRef.IsEssential()
      PlayerRef.GetActorBase().SetEssential(True)
      PlayerRef.SetNoBleedoutRecovery(True)
    endif
    if (moaThiefNPC01.IsRunning()) && !moaBossChest01.IsRunning()
      if (moaThiefNPC01.GetStage() == 1) && !Thief || Thief.IsDisabled() || Thief.IsDeleted()
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: " + Thief + " who stoled player's items, is disabled, deleted or no longer exist.")
        if ConfigMenu.bLoseForever
          StopAndConfirm(moaThiefNPC01, 3, 15)
        else
          if Utility.RandomInt(0, 99) < ConfigMenu.fBossChestChanceSlider
            moaBossChest01.Start()
            if moaBossChest01.IsRunning()
              if moaThiefNPC01.IsRunning()
                StopAndConfirm(moaThiefNPC01, 3, 27)
                Utility.Wait(1.0)
              endif
              StopAndConfirm(moaRetrieveLostItems, 3, 10)
              StopAndConfirm(moaRetrieveLostItems01, 3, 10)
              moaBossChest01.SetStage(5)
              return
            endif
          endif
          if ConfigMenu.bSpawnHostile && (ThiefMarker.GetParentCell() != DefaultCell)
            if moaThiefNPC01.IsRunning()
              StopAndConfirm(moaThiefNPC01, 3, 27)
              Utility.Wait(1.0)
            endif
            StopAndConfirm(moaRetrieveLostItems, 3, 10)
            StopAndConfirm(moaRetrieveLostItems01, 3, 10)
            if NPCScript.bSpawnThief(ThiefMarker) && Thief
              ThiefMarker.MoveTo(Thief)
              ItemScript.AddStolenItemMarker(Thief)
              Actor ThiefRef
              Int i = 0
              while i < NPCScript.ThiefActors.Length
                ThiefRef = NPCScript.ThiefActors[i].GetActorReference()
                ThiefRef && ThiefRef.AddToFaction(PlayerEnemyFaction)
                i += 1
              endwhile
              moaThiefNPC01.Start()
              moaRetrieveLostItems01.Start()
              moaRetrieveLostItems01.SetStage(1)
            elseif moaThiefNPC01.IsRunning()
              RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
              StopAndConfirm(moaThiefNPC01, 3, 20)
            endif
          else
            StopAndConfirm(moaThiefNPC01, 3, 20)
          endif
        endif
      endif
    endif
  endif
endevent

event OnObjectEquipped(Form akBaseObject, ObjectReference akReference) ; using equipped spells As workaround a bug which happens when player goes to bleedout while fighting with spell
  if (!PlayerRef.IsBleedingOut() && GetState() == "")
    Utility.Wait(0.5)
    if akBaseObject As Ammo
      if PlayerRef.WornHasKeyword(VendorItemArrow)
        if PlayerRef.IsEquipped(akBaseObject)
          EquippedAmmo = akBaseObject
        endif
      else
        EquippedAmmo = None
      endif
    else
      if !PlayerRef.WornHasKeyword(VendorItemArrow)
        EquippedAmmo = None
      endif
      if PlayerRef.GetEquippedItemType(0) != 0
        LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
      else
        LeftHandEquippedItem = None
      endif
      if PlayerRef.GetEquippedItemType(1) != 0
        RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
      else
        RightHandEquipedItem = None
      endif
    endif
  endif
endevent

event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference) ;SKSE
  if (!PlayerRef.IsBleedingOut() && GetState() == "")
    if !PlayerRef.WornHasKeyword(VendorItemArrow)
      EquippedAmmo = None
    endif
    if PlayerRef.GetEquippedItemType(0) != 0
      LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
    else
      LeftHandEquippedItem = None
    endif
    if PlayerRef.GetEquippedItemType(1) != 0
      RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
    else
      RightHandEquipedItem = None
    endif
  endif
endevent

event OnPlayerLoadGame()
  ConfigMenu.checkMods()
  if PermaDeathScript.bCheckPermaDeath()
    return
  endif
  ConfigMenu.OnGameReload()
  if (ConfigMenu.iSaveOption > 1)
    Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
  endif
  if ConfigMenu.bIsEffectEnabled
    PlayerRef.AddPerk(Invulnerable) ;because when loading a save game usually npcs start moving before player
  endif
  if moaLockReset.GetValueInt() == 1
    ConfigMenu.bMarkRecallCostLock = False
    ConfigMenu.bTradeLock = False
    ConfigMenu.bLootChanceLock = False
    ConfigMenu.bCurseLock = False
    ConfigMenu.bSaveLock = False
    ConfigMenu.bRespawnCounter = False
    ConfigMenu.bLockPermaDeath = False
    moaLockReset.SetValue(0)
  endif
  SetGameVars()
  if bPlayerIsVoiceless
    PlayerRef.SetVoiceRecoveryTime(9999999.0)
  endif
  RegisterForSingleUpdate(3.0)
endevent

event OnRaceSwitchComplete()
  if moaPlayerGhostQuest.IsRunning()
    Game.SetPlayerReportCrime(False)
  endif
endevent

event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
  if (PlayerRef.GetParentCell() != DefaultCell)
    SleepMarker.Enable()
    SleepMarker.MoveTo(PlayerRef)
    SleepMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
    SleepMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
    if ConfigMenu.bAutoSwitchRP
      ConfigMenu.iTeleportLocation = (ConfigMenu.getSleepRPIndex())
    endif
  endif
endevent

event OnSleepStop(Bool abInterrupted)
  if (ConfigMenu.iSaveOption == 2 || ConfigMenu.iSaveOption == 4)
    if (!PlayerRef.IsDead() && !PlayerRef.IsBleedingOut() && GetState() == "")
      Game.SetInChargen(False, False, False)
      RegisterForSingleUpdate(6.0)
    endif
  endif
endevent

event OnUpdate()
  if (ConfigMenu.iSaveOption > 1)
    Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
  endif
  if GetState() == ""
    if bParalyzed
      if bInBleedoutAnim
        if !bSheathed
          PlayerRef.SetDontMove(False)
          Game.EnablePlayerControls()
          PlayerRef.DrawWeapon()
        endif
      else ;auto fix for can't draw weapon, jump,.. after paralysis
        PlayerRef.SetDontMove(False)
        Game.EnablePlayerControls()
        Form rw = PlayerRef.GetEquippedObject(1)
        if rw
          PlayerRef.UnequipItemEx(rw, equipSlot=1, preventEquip=False)
          PlayerRef.EquipItemEx(rw, equipSlot=1, preventUnequip=False, equipSound=True)
        else
          playerRef.AddItem(DummySword As form, abSilent=True)
          PlayerRef.EquipItemEx(DummySword, equipSlot=1, preventUnequip=True, equipSound=True)
          PlayerRef.UnequipItemEx(DummySword, equipSlot=1, preventEquip=True)
          PlayerRef.RemoveItem(DummySword As Form, PlayerRef.GetItemCount(DummySword As Form), abSilent=True)
        endif
      endif
    endif
    bParalyzed = False
    bSheathed = False
    PlayerRef.RemovePerk(Invulnerable)
    Debug.SetGodMode(False)
  endif
endevent

event zzzmoa_ostim_Rape_End(string eventName, string argString, float argNum, form sender)
  if RapeScript.bIsBusy
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rape scene ended.")
    RapeScript.bIsBusy = False
  endif
endevent

event zzzmoa_sexlab_Rape_End(int tid, bool HasPlayer)
  if (RapeScript.bIsBusy && HasPlayer)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rape scene ended.")
    RapeScript.bIsBusy = False
  endif
endevent

event zzzmoa_sexlab_Rape_Ending(int tid, bool HasPlayer)
  if (RapeScript.bIsBusy && HasPlayer)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rape scene is ending.")
    utility.wait(1.0)
    Int i = RapeScript.Equipment.length ;because sexlab stuck when doing this until player open a game menu.
    while i > 0
      i -= 1
      if RapeScript.Equipment[i] As Armor
        if PlayerRef.GetItemCount(RapeScript.Equipment[i]) > 0 && !PlayerRef.IsEquipped(RapeScript.Equipment[i])
          PlayerRef.EquipItemEx(RapeScript.Equipment[i])
          Utility.Wait(0.2)
        endif
      endif
    endwhile
    Game.SetPlayerAIDriven(False)
    Game.SetPlayerAIDriven(True)
  endif
endevent

function AutoRemoveItem(Int i) ;trade without menu
  Int j = i - 1
  Int count = 0
  Bool bBreak = False
  Int iRandom
  if (i > 0) && (((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)) ; this item isn't the last item in the array and next item has the same priority As this item
    while (j > -1) && !bBreak ; checking if there is any other item with the same priority
      if (PriorityArray[j] > 50) && bGSoulGemRevive
        if ((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)
          count += 1
        else
          bBreak = True
        endif
      elseif (PriorityArray[j] > 40) && (PriorityArray[j] < 50) && bArkayMarkRevive
        if ((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)
          count += 1
        else
          bBreak = True
        endif
      elseif (PriorityArray[j] > 30) && (PriorityArray[j] < 40) && bBSoulGemRevive
        if ((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)
          count += 1
        else
          bBreak = True
        endif
      elseif (PriorityArray[j] > 20) && (PriorityArray[j] < 30) && bDragonSoulRevive
        if ((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)
          count += 1
        else
          bBreak = True
        endif
      elseif (PriorityArray[j] > 10) && (PriorityArray[j] < 20) && bSeptimRevive
        if ((PriorityArray[j] As Int) % 10) == ((PriorityArray[i] As Int) % 10)
          count += 1
        else
          bBreak = True
        endif
      else
        bBreak = True
      endif
      j -= 1
    endwhile
    iRandom = i - Utility.RandomInt(0, count) ; selecting a random item from items with the same priority
    AutoRemoveItemByIndex(iRandom) ;
  else
    AutoRemoveItemByIndex(i) ;next item has a lower priority
  endif
endfunction

function AutoRemoveItemByIndex(Int iIndex) ; removing item at iIndex
  if (PriorityArray[iIndex] > 50) && bGSoulGemRevive
    PlayerRef.RemoveItem(GrandFilledGem, iGSoulGemCost, !ConfigMenu.bIsNotificationEnabled)
    strRemovedItem = "Grand Soul Gem"
  elseif (PriorityArray[iIndex] > 40) && (PriorityArray[iIndex] < 50) && bArkayMarkRevive
    PlayerRef.RemoveItem(MarkOfArkay, iArkayMarkCost, !ConfigMenu.bIsNotificationEnabled)
    strRemovedItem = "Arkay Mark"
  elseif (PriorityArray[iIndex] > 30) && (PriorityArray[iIndex] < 40) && bBSoulGemRevive
    PlayerRef.RemoveItem(BlackFilledGem, iBSoulGemCost, !ConfigMenu.bIsNotificationEnabled)
    strRemovedItem = "Black Soul Gem"
  elseif (PriorityArray[iIndex] > 20) && (PriorityArray[iIndex] < 30) && bDragonSoulRevive
    PlayerRef.ModActorValue("DragonSouls", -1 * iDragonSoulCost)
    strRemovedItem = "Dragon Soul"
  elseif (PriorityArray[iIndex] > 10) && (PriorityArray[iIndex] < 20) && bSeptimRevive
    PlayerRef.RemoveItem(Gold001, iSeptimCost, !ConfigMenu.bIsNotificationEnabled)
    strRemovedItem = "Septim"
  endif
endfunction

function BleedoutHandler(String CurrentState)
  if DGIntimidateQuest.IsRunning()
    stopBrawlQuest(DGIntimidateQuest, 180)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: DGIntimidateQuest.")
    GoToState("")
    return
  elseif FreeformRiften19.GetStage() == 30
    stopBrawlQuest(FreeformRiften19, 250)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: FreeformRiften19.")
    GoToState("")
    return
  elseif Favor017.GetStage() == 10
    stopBrawlQuest(Favor017, 200)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: Favor017.")
    GoToState("")
    return
  elseif !ConfigMenu.bCanbeKilledbyUnarmed && UnarmedAttacker && Attacker && Attacker.HasKeyWordString("ActorTypeNPC")
    PlayerRef.ResetHealthAndLimbs()
    !moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after being defeated by an unarmed NPC: " + Attacker)
    GoToState("")
    return
  endif
  if !bIsCameraStateSafe()
    Game.ForceThirdPerson()
  endif
  Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=False, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False, aiDisablePOVType=0)
  if ConfigMenu.bIsRagdollEnabled && (!PlayerRef.GetActorValue("paralysis") && !iIsBeast && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
    PlayerRef.PushActorAway(PlayerRef, 0)
    PlayerRef.SetActorValue("paralysis", 1)
    bParalyzed = True
  else
    bParalyzed = False
  endif
  ToggleSaving(False)
  Game.EnableFastTravel(False)
  if ConfigMenu.iTotalBleedOut < 99999999
    ConfigMenu.iTotalBleedOut += 1
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player entered bleedout.")
  if Thief
    PreviousThief = Thief
  endif
  stopAndConfirm(moaHostileNPCDetector)
  stopAndConfirm(moaHostileNPCDetector01)
  if Attacker && Attacker != PlayerRef
    AttackerActor.ForceRefTo(Attacker)
    AttackerActor01.ForceRefTo(Attacker)
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Last attacker = ( '" + Attacker.GetActorBase().GetName() + "', " + Attacker + ", " + Attacker.GetRace() + ", )")
  else
    Attacker = None
    AttackerActor.Clear()
    AttackerActor01.Clear()
  endif
  if ConfigMenu.iHostileOption == 2
    if ConfigMenu.bNPCHasLevelRange
      Int iMinNPCLevel = PlayerRef.GetLevel() - (ConfigMenu.fLowerNPCMaxLvlDiff As Int)
      Int iMaxNPCLevel = PlayerRef.GetLevel() + (ConfigMenu.fHigherNPCMaxLvlDiff As Int)
      if iMinNPCLevel < 0
        iMinNPCLevel = 1
      endif
      ConfigMenu.moaLowerNPCMaxLvlDiff.SetValueInt(iMinNPCLevel)
      ConfigMenu.moaHigherNPCMaxLvlDiff.SetValueInt(iMaxNPCLevel)
    endif
    moaHostileNPCDetector.Start()
  elseif ConfigMenu.iHostileOption == 1
    moaHostileNPCDetector01.Start()
  endif
  bIsConditionSafe = bIsConditionSafe()
  if (ConfigMenu.bIsRevivalEnabled && PlayerRef.IsSwimming()) ;SKSE
    if bIsConditionSafe && ConfigMenu.bDeathEffect && (ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack)
      PlayerRef.PushActorAway(PlayerRef, 0)
    endif
    bWasSwimming = True
    Game.ForceThirdPerson()
  else
    bWasSwimming = False
  endif
  moaBleedoutHandlerState.SetValue(1)
  LowHealthImod.Remove()
  SetVars()
  if !ConfigMenu.bIsRevivalEnabled
    restore(iRevivePlayer=0, bReviveFollower=False, sTrace="MarkOfArkay: Player won't be revived because revival is not enabled.")
    return
  endif
  NPCScript.DetectFollowers()
  strRemovedItem = ""
  bHasAutoReviveEffect = PlayerRef.HasMagicEffect(AutoReviveSelf)
  Float fHealth = -9000.0
  if bPotionRevive
    PlayerRef.DispelSpell(Bleed)
    fHealth = -10.0
  endif
  if bInBleedoutAnim
    if !PlayerRef.GetActorValuePercentage("health")
      while !PlayerRef.GetActorValuePercentage("health")
        PlayerRef.DamageActorValue("health", -1000)
      endwhile
    endif
    Float fMinHealth = (ConfigMenu.fHealthPercTrigger * (PlayerRef.GetActorValue("health") / PlayerRef.GetActorValuePercentage("health"))) ;fHealthPercTrigger * max health
    if PlayerRef.GetActorValue("health") < (fMinHealth + fHealth)
      PlayerRef.RestoreActorValue("health", (fMinHealth + fHealth) - PlayerRef.GetActorValue("health"))
    elseif PlayerRef.GetActorValue("health") > (fMinHealth + fHealth)
      PlayerRef.DamageActorValue("health", PlayerRef.GetActorValue("health") - (fMinHealth + fHealth))
    endif
  else
    if PlayerRef.GetActorValue("health") < fHealth
      PlayerRef.RestoreActorValue("health", fHealth - PlayerRef.GetActorValue("health"))
    elseif PlayerRef.GetActorValue("health") > fHealth
      PlayerRef.DamageActorValue("health", PlayerRef.GetActorValue("health") - fHealth)
    endif
  endif
  if NPCScript.FollowerCanProtectPlayer()
    ;Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
    if ConfigMenu.iRevivesByFollower < 99999999
      ConfigMenu.iRevivesByFollower += 1
    endif
    if ConfigMenu.iTotalRevives < 99999999
      ConfigMenu.iTotalRevives += 1
    endif
    Restore(iRevivePlayer=2, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=False, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player is alive because of followers.")
    return
  endif
  if ConfigMenu.bAutoDrinkPotion && !NPCScript.bInBeastForm()
    Int iPotion = iHasHealingPotion()
    if iPotion > -1
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving by auto drinking a healing potion...")
      Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
      if !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || (playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger))
        if ConfigMenu.iTotalRevives < 99999999
          ConfigMenu.iTotalRevives += 1
        endif
        Restore(iRevivePlayer=1, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=ConfigMenu.bIsEffectEnabled, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player revived before starting of the revival by auto drinking healing potions.")
        return
      else
        if ConfigMenu.bIsNotificationEnabled
          Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Potion")
        endif
        if ConfigMenu.iRevivesByPotion < 99999999
          ConfigMenu.iRevivesByPotion += 1
        endif
        if ConfigMenu.iTotalRevives < 99999999
          ConfigMenu.iTotalRevives += 1
        endif
        Restore(iRevivePlayer=1, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=ConfigMenu.bIsEffectEnabled, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, iPotionIndex=iPotion, sTrace="MarkOfArkay: Player revived by auto drinking a healing potion.")
        return
      endif
    endif
  endif
  if (bIsRevivable() || bPotionRevive || bHasAutoReviveEffect || Victim || (ConfigMenu.bIsMenuEnabled && (ConfigMenu.moaSnoozeState.GetValue() != 0)))
    if !bPotionRevive || bHasAutoReviveEffect || Victim || NPCScript.bInBeastForm()
      Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
    else
      if bWasSwimming || bInBleedoutAnim
        Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=False, abLooking=False, abSneaking=False, abMenu=True, abActivate=False, abJournalTabs=False)
        PlayerRef.RemovePerk(Invulnerable)
        Debug.SetGodMode(False)
      else
        PlayerRef.SetDontMove(False)
        Game.EnablePlayerControls()
        PlayerRef.RemovePerk(Invulnerable)
        Debug.SetGodMode(False)
      endif
      Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
    endif
    if !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || (playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger)) ;player revived with potion or another script and is alive after 6 secs
      if ConfigMenu.iTotalRevives < 99999999
        ConfigMenu.iTotalRevives += 1
      endif
      Restore(iRevivePlayer=1, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=ConfigMenu.bIsEffectEnabled, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player is not in bleedout. (probably revived by manual drinking of a healing potion.)")
      return
    else
      PlayerRef.AddPerk(Invulnerable)
      Debug.SetGodMode(True)
      bInBleedout = True
      if bHasAutoReviveEffect ;player has cast a revive spell or scroll
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by an auto revival spell or scroll...")
        if ConfigMenu.bIsEffectEnabled
          VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
          VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
          SoulAbsorbWind.Play(PlayerRef)
          SoulAbsorbExplosion.Play(PlayerRef)
          EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
        endif
        Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
        if ConfigMenu.bIsNotificationEnabled
          Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Revival_Scroll")
        endif
        RevivePlayer(True)
        if ConfigMenu.bIsEffectEnabled
          moaReviveAfterEffect.Cast(PlayerRef)
        endif
        if ConfigMenu.iRevivesByRevivalSpell < 99999999
          ConfigMenu.iRevivesByRevivalSpell += 1
        endif
        if ConfigMenu.iTotalRevives < 99999999
          ConfigMenu.iTotalRevives += 1
        endif
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived by an auto revival spell or scroll.")
      elseif (Victim && !Victim.IsDead()) ; player has cast a sacrifice spell or scroll on someone
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by sacrificing " + Victim + " for arkay...")
        Victim.Kill(PlayerRef)
        Victim = None
        if ConfigMenu.bIsEffectEnabled
          VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
          VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
          SoulAbsorbWind.Play(PlayerRef)
          SoulAbsorbExplosion.Play(PlayerRef)
          EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
        endif
        Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
        bSacrifice = True
        RevivePlayer(True)
        if ConfigMenu.bIsEffectEnabled
          moaReviveAfterEffect.Cast(PlayerRef)
        endif
        if ConfigMenu.iRevivesBySacrificeSpell < 99999999
          ConfigMenu.iRevivesBySacrificeSpell += 1
        endif
        if ConfigMenu.iTotalRevives < 99999999
          ConfigMenu.iTotalRevives += 1
        endif
        if ConfigMenu.bIsNotificationEnabled
          Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Sacrifice_Scroll")
        endif
        if moaRetrieveLostItems.IsRunning()
          moaRetrieveLostItems.SetStage(20)
        endif
        if moaRetrieveLostItems01.IsRunning()
          moaRetrieveLostItems01.SetStage(20)
        endif
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player Revived by sacrificing for arkay.")
      elseif (bIsRevivable() || (ConfigMenu.bIsMenuEnabled && ConfigMenu.moaSnoozeState.GetValue() != 0))
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player has enough items to trade with arkay...")
        if ConfigMenu.bIsMenuEnabled
          Int iResult = RemoveItemByMenu(CurrentState)
          if (iResult == 1)
            if ConfigMenu.bIsEffectEnabled
              VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
              VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
              SoulAbsorbWind.Play(PlayerRef)
              SoulAbsorbExplosion.Play(PlayerRef)
              EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
            endif
            Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
            ShowNotification()
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by trading with arkay (Menu is enabled)...")
            RevivePlayer(True)
            if ConfigMenu.bIsEffectEnabled
              moaReviveAfterEffect.Cast(PlayerRef)
            endif
            if ConfigMenu.iRevivesByTrade < 99999999
              ConfigMenu.iRevivesByTrade += 1
            endif
            if ConfigMenu.iTotalRevives < 99999999
              ConfigMenu.iTotalRevives += 1
            endif
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: player revived by trading with arkay (Menu is enabled).")
          elseif (iResult == 0)
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player select nothing from the trading menu.")
            RevivePlayer(False)
          endif
        else
          if !PriorityArray.Length == 5
            PriorityArray = new Float[5]
          endif
          PriorityArray[0] = ConfigMenu.fGoldPSlider + 10 ; adding this numbers to Priorities so after sorting them by ones, they still be distinguishable
          PriorityArray[1] = ConfigMenu.fDragonSoulPSlider + 20
          PriorityArray[2] = ConfigMenu.fBSoulgemPSlider + 30
          PriorityArray[3] = ConfigMenu.fMarkPSlider + 40
          PriorityArray[4] = ConfigMenu.fGSoulgemPSlider + 50
          SortPriorityArray()
          Int i = 4
          Bool bBreak = False
          while (i > -1) && !bBreak
            if PriorityArray[i] > 50 && bGSoulGemRevive ; player has enough grand soul gem and its Priority is higher
              AutoRemoveItem(i)
              bBreak = True
            elseif PriorityArray[i] > 40 && (PriorityArray[i] < 50) && bArkayMarkRevive
              AutoRemoveItem(i)
              bBreak = True
            elseif (PriorityArray[i] > 30) && (PriorityArray[i] < 40) && bBSoulGemRevive
              AutoRemoveItem(i)
              bBreak = True
            elseif (PriorityArray[i] > 20) && (PriorityArray[i] < 30) && bDragonSoulRevive
              AutoRemoveItem(i)
              bBreak = True
            elseif (PriorityArray[i] > 10) && (PriorityArray[i] < 20) && bSeptimRevive
              AutoRemoveItem(i)
              bBreak = True
            endif
            i -= 1
          endwhile
          if bBreak ;player has traded
            if ConfigMenu.bIsEffectEnabled
              VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
              VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
              SoulAbsorbWind.Play(PlayerRef)
              SoulAbsorbExplosion.Play(PlayerRef)
              EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
            endif
            Utility.Wait(ConfigMenu.fRecoveryTimeSlider)

            ;RequipSpells()
            ShowNotification()
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by trading with arkay (Menu is disabled)...")
            RevivePlayer(True)
            if ConfigMenu.bIsEffectEnabled
              moaReviveAfterEffect.Cast(PlayerRef)
            endif
            if ConfigMenu.iRevivesByTrade < 99999999
              ConfigMenu.iRevivesByTrade += 1
            endif
            if ConfigMenu.iTotalRevives < 99999999
              ConfigMenu.iTotalRevives += 1
            endif
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived by trading with arkay (Menu is disabled).")
          else ; player couldn't trade
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Trading with arkay failed (Menu is disabled).")
            RevivePlayer(False)
          endif
        endif
      else
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player doesn't have enough items to trade with arkay...")
        RevivePlayer(False)
      endif
    endif
  else
    Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
    if !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger)
      if ConfigMenu.iTotalRevives < 99999999
        ConfigMenu.iTotalRevives += 1
      endif
      Restore(iRevivePlayer=0, bReviveFollower=False, bEffect=False, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player can't be revived but isn't in bleedout.")
      return
    else
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player can't be revived...")
      RevivePlayer(False)
    endif
  endif
endfunction

function ExecuteCommand(String strCMD, Int aiSilent=1, Int aiFadeOut=0, Int aiHideMenu=0) ;Requires Autorun Console Commands
  Int Handle = ModEvent.Create("ARCC_RunCommand")
  if (Handle)
    ModEvent.PushForm(Handle, PlayerRef) ;sender
    ModEvent.PushString(Handle, "Mark of Arkay") ;strModName
    ModEvent.PushString(Handle, strCMD) ;strCommand
    ModEvent.PushInt(Handle, aiSilent)
    ModEvent.PushInt(Handle, aiFadeOut)
    ModEvent.PushInt(Handle, aiHideMenu)
    ModEvent.Send(Handle)
  endif
endfunction

function LogCurrentState()
  Debug.Trace("MarkOfArkay: Variables = " + "[ '" + GetState() + "', " + Game.GetCameraState() + ", " + (PlayerRef.IsSwimming() As Int) + ", " + (WerewolfQuest.IsRunning() As Int) + ", " + ((VampireLordQuest && VampireLordQuest.IsRunning()) As Int) + ", " + (PlayerRef.GetAnimationVariableBool("bIsSynced") As Int) + ", " + (PlayerRef.GetAnimationVariableBool("IsStaggering") As Int) + ", " + "[ " + (Game.IsMovementControlsEnabled() As Int) + ", " + (Game.IsFightingControlsEnabled() As Int) + ", " + (Game.IsCamSwitchControlsEnabled() As Int) + ", " + (Game.IsLookingControlsEnabled() As Int) + ", " + (Game.IsSneakingControlsEnabled() As Int) + ", " + (Game.IsMenuControlsEnabled() As Int) + ", " + (Game.IsActivateControlsEnabled() As Int) + ", " + (Game.IsJournalControlsEnabled() As Int) + ", " + (Game.IsFastTravelEnabled() As Int) + ", ]," + "[ " + (LostItemsChest.GetNumItems()) + ", " + (ItemScript.fLostSouls As Int) + ", ], ]")
endfunction

function RefreshFace() ;for closed eye bug
  ; Disabling facegen
  Bool oldUseFaceGen = Utility.GetINIBool("bUseFaceGenPreprocessedHeads:General")
  if (oldUseFaceGen)
    Utility.SetINIBool("bUseFaceGenPreprocessedHeads:General", False)
  endif

  ; Updating player
  PlayerRef.QueueNiNodeUpdate()

  ; Restoring facegen
  if (oldUseFaceGen)
    Utility.SetINIBool("bUseFaceGenPreprocessedHeads:General", True)
  endif
endfunction

Int function RemoveItemByMenu(String curState) ;trade by using menu
  Int iRevive = 0
  Bool bBreak = False
  while !bBreak
    iChoice = moaReviveMenu1.Show(iSeptimCost, iArkayMarkCost, iArkayMarkCount, iDragonSoulCost, fDragonSoulCount As Int, iBSoulGemCost, iBSoulGemCount, iGSoulGemCost, iGSoulGemCount)
    if (iChoice == -1)
    elseif ((iChoice == 0) && bSeptimRevive)
      PlayerRef.RemoveItem(Gold001, iSeptimCost, !ConfigMenu.bIsNotificationEnabled)
      iRevive = 1
      bBreak = True
      strRemovedItem = "Septim"
    elseif ((iChoice == 1) && bArkayMarkRevive)
      PlayerRef.RemoveItem(MarkOfArkay, iArkayMarkCost, !ConfigMenu.bIsNotificationEnabled)
      iRevive = 1
      bBreak = True
      strRemovedItem = "Arkay Mark"
    elseif ((iChoice == 2) && bDragonSoulRevive)
      PlayerRef.ModActorValue("DragonSouls", -1 * iDragonSoulCost)
      iRevive = 1
      bBreak = True
      strRemovedItem = "Dragon Soul"
    elseif ((iChoice == 3) && bBSoulGemRevive)
      PlayerRef.RemoveItem(BlackFilledGem, iBSoulGemCost, !ConfigMenu.bIsNotificationEnabled)
      iRevive = 1
      bBreak = True
      strRemovedItem = "Black Soul Gem"
    elseif ((iChoice == 4) && bGSoulGemRevive)
      PlayerRef.RemoveItem(GrandFilledGem, iGSoulGemCost, !ConfigMenu.bIsNotificationEnabled)
      iRevive = 1
      bBreak = True
      strRemovedItem = "Grand Soul Gem"
    elseif (iChoice == 5) ;Snooze
      bInBleedout = False
      Utility.Wait(ConfigMenu.fValueSnoozeSlider)
      if (GetState() != curState)
        iRevive = -1
        bBreak = True
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Revival script is in another state.")
      elseif !PlayerRef.IsBleedingOut() && !bInBleedout
        if ConfigMenu.iTotalRevives < 99999999
          ConfigMenu.iTotalRevives += 1
        endif
        iRevive = -1
        bBreak = True
        Restore(iRevivePlayer=0, bReviveFollower=False, bEffect=False, bwait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player revived before showing the trade menu.")
      else
        bInBleedout = True
        SetVars()
      endif
    elseif (iChoice == 6) ;Nothing
      iRevive = 0
      bBreak = True
    endif
  endwhile
  return iRevive
endfunction

function RemoveStolenItemMarkers(Actor ActorRef)
  ActorRef && ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent=True)
  ActorRef && ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent=True)
endfunction

function RequipSpells()
  if LeftHandEquippedItem && LeftHandEquippedItem.GetType() == 22 ;Spell
    PlayerRef.UnequipSpell((LeftHandEquippedItem As Spell), 0)
    PlayerRef.EquipSpell((LeftHandEquippedItem As Spell), 0)
  endif
  if RightHandEquipedItem && RightHandEquipedItem.GetType() == 22 ;Spell
    PlayerRef.UnequipSpell((RightHandEquipedItem As Spell), 1)
    PlayerRef.EquipSpell((RightHandEquipedItem As Spell), 1)
  endif
endfunction

function ResetPlayer()
  if PlayerRef.IsSwimming()
    Debug.SendAnimationEvent(PlayerRef, "SwimStart")
  elseif bWasSwimming
    Debug.SendAnimationEvent(PlayerRef, "SwimStop")
  endif
  PlayerRef.ClearExtraArrows()
  if PlayerRef.IsWeaponDrawn()
    PlayerRef.SheatheWeapon()
  endif
  RequipSpells()
  bSheathed = True
endfunction

function RevivePlayer(Bool bRevive)
  bIsraped = False
  if !bRevive && bRape()
    bool bfastTravel = Game.IsFastTravelEnabled()
    if bfastTravel
      Game.EnableFastTravel(false)
    endif
    Game.SetPlayerAIDriven(True)
    CrimeGold = 0
    CrimeGoldViolent = 0
    CrimeFaction = None
    Actor[] rapistActors = RapeScript.getRapists(PlayerRef, Attacker, true)
    bIsraped = RapeScript.rapePlayer(rapistActors)
    if bIsraped
      int i = Utility.randomInt(0, (ConfigMenu.fMaxRapes - 1) As int)
      while bIsraped && (i > 0)
        Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False)
        if !rapistActors || (!rapistActors[0] || (rapistActors[0] == None)) || ((ConfigMenu.fMaxRapists > 1.0) && (!rapistActors[1] || (rapistActors[1] == None)))
          rapistActors = RapeScript.getRapists(PlayerRef, Attacker, false)
        endif
        RapeScript.shuffleActorArray(rapistActors)
        bIsraped = RapeScript.rapePlayer(rapistActors)
        i -= 1
      endwhile
	  bIsraped = true
    endif
    PlayerRef.RemoveFromFaction(RapeScript.CalmFaction)
    Attacker && Attacker.RemoveFromFaction(RapeScript.CalmFaction)
    Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False)
    PlayerRef.SetDontMove(True)
    restoreCrime()
    if bfastTravel
      Game.EnableFastTravel(true)
    endif
    ConfigMenu.bIsLoggingEnabled && Debug.trace("MarkOfArkay: Player raped = " + bIsraped)
  endif
  Bool bSendToSlavery = (!bRevive && bSendToSlavery())
  Bool bSendToDreamWorld = (!bRevive && bSendToDreamWorld())
  if bRevive || bSendToSlavery || bSendToDreamWorld
    if ConfigMenu.bShiftBack
      ShiftBack()
    endif
    if !bHasAutoReviveEffect || bSacrifice
      PlayerRef.DispelSpell(ArkayCurseTemp)
      PlayerRef.DispelSpell(ArkayCurseTempAlt)
      if (PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt))
        PlayerRef.RemoveSpell(ArkayCurse)
        PlayerRef.RemoveSpell(ArkayCurseAlt)
        if !LostItemsChest.GetNumItems() || bSacrifice
          ItemScript.RestoreLostItems(PlayerRef)
          if moaRetrieveLostItems.IsRunning()
            moaRetrieveLostItems.SetStage(20)
          endif
          if moaRetrieveLostItems01.IsRunning()
            moaRetrieveLostItems01.SetStage(20)
          endif
        endif
      endif
      bSacrifice = False
    endif
    if bRevive
      Restore(iRevivePlayer=1, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=ConfigMenu.bIsEffectEnabled, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player is revived.")
    elseif (bSendToSlavery || bSendToDreamWorld)
      Restore(iRevivePlayer=1, bReviveFollower=1, bEffect=False, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace=("MarkOfArkay: Player is enslaved by " + Attacker))
      if bSendToSlavery
        Debug.TraceConditional("MarkOfArkay: Player enslaved.", ConfigMenu.bIsLoggingEnabled)
        sendModEvent("SSLV Entry")
      elseif bSendToDreamWorld
        Debug.TraceConditional("MarkOfArkay: Player visited the dreamworld.", ConfigMenu.bIsLoggingEnabled)
        sendModEvent("SDDreamworldPull")
      endif
    endif
    return
  else
    if (!ConfigMenu.bKillIfCantRespawn && ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport() && ConfigMenu.bCanContinue())
      if ConfigMenu.iRevivesByFollower < 99999999
        ConfigMenu.iRevivesByFollower += 1
      endif
      if ConfigMenu.iTotalRevives < 99999999
        ConfigMenu.iTotalRevives += 1
      endif
      Restore(iRevivePlayer=2, bReviveFollower=ConfigMenu.bPlayerProtectFollower, bEffect=False, bWait=PlayerRef.GetActorValue("Paralysis") As Bool, sTrace="MarkOfArkay: Player is revived because respawn is currently disabled.")
      return
    else
      NPCScript.HoldFollowers()
      if ConfigMenu.bCanContinue() && ((ConfigMenu.iNotTradingAftermath == 0) || (ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport()))
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is dying...")
        Attacker = None
        LowHealthImod.Remove()
        PlayerRef.PushActorAway(PlayerRef, 0)
        PlayerRef.EndDeferredKill()
        Utility.Wait(0.1)
        if !PlayerRef.IsDead()
          killPlayer()
        endif
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player died.")
        GoToState("")
      elseif ConfigMenu.bCanContinue() && (ConfigMenu.iNotTradingAftermath == 1)
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawning the player...")
        Float fRespawnStartTime = Utility.GetCurrentRealTime()
        bReadyForRespawn = False
        bInfectingPlayer = False
        Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=False, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False, aiDisablePOVType=0)
        if ConfigMenu.bDiseaseCurse
          startInfectingPlayer()
        endif
        if (ConfigMenu.bRespawnMenu)
          RespawnScript.SelectRespawnPointbyMenu()
        endif
        startRespawning()
        if (!bWasSwimming && bIsConditionSafe)
          if (ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack)
            if ConfigMenu.bDeathEffect && !moaPlayerGhostQuest.IsRunning() && !moaPlayerVoicelessQuest.IsRunning()
              RespawnScript.PlayerMarker.Enable()
              RespawnScript.PlayerMarker.MoveTo(playerRef)
              RespawnScript.PlayerMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
              RespawnScript.PlayerMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
              Utility.Wait(0.5)
              if !bIsraped
                PlayerRef.PushActorAway(PlayerRef, 0)
                Utility.Wait(0.1)
                RespawnScript.PlayerMarker.Say(DeathTopic, PlayerRef, True)
              endif
            endif
            if !bIsCameraStateSafe()
              Game.ForceThirdPerson()
            endif
            if ConfigMenu.bFadeToBlack
              FastFadeOut.Apply()
              Utility.Wait(1.0)
              FastFadeOut.PopTo(BlackScreen)
            else
              Utility.Wait(1.0)
            endif
            if ConfigMenu.bInvisibility && !moaPlayerGhostQuest.IsRunning()
              PlayerRef.SetAlpha(0.0)
            endif
          endif
        else
          Game.ForceThirdPerson()
          if ConfigMenu.bFadeToBlack
            FastFadeOut.Apply()
            Utility.Wait(1.0)
            FastFadeOut.PopTo(BlackScreen)
          endif
          if ConfigMenu.bInvisibility && !moaPlayerGhostQuest.IsRunning()
            PlayerRef.SetAlpha(0.0)
          endif
        endif
        if ConfigMenu.bShiftBackRespawn
          ShiftBack()
        endif
        if ConfigMenu.bLoseForever
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Destroying previously lost items...")
          if ((LostItemsChest.GetNumItems() > 0) || (ItemScript.fLostSouls > 0.0) || SkillScript.bSkillReduced())
            bDidItemsRemoved = True
            if ConfigMenu.iDestroyedItems < 99999999
              ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
              if ItemScript.fLostSouls > 0.0
                ConfigMenu.iDestroyedItems += 1
              endif
            endif
          else
            bDidItemsRemoved = False
          endif
          LostItemsChest.RemoveAllItems()
          SkillScript.LoseSkills()
          if moaSoulMark01.IsRunning()
            NPCScript.RemoveDeadClone()
            StopAndConfirm(moaSoulMark01)
            LostItemsMarker.MoveToMyEditorLocation()
            LostItemsMarker.Disable()
          endif
          if moaThiefNPC01.IsRunning()
            StopAndConfirm(moaThiefNPC01, 3, 27)
            Utility.Wait(1.0) ;to remove spawn before starting the quest.
          endif
          if moaBossChest01.IsRunning()
            StopAndConfirm(moaBossChest01, 3, 15)
          endif
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: previously lost items are destroyed.")
        endif
        bRemoveItems = ConfigMenu.bLoseItem
        iReducedSkill = ConfigMenu.iReducedSkill
        if !moaSoulMark01.IsRunning() && !moaThiefNPC01.IsRunning() && (!moaBossChest01.IsRunning() || moaBossChest01.GetStage() == 0)
          StopAndConfirm(moaBossChest01, 3, 25)
          if Utility.RandomInt(0, 99) < ConfigMenu.fBossChestChanceSlider
            Location curLoc = PlayerRef.GetCurrentLocation()
            if !curLoc || !curLoc.HasKeyWord(NPCScript.LocTypeDungeon) || !curLoc.HasRefType(BossContainer) || (ConfigMenu.moaBossChestNotInclearedLoc.GetValueInt() && curLoc.IsCleared())
              PlayerLocRef.ForceLocationTo(EmptyLocation)
            else
              PlayerLocRef.ForceLocationTo(PlayerRef.GetCurrentLocation())
            endif
            moaBossChest01.Start()
          endif
        endif
        if ConfigMenu.iHostileOption == 2 && !moaSoulMark01.IsRunning() && (!moaBossChest01.IsRunning() || !LostItemsChest.GetNumItems())
          if !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() == 1
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC who can steal from player ...")
            NPCScript.DetectThiefNPC()
            if Thief
              if !ThiefNPC01.GetActorReference() || (ConfigMenu.bAlwaysSpawn && (ThiefNPC01.GetActorReference() != Thief))
                ThiefNPC.ForceRefTo(Thief)
              endif
              if !moaThiefNPC01.IsRunning()
                moaThiefNPC01.Start()
              endif
              ThiefMarker.MoveTo(Thief)
              if ThiefNPC01.GetActorReference() && (ThiefNPC.GetActorReference() && (Thief == ThiefNPC.GetActorReference()))
                RemoveStolenItemMarkers(ThiefNPC01.GetActorReference())
              endif
            elseif moaThiefNPC01.IsRunning() && !bCursed() ;if cursed, location change event will respawn or stop the quest
              RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
              StopAndConfirm(moaThiefNPC01, 3, 25)
            endif
          endif
        endif
        bSoulMark = bSoulMark()
        Bool bRemoveItemTemp = True
        Bool bInBeastForm = NPCScript.bInBeastForm()
        if bInBeastForm || ((ConfigMenu.iHostileOption == 2 && (moaSoulMark01.IsRunning() || !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() != 1)) || (ConfigMenu.iHostileOption != 2 && (moaThiefNPC01.IsRunning() || (ConfigMenu.iHostileOption == 1 && !NPCScript.bIsHostileNPCNearby()))) || (PlayerRef.GetParentCell() == DefaultCell))
          if (moaBossChest01.IsRunning() && moaBossChest01.GetStage() == 0) && !bInBeastForm
            bRemoveItemTemp = False
          else
            bRemoveItems = False
            if !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
              iReducedSkill = 0
            endif
          endif
        endif
        if bRemoveItems
          Debug.TraceConditional("MarkOfArkay: Removing items from the player...", ConfigMenu.bIsLoggingEnabled)
          Float fStart = Utility.GetCurrentRealTime()
          ItemScript.loseItems()
          Debug.TraceConditional("MarkOfArkay: Removing items from the player finished in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.", ConfigMenu.bIsLoggingEnabled)
          if ConfigMenu.bIsLoggingEnabled
            Int c = LostItemsChest.GetNumItems()
            String str = "MarkOfArkay: Currently removed items -> "
            if ItemScript.fLostSouls > 0.0
              c += 1
              str += c
              str += "("
              str += (c - 1)
            else
              str += c
              str += "("
              str += c
            endif
            str += " + "
            str += (ItemScript.fLostSouls As Int)
            str += " dragon souls)"
            Debug.Trace(str)
          endif
        endif
        if (moaBossChest01.IsRunning() && moaBossChest01.GetStage() == 0) && !LostItemsChest.GetNumItems()
          if !bRemoveItemTemp
            bRemoveItems = False ;No phycical item removed and nothing else can be removed
            if !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
              iReducedSkill = 0
            endif
          endif
          stopAndConfirm(moaBossChest01, 3, 25)
        endif
        if iReducedSkill > 0
          Debug.TraceConditional("MarkOfArkay: Reducing player's Skills/Skill XPs...", ConfigMenu.bIsLoggingEnabled)
          Float fStart = Utility.GetCurrentRealTime()
          String Skill
          if iReducedSkill < 19
            Skill = SkillScript.sSkillName[iReducedSkill - 1]
          elseif iReducedSkill == 19
            Skill = "Random"
          elseif iReducedSkill == 20
            Skill = "Lowest"
          elseif iReducedSkill == 21
            Skill = "Highest"
          elseif iReducedSkill == 22
            Skill = "Lowest_All"
          elseif iReducedSkill == 23
            Skill = "Highest_All"
          elseif iReducedSkill == 24
            Skill = "All_Low"
          elseif iReducedSkill == 25
            Skill = "All_High"
          elseif iReducedSkill == 26
            Skill = "All_Random"
          elseif iReducedSkill == 27
            Skill = "All_One_By_One"
          endif
          if ConfigMenu.bSkillReduceRandomVal
            SkillScript.ReduceSkills(Skill, -1, ConfigMenu.fSkillReduceMinValSlider As Int, ConfigMenu.fSkillReduceMaxValSlider As Int, bOnlyXP=ConfigMenu.bOnlyLoseSkillXP)
          else
            SkillScript.ReduceSkills(Skill, ConfigMenu.fSkillReduceValSlider As Int, ConfigMenu.fSkillReduceMinValSlider As Int, ConfigMenu.fSkillReduceMaxValSlider As Int, bOnlyXP=ConfigMenu.bOnlyLoseSkillXP)
          endif
          Debug.TraceConditional("MarkOfArkay: Reducing skills completed in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.", ConfigMenu.bIsLoggingEnabled)
        endif
        if (PlayerRef.GetParentCell() != DefaultCell)
          if bCursed() || (ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary) || ConfigMenu.bVoicelessCurse || ConfigMenu.bGhostCurse ;Something is removed or stats of player are reduced or going to be reduced
            if (bSoulMark || (((ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary) || bHasArkayCurse() || ConfigMenu.bVoicelessCurse || ConfigMenu.bGhostCurse || moaPlayerGhostQuest.IsRunning() || moaPlayerVoicelessQuest.IsRunning()) && !moaThiefNPC01.IsRunning() && (!moaBossChest01.IsRunning() || LostItemsChest.GetNumItems() == 0))) ;Soul mark can be used
              if moaBossChest01.GetStage() == 0
                stopAndConfirm(moaBossChest01, 3, 25)
              else
                stopAndConfirm(moaBossChest01, 3, 20)
              endif
              LostItemsMarker.Enable()
              if !ConfigMenu.bSoulMarkStay || ((!NPCScript.SoulMark02.GetActorReference() || NPCScript.SoulMark02.GetActorReference().GetParentCell() == DefaultCell) && LostItemsMarker.GetParentCell() == DefaultCell)
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Moving soul mark to player's location...")
                if !ConfigMenu.bCorpseAsSoulMark
                  NPCScript.RemoveDeadClone()
                  LostItemsMarker.MoveTo(PlayerRef, 0, 0, 42)
                elseif ConfigMenu.bCorpseAsSoulMark
                  LostItemsMarker.MoveToMyEditorLocation()
                  NPCScript.RemoveDeadClone()
                  NPCScript.bringDeadClone()
                endif
                moaSoulMark01.Start()
                ConfigMenu.bIsLoggingEnabled && !ConfigMenu.bCorpseAsSoulMark && LostItemsMarker.GetParentCell() != DefaultCell && Debug.Trace("MarkOfArkay: Soul mark dropped at ( " + LostItemsMarker.GetPositionX() + ", " + LostItemsMarker.GetPositionY() + ", " + LostItemsMarker.GetPositionZ() + " ).")
                ConfigMenu.bIsLoggingEnabled && ConfigMenu.bCorpseAsSoulMark && NPCScript.SoulMark02.GetActorReference() && NPCScript.SoulMark02.GetActorReference().GetParentCell() != DefaultCell && Debug.Trace("MarkOfArkay: Body dropped at ( " + NPCScript.SoulMark02.GetReference().GetPositionX() + ", " + NPCScript.SoulMark02.GetReference().GetPositionY() + ", " + NPCScript.SoulMark02.GetReference().GetPositionZ() + " ).")
                if Thief
                  RemoveStolenItemMarkers(Thief)
                endif
                RemoveStolenItemMarkers(PlayerRef)
              endif
            endif
          else
            NPCScript.RemoveDeadClone()
            StopAndConfirm(moaSoulMark01, 3)
            LostItemsMarker.MoveToMyEditorLocation()
            LostItemsMarker.Disable()
            if (ThiefNPC.GetReference() As Actor)
              RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
            endif
            if (ThiefNPC01.GetReference() As Actor)
              RemoveStolenItemMarkers(ThiefNPC01.GetReference() As Actor)
            endif
            StopAndConfirm(moaThiefNPC01, 3, 25)
          endif
        endif
        if moaBossChest01.IsRunning() && moaThiefNPC01.IsRunning()
          ;if no physical item is removed boss chest quest not needed
          if LostItemsChest.GetNumItems() == 0
            if moaBossChest01.GetStage() == 0
              stopAndConfirm(moaBossChest01, 3, 25)
            else
              stopAndConfirm(moaBossChest01, 3, 20)
            endif
          else
            RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
            StopAndConfirm(moaThiefNPC01, 3, 25)
          endif
        endif
        PlayerRef.DispelSpell(Bleed)
        PlayerRef.ResetHealthAndLimbs()
        PlayerRef.RestoreActorValue("health", 10000)
        if ConfigMenu.bPlayerProtectFollower
          NPCScript.ResurrectFollowers()
        endif
        if ConfigMenu.bResurrectActors
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrecting non-unique actors in player's location...")
          if Attacker
            if (!Attacker.IsCommandedActor() && !Attacker.GetActorBase().IsUnique() && !Attacker.IsDisabled() && Attacker.IsDead())
              if ((Attacker.GetParentCell() == PlayerRef.GetParentCell()) || PlayerRef.GetDistance(Attacker) < 10000.0)
                Attacker.Resurrect()
              endif
            endif
          endif
          MassRevival.Cast(PlayerRef)
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrection finished.")
        endif
        if ConfigMenu.bHealActors
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Healing actors in player's location...")
          if Attacker && !Attacker.IsDead()
            if ((Attacker.GetParentCell() == PlayerRef.GetParentCell()) || PlayerRef.GetDistance(Attacker) < 10000.0)
              if Attacker.GetActorValue("Health") > 0
                Attacker.RestoreActorValue("Health", 999999)
              endif
            endif
          endif
          MassHealing.Cast(PlayerRef)
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Last attacker and other actors are healed.")
        endif
        while bInfectingPlayer
          Utility.WaitMenuMode(0.2)
        endwhile
        bReadyForRespawn = True ;allowing bIsArrived in respawnscript to teleport player
        while bReadyForRespawn
          Utility.WaitMenuMode(0.2)
        endwhile
        Utility.Wait(0.5)
        if PlayerRef.IsDead()
          PlayerRef.SetAlpha(1.0)
          BlackScreen.Remove()
          return
        endif
        Attacker = None
        ResetPlayer()
        if !ConfigMenu.bGhostCurse && !moaPlayerGhostQuest.IsRunning()
          PlayerRef.SetAlpha(1.0, True)
        endif
        Utility.Wait(1.0)
        NPCScript.ToggleFollower(True)
        if (ConfigMenu.bRespawnNaked && !NPCScript.bInBeastForm())
          PlayerRef.UnequipAll()
        endif
        if ((ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary) && (moaThiefNPC01.IsRunning() || (moaSoulMark01.IsRunning())))
          PlayerRef.DispelSpell(ArkayCurseTemp)
          PlayerRef.DispelSpell(ArkayCurseTempAlt)
          if ConfigMenu.iArkayCurse == 0
            PlayerRef.AddSpell(ArkayCurse)
          elseif ConfigMenu.iArkayCurse == 1
            PlayerRef.AddSpell(ArkayCurseAlt)
          else
            PlayerRef.AddSpell(ArkayCurse)
            PlayerRef.AddSpell(ArkayCurseAlt)
          endif
        elseif ((ConfigMenu.bArkayCurse && ConfigMenu.bIsArkayCurseTemporary) && !bHasArkayCurse())
          if ConfigMenu.iArkayCurse == 0
            ArkayCurseTemp.Cast(PlayerRef)
          elseif ConfigMenu.iArkayCurse == 1
            ArkayCurseTempAlt.Cast(PlayerRef)
          else
            ArkayCurseTemp.Cast(PlayerRef)
            ArkayCurseTempAlt.Cast(PlayerRef)
          endif
        endif
        if ConfigMenu.bGhostCurse
          if moaPlayerVoicelessQuest.IsRunning()
            moaPlayerVoicelessQuest.Stop()
          endif
          if !moaPlayerGhostQuest.IsRunning()
            moaPlayerGhostQuest.Start()
          endif
        endif
        if ConfigMenu.bVoicelessCurse
          if !moaPlayerGhostQuest.IsRunning() && !moaPlayerVoicelessQuest.IsRunning()
            moaPlayerVoicelessQuest.Start()
          endif
          PlayerRef.SetVoiceRecoveryTime(9999999.0)
          bPlayerIsVoiceless = True
        endif
        if PlayerRef.GetActorValue("paralysis")
          PlayerRef.SetActorValue("paralysis", 0)
          if PlayerRef.GetActorValue("paralysis")
            PlayerRef.ForceActorValue("paralysis", 0)
          endif
          Utility.Wait(6.5)
        endif
        if (ConfigMenu.bFadeToBlack || ConfigMenu.bInvisibility || ConfigMenu.fRespawnTimeSlider)
          RespawnScript.PassTime(ConfigMenu.fRespawnTimeSlider, 6.0)
        endif
        if ConfigMenu.bFadeToBlack
          BlackScreen.PopTo(FadeIn)
        endif
        RefreshFace()
        Utility.Wait(0.5)
        if ConfigMenu.bLoseForever && bDidItemsRemoved
          if moaRetrieveLostItems.IsRunning()
            moaRetrieveLostItems.SetStage(10)
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Soul Mark Quest Failed.")
          endif
          if moaRetrieveLostItems01.IsRunning()
            moaRetrieveLostItems01.SetStage(10)
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Stolen Items Quest Failed.")
          endif
          if PreviousThief
            if (!moaThiefNPC01.IsRunning() || (PreviousThief != Thief))
              RemoveStolenItemMarkers(PreviousThief)
              PreviousThief.RemoveFromFaction(PlayerEnemyFaction)
            endif
          endif
          RemoveStolenItemMarkers(PlayerRef)
          Utility.Wait(0.5)
        endif
        if moaThiefNPC01.IsRunning()
          Thief && ItemScript.AddStolenItemMarker(Thief)
        endif
        if bCursed()
          if moaBossChest01.IsRunning()
            if moaBossChest01.getStage() < 5
              moaBossChest01.SetStage(5)
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Boss Chest Quest Started.")
            endif
          elseif moaSoulMark01.IsRunning()
            if ConfigMenu.bLostItemQuest
              moaRetrieveLostItems.Start()
              moaRetrieveLostItems.SetStage(1)
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Soul Mark Quest Started.")
            endif
          elseif moaThiefNPC01.IsRunning()
            if ConfigMenu.bLostItemQuest
              moaRetrieveLostItems01.Start()
              moaRetrieveLostItems01.SetStage(1)
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Stolen Items Quest Started.")
            endif
          endif
          if SkillScript.bSkillReduced()
            SkillScript.DisableAllXP()
          endif
        else
          if moaBossChest01.GetStage() == 0
            stopAndConfirm(moaBossChest01, 3, 25)
          else
            stopAndConfirm(moaBossChest01, 3, 20)
          endif
        endif
        moaHostileNPCDetector.Stop()
        moaHostileNPCDetector01.Stop()
        RapeScript.unPacify()
        if !bIsCameraStateSafe()
          Game.ForceThirdPerson()
        endif
        if !ConfigMenu.bShowRaceMenu
          if ConfigMenu.bAltEyeFix && ConfigMenu.bARCCOK
            Utility.Wait(0.5)
            ExecuteCommand("player.say 0142b5", 1, 0, 1)
          endif
        endif
        if !ConfigMenu.bDoNotStopCombat
          !moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
        endif
        LowHealthImod.Remove()
        if bCidhnaJail
          if (PlayerRef.GetParentCell() == RespawnScript.MarkarthJailMarker.GetParentCell())
            if !CidhnaMineJailEventScene.GetStageDone(10)
              CidhnaMineJailEventScene.SetStage(10)
            endif
          endif
          bCidhnaJail = False
        endif
        if ConfigMenu.iTotalRespawn < 99999999
          ConfigMenu.iTotalRespawn += 1
        endif
        if ConfigMenu.bRespawnCounter
          ConfigMenu.fRespawnCounterSlider -= 1
          if ConfigMenu.bIsNotificationEnabled
            Debug.Notification("$mrt_MarkofArkay_Notification_totalRemainingRespawns")
            Debug.Notification(ConfigMenu.fRespawnCounterSlider As Int)
          endif
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You have " + ConfigMenu.fRespawnCounterSlider As Int + " more respawns.")
        endif
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn finished.")
        Debug.TraceConditional("MarkOfArkay: Respawn finished in " + (Utility.GetCurrentRealTime() - fRespawnStartTime) + " seconds.", ConfigMenu.bIsLoggingEnabled)
        if ConfigMenu.bShowRaceMenu
          Utility.Wait(2.0)
          Game.ShowRaceMenu()
        endif
        GoToState("")
      else
        if !ConfigMenu.bCanContinue()
          if ConfigMenu.bLockPermaDeath && ConfigMenu.bPUOK
            PermaDeathScript.lockGameLoad()
          endif
          bFinished = True
          KillPlayer()
          return
        endif
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Exiting to the Main menu...")
        PlayerRef.SetDontMove(False)
        Game.EnablePlayerControls()
        Game.EnableFastTravel(True)
        Attacker = None
        ToggleSaving(True)
        moaBleedoutHandlerState.SetValue(0)
        LowHealthImod.Remove()
        GoToState("")
        Game.QuitToMainMenu()
      endif
    endif
  endif
endfunction

function SetGameVars(Bool abFast=False)
  Game.SetGameSettingFloat("fPlayerDeathReloadTime", 5.00000)
  if !SkillScript
    SkillScript = ReviverQuest As zzzmoaskillcursescript
  endif
  if !ItemScript
    ItemScript = ReviverQuest As zzzmoaitemcursescript
  endif
  if !RespawnScript
    RespawnScript = ReviverQuest As zzzmoarespawnscript
  endif
  if !NPCScript
    NPCScript = ReviverQuest As zzzmoanpcscript
  endif
  if !RapeScript
    RapeScript = ReviverQuest As zzzmoarapescript
  endif
  if !PermaDeathScript
    PermaDeathScript = PermaDeathQuest As zzzmoaPermaDeathScript
  endif
  if (moaState.GetValue() == 1)
    if ConfigMenu.bTriggerOnBleedout && !PlayerRef.IsEssential()
      PlayerRef.GetActorBase().SetEssential(True)
      PlayerRef.SetNoBleedoutRecovery(True)
    endif
    ConfigMenu.ToggleFallDamage(ConfigMenu.bIsNoFallDamageEnabled) ;SKSE
  else
    ConfigMenu.ToggleFallDamage(False)
  endif
  RapeScript.RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
  sendModEvent("MOA_Int_PlayerLoadsGame")
  ItemScript.RegisterItemCheckers()
  DiseaseScript.RegisterForModEvent("MOA_RecalcCursedDisCureCost", "RecalcCursedDisCureCost")
  if (!PlayerRef.IsBleedingOut() && GetState() == "")
    ItemScript.RegisterForModEvent("MOA_checkCachedItems", "On_MOA_checkCachedItems")
    sendModEvent("MOA_checkCachedItems")
    RapeScript.unPacify()
  endif
  checkMarkers(bFast=abFast)
endfunction

function SetVars()
  SkillScript.SetVars()
  iSeptimCount = PlayerRef.GetItemCount(Gold001)
  fDragonSoulCount = PlayerRef.GetActorValue("DragonSouls")
  iArkayMarkCount = PlayerRef.GetItemCount(MarkOfArkay)
  iBSoulGemCount = PlayerRef.GetItemCount(BlackFilledGem)
  iGSoulGemCount = PlayerRef.GetItemCount(GrandFilledGem)
  iSeptimCost = iCalcReviveCost(ConfigMenu.fValueGoldSlider, ConfigMenu.fValueGoldScaleSlider)
  iArkayMarkCost = iCalcReviveCost(ConfigMenu.fValueMarkSlider, ConfigMenu.fValueMarkScaleSlider)
  iBSoulGemCost = iCalcReviveCost(ConfigMenu.fValueBSoulGemSlider, ConfigMenu.fValueBSoulGemScaleSlider)
  iGSoulGemCost = iCalcReviveCost(ConfigMenu.fValueGSoulGemSlider, ConfigMenu.fValueGSoulGemScaleSlider)
  iDragonSoulCost = iCalcReviveCost(ConfigMenu.fValueSoulSlider, ConfigMenu.fValueSoulScaleSlider)
  bSeptimRevive = ConfigMenu.bIsGoldEnabled && (iSeptimCost <= iSeptimCount)
  bDragonSoulRevive = ConfigMenu.bIsDragonSoulEnabled && (iDragonSoulCost <= fDragonSoulCount)
  bBSoulGemRevive = ConfigMenu.bIsBSoulGemEnabled && (iBSoulGemCost <= iBSoulGemCount)
  bGSoulGemRevive = ConfigMenu.bIsGSoulGemEnabled && (iGSoulGemCost <= iGSoulGemCount)
  bArkayMarkRevive = ConfigMenu.bIsMarkEnabled && (iArkayMarkCost <= iArkayMarkCount)
  bPotionRevive = ConfigMenu.bIsPotionEnabled
  ItemScript.SetVars()
  RespawnScript.SetVars()
  if (bArkayMarkRevive)
    moaArkayMarkRevive.SetValue(1)
  else
    moaArkayMarkRevive.SetValue(0)
  endif
  if (bDragonSoulRevive)
    moaDragonSoulRevive.SetValue(1)
  else
    moaDragonSoulRevive.SetValue(0)
  endif
  if (bBSoulGemRevive)
    moaBSoulGemRevive.SetValue(1)
  else
    moaBSoulGemRevive.SetValue(0)
  endif
  if (bGSoulGemRevive)
    moaGSoulGemRevive.SetValue(1)
  else
    moaGSoulGemRevive.SetValue(0)
  endif
  if (bSeptimRevive)
    moaSeptimRevive.SetValue(1)
  else
    moaSeptimRevive.SetValue(0)
  endif
  if (!PlayerRef.IsBleedingOut() && GetState() == "")
    LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
    RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
  endif
endfunction

function ShiftBack()
  Float i = 5.0
  if (WerewolfQuest.IsRunning())
    ;Debug.SetGodMode(True)
    PlayerRef.DispelSpell(Bleed)
    PlayerRef.DispelSpell(BleedoutProtection)
    Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=False, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False, aiDisablePOVType=0)
    WerewolfQuest.SetStage(100)
    while (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
      Utility.Wait(0.2)
      i -= 0.2
    endwhile

    ;Debug.SetGodMode(False)
    ;Game.EnablePlayerControls()
  elseif (VampireLordQuest.IsRunning())
    ;Debug.SetGodMode(True)
    PlayerRef.DispelSpell(Bleed)
    PlayerRef.DispelSpell(BleedoutProtection)
    Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=False, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False, aiDisablePOVType=0)
    VampireLordQuest.SetStage(100) ; shift back
    while (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
      Utility.Wait(0.2)
      i -= 0.2
    endwhile

    ;Debug.SetGodMode(False)
    ;Game.EnablePlayerControls()
  endif
endfunction

function ShowNotification()
  if !ConfigMenu.bIsNotificationEnabled
    return
  endif
  Int totalRemainingLives = 0
  SetVars()
  if (ConfigMenu.bIsRevivalEnabled)
    if !(strRemovedItem == "")
      if (strRemovedItem == "Dragon Soul")
        Debug.Notification("$mrt_MarkofArkay_Notification_DragonSoul_Removed")
        Debug.Notification(iDragonSoulCost)
      endif
    endif
    if (bArkayMarkRevive)
      if ConfigMenu.fValueMarkSlider == 0.0
        return
      else
        totalRemainingLives += (iArkayMarkCount / iArkayMarkCost) As Int
      endif
    endif
    if (bBSoulGemRevive)
      if ConfigMenu.fValueBSoulGemSlider == 0.0
        return
      else
        totalRemainingLives += (iBSoulGemCount / iBSoulGemCost) As Int
      endif
    endif
    if (bGSoulGemRevive)
      if ConfigMenu.fValueGSoulGemSlider == 0.0
        return
      else
        totalRemainingLives += (iGSoulGemCount / iGSoulGemCost) As Int
      endif
    endif
    if (bDragonSoulRevive)
      if ConfigMenu.fValueSoulSlider == 0.0
        return
      else
        totalRemainingLives += (fDragonSoulCount / iDragonSoulCost) As Int
      endif
    endif
    if (bSeptimRevive)
      if ConfigMenu.fValueGoldSlider == 0.0
        return
      else
        totalRemainingLives += (iSeptimCount / iSeptimCost) As Int
      endif
    endif
    if (totalRemainingLives > 0)
      Debug.Notification("$mrt_MarkofArkay_Notification_totalRemainingTrades")
      Debug.Notification(totalRemainingLives)
    else
      Debug.Notification("$mrt_MarkofArkay_Notification_NoRemainingTrades")
    endif
  endif
endfunction

function SortPriorityArray() ;sort priority so higher priority and those items that can be traded are first
  Int Index1
  Int Index2 = PriorityArray.Length - 1
  Bool bIsIndex1 = False
  Bool bIsIndex2 = False
  Int Swapped = 0
  while (Index2 > 0)
    Index1 = 0
    Swapped = 0
    while (Index1 < Index2)
      if (((PriorityArray[Index1] As Int) % 10) > (((PriorityArray[Index1 + 1] As Int) % 10))) ;ones are priorities tens are for being distinguishable after sort
        Float SwapDummy = PriorityArray[Index1]
        PriorityArray[Index1] = PriorityArray[Index1 + 1]
        PriorityArray[Index1 + 1] = SwapDummy
        Swapped = 1
      elseif (((PriorityArray[Index1] As Int) % 10) == (((PriorityArray[Index1 + 1] As Int) % 10))) ; when two item has the same priority
        if (PriorityArray[Index1] > 50) && bGSoulGemRevive
          bIsIndex1 = True ;  Item at index 1 is tradable
        elseif (PriorityArray[Index1] > 40) && (PriorityArray[Index1] < 50) && bArkayMarkRevive
          bIsIndex1 = True
        elseif (PriorityArray[Index1] > 30) && (PriorityArray[Index1] < 40) && bBSoulGemRevive
          bIsIndex1 = True
        elseif (PriorityArray[Index1] > 20) && (PriorityArray[Index1] < 30) && bDragonSoulRevive
          bIsIndex1 = True
        elseif (PriorityArray[Index1] > 10) && (PriorityArray[Index1] < 20) && bSeptimRevive
          bIsIndex1 = True
        endif
        if (PriorityArray[Index1 + 1] > 50) && bGSoulGemRevive
          bIsIndex2 = True ; Item at index 2 is tradable
        elseif (PriorityArray[Index1 + 1] > 40) && (PriorityArray[Index1 + 1] < 50) && bArkayMarkRevive
          bIsIndex2 = True
        elseif (PriorityArray[Index1 + 1] > 30) && (PriorityArray[Index1 + 1] < 40) && bBSoulGemRevive
          bIsIndex2 = True
        elseif (PriorityArray[Index1 + 1] > 20) && (PriorityArray[Index1 + 1] < 30) && bDragonSoulRevive
          bIsIndex2 = True
        elseif (PriorityArray[Index1 + 1] > 10) && (PriorityArray[Index1 + 1] < 20) && bSeptimRevive
          bIsIndex2 = True
        endif
        if (bIsIndex1 == True) && (bIsIndex2 == False) ;tradable items should have lower index in the array after sort
          Float SwapDummy = PriorityArray[Index1]
          PriorityArray[Index1] = PriorityArray[Index1 + 1]
          PriorityArray[Index1 + 1] = SwapDummy
          Swapped = 1
        endif
        bIsIndex1 = False
        bIsIndex2 = False
      endif
      Index1 += 1
    endwhile
    if (Swapped == 0)
      return
    endif
    Index2 -= 1
  endwhile
endfunction

function ToggleSaving(Bool bSave)
  if (ConfigMenu.iSaveOption == 1)
    if bSave
      Game.SetInChargen(False, False, False)
    else
      Game.SetInChargen(abDisableSaving=True, abDisableWaiting=False, abShowControlsDisabledMessage=True)
    endif
  endif
endfunction

String function ToggleState() ;prevents double menu when player revived with potion and returns to bleedout while previous bleedout event is not finished
  if (GetState() == "Bleedout1")
    GoToState("Bleedout2")
    return "Bleedout2"
  else
    GoToState("Bleedout1")
    return "Bleedout1"
  endif
endfunction

Bool function bCursed()
  return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || bHasArkayCurse() || SkillScript.bSkillReduced() || moaPlayerGhostQuest.IsRunning() || moaPlayerVoicelessQuest.IsRunning()
endfunction

Bool function bHasArkayCurse()
  return PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt)
endfunction

Bool function bIsCameraStateSafe()
  Int CameraState = Game.GetCameraState()
  return ((CameraState == 9) || (CameraState == 11))
endfunction

Bool function bIsConditionSafe()
  return !(iIsBeast || PlayerRef.GetActorValue("paralysis") || PlayerRef.GetAnimationVariableBool("bIsSynced"))
endfunction

Bool function bIsEquipedFromFormlist(FormList ItemList)
  Int iIndex = ItemList.GetSize()
  while iIndex > 0
    iIndex -= 1
    if ItemList.GetAt(iIndex)
      if PlayerRef.IsEquipped(ItemList.GetAt(iIndex))
        return True
      endif
    endif
  endwhile
  return False
endfunction

Bool function bIsRevivable() ;if player can be revived by trading
  if ConfigMenu.bIsTradeEnabled
    if (bArkayMarkRevive || bBSoulGemRevive || bGSoulGemRevive || bDragonSoulRevive || bSeptimRevive)
      if ConfigMenu.bIsRevivalRequiresBlessing
        if (PlayerRef.HasMagicEffect(FortifyHealthFFSelf) || bIsEquipedFromFormlist(ArkayAmulets)) ;player has magiceffect from a shrine of arkay or wearing one of 2 amulets of arkay
          return True
        else
          return False
        endif
      else
        return True
      endif
    endif
  endif
  return False
endfunction

Bool function bItemRemoved()
  return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || SkillScript.bSkillReduced()
endfunction

Bool function bRape()
  if !Attacker || (Attacker == None) || playerRef.IsFlying() || playerRef.IsOnMount()
    return False
  endif
  if !ConfigMenu.bOnlyHostilesRape || (Attacker.IsHostileToActor(PlayerRef) || (Attacker.GetFactionReaction(PlayerRef) == 1))
    if Utility.RandomInt(0, 99) < ConfigMenu.fRapeChanceSlider
      if (PlayerRef.GetDistance(Attacker) < 5000.0) || (Attacker.GetParentCell() == PlayerRef.GetParentCell())
        return True
      endif
    endif
  endif
  return False
endfunction

Bool function bSendToDreamWorld()
  if ((ConfigMenu.bShiftBack || !NPCScript.bInBeastForm()) && !bSacrifice && !bHasAutoReviveEffect)
    if ConfigMenu.bIsSDActive && SDInterface.isDreamed() && !SDInterface.isDreaming()
      if Utility.RandomInt(0, 99) < ConfigMenu.fSDreamWorldChanceSlider
        if bIsraped || !ConfigMenu.bSlaveryOnlyAfterRape
          return True
        endif
      endif
    endif
  endif
  return False
endfunction

Bool function bSendToSlavery()
  if ((Attacker != None) && (ConfigMenu.bShiftBack || !NPCScript.bInBeastForm()) && !bSacrifice && !bHasAutoReviveEffect)
    if Utility.RandomInt(0, 99) < ConfigMenu.fSimpleSlaveryChanceSlider
      if (PlayerRef.GetDistance(Attacker) < 10000.0) || (Attacker.GetParentCell() == PlayerRef.GetParentCell())
        if bIsraped || !ConfigMenu.bSlaveryOnlyAfterRape
          if !ConfigMenu.bOnlyEnslavedByEnemyFaction || bIsraped || (PlayerRef.GetFactionReaction(Attacker) == 1)
            return True
          endif
        endif
      endif
    endif
  endif
  return False
endfunction

Bool function bSoulMark() ;Whether drop soul mark or not
  return !moaBossChest01.IsRunning() && ((ConfigMenu.iHostileOption == 2 && moaSoulMark01.IsRunning()) || (ConfigMenu.iHostileOption != 2 && !moaThiefNPC01.IsRunning()))
endfunction

function checkHealth()
  if ConfigMenu.bTriggerOnHealthPerc && ConfigMenu.bIsRevivalEnabled
    if !PlayerRef.IsDead() && (playerRef.GetActorValuePercentage("Health") <= ConfigMenu.fHealthPercTrigger)
      if !bInBleedout && !moaIgnoreBleedout.GetValue()
        bInBleedout = True
        Game.DisablePlayerControls()

        ;Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
        PlayerRef.DamageActorValue("Health", 9999.0)
        fHealrate = PlayerRef.GetActorValue("HealRate")
        PlayerRef.SetActorValue("HealRate", 0.0)
        PlayerRef.AddPerk(Invulnerable)
        Debug.SetGodMode(True) ;still needed for when dying because of traps
        bInBleedoutAnim = True
        bSheathed = False
        iIsBeast = NPCScript.iInBeastForm()
        if ConfigMenu.bIsRagdollEnabled
          BleedoutHandler(ToggleState())
        else
          Bool bSafe = (!iIsBeast && !PlayerRef.GetActorValue("paralysis") && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
          bSafe && Debug.SendAnimationEvent(PlayerRef, "BleedoutStart")
          Utility.Wait(2.0)
          BleedoutHandler(ToggleState())
          bSafe && Debug.SendAnimationEvent(PlayerRef, "BleedoutStop")
        endif
        if GetState() == ""
          Attacker = None
          PlayerRef.SetActorValue("HealRate", fHealrate)
          PlayerRef.SetDontMove(False)
          Game.EnablePlayerControls()
          LowHealthImod.Remove()
          moaBleedoutHandlerState.SetValue(0)
          RegisterForSingleUpdate(3.0)
          Game.EnableFastTravel(True)
          ToggleSaving(True)
          bInBleedout = False
        endif
      endif
    endif
  endif
endfunction

function checkMarkers(Bool bTavern=True, Bool bExtra=True, Bool bCustom=True, Bool bFast=False)
  RespawnScript.RegisterForModEvent("MOA_CheckMarkers", "OnCheckingMarkers")
  Int handle = ModEvent.Create("MOA_CheckMarkers")
  if (handle)
    ModEvent.PushForm(handle, ReviverQuest)
    ModEvent.PushBool(handle, bTavern)
    ModEvent.PushBool(handle, bExtra)
    ModEvent.PushBool(handle, bCustom)
    ModEvent.PushBool(handle, bFast)
    ModEvent.Send(Handle)
  endif
endfunction

function clearAll()
  UnregisterForUpdate()

  ;Restore(bRevivePlayer = False, bReviveFollower = False, bEffect = False)
endfunction

Int function iCalcReviveCost(Float fValue, Float fScale)
  return imax(0, (fValue + ((fScale * (PlayerRef.GetLevel() - 1)) * fValue)) As Int)
endfunction

Int function iHasHealingPotion()
  Int iIndex = PotionList.GetSize()
  while (iIndex > 0)
    iIndex -= 1
    if PlayerRef.GetItemCount(PotionList.GetAt(iIndex) As Potion) > 0
      return iIndex
    endif
  endwhile
  return -1
endfunction

function restore(Int iRevivePlayer=1, Bool bReviveFollower=True, Bool bEffect=False, Int iPotionIndex=-1, Bool bWait=False, String sTrace="")
  RapeScript.unPacify()
  if !PlayerRef.IsDead()
    Game.SetPlayerAIDriven(False)
    if bEffect
      moaReviveAfterEffect.Cast(PlayerRef)
    endif
    RequipSpells()
    PlayerRef.DispelSpell(Bleed)
    if iRevivePlayer != 0
      PlayerRef.ResetHealthAndLimbs()
      PlayerRef.RestoreActorValue("health", 10000)
    endif
    if iRevivePlayer == 2
      Utility.Wait(0.5)
      Float fOldHP = PlayerRef.GetActorValue("Health")
      Float fNewHP = fMax(60.0, ((PlayerRef.GetBaseActorValue("Health") * 0.5) + 10.0))
      if fOldHP > fNewHP
        PlayerRef.DamageActorValue("Health", fOldHP - fNewHP)
      else
        PlayerRef.RestoreActorValue("Health", fNewHP - fOldHP)
      endif
    endif
    if iPotionIndex > -1
      Utility.Wait(0.1)
      PlayerRef.EquipItem(PotionList.GetAt(ipotionIndex) As Potion, False, True)
    endif
    if !bIsCameraStateSafe()
      Game.ForceThirdPerson()
    endif
    if bReviveFollower
      NPCScript.ResurrectFollowers()
    endif
    if !ConfigMenu.bDoNotStopCombatAfterRevival
      !moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
    endif
    PlayerRef.DrawWeapon()
    Utility.wait(2.0)
    PlayerRef.SheatheWeapon()
  endif
  Attacker = None
  if PlayerRef.GetActorValue("paralysis")
    PlayerRef.SetActorValue("paralysis", 0)
    if PlayerRef.GetActorValue("paralysis")
      PlayerRef.ForceActorValue("paralysis", 0)
    endif
  endif
  if bEffect && (iRevivePlayer == 1) && !PlayerRef.IsDead()
    BleedoutProtection.Cast(PlayerRef)
  endif
  bWait && Utility.Wait(5.0)
  GoToState("")
  if sTrace && ConfigMenu.bIsLoggingEnabled
    Debug.Trace(sTrace)
  endif
endfunction

function restoreCrime()
  if !crimefaction
    return
  endif
  if CrimeGold > 0
    CrimeFaction.ModCrimeGold(CrimeGold, false)
  endif
  if CrimeGoldViolent > 0
    CrimeFaction.ModCrimeGold(CrimeGoldViolent, true)
  endif
  CrimeGold = 0
  CrimeGoldViolent = 0
  crimefaction = None
endfunction

function startInfectingPlayer()
  bInfectingPlayer = True
  DiseaseScript.RegisterForModEvent("MOA_InfectPlayer", "OnInfectPlayer")
  Int handle = ModEvent.Create("MOA_InfectPlayer")
  if (handle)
    ModEvent.PushForm(handle, ReviverQuest)
    ModEvent.Send(Handle)
  endif
endfunction

function startRespawning()
  RespawnScript.RegisterForModEvent("MOA_Respawn", "OnRespawn")
  Int handle = ModEvent.Create("MOA_Respawn")
  if (handle)
    ModEvent.PushForm(handle, ReviverQuest)
    ModEvent.Send(Handle)
  endif
endfunction

state Bleedout1
  event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
  endevent

  event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
  endevent

  event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
  endevent

  event OnPlayerLoadGame()
    ConfigMenu.checkMods()
    if PermaDeathScript.bCheckPermaDeath()
      return
    endif
    SetGameVars()
    if bPlayerIsVoiceless
      PlayerRef.SetVoiceRecoveryTime(9999999.0)
    endif
  endevent

  event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
  endevent

  event OnSleepStop(Bool abInterrupted)
  endevent
endstate

state Bleedout2
  event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
  endevent

  event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
  endevent

  event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
  endevent

  event OnPlayerLoadGame()
    ConfigMenu.checkMods()
    if PermaDeathScript.bCheckPermaDeath()
      return
    endif
    SetGameVars()
    if bPlayerIsVoiceless
      PlayerRef.SetVoiceRecoveryTime(9999999.0)
    endif
  endevent

  event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
  endevent

  event OnSleepStop(Bool abInterrupted)
  endevent
endstate
