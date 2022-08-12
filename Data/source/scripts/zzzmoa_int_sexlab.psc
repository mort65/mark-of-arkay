Scriptname zzzmoa_int_sexlab Hidden 

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

Actor Function FindRapistSL(Quest SexLabQuestFramework, ObjectReference CenterRef, float Radius = 5000.0, int FindGender = -1, Actor IgnoreRef1 = none, Actor IgnoreRef2 = none, Actor IgnoreRef3 = none, Actor IgnoreRef4 = none) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
	Return SLFramework.FindAvailableActor(CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4 = none)
EndFunction

Bool Function IsValidActorSL(Quest SexLabQuestFramework, Actor ActorRef) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework
	Return SLFramework.IsValidActor(ActorRef)
EndFunction

