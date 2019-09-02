;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_zzzmoa_Quest_RLI Extends Quest Hidden

;BEGIN ALIAS PROPERTY zzzmoa_ItemMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_zzzmoa_ItemMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY zzzmoa_ItemMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_zzzmoa_ItemMarker02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
