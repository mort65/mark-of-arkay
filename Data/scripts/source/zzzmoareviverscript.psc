Scriptname zzzmoaReviverScript extends ReferenceAlias 

Quest Property moaReviveMCMscript Auto
Quest Property moaFollowerDetector Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaGuardDetector Auto
Quest Property moaThiefNPC01 Auto
Quest Property moaSoulMark01 Auto
Message Property moaReviveMenu1 Auto
Message Property moaRespawnMenu0 Auto
Message Property moaRespawnMenu1 Auto
Message Property moaRespawnMenu13 Auto
Message Property moaRespawnMenu13_Alt Auto
GlobalVariable Property moaState Auto
GlobalVariable Property moaArkayMarkRevive  Auto
GlobalVariable Property moaDragonSoulRevive  Auto
GlobalVariable Property moaBSoulGemRevive  Auto
GlobalVariable Property moaGSoulGemRevive  Auto
GlobalVariable Property moaSeptimRevive  Auto
GlobalVariable Property moaBleedoutHandlerState Auto
GlobalVariable Property moaBleedouAnimation Auto
GlobalVariable Property moaERPCount Auto
zzzmoaReviveMCM Property ConfigMenu Auto
MiscObject Property Gold001 Auto
MiscObject Property MarkOfArkay Auto
SoulGem Property BlackFilledGem Auto
SoulGem Property GrandFilledGem Auto
Actor Property PlayerRef Auto
VisualEffect Property VisMagDragonAbsorbEffect Auto
VisualEffect property VisMagDragonAbsorbManEffect Auto
EffectShader Property EffectHealCirclFXS Auto
Sound property SoundNPCDragonDeathSequenceWind auto
Sound property SoundNPCDragonDeathSequenceExplosion auto
Sound property SoulAbsorbWind auto
Sound property SoulAbsorbExplosion auto
FormList property ArkayAmulets Auto
FormList Property QuestBlackList Auto
FormList property MarkerList Auto
FormList Property LocationBlackList Auto
Formlist Property CityMarkersList Auto
MagicEffect property FortifyHealthFFSelf Auto
Spell Property moaReviveAfterEffect Auto
Spell Property BleedoutProtection Auto
Spell Property MoveCustomMarker Auto
Spell Property RecallMarker Auto
Spell Property ArkayCurse Auto
Spell Property ArkayCurseAlt Auto
Spell Property ArkayCurseTemp Auto
Spell Property ArkayCurseTempAlt Auto
Spell Property MassHealing Auto
Spell Property MassRevival Auto
Keyword Property IgnoreItem Auto
MagicEffect property AutoReviveSelf Auto
ImageSpaceModifier Property FadeOut Auto
ImageSpaceModifier Property FastFadeOut Auto
ImageSpaceModifier Property BlackScreen Auto
ImageSpaceModifier Property FadeIn Auto
ImageSpaceModifier Property LowHealthImod Auto
ObjectReference Property CustomMarker Auto
ObjectReference Property PlayerMarker Auto
ObjectReference Property SleepMarker Auto
ObjectReference Property DetachMarker1 Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property DetachMarker3 Auto
Objectreference Property CellLoadMarker Auto
ObjectReference Property LocationMarker Auto
Objectreference Property CellLoadMarker2 Auto
ObjectReference Property LocationMarker2 Auto
Objectreference Property LostItemsMarker Auto
ObjectReference Property LostItemsChest Auto
ObjectReference Property EquippedItemsChest Auto
ObjectReference Property ValuableItemsChest Auto
MiscObject Property StolenItemsMisc Auto
MiscObject Property StolenSoulsMisc Auto
Cell Property DefaultCell Auto
Bool Property bIsItemsRemoved Auto Hidden
Float Property fLostSouls Auto Hidden
Actor Property Victim Auto Hidden
Actor Property Guard Auto Hidden
Actor Property Attacker Auto Hidden
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
FormList property WorldspacesInterior auto
Formlist property ExternalMarkerList Auto
Quest Property WerewolfQuest Auto
;Quest Property VampireLordQuest Auto
Formlist Property PotionList Auto
FormList Property LocationsList Auto
Form[] Property VItemArr Auto Hidden
Int Property iTotalBleedOut = 0 Auto Hidden;
Int Property iTotalRespawn = 0 Auto Hidden;
Int Property iTotalRevives = 0 Auto Hidden;
Int Property iRevivesByTrade = 0 Auto Hidden;
Int Property iRevivesByRevivalSpell = 0 Auto Hidden;
Int Property iRevivesBySacrificeSpell = 0 Auto Hidden;
Int Property iRevivesByPotion = 0 Auto Hidden;
Int Property iDestroyedItems = 0 Auto Hidden;
Float Property fRPMinDistance = 2500.0 Auto Hidden
Form[] Property Equipment Auto Hidden
Form[] Property EquippedQuestItems Auto Hidden
ObjectReference[] Property DynamicMarkerList Auto Hidden
ObjectReference[] Property ExcludedMarkerList Auto Hidden
Location Property PaleHoldLocation  Auto
Location Property HjaalmarchHoldLocation  Auto
;Location Property DLC1VampireCastleLocation Auto
;Location Property DLC1HunterHQLocation Auto
Keyword property HoldKeyword Auto
Quest Property CidhnaMineJailEventScene Auto
ReferenceAlias[] Property Followers Auto
ReferenceAlias Property HostileActor Auto
ReferenceAlias Property HostileActor01 Auto
ReferenceAlias Property AttackerActor Auto
ReferenceAlias Property AttackerActor01 Auto
ReferenceAlias Property GuardNPC Auto
ReferenceAlias Property ThiefNPC Auto
Quest Property MS01 Auto
Quest Property MS02 Auto
Actor[] Property FollowerArr Auto Hidden
Actor Property Thief Auto Hidden
Actor Property PreviousThief Auto Hidden
Objectreference Property RiftenJailMarker Auto
Objectreference Property WhiterunJailMarker Auto
Objectreference Property FalkreathJailMarker Auto
Objectreference Property WindhelmJailMarker Auto
Objectreference Property MarkarthJailMarker Auto
Objectreference Property WinterholdJailMarker Auto
Objectreference Property DawnstarJailMarker Auto
Objectreference Property MorthalJailMarker Auto
Objectreference Property SolitudeJailMarker Auto
;Objectreference Property DLC2RavenRockJailMarker Auto
Actor Property Runil Auto
Faction Property RunilMerchantFaction Auto
Faction Property JobMerchantFaction Auto
Faction Property CrimeFactionPale  Auto
Faction Property CrimeFactionFalkreath  Auto
Faction Property CrimeFactionReach  Auto
Faction Property CrimeFactionHjaalmarch  Auto
Faction Property CrimeFactionHaafingar  Auto
Faction Property CrimeFactionRift  Auto
Faction Property CrimeFactionWhiterun  Auto
Faction Property CrimeFactionEastmarch  Auto
Faction Property CrimeFactionWinterhold  Auto
Faction Property PlayerEnemyFaction Auto
Faction Property PlayerFollowerFaction Auto
;Faction Property DLC2CrimeRavenRockFaction Auto
Faction Property CurrentFollowerFaction Auto
Faction Property CurrentHireling Auto
Faction Property CreatureFaction Auto
Race Property WereWolfBeastRace Auto
;Race Property DLC1VampireBeastRace Auto
GlobalVariable Property TimeScale Auto
Bool Property bSKSEOK Auto Hidden
Bool Property bSKSELoaded Auto Hidden
Float Property DefaultTimeScale = 20.0 Auto Hidden
Topic Property DeathTopic Auto
Form Property LeftHandEquippedItem Auto Hidden
Form Property RightHandEquipedItem Auto Hidden
Bool Property bSoulMark = False Auto Hidden
Bool Property bStealSoul = False Auto Hidden
Bool Property bIsConditionSafe = False Auto Hidden

Bool bCidhnaJail
Bool bDidItemsRemoved
Bool  bSeptimRevive  
Bool  bDragonSoulRevive  
Bool  bBSoulGemRevive  
Bool  bGSoulGemRevive 
Bool  bArkayMarkRevive
Bool  bPotionRevive
Float[] PriorityArray
Int iChoice
Bool bWasSwimming
Bool bHasAutoReviveEffect
Int iArkayMarkCount
Int iBSoulGemCount
Int iGSoulGemCount
Float fDragonSoulCount
Int iSeptimCount
Int iRespawnPointsCount
String strRemovedItem
bool bInBleedout
Int iRemovableItems

State Bleedout1
	Event OnPlayerLoadGame()
		SetGameVars()
	EndEvent
	
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	EndEvent

	Event OnSleepStop(Bool abInterrupted)
	EndEvent
EndState

State Bleedout2
	Event OnPlayerLoadGame()
		SetGameVars()
	EndEvent
	
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	EndEvent

	Event OnSleepStop(Bool abInterrupted)
	EndEvent
EndState

Event OnInit()
	moaState.SetValue(1)
	PlayerRef.GetActorBase().SetEssential(True)
	PlayerRef.SetNoBleedoutRecovery(True)
	moaBleedoutHandlerState.SetValue(0)
	PriorityArray = New Float[5]
	SetVars()
	SetGameVars()
	RegisterForSleep()
	DetachMarker2.Enable()
	DetachMarker2.MoveTo(PlayerRef)
	DetachMarker2.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
	DetachMarker2.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
	If Runil && !Runil.Isdead()
		Runil.AddToFaction(JobMerchantFaction)
		Runil.AddToFaction(RunilMerchantFaction)
		Runil.GetActorBase().SetEssential(True)
	EndIf
EndEvent

Event OnPlayerLoadGame()
	If ( ConfigMenu.iSaveOption > 1 )
		Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
	EndIf
	If ConfigMenu.bIsEffectEnabled
		Debug.SetGodMode(True) ;because when loading a save game usually npcs start moving before player
	EndIf
	SetGameVars()
	Utility.Wait(3.0)
	Debug.SetGodMode(False)
	If ConfigMenu.bIsLoggingEnabled
		LogCurrentState()
	EndIf
EndEvent

Event OnEnterBleedout()
	BleedoutHandler(ToggleState())
	If ConfigMenu.bIsLoggingEnabled
		LogCurrentState()
	EndIf
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	If ( PlayerRef.GetParentCell() != DefaultCell )
		SleepMarker.Enable()
		SleepMarker.MoveTo(PlayerRef)
		SleepMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
		SleepMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
		If ConfigMenu.bAutoSwitchRP
			ConfigMenu.iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 4 )
		EndIf
	EndIf
EndEvent

Event OnSleepStop(Bool abInterrupted)
	If ( ConfigMenu.iSaveOption == 2 || ConfigMenu.iSaveOption == 4 ) 
		If ( !PlayerRef.IsDead() && !PlayerRef.IsBleedingOut() && GetState() == "" )
			Game.SetInChargen(False,False,False)
			RegisterForSingleUpdate(6.0)
		EndIf
	EndIf
EndEvent

Event OnUpdate()
	If ( ConfigMenu.iSaveOption > 1 )
		Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
	EndIf
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference) ; using equipped spells As workaround a bug which happens when player goes to bleedout while fighting with spell
	If ( !PlayerRef.IsBleedingOut() && GetState() == "")
		Utility.Wait(0.5)
		If PlayerRef.GetEquippedItemType(0) != 0
			LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
		Else
			LeftHandEquippedItem = None
		EndIf
		If PlayerRef.GetEquippedItemType(1) != 0
			RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
		Else
			RightHandEquipedItem = None
		EndIf
	EndIf
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference) ;SKSE
    If (!PlayerRef.IsBleedingOut() && GetState() == "")
		If PlayerRef.GetEquippedItemType(0) != 0
			LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
		Else
			LeftHandEquippedItem = None
		EndIf
		If PlayerRef.GetEquippedItemType(1) != 0
			RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
		Else
			RightHandEquipedItem = None
		EndIf
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerattack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Attacker = akAggressor As Actor
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If ( Getstate() == "" )
		LocationMarker2.Enable()
		LocationMarker2.MoveTo(LocationMarker)
		LocationMarker2.SetPosition(LocationMarker.GetPositionx(), LocationMarker.GetPositiony(), LocationMarker.GetPositionz())
		LocationMarker2.SetAngle(0.0, 0.0, LocationMarker.GetAnglez())
		LocationMarker.Enable()
		LocationMarker.MoveTo(PlayerRef)
		LocationMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
		LocationMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
		If ( ConfigMenu.iSaveOption > 1 )
			Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		EndIf
		If ( moaThiefNPC01.IsRunning() )
			If !( ThiefNPC.GetReference() As Actor ) || ( ThiefNPC.GetReference() As Actor ).IsDisabled() || ( ThiefNPC.GetReference() As Objectreference ).IsDeleted()
				Configmenu.bIsLoggingEnabled && Debug.Trace( "MarkofArkay: ( '" + ( ThiefNPC.GetReference() As Actor ).GetActorBase().GetName() + "', " +\
				( ThiefNPC.GetReference() As Actor ) + ", " + ( ThiefNPC.GetReference() As Actor ).GetRace() + ", ) who stoled player's items, is disabled, deleted or no longer exist." )
				If ConfigMenu.bLoseForever && (ConfigMenu.iRemovableItems != 0)
					DestroyLostItems(PlayerRef)
					If moaRetrieveLostItems.IsRunning()
						moaRetrieveLostItems.setStage(10)
					EndIf
					If moaRetrieveLostItems01.IsRunning()
						moaRetrieveLostItems01.setStage(10)
					EndIf
				Else
					RestoreLostItems(PlayerRef)	
					If moaRetrieveLostItems.IsRunning()
						moaRetrieveLostItems.setStage(20)
					EndIf
					If moaRetrieveLostItems01.IsRunning()
						moaRetrieveLostItems01.setStage(20)
					EndIf
				EndIf
			ElseIf ( ThiefNPC.GetReference() As Actor )
				AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnCellLoad()
	If ( Getstate() == "" )
		CellLoadMarker2.Enable()
		CellLoadMarker2.MoveTo(CellLoadMarker)
		CellLoadMarker2.SetPosition(CellLoadMarker.GetPositionx(), CellLoadMarker.GetPositiony(), CellLoadMarker.GetPositionz())
		CellLoadMarker2.SetAngle(0.0, 0.0, CellLoadMarker.GetAnglez())
		CellLoadMarker.Enable()
		CellLoadMarker.MoveTo(PlayerRef)
		CellLoadMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
		CellLoadMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
		If ( ConfigMenu.iSaveOption > 1 )
			Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		EndIf
	EndIf
EndEvent

String Function ToggleState() ;prevents double menu when player revived with potion and returns to bleedout while previous bleedout event is not finished
	If (GetState() == "Bleedout1")
		GoToState("Bleedout2")
		Return "Bleedout2"
	Else
		GoToState("Bleedout1")
		Return "Bleedout1"
	EndIf
Endfunction

