Scriptname zzzmoarapescript extends Quest

zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
Actor Property playerRef Auto
Quest Property NPCPacifier Auto
GlobalVariable Property PacifyNPC Auto
Bool Property bIsBusy = False Auto Hidden
Faction Property calmFaction Auto
ReferenceAlias Property Rapist1 Auto
ReferenceAlias Property Rapist2 Auto
ReferenceAlias Property Rapist3 Auto
ReferenceAlias Property Rapist4 Auto
ReferenceAlias Property Rapist5 Auto
ReferenceAlias Property Rapist6 Auto
ReferenceAlias Property Rapist7 Auto
ReferenceAlias Property Rapist8 Auto
ReferenceAlias Property Rapist9 Auto
ReferenceAlias Property Rapist10 Auto
ReferenceAlias Property Victim1 Auto
Formlist Property PacifiedHostiles Auto
Formlist Property PacifiedTeamMates Auto

Event OnInit()
	RegisterForModEvent("MOA_Int_PlayerLoadsGame", "On_MOA_Int_PlayerLoadsGame")
EndEvent

Event On_MOA_Int_PlayerLoadsGame(string eventName, string strArg, float numArg, Form sender)
	RegisterForSingleUpdate(10.0)
EndEvent

Event OnUpdate()
	ConfigMenu.bIsSexlabActive = ReviveScript.SexLabInterface.GetIsInterfaceActive()
	ConfigMenu.bIsOStimActive = ReviveScript.OStimInterface.GetIsInterfaceActive()
	ConfigMenu.bIsFlowerGirlsActive = ReviveScript.FlowerGirlsInterface.GetIsInterfaceActive()
EndEvent

String Function getInteface()
	Int interf = ConfigMenu.iGetCurSexInterface()
	If interf == 0
		Return "sexlab"
	ElseIf interf == 1
		Return "ostim"
	ElseIf interf == 2
		Return "fg"
	EndIf
	Return ""
EndFunction


Bool Function isRapistValid(Actor rapist)
	If rapist
		Int iSex = getActorSex(rapist)
		If rapist.hasKeywordString("actortypenpc")
			If (ConfigMenu.iRapistGender == 0) || ((iSex > -1) && ((iSex + 1) == ConfigMenu.iRapistGender))
				If !ReviveScript.NPCScript.isActorChild(rapist)
					If !rapist.IsGuard()
						If !rapist.IsPlayerTeammate()
							If !rapist.IsCommandedActor()
								If ((getInteface() != "sexlab") || ReviveScript.SexLabInterface.IsValidActor(rapist))
									return True
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Actor[] Function getRapists(Actor Victim, Actor Attacker = None)
	NPCPacifier.Start()
	Actor[] rapists
	If ((Attacker != None) && (Attacker.GetDistance(Victim) < 5000.0))
		rapists = new Actor[4]
		rapists[0] = None
		rapists[1] = None
		rapists[2] = None
		rapists[3] = None
		Actor rapist
		string interface = getInteface()
		Int RapistCount = Utility.RandomInt(1,ConfigMenu.fMaxRapists As Int)
		int i = 0
		int j = 0
		int l = PacifiedHostiles.GetSize()
		int m = 32
		int c = 0
		Bool bBreak = False
		Actor act
		Utility.wait(5.0)
		While i < (RapistCount * 3)
			If (i == 0) && isRapistValid(Attacker)
				rapists[0] = Attacker
			Else
				If interface == "sexlab"
					rapist = ReviveScript.SexLabInterface.FindRapist(Victim as ObjectReference, 5000.0, 0, Victim, rapists[0], rapists[1], rapists[2])
					If isRapistValid(rapist) && !rapist.IsHostileToActor(Attacker) && (rapist.GetFactionReaction(Attacker) != 1)
						rapists[rapists.find(None)] = rapist
					EndIf
				Else
					c = 0
					l = PacifiedHostiles.GetSize()
					While !bBreak && !rapists[i] && (j <  l) && (c < m)
						act = PacifiedHostiles.GetAt(j) As actor
						If act && rapists.Find(act) < 0 && isRapistValid(act) && !act.IsHostileToActor(Attacker) && (act.GetFactionReaction(Attacker) != 1)
							rapists[rapists.find(None)] = act
							bBreak = True
						EndIf
						j+=1
						c+=1
					EndWhile
				EndIf
			EndIf
			i += 1
		EndWhile
	EndIf
	Return rapists
