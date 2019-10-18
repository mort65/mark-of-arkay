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
Bool bExtraInList = False
Bool bExtraMarkersChanged = False
Bool bExtraRemoved = False
Bool bCanAddPlayerCell = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If akCaster != PlayerRef
		Return
	EndIf
	If PlayerRef.GetParentCell() == ConfigMenu.ReviveScript.DefaultCell
		Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
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
	bCanAddPlayerCell = bCanAddPlayerCell()
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
				If bCanAddPlayerCell
					If iIsCurentCellMarked(1)
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Already_Marked")
					Else
						bExtraInList = False
						bExtraAdded = False
						If !bExtraAdded
							If PlayerRef.GetCurrentLocation()
								Marker = ConfigMenu.Revivescript.RespawnScript.getCenterMarker(PlayerRef.GetCurrentLocation())
								If Marker && (Marker.GetParentCell() == PlayerRef.GetParentCell())
									If bIsMarkerInList(Marker)
										bExtraInList = True
									Else
										ExtraCustomMarkerList.AddForm(Marker)
										bExtraAdded = True
										bExtraMarkersChanged = True
									EndIf
								EndIf
							EndIf
						EndIf
						If !bExtraAdded
							Marker = Game.FindClosestReferenceOfTypeFromRef(COCMarkerHeading As Form,PlayerRef,50000.0)
							If Marker && (Marker.GetParentCell() == PlayerRef.GetParentCell())
								If bIsMarkerInList(Marker)
									bExtraInList = True
								Else
									ExtraCustomMarkerList.AddForm(Marker)
									bExtraAdded = True
									bExtraMarkersChanged = True
								EndIf
							EndIf
						EndIf
						If bExtraAdded
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Added")
						ElseIf bExtraInList
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Already_Added")
						Else 
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Cannot_Mark")
						EndIf
					EndIf
				Else
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
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
						If iIsCurentCellMarked(2) > 1
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Cannot_Remove_External_Markers")
						Else
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
						EndIf
					EndIf
				EndWhile
			ElseIf iButton == 2 ;Remove all
				If moaRemoveAllExtraMarksConfirm.Show()
					ExtraCustomMarkerList.Revert()
					bExtraMarkersChanged = True
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
				EndIf
			ElseIf iButton == 3 ;Check
				If bCanAddPlayerCell
					bExtraInList = False
					If iIsCurentCellMarked(1) > 0
						bExtraInList = True
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked")
					EndIf
					If iIsCurentCellMarked(2) > 0
						bExtraInList = True
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Externally_Marked")
					EndIf
					Int i = ConfigMenu.CustomRespawnPoints.GetSize()
					Bool bFound = False
					While i > 0 && !bFound
						i -= 1
						If (CustomRespawnPoints.GetAt(iIndex) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
							Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marked_As_Custom")
							bFound = True
						EndIf
					EndWhile				
					If !bFound && !bExtraInList
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Not_Marked")
					EndIf
				Else
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Forbidden")
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


Int Function iIsCurentCellMarked(Int iList = 0)
	Int i
	If !iList || (iList == 1)
		i = ExtraCustomMarkerList.GetSize()
		While i > 0
			i -= 1
			If ExtraCustomMarkerList.GetAt(i) As ObjectReference
				If (ExtraCustomMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
					Return 1
				EndIf
			EndIf
		EndWhile
	EndIf
	If !iList || (iList == 2)
		i = ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetSize()
		While i > 0
			i -= 1
			If (ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
				Return 2
			EndIf
		EndWhile
		i = ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.GetSize()
		While i > 0
			i -= 1
			If (ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
				Return 3
			EndIf
		EndWhile
	EndIf
	Return 0
EndFunction

Bool Function bIsMarkerInList(ObjectReference akMarker,Int iList = 0)
	If iList == 1
		Return ExtraCustomMarkerList.HasForm(akMarker)
	ElseIf iList == 2
		Return ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.HasForm(akMarker) ||\
		ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(akMarker)
	Else
		Return ExtraCustomMarkerList.HasForm(akMarker) ||\
		ConfigMenu.ReviveScript.RespawnScript.ExternalMarkerList.HasForm(akMarker) ||\
		ConfigMenu.ReviveScript.RespawnScript.ExternalLocationMarkerList.HasForm(akMarker)
	EndIf
EndFunction

