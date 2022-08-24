Scriptname zzzmoaPermaDeathScript extends Quest

zzzmoaReviveMCM property ConfigMenu auto
Message property DeathMessage auto
Message property LoadLockMessage auto
String property LockFileExt auto
String property LockFilePrefix auto
Message property NoRespawnMessage auto
Message property PermaDeathMessage auto
Actor property PlayerRef auto
Int property iNameTag auto Hidden

Bool bIsBusy = False

event OnInit()
  if bIsBusy
    return
  endif
  bIsBusy = True
  bCheckNameTag()
  bIsBusy = False
endevent

Bool function bCheckNameTag()
  if iNameTag
    ConfigMenu.iNameTagBackup = iNameTag
  else
    if ConfigMenu.iNameTagBackup
      iNameTag = ConfigMenu.iNameTagBackup
    else
      iNameTag = utility.RandomInt(100000000, 2147483647)
      while MiscUtil.FileExists(getLockName())
        iNameTag = utility.RandomInt(100000000, 2147483647)
      endwhile
      ConfigMenu.iNameTagBackup = iNameTag
      Debug.Trace("MarkOfArkay: " + PlayerRef.GetDisplayName() + "'s ID is " + iNameTag)
      return False
    endif
  endif
  return True
endfunction

Bool function bCheckPermaDeath()
  if bCheckNameTag() && ConfigMenu.bPUOK
    if MiscUtil.FileExists(getLockName())
      PlayerRef.SetAlpha(0)
      LoadLockMessage.Show()
      Game.QuitToMainMenu()
      return True
    endif
  endif
  return False
endfunction

Bool function bTagExist(Int iTag, String[] locks) ;Not needed
  Int i = locks.Length
  Int iTagLen = StringUtil.GetLength(iTag As String)
  while i > 0
    i -= 1
    if (StringUtil.Substring(locks[i], 0, StringUtil.GetLength(LockFilePrefix)) == LockFilePrefix) && (StringUtil.GetLength(locks[i]) > (StringUtil.GetLength(LockFileExt) + iTagLen + 6))
      if ("_" + (iTag As String)) == StringUtil.Substring(locks[i], StringUtil.GetLength(locks[i]) - (StringUtil.GetLength(LockFileExt) + iTagLen) - 1, iTagLen + 1)
        return True
      endif
    endif
  endwhile
  return False
endfunction

String function getLockName()
  return (LockFilePrefix + PlayerRef.GetDisplayName() + "_" + iNameTag + LockFileExt)
endfunction

String function getPlayerDeathInfo()
  String sText = "Name: " + PlayerRef.GetDisplayName() + "\nSex: "
  Int iSex = PlayerRef.GetActorBase().GetSex()
  if iSex == 1
    sText += "Female"
  elseif iSex == 0
    sText += "Male"
  else
    sText += "Unknown"
  endif
  sText += "\nRace: " + PlayerRef.GetRace().GetName()
  sText += "\nLevel: " + PlayerRef.GetLevel()
  sText += "\nPlace Of Death: " + PlayerRef.GetCurrentLocation().GetName()
  sText += "\nDate Of Death: " + Utility.GameTimeToString(Utility.GetCurrentGameTime())
  if ConfigMenu.ReviveScript.Attacker
    sText += "\nPotential Killer: " + ConfigMenu.ReviveScript.Attacker.GetDisplayName()
  endif
  return sText
endfunction

function lockGameLoad()
  MiscUtil.WriteToFile(getLockName(), getPlayerDeathInfo(), False, False)
endfunction
