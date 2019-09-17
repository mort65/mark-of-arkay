ScriptName zzzmoaReviverScript Extends ReferenceAlias 

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaskillcursescript Property SkillScript Auto Hidden
zzzmoaitemcursescript Property ItemScript Auto Hidden
zzzmoarespawnscript Property RespawnScript Auto Hidden
zzzmoanpcscript Property NPCScript Auto Hidden
zzzmoa_HealthMonitor Property HealthMonitorScript Auto
zzzmoadiseasecursescript	Property DiseaseScript Auto
Quest Property moaReviveMCMscript Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaThiefNPC01 Auto
Quest Property moaSoulMark01 Auto
Message Property moaReviveMenu1 Auto
GlobalVariable Property moaState Auto
GlobalVariable Property moaArkayMarkRevive  Auto
GlobalVariable Property moaDragonSoulRevive  Auto
GlobalVariable Property moaBSoulGemRevive  Auto
GlobalVariable Property moaGSoulGemRevive  Auto
GlobalVariable Property moaSeptimRevive  Auto
GlobalVariable Property moaBleedoutHandlerState Auto
GlobalVariable Property moaBleedouAnimation Auto
MiscObject Property Gold001 Auto
MiscObject Property MarkOfArkay Auto
SoulGem Property BlackFilledGem Auto
SoulGem Property GrandFilledGem Auto
Scroll Property SacrificeScroll Auto
Scroll Property RevivalScroll Auto
Actor Property PlayerRef Auto
VisualEffect Property VisMagDragonAbsorbEffect Auto
VisualEffect Property VisMagDragonAbsorbManEffect Auto
EffectShader Property EffectHealCirclFXS Auto
Sound Property SoundNPCDragonDeathSequenceWind Auto
Sound Property SoundNPCDragonDeathSequenceExplosion Auto
Sound Property SoulAbsorbWind Auto
Sound Property SoulAbsorbExplosion Auto
FormList Property ArkayAmulets Auto
FormList Property QuestBlackList Auto
FormList Property MarkerList Auto
FormList Property LocationBlackList Auto
FormList Property CityMarkersList Auto
MagicEffect Property FortifyHealthFFSelf Auto
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
Keyword Property VendorItemArrow Auto
Keyword Property VendorItemWeapon Auto
MagicEffect Property AutoReviveSelf Auto
ImageSpaceModifier Property FadeOut Auto
ImageSpaceModifier Property FastFadeOut Auto
ImageSpaceModifier Property BlackScreen Auto
ImageSpaceModifier Property FadeIn Auto
ImageSpaceModifier Property LowHealthImod Auto
ObjectReference Property LostItemsMarker Auto
ObjectReference Property LostItemsChest Auto
ObjectReference Property ValuableItemsChest Auto
MiscObject Property StolenItemsMisc Auto
MiscObject Property StolenSoulsMisc Auto
Actor Property Victim Auto Hidden
Actor Property Guard Auto Hidden
Actor Property Attacker Auto Hidden
Quest Property moaRetrieveLostItems Auto
Quest Property moaRetrieveLostItems01 Auto
Quest Property WerewolfQuest Auto
Quest Property VampireLordQuest Auto
FormList Property PotionList Auto
Quest Property CidhnaMineJailEventScene Auto
ReferenceAlias Property AttackerActor Auto
ReferenceAlias Property AttackerActor01 Auto
ReferenceAlias Property ThiefNPC Auto
ReferenceAlias Property ThiefNPC01 Auto
ObjectReference Property SleepMarker Auto
ObjectReference Property DetachMarker2 Auto
ObjectReference Property CellLoadMarker Auto
ObjectReference Property LocationMarker Auto
ObjectReference Property CellLoadMarker2 Auto
ObjectReference Property LocationMarker2 Auto
ObjectReference Property ThiefMarker Auto
Actor Property Thief Auto Hidden
Actor Property PreviousThief Auto Hidden
Actor Property Runil Auto
Faction Property RunilMerchantFaction Auto
Faction Property JobMerchantFaction Auto
Faction Property PlayerEnemyFaction Auto
GlobalVariable Property TimeScale Auto
MagicEffect Property VoiceMakeEthereal Auto
Cell Property DefaultCell Auto
Float Property DefaultTimeScale = 20.0 Auto Hidden
Topic Property DeathTopic Auto
Form Property LeftHandEquippedItem Auto Hidden
Form Property RightHandEquipedItem Auto Hidden
Form Property EquippedAmmo Auto Hidden
Bool Property bSoulMark = False Auto Hidden
Bool Property bIsConditionSafe = False Auto Hidden
Int Property iArkayMarkCount = 0 Auto Hidden
Int Property iBSoulGemCount = 0 Auto Hidden
Int Property iGSoulGemCount = 0 Auto Hidden
Float Property fDragonSoulCount = 0.0 Auto Hidden
Int Property iSeptimCount = 0 Auto Hidden
Bool Property bCidhnaJail = False Auto Hidden
Bool Property bRemoveItems Auto Hidden
Int Property iReducedSkill Auto Hidden
Spell Property Dumbness Auto
Bool Property bInBleedout = False Auto Hidden
Bool Property bInBleedoutAnim = False Auto Hidden
Perk Property Invulnerable Auto
GlobalVariable Property moaIgnoreBleedout Auto
Quest Property moaBossChest01 Auto
Quest Property DGIntimidateQuest Auto
Quest Property FreeformRiften19 Auto
Quest Property Favor017 Auto
LocationAlias Property PlayerLocRef Auto
Float fHealrate = 0.0
Int iIsBeast = 0
Bool bSheated = False
Bool bSacrifice = False

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
Int iRespawnPointsCount
String strRemovedItem

State Bleedout1
	Event OnPlayerLoadGame()
		SetGameVars()
	EndEvent
	
	Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	EndEvent
	
	Event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
	EndEvent
	
	Event OnSleepStop(Bool abInterrupted)
	EndEvent
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
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
	
	Event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
	EndEvent
	
	Event OnSleepStop(Bool abInterrupted)
	EndEvent
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	EndEvent
EndState

