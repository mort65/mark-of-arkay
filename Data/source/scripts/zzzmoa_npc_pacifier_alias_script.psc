Scriptname zzzmoa_npc_pacifier_alias_script extends ReferenceAlias

Spell property NpcPacifier auto

event OnInit()
  if Self.GetActorRef()
    Actor mySelf = Self.GetActorRef()
    if mySelf.IsPlayerTeammate() && !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.HasForm(mySelf)
      (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.AddForm(mySelf)
      mySelf.AddSpell(NpcPacifier)
      mySelf.StopCombat()
      mySelf.StopCombatAlarm()
      mySelf.EvaluatePackage()
    elseif !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.HasForm(mySelf)
      (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.AddForm(mySelf)
      mySelf.AddSpell(NpcPacifier)
      mySelf.StopCombat()
      mySelf.StopCombatAlarm()
      mySelf.EvaluatePackage()
    endif
  endif
endevent
