::  local action mark for %noltbook-calls.
::
::  NOUN ONLY, deliberately. There is no +json grab, so Eyre cannot convert
::  a browser channel poke into this mark: a web client can never ask the
::  agent for call credentials directly.
/-  nc=noltbook-calls
|_  act=action:nc
++  grab
  |%
  ++  noun  action:nc
  --
++  grow
  |%
  ++  noun  act
  --
++  grad  %noun
--
