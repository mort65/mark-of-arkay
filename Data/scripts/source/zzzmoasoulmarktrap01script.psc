Scriptname zzzmoasoulmarktrap01script extends Quest

zzzmoaReviverScript property ReviveScript auto
ReferenceAlias property Thief auto
ReferenceAlias[] property Thiefs auto

Bool bStopping = False

event OnInit()
  Int i = 0
  Thief && Thief.RegisterForSingleUpdate(5.0)
  Thiefs[0] && Thiefs[0].RegisterForSingleUpdate(5.0)
  while i < Thiefs.Length
    Thiefs[i] && Thiefs[i].RegisterForModEvent("moa_Disintegrate", "OnDisintegrating")
    Thiefs[i] && Thiefs[i].RegisterForModEvent("moa_DisintegrateNow", "OnDisintegratingFast")
    i += 1
  endwhile
endevent

function StopQuest(Int iRestore=0, Bool bRemoveFast=False)
  if Self.IsRunning() && !bStopping
    bStopping = True
    if bRemoveFast
      Int handle = ModEvent.Create("moa_DisintegrateNow")
      if (handle)
        ModEvent.PushForm(handle, self)
        ModEvent.Send(handle)
      endif
    else
      Int handle = ModEvent.Create("moa_Disintegrate")
      if (handle)
        ModEvent.PushForm(handle, self)
        ModEvent.Send(handle)
      endif
    endif
    if !ReviveScript.ItemScript.bIsBusy
      if iRestore == 1
        ReviveScript.ItemScript.RestoreLostItems(Game.GetPlayer())
        if ReviveScript.moaRetrieveLostItems.IsRunning()
          ReviveScript.moaRetrieveLostItems.SetStage(20)
        endif
        if ReviveScript.moaRetrieveLostItems01.IsRunning()
          ReviveScript.moaRetrieveLostItems01.SetStage(20)
        endif
      elseif iRestore == -1
        if (ReviveScript.ConfigMenu.bLoseForever)
          ReviveScript.ItemScript.DestroyLostItems(Game.GetPlayer())
          if ReviveScript.moaRetrieveLostItems.IsRunning()
            ReviveScript.moaRetrieveLostItems.SetStage(10)
          endif
          if ReviveScript.moaRetrieveLostItems01.IsRunning()
            ReviveScript.moaRetrieveLostItems01.SetStage(10)
          endif
        else
          ReviveScript.ItemScript.RestoreLostItems(Game.GetPlayer())
          if ReviveScript.moaRetrieveLostItems.IsRunning()
            ReviveScript.moaRetrieveLostItems.SetStage(20)
          endif
          if ReviveScript.moaRetrieveLostItems01.IsRunning()
            ReviveScript.moaRetrieveLostItems01.SetStage(20)
          endif
        endif
      endif
    endif
    Self.SetStage(30)
  endif
  bStopping = False
endfunction