EndFunction

Bool Function rapePlayer(Actor[] rapists)
	If (ReviveScript.moaPlayerGhostQuest.IsRunning() || !rapists || rapists.Length < 1 || !rapists[0])
		Return False
	EndIf
	string interface = getInteface()	
	ReviveScript.FastFadeOut.Apply()
	Utility.Wait(1.0)
	ReviveScript.FastFadeOut.PopTo(ReviveScript.BlackScreen)
	playerRef.StopCombatAlarm()
	playerRef.AddToFaction(calmFaction)
	PacifyNPC.SetValueInt(1)
	Rapist1.ForceRefTo(rapists[0])
	Float z = PlayerRef.GetAnglez() + 180.0
	If z > 360.0
		z = z - 360.0
	EndIf
	If rapists[0].GetDistance(PlayerRef) > 1000.0
		rapists[0].MoveTo(PlayerRef)
		rapists[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(50,100), PlayerRef.GetPositiony() + Utility.RandomInt(50,100), PlayerRef.GetPositionz())
		rapists[0].SetAngle(0.0, 0.0, z)		
	EndIf
	rapists[0].EvaluatePackage()
	If rapists.Length > 1 && rapists[1]
		Rapist2.ForceRefTo(rapists[1])
		If rapists[1].GetDistance(PlayerRef) > 1000.0
			rapists[1].MoveTo(PlayerRef)
			rapists[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(50,100), PlayerRef.GetPositiony() + Utility.RandomInt(50,100), PlayerRef.GetPositionz())
			rapists[0].SetAngle(0.0, 0.0, z)			
		EndIf
		rapists[1].EvaluatePackage()
	Else
		Rapist2.Clear()
	EndIf
	If rapists.Length > 2 && rapists[2]
		Rapist3.ForceRefTo(rapists[2])
		If rapists[2].GetDistance(PlayerRef) > 1000.0
			rapists[2].MoveTo(PlayerRef)
			rapists[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(50,100), PlayerRef.GetPositiony() + Utility.RandomInt(50,100), PlayerRef.GetPositionz())
			rapists[0].SetAngle(0.0, 0.0, z)			
		EndIf
		rapists[2].EvaluatePackage()
	Else
		Rapist3.Clear()
	EndIf
	If rapists.Length > 3	&& rapists[3]
		Rapist4.ForceRefTo(rapists[3])
		If rapists[3].GetDistance(PlayerRef) > 1000.0
			rapists[3].MoveTo(PlayerRef)
			rapists[0].SetPosition(PlayerRef.GetPositionx() + Utility.RandomInt(50,100), PlayerRef.GetPositiony() + Utility.RandomInt(50,100), PlayerRef.GetPositionz())
			rapists[0].SetAngle(0.0, 0.0, z)		
		EndIf
		rapists[3].EvaluatePackage()
	Else
		Rapist4.Clear()
	EndIf
	If !NPCPacifier.IsRunning()
		NPCPacifier.Start()
		Utility.Wait(3.0)
	EndIf
	(NPCPacifier As zzzmoa_npc_pacifier_quest_script).ToggleTeamMates(False)
	Actor extraRapist = None
	Int i = PacifiedHostiles.GetSize()
	While i > 0
		i -= 1
		extraRapist = PacifiedHostiles.getAt(i) as Actor
		If rapists.find(extraRapist) < 0
			If isRapistValid(extraRapist)
				If !Rapist5.GetActorRef()
					Rapist5.ForceRefTo(extraRapist)
					Rapist5.GetActorReference().EvaluatePackage()
				EndIf
				If !Rapist6.GetActorRef()
					Rapist6.ForceRefTo(extraRapist)
					Rapist6.GetActorReference().EvaluatePackage()
				EndIf
				If !Rapist7.GetActorRef()
					Rapist7.ForceRefTo(extraRapist)
					Rapist7.GetActorReference().EvaluatePackage()
				EndIf
				If !Rapist8.GetActorRef()
					Rapist8.ForceRefTo(extraRapist)
					Rapist8.GetActorReference().EvaluatePackage()
				EndIf
				If !Rapist9.GetActorRef()
					Rapist9.ForceRefTo(extraRapist)
					Rapist9.GetActorReference().EvaluatePackage()
				EndIf
				If !Rapist10.GetActorRef()
					Rapist10.ForceRefTo(extraRapist)
					Rapist10.GetActorReference().EvaluatePackage()
				EndIf
			EndIf
		EndIf
	EndWhile
	Utility.Wait(3.0)
	ReviveScript.BlackScreen.PopTo(ReviveScript.FadeIn)
	Victim1.ForceRefTo(PlayerRef)
	Game.SetPlayerAIDriven(True)
	PlayerRef.EvaluatePackage()
	Bool result = False
	If interface == "sexlab"
		If playerRef.IsBleedingOut()
			PlayerRef.DispelSpell(ReviveScript.Bleed)
			playerRef.ResetHealthAndLimbs()
			Game.EnablePlayerControls( abMovement = False, abFighting = False, abCamSwitch = true, abLooking = true, abSneaking = False, abMenu = False, abActivate = False, abJournalTabs = False)
		EndIf
		If ReviveScript.SexLabInterface.rape(rapists, playerRef)
			ReviveScript.RegisterForModEvent("AnimationEnd", "zzzmoa_Rape_End")
			bIsBusy = True
			playerRef.StopCombat()
			playerRef.StopCombatAlarm()
			While bIsBusy
				If !NPCPacifier.Isrunning()
					NPCPacifier.Start()
					Utility.Wait(1.0)
				EndIf
				NPCPacifier.Stop()
				i = 0
				While !NPCPacifier.IsStopped() && i < 50
					Utility.Wait(0.1)
					i += 1
				EndWhile
			EndWhile
			Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = True, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = True)
			result = True
		EndIf
	ElseIf interface == "ostim"
		If playerRef.IsBleedingOut()
			PlayerRef.DispelSpell(ReviveScript.Bleed)
			playerRef.ResetHealthAndLimbs()
			Game.EnablePlayerControls( abMovement = False, abFighting = False, abCamSwitch = true, abLooking = true, abSneaking = False, abMenu = False, abActivate = False, abJournalTabs = False)
		EndIf				
		extraRapist = None
		int l = PacifiedHostiles.GetSize()
		If l > 0
			i = utility.randomint(0, l - 1)
			int j = i - 1
			If j < 0 
				j = l - 1
			EndIf
			Bool bBreak = False
			While !bBreak && (extraRapist == None)
				extraRapist = PacifiedHostiles.getAt(i) as Actor
				If (extraRapist == rapists[0]) || !isRapistValid(extraRapist)
					extraRapist = None
				EndIf
				If i == j
					bBreak = True
				ElseIf i == (l - 1)
					i = 0
				Else
					i += 1
				EndIf
			EndWhile
		EndIf
		Bool sceneStarted = False
		If extraRapist && (Utility.RandomInt(0,1) == 1)
			If (ConfigMenu.fMaxRapists > 1) && (Utility.RandomInt(0,1) == 1)
				rapist2.ForceRefTo(extraRapist)
				If (getActorSex(extraRapist) == 0) && (getActorSex(rapists[0]) == 1) ;Swap them
					sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=extraRapist, Sub=playerRef, zThirdActor=rapists[0], Aggressive=True, AggressingActor=extraRapist)
				Else
					sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=rapists[0], Sub=playerRef, zThirdActor=extraRapist, Aggressive=True, AggressingActor=rapists[0])
				EndIf
			Else
				sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=extraRapist, Sub=playerRef, zThirdActor=None, Aggressive=True, AggressingActor=extraRapist)
			EndIf
		Else
			sceneStarted = ReviveScript.OStimInterface.StartScene(Dom=rapists[0], Sub=playerRef, zThirdActor=None, Aggressive=True, AggressingActor=rapists[0])
		EndIf				
		If sceneStarted
			ReviveScript.RegisterForModEvent("ostim_end", "zzzmoa_Rape_End")
			bIsBusy = True
			playerRef.StopCombat()
			playerRef.StopCombatAlarm()
			While bIsBusy
				If !NPCPacifier.Isrunning()
					NPCPacifier.Start()
					Utility.Wait(1.0)
				EndIf
				NPCPacifier.Stop()
				i = 0
				While !NPCPacifier.IsStopped() && i < 50
					Utility.Wait(0.1)
					i += 1
				EndWhile
			EndWhile
		EndIf
		result = sceneStarted
	ElseIf interface == "fg"
		If ReviveScript.FlowerGirlsInterface.GetActiveThreadForActor(playerRef as ObjectReference) != None
			result = False
		Else
			If playerRef.IsBleedingOut()
				PlayerRef.DispelSpell(ReviveScript.Bleed)
				playerRef.ResetHealthAndLimbs()
				Game.EnablePlayerControls( abMovement = False, abFighting = False, abCamSwitch = true, abLooking = true, abSneaking = False, abMenu = False, abActivate = False, abJournalTabs = False)
			EndIf
			extraRapist = None
			int l = PacifiedHostiles.GetSize()
			If l > 0
				i = utility.randomint(0, l - 1)
				int j = i - 1
				If j < 0 
					j = l - 1
				EndIf
				Bool bBreak = False
				While !bBreak && (extraRapist == None)
					extraRapist = PacifiedHostiles.getAt(i) as Actor
					If (extraRapist == rapists[0]) || !isRapistValid(extraRapist)
						extraRapist = None
					EndIf
					If i == j
						bBreak = True
					ElseIf i == (l - 1)
						i = 0
					Else
						i += 1
					EndIf
				EndWhile
			EndIf
			If extraRapist && (Utility.RandomInt(0,1) == 1)
				If (ConfigMenu.fMaxRapists > 1) && (Utility.RandomInt(0,1) == 1)
					ReviveScript.FlowerGirlsInterface.PlayThreesome(rapists[0], playerRef, extraRapist)
				Else 
					ReviveScript.FlowerGirlsInterface.RandomScene(extraRapist,playerRef)
				EndIf
			Else
				ReviveScript.FlowerGirlsInterface.RandomScene(rapists[0],playerRef)
			EndIf
			Utility.wait(3.0)
			dxSceneThread startedScene = ReviveScript.FlowerGirlsInterface.GetActiveThreadForActor(playerRef as ObjectReference)
			If startedScene != None
				playerRef.StopCombat()
				playerRef.StopCombatAlarm()
				While startedScene.IsRunning()
					If !NPCPacifier.Isrunning()
						NPCPacifier.Start()
						Utility.Wait(1.0)
					EndIf
					NPCPacifier.Stop()
					i = 0
					While !NPCPacifier.IsStopped() && i < 50
						Utility.Wait(0.1)
						i += 1
					EndWhile
				EndWhile
			EndIf
			result = (startedScene As Bool)
		EndIf
	EndIf
	(NPCPacifier As zzzmoa_npc_pacifier_quest_script).ToggleTeamMates(True)
	Game.SetPlayerAIDriven(False)
	Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = True, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = True)
	Return result
