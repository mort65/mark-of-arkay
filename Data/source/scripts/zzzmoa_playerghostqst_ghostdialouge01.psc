;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname zzzmoa_PlayerGhostQst_GhostDialouge01 extends TopicInfo Hidden

zzzmoaReviveMCM property ConfigMenu auto

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Spell property Phasmophobia auto
Actor property PlayerRef auto

;BEGIN FRAGMENT Fragment_0
function Fragment_0(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor

  ;BEGIN CODE
  if ConfigMenu.bLiteGhostCurse
    akSpeaker.StartCombat(PlayerRef)
  else
    akSpeaker.AddSpell(Phasmophobia, False)
  endif

  ;END CODE
endfunction
