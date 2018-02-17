Scriptname zzzmoa_sacrificescript extends ActiveMagicEffect 

zzzmoaReviverScript Property ReviveScript Auto 
Actor Property PlayerRef Auto
actor CasterActor
actor Victim

Event OnEffectStart(Actor Target, Actor Caster)
	Victim = target
	CasterActor = Caster
	If ( CasterActor != PlayerRef )
		Self.Dispel()
	ElseIf ( Victim.GetLevel() > CasterActor.GetLevel() )
		Utility.Wait(3)
		Debug.Notification("$mrt_MarkofArkay_Notification_Sacrifice_Failed")
		Self.Dispel()
	Else
		ReviveScript.Victim = Victim
		Debug.Notification("$mrt_MarkofArkay_Notification_Sacrifice_Success")
	EndIf
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	If ((ReviveScript.Victim == Victim) && !PlayerRef.IsBleedingOut())
		ReviveScript.Victim = None
		Victim = None
	EndIf
EndEvent