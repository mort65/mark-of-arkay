Scriptname zzzmoanpcscript extends Quest

import zzzmoautilscript

FormList property Afflicteds auto
FormList property AllFalmers auto
FormList property AllSpawnLists auto
FormList property Assassins auto
Race property AtronachFlameRace auto
Race property AtronachFrostRace auto
Race property AtronachStormRace auto
FormList property Atronachs auto
Faction property BanditFaction auto
FormList property Bandits auto
Location property BthardamzLocation auto
CompanionsHousekeepingScript property CHScript auto
Faction property ChaurusFaction auto
FormList property Chauruses auto
FormList property ChildRaces auto
zzzmoaReviveMCM property ConfigMenu auto
Faction property CreatureFaction auto
Faction property CurrentFollowerFaction auto
Faction property CurrentHireling auto
Faction property DA13AfflictedFaction auto
Faction property DLC1HunterFaction auto
Race property DLC1VampireBeastRace auto
Faction property DarkBrotherHoodFaction auto
FormList property Dawnguards auto
Actor property DeadClone auto Hidden
Faction property DragonFaction auto
Faction property DragonPriestFaction auto
FormList property DragonPriests auto
FormList property Dragons auto
Faction property DraugrFaction auto
FormList property Draugrs auto
Faction property DremoraFaction auto
FormList property Dremoras auto
Faction property DwarvenAutomatonFaction auto
FormList property Dwarvens auto
FormList property ExtraCloneItems auto
Faction property FalmerFaction auto
FormList property Falmers auto
Actor[] property FollowerArr auto Hidden
ReferenceAlias[] property Followers auto
Faction property ForswornFaction auto
FormList property Forsworns auto
FormList property Ghosts auto
Faction property GiantFaction auto
FormList property Giants auto
ReferenceAlias property GuardNPC auto
Faction property HagravenFaction auto
FormList property Hagravens auto
Race property HighElf auto
Race property HighElfVampire auto
ReferenceAlias property HostileActor auto
ReferenceAlias property HostileActor01 auto
ReferenceAlias property ItemMarker02 auto
Keyword property LocSetCave auto
Keyword property LocSetCaveIce auto
Keyword property LocSetDwarvenRuin auto
Keyword property LocSetNordicRuin auto
Keyword property LocTypeBanditCamp auto
Keyword property LocTypeCity auto
Keyword property LocTypeDragonLair auto
Keyword property LocTypeDragonPriestLair auto
Keyword property LocTypeDraugrCrypt auto
Keyword property LocTypeDungeon auto
Keyword property LocTypeDwarvenAutomatons auto
Keyword property LocTypeDwelling auto
Keyword property LocTypeFalmerHive auto
Keyword property LocTypeForswornCamp auto
Keyword property LocTypeGiantCamp auto
Keyword property LocTypeHabitation auto
Keyword property LocTypeHagravenNest auto
Keyword property LocTypeMilitaryFort auto
Keyword property LocTypeMine auto
Keyword property LocTypePlayerHouse auto
Keyword property LocTypeSprigganGrove auto
Keyword property LocTypeTown auto
Keyword property LocTypeVampireLair auto
Keyword property LocTypeWarlockLair auto
Keyword property LocTypeWerewolfLair auto
Quest property MS01 auto
Quest property MS02 auto
Cell property MehrunesDagonShrine auto
Faction property NecromancerFaction auto
Faction property PlayerFaction auto
Faction property PlayerFollowerFaction auto
GlobalVariable property PlayerIsVampire auto
GlobalVariable property PlayerIsWerewolf auto
ObjectReference property PlayerMarker auto
Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto
Location property ShrineofMehrunesDagonLocation auto
Faction property SilverHandFaction auto
FormList property SilverHands auto
Faction property SkeletonFaction auto
FormList property Skeletons auto
ReferenceAlias property SoulMark02 auto
zzzmoasoulmarktrap01script property SoulMarkTrap01Script auto
FormList property SpawnLists auto
Faction property SpiderFaction auto
FormList property Spiders auto
Faction property SprigganFaction auto
Faction property SprigganPredatorFaction auto
FormList property Spriggans auto
Location property ThalmorEmbassyLocation auto
Faction property ThalmorFaction auto
FormList property Thalmors auto
ReferenceAlias[] property ThiefActors auto
FormList property Thiefs auto
Faction property ThievesGuildFaction auto
Faction property TrollFaction auto
FormList property Trolls auto
Faction property VampireFaction auto
FormList property Vampires auto
Faction property WarlockFaction auto
FormList property Warlocks auto
Race property WereWolfBeastRace auto
Faction property WerewolfFaction auto
FormList property Werewolfs auto
Faction property WispFaction auto
FormList property Wisps auto
FormList property Witches auto
Spell property WontSteal auto
Int[] property iSpawnArr auto Hidden
Int property iSpawnpool auto Hidden
Int property iTotalSpawns=0 auto Hidden
Quest property moaFollowerDetector auto
Quest property moaGuardDetector auto
Quest property moaHostileNPCDetector auto
Quest property moaHostileNPCDetector01 auto

function DetectFollowers()
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detecting followers...")
  stopAndConfirm(moaFollowerDetector, 3)
  moaFollowerDetector.Start()
  if FollowerArr.Length != 128
    FollowerArr = new Actor[128]
  endif
  Int i = FollowerArr.Length
  Int j
  while i > 0
    i -= 1
    if !bIsFollower(FollowerArr[i])
      FollowerArr[i] = None
    endif
  endwhile
  i = iMin(128, Followers.Length)
  Actor follower
  while i > 0
    i -= 1
    Follower = Followers[i].GetReference() As Actor
    if follower
      if FollowerArr.Find(Follower) < 0
        j = FollowerArr.Find(None)
        if j > -1
          FollowerArr[j] = Follower
        endif
      endif
    endif
  endwhile
  moaFollowerDetector.Stop()
  i = 0
  Actor RandActor
  Bool bBreak = False
  while (i < 15) && !bBreak
    i += 1
    RandActor = Game.FindRandomActorFromRef(PlayerRef, 2000)
    if RandActor
      if FollowerArr.Find(RandActor) < 0
        if bIsFollower(RandActor)
          j = FollowerArr.Find(None)
          if j > -1
            FollowerArr[j] = Follower
          endif
        endif
      endif
    else ;No NPC is around the player
      bBreak = True
    endif
  endwhile
  if ConfigMenu.bIsLoggingEnabled
    String str = "MarkOfArkay: Detected Followers = [ "
    i = FollowerArr.Length
    Int count = 0
    while i > 0
      i -= 1
      if FollowerArr[i]
        count += 1
        str += "( '"
        str += FollowerArr[i].GetActorBase().GetName()
        Str += "', "
        str += FollowerArr[i]
        Str += ", "
        str += FollowerArr[i].GetRace()
        str += ", ), "
      endif
    endwhile
    str += "]"
    Debug.Trace(str)
    Debug.Trace("MarkOfArkay: Number of detected followers: " + count)
  endif
