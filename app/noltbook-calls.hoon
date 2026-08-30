::  %noltbook-calls: managed Galene/TURN call access, bundled with Noltbook.
::
::  ROLES. One agent, two roles, decided by whether a gateway key is set:
::
::    ordinary ship   holds only non-secret service configuration and sends
::                    %call-request to its configured broker over Ames.
::    broker ship     additionally holds the loopback gateway key, and is the
::                    only installation that ever talks to the gateway.
::
::  AUTHORITY. The broker reads src.bowl and uses it as the subject. Nothing
::  in a request payload can name a different host, so a ship can only ever
::  act inside its own namespace. The intended participant travels as a
::  SEPARATE field: naming a participant grants that participant access to
::  the requester's room, it does not transfer authority to them.
::
::  SECRETS. The gateway key lives only in broker state and is never emitted
::  by a scry, a fact, or a log line. Galene join tokens and TURN credentials
::  pass through in typed form to one local agent and are never logged, never
::  scryable, and never cached past their expiry.
::
::  This agent does NOT touch the existing Noltbook mesh call path. It has no
::  Eyre binding and no browser-reachable mark.
::
/-  nc=noltbook-calls, noltbook
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-0
      state-1
      state-2
      state-3
  ==
::  The %0 shapes, kept ONLY so old state can be read and discarded. The log
::  and last-health are bounded diagnostics, never durable data, so dropping
::  them is the smallest safe migration.
+$  safe-row-0  [req=@ud host=@p op=@tas ok=? err=(unit call-error:nc) at=@da]
+$  health-0    [ok=? at=@da note=@t]
::  pend: an in-flight request, keyed by [authenticated-ship request-id].
::  `return` is the LOCAL agent to hand a completed access grant to.
::  pend-0: the shape %0 and %1 were SAVED with. A widened mold must never
::  be applied retroactively to an older state version -- the saved noun does
::  not have the extra slot, and !< then refuses the whole state.
+$  pend-0
  $:  at=@da
      op=@tas
      room=@tas
      who=(unit @p)
      return=(unit @tas)
  ==
+$  pend
  $:  at=@da
      op=@tas
      room=@tas
      who=(unit @p)
      return=(unit @tas)
      context=ctx:nc
  ==
+$  state-0
  $:  %0
      ::  ---- client configuration (non-secret)
      broker=@p
      mode=service-mode:nc
      ::  ---- BROKER ONLY. Never emitted anywhere.
      gateway-key=@t
      ::  ---- in flight
      ::  outbox: requests WE sent, keyed by [broker request-id]
      ::  pending: requests sent TO US as broker, keyed by [requester id]
      ::  They are separate maps because a ship that brokers for itself
      ::  would otherwise collide on one key.
      outbox=(map [@p @ud] pend-0)
      pending=(map [@p @ud] pend-0)
      ::  ---- safe history: outcomes only, never credentials
      log=(list safe-row-0)
      last-health=(unit health-0)
  ==
+$  state-1
  $:  %1
      broker=@p
      mode=service-mode:nc
      gateway-key=@t
      outbox=(map [@p @ud] pend-0)
      pending=(map [@p @ud] pend-0)
      log=(list safe-row:nc)
      last-health=(unit health:nc)
  ==
+$  state-2
  $:  %2
      broker=@p
      mode=service-mode:nc
      gateway-key=@t
      outbox=(map [@p @ud] pend)
      pending=(map [@p @ud] pend)
      log=(list safe-row:nc)
      last-health=(unit health:nc)
      ::  DEVELOPMENT gate for the backend SFU path. Default %.n, so an
      ::  ordinary call produces no managed-infrastructure traffic at all.
      ::  Read synchronously by %noltbook via a scry, which is why %noltbook
      ::  itself needs no new state and no migration.
      sfu-gate=?
  ==
+$  state-3
  $:  %3
      broker=@p
      mode=service-mode:nc
      ::  BROKER-LOCAL. Never transmitted to a requesting ship.
      gateway-base=@t
      ::  BROKER-ONLY SECRET. Never emitted anywhere.
      gateway-key=@t
      outbox=(map [@p @ud] pend)
      pending=(map [@p @ud] pend)
      log=(list safe-row:nc)
      last-health=(unit health:nc)
      ::  Correlates a safe health scry with the button press that requested it.
      last-health-req=(unit @ud)
      sfu-gate=?
      ::  Safe outcome only; never contains the submitted key.
      last-config=(unit config-result:nc)
  ==
