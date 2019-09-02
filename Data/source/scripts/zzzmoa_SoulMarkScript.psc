Scriptname zzzmoa_SoulMarkScript extends Quest  

ReferenceAlias Property Alias_zzzmoa_ItemMarker02 Auto

Event OnInit()
		If Alias_zzzmoa_ItemMarker02 .GetActorReference()
			Alias_zzzmoa_ItemMarker02 .RegisterForSingleUpdate(30.0)	
		EndIf
EndEvent