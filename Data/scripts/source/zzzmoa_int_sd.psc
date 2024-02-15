Scriptname zzzmoa_int_sd Hidden

Bool function isDreamed(Quest DreamQuest) Global
  return (DreamQuest.IsRunning() && DreamQuest.GetStageDone(10))
endfunction

Bool function isDreaming(Location Dreamworld) Global
  if Dreamworld
    if Game.GetPlayer().GetCurrentLocation()
      if Game.GetPlayer().GetCurrentLocation() == Dreamworld
        return true
      endif
    endif
  endif
  return false
endfunction
