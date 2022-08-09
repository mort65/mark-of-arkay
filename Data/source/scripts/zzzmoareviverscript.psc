ScriptName zzzmoaReviverScript Extends ReferenceAlias 

Import zzzmoautilscript
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaPermaDeathScript Property PermaDeathScript Auto Hidden
zzzmoaskillcursescript Property SkillScript Auto Hidden
zzzmoaitemcursescript Property ItemScript Auto Hidden
zzzmoarespawnscript Property RespawnScript Auto Hidden
zzzmoanpcscript Property NPCScript Auto Hidden
zzzmoa_HealthMonitor Property HealthMonitorScript Auto
zzzmoadiseasecursescript Property DiseaseScript Auto
zzzmoasexlabinterface Property SexLabInterface Auto
zzzmoaostiminterface Property OStimInterface Auto
zzzmoaflowergirlsinterface Property FlowerGirlsInterface Auto
zzzmoarapescript Property RapeScript Auto Hidden
Quest Property ReviverQuest Auto
Quest Property moaReviveMCMscript Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaThiefNPC01 Auto
Quest Property moaSoulMark01 Auto
Quest Property PermaDeathQuest Auto
Message Property moaReviveMenu1 Auto
Quest Property moaPlayerGhostQuest Auto
Quest Property moaPlayerVoicelessQuest Auto
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
FormList Property LocationBlackList2 Auto
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
Int Property iSeptimCost = 0 Auto Hidden
Int Property iBSoulGemCost = 0 Auto Hidden
Int Property iGSoulGemCost = 0 Auto Hidden
Int Property iDragonSoulCost = 0 Auto Hidden
Int Property iArkayMarkCost = 0 Auto Hidden
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
Location Property EmptyLocation Auto
LocationRefType Property BossContainer Auto
Weapon Property DummySword Auto
Spell Property Bleed Auto
Bool Property bFinished = False Auto Hidden
GlobalVariable Property moaLockReset Auto
Message Property DeathMessage Auto
Bool Property bReadyForRespawn = False Auto Hidden
Bool Property bInfectingPlayer = False Auto Hidden
Bool Property bPlayerIsVoiceless = False Auto Hidden
Bool Property bIsraped = False Auto Hidden
Bool bIsBusy = False
Float fHealrate = 0.0
Int iIsBeast = 0
Bool bSheathed = False
Bool bSacrifice = False
Bool bParalyzed = False
Bool UnarmedAttacker = False

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
		ConfigMenu.checkMods()
		If PermaDeathScript.bCheckPermaDeath()
			Return
		EndIf
		SetGameVars()
		If bPlayerIsVoiceless
			PlayerRef.SetVoiceRecoveryTime(9999999.0)
		EndIf
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
		ConfigMenu.checkMods()
		If PermaDeathScript.bCheckPermaDeath()
			Return
		EndIf
		SetGameVars()
		If bPlayerIsVoiceless
			PlayerRef.SetVoiceRecoveryTime(9999999.0)
		EndIf
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
	Utility.Wait(0.1)
	If bIsBusy
		Return
	EndIf
	bIsBusy = True
	moaState.SetValue(1)
	If ConfigMenu.bTriggerOnBleedout
		PlayerRef.GetActorBase().SetEssential(True)
		PlayerRef.SetNoBleedoutRecovery(True)
	ElseIf ConfigMenu.bTriggerOnHealthPerc
		PlayerRef.StartDeferredKill()
		ConfigMenu.moaHealthMonitor.Start()
	EndIf
	moaBleedoutHandlerState.SetValue(0)
	PriorityArray = New Float[5]
	SkillScript = ReviverQuest As zzzmoaskillcursescript
	ItemScript = ReviverQuest As zzzmoaitemcursescript
	RespawnScript = ReviverQuest As zzzmoarespawnscript
	NPCScript = ReviverQuest As zzzmoanpcscript
	RapeScript = ReviverQuest As zzzmoarapescript
	PermaDeathScript = PermaDeathQuest As zzzmoaPermaDeathScript
	ConfigMenu.checkMods()
	SetGameVars(True)
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
	bIsBusy = False
EndEvent

Event OnPlayerLoadGame()
	ConfigMenu.checkMods()
	If PermaDeathScript.bCheckPermaDeath()
		Return
	EndIf
	ConfigMenu.OnGameReload()
	If ( ConfigMenu.iSaveOption > 1 )
		Game.SetInChargen(abDisableSaving = True, abDisableWaiting = False, abShowControlsDisabledMessage = True)
	EndIf
	If ConfigMenu.bIsEffectEnabled
		PlayerRef.AddPerk(Invulnerable) ;because when loading a save game usually npcs start moving before player
	EndIf
	If moaLockReset.GetValueInt() == 1
		ConfigMenu.bMarkRecallCostLock = False
		ConfigMenu.bTradeLock = False
		ConfigMenu.bLootChanceLock = False
		ConfigMenu.bCurseLock = False
		ConfigMenu.bSaveLock = False
		ConfigMenu.bRespawnCounter = False
		ConfigMenu.bLockPermaDeath = False
		moaLockReset.SetValue(0)
	EndIf
	SetGameVars()
	If bPlayerIsVoiceless
		PlayerRef.SetVoiceRecoveryTime(9999999.0)
	EndIf
	RegisterForSingleUpdate(3.0)
EndEvent

Event OnRaceSwitchComplete()
	If moaPlayerGhostQuest.IsRunning()
		Game.SetPlayerReportCrime(False)
	EndIf
EndEvent

Function checkMarkers(Bool bTavern = True, Bool bExtra = True, Bool bCustom = True, Bool bFast = False)
	RespawnScript.RegisterForModEvent("MOA_CheckMarkers","OnCheckingMarkers")
	Int handle = ModEvent.Create("MOA_CheckMarkers")
	If (handle)
		ModEvent.PushForm(handle, ReviverQuest)
		ModEvent.PushBool(handle, bTavern)
		ModEvent.PushBool(handle, bExtra)
		ModEvent.PushBool(handle, bCustom)
		ModEvent.PushBool(handle, bFast)
		ModEvent.Send(Handle)
	EndIf
