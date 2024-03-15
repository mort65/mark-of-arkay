Scriptname zzzmoarapescript extends Quest

import zzzmoautilscript

FormList property BedsList auto
zzzmoaReviveMCM property ConfigMenu auto
GlobalVariable property CreatureRape auto
Form[] property Equipment auto Hidden
Quest property NPCPacifier auto
Formlist property PacifiedHostiles auto
Formlist property PacifiedTeamMates auto
GlobalVariable property PacifyNPC auto
ReferenceAlias property Rapist1 auto
ReferenceAlias property Rapist10 auto
ReferenceAlias property Rapist2 auto
ReferenceAlias property Rapist3 auto
ReferenceAlias property Rapist4 auto
ReferenceAlias property Rapist5 auto
ReferenceAlias property Rapist6 auto
ReferenceAlias property Rapist7 auto
ReferenceAlias property Rapist8 auto
ReferenceAlias property Rapist9 auto
FormList property RapistsList auto
zzzmoaReviverScript property ReviveScript auto
ReferenceAlias property Victim1 auto
Bool property bIsBusy=False auto Hidden
Faction property calmFaction auto
Actor property playerRef auto

String[] _anim_interfaces

event OnInit()
  RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
endevent

event OnUpdate()
  ReviveScript.SexLabInterface.PlayerLoadsGame()
  ReviveScript.OStimInterface.PlayerLoadsGame()
  ReviveScript.FlowerGirlsInterface.PlayerLoadsGame()
  ReviveScript.SDInterface.PlayerLoadsGame()
  Utility.Wait(10.0)
  ConfigMenu.bIsSexlabActive = ReviveScript.SexLabInterface.GetIsInterfaceActive()
  ConfigMenu.bIsOStimActive = ReviveScript.OStimInterface.GetIsInterfaceActive()
  ConfigMenu.bIsFlowerGirlsActive = ReviveScript.FlowerGirlsInterface.GetIsInterfaceActive()
  ConfigMenu.bIsSDActive = ReviveScript.SDInterface.GetIsInterfaceActive()
endevent

event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
  Debug.trace("MarkOfArkay: On_MOA_Int_PlayerLoadsGame() triggered by " + sender)
  RegisterForSingleUpdate(1.0)
endevent

bool function CheckBed(ObjectReference BedRef, bool IgnoreUsed=true)
  return BedRef && BedRef.IsEnabled() && BedRef.Is3DLoaded() && (!IgnoreUsed || (IgnoreUsed && !BedRef.IsFurnitureInUse(true)))
endfunction

Actor function FindAvailableActor(ObjectReference CenterRef, float Radius=5000.0, int FindGender=-1, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none)
  if !CenterRef || FindGender > 1 || FindGender < -1 || Radius < 0.1
    return none ; Invalid args
  endif

  ; Create supression list
  Form[] Suppressed = new Form[25]
  Suppressed[24] = CenterRef
  Suppressed[23] = IgnoreRef1
  Suppressed[22] = IgnoreRef2
  Suppressed[21] = IgnoreRef3
  Suppressed[20] = IgnoreRef4

  ; Attempt 20 times before giving up.
  int i = Suppressed.Length - 5
  while i > 0
    i -= 1
    Actor FoundRef = Game.FindRandomActorFromRef(CenterRef, Radius)
    if !FoundRef || FoundRef == none || (Suppressed.Find(FoundRef) == -1 && ((FindGender == -1) || (getActorSex(FoundRef) == FindGender)))
      return FoundRef ; None means no actor in radius, give up now
    endif
    Suppressed[i] = FoundRef
  endwhile

  ; No actor found in attempts
  return none
endfunction

