Scriptname zzzmoa_PlayerGhostScript extends Quest

zzzmoaReviveMCM property ConfigMenu auto
Formlist property CrimeFactions auto
Spell property GhostVisual auto
Faction property HunterFaction auto
Spell property NPCGhostFearCloak auto
Actor property PlayeRref auto
Faction property PlayerGhostFaction auto

event OnUpdate()
  if IsRunning() && GetStage() < 10
    PlayerRef.SetAlpha(0.25)
    if !ConfigMenu.bLiteGhostCurse
      PlayerRef.AddSpell(NPCGhostFearCloak, False)
      Utility.Wait(1.0)
      PlayerRef.RemoveSpell(NPCGhostFearCloak)
    endif
    PlayerRef.SetAttackActorOnSight(True)
    RegisterForSingleUpdate(4.0)
  endif
endevent

function setPlayerGhost(Bool bToggle=True)
  if bToggle
    PlayerRef.AddSpell(GhostVisual, False)
    PlayerRef.SetAlpha(0.25, True)
    PlayerRef.AddToFaction(PlayerGhostFaction)
    RegisterForSingleUpdate(3.0)
  else
    PlayerRef.RemoveSpell(GhostVisual)
    PlayerRef.SetAlpha(1.0, True)
    PlayerRef.RemoveFromFaction(PlayerGhostFaction)
  endif
  int cfIndex = 0
  while (cfIndex < CrimeFactions.GetSize())
    (CrimeFactions.GetAt(cfIndex) as Faction).SetPlayerEnemy(bToggle)
    cfIndex += 1
  endwhile
  HunterFaction.SetPlayerEnemy(bToggle)
  PlayerRef.SetAttackActorOnSight(bToggle)
  Game.SetPlayerReportCrime(!bToggle)
endfunction