Event OnInit()
	moaState.SetValue(1)
	If ConfigMenu.bTriggerOnBleedout
		PlayerRef.GetActorBase().SetEssential(True)
		PlayerRef.SetNoBleedoutRecovery(True)
	ElseIf ConfigMenu.bTriggerOnHealthPerc
		PlayerRef.StartDeferredKill()
	EndIf
	moaBleedoutHandlerState.SetValue(0)
	PriorityArray = New Float[5]
	SkillScript = GetOwningQuest() As zzzmoaskillcursescript
	ItemScript = GetOwningQuest() As zzzmoaitemcursescript
	RespawnScript = GetOwningQuest() As zzzmoarespawnscript
	NPCScript = GetOwningQuest() As zzzmoanpcscript
	SetGameVars()
	SetVars()
	RegisterForSleep()
	If ConfigMenu.bLevelReduce
		SkillScript.RegisterForLevel()
	EndIf
	DetachMarker2.Enable()
	DetachMarker2.MoveTo(PlayerRef)
	DetachMarker2.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
	DetachMarker2.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
	If Runil && !Runil.IsDead()
		Runil.AddToFaction(JobMerchantFaction)
		Runil.AddToFaction(RunilMerchantFaction)
		Runil.GetActorBase().SetEssential(True)
	EndIf
EndEvent

Event OnPlayerLoadGame()
	ConfigMenu.OnGameReload()
	If ( ConfigMenu.iSaveOption > 1 )
		Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
	EndIf
	If ConfigMenu.bIsEffectEnabled
		PlayerRef.AddPerk(Invulnerable) ;because when loading a save game usually npcs start moving before player
	EndIf
	SetGameVars()
	DiseaseScript.RegisterForModEvent("MOA_RecalcCursedDisCureCost", "RecalcCursedDisCureCost")
	RegisterForSingleUpdate(3.0)
EndEvent

Event OnDeath(Actor akKiller)
	clearAll()
EndEvent

Function clearAll()
	UnregisterForUpdate()
	Restore(bRevivePlayer = False, bReviveFollower = False, bEffect = False)
EndFunction

Event OnEnterBleedout()
	If !bInBleedout
		bInBleedout = True
		PlayerRef.AddPerk(Invulnerable)
		Game.DisablePlayerControls()
		iIsBeast = NPCScript.iInBeastForm()
		BleedoutHandler(ToggleState())
		If GetState() == ""
			Game.EnablePlayerControls()
			Game.EnableFastTravel(True)
			ToggleSaving(True)
			moaBleedoutHandlerState.SetValue(0)
			LowHealthImod.Remove()
			RegisterForSingleUpdate(5.0)
			bInBleedout = False
		EndIf
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	If GetState() == ""
		Attacker = akAggressor As Actor
		checkHealth()
	EndIf
EndEvent

Event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
	If ( PlayerRef.GetParentCell() != DefaultCell )
		SleepMarker.Enable()
		SleepMarker.MoveTo(PlayerRef)
		SleepMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
		SleepMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
		If ConfigMenu.bAutoSwitchRP
			ConfigMenu.iTeleportLocation = ( ConfigMenu.getSleepRPIndex() )
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
	If GetState() == ""
		PlayerRef.RemovePerk(Invulnerable)
	EndIf
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference) ; using equipped spells As workaround a bug which happens when player goes to bleedout while fighting with spell
	If ( !PlayerRef.IsBleedingOut() && GetState() == "")
		Utility.Wait(0.5)
		If akBaseObject As Ammo 
			If PlayerRef.WornHasKeyword(VendorItemArrow)
				If PlayerRef.IsEquipped(akBaseObject) 
					EquippedAmmo = akBaseObject
				EndIf
			Else
				EquippedAmmo = None
			EndIf
		Else
			If !PlayerRef.WornHasKeyword(VendorItemArrow)
				EquippedAmmo = None
			EndIf
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
	EndIf
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference) ;SKSE
	If (!PlayerRef.IsBleedingOut() && GetState() == "")
		If !PlayerRef.WornHasKeyword(VendorItemArrow)
			EquippedAmmo = None
		EndIf
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

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If ( Getstate() == "" )
		LocationMarker2.Enable()
		LocationMarker2.MoveTo(LocationMarker)
		LocationMarker2.SetPosition(LocationMarker.GetPositionX(), LocationMarker.GetPositionY(), LocationMarker.GetPositionZ())
		LocationMarker2.SetAngle(0.0, 0.0, LocationMarker.GetAngleZ())
		LocationMarker.Enable()
		LocationMarker.MoveTo(PlayerRef)
		LocationMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
		LocationMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
		If ( ConfigMenu.iSaveOption > 1 )
			Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
		EndIf
		If ConfigMenu.bTriggerOnBleedout && !PlayerRef.IsEssential()
			PlayerRef.GetActorBase().SetEssential(True)
			PlayerRef.SetNoBleedoutRecovery(True)
		EndIf
		If ( moaThiefNPC01.IsRunning() ) && !moaBossChest01.IsRunning()
			If (moaThiefNPC01.GetStage() == 1) && !Thief || Thief.IsDisabled() || Thief.IsDeleted()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkOfArkay: " +\
				Thief + " who stoled player's items, is disabled, deleted or no longer exist." )
				If ConfigMenu.bLoseForever && !ConfigMenu.bDisableUnsafe
					StopAndConfirm(moaThiefNPC01, 3, 15)
				Else
					If Utility.RandomInt(0,99) < ConfigMenu.fBossChestChanceSlider
						moaBossChest01.Start()
						If moaBossChest01.IsRunning()
							If moaThiefNPC01.IsRunning()
								StopAndConfirm(moaThiefNPC01,3,25)
							EndIf
							StopAndConfirm(moaRetrieveLostItems,3,10)
							StopAndConfirm(moaRetrieveLostItems01,3,10)
							moaBossChest01.SetStage(5)
							Return
						EndIf
					EndIf
					If ConfigMenu.bSpawnHostile && (ThiefMarker.GetParentCell() != DefaultCell)
						If moaThiefNPC01.IsRunning()
							StopAndConfirm(moaThiefNPC01,3,25)
						EndIf
						StopAndConfirm(moaRetrieveLostItems,3,10)
						StopAndConfirm(moaRetrieveLostItems01,3,10)
						If NPCScript.bSpawnThief(ThiefMarker) && Thief
							ThiefMarker.MoveTo(Thief)
							ItemScript.AddStolenItemMarker(Thief)
							Actor ThiefRef
							Int i = 0
							While i < NPCScript.ThiefActors.Length
								ThiefRef = NPCScript.ThiefActors[i].GetActorReference()
								ThiefRef && ThiefRef.AddToFaction(PlayerEnemyFaction)
								i += 1
							EndWhile
							moaThiefNPC01.Start()
							moaRetrieveLostItems01.Start()
							moaRetrieveLostItems01.SetStage(1)
						ElseIf moaThiefNPC01.IsRunning()
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							StopAndConfirm(moaThiefNPC01, 3, 20)
						EndIf
					Else
						StopAndConfirm(moaThiefNPC01, 3, 20)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Event OnCellLoad()
	If ( Getstate() == "" )
		CellLoadMarker2.Enable()
		CellLoadMarker2.MoveTo(CellLoadMarker)
		CellLoadMarker2.SetPosition(CellLoadMarker.GetPositionX(), CellLoadMarker.GetPositionY(), CellLoadMarker.GetPositionZ())
		CellLoadMarker2.SetAngle(0.0, 0.0, CellLoadMarker.GetAngleZ())
		CellLoadMarker.Enable()
		CellLoadMarker.MoveTo(PlayerRef)
		CellLoadMarker.SetPosition(PlayerRef.GetPositionX(), PlayerRef.GetPositionY(), PlayerRef.GetPositionZ())
		CellLoadMarker.SetAngle(0.0, 0.0, PlayerRef.GetAngleZ())
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
EndFunction

