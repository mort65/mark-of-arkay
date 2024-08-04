Scriptname zzzmoacalmdowneffectscript extends activemagiceffect

Faction property CalmFaction auto
zzzmoaReviveMCM property ConfigMenu auto
Formlist property PacifiedHostiles auto
Formlist property PacifiedTeamMates auto
ReferenceAlias property Rapist1 auto
ReferenceAlias property Rapist10 auto
ReferenceAlias property Rapist2 auto
ReferenceAlias property Rapist3 auto
ReferenceAlias property Rapist4 auto
ReferenceAlias property Rapist5 auto
ReferenceAlias property Rapist6 auto
ReferenceAlias property Rapist7 auto
ReferenceAlias property Rapist8 auto
ReferenceAlias property Rapist9 auto
Package property RapistApproachPackage auto
Package property RapistCheerPackage auto
Package property RapistStayPackage auto
Package property RapistWaitPackage auto

Actor mySelf

event OnEffectFinish(Actor akTarget, Actor akCaster)
  if !mySelf
    if akTarget
      mySelf = akTarget
    elseif akCaster
      mySelf = akCaster
    endif
  endif
  mySelf && mySelf.removeFromFaction(CalmFaction)
  mySelf && ConfigMenu.bPYOK && PyramidUtils.SetActorCalmed(mySelf, false)
  mySelf && mySelf.EvaluatePackage()
endevent

event OnEffectStart(Actor akTarget, Actor akCaster)
  if akTarget
    mySelf = akTarget

    ;Debug.trace(self + " effect started for " +mySelf )
    if !mySelf.IsInFaction(CalmFaction)
      mySelf.addToFaction(CalmFaction)
    endif
    mySelf.StopCombatAlarm()
    if ConfigMenu.bPYOK
      PyramidUtils.SetActorCalmed(mySelf, true)
    else
      mySelf.StopCombat()
    endif
    RegisterForModEvent("MOA_RemoveCalm", "RemoveCalm")
  endif
endevent

Event RemoveCalm(string eventName, string argString, float argNum, form sender)
  mySelf && ConfigMenu.bPYOK && PyramidUtils.SetActorCalmed(mySelf, false)
  Dispel()
endevent
