;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_zzzmoa_Quest_BossChest01 extends Quest Hidden

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_BossChest auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY LocationMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_LocationMapMarker auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY StolenItems
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_StolenItems auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY TargetLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias property Alias_TargetLocation auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY TargetLocationPlayer
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias property Alias_TargetLocationPlayer auto

;BEGIN ALIAS PROPERTY TargetLocationWorld
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias property Alias_TargetLocationWorld auto

;END FRAGMENT
;BEGIN FRAGMENT Fragment_13
function Fragment_13()
  ;BEGIN CODE
  SetObjectiveDisplayed(5, 1)
  Alias_LocationMapMarker.GetReference().AddtoMap()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_14
function Fragment_14()
  ;BEGIN CODE
  Objectreference ChestRef = Alias_BossChest.GetReference()
  if ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(), ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
  endif
  FailAllObjectives()
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_17
function Fragment_17()
  ;BEGIN CODE
  Objectreference ChestRef = Alias_BossChest.GetReference()
  if ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(), ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
  endif
  CompleteAllObjectives()
  Stop()

  ;END CODE
endfunction

;END ALIAS PROPERTY
;BEGIN FRAGMENT Fragment_19
function Fragment_19()
  ;BEGIN CODE
  Objectreference ChestRef = Alias_BossChest.GetReference()
  if ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(), ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
  endif
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