;copied from sexlab and modified:
ObjectReference function FindBed(ObjectReference CenterRef, float Radius=1000.0, bool IgnoreUsed=true, ObjectReference IgnoreRef1=none, ObjectReference IgnoreRef2=none)
  if !CenterRef || CenterRef == none || Radius < 1.0
    return none ; Invalid args
  endif
  ObjectReference NearRef
  ObjectReference BedRef
  Form[] Suppressed = new Form[10]
  Suppressed[9] = IgnoreRef1
  Suppressed[8] = IgnoreRef2
  int i = BedsList.GetSize()
  while i
    i -= 1
    Form BedType = BedsList.GetAt(i)
    if BedType
      BedRef = Game.FindClosestReferenceOfTypeFromRef(BedType, CenterRef, Radius)
      if BedRef && (Suppressed.Find(BedRef) == -1) && CheckBed(BedRef, IgnoreUsed)
        if !NearRef || (BedRef.GetDistance(CenterRef) < NearRef.GetDistance(CenterRef))
          NearRef = BedRef
        endif
      endif
    endif
  endwhile
  if NearRef && NearRef != none
    return NearRef
  endif
  while i
    i -= 1
    BedRef = Game.FindRandomReferenceOfAnyTypeInListFromRef(BedsList, CenterRef, Radius)
    if !BedRef || ((Suppressed.Find(BedRef) == -1) && CheckBed(BedRef, IgnoreUsed))
      return BedRef ; Found valid bed or none nearby and we should give up
    else
      Suppressed[i] = BedRef ; Add to suppression list
    endif
  endwhile
  return none ; Nothing found in search loop
endfunction

function Unpacify()
  NPCPacifier.Stop()
  PacifyNPC.SetValueInt(0)
  Victim1.Clear()
  PlayerRef.RemoveFromFaction(calmFaction)
  Actor act = None
  if Rapist1.GetActorRef()
    act = Rapist1.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist1.Clear()
  endif
  if Rapist2.GetActorRef()
    act = Rapist2.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist2.Clear()
  endif
  if Rapist3.GetActorRef()
    act = Rapist3.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist3.Clear()
  endif
  if Rapist4.GetActorRef()
    act = Rapist4.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist4.Clear()
  endif
  if Rapist5.GetActorRef()
    act = Rapist5.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist5.Clear()
  endif
  if Rapist6.GetActorRef()
    act = Rapist6.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist6.Clear()
  endif
  if Rapist7.GetActorRef()
    act = Rapist7.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist7.Clear()
  endif
  if Rapist8.GetActorRef()
    act = Rapist8.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist8.Clear()
  endif
  if Rapist9.GetActorRef()
    act = Rapist9.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist9.Clear()
  endif
  if Rapist10.GetActorRef()
    act = Rapist10.GetActorRef()
    if act
      act.RemoveFromFaction(calmFaction)
    endif
    Rapist10.Clear()
  endif
  (NPCPacifier As zzzmoa_npc_pacifier_quest_script).Unpacify()
endfunction

Actor[] function fixActorArray(Actor[] Actors, Bool bRandomLen=False)
  Actor[] ActorsArray
  int j = Actors.length
  int i = j
  while i > 0
    i -= 1
    if ((i > 0) && Actors[i] && (Actors.rfind(Actors[i], i - 1) > -1))
      Actors[i] = none
      j -= 1
    elseif (!Actors[i] || (Actors[i] == none) || Actors[i].IsDead())
      j -= 1
    endif
  endwhile
  if j < 1
    ActorsArray = new Actor[4]
    return ActorsArray
  endif
  if j > 3
    ActorsArray = new Actor[4]
  elseif j > 2
    ActorsArray = new Actor[3]
  elseif j > 1
    ActorsArray = new Actor[2]
  else
    ActorsArray = new Actor[1]
  endif
  i = 0
  while i < Actors.length
    if (Actors[i] && !Actors[i].IsDead())
      j = ActorsArray.find(None)
      if j > -1
        ActorsArray[j] = Actors[i]
      endif
    endif
    i += 1
  endwhile
  if bRandomLen && (ActorsArray.length > 1)
    i = utility.RandomInt(1, ActorsArray.length)
    Actor[] ShuffledArray
    if i > 3
      ShuffledArray = new Actor[4]
    elseif i == 3
      ShuffledArray = new Actor[3]
    elseif i == 2
      ShuffledArray = new Actor[2]
    else
      ShuffledArray = new Actor[1]
    endif
    while i > 0
      i -= 1
      ShuffledArray[i] = ActorsArray[i]
    endwhile
    ActorsArray = ShuffledArray
  endif
  return ActorsArray
endfunction

Int function getActorSex(Actor act)
  return act.GetLeveledActorBase().GetSex()
endfunction

String function getInteface()
  Int interf = ConfigMenu.iGetCurSexInterface()
  if interf == 0
    return "sexlab"
  elseif interf == 1
    return "ostim"
  elseif interf == 2
    return "fg"
  endif
  return ""
endfunction

