Scriptname zzzmoaPermaDeathScript Extends Quest

zzzmoaReviveMCM Property ConfigMenu Auto
Actor Property PlayerRef Auto
String Property LockFileExt Auto
Int Property iNameTag Auto Hidden
Message Property DeathMessage Auto
Message Property NoRespawnMessage Auto
Message Property PermaDeathMessage Auto
Message Property LoadLockMessage Auto
Bool bIsBusy = False

Event OnInit()
	Utility.Wait(0.1)
	If bIsBusy
		Return
	EndIf
	bIsBusy = True
	bCheckNameTag()
	bIsBusy = False
EndEvent

Bool Function bCheckPermaDeath()
	If bCheckNameTag() && ConfigMenu.bPUOK
		If MiscUtil.FileExists(getLockName())
			PlayerRef.SetAlpha(0)
			LoadLockMessage.Show()
			Game.QuitToMainMenu()
			Return True
		EndIf
	EndIf
	Return False
EndFunction

Function lockGameLoad()
	MiscUtil.WriteToFile(getLockName(),getPlayerDeathInfo(),False,False)
EndFunction

String Function getPlayerDeathInfo()
	String sText = "Name: "+PlayerRef.GetDisplayName()+"\nSex: "
	Int iSex = PlayerRef.GetActorBase().GetSex()
	If iSex == 1
		sText += "Female"
	ElseIf iSex == 0
		sText += "Male"
	Else
		sText += "Unknown"
	EndIf
	sText += "\nRace: "+PlayerRef.GetRace().GetName()
	sText += "\nLevel: "+PlayerRef.GetLevel()
	sText += "\nPlace Of Death: "+PlayerRef.GetCurrentLocation().GetName()
	sText += "\nDate Of Death: "+Utility.GameTimeToString(Utility.GetCurrentGameTime())
	If ConfigMenu.ReviveScript.Attacker
		sText += "\nPotential Killer: "+ConfigMenu.ReviveScript.Attacker.GetDisplayName()
	EndIf
	Return sText
EndFunction

Bool Function bCheckNameTag()
	If iNameTag
		ConfigMenu.iNameTagBackup = iNameTag
	Else
		If ConfigMenu.iNameTagBackup
			iNameTag = ConfigMenu.iNameTagBackup
		Else
			iNameTag = utility.RandomInt(1000000000, 9999999999)
			While MiscUtil.FileExists(getLockName())
				 iNameTag = utility.RandomInt(1000000000, 9999999999)
			EndWhile
			ConfigMenu.iNameTagBackup = iNameTag
			Return False
		EndIf
	EndIf
	Return True
EndFunction

String Function getLockName()
	Return (".moa_"+PlayerRef.GetDisplayName()+"_"+ iNameTag+LockFileExt)
EndFunction