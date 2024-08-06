Scriptname zzzmoa_npc_pacifier_alias_script extends ReferenceAlias

Spell property NpcPacifier auto

event OnInit()
  zzzmoa_npc_pacifier_quest_script myQuestScript = (GetOwningQuest() As zzzmoa_npc_pacifier_quest_script)
  if Self.GetActorRef()
    Actor mySelf = Self.GetActorRef()
    if mySelf.IsPlayerTeammate() && !myQuestScript.PacifiedTeamMates.HasForm(mySelf)
      if myQuestScript.PacifiedTeamMates.GetSize() < 128
        myQuestScript.PacifiedTeamMates.AddForm(mySelf)
      endif
    elseif !myQuestScript.PacifiedHostiles.HasForm(mySelf)
      if myQuestScript.PacifiedHostiles.GetSize() < 128
       myQuestScript.PacifiedHostiles.AddForm(mySelf)
      endif
    endif
    if !mySelf.HasSpell(NpcPacifier) ;PacifyNPC globalvalue and MOA_RemoveCalm unpacify everyone
      mySelf.AddSpell(NpcPacifier)
    endif
  endif
endevent