Function BleedoutHandler(String CurrentState)
	If ConfigMenu.bIsEffectEnabled
		BleedoutProtection.Cast(PlayerRef)
	Else
		Debug.SetGodMode(True)
	EndIf
	Game.DisablePlayerControls()
	ToggleSaving(False)
	Game.EnableFastTravel(False)
	If ConfigMenu.iTotalBleedOut < 99999999
		ConfigMenu.iTotalBleedOut += 1
	EndIf
	If ConfigMenu.bIsLoggingEnabled
		Debug.Trace("MarkOfArkay: Player entered bleedout.")
		LogCurrentState()
	EndIf
	If Thief
		PreviousThief = Thief
	EndIf
	moaHostileNPCDetector.Stop()
	moaHostileNPCDetector01.Stop()
	If Attacker
		AttackerActor.ForceRefTo(Attacker)
		AttackerActor01.ForceRefTo(Attacker)
		If ConfigMenu.bIsLoggingEnabled
			Debug.Trace( "MarkOfArkay: Last attacker = ( '" +\
			Attacker.GetActorBase().GetName() +\
			"', " + Attacker + ", " +\
			Attacker.GetRace() + ", )" ) 
		EndIf
	Else
		AttackerActor.Clear()
		AttackerActor01.Clear()
	EndIf
	If ConfigMenu.bNPCStealItems
		moaHostileNPCDetector.Start()
	ElseIf ConfigMenu.bHostileNPC
		moaHostileNPCDetector01.Start()
	EndIf
	bIsConditionSafe = bIsConditionSafe()
	If ( ConfigMenu.bIsRevivalEnabled && PlayerRef.IsSwimming()) ;SKSE
		If bIsConditionSafe
			PlayerRef.PushActorAway(PlayerRef,0)
		EndIf
		bWasSwimming = True
		Game.ForceThirdPerson()
	Else
		bWasSwimming = False
	EndIf
	moaBleedoutHandlerState.SetValue(1)
	LowHealthImod.Remove()
	SetVars()
	DetectFollowers()
	strRemovedItem = ""
	bHasAutoReviveEffect = PlayerRef.HasMagicEffect(AutoReviveSelf)
	If !ConfigMenu.bIsRevivalEnabled
		If !ConfigMenu.bIsEffectEnabled
			Debug.SetGodMode(False)
		EndIf
		Attacker = None
		Game.EnablePlayerControls()
		Game.EnableFastTravel(True)
		ToggleSaving(True)
		moaBleedoutHandlerState.SetValue(0)
		LowHealthImod.Remove()
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player won't be revived because revival is not enabled.")
		GoToState("")
		Return
	EndIf
	If PlayerRef.GetActorValue("health") < -10
		PlayerRef.RestoreActorValue( "health", -10 - PlayerRef.GetActorValue("health") )
	EndIf
	If ConfigMenu.bAutoDrinkPotion && !bInBeastForm()
		Int iPotion = iHasHealingPotion()
		If iPotion > -1
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving by auto drinking a healing potion...")
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
			If !PlayerRef.IsBleedingOut()
				RequipSpells()
				PlayerRef.ResetHealthAndLimbs()
				PlayerRef.RestoreActorValue("Health",9999)
				If ConfigMenu.bIsEffectEnabled
					PlayerRef.DispelSpell(BleedoutProtection)
				Else
					Debug.SetGodMode(False)
				EndIf
				If Configmenu.bFollowerProtectPlayer
					ResurrectFollowers()
				EndIf
				If ( moaThiefNPC01.IsRunning() )			
					If ( ThiefNPC.GetReference() As Actor ) 
						AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
						(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
					EndIf
				EndIf
				Attacker = None
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				GoToState("")
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived before starting of the revival by auto drinking healing potions.")
				Return
			Else	
				If ConfigMenu.bIsNotificationEnabled
					Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Potion")
				EndIf
				If ConfigMenu.bIsEffectEnabled
					moaReviveAfterEffect.Cast(PlayerRef)
				EndIf
				RequipSpells()
				Debug.SetGodMode(True)
				PlayerRef.ResetHealthAndLimbs()
				PlayerRef.RestoreActorValue("Health",9999)
				Utility.Wait(0.1)
				PlayerRef.EquipItem(PotionList.GetAt(iPotion) As Potion, False, True)
				If ConfigMenu.bIsEffectEnabled
					BleedoutProtection.Cast(PlayerRef)
				EndIf
				If Configmenu.bFollowerProtectPlayer
					ResurrectFollowers()
				EndIf
				If ( moaThiefNPC01.IsRunning() )			
					If ( ThiefNPC.GetReference() As Actor )
						AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
						(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
					EndIf
				EndIf
				Attacker = None
				Debug.SetGodMode(False)
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				If ConfigMenu.iRevivesByPotion < 99999999
					ConfigMenu.iRevivesByPotion += 1
				EndIf
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				GoToState("")
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived by auto drinking a healing potion.")
				Return
			EndIf
		EndIf
	EndIf
	If ( bIsRevivable() || bPotionRevive || bHasAutoReviveEffect || Victim || ( ConfigMenu.bIsMenuEnabled && ( ConfigMenu.moaSnoozeState.GetValue() != 0 )))
		If !bPotionRevive || bHasAutoReviveEffect || Victim || bInBeastForm()
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		Else
			If bWasSwimming
				Game.EnablePlayerControls(abMovement = False, abFighting = False, abCamSwitch = False, abLooking = False, abSneaking = False,\
				abMenu = True, abActivate = False, abJournalTabs = False)
			Else
				Game.EnablePlayerControls()
				Debug.SetGodMode(False)
			EndIf
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		EndIf
		If (GetState() != CurrentState) ; player revived with a potion but returned to bleedout in less than 6 secs
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Revival script is in another state.")
			Return
		ElseIf !PlayerRef.IsBleedingOut() ;player revived with potion or another script and is alive after 6 secs
			If bPotionRevive && ConfigMenu.bIsEffectEnabled
				moaReviveAfterEffect.Cast(PlayerRef)
			EndIf
			RequipSpells()
			PlayerRef.ResetHealthAndLimbs()
			PlayerRef.RestoreActorValue("Health",9999)
			If !bPotionRevive
				If ConfigMenu.bIsEffectEnabled
					PlayerRef.DispelSpell(BleedoutProtection)
				Else
					Debug.SetGodMode(False)
				EndIf
			EndIf
			If Configmenu.bFollowerProtectPlayer
				ResurrectFollowers()
			EndIf
			If ( moaThiefNPC01.IsRunning() )			
				If ( ThiefNPC.GetReference() As Actor )
					AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
					(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
				EndIf
			EndIf
			Attacker = None
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Game.EnablePlayerControls()
			Game.EnableFastTravel(True)
			ToggleSaving(True)
			moaBleedoutHandlerState.SetValue(0)
			LowHealthImod.Remove()
			GoToState("")
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is not in bleedout. (probably revived by manual drinking of a healing potion.)")
		ElseIf bHasAutoReviveEffect ;player has cast a revive spell or scroll
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by an auto revival spell or scroll...")
			If ConfigMenu.bIsEffectEnabled
				VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
				VisMagDragonAbsorbManEffect.play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
				SoulAbsorbWind.play(PlayerRef) 
				SoulAbsorbExplosion.play(PlayerRef) 
				EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
			EndIf
			Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
			RequipSpells()
			If ConfigMenu.bIsNotificationEnabled
				Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Revival_Scroll")
			EndIf
			RevivePlayer(True)
			If ConfigMenu.bIsEffectEnabled
				moaReviveAfterEffect.Cast(PlayerRef)
			EndIf
			If ConfigMenu.iRevivesByRevivalSpell < 99999999
				ConfigMenu.iRevivesByRevivalSpell += 1
			EndIf
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived by an auto revival spell or scroll.")
		ElseIf (Victim && !Victim.IsDead()) ; player has cast a sacrifice spell or scroll on someone
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by sacrificing " + Victim + " for arkay..." )
			Victim.Kill(PlayerRef)
			Victim = None
			If ConfigMenu.bIsEffectEnabled
				VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
				VisMagDragonAbsorbManEffect.play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
				SoulAbsorbWind.play(PlayerRef) 
				SoulAbsorbExplosion.play(PlayerRef) 
				EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
			EndIf
			Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
			RestoreLostItems(PlayerRef)
			RequipSpells()
			RevivePlayer(True)
			If ConfigMenu.bIsEffectEnabled
				moaReviveAfterEffect.Cast(PlayerRef)
			EndIf
			If ConfigMenu.iRevivesBySacrificeSpell < 99999999
				ConfigMenu.iRevivesBySacrificeSpell += 1
			EndIf
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			If ConfigMenu.bIsNotificationEnabled
				Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Sacrifice_Scroll")
			EndIf
			If moaRetrieveLostItems.IsRunning()
				moaRetrieveLostItems.SetStage(20)
			EndIf
			If moaRetrieveLostItems01.IsRunning()
				moaRetrieveLostItems01.SetStage(20)
			EndIf
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player Revived by sacrificing for arkay." )
		ElseIf ( bIsRevivable() || ( ConfigMenu.bIsMenuEnabled && ConfigMenu.moaSnoozeState.GetValue() != 0 ))
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player has enough items to trade with arkay..." )
			If ConfigMenu.bIsMenuEnabled
				Int iResult = RemoveItemByMenu(CurrentState)
				If ( iResult == 1 )
					If ConfigMenu.bIsEffectEnabled
						VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
						VisMagDragonAbsorbManEffect.play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
						SoulAbsorbWind.play(PlayerRef) 
						SoulAbsorbExplosion.play(PlayerRef) 
						EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
					EndIf
					Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
					RequipSpells()
					ShowNotification()
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by trading with arkay (Menu is enabled)..." )
					RevivePlayer(True)
					If ConfigMenu.bIsEffectEnabled
						moaReviveAfterEffect.Cast(PlayerRef)
					EndIf
					If ConfigMenu.iRevivesByTrade < 99999999
						ConfigMenu.iRevivesByTrade += 1
					EndIf
					If ConfigMenu.iTotalRevives < 99999999
						ConfigMenu.iTotalRevives += 1
					EndIf
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: player revived by trading with arkay (Menu is enabled)." )
				ElseIf ( iResult == 0 )
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player select nothing from the trading menu." )
					RevivePlayer(False)
				EndIf
			Else
				PriorityArray = New Float[5]
				PriorityArray[0] = ConfigMenu.fGoldPSlider + 10   ; adding this numbers to Priorities so after sorting them by ones, they still be distinguishable 
				PriorityArray[1] = ConfigMenu.fDragonSoulPSlider + 20
				PriorityArray[2] = ConfigMenu.fBSoulgemPSlider + 30
				PriorityArray[3] = ConfigMenu.fMarkPSlider + 40
				PriorityArray[4] = ConfigMenu.fGSoulgemPSlider + 50
				SortPriorityArray() 
				Int i = 4
				Bool bBreak = False
				While (i>-1) && !bBreak 
					If PriorityArray[i]>50 && bGSoulGemRevive ; player has enough grand soul gem and its Priority is higher
						AutoRemoveItem(i)
						bBreak = True
					ElseIf PriorityArray[i]>40 && (PriorityArray[i]<50) && bArkayMarkRevive
						AutoRemoveItem(i)
						bBreak = True
					ElseIf (PriorityArray[i]>30) && (PriorityArray[i]<40) && bBSoulGemRevive
						AutoRemoveItem(i)
						bBreak = True
					ElseIf (PriorityArray[i]>20) && (PriorityArray[i]<30) && bDragonSoulRevive
						AutoRemoveItem(i)
						bBreak = True
					ElseIf (PriorityArray[i]>10) && (PriorityArray[i]<20) && bSeptimRevive
						AutoRemoveItem(i)
						bBreak = True					
					EndIf 
					i-=1
				EndWhile
				If bBreak ;player has traded 
					If ConfigMenu.bIsEffectEnabled
						VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
						VisMagDragonAbsorbManEffect.play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
						SoulAbsorbWind.play(PlayerRef) 
						SoulAbsorbExplosion.play(PlayerRef) 
						EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
					EndIf
					Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
					RequipSpells()
					ShowNotification()
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by trading with arkay (Menu is disabled)..." )
					RevivePlayer(True)
					If ConfigMenu.bIsEffectEnabled
						moaReviveAfterEffect.Cast(PlayerRef)
					EndIf
					If ConfigMenu.iRevivesByTrade < 99999999
						ConfigMenu.iRevivesByTrade += 1
					EndIf
					If ConfigMenu.iTotalRevives < 99999999
						ConfigMenu.iTotalRevives += 1
					EndIf
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived by trading with arkay (Menu is disabled)." )
				Else ; player couldn't trade
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Trading with arkay failed (Menu is disabled)." )
					RevivePlayer(False)
				EndIf
			EndIf
		Else
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player doesn't have enough items to trade with arkay..." )
			RevivePlayer(False)
		EndIf
	Else
		Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		If !PlayerRef.IsBleedingOut()
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player can't be revived but isn't in bleedout." )
			RequipSpells()
			PlayerRef.ResetHealthAndLimbs()
			PlayerRef.RestoreActorValue("Health",9999)
			If ConfigMenu.bIsEffectEnabled
				PlayerRef.DispelSpell(BleedoutProtection)
			Else
				Debug.SetGodMode(False)
			EndIf
			If Configmenu.bFollowerProtectPlayer
				ResurrectFollowers()
			EndIf
			If ( moaThiefNPC01.IsRunning() )			
				If ( ThiefNPC.GetReference() As Actor ) 
					AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
					(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
				EndIf
			EndIf
			Attacker = None
			Game.EnablePlayerControls()
			Game.EnableFastTravel(True)
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			ToggleSaving(True)
			moaBleedoutHandlerState.SetValue(0)
			LowHealthImod.Remove()
			GoToState("")
		Else
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player can't be revived..." )
			RevivePlayer(False)
		EndIf
	EndIf
Endfunction

Function SortPriorityArray() ;sort priority so higher priority and those items that can be traded are first 
	Int Index1
	Int Index2 = PriorityArray.Length - 1
	Bool bIsIndex1 = False 
	Bool bIsIndex2 = False
	Int Swapped = 0
	While (Index2 > 0)
		Index1 = 0
		Swapped = 0
		While (Index1 < Index2)
			If (((PriorityArray [Index1] As Int) % 10) > (((PriorityArray [Index1 + 1] As Int) % 10))) ;ones are priorities tens are for being distinguishable after sort
				Float SwapDummy = PriorityArray [Index1]
				PriorityArray [Index1] = PriorityArray [Index1 + 1]
				PriorityArray [Index1 + 1] = SwapDummy
				Swapped = 1
			ElseIf (((PriorityArray [Index1] As Int) % 10) == (((PriorityArray [Index1 + 1] As Int) % 10))) ; when two item has the same priority
				If (PriorityArray[Index1]>50) && bGSoulGemRevive
					bIsIndex1 = True ;  Item at index 1 is tradable
				ElseIf (PriorityArray[Index1]>40) && (PriorityArray[Index1]<50) && bArkayMarkRevive
					bIsIndex1 = True
				ElseIf (PriorityArray[Index1]>30) && (PriorityArray[Index1]<40) && bBSoulGemRevive
					bIsIndex1 = True
				ElseIf (PriorityArray[Index1]>20) && (PriorityArray[Index1]<30) && bDragonSoulRevive
					bIsIndex1 = True
				ElseIf (PriorityArray[Index1]>10) && (PriorityArray[Index1]<20) && bSeptimRevive
					bIsIndex1 = True
				EndIf
				If (PriorityArray[Index1 + 1]>50) && bGSoulGemRevive
					bIsIndex2 = True ; Item at index 2 is tradable
				ElseIf (PriorityArray[Index1 + 1]>40) && (PriorityArray[Index1 + 1]<50) && bArkayMarkRevive
					bIsIndex2 = True
				ElseIf (PriorityArray[Index1 + 1]>30) && (PriorityArray[Index1 + 1]<40) && bBSoulGemRevive
					bIsIndex2 = True
				ElseIf (PriorityArray[Index1 + 1]>20) && (PriorityArray[Index1 + 1]<30) && bDragonSoulRevive
					bIsIndex2 = True
				ElseIf (PriorityArray[Index1 + 1]>10) && (PriorityArray[Index1 + 1]<20) && bSeptimRevive
					bIsIndex2 = True
				EndIf
				If (bIsIndex1 == True) && (bIsIndex2 == False) ;tradable items should have lower index in the array after sort
					Float SwapDummy = PriorityArray [Index1]
					PriorityArray [Index1] = PriorityArray [Index1 + 1]
					PriorityArray [Index1 + 1] = SwapDummy
					Swapped = 1
				EndIf
				bIsIndex1 = False 
				bIsIndex2 = False
			EndIf
			Index1 += 1
		EndWhile
		If (Swapped == 0)
			Return
		EndIf
		Index2 -= 1
	EndWhile
EndFunction

Int Function iMin(Int a,Int b)
	If a <= b
		Return a
	EndIf
	Return b
EndFunction

Float Function fMin(Float a,Float b)
	If a <= b
		Return a
	EndIf
	Return b
EndFunction

Float Function fMax(Float a,Float b)
	If a >= b
		Return a
	EndIf
	Return b
EndFunction

Float Function iMax(Int a,Int b)
	If a >= b
		Return a
	EndIf
	Return b
EndFunction

Function LogCurrentState()
		Debug.Trace( "MarkOfArkay: Variables = "\ 
		+ "[ '" + GetState() + "', "\
		+ Game.GetCameraState() + ", "\
		+ ( PlayerRef.IsSwimming() As Int ) + ", "\
		+ ( WerewolfQuest.IsRunning() As Int ) + ", "\
		+ ( PlayerRef.GetAnimationVariableBool("bIsSynced") As Int ) + ", "\
		+ ( PlayerRef.GetAnimationVariableBool("IsStaggering") As Int ) + ", "\
		+ "[ " + ( Game.IsMovementControlsEnabled() As Int ) + ", "\
		+ ( Game.IsFightingControlsEnabled() As Int ) + ", "\
		+ ( Game.IsCamSwitchControlsEnabled() As Int ) + ", "\
		+ ( Game.IsLookingControlsEnabled() As Int ) + ", "\
		+ ( Game.IsSneakingControlsEnabled() As Int ) + ", "\
		+ ( Game.IsMenuControlsEnabled() As Int ) + ", "\
		+ ( Game.IsActivateControlsEnabled() As Int ) + ", "\
		+ ( Game.IsJournalControlsEnabled() As Int ) + ", "\
		+ ( Game.IsFastTravelEnabled() As Int ) + ", ],"\
		+ "[ " + ( ConfigMenu.bIsRevivalEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsMarkEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsGSoulGemEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsBSoulGemEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsDragonSoulEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsGoldEnabled As Int ) + ", "\
		+ ConfigMenu.iSaveOption + ", "\
		+ ( ConfigMenu.bIsNoFallDamageEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsEffectEnabled As Int ) + ", "\
		+ ( ConfigMenu.bIsPotionEnabled As Int ) + ", "\
		+ ( ConfigMenu.bAutoDrinkPotion As Int ) + ", "\
		+ ( ConfigMenu.bIsRevivalRequiresBlessing As Int ) + ", "\
		+ ( ConfigMenu.bShiftBack As Int )+ ", "\
		+ ( ConfigMenu.bShiftBackRespawn As Int ) + ", "\
		+ ( ConfigMenu.bIsMenuEnabled As Int ) + ", "\
		+ ConfigMenu.fBleedoutTimeSlider + ", "\
		+ ConfigMenu.fRecoveryTimeSlider + ", "\
		+ ConfigMenu.fValueSnoozeSlider + ", "\
		+ ConfigMenu.fRPMinDistanceSlider+ ", "\
		+ ConfigMenu.iNotTradingAftermath + ", "\
		+ ConfigMenu.iTeleportLocation + ", "\
		+ ConfigMenu.iExternalIndex + ", "\
		+ ConfigMenu.iRemovableItems + ", "\
		+ ( ConfigMenu.bRespawnNaked As Int ) + ", "\
		+ ( ConfigMenu.bSendToJail As Int ) + ", "\
		+ ( ConfigMenu.bFollowerProtectPlayer As Int ) + ", "\
		+ ( ConfigMenu.bHealActors As Int ) + ", "\
		+ ( ConfigMenu.bLoseForever As Int ) + ", "\
		+ ( ConfigMenu.bSoulMarkStay As Int ) + ", "\
		+ ( ConfigMenu.bHostileNPC As Int ) + ", "\
		+ ( ConfigMenu.bNPCStealItems As Int ) + ", "\
		+ ( ConfigMenu.bCreaturesCanSteal As Int ) + ", "\
		+ ( ConfigMenu.bLostItemQuest As Int ) + ", ], "\
		+ "[ " + ( LostItemsChest.GetNumItems() ) + ", "\
		+ ( fLostSouls As Int ) + ", ], ]" )
EndFunction

Int Function RemoveItemByMenu(String curState) ;trade by using menu
	Int iRevive = 0
	Bool bBreak = False
	While !bBreak
		iChoice = moaReviveMenu1.Show(iArkayMarkCount,iBSoulGemCount,fDragonSoulCount As Int,iGSoulGemCount,iSeptimCount)
		If (iChoice == -1)
		ElseIf ((iChoice == 0) && bArkayMarkRevive)
			PlayerRef.RemoveItem(MarkOfArkay,(ConfigMenu.fValueMarkSlider As Int),True)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Arkay Mark"
		ElseIf ((iChoice == 1) && bBSoulGemRevive)
			PlayerRef.RemoveItem(BlackFilledGem,(ConfigMenu.fValueBSoulGemSlider As Int),True)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Black Soul Gem"
		ElseIf ((iChoice == 2) && bDragonSoulRevive)
			PlayerRef.ModActorValue("DragonSouls", -ConfigMenu.fValueSoulSlider)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Dragon Soul"
		ElseIf ((iChoice == 3) && bGSoulGemRevive)
			PlayerRef.RemoveItem(GrandFilledGem,(ConfigMenu.fValueGSoulGemSlider As Int),True)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Grand Soul Gem"
		ElseIf ((iChoice == 4) && bSeptimRevive)
			PlayerRef.RemoveItem(Gold001,(ConfigMenu.fValueGoldSlider As Int),True)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Septim"
		ElseIf (iChoice == 5) ;Snooze
			Utility.Wait(ConfigMenu.fValueSnoozeSlider)
			If (GetState() != curState)
				iRevive = -1
				bBreak = True
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Revival script is in another state.")
			ElseIf !PlayerRef.IsBleedingOut()
				PlayerRef.ResetHealthAndLimbs()
				PlayerRef.RestoreActorValue("Health",9999)
				If ConfigMenu.bIsEffectEnabled
					PlayerRef.DispelSpell(BleedoutProtection)
				Else
					Debug.SetGodMode(False)
				EndIf
				If Configmenu.bFollowerProtectPlayer
					ResurrectFollowers()
				EndIf
				If ( moaThiefNPC01.IsRunning() )			
					If ( ThiefNPC.GetReference() As Actor ) 
						AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
						(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
					EndIf
				EndIf
				Attacker = None
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived before showing the trade menu.")
				iRevive = -1
				bBreak = True
				GoToState("")
			Else
				SetVars()
			EndIf
		ElseIf (iChoice == 6) ;Nothing
			iRevive = 0
			bBreak = True
		EndIf
	Endwhile
	Return iRevive
EndFunction

Function AutoRemoveItem(Int i) ;trade without menu
	Int j = i - 1
	Int count = 0
	Bool bBreak = False
	Int iRandom
	If ( i>0 ) && (((PriorityArray [j] As Int ) % 10) == ((PriorityArray [i] As Int ) % 10)) ; this item isn't the last item in the array and next item has the same priority As this item
		while (j>-1) && !bBreak ; checking if there is any other item with the same priority
			If (PriorityArray[j]>50) && bGSoulGemRevive
				If ((PriorityArray[j] As Int )%10) == ((PriorityArray[i] As Int )%10)
					count+=1
				Else
					bBreak = True
				EndIf
			ElseIf (PriorityArray[j]>40) && (PriorityArray[j]<50) && bArkayMarkRevive
				If ((PriorityArray[j] As Int )%10) == ((PriorityArray[i] As Int )%10)
					count+=1
				Else
					bBreak = True
				EndIf
			ElseIf (PriorityArray[j]>30) && (PriorityArray[j]<40) && bBSoulGemRevive
				If ((PriorityArray[j] As Int )%10) == ((PriorityArray[i] As Int )%10)
					count+=1
				Else
					bBreak = True
				EndIf
			ElseIf (PriorityArray[j]>20) && (PriorityArray[j]<30) && bDragonSoulRevive
				If ((PriorityArray[j] As Int )%10) == ((PriorityArray[i] As Int )%10)
					count+=1
				Else
					bBreak = True
				EndIf
			ElseIf (PriorityArray[j]>10) && (PriorityArray[j]<20) && bSeptimRevive
				If ((PriorityArray[j] As Int )%10) == ((PriorityArray[i] As Int )%10)
					count+=1
				Else
					bBreak = True
				EndIf
			Else
				bBreak = True
			EndIf
			j-=1
		EndWhile
		iRandom = i - Utility.RandomInt(0, count) ; selecting a random item from items with the same priority
		AutoRemoveItemByIndex(iRandom);
	Else
		AutoRemoveItemByIndex(i) ;next item has a lower priority
	EndIf
Endfunction

Function AutoRemoveItemByIndex(Int iIndex) ; removing item at iIndex
	If (PriorityArray[iIndex]>50) && bGSoulGemRevive
		PlayerRef.RemoveItem(GrandFilledGem,(ConfigMenu.fValueGSoulGemSlider As Int),True)
		strRemovedItem = "Grand Soul Gem"
	ElseIf (PriorityArray[iIndex]>40) && (PriorityArray[iIndex]<50) && bArkayMarkRevive
		PlayerRef.RemoveItem(MarkOfArkay,(ConfigMenu.fValueMarkSlider As Int),True)
		strRemovedItem = "Arkay Mark"
	ElseIf (PriorityArray[iIndex]>30) && (PriorityArray[iIndex]<40) && bBSoulGemRevive
		PlayerRef.RemoveItem(BlackFilledGem,(ConfigMenu.fValueBSoulGemSlider As Int),True)
		strRemovedItem = "Black Soul Gem"
	ElseIf (PriorityArray[iIndex]>20) && (PriorityArray[iIndex]<30) && bDragonSoulRevive
		PlayerRef.ModActorValue("DragonSouls", -ConfigMenu.fValueSoulSlider)
		strRemovedItem = "Dragon Soul"
	ElseIf (PriorityArray[iIndex]>10) && (PriorityArray[iIndex]<20) && bSeptimRevive
		PlayerRef.RemoveItem(Gold001,(ConfigMenu.fValueGoldSlider As Int),True)
		strRemovedItem = "Septim"
	EndIf
EndFunction

Function ShowNotification()
	If !ConfigMenu.bIsNotificationEnabled
		return
	EndIf
	Int totalRemainingLives = 0
	SetVars()
	If ( ConfigMenu.bIsRevivalEnabled )
		If !(strRemovedItem == "")
			If (strRemovedItem == "Arkay Mark")
				Debug.Notification("$mrt_MarkofArkay_Notification_ArkayMark_Removed" )
				Debug.Notification( ConfigMenu.fValueMarkSlider As Int )
			ElseIf (strRemovedItem == "Black Soul Gem") 
					Debug.Notification( "$mrt_MarkofArkay_Notification_BSoulGem_Removed"  )
					Debug.Notification( ConfigMenu.fValueBSoulGemSlider As Int )
			ElseIf (strRemovedItem == "Grand Soul Gem")
				Debug.Notification( "$mrt_MarkofArkay_Notification_GSoulGem_Removed" )
				Debug.Notification( ConfigMenu.fValueGSoulGemSlider As Int )
			ElseIf (strRemovedItem == "Dragon Soul")
				Debug.Notification( "$mrt_MarkofArkay_Notification_DragonSoul_Removed" )
				Debug.Notification( ConfigMenu.fValueSoulSlider As Int )
			ElseIf (strRemovedItem == "Septim")
				Debug.Notification( "$mrt_MarkofArkay_Notification_Septim_Removed" )
				Debug.Notification( ConfigMenu.fValueGoldSlider As Int )
			EndIf
		EndIf
		If (bArkayMarkRevive)
			If ConfigMenu.fValueMarkSlider == 0.0
			  return
			Else
				totalRemainingLives += ( iArkayMarkCount / ConfigMenu.fValueMarkSlider ) As Int
			EndIf
		EndIf
		If ( bBSoulGemRevive )
			If ConfigMenu.fValueBSoulGemSlider == 0.0
				return
			Else
				totalRemainingLives += ( iBSoulGemCount / ConfigMenu.fValueBSoulGemSlider ) As Int
			EndIf
		EndIf
		If ( bGSoulGemRevive )
			If ConfigMenu.fValueGSoulGemSlider == 0.0
				return
			Else
				totalRemainingLives += ( iGSoulGemCount / ConfigMenu.fValueGSoulGemSlider ) As Int
			EndIf
		EndIf
		If ( bDragonSoulRevive )
			If ConfigMenu.fValueSoulSlider == 0.0
				return
			Else
				totalRemainingLives += ( fDragonSoulCount / ConfigMenu.fValueSoulSlider ) As Int
			EndIf
		EndIf
		If ( bSeptimRevive )
			If ConfigMenu.fValueGoldSlider == 0.0
				return
			Else
				totalRemainingLives += ( iSeptimCount / ConfigMenu.fValueGoldSlider ) As Int
			EndIf
		EndIf
		If ( totalRemainingLives > 0 )
			Debug.Notification("$mrt_MarkofArkay_Notification_totalRemainingTrades")
			Debug.Notification(totalRemainingLives)
		Else
			Debug.notification("$mrt_MarkofArkay_Notification_NoRemainingTrades")
		EndIf
	EndIf
EndFunction

Bool Function bIsFollower(Actor ActorRef)
	If ActorRef
		Return (ActorRef != PlayerRef) && !ActorRef.IsCommandedActor() && (ActorRef.IsPlayerTeammate() || ActorRef.IsInFaction(PlayerFollowerFaction))
	EndIf
	Return False
Endfunction

Bool Function bCanSteal(Actor ActorRef)
	If ActorRef
		Return (( ActorRef != PlayerRef ) && !ActorRef.IsDead() &&\
		!ActorRef.IsDisabled() && !ActorRef.IsEssential() && !ActorRef.GetActorBase().IsProtected() &&\
		!ActorRef.GetActorBase().IsInvulnerable() && !ActorRef.IsGhost() && !ActorRef.IsCommandedActor() &&\
		!ActorRef.IsGuard() && !ActorRef.HasKeywordString("actortypeanimal") &&\
		(( ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature") && ( ActorRef.GetActorValue("Morality") < 3 )) ||\
		( Configmenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature"))) &&\
		(( ActorRef.GetFactionReaction(PlayerRef) == 1 ) || ActorRef.IsHostileToActor(PlayerRef) || ( ActorRef.GetRelationShipRank(PlayerRef) < 0 ))) &&\
		( ActorRef.HasLOS(PlayerRef) || ( Attacker && ( Attacker == ActorRef )) || ( ActorRef.GetDistance(PlayerRef) <= 100.0 ))
	EndIf
	Return False
Endfunction

Bool Function bIsHostile(Actor ActorRef)
	If ActorRef
		Return (( ActorRef != PlayerRef ) && !ActorRef.IsDead() &&\
		!ActorRef.IsDisabled() && !ActorRef.IsCommandedActor() && !ActorRef.IsGuard() &&\
		!ActorRef.HasKeywordString("actortypeanimal") &&\
		(( ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature")) ||\
		( Configmenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature"))) &&\
		(( Attacker && (Attacker == ActorRef )) || ( ActorRef.GetFactionReaction(PlayerRef) == 1 ) ||\
		ActorRef.IsHostileToActor(PlayerRef) || ( ActorRef.GetRelationShipRank(PlayerRef) < 0 )))
	EndIf
	Return False
Endfunction

Function DetectThiefNPC()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a thief (Phase 0)...")
	If ( LostItemsChest.GetNumItems() > 0 && Thief && !Thief.IsDisabled() && !Thief.GetActorBase().IsInvulnerable() && ( !ConfigMenu.bLoseForever || thief.IsDead() ))
		If ( !bIsHostile(Thief) || PlayerRef.GetDistance(Thief) > 2000 )
			iRemovableItems = 0
		EndIf
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected thief in phase 0: ( '" +\
		Thief.GetActorBase().GetName() + "', "  + Thief + ", " + Thief.GetRace() + ", )" )
		Return
	EndIf
	Thief = None
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a thief (Phase 1)...")
	If moaHostileNPCDetector.IsRunning() && ( HostileActor.GetReference() As Actor ) &&\
	!(( HostileActor.GetReference() As Actor ).IsDead() ) && !(( HostileActor.GetReference() As Actor ).GetActorBase().IsInvulnerable() )
		Thief = HostileActor.GetReference() As Actor
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected thief in phase 1: ( '" +\
		Thief.GetActorBase().GetName() + "', "  + Thief + ", " + Thief.GetRace() + ", )" )
		Return
	Else
		moaHostileNPCDetector.Stop()
		moaHostileNPCDetector.Start()
		If ( HostileActor.GetReference() As Actor ) &&\
		!(( HostileActor.GetReference() As Actor ).IsDead() ) &&\
		!(( HostileActor.GetReference() As Actor ).GetActorBase().IsInvulnerable() )
			Thief = HostileActor.GetReference() As Actor
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected thief in phase 1: ( '" +\
			Thief.GetActorBase().GetName() + "', "  + Thief + ", " + Thief.GetRace() + ", )" )
			Return
		EndIf
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a thief (Phase 2)...")
	Actor RandomActor = Game.FindClosestActorFromRef(PlayerRef,2000)
	If RandomActor
		If bCanSteal(RandomActor)
			Thief = RandomActor
			HostileActor.ForceRefTo(Thief)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected thief in phase 2: ( '" +\
			RandomActor.GetActorBase().GetName() + "', "  + RandomActor + ", " + RandomActor.GetRace() + ", )" )
			Return
		EndIf
		Int i = 0
		While ( i < 15 )
			i += 1
			RandomActor = Game.FindRandomActorFromRef(PlayerRef,2000)
			If RandomActor
				If bCanSteal(RandomActor)
					Thief = RandomActor
					HostileActor.ForceRefTo(Thief)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected thief in phase 2: ( '" +\
					RandomActor.GetActorBase().GetName() + "', "  + RandomActor + ", " + RandomActor.GetRace() + ", )" )
					Return
				EndIf
			EndIf
		EndWhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: No hostile NPC who can steal detected.")
	Else ;No NPC is around the player
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: No NPC is near the player.")
		Return
	EndIf	
Endfunction

Bool Function bIsHostileNPCNearby()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a hostile NPC (Phase 1)...")
	If moaHostileNPCDetector01.IsRunning() && HostileActor01.GetReference() As Actor
		bStealSoul = bStealSoul(HostileActor01.GetReference() As Actor)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkofArkay: Detected hostile NPC in phase 1: ( '" +\
		( HostileActor01.GetReference() As Actor ).GetActorBase().GetName() + "', " + ( HostileActor01.GetReference() As Actor ) +\
		", " + ( HostileActor01.GetReference() As Actor ).GetRace() + ", )" )
		Return True
	Else
		moaHostileNPCDetector01.Stop()
		moaHostileNPCDetector01.Start()
		If HostileActor01.GetReference() As Actor
			bStealSoul = bStealSoul(HostileActor01.GetReference() As Actor)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkofArkay: Detected hostile NPC in phase 1: ( '" +\
			( HostileActor01.GetReference() As Actor ).GetActorBase().GetName() + "', " + ( HostileActor01.GetReference() As Actor ) +\
			", " + ( HostileActor01.GetReference() As Actor ).GetRace() + ", )" )
			Return True
		EndIf
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a hostile NPC (Phase 2)...")
	Actor RandomActor = Game.FindClosestActorFromRef(PlayerRef,2000)
	If RandomActor
		If bIsHostile(RandomActor)
			bStealSoul = bStealSoul(RandomActor)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected hostile NPC in phase 2: ( '" +\
			RandomActor.GetActorBase().GetName() + "', " + RandomActor + ", " + RandomActor.GetRace() + ", )" )
			Return True
		EndIf
		Int i = 0
		While ( i < 15 )
			i += 1
			RandomActor = Game.FindRandomActorFromRef(PlayerRef,2000)
			If RandomActor
				If bIsHostile(RandomActor)
					bStealSoul = bStealSoul(RandomActor)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected hostile NPC in phase 2: ( '" +\
					RandomActor.GetActorBase().GetName() + "', " + RandomActor + ", " + RandomActor.GetRace() + ", )" )
					Return True
				EndIf
			EndIf
		EndWhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: No hostile NPC detected.")
	Else ;No NPC is around the player
		bStealSoul = False
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: No NPC is near the player.")
		Return False
	EndIf
	bStealSoul = False
	Return False
EndFunction

Function DetectFollowers()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detecting followers...")
	moaFollowerDetector.Stop()
	moaFollowerDetector.Start()
	If FollowerArr.Length < 128
		FollowerArr = New Actor[128]
	EndIf
	Int i = FollowerArr.Length
	Int j
	While i > 0
		i -= 1
		If !bIsFollower(FollowerArr[i])
			FollowerArr[i] = None
		EndIf
	Endwhile
	i = iMin(128,Followers.Length)
	Actor follower
	While i > 0
		i -= 1
		Follower = Followers[i].GetReference() As Actor
		If follower 
			If FollowerArr.Find(Follower) < 0
				j = FollowerArr.Find(None)
				If j > -1
					FollowerArr[j] = Follower
				EndIf
			EndIf
		EndIf
	Endwhile
	moaFollowerDetector.Stop()
	i = 0
	Actor RandomActor
	Bool bBreak = False
	While ( i < 15 ) && !bBreak
		i += 1
		RandomActor = Game.FindRandomActorFromRef(PlayerRef,2000)
		If RandomActor
			If FollowerArr.Find(RandomActor) < 0
				If bIsFollower(RandomActor)
					j = FollowerArr.Find(None)
					If j > -1
						FollowerArr[j] = Follower
					EndIf
				EndIf
			EndIf
		Else ;No NPC is around the player
			bBreak = True
		EndIf
	EndWhile	
	If ConfigMenu.bIsLoggingEnabled
		String str = "MarkofArkay: Detected Followers = [ "
		i = FollowerArr.Length
		int count = 0
		While i > 0
			i -= 1
			If FollowerArr[i]
				count += 1
				str += "( '"
				str += FollowerArr[i].GetActorBase().GetName()
				Str += "', "
				str += FollowerArr[i]
				Str += ", "
				str += FollowerArr[i].GetRace()
				str += ", ), "
			EndIf
		Endwhile
		str += "]"
		Debug.Trace(str)
		Debug.Trace("MarkofArkay: Number of detected followers: " + count)
	EndIf
Endfunction

Bool Function FollowerCanProtectPlayer()
	If ( ConfigMenu.bFollowerProtectPlayer && Attacker )
		int i = FollowerArr.Length
		If i > 0 
			Bool bInCombat = False
			While i > 0 && !bInCombat
				i -= 1
				If bIsFollower(FollowerArr[i])
					If ( FollowerArr[i].Is3DLoaded() && !FollowerArr[i].IsDead() && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef) )
						If (( FollowerArr[i].GetCombatState() == 1 ) && ( FollowerArr[i].GetDistance(PlayerRef) <= 3000.0 ))
							bInCombat = True
						ElseIf (( Attacker != FollowerArr[i] ) && ( Attacker.GetDistance(PlayerRef) <= 10000.0 ) && ( Attacker.IsDead() || Attacker.IsBleedingOut() ))
							If ConfigMenu.bIsNotificationEnabled
								Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
							EndIf
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Followers avenged your defeat.")
							Return True
						EndIf
					EndIf
				EndIf
			EndWhile
			If bInCombat
				Utility.Wait(3.0)
				i = FollowerArr.Length
				While i > 0
					i -= 1
					If bIsFollower(FollowerArr[i])
						If ( FollowerArr[i].Is3DLoaded() && !FollowerArr[i].IsDead() && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef) )
							If (( FollowerArr[i].GetCombatState() == 1 ) && ( FollowerArr[i].GetDistance(PlayerRef) <= 3000.0 ))
								If ConfigMenu.bIsNotificationEnabled
									Debug.Notification("$mrt_MarkofArkay_Notification_Follower_In_Combat")
								EndIf
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Followers are still fighting.")
								Return True
							ElseIf ( ( Attacker != FollowerArr[i] ) && ( Attacker.IsDead() || Attacker.IsBleedingOut() ) )
								If ConfigMenu.bIsNotificationEnabled
									Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
								EndIf
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Followers avenged your defeat.")
								Return True
							EndIf
						EndIf
					EndIf
				EndWhile
			EndIf
		EndIf
	EndIf
	Return False
endFunction

Function HoldFollowers()
	If ConfigMenu.bFollowerProtectPlayer
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				If (( !FollowerArr[i].IsDead() ) || ( FollowerArr[i].IsDead() && ConfigMenu.bResurrectActors ))
					If ( FollowerArr[i].IsDead() )
						If ( ConfigMenu.bResurrectActors )
							FollowerArr[i].Resurrect()
						EndIf
					EndIf
					FollowerArr[i].StopCombat()
					FollowerArr[i].StopCombatAlarm()
					FollowerArr[i].DisableNoWait()
					FollowerArr[i].MoveTo(LostItemsChest)
				EndIf
			EndIf
		Endwhile
	EndIf
EndFunction

Function ReleaseFollowers()
	If ConfigMenu.bFollowerProtectPlayer
		Int i = FollowerArr.length
		While i > 0
			i -= 1
			If FollowerArr[i]
				FollowerArr[i].RestoreActorValue("Health",9999)
				FollowerArr[i].MoveToMyEditorLocation()
			EndIf
		Endwhile
	EndIf
EndFunction

Function RespawnFollowers()
	If ConfigMenu.bFollowerProtectPlayer
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				FollowerArr[i].RestoreActorValue("Health",9999)
				FollowerArr[i].MoveTo(PlayerRef)
			EndIf
		Endwhile
	EndIf
Endfunction

Function ResurrectFollowers()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrecting followers ...")
	Int i = FollowerArr.Length
	While i > 0
		i -= 1
		If FollowerArr[i]
			If ( FollowerArr[i].IsDead() )
				FollowerArr[i].Resurrect()
			Else
				FollowerArr[i].RestoreActorValue("Health",9999)
			EndIf
		EndIf
	Endwhile
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrecting followers finished.")
Endfunction

Function ToggleFollower(Bool bEnable)
	If ConfigMenu.bFollowerProtectPlayer
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				If bEnable
					FollowerArr[i].Enable()
					If FollowerArr[i].IsDead()
						 FollowerArr[i].Resurrect()
					EndIf
					FollowerArr[i].EvaluatePackage()
					FollowerArr[i].RestoreActorValue("Health",9999)
				Else
					FollowerArr[i].Disable()
				EndIf
			EndIf
		Endwhile
	EndIf
Endfunction

Function RevivePlayer(Bool bRevive)
	If bRevive
		If ConfigMenu.bShiftBack
			ShiftBack()
			If ConfigMenu.bIsEffectEnabled
				BleedoutProtection.Cast(PlayerRef)
			EndIf
		EndIf
		PlayerRef.ResetHealthAndLimbs()
		PlayerRef.RestoreActorValue("Health",9999)
		Debug.SetGodMode(False)
		If !bHasAutoReviveEffect
			PlayerRef.DispelSpell(ArkayCurseTemp)
			PlayerRef.DispelSpell(ArkayCurseTempAlt)
			If ( PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
				PlayerRef.RemoveSpell(ArkayCurse)
				PlayerRef.RemoveSpell(ArkayCurseAlt)
				If !bIsItemsRemoved
					If moaSoulMark01.IsRunning()
						moaSoulMark01.Stop()
						LostItemsMarker.MoveToMyEditorLocation()
						LostItemsMarker.Disable()
					EndIf
					If moaRetrieveLostItems.IsRunning()
						moaRetrieveLostItems.SetStage(20)
					EndIf
					If moaRetrieveLostItems01.IsRunning()
						moaRetrieveLostItems01.SetStage(20)
					EndIf
					If moaThiefNPC01.IsRunning()
						If ( ThiefNPC.GetReference() As Actor )
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
						EndIf
						moaThiefNPC01.Stop()
					EndIf
					If Thief
						RemoveStolenItemMarkers(Thief)
						Thief.RemoveFromFaction(PlayerEnemyFaction)
					EndIf
					RemoveStolenItemMarkers(playerRef)
				EndIf
			EndIf
		EndIf
		If Configmenu.bFollowerProtectPlayer
			ResurrectFollowers()
		EndIf
		If ( moaThiefNPC01.IsRunning() )			
			If ( ThiefNPC.GetReference() As Actor ) 
				AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
				(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
			EndIf
		EndIf
		Attacker = None
		Game.EnablePlayerControls()
		Game.EnableFastTravel(True)
		ToggleSaving(True)
		moaBleedoutHandlerState.SetValue(0)
		LowHealthImod.Remove()
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Player is revived.")
		GoToState("")
	Else
		If FollowerCanProtectPlayer()
			Attacker = None
			PlayerRef.ResetHealthAndLimbs()
			Utility.Wait(0.5)
			Float fOldHP = PlayerRef.GetActorValue("Health")
			Float fNewHP = fMax( 60.0, ((PlayerRef.GetBaseActorValue("Health") * 0.5) + 10.0 ))
			If fOldHP > fNewHP
				PlayerRef.DamageActorValue("Health",fOldHP - fNewHP)
			Else
				PlayerRef.RestoreActorValue("Health",fNewHP - fOldHP)
			EndIf
			Debug.SetGodMode(False)
			If ConfigMenu.iRevivesByFollower < 99999999
				ConfigMenu.iRevivesByFollower += 1
			EndIf
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Game.EnablePlayerControls()
			Game.EnableFastTravel(True)
			ToggleSaving(True)
			moaBleedoutHandlerState.SetValue(0)
			LowHealthImod.Remove()
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Player is alive because of followers.")
			GoToState("")
		Else
			HoldFollowers()
			If ( ConfigMenu.iNotTradingAftermath == 0 ) || ( ConfigMenu.iNotTradingAftermath == 1 && !bCanTeleport() )
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Player is dying...")
				Attacker = None
				If !ConfigMenu.bIsEffectEnabled
					Debug.SetGodMode(False)
				EndIf
				PlayerRef.DispelAllSpells()
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				PlayerRef.SetActorValue("Paralysis",1)
				PlayerRef.PushActorAway(PlayerRef,0)
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				PlayerRef.GetActorBase().SetEssential(False)
				PlayerRef.Kill()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Player died.")
				GoToState("")
			ElseIf ( ConfigMenu.iNotTradingAftermath == 1)
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Respawning the player...")
				Game.DisablePlayerControls()
				Debug.SetGodMode(True)
				If ConfigMenu.bIsEffectEnabled
					PlayerRef.DispelSpell(BleedoutProtection)
				EndIf
				If ConfigMenu.bShiftBackRespawn
					ShiftBack()
				EndIf
				If ( !bWasSwimming && bIsConditionSafe )
					If ( ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack )
							PlayerRef.ResetHealthAndLimbs()
							PlayerRef.PushActorAway(PlayerRef,0)
							Utility.Wait(0.1)
							PlayerRef.Say(DeathTopic)
							Game.ForceThirdPerson()
						If ConfigMenu.bFadeToBlack
							FastFadeOut.Apply()
							Utility.Wait(1.0)
							FastFadeOut.PopTo(BlackScreen)
						Else
							Utility.Wait(1.0)
						EndIf
						If ConfigMenu.bInvisibility
							PlayerRef.SetAlpha(0.0)
						EndIf
					EndIf
				Else
					Game.ForceThirdPerson()
					If ConfigMenu.bInvisibility
						PlayerRef.SetAlpha(0.0)
					EndIf
					If ConfigMenu.bFadeToBlack
						FastFadeOut.Apply()
						Utility.Wait(1.0)
						FastFadeOut.PopTo(BlackScreen)
					EndIf
				EndIf
				iRemovableItems = ConfigMenu.iRemovableItems
				If ( ConfigMenu.bNPCStealItems ) 
					If moaSoulMark01.IsRunning()
						If (( ConfigMenu.bLoseForever && ( ConfigMenu.iRemovableItems != 0 )) &&\
						(( !Configmenu.bArkayCurse || Configmenu.bIsArkayCurseTemporary ) && !PlayerRef.HasSpell(ArkayCurse) && !PlayerRef.HasSpell(ArkayCurseAlt) ))
							moaSoulMark01.Stop()
							LostItemsMarker.MoveToMyEditorLocation()
							LostItemsMarker.Disable()
							If moaRetrieveLostItems.IsRunning()
								moaRetrieveLostItems.SetStage(20)
							EndIf
							If moaRetrieveLostItems01.IsRunning()
								moaRetrieveLostItems01.SetStage(20)
							EndIf
						EndIf
					EndIf
					If ( !moaSoulMark01.IsRunning() )
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a hostile NPC who can steal from player ...")
						DetectThiefNPC()
						If Thief
							If ( Thief != ( HostileActor.GetReference() As Actor ))
								ThiefNPC.ForceRefTo(Thief)
							EndIf
							bStealSoul = bStealSoul(Thief)
							If !moaThiefNPC01.IsRunning()
								moaThiefNPC01.Start()
								AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
								(ThiefNPC.GetReference() As Actor).AddToFaction(PlayerEnemyFaction)
							EndIf
						Else
							If moaThiefNPC01.IsRunning()
								RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
								(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
								moaThiefNPC01.Stop()
							EndIf
							bStealSoul = False
						EndIf
					EndIf
				ElseIf ( moaThiefNPC01.IsRunning() )
					If (( ConfigMenu.bLoseForever && ( ConfigMenu.iRemovableItems != 0 )) ||\
						(( LostItemsChest.GetNumItems() == 0 ) && ( fLostSouls == 0.0 )))
						If (ThiefNPC.GetReference() As Actor)
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
							moaThiefNPC01.Stop()
						EndIf
						If Thief
							RemoveStolenItemMarkers(Thief)
							Thief.RemoveFromFaction(PlayerEnemyFaction)
						EndIf
						RemoveStolenItemMarkers(PlayerRef)
						If moaRetrieveLostItems.IsRunning()
							moaRetrieveLostItems.SetStage(20)
						EndIf
						If moaRetrieveLostItems01.IsRunning()
							moaRetrieveLostItems01.SetStage(20)
						EndIf
						Thief = None
						bStealSoul = False
					EndIf
				EndIf
				If bStealSoul
					If ( !ConfigMenu.bHostileNPC && !Configmenu.bNPCStealItems && !moaThiefNPC01.IsRunning() && !moaSoulMark01.IsRunning() )
						bStealSoul = False
					EndIf
				EndIf
				bSoulMark = bSoulMark()
				If ( bInBeastForm() || ( ConfigMenu.bNPCStealItems && ( moaSoulMark01.IsRunning() || !moaThiefNPC01.IsRunning() )) ||\
				( ConfigMenu.bHostileNPC && ( moaThiefNPC01.IsRunning() || !bIsHostileNPCNearby() )) || ( PlayerRef.GetParentCell() == DefaultCell ))
					iRemovableItems = 0
				EndIf
				If (iRemovableItems != 0)
					If bStealSoul
						If (( iRemovableItems == 3 ) || ( iRemovableItems == 4 ))
							iRemovableItems = 0
						Else
							iRemovableItems = 1
						EndIf
					EndIf
				EndIf
				If ( iRemovableItems == 9 ) ;random
					iRemovableItems = Utility.RandomInt(0,5)
				ElseIf ( iRemovableItems == 8 ) ; Random but not everything or nothing
					iRemovableItems = Utility.RandomInt(1,4)
				ElseIf ( iRemovableItems == 7 ) ;Random but lose something
					iRemovableItems = Utility.RandomInt(1,5)
				ElseIf ( iRemovableItems == 6 ) ;Random but not everything
					iRemovableItems = Utility.RandomInt(0,4)
				EndIf
				If ConfigMenu.bLoseForever && (ConfigMenu.iRemovableItems != 0)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Destroying previously lost items...")
					If ( ( LostItemsChest.GetNumItems() > 0 ) || ( fLostSouls > 0.0 ) )
						bDidItemsRemoved = True
						If ConfigMenu.iDestroyedItems < 99999999
							ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
							If fLostSouls > 0.0
								ConfigMenu.iDestroyedItems += 1
							EndIf
						EndIf
					Else
						bDidItemsRemoved = False
					EndIf
					LostItemsChest.RemoveAllItems()
					fLostSouls = 0.0
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: previously lost items are destroyed.")
				EndIf
				If iRemovableItems != 0
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Removing items from the player...")
					Equipment = New Form[34]
					EquippedQuestItems = New Form[34]
					If iRemovableItems == 1 ;Tradable Items
						RemoveTradbleItems(PlayerRef,True)
					ElseIf iRemovableItems == 2 ;Unequipped Items and Tradables
						RemoveTradbleItems(PlayerRef)
						RemoveUnequippedItems(PlayerRef)
					ElseIf iRemovableItems == 3 ; unequipped but not tradables
						iSeptimCount = PlayerRef.GetItemCount(Gold001)
						iArkayMarkCount = PlayerRef.GetItemCount(MarkOfArkay) 
						iBSoulGemCount = PlayerRef.GetItemCount(BlackFilledGem)
						iGSoulGemCount = PlayerRef.GetItemCount(GrandFilledGem)
						fDragonSoulCount = PlayerRef.GetActorValue("DragonSouls")
						RemoveUnequippedItems(PlayerRef)
						If ( iSeptimCount > 0 ) && ConfigMenu.bIsGoldEnabled
							LostItemsChest.RemoveItem(Gold001, iSeptimCount, True, PlayerRef)
						EndIf
						If ( iBSoulGemCount > 0 ) && ConfigMenu.bIsBSoulGemEnabled
							LostItemsChest.RemoveItem(BlackFilledGem, iBSoulGemCount, True, PlayerRef)
						EndIf
						If ( iGSoulGemCount > 0 ) && ConfigMenu.bIsGSoulGemEnabled
							LostItemsChest.RemoveItem(GrandFilledGem, iGSoulGemCount, True, PlayerRef)
						EndIf
						If ( iArkayMarkCount > 0 ) && ConfigMenu.bIsMarkEnabled
							LostItemsChest.RemoveItem(MarkOfArkay, iArkayMarkCount, True, PlayerRef)
						EndIf
						If (( fDragonSoulCount > 0 ) && !ConfigMenu.bIsDragonSoulEnabled && bSoulmark )
							PlayerRef.ModActorValue("DragonSouls", -fDragonSoulCount)
							fLostSouls += fDragonSoulCount
						EndIf
					ElseIf iRemovableItems == 4  ; Everything except tradables
						iSeptimCount = PlayerRef.GetItemCount(Gold001)
						iArkayMarkCount = PlayerRef.GetItemCount(MarkOfArkay) 
						iBSoulGemCount = PlayerRef.GetItemCount(BlackFilledGem)
						iGSoulGemCount = PlayerRef.GetItemCount(GrandFilledGem)
						fDragonSoulCount = PlayerRef.GetActorValue("DragonSouls")
						PlayerRef.RemoveAllItems(LostItemsChest, True)
						TransferItemsByType(LostItemsChest,PlayerRef As ObjectReference,45,"zzzmoa_ignoreitem") ;Return Keys
						If ( iSeptimCount > 0 ) && ConfigMenu.bIsGoldEnabled
							LostItemsChest.RemoveItem(Gold001, iSeptimCount, True, PlayerRef)
						EndIf
						If ( iBSoulGemCount > 0 ) && ConfigMenu.bIsBSoulGemEnabled
							LostItemsChest.RemoveItem(BlackFilledGem, iBSoulGemCount, True, PlayerRef)
						EndIf
						If ( iGSoulGemCount > 0 ) && ConfigMenu.bIsGSoulGemEnabled
							LostItemsChest.RemoveItem(GrandFilledGem, iGSoulGemCount, True, PlayerRef)
						EndIf
						If ( iArkayMarkCount > 0 ) && ConfigMenu.bIsMarkEnabled
							LostItemsChest.RemoveItem(MarkOfArkay, iArkayMarkCount, True, PlayerRef)
						EndIf
						If (( fDragonSoulCount > 0 ) && !ConfigMenu.bIsDragonSoulEnabled && bSoulmark )
							PlayerRef.ModActorValue("DragonSouls", -fDragonSoulCount)
							fLostSouls += fDragonSoulCount
						EndIf
					ElseIf iRemovableItems == 5 ;Everything
						RemoveTradbleItems(PlayerRef)
						PlayerRef.RemoveAllItems(LostItemsChest, True)
						TransferItemsByType(LostItemsChest,PlayerRef As ObjectReference,45,"zzzmoa_ignoreitem") ;Return Keys
					ElseIf iRemovableItems == 10 ;Valuable
						RemoveValuableItems(PlayerRef)
					ElseIf iRemovableItems == 11 ;Valuables
						RemoveValuableItemsGreedy(PlayerRef)
					EndIf
					If ( ConfigMenu.iRemovableItems == 7 ) ;Remove All if nothing is removed
						If (( iRemovableItems != 5 ) && ( LostItemsChest.GetNumItems() == 0 ) && ( fLostSouls == 0 ))
							PlayerRef.RemoveAllItems(LostItemsChest, True)
							TransferInvalidItems(LostItemsChest,PlayerRef As ObjectReference)
						EndIf
					EndIf
					bIsItemsRemoved = True 
					If ConfigMenu.bIsLoggingEnabled 
						Debug.Trace("MarkofArkay: Removing items from the player finished.")
						Int c = LostItemsChest.GetNumItems()
						string str = "MarkofArkay: Currently removed items -> "
						If fLostSouls > 0.0
							c += 1
							str += c
							str += "("
							str += (c - 1)
						Else
							str += c
							str += "("
							str += c
						EndIf
						str += " + "
						str += (fLostSouls As Int)
						str += " dragon souls)"
						Debug.Trace(str)
					EndIf
				EndIf
				If ( PlayerRef.GetParentCell() != DefaultCell )
					If ((( LostItemsChest.GetNumItems() > 0 ) || ( fLostSouls > 0.0 )) || PlayerRef.HasSpell(ArkayCurse) ||\
					PlayerRef.HasSpell(ArkayCurseAlt) || ( Configmenu.bArkayCurse && !Configmenu.bIsArkayCurseTemporary ))
						If ( bSoulMark || ((( ConfigMenu.bArkayCurse && !Configmenu.bIsArkayCurseTemporary ) ||\
						PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) ) && !moaThiefNPC01.IsRunning() ))
							LostItemsMarker.Enable()
							If ( !ConfigMenu.bSoulMarkStay || ( LostItemsMarker.GetParentCell() == DefaultCell ) )
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Moving soul mark to player's location...")
								LostItemsMarker.MoveTo( PlayerRef, 0, 0, 42 )
								moaSoulMark01.Start()
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Soul mark dropped at ( " +\
								LostItemsMarker.GetPositionx() + ", " + LostItemsMarker.GetPositiony() + ", " + LostItemsMarker.GetPositionz()+" ).")
								If Thief
									RemoveStolenItemMarkers(Thief)
									Thief.RemoveFromFaction(PlayerEnemyFaction)
								EndIf
								RemoveStolenItemMarkers(PlayerRef)
							EndIf
						EndIf
					Else
						moaSoulMark01.Stop()
						LostItemsMarker.MoveToMyEditorLocation()
						LostItemsMarker.Disable()
						If (ThiefNPC.GetReference() As Actor)
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
							moaThiefNPC01.Stop()
						EndIf
					EndIf
				EndIf
				If ConfigMenu.bResurrectActors
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Resurrecting non-unique actors in player's location...")
					If Attacker 
						If ( !Attacker.IsCommandedActor() && !Attacker.GetActorBase().IsUnique() && !Attacker.IsDisabled() && Attacker.IsDead() )
							If (( Attacker.GetParentCell() == PlayerRef.GetParentCell() ) || PlayerRef.GetDistance(Attacker) < 10000.0 )
								Attacker.Resurrect()
							EndIf
						EndIf
					EndIf
					ResurrectFollowers()
					MassRevival.Cast(PlayerRef)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Resurrection finished.")
				EndIf
				If ConfigMenu.bHealActors
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Healing actors in player's location...")
					If Attacker && !Attacker.IsDead()
						If (( Attacker.GetParentCell() == PlayerRef.GetParentCell() ) || PlayerRef.GetDistance(Attacker) < 10000.0 )
							If Attacker.GetActorValue("Health") > 0
								Attacker.RestoreActorValue("Health",999999)
							EndIf
						EndIf
					EndIf
					MassHealing.Cast(PlayerRef)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Last attacker and other actors are healed.")
				EndIf
				Utility.Wait(1.0)
				If ( ConfigMenu.bSendToJail && !bInBeastForm() && bGuardCanSendToJail() )
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Sending Player to jail...")
					Faction CrimeFaction = Guard.GetCrimeFaction()
					If ( CrimeFaction )
						If ( CrimeFaction == CrimeFactionPale )
							bIsArrived(DawnstarJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionFalkreath )
							bIsArrived(FalkreathJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionHjaalmarch )
							bIsArrived(MorthalJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionHaafingar )
							bIsArrived(SolitudeJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionRift )
							bIsArrived(RiftenJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionWhiterun )
							bIsArrived(WhiterunJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionEastmarch )
							bIsArrived(WindhelmJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionWinterhold )
							bIsArrived(WinterholdJailMarker)
						ElseIf ( CrimeFaction == CrimeFactionReach )
							bIsArrived(MarkarthJailMarker)
							bCidhnaJail = True
						;ElseIf ( CrimeFaction == DLC2CrimeRavenRockFaction )
						;	bIsArrived(DLC2RavenRockJailMarker)
						EndIf
						ReleaseFollowers()
						Utility.Wait(0.5)
						CrimeFaction.SendPlayerToJail( abRemoveInventory = True, abRealJail = True )
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is jailed")
					Else
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
						Teleport()
						RespawnFollowers()
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
					EndIf
				Else
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleporting...")
					Teleport()
					RespawnFollowers()
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Teleportion finished.")
				EndIf
				Utility.Wait(0.5)
				Attacker = None
				ResetPlayer()
				RequipSpells()
				If ( ConfigMenu.bFadeToBlack || Configmenu.bInvisibility )
					Utility.Wait(5.0)
				EndIf
				PlayerRef.SetAlpha(1.0,True)
				ToggleFollower(True)
				Utility.Wait(1.0)
				RefreshFace()
				If ( ConfigMenu.bRespawnNaked && !bInBeastForm() )
					PlayerRef.UnequipAll()
				EndIf
				If (( ConfigMenu.bArkayCurse && !Configmenu.bIsArkayCurseTemporary ) &&\
				( moaThiefNPC01.IsRunning() || ( moaSoulMark01.IsRunning() )))
					PlayerRef.DispelSpell(ArkayCurseTemp)
					PlayerRef.DispelSpell(ArkayCurseTempAlt)
					If ConfigMenu.iArkayCurse == 0
						PlayerRef.AddSpell(ArkayCurse)
					ElseIf ConfigMenu.iArkayCurse == 1
						PlayerRef.AddSpell(ArkayCurseAlt)
					Else
						PlayerRef.AddSpell(ArkayCurse)
						PlayerRef.AddSpell(ArkayCurseAlt)
					EndIf
				ElseIf (( ConfigMenu.bArkayCurse && Configmenu.bIsArkayCurseTemporary ) &&\
				( !PlayerRef.HasSpell(ArkayCurse) && !PlayerRef.HasSpell(ArkayCurseAlt)))
					If ConfigMenu.iArkayCurse == 0
						ArkayCurseTemp.Cast(PlayerRef)
					ElseIf ConfigMenu.iArkayCurse == 1
						ArkayCurseTempAlt.Cast(PlayerRef)
					Else
						ArkayCurseTemp.Cast(PlayerRef)
						ArkayCurseTempAlt.Cast(PlayerRef)
					EndIf
				EndIf
				If ConfigMenu.bFadeToBlack
					BlackScreen.PopTo(FadeIn)
				EndIf
				If ( ConfigMenu.bLoseForever && bDidItemsRemoved )
					If  moaRetrieveLostItems.IsRunning()
						moaRetrieveLostItems.SetStage(10)
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Soul Mark Quest Failed.")
					EndIf
					If moaRetrieveLostItems01.IsRunning()
						moaRetrieveLostItems01.SetStage(10)	
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Stolen Items Quest Failed.")
					EndIf
					If PreviousThief
						If ( !moaThiefNPC01.IsRunning() || ( PreviousThief != Thief ))
							RemoveStolenItemMarkers(PreviousThief)
							PreviousThief.RemoveFromFaction(PlayerEnemyFaction)
						EndIf
					EndIf
					RemoveStolenItemMarkers(PlayerRef)
					Utility.Wait(0.5)
				EndIf
				If ConfigMenu.bLostItemQuest
					If  (( bIsItemsRemoved && (( LostItemsChest.GetNumItems() > 0 ) || ( fLostSouls > 0.0 ))) ||\
					PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
						If moaSoulMark01.IsRunning()
							moaRetrieveLostItems.Start()
							moaRetrieveLostItems.SetStage(1)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Soul Mark Quest Started.")
						ElseIf moaThiefNPC01.IsRunning()
							moaRetrieveLostItems01.Start()
							moaRetrieveLostItems01.SetStage(1)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Stolen Items Quest Started.")
						EndIf
					EndIf
				EndIf
				If ( moaThiefNPC01.IsRunning() )			
					If ( ThiefNPC.GetReference() As Actor ) 
						AddStolenItemMarker(ThiefNPC.GetReference() As Actor)
						(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
					EndIf
				EndIf
				moaHostileNPCDetector.Stop()
				moaHostileNPCDetector01.Stop()
				Debug.SetGodMode(False)
				If !bIsCameraStateSafe()
					Game.ForceThirdPerson()
				EndIf
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				PlayerRef.StopCombatAlarm()
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				If bCidhnaJail 
					If ( PlayerRef.GetParentCell() == MarkarthJailMarker.GetParentCell() )
						If !CidhnaMineJailEventScene.GetStageDone(10)
							CidhnaMineJailEventScene.SetStage(10)
						EndIf
					EndIf
					bCidhnaJail = False
				EndIf
				If ConfigMenu.iTotalRespawn < 99999999
					ConfigMenu.iTotalRespawn += 1
				EndIf
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn finished.")
				GoToState("")
			Else
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Exiting to the Main menu...")
				Debug.SetGodMode(False)
				Game.EnablePlayerControls()
				Game.EnableFastTravel(True)
				Attacker = None
				ToggleSaving(True)
				moaBleedoutHandlerState.SetValue(0)
				LowHealthImod.Remove()
				GoToState("")
				Game.QuitToMainMenu()
			EndIf
		EndIf
	EndIf
EndFunction

Function RequipSpells()
	If ( LeftHandEquippedItem As Spell )
		PlayerRef.UnequipSpell((LeftHandEquippedItem As spell), 0)
		PlayerRef.EquipSpell((LeftHandEquippedItem As spell), 0)
	EndIf
	If ( RightHandEquipedItem As Spell )
		PlayerRef.UnequipSpell((RightHandEquipedItem As spell), 1)
		PlayerRef.EquipSpell((RightHandEquipedItem As spell), 1)
	EndIf
EndFunction

Bool Function bIsConditionSafe()
	ConfigMenu.bIsLoggingEnabled && LogCurrentState()
	Return !( WerewolfQuest.IsRunning() || \
	PlayerRef.GetActorValue("paralysis") || \
	PlayerRef.GetAnimationVariableBool("bIsSynced") || \
	PlayerRef.GetAnimationVariableBool("IsStaggering"))
EndFunction

Function SetVars()
	iSeptimCount = PlayerRef.GetItemCount(Gold001)
	fDragonSoulCount = PlayerRef.GetActorValue("DragonSouls")
	iArkayMarkCount = PlayerRef.GetItemCount(MarkOfArkay) 
	iBSoulGemCount = PlayerRef.GetItemCount(BlackFilledGem)
	iGSoulGemCount = PlayerRef.GetItemCount(GrandFilledGem)
	bSeptimRevive = ((iSeptimCount >= ConfigMenu.fValueGoldSlider ) && ConfigMenu.bIsGoldEnabled)
	bDragonSoulRevive = ((fDragonSoulCount >= ConfigMenu.fValueSoulSlider) && ConfigMenu.bIsDragonSoulEnabled)
	bBSoulGemRevive = ((iBSoulGemCount >= ConfigMenu.fValueBSoulGemSlider) && ConfigMenu.bIsBSoulGemEnabled) 
	bGSoulGemRevive = ((iGSoulGemCount >= ConfigMenu.fValueGSoulGemSlider) && ConfigMenu.bIsGSoulGemEnabled) 
	bArkayMarkRevive = ((iArkayMarkCount >= ConfigMenu.fValueMarkSlider) && ConfigMenu.bIsMarkEnabled)
	bPotionRevive = ConfigMenu.bIsPotionEnabled
	fRPMinDistance = ConfigMenu.fRPMinDistanceSlider
	If VItemArr.Length != 20
		VItemArr = New Form[20]
	EndIf
	If (bArkayMarkRevive)
		moaArkayMarkRevive.SetValue(1)
	Else
		moaArkayMarkRevive.SetValue(0)
	EndIf
	
	If (bDragonSoulRevive)
		moaDragonSoulRevive.SetValue(1)
	Else
		moaDragonSoulRevive.SetValue(0)
	EndIf
	
	If (bBSoulGemRevive)
		moaBSoulGemRevive.SetValue(1)
	Else
		moaBSoulGemRevive.SetValue(0)
	EndIf
	
	If (bGSoulGemRevive)
		moaGSoulGemRevive.SetValue(1)
	Else
		moaGSoulGemRevive.SetValue(0)
	EndIf
	
	If (bSeptimRevive)
		moaSeptimRevive.SetValue(1)
	Else
		moaSeptimRevive.SetValue(0)
	EndIf
	
	If (!PlayerRef.IsBleedingOut() && GetState() == "")
		LeftHandEquippedItem = PlayerRef.GetEquippedObject(0)
		RightHandEquipedItem = PlayerRef.GetEquippedObject(1)
	EndIf
EndFunction

Function SetGameVars()
	bSKSEOK = bCheckSKSE()
	If (moaState.GetValue() == 1 )
		If !PlayerRef.IsEssential()
			PlayerRef.GetActorBase().SetEssential(True)
			PlayerRef.SetNoBleedoutRecovery(True)
		EndIf
		ConfigMenu.ToggleFallDamage(ConfigMenu.bIsNoFallDamageEnabled) ;SKSE
	Else
		ConfigMenu.ToggleFallDamage(False)
	EndIf
EndFunction

Bool Function bIsRevivable() ;if player can be revived by trading
	If ( bArkayMarkRevive || bBSoulGemRevive || bGSoulGemRevive || bDragonSoulRevive || bSeptimRevive )
		If ConfigMenu.bIsRevivalRequiresBlessing
			If ( PlayerRef.HasMagicEffect(FortifyHealthFFSelf) || bIsEquipedFromFormlist(ArkayAmulets) );player has magiceffect from a shrine of arkay or wearing one of 2 amulets of arkay
				Return True
			Else
				Return False
			EndIf
		Else
			Return True
		EndIf
	Else
		Return False
	EndIf
EndFunction

Bool Function bIsEquipedFromFormlist(FormList ItemList)
	Int iIndex = ItemList.GetSize()
	While iIndex > 0
		iIndex -= 1
		If ItemList.GetAt(iIndex)
			If PlayerRef.IsEquipped(ItemList.GetAt(iIndex))
				Return True
			EndIf
		EndIf
	EndWhile
	Return False
EndFunction

Int Function iGetRandomWithExclusion( Int iFrom, Int iTo, Int iExclude)
	If ( iExclude > iTo ) || ( iExclude < iFrom )
		Return Utility.RandomInt(iFrom, iTo)
	EndIf
	Int iRandom = Utility.RandomInt(iFrom, iTo - 1)
	If iRandom >= iExclude
		iRandom += 1
	EndIf
	Return iRandom
EndFunction

Int Function iGetRandomWithExclusionArray( Int iFrom, Int iTo, Bool[] iFlagArray) 
	Int ExcludeCount = 0
	int iIndex = 0
	Int iRandom = 0
	While iIndex < iFlagArray.Length
		If (!iFlagArray[iIndex] || bIsCurrentCell(iIndex))
			ExcludeCount += 1
		EndIf
		iIndex += 1
	Endwhile
	iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = 0 
	 While (iIndex < iFlagArray.Length)
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (!iFlagArray[iIndex] || bIsCurrentCell(iIndex) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Function PassTime(Float fGameHours,Float fRealSecs)
	If ConfigMenu.fRespawnTimeSlider > 0.0
		DefaultTimeScale = TimeScale.GetValue()
		TimeScale.SetValue( (3600.0 / fRealSecs) * fGameHours )
		Utility.Wait(fRealSecs)
		TimeScale.SetValue(DefaultTimeScale)
		PlayerRef.StopCombatalarm()
	Else
		Utility.Wait(fRealSecs)
	EndIf
EndFunction

Bool Function bIsCameraStateSafe()
	Int CameraState = game.GetCameraState()
	Return (( CameraState == 0 ) || ( CameraState == 9 ) || ( CameraState == 11 ))
EndFunction

Bool Function bIsTeleportSafe()
	ConfigMenu.bIsLoggingEnabled && LogCurrentState()
	Return !(PlayerRef.GetActorValue("paralysis") || \
	PlayerRef.GetAnimationVariableBool("bIsSynced") || \
	PlayerRef.GetAnimationVariableBool("IsStaggering"))
EndFunction

Bool Function bIsArrived(ObjectReference Marker)
	PlayerRef.DispelAllSpells()
	If ( PlayerRef.IsBleedingOut() || ( PlayerRef.GetActorValue("Health") < PlayerRef.GetBaseActorValue("Health") ))
		PlayerRef.ResetHealthAndLimbs()
		PlayerRef.RestoreActorValue("Health",9999)
	EndIf
	If !bIsCameraStateSafe()
		Game.ForceThirdPerson()
	EndIf
	If !bIsTeleportSafe()
		If (PlayerRef.GetActorValue("paralysis"))
			PlayerRef.SetActorValue("paralysis",0)
		EndIf
		Float i = 5.0
		While ( !bIsTeleportSafe() && ( i > 0.0 ))
			Utility.Wait(0.2)
			i -= 0.2
		Endwhile
	EndIf
	PlayerRef.MoveTo(Marker)
	Utility.Wait(0.5)
	If (PlayerRef.GetDistance(Marker) <= 500.0)
		If (PlayerRef.GetDistance(PlayerMarker) >= (fRPMinDistance - 500.0))
			Return True
		EndIf
	EndIf
	Return False
EndFunction

Bool Function bSoulMark()
	Return (( ConfigMenu.bNPCStealItems && moaSoulMark01.IsRunning() ) ||\
	( !ConfigMenu.bNPCStealItems && !moaThiefNPC01.IsRunning() ))
Endfunction

Function RemoveStolenItemMarkers(Actor ActorRef)
	ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent = True)
	ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent = True)
EndFunction

Function AddStolenItemMarker(Actor ActorRef)
	If ActorRef
		If bStealSoul(ActorRef)
			If !ActorRef.GetItemCount(StolenSoulsMisc )
				ActorRef.AddItem(StolenSoulsMisc)
			EndIf
		Else
			If !ActorRef.GetItemCount(StolenItemsMisc )
				ActorRef.AddItem(StolenItemsMisc)
			EndIf
		EndIf
	EndIf
EndFunction

Bool Function bStealSoul(Actor ActorRef)
	If ActorRef
		Return (ActorRef.HasKeywordString("actortypedragon") || ActorRef.HasKeywordString("actortypeghost"))
	EndIf
	Return False
EndFunction

Function Teleport()
	Int iTeleportLocation = ConfigMenu.iTeleportLocation
	Int iExternalIndex = ConfigMenu.iExternalIndex
	If ( ConfigMenu.bRespawnMenu )
		moaERPCount.SetValue(ExternalMarkerList.GetSize())
		iTeleportLocation = RespawnMenu()
		If (( iTeleportLocation == -1 ) || ( iTeleportLocation > ( ConfigMenu.sRespawnPoints.Length - 1 )))
			If ( iTeleportLocation == -1 )
				iExternalIndex = iTeleportLocation
			Else
				iExternalIndex = ( iTeleportLocation - ( ConfigMenu.sRespawnPoints.Length ))
			EndIf
			iTeleportLocation = ( ConfigMenu.sRespawnPoints.Length - 2 )
		EndIf
	EndIf
	PlayerMarker.Enable()
	PlayerMarker.MoveTo(playerRef)
	PlayerMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
	PlayerMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
	If (iTeleportLocation < (ConfigMenu.sRespawnPoints.Length - 5))
		If (PlayerRef.GetDistance(MarkerList.GetAt(iTeleportLocation) As Objectreference) >= fRPMinDistance)
			If !bIsArrived(MarkerList.GetAt(iTeleportLocation) As Objectreference)
				SendToAnotherLocation()
			EndIf 
		Else
			 SendToAnotherLocation()
		EndIf
	ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 5))
		RandomTeleport()
	ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 4))
		If ( bCanTeleportToDynMarker(SleepMarker) && (PlayerRef.GetDistance(SleepMarker) >= fRPMinDistance))
			If !bIsArrived(SleepMarker)
				If ( bCanTeleportToDynMarker(CustomMarker) && ( CustomMarker.GetDistance(PlayerMarker) >= fRPMinDistance ) )
					If !bIsArrived(CustomMarker)
						SendToAnotherLocation()
					EndIf
				Else
					SendToAnotherLocation()
				EndIf
			EndIf
		ElseIf ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance ) && bCanTeleportToDynMarker(CustomMarker) )
			If !bIsArrived(CustomMarker)
				SendToAnotherLocation()
			EndIf	
		Else
			 SendToAnotherLocation()
		EndIf
	ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 3))
		If ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance) && bCanTeleportToDynMarker(CustomMarker))
			If !bIsArrived(CustomMarker)
				If (bCanTeleportToDynMarker(SleepMarker) && ( SleepMarker.GetDistance(PlayerMarker) >= fRPMinDistance ))
					If !bIsArrived(SleepMarker)
						SendToAnotherLocation()
					EndIf
				Else
					SendToAnotherLocation()
				EndIf
			EndIf
		ElseIf (bCanTeleportToDynMarker(SleepMarker) && (PlayerRef.GetDistance(SleepMarker) >= fRPMinDistance))
			If !bIsArrived(SleepMarker)
				SendToAnotherLocation()
			EndIf
		Else
			 SendToAnotherLocation()
		EndIf
	ElseIf (iTeleportLocation == (ConfigMenu.sRespawnPoints.Length - 2))
		If ExternalMarkerList.GetSize() > 0
			If ( ExternalMarkerList.GetSize() > 1 ) && ( iExternalIndex == -1 || ( iExternalIndex >= ExternalMarkerList.GetSize() ) ||\
			( !bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) ||\
			(PlayerRef.GetDistance(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference) < fRPMinDistance) ||\
			( ExternalMarkerList.GetAt( iExternalIndex ).GetType() != 61 ) ) )
				Int iMarkerIndex = iGetRandomRefFromListWithExclusions( 0, ExternalMarkerList.GetSize() - 1, ExternalMarkerList )
				If iMarkerIndex != -1
					If !bIsArrived(ExternalMarkerList.GetAt( iMarkerIndex ) As ObjectReference)
						If ((PlayerMarker.GetDistance(CustomMarker) >= fRPMinDistance) && bCanTeleportToDynMarker(CustomMarker))
							If !bIsArrived(CustomMarker)
								If (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
									If !bIsArrived(SleepMarker)
										SendToAnotherLocation()
									EndIf
								Else
									SendToAnotherLocation()
								EndIf
							EndIf
						ElseIf (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
							If !bIsArrived(SleepMarker)
								SendToAnotherLocation()
							EndIf
						Else
							SendToAnotherLocation()
						EndIf
					EndIf
				ElseIf ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance ) && bCanTeleportToDynMarker(CustomMarker))
					If !bIsArrived(CustomMarker)
						If (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
							If !bIsArrived(SleepMarker)
								SendToAnotherLocation()
							EndIf
						Else
							SendToAnotherLocation()
						EndIf
					EndIf
				ElseIf (bCanTeleportToDynMarker(SleepMarker) && (PlayerRef.GetDistance(SleepMarker) >= fRPMinDistance))
					If !bIsArrived(SleepMarker)
						SendToAnotherLocation()
					EndIf
				Else
					SendToAnotherLocation()
				EndIf
			ElseIf ( bCanTeleportToExtMarker( ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference ) &&\
			(PlayerRef.GetDistance(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference) >= fRPMinDistance) &&\
			( ExternalMarkerList.GetAt( iExternalIndex ).GetType() == 61 ) )
				If !bIsArrived(ExternalMarkerList.GetAt( iExternalIndex ) As ObjectReference)
					If ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance) && bCanTeleportToDynMarker(CustomMarker))
						If !bIsArrived(CustomMarker)
							If (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
								If !bIsArrived(SleepMarker)
									SendToAnotherLocation()
								EndIf
							Else
								SendToAnotherLocation()
							EndIf
						EndIf
					ElseIf (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
						If !bIsArrived(SleepMarker)
							SendToAnotherLocation()
						EndIf
					Else
						SendToAnotherLocation()
					EndIf
				EndIf
			ElseIf ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance) && bCanTeleportToDynMarker(CustomMarker))
				If !bIsArrived(CustomMarker)
					If (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
						If !bIsArrived(SleepMarker)
							SendToAnotherLocation()
						EndIf
					Else
						SendToAnotherLocation()
					EndIf
				EndIf
			ElseIf (bCanTeleportToDynMarker(SleepMarker) && (PlayerRef.GetDistance(SleepMarker) >= fRPMinDistance))
				If !bIsArrived(SleepMarker)
					SendToAnotherLocation()
				EndIf
			Else
				SendToAnotherLocation()
			EndIf
		ElseIf ((PlayerRef.GetDistance(CustomMarker) >= fRPMinDistance) && bCanTeleportToDynMarker(CustomMarker))
			If !bIsArrived(CustomMarker)
				If (bCanTeleportToDynMarker(SleepMarker) && (PlayerMarker.GetDistance(SleepMarker) >= fRPMinDistance))
					If !bIsArrived(SleepMarker)
						SendToAnotherLocation()
					EndIf
				Else
					SendToAnotherLocation()
				EndIf
			EndIf
		ElseIf (bCanTeleportToDynMarker(SleepMarker)&& (PlayerRef.GetDistance(SleepMarker) >= fRPMinDistance))
			If !bIsArrived(SleepMarker)
				SendToAnotherLocation()
			EndIf
		Else
			SendToAnotherLocation()
		EndIf
	Else
		SendToNearestLocation()
	EndIf
	PlayerMarker.MoveToMyEditorLocation()
	PlayerMarker.Disable()
EndFunction

Bool Function bIsCurrentCell(int iIndex)
	Return ((( MarkerList.GetAt(iIndex))  As Objectreference ).GetParentCell() == PlayerMarker.GetParentCell() )
EndFunction

Function RemoveTradbleItems (Actor ActorRef,Bool bRandom = False)
	Int iCount
	Float fMin 
	If ( ActorRef.GetItemCount(Gold001) > 0 ) && ConfigMenu.bIsGoldEnabled && !bStealSoul
		If bRandom
			iCount = ActorRef.GetItemCount(Gold001)
			fMin = fMax(250.0,ConfigMenu.fValueGoldSlider)
			If ( iCount > fMin )
				ActorRef.RemoveItem(Gold001, Utility.RandomInt(fMin As Int,iCount), True, LostItemsChest)
			ElseIf ( iCount > 250 )
				ActorRef.RemoveItem(Gold001, Utility.RandomInt(250,iCount), True, LostItemsChest)
			Else
				ActorRef.RemoveItem(Gold001, ActorRef.GetItemCount(Gold001), True, LostItemsChest)
			EndIf
		Else
			ActorRef.RemoveItem(Gold001, ActorRef.GetItemCount(Gold001), True, LostItemsChest)
		EndIf
	EndIf
	If( ActorRef.GetItemCount(MarkOfArkay) > 0 ) && ConfigMenu.bIsMarkEnabled && !bStealSoul
		If bRandom
			iCount = ActorRef.GetItemCount(MarkOfArkay)
			fMin = fMax(1.0, ConfigMenu.fValueMarkSlider)
			If ( iCount > fMin )
				ActorRef.RemoveItem(MarkOfArkay, Utility.RandomInt(fMin As Int,iCount), True, LostItemsChest)
			ElseIf ( iCount > 1 )
				ActorRef.RemoveItem(MarkOfArkay, Utility.RandomInt(1,iCount), True, LostItemsChest)
			Else
				ActorRef.RemoveItem(MarkOfArkay, ActorRef.GetItemCount(MarkOfArkay), True, LostItemsChest)
			EndIf
		Else
			ActorRef.RemoveItem(MarkOfArkay, ActorRef.GetItemCount(MarkOfArkay), True, LostItemsChest)
		EndIf
	EndIf
	If ( ActorRef.GetItemCount(BlackFilledGem) > 0 ) && ConfigMenu.bIsBSoulGemEnabled && !bStealSoul
		If bRandom
			iCount = ActorRef.GetItemCount(BlackFilledGem)
			fMin = fMax(1.0, ConfigMenu.fValueBSoulGemSlider)
			If ( iCount > fMin )
				ActorRef.RemoveItem(BlackFilledGem, Utility.RandomInt(fMin As Int,iCount), True, LostItemsChest)
			ElseIf ( iCount > 1 )
				ActorRef.RemoveItem(BlackFilledGem, Utility.RandomInt(1,iCount), True, LostItemsChest)
			Else
				ActorRef.RemoveItem(BlackFilledGem, ActorRef.GetItemCount(BlackFilledGem), True, LostItemsChest)
			EndIf
		Else
			ActorRef.RemoveItem(BlackFilledGem, ActorRef.GetItemCount(BlackFilledGem), True, LostItemsChest)
		EndIf
	EndIf
	If ( ActorRef.GetItemCount(GrandFilledGem) > 0 ) && ConfigMenu.bIsGSoulGemEnabled && !bStealSoul
		If bRandom
			iCount = ActorRef.GetItemCount(GrandFilledGem)
			fMin = fMax(1.0, ConfigMenu.fValueGSoulGemSlider)
			If ( iCount > fMin )
				ActorRef.RemoveItem(GrandFilledGem, Utility.RandomInt(fMin As Int,iCount), True, LostItemsChest)
			ElseIf ( iCount > 1 )
				ActorRef.RemoveItem(GrandFilledGem, Utility.RandomInt(1,iCount), True, LostItemsChest)
			Else
				ActorRef.RemoveItem(GrandFilledGem, ActorRef.GetItemCount(GrandFilledGem), True, LostItemsChest)
			EndIf
		Else
			ActorRef.RemoveItem(GrandFilledGem, ActorRef.GetItemCount(GrandFilledGem), True, LostItemsChest)
		EndIf
	EndIf
	If (( fDragonSoulCount > 0 ) && ConfigMenu.bIsDragonSoulEnabled && (bSoulmark || bStealSoul) )
		If bRandom
			iCount = fDragonSoulCount As Int
			fMin = fMax(1.0, ConfigMenu.fValueSoulSlider)
			If ( iCount > fMin )
				Int iAmount = Utility.RandomInt(fMin As Int,iCount)
				fLostSouls += iAmount
				PlayerRef.ModActorValue("DragonSouls", -iAmount)
			ElseIf ( iCount > 1 )
				Int iAmount = Utility.RandomInt(1,iCount)
				fLostSouls += iAmount
				PlayerRef.ModActorValue("DragonSouls", -iAmount)
			Else
				fLostSouls += ActorRef.GetActorValue("DragonSouls")
				PlayerRef.ModActorValue("DragonSouls", -PlayerRef.GetActorValue("DragonSouls"))
			EndIf
		Else
			fLostSouls += ActorRef.GetActorValue("DragonSouls")
			PlayerRef.ModActorValue("DragonSouls", -PlayerRef.GetActorValue("DragonSouls"))
		EndIf
	EndIf
EndFunction

Function RestoreLostItems(Actor ActorRef)
	If (ThiefNPC.GetReference() As Actor)
		RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
		(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
	EndIf
	If Thief
		RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
		Thief.RemoveFromFaction(PlayerEnemyFaction)
	EndIf
	RemoveStolenItemMarkers(PlayerRef)
	Thief = None
	bStealSoul = False
	ActorRef.RemoveSpell(ArkayCurse)
	ActorRef.RemoveSpell(ArkayCurseAlt)
	moaSoulMark01.Stop()
	moaThiefNPC01.Stop()
	If bIsItemsRemoved
		LostItemsMarker.MoveToMyEditorLocation()
		LostItemsMarker.Disable()
		LostItemsChest.RemoveAllItems(ActorRef, True, True)
		If fLostSouls > 0.0
			ActorRef.ModActorValue("DragonSouls", fLostSouls)
			fLostSouls = 0.0
		EndIf
		bIsItemsRemoved = False
		Debug.Notification("$mrt_MarkofArkay_Notification_RestoreLostItems")
	EndIf
EndFunction

Function DestroyLostItems(Actor ActorRef)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Destroying previously lost items...")
	If ( ( LostItemsChest.GetNumItems() > 0 ) || ( fLostSouls > 0.0 ) )
		If ConfigMenu.iDestroyedItems < 99999999
			ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
			If fLostSouls > 0.0
				ConfigMenu.iDestroyedItems += 1
			EndIf
		EndIf
	EndIf
	LostItemsChest.RemoveAllItems()
	fLostSouls = 0.0
	If (ThiefNPC.GetReference() As Actor)
		RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
		(ThiefNPC.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
	EndIf
	If Thief
		RemoveStolenItemMarkers(Thief)
		Thief.RemoveFromFaction(PlayerEnemyFaction)
	EndIf
	RemoveStolenItemMarkers(ActorRef)
	Thief = None
	bStealSoul = False
	ActorRef.RemoveSpell(ArkayCurse)
	ActorRef.RemoveSpell(ArkayCurseAlt)
	moaSoulMark01.Stop()
	moaThiefNPC01.Stop()
	If bIsItemsRemoved
		LostItemsMarker.MoveToMyEditorLocation()
		LostItemsMarker.Disable()
		LostItemsChest.RemoveAllItems(ActorRef, True, True)
		bIsItemsRemoved = False
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Previously lost items are destroyed.")
EndFunction

Function RefreshFace()	;for closed eye bug
	; Disabling facegen
	Bool oldUseFaceGen = Utility.GetINIBool( "bUseFaceGenPreprocessedHeads:General" )
	If ( oldUseFaceGen )
		Utility.SetINIBool( "bUseFaceGenPreprocessedHeads:General", False )
	EndIf
	
	; Updating player
	PlayerRef.QueueNiNodeUpdate()
	
	; Restoring facegen
	If ( oldUseFaceGen )
		Utility.SetINIBool( "bUseFaceGenPreprocessedHeads:General", True )
	EndIf
EndFunction

Bool Function IsInInteriorActual(ObjectReference akObjectReference)
    If akObjectReference.IsInInterior()
	    Return True
	EndIf
    If WorldspacesInterior.HasForm(akObjectReference.GetWorldSpace())
		Return True
	EndIf
	Return False
EndFunction

Bool Function bCanTeleport()
	Int iIndex = QuestBlackList.GetSize()
	While iIndex > 0
		iIndex -= 1
		Quest ForbidenQuest = QuestBlackList.GetAt(iIndex) As Quest
		If ForbidenQuest
			If ForbidenQuest.IsRunning()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: You can't Respawn while " + ForbidenQuest + " is running.")
				Return False
			EndIf
		EndIf
	EndWhile
	Location CurrLoc = PlayerRef.GetCurrentLocation()
	If CurrLoc
		If CurrLoc.HasKeywordString("loctypejail")
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Respawn from jail is disabled.")
			Return False
		EndIf
		iIndex = LocationBlackList.GetSize()
		While iIndex > 0
			iIndex -= 1
			Location ForbiddenLocation = LocationBlackList.GetAt(iIndex) As Location
			If ForbiddenLocation
				If (( CurrLoc == ForbiddenLocation ) || ForbiddenLocation.IsChild(CurrLoc))
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Respawn from " + ForbiddenLocation + " is disabled.")
					Return False
				EndIf
			EndIf
		EndWhile
	EndIf
	Return True
EndFunction

Bool Function bCanTeleportToExtMarker( Objectreference ExternalMarker )
	If ExternalMarker
		Int iIndex = LocationBlackList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ExternalMarker.IsInLocation(LocationBlackList.GetAt(iIndex) As Location)
				Return False
			EndIf
		EndWhile
		If ( !ExternalMarker.IsDisabled() && ( ExternalMarker.GetParentCell() != DefaultCell ) )
			Return True
		EndIf
	EndIf
	Return False
EndFunction

Bool Function bCanTeleportToDynMarker(Objectreference Marker)
	If Marker 
		Location CurrLoc = Marker.GetCurrentLocation()
		If CurrLoc
			If CurrLoc.HasKeywordString("loctypejail")
				Return False
			EndIf
			Int iIndex = LocationBlackList.GetSize()
			While iIndex > 0
				iIndex -= 1
				Location ForbiddenLocation = LocationBlackList.GetAt(iIndex) As Location
				If ForbiddenLocation
					If (( CurrLoc == ForbiddenLocation ) || ForbiddenLocation.IsChild(CurrLoc))
						Return False
					EndIf
				EndIf
			EndWhile
		EndIf	
		If !Marker.IsDisabled()
			If ( Marker.GetParentCell() != DefaultCell )
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Int Function iGetRandomRefFromListWithExclusions( Int iFrom, Int iTo, Formlist RefList) 
	Int ExcludeCount = 0
	int iIndex = 0
	Int iRandom = 0
	ObjectReference MarkerRef
	While iIndex < RefList.GetSize()
		If RefList.GetAt(iIndex).GetType() != 61
			ExcludeCount += 1
		Else
			MarkerRef = ( RefList.GetAt(iIndex) As ObjectReference )
			If ( !bCanTeleportToExtMarker( MarkerRef ) || BIsRefInCurrentCell( MarkerRef ) )
				ExcludeCount += 1
			EndIf
		EndIf
		iIndex += 1
	Endwhile
	If ( ExcludeCount == RefList.GetSize() )
		Return -1
	EndIf
	iRandom = Utility.RandomInt(iFrom, iTo - ExcludeCount)
	 iIndex = 0 
	 While ( iIndex < RefList.GetSize() )
		MarkerRef = ( RefList.GetAt(iIndex) As ObjectReference )
		If ( iRandom < iIndex )
			Return iRandom
		ElseIf (( iRandom >= iIndex ) && (( RefList.GetAt(iIndex).GetType() != 61 ) || !bCanTeleportToExtMarker( MarkerRef ) || BIsRefInCurrentCell( MarkerRef ) ))
			iRandom += 1
		EndIf
		iIndex += 1
	EndWhile
	Return iRandom
EndFunction

Bool Function BIsRefInCurrentCell ( ObjectReference MarkerRef)
	Return (( MarkerRef ).GetParentCell() == PlayerRef.GetParentCell() )
EndFunction

Function RandomTeleport()
	bIsArrived( MarkerList.GetAt( iGetRandomWithExclusionArray( 0, ( MarkerList.GetSize() - 1 ), ConfigMenu.bRespawnPointsFlags )) As Objectreference )
EndFunction

Function SendToAnotherLocation()
	Int iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If (iIndex == 3)
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) ;|| bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						If bIsArrived(MarkerList.GetAt(iIndex) As ObjectReference)
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 4 )
			If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) ;|| bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						If bIsArrived(MarkerList.GetAt(iIndex) As ObjectReference)
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		ElseIf ( iIndex == 6 )
			If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
						If bIsArrived(MarkerList.GetAt(iIndex) As ObjectReference)
							Return
						EndIf
					EndIf
				EndIf
			EndIf
		ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) >= fRPMinDistance )
					If bIsArrived(MarkerList.GetAt(iIndex) As ObjectReference)
						Return
					EndIf
				EndIf
			EndIf
		EndIf
	EndWhile
	RandomTeleport()
