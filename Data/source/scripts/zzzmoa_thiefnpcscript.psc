Scriptname zzzmoa_thiefnpcscript extends ReferenceAlias

zzzmoaReviveMCM Property ConfigMenu Auto

Event OnDeath(Actor akKiller)
	If (( GetReference() As Actor ) && ( ConfigMenu.moaBleedoutHandlerState.GetValue() == 0 ))
		If Configmenu.bIsLoggingEnabled
			Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() +\
			"', " + ( GetReference() As Actor ) + ", " + ( GetReference() As Actor ).GetRace() +\
			", ) who stoled player's items is killed by ( '" + akKiller.GetActorBase().GetName() + "', " +\
			akKiller + ", " + akKiller.GetRace() + ", )." )
		EndIf
		If !(( GetReference() As Actor ).GetParentCell().IsAttached() )
			If GetOwningQuest().IsRunning()
				ConfigMenu.ReviveScript.RestoreLostItems(Game.GetPlayer())
				If ConfigMenu.ReviveScript.moaRetrieveLostItems.IsRunning()
					ConfigMenu.ReviveScript.moaRetrieveLostItems.SetStage(20)
				EndIf
				If ConfigMenu.ReviveScript.moaRetrieveLostItems01.IsRunning()
					ConfigMenu.ReviveScript.moaRetrieveLostItems01.SetStage(20)
				EndIf
				GetOwningQuest().Stop()			
			EndIf
		EndIf
	EndIf
EndEvent

Event OnEnterBleedout()
	If (( GetReference() As Actor ) && ( ConfigMenu.moaBleedoutHandlerState.GetValue() == 0 ))
		If (( GetReference() As Actor ).GetParentCell().IsAttached() && ( GetReference() As Actor ).IsEssential() )
			If Configmenu.bIsLoggingEnabled
				Debug.Trace( "MarkofArkay: ( '" + ( GetReference() As Actor ).GetActorBase().GetName() +\
				"', " + ( GetReference() As Actor ) + ", " + ( GetReference() As Actor ).GetRace() +\
				", ) who stoled player's items is bleeding out." )
			EndIf
			ConfigMenu.ReviveScript.RestoreLostItems(Game.GetPlayer())
			If ConfigMenu.ReviveScript.moaRetrieveLostItems.IsRunning()
				ConfigMenu.ReviveScript.moaRetrieveLostItems.SetStage(20)
			EndIf
			If ConfigMenu.ReviveScript.moaRetrieveLostItems01.IsRunning()
				ConfigMenu.ReviveScript.moaRetrieveLostItems01.SetStage(20)
			EndIf
			GetOwningQuest().Stop()			
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
		If GetOwningQuest().IsRunning()
			If (!( GetReference() As Actor ) || ( GetReference() As Actor ).IsDisabled() || ( GetReference() As ObjectReference ).IsDeleted() )
				If ( ConfigMenu.bLoseForever && ( ConfigMenu.iRemovableItems != 0 ))
					ConfigMenu.ReviveScript.DestroyLostItems(Game.GetPlayer())
					If ConfigMenu.ReviveScript.moaRetrieveLostItems.IsRunning()
						ConfigMenu.ReviveScript.moaRetrieveLostItems.SetStage(10)
					EndIf
					If ConfigMenu.ReviveScript.moaRetrieveLostItems01.IsRunning()
						ConfigMenu.ReviveScript.moaRetrieveLostItems01.SetStage(10)
					EndIf
				Else
					ConfigMenu.ReviveScript.RestoreLostItems(Game.GetPlayer())
					If ConfigMenu.ReviveScript.moaRetrieveLostItems.IsRunning()
						ConfigMenu.ReviveScript.moaRetrieveLostItems.SetStage(20)
					EndIf
					If ConfigMenu.ReviveScript.moaRetrieveLostItems01.IsRunning()
						ConfigMenu.ReviveScript.moaRetrieveLostItems01.SetStage(20)
					EndIf
				EndIf
				GetOwningQuest().Stop()	
			Else
				If !(( GetReference() As Actor ).GetItemCount( ConfigMenu.ReviveScript.StolenItemsMisc ))
					( GetReference() As Actor ).AddItem( ConfigMenu.ReviveScript.StolenItemsMisc )
				EndIf
				( GetReference() As Actor ).AddToFaction(ConfigMenu.ReviveScript.PlayerEnemyFaction)
			EndIf
		EndIf
	EndIf
EndEvent