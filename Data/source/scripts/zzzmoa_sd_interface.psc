Scriptname zzzmoa_sd_interface extends Quest

Quest DreamQuest
Location Dreamworld

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
  Debug.trace("MarkofArkay: PlayerLoadsGame() triggered for " + self)

  ; Is the soft dependency installed and is our script in the right state? If not change state.
  if Game.GetModByName("sanguinesDebauchery.esp") != 255
    if GetState() != "Installed"
      GoToState("Installed")
    endif
  else
    if GetState() != ""
      GoToState("")
    endif
  endif
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

  Bool function isDreamed()
    return zzzmoa_int_sd.isDreamed(DreamQuest)
  endfunction

  Bool function isDreaming()
    return zzzmoa_int_sd.isDreaming(Dreamworld)
  endfunction
endstate