EndFunction

Function ShiftBack()
	float i = 5.0
	If ( WerewolfQuest.IsRunning() )
		Debug.SetGodMode(True)
		PlayerRef.DispelSpell(BleedoutProtection)
		Game.DisablePlayerControls()
		WerewolfQuest.SetStage(100)
		While (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
			Utility.Wait(0.2)
			i -= 0.2
		EndWhile
		;Debug.SetGodMode(False)
		;Game.EnablePlayerControls()
	;ElseIf ( VampireLordQuest.IsRunning() )
	;	Debug.SetGodMode(True)
	;	PlayerRef.DispelSpell(BleedoutProtection)
	;	Game.DisablePlayerControls()
	;	VampireLordQuest.SetStage(100) ; shift back
	;	While (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
	;		Utility.Wait(0.2)
	;		i -= 0.2
	;	EndWhile
		;Debug.SetGodMode(False)
		;Game.EnablePlayerControls()
	EndIf
EndFunction

Int Function iHasHealingPotion()
		Int iIndex = PotionList.GetSize()
		While ( iIndex > 0 )
			iIndex -= 1
			If PlayerRef.GetItemCount(PotionList.GetAt(iIndex) As Potion) > 0
				Return iIndex
			EndIf
		Endwhile
		Return -1
EndFunction

Function RemoveUnequippedItems(Actor ActorRef)
	Int iEmpty
	Bool RightHand = ( RightHandEquipedItem && !( RightHandEquipedItem As Spell ) )
	Bool LeftHand =  ( LeftHandEquippedItem && !( LeftHandEquippedItem As Spell ) && !( LeftHandEquippedItem == RightHandEquipedItem ) )
	RegisterEquipments(ActorRef,RightHand,LeftHand)
	ValuableItemsChest.RemoveAllItems()
	ActorRef.RemoveAllItems(ValuableItemsChest, True,False)
	TransferItems(Equipment,ValuableItemsChest,ActorRef As ObjectReference)
	TransferItemsByType(ValuableItemsChest,ActorRef As ObjectReference,45,"zzzmoa_ignoreitem") ;Return Keys
	ValuableItemsChest.RemoveAllItems(LostItemsChest,True,True)
	If !ConfigMenu.bRespawnNaked
		EquipItems(ActorRef, RightHand, LeftHand)
	EndIf
EndFunction

Function RemoveValuableItems(Actor ActorRef)
	If ActorRef.GetItemCount(Gold001) > 499
		ActorRef.RemoveItem(Gold001, Utility.RandomInt(500,ActorRef.GetItemCount(Gold001)), True, LostItemsChest)
		Return
	ElseIf (( fDragonSoulCount > 0 ) && ConfigMenu.bIsDragonSoulEnabled && bSoulmark )
		Int iAmount = Utility.RandomInt(1,fDragonSoulCount As Int)
		fLostSouls += ( iAmount As Int )
		ActorRef.ModActorValue("DragonSouls", -iAmount)
		Return
	ElseIf( ActorRef.GetItemCount(MarkOfArkay) > 0 ) && ConfigMenu.bIsMarkEnabled
		ActorRef.RemoveItem(MarkOfArkay, Utility.RandomInt(1,ActorRef.GetItemCount(MarkOfArkay)), True, LostItemsChest)
		Return
	ElseIf ( ActorRef.GetItemCount(BlackFilledGem) > 0 ) && ConfigMenu.bIsBSoulGemEnabled
		ActorRef.RemoveItem(BlackFilledGem, Utility.RandomInt(1,ActorRef.GetItemCount(BlackFilledGem)), True, LostItemsChest)
		Return
	ElseIf ( ActorRef.GetItemCount(GrandFilledGem) > 0 ) && ConfigMenu.bIsGSoulGemEnabled
		ActorRef.RemoveItem(GrandFilledGem, Utility.RandomInt(1,ActorRef.GetItemCount(GrandFilledGem)), True, LostItemsChest)
		Return
	EndIf
	Bool RightHand = ( RightHandEquipedItem && !( RightHandEquipedItem As Spell ) )
	Bool LeftHand =  ( LeftHandEquippedItem && !( LeftHandEquippedItem As Spell ) && !( LeftHandEquippedItem == RightHandEquipedItem ) )
	Bool bValuable = False
	Int iSum = 0
	RegisterEquipments(ActorRef,RightHand,LeftHand)
	ValuableItemsChest.RemoveAllItems()
	ActorRef.RemoveAllItems(ValuableItemsChest,True,False)
	Int iIndex = ActorRef.GetNumItems()
	Bool bBreak = False
	Int iEmpty
	While ( iIndex > 0 ) && !bBreak
		iIndex -= 1
		Form kItem = ActorRef.GetNthForm(iIndex)
		If ( Equipment.Find(kItem) > -1 ) ;Finding quest items that were equipped by player
			If ( EquippedQuestItems.Find(kItem) < 0 ) 
				iEmpty = EquippedQuestItems.Find(None)
				If iEmpty > -1
					EquippedQuestItems[iEmpty] = kItem
				Else
					bBreak = True
				EndIf
			EndIf
		EndIf
	EndWhile
	TransferItems(Equipment,ValuableItemsChest,ActorRef As ObjectReference)
	TransferInvalidItems(ValuableItemsChest,ActorRef As ObjectReference)
	Int iTotal = ValuableItemsChest.GetNumItems()
	If iTotal > 40
		iTotal = Utility.RandomInt(40, iTotal)
	EndIf
	iIndex = iTotal
	If iIndex != 0
		Form kForm
		bBreak = False
		While ( iIndex > 0 ) && ( iTotal - iIndex ) < 40 && !bBreak
			iIndex -= 1
			Form kItem = ValuableItemsChest.GetNthForm( iIndex )
			If bIsTypeLegit(kItem) 
				If	( ( !KForm ) || ( ( KForm.GetGoldValue() * ValuableItemsChest.GetItemCount(kForm) ) <  ( kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem))))
					kForm = kItem
					If KForm.GetGoldValue() > 499
						bBreak = True
					EndIf
				EndIf
				If iSum < 500
					iSum = ( iSum + ( kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem)))
				EndIf
			EndIf
		Endwhile
		Form VItem = kForm
		Form Ktemp
		If KForm && ( VItemArr.Find(KForm) < 0 )
			iEmpty = VItemArr.Find(None)
			If iEmpty > -1
				VItemArr[iEmpty] = KForm
			Else
				iIndex = VItemArr.Length
				While iIndex > 0
					iIndex -= 1
					If ( KForm.GetGoldValue() * ValuableItemsChest.GetItemCount(KForm)) > ( VItemArr[iIndex].GetGoldValue() * ValuableItemsChest.GetItemCount( VItemArr[iIndex] ))
						Ktemp = VItemArr[iIndex]
						VItemArr[iIndex] = KForm
						KForm = Ktemp
					EndIf
				Endwhile
			EndIf
		EndIf
		iIndex = VItemArr.Length
		While iIndex > 0
			iIndex -= 1
			If VItemArr[iIndex]
				If ( !VItem ) || (( VItemArr[iIndex].GetGoldValue() * ValuableItemsChest.GetItemCount( VItemArr[iIndex] )) > ( VItem.GetGoldValue() * ValuableItemsChest.GetItemCount(VItem)))
					VItem = VItemArr[iIndex]
				EndIf
			EndIf
		EndWhile
		If ( bIsTypeLegit(VItem) && (( VItem.GetGoldValue() * ValuableItemsChest.GetItemCount(VItem) ) > 499 ))
			If ( VItem.GetGoldValue() > 499 )
				ValuableItemsChest.RemoveItem(VItem, Utility.RandomInt(1,ValuableItemsChest.GetItemCount(VItem)), True, LostItemsChest )
			Else
				ValuableItemsChest.RemoveItem(VItem, ValuableItemsChest.GetItemCount(VItem), True, LostItemsChest )
			EndIf
			bValuable = True
		ElseIf (ValuableItemsChest.GetNumItems() > 40)
			Int iTotalOld = iTotal
			If ValuableItemsChest.GetNumItems() > 60
				iTotal = iGetRandomWithExclusion(60, ValuableItemsChest.GetNumItems(), iTotal)
			Else
				iTotal = ValuableItemsChest.GetNumItems()
			EndIf
			Bool bOverlap = False
			Int i = iTotal
			Int c = i
			If c <= iTotalOld
				If (( iTotalOld - c ) < 40)
					c = c - (40 - (iTotalOld - i))
					bOverlap = True
				EndIf
			EndIf
			bBreak = False
			While ( c > 0 ) && ( ( iTotal - i ) < 60 ) && !bValuable
				c -= 1
				i -= 1
				Form kItem = ValuableItemsChest.GetNthForm( c )
				If bIsTypeLegit(kItem)
					If ( kItem.GetGoldValue() * ValuableItemsChest.GetItemCount( kItem)) > 499
						If ( kItem.GetGoldValue() > 499 )
							ValuableItemsChest.RemoveItem(kItem, Utility.RandomInt(1,ValuableItemsChest.GetItemCount(kItem)), True, LostItemsChest )
						Else
							ValuableItemsChest.RemoveItem(kItem, ValuableItemsChest.GetItemCount(kItem), True, LostItemsChest )
						EndIf
						bValuable = True
					ElseIf iSum < 500
						iSum = ( iSum + ( kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem)))
					EndIf
				EndIf
				If bOverlap
					If c == 0
						c = (iTotal + (60 - (iTotal - i)))
						If c > ValuableItemsChest.GetNumItems()
							c = ValuableItemsChest.GetNumItems()
						EndIf
					ElseIf (c == iTotal)
						c = 0
					EndIf
				ElseIf (c == iTotalOld)
					c -= 40
					bOverlap = True
					If c < 1
						c = (iTotal + (60 - (iTotal - i)))
						If c > ValuableItemsChest.GetNumItems()
							c = ValuableItemsChest.GetNumItems()
						EndIf
					EndIf
				EndIf
			Endwhile
		EndIf
		If !bValuable
			If iSum < 500
				If ValuableItemsChest.GetNumItems() > 100
					iSum = ( ( iSum * ValuableItemsChest.GetNumItems() ) / 100  )
				EndIf
			EndIf
			ValuableItemsChest.RemoveAllItems( LostItemsChest, True ) 
			If ( iSum < 500 )
				Int iItem = Equipment.Length
				While ( iItem > 0 ) && !bValuable
					iItem -= 1
					If Equipment[iItem]
						If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ActorRef.GetItemCount(Equipment[iItem]) > 0 && (( Equipment[iItem].GetGoldValue() + iSum ) > 499 ))
							ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
							bValuable = True
						EndIf
					EndIf
				EndWhile
				If !bValuable
					iItem = Equipment.Length
					While (( iItem > 0 ) && ( iSum < 500 ))
						iItem -= 1
						If Equipment[iItem]
							If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ( ActorRef.GetItemCount(Equipment[iItem]) > 0 ))
								iSum = iSum + Equipment[iItem].GetGoldValue()
								ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
							EndIf
						EndIf
					EndWhile
				EndIf
			EndIf
		EndIf
		Utility.Wait(0.1)
		ValuableItemsChest.RemoveAllItems(ActorRef, True, True)
	Else
		Int iItem = Equipment.Length
		While ( iItem > 0 ) && !bValuable
			iItem -= 1
			If Equipment[iItem]
				If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && Equipment[iItem] && bIsTypeLegit(Equipment[iItem]) && ActorRef.GetItemCount(Equipment[iItem]) > 0 && ( Equipment[iItem].GetGoldValue() > 499 ))
					ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
					bValuable = True
				EndIf
			EndIf
		EndWhile
		If !bValuable
			iItem = Equipment.Length
			While (( iItem > 0 ) && ( iSum < 500 ))
				iItem -= 1
				If Equipment[iItem]
					If ( ( EquippedQuestItems.Find( Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ( ActorRef.GetItemCount(Equipment[iItem]) > 0 ))
						iSum = iSum + Equipment[iItem].GetGoldValue()
						ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
					EndIf
				EndIf
			EndWhile
		EndIf
	EndIf
	Utility.Wait(0.1)
	If !ConfigMenu.bRespawnNaked
		EquipItems(ActorRef, RightHand, LeftHand)
	EndIf
EndFunction

Function RemoveValuableItemsGreedy(Actor ActorRef)
	Bool bFound1 = False
	Bool bFound = False
	Bool RightHand = ( RightHandEquipedItem && !( RightHandEquipedItem As Spell ) )
	Bool LeftHand =  ( LeftHandEquippedItem && !( LeftHandEquippedItem As Spell ) && !( LeftHandEquippedItem == RightHandEquipedItem ) )
	If ActorRef.GetItemCount(Gold001) > 0
		If ActorRef.GetItemCount(Gold001) > 499
			bFound1 = True
		EndIf
		ActorRef.RemoveItem(Gold001, ActorRef.GetItemCount(Gold001), True, LostItemsChest)
	EndIf
	If (( fDragonSoulCount > 0 ) && ConfigMenu.bIsDragonSoulEnabled && bSoulmark )
		fLostSouls += fDragonSoulCount
		ActorRef.ModActorValue("DragonSouls", -fDragonSoulCount)
		bFound1 = True
	EndIf
	If( ActorRef.GetItemCount(MarkOfArkay) > 0 ) && ConfigMenu.bIsMarkEnabled
		ActorRef.RemoveItem(MarkOfArkay, ActorRef.GetItemCount(MarkOfArkay), True, LostItemsChest)
		bFound1 = True
	EndIf
	If ( ActorRef.GetItemCount(BlackFilledGem) > 0 ) && ConfigMenu.bIsBSoulGemEnabled
		ActorRef.RemoveItem(BlackFilledGem, ActorRef.GetItemCount(BlackFilledGem), True, LostItemsChest)
		bFound1 = True
	EndIf
	If ( ActorRef.GetItemCount(GrandFilledGem) > 0 ) && ConfigMenu.bIsGSoulGemEnabled
		ActorRef.RemoveItem(GrandFilledGem, ActorRef.GetItemCount(GrandFilledGem), True, LostItemsChest)
		bFound1 = True
	EndIf
	RegisterEquipments(ActorRef,RightHand,LeftHand)
	ValuableItemsChest.RemoveAllItems()
	ActorRef.RemoveAllItems(ValuableItemsChest, True, False)
	Int iIndex = ActorRef.GetNumItems()
	Bool bBreak = False
	Int iEmpty
	Form kItem
	While ( iIndex > 0 ) && !bBreak
		iIndex -= 1
		kItem = ActorRef.GetNthForm(iIndex)
		If ( Equipment.Find(kItem) > -1 ) ;Finding quest items that were equipped by player
			If ( EquippedQuestItems.Find(kItem) < 0 ) 
				iEmpty = EquippedQuestItems.Find(None)
				If iEmpty > -1
					EquippedQuestItems[iEmpty] = kItem
				Else
					bBreak = True
				EndIf
			EndIf
		EndIf
	EndWhile
	TransferItems(Equipment,ValuableItemsChest,ActorRef As ObjectReference)
	TransferInvalidItems(ValuableItemsChest,ActorRef As ObjectReference)
	Int iTotal = ValuableItemsChest.GetNumItems()
	If iTotal > 40
		iTotal = Utility.RandomInt(40, iTotal)
	EndIf
	iIndex = iTotal
	Int iSum = 0
	If iIndex != 0
		Form kForm
		Form VItem
		Int iIndex1
		Form Ktemp
		iIndex1 = VItemArr.Length
		While iIndex1 > 0
			iIndex1 -= 1
			If VItemArr[iIndex1]
				If ( VItemArr[iIndex1].GetGoldValue() * ValuableItemsChest.GetItemCount( VItemArr[iIndex1] )) > 499
					bFound = True
					VItem = VItemArr[iIndex1] 
					ValuableItemsChest.RemoveItem(VItem, ValuableItemsChest.GetItemCount(VItem), True, LostItemsChest )	
				EndIf
			EndIf
		Endwhile
		While  ( iIndex > 0 ) && ( iTotal - iIndex ) < 40
			iIndex -= 1
			kItem = ValuableItemsChest.GetNthForm( iIndex )
			If  bIsTypeLegit(kItem) 
				If (kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem)) > 499
					kForm = kItem
					VItem = KForm
					bFound = True
					If ( VItemArr.Find(kForm) < 0 )
						iEmpty = VItemArr.Find(none)
						If iEmpty > -1
							VItemArr[iEmpty] = kForm
						Else
							iIndex1 = VItemArr.Length
							While iIndex1 > 0
								iIndex1 -= 1
								If ( kForm.GetGoldValue() * ValuableItemsChest.GetItemCount(kForm)) > ( VItemArr[iIndex1].GetGoldValue() * ValuableItemsChest.GetItemCount( VItemArr[iIndex1] ))
									Ktemp = VItemArr[iIndex1]
									VItemArr[iIndex1] = kForm
									kForm = Ktemp
								EndIf
							Endwhile
						EndIf
					EndIf
					ValuableItemsChest.RemoveItem(VItem, ValuableItemsChest.GetItemCount(VItem), True, LostItemsChest )
				ElseIf !bFound
					If iSum < 500
						iSum += (kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem)) 
					EndIf
				EndIf
			EndIf
		Endwhile
		If !bFound
			If ( ValuableItemsChest.GetNumItems() > 40 )
				Int iTotalOld = iTotal
				If ValuableItemsChest.GetNumItems() > 60
					iTotal = iGetRandomWithExclusion(60, ValuableItemsChest.GetNumItems(), iTotal)
				Else
					iTotal = ValuableItemsChest.GetNumItems()
				EndIf
				Bool bOverlap = False
				Int i = iTotal
				Int c = i
				If c <= iTotalOld
					If (( iTotalOld - c ) < 40)
						c = c - (40 - (iTotalOld - i))
						bOverlap = True
					EndIf
				EndIf
				While ( c > 0 ) && ( ( iTotal - i ) < 60 )
					c -= 1
					i -= 1
					kItem = ValuableItemsChest.GetNthForm(c)
					If bIsTypeLegit(kItem)
						If (kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem)) > 499																	
							ValuableItemsChest.RemoveItem(kItem, ValuableItemsChest.GetItemCount(kItem), True, LostItemsChest )
							bFound = True
						ElseIf !bFound
							If iSum < 500
								iSum += (kItem.GetGoldValue() * ValuableItemsChest.GetItemCount(kItem))
							EndIf
						EndIf
					EndIf
					If bOverlap
						If c == 0
							c = (iTotal + (60 - (iTotal - i)))
							If c > ValuableItemsChest.GetNumItems()
								c = ValuableItemsChest.GetNumItems()
							EndIf
						ElseIf (c == iTotal)
							c = 0
						EndIf
					ElseIf (c == iTotalOld)
						c -= 40
						bOverlap = True
						If c < 1
							c = (iTotal + (60 - (iTotal - i)))
							If c > ValuableItemsChest.GetNumItems()
								c = ValuableItemsChest.GetNumItems()
							EndIf
						EndIf
					EndIf
				Endwhile
			EndIf
		EndIf
		If (!bFound && !bFound1)
			If ( iSum < 500 )
				If ValuableItemsChest.GetNumItems() > 100
					iSum = ((iSum * ValuableItemsChest.GetNumItems()) / 100)
				EndIf
			EndIf
			ValuableItemsChest.RemoveAllItems( LostItemsChest, True ) 
			If ( iSum < 500 )
				Int iItem = Equipment.Length
				While ( iItem > 0 ) && !bFound
					iItem -= 1
					If Equipment[iItem]
						If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ( ActorRef.GetItemCount(Equipment[iItem]) > 0 ) && ( ( Equipment[iItem].GetGoldValue() + iSum ) > 499 ))
							ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
							bFound = True
						EndIf
					EndIf
				EndWhile
				If !bFound
					iItem = Equipment.Length
					While (( iItem > 0 ) && ( iSum < 500 ))
						iItem -= 1
						If Equipment[iItem]
							If ( Equipment[iItem] && ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ( ActorRef.GetItemCount(Equipment[iItem]) > 0 ))
								iSum = iSum + Equipment[iItem].GetGoldValue()
								ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
							EndIf
						EndIf
					EndWhile
				EndIf
			EndIf
		EndIf
		Utility.Wait(0.1)
		ValuableItemsChest.RemoveAllItems(ActorRef, True, True)
	ElseIf !bFound1
		Int iItem = Equipment.Length
		While ( iItem > 0 ) && !bFound
			iItem -= 1
			If Equipment[iItem]
				If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ActorRef.GetItemCount(Equipment[iItem]) > 0 && ( Equipment[iItem].GetGoldValue() > 499 ))
					ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
					bFound = True
				EndIf
			EndIf
		EndWhile
		If !bFound
			iItem = Equipment.Length
			While (( iItem > 0 ) && ( iSum < 500 ))
				iItem -= 1
				If Equipment[iItem]
					If ( ( EquippedQuestItems.Find(Equipment[iItem]) < 0 ) && bIsTypeLegit(Equipment[iItem]) && ( ActorRef.GetItemCount(Equipment[iItem]) > 0 ))
						iSum = iSum + Equipment[iItem].GetGoldValue()
						ActorRef.RemoveItem(Equipment[iItem], 1, True, LostItemsChest)
					EndIf
				EndIf
			EndWhile
		EndIf
	EndIf
	Utility.Wait(0.1)
	If !ConfigMenu.bRespawnNaked
		EquipItems(ActorRef, RightHand, LeftHand)
	EndIf
