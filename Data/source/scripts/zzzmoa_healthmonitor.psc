Scriptname zzzmoa_HealthMonitor Extends Quest

zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
Float Property fUpdateRate = 0.3 Auto Hidden
Actor Property PlayerRef Auto

Event OnInit()
	If Configmenu.moaState.GetValue() && ConfigMenu.bTriggerOnHealthPerc
		RegisterForSingleUpdate(fUpdateRate )
	EndIf
EndEvent

Event OnUpdate()
	If !ReviveScript.bInBleedout && PlayerRef.GetActorValuePercentage("Health") <= ConfigMenu.fHealthPercTrigger
		ReviveScript.checkHealth()
	EndIf
	RegisterForSingleUpdate(fUpdateRate)
EndEvent
