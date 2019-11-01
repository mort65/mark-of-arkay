;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_zzzmoa_PlayerGhostQst Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE zzzmoa_PlayerGhostScript
Quest __temp = self as Quest
zzzmoa_PlayerGhostScript kmyQuest = __temp as zzzmoa_PlayerGhostScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.setPlayerGhost(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE zzzmoa_PlayerGhostScript
Quest __temp = self as Quest
zzzmoa_PlayerGhostScript kmyQuest = __temp as zzzmoa_PlayerGhostScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.setPlayerGhost(False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