endfunction

function DetectThiefNPC()
  Int i
  Bool bFound = False
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 0)...")
  if ReviveScript.bCursed() && ReviveScript.moaThiefNPC01.IsRunning()
    if ReviveScript.Thief && !ReviveScript.Thief.IsDisabled() && !ReviveScript.Thief.GetActorBase().IsInvulnerable() && (!ConfigMenu.bLoseForever || bIsDying(ReviveScript.Thief)) ;check previous one
      if (!bIsHostile(ReviveScript.Thief) || PlayerRef.GetDistance(ReviveScript.Thief) > 2000)
        ReviveScript.bRemoveItems = False
        if !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
          ReviveScript.iReducedSkill = 0
        endif
      endif
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 0: ( '" + (ReviveScript.Thief.GetActorBase().GetName()) + "', " + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )")
      return
    endif
    ReviveScript.bRemoveItems = False ;After location change either a new one will be spawned or quest would stop
    if !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
      ReviveScript.iReducedSkill = 0
    endif
    ReviveScript.Thief = None
    return
  endif
  ReviveScript.Thief = None
  if !ConfigMenu.bSpawnHostile || !ConfigMenu.bOnlySpawn
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 1)...")
    Actor akHostile
    if moaHostileNPCDetector.IsRunning() && HostileActor.GetReference() As Actor
      akHostile = HostileActor.GetReference() As Actor
      if !bIsDying(akHostile) && !akHostile.GetActorBase().IsInvulnerable()
        ReviveScript.Thief = akHostile
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 1: ( '" + ReviveScript.Thief.GetActorBase().GetName() + "', " + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )")
        if !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
          return
        endif
        bFound = True
      endif
    endif
    if !bFound
      i = 3
      while i > 0 && !bFound
        i -= 1
        stopAndConfirm(moaHostileNPCDetector, 3)
        moaHostileNPCDetector.Start()
        akHostile = HostileActor.GetReference() As Actor
        if akHostile && !bIsDying(akHostile) && !akHostile.GetActorBase().IsInvulnerable()
          ReviveScript.Thief = akHostile
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 1: ( '" + ReviveScript.Thief.GetActorBase().GetName() + "', " + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )")
          if !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
            return
          endif
          bFound = True
        endif
      endwhile
    endif
    if !bFound
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 2)...")
      Actor RandActor = Game.FindClosestActorFromRef(PlayerRef, 2000)
      if RandActor
        if bCanSteal(RandActor)
          ReviveScript.Thief = RandActor
          HostileActor.ForceRefTo(ReviveScript.Thief)
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 2: ( '" + RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )")
          if !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
            return
          endif
        endif
        i = 0
        while (i < 15) && !bFound
          i += 1
          RandActor = Game.FindRandomActorFromRef(PlayerRef, 2000)
          if RandActor
            if bCanSteal(RandActor)
              ReviveScript.Thief = RandActor
              HostileActor.ForceRefTo(ReviveScript.Thief)
              ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 2: ( '" + RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )")
              if !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
                return
              endif
              bFound = True
            endif
          endif
        endwhile
        if !bFound && ConfigMenu.bIsLoggingEnabled
          Debug.Trace("MarkOfArkay: No hostile NPC who can steal detected.")
        endif
      endif
    endif
  endif
  if !ConfigMenu.bSpawnHostile || (!bSpawnThief(PlayerRef As ObjectReference, bFound) && !bFound)
    ;No NPC is around the player
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No hostile NPC found/spawned.")
    return
  endif
endfunction

Bool function FollowerCanProtectPlayer()
  if (ConfigMenu.bFollowerProtectPlayer && ReviveScript.Attacker)
    Int i = FollowerArr.Length
    if i > 0
      Bool bInCombat = False
      while i > 0 && !bInCombat
        i -= 1
        if bIsFollower(FollowerArr[i])
          if (FollowerArr[i].Is3DLoaded() && !bIsDying(FollowerArr[i]) && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef))
            if ((FollowerArr[i].GetCombatState()) && (FollowerArr[i].GetDistance(PlayerRef) <= 2500.0))
              bInCombat = True
            elseif (ReviveScript.Attacker != FollowerArr[i]) && (ReviveScript.Attacker.GetDistance(PlayerRef) <= 10000.0)
              if (bIsDying(ReviveScript.Attacker) || ReviveScript.Attacker.IsBleedingOut())
                ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Someone avenged your defeat.")
                return True
              elseif ReviveScript.Attacker.IsInCombat()
                bInCombat = True
              endif
            endif
          endif
        endif
      endwhile
      if bInCombat
        Utility.Wait(5.0)
        i = FollowerArr.Length
        while i > 0
          i -= 1
          if bIsFollower(FollowerArr[i])
            if (FollowerArr[i].Is3DLoaded() && !bIsDying(FollowerArr[i]) && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef))
              if ((FollowerArr[i].GetCombatState() == 1) && (FollowerArr[i].GetDistance(PlayerRef) <= 2500.0))
                ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_In_Combat")
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Followers are still fighting.")
                return True
              elseif ((ReviveScript.Attacker != FollowerArr[i]) && (ReviveScript.Attacker.IsDead() || (ReviveScript.Attacker.GetActorValue("Health") <= 0) || ReviveScript.Attacker.IsBleedingOut()))
                ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Someone avenged your defeat.")
                return True
              endif
            endif
          endif
        endwhile
      endif
    endif
  endif
  return False
endfunction

