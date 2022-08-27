;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_zzzmoa_ThiefNPC01Qst Extends Quest Hidden

;BEGIN ALIAS PROPERTY StolenItems01_2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenItems01_2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenItems01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenItems01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenItems02_2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenItems02_2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenItems02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenItems02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
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
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
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
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Alias_Thief01.GetReference() As Actor) && ReviveScript.ItemScript.AddStolenItemMarker(Alias_Thief01.GetReference() As Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
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
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE zzzmoasoulmarktrap01script
Quest __temp = self as Quest
zzzmoasoulmarktrap01script kmyQuest = __temp as zzzmoasoulmarktrap01script
;END AUTOCAST
;BEGIN CODE
(Alias_Thief01.GetReference() As Actor) && ReviveScript.RemoveStolenItemMarkers(Alias_Thief01.GetReference() As Actor)
;(Alias_Thief01.GetReference() As Actor) && (Alias_Thief01.GetReference() As Actor).RemoveFromFaction(PlayerEnemyFaction)
kmyQuest.StopQuest(bRemoveFast = True)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PlayerEnemyFaction  Auto  
zzzmoaReviverScript Property ReviveScript Auto
