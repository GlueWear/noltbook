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
      state-20
      state-21
      state-22
      state-23
      state-24
      state-25
      state-26
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
::  pre-meta envelope shape — used by state-21 for on-load typing
+$  envelope-21
  $:  author=@p
      msg-id=@da
      timestamp=@da
      reply-to=(unit @da)
      content-hash=@uv
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
::  entry-meta-20: pre-reply-to-eid entry-meta shape (5 fields)
+$  entry-meta-20
  $:  eid=@uv
      seq=@ud
      rev=@ud
      created=@da
      updated=@da
  ==
::  message-20: message with old 5-field entry-meta (no reply-to-eid)
+$  message-20
  $:  id=@da
      note-id=@ta
      author=@p
      text=@t
      timestamp=@da
      reply-to=(unit @da)
      edited=?
      meta=(unit entry-meta-20)
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
      cover-envelopes=(map @da envelope-21)
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
      gossip-envelopes=(map @ta (map @da envelope-21))
      headlines=(map @ta @t)
  ==
+$  state-19
  $:  %19
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-20))
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
      gossip-envelopes=(map @ta (map @da envelope-21))
      headlines=(map @ta @t)
      seq-counters=(map [@p @ta] @ud)
  ==
+$  state-20
  $:  %20
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message-20))
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
      gossip-envelopes=(map @ta (map @da envelope-21))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
  ==
::  state-21: messages use entry-meta with reply-to-eid
+$  state-21
  $:  %21
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
      gossip-envelopes=(map @ta (map @da envelope-21))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
  ==
::  state-22: envelopes carry entry-meta; cover/gossip use eid identity
+$  state-22
  $:  %22
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
      seq-counters=(map @ta @ud)
  ==
::  state-23: mentions store stable identity [id eid author]
+$  state-23
  $:  %23
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
      mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
  ==
::  state-24: add persistent join-request queue for hosted notes
+$  state-24
  $:  %24
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
      mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
      join-requests=(map @ta (set @p))
  ==
::  state-26: add durable blocked-by set (ships that have blocked us)
+$  state-26
  $:  %26
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
      blocked-by=(set @p)
      dial=@ud
      gossip-hops=(map @da @ud)
      mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
      join-requests=(map @ta (set @p))
      note-admins=(map @ta (set @p))
      note-muted=(map @ta (set @p))
  ==
::  state-25: add note-scoped admin and mute role maps
+$  state-25
  $:  %25
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
      mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
      active-calls=(map @ta call-info:noltbook)
      gossip-envelopes=(map @ta (map @da envelope:noltbook))
      headlines=(map @ta @t)
      seq-counters=(map @ta @ud)
      join-requests=(map @ta (set @p))
      note-admins=(map @ta (set @p))
      note-muted=(map @ta (set @p))
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
  =/  new-envs=(map @da envelope-21)
    %-  ~(run by cover-envelopes.s)
    |=  e=envelope-16
    ^-  envelope-21
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
  =/  new-gossip-envs=(map @ta (map @da envelope-21))
    ?:  =(cover-envelopes.s ~)  ~
    (~(put by *(map @ta (map @da envelope-21))) %cover cover-envelopes.s)
  :*  %18
      new-notes  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      new-gossip-envs  ~
  ==
::  upgrade-18-to-19: add meta=(unit entry-meta-20) to messages, add seq-counters
++  upgrade-18-to-19
  |=  s=state-18
  ^-  state-19
  =/  new-msgs=(map @ta (list message-20))
    %-  ~(run by messages.s)
    |=  msgs=(list message-18)
    ^-  (list message-20)
    %+  turn  msgs
    |=  m=message-18
    ^-  message-20
    [id.m note-id.m author.m text.m timestamp.m reply-to.m edited.m ~]
  :*  %19
      notes.s  new-msgs  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      *(map [@p @ta] @ud)
  ==
::  upgrade-19-to-20: collapse per-author seq-counters to per-note
::  chains through upgrade-20-to-21 → ... → upgrade-25-to-26
++  upgrade-19-to-20
  |=  s=state-19
  ^-  state-26
  =/  new-seq=(map @ta @ud)
    %-  ~(rep by seq-counters.s)
    |=  [[[a=@p n=@ta] v=@ud] acc=(map @ta @ud)]
    =/  cur=@ud  (fall (~(get by acc) n) 0)
    (~(put by acc) n (max v cur))
  =/  s20=state-20
    :*  %20
        notes.s  messages.s  artifacts.s  profiles.s
        transactions.s  current-note.s  peers.s  has-avatar.s
        pal-outgoing.s  pal-incoming.s  pal-blocked.s
        dial.s  gossip-hops.s  mentions.s  active-calls.s
        gossip-envelopes.s  headlines.s
        new-seq
    ==
  (upgrade-20-to-21 s20)
::  upgrade-20-to-21: add reply-to-eid to entry-meta in messages
::  chains through upgrade-21-to-22 → upgrade-22-to-23
++  upgrade-20-to-21
  |=  s=state-20
  ^-  state-26
  =/  new-msgs=(map @ta (list message:noltbook))
    %-  ~(run by messages.s)
    |=  msgs=(list message-20)
    ^-  (list message:noltbook)
    ::  first pass: convert meta shape (add reply-to-eid=~)
    =/  converted=(list message:noltbook)
      %+  turn  msgs
      |=  m=message-20
      ^-  message:noltbook
      =/  new-meta=(unit entry-meta:noltbook)
        ?~  meta.m  ~
        `[eid.u.meta.m seq.u.meta.m rev.u.meta.m created.u.meta.m updated.u.meta.m ~]
      [id.m note-id.m author.m text.m timestamp.m reply-to.m edited.m new-meta]
    ::  build eid-by-id map for backfill
    =/  eid-map=(map @da @uv)
      %-  ~(rep in (sy converted))
      |=  [m=message:noltbook acc=(map @da @uv)]
      ?~  meta.m  acc
      (~(put by acc) id.m eid.u.meta.m)
    ::  second pass: backfill reply-to-eid from parent's eid
    %+  turn  converted
    |=  m=message:noltbook
    ^-  message:noltbook
    ?~  meta.m  m
    ?~  reply-to.m  m
    =/  parent-eid=(unit @uv)  (~(get by eid-map) u.reply-to.m)
    ?~  parent-eid  m
    m(reply-to-eid.u.meta `u.parent-eid)
  =/  s21=state-21
    :*  %21
        notes.s  new-msgs  artifacts.s  profiles.s
        transactions.s  current-note.s  peers.s  has-avatar.s
        pal-outgoing.s  pal-incoming.s  pal-blocked.s
        dial.s  gossip-hops.s  mentions.s  active-calls.s
        gossip-envelopes.s  headlines.s
        seq-counters.s
    ==
  (upgrade-21-to-22 s21)
::  upgrade-21-to-22: add meta=(unit entry-meta) to envelopes
++  upgrade-21-to-22
  |=  s=state-21
  ^-  state-26
  =/  new-envs=(map @ta (map @da envelope:noltbook))
    %-  ~(run by gossip-envelopes.s)
    |=  envs=(map @da envelope-21)
    ^-  (map @da envelope:noltbook)
    %-  ~(run by envs)
    |=  e=envelope-21
    ^-  envelope:noltbook
    [author.e msg-id.e timestamp.e reply-to.e content-hash.e ~]
  =/  s22=state-22
    :*  %22
        notes.s  messages.s  artifacts.s  profiles.s
        transactions.s  current-note.s  peers.s  has-avatar.s
        pal-outgoing.s  pal-incoming.s  pal-blocked.s
        dial.s  gossip-hops.s  mentions.s  active-calls.s
        new-envs  headlines.s
        seq-counters.s
    ==
  (upgrade-22-to-23 s22)
