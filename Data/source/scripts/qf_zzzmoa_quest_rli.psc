;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_zzzmoa_Quest_RLI extends Quest Hidden

;BEGIN ALIAS PROPERTY zzzmoa_ItemMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_zzzmoa_ItemMarker auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY zzzmoa_ItemMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_zzzmoa_ItemMarker02 auto

;END FRAGMENT
;BEGIN FRAGMENT Fragment_10
function Fragment_10()
  ;BEGIN CODE
  setObjectiveDisplayed(1)

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_11
function Fragment_11()
  ;BEGIN CODE
  stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_6
function Fragment_6()
  ;BEGIN CODE
  FailAllObjectives()
  Stop()

  ;END CODE
endfunction

;END ALIAS PROPERTY
;BEGIN FRAGMENT Fragment_8
function Fragment_8()
  ;BEGIN CODE
  CompleteAllObjectives()
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
