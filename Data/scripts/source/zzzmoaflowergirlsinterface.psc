Scriptname zzzmoaflowergirlsinterface extends Quest

Actor property Actor1 auto Hidden
Actor property Actor2 auto Hidden
Actor property Actor3 auto Hidden
Bool property Result=False auto Hidden
Bool property isBusy=False auto Hidden

Quest FlowerGirls

event OnEndState()
  Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
  FlowerGirls = Game.GetFormFromFile(0x0012C5, "FlowerGirls SE.esm") as Quest ; Get quest now
endevent

;returns and function parameterss should not be a type that doesn't exist without the optional mod like dxSceneThread!!!
event OnInit()
  Debug.trace("MarkofArkay: OnInit() trigged for " + self)
  RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
endevent

event On_MOA_Int_FG_PlayThreesome(string eventName, string strArg, float numArg, Form sender)
endevent

event On_MOA_Int_FG_RandomScene(string eventName, string strArg, float numArg, Form sender)
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

Bool function PlayThreesome(Actor participant1=NONE, Actor participant2=NONE, Actor participant3=NONE)
  return False
endfunction

function PlayerLoadsGame()
  Debug.trace("MarkofArkay: PlayerLoadsGame() triggered for " + self)

  ; Is the soft dependency installed and is our script in the right state? If not change state.
  if Game.GetModByName("FlowerGirls SE.esm") != 255
    if GetState() != "Installed"
      GoToState("Installed")
    endif
  else
    if GetState() != ""
      GoToState("")
    endif
  endif
  RegisterForModEvent("MOA_Int_FG_RandomScene", "On_MOA_Int_FG_RandomScene")
  RegisterForModEvent("MOA_Int_FG_PlayThreesome", "On_MOA_Int_FG_PlayThreesome")
endfunction

Bool function RandomScene(Actor participant1, Actor participant2)
  return False
endfunction

state Installed
  event On_MOA_Int_FG_PlayThreesome(string eventName, string strArg, float numArg, Form sender)
    isBusy = True
    result = PlayThreesome(Actor1, Actor2, Actor3)
    isBusy = False
  endevent

  event On_MOA_Int_FG_RandomScene(string eventName, string strArg, float numArg, Form sender)
    isBusy = True
    result = RandomScene(Actor1, Actor2)
    isBusy = False
  endevent

  event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
    PlayerLoadsGame()
  endevent

  Bool function PlayThreesome(Actor participant1=NONE, Actor participant2=NONE, Actor participant3=NONE)
    return zzzmoa_int_flowergirls.PlayThreesomeFG(FlowerGirls, participant1, participant2, participant3)
  endfunction

  Bool function RandomScene(Actor participant1, Actor participant2)
    return zzzmoa_int_flowergirls.RandomSceneFG(FlowerGirls, participant1, participant2)
  endfunction
endstate
