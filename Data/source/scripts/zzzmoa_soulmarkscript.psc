Scriptname zzzmoa_SoulMarkScript extends Quest

ReferenceAlias property Alias_zzzmoa_ItemMarker02 auto

event OnInit()
  if Alias_zzzmoa_ItemMarker02.GetActorReference()
    Alias_zzzmoa_ItemMarker02.RegisterForSingleUpdate(30.0)
  endif
endevent