Function checkHealth()
	If ConfigMenu.bTriggerOnHealthPerc && ConfigMenu.bIsRevivalEnabled
		If playerRef.GetActorValuePercentage("Health") <= ConfigMenu.fHealthPercTrigger
			If !bInBleedout
				bInBleedout = True
				fHealrate = PlayerRef.GetActorValue("HealRate")
				PlayerRef.SetActorValue("HealRate",0.0)
				bInBleedoutAnim = True
				bSheated = False
				PlayerRef.AddPerk(Invulnerable)
				Game.DisablePlayerControls()
				iIsBeast = NPCScript.iInBeastForm()
				If ConfigMenu.bIsRagdollEnabled
					BleedoutHandler(ToggleState())
				Else
					Bool bSafe = (!iIsBeast && \
					!PlayerRef.GetActorValue("paralysis") && \
					!PlayerRef.GetAnimationVariableBool("bIsSynced"))
					bSafe && Debug.SendAnimationEvent(PlayerRef, "BleedoutStart")
					Utility.Wait(2.0)
					BleedoutHandler(ToggleState())
					bSafe && Debug.SendAnimationEvent(PlayerRef, "BleedoutStop")
				EndIf
				If GetState() == ""
					Game.EnablePlayerControls()
					Game.EnableFastTravel(True)
					ToggleSaving(True)
					moaBleedoutHandlerState.SetValue(0)
					LowHealthImod.Remove()
					PlayerRef.SetActorValue("HealRate",fHealrate)
					If !bSheated
						PlayerRef.DrawWeapon()
					EndIf
					RegisterForSingleUpdate(5.0)
					bInBleedoutAnim = False
					bInBleedout = False
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Function restore(Bool bRevivePlayer = True, Bool bReviveFollower = True, Bool bEffect = False, Int iPotionIndex = -1, Float fWait = 0.0, String sTrace = "")
	If bRevivePlayer && !PlayerRef.IsDead()
		If bEffect
			moaReviveAfterEffect.Cast(PlayerRef)
		EndIf
		RequipSpells()
		PlayerRef.ResetHealthAndLimbs()
		If iPotionIndex > -1
			Utility.Wait(0.1)
			PlayerRef.EquipItem(PotionList.GetAt(ipotionIndex) As Potion, False, True)
		EndIf
		If !bIsCameraStateSafe()
			Game.ForceThirdPerson()
		EndIf
		If bReviveFollower 
			NPCScript.ResurrectFollowers()
		EndIf
		If !ConfigMenu.bDoNotStopCombatAfterRevival
			PlayerRef.StopCombatAlarm()
		EndIf
	EndIf
	Attacker = None
	If PlayerRef.GetActorValue("paralysis")
		PlayerRef.SetActorValue("paralysis",0)
		If PlayerRef.GetActorValue("paralysis")
			PlayerRef.ForceActorValue("paralysis",0)
		EndIf					
	EndIf
	If bEffect && bRevivePlayer && !PlayerRef.IsDead()
		BleedoutProtection.Cast(PlayerRef)
	EndIf
	fWait && Utility.Wait(fWait)
	GoToState("")
	If sTrace && ConfigMenu.bIsLoggingEnabled 
		Debug.Trace(sTrace)
	EndIf
EndFunction

