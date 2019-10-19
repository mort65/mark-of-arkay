ScriptName zzzmoanpcscript Extends Quest

Import zzzmoautilscript
CompanionsHousekeepingScript Property CHScript Auto
zzzmoaReviveMCM Property ConfigMenu Auto
zzzmoaReviverScript Property ReviveScript Auto
zzzmoasoulmarktrap01script Property SoulMarkTrap01Script Auto
FormList Property Afflicteds Auto
FormList Property Atronachs Auto
FormList Property Bandits Auto
FormList Property DragonPriests Auto
FormList Property Dragons Auto
FormList Property Draugrs Auto
FormList Property Dwarvens Auto
FormList Property Falmers Auto
FormList Property AllFalmers Auto
FormList Property Chauruses Auto
FormList Property Forsworns Auto
FormList Property Ghosts Auto
FormList Property Hagravens Auto
FormList Property Skeletons Auto
FormList Property Spiders Auto
FormList Property Trolls Auto
FormList Property Vampires Auto
FormList Property Warlocks Auto
FormList Property Werewolfs Auto
FormList Property Dremoras Auto
FormList Property Wisps Auto
FormList Property Dawnguards Auto
FormList Property Assassins Auto
FormList Property Thiefs Auto
FormList Property Giants Auto
FormList Property SpawnLists Auto
FormList Property AllSpawnLists Auto
FormList Property SilverHands Auto
FormList Property ExtraCloneItems Auto
FormList Property Thalmors Auto
FormList Property Spriggans Auto
FormList Property Witches Auto
Location Property ThalmorEmbassyLocation Auto
Location Property BthardamzLocation Auto
Location Property ShrineofMehrunesDagonLocation Auto
Keyword Property LocTypeDraugrCrypt Auto
Keyword Property LocTypeBanditCamp Auto
Keyword Property LocTypeFalmerHive Auto
Keyword Property LocSetDwarvenRuin Auto
Keyword Property LocTypeForswornCamp Auto
Keyword Property LocTypeVampireLair Auto
Keyword Property LocTypeWarlockLair Auto
Keyword Property LocSetNordicRuin Auto
Keyword Property LocTypeDungeon Auto
Keyword Property LocTypeDragonPriestLair Auto
Keyword Property LocTypeHagravenNest Auto
Keyword Property LocTypeDragonLair Auto
Keyword Property LocSetCave Auto
Keyword Property LocSetCaveIce Auto
Keyword Property LocTypeWerewolfLair Auto
Keyword Property LocTypeMine Auto
Keyword Property LocTypeCity Auto
Keyword Property LocTypeTown Auto
Keyword Property LocTypeGiantCamp Auto
Keyword Property LocTypeDwarvenAutomatons Auto
Keyword Property LocTypePlayerHouse Auto
Keyword Property LocTypeSprigganGrove Auto
Keyword Property LocTypeMilitaryFort Auto
GlobalVariable Property PlayerIsWerewolf  Auto  
GlobalVariable Property PlayerIsVampire  Auto  
ObjectReference Property PlayerMarker Auto
Quest Property moaHostileNPCDetector Auto
Quest Property moaHostileNPCDetector01 Auto
Quest Property moaFollowerDetector Auto
Quest Property moaGuardDetector Auto
Quest Property MS01 Auto
Quest Property MS02 Auto
Race Property HighElf Auto
Race Property HighElfVampire Auto
ReferenceAlias[] Property Followers Auto
ReferenceAlias Property HostileActor Auto
ReferenceAlias[] Property ThiefActors Auto
ReferenceAlias Property HostileActor01 Auto
ReferenceAlias Property GuardNPC Auto
ReferenceAlias Property SoulMark02 Auto
ReferenceAlias Property ItemMarker02 Auto
Actor[] Property FollowerArr Auto Hidden
Faction Property PlayerFollowerFaction Auto
Faction Property CurrentFollowerFaction Auto
Faction Property CurrentHireling Auto
Faction Property CreatureFaction Auto
Faction Property SpiderFaction Auto
Faction Property ChaurusFaction Auto
Faction Property ThievesGuildFaction Auto
Faction Property DarkBrotherHoodFaction Auto
Faction Property PlayerFaction Auto
Race Property WereWolfBeastRace Auto
Race Property DLC1VampireBeastRace Auto
Keyword Property LocTypeHabitation Auto
Keyword Property LocTypeDwelling Auto
Cell Property MehrunesDagonShrine Auto
Actor Property PlayerRef Auto
Spell Property WontSteal Auto
Int[] Property iSpawnArr Auto Hidden
Int Property iSpawnpool Auto Hidden
Int Property iTotalSpawns = 0 Auto Hidden
Actor Property DeadClone Auto Hidden
Race Property AtronachFlameRace Auto
Race Property AtronachFrostRace Auto
Race Property AtronachStormRace Auto
Faction Property  DragonPriestFaction Auto
Faction Property DragonFaction Auto
Faction Property DraugrFaction Auto
Faction Property DremoraFaction Auto
Faction Property DwarvenAutomatonFaction Auto
Faction Property FalmerFaction Auto
Faction Property GiantFaction Auto
Faction Property HagravenFaction Auto
Faction Property SkeletonFaction Auto
Faction Property SprigganFaction Auto
Faction Property SprigganPredatorFaction Auto
Faction Property TrollFaction Auto
Faction Property VampireFaction Auto
Faction Property WerewolfFaction Auto
Faction Property WispFaction Auto
Faction Property DA13AfflictedFaction Auto
Faction Property BanditFaction Auto
Faction Property ForswornFaction Auto
Faction Property SilverHandFaction Auto
Faction Property ThalmorFaction Auto
Faction Property WarlockFaction Auto
Faction Property NecromancerFaction Auto
Faction Property DLC1HunterFaction Auto

Function addToSpawnPool(Int iSpawnIndex)
	Int iEmpty = iSpawnArr.Find(-1)
	If iEmpty > -1 && iSpawnArr.Find(iSpawnIndex) < 0
		iSpawnPool += ConfigMenu.iSpawnWeights[iSpawnIndex]
		iSpawnArr[iEmpty] = iSpawnIndex
		iTotalSpawns += 1
	EndIf
EndFunction

