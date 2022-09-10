Scriptname zzzmoa_int_sexlab Hidden

bool function AllowedCreatureCombinationSL(Quest SexLabQuestFramework, Race CreatureRace, Race CreatureRace2) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.AllowedCreatureCombination(CreatureRace, CreatureRace2)
endfunction

Bool function AllowedCreatureSL(Quest SexLabQuestFramework, Race CreatureRace) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.AllowedCreature(CreatureRace)
endfunction

Actor function FindRapistCreatureSL(Quest SexLabQuestFramework, string RaceKey, ObjectReference CenterRef, float Radius=5000.0, int FindGender=2, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.FindAvailableCreature(RaceKey, CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4)
endfunction

Actor function FindRapistSL(Quest SexLabQuestFramework, ObjectReference CenterRef, float Radius=5000.0, int FindGender=-1, Actor IgnoreRef1=none, Actor IgnoreRef2=none, Actor IgnoreRef3=none, Actor IgnoreRef4=none) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.FindAvailableActor(CenterRef, Radius, FindGender, IgnoreRef1, IgnoreRef2, IgnoreRef3, IgnoreRef4=none)
endfunction

Bool function IsActorActiveSL(Quest SexLabQuestFramework, Actor ActorRef) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework ; Here it should be safe to cast to an external type and access external script variables and functions
  return SLFramework.IsActorActive(ActorRef)
endfunction

Bool function IsCreaturesAllowedSL(Quest SexLabQuestFramework) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.AllowCreatures
endfunction

Bool function IsValidActorSL(Quest SexLabQuestFramework, Actor ActorRef) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  return SLFramework.IsValidActor(ActorRef)
endfunction

Bool function RapeSL(Quest SexLabQuestFramework, Actor[] rapists, Actor victimRef) Global
  if ((victimRef != None) && (rapists && rapists.length > 0) && (rapists[0] != None))
    SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
    if SLFramework == None
      return False
    endif
    int j = rapists.length
    int i = j
    while i > 0
      i -= 1
      if !rapists[i] || (rapists[i] == none)
        j -= 1
      endif
    endwhile
    if j < 1
      return False
    endif
    Actor[] RapistsArray
    if j == rapists.Length
      RapistsArray = rapists
    else
      if j > 2
        RapistsArray = new Actor[3]
      elseif j > 1
        RapistsArray = new Actor[2]
      else
        RapistsArray = new Actor[1]
      endif
      i = 0
      while i < rapists.length
        if rapists[i]
          j = RapistsArray.find(None)
          if j > -1
            RapistsArray[j] = rapists[i]
          endif
        endif
        i += 1
      endwhile
    endif
    bool isCreature = !RapistsArray[0].HasKeywordString("actortypenpc")
    Actor rapist1 = RapistsArray[0]
    Actor rapist2 = None
    Actor rapist3 = None
    Actor rapist4 = None
    string tags
    if isCreature
      rapists = SLFramework.SortCreatures(RapistsArray)
      tags = "creature"
    else
      rapists = SLFramework.SortActors(RapistsArray, true)
      tags = "aggressive,sex"
    endif
    Actor[] actors = new Actor[5]
    actors[0] = victimRef
    actors[1] = Rapists[0]
    rapist1 = Rapists[0]
    if Rapists.length > 1
      rapist2 = Rapists[1]
      actors[2] = Rapists[1]
    endif
    if Rapists.length > 2
      rapist3 = Rapists[2]
      actors[3] = Rapists[2]
    endif
    if Rapists.length > 3
      rapist4 = Rapists[3]
      actors[4] = Rapists[3]
    endif
    if Rapists.length == 1
      if SLFramework.QuickStart(Actor1=victimRef, Actor2=rapist1, Victim=victimRef, AnimationTags=tags) != None
        return True
      endif
    else
      int rapistIndex = Rapists.length
      Int FemaleCount
      Int MaleCount
      Bool bAnim = False
      string raceKey
      String raceID
      sslBaseAnimation[] animations
      actor[] positions
      while rapistIndex > 0
        rapistIndex -= 1
        bAnim = False
        if rapistIndex == 3
          positions = new Actor[5]
        elseif rapistIndex == 2
          positions = new Actor[4]
        elseif rapistIndex == 1
          positions = new Actor[3]
        elseif rapistIndex == 0
          positions = new Actor[2]
        endif
        i = positions.Length
        while i > 0
          i -= 1
          positions[i] = Actors[i]
        endwhile
        if iscreature
          animations = SLFramework.GetCreatureAnimationsByActorsTags(rapistIndex + 2, positions, tags, "", true)
          if animations.Length > 0
            bAnim = true
          else
            raceID = MiscUtil.GetActorRaceEditorID(rapist1)
            if raceID != ""
              raceKey = sslCreatureAnimationSlots.GetRaceKeyByID(raceID)
              animations = SLFramework.GetCreatureAnimationsByRaceKey(rapistIndex + 2, raceKey)
              if animations.Length > 0
                bAnim = true
              endif
            endif
          endif
        else
          FemaleCount = 0
          Malecount = 0
          i = (rapistIndex + 2) ;actors[0]=vctim (1,2,3,4)=Rapist
          while i > 0
            i -= 1
            if actors[i] && SLFramework.GetGender(actors[i]) == 1
              FemaleCount += 1
            else
              Malecount += 1
            endif
          endwhile
          animations = SLFramework.GetAnimationsByDefaultTags(Malecount, FemaleCount, true, false, true, tags, "", true)
          if animations.Length > 0
            bAnim = true
          endif
        endif
        if bAnim
          if SLFramework.StartSex(Positions, animations, VictimRef, VictimRef As ObjectReference) > -1
            return True
          endif
        endif
        if rapistIndex < 4
          rapist4 = None
          actors[4] = None
        endif
        if rapistIndex < 3
          rapist3 = None
          actors[3] = None
        endif
        if rapistIndex < 2
          rapist2 = None
          actors[2] = None
        endif
      endwhile
    endif
  endif
  return False
endfunction

String function getRaceKeySL(Quest SexLabQuestFramework, Actor ActorRef) Global
  SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
  String raceKey = ""
  String raceID = MiscUtil.GetActorRaceEditorID(ActorRef)
  if raceID != ""
    raceKey = sslCreatureAnimationSlots.GetRaceKeyByID(raceID)
  endif
  return raceKey
endfunction

Bool function quickRapeSL(Quest SexLabQuestFramework, Actor[] rapists, Actor victimRef) Global
  if ((victimRef != None) && (rapists && rapists.length > 0) && (rapists[0] != None) && rapists[0].HasKeywordString("actortypenpc"))
    SexLabFramework SLFramework = SexLabQuestFramework as SexLabFramework
    if SLFramework == None
      return False
    endif
	int j = rapists.length
    int i = j
    while i > 0
      i -= 1
      if !rapists[i] || (rapists[i] == none)
        j -= 1
      endif
    endwhile
    if j < 1
      return False
    endif
    Actor[] RapistsArray
    if j == rapists.Length
      RapistsArray = rapists
    else
      if j > 2
        RapistsArray = new Actor[3]
      elseif j > 1
        RapistsArray = new Actor[2]
      else
        RapistsArray = new Actor[1]
      endif
      i = 0
      while i < rapists.length
        if rapists[i]
          j = RapistsArray.find(None)
          if j > -1
            RapistsArray[j] = rapists[i]
          endif
        endif
        i += 1
      endwhile
    endif
    rapists = SLFramework.SortActors(RapistsArray, true)
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
