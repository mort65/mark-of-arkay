Scriptname zzzmoa_MarkScript extends activemagiceffect  

FormList property CustomRespawnPoints Auto
Formlist property ExtraCustomMarkerList Auto
zzzmoaReviveMCM Property ConfigMenu Auto
MiscObject Property MarkOfArkay Auto
Message Property moaMarkMenu Auto
Message Property moaMarkMenu08 Auto
Message Property moaMarkMenu080 Auto
Static Property COCMarkerHeading Auto
Message Property moaMarkOverwriteConfirm Auto
Message Property moaRemoveAllExtraMarksConfirm Auto
Actor Property PlayerRef Auto
ObjectReference Marker
Bool bExtraAdded = False
Bool bExternallyAdded = False
Bool bExtraInList = False
Bool bExtraMarkersChanged = False
Bool bExtraRemoved = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akCaster != PlayerRef
		Return
	EndIf
	If PlayerRef.GetParentCell() == ConfigMenu.ReviveScript.DefaultCell
		Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Cannot_Mark")
		Return
	EndIf
	If ( PlayerRef.GetItemCount(MarkOfArkay) < ConfigMenu.fMarkCastSlider)
		Debug.Notification("$mrt_MarkofArkay_Notification_Teleportation_NoArkayMark")
		Return
	EndIf
	Int iIndex = -1
	Utility.Wait(0.5)
	Bool bBreak = False
	bExtraAdded = False
	bExtraInList = False
	bExtraRemoved = False
	bExtraMarkersChanged = False
	Int iMessage = 0
	Int iButton = 0
	While !bBreak
		If iButton == -1
		ElseIf iMessage == 0
			iButton = moaMarkMenu.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
			If iButton == -1
			ElseIf iButton < 8
				iIndex = iButton / 2 ;(0,1)=0,(2,3)=1,(4,5)=2,(6,7)=3
				bBreak = True
			ElseIf iButton == 8
				iMessage = 1
			Else
				bBreak = True
			EndIf
		ElseIf iMessage == 1
			iButton = moaMarkMenu08.Show(ConfigMenu.iSelectedCustomRPSlot + 1)
			If iButton == -1
			ElseIf iButton == 0 ;Detail
				ConfigMenu.ShowCustomSlotsInfo()
			ElseIf iButton == 1 ;Extra
				iMessage = 2
			ElseIf iButton == 2 ;Back
				iMessage = 0
			ElseIf iButton == 3 ;Cancel
				bBreak = True
			EndIf
		ElseIf iMessage == 2
			iButton = moaMarkMenu080.Show()
			If iButton == -1
			ElseIf iButton == 0 ;Add
				If bCanAddPlayerCell()
					bExtraInList = False
					Int i = ExtraCustomMarkerList.GetSize()
					While i > 0 && !bExtraInList
						i -= 1
						If ExtraCustomMarkerList.GetAt(i)
							If (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
								bExtraInList = True
							EndIf
						EndIf
					EndWhile
					If bExtraInList
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Already_Marked")
					Else
						bExtraAdded = False
						bExternallyAdded = False
						If !bExtraAdded && !bExternallyAdded
							If PlayerRef.GetCurrentLocation()
								Marker = ConfigMenu.Revivescript.RespawnScript.getCenterMarker(PlayerRef.GetCurrentLocation())
								If Marker && (Marker.GetParentCell() == PlayerRef.GetParentCell())
									If ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(Marker) ||\
									ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.HasForm(Marker)
										bExternallyAdded = True
									Else
										ExtraCustomMarkerList.AddForm(Marker)
										bExtraAdded = True
										bExtraMarkersChanged = True
									EndIf
								EndIf
							EndIf
						EndIf
						If !bExtraAdded && !bExternallyAdded
							Marker = Game.FindClosestReferenceOfTypeFromRef(COCMarkerHeading As Form,PlayerRef,50000.0)
							If Marker && (Marker.GetParentCell() == PlayerRef.GetParentCell())
								If ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(Marker) ||\
								ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.HasForm(Marker)
									bExternallyAdded = True
								Else
									ExtraCustomMarkerList.AddForm(Marker)
									bExtraAdded = True
									bExtraMarkersChanged = True
								EndIf
							EndIf
						EndIf
						If bExtraAdded
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Added")
						Else
							If bExternallyAdded
								Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Externally_Marked")
							EndIf
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Cannot_Mark")
						EndIf
					EndIf
				EndIf
			ElseIf iButton == 1 ;Remove
				Int i = ExtraCustomMarkerList.GetSize()
				bExtraRemoved = False
				While i > 0
					i -= 1
					If ExtraCustomMarkerList.GetAt(i) As ObjectReference
						If (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i) As ObjectReference)
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Removed")
							bExtraMarkersChanged = True
							bExtraRemoved = True
						EndIf
					Else
						ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i))
						bExtraMarkersChanged = True
					EndIf
					If !bExtraRemoved
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
					EndIf
				EndWhile
			ElseIf iButton == 2 ;Remove all
				If moaRemoveAllExtraMarksConfirm.Show()
					ExtraCustomMarkerList.Revert()
					bExtraMarkersChanged = True
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
				EndIf
			ElseIf iButton == 3 ;Check
				Int i = ExtraCustomMarkerList.GetSize()
				bool bFound = False
				While i > 0 && !bFound
					i -= 1
					If ExtraCustomMarkerList.GetAt(i) As ObjectReference
						If (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked")
							bFound = True
						EndIf
					EndIf
				EndWhile 
				If !bFound
					i = ConfigMenu.CustomRespawnPoints.GetSize()
					While i > 0 && !bFound
						i -= 1
						If (CustomRespawnPoints.GetAt(iIndex) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked_As_Custom")
							bFound = True
						EndIf
					EndWhile
				EndIf				
				If !bFound
					i = ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetSize()
					While i > 0 && !bFound
						i -= 1
						If (ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Externally_Marked")
							bFound = True
						EndIf
					EndWhile
				EndIf
				If !bFound
					i = ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.GetSize()
					While i > 0 && !bFound
						i -= 1
						If (ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Externally_Marked")
							bFound = True
						EndIf
					EndWhile
				EndIf
				If !bFound
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
				EndIf
			ElseIf iButton == 4 ;Back
				iMessage = 1
			ElseIf iButton == 5 ;Cancel
				bBreak = True
			EndIf
		EndIf
	EndWhile
	Marker = None
	If bExtraMarkersChanged
		ConfigMenu.ReviveScript.checkMarkers()
	EndIf
	If iIndex > -1 && iIndex < CustomRespawnPoints.getSize() && \
	(ConfigMenu.isCustomSlotEmpty(iIndex) || moaMarkOverwriteConfirm.Show())
		Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
	Else
		If bExtraAdded && ConfigMenu.fMarkCastSlider > 0.0	
			PlayerRef.RemoveItem(MarkOfArkay,ConfigMenu.fMarkCastSlider As Int,False)
		EndIf
		Return
	EndIf
	Marker.Enable()
	Marker.MoveTo(PlayerRef)
	Marker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
	Marker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
	If ConfigMenu.bAutoSwitchRP
		ConfigMenu.iTeleportLocation = ConfigMenu.getCustomRPIndex()
		ConfigMenu.iSelectedCustomRPSlot = iIndex
		ConfigMenu.SetCustomRPFlags()
	EndIf
	If ConfigMenu.fMarkCastSlider > 0.0	
		PlayerRef.RemoveItem(MarkOfArkay,ConfigMenu.fMarkCastSlider As Int,False)
	EndIf
EndEvent


Bool Function bCanAddPlayerCell()
	If !PlayerRef.IsInInterior()
		Return False
	EndIf
	If PlayerRef.GetCurrentLocation()
		Int iIndex = ConfigMenu.ReviveScript.RespawnScript.LocationBlackList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If PlayerRef.IsInLocation(ConfigMenu.ReviveScript.RespawnScript.LocationBlackList.GetAt(iIndex) As Location)
				Return False
			EndIf
		EndWhile
	EndIf
	If PlayerRef.GetParentCell() != ConfigMenu.ReviveScript.DefaultCell
		Return True
	EndIf
	Return False
EndFunction

