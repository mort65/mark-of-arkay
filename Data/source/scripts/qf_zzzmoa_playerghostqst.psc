;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_zzzmoa_PlayerGhostQst extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
function Fragment_0()
  ;BEGIN AUTOCAST TYPE zzzmoa_PlayerGhostScript
  Quest __temp = self as Quest
  zzzmoa_PlayerGhostScript kmyQuest = __temp as zzzmoa_PlayerGhostScript

  ;END AUTOCAST
  ;BEGIN CODE
  kmyQuest.setPlayerGhost(True)

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_6
function Fragment_6()
  ;BEGIN AUTOCAST TYPE zzzmoa_PlayerGhostScript
  Quest __temp = self as Quest
  zzzmoa_PlayerGhostScript kmyQuest = __temp as zzzmoa_PlayerGhostScript

  ;END AUTOCAST
  ;BEGIN CODE
  kmyQuest.setPlayerGhost(False)
  Stop()

  ;END CODE
endfunction

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
