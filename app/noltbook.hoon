/-  noltbook
/+  default-agent, dbug, server
|%
+$  versioned-state
  $%  state-1
      state-2
      state-3
      state-4
      state-5
      state-6
      state-7
      state-8
      state-9
  ==
::  pre-edited-flag message shape — used by state-1..8 for on-load typing
+$  message-legacy
  $:  id=@da
      note-id=@ta
      author=@p
      text=@t
      timestamp=@da
      reply-to=(unit @da)
  ==
+$  profile-1
  $:  display-name=(unit @t)
      avatar-path=(unit @t)
      wallet-address=(unit @t)
  ==
+$  profile-2
  $:  display-name=(unit @t)
      avatar-path=(unit @t)
      wallet-address=(unit @t)
      azimuth-address=(unit @t)
  ==
+$  artifact-type-2  ?(%code %markdown %canvas)
+$  artifact-2
  $:  id=@ta
      name=@t
      type=artifact-type-2
      creator=@p
      note-id=@ta
      versions=(list artifact-version:noltbook)
  ==
+$  state-1
  $:  %1
      notes=(map @ta note-3:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact-2)
      profiles=(map @p profile-1)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-2
  $:  %2
      notes=(map @ta note-3:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact-2)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-3
  $:  %3
      notes=(map @ta note-3:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-4
  $:  %4
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-5
  $:  %5
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
  ==
+$  state-6
  $:  %6
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile:noltbook)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
      has-avatar=?
  ==
::  state-7: adds pal tracking (outgoing/incoming/blocked)
::  outgoing = ships we sent %remote-hey to (we want to be pals)
::  incoming = ships that sent us %remote-hey (they want to be pals)
::  blocked  = ships we explicitly blocked
::  pal status derived: mutual = outgoing & incoming
::                      requesting = outgoing & !incoming
::                      requested = incoming & !outgoing
::
+$  state-7
  $:  %7
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile:noltbook)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
      has-avatar=?
      pal-outgoing=(set @p)
      pal-incoming=(set @p)
      pal-blocked=(set @p)
  ==
::  state-8: adds %dial gossip hop control
::  dial: 0-3, controls how many hops of gossip the frontend displays
::  gossip-hops: tracks hop count for each cover message by id
::
+$  state-8
  $:  %8
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile:noltbook)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
      has-avatar=?
      pal-outgoing=(set @p)
      pal-incoming=(set @p)
      pal-blocked=(set @p)
      dial=@ud
      gossip-hops=(map @da @ud)
  ==
::  state-9: adds edited flag to messages
::
+$  state-9
  $:  %9
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile:noltbook)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
      has-avatar=?
      pal-outgoing=(set @p)
      pal-incoming=(set @p)
      pal-blocked=(set @p)
      dial=@ud
      gossip-hops=(map @da @ud)
  ==
+$  card  card:agent:gall
::
++  upgrade-8-to-9
  |=  s=state-8
  ^-  state-9
  =/  new-msgs=(map @ta (list message:noltbook))
    %-  ~(run by messages.s)
    |=  ml=(list message-legacy)
    ^-  (list message:noltbook)
    %+  turn  ml
    |=  m=message-legacy
    ^-  message:noltbook
    [id.m note-id.m author.m text.m timestamp.m reply-to.m %.n]
  :*  %9
      notes.s
      new-msgs
      artifacts.s
      profiles.s
      transactions.s
      current-note.s
      peers.s
      has-avatar.s
      pal-outgoing.s
      pal-incoming.s
      pal-blocked.s
      dial.s
      gossip-hops.s
  ==
