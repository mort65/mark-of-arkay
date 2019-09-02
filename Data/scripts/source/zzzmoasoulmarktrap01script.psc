Scriptname zzzmoasoulmarktrap01script extends Quest

zzzmoaReviverScript Property ReviveScript Auto
ReferenceAlias Property Thief Auto
ReferenceAlias[] Property Thiefs Auto
Bool bStopping = False

Event OnInit()
	Int i = 0
	Thief && Thief.RegisterForSingleUpdate(5.0)
	Thiefs[0] && Thiefs[0].RegisterForSingleUpdate(5.0)
	While i < Thiefs.Length
		Thiefs[i] && Thiefs[i].RegisterForModEvent("moa_Disintegrate", "OnDisintegrating")
		i += 1
	EndWhile
EndEvent

Function StopQuest(Int iRestore = 0)
	If Self.IsRunning() && !bStopping
		bStopping = True
		Int handle = ModEvent.Create("moa_Disintegrate")
		If (handle)
			ModEvent.PushForm(handle, self)
			ModEvent.Send(handle)
		EndIf
		If iRestore == 1
			ReviveScript.ItemScript.RestoreLostItems(Game.GetPlayer())
			If ReviveScript.moaRetrieveLostItems.IsRunning()
				ReviveScript.moaRetrieveLostItems.SetStage(20)
			EndIf
			If ReviveScript.moaRetrieveLostItems01.IsRunning()
				ReviveScript.moaRetrieveLostItems01.SetStage(20)
			EndIf
		ElseIf iRestore == -1
			If ( ReviveScript.ConfigMenu.bLoseForever )
				ReviveScript.ItemScript.DestroyLostItems(Game.GetPlayer())
				If ReviveScript.moaRetrieveLostItems.IsRunning()
					ReviveScript.moaRetrieveLostItems.SetStage(10)
				EndIf
				If ReviveScript.moaRetrieveLostItems01.IsRunning()
					ReviveScript.moaRetrieveLostItems01.SetStage(10)
				EndIf
			Else
				ReviveScript.ItemScript.RestoreLostItems(Game.GetPlayer())
				If ReviveScript.moaRetrieveLostItems.IsRunning()
					ReviveScript.moaRetrieveLostItems.SetStage(20)
				EndIf
				If ReviveScript.moaRetrieveLostItems01.IsRunning()
					ReviveScript.moaRetrieveLostItems01.SetStage(20)
				EndIf
			EndIf
		EndIf
		Self.SetStage(30)
	EndIf
	bStopping = False
EndFunction
