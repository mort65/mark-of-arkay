Scriptname zzzmoa_thiefnpcscript extends ReferenceAlias

zzzmoaReviveMCM Property ConfigMenu Auto
Import zzzmoautilscript

Event OnDying(Actor akKiller)
	If (( GetReference() As Actor ) && ( ConfigMenu.moaBleedoutHandlerState.GetValue() == 0 ))
		If Configmenu.bIsLoggingEnabled
			If akKiller
				Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() +\
				"', " + ( GetReference() As Actor ) + ", " + ( GetReference() As Actor ).GetRace() +\
				", ) who stoled player's items is killed by ( '" + akKiller.GetActorBase().GetName() + "', " +\
				akKiller + ", " + akKiller.GetRace() + ", )." )
			Else
				Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() +\
				"', " + ( GetReference() As Actor ) + ", " + ( GetReference() As Actor ).GetRace() +\
				", ) who stoled player's items is dead." )
			EndIf
		EndIf
		If !(( GetReference() As Actor ).GetParentCell().IsAttached() )
			GetOwningQuest().SetStage(20)
		EndIf
	EndIf
EndEvent

Event OnEnterBleedout()
	If (( GetReference() As Actor ) && ( ConfigMenu.moaBleedoutHandlerState.GetValue() == 0 ))
		If (( GetReference() As Actor ).GetParentCell().IsAttached() && (( GetReference() As Actor ).IsEssential() || ( GetReference() As Actor ).GetActorBase().IsEssential()))
			If Configmenu.bIsLoggingEnabled
				Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() +\
				"', " + ( GetReference() As Actor ) + ", " + ( GetReference() As Actor ).GetRace() +\
				", ) who stoled player's items is bleeding out." )
			EndIf
		GetOwningQuest().SetStage(20)	
		EndIf
	EndIf
EndEvent

Event OnReset()
	If (ConfigMenu.moaBleedoutHandlerState.GetValue() == 0 )
		If Configmenu.bIsLoggingEnabled
			If ( GetReference() As Actor )
				If Configmenu.bIsLoggingEnabled
					Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() + "', " + ( GetReference() As Actor ) +\
					", " + ( GetReference() As Actor ).GetRace() + ", ) who stoled player's items, has reset." )
				EndIf
			ElseIf Configmenu.bIsLoggingEnabled
				Debug.Trace("MarkofArkay: NPC who stoled player's items no longer exist.")
			EndIf
		EndIf
		GetOwningQuest().SetStage(15)
	EndIf
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	If GetActorReference()
		If akViewer == GetActorReference() && akTarget == Game.GetPlayer() as Actor
			GetActorReference() && !GetActorReference().IsDead() && !Game.GetPlayer().IsBleedingOut() && GetActorReference().StartCombat(Game.GetPlayer())
		Else
			RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
		EndIf
	EndIf
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If aeCombatState == 0 && GetActorReference() && !GetActorReference().IsDead()
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
	EndIf
EndEvent

Event OnUpdate()
	If GetActorReference()
		If GetActorReference().Is3DLoaded() && \
		(Game.GetPlayer().GetParentCell() == GetActorReference().GetParentCell() || \
		GetActorReference().GetDistance(Game.GetPlayer()) < 2000)
			GetActorReference() && !GetActorReference().IsBleedingOut() && !Game.GetPlayer().IsBleedingOut() && !GetActorReference().IsDead() && GetActorReference().StartCombat(Game.GetPlayer())
		EndIf
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
		RegisterForSingleUpdate(30.0)
	EndIf
EndEvent

Event OnLoad()
	If GetActorReference() && !GetActorReference().IsDead()
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
		RegisterForSingleUpdate(30.0)
	EndIf
EndEvent

Event OnCellAttach()
	If GetActorReference() && !GetActorReference().IsDead()
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
		RegisterForSingleUpdate(30.0)
	EndIf
EndEvent


Event OnAttachedToCell()
	If GetActorReference() && !GetActorReference().IsDead()
		RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
		RegisterForSingleUpdate(30.0)
	EndIf
EndEvent
