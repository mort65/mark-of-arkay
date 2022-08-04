Scriptname zzzmoaflowergirlsinterface extends Quest

Quest FlowerGirls 

Event OnInit()
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
EndEvent

Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
	PlayerLoadsGame()
EndEvent

Function PlayerLoadsGame()
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
EndFunction

Function PlayThreesome(Actor participant1 = NONE, Actor participant2 = NONE, Actor participant3 = NONE)
EndFunction

Function RandomScene(Actor actor1, Actor actor2)
EndFunction

dxSceneThread Function GetActiveThreadForActor(ObjectReference ActorRef)
	Return None
EndFunction

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

State Installed
	Function RandomScene(Actor actor1, Actor actor2)
		zzzmoa_int_flowergirls.RandomSceneFG(FlowerGirls, actor1, actor2)
	EndFunction
	
	Function PlayThreesome(Actor participant1 = NONE, Actor participant2 = NONE, Actor participant3 = NONE)
		zzzmoa_int_flowergirls.PlayThreesomeFG(FlowerGirls, participant1, participant2, participant3)
	EndFunction	
	
	dxSceneThread Function GetActiveThreadForActor(ObjectReference ActorRef)
		Return zzzmoa_int_flowergirls.GetActiveThreadForActorFG(FlowerGirls, ActorRef)
	EndFunction
EndState