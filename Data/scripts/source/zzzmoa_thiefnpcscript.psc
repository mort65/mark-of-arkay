Scriptname zzzmoa_thiefnpcscript extends ReferenceAlias

import zzzmoautilscript

zzzmoaReviveMCM property ConfigMenu auto

event OnAttachedToCell()
  if GetActorReference() && !GetActorReference().IsDead()
    RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
    RegisterForSingleUpdate(30.0)
  endif
endevent

event OnCellAttach()
  if GetActorReference() && !GetActorReference().IsDead()
    RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
    RegisterForSingleUpdate(30.0)
  endif
endevent

event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if aeCombatState == 0 && GetActorReference() && !GetActorReference().IsDead()
    RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
  endif
endevent

event OnDying(Actor akKiller)
  if ((GetReference() As Actor) && (ConfigMenu.moaBleedoutHandlerState.GetValue() == 0))
    if Configmenu.bIsLoggingEnabled
      if akKiller
        Debug.Trace("MarkofArkay: ( '" + (GetReference() As Actor).GetActorBase().GetName() + "', " + (GetReference() As Actor) + ", " + (GetReference() As Actor).GetRace() + ", ) who stoled player's items is killed by ( '" + akKiller.GetActorBase().GetName() + "', " + akKiller + ", " + akKiller.GetRace() + ", ).")
      else
        Debug.Trace("MarkofArkay: ( '" + (GetReference() As Actor).GetActorBase().GetName() + "', " + (GetReference() As Actor) + ", " + (GetReference() As Actor).GetRace() + ", ) who stoled player's items is dead.")
      endif
    endif
    if !((GetReference() As Actor).GetParentCell().IsAttached())
      GetOwningQuest().SetStage(20)
    endif
  endif
endevent

event OnEnterBleedout()
  if ((GetReference() As Actor) && (ConfigMenu.moaBleedoutHandlerState.GetValue() == 0))
    if ((GetReference() As Actor).GetParentCell().IsAttached() && ((GetReference() As Actor).IsEssential() || (GetReference() As Actor).GetActorBase().IsEssential()))
      if Configmenu.bIsLoggingEnabled
        Debug.Trace("MarkofArkay: ( '" + (GetReference() As Actor).GetActorBase().GetName() + "', " + (GetReference() As Actor) + ", " + (GetReference() As Actor).GetRace() + ", ) who stoled player's items is bleeding out.")
      endif
      GetOwningQuest().SetStage(20)
    endif
  endif
endevent

event OnGainLOS(Actor akViewer, ObjectReference akTarget)
  if GetActorReference()
    if akViewer == GetActorReference() && akTarget == Game.GetPlayer() as Actor
      GetActorReference() && !GetActorReference().IsDead() && !Game.GetPlayer().IsBleedingOut() && GetActorReference().StartCombat(Game.GetPlayer())
    else
      RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
    endif
  endif
endevent

event OnLoad()
  if GetActorReference() && !GetActorReference().IsDead()
    RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
    RegisterForSingleUpdate(30.0)
  endif
endevent

event OnReset()
  if (ConfigMenu.moaBleedoutHandlerState.GetValue() == 0)
    if Configmenu.bIsLoggingEnabled
      if (GetReference() As Actor)
        if Configmenu.bIsLoggingEnabled
          Debug.Trace("MarkofArkay: ( '" + (GetReference() As Actor).GetActorBase().GetName() + "', " + (GetReference() As Actor) + ", " + (GetReference() As Actor).GetRace() + ", ) who stoled player's items, has reset.")
        endif
      elseif Configmenu.bIsLoggingEnabled
        Debug.Trace("MarkofArkay: NPC who stoled player's items no longer exist.")
      endif
    endif
    GetOwningQuest().SetStage(15)
  endif
endevent

event OnUpdate()
  if GetActorReference()
    if GetActorReference().Is3DLoaded() && (Game.GetPlayer().GetParentCell() == GetActorReference().GetParentCell() || GetActorReference().GetDistance(Game.GetPlayer()) < 2000)
      GetActorReference() && !GetActorReference().IsBleedingOut() && !Game.GetPlayer().IsBleedingOut() && !GetActorReference().IsDead() && GetActorReference().StartCombat(Game.GetPlayer())
    endif
    RegisterForSingleLOSGain(GetActorReference(), Game.GetPlayer() as Actor)
    RegisterForSingleUpdate(30.0)
  endif
endevent
