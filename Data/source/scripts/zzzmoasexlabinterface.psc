Scriptname zzzmoasexlabinterface extends Quest

Quest SexLabQuestFramework

event OnEndState()
  Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
  SexLabQuestFramework = Game.GetFormFromFile(0x000d62, "SexLab.esm") as Quest ; Get quest now
endevent

event OnInit()
  Debug.trace("MarkofArkay: OnInit() trigged for " + self)
  RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
endevent

event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
  PlayerLoadsGame()
endevent

Bool function AllowedCreature(Race CreatureRace)
  return False
endfunction

bool function AllowedCreatureCombination(Race CreatureRace, Race CreatureRace2)
  return False
endfunction

Actor function FindRapist(ObjectReference CenterRef, float Radius=5000.0, int FindGender=-1, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none)
  return None
endfunction

Actor function FindRapistCreature(string RaceKey, ObjectReference CenterRef, float Radius=5000.0, int FindGender=2, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none)
  return None
endfunction

Bool function GetIsInterfaceActive()
  if GetState() == "Installed"
    return true
  endif
  return false
endfunction

; SexLab is not installed so there wont be any action. Return 0 to the calling script and dont try to access any external resources.
Bool function IsActorActive(Actor ActorRef)
  return False
endfunction

Bool function IsCreaturesAllowed()
  return False
endfunction

Bool function IsValidActor(Actor ActorRef)
  return False
endfunction

function PlayerLoadsGame()
  Debug.trace("MarkofArkay: PlayerLoadsGame() trigged for " + self)

  ; Is the soft dependency installed and is our script in the right state? If not change state.
  if Game.GetModByName("SexLab.esm") != 255
    if GetState() != "Installed"
      GoToState("Installed")
    endif
  else
    if GetState() != ""
      GoToState("")
    endif
  endif
endfunction

String function getRaceKey(Actor ActorRef)
  return ""
endfunction

Bool function quickRape(Actor[] rapists, Actor victim)
  return False
endfunction

Bool function rape(Actor[] rapists, Actor victim)
  return False
endfunction

state Installed
  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  Bool function AllowedCreature(Race CreatureRace)
    return zzzmoa_int_sexlab.AllowedCreatureSL(SexLabQuestFramework, CreatureRace)
  endfunction

  bool function AllowedCreatureCombination(Race CreatureRace, Race CreatureRace2)
    return zzzmoa_int_sexlab.AllowedCreatureCombinationSL(SexLabQuestFramework, CreatureRace, CreatureRace2)
  endfunction

  Actor function FindRapist(ObjectReference CenterRef, float Radius=5000.0, int FindGender=-1, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none)
    return zzzmoa_int_sexlab.FindRapistSL(SexLabQuestFramework, CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4)
  endfunction

  Actor function FindRapistCreature(string RaceKey, ObjectReference CenterRef, float Radius=5000.0, int FindGender=2, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none)
    return zzzmoa_int_sexlab.FindRapistCreatureSL(SexLabQuestFramework, RaceKey, CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4)
  endfunction

  ; SexLab IS installed. Now call the global script and get functions. Pass in SexLabFramework just to save some time
  Bool function IsActorActive(Actor ActorRef)
    return zzzmoa_int_sexlab.IsActorActiveSL(SexLabQuestFramework, ActorRef)
  endfunction

  Bool function IsCreaturesAllowed()
    return zzzmoa_int_sexlab.IsCreaturesAllowedSL(SexLabQuestFramework)
  endfunction

  Bool function IsValidActor(Actor ActorRef)
    return zzzmoa_int_sexlab.IsValidActorSL(SexLabQuestFramework, ActorRef)
  endfunction

  String function getRaceKey(Actor ActorRef)
    return zzzmoa_int_sexlab.getRaceKeySL(SexLabQuestFramework, ActorRef)
  endfunction

  Bool function quickRape(Actor[] rapists, Actor victim)
    return zzzmoa_int_sexlab.quickRapeSL(SexLabQuestFramework, rapists, victim)
  endfunction

  Bool function rape(Actor[] rapists, Actor victim)
    return zzzmoa_int_sexlab.RapeSL(SexLabQuestFramework, rapists, victim)
  endfunction
endstate
