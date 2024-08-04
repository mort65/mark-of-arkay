Scriptname zzzmoa_dhelpless_interface extends Quest

import zzzmoautilscript

Faction helplessFaction 
Spell dhCloakSpell
Actor player

Bool bIsBusy = False

event OnEndState()
  Utility.Wait(5.0)
  helplessFaction = Game.GetFormFromFile(0x000802, "DHLP_Redux.esp") as Faction
  if !isFormValid(helplessFaction)
    helplessFaction = Game.GetFormFromFile(0x005379, "DeviouslyHelpless.esp") as Faction
  endif
  dhCloakSpell = Game.GetFormFromFile(0x000D68, "DHLP_Redux.esp") as Spell
  if !isFormValid(dhCloakSpell)
    dhCloakSpell = Game.GetFormFromFile(0x000D68, "DeviouslyHelpless.esp") as Spell
  endif
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

  if (isPluginFound("DeviouslyHelpless.esp") || isPluginFound("DHLP_Redux.esp"))
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
    if !isFormValid(helplessFaction)
      helplessFaction = Game.GetFormFromFile(0x000802, "DHLP_Redux.esp") as Faction
     if !isFormValid(helplessFaction)
        HelplessFaction = Game.GetFormFromFile(0x005379, "DeviouslyHelpless.esp") as Faction
      endif
    endIf
    if !isFormValid(dhCloakSpell)
      dhCloakSpell = Game.GetFormFromFile(0x000D68, "DHLP_Redux.esp") as Spell
      if !isFormValid(dhCloakSpell)
        dhCloakSpell = Game.GetFormFromFile(0x000D68, "DeviouslyHelpless.esp") as Spell
      endif
    endif
	  if !isFormValid(player)
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