Function BleedoutHandler(String CurrentState)
	If moaIgnoreBleedout.GetValueInt()
		GoToState("")
		Return
	ElseIf DGIntimidateQuest.IsRunning()
		stopBrawlQuest(DGIntimidateQuest,180)
		GoToState("")
		Return
	ElseIf FreeformRiften19.GetStage() == 30
		stopBrawlQuest(FreeformRiften19,250)
		GoToState("")
		Return
	ElseIf Favor017.GetStage() == 10
		stopBrawlQuest(Favor017,200)
		GoToState("")
	EndIf
	If ConfigMenu.bIsRagdollEnabled && \
	(!PlayerRef.GetActorValue("paralysis") && !iIsBeast && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
		PlayerRef.PushActorAway(PlayerRef,0)
		PlayerRef.SetActorValue("paralysis",1)
	EndIf
	Game.DisablePlayerControls()
	ToggleSaving(False)
	Game.EnableFastTravel(False)
	If ConfigMenu.iTotalBleedOut < 99999999
		ConfigMenu.iTotalBleedOut += 1
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player entered bleedout.")
	If Thief
		PreviousThief = Thief
	EndIf
	moaHostileNPCDetector.Stop()
	moaHostileNPCDetector01.Stop()
	If Attacker
		AttackerActor.ForceRefTo(Attacker)
		AttackerActor01.ForceRefTo(Attacker)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkOfArkay: Last attacker = ( '" +\
			Attacker.GetActorBase().GetName() +\
			"', " + Attacker + ", " +\
			Attacker.GetRace() + ", )" ) 
	Else
		AttackerActor.Clear()
		AttackerActor01.Clear()
	EndIf
	If ConfigMenu.iHostileOption == 2
		moaHostileNPCDetector.Start()
	ElseIf ConfigMenu.iHostileOption == 1
		moaHostileNPCDetector01.Start()
	EndIf
	bIsConditionSafe = bIsConditionSafe()
	If ( ConfigMenu.bIsRevivalEnabled && PlayerRef.IsSwimming()) ;SKSE
		If bIsConditionSafe && ConfigMenu.bDeathEffect && (ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack)
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
	If !ConfigMenu.bIsRevivalEnabled
		restore(bRevivePlayer = False, bReviveFollower = False, sTrace = "MarkOfArkay: Player won't be revived because revival is not enabled.")
		Return
	EndIf
	NPCScript.DetectFollowers()
	strRemovedItem = ""
	bHasAutoReviveEffect = PlayerRef.HasMagicEffect(AutoReviveSelf)
	If bInBleedoutAnim
		If !PlayerRef.GetActorValuePercentage("health")
			While !PlayerRef.GetActorValuePercentage("health")
				PlayerRef.DamageActorValue("health",-1000)
			EndWhile
		EndIf
		Float fMinHealth = (ConfigMenu.fHealthPercTrigger * (PlayerRef.GetActorValue("health") / PlayerRef.GetActorValuePercentage("health"))) ;fHealthPercTrigger * max health
		If PlayerRef.GetActorValue("health") < (fMinHealth - 10)
			PlayerRef.RestoreActorValue( "health", (fMinHealth - 10) - PlayerRef.GetActorValue("health") )
		ElseIf PlayerRef.GetActorValue("health") > (fMinHealth - 10)
			PlayerRef.DamageActorValue( "health",  PlayerRef.GetActorValue("health") - (fMinHealth - 10))
		EndIf
	Else
		If PlayerRef.GetActorValue("health") < -10
			PlayerRef.RestoreActorValue( "health", -10 - PlayerRef.GetActorValue("health") )
		EndIf
	EndIf
	If ConfigMenu.bAutoDrinkPotion && !NPCScript.bInBeastForm()
		Int iPotion = iHasHealingPotion()
		If iPotion > -1
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving by auto drinking a healing potion...")
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
			If !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || (playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger ))
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				Restore(bRevivePlayer = True, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, fWait = 5, sTrace = "MarkOfArkay: Player revived before starting of the revival by auto drinking healing potions.")
				Return
			Else	
				If ConfigMenu.bIsNotificationEnabled
					Debug.Notification("$mrt_MarkofArkay_Notification_Revive_Potion")
				EndIf
				If ConfigMenu.iRevivesByPotion < 99999999
					ConfigMenu.iRevivesByPotion += 1
				EndIf
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				Restore(bRevivePlayer = True, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, fWait = 5, iPotionIndex = iPotion, sTrace = "MarkOfArkay: Player revived by auto drinking a healing potion.")								
				Return
			EndIf
		EndIf
	EndIf
	If ( bIsRevivable() || bPotionRevive || bHasAutoReviveEffect || Victim || ( ConfigMenu.bIsMenuEnabled && ( ConfigMenu.moaSnoozeState.GetValue() != 0 )))
		If !bPotionRevive || bHasAutoReviveEffect || Victim || NPCScript.bInBeastForm()
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		Else
			If bWasSwimming || bInBleedoutAnim
				Game.EnablePlayerControls(abMovement = False, abFighting = False, abCamSwitch = False, abLooking = False, abSneaking = False,\
				abMenu = True, abActivate = False, abJournalTabs = False)
				PlayerRef.RemovePerk(Invulnerable)
			Else
				Game.EnablePlayerControls()
				PlayerRef.RemovePerk(Invulnerable)
			EndIf
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		EndIf
		If !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || (playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger));player revived with potion or another script and is alive after 6 secs
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Restore(bRevivePlayer = True, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, fWait = 5, sTrace = "MarkOfArkay: Player is not in bleedout. (probably revived by manual drinking of a healing potion.)")
			Return
		Else
			PlayerRef.AddPerk(Invulnerable)
			bInBleedout = True
			If bHasAutoReviveEffect ;player has cast a revive spell or scroll
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reviving player by an auto revival spell or scroll...")
				If ConfigMenu.bIsEffectEnabled
					VisMagDragonAbsorbEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
					VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
					SoulAbsorbWind.Play(PlayerRef) 
					SoulAbsorbExplosion.Play(PlayerRef) 
					EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
				EndIf
				Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
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
					VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
					SoulAbsorbWind.Play(PlayerRef) 
					SoulAbsorbExplosion.Play(PlayerRef) 
					EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1.0)
				EndIf
				Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
				;ItemScript.RestoreLostItems(PlayerRef)
				;RequipSpells()
				bSacrifice = True
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
							VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
							SoulAbsorbWind.Play(PlayerRef) 
							SoulAbsorbExplosion.Play(PlayerRef) 
							EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
						EndIf
						Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
						;RequipSpells()
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
					If !PriorityArray.Length == 5
						PriorityArray = New Float[5]
					EndIf
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
							VisMagDragonAbsorbManEffect.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider)
							SoulAbsorbWind.Play(PlayerRef) 
							SoulAbsorbExplosion.Play(PlayerRef) 
							EffectHealCirclFXS.Play(PlayerRef, ConfigMenu.fRecoveryTimeSlider + 1)
						EndIf
						Utility.Wait(ConfigMenu.fRecoveryTimeSlider)
						;RequipSpells()
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
		EndIf
	Else
		Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		If !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger )
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Restore(bRevivePlayer = False, bReviveFollower = False, bEffect = False, fWait = 5, sTrace = "MarkOfArkay: Player can't be revived but isn't in bleedout.")
			Return
		Else
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player can't be revived..." )
			RevivePlayer(False)
		EndIf
	EndIf
EndFunction

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

Function LogCurrentState()
	Debug.Trace( "MarkOfArkay: Variables = "\ 
		+ "[ '" + GetState() + "', "\
		+ Game.GetCameraState() + ", "\
		+ ( PlayerRef.IsSwimming() As Int ) + ", "\
		+ ( WerewolfQuest.IsRunning() As Int ) + ", "\
		+ (( VampireLordQuest && VampireLordQuest.IsRunning() ) As Int ) + ", "\
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
		+ "[ " + ( LostItemsChest.GetNumItems() ) + ", "\
		+ ( ItemScript.fLostSouls As Int ) + ", ], ]" )
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
			bInBleedout = False
			Utility.Wait(ConfigMenu.fValueSnoozeSlider)
			If (GetState() != curState)
				iRevive = -1
				bBreak = True
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Revival script is in another state.")
			ElseIf !PlayerRef.IsBleedingOut() && !bInBleedout
				If ConfigMenu.iTotalRevives < 99999999
					ConfigMenu.iTotalRevives += 1
				EndIf
				iRevive = -1
				bBreak = True
				Restore(bRevivePlayer = False, bReviveFollower = False, bEffect = False, fwait = 5, sTrace = "MarkOfArkay: Player revived before showing the trade menu.")
			Else
				bInBleedout = True
				SetVars()
			EndIf
		ElseIf (iChoice == 6) ;Nothing
			iRevive = 0
			bBreak = True
		EndIf
	EndWhile
	Return iRevive
