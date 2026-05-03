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
      state-10
      state-11
      state-12
      state-13
      state-14
      state-15
      state-16
      state-17
      state-18
      state-19
  ==
::  pre-entry-meta message shape — used by state-18 for on-load typing
+$  message-18
  $:  id=@da
      note-id=@ta
      author=@p
      text=@t
      timestamp=@da
      reply-to=(unit @da)
      edited=?
  ==
::  pre-envelope-hash envelope shape — used by state-16 for on-load typing
+$  envelope-16
  $:  author=@p
      msg-id=@da
      timestamp=@da
      reply-to=(unit @da)
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
::  note-4: pre-removed-field note shape (used by state-4..14)
+$  note-4
  $:  id=@ta
      name=@t
      type=note-type:noltbook
      creator=@p
      users=(set @p)
      children=(list @ta)
      parent=(unit @ta)
      last-author=(unit @p)
      last-preview=(unit @t)
      visibility=note-visibility:noltbook
      icon-url=(unit @t)
      writable=?
  ==
::  note-17: pre-headline note shape (used by state-15..17)
+$  note-17
  $:  id=@ta
      name=@t
      type=note-type:noltbook
      creator=@p
      users=(set @p)
      children=(list @ta)
      parent=(unit @ta)
      last-author=(unit @p)
      last-preview=(unit @t)
      visibility=note-visibility:noltbook
      icon-url=(unit @t)
      writable=?
      removed=(set @p)
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
      notes=(map @ta note-4)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-5
  $:  %5
      notes=(map @ta note-4)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
  ==
+$  state-6
  $:  %6
      notes=(map @ta note-4)
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
      notes=(map @ta note-4)
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
      notes=(map @ta note-4)
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
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
::  state-10: adds mention tracking (bare msg-ids)
+$  state-10
  $:  %10
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list @da))
  ==
::  state-11: mentions store [msg-id author] pairs
::
+$  state-11
  $:  %11
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
  ==
::  state-12: auto-connect to distributor moon
::
+$  state-12
  $:  %12
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
  ==
::  state-13: fix mutual pal exchange with distributor
::
+$  state-13
  $:  %13
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
  ==
::  state-14: adds voice/video calling (note-scoped calls)
::
+$  state-14
  $:  %14
      notes=(map @ta note-4)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
  ==
+$  state-15
  $:  %15
      notes=(map @ta note-17)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
  ==
+$  state-16
  $:  %16
      notes=(map @ta note-17)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
      cover-envelopes=(map @da envelope-16)
  ==
+$  state-17
  $:  %17
      notes=(map @ta note-17)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
      cover-envelopes=(map @da envelope:noltbook)
  ==
+$  state-18
  $:  %18
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-18))
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
  ==