+$  card  card:agent:gall
::  access-raw: the flat tuple +ot yields for a credential-bearing answer.
::  Named here because a multi-line $: cannot be written inline as the type
::  of a =/ binding.
+$  access-raw
  $:  grp=@t
      loc=@t
      tok=@t
      sfu=@t
      par=@t
      gn=@ud
      dl=@ud
      ax=@ud
      rn=@ud
      stun=(list @t)
      turn=(list @t)
      tu=@t
      tc=@t
  ==
::  +req-txt: plain decimal. (scot %ud) inserts dot separators, which would
::  make the id inconsistent between Hoon, Go and the browser.
++  req-txt
  |=  n=@ud
  ^-  @t
  (crip (skip (trip (scot %ud n)) |=(c=@tD =('.' c))))
::  bounded safe history
++  log-cap  128
++  add-log
  |=  [l=(list safe-row:nc) r=safe-row:nc]
  ^-  (list safe-row:nc)
  ::  Bind the cons to a LIST type first. +scag is a wet gate whose body is
  ::  `^+ b`, so handing it a literal [r l] would fix b to the non-empty
  ::  shape and scag's own ~ base case would then fail to nest.
  =/  full=(list safe-row:nc)  [r l]
  (scag log-cap full)
::  +err-of: map a warden error string onto a SAFE category. Anything
::  unrecognised becomes %malformed rather than being passed through, so an
::  upstream string can never reach a caller verbatim.
++  err-of
  |=  e=@t
  ^-  call-error:nc
  ?:  =(e 'no-such-room')                        %room-unavailable
  ?:  =(e 'room-ended')                          %room-ended
  ?:  =(e 'room-ending')                         %room-ended
  ?:  =(e 'room-provisioning')                   %room-unavailable
  ?:  =(e 'lease-expired')                       %expired
  ?:  =(e 'unauthorized')                        %unauthorized
  ?:  =(e 'service-unavailable')                 %service-unavailable
  ?:  =(e 'participant-quota')                   %participant-limit
  ?:  =(e 'room-quota')                          %quota
  ?:  =(e 'room-quota-host')                     %quota
  ?:  =(e 'room-quota-global')                   %quota
  ?:  =(e 'ticket-quota')                        %quota
  ?:  =(e 'ticket-quota-room')                   %quota
  ?:  =(e 'ticket-quota-host')                   %quota
  ?:  =(e 'command-cap')                         %quota
  ?:  =(e 'busy-host')                           %rate-limited
  ?:  =(e 'busy-global')                         %rate-limited
  ?:  =(e 'rate-limited-requests')               %rate-limited
  ?:  =(e 'rate-limited-rooms')                  %rate-limited
  ?:  =(e 'rate-limited-tickets')                %rate-limited
  ?:  =(e 'rate-limited-roster')                 %rate-limited
  ?:  =(e 'request-id-reused-with-different-body')  %conflict
  ?:  =(e 'request-retired')                     %conflict
  ?:  =(e 'in-progress')                         %conflict
  %malformed
--
%-  agent:dbug
=|  state-3
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ::  Production default: a newly installed ship uses the managed SFU path.
  ::  Push the mode immediately so %noltbook cannot remain on its bunted mesh
  ::  value until the next %noltbook-calls reload.
  :_  this(state [%3 default-broker:nc %managed default-gateway-base:nc '' ~ ~ ~ ~ ~ %.y ~])
  ~[(mode-card:hc %.y)]
