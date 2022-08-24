Scriptname zzzmoa_int_sexlab Hidden

Actor function FindRapistSL(Quest SexLabQuestFramework, ObjectReference CenterRef, float Radius=5000.0, int FindGender=-1, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.FindAvailableActor(CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4=none)
endfunction

Bool function IsActorActiveSL(Quest SexLabQuestFramework, Actor ActorRef) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework ; Here it should be safe to cast to an external type and access external script variables and functions
  return SLFramework.IsActorActive(ActorRef)
endfunction

Bool function IsValidActorSL(Quest SexLabQuestFramework, Actor ActorRef) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.IsValidActor(ActorRef)
endfunction

Bool function quickRapeSL(Quest SexLabQuestFramework, Actor[] rapists, Actor victimRef) Global
  if victimRef != None && rapists && rapists.length > 0 && rapists[0] != None
    SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
    if SLFramework == None
      return False
    endif
    rapists = SLFramework.SortActors(rapists, true)
    Actor rapist1 = rapists[0]
    Actor rapist2 = None
    if rapists.length > 1
      rapist2 = rapists[1]
    endif
    Actor rapist3 = None
    if rapists.length > 2
      rapist3 = rapists[2]
    endif
    Actor rapist4 = None
    if rapists.length > 3
      rapist4 = rapists[3]
    endif
    if rapists.length == 1
      if SLFramework.QuickStart(Actor1=victimRef, Actor2=rapist1, Victim=victimRef, AnimationTags="Aggressive") != None
        return True
      endif
    else
      int rapistCount = rapists.length
      Int FemaleCount
      Int MaleCount
      Int i
      while rapistCount > 0
        FemaleCount = 0
        i = 0
        while i < rapistCount
          if SLFramework.GetGender(rapists[i]) == 1
            FemaleCount += 1
          endif
          i += 1
        endwhile
        Malecount = rapistCount - FemaleCount
        if SLFramework.GetGender(victimRef) == 1
          FemaleCount += 1
        else
          MaleCount += 1
        endif
        if SLFramework.GetAnimationsByDefaultTags(Malecount, FemaleCount, true, false, true, "sex", "", true).Length > 0
          if rapistCount < 4
            rapist4 = None
          endif
          if rapistCount < 3
            rapist3 = None
          endif
          if rapistCount < 2
            rapist2 = None
          endif
          if SLFramework.QuickStart(Actor1=victimRef, Actor2=rapist1, Actor3=rapist2, Actor4=rapist3, Actor5=rapist4, Victim=victimRef, AnimationTags="Aggressive") != None
            return True
          endif
        endif
        rapistCount -= 1
      endwhile
    endif
  endif
  return False
endfunction