function HoldFollowers()
  if ConfigMenu.bPlayerProtectFollower
    Int i = FollowerArr.Length
    while i > 0
      i -= 1
      if FollowerArr[i]
        if ((!FollowerArr[i].IsDead()) || (FollowerArr[i].IsDead() && ConfigMenu.bPlayerProtectFollower))
          if (FollowerArr[i].IsDead())
            if (ConfigMenu.bPlayerProtectFollower)
              FollowerArr[i].Resurrect()
            endif
          endif
          FollowerArr[i].StopCombat()
          FollowerArr[i].StopCombatAlarm()
          FollowerArr[i].DisableNoWait()
          FollowerArr[i].MoveTo(ReviveScript.LostItemsChest)
        endif
      endif
    endwhile
  endif
endfunction

function ReleaseFollowers()
  if ConfigMenu.bPlayerProtectFollower
    Int i = FollowerArr.Length
    while i > 0
      i -= 1
      if FollowerArr[i]
        FollowerArr[i].RestoreActorValue("Health", 9999)
        FollowerArr[i].MoveToMyEditorLocation()
      endif
    endwhile
  endif
endfunction

function RemoveDeadClone()
  if !SoulMark02.GetActorReference() && !DeadClone
    return
  endif
  Actor Clone = SoulMark02.GetActorReference()
  if !Clone
    Clone = DeadClone
  endif
  Clone.MoveTo(ReviveScript.LostItemsChest)
  Clone.SetCriticalStage(Clone.CritStage_DisintegrateEnd)
  Clone.DisableNoWait()
  DeadClone = None
  SoulMark02.UnregisterForUpdate()
endfunction

function RemoveSpawnedThiefs()
  Int i = 0
  Actor Thief
  while i < ThiefActors.Length
    if ThiefActors[i].GetActorReference()
      Thief = ThiefActors[i].GetActorReference()
      Thief && Thief.SetCriticalStage(Thief.CritStage_DisintegrateEnd)
      Thief && Thief.DisableNoWait()
    endif
    i += 1
  endwhile
endfunction

function RespawnFollowers()
  if ConfigMenu.bPlayerProtectFollower
    Int i = FollowerArr.Length
    while i > 0
      i -= 1
      if FollowerArr[i]
        FollowerArr[i].RestoreActorValue("Health", 9999)
        FollowerArr[i].MoveTo(PlayerRef)
      endif
    endwhile
  endif
endfunction

function ResurrectFollowers()
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrecting followers ...")
  Int i = FollowerArr.Length
  while i > 0
    i -= 1
    if FollowerArr[i]
      if (FollowerArr[i].IsDead())
        FollowerArr[i].Resurrect()
      else
        FollowerArr[i].RestoreActorValue("Health", 9999)
      endif
    endif
  endwhile
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrection of followers finished.")
endfunction

