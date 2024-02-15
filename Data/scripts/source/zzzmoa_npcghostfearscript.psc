Scriptname zzzmoa_NPCGhostFearScript extends activemagiceffect

zzzmoaReviveMCM property ConfigMenu auto
Spell property NPCGhostFear auto
Quest property PlayerGhostQuest auto
Actor property PlayerRef auto
MagicEffect property ThisMagicEffect auto

event OnEffectStart(Actor akTarget, Actor akCaster)
  while PlayerGhostQuest.IsRunning() && !ConfigMenu.bLiteGhostCurse && akTarget && !akTarget.IsDead() && akTarget.HasMagicEffect(ThisMagicEffect) && akTarget.GetParentCell() && akTarget.GetParentCell().IsAttached()
    if !akTarget.IsInCombat()
      if akTarget.HasLos(PlayerRef)
        if !PlayerRef.IsDead() && !PlayerRef.IsBleedingOut()
          akTarget && !akTarget.IsDead() && akTarget.StartCombat(PlayerRef)
        endif
      endif
    endif
    Utility.Wait(6.0)
  endwhile
  akTarget && akTarget.DispelSpell(NPCGhostFear)
endevent
