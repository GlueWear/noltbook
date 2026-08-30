::  noltbook-calls: types for managed Galene/TURN call access.
::
::  This is the production successor to the %argus proof of concept. It ships
::  ON the %noltbook desk, so an ordinary Noltbook installation already has
::  it and no separate app must be installed.
::
::  Two roles, one agent:
::
::    ordinary ship  stores only NON-SECRET service configuration and asks
::                   its configured broker over Ames.
::    broker ship    additionally holds the loopback gateway key and is the
::                   only installation that talks to the gateway.
::
::  The browser never receives a gateway key, a coturn master secret, or a
::  Galene administrator credential. It receives only a short-lived join
::  token and short-lived TURN credentials, both minted per participant.
|%
::
::  +default-broker: the SINGLE place the shipped default lives.
::
::  Shipped production default. Existing installations retain their saved
::  broker across migrations; this value applies only to a fresh state.
++  default-broker  ~nolset
::
::  Local default for a ship that is configured as a broker. Ordinary client
::  ships keep this locally and never transmit it over Ames.
++  default-gateway-base  'http://127.0.0.1:8899'
::
::  service mode. %managed uses our hosted broker; %custom lets an operator
::  point at their own broker later without any protocol change.
+$  service-mode  ?(%managed %custom)
::
::  ctx: an OPAQUE correlation token chosen by the calling agent and echoed
::  back with the answer, untouched. It lets a caller bind a grant to its own
::  note/call/generation without this agent knowing or storing any of that,
::  and without the caller needing durable pending state of its own.
::  It must contain NO secret: it round-trips through Ames.
+$  ctx  @t
::
::  ---------------------------------------------------------------- config
::
::  Non-secret client configuration. Safe to scry, safe to show in settings.
+$  service-config
  $:  broker=@p
      mode=service-mode
      ::  display only; the authoritative URLs always come from the broker
      ::  in the access response, never from client configuration.
      label=@t
  ==
::  Safe browser-facing configuration. The gateway key is represented only
::  by a boolean; its value is never placed in a scry or fact.
+$  config-result
  $:  req=@ud
      ok=?
      code=@tas
      at=@da
  ==
+$  safe-config
  $:  broker=@p
      mode=service-mode
      gateway-base=@t
      gateway-key-configured=?
      sfu-gate=?
      last-save=(unit config-result)
  ==
::
::  ------------------------------------------------------------ room refs
::
::  A room reference always carries the generation and lease deadline, so a
::  caller can reject access that belongs to an earlier incarnation of a
::  reused room key.
+$  room-ref
  $:  room=@tas
      gen=@ud
      deadline=@da
  ==
::
::  ------------------------------------------------------------ ICE / access
::
::  One RTCIceServer entry. `username` and `credential` are present only on
::  TURN entries and are SHORT-LIVED SECRETS.
+$  ice-server
  $:  urls=(list @t)
      username=(unit @t)
      credential=(unit @t)
  ==
::
::  +access: everything the browser needs and nothing more.
::
::  SECRET-BEARING. Never log it, never put it in a scry, never keep it in
::  a durable cache past its expiry.
+$  access
  $:  =room-ref
      ::  managed group id on the SFU
      group=@t
      ::  websocket URL the browser connects to
      sfu=@t
      ::  human-visible group page
      location=@t
      ::  Galene join credential -- SECRET
      token=@t
      ::  who this access was minted FOR
      participant=@p
      ::  includes STUN plus TURN over udp/tcp/tls -- SECRET
      ice=(list ice-server)
      ::  when the credentials stop being usable for NEW allocations
      expires=@da
      ::  when the caller should ask for fresh credentials
      renew-after=@da
  ==
::
::  +call-result: the COMPLETE typed hand-off to one local agent -- every
::  request that was accepted ends in exactly one of these.
::
::  Before this existed only success was reported: a failure deleted the
::  outbox entry and told nobody, so the requesting agent (and the browser
::  behind it) waited forever on a request that had already been refused.
::
::  `context` sits at the same position in BOTH variants deliberately, so a
::  receiver can correlate the result before it has to branch on the outcome.
::
::  The failure variant carries a safe CATEGORY only. It never carries an
::  upstream body, a status line, a URL, a bearer, or a trace -- so the
::  failure can be shown to a browser without any redaction step that could
::  be forgotten.
::
::  `who` names the participant the failed request was for, because the
::  correlation token deliberately does not: the token binds a note, call and
::  generation, and a host may have several participants outstanding at once.
::  It is ~ for room-level operations, which belong to no participant.
::  `context` is the FIRST field of both variants, at the same axis, so a
::  receiver can read it without branching. Ordering it last -- the obvious
::  arrangement -- puts it at a different axis in each variant, and a wing
::  through the union then fails to resolve at all (find-fork).
+$  call-result
  $%  [%granted context=ctx =access]
      [%failed context=ctx who=(unit @p) err=call-error]
  ==