EndFunction

Bool Function bIsTypeLegit( Form akItem )
	If akItem
		Int iType = akItem.GetType()
		If ( ( iType == 26 ) || ( iType == 42 ) || ( iType == 27 ) || ( iType == 46 ) || ( iType == 30 ) || ( iType == 32 ) || ( iType == 23 ) || ( iType == 52 ) || ( iType == 41 ) )
			If (!akItem.HasKeywordString("zzzmoa_ignoreitem") && !akItem.HasKeywordString("vendornosale") && !akItem.HasKeywordString("magicdisallowenchanting") && !akItem.HasKeywordString("sos_underwear"))
				If akItem.GetWeight() > 0.0
					Return True
				EndIf
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Function RegisterEquipments(Actor refActor, Bool bRightArm, Bool bLeftArm)
	Int iEmpty
	Form akArmor
	Int itemIndex = 30
	If bRightArm
		iEmpty = Equipment.find(None)
		If iEmpty > -1
			Equipment[iEmpty] = RightHandEquipedItem
		EndIf
	EndIf
	If bLeftArm
		iEmpty = Equipment.find(None)
		If iEmpty > -1
			Equipment[iEmpty] = LeftHandEquippedItem
		EndIf
	EndIf
	While itemIndex < 62
		akArmor = refActor.GetWornForm(Armor.GetMaskForSlot(itemIndex))
		If akArmor As Armor
			If Equipment.find(akArmor) < 0
				iEmpty = Equipment.Find(None)
				If iEmpty > -1
					Equipment[iEmpty] = akArmor
				EndIf
			EndIf
		EndIf
		itemIndex += 1
	EndWhile