EndFunction

Function AutoRemoveItem(Int i) ;trade without menu
	Int j = i - 1
	Int count = 0
	Bool bBreak = False
	Int iRandom
	If ( i>0 ) && (((PriorityArray [j] As Int ) % 10) == ((PriorityArray [i] As Int ) % 10)) ; this item isn't the last item in the array and next item has the same priority As this item
		While (j>-1) && !bBreak ; checking if there is any other item with the same priority
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
EndFunction

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
		Return
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
				Return
			Else
				totalRemainingLives += ( iArkayMarkCount / ConfigMenu.fValueMarkSlider ) As Int
			EndIf
		EndIf
		If ( bBSoulGemRevive )
			If ConfigMenu.fValueBSoulGemSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iBSoulGemCount / ConfigMenu.fValueBSoulGemSlider ) As Int
			EndIf
		EndIf
		If ( bGSoulGemRevive )
			If ConfigMenu.fValueGSoulGemSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iGSoulGemCount / ConfigMenu.fValueGSoulGemSlider ) As Int
			EndIf
		EndIf
		If ( bDragonSoulRevive )
			If ConfigMenu.fValueSoulSlider == 0.0
				Return
			Else
				totalRemainingLives += ( fDragonSoulCount / ConfigMenu.fValueSoulSlider ) As Int
			EndIf
		EndIf
		If ( bSeptimRevive )
			If ConfigMenu.fValueGoldSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iSeptimCount / ConfigMenu.fValueGoldSlider ) As Int
			EndIf
		EndIf
		If ( totalRemainingLives > 0 )
			Debug.Notification("$mrt_MarkofArkay_Notification_totalRemainingTrades")
			Debug.Notification(totalRemainingLives)
		Else
			Debug.Notification("$mrt_MarkofArkay_Notification_NoRemainingTrades")
		EndIf
	EndIf
EndFunction

Bool Function bCursed()
	Return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || bHasArkayCurse() || SkillScript.bSkillReduced()
EndFunction

Bool Function bItemRemoved()
	Return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || SkillScript.bSkillReduced()
EndFunction

Bool Function bHasArkayCurse()
	Return PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt)
EndFunction

Bool Function bLoseForever()
	Return !ConfigMenu.bDisableUnsafe && ConfigMenu.bLoseForever 
EndFunction