::
::  ------------------------------------------------------------- outcomes
::
::  Safe error categories. These are the ONLY failure values that cross a
::  boundary: never a bearer, a token, an upstream body, or a stack trace.
+$  call-error
  $?  %service-unavailable
      %unauthorized
      %room-unavailable
      %room-ended
      %quota
      %rate-limited
      %participant-limit
      %conflict
      %expired
      %malformed
  ==
::
::  A room-level result carries no credential and is safe to log.
+$  room-result
  $:  =room-ref
      group=@t
      state=@tas
      clients=@ud
  ==
::
::  service health as last observed. Non-secret.
::
::  Every stage is reported separately so a failure names the hop that
::  failed. `broker-reachable` false means our own broker never answered;
::  everything below it is what the BROKER observed on our behalf.
+$  health
  $:  ok=?
      broker-reachable=?
      gateway-authenticated=?
      warden-reachable=?
      warden-authenticated=?
      db-ready=?
      galene-reachable=?
      ::  TURN cannot be probed from here without minting a credential, so
      ::  it is reported as unknown rather than guessed at.
      turn=?(%unknown %ok %down)
      stage=@tas
      at=@da
  ==
+$  health-view
  $:  req=(unit @ud)
      value=(unit health)
  ==
::
::  ------------------------------------------------------------- actions
::
::  LOCAL actions. The mark for these is noun-only, so Eyre cannot deliver
::  one: a browser can never ask for credentials directly.
::
::  `return` names a LOCAL agent to receive the typed result. It is always
::  poked on our.bowl, never on another ship.
+$  action
  $%  ::  configuration
      [%set-broker who=@p mode=service-mode]
      ::  Browser configuration reaches this only through the same-ship
      ::  %noltbook action boundary. `key=~` preserves the existing secret.
      [%configure req=@ud broker=@p endpoint=@t key=(unit @t)]
      ::  BROKER ONLY. Stores the loopback gateway key.
      [%set-gateway-key key=@t]
      ::  lifecycle, addressed to the configured broker
      [%status req=@ud]
      [%ensure req=@ud room=@tas ttl=@ud]
      ::  Ordered call startup. The room must exist before access is minted;
      ::  issuing these as separate actions lets Ames/HTTP reorder them.
      [%ensure-access req=@ud room=@tas ttl=@ud who=@p return=@tas context=ctx]
      [%renew req=@ud room=@tas ttl=@ud]
      [%room-status req=@ud room=@tas]
      [%evict req=@ud room=@tas who=@p]
      [%end req=@ud room=@tas]
      ::  participant access. `who` is the intended participant and is
      ::  SEPARATE from the requesting host, which is the room authority.
      [%access req=@ud room=@tas who=@p return=@tas context=ctx]
      [%renew-access req=@ud room=@tas who=@p return=@tas context=ctx]
      ::  Transport choice for NEW calls. The browser reaches this only
      ::  through %noltbook's same-ship action boundary; this mark stays
      ::  noun-only and unreachable from Eyre.
      [%set-sfu-gate on=?]
  ==
::
::  ------------------------------------------------------------- remote
::
::  Ship-to-ship. Noun-only mark; unreachable from a browser.
::
::  A request NEVER names its own host: the broker takes the authority from
::  src.bowl and nothing in the payload can override it.
::
::  The broker answers with a TYPED value, not raw JSON. Loosely interpreted
::  JSON therefore never travels past the broker that parsed it.
+$  remote
  $%  [%call-request req=@ud op=@tas room=@tas who=(unit @p) ttl=@ud context=ctx]
      ::  credential-bearing. Never logged, never scryable.
      [%call-ok req=@ud =access context=ctx]
      ::  safe room-level answer
      [%call-room req=@ud =room-result]
      ::  safe failure
      [%call-fail req=@ud err=call-error]
      ::  typed service health, non-secret
      [%call-health req=@ud =health]
  ==
::
::  ---------------------------------------------------------- safe record
::
::  What the agent is willing to remember and reveal about a request.
::  Deliberately carries NO credential -- only whether it worked.
+$  safe-row
  $:  req=@ud
      ::  the ship that ANSWERED us -- for a client row this is the broker,
      ::  never the authority. It was previously mis-named `host`, which
      ::  read as "the room authority" and is exactly the wrong thing to
      ::  believe while debugging an authority question.
      broker=@p
      ::  the authenticated room authority, when the row concerns one
      authority=(unit @p)
      ::  the participant a grant was minted for, when the row concerns one
      participant=(unit @p)
      op=@tas
      ok=?
      err=(unit call-error)
      at=@da
  ==
--
