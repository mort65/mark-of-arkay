Scriptname zzzmoa_npc_pacifier_quest_script extends Quest

zzzmoaReviveMCM property ConfigMenu auto
Formlist property PacifiedHostiles auto
Formlist property PacifiedTeamMates auto
Package property RapistApproachPackage auto
Package property RapistCheerPackage auto
Package property RapistStayPackage auto
Package property RapistWaitPackage auto
Faction property calmFaction auto

event OnInit()
  ;unPacify()
endevent

function Pacify()
  Int i = 0
  int l = PacifiedHostiles.GetSize()
  Actor ac = None
  Package curPackage
  while i < l
    ac = PacifiedHostiles.GetAt(i) As Actor
    if ac
      if !ac.IsInFaction(calmFaction)
        ac.AddToFaction(calmFaction)
      endif
      if ConfigMenu.bPUOK
        curPackage = ac.GetCurrentPackage()
        if (curPackage != RapistCheerPackage) && (curPackage != RapistStayPackage) && (curPackage != RapistWaitPackage) && (curPackage != RapistApproachPackage)
          ActorUtil.AddPackageOverride(ac, RapistApproachPackage, 100)
		  ActorUtil.AddPackageOverride(ac, RapistStayPackage, 100)
		  ActorUtil.AddPackageOverride(ac, RapistCheerPackage, 100)
        endif
      endif
      ac.EvaluatePackage()
    endif
    i += 1
  endwhile
  i = 0
  l = PacifiedTeamMates.GetSize()
  while i < l
    ac = PacifiedTeamMates.GetAt(i) As Actor
    if (ac && !ac.IsInFaction(calmFaction))
      ac.AddToFaction(calmFaction)
      ac.EvaluatePackage()
    endif
    i += 1
  endwhile
endfunction

function ToggleTeamMates(Bool bEnable)
  Int i = PacifiedTeamMates.GetSize()
  Actor ac = None
  while i > 0
    i -= 1
    if PacifiedTeamMates.getAt(i) As actor
      ac = PacifiedTeamMates.getAt(i) As actor
      if bEnable
        ac.Enable()
        if ac.IsDead()
          ac.Resurrect()
        endif
        ac.EvaluatePackage()
        ac.RestoreActorValue("Health", 9999)
      else
        ac.Disable()
      endif
    endif
  endwhile
endfunction

function unPacify()
  Actor act = None
  Int l = PacifiedHostiles.GetSize()
  int i = 0
  while i < l
    act = PacifiedHostiles.getAt(i) As actor
    if act
      act.RemoveFromFaction(calmFaction)
      if ConfigMenu.bPUOK
        ActorUtil.RemovePackageOverride(act, RapistCheerPackage)
        ActorUtil.RemovePackageOverride(act, RapistStayPackage)
        ActorUtil.RemovePackageOverride(act, RapistWaitPackage)
        ActorUtil.RemovePackageOverride(act, RapistApproachPackage)
      endif
      act.EvaluatePackage()
    endif
    i += 1
  endwhile
  i = 0
  l = PacifiedTeamMates.GetSize()
  while i < l
    act = PacifiedTeamMates.getAt(i) As actor
    if act
      act.RemoveFromFaction(calmFaction)
      act.EvaluatePackage()
    endif
    i += 1
  endwhile
  if ConfigMenu.bPUOK
    ActorUtil.RemoveAllPackageOverride(RapistCheerPackage)
    ActorUtil.RemoveAllPackageOverride(RapistStayPackage)
    ActorUtil.RemoveAllPackageOverride(RapistWaitPackage)
    ActorUtil.RemoveAllPackageOverride(RapistApproachPackage)
  endif
  PacifiedHostiles.revert()
  PacifiedTeamMates.revert()
endfunction
