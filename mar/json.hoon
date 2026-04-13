=,  eyre
=,  format
=,  html
|_  jon=^json
::
++  grow
  |%
  ++  mime  [/application/json (as-octs:mimes -:txt)]
  ++  txt   [(en:json jon)]~
  ++  noun  jon
  --
++  grab
  |%
  ++  mime  |=([p=mite q=octs] (fall (de:json (@t q.q)) *^json))
  ++  noun  ^json
  ++  numb  numb:enjs
  ++  time  time:enjs
  --
++  grad  %mime
--