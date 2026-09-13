::  local diagnostic mark for %noltbook-calls.
::
::  Carries a SAFE failure subtype -- a closed vocabulary, never an upstream
::  string -- to local subscribers of /diagnostics.
::
::  Noun-only, never sent to another ship, never rendered to a browser by this
::  agent. Same posture as the access mark.
/-  nc=noltbook-calls
|_  d=call-diagnostic:nc
++  grab
  |%
  ++  noun  call-diagnostic:nc
  --
++  grow
  |%
  ++  noun  d
  --
++  grad  %noun
--
