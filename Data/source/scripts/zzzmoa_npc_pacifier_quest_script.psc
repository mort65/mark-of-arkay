Scriptname zzzmoa_npc_pacifier_quest_script extends Quest  

Formlist Property PacifiedHostiles Auto
Formlist Property PacifiedTeamMates Auto
Faction Property calmFaction Auto
Package Property RapistCheerPackage Auto
Package Property RapistStayPackage Auto
Package Property RapistWaitPackage Auto
Package Property RapistApproachPackage Auto
zzzmoaReviveMCM Property ConfigMenu Auto

Event OnInit()
	unPacify()
EndEvent


Function unPacify()
	Actor act = None
	Int l = PacifiedHostiles.GetSize()
	int i = 0
	While i < l
		act = PacifiedHostiles.getAt(i) As actor
		If act
			act.RemoveFromFaction(calmFaction)
			If ConfigMenu.bPUOK
				ActorUtil.RemovePackageOverride(act,RapistCheerPackage)
				ActorUtil.RemovePackageOverride(act,RapistStayPackage)
				ActorUtil.RemovePackageOverride(act,RapistWaitPackage)
				ActorUtil.RemovePackageOverride(act,RapistApproachPackage)
			EndIf
			act.EvaluatePackage()
		EndIf
		i += 1
	EndWhile
	i = 0
	l = PacifiedTeamMates.GetSize()
	While i < l
		act = PacifiedTeamMates.getAt(i) As actor
		If act
			act.RemoveFromFaction(calmFaction)
			act.EvaluatePackage()
		EndIf
		i += 1
	EndWhile
	If ConfigMenu.bPUOK
		ActorUtil.RemoveAllPackageOverride(RapistCheerPackage)
		ActorUtil.RemoveAllPackageOverride(RapistStayPackage)
		ActorUtil.RemoveAllPackageOverride(RapistWaitPackage)
		ActorUtil.RemoveAllPackageOverride(RapistApproachPackage)
	EndIf
	PacifiedHostiles.revert()
	PacifiedTeamMates.revert()
EndFunction


Function ToggleTeamMates(Bool bEnable)
	Int i = PacifiedTeamMates.GetSize()
	Actor ac = None
	While i > 0
		i -= 1
		If PacifiedTeamMates.getAt(i) As actor
			ac = PacifiedTeamMates.getAt(i) As actor
			If bEnable
				ac.Enable()
				If ac.IsDead()
					ac.Resurrect()
				EndIf
				ac.EvaluatePackage()
				ac.RestoreActorValue("Health",9999)
			Else
				ac.Disable()
			EndIf
		EndIf
	EndWhile
EndFunction

Function Pacify()
	Int i = 0
	int l = PacifiedHostiles.GetSize()
	Actor ac = None
	Package curPackage
	While i < l
		ac = PacifiedHostiles.GetAt(i) As Actor
		If ac
			If !ac.IsInFaction(calmFaction)
				ac.AddToFaction(calmFaction)
			EndIf
			If ConfigMenu.bPUOK
				curPackage = ac.GetCurrentPackage()
				If (curPackage != RapistCheerPackage) && (curPackage != RapistStayPackage) && (curPackage != RapistWaitPackage) && (curPackage != RapistApproachPackage)
					ActorUtil.AddPackageOverride(ac,RapistCheerPackage,99)
					ActorUtil.AddPackageOverride(ac,RapistStayPackage,99)
					ActorUtil.AddPackageOverride(ac,RapistApproachPackage,99)
				EndIf		
			EndIf
			ac.EvaluatePackage()
		EndIf
		i += 1
	EndWhile
	i = 0
	l = PacifiedTeamMates.GetSize()
	While i < l
		ac = PacifiedTeamMates.GetAt(i) As Actor
		If (ac && !ac.IsInFaction(calmFaction))
			ac.AddToFaction(calmFaction)
			ac.EvaluatePackage()
		EndIf
		i += 1
	EndWhile
EndFunction