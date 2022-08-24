;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF__04A33D6D extends Package Hidden

;BEGIN FRAGMENT Fragment_0
function Fragment_0(Actor akActor)
  ;BEGIN CODE
  akActor.SetLookAt(Game.GetPlayer())

  ;END CODE
endfunction

;END FRAGMENT
;BEGIN FRAGMENT Fragment_1
function Fragment_1(Actor akActor)
  ;BEGIN CODE
  akActor.ClearLookAt()

  ;END CODE
endfunction

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
