Scriptname zzzmoa_int_flowergirls Hidden

Bool function PlayThreesomeFG(Quest FlowerGirls, Actor participant1, Actor participant2, Actor participant3) Global
  dxFlowerGirlsScript FGScript = FlowerGirls as dxFlowerGirlsScript
  if FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference) != None
    return False
  endif
  FGScript.PlayThreesome(participant1, participant2, participant3)
  Utility.wait(3.0)
  dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference)
  if startedScene != None
    while startedScene.IsRunning()
      Utility.Wait(0.1)
    endwhile
  endif
  return (startedScene As Bool)
endfunction

Bool function RandomSceneFG(Quest FlowerGirls, Actor actor1, Actor actor2) Global
  dxFlowerGirlsScript FGScript = FlowerGirls as dxFlowerGirlsScript
  if FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference) != None
    return False
  endif
  FGScript.RandomScene(actor1, actor2)
  Utility.wait(3.0)
  dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference)
  if startedScene != None
    while startedScene.IsRunning()
      Utility.Wait(0.1)
    endwhile
  endif
  return (startedScene As Bool)
endfunction
