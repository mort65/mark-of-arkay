Scriptname zzzmoa_HealthMonitor extends Quest

zzzmoaReviveMCM property ConfigMenu auto
Actor property PlayerRef auto
zzzmoaReviverScript property ReviveScript auto
Float property fUpdateRate=0.3 auto Hidden

event OnInit()
  if Configmenu.moaState.GetValue() && ConfigMenu.bTriggerOnHealthPerc
    RegisterForSingleUpdate(fUpdateRate)
  endif
endevent

event OnUpdate()
  if !ReviveScript.bInBleedout && PlayerRef.GetActorValuePercentage("Health") <= ConfigMenu.fHealthPercTrigger
    ReviveScript.checkHealth()
  endif
  RegisterForSingleUpdate(fUpdateRate)
endevent