FormList Function getFromSpawnPool()
	Int iResult = Utility.RandomInt(1,iSpawnPool)
	Int iTotal = 0
	Int iIndex = -1
	While iTotal < iResult
		iIndex += 1
		iTotal += ConfigMenu.iSpawnWeights[iSpawnArr[iIndex]]
	EndWhile
	If iIndex > -1 && iIndex < iSpawnArr.Length
		Return AllSpawnLists.GetAt(iSpawnArr[iIndex]) As FormList
	EndIf
	Return None
EndFunction

Function clearSpawnPool()
	iSpawnPool = 0
	iTotalSpawns = 0
	iSpawnArr = Utility.CreateIntArray(ConfigMenu.iSpawnWeights.Length,-1)
EndFunction

Bool Function bIsSpawnEnabled(Bool[] bFlagArr, Int iIndex)
	If !bFlagArr || iIndex > bFlagArr.Length - 1 || !bFlagArr[iIndex]
		Return False
	EndIf
	Return True
EndFunction

FormList Function SelectSpawnList(ObjectReference akMarker,  Int aiIndex = -2, Bool[] SpawnFlags, Actor ActorRef = None)
	If !akMarker
		Return None
	EndIf
	If aiIndex == -1
		If SpawnFlags
			Int iIndex = RandomIntWithExclusionArray(0, AllSpawnLists.GetSize() - 1, SpawnFlags)
			If iIndex < 0
				Return None
			EndIf
			Return AllSpawnLists.GetAt(iIndex) As FormList
		EndIf
		Return AllSpawnLists.GetAt(Utility.RandomInt(0,AllSpawnLists.GetSize() - 1)) As FormList
	ElseIf aiIndex > -1
		Return AllSpawnLists.GetAt(aiIndex) As FormList
	EndIf
	Bool bIsPlayerVampire = bIsPlayerVampire()
	Bool bIsPlayerWereWolf = bIsPlayerWereWolf()
	If ConfigMenu.bSpawnCheckRelation && ActorRef
		clearSpawnPool()
		If ConfigMenu.bCreaturesCanSteal
			If !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
				If ActorRef.IsInFaction(GiantFaction)
					addToSpawnPool(14)
				EndIf
				If (ActorRef.IsInFaction(DragonFaction) || ActorRef.HasKeywordString("ActorTypeDragon"))
					addToSpawnPool(7)
				EndIf
			EndIf
			If (ActorRef.GetRace() == AtronachFlameRace) || (ActorRef.GetRace() == AtronachFrostRace) || (ActorRef.GetRace() == AtronachStormRace)
				addToSpawnPool(2)
			EndIf			
			If ActorRef.IsInFaction(ChaurusFaction)
				addToSpawnPool(4)
			EndIf
			If ActorRef.IsInFaction(DragonPriestFaction)
				addToSpawnPool(6)
			EndIf
			If ActorRef.IsInFaction(DraugrFaction)
				addToSpawnPool(8)
			EndIf
			If ActorRef.IsInFaction(DremoraFaction)
				addToSpawnPool(9)
			EndIf
			If ActorRef.IsInFaction(DwarvenAutomatonFaction)
				addToSpawnPool(10)
			EndIf
			If ActorRef.IsInFaction(FalmerFaction)
				addToSpawnPool(11)
			EndIf
			If ActorRef.HasKeywordString("ActorTypeGhost")
				addToSpawnPool(13)
			EndIf				
			If ActorRef.IsInFaction(HagravenFaction)
				addToSpawnPool(15)
			EndIf
			If ActorRef.IsInFaction(SkeletonFaction)
				addToSpawnPool(17)
			EndIf
			If ActorRef.IsInFaction(SpiderFaction)
				addToSpawnPool(18)
			EndIf
			If ActorRef.IsInFaction(SprigganFaction) ||  ActorRef.IsInFaction(SprigganPredatorFaction)
				addToSpawnPool(19)
			EndIf
			If ActorRef.IsInFaction(TrollFaction)
				addToSpawnPool(22)
			EndIf
			If ActorRef.IsInFaction(VampireFaction)
				addToSpawnPool(23)
			EndIf
			If ActorRef.IsInFaction(WerewolfFaction)
				addToSpawnPool(25)
			EndIf
			If ActorRef.IsInFaction(WispFaction)
				addToSpawnPool(26)
			EndIf
		EndIf
		If ActorRef.IsInFaction(DA13AfflictedFaction)
			addToSpawnPool(0)
		EndIf
		If ActorRef.IsInFaction(DarkBrotherHoodFaction)
			addToSpawnPool(1)
		EndIf

		If ActorRef.IsInFaction(BanditFaction)
			addToSpawnPool(3)
		EndIf
		If ActorRef.IsInFaction(DLC1HunterFaction) && bIsPlayerVampire
			addToSpawnPool(5)
		EndIf
		If ActorRef.IsInFaction(ForswornFaction)
			addToSpawnPool(12)
		EndIf
		If ActorRef.IsInFaction(SilverHandFaction) && bIsPlayerWereWolf
			addToSpawnPool(16)
		EndIf
		If ActorRef.IsInFaction(ThalmorFaction)
			addToSpawnPool(20)
		EndIf
		If ActorRef.IsInFaction(ThievesGuildFaction)
			addToSpawnPool(21)
		EndIf
		If ActorRef.IsInFaction(WarlockFaction) || ActorRef.IsInFaction(NecromancerFaction)
			addToSpawnPool(24)
		EndIf
		If ActorRef.IsInFaction(HagravenFaction)
			addToSpawnPool(27)
		EndIf
		If iSpawnPool > 0
			Return getFromSpawnPool()
		EndIf
	EndIf
	If ConfigMenu.bSpawnByLocation
		clearSpawnPool()
		Location akLocation = akMarker.GetCurrentLocation()
		If akLocation
			If akLocation.HasKeyword(LocTypeCity) || akLocation.HasKeyword(LocTypeTown) || akLocation.HasKeyword(LocTypePlayerHouse) || akLocation.HasKeyword(LocTypeDwelling) || akLocation.HasKeyword(LocTypeHabitation)
				If ConfigMenu.bSpawnCheckRelation
					If bIsSpawnEnabled(SpawnFlags,5) && bIsPlayerVampire
						addToSpawnPool(5)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,16) && bIsPlayerWereWolf
						addToSpawnPool(16)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,23)
						If ConfigMenu.bCreaturesCanSteal && !bIsPlayerVampire
							addToSpawnPool(23)
						EndIf
					EndIf
					If bIsSpawnEnabled(SpawnFlags,25) && ConfigMenu.bCreaturesCanSteal && !bIsPlayerWereWolf
						addToSpawnPool(25)
					EndIf
				EndIf
				If bIsSpawnEnabled(SpawnFlags,21)
					If !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
						addToSpawnPool(21)
					EndIf
				EndIf
				If bIsSpawnEnabled(SpawnFlags,1)
					If !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
						addToSpawnPool(1)
					EndIf
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeGiantCamp)
				If bIsSpawnEnabled(SpawnFlags,14) && ConfigMenu.bCreaturesCanSteal && !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
					addToSpawnPool(14)	
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeDraugrCrypt)
				If bIsSpawnEnabled(SpawnFlags,8) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(8)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,3)
					addToSpawnPool(3)
				EndIf
			EndIf
			If bIsSpawnEnabled(SpawnFlags,3) && (akLocation.HasKeyword(LocTypeBanditCamp) || akLocation.HasKeyword(LocTypeMine))
				addToSpawnPool(3)
			EndIf
			If akLocation.HasKeyword(LocTypeFalmerHive)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,11)
						addToSpawnPool(11)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,4)
						addToSpawnPool(4)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,18)
						addToSpawnPool(18)
					EndIf
				EndIf
			EndIf
			If akLocation.HasKeyword(LocSetDwarvenRuin) || akLocation.HasKeyword(LocTypeDwarvenAutomatons)
				If bIsSpawnEnabled(SpawnFlags,10) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(10)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,3)
					addToSpawnPool(3)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,13)
					addToSpawnPool(13)
				EndIf
			EndIf
			If bIsSpawnEnabled(SpawnFlags,12) && akLocation.HasKeyword(LocTypeForswornCamp)
				addToSpawnPool(12)
			EndIf
			If akLocation.HasKeyword(LocTypeVampireLair)
				If ConfigMenu.bSpawnCheckRelation
					If bIsSpawnEnabled(SpawnFlags,5) && bIsPlayerVampire
						addToSpawnPool(5)
					ElseIf bIsSpawnEnabled(SpawnFlags,23) && ConfigMenu.bCreaturesCanSteal
						addToSpawnPool(23)
					EndIf
				ElseIf bIsSpawnEnabled(SpawnFlags,23) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(23)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeWerewolfLair)
				If ConfigMenu.bSpawnCheckRelation
					If bIsSpawnEnabled(SpawnFlags,16) && bIsPlayerWereWolf
						addToSpawnPool(16)
					ElseIf bIsSpawnEnabled(SpawnFlags,25) && ConfigMenu.bCreaturesCanSteal
						addToSpawnPool(25)
					EndIf
				ElseIf bIsSpawnEnabled(SpawnFlags,25) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(25)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeWarlockLair)
				If bIsSpawnEnabled(SpawnFlags,2) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(2)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,24)
					addToSpawnPool(24)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocSetNordicRuin)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,8)
						addToSpawnPool(8)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,18)
						addToSpawnPool(18)
					EndIf
				EndIf
				If bIsSpawnEnabled(SpawnFlags,3)
					addToSpawnPool(3)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,13)
					addToSpawnPool(13)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeMilitaryFort)
				If bIsSpawnEnabled(SpawnFlags,17) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(17)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,13)
					addToSpawnPool(13)
				EndIf
				If bIsSpawnEnabled(SpawnFlags,3)
					addToSpawnPool(3)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeDragonPriestLair)
				If bIsSpawnEnabled(SpawnFlags,6) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(6)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeHagravenNest)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,15)
						addToSpawnPool(15)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,26)
						addToSpawnPool(26)
					EndIf
				EndIf
				If bIsSpawnEnabled(SpawnFlags,27)
					addToSpawnPool(27)
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeDragonLair)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,6) && ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
						addToSpawnPool(6)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,7)
						addToSpawnPool(7)
					EndIf
				EndIf
			EndIf
			If akLocation.HasKeyword(LocSetCave) || akLocation.HasKeyword(LocSetCaveIce)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,22)
						addToSpawnPool(22)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,18)
						addToSpawnPool(18)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,17)
						addToSpawnPool(17)
					EndIf
					If akLocation.HasKeyword(LocSetCaveIce)
						If bIsSpawnEnabled(SpawnFlags,26)
							addToSpawnPool(26)
						EndIf
					EndIf
				EndIf
			EndIf
			If akLocation.HasKeyword(LocTypeSprigganGrove)
				If ConfigMenu.bCreaturesCanSteal
					If bIsSpawnEnabled(SpawnFlags,19)
						addToSpawnPool(19)
					EndIf
					If bIsSpawnEnabled(SpawnFlags,26)
						addToSpawnPool(26)
					EndIf
				EndIf
			EndIf
			If ReviveScript.RespawnScript.bInSameLocation(ThalmorEmbassyLocation, akMarker)
				If bIsSpawnEnabled(SpawnFlags,20) 
					addToSpawnPool(20)
				EndIf
			EndIf
			If ReviveScript.RespawnScript.bInSameLocation(BthardamzLocation, akMarker)
				If bIsSpawnEnabled(SpawnFlags,0)
					addToSpawnPool(0)
				EndIf
			EndIf
			If ReviveScript.RespawnScript.bInSameLocation(ShrineofMehrunesDagonLocation, akMarker)
				If bIsSpawnEnabled(SpawnFlags,9) && ConfigMenu.bCreaturesCanSteal
					addToSpawnPool(9)
				EndIf
			EndIf
		EndIf
		If (akMarker.GetParentCell() == MehrunesDagonShrine)
			If bIsSpawnEnabled(SpawnFlags,9) && ConfigMenu.bCreaturesCanSteal
				addToSpawnPool(9)
			EndIf
		EndIf
		;Debug.Trace("iSpawnArr :"+iSpawnArr)
		If iSpawnPool > 0
			If iTotalSpawns == 1 && akLocation &&\
			!akLocation.HasKeyword(LocTypeHabitation) && !akLocation.HasKeyword(LocTypeDwelling);Bandits can be anywhere
				addToSpawnPool(3)
			EndIf
		ElseIf !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
			If bIsSpawnEnabled(SpawnFlags,21)
				If !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
					addToSpawnPool(21)
				EndIf
			EndIf	
			If bIsSpawnEnabled(SpawnFlags,1)
				If !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
					addToSpawnPool(1)
				EndIf
			EndIf
			If bIsSpawnEnabled(SpawnFlags,3)
				addToSpawnPool(3)
			EndIf			
		EndIf
		If iSpawnPool > 0
			Return getFromSpawnPool()
		EndIf
		If !ConfigMenu.bRetrySpawnWithoutLocation
			Return None
		EndIf
	EndIf
	clearSpawnPool()
	If ConfigMenu.bCreaturesCanSteal
		If !ReviveScript.RespawnScript.IsInInteriorActual(akMarker)
			bIsSpawnEnabled(SpawnFlags,7) && addToSpawnPool(7)
			bIsSpawnEnabled(SpawnFlags,14) && addToSpawnPool(14)
		EndIf
		bIsSpawnEnabled(SpawnFlags,11) && addToSpawnPool(11)
		bIsSpawnEnabled(SpawnFlags,4) && addToSpawnPool(4)
		bIsSpawnEnabled(SpawnFlags,2) && addToSpawnPool(2)
		bIsSpawnEnabled(SpawnFlags,26) && addToSpawnPool(26)
		bIsSpawnEnabled(SpawnFlags,6) && addToSpawnPool(6)
		bIsSpawnEnabled(SpawnFlags,15) && addToSpawnPool(15)
		bIsSpawnEnabled(SpawnFlags,18) && addToSpawnPool(18)
		bIsSpawnEnabled(SpawnFlags,13) && addToSpawnPool(13)
		bIsSpawnEnabled(SpawnFlags,22) && addToSpawnPool(22)
		bIsSpawnEnabled(SpawnFlags,17) && addToSpawnPool(17)
		bIsSpawnEnabled(SpawnFlags,9) && addToSpawnPool(9)
		bIsSpawnEnabled(SpawnFlags,8) && addToSpawnPool(8)
		bIsSpawnEnabled(SpawnFlags,10) && addToSpawnPool(10)
		bIsSpawnEnabled(SpawnFlags,19) && addToSpawnPool(19)
	EndIf
	bIsSpawnEnabled(SpawnFlags,0) && addToSpawnPool(0)
	bIsSpawnEnabled(SpawnFlags,12) && addToSpawnPool(12)
	If bIsSpawnEnabled(SpawnFlags,20)
		If !ConfigMenu.bSpawnCheckRelation || \
		(!PlayerRef.GetRace() || ((PlayerRef.GetRace() != HighElf) && (PlayerRef.GetRace() != HighElfVampire)))
			addToSpawnPool(20)
		EndIf
	EndIf
	bIsSpawnEnabled(SpawnFlags,24) && addToSpawnPool(24)
	bIsSpawnEnabled(SpawnFlags,27) && addToSpawnPool(27)
	If !ConfigMenu.bSpawnCheckRelation || !PlayerRef.IsInFaction(ThievesGuildFaction)
		bIsSpawnEnabled(SpawnFlags,21) && addToSpawnPool(21)
	EndIf
	If !ConfigMenu.bSpawnCheckRelation ||  !PlayerRef.IsInFaction(DarkBrotherHoodFaction)
		bIsSpawnEnabled(SpawnFlags,1) && addToSpawnPool(1)
	EndIf
	If ConfigMenu.bSpawnCheckRelation
		If bIsPlayerVampire
			bIsSpawnEnabled(SpawnFlags,5) && addToSpawnPool(5)
		ElseIf ConfigMenu.bCreaturesCanSteal
			bIsSpawnEnabled(SpawnFlags,23) && addToSpawnPool(23)
		EndIf
	Else
		bIsSpawnEnabled(SpawnFlags,5) && addToSpawnPool(5)
		If bIsSpawnEnabled(SpawnFlags,23) && ConfigMenu.bCreaturesCanSteal
			addToSpawnPool(23)
		EndIf
	EndIf
	If ConfigMenu.bSpawnCheckRelation
		If bIsPlayerWereWolf
			bIsSpawnEnabled(SpawnFlags,16) && addToSpawnPool(16)
		ElseIf ConfigMenu.bCreaturesCanSteal
			bIsSpawnEnabled(SpawnFlags,25) && addToSpawnPool(25)
		EndIf
	Else
		bIsSpawnEnabled(SpawnFlags,16) && addToSpawnPool(16)
		bIsSpawnEnabled(SpawnFlags,25) && ConfigMenu.bCreaturesCanSteal && addToSpawnPool(25)
	EndIf
	bIsSpawnEnabled(SpawnFlags,3) && addToSpawnPool(3)
	If iSpawnPool > 0
		Return getFromSpawnPool()
	EndIf
	Return None