EndFunction

Event OnDying(Actor akKiller)
	clearAll()
EndEvent

Event OnDeath(Actor akKiller)
	If bFinished
		Game.SetGameSettingFloat("fPlayerDeathReloadTime", 5.00000)
		Game.FadeOutGame(False, True, 2.50000, 3.0000)
		If ConfigMenu.bLockPermaDeath
			PermaDeathScript.PermaDeathMessage.Show()
			Game.PlayBink("CreditsRoll.bik", True, True, False, False)
			Game.QuitToMainMenu()
		Else
			PermaDeathScript.NoRespawnMessage.Show()
		EndIf
	Else
		DeathMessage.Show()
	EndIf
EndEvent

Function clearAll()
	UnregisterForUpdate()
	;Restore(bRevivePlayer = False, bReviveFollower = False, bEffect = False)
EndFunction

Event OnEnterBleedout()
	If !PlayerRef.IsDead() && !bInBleedout && !moaIgnoreBleedout.GetValue()
		bInBleedout = True
		bInBleedoutAnim = False
		bSheathed = False
		Game.DisablePlayerControls()
		;Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
		fHealrate = PlayerRef.GetActorValue("HealRate")
		PlayerRef.DispelAllSpells()
		PlayerRef.SetActorValue("HealRate",0.0)
		PlayerRef.RemoveSpell(Bleed)
		PlayerRef.AddSpell(Bleed,False)
		PlayerRef.AddPerk(Invulnerable)
		Debug.SetGodMode(True)
		iIsBeast = NPCScript.iInBeastForm()
		BleedoutHandler(ToggleState())
		If GetState() == ""
			Attacker = None
			PlayerRef.RemoveSpell(Bleed)
			PlayerRef.SetActorValue("HealRate",fHealrate)
			Game.EnablePlayerControls()
			LowHealthImod.Remove()
			moaBleedoutHandlerState.SetValue(0)
			RegisterForSingleUpdate(3.0)
			Game.EnableFastTravel(True)
			ToggleSaving(True)
			bInBleedout = False
		EndIf
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerattack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	If GetState() == ""
		If (akAggressor As Actor)
			If (akAggressor As Actor) != PlayerRef
				Attacker = akAggressor As Actor
				If !ConfigMenu.bCanBeKilledbyUnarmed
					UnarmedAttacker = (!Attacker.GetEquippedItemType(0) && !Attacker.GetEquippedItemType(1))
				EndIf
			EndIf
		Else
			Attacker = None
		EndIf
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
		If bParalyzed 
			If bInBleedoutAnim
				If !bSheathed
					Game.EnablePlayerControls()
					PlayerRef.DrawWeapon()
				EndIf		
			Else	 ;auto fix for can't draw weapon, jump,.. after paralysis	
				Game.EnablePlayerControls()
				Form rw = PlayerRef.GetEquippedObject(1)
				If rw
					PlayerRef.UnequipItemEx(rw, equipSlot = 1, preventEquip = False)
					PlayerRef.EquipItemEx(rw, equipSlot = 1, preventUnequip = False, equipSound = True)
				Else
					playerRef.AddItem(DummySword As form, abSilent = True)
					PlayerRef.EquipItemEx(DummySword, equipSlot = 1, preventUnequip = True, equipSound = True)
					PlayerRef.UnequipItemEx(DummySword, equipSlot = 1, preventEquip = True)
					PlayerRef.RemoveItem(DummySword As Form, PlayerRef.GetItemCount(DummySword As Form), abSilent = True)
				EndIf
			EndIf
		EndIf
		bParalyzed = False
		bSheathed = False
		PlayerRef.RemovePerk(Invulnerable)
		Debug.SetGodMode(False)		
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
				If ConfigMenu.bLoseForever
					StopAndConfirm(moaThiefNPC01, 3, 15)
				Else
					If Utility.RandomInt(0,99) < ConfigMenu.fBossChestChanceSlider
						moaBossChest01.Start()
						If moaBossChest01.IsRunning()
							If moaThiefNPC01.IsRunning()
								StopAndConfirm(moaThiefNPC01,3,27)
								Utility.Wait(1.0)
							EndIf
							StopAndConfirm(moaRetrieveLostItems,3,10)
							StopAndConfirm(moaRetrieveLostItems01,3,10)
							moaBossChest01.SetStage(5)
							Return
						EndIf
					EndIf
					If ConfigMenu.bSpawnHostile && (ThiefMarker.GetParentCell() != DefaultCell)
						If moaThiefNPC01.IsRunning()
							StopAndConfirm(moaThiefNPC01,3,27)
							Utility.Wait(1.0)
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
		If !PlayerRef.IsDead() && (playerRef.GetActorValuePercentage("Health") <= ConfigMenu.fHealthPercTrigger)
			If !bInBleedout && !moaIgnoreBleedout.GetValue()
				bInBleedout = True
				Game.DisablePlayerControls()
				;Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
				PlayerRef.DamageActorValue("Health",9999.0)
				fHealrate = PlayerRef.GetActorValue("HealRate")
				PlayerRef.DispelallSpells()
				PlayerRef.SetActorValue("HealRate",0.0)
				PlayerRef.AddPerk(Invulnerable)
				Debug.SetGodMode(True) ;still needed for when dying because of traps
				bInBleedoutAnim = True
				bSheathed = False
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
					Attacker = None
					PlayerRef.SetActorValue("HealRate",fHealrate)
					Game.EnablePlayerControls()
					LowHealthImod.Remove()
					moaBleedoutHandlerState.SetValue(0)
					RegisterForSingleUpdate(3.0)
					Game.EnableFastTravel(True)
					ToggleSaving(True)
					bInBleedout = False
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Function restore(Int iRevivePlayer = 1, Bool bReviveFollower = True, Bool bEffect = False, Int iPotionIndex = -1, Bool bWait = False, String sTrace = "")
	RapeScript.unPacify()
	If !PlayerRef.IsDead()
		If bEffect
			moaReviveAfterEffect.Cast(PlayerRef)
		EndIf
		RequipSpells()
		PlayerRef.DispelSpell(Bleed)
		If iRevivePlayer != 0
			PlayerRef.ResetHealthAndLimbs()
			PlayerRef.RestoreActorValue("health",10000)
		EndIf
		If iRevivePlayer == 2
			Utility.Wait(0.5)
			Float fOldHP = PlayerRef.GetActorValue("Health")
			Float fNewHP = fMax( 60.0, ((PlayerRef.GetBaseActorValue("Health") * 0.5) + 10.0 ))
			If fOldHP > fNewHP
				PlayerRef.DamageActorValue("Health",fOldHP - fNewHP)
			Else
				PlayerRef.RestoreActorValue("Health",fNewHP - fOldHP)
			EndIf
		EndIf
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
			!moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
		EndIf
		PlayerRef.DrawWeapon()
		Utility.wait(2.0)
		PlayerRef.SheatheWeapon()
	EndIf
	Attacker = None
	If PlayerRef.GetActorValue("paralysis")
		PlayerRef.SetActorValue("paralysis",0)
		If PlayerRef.GetActorValue("paralysis")
			PlayerRef.ForceActorValue("paralysis",0)
		EndIf					
	EndIf
	If bEffect && (iRevivePlayer == 1) && !PlayerRef.IsDead()
		BleedoutProtection.Cast(PlayerRef)
	EndIf
	bWait && Utility.Wait(5.0)
	GoToState("")
	If sTrace && ConfigMenu.bIsLoggingEnabled 
		Debug.Trace(sTrace)
	EndIf