Function RevivePlayer(Bool bRevive)
	If bRevive
		If ConfigMenu.bShiftBack
			ShiftBack()
		EndIf
		If !bHasAutoReviveEffect || bSacrifice
			PlayerRef.DispelSpell(ArkayCurseTemp)
			PlayerRef.DispelSpell(ArkayCurseTempAlt)
			If ( PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt) )
				PlayerRef.RemoveSpell(ArkayCurse)
				PlayerRef.RemoveSpell(ArkayCurseAlt)
				If !LostItemsChest.GetNumItems() || bSacrifice
					ItemScript.RestoreLostItems(PlayerRef)
					If moaSoulMark01.IsRunning()
						NPCScript.RemoveDeadClone()
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
						EndIf
						StopAndConfirm(moaThiefNPC01, 3, 25)
					EndIf
					If Thief
						RemoveStolenItemMarkers(Thief)
					EndIf
					RemoveStolenItemMarkers(playerRef)
				EndIf
			EndIf
			bSacrifice = False
		EndIf
		Restore(bRevivePlayer = True, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, fWait = 5, sTrace = "MarkOfArkay: Player is revived.")	
		Return
	Else
		If NPCScript.FollowerCanProtectPlayer() || \
		( !ConfigMenu.bKillIfCantRespawn && ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport() )
			PlayerRef.ResetHealthAndLimbs()
			Utility.Wait(0.5)
			Float fOldHP = PlayerRef.GetActorValue("Health")
			Float fNewHP = fMax( 60.0, ((PlayerRef.GetBaseActorValue("Health") * 0.5) + 10.0 ))
			If fOldHP > fNewHP
				PlayerRef.DamageActorValue("Health",fOldHP - fNewHP)
			Else
				PlayerRef.RestoreActorValue("Health",fNewHP - fOldHP)
			EndIf
			If ConfigMenu.iRevivesByFollower < 99999999
				ConfigMenu.iRevivesByFollower += 1
			EndIf
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			If ConfigMenu.bIsLoggingEnabled 
				If NPCScript.FollowerCanProtectPlayer() 
					Debug.Trace("MarkOfArkay: Player is alive because of followers.")
				Else
					Debug.Trace("MarkOfArkay: Player is revived because respawn is currently disabled.")
				EndIf
			EndIf
			Restore(bRevivePlayer = True, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = False, fWait = 5)
			Return
		Else
			NPCScript.HoldFollowers()
			If ( ConfigMenu.iNotTradingAftermath == 0 ) || ( ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport() )
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is dying...")
				Attacker = None
				PlayerRef.DispelAllSpells()
				LowHealthImod.Remove()
				PlayerRef.PushActorAway(PlayerRef,0)
				PlayerRef.EndDeferredKill()
				Utility.Wait(0.1)
				If !PlayerRef.IsDead()
					PlayerRef.KillEssential()
				EndIf
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player died.")
				GoToState("")
			ElseIf ( ConfigMenu.iNotTradingAftermath == 1)
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawning the player...")
				If ( ConfigMenu.bRespawnMenu )
					RespawnScript.SelectRespawnPointbyMenu()
				EndIf
				Game.DisablePlayerControls()
				If ( !bWasSwimming && bIsConditionSafe )
					If ( ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack )
						If ConfigMenu.bDeathEffect
							PlayerRef.ResetHealthAndLimbs()
							PlayerRef.PushActorAway(PlayerRef,0)
							Utility.Wait(0.1)
							PlayerRef.Say(DeathTopic)
						EndIf
						If !bIsCameraStateSafe()
							Game.ForceThirdPerson()
						EndIf
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
					If ConfigMenu.bFadeToBlack
						FastFadeOut.Apply()
						Utility.Wait(1.0)
						FastFadeOut.PopTo(BlackScreen)
					EndIf
					If ConfigMenu.bInvisibility
						PlayerRef.SetAlpha(0.0)
					EndIf
				EndIf
				If ConfigMenu.bShiftBackRespawn
					ShiftBack()
				EndIf
				If bLoseForever()
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Destroying previously lost items...")
					If ( ( LostItemsChest.GetNumItems() > 0 ) || ( ItemScript.fLostSouls > 0.0 ) || SkillScript.bSkillReduced())
						bDidItemsRemoved = True
						If ConfigMenu.iDestroyedItems < 99999999
							ConfigMenu.iDestroyedItems += LostItemsChest.GetNumItems()
							If ItemScript.fLostSouls > 0.0
								ConfigMenu.iDestroyedItems += 1
							EndIf
						EndIf
					Else
						bDidItemsRemoved = False
					EndIf
					LostItemsChest.RemoveAllItems()
					SkillScript.LoseSkills()
					If moaSoulMark01.IsRunning()
						NPCScript.RemoveDeadClone()
						StopAndConfirm(moaSoulMark01)
						LostItemsMarker.MoveToMyEditorLocation()
						LostItemsMarker.Disable()
					EndIf
					If moaThiefNPC01.IsRunning()
						StopAndConfirm(moaThiefNPC01, 3, 25)
					EndIf
					If moaBossChest01.IsRunning()
						StopAndConfirm(moaBossChest01, 3, 15)
					EndIf
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: previously lost items are destroyed.")
				EndIf
				bRemoveItems = ConfigMenu.bLoseItem
				iReducedSkill = ConfigMenu.iReducedSkill
				If !moaSoulMark01.IsRunning() && !moaThiefNPC01.IsRunning() &&  (!moaBossChest01.IsRunning() || moaBossChest01.GetStage() == 0)
					StopAndConfirm(moaBossChest01)
					If Utility.RandomInt(0,99) < ConfigMenu.fBossChestChanceSlider
						If ConfigMenu.bBossChestOnlyCurLoc
							PlayerLocRef.ForceLocationTo(PlayerRef.GetCurrentLocation())
						Else
							PlayerLocRef.ForceLocationTo(None)
						EndIf
						moaBossChest01.Start()
					EndIf
				EndIf
				If ConfigMenu.iHostileOption == 2 && !moaSoulMark01.IsRunning()
					If !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() == 1
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC who can steal from player ...")
						NPCScript.DetectThiefNPC()
						If Thief
							If !ThiefNPC01.GetActorReference()
								ThiefNPC.ForceRefTo(Thief)
							EndIf
							If !moaThiefNPC01.IsRunning()
								moaThiefNPC01.Start()
							EndIf
							ThiefMarker.MoveTo(Thief)
						ElseIf moaThiefNPC01.IsRunning() && !bCursed() ;if cursed, location change event will respawn or stop the quest
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							StopAndConfirm(moaThiefNPC01, 3, 25)
						EndIf
					EndIf
				EndIf
				bSoulMark = bSoulMark()
				If NPCScript.bInBeastForm() || (!moaBossChest01.IsRunning() && (( ConfigMenu.iHostileOption == 2 && ( moaSoulMark01.IsRunning() || !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() != 1)) ||\
						( ConfigMenu.iHostileOption != 2 && ( moaThiefNPC01.IsRunning() || ( ConfigMenu.iHostileOption == 1 && !NPCScript.bIsHostileNPCNearby() ))) || ( PlayerRef.GetParentCell() == DefaultCell )))
					bRemoveItems = False
				EndIf
				If bRemoveItems
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Removing items from the player...")
					ItemScript.loseItems()
					If ConfigMenu.bIsLoggingEnabled 
						Debug.Trace("MarkOfArkay: Removing items from the player finished.")
						Int c = LostItemsChest.GetNumItems()
						String str = "MarkOfArkay: Currently removed items -> "
						If ItemScript.fLostSouls > 0.0
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
						str += (ItemScript.fLostSouls As Int)
						str += " dragon souls)"
						Debug.Trace(str)
					EndIf
				EndIf
				If iReducedSkill > 0
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Reducing player's Skills/Skill XPs...")
					String Skill
					If iReducedSkill < 19
						Skill = SkillScript.sSkillName[iReducedSkill - 1]
					ElseIf iReducedSkill == 19
						Skill = "Random"
					ElseIf iReducedSkill == 20
						Skill = "Lowest"
					ElseIf iReducedSkill == 21
						Skill = "Highest"
					ElseIf iReducedSkill == 22
						Skill = "Lowest_All"
					ElseIf iReducedSkill == 23
						Skill = "Highest_All"
					ElseIf iReducedSkill == 24
						Skill = "All_Low"
					ElseIf iReducedSkill == 25
						Skill = "All_High"
					ElseIf iReducedSkill == 26
						Skill = "All_Random"
					ElseIf iReducedSkill == 27
						Skill = "All_One_By_One"
					EndIf
					If ConfigMenu.bSkillReduceRandomVal
						SkillScript.ReduceSkills(Skill, -1, ConfigMenu.fSkillReduceMinValSlider As Int, ConfigMenu.fSkillReduceMaxValSlider As Int, bOnlyXP = ConfigMenu.bOnlyLoseSkillXP)
					Else
						SkillScript.ReduceSkills(Skill, ConfigMenu.fSkillReduceValSlider As Int, ConfigMenu.fSkillReduceMinValSlider As Int, ConfigMenu.fSkillReduceMaxValSlider As Int, bOnlyXP = ConfigMenu.bOnlyLoseSkillXP)
					EndIf
				EndIf
				If ( PlayerRef.GetParentCell() != DefaultCell )
					If bCursed() || (ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary );Something is removed or stats of player are reduced or going to be reduced
						If ( bSoulMark || \
								((( ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary ) || bHasArkayCurse() ) && !moaThiefNPC01.IsRunning() && (!moaBossChest01.IsRunning() || LostItemsChest.GetNumItems() == 0))) ;Soul mark can be used
							stopAndConfirm(moaBossChest01)
							LostItemsMarker.Enable()
							If !ConfigMenu.bSoulMarkStay || \
								(( !NPCScript.SoulMark02.GetActorReference() || NPCScript.SoulMark02.GetActorReference().GetParentCell() == DefaultCell ) && \
									LostItemsMarker.GetParentCell() == DefaultCell ) 
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Moving soul mark to player's location...")
								If !ConfigMenu.bCorpseAsSoulMark
									NPCScript.RemoveDeadClone()
									LostItemsMarker.MoveTo( PlayerRef, 0, 0, 42 )
								ElseIf ConfigMenu.bCorpseAsSoulMark
									LostItemsMarker.MoveToMyEditorLocation()
									NPCScript.RemoveDeadClone()
									NPCScript.bringDeadClone()	
								EndIf
								moaSoulMark01.Start()
								ConfigMenu.bIsLoggingEnabled && !ConfigMenu.bCorpseAsSoulMark && \
								LostItemsMarker.GetParentCell() != DefaultCell && Debug.Trace("MarkOfArkay: Soul mark dropped at ( " +\
									LostItemsMarker.GetPositionX() + ", " + LostItemsMarker.GetPositionY() + ", " + LostItemsMarker.GetPositionZ()+" ).")
								ConfigMenu.bIsLoggingEnabled && ConfigMenu.bCorpseAsSoulMark && NPCScript.SoulMark02.GetActorReference() && \
								NPCScript.SoulMark02.GetActorReference().GetParentCell() != DefaultCell && Debug.Trace("MarkOfArkay: Body dropped at ( " +\
									NPCScript.SoulMark02.GetReference().GetPositionX() + ", " + NPCScript.SoulMark02.GetReference().GetPositionY() + ", " + NPCScript.SoulMark02.GetReference().GetPositionZ()+" ).")
								If Thief
									RemoveStolenItemMarkers(Thief)
								EndIf
								RemoveStolenItemMarkers(PlayerRef)
							EndIf
						EndIf
					Else
						NPCScript.RemoveDeadClone()
						StopAndConfirm(moaSoulMark01, 3)
						LostItemsMarker.MoveToMyEditorLocation()
						LostItemsMarker.Disable()
						If (ThiefNPC.GetReference() As Actor)
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
						EndIf
						If (ThiefNPC01.GetReference() As Actor)
							RemoveStolenItemMarkers(ThiefNPC01.GetReference() As Actor)
						EndIf
						StopAndConfirm(moaThiefNPC01, 3, 25)
					EndIf
				EndIf
				If moaBossChest01.IsRunning() && moaThiefNPC01.IsRunning()
					;if no physical item is removed boss chest quest not needed
					If LostItemsChest.GetNumItems() == 0
						stopAndConfirm(moaBossChest01)
					Else
						RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
						StopAndConfirm(moaThiefNPC01, 3, 25)
					EndIf
				EndIf
				PlayerRef.ResetHealthAndLimbs()
				If ConfigMenu.bPlayerProtectFollower
					NPCScript.ResurrectFollowers()
				EndIf
				If ConfigMenu.bResurrectActors
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrecting non-unique actors in player's location...")
					If Attacker 
						If ( !Attacker.IsCommandedActor() && !Attacker.GetActorBase().IsUnique() && !Attacker.IsDisabled() && Attacker.IsDead() )
							If (( Attacker.GetParentCell() == PlayerRef.GetParentCell() ) || PlayerRef.GetDistance(Attacker) < 10000.0 )
								Attacker.Resurrect()
							EndIf
						EndIf
					EndIf
					MassRevival.Cast(PlayerRef)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrection finished.")
				EndIf
				If ConfigMenu.bHealActors
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Healing actors in player's location...")
					If Attacker && !Attacker.IsDead()
						If (( Attacker.GetParentCell() == PlayerRef.GetParentCell() ) || PlayerRef.GetDistance(Attacker) < 10000.0 )
							If Attacker.GetActorValue("Health") > 0
								Attacker.RestoreActorValue("Health",999999)
							EndIf
						EndIf
					EndIf
					MassHealing.Cast(PlayerRef)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Last attacker and other actors are healed.")
				EndIf
				If ConfigMenu.bDiseaseCurse
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Infecting player with a cursed disease...")
					DiseaseScript.infectPlayer()
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Infection completed.")
				EndIf
				Utility.Wait(1.0)
				RespawnScript.Respawn()
				Utility.Wait(0.5)
				If PlayerRef.IsDead()
					Return
				EndIf
				Attacker = None
				ResetPlayer()
				PlayerRef.SetAlpha(1.0,True)
				Utility.Wait(1.0)
				NPCScript.ToggleFollower(True)
				If ( ConfigMenu.bRespawnNaked && !NPCScript.bInBeastForm() )
					PlayerRef.UnequipAll()
				EndIf
				If (( ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary ) &&\
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
				ElseIf (( ConfigMenu.bArkayCurse && ConfigMenu.bIsArkayCurseTemporary ) && !bHasArkayCurse() )
					If ConfigMenu.iArkayCurse == 0
						ArkayCurseTemp.Cast(PlayerRef)
					ElseIf ConfigMenu.iArkayCurse == 1
						ArkayCurseTempAlt.Cast(PlayerRef)
					Else
						ArkayCurseTemp.Cast(PlayerRef)
						ArkayCurseTempAlt.Cast(PlayerRef)
					EndIf
				EndIf
				If PlayerRef.GetActorValue("paralysis")
					PlayerRef.SetActorValue("paralysis",0)
					If PlayerRef.GetActorValue("paralysis")
						PlayerRef.ForceActorValue("paralysis",0)
					EndIf
					Utility.Wait(6.5)
				EndIf
				If ( ConfigMenu.bFadeToBlack || ConfigMenu.bInvisibility || ConfigMenu.fRespawnTimeSlider)
					RespawnScript.PassTime(ConfigMenu.fRespawnTimeSlider,6.0)
				EndIf
				If ConfigMenu.bFadeToBlack
					BlackScreen.PopTo(FadeIn)
				EndIf
				RefreshFace()
				Utility.Wait(0.5)
				If bLoseForever() && bDidItemsRemoved
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
				If moaThiefNPC01.IsRunning()
					Thief && ItemScript.AddStolenItemMarker(Thief)
				EndIf
				If bCursed()
					If moaBossChest01.IsRunning()
						If moaBossChest01.getStage() < 5
							moaBossChest01.SetStage(5)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Boss Chest Quest Started.")
						EndIf
					ElseIf moaSoulMark01.IsRunning()
						If ConfigMenu.bLostItemQuest
							moaRetrieveLostItems.Start()
							moaRetrieveLostItems.SetStage(1)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Soul Mark Quest Started.")
						EndIf
					ElseIf moaThiefNPC01.IsRunning()
						If ConfigMenu.bLostItemQuest
							moaRetrieveLostItems01.Start()
							moaRetrieveLostItems01.SetStage(1)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Stolen Items Quest Started.")
						EndIf
					EndIf
					If SkillScript.bSkillReduced()
						SkillScript.DisableAllXP()
					EndIf
				Else
					moaBossChest01.Stop()
				EndIf
				moaHostileNPCDetector.Stop()
				moaHostileNPCDetector01.Stop()
				If !bIsCameraStateSafe()
					Game.ForceThirdPerson()
				EndIf
				If !ConfigMenu.bShowRaceMenu
					If ConfigMenu.bAltEyeFix && ConfigMenu.bARCCOK
						Utility.Wait(0.5)
						ExecuteCommand("player.say 0142b5",1,0,1)
					EndIf
				EndIf
				If !ConfigMenu.bDoNotStopCombat
					PlayerRef.StopCombatAlarm()
				EndIf
				LowHealthImod.Remove()
				If bCidhnaJail 
					If ( PlayerRef.GetParentCell() == RespawnScript.MarkarthJailMarker.GetParentCell() )
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
				If ConfigMenu.bShowRaceMenu
					Utility.Wait(2.0)
					Game.ShowRaceMenu()
				EndIf
				GoToState("")
			Else
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Exiting to the Main menu...")
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
		PlayerRef.UnequipSpell((LeftHandEquippedItem As Spell), 0)
		PlayerRef.EquipSpell((LeftHandEquippedItem As Spell), 0)
	EndIf
	If ( RightHandEquipedItem As Spell )
		PlayerRef.UnequipSpell((RightHandEquipedItem As Spell), 1)
		PlayerRef.EquipSpell((RightHandEquipedItem As Spell), 1)
	EndIf
EndFunction

Bool Function bIsConditionSafe()
	Return !( iIsBeast || PlayerRef.GetActorValue("paralysis") || PlayerRef.GetAnimationVariableBool("bIsSynced") )
EndFunction

Function SetVars()
	SkillScript.SetVars()
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
	ItemScript.SetVars()
	RespawnScript.SetVars()
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
	ConfigMenu.checkMods()
	If !SkillScript
		SkillScript = GetOwningQuest() As zzzmoaskillcursescript
	EndIf
	If !ItemScript
		ItemScript = GetOwningQuest() As zzzmoaitemcursescript
	EndIf
	If !RespawnScript
		RespawnScript = GetOwningQuest() As zzzmoarespawnscript
	EndIf
	If !NPCScript
		NPCScript = GetOwningQuest() As zzzmoanpcscript
	EndIf
	If (moaState.GetValue() == 1 )
		If ConfigMenu.bTriggerOnBleedout && !PlayerRef.IsEssential()
			PlayerRef.GetActorBase().SetEssential(True)
			PlayerRef.SetNoBleedoutRecovery(True)
		EndIf
		ConfigMenu.ToggleFallDamage(ConfigMenu.bIsNoFallDamageEnabled) ;SKSE
	Else
		ConfigMenu.ToggleFallDamage(False)
	EndIf
EndFunction

Bool Function bIsRevivable() ;if player can be revived by trading
	If ConfigMenu.bIsTradeEnabled
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
		EndIf
	EndIf
	Return False
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

Bool Function bIsCameraStateSafe()
	Int CameraState = Game.GetCameraState()
	Return (( CameraState == 0 ) || ( CameraState == 9 ) || ( CameraState == 11 ))
EndFunction

Bool Function bSoulMark() ;Whether drop soul mark or not
	Return !moaBossChest01.IsRunning() && (( ConfigMenu.iHostileOption == 2 && moaSoulMark01.IsRunning() ) ||\
		( ConfigMenu.iHostileOption != 2 && !moaThiefNPC01.IsRunning() ))
EndFunction

Function RemoveStolenItemMarkers(Actor ActorRef)
	ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent = True)
	ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent = True)
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

