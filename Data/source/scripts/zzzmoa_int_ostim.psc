Scriptname zzzmoa_int_ostim Hidden 

Bool Function StartSceneOS(Quest OSexIntegrationMainQuest, Actor Dom, Actor Sub, Bool zUndressDom = False, Bool zUndressSub = False, Bool zAnimateUndress = False, String zStartingAnimation = "", Actor zThirdActor = None, ObjectReference Bed = None, Bool Aggressive = False, Actor AggressingActor = None) Global
	OSexIntegrationMain OSexMainQuest = OSexIntegrationMainQuest as OSexIntegrationMain
	Return OSexMainQuest.StartScene(Dom, Sub, zUndressDom, zUndressSub, zAnimateUndress, zStartingAnimation, zThirdActor, Bed, Aggressive, AggressingActor)
EndFunction