FormList function SelectSpawnList(ObjectReference akMarker, Int aiIndex=-2, Bool[] SpawnFlags, Actor ActorRef=None)
  if !akMarker
    return None
  endif
  if aiIndex == -1
    if SpawnFlags
      Int iIndex = RandomIntWithExclusionArray(0, AllSpawnLists.GetSize() - 1, SpawnFlags)
      if iIndex < 0
        return None
      endif
      return AllSpawnLists.GetAt(iIndex) As FormList
    endif
    return AllSpawnLists.GetAt(Utility.RandomInt(0, AllSpawnLists.GetSize() - 1)) As FormList
  elseif aiIndex > -1
    return AllSpawnLists.GetAt(aiIndex) As FormList
  endif
  Bool bIsPlayerVampire = bIsPlayerVampire()
  Bool bIsPlayerWereWolf = bIsPlayerWereWolf()
  if ConfigMenu.bSpawnCheckRelation && ActorRef
    clearSpawnPool()
    if ConfigMenu.bCreaturesCanSteal
      if !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
        if ActorRef.IsInFaction(GiantFaction)
          addToSpawnPool(14)
        endif
        if (ActorRef.IsInFaction(DragonFaction) || ActorRef.HasKeywordString("ActorTypeDragon"))
          addToSpawnPool(7)
        endif
      endif
      if (ActorRef.GetRace() == AtronachFlameRace) || (ActorRef.GetRace() == AtronachFrostRace) || (ActorRef.GetRace() == AtronachStormRace)
        addToSpawnPool(2)
      endif
      if ActorRef.IsInFaction(ChaurusFaction)
        addToSpawnPool(4)
      endif
      if ActorRef.IsInFaction(DragonPriestFaction)
        addToSpawnPool(6)
      endif
      if ActorRef.IsInFaction(DraugrFaction)
        addToSpawnPool(8)
      endif
      if ActorRef.IsInFaction(DremoraFaction)
        addToSpawnPool(9)
      endif
      if ActorRef.IsInFaction(DwarvenAutomatonFaction)
        addToSpawnPool(10)
      endif
      if ActorRef.IsInFaction(FalmerFaction)
        addToSpawnPool(11)
      endif
      if ActorRef.HasKeywordString("ActorTypeGhost")
        addToSpawnPool(13)
      endif
      if ActorRef.IsInFaction(HagravenFaction)
        addToSpawnPool(15)
      endif
      if ActorRef.IsInFaction(SkeletonFaction)
        addToSpawnPool(17)
      endif
      if ActorRef.IsInFaction(SpiderFaction)
        addToSpawnPool(18)
      endif
      if ActorRef.IsInFaction(SprigganFaction) || ActorRef.IsInFaction(SprigganPredatorFaction)
        addToSpawnPool(19)
      endif
      if ActorRef.IsInFaction(TrollFaction)
        addToSpawnPool(22)
      endif
      if ActorRef.IsInFaction(VampireFaction)
        addToSpawnPool(23)
      endif
      if ActorRef.IsInFaction(WerewolfFaction)
        addToSpawnPool(25)
      endif
      if ActorRef.IsInFaction(WispFaction)
        addToSpawnPool(26)
      endif
    endif
    if ActorRef.IsInFaction(DA13AfflictedFaction)
      addToSpawnPool(0)
    endif
    if ActorRef.IsInFaction(DarkBrotherHoodFaction)
      addToSpawnPool(1)
    endif
    if ActorRef.IsInFaction(BanditFaction)
      addToSpawnPool(3)
    endif
    if ActorRef.IsInFaction(DLC1HunterFaction) && bIsPlayerVampire
      addToSpawnPool(5)
    endif
    if ActorRef.IsInFaction(ForswornFaction)
      addToSpawnPool(12)
    endif
    if ActorRef.IsInFaction(SilverHandFaction) && bIsPlayerWereWolf
      addToSpawnPool(16)
    endif
    if ActorRef.IsInFaction(ThalmorFaction)
      addToSpawnPool(20)
    endif
    if ActorRef.IsInFaction(ThievesGuildFaction)
      addToSpawnPool(21)
    endif
    if ActorRef.IsInFaction(WarlockFaction) || ActorRef.IsInFaction(NecromancerFaction)
      addToSpawnPool(24)
    endif
    if ActorRef.IsInFaction(HagravenFaction)
      addToSpawnPool(27)
    endif
    if iSpawnPool > 0
      return getFromSpawnPool()
    endif
  endif
  if ConfigMenu.bSpawnByLocation
    clearSpawnPool()
    Location akLocation = akMarker.GetCurrentLocation()
    if akLocation
      if akLocation.HasKeyword(LocTypeCity) || akLocation.HasKeyword(LocTypeTown) || akLocation.HasKeyword(LocTypePlayerHouse) || akLocation.HasKeyword(LocTypeDwelling) || akLocation.HasKeyword(LocTypeHabitation)
        if ConfigMenu.bSpawnCheckRelation
          if bIsSpawnEnabled(SpawnFlags, 5) && bIsPlayerVampire
            addToSpawnPool(5)
          endif
          if bIsSpawnEnabled(SpawnFlags, 16) && bIsPlayerWereWolf
            addToSpawnPool(16)
          endif
          if bIsSpawnEnabled(SpawnFlags, 23)
            if ConfigMenu.bCreaturesCanSteal && !bIsPlayerVampire
              addToSpawnPool(23)
            endif
          endif
          if bIsSpawnEnabled(SpawnFlags, 25) && ConfigMenu.bCreaturesCanSteal && !bIsPlayerWereWolf
            addToSpawnPool(25)
          endif
        endif
        if bIsSpawnEnabled(SpawnFlags, 21)
          if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
            addToSpawnPool(21)
          endif
        endif
        if bIsSpawnEnabled(SpawnFlags, 1)
          if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
            addToSpawnPool(1)
          endif
        endif
      endif
      if akLocation.HasKeyword(LocTypeGiantCamp)
        if bIsSpawnEnabled(SpawnFlags, 14) && ConfigMenu.bCreaturesCanSteal && !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
          addToSpawnPool(14)
        endif
      endif
      if akLocation.HasKeyword(LocTypeDraugrCrypt)
        if bIsSpawnEnabled(SpawnFlags, 8) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(8)
        endif
        if bIsSpawnEnabled(SpawnFlags, 3)
          addToSpawnPool(3)
        endif
      endif
      if bIsSpawnEnabled(SpawnFlags, 3) && (akLocation.HasKeyword(LocTypeBanditCamp) || akLocation.HasKeyword(LocTypeMine))
        addToSpawnPool(3)
      endif
      if akLocation.HasKeyword(LocTypeFalmerHive)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 11)
            addToSpawnPool(11)
          endif
          if bIsSpawnEnabled(SpawnFlags, 4)
            addToSpawnPool(4)
          endif
          if bIsSpawnEnabled(SpawnFlags, 18)
            addToSpawnPool(18)
          endif
        endif
      endif
      if akLocation.HasKeyword(LocSetDwarvenRuin) || akLocation.HasKeyword(LocTypeDwarvenAutomatons)
        if bIsSpawnEnabled(SpawnFlags, 10) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(10)
        endif
        if bIsSpawnEnabled(SpawnFlags, 3)
          addToSpawnPool(3)
        endif
        if bIsSpawnEnabled(SpawnFlags, 13)
          addToSpawnPool(13)
        endif
      endif
      if bIsSpawnEnabled(SpawnFlags, 12) && akLocation.HasKeyword(LocTypeForswornCamp)
        addToSpawnPool(12)
      endif
      if akLocation.HasKeyword(LocTypeVampireLair)
        if ConfigMenu.bSpawnCheckRelation
          if bIsSpawnEnabled(SpawnFlags, 5) && bIsPlayerVampire
            addToSpawnPool(5)
          elseif bIsSpawnEnabled(SpawnFlags, 23) && ConfigMenu.bCreaturesCanSteal
            addToSpawnPool(23)
          endif
        elseif bIsSpawnEnabled(SpawnFlags, 23) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(23)
        endif
      endif
      if akLocation.HasKeyword(LocTypeWerewolfLair)
        if ConfigMenu.bSpawnCheckRelation
          if bIsSpawnEnabled(SpawnFlags, 16) && bIsPlayerWereWolf
            addToSpawnPool(16)
          elseif bIsSpawnEnabled(SpawnFlags, 25) && ConfigMenu.bCreaturesCanSteal
            addToSpawnPool(25)
          endif
        elseif bIsSpawnEnabled(SpawnFlags, 25) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(25)
        endif
      endif
      if akLocation.HasKeyword(LocTypeWarlockLair)
        if bIsSpawnEnabled(SpawnFlags, 2) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(2)
        endif
        if bIsSpawnEnabled(SpawnFlags, 24)
          addToSpawnPool(24)
        endif
      endif
      if akLocation.HasKeyword(LocSetNordicRuin)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 8)
            addToSpawnPool(8)
          endif
          if bIsSpawnEnabled(SpawnFlags, 18)
            addToSpawnPool(18)
          endif
        endif
        if bIsSpawnEnabled(SpawnFlags, 3)
          addToSpawnPool(3)
        endif
        if bIsSpawnEnabled(SpawnFlags, 13)
          addToSpawnPool(13)
        endif
      endif
      if akLocation.HasKeyword(LocTypeMilitaryFort)
        if bIsSpawnEnabled(SpawnFlags, 17) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(17)
        endif
        if bIsSpawnEnabled(SpawnFlags, 13)
          addToSpawnPool(13)
        endif
        if bIsSpawnEnabled(SpawnFlags, 3)
          addToSpawnPool(3)
        endif
      endif
      if akLocation.HasKeyword(LocTypeDragonPriestLair)
        if bIsSpawnEnabled(SpawnFlags, 6) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(6)
        endif
      endif
      if akLocation.HasKeyword(LocTypeHagravenNest)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 15)
            addToSpawnPool(15)
          endif
          if bIsSpawnEnabled(SpawnFlags, 26)
            addToSpawnPool(26)
          endif
        endif
        if bIsSpawnEnabled(SpawnFlags, 27)
          addToSpawnPool(27)
        endif
      endif
      if akLocation.HasKeyword(LocTypeDragonLair)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 6) && ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
            addToSpawnPool(6)
          endif
          if bIsSpawnEnabled(SpawnFlags, 7)
            addToSpawnPool(7)
          endif
        endif
      endif
      if akLocation.HasKeyword(LocSetCave) || akLocation.HasKeyword(LocSetCaveIce)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 22)
            addToSpawnPool(22)
          endif
          if bIsSpawnEnabled(SpawnFlags, 18)
            addToSpawnPool(18)
          endif
          if bIsSpawnEnabled(SpawnFlags, 17)
            addToSpawnPool(17)
          endif
          if akLocation.HasKeyword(LocSetCaveIce)
            if bIsSpawnEnabled(SpawnFlags, 26)
              addToSpawnPool(26)
            endif
          endif
        endif
      endif
      if akLocation.HasKeyword(LocTypeSprigganGrove)
        if ConfigMenu.bCreaturesCanSteal
          if bIsSpawnEnabled(SpawnFlags, 19)
            addToSpawnPool(19)
          endif
          if bIsSpawnEnabled(SpawnFlags, 26)
            addToSpawnPool(26)
          endif
        endif
      endif
      if ReviveScript.RespawnScript.bInSameLocation(ThalmorEmbassyLocation, akMarker)
        if bIsSpawnEnabled(SpawnFlags, 20)
          addToSpawnPool(20)
        endif
      endif
      if ReviveScript.RespawnScript.bInSameLocation(BthardamzLocation, akMarker)
        if bIsSpawnEnabled(SpawnFlags, 0)
          addToSpawnPool(0)
        endif
      endif
      if ReviveScript.RespawnScript.bInSameLocation(ShrineofMehrunesDagonLocation, akMarker)
        if bIsSpawnEnabled(SpawnFlags, 9) && ConfigMenu.bCreaturesCanSteal
          addToSpawnPool(9)
        endif
      endif
    endif
    if (akMarker.GetParentCell() == MehrunesDagonShrine)
      if bIsSpawnEnabled(SpawnFlags, 9) && ConfigMenu.bCreaturesCanSteal
        addToSpawnPool(9)
      endif
    endif

    ;Debug.Trace("iSpawnArr :"+iSpawnArr)
    if iSpawnPool > 0
      if iTotalSpawns == 1 && akLocation && !akLocation.HasKeyword(LocTypeHabitation) && !akLocation.HasKeyword(LocTypeDwelling) ;Bandits can be anywhere
        addToSpawnPool(3)
      endif
    elseif !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
      if bIsSpawnEnabled(SpawnFlags, 21)
        if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
          addToSpawnPool(21)
        endif
      endif
      if bIsSpawnEnabled(SpawnFlags, 1)
        if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
          addToSpawnPool(1)
        endif
      endif
      if bIsSpawnEnabled(SpawnFlags, 3)
        addToSpawnPool(3)
      endif
    endif
    if iSpawnPool > 0
      return getFromSpawnPool()
    endif
    if !ConfigMenu.bRetrySpawnWithoutLocation
      return None
    endif
  endif
  clearSpawnPool()
  if ConfigMenu.bCreaturesCanSteal
    if !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
      bIsSpawnEnabled(SpawnFlags, 7) && addToSpawnPool(7)
      bIsSpawnEnabled(SpawnFlags, 14) && addToSpawnPool(14)
    endif
    bIsSpawnEnabled(SpawnFlags, 11) && addToSpawnPool(11)
    bIsSpawnEnabled(SpawnFlags, 4) && addToSpawnPool(4)
    bIsSpawnEnabled(SpawnFlags, 2) && addToSpawnPool(2)
    bIsSpawnEnabled(SpawnFlags, 26) && addToSpawnPool(26)
    bIsSpawnEnabled(SpawnFlags, 6) && addToSpawnPool(6)
    bIsSpawnEnabled(SpawnFlags, 15) && addToSpawnPool(15)
    bIsSpawnEnabled(SpawnFlags, 18) && addToSpawnPool(18)
    bIsSpawnEnabled(SpawnFlags, 13) && addToSpawnPool(13)
    bIsSpawnEnabled(SpawnFlags, 22) && addToSpawnPool(22)
    bIsSpawnEnabled(SpawnFlags, 17) && addToSpawnPool(17)
    bIsSpawnEnabled(SpawnFlags, 9) && addToSpawnPool(9)
    bIsSpawnEnabled(SpawnFlags, 8) && addToSpawnPool(8)
    bIsSpawnEnabled(SpawnFlags, 10) && addToSpawnPool(10)
    bIsSpawnEnabled(SpawnFlags, 19) && addToSpawnPool(19)
  endif
  bIsSpawnEnabled(SpawnFlags, 0) && addToSpawnPool(0)
  bIsSpawnEnabled(SpawnFlags, 12) && addToSpawnPool(12)
  if bIsSpawnEnabled(SpawnFlags, 20)
    if !ConfigMenu.bSpawnCheckRelation || (!PlayerRef.GetRace() || ((PlayerRef.GetRace() != HighElf) && (PlayerRef.GetRace() != HighElfVampire)))
      addToSpawnPool(20)
    endif
  endif
  bIsSpawnEnabled(SpawnFlags, 24) && addToSpawnPool(24)
  bIsSpawnEnabled(SpawnFlags, 27) && addToSpawnPool(27)
  if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
    bIsSpawnEnabled(SpawnFlags, 21) && addToSpawnPool(21)
  endif
  if !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
    bIsSpawnEnabled(SpawnFlags, 1) && addToSpawnPool(1)
  endif
  if ConfigMenu.bSpawnCheckRelation
    if bIsPlayerVampire
      bIsSpawnEnabled(SpawnFlags, 5) && addToSpawnPool(5)
    elseif ConfigMenu.bCreaturesCanSteal
      bIsSpawnEnabled(SpawnFlags, 23) && addToSpawnPool(23)
    endif
  else
    bIsSpawnEnabled(SpawnFlags, 5) && addToSpawnPool(5)
    if bIsSpawnEnabled(SpawnFlags, 23) && ConfigMenu.bCreaturesCanSteal
      addToSpawnPool(23)
    endif
  endif
  if ConfigMenu.bSpawnCheckRelation
    if bIsPlayerWereWolf
      bIsSpawnEnabled(SpawnFlags, 16) && addToSpawnPool(16)
    elseif ConfigMenu.bCreaturesCanSteal
      bIsSpawnEnabled(SpawnFlags, 25) && addToSpawnPool(25)
    endif
  else
    bIsSpawnEnabled(SpawnFlags, 16) && addToSpawnPool(16)
    bIsSpawnEnabled(SpawnFlags, 25) && ConfigMenu.bCreaturesCanSteal && addToSpawnPool(25)
  endif
  bIsSpawnEnabled(SpawnFlags, 3) && addToSpawnPool(3)
  if iSpawnPool > 0
    return getFromSpawnPool()
  endif
  return None
