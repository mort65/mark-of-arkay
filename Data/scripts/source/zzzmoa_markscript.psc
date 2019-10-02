Scriptname zzzmoa_MarkScript extends activemagiceffect  

FormList property CustomRespawnPoints Auto
zzzmoaReviveMCM Property ConfigMenu Auto
MiscObject Property MarkOfArkay Auto
Message Property moaMarkMenu Auto
Message Property moaMarkOverwriteConfirm Auto
Actor Caster
ObjectReference Marker

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If ( akCaster.GetItemCount(MarkOfArkay) < ConfigMenu.fMarkCastSlider)
		Debug.Notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
		Return
	EndIf
	Int iIndex = -1
	Utility.Wait(0.5)
	Bool bBreak = False
	While !bBreak
		iIndex = moaMarkMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
		If iIndex == -1
		ElseIf iIndex < 8
			iIndex = iIndex / 2 ;(0,1)=0,(2,3)=1,(4,5)=2,(6,7)=3
			bBreak = True
		ElseIf iIndex == 8
			ConfigMenu.ShowCustomSlotsInfo()
		Else
			bBreak = True
		EndIf
	EndWhile
	If iIndex > -1 && iIndex < CustomRespawnPoints.getSize() && \
	(ConfigMenu.isCustomSlotEmpty(iIndex) || moaMarkOverwriteConfirm.Show())
		Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
	Else
		Return
	EndIf
	Caster = akCaster
	Marker.Enable()
	Marker.MoveTo(Caster)
	Marker.SetPosition(Caster.GetPositionx(), Caster.GetPositiony(), Caster.GetPositionz())
	Marker.SetAngle(0.0, 0.0, Caster.GetAnglez())
	If ConfigMenu.bAutoSwitchRP
		ConfigMenu.iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 5 )
		ConfigMenu.iSelectedCustomRPSlot = iIndex
		ConfigMenu.SetCustomRPFlags()
	EndIf
	If ConfigMenu.fMarkCastSlider > 0.0	
		Caster.RemoveItem(MarkOfArkay,ConfigMenu.fMarkCastSlider As Int,False)
	EndIf
EndEvent