EndFunction

Function TransferItems(Form[] ItemList, ObjectReference akFrom, ObjectReference akTo)
	Int itemIndex = ItemList.Length
	While itemIndex > 0
		itemIndex -= 1
		If ItemList[itemIndex] && EquippedQuestItems.Find(ItemList[itemIndex]) < 0
			akFrom.RemoveItem(ItemList[itemIndex],1,True,akTo)
		EndIf
	EndWhile
EndFunction

Function TransferItemsbyTypeArr(ObjectReference akFrom, ObjectReference akTo,Int[] iTypeArr,String[] strKeywordArr = None)
	Int iIndex = akFrom.GetNumItems()
	Form kItem
	While ( iIndex > 0 ) 
		iIndex -= 1
		kItem = akFrom.GetNthForm( iIndex )
		If kItem
			If ( iTypeArr.Find(kItem.GetType()) > -1 )
				akFrom.RemoveItem(kItem, akFrom.GetItemCount(kItem), True, akTo )	
			ElseIf strKeywordArr
				Bool bBreak = False
				Int i = strKeywordArr.Length
				While ( i > 0 ) && !bBreak
					i -= 1
					If strKeywordArr[i]
						If kItem.HasKeywordString(strKeywordArr[i])
							akFrom.RemoveItem(kItem, akFrom.GetItemCount(kItem), True, akTo )	
							bBreak = True
						EndIf
					EndIf
				Endwhile
			EndIf
		EndIf
	EndWhile	