endfunction

Form[] function SpawnActorsFromList(FormList aiActors, ObjectReference akMarker, Int aiCount=1, Int aiMinLevel=2, Int aiMaxLevel=2, Bool abMix=False)
  Form[] akResult
  if aiActors == None || aiCount == 0
    return akResult
  endif
  Int iIndex = AllSpawnLists.Find(aiActors)
  clearSpawnPool()
  if abMix && iIndex > -1
    addToSpawnPool(iIndex)
    if iIndex == 2 ;Atronach
      if ConfigMenu.iSpawnWeights[24]
        addToSpawnPool(24) ;Warlock
      endif
    elseif iIndex == 4 ;Chaurus
      if ConfigMenu.iSpawnWeights[11]
        addToSpawnPool(11) ;Falmer
      endif
    elseif iIndex == 11 ;Falmer
      if ConfigMenu.iSpawnWeights[4]
        addToSpawnPool(4) ;Chaurus
      endif
    elseif iIndex == 15 ;Hagraven
      if ConfigMenu.iSpawnWeights[27]
        addToSpawnPool(27) ;Witches
      endif
    elseif iIndex == 24 ;Warlock
      if ConfigMenu.iSpawnWeights[2]
        addToSpawnPool(2) ;Warlock
      endif
    elseif iIndex == 27 ;Witches
      if ConfigMenu.iSpawnWeights[15]
        addToSpawnPool(15) ;Witches
      endif
    endif
  endif
  if aiCount < 0
    if iIndex > -1
      aiCount = Utility.RandomInt(1, ConfigMenu.iSpawnCounts[iIndex])
    else
      aiCount = 1
    endif
  endif
  Int iRandInt
  Int iMinLevel
  Int iMaxLevel
  if aiMaxLevel < aiMinLevel
    iMinLevel = aiMaxLevel
    iMaxLevel = aiMinLevel
  else
    iMinLevel = aiMinLevel
    iMaxLevel = aiMaxLevel
  endif
  Form[] akTargets = Utility.CreateFormArray(aiCount)
  ActorBase akActorBase
  FormList akList = aiActors
  iIndex = 0
  while iIndex < aiCount
    if iIndex > 0 && iSpawnPool > 0
      akList = getFromSpawnPool()
    endif
    iRandInt = Utility.RandomInt(0, akList.GetSize() - 1)
    if akList.GetAt(iRandInt) As ActorBase
      akActorBase = akList.GetAt(iRandInt) As ActorBase
    else
      akActorBase = (akList.GetAt(iRandInt) As Actor).GetActorBase()
    endif
    akTargets[iIndex] = akMarker.PlaceActorAtMe(akActorToPlace=akActorBase, aiLevelMod=Utility.RandomInt(iMinLevel, iMaxLevel))
    Utility.Wait(0.5)
    iIndex += 1
  endwhile
  return akTargets
