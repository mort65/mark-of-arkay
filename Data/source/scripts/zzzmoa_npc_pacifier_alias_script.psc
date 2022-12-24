Scriptname zzzmoa_npc_pacifier_alias_script extends ReferenceAlias

Spell property NpcPacifier auto

event OnInit()
  if Self.GetActorRef()
    Actor mySelf = Self.GetActorRef()
    if mySelf.IsPlayerTeammate() && !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.HasForm(mySelf)
      if (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.GetSize() < 128
        (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedTeamMates.AddForm(mySelf)
      endif
    elseif !(GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.HasForm(mySelf)
      if (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.GetSize() < 128
        (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script).PacifiedHostiles.AddForm(mySelf)
      endif
    endif
    if !mySelf.HasSpell(NpcPacifier)
      mySelf.AddSpell(NpcPacifier)
      ;mySelf.StopCombat()
      ;mySelf.StopCombatAlarm()
      ;mySelf.EvaluatePackage()
    endif
  endif
endevent
