Scriptname zzzmoa_npc_pacifier_alias_script extends ReferenceAlias  

Spell Property NpcPacifier Auto

Event OnInit()
	If Self.GetActorRef()
		Actor mySelf = Self.GetActorRef() 
		If mySelf.IsPlayerTeammate() && !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.HasForm(mySelf)
			(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.AddForm(mySelf)
			mySelf.AddSpell(NpcPacifier)
			mySelf.StopCombat()
			mySelf.StopCombatAlarm()
			mySelf.EvaluatePackage()
		ElseIf !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.HasForm(mySelf)
			(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.AddForm(mySelf)
			mySelf.AddSpell(NpcPacifier)
			mySelf.StopCombat()
			mySelf.StopCombatAlarm()
			mySelf.EvaluatePackage()
		EndIf
	EndIf
EndEvent