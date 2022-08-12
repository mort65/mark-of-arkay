Scriptname zzzmoa_int_flowergirls Hidden 


Bool Function RandomSceneFG(Quest FlowerGirls, Actor actor1, Actor actor2) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	If FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference) != None
		Return False
	EndIf
	FGScript.RandomScene(actor1,actor2)
	Utility.wait(3.0)
	dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(actor2 as ObjectReference)
	If startedScene != None
		While startedScene.IsRunning()
			Utility.Wait(0.1)
		EndWhile
	EndIf
	return (startedScene As Bool)
EndFunction

Bool Function PlayThreesomeFG(Quest FlowerGirls, Actor participant1, Actor participant2, Actor participant3) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	If FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference) != None
		Return False
	EndIf
	FGScript.PlayThreesome( participant1, participant2, participant3)
	Utility.wait(3.0)
	dxSceneThread startedScene = FGScript.ThreadManager.GetActiveThreadForActor(participant2 as ObjectReference)
	If startedScene != None
		While startedScene.IsRunning()
			Utility.Wait(0.1)
		EndWhile
	EndIf
	return (startedScene As Bool)
EndFunction
