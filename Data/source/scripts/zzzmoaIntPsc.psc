Scriptname zzzmoaIntPsc Hidden 

;;;;;;;;;; Sexlab ;;;;;;;;;;;;;;;;;;

Bool Function IsActorActiveSL(Quest SexLabQuestFramework, Actor ActorRef) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework ; Here it should be safe to cast to an external type and access external script variables and functions
	Return SLFramework.IsActorActive(ActorRef)
EndFunction


Bool Function quickRapeSL(Quest SexLabQuestFramework, Actor[] rapists, Actor victimRef) Global
	If victimRef != None && rapists && rapists.length > 0 && rapists[0] != None
		SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
		If SLFramework == None
			Return False
		EndIf
		rapists = SLFramework.SortActors(rapists, true)
		Actor rapist1 = rapists[0]
		Actor rapist2 = None
		If rapists.length > 1
			rapist2 = rapists[1]
		EndIf
		Actor rapist3 = None
		If rapists.length > 2
			rapist3 = rapists[2]
		EndIf
		Actor rapist4 = None
		If rapists.length > 3
			rapist4 = rapists[3]
		EndIf
		If rapists.length == 1
			If SLFramework.QuickStart(Actor1=victimRef, Actor2=rapist1, Victim=victimRef, AnimationTags="Aggressive") != None
				Return True
			EndIf
		Else
			int rapistCount = rapists.length
			Int FemaleCount
			Int MaleCount
			Int i
			While rapistCount > 0
				FemaleCount = 0
				i = 0
				While i < rapistCount
					If SLFramework.GetGender(rapists[i]) == 1
						FemaleCount += 1
					EndIf
					i += 1
				EndWhile
				Malecount = rapistCount - FemaleCount
				If SLFramework.GetGender(victimRef) == 1
					FemaleCount += 1
				Else
					MaleCount += 1
				EndIf
				If SLFramework.GetAnimationsByDefaultTags(Malecount, FemaleCount, true, false, true, "sex", "", true).Length > 0
					If rapistCount < 4
						rapist4 = None
					EndIf
					If rapistCount < 3
						rapist3 = None
					EndIf
					If rapistCount < 2
						rapist2 = None
					EndIf
					If SLFramework.QuickStart(Actor1=victimRef, Actor2=rapist1, Actor3=rapist2, Actor4=rapist3, Actor5=rapist4, Victim=victimRef, AnimationTags="Aggressive") != None
						Return True
					EndIf
				EndIf
				rapistCount -= 1
			EndWhile
		EndIf
	EndIf
	Return False
EndFunction

int Function StartSexSL(Quest SexLabQuestFramework, Actor[] Positions, sslBaseAnimation[] Anims, Actor Victim = none, ObjectReference CenterOn = none, bool AllowBed = true, string Hook = "") Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
	If SLFramework != None
		Return SLFramework.StartSex(Positions, Anims, Victim, CenterOn, AllowBed, Hook)
	EndIf
	Return -1
EndFunction

Actor Function FindRapistSL(Quest SexLabQuestFramework, ObjectReference CenterRef, float Radius = 5000.0, int FindGender = -1, Actor IgnoreRef1 = none, Actor IgnoreRef2 = none, Actor IgnoreRef3 = none, Actor IgnoreRef4 = none) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
	Return SLFramework.FindAvailableActor(CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4 = none)
EndFunction

Bool Function IsValidActorSL(Quest SexLabQuestFramework, Actor ActorRef) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
	Return SLFramework.IsValidActor(ActorRef)
EndFunction


;;;;;;;;;; OSTIM ;;;;;;;;;;;;;;;;;;


Bool Function StartSceneOS(Quest OSexIntegrationMainQuest, Actor Dom, Actor Sub, Bool zUndressDom = False, Bool zUndressSub = False, Bool zAnimateUndress = False, String zStartingAnimation = "", Actor zThirdActor = None, ObjectReference Bed = None, Bool Aggressive = False, Actor AggressingActor = None) Global
	OSexIntegrationMain OSexMainQuest = OSexIntegrationMainQuest as OSexIntegrationMain
	Return OSexMainQuest.StartScene(Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
EndFunction


;;;;;;;;;; FlowerGirls ;;;;;;;;;;;;;;;;;;

Function RandomSceneFG(Quest FlowerGirls, Actor actor1, Actor actor2) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	FGScript.RandomScene(actor1,actor2)
EndFunction

Function PlayThreesomeFG(Quest FlowerGirls, Actor participant1, Actor participant2, Actor participant3) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	FGScript.PlayThreesome( participant1, participant2, participant3)
EndFunction

dxSceneThread Function GetActiveThreadForActorFG(Quest FlowerGirls, ObjectReference actorRef) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	Return FGScript.ThreadManager.GetActiveThreadForActor(actorRef)
EndFunction


