::  local mode-sync mark.
::
::  %noltbook-calls owns the SFU gate; this carries the resulting transport
::  to %noltbook so it can cache it. Noun-only and same-ship only: it is not
::  reachable from a browser and never leaves the ship.
::
::  It carries a MODE, not a credential.
/-  noltbook
|_  m=call-transport:noltbook
++  grab
  |%
  ++  noun  call-transport:noltbook
  --
++  grow
  |%
  ++  noun  m
  --
++  grad  %noun
--
