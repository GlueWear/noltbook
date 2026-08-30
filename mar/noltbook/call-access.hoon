::  private call-access mark.
::
::  Separate from %noltbook-update on purpose: that mark is the general
::  browser update stream, and a credential must not be one missed case away
::  from a shared subscription. This mark is only ever given on /call-access,
::  a same-ship path.
::
::  The grant arrives as a jammed noun. It is decoded and TYPE-CHECKED here,
::  in Hoon, so the browser never needs a jam decoder and never sees an
::  opaque blob. A malformed grant becomes a safe %failed result rather than
::  crashing the subscription: +mule contains the clam, because ;; bails on
::  a noun that does not fit the mold.
/-  noltbook, nc=noltbook-calls
|_  f=call-access-fact:noltbook
++  grab
  |%
  ++  noun  call-access-fact:noltbook
  --
++  grow
  |%
  ++  noun  f
  ++  json
    ^-  ^json
    ?-  -.f
        %failed
      (fail-json note-id.f call-id.f gen.f reason.f)
    ::
        %granted
      =/  raw=(unit @)  (slaw %uw access.f)
      ?~  raw
        (fail-json note-id.f call-id.f gen.f %malformed)
      ::  ;; bails on a mis-shaped noun, so it is run inside +mule and a
      ::  failure is reported as %malformed instead of killing the fact.
      =/  res  (mule |.(;;(access:nc (cue u.raw))))
      ?:  ?=(%| -.res)
        (fail-json note-id.f call-id.f gen.f %malformed)
      (grant-json note-id.f call-id.f gen.f p.res)
    ==
  --
++  grad  %noun
::
::  +fail-json: safe. Carries a category only -- never an upstream body, a
::  token, a URL, or a trace.
++  fail-json
  |=  [nid=@ta cid=@ta gen=@ud why=@tas]
  ^-  json
  =,  enjs:format
  %-  pairs
  :~  ['type' s+'failed']
      ['noteId' s+nid]
      ['callId' s+cid]
      ['generation' (numb gen)]
      ['reason' s+(crip (trip (scot %tas why)))]
  ==
::
::  +grant-json: the participant's short-lived browser grant, structured.
::  CREDENTIAL-BEARING: only ever emitted on /call-access.
++  grant-json
  |=  [nid=@ta cid=@ta gen=@ud a=access:nc]
  ^-  json
  =,  enjs:format
  %-  pairs
  :~  ['type' s+'granted']
      ['noteId' s+nid]
      ['callId' s+cid]
      ['generation' (numb gen)]
      ['room' s+(crip (trip room.room-ref.a))]
      ['group' s+group.a]
      ['sfu' s+sfu.a]
      ['location' s+location.a]
      ['participant' s+(scot %p participant.a)]
      ['token' s+token.a]
      ['iceServers' a+(turn ice.a ice-json)]
      ['expires' (numb (da-ms expires.a))]
      ['renewAfter' (numb (da-ms renew-after.a))]
      ['deadline' (numb (da-ms deadline.room-ref.a))]
  ==
::
::  +ice-json: one RTCIceServer entry. username/credential are present only
::  on TURN entries, so they are emitted only when present.
++  ice-json
  |=  s=ice-server:nc
  ^-  json
  =,  enjs:format
  =/  base=(list [@t json])
    ~[['urls' a+(turn urls.s |=(u=@t `json`s+u))]]
  =?  base  ?=(^ username.s)    (snoc base [`@t`'username' `json`s+u.username.s])
  =?  base  ?=(^ credential.s)  (snoc base [`@t`'credential' `json`s+u.credential.s])
  (pairs base)
::
++  da-ms
  |=  t=@da
  ^-  @ud
  ?:  (lth t ~1970.1.1)  0
  (div (sub t ~1970.1.1) (div ~s1 1.000))
--