endfunction

function ToggleFollower(Bool bEnable)
  if ConfigMenu.bPlayerProtectFollower
    Int i = FollowerArr.Length
    while i > 0
      i -= 1
      if FollowerArr[i]
        if bEnable
          FollowerArr[i].Enable()
          if FollowerArr[i].IsDead()
            FollowerArr[i].Resurrect()
          endif
          FollowerArr[i].EvaluatePackage()
          FollowerArr[i].RestoreActorValue("Health", 9999)
        else
          FollowerArr[i].Disable()
        endif
      endif
    endwhile
  endif
endfunction

function addToSpawnPool(Int iSpawnIndex)
  Int iEmpty = iSpawnArr.Find(-1)
  if iEmpty > -1 && iSpawnArr.Find(iSpawnIndex) < 0
    iSpawnPool += ConfigMenu.iSpawnWeights[iSpawnIndex]
    iSpawnArr[iEmpty] = iSpawnIndex
    iTotalSpawns += 1
  endif
endfunction

Bool function bCanSendToCidhna()
  return (!MS01.IsCompleted() || MS02.IsCompleted())
endfunction

Bool function bCanSteal(Actor ActorRef)
  if ActorRef
    return ((ActorRef != PlayerRef) && !ActorRef.HasSpell(WontSteal) && !(ActorRef.IsDead() || (ActorRef.GetActorValue("Health") <= 0)) && !ActorRef.IsDisabled() && !ActorRef.IsEssential() && !ActorRef.GetActorBase().IsProtected() && !ActorRef.GetActorBase().IsInvulnerable() && !ActorRef.IsGhost() && !ActorRef.IsCommandedActor() && !ActorRef.IsGuard() && ((ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature") && (!ConfigMenu.bMoralityMatters || (ActorRef.GetActorValue("Morality") < 3))) || (ConfigMenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature") && (!ActorRef.HasKeywordString("actortypeanimal") || (ActorRef.IsInFaction(SpiderFaction) || ActorRef.IsInFaction(ChaurusFaction))))) && ((ReviveScript.Attacker && (ReviveScript.Attacker == ActorRef)) || (ActorRef.GetFactionReaction(PlayerRef) == 1) || ActorRef.IsHostileToActor(PlayerRef) || (ActorRef.GetRelationshipRank(PlayerRef) < 0)) && (ActorRef.HasLOS(PlayerRef) || (ReviveScript.Attacker && (ReviveScript.Attacker == ActorRef)) || (ActorRef.GetDistance(PlayerRef) <= 100.0)) && (!ConfigMenu.moaNPCHasLevelRange || ((ActorRef.GetLevel() >= ConfigMenu.moaLowerNPCMaxLvlDiff.GetValue()) && (ActorRef.GetLevel() <= ConfigMenu.moaHigherNPCMaxLvlDiff.GetValue()))))
  endif
  return False
endfunction

