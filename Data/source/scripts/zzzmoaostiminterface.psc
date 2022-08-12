Scriptname zzzmoaostiminterface extends Quest

Quest OSexIntegrationMainQuest 

Event OnInit()
	Debug.trace("MarkofArkay: OnInit() trigged for "+self)
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
EndEvent

Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
	PlayerLoadsGame()
EndEvent

Function PlayerLoadsGame()
	Debug.trace("MarkofArkay: PlayerLoadsGame() trigged for "+self)
	; Is the soft dependency installed and is our script in the right state? If not change state. 

	If Game.GetModByName("OStim.esp") != 255
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
	OSexIntegrationMainQuest = Game.GetFormFromFile(0x000801,"OStim.esp") as Quest ; Get quest now
EndEvent  

Bool Function StartScene(Actor Dom, Actor Sub, Bool zUndressDom = False, Bool zUndressSub = False, Bool zAnimateUndress = False, String zStartingAnimation = "", Actor zThirdActor = None, ObjectReference Bed = None, Bool Aggressive = False, Actor AggressingActor = None)
	Return False
EndFunction

Bool Function GetIsInterfaceActive()
	If GetState() == "Installed"
		Return true
	EndIf
	Return false
EndFunction

State Installed
	Bool Function StartScene(Actor Dom, Actor Sub, Bool zUndressDom = False, Bool zUndressSub = False, Bool zAnimateUndress = False, String zStartingAnimation = "", Actor zThirdActor = None, ObjectReference Bed = None, Bool Aggressive = False, Actor AggressingActor = None)
		Return zzzmoa_int_ostim.StartSceneOS(OSexIntegrationMainQuest, Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
	EndFunction
	
	Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
		PlayerLoadsGame()
	EndEvent
EndState