::  upgrade-22-to-23: enrich mention storage with stable eid
++  upgrade-22-to-23
  |=  s=state-22
  ^-  state-26
  =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
    %-  ~(urn by mentions.s)
    |=  [nid=@ta mns=(list [id=@da author=@p])]
    ^-  (list [id=@da eid=(unit @uv) author=@p])
    =/  note-msgs=(list message:noltbook)  (fall (~(get by messages.s) nid) ~)
    %+  turn  mns
    |=  [mid=@da auth=@p]
    =/  found=(list message:noltbook)  (skim note-msgs |=(m=message:noltbook =(id.m mid)))
    =/  m-eid=(unit @uv)
      ?~  found  ~
      ?~  meta.i.found  ~
      `eid.u.meta.i.found
    [mid m-eid auth]
  %-  upgrade-23-to-24
  :*  %23
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  new-mentions  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s
  ==
::  upgrade-25-to-26: add blocked-by set
++  upgrade-25-to-26
  |=  s=state-25
  ^-  state-26
  :*  %26
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      *(set @p)
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
  ==
::  upgrade-24-to-25: add note-admins and note-muted maps
++  upgrade-24-to-25
  |=  s=state-24
  ^-  state-26
  %-  upgrade-25-to-26
  :*  %25
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      *(map @ta (set @p))
      *(map @ta (set @p))
  ==
::  has-mod-power: check if ship is host or admin for a note
++  has-mod-power
  |=  [ship=@p nid=@ta creator=@p admins=(map @ta (set @p))]
  ^-  ?
  ?|  =(ship creator)
      (~(has in (fall (~(get by admins) nid) ~)) ship)
  ==
::  upgrade-23-to-24: add join-requests map
++  upgrade-23-to-24
  |=  s=state-23
  ^-  state-26
  %-  upgrade-24-to-25
  :*  %24
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s
      *(map @ta (set @p))
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
::  find-dm-root: first %dm root note whose users match (pair lookup)
++  find-dm-root
  |=  [nmap=(map @ta note:noltbook) us=(set @p)]
  ^-  (unit note:noltbook)
  =/  hits=(list note:noltbook)
    %+  skim  ~(val by nmap)
    |=  n=note:noltbook
    &(?=(~ parent.n) =(users.n us) =(%dm type.n))
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
=|  state-26
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
  ?:  ?=([%26 *] q.old)
    =/  loaded  !<(state-26 old)
    ::  fix: ensure cover note exists and is keyed as %cover
    ::  (same normalizations carried forward from state-24 load)
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
    ::  normalize legacy: any %dm with >2 users becomes %group
    =/  loaded
      =/  dm-list=(list [@ta note:noltbook])
        %+  skim  ~(tap by notes.loaded)
        |=  [k=@ta n=note:noltbook]
        &(=(%dm type.n) (gth ~(wyt in users.n) 2))
      ?~  dm-list  loaded
      ~&  [%normalizing-oversized-dms count=(lent dm-list)]
      =/  dm-fixes=(list [@ta note:noltbook])  dm-list
      =/  nmap=(map @ta note:noltbook)  notes.loaded
      |-
      ?~  dm-fixes  loaded(notes nmap)
      =/  [nid=@ta dn=note:noltbook]  i.dm-fixes
      =/  fixed=note:noltbook  dn(type %group)
      =.  nmap  (~(put by nmap) nid fixed)
      $(dm-fixes t.dm-fixes)
    ::  normalize legacy: detach any children of %dm notes to root
    =/  loaded
      =/  dm-parents=(list [@ta note:noltbook])
        %+  skim  ~(tap by notes.loaded)
        |=  [k=@ta n=note:noltbook]
        &(=(%dm type.n) !=(children.n ~))
      ?~  dm-parents  loaded
      ~&  [%detaching-dm-children count=(lent dm-parents)]
      =/  nmap=(map @ta note:noltbook)  notes.loaded
      =/  fixes=(list [@ta note:noltbook])  dm-parents
      |-
      ?~  fixes  loaded(notes nmap)
      =/  [pid=@ta dm=note:noltbook]  i.fixes
      ::  clear children list on the DM
      =.  nmap  (~(put by nmap) pid dm(children ~))
      ::  detach each child to root
      =/  kids=(list @ta)  children.dm
      |-  ^+  ^$(fixes t.fixes)
      ?~  kids  ^$(fixes t.fixes)
      =/  kid=(unit note:noltbook)  (~(get by nmap) i.kids)
      =?  nmap  ?=(^ kid)
        (~(put by nmap) i.kids u.kid(parent ~))
      $(kids t.kids)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%25 *] q.old)
    =/  s25  !<(state-25 old)
    $(old !>((upgrade-25-to-26 s25)))
  ?:  ?=([%24 *] q.old)
    =/  s24  !<(state-24 old)
    $(old !>((upgrade-24-to-25 s24)))
  ?:  ?=([%23 *] q.old)
    =/  s23  !<(state-23 old)
    $(old !>((upgrade-23-to-24 s23)))
  ?:  ?=([%22 *] q.old)
    =/  s22  !<(state-22 old)
    $(old !>((upgrade-22-to-23 s22)))
  ?:  ?=([%21 *] q.old)
    =/  s21  !<(state-21 old)
    $(old !>((upgrade-21-to-22 s21)))
  ?:  ?=([%20 *] q.old)
    =/  s20  !<(state-20 old)
    =/  loaded  (upgrade-20-to-21 s20)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%19 *] q.old)
    =/  s19  !<(state-19 old)
    =/  loaded  (upgrade-19-to-20 s19)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%18 *] q.old)
    =/  s18  !<(state-18 old)
    =/  loaded  (upgrade-19-to-20 (upgrade-18-to-19 s18))
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
    ::  upgrade 17 → 18 → 19 → 20
    =/  s18  (upgrade-17-to-18 s17)
    =/  loaded  (upgrade-19-to-20 (upgrade-18-to-19 s18))
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
    =/  remote-envs=(map @da envelope-21)
      %-  ~(gas by *(map @da envelope-21))
      %+  turn  remote-msgs
      |=  m=message-18
      [id.m [author.m id.m timestamp.m reply-to.m (sham text.m)]]
    =/  merged-envs=(map @da envelope-21)
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
    =/  loaded  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 s17)))
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
    [prof-cards this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 s16)))))]
  ?:  ?=([%14 *] q.old)
    =/  loaded  !<(state-14 old)
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 loaded)))))))
  ?:  ?=([%13 *] q.old)
    =/  loaded  !<(state-13 old)
    =/  s15  (upgrade-14-to-15 (upgrade-13-to-14 loaded))
    =/  s15  ?.  (~(has by notes.s15) %ars-rumors)
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s15(notes (~(put by notes.s15) %ars-rumors rumors), messages (~(put by messages.s15) %ars-rumors *(list message-18)))
    s15
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15))))))
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
    =/  s19  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15)))))
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
    =/  s19  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 s11)))))))))
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
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 s10)))))))))))
  ::  state-9 → ... → state-19
  ?:  ?=([%9 *] q.old)
    =/  s9  !<(state-9 old)
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 s9))))))))))))
  ::  state-8 → ... → state-20
  ?:  ?=([%8 *] q.old)
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 !<(state-8 old))))))))))))))
  ::  state-7 → ... → state-20
  ?:  ?=([%7 *] q.old)
    =/  s7  !<(state-7 old)
    =/  s8=state-8
      [%8 notes.s7 messages.s7 artifacts.s7 profiles.s7 transactions.s7 current-note.s7 peers.s7 has-avatar.s7 pal-outgoing.s7 pal-incoming.s7 pal-blocked.s7 0 ~]
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
  ::  state-6 → ... → state-19
  ?:  ?=([%6 *] q.old)
    =/  s6  !<(state-6 old)
    =/  hey-cards=(list card)
      %+  turn  ~(tap in peers.s6)
      |=  p=@p
      [%pass /pal-hey/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
    =/  s8=state-8
      [%8 notes.s6 messages.s6 artifacts.s6 profiles.s6 transactions.s6 current-note.s6 peers.s6 has-avatar.s6 peers.s6 ~ ~ 0 ~]
    :_  this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))

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
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
  `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
    ::  send all current mention states (eid stored natively since state-23)
    =/  mention-cards=(list card)
      %+  turn  ~(tap by mentions)
      |=  [nid=@ta mns=(list [id=@da eid=(unit @uv) author=@p])]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%mention-update nid mns])]
    ::  send active call states
    =/  call-cards=(list card)
      %+  turn  ~(tap by active-calls)
      |=  [nid=@ta ci=call-info:noltbook]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%call-state nid ci])]
    ::  send pending join requests (host only sees their own)
    =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
      %-  zing
      %+  turn  ~(tap by join-requests)
      |=  [nid=@ta ships=(set @p)]
      =/  note  (~(get by notes) nid)
      ?~  note  ~
      (turn ~(tap in ships) |=(s=@p [nid s name.u.note]))
    =/  jr-cards=(list card)
      ?~  jr-list  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%join-request-list jr-list])]]
    ::  send admin/muted role state for each note
    =/  role-cards=(list card)
      %-  zing
      %+  turn  ~(tap by notes)
      |=  [nid=@ta n=note:noltbook]
      =/  adms=(set @p)  (fall (~(get by note-admins) nid) ~)
      =/  mts=(set @p)  (fall (~(get by note-muted) nid) ~)
      =/  out=(list card)  ~
      =?  out  !=(~ adms)
        [[%give %fact ~ %noltbook-update !>(`update:noltbook`[%admins-updated nid ~(tap in adms)])] out]
      =?  out  !=(~ mts)
        [[%give %fact ~ %noltbook-update !>(`update:noltbook`[%muted-updated nid ~(tap in mts)])] out]
      out
    ::  send blocked-by list so frontend knows who has us blocked
    =/  bb-cards=(list card)
      =/  bb-list=(list @p)  ~(tap in blocked-by)
      ?~  bb-list  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%blocked-by-list bb-list])]]
    =/  init-cards=(list card)
      :~  [%give %fact ~ %noltbook-update !>(upd)]
          [%give %fact ~ %noltbook-update !>(pupd)]
          [%give %fact ~ %noltbook-update !>(palupd)]
          [%give %fact ~ %noltbook-update !>(dialupd)]
      ==
    :_  this
    :(weld init-cards mention-cards call-cards jr-cards role-cards bb-cards)
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
        (turn msgs |=(m=message:noltbook [author.m id.m timestamp.m reply-to.m (sham text.m) meta.m]))
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
    =/  new-peers=(set @p)
      ?.  is-new-remote  peers
      (~(put in peers) src.bowl)
    ::  send active call state for this note if one exists
    =/  call-cards=(list card)
      =/  ci  (~(get by active-calls) nid)
      ?~  ci  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%call-state nid u.ci])]]
    ::  send role state for this note
    =/  note-role-cards=(list card)
      =/  adms=(set @p)  (fall (~(get by note-admins) nid) ~)
      =/  mts=(set @p)  (fall (~(get by note-muted) nid) ~)
      =/  out=(list card)  ~
      =?  out  !=(~ adms)
        [[%give %fact ~ %noltbook-update !>(`update:noltbook`[%admins-updated nid ~(tap in adms)])] out]
      =?  out  !=(~ mts)
        [[%give %fact ~ %noltbook-update !>(`update:noltbook`[%muted-updated nid ~(tap in mts)])] out]
      out
    ::  send join-request data to admin subscribers
    =/  jr-admin-cards=(list card)
      =/  adms=(set @p)  (fall (~(get by note-admins) nid) ~)
      ?.  (~(has in adms) src.bowl)  ~
      =/  pending=(set @p)  (fall (~(get by join-requests) nid) *(set @p))
      ?:  =(~ pending)  ~
      =/  n  (~(get by notes) nid)
      ?~  n  ~
      =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
        (turn ~(tap in pending) |=(s=@p [nid s name.u.n]))
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%join-request-list jr-list])]]
    :_  this(peers new-peers)
    :(weld init-cards ~[[%give %fact ~ %noltbook-update !>(pupd)]] intro-cards call-cards note-role-cards jr-admin-cards)
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
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
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
      ::  protect system notes from deletion
      ?:  |(=(id.act %cover) =(id.act %ars-rumors))  `this
      ::  only creator (host) can delete
      ?.  =(our.bowl creator.u.old)  `this
      =/  trimmed=(map @ta note:noltbook)
        ?~  parent.u.old  notes
        =/  par  (~(get by notes) u.parent.u.old)
        ?~  par  notes
        (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
      =/  upd=update:noltbook  [%note-deleted id.act]
      ::  clean up artifacts belonging to this note
      =/  cleaned-arts=(map @ta artifact:noltbook)
        %-  ~(rep by artifacts)
        |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
        ?.  =(note-id.v id.act)  (~(put by acc) k v)
        acc
      ::  notify remote users that note was deleted
      =/  delete-cards=(list card)
        %+  murn  ~(tap in users.u.old)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /note-del/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-deleted id.act name.u.old])]
      :_  this(notes (~(del by trimmed) id.act), messages (~(del by messages) id.act), artifacts cleaned-arts, note-admins (~(del by note-admins) id.act), note-muted (~(del by note-muted) id.act))
      [[%give %fact ~[/notes] %noltbook-update !>(upd)] delete-cards]
    ::
        %create-note
      ::  no parent: personal root note
      ?~  parent.act
        =/  self-set=(set @p)  (sy ~[our.bowl])
        =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
        =/  new-note=note:noltbook
          :*  nid  name.act  %group  our.bowl  self-set  ~  ~  ~  ~  %secret  ~  &  ~  ~
          ==
        =/  upd=update:noltbook  [%note-created new-note]
        :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)))
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      =/  pid=@ta  u.parent.act
      =/  par-u=(unit note:noltbook)  (~(get by notes) pid)
      ?~  par-u  `this
      ::  DMs cannot have children
      ?:  =(%dm type.u.par-u)  `this
      =/  par=note:noltbook  u.par-u
      =/  is-shared=?  (gth ~(wyt in users.par) 1)
      ::  shared & not host: forward to host
      ?:  ?&  is-shared  !=(our.bowl creator.par)  ==
        :_  this
        ~[[%pass /create-child/[pid] %agent [creator.par %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-create-child pid name.act])]]
      ::  local create; inherit users and creator from parent
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  name.act  %group  creator.par  users.par  ~  `pid  ~  ~  %secret  ~  &  ~  ~
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
      ::  entry-meta for hosted, cover, and gossip notes. Rumors use
      ::  content-hash identity (anonymous — no author for eid/seq).
      =/  is-regular=?
        !=(note-id.act %ars-rumors)
      =/  cur-seq=@ud  (fall (~(get by seq-counters) note-id.act) 0)
      =/  nxt-seq=@ud  ?:(is-regular +(cur-seq) 0)
      ::  resolve reply-to-eid: prefer client-supplied, fall back to lookup
      =/  reply-eid=(unit @uv)
        ?.  is-regular  ~
        ?^  reply-to-eid.act  reply-to-eid.act
        ?~  reply-to.act  ~
        =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
        =/  parent=(list message:noltbook)  (skim cur-msgs |=(m=message:noltbook =(id.m u.reply-to.act)))
        ?~  parent  ~
        ?~  meta.i.parent  ~
        `eid.u.meta.i.parent
      =/  em=(unit entry-meta:noltbook)
        ?.  is-regular  ~
        `[(sham [our.bowl now.bowl nxt-seq]) nxt-seq 0 now.bowl now.bowl reply-eid]
      =/  msg=message:noltbook
        :*  now.bowl  note-id.act  our.bowl  text.act  now.bowl  reply-to.act  %.n  em
        ==
      ::  ARS NOTORIA: store locally and gossip to all peers
      ?:  =(note-id.act %cover)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  own messages are hop 0 — author gets full content locally
        =/  upd=update:noltbook  [%gossip-message msg 0]
        ::  broadcast envelope (not full message) to peers
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act) em]
        ~&  [%cover-send-gossip our=our.bowl pal-count=~(wyt in pal-outgoing) targets=~(tap in pal-outgoing)]
        =/  gossip=(list card)
          %+  turn  ~(tap in pal-outgoing)
          |=  p=@p
          ^-  card
          [%pass /ars-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-ars-ref env 0])]
        =/  env-upd=update:noltbook  [%gossip-envelope %cover env 0]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        :_  this(notes (~(put by notes) %cover upd-note), messages (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y)), gossip-hops (~(put by gossip-hops) id.msg 0), seq-counters (~(put by seq-counters) %cover nxt-seq))
        :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/cover] %noltbook-update !>(env-upd)]] gossip)
      ::  user-created gossip notes: same envelope model as cover
      ?:  =(%gossip type.u.exists)
        =/  nid=@ta  note-id.act
        =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
        =/  upd=update:noltbook  [%gossip-message msg 0]
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act) em]
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
              seq-counters  (~(put by seq-counters) nid nxt-seq)
            ==
        :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(env-upd)]] gossip)
      ::  RUMORS: anonymous gossip — intentionally uses content-hash identity,
      ::  NOT entry-meta. Author is stripped (set to ~hosted), so eid/seq
      ::  (which are per-author) would be meaningless. Dedup uses (sham text)
      ::  stored as @da in gossip-hops. This is the correct identity model
      ::  for anonymous messages — content is the identity.
      ?:  =(note-id.act %ars-rumors)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %ars-rumors) ~)
        =/  anon-msg=message:noltbook  msg(author ~hosted)
        ::  content-hash identity: dedup by (sham text)
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
      ::  DM: peer-authoritative — both users store locally and replicate
      ?:  =(%dm type.u.exists)
        =/  other=@p
          =/  others=(list @p)  (skim ~(tap in users.u.exists) |=(p=@p !=(p our.bowl)))
          ?~  others  our.bowl
          i.others
        ::  block guard: cannot send in a DM with a blocked counterparty
        ?:  (~(has in pal-blocked) other)  `this
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
        =/  upd=update:noltbook  [%new-message msg]
        =/  pax=path  ~[%notes note-id.act]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[[%pass /dm-msg/[note-id.act] %agent [other %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message note-id.act msg])]]
        :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] peer-cards)
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-fwd/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message note-id.act msg])]]
      ::  local note: store and fan out
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%new-message msg]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      =/  new-seq-counters=(map @ta @ud)
        ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters)
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters new-seq-counters)
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
    ::
        %edit-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  DM: peer-authoritative — edit locally and replicate
      ?:  =(%dm type.u.exists)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
        =/  found=(list message:noltbook)
          ?~  eid.act
            (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.act))))
          ?~  by-eid
            (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
          by-eid
        ?~  found  `this
        ?.  =(our.bowl author.i.found)  `this
        =/  new-meta=(unit entry-meta:noltbook)
          ?~  meta.i.found  ~
          `u.meta.i.found(rev +(rev.u.meta.i.found), updated now.bowl)
        =/  target-id=@da  id.i.found
        =/  new-msgs=(list message:noltbook)
          %+  turn  cur
          |=  m=message:noltbook
          ?.  =(id.m target-id)  m
          m(text text.act, edited &, meta new-meta)
        =/  edited=message:noltbook  i.found(text text.act, edited &, meta new-meta)
        =/  upd=update:noltbook  [%message-edited note-id.act edited]
        =/  pax=path  ~[%notes note-id.act]
        =/  other=@p
          =/  others=(list @p)  (skim ~(tap in users.u.exists) |=(p=@p !=(p our.bowl)))
          ?~  others  our.bowl
          i.others
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[[%pass /dm-edit/[note-id.act] %agent [other %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-edit-msg note-id.act msg-id.act eid.act text.act])]]
        :_  this(messages (~(put by messages) note-id.act new-msgs))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] peer-cards)
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-edit/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-edit-msg note-id.act msg-id.act eid.act text.act])]]
      ::  creator: find message by eid (preferred) or msg-id (fallback)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  found=(list message:noltbook)
        ?~  eid.act
          (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
        =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.act))))
        ?~  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
        by-eid
      ?~  found  `this
      ::  only author can edit own
      ?.  =(our.bowl author.i.found)  `this
      ::  update meta: increment rev, update updated timestamp, preserve eid/seq/created
      =/  new-meta=(unit entry-meta:noltbook)
        ?~  meta.i.found  ~
        `u.meta.i.found(rev +(rev.u.meta.i.found), updated now.bowl)
      =/  target-id=@da  id.i.found
      =/  new-msgs=(list message:noltbook)
        %+  turn  cur
        |=  m=message:noltbook
        ?.  =(id.m target-id)  m
        m(text text.act, edited &, meta new-meta)
      =/  edited=message:noltbook  i.found(text text.act, edited &, meta new-meta)
      =/  upd=update:noltbook  [%message-edited note-id.act edited]
      =/  pax=path  ~[%notes note-id.act]
      :_  this(messages (~(put by messages) note-id.act new-msgs))
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
    ::
        %delete-message
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  DM: peer-authoritative — delete locally and replicate
      ?:  =(%dm type.u.exists)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
        =/  found=(list message:noltbook)
          ?~  eid.act
            (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.act))))
          ?~  by-eid
            (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
          by-eid
        ?~  found  `this
        ?.  =(our.bowl author.i.found)  `this
        =/  target-id=@da  id.i.found
        =/  kept=(list message:noltbook)
          (skim cur |=(m=message:noltbook !=(id.m target-id)))
        =/  del-eid=(unit @uv)
          ?~  meta.i.found  ~
          `eid.u.meta.i.found
        =/  del-upd=update:noltbook  [%message-deleted note-id.act target-id del-eid]
        =/  pax=path  ~[%notes note-id.act]
        =/  other=@p
          =/  others=(list @p)  (skim ~(tap in users.u.exists) |=(p=@p !=(p our.bowl)))
          ?~  others  our.bowl
          i.others
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[[%pass /dm-del/[note-id.act] %agent [other %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-delete-msg note-id.act msg-id.act eid.act])]]
        :_  this(messages (~(put by messages) note-id.act kept))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(del-upd)]] ~[[%give %fact ~[/notes] %noltbook-update !>(del-upd)]] peer-cards)
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[[%pass /msg-del/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-delete-msg note-id.act msg-id.act eid.act])]]
      ::  creator: find message by eid (preferred) or msg-id (fallback)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  found=(list message:noltbook)
        ?~  eid.act
          (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
        =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.act))))
        ?~  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.act)))
        by-eid
      ?~  found  `this
      =/  is-group=?  (gth ~(wyt in users.u.exists) 2)
      ?.  ?|  =(our.bowl author.i.found)
              is-group
          ==
        `this
      =/  target-id=@da  id.i.found
      =/  kept=(list message:noltbook)
        (skim cur |=(m=message:noltbook !=(id.m target-id)))
      =/  is-host-del=?  &(is-group !=(our.bowl author.i.found))
      =/  sys-msg=(unit message:noltbook)
        ?.  is-host-del  ~
        =/  vic=@t  (scot %p author.i.found)
        =/  txt=@t  (crip (weld "\01SYS:host-delete:" (trip vic)))
        `[now.bowl note-id.act our.bowl txt now.bowl ~ %.n ~]
      =/  new-msgs=(list message:noltbook)
        ?~  sys-msg  kept
        (weld kept ~[u.sys-msg])
      =/  del-eid=(unit @uv)
        ?~  meta.i.found  ~
        `eid.u.meta.i.found
      =/  del-upd=update:noltbook  [%message-deleted note-id.act target-id del-eid]
      =/  pax=path  ~[%notes note-id.act]
      =/  facts=(list card)
        ?~  sys-msg
          :~  [%give %fact ~[pax] %noltbook-update !>(del-upd)]
              [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
          ==
        :~  [%give %fact ~[pax] %noltbook-update !>(del-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
            [%give %fact ~[pax] %noltbook-update !>(`update:noltbook`[%new-message u.sys-msg])]
            [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%new-message u.sys-msg])]
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
      ::  read-only toggle: adjust muted set for %group notes
      =/  new-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  mute-changed=?  %.n
      ::  Write -> Read Only: mute all non-host non-admin members
      ?:  &(writable.u.old !writable.act =(%group type.u.old))
        =/  admins=(set @p)  (fall (~(get by note-admins) id.act) ~)
        =.  new-muted
          %-  ~(rep in users.u.old)
          |=  [p=@p acc=(set @p)]
          ?:  =(p creator.u.old)  acc
          ?:  (~(has in admins) p)  acc
          (~(put in acc) p)
        =.  mute-changed  %.y
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        :_  this(notes (~(put by notes) id.act upd-note), note-muted (~(put by note-muted) id.act new-muted))
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(mute-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]
        ==
      ::  Read Only -> Write: clear muted set broadly
      ?:  &(!writable.u.old writable.act =(%group type.u.old))
        =.  new-muted  ~
        =.  mute-changed  %.y
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        :_  this(notes (~(put by notes) id.act upd-note), note-muted (~(put by note-muted) id.act new-muted))
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(mute-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]
        ==
      ::  no writable change or not %group — just update meta
      :_  this(notes (~(put by notes) id.act upd-note))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %invite-to-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  gossip: any member can invite; group: host or admin; others: host only
      ?.  ?|  =(our.bowl creator.u.old)
              &(=(%gossip type.u.old) (~(has in users.u.old) our.bowl))
              &(=(%group type.u.old) (~(has in (fall (~(get by note-admins) id.act) ~)) our.bowl))
          ==
        `this
      ::  %dm is strictly 2-user; cannot invite into DM
      ?:  =(%dm type.u.old)  `this
      ::  non-host group admin: forward invite request to host
      ?:  &(=(%group type.u.old) !=(our.bowl creator.u.old))
        =/  host=@p  creator.u.old
        :_  this
        ~[[%pass /mod-out/(scot %p host)/[id.act] %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %invite-member ship.act])]]
      ::  compute new user set
      =/  new-users=(set @p)  (~(put in users.u.old) ship.act)
      =/  new-removed=(set @p)  (~(del in removed.u.old) ship.act)
      =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
      ::  poke remote ship with invite (gossip notes use gossip-invite with headline)
      =/  poke-card=card
        ?:  =(%gossip type.u.old)
          =/  hl=(unit @t)  (~(get by headlines) id.act)
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.u.old our.bowl users.new-note hl]
          [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
        =/  rem=remote:noltbook  [%remote-invite id.act name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
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
      ::  auto-mute invitee if note is read-only (group only, skip host/admin)
      =/  ro-muted=(set @p)
        ?.  &(!writable.u.old =(%group type.u.old))
          (fall (~(get by note-muted) id.act) ~)
        ?.  =(ship.act creator.u.old)
          ?.  (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act)
            (~(put in (fall (~(get by note-muted) id.act) ~)) ship.act)
          (fall (~(get by note-muted) id.act) ~)
        (fall (~(get by note-muted) id.act) ~)
      =/  ro-mute-cards=(list card)
        ?.  &(!writable.u.old =(%group type.u.old))  ~
        ?:  =(ship.act creator.u.old)  ~
        ?:  (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act)  ~
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in ro-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, pal-outgoing new-outgoing, note-muted (~(put by note-muted) id.act ro-muted))
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd ro-mute-cards)
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
        ::  local: only notes we host for profile discovery
        =/  pub-notes=(list note:noltbook)
          %+  skim  ~(val by notes)
          |=  n=note:noltbook
          ?&  =(%group type.n)
              =(our.bowl creator.n)
              ?|(?=(%public visibility.n) ?=(%private visibility.n))
          ==
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
        :~  [%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]
            [%pass /block-notify/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-blocked ~])]
        ==
      =/  upd=update:noltbook  [%pal-update ship.act %blocked]
      ::  pass 1: remove blocked ship from blocker-hosted %group notes + clean role state
      =/  removal-result=[new-notes=(map @ta note:noltbook) new-admins=(map @ta (set @p)) new-muted=(map @ta (set @p)) cards=(list card)]
        =/  nn=(map @ta note:noltbook)  notes
        =/  na=(map @ta (set @p))  note-admins
        =/  nm=(map @ta (set @p))  note-muted
        =/  cc=(list card)  ~
        %-  ~(rep by notes)
        |=  [[nid=@ta n=note:noltbook] acc=[nn=(map @ta note:noltbook) na=(map @ta (set @p)) nm=(map @ta (set @p)) cc=(list card)]]
        ?.  =(our.bowl creator.n)  acc
        ?.  =(%group type.n)  acc
        ?.  (~(has in users.n) ship.act)  acc
        =/  new-users=(set @p)  (~(del in users.n) ship.act)
        =/  upd-note=note:noltbook  n(users new-users)
        =/  users-upd=update:noltbook  [%note-users-updated nid type.n ~(tap in new-users) ~(tap in removed.n)]
        =/  kick-card=card
          [%pass /kick/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick nid name.n])]
        ::  clean admin/muted role state for removed ship
        =/  ca=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by na.acc) nid) ~)
          ?:  (~(has in cur) ship.act)
            (~(put by na.acc) nid (~(del in cur) ship.act))
          na.acc
        =/  cm=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by nm.acc) nid) ~)
          ?:  (~(has in cur) ship.act)
            (~(put by nm.acc) nid (~(del in cur) ship.act))
          nm.acc
        [nn=(~(put by nn.acc) nid upd-note) na=ca nm=cm cc=[kick-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] cc.acc]]
      ::  pass 2: auto-leave all %group notes hosted by blocked ship
      =/  leave-result=[new-notes=(map @ta note:noltbook) new-msgs=(map @ta (list message:noltbook)) new-arts=(map @ta artifact:noltbook) cards=(list card)]
        =/  nn=(map @ta note:noltbook)  new-notes.removal-result
        =/  nm=(map @ta (list message:noltbook))  messages
        =/  na=(map @ta artifact:noltbook)  artifacts
        =/  cc=(list card)  ~
        %-  ~(rep by new-notes.removal-result)
        |=  [[nid=@ta n=note:noltbook] acc=[nn=(map @ta note:noltbook) nm=(map @ta (list message:noltbook)) na=(map @ta artifact:noltbook) cc=(list card)]]
        ?.  =(ship.act creator.n)  acc
        ?.  =(%group type.n)  acc
        ?.  (~(has in users.n) our.bowl)  acc
        =/  del-upd=update:noltbook  [%note-deleted nid]
        =/  leave-card=card
          [%pass /leave-out/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-leave nid])]
        =/  cleaned-na=(map @ta artifact:noltbook)
          %-  ~(rep by na.acc)
          |=  [[k=@ta v=artifact:noltbook] a=(map @ta artifact:noltbook)]
          ?.  =(note-id.v nid)  (~(put by a) k v)
          a
        [nn=(~(del by nn.acc) nid) nm=(~(del by nm.acc) nid) na=cleaned-na cc=[leave-card [%give %fact ~[/notes] %noltbook-update !>(del-upd)] cc.acc]]
      ::  clean up any pending join-requests from blocked ship
      =/  new-jr=(map @ta (set @p))
        %-  ~(rep by join-requests)
        |=  [[nid=@ta ships=(set @p)] acc=(map @ta (set @p))]
        =/  cleaned=(set @p)  (~(del in ships) ship.act)
        ?:  =(~ cleaned)  acc
        (~(put by acc) nid cleaned)
      :_  this(notes new-notes.leave-result, messages new-msgs.leave-result, artifacts new-arts.leave-result, note-admins new-admins.removal-result, note-muted new-muted.removal-result, pal-outgoing new-outgoing, pal-incoming new-incoming, pal-blocked new-blocked, join-requests new-jr)
      :(weld [[%give %fact ~[/notes] %noltbook-update !>(upd)] ~] bye-cards cards.removal-result cards.leave-result)
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
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%pass /unblock-notify/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-unblocked ~])]
      ==
    ::
        %clear-mentions
      ::  clear all unread mentions for a note
      =.  mentions  (~(del by mentions) note-id.act)
      `this
    ::
        %clear-mention
      ::  clear a single mention by eid (preferred) or msg-id (fallback)
      =/  cur=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) note-id.act) ~)
      =/  new=(list [id=@da eid=(unit @uv) author=@p])
        ?^  eid.act
          ::  eid-first: match directly on stored eid
          %+  skip  cur
          |=  [id=@da eid=(unit @uv) author=@p]
          &(?=(^ eid) =(u.eid u.eid.act))
        ::  no eid: fallback to ms-precision msg-id matching
        =/  ms-unit=@  (div ~s1 1.000)
        =/  target-ms=@ud  (div (sub msg-id.act ~1970.1.1) ms-unit)
        %+  skip  cur
        |=  [id=@da eid=(unit @uv) author=@p]
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
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %remove-member ship.act])]]
      ::  host or admin can remove members
      ?.  (has-mod-power our.bowl id.act creator.u.old note-admins)  `this
      ::  can't remove yourself
      ?:  =(ship.act our.bowl)  `this
      ::  admin cannot remove host or other admins
      ?:  =(ship.act creator.u.old)  `this
      ?:  &(!=(our.bowl creator.u.old) (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act))  `this
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
      =/  users-upd=update:noltbook  [%note-users-updated id.act type.u.old ~(tap in new-users) ~(tap in new-removed)]
      =/  msg-upd=update:noltbook  [%new-message sys-msg]
      ::  clean up admin/muted sets for removed member
      =/  clean-admins=(map @ta (set @p))
        =/  cur=(set @p)  (fall (~(get by note-admins) id.act) ~)
        ?:  (~(has in cur) ship.act)
          (~(put by note-admins) id.act (~(del in cur) ship.act))
        note-admins
      =/  clean-muted=(map @ta (set @p))
        =/  cur=(set @p)  (fall (~(get by note-muted) id.act) ~)
        ?:  (~(has in cur) ship.act)
          (~(put by note-muted) id.act (~(del in cur) ship.act))
        note-muted
      :_  this(notes (~(put by notes) id.act upd-note), messages (~(put by messages) id.act new-msgs), note-admins clean-admins, note-muted clean-muted)
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
      ::  helper: remove artifacts belonging to this note
      =/  cleaned-arts=(map @ta artifact:noltbook)
        %-  ~(rep by artifacts)
        |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
        ?.  =(note-id.v id.act)  (~(put by acc) k v)
        acc
      ::  dm leave: local-only cleanup, counterparty keeps their copy intact
      ?:  =(%dm type.u.old)
        =/  upd=update:noltbook  [%note-deleted id.act]
        :_  this(notes (~(del by notes) id.act), messages (~(del by messages) id.act), artifacts cleaned-arts)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  sole user: act like delete
      ?:  (lte user-count 1)
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
        =/  upd=update:noltbook  [%note-deleted id.act]
        :_  this(notes (~(del by trimmed) id.act), messages (~(del by messages) id.act), artifacts cleaned-arts)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  host leaving shared note: notify other users via kick, then drop locally
      ?:  is-host
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  pax=path  ~[%notes id.act]
        =/  kick-cards=(list card)
          %+  murn  ~(tap in users.u.old)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `[%pass /kick-out/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick id.act name.u.old])]
        :_  this(notes (~(del by notes) id.act), messages (~(del by messages) id.act), artifacts cleaned-arts)
        :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] kick-cards)
      ::  non-host leaving shared note: unsub, poke host, drop locally
      =/  host=@p  creator.u.old
      =/  unsub-card=card
        [%pass /remote-note/[id.act] %agent [host %noltbook] %leave ~]
      =/  leave-card=card
        [%pass /leave-out/(scot %p host)/[id.act] %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-leave id.act])]
      =/  upd=update:noltbook  [%note-deleted id.act]
      :_  this(notes (~(del by notes) id.act), messages (~(del by messages) id.act), artifacts cleaned-arts)
      ~[unsub-card leave-card [%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %create-dm
      ?:  =(ship.act our.bowl)  `this
      ::  cannot create DM with a blocked ship
      ?:  (~(has in pal-blocked) ship.act)  `this
      =/  target-users=(set @p)  (sy ~[our.bowl ship.act])
      ::  find existing DM root for this exact pair
      =/  dm-root  (find-dm-root notes target-users)
      ?^  dm-root
        ::  DM root exists — refocus it
        =/  upd=update:noltbook  [%note-created u.dm-root]
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  no DM root — create one
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-dm=note:noltbook
        :*  nid  (scot %p ship.act)  %dm  our.bowl  target-users  ~  ~  ~  ~  %secret  ~  &  ~  ~
        ==
      ::  invite counterparty to DM root
      =/  rem=remote:noltbook  [%remote-invite nid name.new-dm %dm our.bowl target-users %secret &]
      =/  poke-card=card
        [%pass /invite/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      ::  peer setup
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
      =/  upd=update:noltbook  [%note-created new-dm]
      :_  this(notes (~(put by notes) nid new-dm), messages (~(put by messages) nid *(list message:noltbook)), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ::
        %convert-to-dm
      ::  convert a solo %group note into the canonical DM for {us, ship}
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?.  =(%group type.u.old)  `this
      ?.  ?=(~ parent.u.old)  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  =(~(wyt in users.u.old) 1)  `this
      ?.  =(%secret visibility.u.old)  `this
      ::  must not already have a DM for this pair
      =/  target-users=(set @p)  (sy ~[our.bowl ship.act])
      =/  dm-root  (find-dm-root notes target-users)
      ?^  dm-root  `this
      ::  convert in place: type->dm, add user, set name
      =/  new-note=note:noltbook
        u.old(type %dm, users target-users, name (scot %p ship.act))
      =/  upd=update:noltbook  [%note-created new-note]
      ::  invite remote
      =/  rem=remote:noltbook  [%remote-invite id.act name.new-note %dm our.bowl target-users %secret &]
      =/  poke-card=card
        [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      ::  peer setup
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
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards hey-cards pal-status-upd)
    ::
        %merge-into-dm
      ::  move content from a solo %group note into existing canonical DM, delete source
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?.  =(%group type.u.old)  `this
      ?.  ?=(~ parent.u.old)  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  =(~(wyt in users.u.old) 1)  `this
      ?.  =(%secret visibility.u.old)  `this
      ::  find existing DM for this pair
      =/  target-users=(set @p)  (sy ~[our.bowl ship.act])
      =/  dm-root  (find-dm-root notes target-users)
      ?~  dm-root  `this
      =/  dm-id=@ta  id.u.dm-root
      ::  gather source messages and re-post into DM
      =/  src-msgs=(list message:noltbook)  (fall (~(get by messages) id.act) ~)
      =/  dm-msgs=(list message:noltbook)  (fall (~(get by messages) dm-id) ~)
      =/  cur-seq=@ud  (fall (~(get by seq-counters) dm-id) 0)
      =/  new-msgs=(list message:noltbook)  dm-msgs
      =/  msg-cards=(list card)  ~
      =/  idx=@ud  0
      =/  seq=@ud  cur-seq
      |-
      ?~  src-msgs
        ::  done — migrate artifacts, delete source note, update DM
        =/  src-arts=(list artifact:noltbook)
          %+  skim  ~(val by artifacts)
          |=(a=artifact:noltbook =(note-id.a id.act))
        =/  new-arts=(map @ta artifact:noltbook)
          %-  ~(rep by artifacts)
          |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
          ?:  =(note-id.v id.act)
            (~(put by acc) k v(note-id dm-id))
          (~(put by acc) k v)
        =/  art-cards=(list card)
          %+  turn  src-arts
          |=  a=artifact:noltbook
          =/  migrated=artifact:noltbook  a(note-id dm-id)
          [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%artifact-created migrated])]
        =/  del-upd=update:noltbook  [%note-deleted id.act]
        =/  dm-preview=(unit @t)
          =/  last=(list message:noltbook)  (flop new-msgs)
          ?~  last  last-preview.u.dm-root
          `text.i.last
        =/  dm-note=note:noltbook  u.dm-root(last-author `our.bowl, last-preview dm-preview)
        :_  %=  this
              notes       (~(put by (~(del by notes) id.act)) dm-id dm-note)
              messages    (~(put by (~(del by messages) id.act)) dm-id new-msgs)
              artifacts   new-arts
              seq-counters  (~(put by seq-counters) dm-id seq)
            ==
        %+  weld
          [[%give %fact ~[/notes] %noltbook-update !>(del-upd)] ~]
        %+  weld  msg-cards
        %+  weld  art-cards
        ^-  (list card)
        ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created dm-note])]]
      =/  m=message:noltbook  i.src-msgs
      =/  nxt-seq=@ud  +(seq)
      =/  new-id=@da  (add now.bowl idx)
      =/  em=(unit entry-meta:noltbook)
        `[(sham [our.bowl new-id nxt-seq]) nxt-seq 0 new-id new-id ~]
      =/  new-msg=message:noltbook
        [new-id dm-id author.m text.m new-id ~ %.n em]
      =/  msg-upd=update:noltbook  [%new-message new-msg]
      =/  pax=path  ~[%notes dm-id]
      %=  $
        src-msgs   t.src-msgs
        idx        +(idx)
        seq        nxt-seq
        new-msgs   (snoc new-msgs new-msg)
        msg-cards  %+  weld  msg-cards
                   ^-  (list card)
                   :~  [%give %fact ~[pax] %noltbook-update !>(msg-upd)]
                       [%give %fact ~[/notes] %noltbook-update !>(msg-upd)]
                       [%pass /dm-msg/[dm-id] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message dm-id new-msg])]
                   ==
      ==
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
        :~  [%pass /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) %agent [author.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fetch-gossip-msg nid our.bowl msg-id.act eid.act])]
        ==
      :~  [%pass /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) %agent [author.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fetch-cover-msg our.bowl msg-id.act eid.act])]
      ==
    ::
        %request-join
      ::  requester asks host to join a note
      ::  send remote-join-request to host
      :_  this
      :~  [%pass /join-req/(scot %p host.act)/[note-id.act] %agent [host.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-request note-id.act])]
      ==
    ::
        %approve-join
      ::  host or admin approves a pending join request — do full invite flow
      =/  old  (~(get by notes) note-id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[note-id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod note-id.act %approve-join ship.act])]]
      ?.  (has-mod-power our.bowl note-id.act creator.u.old note-admins)  `this
      ::  %dm is strictly 2-user; cannot join a DM
      ?:  =(%dm type.u.old)  `this
      ::  remove from pending requests
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.act) *(set @p))
      ?.  (~(has in pending) ship.act)  `this
      =/  new-pending=(set @p)  (~(del in pending) ship.act)
      =.  join-requests
        ?:  =(~ new-pending)  (~(del by join-requests) note-id.act)
        (~(put by join-requests) note-id.act new-pending)
      ::  add user to note
      =/  new-users=(set @p)  (~(put in users.u.old) ship.act)
      =/  new-removed=(set @p)  (~(del in removed.u.old) ship.act)
      =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
      ::  send invite to the approved ship
      =/  rem=remote:noltbook  [%remote-invite note-id.act name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
      =/  poke-card=card
        [%pass /invite/(scot %p ship.act)/[note-id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      ::  peer setup
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
      =/  users-upd=update:noltbook  [%note-users-updated note-id.act type.u.old ~(tap in new-users) ~(tap in new-removed)]
      ::  emit updated join-request-list so host frontend removes processed request
      =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
        %-  zing
        %+  turn  ~(tap by join-requests)
        |=  [nid=@ta ships=(set @p)]
        =/  n  (~(get by notes) nid)
        ?~  n  ~
        (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
      =/  jr-upd=update:noltbook  [%join-request-list jr-list]
      ::  auto-mute approved user if note is read-only
      =/  ro-muted=(set @p)
        ?.  !writable.u.old  (fall (~(get by note-muted) note-id.act) ~)
        (~(put in (fall (~(get by note-muted) note-id.act) ~)) ship.act)
      =/  ro-mute-cards=(list card)
        ?.  !writable.u.old  ~
        =/  mute-upd=update:noltbook  [%muted-updated note-id.act ~(tap in ro-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[note-id.act]] %noltbook-update !>(mute-upd)]]
      :_  this(notes (~(put by notes) note-id.act new-note), peers new-peers, pal-outgoing new-outgoing, note-muted (~(put by note-muted) note-id.act ro-muted))
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.act]] %noltbook-update !>(users-upd)] [%give %fact ~[/notes] %noltbook-update !>(jr-upd)] ~] ars-cards hey-cards pal-status-upd ro-mute-cards)
    ::
        %deny-join
      ::  host or admin denies a pending join request (no block)
      =/  old  (~(get by notes) note-id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[note-id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod note-id.act %deny-join ship.act])]]
      ?.  (has-mod-power our.bowl note-id.act creator.u.old note-admins)  `this
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.act) *(set @p))
      ?.  (~(has in pending) ship.act)  `this
      =/  new-pending=(set @p)  (~(del in pending) ship.act)
      =.  join-requests
        ?:  =(~ new-pending)  (~(del by join-requests) note-id.act)
        (~(put by join-requests) note-id.act new-pending)
      ::  emit updated join-request-list so host frontend removes processed request
      =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
        %-  zing
        %+  turn  ~(tap by join-requests)
        |=  [nid=@ta ships=(set @p)]
        =/  n  (~(get by notes) nid)
        ?~  n  ~
        (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
      =/  jr-upd=update:noltbook  [%join-request-list jr-list]
      ::  tell requester they were denied
      :_  this
      :~  [%pass /join-deny/(scot %p ship.act)/[note-id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-denied note-id.act])]
          [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
      ==
    ::
        %deny-block-join
      ::  host or admin denies + blocks the requester
      ::  host: global pal-block; admin: note-scoped removed
      =/  old  (~(get by notes) note-id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[note-id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod note-id.act %deny-block-join ship.act])]]
      ?.  (has-mod-power our.bowl note-id.act creator.u.old note-admins)  `this
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.act) *(set @p))
      ?.  (~(has in pending) ship.act)  `this
      =/  new-pending=(set @p)  (~(del in pending) ship.act)
      =.  join-requests
        ?:  =(~ new-pending)  (~(del by join-requests) note-id.act)
        (~(put by join-requests) note-id.act new-pending)
      =/  deny-card=card
        [%pass /join-deny/(scot %p ship.act)/[note-id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-denied note-id.act])]
      ::  emit updated join-request-list so host frontend removes processed request
      =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
        %-  zing
        %+  turn  ~(tap by join-requests)
        |=  [nid=@ta ships=(set @p)]
        =/  n  (~(get by notes) nid)
        ?~  n  ~
        (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
      =/  jr-upd=update:noltbook  [%join-request-list jr-list]
      ::  host: global pal-block
      ?:  =(our.bowl creator.u.old)
        =/  new-blocked=(set @p)  (~(put in pal-blocked) ship.act)
        =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
        =/  new-incoming=(set @p)  (~(del in pal-incoming) ship.act)
        =/  pal-upd=update:noltbook  [%pal-update ship.act %blocked]
        :_  this(pal-blocked new-blocked, pal-outgoing new-outgoing, pal-incoming new-incoming)
        :~  deny-card
            [%give %fact ~[/notes] %noltbook-update !>(pal-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
        ==
      ::  admin: note-scoped block (add to removed)
      =/  new-removed=(set @p)  (~(put in removed.u.old) ship.act)
      =/  upd-note=note:noltbook  u.old(removed new-removed)
      =/  users-upd=update:noltbook  [%note-users-updated note-id.act type.u.old ~(tap in users.u.old) ~(tap in new-removed)]
      :_  this(notes (~(put by notes) note-id.act upd-note))
      :~  deny-card
          [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes/[note-id.act]] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
      ==
    ::
        %make-admin
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only host can assign admins
      ?.  =(our.bowl creator.u.old)  `this
      ::  must be a current member (not host themselves)
      ?.  (~(has in users.u.old) ship.act)  `this
      ?:  =(ship.act our.bowl)  `this
      =/  cur-admins=(set @p)  (fall (~(get by note-admins) id.act) ~)
      =/  new-admins=(set @p)  (~(put in cur-admins) ship.act)
      =/  upd=update:noltbook  [%admins-updated id.act ~(tap in new-admins)]
      ::  read-only invariant: admins must not be muted
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  was-muted=?  (~(has in cur-muted) ship.act)
      =/  new-muted=(set @p)
        ?.  &(!writable.u.old =(%group type.u.old) was-muted)  cur-muted
        (~(del in cur-muted) ship.act)
      =/  mute-cards=(list card)
        ?.  &(!writable.u.old =(%group type.u.old) was-muted)  ~
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]]
      :_  this(note-admins (~(put by note-admins) id.act new-admins), note-muted (~(put by note-muted) id.act new-muted))
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]] mute-cards)
    ::
        %remove-admin
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  only host can remove admins
      ?.  =(our.bowl creator.u.old)  `this
      =/  cur-admins=(set @p)  (fall (~(get by note-admins) id.act) ~)
      ?.  (~(has in cur-admins) ship.act)  `this
      =/  new-admins=(set @p)  (~(del in cur-admins) ship.act)
      =/  upd=update:noltbook  [%admins-updated id.act ~(tap in new-admins)]
      ::  read-only invariant: demoted member must be muted
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  should-mute=?  &(!writable.u.old =(%group type.u.old) (~(has in users.u.old) ship.act))
      =/  new-muted=(set @p)
        ?.  should-mute  cur-muted
        (~(put in cur-muted) ship.act)
      =/  mute-cards=(list card)
        ?.  should-mute  ~
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]]
      :_  this(note-admins (~(put by note-admins) id.act new-admins), note-muted (~(put by note-muted) id.act new-muted))
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] ~[[%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]] mute-cards)
    ::
        %mute-member
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %mute-member ship.act])]]
      ::  host or admin can mute
      ?.  (has-mod-power our.bowl id.act creator.u.old note-admins)  `this
      ::  must be a current member, not host, not admin
      ?.  (~(has in users.u.old) ship.act)  `this
      ?:  =(ship.act creator.u.old)  `this
      ?:  (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act)  `this
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  new-muted=(set @p)  (~(put in cur-muted) ship.act)
      =/  upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
      :_  this(note-muted (~(put by note-muted) id.act new-muted))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %unmute-member
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[[%pass /mod-fwd/[id.act] %agent [creator.u.old %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %unmute-member ship.act])]]
      ::  host or admin can unmute
      ?.  (has-mod-power our.bowl id.act creator.u.old note-admins)  `this
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      ?.  (~(has in cur-muted) ship.act)  `this
      =/  new-muted=(set @p)  (~(del in cur-muted) ship.act)
      =/  upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
      :_  this(note-muted (~(put by note-muted) id.act new-muted))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ==
  ::
      %noltbook-remote
    =/  rem  !<(remote:noltbook vase)
    ?-  -.rem
    ::
        %remote-invite
      ::  someone invited us to their note
      ::  reject invites from blocked ships; for DMs notify sender so they clean up
      ?:  (~(has in pal-blocked) src.bowl)
        ?.  =(%dm type.rem)  `this
        :_  this
        ~[[%pass /dm-block-rej/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-dm-blocked note-id.rem])]]
      =/  new-note=note:noltbook
        [note-id.rem name.rem type.rem creator.rem users.rem ~ ~ ~ ~ visibility.rem ~ writable.rem ~ ~]
      ::  root-uniqueness: dedup dm roots (one root per exact user pair)
      =/  dup
        ?.  =(%dm type.rem)  ~
        (find-root notes users.rem type.rem)
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
            ==
        :(weld head-cards ars-cards)
      ::  no collision: original path
      ::  add creator to peers, subscribe to their ars notoria
      =/  new-peers=(set @p)  (~(put in peers) creator.rem)
      =/  is-new-peer=?  !(~(has in peers) creator.rem)
      =/  ars-cards=(list card)
        ?.  is-new-peer
          ~
        ~[[%pass /ars/(scot %p creator.rem) %agent [creator.rem %noltbook] %watch /notes/cover]]
      ::  notify local frontend (peers only, no pal intent on receive)
      =/  upd=update:noltbook  [%note-created new-note]
      ::  subscribe to creator for live updates (skip cover — ars handles it)
      ?:  =(note-id.rem %cover)
        :_  this(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers)
        :(weld [[%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards)
      =/  sub-card=card
        [%pass /remote-note/[note-id.rem] %agent [creator.rem %noltbook] %watch /notes/[note-id.rem]]
      :_  this(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers)
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards)
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
            headlines  new-headlines
          ==
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards)
    ::
        %remote-message
      ::  a remote user sent a message to a note we host
      ::  reject if sender is blocked
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  reject if sender was removed from note
      ?:  (~(has in removed.u.old) src.bowl)  `this
      ::  reject if sender is muted in this note
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `this
      ::  verify: we must be creator (or DM peer), sender must be in users
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      ::  DM validation: message author must match sender
      ?:  &(=(%dm type.u.old) !=(src.bowl author.msg.rem))  `this
      ::  host assigns authoritative entry-meta for regular notes
      =/  is-regular=?
        ?&  !=(%cover type.u.old)
            !=(%gossip type.u.old)
            !=(note-id.rem %ars-rumors)
        ==
      =/  cur-seq=@ud  (fall (~(get by seq-counters) note-id.rem) 0)
      =/  nxt-seq=@ud  ?:(is-regular +(cur-seq) 0)
      ::  resolve reply-to-eid: look up parent message's eid
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ::  DM dedup: poke may race with subscription delivery
      =/  rm-eid=(unit @uv)  ?~(meta.msg.rem ~ `eid.u.meta.msg.rem)
      ?:  ?&  =(%dm type.u.old)
              ?|  (lien cur |=(m=message:noltbook =(id.m id.msg.rem)))
                  ?&  ?=(^ rm-eid)
                      (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.rm-eid))))
                  ==
              ==
          ==
        `this
      =/  reply-eid=(unit @uv)
        ?.  is-regular  ~
        ?~  reply-to.msg.rem  ~
        ::  prefer sender-supplied reply-to-eid when present
        =/  sender-eid=(unit @uv)
          ?~(meta.msg.rem ~ reply-to-eid.u.meta.msg.rem)
        ?^  sender-eid  sender-eid
        ::  fallback: look up parent by timestamp
        =/  parent=(list message:noltbook)  (skim cur |=(m=message:noltbook =(id.m u.reply-to.msg.rem)))
        ?~  parent  ~
        ?~  meta.i.parent  ~
        `eid.u.meta.i.parent
      =/  host-meta=(unit entry-meta:noltbook)
        ?.  is-regular  ~
        `[(sham [src.bowl now.bowl nxt-seq]) nxt-seq 0 timestamp.msg.rem now.bowl reply-eid]
      ::  DM: preserve sender-authored meta; hosted: override with host meta
      =/  stamped=message:noltbook
        ?:  =(%dm type.u.old)  msg.rem
        msg.rem(meta host-meta)
      =/  upd=update:noltbook  [%new-message stamped]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      ::  mention detection: check if @~our appears in message text
      =/  mentioned=?  (has-our-mention text.msg.rem our.bowl)
      =/  stamped-eid=(unit @uv)
        ?~  meta.stamped  ~
        `eid.u.meta.stamped
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update note-id.rem ~[[id.stamped stamped-eid author.msg.rem]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) note-id.rem) ~)
        (~(put by mentions) note-id.rem (snoc cur-m [id.stamped stamped-eid author.msg.rem]))
      =/  new-seq=(map @ta @ud)
        ?:  =(%dm type.u.old)  seq-counters
        ?:(is-regular (~(put by seq-counters) note-id.rem nxt-seq) seq-counters)
      :_  this(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur stamped)), mentions new-mentions, seq-counters new-seq)
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
      =/  meid=(unit @uv)  ?~(meta.msg.rem ~ `eid.u.meta.msg.rem)
      ::  dedup: eid-first (stable identity), fall back to msg-id (compat)
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg.rem)))
              ?&  ?=(^ meid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.meid))))
              ==
          ==
        `this
      ?:  ?|  (~(has by cenv) id.msg.rem)
              ?&  ?=(^ meid)
                  (lien ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.meid))))
              ==
          ==
        `this
      =/  my-hops=@ud  (add hops.rem 1)
      =/  mentioned=?  &(!=(author.msg.rem our.bowl) (has-our-mention text.msg.rem our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update %cover ~[[id.msg.rem meid author.msg.rem]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg.rem meid author.msg.rem]))
      =/  env=envelope:noltbook  [author.msg.rem id.msg.rem timestamp.msg.rem reply-to.msg.rem (sham text.msg.rem) meta.msg.rem]
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
      ::  dedup: eid-first (stable identity), fall back to msg-id (compat)
      =/  env-eid=(unit @uv)  ?~(meta.env ~ `eid.u.meta.env)
      ?:  ?|  (~(has by cenv) msg-id.env)
              ?&  ?=(^ env-eid)
                  (lien ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.env-eid))))
              ==
          ==
        `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))
              ?&  ?=(^ env-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.env-eid))))
              ==
          ==
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
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?&(=(author.m our.bowl) ?~(meta.m %.n =(eid.u.meta.m u.eid.rem)))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook &(=(id.m msg-id.rem) =(author.m our.bowl))))
        (skim cur |=(m=message:noltbook &(=(id.m msg-id.rem) =(author.m our.bowl))))
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
      =/  reply-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      ::  dedup: eid-first, fall back to msg-id
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
              ?&  ?=(^ reply-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.reply-eid))))
              ==
          ==
        `this
      ::  envelope lookup: eid-first, fall back to msg-id
      =/  env=(unit envelope:noltbook)
        ?:  ?=(^ reply-eid)
          =/  by-eid  (skim ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.reply-eid))))
          ?^  by-eid  `i.by-eid
          (~(get by cenv) id.msg)
        (~(get by cenv) id.msg)
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
      =/  meid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update %cover ~[[id.msg meid author.msg]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg meid author.msg]))
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
      ::  dedup: eid-first (stable identity), fall back to msg-id (compat)
      =/  env-eid=(unit @uv)  ?~(meta.env ~ `eid.u.meta.env)
      ?:  ?|  (~(has by nenv) msg-id.env)
              ?&  ?=(^ env-eid)
                  (lien ~(val by nenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.env-eid))))
              ==
          ==
        `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))
              ?&  ?=(^ env-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.env-eid))))
              ==
          ==
        `this
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
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?&(=(author.m our.bowl) ?~(meta.m %.n =(eid.u.meta.m u.eid.rem)))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook &(=(id.m msg-id.rem) =(author.m our.bowl))))
        (skim cur |=(m=message:noltbook &(=(id.m msg-id.rem) =(author.m our.bowl))))
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
      =/  reply-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      ::  dedup: eid-first, fall back to msg-id
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
              ?&  ?=(^ reply-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.reply-eid))))
              ==
          ==
        `this
      ::  envelope lookup: eid-first, fall back to msg-id
      =/  env=(unit envelope:noltbook)
        ?:  ?=(^ reply-eid)
          =/  by-eid  (skim ~(val by nenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.reply-eid))))
          ?^  by-eid  `i.by-eid
          (~(get by nenv) id.msg)
        (~(get by nenv) id.msg)
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
      =/  meid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        =/  mupd=update:noltbook  [%mention-update nid ~[[id.msg meid author.msg]]]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mupd)]]
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) nid) ~)
        (~(put by mentions) nid (snoc cur-m [id.msg meid author.msg]))
      ::  do NOT persist full message — ephemeral forward only
      =/  upd=update:noltbook  [%cover-msg-content nid msg]
      :_  this(gossip-envelopes new-envs, mentions new-mentions)
      (weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] mention-cards)
    ::
        %remote-rumor
      ::  RUMORS: anonymous gossip from a peer. Identity model is
      ::  content-hash (not entry-meta) — see %send-message %ars-rumors.
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %ars-rumors) ~)
      ::  content-hash identity: dedup by (sham text)
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
      ::  someone is asking for our joinable notes
      ::  blocked ships cannot browse our hosted notes
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ::  only %group notes we host with public/private visibility
      =/  pub-notes=(list note:noltbook)
        %+  skim  ~(val by notes)
        |=  n=note:noltbook
        ?&  =(%group type.n)
            =(our.bowl creator.n)
            ?|(?=(%public visibility.n) ?=(%private visibility.n))
        ==
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
      ::  send our profile to the new peer (peers only, no pal intent)
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      :_  this(peers new-peers)
      :~  [%pass /ars/(scot %p target) %agent [target %noltbook] %watch /notes/cover]
          [%pass /prof-out/(scot %p target) %agent [target %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      ==
    ::
        %remote-edit-msg
      ::  remote user editing their own message in a note we host (or DM peer)
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      ::  reject if muted
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.rem))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
        (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `this
      ::  only the author can edit their own msg
      ?.  =(src.bowl author.i.found)  `this
      ::  host updates meta: increment rev, set updated timestamp
      =/  new-meta=(unit entry-meta:noltbook)
        ?~  meta.i.found  ~
        `u.meta.i.found(rev +(rev.u.meta.i.found), updated now.bowl)
      =/  target-id=@da  id.i.found
      =/  new-msgs=(list message:noltbook)
        %+  turn  cur
        |=  m=message:noltbook
        ?.  =(id.m target-id)  m
        m(text text.rem, edited &, meta new-meta)
      =/  edited=message:noltbook  i.found(text text.rem, edited &, meta new-meta)
      =/  upd=update:noltbook  [%message-edited note-id.rem edited]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(messages (~(put by messages) note-id.rem new-msgs))
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
    ::
        %remote-create-child
      ::  a user in our shared note asked us to create a child
      =/  old  (~(get by notes) parent-id.rem)
      ?~  old  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      ::  DMs cannot have children
      ?:  =(%dm type.u.old)  `this
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  name.rem  %group  our.bowl  users.u.old  ~  `parent-id.rem  ~  ~  %secret  ~  &  ~  ~
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
      ::  remote user deleting their own message in a note we host (or DM peer)
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      ::  reject if muted
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.rem))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
        (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `this
      ::  only the author can delete their own msg via remote
      ?.  =(src.bowl author.i.found)  `this
      =/  target-id=@da  id.i.found
      =/  new-msgs=(list message:noltbook)
        (skim cur |=(m=message:noltbook !=(id.m target-id)))
      =/  del-eid=(unit @uv)
        ?~  meta.i.found  ~
        `eid.u.meta.i.found
      =/  upd=update:noltbook  [%message-deleted note-id.rem target-id del-eid]
      =/  pax=path  ~[%notes note-id.rem]
      :_  this(messages (~(put by messages) note-id.rem new-msgs))
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
      ==
    ::
        %remote-leave
      ::  a user left a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  DMs use local-only leave; ignore remote-leave for DMs
      ?:  =(%dm type.u.old)  `this
      ::  only host processes group/other leaves
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  new-users=(set @p)  (~(del in users.u.old) src.bowl)
      =/  pax=path  ~[%notes note-id.rem]
      ::  keep note for remaining user — just remove the leaver
      =/  new-note=note:noltbook  u.old(users new-users)
      ::  strip leaver from admin/muted sets
      =/  was-admin=?  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) src.bowl)
      =/  clean-admins=(map @ta (set @p))
        ?.  was-admin  note-admins
        (~(put by note-admins) note-id.rem (~(del in (fall (~(get by note-admins) note-id.rem) ~)) src.bowl))
      =/  was-muted=?  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)
      =/  clean-muted=(map @ta (set @p))
        ?.  was-muted  note-muted
        (~(put by note-muted) note-id.rem (~(del in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl))
      =/  users-upd=update:noltbook
        [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in removed.u.old)]
      =/  admin-cards=(list card)
        ?.  was-admin  ~
        =/  adm-upd=update:noltbook  [%admins-updated note-id.rem ~(tap in (fall (~(get by clean-admins) note-id.rem) ~))]
        [[%give %fact ~[/notes] %noltbook-update !>(adm-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(adm-upd)] ~]
      =/  muted-cards=(list card)
        ?.  was-muted  ~
        =/  mut-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in (fall (~(get by clean-muted) note-id.rem) ~))]
        [[%give %fact ~[/notes] %noltbook-update !>(mut-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(mut-upd)] ~]
      =/  base-cards=(list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)]
        ==
      :_  this(notes (~(put by notes) note-id.rem new-note), note-admins clean-admins, note-muted clean-muted)
      :(weld base-cards admin-cards muted-cards)
    ::
        %remote-root-exists
      ::  we lost a root-uniqueness race; drop loser, adopt canonical
      ::  protect system notes from root-exists manipulation
      ?:  |(=(losing-id.rem %cover) =(losing-id.rem %ars-rumors))  `this
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
        %remote-blocked
      ::  someone blocked us — persist in blocked-by and notify frontend
      =/  upd=update:noltbook  [%blocked-notification src.bowl]
      :_  this(blocked-by (~(put in blocked-by) src.bowl))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-unblocked
      ::  someone unblocked us — remove from blocked-by and notify frontend
      =/  upd=update:noltbook  [%unblocked-notification src.bowl]
      :_  this(blocked-by (~(del in blocked-by) src.bowl))
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-dm-blocked
      ::  our DM invite was rejected because we are blocked — clean up ghost DM
      ::  only delete if this is clearly our just-created shell (we created it,
      ::  sender is a member, and no messages have been exchanged yet)
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(%dm type.u.old)  `this
      ?.  =(our.bowl creator.u.old)  `this
      ?.  (~(has in users.u.old) src.bowl)  `this
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ?.  =(~ msgs)  `this
      =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
      :_  this(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem))
      ~[[%give %fact ~[/notes] %noltbook-update !>(del-upd)]]
    ::
        %remote-note-deleted
      ::  host deleted a note we were in
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(src.bowl creator.u.old)  `this
      =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
      =/  notif-upd=update:noltbook  [%note-deleted-notification note-id.rem note-name.rem]
      =/  unsub-card=card
        [%pass /remote-note/[note-id.rem] %agent [src.bowl %noltbook] %leave ~]
      :_  this(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem))
      :~  unsub-card
          [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
          [%give %fact ~[/notes] %noltbook-update !>(notif-upd)]
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
    ::
        %remote-join-request
      ::  someone wants to join one of our notes
      ::  reject from blocked ships
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  must be our note
      ?.  =(our.bowl creator.u.old)  `this
      ::  already a member? no-op
      ?:  (~(has in users.u.old) src.bowl)  `this
      ::  only %group notes are joinable
      ?.  =(%group type.u.old)  `this
      ::  secret notes: deny silently
      ?:  =(%secret visibility.u.old)  `this
      ::  removed users cannot rejoin — tell them explicitly
      ?:  (~(has in removed.u.old) src.bowl)
        :_  this
        ~[[%pass /join-removed/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-removed note-id.rem])]]
      ::  public notes: auto-approve (immediate invite)
      ?:  =(%public visibility.u.old)
        =/  new-users=(set @p)  (~(put in users.u.old) src.bowl)
        =/  new-removed=(set @p)  (~(del in removed.u.old) src.bowl)
        =/  nid=@ta  note-id.rem
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite nid name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          [%pass /invite/(scot %p src.bowl)/[nid] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(inv)]
        =/  new-peers=(set @p)  (~(put in peers) src.bowl)
        =/  is-new-peer=?  !(~(has in peers) src.bowl)
        =/  ars-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /ars/(scot %p src.bowl) %agent [src.bowl %noltbook] %watch /notes/cover]]
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed)]
        ::  auto-mute joiner if note is read-only
        =/  ro-muted=(set @p)
          ?.  !writable.u.old  (fall (~(get by note-muted) nid) ~)
          (~(put in (fall (~(get by note-muted) nid) ~)) src.bowl)
        =/  ro-mute-cards=(list card)
          ?.  !writable.u.old  ~
          =/  mute-upd=update:noltbook  [%muted-updated nid ~(tap in ro-muted)]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[nid]] %noltbook-update !>(mute-upd)]]
        :_  this(notes (~(put by notes) note-id.rem new-note), peers new-peers, note-muted (~(put by note-muted) nid ro-muted))
        :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)] ~] ars-cards ro-mute-cards)
      ::  private notes: queue pending request
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
      ::  already pending? send pending confirmation, no duplicate
      ?:  (~(has in pending) src.bowl)
        :_  this
        :~  [%pass /join-pending/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-pending note-id.rem])]
        ==
      ::  add to pending set
      =.  join-requests  (~(put by join-requests) note-id.rem (~(put in pending) src.bowl))
      ::  notify host frontend + admins + confirm pending to requester
      =/  jr-upd=update:noltbook  [%join-request-received note-id.rem src.bowl name.u.old]
      :_  this
      :~  [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
          [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(jr-upd)]
          [%pass /join-pending/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-pending note-id.rem])]
      ==
    ::
        %remote-join-pending
      ::  host confirmed our request is pending
      =/  upd=update:noltbook  [%join-requested note-id.rem src.bowl]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-join-denied
      ::  host denied our join request
      =/  upd=update:noltbook  [%join-denied note-id.rem src.bowl]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-join-removed
      ::  host says we're removed from this note — cannot rejoin
      =/  upd=update:noltbook  [%join-removed note-id.rem src.bowl]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-mod
      ::  remote admin forwarding moderation action to host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ::  must be our note
      ?.  =(our.bowl creator.u.old)  `this
      ::  src must be current member AND admin of this note
      ?.  (~(has in users.u.old) src.bowl)  `this
      ?.  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) src.bowl)  `this
      ::  dispatch by mod-type
      ?+  mod-type.rem  `this
          %remove-member
        ::  admin cannot remove host or other admins
        ?:  =(target.rem our.bowl)  `this
        ?:  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) target.rem)  `this
        ?.  (~(has in users.u.old) target.rem)  `this
        =/  new-users=(set @p)  (~(del in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(put in removed.u.old) target.rem)
        =/  upd-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  kick-card=card
          [%pass /kick/(scot %p target.rem)/[note-id.rem] %agent [target.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick note-id.rem name.u.old])]
        =/  sys-text=@t  (crip (weld (trip (scot %p target.rem)) " removed from note"))
        =/  sys-msg=message:noltbook  [now.bowl note-id.rem our.bowl sys-text now.bowl ~ %.n ~]
        =/  old-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
        =/  new-msgs=(list message:noltbook)  (snoc old-msgs sys-msg)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed)]
        =/  msg-upd=update:noltbook  [%new-message sys-msg]
        =/  clean-admins=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by note-admins) note-id.rem) ~)
          ?:  (~(has in cur) target.rem)
            (~(put by note-admins) note-id.rem (~(del in cur) target.rem))
          note-admins
        =/  clean-muted=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by note-muted) note-id.rem) ~)
          ?:  (~(has in cur) target.rem)
            (~(put by note-muted) note-id.rem (~(del in cur) target.rem))
          note-muted
        :_  this(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem new-msgs), note-admins clean-admins, note-muted clean-muted)
        :~  kick-card
            [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(msg-upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(msg-upd)]
        ==
      ::
          %mute-member
        ?.  (~(has in users.u.old) target.rem)  `this
        ?:  =(target.rem creator.u.old)  `this
        ?:  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) target.rem)  `this
        =/  cur-muted=(set @p)  (fall (~(get by note-muted) note-id.rem) ~)
        =/  new-muted=(set @p)  (~(put in cur-muted) target.rem)
        =/  upd=update:noltbook  [%muted-updated note-id.rem ~(tap in new-muted)]
        :_  this(note-muted (~(put by note-muted) note-id.rem new-muted))
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(upd)]
        ==
      ::
          %unmute-member
        =/  cur-muted=(set @p)  (fall (~(get by note-muted) note-id.rem) ~)
        ?.  (~(has in cur-muted) target.rem)  `this
        =/  new-muted=(set @p)  (~(del in cur-muted) target.rem)
        =/  upd=update:noltbook  [%muted-updated note-id.rem ~(tap in new-muted)]
        :_  this(note-muted (~(put by note-muted) note-id.rem new-muted))
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(upd)]
        ==
      ::
          %approve-join
        ::  same logic as local %approve-join but triggered by remote admin
        ?:  =(%dm type.u.old)  `this
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `this
        =/  new-pending=(set @p)  (~(del in pending) target.rem)
        =.  join-requests
          ?:  =(~ new-pending)  (~(del by join-requests) note-id.rem)
          (~(put by join-requests) note-id.rem new-pending)
        =/  new-users=(set @p)  (~(put in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(del in removed.u.old) target.rem)
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite note-id.rem name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          [%pass /invite/(scot %p target.rem)/[note-id.rem] %agent [target.rem %noltbook] %poke %noltbook-remote !>(inv)]
        =/  new-peers=(set @p)  (~(put in peers) target.rem)
        =/  is-new-peer=?  !(~(has in peers) target.rem)
        =/  ars-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /ars/(scot %p target.rem) %agent [target.rem %noltbook] %watch /notes/cover]]
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed)]
        =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
          %-  zing
          %+  turn  ~(tap by join-requests)
          |=  [nid=@ta ships=(set @p)]
          =/  n  (~(get by notes) nid)
          ?~  n  ~
          (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
        =/  jr-upd=update:noltbook  [%join-request-list jr-list]
        ::  auto-mute approved user if note is read-only
        =/  ro-muted=(set @p)
          ?.  !writable.u.old  (fall (~(get by note-muted) note-id.rem) ~)
          (~(put in (fall (~(get by note-muted) note-id.rem) ~)) target.rem)
        =/  ro-mute-cards=(list card)
          ?.  !writable.u.old  ~
          =/  mute-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in ro-muted)]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(mute-upd)]]
        :_  this(notes (~(put by notes) note-id.rem new-note), peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted))
        :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)] [%give %fact ~[/notes] %noltbook-update !>(jr-upd)] ~] ars-cards ro-mute-cards)
      ::
          %deny-join
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `this
        =/  new-pending=(set @p)  (~(del in pending) target.rem)
        =.  join-requests
          ?:  =(~ new-pending)  (~(del by join-requests) note-id.rem)
          (~(put by join-requests) note-id.rem new-pending)
        =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
          %-  zing
          %+  turn  ~(tap by join-requests)
          |=  [nid=@ta ships=(set @p)]
          =/  n  (~(get by notes) nid)
          ?~  n  ~
          (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
        =/  jr-upd=update:noltbook  [%join-request-list jr-list]
        :_  this
        :~  [%pass /join-deny/(scot %p target.rem)/[note-id.rem] %agent [target.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-denied note-id.rem])]
            [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
        ==
      ::
          %deny-block-join
        ::  admin deny-block: note-scoped block (add to removed)
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `this
        =/  new-pending=(set @p)  (~(del in pending) target.rem)
        =.  join-requests
          ?:  =(~ new-pending)  (~(del by join-requests) note-id.rem)
          (~(put by join-requests) note-id.rem new-pending)
        =/  new-removed=(set @p)  (~(put in removed.u.old) target.rem)
        =/  upd-note=note:noltbook  u.old(removed new-removed)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in users.u.old) ~(tap in new-removed)]
        =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
          %-  zing
          %+  turn  ~(tap by join-requests)
          |=  [nid=@ta ships=(set @p)]
          =/  n  (~(get by notes) nid)
          ?~  n  ~
          (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
        =/  jr-upd=update:noltbook  [%join-request-list jr-list]
        :_  this(notes (~(put by notes) note-id.rem upd-note))
        :~  [%pass /join-deny/(scot %p target.rem)/[note-id.rem] %agent [target.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-join-denied note-id.rem])]
            [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
        ==
      ::
          %invite-member
        ::  admin-forwarded invite: host performs canonical invite
        ?:  =(%dm type.u.old)  `this
        ?:  (~(has in users.u.old) target.rem)  `this
        =/  new-users=(set @p)  (~(put in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(del in removed.u.old) target.rem)
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite note-id.rem name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          [%pass /invite/(scot %p target.rem)/[note-id.rem] %agent [target.rem %noltbook] %poke %noltbook-remote !>(inv)]
        =/  new-peers=(set @p)  (~(put in peers) target.rem)
        =/  is-new-peer=?  !(~(has in peers) target.rem)
        =/  ars-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /ars/(scot %p target.rem) %agent [target.rem %noltbook] %watch /notes/cover]]
        =/  hey-cards=(list card)
          ?.  is-new-peer  ~
          ~[[%pass /pal-hey/(scot %p target.rem) %agent [target.rem %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]]
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed)]
        =/  pax=path  ~[%notes note-id.rem]
        ::  auto-mute invitee if note is read-only
        =/  ro-muted=(set @p)
          ?.  !writable.u.old  (fall (~(get by note-muted) note-id.rem) ~)
          (~(put in (fall (~(get by note-muted) note-id.rem) ~)) target.rem)
        =/  ro-mute-cards=(list card)
          ?.  !writable.u.old  ~
          =/  mute-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in ro-muted)]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[pax] %noltbook-update !>(mute-upd)]]
        :_  this(notes (~(put by notes) note-id.rem new-note), peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted))
        :(weld ~[poke-card] ~[[%give %fact ~[/notes] %noltbook-update !>(users-upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(users-upd)]] ars-cards hey-cards ro-mute-cards)
      ==
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
          =/  env-eid=(unit @uv)  ?~(meta.env ~ `eid.u.meta.env)
          ::  eid-first dedup against envelope map
          ?:  ?|  (~(has by note-envs) msg-id.env)
                  ?&  ?=(^ env-eid)
                      %+  lien  ~(val by note-envs)
                      |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.env-eid)))
                  ==
              ==
            `this
          =/  own-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ::  eid-first dedup against own messages
          ?:  ?|  (lien own-msgs |=(m=message:noltbook =(id.m msg-id.env)))
                  ?&  ?=(^ env-eid)
                      %+  lien  own-msgs
                      |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.env-eid)))
                  ==
              ==
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
            %+  skim  envelopes.upd
            |=  e=envelope:noltbook
            ?:  (~(has by note-envs) msg-id.e)  %.n
            =/  e-eid=(unit @uv)  ?~(meta.e ~ `eid.u.meta.e)
            ?~  e-eid  %.y
            =/  has=?
              %+  lien  ~(val by note-envs)
              |=(x=envelope:noltbook ?&(?=(^ meta.x) =(eid.u.meta.x u.e-eid)))
            !has
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
          =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ::  eid-first dedup against messages
          ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                  ?&  ?=(^ msg-eid)
                      %+  lien  cur
                      |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                  ==
              ==
            `this
          ::  eid-first envelope lookup, msg-id fallback
          =/  env=(unit envelope:noltbook)
            ?:  ?=(^ msg-eid)
              =/  eid-match
                %+  skim  ~(val by note-envs)
                |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
              ?^  eid-match  `i.eid-match
              (~(get by note-envs) id.msg)
            (~(get by note-envs) id.msg)
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
          =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ::  eid-first dedup against messages
          ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                  ?&  ?=(^ msg-eid)
                      %+  lien  cur
                      |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                  ==
              ==
            `this
          ::  eid-first dedup against envelopes
          ?:  ?|  (~(has by note-envs) id.msg)
                  ?&  ?=(^ msg-eid)
                      %+  lien  ~(val by note-envs)
                      |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
                  ==
              ==
            `this
          =/  my-hops=@ud  (add hops.upd 1)
          =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg) meta.msg]
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
          =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
          =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
          ::  eid-first dedup against messages
          ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                  ?&  ?=(^ msg-eid)
                      %+  lien  cur
                      |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                  ==
              ==
            `this
          ::  eid-first dedup against envelopes
          ?:  ?|  (~(has by note-envs) id.msg)
                  ?&  ?=(^ msg-eid)
                      %+  lien  ~(val by note-envs)
                      |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
                  ==
              ==
            `this
          =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg) meta.msg]
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
            (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
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
        ::  dedup: skip if already stored (DM poke may race subscription)
        =/  dd-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                ?&  ?=(^ dd-eid)
                    (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.dd-eid))))
                ==
            ==
          `this
        =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        ::  mention detection for subscribed notes
        =/  msg-eid=(unit @uv)
          ?~  meta.msg  ~
          `eid.u.meta.msg
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) nid) ~)
          (~(put by mentions) nid (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          =/  mupd=update:noltbook  [%mention-update nid ~[[id.msg msg-eid author.msg]]]
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
        ::  find by eid first, fall back to old id
        =/  edit-eid=(unit @uv)  ?~(meta.msg.upd ~ `eid.u.meta.msg.upd)
        ::  dedup: skip if edit already applied (same text + rev)
        =/  already=?
          %+  lien  msgs
          |=  m=message:noltbook
          ?&  =(text.m text.msg.upd)
              ?:  ?~(edit-eid %.n ?~(meta.m %.n =(eid.u.meta.m u.edit-eid)))
                ?~(meta.m %.n ?~(meta.msg.upd %.y =(rev.u.meta.m rev.u.meta.msg.upd)))
              ?.  =(id.m id.msg.upd)  %.n
              ?~(meta.m %.n ?~(meta.msg.upd %.y =(rev.u.meta.m rev.u.meta.msg.upd)))
          ==
        ?:  already  `this
        =/  new-msgs=(list message:noltbook)
          %+  turn  msgs
          |=  m=message:noltbook
          ?:  ?~  edit-eid  %.n
              ?~(meta.m %.n =(eid.u.meta.m u.edit-eid))
            msg.upd
          ?.  =(id.m id.msg.upd)  m
          msg.upd
        =.  messages  (~(put by messages) note-id.upd new-msgs)
        :_  this
        :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(upd)]
        ==
      ::
          %message-deleted
        =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.upd) ~)
        ::  find by eid first, fall back to old id
        =/  del-eid  eid.upd
        ::  dedup: skip if message already gone
        =/  still-here=?
          ?^  del-eid
            (lien msgs |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.del-eid))))
          (lien msgs |=(m=message:noltbook =(id.m msg-id.upd)))
        ?.  still-here  `this
        =/  new-msgs=(list message:noltbook)
          %+  skim  msgs
          |=  m=message:noltbook
          ?:  ?~  del-eid  %.n
              ?~(meta.m %.n =(eid.u.meta.m u.del-eid))
            %.n
          !=(id.m msg-id.upd)
        =.  messages  (~(put by messages) note-id.upd new-msgs)
        :_  this
        :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(upd)]
        ==
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
          (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %note-renamed
        ::  host renamed the note; sync locally
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(name name.upd))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %headline-updated
        ::  host updated headline; sync locally
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(headline headline.upd))
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %muted-updated
        ::  host updated muted set; store locally and relay to frontend
        =.  note-muted
          =/  ms=(set @p)  (sy muted.upd)
          ?:  =(~ ms)  (~(del by note-muted) id.upd)
          (~(put by note-muted) id.upd ms)
        :_  this
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::
          %admins-updated
        ::  host updated admin set; store locally and relay to frontend
        =.  note-admins
          =/  as=(set @p)  (sy admins.upd)
          ?:  =(~ as)  (~(del by note-admins) id.upd)
          (~(put by note-admins) id.upd as)
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
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  eid-first dedup against messages
        ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                ?&  ?=(^ msg-eid)
                    %+  lien  cur
                    |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                ==
            ==
          `this
        ::  eid-first dedup against envelopes
        ?:  ?|  (~(has by cover-envs) id.msg)
                ?&  ?=(^ msg-eid)
                    %+  lien  ~(val by cover-envs)
                    |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
                ==
            ==
          `this
        =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg) meta.msg]
        =/  eupd=update:noltbook  [%gossip-envelope %cover env 1]
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%mention-update %cover ~[[id.msg msg-eid author.msg]]])]]
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
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  eid-first dedup against messages
        ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                ?&  ?=(^ msg-eid)
                    %+  lien  cur
                    |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                ==
            ==
          `this
        ::  eid-first dedup against envelopes
        ?:  ?|  (~(has by cover-envs) id.msg)
                ?&  ?=(^ msg-eid)
                    %+  lien  ~(val by cover-envs)
                    |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
                ==
            ==
          `this
        =/  my-hops=@ud  (add hops.upd 1)
        =/  env=envelope:noltbook  [author.msg id.msg timestamp.msg reply-to.msg (sham text.msg) meta.msg]
        =/  eupd=update:noltbook  [%gossip-envelope %cover env my-hops]
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =?  mentions  mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  mentioned  ~
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%mention-update %cover ~[[id.msg msg-eid author.msg]]])]]
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
        =/  cur-eids=(set @uv)
          %-  sy
          %+  murn  cur
          |=(m=message:noltbook ?~(meta.m ~ `eid.u.meta.m))
        =/  env-eids=(set @uv)
          %-  sy
          %+  murn  ~(val by cover-envs)
          |=(e=envelope:noltbook ?~(meta.e ~ `eid.u.meta.e))
        =/  new-msgs=(list message:noltbook)
          %+  skim  messages.upd
          |=  m=message:noltbook
          ?:  ?|((~(has in cur-ids) id.m) (~(has in env-ids) id.m))  %.n
          =/  m-eid=(unit @uv)  ?~(meta.m ~ `eid.u.meta.m)
          ?~  m-eid  %.y
          ?:  ?|((~(has in cur-eids) u.m-eid) (~(has in env-eids) u.m-eid))  %.n
          %.y
        =/  own=(list message:noltbook)
          (skim new-msgs |=(m=message:noltbook =(author.m our.bowl)))
        =/  remote=(list message:noltbook)
          (skip new-msgs |=(m=message:noltbook =(author.m our.bowl)))
        =/  new-envs=(map @da envelope:noltbook)
          %-  ~(gas by *(map @da envelope:noltbook))
          %+  turn  remote
          |=  m=message:noltbook
          [id.m [author.m id.m timestamp.m reply-to.m (sham text.m) meta.m]]
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
        =/  env-eid=(unit @uv)  ?~(meta.env ~ `eid.u.meta.env)
        ::  eid-first dedup against envelope map
        ?:  ?|  (~(has by cover-envs) msg-id.env)
                ?&  ?=(^ env-eid)
                    %+  lien  ~(val by cover-envs)
                    |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.env-eid)))
                ==
            ==
          `this
        =/  cover-msgs=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  eid-first dedup against messages
        ?:  ?|  (lien cover-msgs |=(m=message:noltbook =(id.m msg-id.env)))
                ?&  ?=(^ env-eid)
                    %+  lien  cover-msgs
                    |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.env-eid)))
                ==
            ==
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
          %+  skim  envelopes.upd
          |=  e=envelope:noltbook
          ?:  (~(has by cover-envs) msg-id.e)  %.n
          =/  e-eid=(unit @uv)  ?~(meta.e ~ `eid.u.meta.e)
          ?~  e-eid  %.y
          =/  has=?
            %+  lien  ~(val by cover-envs)
            |=(x=envelope:noltbook ?&(?=(^ meta.x) =(eid.u.meta.x u.e-eid)))
          !has
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
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
        ::  eid-first dedup against messages
        ?:  ?|  (lien cur |=(m=message:noltbook =(id.m id.msg)))
                ?&  ?=(^ msg-eid)
                    %+  lien  cur
                    |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.msg-eid)))
                ==
            ==
          `this
        ::  eid-first envelope lookup, msg-id fallback
        =/  env=(unit envelope:noltbook)
          ?:  ?=(^ msg-eid)
            =/  eid-match
              %+  skim  ~(val by cover-envs)
              |=(e=envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.msg-eid)))
            ?^  eid-match  `i.eid-match
            (~(get by cover-envs) id.msg)
          (~(get by cover-envs) id.msg)
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