EndFunction

Function BleedoutHandler(String CurrentState)
	If DGIntimidateQuest.IsRunning()
		stopBrawlQuest(DGIntimidateQuest,180)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: DGIntimidateQuest.")
		GoToState("")
		Return
	ElseIf FreeformRiften19.GetStage() == 30
		stopBrawlQuest(FreeformRiften19,250)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: FreeformRiften19.")
		GoToState("")
		Return
	ElseIf Favor017.GetStage() == 10
		stopBrawlQuest(Favor017,200)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after defeat in brawl: Favor017.")
		GoToState("")
		Return
	ElseIf !ConfigMenu.bCanbeKilledbyUnarmed && UnarmedAttacker && Attacker && Attacker.HasKeyWordString("ActorTypeNPC")
		PlayerRef.ResetHealthAndLimbs()
		!moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player revived after being defeated by an unarmed NPC: "+Attacker)
		GoToState("")
		Return
	EndIf
	If !bIsCameraStateSafe()
		Game.ForceThirdPerson()
	EndIf
	Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
	If ConfigMenu.bIsRagdollEnabled && \
	(!PlayerRef.GetActorValue("paralysis") && !iIsBeast && !PlayerRef.GetAnimationVariableBool("bIsSynced"))
		PlayerRef.PushActorAway(PlayerRef,0)
		PlayerRef.SetActorValue("paralysis",1)
		bParalyzed = True
	Else
		bParalyzed = False
	EndIf
	ToggleSaving(False)
	Game.EnableFastTravel(False)
	If ConfigMenu.iTotalBleedOut < 99999999
		ConfigMenu.iTotalBleedOut += 1
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player entered bleedout.")
	If Thief
		PreviousThief = Thief
	EndIf
	stopAndConfirm(moaHostileNPCDetector)
	stopAndConfirm(moaHostileNPCDetector01)
	If Attacker && Attacker != PlayerRef
		AttackerActor.ForceRefTo(Attacker)
		AttackerActor01.ForceRefTo(Attacker)
		ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkOfArkay: Last attacker = ( '" +\
			Attacker.GetActorBase().GetName() +\
			"', " + Attacker + ", " +\
			Attacker.GetRace() + ", )" ) 
	Else
		Attacker = None
		AttackerActor.Clear()
		AttackerActor01.Clear()
	EndIf
	If ConfigMenu.iHostileOption == 2
		If ConfigMenu.bNPCHasLevelRange
			Int iMinNPCLevel = PlayerRef.GetLevel() - (ConfigMenu.fLowerNPCMaxLvlDiff As Int)
			Int iMaxNPCLevel = PlayerRef.GetLevel() + (ConfigMenu.fHigherNPCMaxLvlDiff As Int)
			If iMinNPCLevel < 0
				iMinNPCLevel = 1
			EndIf
			ConfigMenu.moaLowerNPCMaxLvlDiff.SetValueInt(iMinNPCLevel)
			ConfigMenu.moaHigherNPCMaxLvlDiff.SetValueInt(iMaxNPCLevel)
		EndIf
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
	;PlayerRef.DispelAllSpells()
	LowHealthImod.Remove()
	SetVars()
	If !ConfigMenu.bIsRevivalEnabled
		restore(iRevivePlayer = 0, bReviveFollower = False, sTrace = "MarkOfArkay: Player won't be revived because revival is not enabled.")
		Return
	EndIf
	NPCScript.DetectFollowers()
	strRemovedItem = ""
	bHasAutoReviveEffect = PlayerRef.HasMagicEffect(AutoReviveSelf)
	Float fHealth = -9000.0
	If bPotionRevive
		PlayerRef.DispelSpell(Bleed)
		fHealth = -10.0
	EndIf
	If bInBleedoutAnim
		If !PlayerRef.GetActorValuePercentage("health")
			While !PlayerRef.GetActorValuePercentage("health")
				PlayerRef.DamageActorValue("health",-1000)
			EndWhile
		EndIf
		Float fMinHealth = (ConfigMenu.fHealthPercTrigger * (PlayerRef.GetActorValue("health") / PlayerRef.GetActorValuePercentage("health"))) ;fHealthPercTrigger * max health
		If PlayerRef.GetActorValue("health") < (fMinHealth + fHealth)
			PlayerRef.RestoreActorValue( "health", (fMinHealth + fHealth) - PlayerRef.GetActorValue("health") )
		ElseIf PlayerRef.GetActorValue("health") > (fMinHealth + fHealth)
			PlayerRef.DamageActorValue( "health",  PlayerRef.GetActorValue("health") - (fMinHealth + fHealth))
		EndIf
	Else
		If PlayerRef.GetActorValue("health") < fHealth
			PlayerRef.RestoreActorValue( "health", fHealth - PlayerRef.GetActorValue("health") )
		ElseIf PlayerRef.GetActorValue("health") > fHealth
			PlayerRef.DamageActorValue( "health", PlayerRef.GetActorValue("health") -  fHealth)
		EndIf
	EndIf
	If NPCScript.FollowerCanProtectPlayer()
		;Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		If ConfigMenu.iRevivesByFollower < 99999999
			ConfigMenu.iRevivesByFollower += 1
		EndIf
		If ConfigMenu.iTotalRevives < 99999999
			ConfigMenu.iTotalRevives += 1
		EndIf
		Restore(iRevivePlayer = 2, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = False, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player is alive because of followers.")
		Return
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
				Restore(iRevivePlayer = 1, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player revived before starting of the revival by auto drinking healing potions.")
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
				Restore(iRevivePlayer = 1, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, iPotionIndex = iPotion, sTrace = "MarkOfArkay: Player revived by auto drinking a healing potion.")								
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
				Debug.SetGodMode(False)
			Else
				Game.EnablePlayerControls()
				PlayerRef.RemovePerk(Invulnerable)
				Debug.SetGodMode(False)
			EndIf
			Utility.Wait(ConfigMenu.fBleedoutTimeSlider)
		EndIf
		If !PlayerRef.IsBleedingOut() && (!bInBleedoutAnim || (playerRef.GetActorValuePercentage("Health") > ConfigMenu.fHealthPercTrigger));player revived with potion or another script and is alive after 6 secs
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Restore(iRevivePlayer = 1, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player is not in bleedout. (probably revived by manual drinking of a healing potion.)")
			Return
		Else
			PlayerRef.AddPerk(Invulnerable)
			Debug.SetGodMode(True)
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
			Restore(iRevivePlayer = 0, bReviveFollower = False, bEffect = False, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player can't be revived but isn't in bleedout.")
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
		iChoice = moaReviveMenu1.Show(iSeptimCost,iArkayMarkCost,iArkayMarkCount,iDragonSoulCost,fDragonSoulCount As Int,iBSoulGemCost,iBSoulGemCount,iGSoulGemCost,iGSoulGemCount)
		If (iChoice == -1)
		ElseIf ((iChoice == 0) && bSeptimRevive)
			PlayerRef.RemoveItem(Gold001,iSeptimCost,!ConfigMenu.bIsNotificationEnabled)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Septim"
		ElseIf ((iChoice == 1) && bArkayMarkRevive)
			PlayerRef.RemoveItem(MarkOfArkay,iArkayMarkCost,!ConfigMenu.bIsNotificationEnabled)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Arkay Mark"
		ElseIf ((iChoice == 2) && bDragonSoulRevive)
			PlayerRef.ModActorValue("DragonSouls", -1 * iDragonSoulCost)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Dragon Soul"
		ElseIf ((iChoice == 3) && bBSoulGemRevive)
			PlayerRef.RemoveItem(BlackFilledGem,iBSoulGemCost,!ConfigMenu.bIsNotificationEnabled)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Black Soul Gem"
		ElseIf ((iChoice == 4) && bGSoulGemRevive)
			PlayerRef.RemoveItem(GrandFilledGem,iGSoulGemCost,!ConfigMenu.bIsNotificationEnabled)
			iRevive = 1
			bBreak = True
			strRemovedItem = "Grand Soul Gem"
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
				Restore(iRevivePlayer = 0, bReviveFollower = False, bEffect = False, bwait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player revived before showing the trade menu.")
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
		PlayerRef.RemoveItem(GrandFilledGem,iGSoulGemCost,!ConfigMenu.bIsNotificationEnabled)
		strRemovedItem = "Grand Soul Gem"
	ElseIf (PriorityArray[iIndex]>40) && (PriorityArray[iIndex]<50) && bArkayMarkRevive
		PlayerRef.RemoveItem(MarkOfArkay,iArkayMarkCost,!ConfigMenu.bIsNotificationEnabled)
		strRemovedItem = "Arkay Mark"
	ElseIf (PriorityArray[iIndex]>30) && (PriorityArray[iIndex]<40) && bBSoulGemRevive
		PlayerRef.RemoveItem(BlackFilledGem,iBSoulGemCost,!ConfigMenu.bIsNotificationEnabled)
		strRemovedItem = "Black Soul Gem"
	ElseIf (PriorityArray[iIndex]>20) && (PriorityArray[iIndex]<30) && bDragonSoulRevive
		PlayerRef.ModActorValue("DragonSouls", -1 * iDragonSoulCost)
		strRemovedItem = "Dragon Soul"
	ElseIf (PriorityArray[iIndex]>10) && (PriorityArray[iIndex]<20) && bSeptimRevive
		PlayerRef.RemoveItem(Gold001,iSeptimCost,!ConfigMenu.bIsNotificationEnabled)
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
			If (strRemovedItem == "Dragon Soul")
				Debug.Notification( "$mrt_MarkofArkay_Notification_DragonSoul_Removed" )
				Debug.Notification( iDragonSoulCost )
			;ElseIf (strRemovedItem == "Arkay Mark")
			;	Debug.Notification("$mrt_MarkofArkay_Notification_ArkayMark_Removed" )
			;	Debug.Notification( iArkayMarkCost)
			;ElseIf (strRemovedItem == "Black Soul Gem") 
			;	Debug.Notification( "$mrt_MarkofArkay_Notification_BSoulGem_Removed"  )
			;	Debug.Notification( iBSoulGemCost )
			;ElseIf (strRemovedItem == "Grand Soul Gem")
			;	Debug.Notification( "$mrt_MarkofArkay_Notification_GSoulGem_Removed" )
			;	Debug.Notification(iGSoulGemCost )
			;ElseIf (strRemovedItem == "Septim")
			;	Debug.Notification( "$mrt_MarkofArkay_Notification_Septim_Removed" )
			;	Debug.Notification( iSeptimCost )
			EndIf
		EndIf
		If (bArkayMarkRevive)
			If ConfigMenu.fValueMarkSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iArkayMarkCount / iArkayMarkCost ) As Int
			EndIf
		EndIf
		If ( bBSoulGemRevive )
			If ConfigMenu.fValueBSoulGemSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iBSoulGemCount / iBSoulGemCost ) As Int
			EndIf
		EndIf
		If ( bGSoulGemRevive )
			If ConfigMenu.fValueGSoulGemSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iGSoulGemCount / iGSoulGemCost ) As Int
			EndIf
		EndIf
		If ( bDragonSoulRevive )
			If ConfigMenu.fValueSoulSlider == 0.0
				Return
			Else
				totalRemainingLives += ( fDragonSoulCount / iDragonSoulCost ) As Int
			EndIf
		EndIf
		If ( bSeptimRevive )
			If ConfigMenu.fValueGoldSlider == 0.0
				Return
			Else
				totalRemainingLives += ( iSeptimCount / iSeptimCost ) As Int
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
	Return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || bHasArkayCurse() || SkillScript.bSkillReduced() || moaPlayerGhostQuest.IsRunning() || moaPlayerVoicelessQuest.IsRunning()
EndFunction

Bool Function bItemRemoved()
	Return ItemScript.bInventoryReduced() || ItemScript.bSoulReduced() || SkillScript.bSkillReduced()
EndFunction

Bool Function bHasArkayCurse()
	Return PlayerRef.HasSpell(ArkayCurse) || PlayerRef.HasSpell(ArkayCurseAlt)
EndFunction

Bool Function bSendToSlavery()
	If Attacker != None
		If Utility.RandomInt(0,99) < ConfigMenu.fSimpleSlaveryChanceSlider
			If (PlayerRef.GetDistance(Attacker) < 10000.0) || (Attacker.GetParentCell() == PlayerRef.GetParentCell())
				If bIsraped || !ConfigMenu.bSlaveryOnlyAfterRape
					If !ConfigMenu.bOnlyEnslavedByEnemyFaction || bIsraped || (PlayerRef.GetFactionReaction(Attacker) == 1)
						Return True
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Bool Function bRape()
	If !Attacker || (Attacker == None) || playerRef.IsFlying() || playerRef.IsOnMount()
		Return False
	EndIf
	
	If !ConfigMenu.bOnlyHostilesRape || (Attacker.IsHostileToActor(PlayerRef) || (Attacker.GetFactionReaction(PlayerRef) == 1))
		If Utility.RandomInt(0,99) < ConfigMenu.fRapeChanceSlider
			If (PlayerRef.GetDistance(Attacker) < 5000.0) || (Attacker.GetParentCell() == PlayerRef.GetParentCell())
				Return True
			EndIf
		EndIf
	EndIf

	Return False
EndFunction

Function RevivePlayer(Bool bRevive)
	bIsraped = False
	If !bRevive && bRape()
		Actor[] rapistActors = RapeScript.getRapists(PlayerRef,Attacker)
		bIsraped = RapeScript.rapePlayer(rapistActors)
		If bIsraped
			int i = Utility.randomInt(0,(ConfigMenu.fMaxRapes - 1) As int)
			While i > 0
				Game.DisablePlayerControls()
				Utility.Wait(6.0)
				RapeScript.rapePlayer(rapistActors)
				i -= 1
			EndWhile
		EndIf
		PlayerRef.RemoveFromFaction(RapeScript.CalmFaction)
		Attacker && Attacker.RemoveFromFaction(RapeScript.CalmFaction)
		PlayerRef.DrawWeapon()
		Utility.Wait(1.0)
		PlayerRef.SheatheWeapon()
		Game.DisablePlayerControls()
		ConfigMenu.bIsLoggingEnabled && Debug.trace("MarkOfArkay: Player raped = " + bIsraped)
	EndIf
	Bool bSendToSlavery = bSendToSlavery()
	If bRevive || bSendToSlavery
		If ConfigMenu.bShiftBack || bSendToSlavery
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
					If moaRetrieveLostItems.IsRunning()
						moaRetrieveLostItems.SetStage(20)
					EndIf
					If moaRetrieveLostItems01.IsRunning()
						moaRetrieveLostItems01.SetStage(20)
					EndIf
				EndIf
			EndIf
			bSacrifice = False
		EndIf
		If bSendToSlavery
			Restore(iRevivePlayer = 1, bReviveFollower = 1, bEffect = False, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = ("MarkOfArkay: Player is enslaved by " + Attacker))
			sendModEvent("SSLV Entry")
		Else
			Restore(iRevivePlayer = 1, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = ConfigMenu.bIsEffectEnabled, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player is revived.")	
		EndIf
		Return
	Else
		If ( !ConfigMenu.bKillIfCantRespawn && ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport() && ConfigMenu.bCanContinue())
			If ConfigMenu.iRevivesByFollower < 99999999
				ConfigMenu.iRevivesByFollower += 1
			EndIf
			If ConfigMenu.iTotalRevives < 99999999
				ConfigMenu.iTotalRevives += 1
			EndIf
			Restore(iRevivePlayer = 2, bReviveFollower = ConfigMenu.bPlayerProtectFollower, bEffect = False, bWait = PlayerRef.GetActorValue("Paralysis") As Bool, sTrace = "MarkOfArkay: Player is revived because respawn is currently disabled.")
			Return
		Else
			NPCScript.HoldFollowers()
			If ConfigMenu.bCanContinue() && (( ConfigMenu.iNotTradingAftermath == 0 ) || ( ConfigMenu.iNotTradingAftermath == 1 && !RespawnScript.bCanTeleport() ))
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player is dying...")
				Attacker = None
				PlayerRef.DispelAllSpells()
				LowHealthImod.Remove()
				PlayerRef.PushActorAway(PlayerRef,0)
				PlayerRef.EndDeferredKill()
				Utility.Wait(0.1)
				If !PlayerRef.IsDead()
					killPlayer()
				EndIf
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player died.")
				GoToState("")
			ElseIf ConfigMenu.bCanContinue() && ( ConfigMenu.iNotTradingAftermath == 1)
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawning the player...")
				Float fRespawnStartTime = Utility.GetCurrentRealTime()
				bReadyForRespawn = False
				bInfectingPlayer = False
				Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
				If ConfigMenu.bDiseaseCurse
					startInfectingPlayer()
				EndIf				
				If ( ConfigMenu.bRespawnMenu )
					RespawnScript.SelectRespawnPointbyMenu()
				EndIf
				startRespawning()
				If ( !bWasSwimming && bIsConditionSafe )
					If ( ConfigMenu.bInvisibility || ConfigMenu.bFadeToBlack )
						If ConfigMenu.bDeathEffect && !moaPlayerGhostQuest.IsRunning() && !moaPlayerVoicelessQuest.IsRunning()
							RespawnScript.PlayerMarker.Enable()
							RespawnScript.PlayerMarker.MoveTo(playerRef)
							RespawnScript.PlayerMarker.SetPosition(PlayerRef.GetPositionx(), PlayerRef.GetPositiony(), PlayerRef.GetPositionz())
							RespawnScript.PlayerMarker.SetAngle(0.0, 0.0, PlayerRef.GetAnglez())
							Utility.Wait(0.5)
							If !bIsraped
								PlayerRef.PushActorAway(PlayerRef,0)
								Utility.Wait(0.1)
								RespawnScript.PlayerMarker.Say(DeathTopic, PlayerRef, True)
							EndIf
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
						If ConfigMenu.bInvisibility && !moaPlayerGhostQuest.IsRunning()
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
					If ConfigMenu.bInvisibility && !moaPlayerGhostQuest.IsRunning()
						PlayerRef.SetAlpha(0.0)
					EndIf
				EndIf
				If ConfigMenu.bShiftBackRespawn
					ShiftBack()
				EndIf
				If ConfigMenu.bLoseForever 
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
						StopAndConfirm(moaThiefNPC01, 3, 27)
						Utility.Wait(1.0) ;to remove spawn before starting the quest.
					EndIf
					If moaBossChest01.IsRunning()
						StopAndConfirm(moaBossChest01, 3, 15)
					EndIf
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: previously lost items are destroyed.")
				EndIf
				bRemoveItems = ConfigMenu.bLoseItem
				iReducedSkill = ConfigMenu.iReducedSkill
				If !moaSoulMark01.IsRunning() && !moaThiefNPC01.IsRunning() &&  (!moaBossChest01.IsRunning() || moaBossChest01.GetStage() == 0)
					StopAndConfirm(moaBossChest01,3,25)
					If Utility.RandomInt(0,99) < ConfigMenu.fBossChestChanceSlider
						Location curLoc = PlayerRef.GetCurrentLocation()
						If !curLoc || !curLoc.HasKeyWord(NPCScript.LocTypeDungeon) || !curLoc.HasRefType(BossContainer) || \
						(ConfigMenu.moaBossChestNotInclearedLoc.GetValueInt() && curLoc.IsCleared())
							PlayerLocRef.ForceLocationTo(EmptyLocation)
						Else
							PlayerLocRef.ForceLocationTo(PlayerRef.GetCurrentLocation())
						EndIf
						moaBossChest01.Start()
					EndIf
				EndIf
				If ConfigMenu.iHostileOption == 2 && !moaSoulMark01.IsRunning() && (!moaBossChest01.IsRunning() || !LostItemsChest.GetNumItems())
					If !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() == 1
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC who can steal from player ...")
						NPCScript.DetectThiefNPC()
						If Thief
							If !ThiefNPC01.GetActorReference() || (ConfigMenu.bAlwaysSpawn && (ThiefNPC01.GetActorReference() != Thief))
								ThiefNPC.ForceRefTo(Thief)
							EndIf
							If !moaThiefNPC01.IsRunning()
								moaThiefNPC01.Start()
							EndIf
							ThiefMarker.MoveTo(Thief)
							If ThiefNPC01.GetActorReference() && (ThiefNPC.GetActorReference() && (Thief ==  ThiefNPC.GetActorReference()))
								RemoveStolenItemMarkers(ThiefNPC01.GetActorReference())
							EndIf
						ElseIf moaThiefNPC01.IsRunning() && !bCursed() ;if cursed, location change event will respawn or stop the quest
							RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
							StopAndConfirm(moaThiefNPC01, 3, 25)
						EndIf
					EndIf
				EndIf
				bSoulMark = bSoulMark()
				Bool bRemoveItemTemp = True
				Bool bInBeastForm = NPCScript.bInBeastForm()
				If bInBeastForm || (( ConfigMenu.iHostileOption == 2 && ( moaSoulMark01.IsRunning() || !moaThiefNPC01.IsRunning() || moaThiefNPC01.GetStage() != 1)) ||\
						( ConfigMenu.iHostileOption != 2 && ( moaThiefNPC01.IsRunning() || ( ConfigMenu.iHostileOption == 1 && !NPCScript.bIsHostileNPCNearby()))) || ( PlayerRef.GetParentCell() == DefaultCell ))
					If  (moaBossChest01.IsRunning() && moaBossChest01.GetStage() == 0) && !bInBeastForm
						bRemoveItemTemp = False
					Else
						bRemoveItems = False
						If !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
							iReducedSkill = 0
						EndIf
					EndIf
				EndIf
				If bRemoveItems
					Debug.TraceConditional("MarkOfArkay: Removing items from the player...", ConfigMenu.bIsLoggingEnabled )
					Float fStart = Utility.GetCurrentRealTime()
					ItemScript.loseItems()
					Debug.TraceConditional("MarkOfArkay: Removing items from the player finished in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.", ConfigMenu.bIsLoggingEnabled )
					If ConfigMenu.bIsLoggingEnabled 
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
				If  (moaBossChest01.IsRunning() && moaBossChest01.GetStage() == 0) && !LostItemsChest.GetNumItems()
					If !bRemoveItemTemp
						bRemoveItems = False ;No phycical item removed and nothing else can be removed
						If !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
							iReducedSkill = 0
						EndIf
					EndIf
					stopAndConfirm(moaBossChest01,3,25)
				EndIf
				If iReducedSkill > 0
					Debug.TraceConditional("MarkOfArkay: Reducing player's Skills/Skill XPs...", ConfigMenu.bIsLoggingEnabled )
					Float fStart = Utility.GetCurrentRealTime()
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
					Debug.TraceConditional("MarkOfArkay: Reducing skills completed in " + (Utility.GetCurrentRealTime() - fStart) + " seconds.",ConfigMenu.bIsLoggingEnabled )
				EndIf
				If ( PlayerRef.GetParentCell() != DefaultCell )
					If bCursed() || (ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary ) || ConfigMenu.bVoicelessCurse || ConfigMenu.bGhostCurse ;Something is removed or stats of player are reduced or going to be reduced
						If ( bSoulMark || \
								((( ConfigMenu.bArkayCurse && !ConfigMenu.bIsArkayCurseTemporary ) || \
								bHasArkayCurse() || ConfigMenu.bVoicelessCurse || ConfigMenu.bGhostCurse || moaPlayerGhostQuest.IsRunning() || moaPlayerVoicelessQuest.IsRunning()) \
								&& !moaThiefNPC01.IsRunning() && (!moaBossChest01.IsRunning() || LostItemsChest.GetNumItems() == 0))) ;Soul mark can be used
							If moaBossChest01.GetStage() == 0
								stopAndConfirm(moaBossChest01,3,25)
							Else
								stopAndConfirm(moaBossChest01,3,20)
							EndIf
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
						If moaBossChest01.GetStage() == 0
							stopAndConfirm(moaBossChest01,3,25)
						Else
							stopAndConfirm(moaBossChest01,3,20)
						EndIf
					Else
						RemoveStolenItemMarkers(ThiefNPC.GetReference() As Actor)
						StopAndConfirm(moaThiefNPC01, 3, 25)
					EndIf
				EndIf
				PlayerRef.DispelSpell(Bleed)
				PlayerRef.ResetHealthAndLimbs()
				PlayerRef.RestoreActorValue("health",10000)
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
				While bInfectingPlayer
					Utility.WaitMenuMode(0.2)
				EndWhile
				bReadyForRespawn = True ;allowing bIsArrived in respawnscript to teleport player
				While bReadyForRespawn
					Utility.WaitMenuMode(0.2)
				EndWhile
				Utility.Wait(0.5)
				If PlayerRef.IsDead()
					PlayerRef.SetAlpha(1.0)
					BlackScreen.Remove()
					Return
				EndIf
				Attacker = None
				ResetPlayer()
				If !ConfigMenu.bGhostCurse && !moaPlayerGhostQuest.IsRunning()
					PlayerRef.SetAlpha(1.0,True)
				EndIf
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
				If ConfigMenu.bGhostCurse
					If moaPlayerVoicelessQuest.IsRunning()
						moaPlayerVoicelessQuest.Stop()
					EndIf
					If !moaPlayerGhostQuest.IsRunning()
						moaPlayerGhostQuest.Start()
					EndIf
				EndIf
				If ConfigMenu.bVoicelessCurse
					If !moaPlayerGhostQuest.IsRunning() && !moaPlayerVoicelessQuest.IsRunning()
						moaPlayerVoicelessQuest.Start()
					EndIf
					PlayerRef.SetVoiceRecoveryTime(9999999.0)
					bPlayerIsVoiceless = True
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
				If ConfigMenu.bLoseForever && bDidItemsRemoved
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
					If moaBossChest01.GetStage() == 0
						stopAndConfirm(moaBossChest01,3,25)
					Else
						stopAndConfirm(moaBossChest01,3,20)
					EndIf
				EndIf
				moaHostileNPCDetector.Stop()
				moaHostileNPCDetector01.Stop()
				RapeScript.unPacify()
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
					!moaPlayerGhostQuest.IsRunning() && PlayerRef.StopCombatAlarm()
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
				If ConfigMenu.bRespawnCounter
					ConfigMenu.fRespawnCounterSlider -= 1
					If ConfigMenu.bIsNotificationEnabled
						Debug.Notification("$mrt_MarkofArkay_Notification_totalRemainingRespawns")
						Debug.Notification(ConfigMenu.fRespawnCounterSlider As Int)
					EndIf
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: You have "+ConfigMenu.fRespawnCounterSlider As Int +" more respawns.")
				EndIf
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Respawn finished.")
				Debug.TraceConditional("MarkOfArkay: Respawn finished in "+ (Utility.GetCurrentRealTime() - fRespawnStartTime) + " seconds.",ConfigMenu.bIsLoggingEnabled)
				If ConfigMenu.bShowRaceMenu
					Utility.Wait(2.0)
					Game.ShowRaceMenu()
				EndIf
				GoToState("")
			Else
				If !ConfigMenu.bCanContinue()
					If ConfigMenu.bLockPermaDeath && ConfigMenu.bPUOK
						PermaDeathScript.lockGameLoad()
					EndIf
					bFinished = True
					KillPlayer()
					Return
				EndIf
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
	If LeftHandEquippedItem && LeftHandEquippedItem.GetType() == 22 ;Spell
		PlayerRef.UnequipSpell((LeftHandEquippedItem As Spell), 0)
		PlayerRef.EquipSpell((LeftHandEquippedItem As Spell), 0)
	EndIf
	If RightHandEquipedItem && RightHandEquipedItem.GetType() == 22 ;Spell
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
	iSeptimCost = iCalcReviveCost(ConfigMenu.fValueGoldSlider,ConfigMenu.fValueGoldScaleSlider)
	iArkayMarkCost = iCalcReviveCost(ConfigMenu.fValueMarkSlider,ConfigMenu.fValueMarkScaleSlider)
	iBSoulGemCost = iCalcReviveCost(ConfigMenu.fValueBSoulGemSlider,ConfigMenu.fValueBSoulGemScaleSlider)
	iGSoulGemCost = iCalcReviveCost(ConfigMenu.fValueGSoulGemSlider,ConfigMenu.fValueGSoulGemScaleSlider)
	iDragonSoulCost = iCalcReviveCost(ConfigMenu.fValueSoulSlider,ConfigMenu.fValueSoulScaleSlider)
	bSeptimRevive = ConfigMenu.bIsGoldEnabled && (iSeptimCost <= iSeptimCount)
	bDragonSoulRevive = ConfigMenu.bIsDragonSoulEnabled && (iDragonSoulCost <= fDragonSoulCount)
	bBSoulGemRevive = ConfigMenu.bIsBSoulGemEnabled && (iBSoulGemCost <= iBSoulGemCount)
	bGSoulGemRevive = ConfigMenu.bIsGSoulGemEnabled && (iGSoulGemCost <= iGSoulGemCount)
	bArkayMarkRevive = ConfigMenu.bIsMarkEnabled && (iArkayMarkCost <= iArkayMarkCount)
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

Function SetGameVars(Bool abFast = False)
	Game.SetGameSettingFloat("fPlayerDeathReloadTime", 5.00000)
	If !SkillScript
		SkillScript = ReviverQuest As zzzmoaskillcursescript
	EndIf
	If !ItemScript
		ItemScript = ReviverQuest As zzzmoaitemcursescript
	EndIf
	If !RespawnScript
		RespawnScript = ReviverQuest As zzzmoarespawnscript
	EndIf
	If !NPCScript
		NPCScript = ReviverQuest As zzzmoanpcscript
	EndIf
	If !RapeScript
		RapeScript = ReviverQuest As zzzmoarapescript
	EndIf
	If !PermaDeathScript
		PermaDeathScript = PermaDeathQuest As zzzmoaPermaDeathScript
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
	sendModEvent("MOA_Int_PlayerLoadsGame")
	ItemScript.RegisterItemCheckers()
	DiseaseScript.RegisterForModEvent("MOA_RecalcCursedDisCureCost", "RecalcCursedDisCureCost")
	If  (!PlayerRef.IsBleedingOut() && GetState() == "")
		RapeScript.unPacify()
	EndIf
	checkMarkers(bFast = abFast)
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
	Return (( CameraState == 9 ) || ( CameraState == 11 ))
EndFunction

Bool Function bSoulMark() ;Whether drop soul mark or not
	Return !moaBossChest01.IsRunning() && (( ConfigMenu.iHostileOption == 2 && moaSoulMark01.IsRunning() ) ||\
		( ConfigMenu.iHostileOption != 2 && !moaThiefNPC01.IsRunning() ))
EndFunction

Function RemoveStolenItemMarkers(Actor ActorRef)
	ActorRef && ActorRef.RemoveItem(StolenItemsMisc, ActorRef.GetItemCount(StolenItemsMisc), abSilent = True)
	ActorRef && ActorRef.RemoveItem(StolenSoulsMisc, ActorRef.GetItemCount(StolenSoulsMisc), abSilent = True)
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
	bSheathed = True
EndFunction

Function ShiftBack()
	Float i = 5.0
	If ( WerewolfQuest.IsRunning() )
		;Debug.SetGodMode(True)
		PlayerRef.DispelSpell(Bleed)
		PlayerRef.DispelSpell(BleedoutProtection)
		Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
		WerewolfQuest.SetStage(100)
		While (PlayerRef.GetAnimationVariableBool("bIsSynced") && (i > 0.0))
			Utility.Wait(0.2)
			i -= 0.2
		EndWhile
		;Debug.SetGodMode(False)
		;Game.EnablePlayerControls()
	ElseIf ( VampireLordQuest.IsRunning() )
		;Debug.SetGodMode(True)
		PlayerRef.DispelSpell(Bleed)
		PlayerRef.DispelSpell(BleedoutProtection)
		Game.DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = False, abLooking = False, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = False, aiDisablePOVType = 0)
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

Int Function iCalcReviveCost(Float fValue,Float fScale)
	Return imax(0,(fValue + ((fScale * (PlayerRef.GetLevel() - 1)) * fValue)) As Int)
EndFunction

Function startRespawning()
	RespawnScript.RegisterForModEvent("MOA_Respawn","OnRespawn")
	Int handle = ModEvent.Create("MOA_Respawn")
	If (handle)
		ModEvent.PushForm(handle, ReviverQuest)
		ModEvent.Send(Handle)
	EndIf
EndFunction

Function startInfectingPlayer()
	bInfectingPlayer = True
	DiseaseScript.RegisterForModEvent("MOA_InfectPlayer","OnInfectPlayer")
	Int handle = ModEvent.Create("MOA_InfectPlayer")
	If (handle)
		ModEvent.PushForm(handle, ReviverQuest)
		ModEvent.Send(Handle)
	EndIf
EndFunction

Event zzzmoa_Rape_End(string eventName, string argString, float argNum, form sender)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Rape scene ended.")
	RapeScript.bIsBusy = False	
EndEvent