Endfunction

Function TransferItemsByType(ObjectReference akFrom, ObjectReference akTo,Int iType,String strKeyword = "")
	Int iIndex = akFrom.GetNumItems()
	Form kItem
	While ( iIndex > 0 ) 
		iIndex -= 1
		kItem = akFrom.GetNthForm( iIndex )
		If kItem
			If (( kItem.GetType() == iType ) || ( strKeyword && kItem.HasKeywordString(strKeyword)))
				akFrom.RemoveItem(kItem, akFrom.GetItemCount(kItem), True, akTo )	
			EndIf 
		EndIf
	EndWhile	
Endfunction

Function TransferInvalidItems(ObjectReference akFrom, ObjectReference akTo)
	Int iIndex = akFrom.GetNumItems()
	Form kItem
	While ( iIndex > 0 ) 
		iIndex -= 1
		kItem = akFrom.GetNthForm( iIndex )
		If !bIsTypeLegit(kItem)
			akFrom.RemoveItem(kItem, akFrom.GetItemCount(kItem), True, akTo )	
		EndIf
	EndWhile	
EndFunction

Bool Function bCanSendToCidhna()
	Return ( !MS01.IsCompleted() || MS02.IsCompleted() )
EndFunction

Bool Function bGuardCanSendToJail()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detecting guard NPCs...")
	bool bCanSendToCidhna = bCanSendToCidhna()
	Faction CrimeFaction
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a guard NPC (Phase 1)...")
	If ( Attacker && !Attacker.IsDead() )
		If ( Attacker.IsGuard() )
			If ( PlayerRef.GetDistance(Attacker) < 2000.0 )
				CrimeFaction = Attacker.GetCrimeFaction()
				If ( CrimeFaction && ( CrimeFaction.GetCrimeGold() > 0 ))
					If (( CrimeFaction != CrimeFactionReach ) || bCanSendToCidhna )
						Guard = Attacker
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected guard NPC In Phase 1: ( '" +\
						Guard.GetActorBase().GetName() + "', " + Guard + ", " + Guard.GetRace() + ", )" )
						Return True
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a guard NPC (Phase 2)...")
	moaGuardDetector.Stop()
	moaGuardDetector.Start()
	If GuardNPC.GetReference() As Actor
		CrimeFaction = ( GuardNPC.GetReference() As Actor ).GetCrimeFaction()
		If ( CrimeFaction && ( CrimeFaction.GetCrimeGold() > 0 ))
			If (( CrimeFaction != CrimeFactionReach ) || bCanSendToCidhna )
				Guard = GuardNPC.GetReference() As Actor
				moaGuardDetector.Stop()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected guard NPC In Phase 2: ( '" +\
				Guard.GetActorBase().GetName() + "', " + Guard + ", " + Guard.GetRace() + ", )" )
				Return True
			EndIf
		EndIf
	EndIf
	moaGuardDetector.Stop()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Finding a guard NPC (Phase 3)...")
	Int i = 0
	Actor RandomActor
	While ( i < 15 )
		i += 1
		RandomActor = Game.FindRandomActorFromRef(PlayerRef,2000)
		If RandomActor
			If RandomActor != PlayerRef
				If !RandomActor.IsDead()
					If RandomActor.IsGuard()
						CrimeFaction = RandomActor.GetCrimeFaction()
						If ( CrimeFaction && ( CrimeFaction.GetCrimeGold() > 0 ))
							If (( CrimeFaction != CrimeFactionReach ) || bCanSendToCidhna )
								Guard = RandomActor
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Detected guard NPC In Phase 3: ( '" +\
								Guard.GetActorBase().GetName() + "', " + Guard + ", " + Guard.GetRace() + ", )" )
								Return True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else ;No NPC is around the player
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: No NPC is around.")
			Return False
		EndIf
	EndWhile
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkofArkay: Player won't go to jail.")
	Return False
