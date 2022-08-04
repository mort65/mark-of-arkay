Scriptname zzzmoa_int_flowergirls Hidden 


Function RandomSceneFG(Quest FlowerGirls, Actor actor1, Actor actor2) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	FGScript.RandomScene(actor1,actor2)
EndFunction

Function PlayThreesomeFG(Quest FlowerGirls, Actor participant1, Actor participant2, Actor participant3) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	FGScript.PlayThreesome( participant1, participant2, participant3)
EndFunction

dxSceneThread Function GetActiveThreadForActorFG(Quest FlowerGirls, ObjectReference actorRef) Global
	dxFlowerGirlsScript FGScript =  FlowerGirls as dxFlowerGirlsScript
	Return FGScript.ThreadManager.GetActiveThreadForActor(actorRef)
EndFunction