Function ExecuteCommand(String strCMD, Int aiSilent = 1,Int aiFadeOut = 0,Int aiHideMenu = 0) ;Requires Autorun Console Commands
	Int Handle = ModEvent.Create("ARCC_RunCommand")
	If (Handle)
		ModEvent.PushForm(Handle,PlayerRef) ;sender
		ModEvent.PushString(Handle,"Mark of Arkay") ;strModName
		ModEvent.PushString(Handle, strCMD) ;strCommand
		ModEvent.PushInt(Handle, aiSilent)
		ModEvent.PushInt(Handle, aiFadeOut)
		ModEvent.PushInt(Handle, aiHideMenu)
		ModEvent.Send(Handle)
	EndIf
EndFunction

Function ResetPlayer()
	If PlayerRef.IsSwimming()
		Debug.SendAnimationEvent(PlayerRef, "SwimStart")
	ElseIf bWasSwimming
		Debug.SendAnimationEvent(PlayerRef, "SwimStop")
	EndIf
	PlayerRef.DispelAllSpells()
	PlayerRef.ClearExtraArrows()
	If PlayerRef.IsWeaponDrawn()
		PlayerRef.SheatheWeapon()
	EndIf
	RequipSpells()
	bSheated = True
EndFunction

Function ShiftBack()
	Float i = 5.0
	If ( WerewolfQuest.IsRunning() )
		;Debug.SetGodMode(True)
		PlayerRef.DispelSpell(BleedoutProtection)
		Game.DisablePlayerControls()
		WerewolfQuest.SetStage(100)
		While (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
			Utility.Wait(0.2)
			i -= 0.2
		EndWhile
		;Debug.SetGodMode(False)
		;Game.EnablePlayerControls()
	ElseIf ( VampireLordQuest.IsRunning() )
		;Debug.SetGodMode(True)
		PlayerRef.DispelSpell(BleedoutProtection)
		Game.DisablePlayerControls()
		VampireLordQuest.SetStage(100) ; shift back
		While (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
			Utility.Wait(0.2)
			i -= 0.2
		EndWhile
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
	EndWhile
	Return -1
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