+$  state-19
  $:  %19
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
      mentions=(map @ta (list [id=@da author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
      seq-counters=(map [@p @ta] @ud)
  ==
+$  card  card:agent:gall
::
++  gossip-cap  100
++  cap-envs
  |=  envs=(map @da envelope:noltbook)
  ^-  (map @da envelope:noltbook)
  ?:  (lte ~(wyt by envs) gossip-cap)  envs
  ::  group envelopes into threads by reply-to root
  =/  threads=(map @da (list [@da envelope:noltbook]))
    %-  ~(rep by envs)
    |=  [[k=@da v=envelope:noltbook] acc=(map @da (list [@da envelope:noltbook]))]
    =/  root=@da  (fall reply-to.v k)
    (~(put by acc) root [[k v] (fall (~(get by acc) root) ~)])
  ::  rank threads by most recent activity descending
  =/  ranked=(list [latest=@da thread=(list [@da envelope:noltbook])])
    %+  sort
      %+  turn  ~(tap by threads)
      |=  [root=@da msgs=(list [@da envelope:noltbook])]
      :_  msgs
      %+  roll  msgs
      |=  [[* e=envelope:noltbook] best=@da]
      ?:((gth timestamp.e best) timestamp.e best)
    |=  [a=[@ *] b=[@ *]]
    (gth -.a -.b)
  ::  keep whole threads until we reach cap
  =/  result=(map @da envelope:noltbook)  ~
  =/  count=@ud  0
  |-
  ?~  ranked  result
  ?:  (gte count gossip-cap)  result
  %=  $
    ranked  t.ranked
    count   (add count (lent thread.i.ranked))
    result  (~(uni by result) (malt thread.i.ranked))
  ==
::
++  cap-msgs
  |=  [msgs=(list message:noltbook) is-gossip=?]
  ^-  (list message:noltbook)
  ?.  is-gossip  msgs
  ?:  (lte (lent msgs) gossip-cap)  msgs
  (slag (sub (lent msgs) gossip-cap) msgs)
::
++  upgrade-8-to-9
  |=  s=state-8
  ^-  state-9
  =/  new-msgs=(map @ta (list message-18))
    %-  ~(run by messages.s)
    |=  ml=(list message-legacy)
    ^-  (list message-18)
    %+  turn  ml
    |=  m=message-legacy
    ^-  message-18
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
++  upgrade-9-to-10
  |=  s=state-9
  ^-  state-10
  :*  %10
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  ~
  ==
++  upgrade-10-to-11
  |=  s=state-10
  ^-  state-11
  :*  %11
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  ~
  ==
++  upgrade-11-to-12
  |=  s=state-11
  ^-  state-12
  :*  %12
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s
  ==
++  upgrade-12-to-13
  |=  s=state-12
  ^-  state-13
  :*  %13
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s
  ==
++  upgrade-13-to-14
  |=  s=state-13
  ^-  state-14
  :*  %14
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s
      *(map @ta call-info:noltbook)
  ==
++  upgrade-14-to-15
  |=  s=state-14
  ^-  state-15
  =/  new-notes=(map @ta note-17)
    %-  ~(run by notes.s)
    |=  n=note-4
    ^-  note-17
    [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n visibility.n icon-url.n writable.n ~]
  :*  %15
      new-notes  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
  ==
++  upgrade-15-to-16
  |=  s=state-15
  ^-  state-16
  :*  %16
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      *(map @da envelope-16)
  ==
::  upgrade-16-to-17: convert old envelopes, add content-hash=*@uv
::  NOTE: remote plaintext stripping requires our.bowl — done in on-load
++  upgrade-16-to-17
  |=  s=state-16
  ^-  state-17
  =/  new-envs=(map @da envelope:noltbook)
    %-  ~(run by cover-envelopes.s)
    |=  e=envelope-16
    ^-  envelope:noltbook
    [author.e msg-id.e timestamp.e reply-to.e *@uv]
  :*  %17
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      new-envs
  ==
++  upgrade-17-to-18
  |=  s=state-17
  ^-  state-18
  =/  new-notes=(map @ta note:noltbook)
    %-  ~(run by notes.s)
    |=  n=note-17
    ^-  note:noltbook
    [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n visibility.n icon-url.n writable.n removed.n ~]
  =/  new-gossip-envs=(map @ta (map @da envelope:noltbook))
    ?:  =(cover-envelopes.s ~)  ~
    (~(put by *(map @ta (map @da envelope:noltbook))) %cover cover-envelopes.s)
  :*  %18
      new-notes  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      new-gossip-envs  ~
  ==
::  upgrade-18-to-19: add meta=(unit entry-meta) to messages, add seq-counters
++  upgrade-18-to-19
  |=  s=state-18
  ^-  state-19
  =/  new-msgs=(map @ta (list message:noltbook))
    %-  ~(run by messages.s)
    |=  msgs=(list message-18)
    ^-  (list message:noltbook)
    %+  turn  msgs
    |=  m=message-18
    ^-  message:noltbook
    [id.m note-id.m author.m text.m timestamp.m reply-to.m edited.m ~]
  :*  %19
      notes.s  new-msgs  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      *(map [@p @ta] @ud)
  ==
::  mention detection: check if text contains @~our
++  has-our-mention
  |=  [txt=@t us=@p]
  ^-  ?
  =/  needle=tape  (weld "@" (trip (scot %p us)))
  =/  hay=tape  (trip txt)
  !=(~ (find needle hay))
::
::  root-uniqueness helpers
::  find-root: first non-cover root note whose users AND type match
++  find-root
  |=  [nmap=(map @ta note:noltbook) us=(set @p) ty=note-type:noltbook]
  ^-  (unit note:noltbook)
  =/  hits=(list note:noltbook)
    %+  skim  ~(val by nmap)
    |=  n=note:noltbook
    &(?=(~ parent.n) =(users.n us) =(type.n ty) !=(%cover type.n) !=(%gossip type.n))
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
=|  state-19
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init
  ^-  (quip card _this)
  =/  bind=card
    [%pass /eyre-bind %arvo %e %connect [~ /apps/noltbook] %noltbook]
  =/  cover=note:noltbook  [%cover 'ARS NOTORIA' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~ ~]
  =/  rumors=note:noltbook  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~ ~]
  ::  subscribe to distributor moon for peer discovery
  =/  distro=@p  ~racmud-mipmet-disden-talhes
  =/  distro-card=card
    [%pass /ars/(scot %p distro) %agent [distro %noltbook] %watch /notes/cover]
  =/  hey-card=card
    [%pass /pal-hey/(scot %p distro) %agent [distro %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
  :_  this(notes (~(put by (~(put by notes) %cover cover)) %ars-rumors rumors), messages (~(put by (~(put by messages) %cover *(list message:noltbook))) %ars-rumors *(list message:noltbook)), peers (sy ~[distro]), pal-outgoing (sy ~[distro]))
  ~[bind distro-card hey-card]
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  ?:  ?=([%19 *] q.old)
    =/  loaded  !<(state-19 old)
    ::  fix: ensure cover note exists and is keyed as %cover
    =/  loaded
      ?:  (~(has by notes.loaded) %cover)  loaded
      =/  cover-hit=(unit [id=@ta n=note:noltbook])
        %-  ~(rep by notes.loaded)
        |=  [[k=@ta v=note:noltbook] out=(unit [id=@ta n=note:noltbook])]
        ?^  out  out
        ?.  |(=(type.v %cover) =(type.v %gossip))  out
        ?:  =(k %ars-rumors)  out
        `[k v]
      ?~  cover-hit
        ~&  [%creating-missing-cover our=our.bowl]
        =/  cover=note:noltbook  [%cover 'ARS NOTORIA' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~ ~]
        loaded(notes (~(put by notes.loaded) %cover cover), messages (~(put by messages.loaded) %cover (fall (~(get by messages.loaded) %cover) ~)))
      ~&  [%fixing-cover-id from=id.u.cover-hit]
      =/  old-id=@ta  id.u.cover-hit
      =/  fixed=note:noltbook  n.u.cover-hit(id %cover)
      =/  new-notes  (~(put by (~(del by notes.loaded) old-id)) %cover fixed)
      =/  old-msgs=(list message:noltbook)  (fall (~(get by messages.loaded) old-id) ~)
      =/  new-msgs  (~(put by (~(del by messages.loaded) old-id)) %cover old-msgs)
      loaded(notes new-notes, messages new-msgs)
    ::  ensure ars-rumors note exists
    =/  loaded
      ?:  (~(has by notes.loaded) %ars-rumors)  loaded
      ~&  [%creating-missing-rumors our=our.bowl]
      =/  rumors=note:noltbook  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~ ~]
      loaded(notes (~(put by notes.loaded) %ars-rumors rumors), messages (~(put by messages.loaded) %ars-rumors (fall (~(get by messages.loaded) %ars-rumors) ~)))
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%18 *] q.old)
    =/  s18  !<(state-18 old)
    =/  loaded  (upgrade-18-to-19 s18)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%17 *] q.old)
    =/  s17  !<(state-17 old)
    ::  fix: ensure cover note exists and is keyed as %cover (note-17 shape)
    =/  s17
      ?:  (~(has by notes.s17) %cover)  s17
      =/  cover-hit=(unit [id=@ta n=note-17])
        %-  ~(rep by notes.s17)
        |=  [[k=@ta v=note-17] out=(unit [id=@ta n=note-17])]
        ?^  out  out
        ?.  |(=(type.v %cover) =(type.v %gossip))  out
        ?:  =(k %ars-rumors)  out
        `[k v]
      ?~  cover-hit
        ~&  [%creating-missing-cover our=our.bowl]
        =/  cover=note-17  [%cover 'ARS NOTORIA' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
        s17(notes (~(put by notes.s17) %cover cover), messages (~(put by messages.s17) %cover (fall (~(get by messages.s17) %cover) ~)))
      ~&  [%fixing-cover-id from=id.u.cover-hit]
      =/  old-id=@ta  id.u.cover-hit
      =/  fixed=note-17  n.u.cover-hit(id %cover)
      =/  new-notes  (~(put by (~(del by notes.s17) old-id)) %cover fixed)
      =/  old-msgs=(list message-18)  (fall (~(get by messages.s17) old-id) ~)
      =/  new-msgs  (~(put by (~(del by messages.s17) old-id)) %cover old-msgs)
      s17(notes new-notes, messages new-msgs)
    ::  ensure ars-rumors note exists
    =/  s17
      ?:  (~(has by notes.s17) %ars-rumors)  s17
      ~&  [%creating-missing-rumors our=our.bowl]
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s17(notes (~(put by notes.s17) %ars-rumors rumors), messages (~(put by messages.s17) %ars-rumors (fall (~(get by messages.s17) %ars-rumors) ~)))
    ::  upgrade 17 → 18 → 19
    =/  s18  (upgrade-17-to-18 s17)
    =/  loaded  (upgrade-18-to-19 s18)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%16 *] q.old)
    =/  s16  !<(state-16 old)
    =/  s17  (upgrade-16-to-17 s16)
    ::  strip remote cover plaintext — keep only own-authored messages
    =/  cover-msgs=(list message-18)  (fall (~(get by messages.s17) %cover) ~)
    =/  own-msgs=(list message-18)
      (skim cover-msgs |=(m=message-18 =(author.m our.bowl)))
    =/  remote-msgs=(list message-18)
      (skip cover-msgs |=(m=message-18 =(author.m our.bowl)))
    =/  remote-envs=(map @da envelope:noltbook)
      %-  ~(gas by *(map @da envelope:noltbook))
      %+  turn  remote-msgs
      |=  m=message-18
      [id.m [author.m id.m timestamp.m reply-to.m (sham text.m)]]
    =/  merged-envs=(map @da envelope:noltbook)
      (~(uni by cover-envelopes.s17) remote-envs)
    =/  s17=state-17
      s17(messages (~(put by messages.s17) %cover own-msgs), cover-envelopes merged-envs)
    ~&  [%migrated-cover-to-ref-only our=our.bowl own-count=(lent own-msgs) env-count=~(wyt by merged-envs)]
    ::  fix: ensure cover note exists
    =/  s17
      ?:  (~(has by notes.s17) %cover)  s17
      =/  cover-hit=(unit [id=@ta n=note-17])
        %-  ~(rep by notes.s17)
        |=  [[k=@ta v=note-17] out=(unit [id=@ta n=note-17])]
        ?^  out  out
        ?.  |(=(type.v %cover) =(type.v %gossip))  out
        ?:  =(k %ars-rumors)  out
        `[k v]
      ?~  cover-hit
        ~&  [%creating-missing-cover our=our.bowl]
        =/  cover=note-17  [%cover 'ARS NOTORIA' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
        s17(notes (~(put by notes.s17) %cover cover), messages (~(put by messages.s17) %cover (fall (~(get by messages.s17) %cover) ~)))
      ~&  [%fixing-cover-id from=id.u.cover-hit]
      =/  old-id=@ta  id.u.cover-hit
      =/  fixed=note-17  n.u.cover-hit(id %cover)
      =/  new-notes  (~(put by (~(del by notes.s17) old-id)) %cover fixed)
      =/  old-msgs=(list message-18)  (fall (~(get by messages.s17) old-id) ~)
      =/  new-msgs  (~(put by (~(del by messages.s17) old-id)) %cover old-msgs)
      s17(notes new-notes, messages new-msgs)
    ::  ensure ars-rumors note exists
    =/  s17
      ?:  (~(has by notes.s17) %ars-rumors)  s17
      ~&  [%creating-missing-rumors our=our.bowl]
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s17(notes (~(put by notes.s17) %ars-rumors rumors), messages (~(put by messages.s17) %ars-rumors (fall (~(get by messages.s17) %ars-rumors) ~)))
    =/  loaded  (upgrade-18-to-19 (upgrade-17-to-18 s17))
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%15 *] q.old)
    =/  loaded  !<(state-15 old)
    =/  s16=state-16
      :*  %16
          notes.loaded  messages.loaded  artifacts.loaded  profiles.loaded
          transactions.loaded  current-note.loaded  peers.loaded  has-avatar.loaded
          pal-outgoing.loaded  pal-incoming.loaded  pal-blocked.loaded
          dial.loaded  gossip-hops.loaded  mentions.loaded  active-calls.loaded
          *(map @da envelope-16)
      ==
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 s16))))]
  ?:  ?=([%14 *] q.old)
    =/  loaded  !<(state-14 old)
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 loaded))))))
  ?:  ?=([%13 *] q.old)
    =/  loaded  !<(state-13 old)
    =/  s15  (upgrade-14-to-15 (upgrade-13-to-14 loaded))
    =/  s15  ?.  (~(has by notes.s15) %ars-rumors)
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s15(notes (~(put by notes.s15) %ars-rumors rumors), messages (~(put by messages.s15) %ars-rumors *(list message-18)))
    s15
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15)))))
  ::  state-12 → state-18
  ?:  ?=([%12 *] q.old)
    =/  s12  !<(state-12 old)
    =/  s15  (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 s12)))
    =/  distro=@p  ~racmud-mipmet-disden-talhes
    ::  ensure ars-rumors note exists
    =/  s15  ?.  (~(has by notes.s15) %ars-rumors)
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s15(notes (~(put by notes.s15) %ars-rumors rumors), messages (~(put by messages.s15) %ars-rumors *(list message-18)))
    s15
    =/  s19  (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15))))
    ::  if we are the moon: hey all peers so they add us to pal-incoming
    ?:  =(our.bowl distro)
      =/  hey-cards=(list card)
        %+  turn  ~(tap in peers.s19)
        |=  p=@p
        [%pass /pal-hey/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      :_  this(state s19(pal-outgoing (~(uni in pal-outgoing.s19) peers.s19)))
      hey-cards
    ::  if we are a regular ship: ensure distro connection + re-send hey
    =/  new-peers=(set @p)  (~(put in peers.s19) distro)
    =/  new-outgoing=(set @p)  (~(put in pal-outgoing.s19) distro)
    =/  cards=(list card)
      :~  [%pass /ars/(scot %p distro) %agent [distro %noltbook] %watch /notes/cover]
          [%pass /pal-hey/(scot %p distro) %agent [distro %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      ==
    :_  this(state s19(peers new-peers, pal-outgoing new-outgoing))
    cards
  ::  state-11 → state-19
  ?:  ?=([%11 *] q.old)
    =/  s11  !<(state-11 old)
    =/  s19  (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 s11))))))))
    =/  distro=@p  ~racmud-mipmet-disden-talhes
    ?:  =(our.bowl distro)  `this(state s19)
    =/  new-peers=(set @p)  (~(put in peers.s19) distro)
    =/  new-outgoing=(set @p)  (~(put in pal-outgoing.s19) distro)
    :_  this(state s19(peers new-peers, pal-outgoing new-outgoing))
    :~  [%pass /ars/(scot %p distro) %agent [distro %noltbook] %watch /notes/cover]
        [%pass /pal-hey/(scot %p distro) %agent [distro %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
    ==
  ::  state-10 → ... → state-19
  ?:  ?=([%10 *] q.old)
    =/  s10  !<(state-10 old)
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 s10))))))))))
  ::  state-9 → ... → state-19
  ?:  ?=([%9 *] q.old)
    =/  s9  !<(state-9 old)
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 s9)))))))))))
  ::  state-8 → ... → state-19
  ?:  ?=([%8 *] q.old)
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 !<(state-8 old)))))))))))))
  ::  state-7 → ... → state-19
  ?:  ?=([%7 *] q.old)
    =/  s7  !<(state-7 old)
    =/  s8=state-8
      [%8 notes.s7 messages.s7 artifacts.s7 profiles.s7 transactions.s7 current-note.s7 peers.s7 has-avatar.s7 pal-outgoing.s7 pal-incoming.s7 pal-blocked.s7 0 ~]
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
  ::  state-6 → ... → state-19
  ?:  ?=([%6 *] q.old)
    =/  s6  !<(state-6 old)
    =/  hey-cards=(list card)
      %+  turn  ~(tap in peers.s6)
      |=  p=@p
      [%pass /pal-hey/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
    =/  s8=state-8
      [%8 notes.s6 messages.s6 artifacts.s6 profiles.s6 transactions.s6 current-note.s6 peers.s6 has-avatar.s6 peers.s6 ~ ~ 0 ~]
    :_  this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
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
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
  ?:  ?=([%4 *] q.old)
    =/  s4  !<(state-4 old)
    =/  init-peers=(set @p)
      %-  ~(rep by notes.s4)
      |=  [[k=@ta v=note-4] acc=(set @p)]
      (~(uni in acc) users.v)
    =.  init-peers  (~(del in init-peers) our.bowl)
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s4)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 notes.s4 messages.s4 artifacts.s4 new-profiles transactions.s4 current-note.s4 init-peers %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
  ?:  ?=([%3 *] q.old)
    =/  s3  !<(state-3 old)
    =/  new-notes=(map @ta note-4)
      %-  ~(run by notes.s3)
      |=  n=note-3:noltbook
      ^-  note-4
      [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s3)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 new-notes messages.s3 artifacts.s3 new-profiles transactions.s3 current-note.s3 ~ %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
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
    =/  new-notes=(map @ta note-4)
      %-  ~(run by notes.s2)
      |=  n=note-3:noltbook
      ^-  note-4
      [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s2)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 new-notes messages.s2 new-arts new-profiles transactions.s2 current-note.s2 ~ %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
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
  =/  new-notes=(map @ta note-4)
    %-  ~(run by fixed-notes)
    |=  n=note-3:noltbook
    ^-  note-4
    [id.n name.n type.n creator.n users.n children.n parent.n last-author.n last-preview.n %secret ~ &]
  =/  s8=state-8
    [%8 new-notes messages.s1 new-arts new-profiles transactions.s1 current-note.s1 ~ %.n ~ ~ ~ 0 ~]
  `this(state (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))
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
    ::  send all current mention states
    =/  mention-cards=(list card)
      %+  turn  ~(tap by mentions)
      |=  [nid=@ta mns=(list [id=@da author=@p])]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%mention-update nid mns])]
    ::  send active call states
    =/  call-cards=(list card)
      %+  turn  ~(tap by active-calls)
      |=  [nid=@ta ci=call-info:noltbook]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%call-state nid ci])]
    =/  init-cards=(list card)
      :~  [%give %fact ~ %noltbook-update !>(upd)]
          [%give %fact ~ %noltbook-update !>(pupd)]
          [%give %fact ~ %noltbook-update !>(palupd)]
          [%give %fact ~ %noltbook-update !>(dialupd)]
      ==
    :_  this
    :(weld init-cards mention-cards call-cards)
  ::
      [%notes @ ~]
    =/  nid=@ta  i.t.path
    ::  permission check for remote subscribers
    ?>  ?|  =(src.bowl our.bowl)
            =(nid %cover)
            =(nid %ars-rumors)
            =/  note  (~(get by notes) nid)
            ?&  ?=(^ note)
                (~(has in users.u.note) src.bowl)
            ==
        ==
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    ::  gossip-style notes (cover + user gossip): own messages + envelopes
    =/  is-local=?  =(src.bowl our.bowl)
    =/  note-for-type  (~(get by notes) nid)
    =/  is-gossip-note=?  ?|  =(nid %cover)
                              ?&(?=(^ note-for-type) =(%gossip type.u.note-for-type))
                          ==
    =/  nenv=(map @da envelope:noltbook)
      (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
    =/  init-cards=(list card)
      ?.  is-gossip-note
        ::  non-gossip: always send full messages
        ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%message-list nid msgs arts])]]
      ?:  is-local
        ::  local frontend: own-authored messages + all envelopes for re-fetch
        =/  all-envs=(list envelope:noltbook)  ~(val by nenv)
        =/  env-cards=(list card)
          ?~  all-envs  ~
          ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%envelope-list nid all-envs])]]
        [[%give %fact ~ %noltbook-update !>(`update:noltbook`[%message-list nid msgs arts])] env-cards]
      ::  remote peer: send envelopes for everything (own msgs as envelopes too)
      =/  msg-envs=(list envelope:noltbook)
        (turn msgs |=(m=message:noltbook [author.m id.m timestamp.m reply-to.m (sham text.m)]))
      =/  all-env-ids=(set @da)  (sy (turn msg-envs |=(e=envelope:noltbook msg-id.e)))
      =/  extra-envs=(list envelope:noltbook)
        (skim ~(val by nenv) |=(e=envelope:noltbook !(~(has in all-env-ids) msg-id.e)))
      =/  all-envs=(list envelope:noltbook)  (weld msg-envs extra-envs)
      ?~  all-envs  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%envelope-list nid all-envs])]]
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
    ::  introduce new remote subscribers to all existing peers
    =/  is-new-remote=?  &(!=(src.bowl our.bowl) !(~(has in peers) src.bowl))
    =/  intro-cards=(list card)
      ?.  is-new-remote  ~
      =/  existing=(list @p)  ~(tap in peers)
      ::  tell each existing peer about the new ship
      =/  out-cards=(list card)
        %+  turn  existing
        |=  p=@p
        [%pass /introduce/(scot %p p)/(scot %p src.bowl) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-introduce src.bowl])]
      ::  tell the new ship about each existing peer
      =/  in-cards=(list card)
        %+  turn  existing
        |=  p=@p
        [%pass /introduce/(scot %p src.bowl)/(scot %p p) %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-introduce p])]
      (weld out-cards in-cards)
    ::  send hey back to new remote subscriber so they see us as pal
    =/  hey-back=(list card)
      ?.  is-new-remote  ~
      :~  [%pass /pal-hey/(scot %p src.bowl) %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      ==
    =/  new-peers=(set @p)
      ?.  is-new-remote  peers
      (~(put in peers) src.bowl)
    =/  new-outgoing=(set @p)
      ?.  is-new-remote  pal-outgoing
      (~(put in pal-outgoing) src.bowl)
    ::  send active call state for this note if one exists
    =/  call-cards=(list card)
      =/  ci  (~(get by active-calls) nid)
      ?~  ci  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%call-state nid u.ci])]]
    :_  this(peers new-peers, pal-outgoing new-outgoing)
    :(weld init-cards ~[[%give %fact ~ %noltbook-update !>(pupd)]] intro-cards hey-back call-cards)
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
      [%x %peers ~]
    =/  peer-list=(list @p)  ~(tap in peers)
    =/  out-list=(list @p)  ~(tap in pal-outgoing)
    ``[%noun !>([peer-list out-list])]
  ::
      [%x %note-ids ~]
    =/  ids=(list [@ta note-type:noltbook])
      %+  turn  ~(tap by notes)
      |=  [k=@ta v=note:noltbook]
      [k type.v]
    ``[%noun !>(ids)]
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
      ::  only creator can rename
      ?.  =(our.bowl creator.u.old)  `this
      =/  upd=update:noltbook  [%note-renamed id.act name.act]
      :_  this(notes (~(put by notes) id.act u.old(name name.act)))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %set-headline
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only creator can set headline
      ?.  =(our.bowl creator.u.old)  `this
      =/  hl=(unit @t)  ?:(=(%~ headline.act) ~ `headline.act)
      =/  new-note=note:noltbook  u.old(headline hl)
      =/  new-headlines=(map @ta @t)
        ?~  hl  (~(del by headlines) id.act)
        (~(put by headlines) id.act u.hl)
      =/  upd=update:noltbook  [%headline-updated id.act hl]
      :_  this(notes (~(put by notes) id.act new-note), headlines new-headlines)
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %delete-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only creator (host) can delete; shared notes use %leave-note
      ?.  =(our.bowl creator.u.old)  `this
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
        =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
        =/  new-note=note:noltbook
          :*  nid  name.act  %notebook  our.bowl  self-set  ~  ~  ~  ~  %secret  ~  &  ~  ~
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
        :*  nid  name.act  %notebook  creator.par  users.par  ~  `pid  ~  ~  %secret  ~  &  ~  ~
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
        %create-gossip-note
      =/  self-set=(set @p)  (sy ~[our.bowl])
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  hl=(unit @t)  ?:(=(%~ headline.act) ~ `headline.act)
      =/  new-note=note:noltbook
        :*  nid  name.act  %gossip  our.bowl  self-set  ~  ~  ~  ~  %secret  ~  &  ~  hl
        ==
      =/  upd=update:noltbook  [%note-created new-note]
      =/  new-headlines=(map @ta @t)
        ?~  hl  headlines
        (~(put by headlines) nid u.hl)
      ::  gossip note created locally only — distribute via share/invite
      :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), headlines new-headlines)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %send-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  compute entry-meta for regular notes (cover/gossip/rumors skip for now)
      =/  is-regular=?
        ?&  !=(%cover type.u.exists)
            !=(%gossip type.u.exists)
            !=(note-id.act %ars-rumors)
        ==
      =/  cur-seq=@ud  (fall (~(get by seq-counters) [our.bowl note-id.act]) 0)
      =/  nxt-seq=@ud  ?:(is-regular +(cur-seq) 0)
      =/  em=(unit entry-meta:noltbook)
        ?.  is-regular  ~
        `[(sham [our.bowl now.bowl nxt-seq]) nxt-seq 0 now.bowl now.bowl]
      =/  msg=message:noltbook
        :*  now.bowl  note-id.act  our.bowl  text.act  now.bowl  reply-to.act  %.n  em
        ==
      ::  ARS NOTORIA: store locally and gossip to all peers
      ?:  =(note-id.act %cover)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  own messages are hop 0 — author gets full content locally
        =/  upd=update:noltbook  [%gossip-message msg 0]
        ::  broadcast envelope (not full message) to peers
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act)]
        ~&  [%cover-send-gossip our=our.bowl pal-count=~(wyt in pal-outgoing) targets=~(tap in pal-outgoing)]
        =/  gossip=(list card)
          %+  turn  ~(tap in pal-outgoing)
          |=  p=@p
          ^-  card
          [%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars-ref env 0])]
        =/  env-upd=update:noltbook  [%gossip-envelope %cover env 0]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        :_  this(notes (~(put by notes) %cover upd-note), messages (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y)), gossip-hops (~(put by gossip-hops) id.msg 0))
        :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/cover] %noltbook-update !>(env-upd)]] gossip)
      ::  user-created gossip notes: same envelope model as cover
      ?:  =(%gossip type.u.exists)
        =/  nid=@ta  note-id.act
        =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
        =/  upd=update:noltbook  [%gossip-message msg 0]
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act)]
        =/  targets=(list @p)
          %+  skim  ~(tap in users.u.exists)
          |=(p=@p !=(p our.bowl))
        ~&  [%gossip-note-send our=our.bowl note=nid target-count=(lent targets)]
        =/  gossip=(list card)
          %+  turn  targets
          |=  p=@p
          ^-  card
          [%pass /gossip-out/(scot %p p)/[nid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-gossip-ref nid env 0])]
        =/  env-upd=update:noltbook  [%gossip-envelope nid env 0]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        =/  cenv=(map @da envelope:noltbook)
          (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
        :_  %=  this
              notes  (~(put by notes) nid upd-note)
              messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
              gossip-hops  (~(put by gossip-hops) id.msg 0)
            ==
        :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(env-upd)]] gossip)
      ::  RUMORS: anonymous gossip — strip author before relaying
      ?:  =(note-id.act %ars-rumors)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %ars-rumors) ~)
        ::  anonymize: strip author for everyone, including sender
        =/  anon-msg=message:noltbook  msg(author ~hosted)
        ::  content hash for dedup
        =/  chash=@uv  (sham text.msg)
        =/  upd=update:noltbook  [%rumor-message anon-msg]
        ::  proxy relay: 50% broadcast to all, 50% proxy through one random peer
        =/  targets=(list @p)  ~(tap in pal-outgoing)
        =/  gossip=(list card)
          ?:  =(0 (lent targets))  ~
          ?.  =(0 (~(rad og eny.bowl) 2))
            ::  broadcast to all peers
            %+  turn  targets
            |=  p=@p
            ^-  card
            [%pass /rum-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-rumor anon-msg 0])]
          ::  proxy through one random peer
          =/  proxy=@p  (snag (~(rad og +(eny.bowl)) (lent targets)) targets)
          ~[[%pass /rum-out/(scot %p proxy) %agent [proxy %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-rumor anon-msg 0])]]
        =/  upd-note=note:noltbook  u.exists(last-author ~, last-preview `text.act)
        :_  this(notes (~(put by notes) %ars-rumors upd-note), messages (~(put by messages) %ars-rumors (snoc cur anon-msg)), gossip-hops (~(put by gossip-hops) `@da`chash 0))
        [[%give %fact ~[/notes/ars-rumors] %noltbook-update !>(upd)] gossip]
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-fwd/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message note-id.act msg])]]
      ::  local note: store and fan out
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%new-message msg]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      =/  new-seq-counters=(map [@p @ta] @ud)
        ?:(is-regular (~(put by seq-counters) [our.bowl note-id.act] nxt-seq) seq-counters)
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters new-seq-counters)
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
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
        `[now.bowl note-id.act our.bowl txt now.bowl ~ %.n ~]
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
      ::  gossip: any member can invite; others: creator only
      ?.  ?|  =(our.bowl creator.u.old)
              &(=(%gossip type.u.old) (~(has in users.u.old) our.bowl))
          ==
        `this
      ::  compute new user set
      =/  new-users=(set @p)  (~(put in users.u.old) ship.act)
      ::  dedup: only for DMs — one DM root per user pair
      =/  dup-id=(unit @ta)
        ?.  &(=(%dm type.u.old) =(~(wyt in new-users) 2))
          ~
        %-  ~(rep by notes)
        |=  [[k=@ta v=note:noltbook] acc=(unit @ta)]
        ?^  acc  acc
        ?:  ?&  ?=(~ parent.v)
                =(%dm type.v)
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
      ::  promote dm → group if adding 3rd+ user
      =/  new-type=note-type:noltbook
        ?:  &(=(%dm type.u.old) (gth ~(wyt in new-users) 2))  %group
        type.u.old
      =/  new-removed=(set @p)  (~(del in removed.u.old) ship.act)
      =/  new-note=note:noltbook  u.old(users new-users, type new-type, removed new-removed)
      ::  poke remote ship with invite (gossip notes use gossip-invite with headline)
      =/  poke-card=card
        ?:  =(%gossip type.u.old)
          =/  hl=(unit @t)  (~(get by headlines) id.act)
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.u.old our.bowl users.new-note hl]
          [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
        =/  rem=remote:noltbook  [%remote-invite id.act name.u.old new-type our.bowl users.new-note visibility.u.old]
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
      ::  broadcast to peers so they can resolve our @p to PKH
      =/  peer-cards=(list card)
        %+  turn  ~(tap in peers)
        |=  p=@p
        ^-  card
        [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      :_  this(profiles (~(put by profiles) our.bowl prof))
      [[%give %fact ~[/notes] %noltbook-update !>(upd)] peer-cards]
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
      ::  add to outgoing, send %remote-hey + our profile
      =/  new-outgoing=(set @p)  (~(put in pal-outgoing) ship.act)
      =/  hey-card=card
        [%pass /pal-hey/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  prof-card=card
        [%pass /prof-out/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %mutual
        %requesting
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-outgoing new-outgoing, pal-blocked new-blocked)
      [hey-card prof-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~]
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
      ::  always send bye so remote clears us from pal-incoming
      =/  bye-cards=(list card)
        ~[[%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]]
      =/  upd=update:noltbook  [%pal-update ship.act %blocked]
      ::  remove blocked ship from all hosted group notes + notify them
      =/  removal-result=[new-notes=(map @ta note:noltbook) cards=(list card)]
        =/  nn=(map @ta note:noltbook)  notes
        =/  cc=(list card)  ~
        %-  ~(rep by notes)
        |=  [[nid=@ta n=note:noltbook] acc=[nn=(map @ta note:noltbook) cc=(list card)]]
        ?.  =(our.bowl creator.n)  acc
        ?.  (~(has in users.n) ship.act)  acc
        =/  new-users=(set @p)  (~(del in users.n) ship.act)
        =/  upd-note=note:noltbook  n(users new-users)
        =/  users-upd=update:noltbook  [%note-users-updated nid ~(tap in new-users) ~(tap in removed.n)]
        =/  kick-card=card
          [%pass /kick/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick nid name.n])]
        [nn=(~(put by nn.acc) nid upd-note) cc=[kick-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] cc.acc]]
      :_  this(notes new-notes.removal-result, pal-outgoing new-outgoing, pal-incoming new-incoming, pal-blocked new-blocked)
      :(weld [[%give %fact ~[/notes] %noltbook-update !>(upd)] ~] bye-cards cards.removal-result)
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
        %clear-mentions
      ::  clear all unread mentions for a note
      =.  mentions  (~(del by mentions) note-id.act)
      `this
    ::
        %clear-mention
      ::  clear a single mention by msg-id (compare at ms precision
      ::  since JSON round-trip truncates sub-ms from @da)
      =/  ms-unit=@  (div ~s1 1.000)
      =/  target-ms=@ud  (div (sub msg-id.act ~1970.1.1) ms-unit)
      =/  cur=(list [id=@da author=@p])  (fall (~(get by mentions) note-id.act) ~)
      =/  new=(list [id=@da author=@p])
        %+  skip  cur
        |=  [id=@da author=@p]
        =(target-ms (div (sub id ~1970.1.1) ms-unit))
      =.  mentions
        ?~  new  (~(del by mentions) note-id.act)
        (~(put by mentions) note-id.act new)
      `this
    ::
        %set-dial
      ::  clamp dial to 0-3
      =/  new-dial=@ud  (min dial.act 3)
      =/  upd=update:noltbook  [%dial-update new-dial]
      :_  this(dial new-dial)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %reparent-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      =/  par  (~(get by notes) new-parent.act)
      ?~  par  `this
      ::  only creator can reparent; parent must be root
      ?.  =(our.bowl creator.u.old)  `this
      ::  remove from old parent's children if it had one
      =/  n1=(map @ta note:noltbook)
        ?~  parent.u.old  notes
        =/  op  (~(get by notes) u.parent.u.old)
        ?~  op  notes
        (~(put by notes) u.parent.u.old u.op(children (skim children.u.op |=(c=@ta !=(c id.act)))))
      ::  update child: set parent, inherit users from new parent
      =/  moved=note:noltbook  u.old(parent `new-parent.act, users users.u.par, creator creator.u.par)
      =/  n2=(map @ta note:noltbook)  (~(put by n1) id.act moved)
      ::  add to new parent's children
      =/  new-par=note:noltbook  u.par(children (snoc children.u.par id.act))
      =/  n3=(map @ta note:noltbook)  (~(put by n2) new-parent.act new-par)
      =/  upd=update:noltbook  [%note-created moved]
      =/  is-shared=?  (gth ~(wyt in users.u.par) 1)
      =/  broadcast=(list card)
        ?.  is-shared  ~
        %+  murn  ~(tap in users.u.par)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /child-out/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-child-note new-parent.act moved])]
      :_  this(notes n3, messages (~(put by messages) id.act (fall (~(get by messages) id.act) ~)))
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] broadcast)
    ::
        %remove-member
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only host can remove members
      ?.  =(our.bowl creator.u.old)  `this
      ::  can't remove yourself
      ?:  =(ship.act our.bowl)  `this
      ::  must be a current member
      ?.  (~(has in users.u.old) ship.act)  `this
      =/  new-users=(set @p)  (~(del in users.u.old) ship.act)
      =/  new-removed=(set @p)  (~(put in removed.u.old) ship.act)
      =/  upd-note=note:noltbook  u.old(users new-users, removed new-removed)
      ::  send kick to removed ship
      =/  kick-card=card
        [%pass /kick/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick id.act name.u.old])]
      ::  inject system message
      =/  sys-text=@t  (crip (weld (trip (scot %p ship.act)) " removed from note"))
      =/  sys-msg=message:noltbook  [now.bowl id.act our.bowl sys-text now.bowl ~ %.n ~]
      =/  old-msgs=(list message:noltbook)  (fall (~(get by messages) id.act) ~)
      =/  new-msgs=(list message:noltbook)  (snoc old-msgs sys-msg)
      =/  users-upd=update:noltbook  [%note-users-updated id.act ~(tap in new-users) ~(tap in new-removed)]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      :_  this(notes (~(put by notes) id.act upd-note), messages (~(put by messages) id.act new-msgs))
      :~  kick-card
          [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes] %noltbook-update !>(msg-upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(msg-upd)]
      ==
    ::
        %leave-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?:  =(%cover id.u.old)  `this
      =/  is-host=?  =(our.bowl creator.u.old)
      =/  user-count  ~(wyt in users.u.old)
      ::  sole user: act like delete
      ?:  (lte user-count 1)
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
        =/  upd=update:noltbook  [%note-deleted id.act]
        :_  this(notes (~(del by trimmed) id.act), messages (~(del by messages) id.act))
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  host leaving shared note: drop locally (orphans note for others until handoff)
      ?:  is-host
        =/  upd=update:noltbook  [%note-deleted id.act]
        :_  this(notes (~(del by notes) id.act), messages (~(del by messages) id.act))
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
        :*  nid  (scot %p ship.act)  %dm  our.bowl  target-users  ~  ~  ~  ~  %secret  ~  &  ~  ~
        ==
      =/  rem=remote:noltbook  [%remote-invite nid name.new-note %dm our.bowl target-users %secret]
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
    ::
    ::  ===== CALL ACTIONS =====
    ::
        %start-call
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  if stale call exists (0 participants), clean it up; if active, no-op
      =/  old-call  (~(get by active-calls) note-id.act)
      ?:  ?&  ?=(^ old-call)
              (gth ~(wyt in participants.u.old-call) 0)
          ==
        `this
      ::  non-creator: ask host to start the call, then join
      ?.  =(our.bowl creator.u.exists)
        :_  this
        :~  [%pass /call-start/(scot %p creator.u.exists)/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-start note-id.act (crip (weld "call-" (trip (scot %da now.bowl)))) our.bowl])]
        ==
      ::  we are the creator: create call locally and broadcast
      =/  cid=@ta  (crip (weld "call-" (trip (scot %da now.bowl))))
      =/  ci=call-info:noltbook
        [cid note-id.act our.bowl now.bowl (sy ~[our.bowl]) %active]
      ::  record call-started system message
      =/  sys-msg=message:noltbook
        [now.bowl note-id.act our.bowl (crip (weld "\01SYS:call-started:" (trip (scot %p our.bowl)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%call-started note-id.act cid our.bowl ~[our.bowl]]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      =/  pax=path  ~[%notes note-id.act]
      ::  notify all other note members
      =/  broadcast=(list card)
        %+  murn  ~(tap in users.u.exists)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /call-start/(scot %p p)/[note-id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-start note-id.act cid our.bowl])]
      :_  this(active-calls (~(put by active-calls) note-id.act ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]] broadcast)
    ::
        %join-call
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.act)
      ?~  ci  `this
      ?:  (~(has in participants.u.ci) our.bowl)  `this
      =/  new-ci=call-info:noltbook  u.ci(participants (~(put in participants.u.ci) our.bowl))
      =/  sys-msg=message:noltbook
        [now.bowl note-id.act our.bowl (crip (weld "\01SYS:call-joined:" (trip (scot %p our.bowl)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%call-joined note-id.act our.bowl]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      =/  pax=path  ~[%notes note-id.act]
      ::  notify: if creator, tell existing participants directly;
      ::  if non-creator, tell the host who relays
      =/  broadcast=(list card)
        ?:  =(our.bowl creator.u.exists)
          %+  murn  ~(tap in participants.u.ci)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /call-join-relay/(scot %p p)/[note-id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-join note-id.act our.bowl])]
        ~[[%pass /call-join/(scot %p creator.u.exists)/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-join note-id.act our.bowl])]]
      :_  this(active-calls (~(put by active-calls) note-id.act new-ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]] broadcast)
    ::
        %leave-call
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.act)
      ?~  ci  `this
      ?.  (~(has in participants.u.ci) our.bowl)  `this
      =/  new-parts=(set @p)  (~(del in participants.u.ci) our.bowl)
      =/  sys-msg=message:noltbook
        [now.bowl note-id.act our.bowl (crip (weld "\01SYS:call-left:" (trip (scot %p our.bowl)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  pax=path  ~[%notes note-id.act]
      ::  if last participant, end call
      ?:  =(0 ~(wyt in new-parts))
        =/  end-upd=update:noltbook  [%call-ended note-id.act call-id.u.ci]
        =/  end-msg=message:noltbook
          [now.bowl note-id.act our.bowl '\01SYS:call-ended' now.bowl ~ %.n ~]
        ::  broadcast call-ended to all note members (not just host)
        =/  broadcast=(list card)
          %+  murn  ~(tap in users.u.exists)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /call-end/(scot %p p)/[note-id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-ended note-id.act])]
        :_  this(active-calls (~(del by active-calls) note-id.act), messages (~(put by messages) note-id.act (snoc (snoc cur sys-msg) end-msg)))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(end-upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(end-upd)]] broadcast)
      ::  not last: just leave
      =/  new-ci=call-info:noltbook  u.ci(participants new-parts)
      =/  upd=update:noltbook  [%call-left note-id.act our.bowl]
      ::  if creator, notify remaining participants directly;
      ::  if non-creator, tell the host who relays
      =/  broadcast=(list card)
        ?:  =(our.bowl creator.u.exists)
          %+  murn  ~(tap in new-parts)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /call-leave-relay/(scot %p p)/[note-id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-leave note-id.act our.bowl])]
        ~[[%pass /call-leave/(scot %p creator.u.exists)/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-leave note-id.act our.bowl])]]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      :_  this(active-calls (~(put by active-calls) note-id.act new-ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]] broadcast)
    ::
        %call-signal
      ::  relay WebRTC signal to target peer
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.act)
      ?~  ci  `this
      ::  send signal directly to target peer
      :_  this
      ~[[%pass /call-sig/(scot %p to.act)/[note-id.act] %agent [to.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-signal call-id.u.ci our.bowl sig-type.act payload.act])]]
    ::
        %clear-calls
      ::  purge all active calls locally, notify frontend
      =/  end-cards=(list card)
        %+  turn  ~(tap by active-calls)
        |=  [nid=@ta ci=call-info:noltbook]
        [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%call-ended nid call-id.ci])]
      :_  this(active-calls *(map @ta call-info:noltbook))
      end-cards
    ::
        %fetch-cover-msg
      ::  fetch full content of a gossip/cover message from its author
      =/  nid=@ta  note-id.act
      =/  note-exists  (~(get by notes) nid)
      ?~  note-exists  `this
      ::  gossip notes use gossip-specific remote; cover uses legacy path
      :_  this
      ?:  =(%gossip type.u.note-exists)
        :~  [%pass /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) %agent [author.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fetch-gossip-msg nid our.bowl msg-id.act])]
        ==
      :~  [%pass /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) %agent [author.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fetch-cover-msg our.bowl msg-id.act])]
      ==
    ==
  ::
      %noltbook-remote
    =/  rem  !<(remote:noltbook vase)
    ?-  -.rem
    ::
        %remote-invite
      ::  someone invited us to their note
      ::  reject invites from blocked ships
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  new-note=note:noltbook
        [note-id.rem name.rem type.rem creator.rem users.rem ~ ~ ~ ~ visibility.rem ~ & ~ ~]
      ::  root-uniqueness: only dedup DMs (one DM per user pair)
      =/  dup
        ?.  =(%dm type.rem)  ~
        ?:(|(=(note-id.rem %cover) =(%gossip type.rem)) ~ (find-root notes users.rem type.rem))
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
        %remote-gossip-invite
      ::  someone invited us to their gossip note (with headline)
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  hl  headline.rem
      =/  new-note=note:noltbook
        [note-id.rem name.rem %gossip creator.rem users.rem ~ ~ ~ ~ %secret ~ & ~ hl]
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
      =/  new-headlines=(map @ta @t)
        ?~  hl  headlines
        (~(put by headlines) note-id.rem u.hl)
      :_  %=  this
            notes  (~(put by notes) note-id.rem new-note)
            messages  (~(put by messages) note-id.rem ~)
            peers  new-peers
            pal-outgoing  new-outgoing
            headlines  new-headlines
          ==
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ::
        %remote-message
      ::  a remote user sent a message to a note we host
      ::  reject if sender is blocked
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  reject if sender was removed from note
      ?:  (~(has in removed.u.old) src.bowl)  `this
      ::  verify: we must be creator, sender must be in users
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%new-message msg.rem]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      ::  mention detection: check if @~our appears in message text
      =/  mentioned=?  (has-our-mention text.msg.rem our.bowl)
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update note-id.rem ~[[id.msg.rem author.msg.rem]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) note-id.rem) ~)
        (~(put by mentions) note-id.rem (snoc cur-m [id.msg.rem author.msg.rem]))
      :_  this(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur msg.rem)), mentions new-mentions)
      :*  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          mention-cards
      ==
    ::
        %remote-ars
      ::  ARS NOTORIA gossip from a peer (legacy full-message path)
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ?:  (lien cur |=(m=message:noltbook =(id.m id.msg.rem)))
        `this
      ?:  (~(has by cenv) id.msg.rem)
        `this
      =/  my-hops=@ud  (add hops.rem 1)
      =/  mentioned=?  &(!=(author.msg.rem our.bowl) (has-our-mention text.msg.rem our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update %cover ~[[id.msg.rem author.msg.rem]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg.rem author.msg.rem]))
      =/  env=envelope:noltbook  [author.msg.rem id.msg.rem timestamp.msg.rem reply-to.msg.rem (sham text.msg.rem)]
      =/  relay=(list card)
        %+  murn  ~(tap in pal-outgoing)
        |=  p=@p
        ?:  =(p src.bowl)  ~
        ?:  =(p author.msg.rem)  ~
        `[%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars-ref env my-hops])]
      ?:  =(author.msg.rem our.bowl)
        =/  upd=update:noltbook  [%gossip-message msg.rem my-hops]
        :_  this(messages (~(put by messages) %cover (cap-msgs (snoc cur msg.rem) %.y)), gossip-hops (~(put by gossip-hops) id.msg.rem my-hops), mentions new-mentions)
        :(weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(upd)]] relay mention-cards)
      =/  env-upd=update:noltbook  [%gossip-envelope %cover env my-hops]
      =/  content-upd=update:noltbook  [%cover-msg-content %cover msg.rem]
      :_  this(gossip-envelopes (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) id.msg.rem env))), gossip-hops (~(put by gossip-hops) id.msg.rem my-hops), mentions new-mentions)
      :(weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(env-upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(content-upd)]] relay mention-cards)
    ::
        %remote-ars-ref
      ::  ARS NOTORIA envelope gossip from a peer
      =/  env  env.rem
      ~&  [%ars-ref-received our=our.bowl from=src.bowl author=author.env]
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      ?:  (~(has by cenv) msg-id.env)
        ~&  [%ars-ref-dedup-envelope msg-id=msg-id.env]
        `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ?:  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))
        `this
      =/  my-hops=@ud  (add hops.rem 1)
      =/  upd=update:noltbook  [%gossip-envelope %cover env my-hops]
      =/  relay=(list card)
        %+  murn  ~(tap in pal-outgoing)
        |=  p=@p
        ?:  =(p src.bowl)  ~
        ?:  =(p author.env)  ~
        `[%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars-ref env my-hops])]
      :_  this(gossip-envelopes (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops))
      [[%give %fact ~[/notes/cover] %noltbook-update !>(upd)] relay]
    ::
        %remote-fetch-cover-msg
      ::  someone is requesting a cover message we authored
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      =/  target-ms=@ud  (div (sub msg-id.rem ~1970.1.1) (div ~s1 1.000))
      =/  found=(list message:noltbook)
        (skim cur |=(m=message:noltbook &(=((div (sub id.m ~1970.1.1) (div ~s1 1.000)) target-ms) =(author.m our.bowl))))
      ?~  found  `this
      :_  this
      :~  [%pass /msg-reply/(scot %p requester.rem)/(scot %da msg-id.rem) %agent [requester.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-cover-msg-reply requester.rem i.found])]
      ==
    ::
        %remote-cover-msg-reply
      ::  author replied with full message content — ephemeral forward only
      ?.  =(requester.rem our.bowl)  `this
      =/  msg  msg.rem
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
        `this
      =/  env  (~(get by cenv) id.msg)
      ?~  env
        ~&  [%cover-msg-reply-no-envelope id=id.msg]
        `this
      ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
        ~&  [%cover-msg-hash-mismatch id=id.msg expected=content-hash.u.env got=(sham text.msg)]
        `this
      =/  new-envs=(map @ta (map @da envelope:noltbook))
        ?:  =(content-hash.u.env *@uv)
          (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) id.msg u.env(content-hash (sham text.msg)))))
        gossip-envelopes
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update %cover ~[[id.msg author.msg]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg author.msg]))
      =/  upd=update:noltbook  [%cover-msg-content %cover msg]
      :_  this(gossip-envelopes new-envs, mentions new-mentions)
      (weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] mention-cards)
    ::
        %remote-gossip-ref
      ::  gossip envelope from a note user
      =/  nid=@ta  note-id.rem
      =/  note  (~(get by notes) nid)
      ?~  note  `this
      ?.  =(%gossip type.u.note)  `this
      ?.  (~(has in users.u.note) src.bowl)  `this
      =/  env  env.rem
      =/  nenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
      ?:  (~(has by nenv) msg-id.env)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      ?:  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))  `this
      =/  my-hops=@ud  (add hops.rem 1)
      =/  upd=update:noltbook  [%gossip-envelope nid env my-hops]
      ::  relay to other note users (excluding sender and author)
      =/  relay=(list card)
        %+  murn  ~(tap in users.u.note)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        ?:  =(p src.bowl)  ~
        ?:  =(p author.env)  ~
        `[%pass /gossip-out/(scot %p p)/[nid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-gossip-ref nid env my-hops])]
      :_  this(gossip-envelopes (~(put by gossip-envelopes) nid (cap-envs (~(put by nenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops))
      [[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)] relay]
    ::
        %remote-fetch-gossip-msg
      ::  someone requests a gossip message we authored
      =/  nid=@ta  note-id.rem
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      =/  target-ms=@ud  (div (sub msg-id.rem ~1970.1.1) (div ~s1 1.000))
      =/  found=(list message:noltbook)
        (skim cur |=(m=message:noltbook &(=((div (sub id.m ~1970.1.1) (div ~s1 1.000)) target-ms) =(author.m our.bowl))))
      ?~  found  `this
      :_  this
      :~  [%pass /msg-reply/(scot %p requester.rem)/(scot %da msg-id.rem) %agent [requester.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-gossip-msg-reply nid requester.rem i.found])]
      ==
    ::
        %remote-gossip-msg-reply
      ::  author replied with gossip message content — ephemeral forward only
      ?.  =(requester.rem our.bowl)  `this
      =/  nid=@ta  note-id.rem
      =/  msg  msg.rem
      =/  nenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
        `this
      =/  env  (~(get by nenv) id.msg)
      ?~  env
        ~&  [%gossip-msg-reply-no-envelope id=id.msg note=nid]
        `this
      ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
        ~&  [%gossip-msg-hash-mismatch id=id.msg note=nid]
        `this
      =/  new-envs=(map @ta (map @da envelope:noltbook))
        ?:  =(content-hash.u.env *@uv)
          (~(put by gossip-envelopes) nid (cap-envs (~(put by nenv) id.msg u.env(content-hash (sham text.msg)))))
        gossip-envelopes
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update nid ~[[id.msg author.msg]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) nid) ~)
        (~(put by mentions) nid (snoc cur-m [id.msg author.msg]))
      ::  do NOT persist full message — ephemeral forward only
      =/  upd=update:noltbook  [%cover-msg-content nid msg]
      :_  this(gossip-envelopes new-envs, mentions new-mentions)
      (weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] mention-cards)
    ::
        %remote-rumor
      ::  RUMORS: anonymous gossip from a peer
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %ars-rumors) ~)
      ::  dedup by content hash (not message id)
      =/  chash=@uv  (sham text.msg.rem)
      ?:  (~(has by gossip-hops) `@da`chash)
        `this
      ::  force author anonymous (don't trust sender)
      =/  anon-msg=message:noltbook  msg.rem(author ~hosted)
      =/  upd=update:noltbook  [%rumor-message anon-msg]
      ::  proxy relay: 50% broadcast, 50% proxy through one random peer
      =/  targets=(list @p)
        %+  skim  ~(tap in pal-outgoing)
        |=(p=@p !=(p src.bowl))
      =/  relay=(list card)
        ?:  =(0 (lent targets))  ~
        ?.  =(0 (~(rad og eny.bowl) 2))
          ::  broadcast to all (except sender)
          %+  turn  targets
          |=  p=@p
          ^-  card
          [%pass /rum-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-rumor anon-msg (add hops.rem 1)])]
        ::  proxy through one random peer
        =/  proxy=@p  (snag (~(rad og +(eny.bowl)) (lent targets)) targets)
        ~[[%pass /rum-out/(scot %p proxy) %agent [proxy %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-rumor anon-msg (add hops.rem 1)])]]
      :_  this(messages (~(put by messages) %ars-rumors (snoc cur anon-msg)), gossip-hops (~(put by gossip-hops) `@da`chash 0))
      [[%give %fact ~[/notes/ars-rumors] %noltbook-update !>(upd)] relay]
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
      ::  send our profile back so they have our display name + avatar
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  prof-card=card
        [%pass /prof-out/(scot %p src.bowl) %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      ::  if we already have them in outgoing and this is a fresh hey
      ::  (not already in incoming), echo hey back so they see mutual
      =/  hey-back=(list card)
        ?:  (~(has in pal-incoming) src.bowl)  ~
        ?.  (~(has in pal-outgoing) src.bowl)  ~
        ~[[%pass /pal-hey/(scot %p src.bowl) %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
      :_  this(pal-incoming new-incoming)
      :(weld [prof-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] hey-back)
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
        %remote-introduce
      ::  a trusted ship is introducing us to another ship
      =/  target=@p  ship.rem
      ?:  =(target our.bowl)  `this
      ?:  (~(has in peers) target)  `this
      ?:  (~(has in pal-blocked) target)  `this
      =/  new-peers=(set @p)  (~(put in peers) target)
      =/  new-outgoing=(set @p)  (~(put in pal-outgoing) target)
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) target)  %mutual
        %requesting
      ::  send our profile to the new peer
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      :_  this(peers new-peers, pal-outgoing new-outgoing)
      :~  [%pass /ars/(scot %p target) %agent [target %noltbook] %watch /notes/cover]
          [%pass /pal-hey/(scot %p target) %agent [target %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
          [%pass /prof-out/(scot %p target) %agent [target %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
          [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%pal-update target status])]
      ==
    ::
        %remote-edit-msg
      ::  remote user editing their own message in a note we host
      ?:  (~(has in pal-blocked) src.bowl)  `this
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
        :*  nid  name.rem  %notebook  our.bowl  users.u.old  ~  `parent-id.rem  ~  ~  %secret  ~  &  ~  ~
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
      ::  if host is alone after this, delete entirely (except gossip — creator keeps container)
      ?:  &(=(~(wyt in new-users) 1) !=(%gossip type.u.old))
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
      ::  remaining users: shrink set, fan out update
      =/  new-note=note:noltbook  u.old(users new-users)
      =/  users-upd=update:noltbook
        [%note-users-updated note-id.rem ~(tap in new-users) ~(tap in removed.u.old)]
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
    ::
        %remote-kick
      ::  host removed us from a note (due to blocking)
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  must come from the note's creator
      ?.  =(src.bowl creator.u.old)  `this
      =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
      =/  kick-upd=update:noltbook  [%kick-notification note-id.rem note-name.rem src.bowl]
      ::  unsubscribe from host's note path so reinvite can resubscribe cleanly
      =/  unsub-card=card
        [%pass /remote-note/[note-id.rem] %agent [src.bowl %noltbook] %leave ~]
      :_  this(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem))
      :~  unsub-card
          [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
          [%give %fact ~[/notes] %noltbook-update !>(kick-upd)]
      ==
    ::
    ::  ===== REMOTE CALL HANDLERS =====
    ::
        %remote-call-start
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `this
      ?.  (~(has in users.u.exists) src.bowl)  `this
      ::  if stale call (0 participants), allow replacement; if active, no-op
      =/  old-call  (~(get by active-calls) note-id.rem)
      ?:  ?&  ?=(^ old-call)
              (gth ~(wyt in participants.u.old-call) 0)
          ==
        `this
      ::  case 1: we are the creator and a member asked us to start
      ?:  =(our.bowl creator.u.exists)
        =/  cid=@ta  (crip (weld "call-" (trip (scot %da now.bowl))))
        =/  ci=call-info:noltbook
          [cid note-id.rem src.bowl now.bowl (sy ~[src.bowl]) %active]
        =/  sys-msg=message:noltbook
          [now.bowl note-id.rem src.bowl (crip (weld "\01SYS:call-started:" (trip (scot %p src.bowl)))) now.bowl ~ %.n ~]
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
        =/  upd=update:noltbook  [%call-started note-id.rem cid src.bowl ~[src.bowl]]
        =/  msg-upd=update:noltbook  [%new-message sys-msg]
        =/  pax=path  ~[%notes note-id.rem]
        ::  broadcast to all members including the requester
        =/  broadcast=(list card)
          %+  murn  ~(tap in users.u.exists)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /call-start/(scot %p p)/[note-id.rem] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-start note-id.rem cid src.bowl])]
        :_  this(active-calls (~(put by active-calls) note-id.rem ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]] broadcast)
      ::  case 2: we are NOT creator; accept notification from creator only
      ?.  =(src.bowl creator.u.exists)  `this
      =/  ci=call-info:noltbook
        [call-id.rem note-id.rem started-by.rem now.bowl (sy ~[started-by.rem]) %active]
      =/  sys-msg=message:noltbook
        [now.bowl note-id.rem started-by.rem (crip (weld "\01SYS:call-started:" (trip (scot %p started-by.rem)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-started note-id.rem call-id.rem started-by.rem ~[started-by.rem]]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(active-calls (~(put by active-calls) note-id.rem ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]])
    ::
        %remote-call-join
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `this
      ?.  (~(has in users.u.exists) ship.rem)  `this
      ?:  (~(has in participants.u.ci) ship.rem)  `this
      =/  new-ci=call-info:noltbook  u.ci(participants (~(put in participants.u.ci) ship.rem))
      =/  sys-msg=message:noltbook
        [now.bowl note-id.rem ship.rem (crip (weld "\01SYS:call-joined:" (trip (scot %p ship.rem)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-joined note-id.rem ship.rem]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      =/  pax=path  ~[%notes note-id.rem]
      ::  case 1: we are creator — process + relay to other participants
      ::  case 2: we are NOT creator — just process locally (notification from creator)
      =/  broadcast=(list card)
        ?.  =(our.bowl creator.u.exists)  ~
        %+  murn  ~(tap in participants.u.ci)
        |=  p=@p
        ?:  =(p ship.rem)  ~
        ?:  =(p our.bowl)  ~
        `[%pass /call-join-relay/(scot %p p)/[note-id.rem] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-join note-id.rem ship.rem])]
      :_  this(active-calls (~(put by active-calls) note-id.rem new-ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(msg-upd)]] broadcast)
    ::
        %remote-call-leave
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `this
      ?.  (~(has in participants.u.ci) ship.rem)  `this
      =/  new-parts=(set @p)  (~(del in participants.u.ci) ship.rem)
      =/  sys-msg=message:noltbook
        [now.bowl note-id.rem ship.rem (crip (weld "\01SYS:call-left:" (trip (scot %p ship.rem)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  pax=path  ~[%notes note-id.rem]
      ::  if no participants left, end the call
      ?:  =(0 ~(wyt in new-parts))
        =/  end-upd=update:noltbook  [%call-ended note-id.rem call-id.u.ci]
        =/  end-msg=message:noltbook
          [now.bowl note-id.rem ship.rem '\01SYS:call-ended' now.bowl ~ %.n ~]
        ::  broadcast call-ended to all note members
        =/  broadcast=(list card)
          %+  murn  ~(tap in users.u.exists)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /call-end/(scot %p p)/[note-id.rem] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-ended note-id.rem])]
        :_  this(active-calls (~(del by active-calls) note-id.rem), messages (~(put by messages) note-id.rem (snoc (snoc cur sys-msg) end-msg)))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(end-upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(end-upd)]] broadcast)
      ::  still has participants: update and broadcast leave
      =/  new-ci=call-info:noltbook  u.ci(participants new-parts)
      =/  upd=update:noltbook  [%call-left note-id.rem ship.rem]
      ::  only creator relays to other participants
      =/  broadcast=(list card)
        ?.  =(our.bowl creator.u.exists)  ~
        %+  murn  ~(tap in new-parts)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /call-leave-relay/(scot %p p)/[note-id.rem] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-call-leave note-id.rem ship.rem])]
      :_  this(active-calls (~(put by active-calls) note-id.rem new-ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] broadcast)
    ::
        %remote-call-ended
      ::  host says call is over
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `this
      ::  must come from a note member
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `this
      ?.  (~(has in users.u.exists) src.bowl)  `this
      =/  end-msg=message:noltbook
        [now.bowl note-id.rem src.bowl '\01SYS:call-ended' now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-ended note-id.rem call-id.u.ci]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(active-calls (~(del by active-calls) note-id.rem), messages (~(put by messages) note-id.rem (snoc cur end-msg)))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)] [%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-call-signal
      ::  incoming WebRTC signal from a peer; relay to local frontend
      ::  find which note this call belongs to
      =/  entries=(list [@ta call-info:noltbook])  ~(tap by active-calls)
      =/  match=(list [@ta call-info:noltbook])
        (skim entries |=([nid=@ta ci=call-info:noltbook] =(call-id.ci call-id.rem)))
      ?~  match  `this
      =/  note-id=@ta  -.i.match
      =/  upd=update:noltbook  [%call-signal note-id from.rem sig-type.rem payload.rem]
      =/  pax=path  ~[%notes note-id]
      :_  this
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
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
      ::  check if this is a gossip-type note (envelope model)
      =/  note  (~(get by notes) nid)
      =/  is-gossip=?  ?~(note | =(%gossip type.u.note))
      ?:  is-gossip
        ::  === gossip note: envelope-style handling (same model as cover) ===
        =/  note-envs=(map @da envelope:noltbook)  (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
        ?+  -.upd  `this
            %gossip-envelope
          =/  env  env.upd
          ?:  (~(has by note-envs) msg-id.env)
            `this
          =/  own-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ?:  (lien own-msgs |=(m=message:noltbook =(id.m msg-id.env)))
            `this
          =/  my-hops=@ud  (add hops.upd 1)
          =/  gupd=update:noltbook  [%gossip-envelope nid env my-hops]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) msg-id.env env)))
          =.  gossip-hops  (~(put by gossip-hops) msg-id.env my-hops)
          :_  this
          ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(gupd)]]
        ::
            %envelope-list
          =/  new-envs=(list envelope:noltbook)
            (skim envelopes.upd |=(e=envelope:noltbook !(~(has by note-envs) msg-id.e)))
          ?~  new-envs  `this
          =/  new-env-map=(map @da envelope:noltbook)
            %-  ~(gas by *(map @da envelope:noltbook))
            (turn new-envs |=(e=envelope:noltbook [msg-id.e e]))
          =/  new-hops=(map @da @ud)
            %-  ~(gas by *(map @da @ud))
            (turn new-envs |=(e=envelope:noltbook [msg-id.e 1]))
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(uni by note-envs) new-env-map)))
          `this(gossip-hops (~(uni by gossip-hops) new-hops))
        ::
            %cover-msg-content
          ::  fetched content via subscription — ephemeral forward only
          =/  msg  msg.upd
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
            `this
          =/  env  (~(get by note-envs) id.msg)
          ?~  env  `this
          ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
            ~&  [%gossip-msg-hash-mismatch-sub note=nid id=id.msg]
            `this
          :_  this
          ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
        ::
            %gossip-message
          ::  full gossip from subscription — convert to envelope
          =/  msg  msg.upd
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
            `this
          ?:  (~(has by note-envs) id.msg)
            `this
          =/  my-hops=@ud  (add hops.upd 1)
          =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg)]
          =/  eupd=update:noltbook  [%gossip-envelope nid env my-hops]
          =/  pax=path  /notes/[nid]
          ?:  =(author.msg our.bowl)
            =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
            =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
            :_  this
            ~[[%give %fact ~[pax] %noltbook-update !>(eupd)]]
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
          :_  this
          :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
              [%give %fact ~[/notes] %noltbook-update !>(content-upd)]
          ==
        ::
            %new-message
          ::  legacy full-message — convert to envelope
          =/  msg  msg.upd
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
            `this
          ?:  (~(has by note-envs) id.msg)
            `this
          =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg)]
          =/  eupd=update:noltbook  [%gossip-envelope nid env 1]
          =/  pax=path  /notes/[nid]
          ?:  =(author.msg our.bowl)
            =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
            =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
            :_  this
            ~[[%give %fact ~[pax] %noltbook-update !>(eupd)]]
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
          :_  this
          :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
              [%give %fact ~[/notes] %noltbook-update !>(content-upd)]
          ==
        ::
            %note-users-updated
          =?  notes  ?=(^ note)
            (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd)))
          :_  this
          ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
        ==
      ::  === regular note: persist full messages ===
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
        =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        ::  mention detection for subscribed notes
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) nid) ~)
          (~(put by mentions) nid (snoc cur-m [id.msg author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          =/  mupd=update:noltbook  [%mention-update nid ~[[id.msg author.msg]]]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
        =/  base-cards=(list card)
          :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
              [%give %fact ~[/notes] %noltbook-update !>(upd)]
          ==
        :_  this
        (weld base-cards mention-cards)
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
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd)))
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
      =/  cover-envs=(map @da envelope:noltbook)  (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      ?+  -.upd  `this
          %new-message
        ::  legacy full-message from subscription — convert to envelope
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
          `this
        ?:  (~(has by cover-envs) id.msg)
          `this
        =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg)]
        =/  eupd=update:noltbook  [%gossip-envelope %cover env 1]
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%mention-update %cover ~[[id.msg author.msg]]])]]
        ::  author persists full message; non-author stores envelope only
        ?:  =(author.msg our.bowl)
          =.  messages  (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y))
          =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
          :_  this
          (weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(eupd)]] mention-cards)
        ::  non-author: envelope only + ephemeral content to frontend
        =/  content-upd=update:noltbook  [%cover-msg-content %cover msg]
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(put by cover-envs) id.msg env)))
        =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
        :_  this
        :(weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(eupd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(content-upd)]] mention-cards)
      ::
          %gossip-message
        ::  full gossip from subscription — convert to envelope
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
          `this
        ?:  (~(has by cover-envs) id.msg)
          `this
        =/  my-hops=@ud  (add hops.upd 1)
        =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg)]
        =/  eupd=update:noltbook  [%gossip-envelope %cover env my-hops]
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%mention-update %cover ~[[id.msg author.msg]]])]]
        ::  author persists; non-author stores envelope only
        ?:  =(author.msg our.bowl)
          =.  messages  (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y))
          =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
          :_  this
          (weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(eupd)]] mention-cards)
        =/  content-upd=update:noltbook  [%cover-msg-content %cover msg]
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(put by cover-envs) id.msg env)))
        =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
        :_  this
        :(weld ~[[%give %fact ~[/notes/cover] %noltbook-update !>(eupd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(content-upd)]] mention-cards)
      ::
          %message-list
        ::  initial sync of cover messages from peer — convert to envelopes
        ::  only persist own-authored messages; remote become envelopes
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        =/  cur-ids=(set @da)  (sy (turn cur |=(m=message:noltbook id.m)))
        =/  env-ids=(set @da)  ~(key by cover-envs)
        =/  new-msgs=(list message:noltbook)
          %+  skim  messages.upd
          |=  m=message:noltbook
          &(!(~(has in cur-ids) id.m) !(~(has in env-ids) id.m))
        =/  own=(list message:noltbook)
          (skim new-msgs |=(m=message:noltbook =(author.m our.bowl)))
        =/  remote=(list message:noltbook)
          (skip new-msgs |=(m=message:noltbook =(author.m our.bowl)))
        =/  new-envs=(map @da envelope:noltbook)
          %-  ~(gas by *(map @da envelope:noltbook))
          %+  turn  remote
          |=  m=message:noltbook
          [id.m [author.m id.m timestamp.m reply-to.m (sham text.m)]]
        =/  new-hops=(map @da @ud)
          %-  ~(gas by *(map @da @ud))
          (turn new-msgs |=(m=message:noltbook [id.m 1]))
        =.  messages  (~(put by messages) %cover (cap-msgs (weld cur own) %.y))
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(uni by cover-envs) new-envs)))
        `this(gossip-hops (~(uni by gossip-hops) new-hops))
      ::
          %gossip-envelope
        ::  envelope gossip via subscription
        =/  env  env.upd
        ?:  (~(has by cover-envs) msg-id.env)
          `this
        =/  cover-msgs=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cover-msgs |=(m=message:noltbook =(id.m msg-id.env)))
          `this
        =/  my-hops=@ud  (add hops.upd 1)
        =/  gupd=update:noltbook  [%gossip-envelope %cover env my-hops]
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(put by cover-envs) msg-id.env env)))
        =.  gossip-hops  (~(put by gossip-hops) msg-id.env my-hops)
        :_  this
        ~[[%give %fact ~[/notes/cover] %noltbook-update !>(gupd)]]
      ::
          %envelope-list
        ::  initial sync of envelopes from peer
        =/  new-envs=(list envelope:noltbook)
          (skim envelopes.upd |=(e=envelope:noltbook !(~(has by cover-envs) msg-id.e)))
        ?~  new-envs  `this
        =/  new-env-map=(map @da envelope:noltbook)
          %-  ~(gas by *(map @da envelope:noltbook))
          (turn new-envs |=(e=envelope:noltbook [msg-id.e e]))
        =/  new-hops=(map @da @ud)
          %-  ~(gas by *(map @da @ud))
          (turn new-envs |=(e=envelope:noltbook [msg-id.e 1]))
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(uni by cover-envs) new-env-map)))
        `this(gossip-hops (~(uni by gossip-hops) new-hops))
      ::
          %cover-msg-content
        ::  fetched content via subscription — ephemeral forward only
        =/  msg  msg.upd
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ?:  (lien cur |=(m=message:noltbook =(id.m id.msg)))
          `this
        ::  verify content hash if envelope exists
        =/  env  (~(get by cover-envs) id.msg)
        ?~  env  `this
        ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
          ~&  [%cover-msg-hash-mismatch-sub id=id.msg]
          `this
        ::  do NOT persist — just forward to local frontend
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
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
      [%fetch-msg @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%fetch-msg-failed wire u.p.sign]
      `this
    ==
  ::
      [%msg-reply @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%msg-reply-failed wire u.p.sign]
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
        %poke-ack
      ?~  p.sign  `this
      ~&  [%ars-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%rum-out @ ~]
    ::  ack/nack for rumors gossip pokes
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
  ::
      [%call-start @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%call-start-failed wire]
      `this
    ==
  ::
      [%call-join @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-join-relay @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-leave @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-leave-relay @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-sig @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-end @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ==
::
++  on-fail    on-fail:def
--
