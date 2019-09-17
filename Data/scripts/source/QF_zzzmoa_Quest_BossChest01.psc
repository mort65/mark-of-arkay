;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_zzzmoa_Quest_BossChest01 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TargetLocationWorld
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TargetLocationWorld Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TargetLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetLocationPlayer
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TargetLocationPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenItems
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenItems Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
Objectreference ChestRef =Alias_BossChest.GetReference()
If ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(),ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Objectreference ChestRef =Alias_BossChest.GetReference()
If ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(),ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
EndIf
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Objectreference ChestRef =Alias_BossChest.GetReference()
If ChestRef && ChestRef.GetItemCount(Alias_StolenItems.GetReference()) > 0
    ChestRef.RemoveItem(Alias_StolenItems.GetReference(),ChestRef.GetItemCount(Alias_StolenItems.GetReference()))
EndIf
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveDisplayed(5,1)
Alias_LocationMapMarker.GetReference().AddtoMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