EndFunction

Bool Function bIsHostileNPCNearby()
	Int i
	Actor akHostile
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC (Phase 1)...")
	If moaHostileNPCDetector01.IsRunning() && HostileActor01.GetReference() As Actor
		akHostile = HostileActor01.GetReference() As Actor
		ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkOfArkay: Detected hostile NPC in phase 1: ( '" +\
			akHostile.GetActorBase().GetName() + "', " + akHostile +\
			", " + akHostile.GetRace() + ", )" )
		Return True
	Else
		stopAndConfirm(moaHostileNPCDetector01,3)
		moaHostileNPCDetector01.Start()
		If HostileActor01.GetReference() As Actor
			akHostile = HostileActor01.GetReference() As Actor
			ConfigMenu.bIsLoggingEnabled && Debug.Trace( "MarkOfArkay: Detected hostile NPC in phase 1: ( '" +\
				akHostile.GetActorBase().GetName() + "', " + akHostile +\
				", " + akHostile.GetRace() + ", )" )
			Return True
		EndIf
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a hostile NPC (Phase 2)...")
	Actor RandActor = Game.FindClosestActorFromRef(PlayerRef,2000)
	If RandActor
		If bIsHostile(RandActor)
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 2: ( '" +\
				RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )" )
			Return True
		EndIf
		i = 0
		While ( i < 15 )
			i += 1
			RandActor = Game.FindRandomActorFromRef(PlayerRef,2000)
			If RandActor
				If bIsHostile(RandActor)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected hostile NPC in phase 2: ( '" +\
						RandActor.GetActorBase().GetName() + "', " + RandActor + ", " + RandActor.GetRace() + ", )" )
					Return True
				EndIf
			EndIf
		EndWhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No hostile NPC detected.")
	Else ;No NPC is around the player
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No NPC is near the player.")
		Return False
	EndIf
	Return False
EndFunction

Bool Function bIsHostile(Actor ActorRef)
	If ActorRef
		Return (( ActorRef != PlayerRef ) && !ActorRef.HasSpell(WontSteal) &&\
			!( ActorRef.IsDead() || ( ActorRef.GetActorValue("Health") <= 0 )) &&\
			!ActorRef.IsDisabled() && !ActorRef.IsCommandedActor() && !ActorRef.IsGuard() &&\
			(( ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature")) ||\
				( ConfigMenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature") && \
					(!ActorRef.HasKeywordString("actortypeanimal") || (ActorRef.IsInFaction(SpiderFaction) || ActorRef.IsInFaction(ChaurusFaction))))) &&\
			(( ReviveScript.Attacker && (ReviveScript.Attacker == ActorRef )) || ( ActorRef.GetFactionReaction(PlayerRef) == 1 ) ||\
				ActorRef.IsHostileToActor(PlayerRef) || ( ActorRef.GetRelationshipRank(PlayerRef) < 0 )))
	EndIf
	Return False
