::  %noltbook-sigil: a ship's sigil as an SVG image, at /apps/noltbook/sigil/~ship
::
::    Drawn on the ship, so Noltbook and every other app on it show one drawing,
::    sigils work for any @p with no network, and no page fetches a sigil library
::    from a third-party site. Stateless, and separate from %noltbook so the symbol
::    data stays out of its build and a fault here cannot take Noltbook down. Eyre
::    sends this longer binding here rather than to %noltbook's /apps/noltbook.
::
::    A sigil never changes for a given @p, so responses are cacheable for good. If
::    the drawing ever changes, version the path (/sigil/v2/~ship) rather than
::    changing what an existing address returns.
::
/+  default-agent, server, sigil
|%
+$  card  card:agent:gall
::  foreground by ship class, exactly as Noltbook's page colours ships
++  fg-for
  |=  who=ship
  ^-  tape
  ?-  (clan:title who)
    %czar  "#bb77ff"
    %king  "#ffee55"
    %duke  "#ffaa00"
    %earl  "#dddddd"
    %pawn  "#00ff88"
  ==
::  connect: claim /apps/noltbook/sigil from Eyre (idempotent, so safe on every load)
++  connect
  ^-  card
  [%pass /eyre/connect %arvo %e %connect [~ /apps/noltbook/sigil] %noltbook-sigil]
::  serve: /apps/noltbook/sigil/~ship -> the sigil; anything else -> 404, never a crash
++  serve
  |=  =request:http
  ^-  simple-payload:http
  =/  rl  (parse-request-line:server url.request)
  ?.  ?=([%apps %noltbook %sigil @ ~] site.rl)  not-found:gen:server
  =/  who=(unit ship)  (slaw %p `@ta`i.t.t.t.site.rl)
  ?~  who  not-found:gen:server
  =/  pic=manx
    %.  u.who
    %_  sigil
      fg      (fg-for u.who)
      bg      "#000000"
      size    128
      margin  |
      icon    |
    ==
  :_  `(manx-to-octs:server pic)
  :-  200
  :~  ['content-type' 'image/svg+xml']
      ['cache-control' 'public, max-age=31536000, immutable']
  ==
--
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init
  ^-  (quip card _this)
  [~[connect] this]
++  on-save  !>(~)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  [~[connect] this]
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?.  ?=(%handle-http-request mark)  (on-poke:def mark vase)
  =+  !<([eyre-id=@ta =inbound-request:eyre] vase)
  :_  this
  %+  give-simple-payload:app:server  eyre-id
  ?.  ?=(%'GET' method.request.inbound-request)  not-found:gen:server
  (serve request.inbound-request)
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?:  ?=([%http-response @ ~] path)  `this
  (on-watch:def path)
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?:  ?=([%eyre %bound *] sign-arvo)  `this
  (on-arvo:def wire sign-arvo)
++  on-fail   on-fail:def
--
