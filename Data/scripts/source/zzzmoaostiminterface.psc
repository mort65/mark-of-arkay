Scriptname zzzmoaostiminterface extends Quest

import zzzmoautilscript

Quest OSexIntegrationMainQuest

Bool bIsBusy = False

event OnEndState()
  Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
  OSexIntegrationMainQuest = Game.GetFormFromFile(0x000801, "OStim.esp") as Quest ; Get quest now
endevent

event OnInit()
  Debug.trace("MarkofArkay: OnInit() trigged for " + self)
  RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
endevent

event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
  PlayerLoadsGame()
endevent

Bool function GetIsInterfaceActive()
  if GetState() == "Installed"
    return true
  endif
  return false
endfunction

function PlayerLoadsGame()
  if bIsBusy
    return
  endif
  bIsBusy = True
  Debug.trace("MarkofArkay: PlayerLoadsGame() triggered for " + self)

  ; Is the soft dependency installed and is our script in the right state? If not change state.
  if isPluginFound("OStim.esp")
    if GetState() != "Installed"
      GoToState("Installed")
    else
      checkVars()
    endif
  else
    if GetState() != ""
      GoToState("")
    endif
  endif
  bIsBusy = False
endfunction

function checkVars()
endfunction

Bool function StartScene(Actor Dom, Actor Sub, Bool zUndressDom=False, Bool zUndressSub=False, Bool zAnimateUndress=False, String zStartingAnimation="", Actor zThirdActor=None, ObjectReference Bed=None, Bool Aggressive=False, Actor AggressingActor=None)
  return False
endfunction

Bool function StartSex(Actor[] Actors, Actor partner)
  return False
endfunction

Bool Function isActorActive(Actor act)
  return False
endfunction

state Installed
  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  function checkVars()
    if OSexIntegrationMainQuest == None
      OSexIntegrationMainQuest = Game.GetFormFromFile(0x000801, "OStim.esp") as Quest
    endif
  endfunction

  Bool function StartScene(Actor Dom, Actor Sub, Bool zUndressDom=False, Bool zUndressSub=False, Bool zAnimateUndress=False, String zStartingAnimation="", Actor zThirdActor=None, ObjectReference Bed=None, Bool Aggressive=False, Actor AggressingActor=None)
    return zzzmoa_int_ostim.StartSceneOS(OSexIntegrationMainQuest, Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
  endfunction

  Bool function StartSex(Actor[] Actors, Actor partner)
    return zzzmoa_int_ostim.StartSexOS(OSexIntegrationMainQuest, Actors, partner)
  endfunction

  Bool Function isActorActive(Actor act)
    return zzzmoa_int_ostim.isActorActiveOS(OSexIntegrationMainQuest, act)
  endfunction

endstate
