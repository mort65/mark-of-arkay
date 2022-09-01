Scriptname zzzmoarapescript extends Quest

FormList property BedsList auto
zzzmoaReviveMCM property ConfigMenu auto
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

event OnInit()
  RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
endevent

event OnUpdate()
  ReviveScript.SexLabInterface.PlayerLoadsGame()
  ReviveScript.OStimInterface.PlayerLoadsGame()
  ReviveScript.FlowerGirlsInterface.PlayerLoadsGame()
  Utility.Wait(10.0)
  ConfigMenu.bIsSexlabActive = ReviveScript.SexLabInterface.GetIsInterfaceActive()
  ConfigMenu.bIsOStimActive = ReviveScript.OStimInterface.GetIsInterfaceActive()
  ConfigMenu.bIsFlowerGirlsActive = ReviveScript.FlowerGirlsInterface.GetIsInterfaceActive()
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
    Rapist1.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist2.GetActorRef()
    act = Rapist2.GetActorRef()
    Rapist2.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist3.GetActorRef()
    act = Rapist3.GetActorRef()
    Rapist3.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist4.GetActorRef()
    act = Rapist4.GetActorRef()
    Rapist4.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist5.GetActorRef()
    act = Rapist5.GetActorRef()
    Rapist5.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist6.GetActorRef()
    act = Rapist6.GetActorRef()
    Rapist6.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist7.GetActorRef()
    act = Rapist7.GetActorRef()
    Rapist7.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist8.GetActorRef()
    act = Rapist8.GetActorRef()
    Rapist8.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist9.GetActorRef()
    act = Rapist9.GetActorRef()
    Rapist9.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  if Rapist10.GetActorRef()
    act = Rapist10.GetActorRef()
    Rapist10.Clear()
    act.RemoveFromFaction(calmFaction)
  endif
  (NPCPacifier As zzzmoa_npc_pacifier_quest_script).Unpacify()
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

Actor[] function getRapists(Actor Victim, Actor Attacker=None)
  Unpacify()
  utility.wait(1.0)
  NPCPacifier.Start()
  Actor[] rapists
  if ((Attacker != None) && (Attacker.GetDistance(Victim) < 5000.0))
    rapists = new Actor[4]
    rapists[0] = None
    rapists[1] = None
    rapists[2] = None
    rapists[3] = None
    Actor rapist
    string interface = getInteface()
    Int RapistCount = Utility.RandomInt(1, ConfigMenu.fMaxRapists As Int)
    int i = 0
    int j = 0
    int l = PacifiedHostiles.GetSize()
    int m = 32
    int c = 0
    int k
    Bool bBreak = False
    Actor act
    Utility.wait(5.0)
    while i < (RapistCount)
      if (i == 0) && isRapistValid(Attacker)
        rapists[0] = Attacker
      else
        if interface == "sexlab"
          rapist = ReviveScript.SexLabInterface.FindRapist(Victim as ObjectReference, 5000.0, ConfigMenu.iRapistGender - 1, Victim, rapists[0], rapists[1], rapists[2])
          if isRapistValid(rapist) && (!ConfigMenu.bOnlyHostilesRape || (!rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) > 1)))
            k = rapists.find(None)
            if k > -1
              rapists[k] = rapist
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
            if isRapistValid(rapist) && (!ConfigMenu.bOnlyHostilesRape || (!rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) > 1)))
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
  endif
  return rapists
endfunction