EndFunction

Function Unpacify()
	NPCPacifier.Stop()
	PacifyNPC.SetValueInt(0)
	Victim1.Clear()
	PlayerRef.RemoveFromFaction(calmFaction)
	Actor act = None
	If Rapist1.GetActorRef()
		act = Rapist1.GetActorRef()
		Rapist1.Clear()
		act.RemoveFromFaction(calmFaction)
	   
	EndIf
	If Rapist2.GetActorRef()
		act = Rapist2.GetActorRef()
		Rapist2.Clear()
		act.RemoveFromFaction(calmFaction)
	   
	EndIf
	If Rapist3.GetActorRef()
		act = Rapist3.GetActorRef()
		Rapist3.Clear()
		act.RemoveFromFaction(calmFaction)
	   
	EndIf
	If Rapist4.GetActorRef()
		act = Rapist4.GetActorRef()
		Rapist4.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist5.GetActorRef()
		act = Rapist5.GetActorRef()
		Rapist5.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist6.GetActorRef()
		act = Rapist6.GetActorRef()
		Rapist6.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist7.GetActorRef()
		act = Rapist7.GetActorRef()
		Rapist7.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist8.GetActorRef()
		act = Rapist8.GetActorRef()
		Rapist8.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist9.GetActorRef()
		act = Rapist9.GetActorRef()
		Rapist9.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	If Rapist10.GetActorRef()
		act = Rapist10.GetActorRef()
		Rapist10.Clear()
		act.RemoveFromFaction(calmFaction)	   
	EndIf
	(NPCPacifier As zzzmoa_npc_pacifier_quest_script).Unpacify()
EndFunction


Int Function getActorSex(Actor act)
	Return act.GetLeveledActorBase().GetSex()
EndFunction