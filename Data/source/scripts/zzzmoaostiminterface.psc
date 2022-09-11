Scriptname zzzmoaostiminterface extends Quest

Quest OSexIntegrationMainQuest

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
  Debug.trace("MarkofArkay: PlayerLoadsGame() triggered for " + self)

  ; Is the soft dependency installed and is our script in the right state? If not change state.
  if Game.GetModByName("OStim.esp") != 255
    if GetState() != "Installed"
      GoToState("Installed")
    endif
  else
    if GetState() != ""
      GoToState("")
    endif
  endif
endfunction

Bool function StartScene(Actor Dom, Actor Sub, Bool zUndressDom=False, Bool zUndressSub=False, Bool zAnimateUndress=False, String zStartingAnimation="", Actor zThirdActor=None, ObjectReference Bed=None, Bool Aggressive=False, Actor AggressingActor=None)
  return False
endfunction

state Installed
  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  Bool function StartScene(Actor Dom, Actor Sub, Bool zUndressDom=False, Bool zUndressSub=False, Bool zAnimateUndress=False, String zStartingAnimation="", Actor zThirdActor=None, ObjectReference Bed=None, Bool Aggressive=False, Actor AggressingActor=None)
    return zzzmoa_int_ostim.StartSceneOS(OSexIntegrationMainQuest, Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
  endfunction
endstate
