Scriptname zzzmoa_MarkScript extends activemagiceffect  

Import zzzmoautilscript
FormList property CustomRespawnPoints Auto
Formlist property ExtraCustomMarkerList Auto
zzzmoaReviveMCM Property ConfigMenu Auto
MiscObject Property MarkOfArkay Auto
Message Property moaMarkMenu Auto
Message Property moaMarkMenu08 Auto
Message Property moaMarkMenu080 Auto
Static Property COCMarkerHeading Auto
Message Property moaMarkOverwriteConfirm Auto
Message Property moaRemoveExtraMarkerConfirm Auto
Message Property moaRemoveAllExtraMarksConfirm Auto
Actor Property PlayerRef Auto
ObjectReference Marker
Bool bExtraAdded = False
Bool bExtraInList = False
Bool bExtraMarkersChanged = False
Bool bCustomMarkersChanged = False
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
	Int aiButton = 0
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
			ElseIf iButton == 1 ;Remove this place
				If ExtraCustomMarkerList.GetSize() > 0
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
				Else
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Already_Removed")
				EndIf
			ElseIf iButton == 2 ;Remove by index
				If ExtraCustomMarkerList.GetSize() > 0
					Int i = 1
					Bool abBreak = False
					While !abBreak
						aiButton = ConfigMenu.ReviveScript.RespawnScript.moaRespawnMenu13_Alt.Show(i)
						If aiButton == -1
						ElseIf aiButton == 0 ;Prev
							i = ichangeVar(i,1,ExtraCustomMarkerList.GetSize(),-1)
						ElseIf aiButton == 1 ;Next
							i = ichangeVar(i,1,ExtraCustomMarkerList.GetSize(),1)
						ElseIf aiButton == 2 ;Input
							If ConfigMenu.bUIEOK
								UITextEntryMenu TextMenu = uiextensions.GetMenu("UITextEntryMenu", True) as UITextEntryMenu
								TextMenu.SetPropertyString("text", (i) As String)
								TextMenu.OpenMenu(none, none)
								String sResult = TextMenu.GetResultString()
								TextMenu.ResetMenu()
								If sResult && bIsInteger(sResult) && ((sResult As Int) - 1) > - 1 && ((sResult As Int) - 1) < ExtraCustomMarkerList.GetSize()
									i = (sResult As Int)
								EndIf
							EndIf
						ElseIf aiButton == 3 ;Check
							ConfigMenu.ShowExtraRPInfo(i - 1,1,2)
						ElseIf aiButton == 4 ;OK
							If moaRemoveExtraMarkerConfirm.Show()
								ExtraCustomMarkerList.RemoveAddedForm(ExtraCustomMarkerList.GetAt(i - 1))
								Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_Removed")
								If ExtraCustomMarkerList.GetSize() > 0
									If i > ExtraCustomMarkerList.GetSize()
										i = ExtraCustomMarkerList.GetSize()
									EndIf
								Else
									Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
									abBreak = True
								EndIf
								bExtraMarkersChanged = True
							EndIf
						ElseIf aiButton == 5 ;Random
							If ExtraCustomMarkerList.GetSize() > 1
								i = iGetRandomWithExclusion(1,ExtraCustomMarkerList.GetSize(),i)
							EndIf
						ElseIf aiButton == 6 ;Back
							abBreak = True
						EndIf
					EndWhile
				Else
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Already_Removed")
				EndIf
			ElseIf iButton == 3 ;Remove all
				If ExtraCustomMarkerList.GetSize() > 0
					If moaRemoveAllExtraMarksConfirm.Show()
						ExtraCustomMarkerList.Revert()
						bExtraMarkersChanged = True
						Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Removed")
					EndIf
				Else
					Debug.Notification("$mrt_MarkofArkay_Notification_Mark_Marker_All_Already_Removed")
				EndIf
			ElseIf iButton == 4 ;Check
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
						If (CustomRespawnPoints.GetAt(i) As ObjectReference).GetParentCell() == PlayerRef.GetParentCell()
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
			ElseIf iButton == 5 ;Back
				iMessage = 1
			ElseIf iButton == 6 ;Cancel
				bBreak = True
			EndIf
		EndIf
	EndWhile
	Marker = None
	If iIndex > -1 && iIndex < CustomRespawnPoints.getSize() && \
	(ConfigMenu.isCustomSlotEmpty(iIndex) || moaMarkOverwriteConfirm.Show())
		Marker = CustomRespawnPoints.GetAt(iIndex) As ObjectReference
		bCustomMarkersChanged = True
	Else
		ConfigMenu.ReviveScript.checkMarkers(False,bExtraMarkersChanged,False)
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
	ConfigMenu.ReviveScript.checkMarkers(False,bExtraMarkersChanged,bCustomMarkersChanged)
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