EndFunction

Function ToggleSaving(Bool bSave)
	If ( ConfigMenu.iSaveOption == 1 )
		If bSave
			Game.SetInChargen(False,False,False)
		Else
			Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		EndIf
	EndIf
EndFunction

Bool Function bInBeastForm()
	If  WerewolfQuest.IsRunning() ;|| VampireLordQuest.IsRunning()
		Return True
	ElseIf ( PlayerRef.GetRace() == WereWolfBeastRace )
		Return True
	;ElseIf ( PlayerRef.GetRace() == DLC1VampireBeastRace )
	;	Return True
	EndIf
	Return False
Endfunction

Int Function iInBeastForm()
	If  WerewolfQuest.IsRunning() || ( PlayerRef.GetRace() == WereWolfBeastRace )
		Return 1
	;ElseIf VampireLordQuest.IsRunning() || ( PlayerRef.GetRace() == DLC1VampireBeastRace )
	;	Return 2
	EndIf
	Return 0
Endfunction

Function ResetPlayer()
	Int iBeastForm = iInBeastForm()
	If iBeastForm
		If iBeastForm == 1
			If PlayerRef.IsSwimming()
				Debug.SendAnimationEvent(PlayerRef, "RESET_GRAPH")
				Utility.Wait(1.0)
				Debug.SendAnimationEvent(PlayerRef, "SwimStart")
			Else
				Debug.SendAnimationEvent(PlayerRef, "RESET_GRAPH")
			EndIf
		EndIf
	Else
		If PlayerRef.IsSwimming()
			Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
			Utility.Wait(1.0)
			Debug.SendAnimationEvent(PlayerRef, "SwimStart")
		Else
			Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
		EndIf
	EndIf
	PlayerRef.DispelAllSpells()
	PlayerRef.ClearExtraArrows()
	If PlayerRef.IsWeaponDrawn()
		PlayerRef.SheatheWeapon()
	EndIf