Actor[] function getRapists(Actor Victim, Actor Attacker, Bool bReset=False)
  Actor[] rapists
  if (!Attacker || (Attacker == None) || (Attacker.GetDistance(Victim) > 5000.0))
    return rapists
  endif
  if bReset
    Unpacify()
    keepControlsDisabled(1.0, true, true, true, false, true, true, true, false, true)
  endif
  Bool bCreature = False
  if ConfigMenu.bAllowCreatureRape
    bCreature = ((getInteface() == "sexlab") && !Attacker.HasKeywordString("actortypenpc") && ReviveScript.SexLabInterface.IsCreaturesAllowed() && ReviveScript.SexLabInterface.AllowedCreature(Attacker.GetLeveledActorBase().GetRace()))
  endif
  CreatureRape.SetValueInt(bCreature As Int)
  NPCPacifier.Start()
  rapists = new Actor[4]
  rapists[0] = None
  rapists[1] = None
  rapists[2] = None
  rapists[3] = None
  Actor rapist
  string interface = getInteface()
  Int RapistCount = iMax(1, ConfigMenu.fMaxRapists As Int)
  int i = 0
  int j = 0
  int l = PacifiedHostiles.GetSize()
  int m = 32
  int c = 0
  int k
  Bool bBreak = False
  Actor act
  keepControlsDisabled(3.0, true, true, true, false, true, true, true, false, true)
  while i < (RapistCount)
    if (i == 0) && isRapistValid(Attacker)
      rapists[0] = Attacker
    else
      if interface == "sexlab"
        if bCreature
          String raceKey = ReviveScript.SexLabInterface.getRaceKey(rapists[0])
          if raceKey != ""
            rapist = ReviveScript.SexLabInterface.FindRapistCreature(raceKey, Victim as ObjectReference, 5000.0, 2, Victim, rapists[0], rapists[1], rapists[2])
            if isRapistValid(rapist) && (rapists.find(rapist) < 0)
              race creaturerace = rapist.GetLeveledActorBase().GetRace()
              race Attackerrace = Attacker.GetLeveledActorBase().GetRace()
              if (creatureRace == AttackerRace) || ReviveScript.SexLabInterface.AllowedCreatureCombination(AttackerRace, creatureRace)
                if !ConfigMenu.bOnlyHostilesRape || (!rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) > 1))
                  k = rapists.find(None)
                  if k > -1
                    rapists[k] = rapist
                  endif
                endif
              endif
            endif
          endif
        else
          rapist = ReviveScript.SexLabInterface.FindRapist(Victim as ObjectReference, 5000.0, ConfigMenu.iRapistGender - 1, Victim, rapists[0], rapists[1], rapists[2])
          if isRapistValid(rapist) && (rapists.find(rapist) < 0) && (!ConfigMenu.bOnlyHostilesRape || (!rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) > 1)))
            k = rapists.find(None)
            if k > -1
              rapists[k] = rapist
            endif
          endif
        endif
      else
        c = 0
        l = PacifiedHostiles.GetSize()
        while !bBreak && (j < l) && (c < m)
          act = PacifiedHostiles.GetAt(j) As actor
          if act && rapists.Find(act) < 0 && isRapistValid(act) && (!ConfigMenu.bOnlyHostilesRape || (!act.IsHostileToActor(Attacker) && (act.GetFactionReaction(Attacker) > 1)))
            k = rapists.find(None)
            if k > -1
              rapists[k] = act
            endif
            bBreak = True
          endif
          j += 1
          c += 1
        endwhile
        if !bBreak
          rapist = FindAvailableActor(Victim as ObjectReference, 5000.0, 0, Victim, rapists[0], rapists[1], rapists[2])
          if isRapistValid(rapist) && (rapists.find(rapist) < 0) && (!ConfigMenu.bOnlyHostilesRape || (!rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) > 1)))
            k = rapists.find(None)
            if k > -1
              rapists[k] = rapist
            endif
          endif
        endif
      endif
    endif
    i += 1
  endwhile
  Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False)
  return rapists
endfunction

