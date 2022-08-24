;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_zzzmoa_ThiefNPC01Qst extends Quest Hidden

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY StolenItems01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_StolenItems01 auto

;BEGIN ALIAS PROPERTY StolenItems01_2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_StolenItems01_2 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY StolenItems02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_StolenItems02 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY StolenItems02_2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_StolenItems02_2 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief01 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief02 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief03 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief04 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief05 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief06 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief07 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief08 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief09 auto

;END ALIAS PROPERTY
;BEGIN ALIAS PROPERTY Thief10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias property Alias_Thief10 auto

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Faction property PlayerEnemyFaction auto
zzzmoaReviverScript property ReviveScript auto

;END FRAGMENT
;BEGIN FRAGMENT Fragment_0
function Fragment_0()
  ;BEGIN CODE
  (Alias_Thief01.GetReference() As Actor) && ReviveScript.ItemScript.AddStolenItemMarker(Alias_Thief01.GetReference() As Actor)

  ;END CODE
endfunction

;END ALIAS PROPERTY
;BEGIN FRAGMENT Fragment_11
function Fragment_11()
  ;BEGIN AUTOCAST TYPE zzzmoasoulmarktrap01script
  Quest __temp = self as Quest
  zzzmoasoulmarktrap01script kmyQuest = __temp as zzzmoasoulmarktrap01script

  ;END AUTOCAST
  ;BEGIN CODE
  (Alias_Thief01.GetReference() As Actor) && ReviveScript.RemoveStolenItemMarkers(Alias_Thief01.GetReference() As Actor)

  ;(Alias_Thief01.GetReference() As Actor) && (Alias_Thief01.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
  kmyQuest.StopQuest()
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_14
function Fragment_14()
  ;BEGIN CODE
  stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_16
function Fragment_16()
  ;BEGIN AUTOCAST TYPE zzzmoasoulmarktrap01script
  Quest __temp = self as Quest
  zzzmoasoulmarktrap01script kmyQuest = __temp as zzzmoasoulmarktrap01script

  ;END AUTOCAST
  ;BEGIN CODE
  (Alias_Thief01.GetReference() As Actor) && ReviveScript.RemoveStolenItemMarkers(Alias_Thief01.GetReference() As Actor)

  ;(Alias_Thief01.GetReference() As Actor) && (Alias_Thief01.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
  kmyQuest.StopQuest(bRemoveFast=True)
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_6
function Fragment_6()
  ;BEGIN AUTOCAST TYPE zzzmoasoulmarktrap01script
  Quest __temp = self as Quest
  zzzmoasoulmarktrap01script kmyQuest = __temp as zzzmoasoulmarktrap01script

  ;END AUTOCAST
  ;BEGIN CODE
  (Alias_Thief01.GetReference() As Actor) && ReviveScript.RemoveStolenItemMarkers(Alias_Thief01.GetReference() As Actor)

  ;(Alias_Thief01.GetReference() As Actor) && (Alias_Thief01.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
  kmyQuest.StopQuest(-1)
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_7
function Fragment_7()
  ;BEGIN AUTOCAST TYPE zzzmoasoulmarktrap01script
  Quest __temp = self as Quest
  zzzmoasoulmarktrap01script kmyQuest = __temp as zzzmoasoulmarktrap01script

  ;END AUTOCAST
  ;BEGIN CODE
  (Alias_Thief01.GetReference() As Actor) && ReviveScript.RemoveStolenItemMarkers(Alias_Thief01.GetReference() As Actor)

  ;(Alias_Thief01.GetReference() As Actor) && (Alias_Thief01.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
  kmyQuest.StopQuest(1)
  Stop()

  ;END CODE
endfunction