++  on-save  !>(state)
++  on-load
  |=  old-vase=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-vase)
  ?-  -.old
    ::  diagnostics are dropped, configuration and the gateway key are kept
    ::  %0 diagnostics are dropped; the pend shape also changed, so in-flight
    ::  requests are dropped with them. Configuration and the gateway key are
    ::  the only things worth carrying forward.
    %0  `this(state [%3 broker.old mode.old default-gateway-base:nc gateway-key.old ~ ~ ~ ~ ~ %.n ~])
    %1  `this(state [%3 broker.old mode.old default-gateway-base:nc gateway-key.old ~ ~ log.old last-health.old ~ %.n ~])
    ::  re-push the mode on every load: that is what stops %noltbook's
    ::  cached copy drifting after either agent restarts.
    %2  :_  this(state [%3 broker.old mode.old default-gateway-base:nc gateway-key.old outbox.old pending.old log.old last-health.old ~ sfu-gate.old ~])
        ~[(mode-card:hc sfu-gate.old)]
    %3  :_  this(state old)
        ~[(mode-card:hc sfu-gate.old)]
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
  ::
  ::  LOCAL actions only. The mark has no +json grab, so Eyre cannot
  ::  deliver one; this check additionally refuses another ship.
      %noltbook-calls-action
    ?>  =(src.bowl our.bowl)
    =/  act  !<(action:nc vase)
    ::  Only the access actions carry a correlation token; every other
    ::  action sends an empty one.
    =/  ctx=ctx:nc
      ?+  -.act  ''
        %access         context.act
        %renew-access   context.act
        %ensure-access  context.act
      ==
    ?-    -.act
        %set-broker
      `this(broker.state who.act, mode.state mode.act)
    ::
        %configure
      =/  ep  (normalize-gateway:hc endpoint.act)
      ?~  ep
        `this(last-config.state `[req.act %.n %invalid-endpoint now.bowl])
      =/  key-ok=?
        ?~  key.act  %.y
        &(!=(0 (met 3 u.key.act)) (lte (met 3 u.key.act) 1.024))
      ?.  key-ok
        `this(last-config.state `[req.act %.n %invalid-key now.bowl])
      =/  new-key=@t  ?~(key.act gateway-key.state u.key.act)
      =/  new-mode=service-mode:nc  ?:(=(broker.act default-broker:nc) %managed %custom)
      =.  broker.state       broker.act
      =.  mode.state         new-mode
      =.  gateway-base.state  u.ep
      =.  gateway-key.state  new-key
      =.  last-config.state  `[req.act %.y %saved now.bowl]
      `this
    ::
        %set-sfu-gate
      ::  The browser reaches this only through %noltbook's same-ship action
      ::  boundary. The gate lives HERE and is pushed to %noltbook, which caches it.
      ::  %noltbook must never scry us synchronously, so the authoritative
      ::  direction is always calls -> noltbook.
      :_  this(sfu-gate.state on.act)
      ~[(mode-card:hc on.act)]
    ::
        %set-gateway-key
      ::  Broker-only secret. Stored, never emitted.
      `this(gateway-key.state key.act)
    ::
        %status
      ::  Asks the broker whether it is configured to serve. This needs no
      ::  warden operation and therefore consumes no quota.
      ::  The System UI permits only one test at a time. Retire any older
      ::  service-status row before recording this one, so an unreachable
      ::  broker can never grow durable outbox state through repeated tests.
      =.  outbox.state  (drop-status:hc outbox.state)
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %service-status %$ ~ ~ ctx]
      :_  this
      ~[(ask:hc req.act %service-status %$ ~ 0 ~ ctx)]
    ::
        %ensure
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %ensure-room room.act ~ ~ ctx]
      :_  this
      ~[(ask:hc req.act %ensure-room room.act ~ ttl.act ~ ctx)]
    ::
        %ensure-access
      ?.  sfu-gate.state  `this
      ::  Store the eventual participant hand-off with the room request.
      ::  %call-room below starts access only after ensure succeeds.
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %ensure-room room.act `who.act `return.act ctx]
      :_  this
      ~[(ask:hc req.act %ensure-room room.act ~ ttl.act ~ ctx)]
    ::
        %renew
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %renew-room room.act ~ ~ ctx]
      :_  this
      ~[(ask:hc req.act %renew-room room.act ~ ttl.act ~ ctx)]
    ::
        %room-status
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %room-status room.act ~ ~ ctx]
      :_  this
      ~[(ask:hc req.act %room-status room.act ~ 0 ~ ctx)]
    ::
        %evict
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %evict-participant room.act `who.act ~ ctx]
      :_  this
      ~[(ask:hc req.act %evict-participant room.act `who.act 0 ~ ctx)]
    ::
        %end
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %end-room room.act ~ ~ ctx]
      :_  this
      ~[(ask:hc req.act %end-room room.act ~ 0 ~ ctx)]
    ::
        %access
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %issue-access room.act `who.act `return.act ctx]
      :_  this
      ~[(ask:hc req.act %issue-access room.act `who.act 0 `return.act ctx)]
    ::
        %renew-access
      ?.  sfu-gate.state  `this
      =.  outbox.state
        %+  ~(put by outbox.state)  [broker.state req.act]
        [now.bowl %renew-access room.act `who.act `return.act ctx]
      :_  this
      ~[(ask:hc req.act %renew-access room.act `who.act 0 `return.act ctx)]
    ==
  ::
      ::  DEV SINK for the typed hand-off. Accepts a completed grant from
      ::  our OWN calls agent and records only THAT it arrived -- the
      ::  participant and the expiry, never the join token and never the
      ::  TURN credential. This is how the credential path is verified
      ::  end to end without any secret becoming observable.
      %noltbook-calls-access
    ?>  =(src.bowl our.bowl)
    =/  r  !<(call-result:nc vase)
    =.  log.state
      %+  add-log  log.state
      ?-    -.r
          %granted
        ::  broker slot carries OUR ship (we granted locally); the
        ::  authority and participant are recorded explicitly.
        [0 our.bowl `our.bowl `participant.access.r %granted %.y ~ expires.access.r]
      ::
          %failed
        [0 our.bowl `our.bowl who.r %failed %.n `err.r now.bowl]
      ==
    `this
  ::
      %noltbook-calls-remote
    =/  rem  !<(remote:nc vase)
    ?-    -.rem
    ::
    ::  ===== BROKER SIDE =====
    ::  src.bowl is read here and nowhere else. It is the ONLY subject.
        %call-request
      =/  who=@p  src.bowl
      ::  in-flight duplicate: never start a second gateway request
      ?:  (~(has by pending.state) [who req.rem])
        `this
      ?:  =('' gateway-key.state)
        :_  this
        ~[(fail-to:hc who req.rem %service-unavailable)]
      ::  %service-status PROBES the whole chain. It used to answer from a
      ::  local flag, which reported "configured" and proved nothing. It now
      ::  performs a real readiness request through the gateway, which in
      ::  turn contacts the warden and Galene, and consumes no warden quota.
      ?:  =(%service-status op.rem)
        =.  pending.state
          %+  ~(put by pending.state)  [who req.rem]
          [now.bowl %service-status %$ ~ ~ context.rem]
        :_  this
        ~[(ready-card:hc who req.rem)]
      =.  pending.state
        %+  ~(put by pending.state)  [who req.rem]
        [now.bowl op.rem room.rem who.rem ~ context.rem]
      :_  this
      ~[(gw-card:hc who req.rem op.rem room.rem who.rem ttl.rem)]
    ::
    ::  ===== CLIENT SIDE =====
    ::  Credential-bearing. Recorded in the safe log WITHOUT the credential,
    ::  then handed to exactly one local agent.
        %call-ok
      ::  Only our configured broker may answer us. Without this any ship
      ::  could poke a forged grant carrying attacker-chosen URLs.
      ?.  =(src.bowl broker.state)  `this
      =/  key  [src.bowl req.rem]
      =/  pd   (~(get by outbox.state) key)
      =.  outbox.state  (~(del by outbox.state) key)
      ::  the log records the OUTCOME only -- never the grant
      =.  log.state
        %+  add-log  log.state
        [req.rem src.bowl ~ ~ %access %.y ~ now.bowl]
      ?~  pd  `this
      ?~  return.u.pd  `this
      :_  this
      ~[(hand-off:hc u.return.u.pd [%granted context.rem access.rem])]
    ::
        %call-health
      ?.  =(src.bowl broker.state)  `this
      =.  outbox.state  (~(del by outbox.state) [src.bowl req.rem])
      =.  last-health.state  `health.rem
      =.  last-health-req.state  `req.rem
      =.  log.state
        %+  add-log  log.state
        [req.rem src.bowl ~ ~ %health ok.health.rem ~ now.bowl]
      `this
    ::
        %call-room
      ?.  =(src.bowl broker.state)  `this
      =/  key  [src.bowl req.rem]
      =/  pd   (~(get by outbox.state) key)
      =.  outbox.state  (~(del by outbox.state) key)
      =.  log.state
        %+  add-log  log.state
        [req.rem src.bowl ~ ~ %room %.y ~ now.bowl]
      ::  A successful room operation says nothing about Galene or the
      ::  database, so it must NOT be recorded as service health. Health is
      ::  set only by the real probe in %call-health.
      ::  A compound startup now advances to access. Derive its request id
      ::  from the stable ensure id, so duplicate room replies cannot mint a
      ::  second credential and an application retry remains idempotent.
      ?~  pd  `this
      ?.  =(%ensure-room op.u.pd)  `this
      ?~  who.u.pd     `this
      ?~  return.u.pd  `this
      =/  next=@ud  `@ud`(sham [req.rem %access u.who.u.pd])
      =.  outbox.state
        %+  ~(put by outbox.state)  [src.bowl next]
        [now.bowl %issue-access room.u.pd who.u.pd return.u.pd context.u.pd]
      :_  this
      ~[(ask:hc next %issue-access room.u.pd who.u.pd 0 return.u.pd context.u.pd)]
    ::
        %call-fail
      ?.  =(src.bowl broker.state)  `this
      =/  key  [src.bowl req.rem]
      ::  the pending record is READ before it is deleted: it holds the
      ::  return agent and the correlation token, which are the only way to
      ::  tell the requester its request is over.
      =/  pd   (~(get by outbox.state) key)
      =.  outbox.state  (~(del by outbox.state) key)
      =.  log.state
        %+  add-log  log.state
        [req.rem src.bowl ~ ~ %fail %.n `err.rem now.bowl]
      =/  was-health=?  ?~(pd %.n =(%service-status op.u.pd))
      =?  last-health.state  was-health
        `(dead-health:hc %gateway-unconfigured)
      =?  last-health-req.state  was-health
        `req.rem
      ?~  pd  `this
      ?~  return.u.pd  `this
      :_  this
      ~[(hand-off:hc u.return.u.pd [%failed context.u.pd who.u.pd err.rem])]
    ==
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ::  readiness probe leg
  ?:  ?=([%gwr @ @ ~] wire)
    ?.  ?=([%iris %http-response *] sign-arvo)  `this
    =/  who=@p   (slav %p i.t.wire)
    =/  req=@ud  (slav %ud i.t.t.wire)
    ?.  (~(has by pending.state) [who req])  `this
    =.  pending.state  (~(del by pending.state) [who req])
    =/  res  client-response.sign-arvo
    ?.  ?=(%finished -.res)
      :_  this
      ~[(health-to:hc who req (dead-health:hc %gateway-unreachable))]
    =/  code=@ud  status-code.response-header.res
    =/  ff  full-file.res
    ?~  ff
      :_  this
      ~[(health-to:hc who req (dead-health:hc %gateway-empty))]
    ?:  =(401 code)
      :_  this
      ~[(health-to:hc who req (dead-health:hc %gateway-auth))]
    =/  jon  (de:json:html q.data.u.ff)
    ?~  jon
      :_  this
      ~[(health-to:hc who req (dead-health:hc %gateway-malformed))]
    =/  h  (health-of:hc u.jon)
    ?~  h
      :_  this
      ~[(health-to:hc who req (dead-health:hc %gateway-malformed))]
    :_  this
    ~[(health-to:hc who req u.h)]
  ?.  ?=([%gw @ @ ~] wire)  (on-arvo:def wire sign-arvo)
  ?.  ?=([%iris %http-response *] sign-arvo)  `this
  ::  identity comes from the WIRE, which we authored from src.bowl.
  =/  who=@p   (slav %p i.t.wire)
  =/  req=@ud  (slav %ud i.t.t.wire)
  ?.  (~(has by pending.state) [who req])  `this
  =/  pd  (~(got by pending.state) [who req])
  =.  pending.state  (~(del by pending.state) [who req])
  =/  res  client-response.sign-arvo
  ?.  ?=(%finished -.res)
    :_  this
    ~[(fail-to:hc who req %service-unavailable)]
  =/  code=@ud  status-code.response-header.res
  ?.  =(200 code)
    :_  this
    ~[(fail-to:hc who req %service-unavailable)]
  =/  ff  full-file.res
  ?~  ff
    :_  this
    ~[(fail-to:hc who req %malformed)]
  =/  jon  (de:json:html q.data.u.ff)
  ?~  jon
    :_  this
    ~[(fail-to:hc who req %malformed)]
  ::  Envelope first: every answer must be about the request we sent, for
  ::  the host we sent it for. A broken or hostile gateway cannot otherwise
  ::  manufacture an answer.
  =/  env
    %.  u.jon
    =,  dejs-soft:format
    (ot ~[['ok' bo] ['req' so] ['subject' so]])
  ?~  env
    :_  this
    ~[(fail-to:hc who req %malformed)]
  =/  ev=[ok=? rq=@t sub=@t]  u.env
  ?.  ?&(=(rq.ev (req-txt req)) =(sub.ev (scot %p who)))
    :_  this
    ~[(fail-to:hc who req %malformed)]
  ?.  ok.ev
    ::  a definitive negative: map to a SAFE category, never pass the
    ::  upstream string through.
    =/  ez
      %.  u.jon
      =,  dejs-soft:format
      (ot ~[['error' so]])
    =/  cat=call-error:nc  ?~(ez %malformed (err-of `@t`u.ez))
    :_  this
    ~[(fail-to:hc who req cat)]
  ::  success. Room-level operations carry no credential.
  ?.  ?|(=(op.pd %issue-access) =(op.pd %renew-access))
    =/  rr  (room-of:hc u.jon room.pd)
    ?~  rr
      :_  this
      ~[(fail-to:hc who req %malformed)]
    :_  this
    ~[(room-to:hc who req u.rr)]
  ::  credential-bearing success: parse into the typed access grant.
  =/  ac  (access-of:hc u.jon room.pd)
  ?~  ac
    :_  this
    ~[(fail-to:hc who req %malformed)]
  :_  this
  ~[(ok-to:hc who req u.ac context.pd)]
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?.  ?=(%poke-ack -.sign)  (on-agent:def wire sign)
  ::  a nacked poke is a bounded failure: no retry, no storm.
  `this
::
++  on-watch  |=(=path ?>(=(src.bowl our.bowl) `this))
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  ~
    ::  Non-secret configuration only.
    [%x %config ~]
      ``noltbook-calls-config+!>([broker.state mode.state gateway-base.state !=('' gateway-key.state) sfu-gate.state last-config.state])
    ::  Outcomes only. NEVER a token, a TURN credential, or a gateway key.
    [%x %log ~]      ``noun+!>(log.state)
    [%x %health ~]
      ``noltbook-calls-health+!>([last-health-req.state last-health.state])
    ::  reports only WHETHER a gateway key is configured, never its value
    [%x %broker ~]   ``noun+!>(!=('' gateway-key.state))
    ::  the backend SFU gate, read synchronously by %noltbook
    [%x %gate ~]     ``noun+!>(sfu-gate.state)
    [%x %outbox ~]   ``noun+!>(~(tap by outbox.state))
    [%x %pending ~]  ``noun+!>(~(tap by pending.state))
  ==
