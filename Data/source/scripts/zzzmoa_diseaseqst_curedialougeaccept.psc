;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname zzzmoa_DiseaseQst_CureDialougeAccept extends TopicInfo Hidden

;END FRAGMENT
;END FRAGMENT CODE - Do not edit anything between this and the begin comment
zzzmoaReviveMCM property ConfigMenu auto
GlobalVariable property CureDiseaseCost auto
MiscObject property Gold001 auto
Idle property Pray auto
Idle property StopIdle auto

;BEGIN FRAGMENT Fragment_2
function Fragment_2(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor

  ;BEGIN CODE
  if CureDiseaseCost.GetValueInt() > 0
    Game.GetPlayer().RemoveItem(Gold001, CureDiseaseCost.GetValueInt())
  endif
  akSpeaker.PlayIdle(StopIdle)
  Utility.Wait(0.5)
  akSpeaker.PlayIdle(Pray)
  Utility.Wait(Utility.RandomFloat(2.5, 3.5))
  zzzmoadiseasecursescript DiseaseScript = GetOwningQuest() As zzzmoadiseasecursescript
  DiseaseScript.cureAllDiseases()
  Utility.Wait((Utility.RandomFloat(0.5, 1.0)))
  akSpeaker.PlayIdle(StopIdle)

  ;END CODE
endfunction