Bool function isRapistValid(Actor rapist)
  if (rapist && (rapist != None) && !rapist.IsDead() && !(rapist.GetActorValue("Paralysis") As Bool))
    if (getInteface() != "sexlab") ;sexlab's IsValidActor check for these
      if !rapist.Is3DLoaded()
        Utility.WaitMenuMode(2.0)
        if !rapist.Is3DLoaded()
          return False
        endif
      endif
      Race ActorRace = rapist.GetLeveledActorBase().GetRace()
      string RaceName = ActorRace.GetName()
      if ConfigMenu.bPUOK
        RaceName = RaceName + MiscUtil.GetRaceEditorID(ActorRace)
      endif
      if StringUtil.Find(RaceName, "Child") != -1
        return False
      endif
    endif
    Bool bCreature = (CreatureRape.GetValueInt() == 1)
    if (bCreature || rapist.hasKeywordString("actortypenpc"))
      Int iSex = getActorSex(rapist)
      if (!bCreature && ((iSex < -1) || (iSex > 1)))
        return False
      endif
      if (bCreature || (ConfigMenu.iRapistGender == 0) || ((iSex > -1) && ((iSex + 1) == ConfigMenu.iRapistGender)))
        if !ReviveScript.NPCScript.isActorChild(rapist)
          if (!rapist.IsGuard() || !ConfigMenu.bOnlyHostilesRape)
            if !rapist.IsPlayerTeammate()
              if !rapist.IsCommandedActor()
                if ((getInteface() != "sexlab") || ReviveScript.SexLabInterface.IsValidActor(rapist))
                  return True
                endif
              endif
            endif
          endif
        endif
      endif
    endif
  endif
  return False
endfunction

