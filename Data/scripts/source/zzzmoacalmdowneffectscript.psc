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
  if mySelf && ConfigMenu.bPUOK
    ActorUtil.RemovePackageOverride(mySelf, RapistCheerPackage)
    ActorUtil.RemovePackageOverride(mySelf, RapistStayPackage)
    ActorUtil.RemovePackageOverride(mySelf, RapistWaitPackage)
    ActorUtil.RemovePackageOverride(mySelf, RapistApproachPackage)
  endif

  ;mySelf && Debug.trace(self + " effect finished for " +mySelf )
  mySelf && mySelf.removeFromFaction(CalmFaction)
  mySelf && mySelf.EvaluatePackage()
endevent

event OnEffectStart(Actor akTarget, Actor akCaster)
  if akTarget
    mySelf = akTarget

    ;Debug.trace(self + " effect finished for " +mySelf )
    if !mySelf.IsInFaction(CalmFaction)
      mySelf.addToFaction(CalmFaction)
      mySelf.StopCombatAlarm()
      mySelf.StopCombat()
    endif
    if PacifiedHostiles.Find(mySelf) > -1
      if (mySelf != Rapist1.GetActorRef()) && (mySelf != Rapist2.GetActorRef()) && (mySelf != Rapist3.GetActorRef()) && (mySelf != Rapist4.GetActorRef())
        if !Rapist5.GetActorRef()
          Rapist5.ForceRefTo(mySelf)
        elseif !Rapist6.GetActorRef() && (mySelf != Rapist5.GetActorRef())
          Rapist6.ForceRefTo(mySelf)
        elseif !Rapist7.GetActorRef() && (mySelf != Rapist5.GetActorRef()) && (mySelf != Rapist6.GetActorRef())
          Rapist7.ForceRefTo(mySelf)
        elseif !Rapist8.GetActorRef() && (mySelf != Rapist5.GetActorRef()) && (mySelf != Rapist6.GetActorRef()) && (mySelf != Rapist7.GetActorRef())
          Rapist8.ForceRefTo(mySelf)
        elseif !Rapist9.GetActorRef() && (mySelf != Rapist5.GetActorRef()) && (mySelf != Rapist6.GetActorRef()) && (mySelf != Rapist7.GetActorRef()) && (mySelf != Rapist8.GetActorRef())
          Rapist9.ForceRefTo(mySelf)
        elseif !Rapist10.GetActorRef() && (mySelf != Rapist5.GetActorRef()) && (mySelf != Rapist6.GetActorRef()) && (mySelf != Rapist7.GetActorRef()) && (mySelf != Rapist8.GetActorRef()) && (mySelf != Rapist9.GetActorRef())
          Rapist10.ForceRefTo(mySelf)
        endif
      endif
      if ConfigMenu.bPUOK
        Package curPackage = mySelf.GetCurrentPackage()
        if (curPackage != RapistCheerPackage) && (curPackage != RapistStayPackage) && (curPackage != RapistWaitPackage) && (curPackage != RapistApproachPackage)
          ActorUtil.AddPackageOverride(mySelf, RapistStayPackage, 100)
          if (mySelf == Rapist1.GetActorRef())
            ActorUtil.AddPackageOverride(mySelf, RapistWaitPackage, 100)
          else
            ActorUtil.AddPackageOverride(mySelf, RapistCheerPackage, 100)
          endif
          ActorUtil.AddPackageOverride(mySelf, RapistApproachPackage, 100)
          mySelf.EvaluatePackage()
        endif
      endif
    endif
  endif
endevent
