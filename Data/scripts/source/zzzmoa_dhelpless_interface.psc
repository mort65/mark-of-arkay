Scriptname zzzmoa_dhelpless_interface extends Quest

import zzzmoautilscript

Faction helplessFaction 
Spell dhCloakSpell
Actor player

Bool bIsBusy = False

event OnEndState()
  Utility.Wait(5.0)
  helplessFaction = Game.GetFormFromFile(0x005379, "DeviouslyHelpless.esp") as Faction
  dhCloakSpell = Game.GetFormFromFile(0x000D68, "DeviouslyHelpless.esp") as Spell
  player = game.GetPlayer()
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
  bIsBusy = true
  Debug.trace("MarkofArkay: PlayerLoadsGame() triggered for " + self)

  if isPluginFound("DeviouslyHelpless.esp")
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

Bool Function IsSceneRunning()
	return False
endfunction

Bool function IsEnabled()
  return False
endfunction

state Installed

  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  function checkVars()
    if helplessFaction == None
      helplessFaction = Game.GetFormFromFile(0x005379, "DeviouslyHelpless.esp") as Faction
    endIf
	if dhCloakSpell == None
	  dhCloakSpell = Game.GetFormFromFile(0x000D68, "DeviouslyHelpless.esp") as Spell
	endif
	if player == None
      player = game.GetPlayer()
	endif
  endfunction

  Bool function IsSceneRunning()
  	return player.isInfaction(helplessFaction)
  endfunction

  Bool function IsEnabled()
    return player.hasSpell(dhCloakSpell)
  endfunction
endstate