Form[] function bCloneActor(Actor akActor, ObjectReference akMarker, Int aiCount=1, Int aiLevel=2, Bool abDead=False)
  ActorBase akActorBase = akActor.GetActorBase()
  if !akActorBase || aiCount <= 0
    return None
  endif
  Form[] akCloneArr = Utility.CreateFormArray(aiCount)
  Int i = 0
  while i < aiCount
    akCloneArr[i] = akMarker.PlaceActorAtMe(akActorBase, aiLevel, None) As Form
    if abDead
      if akActorBase.IsEssential()
        (akCloneArr[i] As Actor).KillEssential()
      else
        (akCloneArr[i] As Actor).Kill()
      endif
    endif
    i += 1
  endwhile
  return akCloneArr
endfunction

Bool function bGuardCanSendToJail()
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detecting guard NPCs...")
  Bool bCanSendToCidhna = bCanSendToCidhna()
  Faction CrimeFaction
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 1)...")
  if (ReviveScript.Attacker && !ReviveScript.Attacker.IsDead())
    if (ReviveScript.Attacker.IsGuard())
      if (PlayerRef.GetDistance(ReviveScript.Attacker) < 2000.0)
        CrimeFaction = ReviveScript.Attacker.GetCrimeFaction()
        if (CrimeFaction && (CrimeFaction.GetCrimeGold() > 0))
          if ((CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach) || bCanSendToCidhna)
            ReviveScript.Guard = ReviveScript.Attacker
            ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 1: ( '" + ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )")
            return True
          endif
        endif
      endif
    endif
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 2)...")
  stopAndConfirm(moaGuardDetector, 3)
  moaGuardDetector.Start()
  if GuardNPC.GetReference() As Actor
    CrimeFaction = (GuardNPC.GetReference() As Actor).GetCrimeFaction()
    if (CrimeFaction && (CrimeFaction.GetCrimeGold() > 0))
      if ((CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach) || bCanSendToCidhna)
        ReviveScript.Guard = GuardNPC.GetReference() As Actor
        moaGuardDetector.Stop()
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 2: ( '" + ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )")
        return True
      endif
    endif
  endif
  moaGuardDetector.Stop()
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 3)...")
  Int i = 0
  Actor RandomActor
  while (i < 15)
    i += 1
    RandomActor = Game.FindRandomActorFromRef(PlayerRef, 2000)
    if RandomActor
      if RandomActor != PlayerRef
        if !RandomActor.IsDead()
          if RandomActor.IsGuard()
            CrimeFaction = RandomActor.GetCrimeFaction()
            if (CrimeFaction && (CrimeFaction.GetCrimeGold() > 0))
              if ((CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach) || bCanSendToCidhna)
                ReviveScript.Guard = RandomActor
                ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 3: ( '" + ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )")
                return True
              endif
            endif
          endif
        endif
      endif
    else ;No NPC is around the player
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No NPC is around.")
      return False
    endif
  endwhile
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player won't go to jail.")
  return False
endfunction

Bool function bInBeastForm()
  if ReviveScript.WerewolfQuest.IsRunning() || ReviveScript.VampireLordQuest.IsRunning()
    return True
  elseif (PlayerRef.GetRace() == WereWolfBeastRace)
    return True
  elseif (PlayerRef.GetRace() == DLC1VampireBeastRace)
    return True
  endif
  return False
endfunction

Bool function bIsDying(Actor aiActor)
  return aiActor.IsDead() || aiActor.GetActorValue("Health") <= 0
endfunction

Bool function bIsFollower(Actor ActorRef)
  if ActorRef
    return (ActorRef != PlayerRef) && !ActorRef.IsCommandedActor() && (ActorRef.IsPlayerTeammate() || ActorRef.IsInFaction(PlayerFollowerFaction))
  endif
  return False
endfunction

Bool function bIsHostile(Actor ActorRef)
  if ActorRef
    return ((ActorRef != PlayerRef) && !ActorRef.HasSpell(WontSteal) && !(ActorRef.IsDead() || (ActorRef.GetActorValue("Health") <= 0)) && !ActorRef.IsDisabled() && !ActorRef.IsCommandedActor() && !ActorRef.IsGuard() && ((ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature")) || (ConfigMenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature") && (!ActorRef.HasKeywordString("actortypeanimal") || (ActorRef.IsInFaction(SpiderFaction) || ActorRef.IsInFaction(ChaurusFaction))))) && ((ReviveScript.Attacker && (ReviveScript.Attacker == ActorRef)) || (ActorRef.GetFactionReaction(PlayerRef) == 1) || ActorRef.IsHostileToActor(PlayerRef) || (ActorRef.GetRelationshipRank(PlayerRef) < 0)))
  endif
  return False
endfunction

