::  Correlated, non-secret managed-call service health for the System tab.
/-  nc=noltbook-calls
=,  enjs:format
|_  view=health-view:nc
++  grab
  |%
  ++  noun  health-view:nc
  --
++  grow
  |%
  ++  noun  view
  ++  json
    ^-  ^json
    %-  pairs
    :~  ['requestId' ?~(req.view ~ (numb u.req.view))]
        ['health' (health-json value.view)]
    ==
  --
++  grad  %noun
::
++  health-json
  |=  h=(unit health:nc)
  ^-  json
  ?~  h  ~
  %-  pairs
  :~  ['ok' b+ok.u.h]
      ['brokerReachable' b+broker-reachable.u.h]
      ['gatewayAuthenticated' b+gateway-authenticated.u.h]
      ['wardenReachable' b+warden-reachable.u.h]
      ['wardenAuthenticated' b+warden-authenticated.u.h]
      ['dbReady' b+db-ready.u.h]
      ['galeneReachable' b+galene-reachable.u.h]
      ['turn' s+(crip (trip (scot %tas turn.u.h)))]
      ['stage' s+(crip (trip (scot %tas stage.u.h)))]
      ['at' (numb (da-ms at.u.h))]
  ==
::
++  da-ms
  |=  t=@da
  ^-  @ud
  ?:  (lth t ~1970.1.1)  0
  (div (sub t ~1970.1.1) (div ~s1 1.000))
--