Bool function rapePlayer(Actor[] rapists)
  if (ReviveScript.moaPlayerGhostQuest.IsRunning() || !rapists || rapists.Length < 1)
    return False
  endif
  Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False)
  Actor[] rapistArray = fixActorArray(rapists, (Utility.RandomInt(0, 1) == 0))
  if (!rapistArray || (rapists.Length < 1) || !(rapistArray[0] As Actor))
    return False
  endif
  RapistsList.revert()
  string interface = getInteface()
  ReviveScript.FastFadeOut.Apply()
  keepControlsDisabled(1.0, true, true, true, false, true, true, true, false, true)
  ReviveScript.FastFadeOut.PopTo(ReviveScript.BlackScreen)
  playerRef.StopCombatAlarm()
  playerRef.AddToFaction(calmFaction)
  PacifyNPC.SetValueInt(1)
  Bool bSwim = False
  bSwim = PlayerRef.IsSwimming() || (ConfigMenu.bPO3Ok && (PO3_SKSEFunctions.IsActorUnderwater(PlayerRef) || PO3_SKSEFunctions.IsActorInWater(PlayerRef)))
  if bSwim || (getInteface() != "sexlab")
    ObjectReference bedRef = FindBed(playerRef as ObjectReference, 2000.0)
    if bedRef
      playerRef.SetPosition(bedRef.GetPositionX(), bedRef.GetPositiony(), bedRef.GetPositionz() + 5.0)
    elseif bSwim
      ConfigMenu.bIsLoggingEnabled && Debug.trace("MarkOfArkay: Player Can't be raped while swimming.")
      return False
    endif
  endif
  Float z = PlayerRef.GetAnglez() + 180.0
  if z > 360.0
    z = z - 360.0
  endif
  if rapistArray[0].GetDistance(PlayerRef) > 1000.0
    rapistArray[0].disable()
    rapistArray[0].MoveTo(PlayerRef)
    rapistArray[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
    rapistArray[0].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
    rapistArray[0].enable()
  endif
  RapistsList.AddForm(rapistArray[0])
  Rapist1.ForceRefTo(rapistArray[0])
  rapistArray[0].EvaluatePackage()
  if rapistArray.Length > 1 && rapistArray[1]
    if rapistArray[1].GetDistance(PlayerRef) > 1000.0
      rapistArray[1].disable()
      rapistArray[1].MoveTo(PlayerRef)
      rapistArray[1].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapistArray[1].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapistArray[1].enable()
    endif
    RapistsList.AddForm(rapistArray[1])
    Rapist2.ForceRefTo(rapistArray[1])
    rapistArray[1].EvaluatePackage()
  else
    Rapist2.Clear()
  endif
  if rapistArray.Length > 2 && rapistArray[2]
    if rapistArray[2].GetDistance(PlayerRef) > 1000.0
      rapistArray[2].disable()
      rapistArray[2].MoveTo(PlayerRef)
      rapistArray[2].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapistArray[2].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapistArray[2].enable()
    endif
    RapistsList.AddForm(rapistArray[2])
    Rapist3.ForceRefTo(rapistArray[2])
    rapistArray[2].EvaluatePackage()
  else
    Rapist3.Clear()
  endif
  if rapistArray.Length > 3 && rapistArray[3]
    if rapistArray[3].GetDistance(PlayerRef) > 1000.0
      rapistArray[3].disable()
      rapistArray[3].MoveTo(PlayerRef)
      rapistArray[3].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapistArray[3].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapistArray[3].enable()
    endif
    RapistsList.AddForm(rapistArray[3])
    Rapist4.ForceRefTo(rapistArray[3])
    rapistArray[3].EvaluatePackage()
  else
    Rapist4.Clear()
  endif
  if !NPCPacifier.IsRunning()
    NPCPacifier.Start()
    keepControlsDisabled(3.0, true, true, true, false, true, true, true, false, true)
  endif
  (NPCPacifier As zzzmoa_npc_pacifier_quest_script).ToggleTeamMates(False)
  Actor extraRapist = None
  Int i = PacifiedHostiles.GetSize()
  while i > 0
    i -= 1
    extraRapist = PacifiedHostiles.getAt(i) as Actor
    if rapistArray.find(extraRapist) < 0
      if isRapistValid(extraRapist)
        if !Rapist5.GetActorRef()
          Rapist5.ForceRefTo(extraRapist)
          Rapist5.GetActorReference().EvaluatePackage()
        endif
        if !Rapist6.GetActorRef()
          Rapist6.ForceRefTo(extraRapist)
          Rapist6.GetActorReference().EvaluatePackage()
        endif
        if !Rapist7.GetActorRef()
          Rapist7.ForceRefTo(extraRapist)
          Rapist7.GetActorReference().EvaluatePackage()
        endif
        if !Rapist8.GetActorRef()
          Rapist8.ForceRefTo(extraRapist)
          Rapist8.GetActorReference().EvaluatePackage()
        endif
        if !Rapist9.GetActorRef()
          Rapist9.ForceRefTo(extraRapist)
          Rapist9.GetActorReference().EvaluatePackage()
        endif
        if !Rapist10.GetActorRef()
          Rapist10.ForceRefTo(extraRapist)
          Rapist10.GetActorReference().EvaluatePackage()
        endif
        RapistsList.AddForm(extraRapist)
      endif
    endif
  endwhile
  keepControlsDisabled(3.0, true, true, true, false, true, true, true, false, true)
  ReviveScript.BlackScreen.PopTo(ReviveScript.FadeIn)
  removeCrime()
  Victim1.ForceRefTo(PlayerRef)
  PlayerRef.EvaluatePackage()
  Bool result = False
  Game.SetPlayerAIDriven(True)
  if interface == "sexlab"
    if playerRef.IsBleedingOut()
      PlayerRef.DispelSpell(ReviveScript.Bleed)
      playerRef.ResetHealthAndLimbs()
      Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=true, abLooking=true, abSneaking=False, abMenu=False, abActivate=False, abJournalTabs=False)
    endif
    Equipment = revivescript.Itemscript.RegisterEquipments(playerRef, False, False)
    if ReviveScript.SexLabInterface.rape(rapistArray, playerRef, "AnimationEnding,AnimationEnd")
      ReviveScript.RegisterForModEvent("HookAnimationEnding", "zzzmoa_sexlab_Rape_Ending")
      ReviveScript.RegisterForModEvent("HookAnimationEnd", "zzzmoa_sexlab_Rape_End")
      bIsBusy = True
      playerRef.StopCombat()
      playerRef.StopCombatAlarm()
      while bIsBusy
        if !NPCPacifier.Isrunning()
          NPCPacifier.Start()
          Utility.Wait(1.0)
        endif
        NPCPacifier.Stop()
        i = 0
        while !NPCPacifier.IsStopped() && i < 50
          Utility.Wait(0.1)
          i += 1
        endwhile
      endwhile
      result = True
    endif
  elseif interface == "ostim"
    if playerRef.IsBleedingOut()
      PlayerRef.DispelSpell(ReviveScript.Bleed)
      playerRef.ResetHealthAndLimbs()
      Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=true, abLooking=true, abSneaking=False, abMenu=False, abActivate=False, abJournalTabs=False)
    endif
    Bool sceneStarted = ReviveScript.OStimInterface.StartSex(rapistArray, playerRef)
    if sceneStarted
      ReviveScript.RegisterForModEvent("ostim_end", "zzzmoa_ostim_Rape_End")
      bIsBusy = True
      playerRef.StopCombat()
      playerRef.StopCombatAlarm()
      while bIsBusy
        if !NPCPacifier.Isrunning()
          NPCPacifier.Start()
          Utility.Wait(1.0)
        endif
        NPCPacifier.Stop()
        i = 0
        while !NPCPacifier.IsStopped() && i < 50
          Utility.Wait(0.1)
          i += 1
        endwhile
      endwhile
    endif
    result = sceneStarted
  elseif interface == "fg"
    if playerRef.IsBleedingOut()
      PlayerRef.DispelSpell(ReviveScript.Bleed)
      playerRef.ResetHealthAndLimbs()
      Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=true, abLooking=true, abSneaking=False, abMenu=False, abActivate=False, abJournalTabs=False)
    endif
    if (rapistArray.length > 1) && ((rapistArray[1] As Actor) != None)
      extraRapist = rapistArray[1]
    else
      extraRapist = None
      int l = PacifiedHostiles.GetSize()
      if l > 0
        i = utility.randomint(0, l - 1)
        int j = i - 1
        if j < 0
          j = l - 1
        endif
        Bool bBreak = False
        while !bBreak && (extraRapist == None)
          extraRapist = PacifiedHostiles.getAt(i) as Actor
          if (extraRapist == rapistArray[0]) || !isRapistValid(extraRapist)
            extraRapist = None
          endif
          if i == j
            bBreak = True
          elseif i == (l - 1)
            i = 0
          else
            i += 1
          endif
        endwhile
      endif
    endif
    if extraRapist && (Utility.RandomInt(0, 1) == 1)
      if (ConfigMenu.fMaxRapists > 1) && (Utility.RandomInt(0, 1) == 1)
        ReviveScript.FlowerGirlsInterface.Actor1 = rapistArray[0]
        ReviveScript.FlowerGirlsInterface.Actor2 = playerRef
        ReviveScript.FlowerGirlsInterface.Actor3 = extraRapist
        sendModEvent("MOA_Int_FG_PlayThreesome")
      else
        ReviveScript.FlowerGirlsInterface.Actor1 = extraRapist
        ReviveScript.FlowerGirlsInterface.Actor2 = playerRef
        sendModEvent("MOA_Int_FG_RandomScene")
      endif
    else
      ReviveScript.FlowerGirlsInterface.Actor1 = rapistArray[0]
      ReviveScript.FlowerGirlsInterface.Actor2 = playerRef
      sendModEvent("MOA_Int_FG_RandomScene")
    endif
    playerRef.StopCombat()
    playerRef.StopCombatAlarm()
    while ReviveScript.FlowerGirlsInterface.isBusy
      if !NPCPacifier.Isrunning()
        NPCPacifier.Start()
        Utility.Wait(1.0)
      endif
      NPCPacifier.Stop()
      i = 0
      while !NPCPacifier.IsStopped() && i < 50
        Utility.Wait(0.1)
        i += 1
      endwhile
    endwhile
    result = ReviveScript.FlowerGirlsInterface.Result
  endif
  (NPCPacifier As zzzmoa_npc_pacifier_quest_script).ToggleTeamMates(True)
  Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=False)
  Game.SetPlayerAIDriven(False)
  Game.SetPlayerAIDriven(True)
  return result
