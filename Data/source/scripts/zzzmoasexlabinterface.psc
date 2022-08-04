Scriptname zzzmoasexlabinterface extends Quest  

Quest SexLabQuestFramework

Event OnInit()
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
EndEvent

Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
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
	If GetState() == "Installed"
		Return true
	EndIf
	Return false
EndFunction

; SexLab is not installed so there wont be any action. Return 0 to the calling script and dont try to access any external resources. 
Bool Function IsActorActive(Actor ActorRef)
	Return False
EndFunction

Bool Function rape(Actor[] rapists, Actor victim)
	Return False
EndFunction

Int Function StartSex(Actor[] Positions, sslBaseAnimation[] Anims, Actor Victim = none, ObjectReference CenterOn = none, bool AllowBed = true, string Hook = "")
	Return -1
EndFunction

Actor Function FindRapist(ObjectReference CenterRef, float Radius = 5000.0, int FindGender = -1, Actor IgnoreRef1 = none, Actor IgnoreRef2 = none, Actor IgnoreRef3 = none, Actor IgnoreRef4 = none)
	Return None
EndFunction

Bool Function IsValidActor(Actor ActorRef)
	Return False
EndFunction

State Installed
	; SexLab IS installed. Now call the global script and get functions. Pass in SexLabFramework just to save some time
    
	Bool Function IsActorActive(Actor ActorRef)
		Return zzzmoa_int_sexlab.IsActorActiveSL(SexLabQuestFramework, ActorRef)
	EndFunction
	
	Bool Function rape(Actor[] rapists, Actor victim)
		Return zzzmoa_int_sexlab.quickRapeSL(SexLabQuestFramework, rapists, victim)
	EndFunction
	
	Actor Function FindRapist(ObjectReference CenterRef, float Radius = 5000.0, int FindGender = -1, Actor IgnoreRef1 = none, Actor IgnoreRef2 = none, Actor IgnoreRef3 = none, Actor IgnoreRef4 = none)
		Return zzzmoa_int_sexlab.FindRapistSL(SexLabQuestFramework, CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4)
	EndFunction
	
	Int Function StartSex(Actor[] Positions, sslBaseAnimation[] Anims, Actor Victim = none, ObjectReference CenterOn = none, bool AllowBed = true, string Hook = "")
		Return zzzmoa_int_sexlab.StartSexSL(SexLabQuestFramework, Positions, Anims, Victim, CenterOn, AllowBed, Hook)
	EndFunction
	
	Bool Function IsValidActor(Actor ActorRef)
		Return zzzmoa_int_sexlab.IsValidActorSL(SexLabQuestFramework, ActorRef)
	EndFunction

EndState