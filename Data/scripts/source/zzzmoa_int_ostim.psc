Scriptname zzzmoa_int_ostim Hidden

Bool function StartSceneOS(Quest OSexIntegrationMainQuest, Actor Dom, Actor Sub, Bool zUndressDom=False, Bool zUndressSub=False, Bool zAnimateUndress=False, String zStartingAnimation="", Actor zThirdActor=None, ObjectReference Bed=None, Bool Aggressive=False, Actor AggressingActor=None) Global
  OSexIntegrationMain OSexMainQuest = OSexIntegrationMainQuest as OSexIntegrationMain
  return OSexMainQuest.StartScene(Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
endfunction


Bool Function IsSceneAggressiveOS(String SceneID) Global
    int aiIndex = OMetadata.GetActorCount(SceneID)
    While aiIndex > 0
        aiIndex -= 1
        If OMetadata.HasActorTag(SceneID, aiIndex, "aggressor")
            Return true
        EndIf
    EndWhile
    Return false
EndFunction

Bool function StartSexOS(Quest OSexIntegrationMainQuest, Actor[] actors, Actor partner) Global
  if !partner || !OSexIntegrationMainQuest
    return False
  EndIf
  int totalActors = 1 ;partner
  int i = actors.Length
  While i > 0
    i -= 1
    if (actors[i] as Actor) && isAnimsInstalled(totalActors + 1)
      totalActors += 1
    endif
  EndWhile
  Actor[] allActors
  if totalActors == 5
    allActors = new Actor[5]
    allActors[0] = actors[0]
    allActors[1] = actors[1]
    allActors[2] = actors[2]
    allActors[3] = actors[3]
    allActors[4] = partner
  elseif totalActors == 4
    allActors = new Actor[4]
    allActors[0] = actors[0]
    allActors[1] = actors[1]
    allActors[2] = actors[2]
    allActors[3] = partner
  elseif totalActors == 3
    allActors = new Actor[3]
    allActors[0] = actors[0]
    allActors[1] = actors[1]
    allActors[2] = partner
  elseif totalActors == 2
    allActors = new Actor[2]
    allActors[0] = actors[0]
    allActors[1] = partner
  else
    return False
  endif
  String anim = ""
  String backupAnim = ""
  i = 50
  while !anim && (i > 0)
    i -= 1
    anim = OLibrary.GetRandomScene(allActors)
    if anim
      backupAnim = anim
      if !IsSceneAggressiveOS(anim)
        anim = ""
      endif
    endif
  EndWhile
  if anim
    return OThread.QuickStart(allActors, StartingAnimation = anim) != -1
  elseif backupAnim
    return OThread.QuickStart(allActors, StartingAnimation = backupAnim) != -1
  endif
  Return false
endfunction

bool Function isAnimsInstalled(int totalActors) Global
  Actor[] Actors
  if totalActors == 5
    Actors = new Actor[5]
    Actors[0] = None
    Actors[1] = None
    Actors[2] = None
    Actors[3] = None
    Actors[4] = None
    return OLibrary.GetRandomScene(Actors) != ""
  elseif totalActors == 4
    Actors = new Actor[4]
    Actors[0] = None
    Actors[1] = None
    Actors[2] = None
    Actors[3] = None
    return OLibrary.GetRandomScene(Actors) != ""
  elseif totalActors == 3
    Actors = new Actor[3]
    Actors[0] = None
    Actors[1] = None
    Actors[2] = None
    return OLibrary.GetRandomScene(Actors) != ""
  elseif totalActors == 2
    Actors = new Actor[2]
    Actors[0] = None
    Actors[1] = None
    return OLibrary.GetRandomScene(Actors) != ""
  elseif totalActors == 1
    Actors = new Actor[1]
    Actors[0] = None
    return OLibrary.GetRandomScene(Actors) != ""
  EndIf
  return False
EndFunction

String Function getRandomAnimationWithAnyTags(actor[] actors, string tagCSV, string exclusion = "") Global 
  string anim = OLibrary.GetRandomSceneWithAnyActionCSV(actors, tagCSV);
    If (anim == "")
        anim = OLibrary.GetRandomSceneWithAnySceneTagCSV(actors, tagCSV)
    EndIf
    If (anim == "")
        anim = OLibrary.GetRandomSceneSuperloadCSV(actors, AnySceneTag = tagCSV, AnyActionType = tagCSV, AnyActorTagForAny = tagCSV, ActionBlacklistTypes = exclusion, SceneTagBlacklist = exclusion);
    EndIf
    Return  anim
EndFunction

String Function getRandomAnimationWithAllTags(actor[] actors, string tagCSV, string exclusion = "") Global  
  string anim = OLibrary.GetRandomSceneWithAllActionsCSV(actors, tagCSV);
    If (anim == "")
        anim = OLibrary.GetRandomSceneWithAllSceneTagsCSV(actors, tagCSV)
    EndIf
    If (anim == "")
        anim = OLibrary.GetRandomSceneSuperloadCSV(actors, AllSceneTags = tagCSV, AllActionTypes = tagCSV, AllActorTagsForAny = tagCSV, ActionBlacklistTypes = exclusion, SceneTagBlacklist = exclusion);
    EndIf
    Return  anim
EndFunction