EndFunction

Bool Function bInSameLocation(Location Loc)
    If Loc
		If PlayerMarker.IsInLocation(Loc)
			Return True
		EndIf
		If PlayerMarker.GetCurrentLocation()
			If PlayerMarker.GetCurrentLocation().IsSameLocation(Loc,HoldKeyword)
				Return True
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

ObjectReference Function FindMarkerByDistance()
	Float fDistance
	ObjectReference Marker
	Int iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0 )
			If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == DynamicMarkerList[iIndex].GetParentCell() ) )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(DynamicMarkerList[iIndex]) ) ) 
					fDistance = PlayerMarker.GetDistance(DynamicMarkerList[iIndex])
					Marker = DynamicMarkerList[iIndex]
				EndIf
			EndIf
		EndIf			
	Endwhile
	If ( Marker && fDistance && fDistance <= 50000.0 )
		Return Marker
	EndIf
	Return None
EndFunction

ObjectReference Function FindCityMarkerByDistance()
	float fDistance
	ObjectReference Marker
	Int iIndex
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100,ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If( ExcludedMarkerList.find( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < 0 )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
					fDistance = PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					Marker = ExternalMarkerList.GetAt( iIndex ) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If PlayerMarker.IsInInterior()
		iIndex = MarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetParentCell() == ( MarkerList.GetAt(iIndex) As ObjectReference ).GetParentCell() )
					If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
						If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) ) )
							fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
							Marker = MarkerList.GetAt(iIndex) As ObjectReference
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile
	Else
		iIndex = CityMarkersList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) )
					fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
					Marker = MarkerList.GetAt(iIndex) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If ( Marker && fDistance && fDistance <= 100000.0 )
		Return Marker
	EndIf
	Return None
Endfunction

ObjectReference Function FindMarkerByLocation()
	Int iIndex = DynamicMarkerList.Length
	While iIndex > 0
		iIndex -= 1
		If ( ExcludedMarkerList.find(DynamicMarkerList[iIndex]) < 0 )
			If ( iIndex >= ( DynamicMarkerList.Length - 2 )) ;DetachMarker2 or DetachMarker1
				If ( bInSameLocation( DynamicMarkerList[iIndex].GetCurrentLocation() ) ||\
				( IsInInteriorActual(PlayerMarker) != IsInInteriorActual(DynamicMarkerList[iIndex]) ) ) 
					Return DynamicMarkerList[iIndex]
				EndIf
			Else
				If bInSameLocation( DynamicMarkerList[iIndex].GetCurrentLocation() )
					Return DynamicMarkerList[iIndex]
				EndIf
			EndIf
		EndIf
	Endwhile
	iIndex = LocationsList.GetSize()
	While ( iIndex > 0 )
		iIndex -= 1
		If ( ExcludedMarkerList.find(MarkerList.GetAt(iIndex) As ObjectReference) < 0 )
			If (iIndex == 3)
				If bInSameLocation(LocationsList.GetAt(iIndex) As Location) ;|| bInSameLocation(DLC1HunterHQLocation) ;Riften or Dayspring Canyon
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf ( iIndex == 4 )
				If bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(HjaalmarchHoldLocation) ;|| bInSameLocation(DLC1VampireCastleLocation) ;Solitude or Morthal or Castle Volkihar
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf ( iIndex == 6 )
				If ( bInSameLocation(LocationsList.GetAt(iIndex) As Location) || bInSameLocation(PaleHoldLocation) ) ;Winterhold or Dawnstar
					If ConfigMenu.bRespawnPointsFlags[iIndex]
						Return ( MarkerList.GetAt(iIndex) As ObjectReference )
					EndIf
				EndIf
			ElseIf bInSameLocation(LocationsList.GetAt(iIndex) As Location)
				If ConfigMenu.bRespawnPointsFlags[iIndex]
					Return ( MarkerList.GetAt(iIndex) As ObjectReference )
				EndIf
			EndIf
		EndIf
	EndWhile
	If ExternalMarkerList.GetSize() > 0
		Int jIndex = iMin(100, ExternalMarkerList.GetSize())
		While jIndex > 0
			jIndex -= 1
			If ( ExcludedMarkerList.find(ExternalMarkerList.GetAt( jIndex ) As ObjectReference) < 0 )
				If bInSameLocation( ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference ).GetCurrentLocation() )
					Return ( ExternalMarkerList.GetAt( jIndex ) As ObjectReference )
				EndIf
			EndIf
		EndWhile	
	EndIf
EndFunction

ObjectReference Function FindMarkerByOrder()
	If ( ExcludedMarkerList.find(DetachMarker2) < 0 )
		Return DetachMarker2
	EndIf
	If ( ExcludedMarkerList.find(DetachMarker1) < 0 )
		Return DetachMarker1
	EndIf
	If ( ExcludedMarkerList.find(LocationMarker) < 0 )
		Return LocationMarker
	EndIf
	If ( ExcludedMarkerList.find(CellLoadMarker) < 0 )
		Return CellLoadMarker
	EndIf
	If ( ExcludedMarkerList.find(LocationMarker2) < 0 )
		Return LocationMarker2
	EndIf
	If ( ExcludedMarkerList.find(DetachMarker3) < 0 )
			Return DetachMarker3
	EndIf
	If ( ExcludedMarkerList.find(CellLoadMarker2) < 0 )
			Return CellLoadMarker2
	EndIf
	Return None
EndFunction

Bool Function TryToMoveByDistanceFar()
	float fDistance
	ObjectReference Marker
	Int iIndex
	If ExternalMarkerList.GetSize() > 0
		iIndex = iMin(100, ExternalMarkerList.GetSize())
		While iIndex > 0
			iIndex -= 1
			If( ExcludedMarkerList.find( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) < 0 )
				If ( !fDistance || ( fDistance > PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference ) ) )
					fDistance = PlayerMarker.GetDistance( ExternalMarkerList.GetAt( iIndex ) As ObjectReference )
					Marker = ExternalMarkerList.GetAt( iIndex ) As ObjectReference
				EndIf
			EndIf
		EndWhile
	EndIf
	If PlayerMarker.IsInInterior()
		iIndex = MarkerList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If ( PlayerMarker.GetParentCell() == ( MarkerList.GetAt(iIndex) As ObjectReference ).GetParentCell() )
					If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
						If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference) ) )
							fDistance = PlayerMarker.GetDistance(MarkerList.GetAt(iIndex) As ObjectReference)
							Marker = MarkerList.GetAt(iIndex) As ObjectReference
						EndIf
					EndIf
				EndIf
			EndIf
		EndWhile
	Else
		iIndex = CityMarkersList.GetSize()
		While iIndex > 0
			iIndex -= 1
			If ConfigMenu.bRespawnPointsFlags[iIndex]
				If( ExcludedMarkerList.find( MarkerList.GetAt(iIndex) As ObjectReference ) < 0 )
					If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference) ) ) 
						fDistance = PlayerMarker.GetDistance(CityMarkersList.GetAt(iIndex) As ObjectReference)
						Marker = MarkerList.GetAt(iIndex) As ObjectReference
					EndIf
				EndIf
			EndIf
		EndWhile
	EndIf
	If ( ExcludedMarkerList.find(CustomMarker) < 0 )
		If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == CustomMarker.GetParentCell() ) )
			If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(CustomMarker) ) )
				fDistance = PlayerMarker.GetDistance(CustomMarker)
				Marker = CustomMarker
			EndIf
		EndIf
	EndIf
	If ( ExcludedMarkerList.find(SleepMarker) < 0 )
		If ( !PlayerMarker.IsInInterior() || ( PlayerMarker.GetParentCell() == SleepMarker.GetParentCell() ) )
			If ( !fDistance || ( fDistance > PlayerMarker.GetDistance(SleepMarker) ) ) 
				fDistance = PlayerMarker.GetDistance(SleepMarker)
				Marker = SleepMarker
			EndIf
		EndIf
	EndIf
	If ( Marker && fDistance && fDistance <= 500000.0 )
		If bIsArrived(Marker)
			Return True
		EndIf
		Int i = ExcludedMarkerList.Find(None)
		If i > -1
			ExcludedMarkerList[i] = Marker
		EndIf
	EndIf
	Return False
EndFunction

Bool Function TryToMoveByDistanceNear()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 9 )
		i += 1
		Marker = FindMarkerByDistance()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByLocation()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 12 )
		i += 1
		Marker = FindMarkerByLocation()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByOrder()
	Int i = 0
	Int j = 0
	ObjectReference Marker
	While ( i < 7 )
		i += 1
		Marker = FindMarkerByOrder()
		If Marker
			If bIsArrived(Marker)
				Return True
			EndIf
			j = ExcludedMarkerList.Find(None)
			If j > -1
				ExcludedMarkerList[j] = Marker
			EndIf
		Else
			Return False
		EndIf
	EndWhile
	Return False
EndFunction

Bool Function TryToMoveByDistanceCity()
	ObjectReference Marker
	Marker = FindCityMarkerByDistance()
	If Marker
		If bIsArrived(Marker)
			Return True
		EndIf
		Int i = ExcludedMarkerList.Find(None)
		If i > -1
			ExcludedMarkerList[i] = Marker
		EndIf
	EndIf
	Return False
EndFunction

Function InitializeExcludedMarkers()
	 ExcludedMarkerList = New ObjectReference[128]
	Int i
	int j = DynamicMarkerList.Length
	While j > 0
		j -= 1
		If ( !bCanTeleportToDynMarker(DynamicMarkerList[j]) ||\
		( PlayerMarker.GetDistance(DynamicMarkerList[j]) < fRPMinDistance ))
			i = ExcludedMarkerList.Find(None)
			If i > -1
				ExcludedMarkerList[i] = DynamicMarkerList[j]
			EndIf
		EndIf
	Endwhile
	j = MarkerList.GetSize()
	While j > 0
		j -= 1
		If ( PlayerMarker.GetDistance( MarkerList.GetAt( j ) As ObjectReference ) < fRPMinDistance )
			i = ExcludedMarkerList.Find(None)
			If i > -1
				ExcludedMarkerList[i] = ( MarkerList.GetAt( j ) As ObjectReference )
			EndIf
		EndIf
	Endwhile
	If ExternalMarkerList.GetSize() > 0
		j = iMin(100,ExternalMarkerList.GetSize())
		While j > 0
			j -= 1
			If ( ( ExternalMarkerList.GetAt( j ).GetType() != 61 ) ||\
			!bCanTeleportToExtMarker( ExternalMarkerList.GetAt( j ) As ObjectReference ) ||\
			( PlayerMarker.GetDistance( ExternalMarkerList.GetAt( j ) As ObjectReference ) < fRPMinDistance ))
				i = ExcludedMarkerList.Find(None)
				If i > -1
					ExcludedMarkerList[i] = ExternalMarkerList.GetAt( j ) As ObjectReference 
				EndIf
			EndIf
		EndWhile
	EndIf		
Endfunction

Function InitializeDynamicMarkers()
	DynamicMarkerList = New ObjectReference[9]
	DynamicMarkerList[0] = CellLoadMarker2
	DynamicMarkerList[1] = DetachMarker3
	DynamicMarkerList[2] = LocationMarker2
	DynamicMarkerList[3] = SleepMarker
	DynamicMarkerList[4] = CustomMarker
	DynamicMarkerList[5] = CellLoadMarker
	DynamicMarkerList[6] = LocationMarker
	DynamicMarkerList[7] = DetachMarker1
	DynamicMarkerList[8] = DetachMarker2
EndFunction

Function SendToNearestLocation()
	InitializeDynamicMarkers()
	InitializeExcludedMarkers()
	If !TryToMoveByDistanceNear()
		If !TryToMoveByLocation()
			If !TryToMoveByDistanceCity()
				If !TryToMoveByOrder()
					If !TryToMoveByDistanceFar()
						If ( ExcludedMarkerList.find(SleepMarker) < 0 )
							If bIsArrived(SleepMarker)
								Return
							EndIf
						EndIf
						If ( ExcludedMarkerList.find(CustomMarker) < 0 )
							If bIsArrived(CustomMarker)
								Return
							EndIf
						EndIf
						RandomTeleport()
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Int Function RespawnMenu(Int aiMessage = 0, Int aiButton = 0)
	Int iIndex = 1
	While True
		If aiButton == -1 ; Can prevent problems if recycling aiButton
		ElseIf aiMessage == 0
			aiButton = moaRespawnMenu0.Show()
			If aiButton == -1
			ElseIf aiButton < ( ConfigMenu.sRespawnPoints.Length - 5 ) ;Whiterun,...,Raven Rock
				Return aiButton
			ElseIf aiButton == ( ConfigMenu.sRespawnPoints.Length - 5 ) ;More
				aiMessage = 1
			EndIf
		ElseIf aiMessage == 1
			aiButton = moaRespawnMenu1.Show()
			If aiButton == -1
			ElseIf aiButton == 3
				aiMessage = 2
			ElseIf aiButton < 5 ;Random,...,Nearby
				Return ( aiButton + ( ConfigMenu.sRespawnPoints.Length - 5 ))
			ElseIf aiButton == 5 ;Less
				aiMessage = 0
			EndIf
		ElseIf aiMessage == 2
			If ExternalMarkerList.GetSize() > 8
				aiButton = moaRespawnMenu13_Alt.Show(iIndex)
				If aiButton == -1
				ElseIf aiButton == 0 ;Prev
					iIndex = ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),-1)
				ElseIf aiButton == 1 ;Next
					iIndex = ichangeVar(iIndex,1,ExternalMarkerList.GetSize(),1)
				ElseIf aiButton == 2 ;OK
					Return ( iIndex + ( ConfigMenu.sRespawnPoints.Length - 1 ))
				ElseIf aiButton == 3 ;External(Random)
					Return -1
				ElseIf aiButton == 4 ;Back
					aiMessage = 1
				EndIf
			Else
				aiButton = moaRespawnMenu13.Show()
				If aiButton == -1
				ElseIf aiButton < 8 ;External(1,...,8)
					Return ( aiButton + ( ConfigMenu.sRespawnPoints.Length ))
				ElseIf aiButton == 8 ;External(Random)
					Return -1
				ElseIf aiButton == 9 ;Back
					aiMessage = 1
				EndIf
			EndIf
		EndIf
	EndWhile
EndFunction

Int Function ichangeVar(Int iVar,Int iMin,Int iMax, Int iAmount )
	iVar = ( iVar + iAmount )
	If ( iVar > iMax )
		iVar = iMin
	ElseIf ( iVar < iMin )
		iVar = iMax
	EndIf
	Return iVar
EndFunction

Bool Function bCheckSKSE()
	bSKSELoaded = SKSE.GetVersion()
	If bSKSELoaded
		Return ( SKSE.GetVersion() == 1 && SKSE.GetVersionRelease() >= 43 ) || ( SKSE.GetVersion() == 2 && SKSE.GetVersionRelease() >= 54 )
	Else
		Debug.Notification("$mrt_MarkofArkay_Notification_SKSE_Error")
		Debug.Trace("MarkofArkay: [Error] SKSE not found.")
		Return False
	EndIf
EndFunction

Function EquipItems(Actor ActorRef, Bool RightHand, Bool LeftHand)
	If bSKSEOK	
		Bool bLW = False
		If RightHand 
			If	ActorRef.GetItemCount(RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(RightHandEquipedItem)
				ActorRef.EquipItemEx(RightHandEquipedItem, 1)
				Utility.Wait(0.2)
			EndIf
		ElseIf LeftHand && !(RightHandEquipedItem As Spell)
			If	ActorRef.GetItemCount(LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(LeftHandEquippedItem)
				ActorRef.EquipItemEx(LeftHandEquippedItem, 1)
				bLW = True
				Utility.Wait(0.2)
			EndIf
		EndIf
		If LeftHand && !bLW && ActorRef.GetItemCount(LeftHandEquippedItem) > 0
			ActorRef.EquipItemEx(LeftHandEquippedItem, 2)
			Utility.Wait(0.2)
		EndIf
		Int i = Equipment.length
		While i > 0
			i -= 1
			If Equipment[i] As Armor
				If ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
					ActorRef.EquipItemEx(Equipment[i])
					Utility.Wait(0.2)
				EndIf
			EndIf
		EndWhile
	Else
		If RightHand 
			If	ActorRef.GetItemCount(RightHandEquipedItem) > 0 && !ActorRef.IsEquipped(RightHandEquipedItem)
				ActorRef.EquipItem(RightHandEquipedItem, False, True)
				Utility.Wait(0.2)
			EndIf
		ElseIf LeftHand && !(RightHandEquipedItem As Spell)
			If	ActorRef.GetItemCount(LeftHandEquippedItem) > 0 && !ActorRef.IsEquipped(LeftHandEquippedItem)
				ActorRef.EquipItem(LeftHandEquippedItem, False, True)
				Utility.Wait(0.2)
			EndIf
		EndIf
		Int i = Equipment.length
		While i > 0
			i -= 1
			If Equipment[i] As Armor
				If ActorRef.GetItemCount(Equipment[i]) > 0 && !ActorRef.IsEquipped(Equipment[i])
					ActorRef.EquipItem(Equipment[i],False, True)
					Utility.Wait(0.2)
				EndIf
			EndIf
		EndWhile
	EndIf
EndFunction
