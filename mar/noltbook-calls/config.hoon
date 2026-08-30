::  Safe browser view of local managed-call configuration.
::  The gateway key is represented by one boolean and can never be recovered
::  through this mark.
/-  nc=noltbook-calls
=,  enjs:format
|_  cfg=safe-config:nc
++  grab
  |%
  ++  noun  safe-config:nc
  --
++  grow
  |%
  ++  noun  cfg
  ++  json
    ^-  ^json
    =/  mode-txt=@t  ?:(=(%managed mode.cfg) 'managed' 'custom')
    %-  pairs
    :~  ['broker' s+(scot %p broker.cfg)]
        ['mode' s+mode-txt]
        ['gatewayEndpoint' s+gateway-base.cfg]
        ['gatewayKeyConfigured' b+gateway-key-configured.cfg]
        ['sfuGate' b+sfu-gate.cfg]
        ['lastSave' (save-json last-save.cfg)]
    ==
  --
++  grad  %noun
::
++  save-json
  |=  r=(unit config-result:nc)
  ^-  json
  ?~  r  ~
  %-  pairs
  :~  ['requestId' (numb req.u.r)]
      ['ok' b+ok.u.r]
      ['code' s+(crip (trip (scot %tas code.u.r)))]
      ['at' (numb (da-ms at.u.r))]
  ==
::
++  da-ms
  |=  t=@da
  ^-  @ud
  ?:  (lth t ~1970.1.1)  0
  (div (sub t ~1970.1.1) (div ~s1 1.000))
--