++  on-leave  |=(path `this)
++  on-fail   on-fail:def
--
::
::  helper core: cards and parsing only.
|_  =bowl:gall
::
::  +ask: send one request to the configured broker. When this ship IS the
::  broker the poke is to ourselves, which Gall delivers normally and which
::  still arrives with src.bowl == our.bowl.
++  ask
  |=  [req=@ud op=@tas room=@tas who=(unit @p) ttl=@ud return=(unit @tas) context=ctx:nc]
  ^-  card
  =/  rem=remote:nc  [%call-request req op room who ttl context]
  :*  %pass  /ask/(scot %ud req)
      %agent  [broker.state %noltbook-calls]
      %poke  %noltbook-calls-remote  !>(rem)
  ==
::
++  answer
  |=  [who=@p req=@ud rem=remote:nc]
  ^-  card
  :*  %pass  /ans/(scot %p who)/(scot %ud req)
      %agent  [who %noltbook-calls]
      %poke  %noltbook-calls-remote  !>(rem)
  ==
::
::  +mode-card: tell %noltbook which transport NEW calls should use.
::  Carries a mode, never the gate's own state, and never a credential.
++  mode-card
  |=  on=?
  ^-  card
  :*  %pass  /sfu-mode/(scot %da now.bowl)
      %agent  [our.bowl %noltbook]
      %poke  %noltbook-sfu-mode
      !>(`call-transport:noltbook`?:(on %sfu %mesh))
  ==
::
++  health-to  |=([who=@p req=@ud h=health:nc] (answer who req [%call-health req h]))
::  Keep at most one client-side service health probe in flight. Access and
::  lifecycle operations are deliberately untouched.
++  drop-status
  |=  box=(map [@p @ud] pend)
  ^-  (map [@p @ud] pend)
  %-  ~(rep by box)
  |=  [[key=[@p @ud] val=pend] acc=(map [@p @ud] pend)]
  ?:  =(%service-status op.val)  acc
  (~(put by acc) key val)
::  Broker-local base URL validation. The gateway key is attached to every
::  request, so the endpoint is deliberately restricted to loopback. A page
::  compromise therefore cannot redirect the secret to an external host.
::  One trailing slash is normalized; the port remains operator-configurable.
++  normalize-gateway
  |=  raw=@t
  ^-  (unit @t)
  =/  txt=tape  (trip raw)
  =/  len=@ud  (lent txt)
  ?:  ?|(=(0 len) (gth len 128))  ~
  =/  norm=tape
    ?:  =('/' (snag (dec len) txt))
      (scag (dec len) txt)
    txt
  =/  pre-len=(unit @ud)
    ?:  =("http://127.0.0.1:" (scag 17 norm))  `17
    ?:  =("http://localhost:" (scag 17 norm))  `17
    ?:  =("https://127.0.0.1:" (scag 18 norm))  `18
    ?:  =("https://localhost:" (scag 18 norm))  `18
    ~
  ?~  pre-len  ~
  =/  port-txt=tape  (slag u.pre-len norm)
  ?:  ?|(=(0 (lent port-txt)) (gth (lent port-txt) 5))  ~
  =/  port  (rush (crip port-txt) dim:ag)
  ?~  port  ~
  ?:  ?|(=(0 u.port) (gth u.port 65.535))  ~
  `(crip norm)
::
++  gateway-url
  |=  tail=tape
  ^-  @t
  (crip (weld (trip gateway-base.state) tail))
::  +dead-health: everything below the failing stage is reported false rather
::  than unknown, and the stage names where it stopped.
++  dead-health
  |=  stage=@tas
  ^-  health:nc
  [%.n %.y %.n %.n %.n %.n %.n %unknown stage now.bowl]
::  +health-of: parse the gateway's readiness answer. Non-secret throughout.
++  health-of
  |=  jon=json
  ^-  (unit health:nc)
  =/  r
    %.  jon
    =,  dejs-soft:format
    %-  ot
    :~  ['ok' bo]
        ['gateway_authenticated' bo]
        ['warden_reachable' bo]
        ['warden_authenticated' bo]
        ['warden_db_ready' bo]
        ['galene_reachable' bo]
    ==
  ?~  r  ~
  =/  g=[ok=? ga=? wr=? wa=? db=? gl=?]  u.r
  :-  ~
  :*  ok.g  %.y  ga.g  wr.g  wa.g  db.g  gl.g  %unknown
      ?:(ok.g %healthy %degraded)  now.bowl
  ==
::
++  fail-to  |=([who=@p req=@ud e=call-error:nc] (answer who req [%call-fail req e]))
++  ok-to    |=([who=@p req=@ud a=access:nc c=ctx:nc] (answer who req [%call-ok req a c]))
++  room-to  |=([who=@p req=@ud r=room-result:nc] (answer who req [%call-room req r]))
::
::  +hand-off: give ONE typed outcome -- grant or failure -- to ONE local
::  agent. Never to another ship, never to Eyre.
++  hand-off
  |=  [agent=@tas r=call-result:nc]
  ^-  card
  :*  %pass  /access/(scot %da now.bowl)
      %agent  [our.bowl agent]
      %poke  %noltbook-calls-access  !>(r)
  ==
::
::  +ready-card: probe the gateway's own readiness. BROKER ONLY. GET, no
::  body, and the answer contains no credential of any kind.
++  ready-card
  |=  [who=@p req=@ud]
  ^-  card
  =/  hdrs=header-list:http
    :~  ['X-Argus-Key' gateway-key.state]
    ==
  =/  hreq=request:http
    [%'GET' (gateway-url "/readyz") hdrs ~]
  :*  %pass  /gwr/(scot %p who)/(scot %ud req)
      %arvo  %i  %request  hreq  *outbound-config:iris
  ==
::
::  +gw-card: the loopback gateway request. BROKER ONLY.
::
::  `subject` is the authenticated ship and is inserted HERE, never taken
::  from the payload. The URL is built only from the validated loopback base
::  stored by this broker.
++  gw-card
  |=  [who=@p req=@ud op=@tas room=@tas participant=(unit @p) ttl=@ud]
  ^-  card
  =/  base=(list [@t json])
    :~  ['req' [%s (req-txt req)]]
        ['op' [%s op]]
        ['room' [%s room]]
        ['subject' [%s (scot %p who)]]
    ==
  =.  base
    ?:  =(0 ttl)  base
    (snoc base [`@t`'ttl' (numb:enjs:format ttl)])
  =/  jon=json
    %-  pairs:enjs:format
    ?~  participant  base
    (snoc base [`@t`'participant' `json`[%s (scot %p u.participant)]])
  =/  body=@t  (en:json:html jon)
  =/  hdrs=header-list:http
    :~  ['X-Argus-Key' gateway-key.state]
        ['Content-Type' 'application/json']
    ==
  =/  hreq=request:http
    [%'POST' (gateway-url "/command") hdrs `(as-octs:mimes:html body)]
  :*  %pass  /gw/(scot %p who)/(scot %ud req)
      %arvo  %i  %request  hreq  *outbound-config:iris
  ==
::
::  +room-of: parse a safe room-level answer. Every room-level warden
::  answer carries the same fields, so this parse is total.
++  room-of
  |=  [jon=json room=@tas]
  ^-  (unit room-result:nc)
  =/  r
    %.  jon
    =,  dejs-soft:format
    (ot ~[['group' so] ['state' so] ['gen' ni] ['deadline' ni] ['clients' ni]])
  ?~  r  ~
  ::  +ot yields an UNFACED tuple; bind faces explicitly before use.
  =/  g=[grp=@t st=@t gn=@ud dl=@ud cl=@ud]  u.r
  `[[room gn.g (from-unix dl.g)] grp.g `@tas`st.g cl.g]
::
::  +access-of: parse a credential-bearing answer into the typed grant.
::  Every field is required; a missing or malformed one yields ~ and the
::  caller reports %malformed. No partial grant is ever produced.
++  access-of
  |=  [jon=json room=@tas]
  ^-  (unit access:nc)
  =/  r
    %.  jon
    =,  dejs-soft:format
    %-  ot
    :~  ['group' so]
        ['location' so]
        ['token' so]
        ['sfu' so]
        ['participant' so]
        ['gen' ni]
        ['deadline' ni]
        ['access_expires' ni]
        ['renew_after' ni]
        ['stun_urls' (ar so)]
        ['turn_urls' (ar so)]
        ['turn_username' so]
        ['turn_credential' so]
    ==
  ?~  r  ~
  ::  +ot yields an UNFACED tuple; bind the named mold before use.
  =/  a=access-raw  u.r
  =/  ices=(list ice-server:nc)
    :~  [stun.a ~ ~]
        [turn.a `tu.a `tc.a]
    ==
  :-  ~
  :*  [room gn.a (from-unix dl.a)]
      grp.a
      sfu.a
      loc.a
      tok.a
      (slav %p par.a)
      ices
      (from-unix ax.a)
      (from-unix rn.a)
  ==
::
::  +from-unix: seconds since the epoch to @da.
++  from-unix
  |=  s=@ud
  ^-  @da
  (add ~1970.1.1 (mul s ~s1))
--