EndFunction

Bool Function bCanSteal(Actor ActorRef)
	If ActorRef
		Return (( ActorRef != PlayerRef ) && !ActorRef.HasSpell(WontSteal) &&\
			!( ActorRef.IsDead() || ( ActorRef.GetActorValue("Health") <= 0 )) &&\
			!ActorRef.IsDisabled() && !ActorRef.IsEssential() && !ActorRef.GetActorBase().IsProtected() &&\
			!ActorRef.GetActorBase().IsInvulnerable() && !ActorRef.IsGhost() && !ActorRef.IsCommandedActor() &&\
			!ActorRef.IsGuard() && (( ActorRef.HasKeywordString("actortypenpc") && !ActorRef.HasKeywordString("actortypecreature") && \
					( !ConfigMenu.bMoralityMatters || ( ActorRef.GetActorValue("Morality") < 3 ))) ||\
				( ConfigMenu.bCreaturesCanSteal && ActorRef.HasKeywordString("actortypecreature") && \
					(!ActorRef.HasKeywordString("actortypeanimal") || (ActorRef.IsInFaction(SpiderFaction) || ActorRef.IsInFaction(ChaurusFaction))))) && \
			(( ReviveScript.Attacker && ( ReviveScript.Attacker == ActorRef )) || \
				( ActorRef.GetFactionReaction(PlayerRef) == 1 ) || \
				ActorRef.IsHostileToActor(PlayerRef) || ( ActorRef.GetRelationshipRank(PlayerRef) < 0 )) &&\
			( ActorRef.HasLOS(PlayerRef) || ( ReviveScript.Attacker && \
					( ReviveScript.Attacker == ActorRef )) || ( ActorRef.GetDistance(PlayerRef) <= 100.0 )))
	EndIf
	Return False
