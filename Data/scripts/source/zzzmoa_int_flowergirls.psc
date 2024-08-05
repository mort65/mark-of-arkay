Scriptname zzzmoa_int_flowergirls Hidden

Bool function PlayThreesomeFG(Quest FlowerGirls, Actor participant1, Actor participant2, Actor participant3, faction animfaction) Global
  dxFlowerGirlsScript FGScript = FlowerGirls as dxFlowerGirlsScript
  if FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference) != None
    return False
  endif
  FGScript.PlayThreesome(participant1, participant2, participant3)
  Utility.wait(3.0)
  dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference)
  if startedScene != None
    float fWaitTime = 0.0
	  Bool bBreak = False
    actor player = game.getplayer()
    while !bBreak && startedScene.IsRunning()
      Utility.Wait(1.0)
      fWaitTime += 1.0
      if (fWaitTime / 60.0) >= 1.0
        debug.trace("MarkOfArkay: Checking animation state at 1 minute interval...")
        if player.isinfaction(animfaction)
          debug.trace("MarkOfArkay: player is still in animation.")
          fWaitTime = 0.0
        else
          debug.trace("MarkOfArkay: player not in animation.")
          bBreak = True
        endif
      endif
    endwhile
  endif
  return (startedScene As Bool)
endfunction

Bool function RandomSceneFG(Quest FlowerGirls, Actor actor1, Actor actor2, faction animfaction) Global
  dxFlowerGirlsScript FGScript = FlowerGirls as dxFlowerGirlsScript
  if FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference) != None
    return False
  endif
  FGScript.RandomScene(actor1, actor2)
  Utility.wait(3.0)
  dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference)
  if startedScene != None
    float fWaitTime = 0.0
	  Bool bBreak = False
    actor player = game.getplayer()
    while !bBreak && startedScene.IsRunning()
      Utility.Wait(1.0)
      fWaitTime += 1.0
      if (fWaitTime / 60.0) >= 1.0
        debug.trace("MarkOfArkay: Checking animation state at 1 minute interval...")
        if player.isinfaction(animfaction)
          debug.trace("MarkOfArkay: player is still in animation.")
          fWaitTime = 0.0
        else
          debug.trace("MarkOfArkay: player not in animation.")
          bBreak = True
        endif
      endif
    endwhile
  endif
  return (startedScene As Bool)
endfunction
