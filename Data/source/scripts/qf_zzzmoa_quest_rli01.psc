;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_zzzmoa_Quest_RLI01 extends Quest Hidden

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC01 auto

;BEGIN ALIAS PROPERTY ThiefNPC02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC02 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC03 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC04 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC05 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC06 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC07 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC08 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC09 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY ThiefNPC10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_ThiefNPC10 auto

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction property PlayerEnemyFaction auto

;END FRAGMENT
;BEGIN FRAGMENT Fragment_2
function Fragment_2()
  ;BEGIN CODE
  Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
  if ThiefRef
    ThiefRef.RemoveFromFaction(PlayerEnemyFaction)
  endif
  FailAllObjectives()
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_3
function Fragment_3()
  ;BEGIN CODE
  Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
  if ThiefRef
    ThiefRef.RemoveFromFaction(PlayerEnemyFaction)
  endif
  CompleteAllObjectives()
  Stop()

  ;END CODE
endfunction

;END ALIAS PROPERTY
;BEGIN FRAGMENT Fragment_4
function Fragment_4()
  ;BEGIN CODE
  stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_5
function Fragment_5()
  ;BEGIN CODE
  Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
  if ThiefRef
    ThiefRef.AddToFaction(PlayerEnemyFaction)
  endif
  SetObjectiveDisplayed(1)

  ;END CODE
endfunction