EndFunction

Function DetectThiefNPC()
	Int i
	Bool bFound = False
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 0)...")
	If ReviveScript.bCursed() && ReviveScript.moaThiefNPC01.IsRunning()
		If ReviveScript.Thief && !ReviveScript.Thief.IsDisabled() && !ReviveScript.Thief.GetActorBase().IsInvulnerable() && \
			(!ConfigMenu.bLoseForever || bIsDying(ReviveScript.Thief)) ;check previous one
			If ( !bIsHostile(ReviveScript.Thief) || PlayerRef.GetDistance(ReviveScript.Thief) > 2000 )
				ReviveScript.bRemoveItems = False
				If !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
					ReviveScript.iReducedSkill = 0
				EndIf
			EndIf
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 0: ( '" +\
				(ReviveScript.Thief.GetActorBase().GetName()) + "', "  + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )" )
			Return
		EndIf
		ReviveScript.bRemoveItems = False ;After location change either a new one will be spawned or quest would stop
		If !ConfigMenu.bOnlyLoseSkillXP && !(ConfigMenu.bLoseSkillForever && ConfigMenu.bDLIEOK)
			ReviveScript.iReducedSkill = 0
		EndIf
		ReviveScript.Thief = None
		Return
	EndIf
	ReviveScript.Thief = None
	If !ConfigMenu.bSpawnHostile || !ConfigMenu.bOnlySpawn
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 1)...")
		Actor akHostile
		If moaHostileNPCDetector.IsRunning() && HostileActor.GetReference() As Actor
			akHostile = HostileActor.GetReference() As Actor
			If !bIsDying(akHostile) && !akHostile.GetActorBase().IsInvulnerable()
				ReviveScript.Thief = akHostile
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 1: ( '" +\
					ReviveScript.Thief.GetActorBase().GetName() + "', "  + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )" )
				If !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
					Return
				EndIf
				bFound = True
			EndIf
		EndIf
		If !bFound
			stopAndConfirm(moaHostileNPCDetector,3)
			moaHostileNPCDetector.Start()
			akHostile = HostileActor.GetReference() As Actor
			If akHostile &&\
				!bIsDying(akHostile) && !akHostile.GetActorBase().IsInvulnerable()
				ReviveScript.Thief = akHostile
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 1: ( '" +\
					ReviveScript.Thief.GetActorBase().GetName() + "', "  + ReviveScript.Thief + ", " + ReviveScript.Thief.GetRace() + ", )" )
				If !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
					Return
				EndIf
				bFound = True
			EndIf
		EndIf
		If !bFound
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a Thief (Phase 2)...")
			Actor RandActor = Game.FindClosestActorFromRef(PlayerRef,2000)
			If RandActor
				If bCanSteal(RandActor)
					ReviveScript.Thief = RandActor
					HostileActor.ForceRefTo(ReviveScript.Thief)
					ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 2: ( '" +\
						RandActor.GetActorBase().GetName() + "', "  + RandActor + ", " + RandActor.GetRace() + ", )" )
					If !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
						Return
					EndIf
				EndIf
				i = 0
				While ( i < 15 ) && !bFound
					i += 1
					RandActor = Game.FindRandomActorFromRef(PlayerRef,2000)
					If RandActor
						If bCanSteal(RandActor)
							ReviveScript.Thief = RandActor
							HostileActor.ForceRefTo(ReviveScript.Thief)
							ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected Thief in phase 2: ( '" +\
								RandActor.GetActorBase().GetName() + "', "  + RandActor + ", " + RandActor.GetRace() + ", )" )
							If !ConfigMenu.bAlwaysSpawn || !ConfigMenu.bSpawnHostile
								Return
							EndIf
							bFound = True
						EndIf
					EndIf
				EndWhile
				If !bFound && ConfigMenu.bIsLoggingEnabled
					 Debug.Trace("MarkOfArkay: No hostile NPC who can steal detected.")
				EndIf
			EndIf
		EndIf
	EndIf
	If !ConfigMenu.bSpawnHostile || (!bSpawnThief(PlayerRef As ObjectReference,bFound) && !bFound)
		;No NPC is around the player
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No hostile NPC found/spawned.")
		Return
	EndIf
