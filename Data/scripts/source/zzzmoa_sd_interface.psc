Scriptname zzzmoa_sd_interface extends Quest

import zzzmoautilscript

Quest DreamQuest
Location Dreamworld

Bool bIsBusy = False

event OnEndState()
  Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
  DreamQuest = Game.GetFormFromFile(0x03e470, "sanguinesDebauchery.esp") as Quest ; Get quest now
  Dreamworld = Game.GetFormFromFile(0x1ed39c, "sanguinesDebauchery.esp") as Location
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
  if isPluginFound("sanguinesDebauchery.esp")
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

Function checkVars()
endfunction

Bool function isDreamed()
  return False
endfunction

Bool function isDreaming()
  return False
endfunction

state Installed
  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  Function checkVars()
    if DreamQuest == None
      DreamQuest = Game.GetFormFromFile(0x03e470, "sanguinesDebauchery.esp") as Quest
    endif
    if Dreamworld == None
      Dreamworld = Game.GetFormFromFile(0x1ed39c, "sanguinesDebauchery.esp") as Location
    endif
  endfunction

  Bool function isDreamed()
    return zzzmoa_int_sd.isDreamed(DreamQuest)
  endfunction

  Bool function isDreaming()
    return zzzmoa_int_sd.isDreaming(Dreamworld)
  endfunction
endstate