Bool function isRapistValid(Actor rapist)
  if (rapist && (rapist != None) && !rapist.IsDead())
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
    if rapist.hasKeywordString("actortypenpc")
      Int iSex = getActorSex(rapist)
      if ((iSex < -1) || (iSex > 1))
        return False
      endif
      if (ConfigMenu.iRapistGender == 0) || ((iSex > -1) && ((iSex + 1) == ConfigMenu.iRapistGender))
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
  if (ReviveScript.moaPlayerGhostQuest.IsRunning() || !rapists || rapists.Length < 1 || !rapists[0])
    return False
  endif
  RapistsList.revert()
  string interface = getInteface()
  ReviveScript.FastFadeOut.Apply()
  Utility.Wait(1.0)
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
  if rapists[0].GetDistance(PlayerRef) > 1000.0
    rapists[0].disable()
    rapists[0].MoveTo(PlayerRef)
    rapists[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
    rapists[0].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
    rapists[0].enable()
  endif
  RapistsList.AddForm(rapists[0])
  Rapist1.ForceRefTo(rapists[0])
  rapists[0].EvaluatePackage()
  if rapists.Length > 1 && rapists[1]
    if rapists[1].GetDistance(PlayerRef) > 1000.0
      rapists[1].disable()
      rapists[1].MoveTo(PlayerRef)
      rapists[1].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapists[1].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapists[1].enable()
    endif
    RapistsList.AddForm(rapists[1])
    Rapist2.ForceRefTo(rapists[1])
    rapists[1].EvaluatePackage()
  else
    Rapist2.Clear()
  endif
  if rapists.Length > 2 && rapists[2]
    if rapists[2].GetDistance(PlayerRef) > 1000.0
      rapists[2].disable()
      rapists[2].MoveTo(PlayerRef)
      rapists[2].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapists[2].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapists[2].enable()
    endif
    RapistsList.AddForm(rapists[2])
    Rapist3.ForceRefTo(rapists[2])
    rapists[2].EvaluatePackage()
  else
    Rapist3.Clear()
  endif
  if rapists.Length > 3 && rapists[3]
    if rapists[3].GetDistance(PlayerRef) > 1000.0
      rapists[3].disable()
      rapists[3].MoveTo(PlayerRef)
      rapists[3].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(75, 100), PlayerRef.GetPositiony() + Utility.RandomInt(75, 100), PlayerRef.GetPositionz())
      rapists[3].SetAngle(PlayerRef.GetAngleX(), PlayerRef.GetAngleY(), z)
      rapists[3].enable()
    endif
    RapistsList.AddForm(rapists[3])
    Rapist4.ForceRefTo(rapists[3])
    rapists[3].EvaluatePackage()
  else
    Rapist4.Clear()
  endif
  if !NPCPacifier.IsRunning()
    NPCPacifier.Start()
    Utility.Wait(3.0)
  endif
  (NPCPacifier As zzzmoa_npc_pacifier_quest_script).ToggleTeamMates(False)
  Actor extraRapist = None
  Int i = PacifiedHostiles.GetSize()
  while i > 0
    i -= 1
    extraRapist = PacifiedHostiles.getAt(i) as Actor
    if rapists.find(extraRapist) < 0
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
  Utility.Wait(3.0)
  ReviveScript.BlackScreen.PopTo(ReviveScript.FadeIn)
  removeCrime()
  Victim1.ForceRefTo(PlayerRef)
  Game.SetPlayerAIDriven(True)
  PlayerRef.EvaluatePackage()
  Bool result = False
  if interface == "sexlab"
    if playerRef.IsBleedingOut()
      PlayerRef.DispelSpell(ReviveScript.Bleed)
      playerRef.ResetHealthAndLimbs()
      Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=true, abLooking=true, abSneaking=False, abMenu=False, abActivate=False, abJournalTabs=False)
    endif
    if ReviveScript.SexLabInterface.rape(rapists, playerRef)
      ReviveScript.RegisterForModEvent("AnimationEnd", "zzzmoa_Rape_End")
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
      Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=True)
      result = True
    endif
  elseif interface == "ostim"
    if playerRef.IsBleedingOut()
      PlayerRef.DispelSpell(ReviveScript.Bleed)
      playerRef.ResetHealthAndLimbs()
      Game.EnablePlayerControls(abMovement=False, abFighting=False, abCamSwitch=true, abLooking=true, abSneaking=False, abMenu=False, abActivate=False, abJournalTabs=False)
    endif
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
        if (extraRapist == rapists[0]) || !isRapistValid(extraRapist)
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
    Bool sceneStarted = False
    if extraRapist && (Utility.RandomInt(0, 1) == 1)
      if (ConfigMenu.fMaxRapists > 1) && (Utility.RandomInt(0, 1) == 1)
        rapist2.ForceRefTo(extraRapist)
        if (getActorSex(extraRapist) == 0) && (getActorSex(rapists[0]) == 1) ;Swap them
          sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=extraRapist, Sub=playerRef, zThirdActor=rapists[0], Aggressive=True, AggressingActor=extraRapist)
        else
          sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=rapists[0], Sub=playerRef, zThirdActor=extraRapist, Aggressive=True, AggressingActor=rapists[0])
        endif
      else
        sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=extraRapist, Sub=playerRef, zThirdActor=None, Aggressive=True, AggressingActor=extraRapist)
      endif
    else
      sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=rapists[0], Sub=playerRef, zThirdActor=None, Aggressive=True, AggressingActor=rapists[0])
    endif
    if sceneStarted
      ReviveScript.RegisterForModEvent("ostim_end", "zzzmoa_Rape_End")
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
        if (extraRapist == rapists[0]) || !isRapistValid(extraRapist)
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
    if extraRapist && (Utility.RandomInt(0, 1) == 1)
      if (ConfigMenu.fMaxRapists > 1) && (Utility.RandomInt(0, 1) == 1)
        ReviveScript.FlowerGirlsInterface.Actor1 = rapists[0]
        ReviveScript.FlowerGirlsInterface.Actor2 = playerRef
        ReviveScript.FlowerGirlsInterface.Actor3 = extraRapist
        sendModEvent("MOA_Int_FG_PlayThreesome")
      else
        ReviveScript.FlowerGirlsInterface.Actor1 = extraRapist
        ReviveScript.FlowerGirlsInterface.Actor2 = playerRef
        sendModEvent("MOA_Int_FG_RandomScene")
      endif
    else
      ReviveScript.FlowerGirlsInterface.Actor1 = rapists[0]
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
  Game.SetPlayerAIDriven(False)
  Game.DisablePlayerControls(abMovement=True, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abJournalTabs=True)
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