EndFunction

Bool Function bIsDying(Actor aiActor)
	Return aiActor.IsDead() || aiActor.GetActorValue("Health") <= 0
EndFunction

Bool Function FollowerCanProtectPlayer()
	If ( ConfigMenu.bFollowerProtectPlayer && ReviveScript.Attacker )
		Int i = FollowerArr.Length
		If i > 0 
			Bool bInCombat = False
			While i > 0 && !bInCombat
				i -= 1
				If bIsFollower(FollowerArr[i])
					If ( FollowerArr[i].Is3DLoaded() && !bIsDying(FollowerArr[i]) && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef) )
						If (( FollowerArr[i].GetCombatState() ) && ( FollowerArr[i].GetDistance(PlayerRef) <= 2500.0 ))
							bInCombat = True
						ElseIf ( ReviveScript.Attacker != FollowerArr[i] ) && ( ReviveScript.Attacker.GetDistance(PlayerRef) <= 10000.0 )
							If ( bIsDying(ReviveScript.Attacker) || ReviveScript.Attacker.IsBleedingOut() )
								ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Someone avenged your defeat.")
								Return True
							ElseIf ReviveScript.Attacker.IsInCombat()
								bInCombat = True
							EndIf
						EndIf
					EndIf
				EndIf
			EndWhile
			If bInCombat
				Utility.Wait(5.0)
				i = FollowerArr.Length
				While i > 0
					i -= 1
					If bIsFollower(FollowerArr[i])
						If ( FollowerArr[i].Is3DLoaded() && !bIsDying(FollowerArr[i]) && !FollowerArr[i].IsBleedingOut() && !FollowerArr[i].IsHostileToActor(PlayerRef) )
							If (( FollowerArr[i].GetCombatState() == 1 ) && ( FollowerArr[i].GetDistance(PlayerRef) <= 2500.0 ))
								ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_In_Combat")
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Followers are still fighting.")
								Return True
							ElseIf ( ( ReviveScript.Attacker != FollowerArr[i] ) && ( ReviveScript.Attacker.IsDead() || ( ReviveScript.Attacker.GetActorValue("Health") <= 0 ) || ReviveScript.Attacker.IsBleedingOut() ) )
								ConfigMenu.bIsNotificationEnabled && Debug.Notification("$mrt_MarkofArkay_Notification_Follower_Avenged")
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Someone avenged your defeat.")
								Return True
							EndIf
						EndIf
					EndIf
				EndWhile
			EndIf
		EndIf
	EndIf
	Return False
EndFunction

Function HoldFollowers()
	If ConfigMenu.bPlayerProtectFollower
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				If (( !FollowerArr[i].IsDead() ) || ( FollowerArr[i].IsDead() && ConfigMenu.bPlayerProtectFollower ))
					If ( FollowerArr[i].IsDead() )
						If ( ConfigMenu.bPlayerProtectFollower )
							FollowerArr[i].Resurrect()
						EndIf
					EndIf
					FollowerArr[i].StopCombat()
					FollowerArr[i].StopCombatAlarm()
					FollowerArr[i].DisableNoWait()
					FollowerArr[i].MoveTo(ReviveScript.LostItemsChest)
				EndIf
			EndIf
		EndWhile
	EndIf
EndFunction

Function ReleaseFollowers()
	If ConfigMenu.bPlayerProtectFollower
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				FollowerArr[i].RestoreActorValue("Health",9999)
				FollowerArr[i].MoveToMyEditorLocation()
			EndIf
		EndWhile
	EndIf
EndFunction

Function RespawnFollowers()
	If ConfigMenu.bPlayerProtectFollower
		Int i = FollowerArr.Length
		While i > 0
			i -= 1
			If FollowerArr[i]
				FollowerArr[i].RestoreActorValue("Health",9999)
				FollowerArr[i].MoveTo(PlayerRef)
			EndIf
		EndWhile
	EndIf
EndFunction

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
	EndWhile
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Resurrection of followers finished.")
EndFunction

Function ToggleFollower(Bool bEnable)
	If ConfigMenu.bPlayerProtectFollower
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
		EndWhile
	EndIf
EndFunction


Bool Function bSpawnThief(ObjectReference akMarkerRef,Bool bExtra = False)
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Trying to spawning a hostile NPC...")
	If !bExtra
		ReviveScript.Thief = None
	EndIf
	Bool[] bSpawnFlags = Utility.CreateBoolArray(ConfigMenu.iSpawnCounts.Length)
	Int i = 0
	While i < ConfigMenu.iSpawnWeights.Length
		bSpawnFlags[i] = ConfigMenu.iSpawnWeights[i] As Bool
		i += 1
	EndWhile
	Form[] RandActors = SpawnActorsFromList(aiActors = SelectSpawnList(akMarkerRef, SpawnFlags = bSpawnFlags,ActorRef=ReviveScript.Thief), akMarker = akMarkerRef, aiCount = -1, aiMinLevel = ConfigMenu.iSpawnMinLevel, aiMaxLevel = ConfigMenu.iSpawnMaxLevel, abMix = ConfigMenu.bSpawnBringAllies)
	If RandActors
		Actor RandActor = RandActors[0] As Actor
		If !bExtra || !ReviveScript.Thief
			ReviveScript.Thief = RandActor
			HostileActor.Clear()
			ReviveScript.ThiefNPC01.Clear()
			ReviveScript.ThiefNPC.Clear()
			stopAndConfirm(moaHostileNPCDetector,3)
		EndIf
		i = 0
		While i < ThiefActors.Length
			If i < RandActors.Length
				(RandActors[i] As Actor).AddSpell(WontSteal)
				(RandActors[i] As Actor).RemoveItem(ReviveScript.MarkOfArkay,(RandActors[i] As Actor).GetItemCount(ReviveScript.MarkOfArkay))
				(RandActors[i] As Actor).RemoveItem(ReviveScript.RevivalScroll,(RandActors[i] As Actor).GetItemCount(ReviveScript.RevivalScroll))
				(RandActors[i] As Actor).RemoveItem(ReviveScript.SacrificeScroll,(RandActors[i] As Actor).GetItemCount(ReviveScript.SacrificeScroll))
				(RandActors[i] As Actor).RemoveItem(ReviveScript.GrandFilledGem,(RandActors[i] As Actor).GetItemCount(ReviveScript.GrandFilledGem))
				(RandActors[i] As Actor).RemoveItem(ReviveScript.BlackFilledGem,(RandActors[i] As Actor).GetItemCount(ReviveScript.BlackFilledGem))
				(RandActors[i] As Actor).RemoveItem(ReviveScript.Gold001,(RandActors[i] As Actor).GetItemCount(ReviveScript.Gold001))
				ThiefActors[i].ForceRefTo(RandActors[i] As Actor)
			Else
				ThiefActors[i].Clear()
			EndIf
			i += 1
		EndWhile
		ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Spawning hostile in phase 3: ( '" +\
			RandActor.GetActorBase().GetName() + "', "  + RandActor + ", " + RandActor.GetRace() + ", )" )
		Return True
	EndIf
	Return False
