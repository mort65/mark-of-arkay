Scriptname zzzmoasexlabinterface extends Quest  

Quest SexLabQuestFramework

Event OnInit()
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA__Int_PlayerLoadsGame")
EndEvent

Event On_MOA__Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
	PlayerLoadsGame()
EndEvent

Function PlayerLoadsGame()
	; Is the soft dependency installed and is our script in the right state? If not change state. 

	If Game.GetModByName("SexLab.esm") != 255
		If GetState() != "Installed"
			GoToState("Installed")
		EndIf
	
	Else
		If GetState() != ""
			GoToState("")
		EndIf
	EndIf
EndFunction


Event OnEndState()
	Utility.Wait(5.0) ; Wait before entering active state to help avoid making function calls to scripts that may not have initialized yet.
	SexLabQuestFramework = Game.GetFormFromFile(0x000d62,"SexLab.esm") as Quest ; Get quest now
EndEvent

Bool Function GetIsInterfaceActive()
	; may use to display interface state in Mcm.
	If GetState() == "Installed"
		Return true
	EndIf
	Return false
EndFunction

; SexLab is not installed so there wont be any action. Return 0 to the calling script and dont try to access any external resources. 
Bool Function IsActorActive(Actor ActorRef)
	Return False
EndFunction

State Installed
	; SexLab IS installed. Now call the global script and get functions. Pass in SexLabFramework just to save some time
    
	Bool Function IsActorActive(Actor ActorRef)
		Return zzzmoaIntPsc.IsActorActive(SexLabQuestFramework, ActorRef)
	EndFunction
EndState