::  root-uniqueness helpers
::  find-root: first non-cover root note whose users = target set
++  find-root
  |=  [nmap=(map @ta note:noltbook) us=(set @p)]
  ^-  (unit note:noltbook)
  =/  hits=(list note:noltbook)
    %+  skim  ~(val by nmap)
    |=  n=note:noltbook
    &(?=(~ parent.n) =(users.n us) !=(%cover type.n))
  ?~  hits  ~
  `i.hits
::  root-wins: does candidate a beat candidate b?
::  lower creator ship wins; tie → lower id (earlier) wins
++  root-wins
  |=  [a=[cr=@p id=@ta] b=[cr=@p id=@ta]]
  ^-  ?
  ?.  =(cr.a cr.b)  (lth `@`cr.a `@`cr.b)
  (lth `@`id.a `@`id.b)
--
%-  agent:dbug
=|  state-9
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init
  ^-  (quip card _this)
  =/  bind=card
    [%pass /eyre-bind %arvo %e %connect [~ /apps/noltbook] %noltbook]
  =/  cover=note:noltbook  [%cover 'ARS NOTORIA' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ &]
  :_  this(notes (~(put by notes) %cover cover), messages (~(put by messages) %cover *(list message:noltbook)))
  ~[bind]
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  ?:  ?=([%9 *] q.old)
    `this(state !<(state-9 old))
  ::  state-8 → state-9: add edited flag to messages (default %.n)
  ?:  ?=([%8 *] q.old)
    `this(state (upgrade-8-to-9 !<(state-8 old)))
  ::  state-7 → state-8 → state-9
  ?:  ?=([%7 *] q.old)
    =/  s7  !<(state-7 old)
    =/  s8=state-8
      [%8 notes.s7 messages.s7 artifacts.s7 profiles.s7 transactions.s7 current-note.s7 peers.s7 has-avatar.s7 pal-outgoing.s7 pal-incoming.s7 pal-blocked.s7 0 ~]
    `this(state (upgrade-8-to-9 s8))
  ::  state-6 → state-7: add pal sets, auto-hey all existing peers
  ?:  ?=([%6 *] q.old)
    =/  s6  !<(state-6 old)
    ::  NOTE: auto-pal — all existing peers become outgoing pals.
    ::  We send %remote-hey to each so they add us to their incoming.
    ::  This section will change when we add notifications / manual opt-in.
    =/  hey-cards=(list card)
      %+  turn  ~(tap in peers.s6)
      |=  p=@p
      [%pass /pal-hey/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
    =/  s8=state-8
      [%8 notes.s6 messages.s6 artifacts.s6 profiles.s6 transactions.s6 current-note.s6 peers.s6 has-avatar.s6 peers.s6 ~ ~ 0 ~]
    :_  this(state (upgrade-8-to-9 s8))
    hey-cards
  ?:  ?=([%5 *] q.old)
    =/  s5  !<(state-5 old)
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s5)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 notes.s5 messages.s5 artifacts.s5 new-profiles transactions.s5 current-note.s5 peers.s5 %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-8-to-9 s8))
  ?:  ?=([%4 *] q.old)
    =/  s4  !<(state-4 old)
    =/  init-peers=(set @p)
      %-  ~(rep by notes.s4)
      |=  [[k=@ta v=note:noltbook] acc=(set @p)]
      (~(uni in acc) users.v)
    =.  init-peers  (~(del in init-peers) our.bowl)
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s4)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 notes.s4 messages.s4 artifacts.s4 new-profiles transactions.s4 current-note.s4 init-peers %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-8-to-9 s8))
  ?:  ?=([%3 *] q.old)
    =/  s3  !<(state-3 old)
    =/  new-notes=(map @ta note:noltbook)
      %-  ~(run by notes.s3)
      |=  n=note-3:noltbook
      ^-  note:noltbook
      [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s3)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 new-notes messages.s3 artifacts.s3 new-profiles transactions.s3 current-note.s3 ~ %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-8-to-9 s8))
  ?:  ?=([%2 *] q.old)
    =/  s2  !<(state-2 old)
    =/  new-arts=(map @ta artifact:noltbook)
      %-  ~(run by artifacts.s2)
      |=  a=artifact-2
      ^-  artifact:noltbook
      =/  new-type=artifact-type:noltbook
        ?:  =(%code type.a)  %code
        %file
      a(type new-type)
    =/  new-notes=(map @ta note:noltbook)
      %-  ~(run by notes.s2)
      |=  n=note-3:noltbook
      ^-  note:noltbook
      [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s2)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 new-notes messages.s2 new-arts new-profiles transactions.s2 current-note.s2 ~ %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-8-to-9 s8))
  =/  s1  !<(state-1 old)
  =/  cov  (~(get by notes.s1) %cover)
  =/  fixed-notes=(map @ta note-3:noltbook)
    ?~  cov  notes.s1
    ?:  =(%cover id.u.cov)  notes.s1
    (~(put by notes.s1) %cover u.cov(id %cover, name 'ARS NOTORIA'))
  =/  new-profiles=(map @p profile:noltbook)
    %-  ~(run by profiles.s1)
    |=  p=profile-1
    ^-  profile:noltbook
    [display-name.p ~ wallet-address.p ~]
  =/  new-arts=(map @ta artifact:noltbook)
    %-  ~(run by artifacts.s1)
    |=  a=artifact-2
    ^-  artifact:noltbook
    =/  new-type=artifact-type:noltbook
      ?:  =(%code type.a)  %code
      %file
    a(type new-type)
  =/  new-notes=(map @ta note:noltbook)
    %-  ~(run by fixed-notes)
    |=  n=note-3:noltbook
    ^-  note:noltbook
    [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
  =/  s8=state-8
    [%8 new-notes messages.s1 new-arts new-profiles transactions.s1 current-note.s1 ~ %.n ~ ~ ~ 0 ~]
  `this(state (upgrade-8-to-9 s8))
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%notes ~]
    ::  local frontend only
    =/  note-list=(list note:noltbook)  ~(val by notes)
    =/  upd=update:noltbook  [%note-list note-list]
    =/  prof-list=(list [@p profile:noltbook])  ~(tap by profiles)
    =/  pupd=update:noltbook  [%profile-list prof-list]
    =/  pal-pairs=(list [@p pal-status:noltbook])
      %+  turn  ~(tap in peers)
      |=  p=@p
      :-  p
      ?:  (~(has in pal-blocked) p)  %blocked
      ?:  &((~(has in pal-outgoing) p) (~(has in pal-incoming) p))  %mutual
      ?:  (~(has in pal-outgoing) p)  %requesting
      ?:  (~(has in pal-incoming) p)  %requested
      %requesting  :: default for known peers not yet tracked
    =/  palupd=update:noltbook  [%pal-list pal-pairs]
    =/  dialupd=update:noltbook  [%dial-update dial]
    :_  this
    :~  [%give %fact ~ %noltbook-update !>(upd)]
        [%give %fact ~ %noltbook-update !>(pupd)]
        [%give %fact ~ %noltbook-update !>(palupd)]
        [%give %fact ~ %noltbook-update !>(dialupd)]
    ==
  ::
      [%notes @ ~]
    =/  nid=@ta  i.t.path
    ::  permission check for remote subscribers
    ?>  ?|  =(src.bowl our.bowl)
            =(nid %cover)
            =/  note  (~(get by notes) nid)
            ?&  ?=(^ note)
                (~(has in users.u.note) src.bowl)
            ==
        ==
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    =/  upd=update:noltbook  [%message-list nid msgs arts]
    ::  send profiles of note users
    =/  note  (~(get by notes) nid)
    =/  user-list=(list @p)
      ?~  note  ~
      ~(tap in users.u.note)
    =/  prof-list=(list [@p profile:noltbook])
      %+  murn  user-list
      |=  u=@p
      =/  prof  (~(get by profiles) u)
      ?~  prof  ~
      `[u u.prof]
    =/  pupd=update:noltbook  [%profile-list prof-list]
    :_  this
    :~  [%give %fact ~ %noltbook-update !>(upd)]
        [%give %fact ~ %noltbook-update !>(pupd)]
    ==
  ::
      [%http-response @ ~]
    `this
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:def path)
      [%x %notes ~]
    =/  note-list=(list note:noltbook)  ~(val by notes)
    =/  upd=update:noltbook  [%note-list note-list]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %notes @ ~]
    =/  nid=@ta  i.t.t.path
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    =/  upd=update:noltbook  [%message-list nid msgs arts]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %sponsors ~]
    =/  chain=(list @p)
      =/  cur=@p  our.bowl
      =/  acc=(list @p)  ~
      |-
      =/  spon=@p  .^(@p %j /(scot %p our.bowl)/sein/(scot %da now.bowl)/(scot %p cur))
      ?:  =(spon cur)  (flop acc)
      $(cur spon, acc [spon acc])
    =/  upd=update:noltbook  [%sponsor-chain chain]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %sponsors @ ~]
    =/  who=@p  (slav %p i.t.t.path)
    =/  chain=(list @p)
      =/  cur=@p  who
      =/  acc=(list @p)  ~
      |-
      =/  spon=@p  .^(@p %j /(scot %p our.bowl)/sein/(scot %da now.bowl)/(scot %p cur))
      ?:  =(spon cur)  (flop acc)
      $(cur spon, acc [spon acc])
    =/  upd=update:noltbook  [%sponsor-chain chain]
    ``[%noltbook-update !>(upd)]
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+  mark  (on-poke:def mark vase)
  ::
      %handle-http-request
    =+  !<([eyre-id=@ta =inbound-request:eyre] vase)
    =/  req-url=@t  url.request.inbound-request
    =/  url-tape  (trip req-url)
    ::  public endpoint: serve avatar (no auth required)
    ?:  &(=(%'GET' method.request.inbound-request) =(url-tape "/apps/noltbook/avatar"))
      ?.  has-avatar
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  av-clay=path
        :*  (scot %p our.bowl)
            q.byk.bowl
            (scot %da now.bowl)
            /lib/noltbook/avatar/mime
        ==
      =/  avatar-data=mime  .^(mime %cx av-clay)
      =/  =simple-payload:http
        :_  `q.avatar-data
        :-  200
        :~  ['content-type' (rap 3 (join '/' p.avatar-data))]
            ['cache-control' 'max-age=3600']
            ['access-control-allow-origin' '*']
        ==
      [(give-simple-payload:app:server eyre-id simple-payload) this]
    ::  public endpoint: serve note icon (only the note's host serves it)
    ?:  &(=(%'GET' method.request.inbound-request) =((scag 20 url-tape) "/apps/noltbook/icon/"))
      =/  nid=@ta  (crip (slag 20 url-tape))
      =/  nt  (~(get by notes) nid)
      ?~  nt
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ?.  =(our.bowl creator.u.nt)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ?~  icon-url.u.nt
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  ic-clay=path
        :*  (scot %p our.bowl)
            q.byk.bowl
            (scot %da now.bowl)
            /lib/noltbook/icons/[nid]/mime
        ==
      =/  icon-data=mime  .^(mime %cx ic-clay)
      =/  =simple-payload:http
        :_  `q.icon-data
        :-  200
        :~  ['content-type' (rap 3 (join '/' p.icon-data))]
            ['cache-control' 'max-age=3600']
            ['access-control-allow-origin' '*']
        ==
      [(give-simple-payload:app:server eyre-id simple-payload) this]
    ::  all other endpoints require auth
    ?.  authenticated.inbound-request
      :_  this
      %+  give-simple-payload:app:server  eyre-id
      (login-redirect:gen:server request.inbound-request)
    ::  avatar upload endpoint
    ?:  &(=(%'POST' method.request.inbound-request) =(url-tape "/apps/noltbook/upload-avatar"))
      =/  bod  body.request.inbound-request
      ?~  bod
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      ?:  (gth p.u.bod 51.200)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[413 ~] ~]
      =/  avatar-cage=cage  [%mime !>(`mime`[/image/jpeg u.bod])]
      =/  miso-act  ?:(has-avatar [%mut avatar-cage] [%ins avatar-cage])
      =/  nori  [%& ~[[/lib/noltbook/avatar/mime miso-act]]]
      =/  clay-card=card  [%pass /avatar-write %arvo %c %info q.byk.bowl nori]
      =/  ok-payload=simple-payload:http  [[200 ~] ~]
      =/  http-cards  (give-simple-payload:app:server eyre-id ok-payload)
      :_  this(has-avatar %.y)
      [clay-card http-cards]
    ::  note icon upload endpoint
    ?:  &(=(%'POST' method.request.inbound-request) =((scag 27 url-tape) "/apps/noltbook/upload-icon/"))
      =/  nid=@ta  (crip (slag 27 url-tape))
      =/  nt  (~(get by notes) nid)
      ?~  nt
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ?.  =(our.bowl creator.u.nt)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[403 ~] ~]
      =/  bod  body.request.inbound-request
      ?~  bod
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      ?:  (gth p.u.bod 51.200)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[413 ~] ~]
      =/  had-icon=?  ?=(^ icon-url.u.nt)
      =/  icon-cage=cage  [%mime !>(`mime`[/image/jpeg u.bod])]
      =/  miso-act  ?:(had-icon [%mut icon-cage] [%ins icon-cage])
      =/  nori  [%& ~[[/lib/noltbook/icons/[nid]/mime miso-act]]]
      =/  clay-card=card  [%pass /icon-write/[nid] %arvo %c %info q.byk.bowl nori]
      =/  new-url=@t  (crip (weld "/apps/noltbook/icon/" (trip nid)))
      =/  new-nt=note:noltbook  u.nt(icon-url `new-url)
      =/  meta-upd=update:noltbook  [%note-meta-updated nid visibility.u.nt `new-url writable.u.nt]
      =/  ok-payload=simple-payload:http  [[200 ~] ~]
      =/  http-cards  (give-simple-payload:app:server eyre-id ok-payload)
      :_  this(notes (~(put by notes) nid new-nt))
      %+  weld  http-cards
      :~  clay-card
          [%give %fact ~[/notes] %noltbook-update !>(meta-upd)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(meta-upd)]
      ==
    ::  serve packages
    ?:  =((scag 19 url-tape) "/apps/noltbook/pkg/")
      =/  pkg-id=@ta  (crip (slag 19 url-tape))
      =/  pkg-path=path
        :*  (scot %p our.bowl)
            q.byk.bowl
            (scot %da now.bowl)
            /lib/noltbook/apps/[pkg-id]/index/html
        ==
      =/  pkg-bytes=octs
        (as-octs:mimes:html .^(@ %cx pkg-path))
      =/  =simple-payload:http
        [[200 ~[['content-type' 'text/html; charset=utf-8']]] `pkg-bytes]
      [(give-simple-payload:app:server eyre-id simple-payload) this]
    ::  default: serve frontend
    =/  html-path=path
      :*  (scot %p our.bowl)
          q.byk.bowl
          (scot %da now.bowl)
          /lib/noltbook/index/html
      ==
    =/  html-bytes=octs
      (as-octs:mimes:html .^(@ %cx html-path))
    =/  =simple-payload:http
      [[200 ~[['content-type' 'text/html; charset=utf-8']]] `html-bytes]
    [(give-simple-payload:app:server eyre-id simple-payload) this]
  ::
      %noltbook-action
    =/  act  !<(action:noltbook vase)
    ?-  -.act
        %switch-note
      `this(current-note id.act)
    ::
        %rename-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      =/  upd=update:noltbook  [%note-renamed id.act name.act]
      :_  this(notes (~(put by notes) id.act u.old(name name.act)))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %delete-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only creator (host) can delete the note
      ?.  =(our.bowl creator.u.old)  `this
      ::  block delete if other users present (handoff TBD); non-host uses %leave-note
      ?:  (gth ~(wyt in users.u.old) 1)  `this
      =/  trimmed=(map @ta note:noltbook)
        ?~  parent.u.old  notes
        =/  par  (~(get by notes) u.parent.u.old)
        ?~  par  notes
        (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
      =/  upd=update:noltbook  [%note-deleted id.act]
      :_  this(notes (~(del by trimmed) id.act), messages (~(del by messages) id.act))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %create-note
      ::  no parent: personal root note
      ?~  parent.act
        =/  self-set=(set @p)  (sy ~[our.bowl])
        =/  dup  (find-root notes self-set)
        ?^  dup
          ::  already have personal root; focus it
          :_  this
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created u.dup])]]
        =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
        =/  new-note=note:noltbook
          :*  nid  name.act  %notebook  our.bowl  self-set  ~  ~  ~  ~  %secret  ~  &
          ==
        =/  upd=update:noltbook  [%note-created new-note]
        :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)))
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      =/  pid=@ta  u.parent.act
      =/  par-u=(unit note:noltbook)  (~(get by notes) pid)
      ?~  par-u  `this
      =/  par=note:noltbook  u.par-u
      =/  is-shared=?  (gth ~(wyt in users.par) 1)
      ::  shared & not host: forward to host
      ?:  ?&  is-shared  !=(our.bowl creator.par)  ==
        :_  this
        ~[[%pass /create-child/[pid] %agent [creator.par %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-create-child pid name.act])]]
      ::  local create; inherit users and creator from parent
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  name.act  %notebook  creator.par  users.par  ~  `pid  ~  ~  %secret  ~  &
        ==
      =/  n1=(map @ta note:noltbook)  (~(put by notes) nid new-note)
      =/  n2=(map @ta note:noltbook)
        (~(put by n1) pid par(children (snoc children.par nid)))
      =/  upd=update:noltbook  [%note-created new-note]
      =/  broadcast=(list card)
        ?.  is-shared  ~
        %+  murn  ~(tap in users.par)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /child-out/(scot %p p)/[nid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-child-note pid new-note])]
      :_  this(notes n2, messages (~(put by messages) nid *(list message:noltbook)))
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] broadcast)
    ::
        %send-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  msg=message:noltbook
        :*  now.bowl  note-id.act  our.bowl  text.act  now.bowl  reply-to.act  %.n
        ==
      ::  ARS NOTORIA: store locally and gossip to all peers
      ?:  =(note-id.act %cover)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  own messages are hop 0
        =/  upd=update:noltbook  [%gossip-message msg 0]
        =/  gossip=(list card)
          %+  turn  ~(tap in pal-outgoing)
          |=  p=@p
          ^-  card
          [%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars msg 0])]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        :_  this(notes (~(put by notes) %cover upd-note), messages (~(put by messages) %cover (snoc cur msg)), gossip-hops (~(put by gossip-hops) id.msg 0))
        [[%give %fact ~[/notes/cover] %noltbook-update !>(upd)] gossip]
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-fwd/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message note-id.act msg])]]
      ::  local note: store and fan out
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%new-message msg]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %edit-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-edit/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-edit-msg note-id.act msg-id.act text.act])]]
      ::  creator: verify author is us (only author can edit own)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  found  (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
      ?~  found  `this
      ?.  =(our.bowl author.i.found)  `this
      =/  new-msgs=(list message:noltbook)
        %+  turn  cur
        |=  m=message:noltbook
        ?.  =(id.m msg-id.act)  m
        m(text text.act, edited &)
      =/  edited=message:noltbook  i.found(text text.act, edited &)
      =/  upd=update:noltbook  [%message-edited note-id.act edited]
      =/  pax=path  ~[%notes note-id.act]
      :_  this(messages (~(put by messages) note-id.act new-msgs))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %delete-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-del/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-delete-msg note-id.act msg-id.act])]]
      ::  creator: allow if our==author, or group-host (creator in >2-user note)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  found  (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
      ?~  found  `this
      =/  is-group=?  (gth ~(wyt in users.u.exists) 2)
      ?.  ?|  =(our.bowl author.i.found)
              is-group
          ==
        `this
      =/  kept=(list message:noltbook)
        (skim cur |=(m=message:noltbook !=(id.m msg-id.act)))
      =/  is-host-del=?  &(is-group !=(our.bowl author.i.found))
      =/  sys-msg=(unit message:noltbook)
        ?.  is-host-del  ~
        =/  vic=@t  (scot %p author.i.found)
        =/  txt=@t  (crip (weld "\01SYS:host-delete:" (trip vic)))
        `[now.bowl note-id.act our.bowl txt now.bowl ~ %.n]
      =/  new-msgs=(list message:noltbook)
        ?~  sys-msg  kept
        (weld kept ~[u.sys-msg])
      =/  del-upd=update:noltbook  [%message-deleted note-id.act msg-id.act]
      =/  pax=path  ~[%notes note-id.act]
      =/  facts=(list card)
        ?~  sys-msg
          ~[[%give %fact ~[pax] %noltbook-update !>(del-upd)]]
        :~  [%give %fact ~[pax] %noltbook-update !>(del-upd)]
            [%give %fact ~[pax] %noltbook-update !>(`update:noltbook`[%new-message u.sys-msg])]
        ==
      :_  this(messages (~(put by messages) note-id.act new-msgs))
      facts
    ::
        %set-note-meta
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only creator can change meta
      ?.  =(our.bowl creator.u.old)  `this
      =/  upd-note=note:noltbook
        u.old(visibility visibility.act, icon-url icon-url.act, writable writable.act)
      =/  upd=update:noltbook  [%note-meta-updated id.act visibility.act icon-url.act writable.act]
      :_  this(notes (~(put by notes) id.act upd-note))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %invite-to-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  must be creator to invite
      ?>  =(our.bowl creator.u.old)
      ::  compute new user set
      =/  new-users=(set @p)  (~(put in users.u.old) ship.act)
      ::  dedup: if any root note (local OR remote-hosted) already has these users, focus it
      =/  dup-id=(unit @ta)
        %-  ~(rep by notes)
        |=  [[k=@ta v=note:noltbook] acc=(unit @ta)]
        ?^  acc  acc
        ?:  ?&  ?=(~ parent.v)
                !=(%cover type.v)
                !=(k id.act)
                =(users.v new-users)
            ==
          `k
        acc
      ?^  dup-id
        =/  ex=note:noltbook  (~(got by notes) u.dup-id)
        :_  this
        :~  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created ex])]
            [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-redirect id.act u.dup-id])]
        ==
      =/  new-note=note:noltbook  u.old(users new-users)
      ::  poke remote ship with invite
      =/  rem=remote:noltbook  [%remote-invite id.act name.u.old our.bowl users.new-note visibility.u.old]
      =/  poke-card=card
        [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      ::  subscribe to remote's ars notoria if new peer
      =/  new-peers=(set @p)  (~(put in peers) ship.act)
      =/  is-new-peer=?  !(~(has in peers) ship.act)
      =/  ars-cards=(list card)
        ?.  is-new-peer
          ~
        ~[[%pass /ars/(scot %p ship.act) %agent [ship.act %noltbook] %watch /notes/cover]]
      ::  NOTE: auto-pal — send hey to new peers automatically
      =/  new-outgoing=(set @p)
        ?.  is-new-peer  pal-outgoing
        (~(put in pal-outgoing) ship.act)
      =/  hey-cards=(list card)
        ?.  is-new-peer  ~
        ~[[%pass /pal-hey/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
      =/  pal-status-upd=(list card)
        ?.  is-new-peer  ~
        =/  status=pal-status:noltbook  %requesting
        ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%pal-update ship.act status])]]
      ::  notify local frontend
      =/  upd=update:noltbook  [%note-created new-note]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ::
        %create-artifact
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  aid=@ta  (crip (weld "art-" (trip (scot %da now.bowl))))
      =/  new-art=artifact:noltbook
        :*  aid  name.act  type.act  our.bowl  note-id.act
            ~[[1 content.act our.bowl now.bowl]]
        ==
      =/  upd=update:noltbook  [%artifact-created new-art]
      =/  pax=path  ~[%notes note-id.act]
      :_  this(artifacts (~(put by artifacts) aid new-art))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %edit-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      =/  new-ver=artifact-version:noltbook
        :*  (add 1 (lent versions.u.old))  content.act  our.bowl  now.bowl
        ==
      =/  upd-art=artifact:noltbook  u.old(versions (snoc versions.u.old new-ver))
      =/  upd=update:noltbook  [%artifact-updated upd-art]
      =/  pax=path  ~[%notes note-id.upd-art]
      :_  this(artifacts (~(put by artifacts) id.act upd-art))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %delete-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      =/  nid=@ta  note-id.u.old
      =/  upd=update:noltbook  [%artifact-deleted id.act]
      =/  pax=path  ~[%notes nid]
      :_  this(artifacts (~(del by artifacts) id.act))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %file-save
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      =/  upd-art=artifact:noltbook
        u.old(versions ~[[1 data.act our.bowl now.bowl]])
      =/  upd=update:noltbook  [%artifact-updated upd-art]
      =/  pax=path  ~[%notes note-id.upd-art]
      :_  this(artifacts (~(put by artifacts) id.act upd-art))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %update-profile
      =/  prof=profile:noltbook
        [display-name.act avatar.act wallet-address.act azimuth-address.act]
      =/  upd=update:noltbook  [%profile-updated our.bowl prof]
      ::  broadcast to peers
      =/  peer-cards=(list card)
        %+  turn  ~(tap in peers)
        |=  p=@p
        ^-  card
        [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      :_  this(profiles (~(put by profiles) our.bowl prof))
      [[%give %fact ~[/notes] %noltbook-update !>(upd)] peer-cards]
    ::
        %register-wallet
      =/  old  (~(get by profiles) our.bowl)
      =/  prof=profile:noltbook
        ?~  old  [~ ~ `address.act ~]
        u.old(wallet-address `address.act)
      =/  upd=update:noltbook  [%profile-updated our.bowl prof]
      :_  this(profiles (~(put by profiles) our.bowl prof))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %nock-send-confirmed
      =/  tx=transaction:noltbook  [%sent to.act amount.act tx-hash.act now.bowl]
      =/  new-txs=(list transaction:noltbook)  [tx transactions]
      =/  upd=update:noltbook  [%wallet-update new-txs]
      :_  this(transactions new-txs)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %request-remote-notes
      ::  frontend wants another ship's public/private notes
      =/  who=@p  ship.act
      ?:  =(who our.bowl)
        ::  local: just send our own public/private notes
        =/  pub-notes=(list note:noltbook)
          %+  skim  ~(val by notes)
          |=(n=note:noltbook ?|(?=(%public visibility.n) ?=(%private visibility.n)))
        =/  upd=update:noltbook  [%remote-note-list our.bowl pub-notes]
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  remote: poke the other ship to request their notes
      =/  rem=remote:noltbook  [%remote-note-request our.bowl]
      :_  this
      ~[[%pass /note-req/(scot %p who) %agent [who %noltbook] %poke %noltbook-remote !>(rem)]]
    ::
    ::  pal management actions
    ::  NOTE: auto-pal — add-pal is also called automatically on peer discovery.
    ::  This section will change when we add notifications / manual opt-in.
    ::
        %add-pal
      ?:  =(ship.act our.bowl)  `this
      ::  unblock if blocked
      =/  new-blocked=(set @p)  (~(del in pal-blocked) ship.act)
      ::  add to outgoing, send %remote-hey
      =/  new-outgoing=(set @p)  (~(put in pal-outgoing) ship.act)
      =/  hey-card=card
        [%pass /pal-hey/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %mutual
        %requesting
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-outgoing new-outgoing, pal-blocked new-blocked)
      [hey-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~]
    ::
        %remove-pal
      ?:  =(ship.act our.bowl)  `this
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  bye-card=card
        [%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-outgoing new-outgoing)
      [bye-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~]
    ::
        %block-pal
      ?:  =(ship.act our.bowl)  `this
      ::  remove from outgoing, add to blocked, send bye if was outgoing
      =/  was-outgoing=?  (~(has in pal-outgoing) ship.act)
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  new-incoming=(set @p)  (~(del in pal-incoming) ship.act)
      =/  new-blocked=(set @p)  (~(put in pal-blocked) ship.act)
      =/  bye-cards=(list card)
        ?.  was-outgoing  ~
        ~[[%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]]
      =/  upd=update:noltbook  [%pal-update ship.act %blocked]
      :_  this(pal-outgoing new-outgoing, pal-incoming new-incoming, pal-blocked new-blocked)
      [[%give %fact ~[/notes] %noltbook-update !>(upd)] bye-cards]
    ::
        %unblock-pal
      ?:  =(ship.act our.bowl)  `this
      =/  new-blocked=(set @p)  (~(del in pal-blocked) ship.act)
      ::  NOTE: unblocking does not auto-add as pal. User must click PALS separately.
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-blocked new-blocked)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %set-dial
      ::  clamp dial to 0-3
      =/  new-dial=@ud  (min dial.act 3)
      =/  upd=update:noltbook  [%dial-update new-dial]
      :_  this(dial new-dial)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %leave-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?:  =(%cover id.u.old)  `this
      =/  is-host=?  =(our.bowl creator.u.old)
      =/  user-count  ~(wyt in users.u.old)
      ::  host w/ others: blocked until handoff lands
      ?:  &(is-host (gth user-count 1))  `this
      ::  sole user (host alone OR personal root): act like delete
      ?:  (lte user-count 1)
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
        =/  upd=update:noltbook  [%note-deleted id.act]
        :_  this(notes (~(del by trimmed) id.act), messages (~(del by messages) id.act))
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  non-host leaving shared note: poke host, drop locally
      =/  host=@p  creator.u.old
      =/  leave-card=card
        [%pass /leave-out/(scot %p host)/[id.act] %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-leave id.act])]
      =/  upd=update:noltbook  [%note-deleted id.act]
      :_  this(notes (~(del by notes) id.act), messages (~(del by messages) id.act))
      ~[leave-card [%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %create-dm
      ?:  =(ship.act our.bowl)  `this
      ::  dedup: if a root shared note with exactly these two users exists, refocus it
      =/  target-users=(set @p)  (sy ~[our.bowl ship.act])
      =/  existing=(list note:noltbook)
        %+  skim  ~(val by notes)
        |=  n=note:noltbook
        &(?=(~ parent.n) =(users.n target-users) !=(%cover type.n))
      ?^  existing
        =/  upd=update:noltbook  [%note-created i.existing]
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  create new DM root and invite counterparty
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  (scot %p ship.act)  %dm  our.bowl  target-users  ~  ~  ~  ~  %secret  ~  &
        ==
      =/  rem=remote:noltbook  [%remote-invite nid name.new-note our.bowl target-users %secret]
      =/  poke-card=card
        [%pass /invite/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      =/  new-peers=(set @p)  (~(put in peers) ship.act)
      =/  is-new-peer=?  !(~(has in peers) ship.act)
      =/  ars-cards=(list card)
        ?.  is-new-peer  ~
        ~[[%pass /ars/(scot %p ship.act) %agent [ship.act %noltbook] %watch /notes/cover]]
      =/  new-outgoing=(set @p)
        ?.  is-new-peer  pal-outgoing
        (~(put in pal-outgoing) ship.act)
      =/  hey-cards=(list card)
        ?.  is-new-peer  ~
        ~[[%pass /pal-hey/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
      =/  pal-status-upd=(list card)
        ?.  is-new-peer  ~
        ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%pal-update ship.act %requesting])]]
      =/  upd=update:noltbook  [%note-created new-note]
      :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ==
  ::
      %noltbook-remote
    =/  rem  !<(remote:noltbook vase)
    ?-  -.rem
    ::
        %remote-invite
      ::  someone invited us to their note
      =/  new-note=note:noltbook
        [note-id.rem name.rem %notebook creator.rem users.rem ~ ~ ~ ~ visibility.rem ~ &]
      ::  root-uniqueness: only dedup non-cover roots
      =/  dup  ?:(=(note-id.rem %cover) ~ (find-root notes users.rem))
      ?^  dup
        ?:  =(id.u.dup note-id.rem)  `this  :: same note, no-op
        =/  local-wins=?
          %+  root-wins
            [creator.u.dup id.u.dup]
          [creator.rem note-id.rem]
        ?:  local-wins
          ::  keep local; tell sender to drop theirs + adopt ours
          :_  this
          :~  :*  %pass  /root-exists/(scot %p src.bowl)/[note-id.rem]
                  %agent  [src.bowl %noltbook]  %poke
                  %noltbook-remote
                  !>(`remote:noltbook`[%remote-root-exists note-id.rem u.dup])
              ==
          ==
        ::  remote wins; drop local root, adopt incoming
        =/  old-id=@ta  id.u.dup
        =/  trimmed=(map @ta note:noltbook)  (~(del by notes) old-id)
        =/  trimmed-msgs=(map @ta (list message:noltbook))  (~(del by messages) old-id)
        =/  redir=update:noltbook  [%note-redirect old-id note-id.rem]
        =/  new-peers=(set @p)  (~(put in peers) creator.rem)
        =/  is-new-peer=?  !(~(has in peers) creator.rem)
        =/  ars-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /ars/(scot %p creator.rem) %agent [creator.rem %noltbook] %watch /notes/cover]]
        =/  new-outgoing=(set @p)
          ?.  is-new-peer  pal-outgoing
          (~(put in pal-outgoing) creator.rem)
        =/  hey-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /pal-hey/(scot %p creator.rem) %agent [creator.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
        =/  pal-status-upd=(list card)
          ?.  is-new-peer  ~
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%pal-update creator.rem %requesting])]]
        =/  upd=update:noltbook  [%note-created new-note]
        =/  sub-card=card
          [%pass /remote-note/[note-id.rem] %agent [creator.rem %noltbook] %watch /notes/[note-id.rem]]
        =/  head-cards=(list card)
          :~  [%give %fact ~[/notes] %noltbook-update !>(redir)]
              sub-card
              [%give %fact ~[/notes] %noltbook-update !>(upd)]
          ==
        :_  %=  this
              notes  (~(put by trimmed) note-id.rem new-note)
              messages  (~(put by trimmed-msgs) note-id.rem ~)
              peers  new-peers
              pal-outgoing  new-outgoing
            ==
        :(weld head-cards ars-cards hey-cards pal-status-upd)
      ::  no collision: original path
      ::  add creator to peers, subscribe to their ars notoria
      =/  new-peers=(set @p)  (~(put in peers) creator.rem)
      =/  is-new-peer=?  !(~(has in peers) creator.rem)
      =/  ars-cards=(list card)
        ?.  is-new-peer
          ~
        ~[[%pass /ars/(scot %p creator.rem) %agent [creator.rem %noltbook] %watch /notes/cover]]
      ::  NOTE: auto-pal — send hey to new peers automatically
      =/  new-outgoing=(set @p)
        ?.  is-new-peer  pal-outgoing
        (~(put in pal-outgoing) creator.rem)
      =/  hey-cards=(list card)
        ?.  is-new-peer  ~
        ~[[%pass /pal-hey/(scot %p creator.rem) %agent [creator.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
      =/  pal-status-upd=(list card)
        ?.  is-new-peer  ~
        ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%pal-update creator.rem %requesting])]]
      ::  notify local frontend
      =/  upd=update:noltbook  [%note-created new-note]
      ::  subscribe to creator for live updates (skip cover — ars handles it)
      ?:  =(note-id.rem %cover)
        :_  this(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers, pal-outgoing new-outgoing)
        :(weld [[%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
      =/  sub-card=card
        [%pass /remote-note/[note-id.rem] %agent [creator.rem %noltbook] %watch /notes/[note-id.rem]]
      :_  this(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers, pal-outgoing new-outgoing)
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ::
        %remote-message
      ::  a remote user sent a message to a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  verify: we must be creator, sender must be in users
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%new-message msg.rem]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      :_  this(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur msg.rem)))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %remote-ars
      ::  ARS NOTORIA gossip from a peer
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ::  dedup by message id
      ?:  (lien cur |=(m=message:noltbook =(id.m id.msg.rem)))
        `this
      ::  hop count: direct from sender = hops in message + 1
      ::  (sender originates at 0, so we receive it as 1 hop away, etc)
      =/  my-hops=@ud  (add hops.rem 1)
      =/  upd=update:noltbook  [%gossip-message msg.rem my-hops]
      ::  relay to outgoing pals only (ships we follow)
      =/  relay=(list card)
        %+  murn  ~(tap in pal-outgoing)
        |=  p=@p
        ?:  =(p src.bowl)  ~  :: don't relay back to sender
        ?:  =(p author.msg.rem)  ~  :: don't relay back to author
        `[%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars msg.rem my-hops])]
      :_  this(messages (~(put by messages) %cover (snoc cur msg.rem)), gossip-hops (~(put by gossip-hops) id.msg.rem my-hops))
      [[%give %fact ~[/notes/cover] %noltbook-update !>(upd)] relay]
    ::
        %remote-profile
      ::  a peer sent us their profile
      =/  upd=update:noltbook  [%profile-updated ship.rem profile.rem]
      :_  this(profiles (~(put by profiles) ship.rem profile.rem))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-note-request
      ::  someone is asking for our public/private notes
      =/  pub-notes=(list note:noltbook)
        %+  skim  ~(val by notes)
        |=(n=note:noltbook ?|(?=(%public visibility.n) ?=(%private visibility.n)))
      =/  resp=remote:noltbook  [%remote-note-list pub-notes]
      :_  this
      ~[[%pass /note-resp/(scot %p requester.rem) %agent [requester.rem %noltbook] %poke %noltbook-remote !>(resp)]]
    ::
        %remote-note-list
      ::  received a remote ship's public/private notes
      =/  upd=update:noltbook  [%remote-note-list src.bowl notes.rem]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-hey
      ::  a ship wants to be pals with us
      ::  ignore if blocked
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ::  add to incoming, compute new status, notify frontend
      =/  new-incoming=(set @p)  (~(put in pal-incoming) src.bowl)
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-outgoing) src.bowl)  %mutual
        %requested
      =/  upd=update:noltbook  [%pal-update src.bowl status]
      :_  this(pal-incoming new-incoming)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-bye
      ::  a ship no longer wants to be pals
      =/  new-incoming=(set @p)  (~(del in pal-incoming) src.bowl)
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-outgoing) src.bowl)  %requesting
        %none
      =/  upd=update:noltbook  [%pal-update src.bowl status]
      :_  this(pal-incoming new-incoming)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-edit-msg
      ::  remote user editing their own message in a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  found  (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `this
      ::  only the author can edit their own msg
      ?.  =(src.bowl author.i.found)  `this
      =/  new-msgs=(list message:noltbook)
        %+  turn  cur
        |=  m=message:noltbook
        ?.  =(id.m msg-id.rem)  m
        m(text text.rem, edited &)
      =/  edited=message:noltbook  i.found(text text.rem, edited &)
      =/  upd=update:noltbook  [%message-edited note-id.rem edited]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(messages (~(put by messages) note-id.rem new-msgs))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %remote-create-child
      ::  a user in our shared note asked us to create a child
      =/  old  (~(get by notes) parent-id.rem)
      ?~  old  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  name.rem  %notebook  our.bowl  users.u.old  ~  `parent-id.rem  ~  ~  %secret  ~  &
        ==
      =/  new-par=note:noltbook  u.old(children (snoc children.u.old nid))
      =/  all-notes  (~(put by (~(put by notes) nid new-note)) parent-id.rem new-par)
      =/  upd=update:noltbook  [%note-created new-note]
      =/  broadcast=(list card)
        %+  murn  ~(tap in users.u.old)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /child-out/(scot %p p)/[nid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-child-note parent-id.rem new-note])]
      :_  this(notes all-notes, messages (~(put by messages) nid *(list message:noltbook)))
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] broadcast)
    ::
        %remote-child-note
      ::  host created a child in a shared note; update our tree
      =/  old-par  (~(get by notes) parent-id.rem)
      ?~  old-par  `this
      ::  must come from the host (creator of parent)
      ?.  =(src.bowl creator.u.old-par)  `this
      =/  new-par=note:noltbook  u.old-par(children (snoc children.u.old-par id.note.rem))
      =/  new-notes=(map @ta note:noltbook)
        (~(put by (~(put by notes) id.note.rem note.rem)) parent-id.rem new-par)
      =/  sub-card=card
        [%pass /remote-note/[id.note.rem] %agent [creator.note.rem %noltbook] %watch /notes/[id.note.rem]]
      =/  upd=update:noltbook  [%note-created note.rem]
      :_  this(notes new-notes, messages (~(put by messages) id.note.rem *(list message:noltbook)))
      :~  sub-card
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
    ::
        %remote-delete-msg
      ::  remote user deleting their own message in a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  found  (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `this
      ::  only the author can delete their own msg via remote
      ?.  =(src.bowl author.i.found)  `this
      =/  new-msgs=(list message:noltbook)
        (skim cur |=(m=message:noltbook !=(id.m msg-id.rem)))
      =/  upd=update:noltbook  [%message-deleted note-id.rem msg-id.rem]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(messages (~(put by messages) note-id.rem new-msgs))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %remote-leave
      ::  a user left a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  new-users=(set @p)  (~(del in users.u.old) src.bowl)
      =/  pax=path  ~[%notes note-id.rem]
      ::  if host is alone after this, delete entirely
      ?:  =(~(wyt in new-users) 1)
        =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c note-id.rem)))))
        :_  this(notes (~(del by trimmed) note-id.rem), messages (~(del by messages) note-id.rem))
        :~  [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
            [%give %fact ~[pax] %noltbook-update !>(del-upd)]
        ==
      ::  remaining users > 1: shrink set, fan out update
      =/  new-note=note:noltbook  u.old(users new-users)
      =/  users-upd=update:noltbook
        [%note-users-updated note-id.rem ~(tap in new-users)]
      :_  this(notes (~(put by notes) note-id.rem new-note))
      :~  [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
          [%give %fact ~[pax] %noltbook-update !>(users-upd)]
      ==
    ::
        %remote-root-exists
      ::  we lost a root-uniqueness race; drop loser, adopt canonical
      ::  sender must be the canonical's creator (authority on winner)
      ?.  =(src.bowl creator.canonical.rem)  `this
      =/  loser  (~(get by notes) losing-id.rem)
      ::  only drop if we actually created it and it's root
      =?  notes  ?=(^ loser)
        ?:  &(=(our.bowl creator.u.loser) ?=(~ parent.u.loser))
          (~(del by notes) losing-id.rem)
        notes
      =?  messages  ?=(^ loser)
        ?:  &(=(our.bowl creator.u.loser) ?=(~ parent.u.loser))
          (~(del by messages) losing-id.rem)
        messages
      ::  install canonical if we don't have it
      =/  have-canonical=?  (~(has by notes) id.canonical.rem)
      =.  notes
        ?:  have-canonical  notes
        (~(put by notes) id.canonical.rem canonical.rem)
      =.  messages
        ?:  have-canonical  messages
        (~(put by messages) id.canonical.rem ~)
      ::  subscribe to canonical creator for updates (skip if already or cover)
      =/  sub-cards=(list card)
        ?:  have-canonical  ~
        ?:  =(id.canonical.rem %cover)  ~
        ~[[%pass /remote-note/[id.canonical.rem] %agent [creator.canonical.rem %noltbook] %watch /notes/[id.canonical.rem]]]
      =/  redir=update:noltbook  [%note-redirect losing-id.rem id.canonical.rem]
      =/  adopt=update:noltbook  [%note-created canonical.rem]
      =/  tail-cards=(list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(adopt)]
            [%give %fact ~[/notes] %noltbook-update !>(redir)]
        ==
      :_  this
      (weld sub-cards tail-cards)
    ==
  ==
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?:  ?=([%eyre %bound *] sign-arvo)
    ~?  !accepted.sign-arvo
      [dap.bowl "eyre bind rejected!" binding.sign-arvo]
    `this
  ?:  ?=([%clay %mere *] sign-arvo)
    ?:  ?=(%& -.p.sign-arvo)  `this
    ~&  [%clay-write-failed wire]
    ?:  ?=([%avatar-write ~] wire)
      `this(has-avatar %.n)
    ?:  ?=([%icon-write @ ~] wire)
      =/  nid=@ta  i.t.wire
      =/  old  (~(get by notes) nid)
      ?~  old  `this
      =/  rev=note:noltbook  u.old(icon-url ~)
      =/  upd=update:noltbook  [%note-meta-updated nid visibility.u.old ~ writable.u.old]
      :_  this(notes (~(put by notes) nid rev))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
      ==
    `this
  (on-arvo:def wire sign-arvo)
::
++  on-leave   on-leave:def
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+  wire  (on-agent:def wire sign)
  ::
      [%remote-note @ ~]
    ::  facts from a note we're subscribed to on a remote creator
    =/  nid=@ta  i.t.wire
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      ?.  =(%noltbook-update p.cage.sign)  `this
      =/  upd  !<(update:noltbook q.cage.sign)
      ::  cover is handled by [%ars @ ~], not here — skip to avoid gossip loops
      ?:  =(nid %cover)  `this
      ?+  -.upd  `this
      ::
          %message-list
        ::  initial sync: store messages and artifacts locally
        =.  messages  (~(put by messages) nid messages.upd)
        =.  artifacts
          %-  ~(gas by artifacts)
          (turn artifacts.upd |=(a=artifact:noltbook [id.a a]))
        ::  relay to local frontend
        :_  this
        ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]]
      ::
          %new-message
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
        =.  messages  (~(put by messages) nid (snoc cur msg))
        =/  note  (~(get by notes) nid)
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        :_  this
        :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>([%note-list ~(val by notes)])]
        ==
      ::
          %message-edited
        =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.upd) ~)
        =/  new-msgs=(list message:noltbook)
          %+  turn  msgs
          |=  m=message:noltbook
          ?.  =(id.m id.msg.upd)  m
          msg.upd
        =.  messages  (~(put by messages) note-id.upd new-msgs)
        :_  this
        ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]]
      ::
          %message-deleted
        =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.upd) ~)
        =/  new-msgs=(list message:noltbook)
          (skim msgs |=(m=message:noltbook !=(id.m msg-id.upd)))
        =.  messages  (~(put by messages) note-id.upd new-msgs)
        :_  this
        ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]]
      ::
          %note-meta-updated
        ::  relay visibility changes from remote creator to local frontend
        =/  note  (~(get by notes) id.upd)
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(visibility visibility.upd, icon-url icon-url.upd, writable writable.upd))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %profile-list
        ::  store remote profiles locally and relay to frontend
        =.  profiles
          %-  ~(gas by profiles)
          (turn profiles.upd |=([s=@p p=profile:noltbook] [s p]))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %profile-updated
        ::  store remote profile locally and relay to frontend
        =.  profiles  (~(put by profiles) ship.upd profile.upd)
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %note-users-updated
        ::  host updated the user set; sync locally
        =/  note  (~(get by notes) id.upd)
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(users (sy users.upd)))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ==
    ::
        %kick
      ::  resubscribe on kick (skip cover — ars handles it)
      ?:  =(nid %cover)  `this
      =/  note  (~(get by notes) nid)
      ?~  note  `this
      ?.  =(our.bowl creator.u.note)
        :_  this
        ~[[%pass wire %agent [creator.u.note %noltbook] %watch /notes/[nid]]]
      `this
    ::
        %watch-ack
      ?~  p.sign  `this
      ~&  [%remote-note-watch-failed nid u.p.sign]
      `this
    ==
  ::
      [%ars @ ~]
    ::  ARS NOTORIA subscription from a peer
    =/  peer=@p  (slav %p i.t.wire)
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      ?.  =(%noltbook-update p.cage.sign)  `this
      =/  upd  !<(update:noltbook q.cage.sign)
      ?+  -.upd  `this
          %new-message
        ::  legacy: treat as hop 1 (direct from peer)
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
          `this
        =/  gupd=update:noltbook  [%gossip-message msg 1]
        =.  messages  (~(put by messages) %cover (snoc cur msg))
        =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
        :_  this
        ~[[%give %fact ~[/notes/cover] %noltbook-update !>(gupd)]]
      ::
          %gossip-message
        ::  gossip with hop count from peer's cover subscription
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
          `this
        =/  my-hops=@ud  (add hops.upd 1)
        =/  gupd=update:noltbook  [%gossip-message msg my-hops]
        =.  messages  (~(put by messages) %cover (snoc cur msg))
        =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
        :_  this
        ~[[%give %fact ~[/notes/cover] %noltbook-update !>(gupd)]]
      ::
          %message-list
        ::  initial sync of cover messages from peer
        ::  store locally but do NOT relay to /notes/cover subscribers
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        =/  new-msgs=(list message:noltbook)
          %+  skim  messages.upd
          |=  m=message:noltbook
          !(lien cur |=(c=message:noltbook =(id.c id.m)))
        ?~  new-msgs  `this
        ::  assign hop 1 for all synced messages (came from direct peer)
        =/  new-hops=(map @da @ud)
          %-  ~(rep in `(set message:noltbook)`(sy new-msgs))
          |=  [m=message:noltbook acc=(map @da @ud)]
          (~(put by acc) id.m 1)
        `this(messages (~(put by messages) %cover (weld cur new-msgs)), gossip-hops (~(uni by gossip-hops) new-hops))
      ==
    ::
        %kick
      ::  resubscribe to peer's ars notoria
      :_  this
      ~[[%pass wire %agent [peer %noltbook] %watch /notes/cover]]
    ::
        %watch-ack
      ?~  p.sign  `this
      ~&  [%ars-watch-failed peer u.p.sign]
      `this
    ==
  ::
      [%invite @ @ ~]
    ::  ack/nack for outgoing invite pokes
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%invite-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%msg-fwd @ ~]
    ::  ack/nack for forwarded messages
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%msg-fwd-failed wire u.p.sign]
      `this
    ==
  ::
      [%msg-edit @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%msg-edit-failed wire u.p.sign]
      `this
    ==
  ::
      [%msg-del @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%msg-del-failed wire u.p.sign]
      `this
    ==
  ::
      [%create-child @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%create-child-failed wire u.p.sign]
      `this
    ==
  ::
      [%child-out @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%child-out-failed wire u.p.sign]
      `this
    ==
  ::
      [%ars-out @ ~]
    ::  ack/nack for ars notoria gossip pokes
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%prof-out @ ~]
    ::  ack/nack for profile broadcast pokes
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%leave-out @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%leave-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%root-exists @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%root-exists-failed wire u.p.sign]
      `this
    ==
  ==
::
++  on-fail    on-fail:def
--