EndFunction


Bool Function bIsFollower(Actor ActorRef)
	If ActorRef
		Return (ActorRef != PlayerRef) && !ActorRef.IsCommandedActor() && (ActorRef.IsPlayerTeammate() || ActorRef.IsInFaction(PlayerFollowerFaction))
	EndIf
	Return False
EndFunction

Function DetectFollowers()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detecting followers...")
	stopAndConfirm(moaFollowerDetector,3)
	moaFollowerDetector.Start()
	If FollowerArr.Length != 128
		FollowerArr = New Actor[128]
	EndIf
	Int i = FollowerArr.Length
	Int j
	While i > 0
		i -= 1
		If !bIsFollower(FollowerArr[i])
			FollowerArr[i] = None
		EndIf
	EndWhile
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
	EndWhile
	moaFollowerDetector.Stop()
	i = 0
	Actor RandActor
	Bool bBreak = False
	While ( i < 15 ) && !bBreak
		i += 1
		RandActor = Game.FindRandomActorFromRef(PlayerRef,2000)
		If RandActor
			If FollowerArr.Find(RandActor) < 0
				If bIsFollower(RandActor)
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
		String str = "MarkOfArkay: Detected Followers = [ "
		i = FollowerArr.Length
		Int count = 0
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
		EndWhile
		str += "]"
		Debug.Trace(str)
		Debug.Trace("MarkOfArkay: Number of detected followers: " + count)
	EndIf
EndFunction

