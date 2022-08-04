Scriptname zzzmoacalmdowneffectscript extends activemagiceffect  

Faction Property CalmFaction auto
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
Formlist Property PacifiedHostiles Auto
Formlist Property PacifiedTeamMates Auto
Package Property RapistCheerPackage Auto
Package Property RapistStayPackage Auto
Package Property RapistWaitPackage Auto
Package Property RapistApproachPackage Auto
zzzmoaReviveMCM Property ConfigMenu Auto
Actor mySelf

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akTarget
		mySelf = akTarget
		mySelf.addToFaction(CalmFaction)
		mySelf.StopCombatAlarm()
		mySelf.StopCombat()
		If PacifiedHostiles.Find(mySelf) > -1
			If !Rapist5.GetActorRef()
				Rapist5.ForceRefTo(mySelf)
			ElseIf !Rapist6.GetActorRef()
				Rapist6.ForceRefTo(mySelf)
			ElseIf !Rapist7.GetActorRef()
				Rapist7.ForceRefTo(mySelf)
			ElseIf !Rapist8.GetActorRef()
				Rapist8.ForceRefTo(mySelf)
			ElseIf !Rapist9.GetActorRef()
				Rapist9.ForceRefTo(mySelf)
			ElseIf !Rapist10.GetActorRef()
				Rapist10.ForceRefTo(mySelf)
			EndIf
			If ConfigMenu.bPUOK
				Package curPackage = mySelf.GetCurrentPackage()
				If (curPackage != RapistCheerPackage) && (curPackage != RapistStayPackage) && (curPackage != RapistWaitPackage) && (curPackage != RapistApproachPackage)
					ActorUtil.AddPackageOverride(mySelf, RapistStayPackage,99)
					If (mySelf == Rapist1.GetActorRef()) || (mySelf == Rapist2.GetActorRef()) || (mySelf == Rapist3.GetActorRef()) || (mySelf == Rapist4.GetActorRef())
						ActorUtil.AddPackageOverride(mySelf,RapistWaitPackage,99)
					Else
						ActorUtil.AddPackageOverride(mySelf,RapistCheerPackage,99)
					EndIf
					ActorUtil.AddPackageOverride(mySelf,RapistApproachPackage,99)
				EndIf
			EndIf
		EndIf
		mySelf.EvaluatePackage()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If !mySelf
		If akTarget
			mySelf = akTarget
		ElseIf akCaster
			mySelf = akCaster
		EndIf		
	EndIf
	If mySelf && ConfigMenu.bPUOK
		ActorUtil.RemovePackageOverride(mySelf, RapistCheerPackage)
		ActorUtil.RemovePackageOverride(mySelf, RapistStayPackage)
		ActorUtil.RemovePackageOverride(mySelf, RapistWaitPackage)
		ActorUtil.RemovePackageOverride(mySelf, RapistApproachPackage)
	EndIf
	mySelf && mySelf.removeFromFaction(CalmFaction)
	mySelf && mySelf.EvaluatePackage()
EndEvent
