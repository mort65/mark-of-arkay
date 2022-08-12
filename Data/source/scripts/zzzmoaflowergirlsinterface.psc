Scriptname zzzmoaflowergirlsinterface extends Quest

Quest FlowerGirls

Bool Property isBusy = False Auto Hidden
Bool Property Result = False Auto Hidden
Actor Property Actor1 Auto Hidden
Actor Property Actor2 Auto Hidden
Actor Property Actor3 Auto Hidden

;returns and function parameterss should not be a type that doesn't exist without the optional mod like dxSceneThread!!!

Event OnInit()
	Debug.trace("MarkofArkay: OnInit() trigged for "+self)
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
EndEvent

Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
	PlayerLoadsGame()
EndEvent

Event OnEndState()
	Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
	FlowerGirls = Game.GetFormFromFile(0x0012C5,"FlowerGirls SE.esm") as Quest ; Get quest now
EndEvent  

Bool Function GetIsInterfaceActive()
	If GetState() == "Installed"
		Return true
	EndIf
	Return false
EndFunction

Event On_MOA_Int_FG_RandomScene(string eventName, string strArg, float numArg, Form sender)
EndEvent

Event On_MOA_Int_FG_PlayThreesome(string eventName, string strArg, float numArg, Form sender)
EndEvent

Function PlayerLoadsGame()
	Debug.trace("MarkofArkay: PlayerLoadsGame() trigged for "+self)
	; Is the soft dependency installed and is our script in the right state? If not change state. 

	If Game.GetModByName("FlowerGirls SE.esm") != 255
		If GetState() != "Installed"
			GoToState("Installed")
		EndIf	
	Else
		If GetState() != ""
			GoToState("")
		EndIf
	EndIf
	RegisterForModEvent("MOA_Int_FG_RandomScene", "On_MOA_Int_FG_RandomScene")
	RegisterForModEvent("MOA_Int_FG_PlayThreesome", "On_MOA_Int_FG_PlayThreesome")
EndFunction

Bool Function PlayThreesome(Actor participant1 = NONE, Actor participant2 = NONE, Actor participant3 = NONE)
	Return False
EndFunction

Bool Function RandomScene(Actor participant1, Actor participant2)
	Return False
EndFunction

State Installed
	Bool Function RandomScene(Actor participant1, Actor participant2)
		return zzzmoa_int_flowergirls.RandomSceneFG(FlowerGirls, participant1, participant2)
	EndFunction
	
	Bool Function PlayThreesome(Actor participant1 = NONE, Actor participant2 = NONE, Actor participant3 = NONE)
		return zzzmoa_int_flowergirls.PlayThreesomeFG(FlowerGirls, participant1, participant2, participant3)
	EndFunction	
	
	Event On_MOA_Int_FG_RandomScene(string eventName, string strArg, float numArg, Form sender)
		isBusy = True
		result = RandomScene(Actor1, Actor2)
		isBusy = False
	EndEvent
	
	Event On_MOA_Int_FG_PlayThreesome(string eventName, string strArg, float numArg, Form sender)
		isBusy = True
		result = PlayThreesome(Actor1, Actor2, Actor3)
		isBusy = False
	EndEvent
	
	Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
		PlayerLoadsGame()
	EndEvent
EndState