;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname zzzmoa_DiseaseQst_CureDialougeAccept Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If CureDiseaseCost.GetValueInt() > 0
    Game.GetPlayer().RemoveItem(Gold001,CureDiseaseCost.GetValueInt())
EndIf
akSpeaker.PlayIdle(StopIdle)
Utility.Wait(0.5)
akSpeaker.PlayIdle(Pray)
Utility.Wait(Utility.RandomFloat(2.5,3.5))
zzzmoadiseasecursescript DiseaseScript = GetOwningQuest() As zzzmoadiseasecursescript
DiseaseScript.cureAllDiseases()
Utility.Wait((Utility.RandomFloat(0.5,1.0)))
akSpeaker.PlayIdle(StopIdle)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

zzzmoaReviveMCM Property ConfigMenu Auto
GlobalVariable Property CureDiseaseCost Auto
MiscObject Property Gold001 Auto
Idle Property Pray Auto
Idle Property StopIdle Auto
