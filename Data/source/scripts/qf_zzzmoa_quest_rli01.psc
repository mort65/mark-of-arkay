;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_zzzmoa_Quest_RLI01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ThiefNPC01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThiefNPC01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
If ThiefRef
    ThiefRef.AddToFaction(PlayerEnemyFaction)
EndIf
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
If ThiefRef
    ThiefRef.RemoveFromFaction(PlayerEnemyFaction)
EndIf
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor ThiefRef = Alias_ThiefNPC01.GetActorRef()
If ThiefRef
    ThiefRef.RemoveFromFaction(PlayerEnemyFaction)
EndIf
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property PlayerEnemyFaction Auto
