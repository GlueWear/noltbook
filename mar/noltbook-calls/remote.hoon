::  ship-to-ship mark for %noltbook-calls.
::
::  NOUN ONLY -- same reasoning as the action mark. A remote call request is
::  reachable only over Ames, where the sender is cryptographically
::  authenticated and appears as src.bowl.
/-  nc=noltbook-calls
|_  rem=remote:nc
++  grab
  |%
  ++  noun  remote:nc
  --
++  grow
  |%
  ++  noun  rem
  --
++  grad  %noun
--