Bool function bIsHostileNPCNearby()
  Int i
  Actor akHostile
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC (Phase 1)...")
  if moaHostileNPCDetector01.IsRunning() && HostileActor01.GetReference() As Actor
    akHostile = HostileActor01.GetReference() As Actor
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 1: ( '" + akHostile.GetActorBase().GetName() + "', " + akHostile + ", " + akHostile.GetRace() + ", )")
    return True
  else
    i = 3
    while i > 0
      i -= 1
      stopAndConfirm(moaHostileNPCDetector01, 3)
      moaHostileNPCDetector01.Start()
      if HostileActor01.GetReference() As Actor
        akHostile = HostileActor01.GetReference() As Actor
        ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 1: ( '" + akHostile.GetActorBase().GetName() + "', " + akHostile + ", " + akHostile.GetRace() + ", )")
        return True
      endif
    endwhile
  endif
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC (Phase 2)...")
  Actor RandActor = Game.FindClosestActorFromRef(PlayerRef, 2000)
  if RandActor
    if bIsHostile(RandActor)
      ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 2: ( '" + RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )")
      return True
    endif
    i = 0
    while (i < 15)
      i += 1
      RandActor = Game.FindRandomActorFromRef(PlayerRef, 2000)
      if RandActor
        if bIsHostile(RandActor)
          ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 2: ( '" + RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )")
          return True
        endif
      endif
    endwhile
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No hostile NPC detected.")
  else ;No NPC is around the player
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No NPC is near the player.")
    return False
  endif
  return False
endfunction

Bool function bIsPlayerVampire()
  return PlayerIsVampire.GetValueInt() == 1 || iInBeastForm() == 1
endfunction

Bool function bIsPlayerWereWolf()
  return CHScript.PlayerHasBeastBlood == 1 || PlayerIsWerewolf.GetValueInt() == 1 || iInBeastForm() == 2
endfunction

Bool function bIsSpawnEnabled(Bool[] bFlagArr, Int iIndex)
  if !bFlagArr || iIndex > bFlagArr.Length - 1 || !bFlagArr[iIndex]
    return False
  endif
  return True
endfunction

Bool function bSpawnThief(ObjectReference akMarkerRef, Bool bExtra=False)
  ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Trying to spawning a hostile NPC...")
  if !bExtra
    ReviveScript.Thief = None
  endif
  Bool[] bSpawnFlags = Utility.CreateBoolArray(ConfigMenu.iSpawnCounts.Length)
  Int i = 0
  while i < ConfigMenu.iSpawnWeights.Length
    bSpawnFlags[i] = ConfigMenu.iSpawnWeights[i] As Bool
    i += 1
  endwhile
  Form[] RandActors = SpawnActorsFromList(aiActors=SelectSpawnList(akMarkerRef, SpawnFlags=bSpawnFlags, ActorRef=ReviveScript.Thief), akMarker=akMarkerRef, aiCount=-1, aiMinLevel=ConfigMenu.iSpawnMinLevel, aiMaxLevel=ConfigMenu.iSpawnMaxLevel, abMix=ConfigMenu.bSpawnBringAllies)
  if RandActors
    Actor RandActor = RandActors[0] As Actor
    if !bExtra || !ReviveScript.Thief
      ReviveScript.Thief = RandActor
      ReviveScript.ThiefNPC01.Clear()
      ReviveScript.ThiefNPC.Clear()
      stopAndConfirm(moaHostileNPCDetector, 3)
    endif
    i = 0
    while i < ThiefActors.Length
      if i < RandActors.Length
        (RandActors[i] As Actor).AddSpell(WontSteal)
        (RandActors[i] As Actor).RemoveItem(ReviveScript.MarkOfArkay, (RandActors[i] As Actor).GetItemCount(ReviveScript.MarkOfArkay))
        (RandActors[i] As Actor).RemoveItem(ReviveScript.RevivalScroll, (RandActors[i] As Actor).GetItemCount(ReviveScript.RevivalScroll))
        (RandActors[i] As Actor).RemoveItem(ReviveScript.SacrificeScroll, (RandActors[i] As Actor).GetItemCount(ReviveScript.SacrificeScroll))
        (RandActors[i] As Actor).RemoveItem(ReviveScript.GrandFilledGem, (RandActors[i] As Actor).GetItemCount(ReviveScript.GrandFilledGem))
        (RandActors[i] As Actor).RemoveItem(ReviveScript.BlackFilledGem, (RandActors[i] As Actor).GetItemCount(ReviveScript.BlackFilledGem))
        (RandActors[i] As Actor).RemoveItem(ReviveScript.Gold001, (RandActors[i] As Actor).GetItemCount(ReviveScript.Gold001))
        ThiefActors[i].ForceRefTo(RandActors[i] As Actor)
      else
        ThiefActors[i].Clear()
      endif
      i += 1
    endwhile
    ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Spawning hostile in phase 3: ( '" + RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )")
    return True
  endif
  return False
endfunction

function bringDeadClone()
  Form[] MyEquipment
  if ReviveScript.ItemScript.bEquipmentRegistered
    MyEquipment = ReviveScript.ItemScript.Equipment
  else
    MyEquipment = ReviveScript.ItemScript.RegisterEquipments(PlayerRef, False, False)
  endif
  Form[] Clones = bCloneActor(PlayerRef, ReviveScript.LostItemsChest, abDead=False)
  Actor Clone = Clones[0] As Actor
  DeadClone = Clone
  Clone.AddSpell(WontSteal)
  Clone.RemoveAllItems()
  Int i = MyEquipment.Length
  while i > 0
    i -= 1
    if MyEquipment[i]
      if MyEquipment[i] As Armor
        if !MyEquipment[i].HasKeywordString("ArmorShield")
          Clone.AddItem(MyEquipment[i])
          Clone.EquipItemEx(MyEquipment[i])
        endif
      endif
    endif
  endwhile
  (Clone As ObjectReference).BlockActivation()
  Clone.Disable()
  Clone.MoveTo(PlayerRef)
  Utility.Wait(0.5)
  Clone.SetActorValue("Paralysis", 1)
  Utility.Wait(1.0)
  Clone.SetDontMove(True)
  Clone.SetRestrained(True)
  Clone.SetUnconscious(True)
  Clone.SetHeadTracking(False)
  Clone.SetGhost(True)
  Clone.SetActorValue("Sneak", 100.0)
  Clone.Enable()
  if !ReviveScript.moaSoulMark01.IsRunning()
    ReviveScript.moaSoulMark01.Start()
  endif
  SoulMark02.ForceRefTo(Clone)
  if ReviveScript.moaRetrieveLostItems.IsRunning()
    ItemMarker02.ForceRefTo(DeadClone)
  endif
  SoulMark02.RegisterForSingleUpdate(30.0)
endfunction

function clearSpawnPool()
  iSpawnPool = 0
  iTotalSpawns = 0
  iSpawnArr = Utility.CreateIntArray(ConfigMenu.iSpawnWeights.Length, -1)
endfunction

FormList function getFromSpawnPool()
  Int iResult = Utility.RandomInt(1, iSpawnPool)
  Int iTotal = 0
  Int iIndex = -1
  while iTotal < iResult
    iIndex += 1
    iTotal += ConfigMenu.iSpawnWeights[iSpawnArr[iIndex]]
  endwhile
  if iIndex > -1 && iIndex < iSpawnArr.Length
    return AllSpawnLists.GetAt(iSpawnArr[iIndex]) As FormList
  endif
  return None
endfunction

Int function iInBeastForm()
  if ReviveScript.VampireLordQuest.IsRunning() || PlayerRef.GetRace() == DLC1VampireBeastRace
    return 1
  elseif ReviveScript.WerewolfQuest.IsRunning() || PlayerRef.GetRace() == WereWolfBeastRace
    return 2
  endif
  return 0
endfunction

Bool function isActorChild(Actor actorRef)
  return (actorRef.isChild() || (actorRef.GetRace() && childRaces.find(actorRef.GetRace()) > -1))
endfunction
