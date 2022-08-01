Scriptname zzzmoaIntPsc Hidden 

Bool Function IsActorActive(Quest SexLabQuestFramework, Actor ActorRef) Global
	SexLabFramework SLFramework =  SexLabQuestFramework as SexLabFramework ; Here it should be safe to cast to an external type and access external script variables and functions
	Return SLFramework.IsActorActive(ActorRef)
EndFunction