endfunction

function removeCrime()
  if !revivescript.crimefaction
    actor act
    int i = RapistsList.GetSize()
    while (i > 0) && !ReviveScript.CrimeFaction
      i -= 1
      if RapistsList.getAt(i)
        act = RapistsList.getAt(i) as Actor
        if act && act.IsGuard()
          ReviveScript.CrimeFaction = act.GetCrimeFaction()
        endif
      endif
    endwhile
  endif
  if revivescript.crimefaction
    ReviveScript.CrimeGold += ReviveScript.CrimeFaction.GetCrimeGold()
    ReviveScript.CrimeGoldViolent += ReviveScript.CrimeFaction.GetCrimeGoldViolent()
    ReviveScript.CrimeFaction.ModCrimeGold(-ReviveScript.CrimeFaction.GetCrimeGold(), false)
    ReviveScript.CrimeFaction.ModCrimeGold(-ReviveScript.CrimeFaction.GetCrimeGoldViolent(), true)
  endif
  return
endfunction

function shuffleActorArray(Actor[] Actors)
  if Actors.Length < 2
    return
  endif
  int i = Actors.Length
  while i > 1
    i -= 1
    int j = utility.RandomInt(0, i)
    if (i != j)
      Actor act = Actors[i]
      Actors[i] = Actors[j]
      Actors[j] = act
    endif
  endwhile
endfunction
