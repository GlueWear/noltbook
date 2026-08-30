::  typed result hand-off mark for %noltbook-calls.
::
::  Carries the OUTCOME of one managed request -- a completed access grant or
::  a safe failure category -- plus the caller's opaque correlation token.
::
::  Noun-only, never sent to another ship, never rendered to a browser by
::  this agent: the success variant holds a Galene join token and TURN
::  credentials.
/-  nc=noltbook-calls
|_  r=call-result:nc
++  grab
  |%
  ++  noun  call-result:nc
  --
++  grow
  |%
  ++  noun  r
  --
++  grad  %noun
--