Bool Function bGuardCanSendToJail()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detecting guard NPCs...")
	Bool bCanSendToCidhna = bCanSendToCidhna()
	Faction CrimeFaction
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 1)...")
	If ( ReviveScript.Attacker && !ReviveScript.Attacker.IsDead() )
		If ( ReviveScript.Attacker.IsGuard() )
			If ( PlayerRef.GetDistance(ReviveScript.Attacker) < 2000.0 )
				CrimeFaction = ReviveScript.Attacker.GetCrimeFaction()
				If ( CrimeFaction && ( CrimeFaction.GetCrimeGold() > 0 ))
					If (( CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach ) || bCanSendToCidhna )
						ReviveScript.Guard = ReviveScript.Attacker
						ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 1: ( '" +\
							ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )" )
						Return True
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 2)...")
	stopAndConfirm(moaGuardDetector,3)
	moaGuardDetector.Start()
	If GuardNPC.GetReference() As Actor
		CrimeFaction = ( GuardNPC.GetReference() As Actor ).GetCrimeFaction()
		If ( CrimeFaction && ( CrimeFaction.GetCrimeGold() > 0 ))
			If (( CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach ) || bCanSendToCidhna )
				ReviveScript.Guard = GuardNPC.GetReference() As Actor
				moaGuardDetector.Stop()
				ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 2: ( '" +\
					ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )" )
				Return True
			EndIf
		EndIf
	EndIf
	moaGuardDetector.Stop()
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Finding a guard NPC (Phase 3)...")
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
							If (( CrimeFaction != ReviveScript.RespawnScript.CrimeFactionReach ) || bCanSendToCidhna )
								ReviveScript.Guard = RandomActor
								ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Detected guard NPC In Phase 3: ( '" +\
									ReviveScript.Guard.GetActorBase().GetName() + "', " + ReviveScript.Guard + ", " + ReviveScript.Guard.GetRace() + ", )" )
								Return True
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else ;No NPC is around the player
			ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: No NPC is around.")
			Return False
		EndIf
	EndWhile
	ConfigMenu.bIsLoggingEnabled && Debug.Trace("MarkOfArkay: Player won't go to jail.")
	Return False
EndFunction

Bool Function bCanSendToCidhna()
	Return ( !MS01.IsCompleted() || MS02.IsCompleted() )
EndFunction

Bool Function bInBeastForm()
	If  ReviveScript.WerewolfQuest.IsRunning() || ReviveScript.VampireLordQuest.IsRunning()
		Return True
	ElseIf ( PlayerRef.GetRace() == WereWolfBeastRace )
		Return True
	ElseIf ( PlayerRef.GetRace() == DLC1VampireBeastRace )
		Return True
	EndIf
	Return False
EndFunction

Int Function iInBeastForm()
	If ReviveScript.VampireLordQuest.IsRunning() || PlayerRef.GetRace() == DLC1VampireBeastRace
		Return 1
	ElseIf  ReviveScript.WerewolfQuest.IsRunning() || PlayerRef.GetRace() == WereWolfBeastRace
		Return 2
	EndIf
	Return 0
EndFunction

Bool Function bIsPlayerVampire()
	Return PlayerIsVampire.GetValueInt() == 1 || iInBeastForm() == 1
EndFunction

Bool Function bIsPlayerWereWolf()
	Return CHScript.PlayerHasBeastBlood == 1 || PlayerIsWerewolf.GetValueInt() == 1 || iInBeastForm() == 2
EndFunction

Form[] Function SpawnActorsFromList(FormList aiActors, ObjectReference akMarker, Int aiCount = 1, Int aiMinLevel = 2, Int aiMaxLevel = 2, Bool abMix = False)
	Form[] akResult
	If aiActors == None || aiCount == 0 
		Return akResult
	EndIf
	Int iIndex = AllSpawnLists.Find(aiActors)
	clearSpawnPool()
	If abMix && iIndex > -1
		addToSpawnPool(iIndex)
		If iIndex == 2 ;Atronach
			If ConfigMenu.iSpawnWeights[24]
				addToSpawnPool(24) ;Warlock
			EndIf
		ElseIf iIndex == 4 ;Chaurus
			If ConfigMenu.iSpawnWeights[11]
				addToSpawnPool(11) ;Falmer
			EndIf
		ElseIf iIndex == 11 ;Falmer
			If ConfigMenu.iSpawnWeights[4]
				addToSpawnPool(4) ;Chaurus
			EndIf
		ElseIf iIndex == 15 ;Hagraven
			If ConfigMenu.iSpawnWeights[27]
				addToSpawnPool(27) ;Witches
			EndIf
		ElseIf iIndex == 24 ;Warlock
			If ConfigMenu.iSpawnWeights[2]
				addToSpawnPool(2) ;Warlock
			EndIf
		ElseIf iIndex == 27 ;Witches
			If ConfigMenu.iSpawnWeights[15]
				addToSpawnPool(15) ;Witches
			EndIf
		EndIf
	EndIf
	If aiCount < 0
		If iIndex > -1
			aiCount = Utility.RandomInt(1,ConfigMenu.iSpawnCounts[iIndex])
		Else
			aiCount = 1
		EndIf
	EndIf
	Int iRandInt
	Int iMinLevel
	Int iMaxLevel
	If aiMaxLevel < aiMinLevel
		iMinLevel = aiMaxLevel
		iMaxLevel = aiMinLevel
	Else
		iMinLevel = aiMinLevel
		iMaxLevel = aiMaxLevel
	EndIf
	Form[] akTargets = Utility.CreateFormArray(aiCount)
	ActorBase akActorBase
	FormList akList = aiActors
	iIndex = 0
	While iIndex < aiCount
		If iIndex > 0 && iSpawnPool > 0
			akList = getFromSpawnPool()
		EndIf
		iRandInt = Utility.RandomInt(0,akList.GetSize() - 1)
		If akList.GetAt(iRandInt) As ActorBase
			akActorBase = akList.GetAt(iRandInt) As ActorBase
		Else
			akActorBase = (akList.GetAt(iRandInt) As Actor).GetActorBase()
		EndIf		
		akTargets[iIndex] = akMarker.PlaceActorAtMe(akActorToPlace = akActorBase, aiLevelMod = Utility.RandomInt(iMinLevel,iMaxLevel))
		Utility.Wait(0.5)
		iIndex += 1
	EndWhile
	Return akTargets
EndFunction


Form[] Function bCloneActor(Actor akActor, ObjectReference akMarker, Int aiCount = 1, Int aiLevel = 2, Bool abDead = False)
	ActorBase akActorBase = akActor.GetActorBase()
	If !akActorBase || aiCount <= 0
		Return None
	EndIf
	Form[] akCloneArr = Utility.CreateFormArray(aiCount)
	Int i = 0
	While i < aiCount
		akCloneArr[i] = akMarker.PlaceActorAtMe(akActorBase, aiLevel, None) As Form
		If abDead
			If akActorBase.IsEssential()
				(akCloneArr[i] As Actor).KillEssential()
			Else
				(akCloneArr[i] As Actor).Kill()
			EndIf
		EndIf
		i += 1
	EndWhile
	Return akCloneArr
EndFunction

Function bringDeadClone()
	Form[] MyEquipment = ReviveScript.ItemScript.Equipment
	Form[] Clones = bCloneActor(PlayerRef, ReviveScript.LostItemsChest, abDead = False)
	Actor Clone = Clones[0] As Actor
	DeadClone = Clone
	Clone.AddSpell(WontSteal)
	Clone.RemoveAllItems()
	Int i = MyEquipment.Length
	While i > 0 
		i -= 1
		If MyEquipment[i]
			If MyEquipment[i] As Armor
				If !MyEquipment[i].HasKeywordString("ArmorShield")
					Clone.AddItem(MyEquipment[i])
					Clone.EquipItemEx(MyEquipment[i])
				EndIf
			EndIf
		EndIf
	EndWhile
	(Clone As ObjectReference).BlockActivation()
	Clone.Disable()
	Clone.MoveTo(PlayerRef)
	Utility.Wait(0.5)
	Clone.SetActorValue("Paralysis",1)
	Utility.Wait(1.0)
	Clone.SetDontMove(True)
	Clone.SetRestrained(True)
	Clone.SetUnconscious(True)
	Clone.SetHeadTracking(False)
	Clone.SetGhost(True)
	Clone.SetActorValue("Sneak",100.0)
	Clone.Enable()
	If !ReviveScript.moaSoulMark01.IsRunning()
		ReviveScript.moaSoulMark01.Start()
	EndIf
	SoulMark02.ForceRefTo(Clone)
	If ReviveScript.moaRetrieveLostItems.IsRunning()
		ItemMarker02.ForceRefTo(DeadClone)
	EndIf
	SoulMark02.RegisterForSingleUpdate(30.0)
EndFunction

Function RemoveDeadClone()
	If !SoulMark02.GetActorReference() && !DeadClone
		Return
	EndIf
	Actor Clone = SoulMark02.GetActorReference()
	If !Clone
		Clone = DeadClone
	EndIf
	Clone.MoveTo(ReviveScript.LostItemsChest)		
	Clone.SetCriticalStage(Clone.CritStage_DisintegrateEnd)
	Clone.DisableNoWait()
	DeadClone = None
	SoulMark02.UnregisterForUpdate()
EndFunction

Function RemoveSpawnedThiefs()
	Int i = 0
	Actor Thief
	While i < ThiefActors.Length
		If ThiefActors[i].GetActorReference()
			Thief = ThiefActors[i].GetActorReference()
			Thief && Thief.SetCriticalStage(Thief.CritStage_DisintegrateEnd)
			Thief && Thief.DisableNoWait()
		EndIf
		i += 1
	EndWhile
EndFunction
