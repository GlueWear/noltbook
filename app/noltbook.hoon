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
      state-27
      state-28
      state-29
      state-30
      state-31
      state-32
      state-33
      state-34
      state-35
      state-36
      state-37
      state-38
      state-39
      state-40
      state-41
      state-42
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
      artifacts=(map @ta artifact-pre40:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-4
  $:  %4
      notes=(map @ta note-4)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact-pre40:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
  ==
+$  state-5
  $:  %5
      notes=(map @ta note-4)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact-pre40:noltbook)
      profiles=(map @p profile-2)
      transactions=(list transaction:noltbook)
      current-note=@ta
      peers=(set @p)
  ==
+$  state-6
  $:  %6
      notes=(map @ta note-4)
      messages=(map @ta (list message-legacy))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
::  state-27: add artifact-envelopes for cover/gossip envelope mesh
+$  state-27
  $:  %27
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
  ==
::  state-28: add host-status map. Absence of a key means live. %host-deleted
::  marks notes whose remote host issued %remote-note-deleted; preserved
::  locally as read-only archive. %host-unreachable reserved for later.
+$  state-28
  $:  %28
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
  ==
::  state-29: add fork lineage maps. Absence of a key means default v1.
::    fork-origin: stable lineage id shared across all forks of one source.
::    fork-version: depth (1 = original). Used for "vN" badge.
::    fork-of: direct parent of this fork (host + source-nid).
+$  state-29
  $:  %29
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
  ==
::  state-30: pending-fork-invites stored FULL subtree payloads (deprecated
::  in state-31). Kept here for migration typing only.
+$  state-30-pending-fork-invite
  $:  sender=@p
      root-note=note:noltbook
      descendants=(list note:noltbook)
      source-name=@t
      source-version=@ud
      fork-origin=@uv
      received=@da
  ==
+$  state-30
  $:  %30
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta state-30-pending-fork-invite)
  ==
::  state-31: pending fork invites become metadata-only (privacy correct).
::  Add fork-invitees so the forker can authorize fetch requests.
+$  state-31
  $:  %31
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
  ==
::  state-32: add explicit contacts set (address book entries independent
::  of pal/profile state).
+$  state-32
  $:  %32
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
  ==
::  state-33: durable per-counterparty DM display prefs (name + icon-url).
::  Local-only; never broadcast. Survive %leave-note so a re-invited DM
::  re-applies the user's saved label/icon.
+$  dm-pref  $:(name=(unit @t) icon-url=(unit @t))
+$  state-33
  $:  %33
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
  ==
::  state-34: durable member-revisions per note. Each users/removed mutation
::  bumps the note's rev so out-of-order %note-users-updated facts can be
::  ignored by receivers without back-channel coordination.
+$  state-34
  $:  %34
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
  ==
::  state-35: explicit parent-version per forked note so future UI can say
::  "forked from v2 ~u2" without inferring from fork-version-1.
+$  state-35
  $:  %35
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
  ==
::  state-36: in-flight host reachability probes keyed by note id. Maps
::  to the @da deadline; the deadline is also encoded in the behn wire so
::  late wakes from prior probes are ignored.
+$  state-36
  $:  %36
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
  ==
::  state-37: durable acks for passive high-level condition notifications
::  (removed-status, host-deleted-status). Lets the logo red dot stay clear
::  after a hard refresh once the user has opened the grimoire menu.
+$  state-37
  $:  %37
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
  ==
::  state-38: durable per-note recency for sidebar ordering. Maps note id to
::  the @da time of its last relevant activity (open, create, message,
::  install, artifact). Absence = no recorded activity (sorts last).
+$  state-38
  $:  %38
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
      note-activity=(map @ta @da)
  ==
::  state-39: durable per-note last-read for green sidebar unread dots. A note
::  is unread when note-activity[nid] > note-read[nid]. Opening or marking a
::  note read advances note-read; own/local activity advances both so your own
::  posts never show as unread.
+$  state-39
  $:  %39
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
      note-activity=(map @ta @da)
      note-read=(map @ta @da)
  ==
::  state-40: artifacts gain meta=(unit entry-meta) for durable timeline
::  identity (Phase A). Only the artifacts map's value shape changes.
+$  state-40
  $:  %40
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
      note-activity=(map @ta @da)
      note-read=(map @ta @da)
  ==
::  state-41: durable backfill of artifact meta on legacy artifacts (same shape
::  as state-40; data-only migration). Every artifact with meta=~ gets a
::  deterministic eid so pre-Phase-A artifacts can be replied to / threaded.
+$  state-41
  $:  %41
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
      note-activity=(map @ta @da)
      note-read=(map @ta @da)
  ==
::  state-42: directed-attention system (Phase A). Adds `attention`, a typed
::  durable per-note attention list reserved for reply/send (Phase B). `mentions`
::  is kept and remains the SOLE source of truth for mention-attention. On
::  migration `attention` starts EMPTY; mention-attention is derived from the
::  `mentions` map at emit/boot time (not duplicated into state). Only the field
::  is added.
+$  state-42
  $:  %42
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
      artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
      host-status=(map @ta ?(%host-deleted %host-unreachable))
      fork-origin=(map @ta @uv)
      fork-version=(map @ta @ud)
      fork-of=(map @ta [host=@p nid=@ta])
      pending-fork-invites=(map @ta pending-fork-invite:noltbook)
      fork-invitees=(map @ta (set @p))
      contacts=(set @p)
      dm-prefs=(map @p dm-pref)
      member-revs=(map @ta @ud)
      fork-parent-version=(map @ta @ud)
      host-checks=(map @ta @da)
      notification-acks=(set durable-notification-ack:noltbook)
      note-activity=(map @ta @da)
      note-read=(map @ta @da)
      attention=(map @ta (list attention-item:noltbook))
  ==
::  state-26: add durable blocked-by set (ships that have blocked us)
+$  state-26
  $:  %26
      notes=(map @ta note:noltbook)
      messages=(map @ta (list message:noltbook))
      artifacts=(map @ta artifact-pre40:noltbook)
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
      artifacts=(map @ta artifact-pre40:noltbook)
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
::  Gossip reservoir caps are now NO-OPS. "What you store/pass" (the gossip
::  packet/message/envelope reservoir a ship carries) is intentionally separate
::  from "what you can see" (the top-100 visible window, a frontend rule applied
::  AFTER dial/pals visibility). The backend must not delete packets just because
::  the UI will later show 100. Arms are kept (no-op) so every call site compiles
::  unchanged; no state shape changes. gossip-cap retained for reference only.
++  gossip-cap  100
++  cap-envs
  |=  envs=(map @da envelope:noltbook)
  ^-  (map @da envelope:noltbook)
  envs
::
++  cap-msgs
  |=  [msgs=(list message:noltbook) is-gossip=?]
  ^-  (list message:noltbook)
  msgs
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
  ^-  state-42
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
  ^-  state-42
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
  ^-  state-42
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
  ^-  state-42
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
::  upgrade-30-to-31: drop any 6.1-style payload-bearing pending invites
::  (privacy-incorrect; can't be losslessly converted without source-root-id).
::  Initialize fork-invitees empty — forker has to send new invites for
::  in-flight forks to become fetchable.
++  upgrade-30-to-31
  |=  s=state-30
  ^-  state-42
  =?  s  (gth ~(wyt by pending-fork-invites.s) 0)
    ~&  [%dropping-legacy-pending-fork-invites count=~(wyt by pending-fork-invites.s)]
    s(pending-fork-invites *(map @ta state-30-pending-fork-invite))
  %-  upgrade-31-to-32
  :*  %31
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      *(map @ta pending-fork-invite:noltbook)
      *(map @ta (set @p))
  ==
::  upgrade-31-to-32: add empty contacts set
++  upgrade-31-to-32
  |=  s=state-31
  ^-  state-42
  %-  upgrade-32-to-33
  :*  %32
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      *(set @p)
  ==
::  upgrade-32-to-33: add empty dm-prefs map
++  upgrade-32-to-33
  |=  s=state-32
  ^-  state-42
  %-  upgrade-33-to-34
  :*  %33
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      *(map @p dm-pref)
  ==
::  upgrade-33-to-34: seed member-revs with rev=1 for every existing note
::  so subsequent host-bumped revs are strictly greater than the implicit
::  pre-migration value.
++  upgrade-33-to-34
  |=  s=state-33
  ^-  state-42
  =/  seeded-revs=(map @ta @ud)
    %-  ~(rep by notes.s)
    |=  [[k=@ta v=note:noltbook] acc=(map @ta @ud)]
    (~(put by acc) k 1)
  %-  upgrade-34-to-35
  :*  %34
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      seeded-revs
  ==
::  upgrade-34-to-35: add empty fork-parent-version map. Existing forks
::  without explicit parent-version fall back to fork-version-1 via the
::  encoder default.
++  upgrade-34-to-35
  |=  s=state-34
  ^-  state-42
  %-  upgrade-35-to-36
  :*  %35
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      *(map @ta @ud)
  ==
::  upgrade-35-to-36: add empty host-checks map.
++  upgrade-35-to-36
  |=  s=state-35
  ^-  state-42
  %-  upgrade-36-to-37
  :*  %36
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      *(map @ta @da)
  ==
::  upgrade-36-to-37: add empty notification-acks set.
++  upgrade-36-to-37
  |=  s=state-36
  ^-  state-42
  %-  upgrade-37-to-38
  :*  %37
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      *(set durable-notification-ack:noltbook)
  ==
::  upgrade-37-to-38: add note-activity recency map, seeded from the max
::  message timestamp/id of each note's stored messages. Notes with no
::  messages are omitted (no activity recorded → sort last). Pinned notes
::  (cover, ars-rumors) are excluded from seeding.
++  upgrade-37-to-38
  |=  s=state-37
  ^-  state-42
  =/  seeded=(map @ta @da)
    =/  pairs=(list [nid=@ta msgs=(list message:noltbook)])  ~(tap by messages.s)
    =/  acc=(map @ta @da)  *(map @ta @da)
    |-  ^-  (map @ta @da)
    ?~  pairs  acc
    =/  nid=@ta  nid.i.pairs
    =/  msgs=(list message:noltbook)  msgs.i.pairs
    ?:  |(=(nid %cover) =(nid %ars-rumors))  $(pairs t.pairs)
    ?~  msgs  $(pairs t.pairs)
    =/  latest=@da
      =/  ms=(list message:noltbook)  msgs
      =/  mx=@da  `@da`0
      |-  ^-  @da
      ?~  ms  mx
      $(ms t.ms, mx (max mx (max id.i.ms timestamp.i.ms)))
    ?:  =(`@da`0 latest)  $(pairs t.pairs)
    $(pairs t.pairs, acc (~(put by acc) nid latest))
  %-  upgrade-38-to-39
  :*  %38
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      notification-acks.s
      seeded
  ==
::  upgrade-38-to-39: add note-read (durable green-unread last-read). Seed it
::  from note-activity so existing active notes are NOT all marked unread on
::  upgrade (unread is strict activity > read; equal seeds = read).
++  upgrade-38-to-39
  |=  s=state-38
  ^-  state-42
  %-  upgrade-39-to-40
  :*  %39
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      notification-acks.s
      note-activity.s
      note-activity.s
  ==
::  upgrade-39-to-40: artifacts gain meta=~ (durable timeline identity is
::  stamped going forward; existing artifacts have no meta).
++  upgrade-39-to-40
  |=  s=state-39
  ^-  state-42
  =/  new-arts=(map @ta artifact:noltbook)
    %-  ~(run by artifacts.s)
    |=  a=artifact-pre40:noltbook
    ^-  artifact:noltbook
    [id.a name.a type.a creator.a note-id.a versions.a ~]
  ::  pipe through upgrade-40-to-41 so the meta=~ artifacts just built get their
  ::  durable eid backfilled in the same load (chain terminates at state-41).
  %-  upgrade-40-to-41
  :*  %40
      notes.s  messages.s  new-arts  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      notification-acks.s
      note-activity.s
      note-read.s
  ==
::  upgrade-40-to-41: durable backfill of artifact meta. Every artifact with
::  meta=~ gets meta=(artifact-meta creator id created ~), where `created` is the
::  FIRST version's timestamp (artifact creation time); eid is deterministic
::  (sham [creator id]) so the same artifact resolves identically across ships,
::  enabling replies/threading on pre-Phase-A artifacts. Existing meta preserved.
::  Byte hosting unchanged (only the meta field is populated).
++  upgrade-40-to-41
  |=  s=state-40
  ^-  state-42
  =/  new-arts=(map @ta artifact:noltbook)
    %-  ~(run by artifacts.s)
    |=  a=artifact:noltbook
    ^-  artifact:noltbook
    ?^  meta.a  a
    =/  when=@da
      ?~  versions.a  *@da
      timestamp.i.versions.a
    a(meta `(artifact-meta creator.a id.a when ~))
  ::  pipe through upgrade-41-to-42 so the chain terminates at state-42.
  %-  upgrade-41-to-42
  :*  %41
      notes.s  messages.s  new-arts  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      notification-acks.s
      note-activity.s
      note-read.s
  ==
::  upgrade-41-to-42: add directed-attention (Phase A). `attention` starts empty
::  and is reserved for Phase B reply/send. Existing mentions are NOT duplicated
::  into it; mention-attention is DERIVED from the `mentions` map at emit/boot time
::  (see all-attention / attn-mention-cards), so there is one source of truth and
::  no divergence. The frontend result is identical (state.attention contains the
::  mentions via %attention-update). Existing mention UX is unchanged.
++  upgrade-41-to-42
  |=  s=state-41
  ^-  state-42
  =/  att=(map @ta (list attention-item:noltbook))  ~
  :*  %42
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      pending-fork-invites.s
      fork-invitees.s
      contacts.s
      dm-prefs.s
      member-revs.s
      fork-parent-version.s
      host-checks.s
      notification-acks.s
      note-activity.s
      note-read.s
      att
  ==
::  upgrade-29-to-30: add pending-fork-invites map (empty).
++  upgrade-29-to-30
  |=  s=state-29
  ^-  state-42
  %-  upgrade-30-to-31
  :*  %30
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      fork-origin.s  fork-version.s  fork-of.s
      *(map @ta state-30-pending-fork-invite)
  ==
::  upgrade-28-to-29: add fork lineage maps. Empty by default; each existing
::  note is treated as v1 (origin computed lazily by note-lineage-of helper).
++  upgrade-28-to-29
  |=  s=state-28
  ^-  state-42
  %-  upgrade-29-to-30
  :*  %29
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      host-status.s
      *(map @ta @uv)
      *(map @ta @ud)
      *(map @ta [@p @ta])
  ==
::  upgrade-27-to-28: add host-status map for preserved host-deleted notes.
::  Initialized empty — every existing note is treated as live until the
::  remote host issues %remote-note-deleted post-upgrade.
++  upgrade-27-to-28
  |=  s=state-27
  ^-  state-42
  %-  upgrade-28-to-29
  :*  %28
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      artifact-envelopes.s
      *(map @ta ?(%host-deleted %host-unreachable))
  ==
::  upgrade-25-to-26: add blocked-by set
++  upgrade-26-to-27
  |=  s=state-26
  ^-  state-42
  %-  upgrade-27-to-28
  :*  %27
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      gossip-envelopes.s  headlines.s
      seq-counters.s  join-requests.s
      note-admins.s  note-muted.s
      *(map @ta (map @ta artifact-envelope:noltbook))
  ==
++  upgrade-25-to-26
  |=  s=state-25
  ^-  state-42
  %-  upgrade-26-to-27
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
  ^-  state-42
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
::  collect-notebook-descendants: walk a note's children recursively; collect
::  the ids of descendants whose type is %notebook. Root itself excluded —
::  caller flips the root explicitly.
++  collect-notebook-descendants
  |=  [root=@ta nmap=(map @ta note:noltbook)]
  ^-  (list @ta)
  =/  root-note=(unit note:noltbook)  (~(get by nmap) root)
  ?~  root-note  ~
  =/  queue=(list @ta)  children.u.root-note
  =/  acc=(list @ta)  ~
  |-
  ?~  queue  acc
  =/  cid=@ta  i.queue
  =/  cur=(unit note:noltbook)  (~(get by nmap) cid)
  ?~  cur  $(queue t.queue)
  =/  next-queue=(list @ta)  (weld t.queue children.u.cur)
  ?.  =(%notebook type.u.cur)  $(queue next-queue)
  $(queue next-queue, acc [cid acc])
::  apply-type-group: flip type of every id in ids to %group in nmap.
++  apply-type-group
  |=  [ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (map @ta note:noltbook)
  ?~  ids  nmap
  =/  cur=(unit note:noltbook)  (~(get by nmap) i.ids)
  ?~  cur  $(ids t.ids)
  $(ids t.ids, nmap (~(put by nmap) i.ids u.cur(type %group)))
::  build-type-update-cards: emit %note-type-updated fact cards for root id
::  plus every id in descendants. Both /notes and /notes/[id] paths.
++  build-type-update-cards
  |=  [root=@ta descendants=(list @ta)]
  ^-  (list card:agent:gall)
  =/  ids=(list @ta)  [root descendants]
  %-  zing
  %+  turn  ids
  |=  nid=@ta
  ^-  (list card:agent:gall)
  =/  cu=update:noltbook  [%note-type-updated nid %group]
  :~  [%give %fact ~[/notes] %noltbook-update !>(cu)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(cu)]
  ==
::  build-type-update-cards-by-ids: emit %note-type-updated facts on both
::  /notes and /notes/[id] for each id in ids. Caller supplies the exact
::  list (root + or - descendants) so this can emit for the precise set
::  that actually changed type.
++  build-type-update-cards-by-ids
  |=  ids=(list @ta)
  ^-  (list card:agent:gall)
  %-  zing
  %+  turn  ids
  |=  nid=@ta
  ^-  (list card:agent:gall)
  =/  cu=update:noltbook  [%note-type-updated nid %group]
  :~  [%give %fact ~[/notes] %noltbook-update !>(cu)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(cu)]
  ==
::  ===== Phase 3: membership propagation helpers =====
::  collect-group-descendants: BFS-ordered list of descendant ids (root
::  excluded) that are %group type AND share the root's creator. Same-creator
::  guard reserves room for forks/foreign subtrees later. BFS order so each
::  child appears after its parent — required for downstream %remote-child-note
::  delivery where the receiver must already have the parent.
++  collect-group-descendants
  |=  [root=@ta nmap=(map @ta note:noltbook)]
  ^-  (list @ta)
  =/  root-note=(unit note:noltbook)  (~(get by nmap) root)
  ?~  root-note  ~
  =/  host=@p  creator.u.root-note
  =/  queue=(list @ta)  children.u.root-note
  =/  acc=(list @ta)  ~
  |-
  ?~  queue  (flop acc)
  =/  cid=@ta  i.queue
  =/  cur=(unit note:noltbook)  (~(get by nmap) cid)
  ?~  cur  $(queue t.queue)
  ?.  &(=(%group type.u.cur) =(creator.u.cur host))
    $(queue t.queue)
  $(queue (weld t.queue children.u.cur), acc [cid acc])
::  collect-share-descendants: BFS-ordered list of descendant ids (root
::  excluded) treated as part of the shared subtree at invite time. Unlike
::  collect-group-descendants this tolerates %notebook nodes (which the
::  invite path normalizes to %group), so children created before the
::  share-time conversion are still picked up. Same-creator guard.
++  collect-share-descendants
  |=  [root=@ta nmap=(map @ta note:noltbook)]
  ^-  (list @ta)
  =/  root-note=(unit note:noltbook)  (~(get by nmap) root)
  ?~  root-note  ~
  =/  host=@p  creator.u.root-note
  =/  queue=(list @ta)  children.u.root-note
  =/  acc=(list @ta)  ~
  |-
  ?~  queue  (flop acc)
  =/  cid=@ta  i.queue
  =/  cur=(unit note:noltbook)  (~(get by nmap) cid)
  ?~  cur  $(queue t.queue)
  ?.  ?&  ?|(=(%group type.u.cur) =(%notebook type.u.cur))
          =(creator.u.cur host)
      ==
    $(queue t.queue)
  $(queue (weld t.queue children.u.cur), acc [cid acc])
::  add-ship-to-ids: for each id, add ship to users + remove from removed.
++  add-ship-to-ids
  |=  [ship=@p ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (map @ta note:noltbook)
  ?~  ids  nmap
  =/  cur=(unit note:noltbook)  (~(get by nmap) i.ids)
  ?~  cur  $(ids t.ids)
  =/  nu=(set @p)  (~(put in users.u.cur) ship)
  =/  nr=(set @p)  (~(del in removed.u.cur) ship)
  $(ids t.ids, nmap (~(put by nmap) i.ids u.cur(users nu, removed nr)))
::  remove-ship-from-ids: for each id, remove ship from users + add to removed
::  (kick semantics — host removed the ship).
++  remove-ship-from-ids
  |=  [ship=@p ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (map @ta note:noltbook)
  ?~  ids  nmap
  =/  cur=(unit note:noltbook)  (~(get by nmap) i.ids)
  ?~  cur  $(ids t.ids)
  =/  nu=(set @p)  (~(del in users.u.cur) ship)
  =/  nr=(set @p)  (~(put in removed.u.cur) ship)
  $(ids t.ids, nmap (~(put by nmap) i.ids u.cur(users nu, removed nr)))
::  clear-ship-from-ids: for each id, remove ship from users only — does not
::  mark as removed. Used when the ship voluntarily left.
++  clear-ship-from-ids
  |=  [ship=@p ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (map @ta note:noltbook)
  ?~  ids  nmap
  =/  cur=(unit note:noltbook)  (~(get by nmap) i.ids)
  ?~  cur  $(ids t.ids)
  =/  nu=(set @p)  (~(del in users.u.cur) ship)
  $(ids t.ids, nmap (~(put by nmap) i.ids u.cur(users nu)))
::  member-rev-of: current member rev for a note id (0 if absent).
++  member-rev-of
  |=  [nid=@ta revs=(map @ta @ud)]
  ^-  @ud
  (fall (~(get by revs) nid) 0)
::  bump-member-rev: increment member rev for one note id.
++  bump-member-rev
  |=  [nid=@ta revs=(map @ta @ud)]
  ^-  (map @ta @ud)
  (~(put by revs) nid (add 1 (member-rev-of nid revs)))
::  bump-member-revs: fold bump-member-rev over a list of ids.
++  bump-member-revs
  |=  [ids=(list @ta) revs=(map @ta @ud)]
  ^-  (map @ta @ud)
  ?~  ids  revs
  $(ids t.ids, revs (bump-member-rev i.ids revs))
::  build-users-updated-cards: emit %note-users-updated facts on both /notes
::  and /notes/[id] for each id, reading current users/removed/rev from
::  nmap + revs.
++  build-users-updated-cards
  |=  [ids=(list @ta) nmap=(map @ta note:noltbook) revs=(map @ta @ud)]
  ^-  (list card:agent:gall)
  %-  zing
  %+  turn  ids
  |=  nid=@ta
  ^-  (list card:agent:gall)
  =/  n=(unit note:noltbook)  (~(get by nmap) nid)
  ?~  n  ~
  =/  upd=update:noltbook
    [%note-users-updated nid type.u.n ~(tap in users.u.n) ~(tap in removed.u.n) (member-rev-of nid revs)]
  ^-  (list card:agent:gall)
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
  ==
::  build-remote-child-notes-to-ship: send %remote-child-note for each id in
::  ids to ship, ordering preserved so receiver sees each parent before its
::  child. Skips ids without a parent pointer.
++  build-remote-child-notes-to-ship
  |=  [ship=@p ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (list card:agent:gall)
  %+  murn  ids
  |=  nid=@ta
  ^-  (unit card:agent:gall)
  =/  n=(unit note:noltbook)  (~(get by nmap) nid)
  ?~  n  ~
  ?~  parent.u.n  ~
  `[%pass /child-out/(scot %p ship)/[nid] %agent [ship %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-child-note u.parent.u.n u.n])]
::  build-kick-cards-to-ship: send %remote-kick for each id to ship. Causes
::  receiver to drop their local copy via existing %remote-kick handler.
++  build-kick-cards-to-ship
  |=  [ship=@p ids=(list @ta) nmap=(map @ta note:noltbook)]
  ^-  (list card:agent:gall)
  %+  murn  ids
  |=  nid=@ta
  ^-  (unit card:agent:gall)
  =/  n=(unit note:noltbook)  (~(get by nmap) nid)
  ?~  n  ~
  `[%pass /kick/(scot %p ship)/[nid] %agent [ship %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick nid name.u.n])]
::  ===== Phase 4: delete cascade helpers =====
::  collect-all-descendants: BFS-ordered list of every descendant id (root
::  excluded), regardless of type. Used for delete cascade where the entire
::  subtree must be cleared.
++  collect-all-descendants
  |=  [root=@ta nmap=(map @ta note:noltbook)]
  ^-  (list @ta)
  =/  root-note=(unit note:noltbook)  (~(get by nmap) root)
  ?~  root-note  ~
  =/  queue=(list @ta)  children.u.root-note
  =/  acc=(list @ta)  ~
  |-
  ?~  queue  (flop acc)
  =/  cid=@ta  i.queue
  =/  cur=(unit note:noltbook)  (~(get by nmap) cid)
  ?~  cur  $(queue t.queue)
  $(queue (weld t.queue children.u.cur), acc [cid acc])
::  delete-artifacts-for-notes: drop artifacts whose note-id is in ids.
++  delete-artifacts-for-notes
  |=  [ids=(list @ta) arts=(map @ta artifact:noltbook)]
  ^-  (map @ta artifact:noltbook)
  =/  drop=(set @ta)  (sy ids)
  %-  ~(rep by arts)
  |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
  ?:  (~(has in drop) note-id.v)  acc
  (~(put by acc) k v)
::  build-note-deleted-cards: emit %note-deleted for every id (on /notes path
::  which the FE listens to for sidebar removal).
++  build-note-deleted-cards
  |=  ids=(list @ta)
  ^-  (list card:agent:gall)
  %+  turn  ids
  |=  nid=@ta
  ^-  card:agent:gall
  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-deleted nid])]
::  ===== Phase 5: host-deleted preservation helpers =====
::  is-host-deleted: tests whether a note id is marked host-deleted in the
::  given host-status map. Used to gate fork-vs-leave decisions where the
::  distinction between deleted and unreachable matters.
++  is-host-deleted
  |=  [nid=@ta hs=(map @ta ?(%host-deleted %host-unreachable))]
  ^-  ?
  =/  st  (~(get by hs) nid)
  ?~  st  %.n
  =(%host-deleted u.st)
::  is-pinned-note: cover and ars-rumors are pinned at the top of their
::  section and never participate in recency ordering.
++  is-pinned-note
  |=  nid=@ta
  ^-  ?
  ?|(=(nid %cover) =(nid %ars-rumors))
::  put-activity: record durable recency for a note. Skips pinned notes so
::  cover/ars-rumors stay pinned. Returns the (possibly unchanged) map.
++  put-activity
  |=  [na=(map @ta @da) nid=@ta time=@da]
  ^-  (map @ta @da)
  ?:  (is-pinned-note nid)  na
  (~(put by na) nid time)
::  activity-fact: /notes fact telling the local frontend to re-sort the
::  sidebar for one note. Caller must not emit this for pinned notes.
++  activity-fact
  |=  [nid=@ta time=@da]
  ^-  card
  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-activity nid time])]
::  put-read: record durable last-read for a note (green-unread cursor).
::  Skips pinned notes; never decreases an existing read timestamp.
++  put-read
  |=  [nr=(map @ta @da) nid=@ta time=@da]
  ^-  (map @ta @da)
  ?:  (is-pinned-note nid)  nr
  =/  cur=@da  (fall (~(get by nr) nid) `@da`0)
  (~(put by nr) nid (max cur time))
::  note-read-fact: /notes fact telling the local frontend a note's durable
::  last-read advanced (clears its green unread dot). Not for pinned notes.
++  note-read-fact
  |=  [nid=@ta time=@da]
  ^-  card
  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-read nid time])]
::  artifact-preview: compact sidebar preview text for a newly-created
::  artifact. "shared <name>" when named, else type-based fallback.
++  artifact-preview
  |=  art=artifact:noltbook
  ^-  @t
  ?.  =('' name.art)  (rap 3 'shared ' name.art ~)
  ?-  type.art
    %app   'shared an app'
    %file  'shared a file'
    %code  'shared a file'
  ==
::  art-env-preview: same, for a propagated artifact envelope (always %file).
++  art-env-preview
  |=  env=artifact-envelope:noltbook
  ^-  @t
  ?.  =('' name.env)  (rap 3 'shared ' name.env ~)
  'shared a file'
::  sidebar-signal: compact /notes fact for a closed-note dot/preview without
::  shipping full content. preview=~ = dot-only (frontend won't overwrite an
::  existing preview). Callers must not emit for pinned notes (cover/rumors).
++  sidebar-signal
  |=  [nid=@ta author=@p preview=(unit @t) kind=?(%message %artifact %gossip) time=@da]
  ^-  card
  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-sidebar-signal nid author preview kind time])]
::  is-host-unavailable: host-deleted OR host-unreachable. Either state
::  blocks writes against a remote-hosted note.
++  is-host-unavailable
  |=  [nid=@ta hs=(map @ta ?(%host-deleted %host-unreachable))]
  ^-  ?
  ?=(^ (~(get by hs) nid))
::  is-removed-self: tests whether we (us) are in note.removed for nid.
::  Used as a write-guard alongside is-host-unavailable.
++  is-removed-self
  |=  [nid=@ta nmap=(map @ta note:noltbook) us=@p]
  ^-  ?
  =/  n  (~(get by nmap) nid)
  ?~  n  %.n
  (~(has in removed.u.n) us)
::  is-write-blocked: convenience OR of host-unavailable and removed-self.
++  is-write-blocked
  |=  $:  nid=@ta
          hs=(map @ta ?(%host-deleted %host-unreachable))
          nmap=(map @ta note:noltbook)
          us=@p
      ==
  ^-  ?
  ?:  (is-host-unavailable nid hs)  %.y
  (is-removed-self nid nmap us)
::  build-host-status-cards: emit %note-host-status fact for each id setting
::  status, on both /notes and /notes/[id] paths.
++  build-host-status-cards
  |=  [ids=(list @ta) status=(unit ?(%host-deleted %host-unreachable))]
  ^-  (list card:agent:gall)
  %-  zing
  %+  turn  ids
  |=  nid=@ta
  ^-  (list card:agent:gall)
  =/  upd=update:noltbook  [%note-host-status nid status]
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
  ==
::  ===== Phase 6: fork helpers =====
::  gen-fork-id-map: assigns a fresh nid per old id by appending an index to
::  the base timestamp. Deterministic and unique within a single fork call.
++  gen-fork-id-map
  |=  [src-ids=(list @ta) base=@da]
  ^-  (map @ta @ta)
  =/  todo  src-ids
  =/  acc=(map @ta @ta)  ~
  =/  idx=@ud  0
  |-
  ?~  todo  acc
  =/  new-nid=@ta
    (crip (weld "note-" (trip (scot %da `@da`(add base idx)))))
  $(todo t.todo, idx +(idx), acc (~(put by acc) i.todo new-nid))
::  build-fork-notes: produce the new note records for a fork. Root takes
::  optional name override; descendants keep their original name. Type is
::  always %group. Creator = forker. Users = forker+invitees. removed
::  cleared. children/parent rewritten via id-map. Visibility/writable/
::  icon/headline copied from source.
++  build-fork-notes
  |=  $:  src-ids=(list @ta)
          id-map=(map @ta @ta)
          root-old-id=@ta
          name-override=(unit @t)
          source-notes=(map @ta note:noltbook)
          forker=@p
          new-users=(set @p)
      ==
  ^-  (list note:noltbook)
  %+  turn  src-ids
  |=  old-id=@ta
  ^-  note:noltbook
  =/  old-note  (~(got by source-notes) old-id)
  =/  new-id=@ta  (~(got by id-map) old-id)
  =/  new-children=(list @ta)
    %+  turn  children.old-note
    |=  c=@ta
    (fall (~(get by id-map) c) c)
  =/  new-parent=(unit @ta)
    ?:  =(old-id root-old-id)  ~
    ?~  parent.old-note  ~
    (~(get by id-map) u.parent.old-note)
  =/  use-name=@t
    ?:  &(=(old-id root-old-id) ?=(^ name-override))  u.name-override
    name.old-note
  :*  new-id  use-name  %group  forker  new-users  new-children  new-parent
      ~  ~
      visibility.old-note  icon-url.old-note  writable.old-note
      *(set @p)
      headline.old-note
  ==
::  copy-messages-for-fork: for each (old, new) pair, copy the messages list
::  from source map into the destination map under the new key.
++  copy-messages-for-fork
  |=  $:  pairs=(list [old=@ta new=@ta])
          src-msgs=(map @ta (list message:noltbook))
          dst=(map @ta (list message:noltbook))
      ==
  ^-  (map @ta (list message:noltbook))
  ?~  pairs  dst
  =/  ml=(list message:noltbook)
    (fall (~(get by src-msgs) old.i.pairs) ~)
  $(pairs t.pairs, dst (~(put by dst) new.i.pairs ml))
::  copy-headlines-for-fork: same idea for headlines.
++  copy-headlines-for-fork
  |=  $:  pairs=(list [old=@ta new=@ta])
          src-hl=(map @ta @t)
          dst=(map @ta @t)
      ==
  ^-  (map @ta @t)
  ?~  pairs  dst
  =/  cur  (~(get by src-hl) old.i.pairs)
  ?~  cur  $(pairs t.pairs)
  $(pairs t.pairs, dst (~(put by dst) new.i.pairs u.cur))
::  ===== Phase 6: fork lineage helpers =====
::  lineage-origin-of: read fork-origin for a note, deriving the default
::  (sham [creator id]) when the key is absent. Stable across forks.
++  lineage-origin-of
  |=  [n=note:noltbook fo=(map @ta @uv)]
  ^-  @uv
  =/  cur  (~(get by fo) id.n)
  ?^  cur  u.cur
  (sham [creator.n id.n])
::  lineage-version-of: read fork-version for a note, default 1.
++  lineage-version-of
  |=  [nid=@ta fv=(map @ta @ud)]
  ^-  @ud
  (fall (~(get by fv) nid) 1)
::  build-lineage-set-cards: emit %note-lineage-set facts for each id, using
::  current lineage state. /notes and /notes/[id].
++  build-lineage-set-cards
  |=  $:  ids=(list @ta)
          notes=(map @ta note:noltbook)
          fo=(map @ta @uv)
          fv=(map @ta @ud)
          fp=(map @ta [host=@p nid=@ta])
          fpv=(map @ta @ud)
      ==
  ^-  (list card:agent:gall)
  %-  zing
  %+  turn  ids
  |=  nid=@ta
  ^-  (list card:agent:gall)
  =/  n=(unit note:noltbook)  (~(get by notes) nid)
  ?~  n  ~
  =/  origin=@uv  (lineage-origin-of u.n fo)
  =/  version=@ud  (lineage-version-of nid fv)
  =/  parent=(unit [host=@p nid=@ta])  (~(get by fp) nid)
  ::  prefer stored explicit parent-version; otherwise fall back to v-1
  ::  for forks (v>1), or ~ for non-forks (v==1).
  =/  parent-ver=(unit @ud)
    =/  stored  (~(get by fpv) nid)
    ?^  stored  `u.stored
    ?:  (gth version 1)  `(sub version 1)
    ~
  =/  upd=update:noltbook  [%note-lineage-set nid origin version parent parent-ver]
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
  ==
::  upgrade-23-to-24: add join-requests map
++  upgrade-23-to-24
  |=  s=state-23
  ^-  state-42
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
::  dm-counterparty: return the other ship in a 2-user DM, or ~ if not a
::  well-formed DM users set including our.bowl.
++  dm-counterparty
  |=  [us=(set @p) me=@p]
  ^-  (unit @p)
  ?.  =(2 ~(wyt in us))  ~
  ?.  (~(has in us) me)  ~
  =/  others=(list @p)  (skim ~(tap in us) |=(p=@p !=(p me)))
  ?~  others  ~
  `i.others
::  apply-dm-pref: overlay local DM prefs onto an incoming/created DM note.
::  Returns the note with name + icon-url replaced by saved prefs if present.
++  apply-dm-pref
  |=  [n=note:noltbook prefs=(map @p dm-pref) me=@p]
  ^-  note:noltbook
  ?.  =(%dm type.n)  n
  =/  cp=(unit @p)  (dm-counterparty users.n me)
  ?~  cp  n
  =/  pref=(unit dm-pref)  (~(get by prefs) u.cp)
  ?~  pref  n
  =/  with-name=note:noltbook
    ?~  name.u.pref  n
    n(name u.name.u.pref)
  ?~  icon-url.u.pref  with-name
  with-name(icon-url icon-url.u.pref)
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
::  append-child-if-missing: snoc a child id onto a children list only if
::  not already present, preserving order.
++  append-child-if-missing
  |=  [c=@ta lst=(list @ta)]
  ^-  (list @ta)
  ?:  (lien lst |=(x=@ta =(x c)))  lst
  (snoc lst c)
::  find-orphan-children: scan notes for local entries whose parent is pid,
::  return their ids. Used when a parent root arrives after one of its
::  child notes — repairs root.children so the subtree renders.
++  find-orphan-children
  |=  [pid=@ta nmap=(map @ta note:noltbook)]
  ^-  (list @ta)
  %+  murn  ~(tap by nmap)
  |=  [k=@ta n=note:noltbook]
  ^-  (unit @ta)
  ?~  parent.n  ~
  ?.  =(u.parent.n pid)  ~
  `k
::  merge-children: start from base list, append any orphan ids not yet present.
++  merge-children
  |=  [base=(list @ta) extra=(list @ta)]
  ^-  (list @ta)
  ?~  extra  base
  $(extra t.extra, base (append-child-if-missing i.extra base))
::  ensure-system-notes: cover and rumors are infrastructure notes.
::  Repair them at runtime too, not just during on-load, so a ship with
::  damaged state can still boot the UI and post to cover.
++  ensure-system-notes
  |=  [nmap=(map @ta note:noltbook) mmap=(map @ta (list message:noltbook)) me=@p]
  ^-  [notes=(map @ta note:noltbook) messages=(map @ta (list message:noltbook))]
  =/  notes-out=(map @ta note:noltbook)  nmap
  =/  msgs-out=(map @ta (list message:noltbook))  mmap
  =/  cover=note:noltbook
    [%cover 'ARS NOTORIA' %cover me (sy ~[me]) ~ ~ ~ ~ %secret ~ & ~ ~]
  =/  rumors=note:noltbook
    [%ars-rumors 'RUMORS' %cover me (sy ~[me]) ~ ~ ~ ~ %secret ~ & ~ ~]
  =.  notes-out
    ?:  (~(has by notes-out) %cover)  notes-out
    (~(put by notes-out) %cover cover)
  =.  msgs-out
    ?:  (~(has by msgs-out) %cover)  msgs-out
    (~(put by msgs-out) %cover ~)
  =.  notes-out
    ?:  (~(has by notes-out) %ars-rumors)  notes-out
    (~(put by notes-out) %ars-rumors rumors)
  =.  msgs-out
    ?:  (~(has by msgs-out) %ars-rumors)  msgs-out
    (~(put by msgs-out) %ars-rumors ~)
  [notes-out msgs-out]
::  root-wins: does candidate a beat candidate b?
::  lower creator ship wins; tie → lower id (earlier) wins
++  root-wins
  |=  [a=[cr=@p id=@ta] b=[cr=@p id=@ta]]
  ^-  ?
  ?.  =(cr.a cr.b)  (lth `@`cr.a `@`cr.b)
  (lth `@`id.a `@`id.b)
::  parse-mime-path: split 'image/png' into knot list [%image %png ~]
++  parse-mime-path
  |=  m=@t
  ^-  (list @ta)
  =/  s=tape  (trip m)
  =/  parts=(list tape)  ~
  =/  cur=tape  ""
  |-
  ?~  s
    %+  turn  (snoc parts cur)
    |=(t=tape `@ta`(crip t))
  ?:  =('/' i.s)
    $(parts (snoc parts cur), cur "", s t.s)
  $(cur (snoc cur i.s), s t.s)
::  art-meta-json: build clay-backed artifact metadata blob
++  art-meta-json
  |=  [mime=@t kind=@t size=@ud version=@ud]
  ^-  @t
  %+  rap  3
  :~  '{"storage":"clay","mime":"'  mime  '","kind":"'  kind  '","size":'
      (scot %ud size)  ',"version":'  (scot %ud version)  '}'
  ==
::  art-env-cap: NO-OP (see gossip-cap note). The artifact-envelope reservoir is
::  no longer pruned; the top-100 visible window is enforced on the frontend.
++  art-env-cap  100
++  cap-art-envs
  |=  envs=(map @ta artifact-envelope:noltbook)
  ^-  (map @ta artifact-envelope:noltbook)
  envs
::  json-str-field: tolerant scan for `"<key>":"<value>"` in a JSON-ish
::  tape. The metadata blob is produced by art-meta-json so the shape is
::  fixed; this is not a general-purpose parser. Returns ~ if absent.
++  json-str-field
  |=  [key=@t blob=tape]
  ^-  (unit @t)
  =/  needle=tape  :(weld "\"" (trip key) "\":\"")
  =/  start  (find needle blob)
  ?~  start  ~
  =/  tail=tape  (slag (add u.start (lent needle)) blob)
  =/  end  (find "\"" tail)
  ?~  end  ~
  `(crip (scag u.end tail))
::  json-num-field: tolerant scan for `"<key>":<decimal digits>` in a
::  JSON-ish tape. Returns 0 when missing or unparseable.
++  json-num-field
  |=  [key=@t blob=tape]
  ^-  @ud
  =/  needle=tape  :(weld "\"" (trip key) "\":")
  =/  start  (find needle blob)
  ?~  start  0
  =/  tail=tape  (slag (add u.start (lent needle)) blob)
  =/  digs=tape
    |-  ^-  tape
    ?~  tail  ~
    ?.  &((gte i.tail '0') (lte i.tail '9'))  ~
    [i.tail $(tail t.tail)]
  ?:  =(~ digs)  0
  (rash (crip digs) dem)
::  artifact-to-envelope-for-note: convert a %file clay-backed artifact
::  record into a portable artifact-envelope keyed to a new note id.
::  Used by %fork-note to add references (not byte copies) to forked
::  notes. Returns ~ for non-file or non-clay artifacts. Mime/kind/size
::  are parsed from the artifact-version metadata JSON when present; if
::  parsing fails, safe fallbacks are used. Content-hash is *@uv
::  (unknown) and downstream fetch validation treats *@uv as
::  "unverified" rather than mismatch.
++  artifact-to-envelope-for-note
  |=  [new-note-id=@ta art=artifact:noltbook]
  ^-  (unit artifact-envelope:noltbook)
  ?.  =(%file type.art)  ~
  ?~  versions.art  ~
  =/  latest=artifact-version:noltbook  (rear versions.art)
  =/  ct=tape  (trip content.latest)
  ?~  (find "\"storage\":\"clay\"" ct)  ~
  =/  mime=@t   (fall (json-str-field 'mime' ct) 'application/octet-stream')
  =/  kind=@t   (fall (json-str-field 'kind' ct) 'file')
  =/  size=@ud  (json-num-field 'size' ct)
  :-  ~
  :*  id.art
      creator.art
      new-note-id
      name.art
      mime
      kind
      size
      *@uv
      timestamp.latest
      ::  carry the source artifact's timeline identity into the envelope
      ::  (was dropped to ~ before Phase A). Reply linkage stays eid-based.
      meta.art
  ==
::  ===== directed attention (Phase A) =====
::  attn-mention-cards: for a detected @-mention, emit BOTH the legacy
::  %mention-update (drives existing mention UX, unchanged) and the new
::  %attention-update (typed directed-attention stream) on global /notes.
++  attn-mention-cards
  |=  [nid=@ta id=@da eid=(unit @uv) author=@p]
  ^-  (list card:agent:gall)
  =/  it=attention-item:noltbook  [%mention %message eid `id ~ author id]
  :~  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%mention-update nid ~[[id eid author]]])]
      ::  full=| : live delta (append one item)
      [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%attention-update nid ~[it] %.n])]
  ==
::  all-attention: the full per-note attention view = stored `attention` map
::  (Phase B reply/send) UNIONED with `mentions` mirrored as kind=%mention items.
::  Single source of truth: mentions live in the mentions map; attention is derived.
++  all-attention
  |=  $:  mnt=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
          att=(map @ta (list attention-item:noltbook))
      ==
  ^-  (map @ta (list attention-item:noltbook))
  =/  mirrored=(map @ta (list attention-item:noltbook))
    %-  ~(run by mnt)
    |=  ms=(list [id=@da eid=(unit @uv) author=@p])
    ^-  (list attention-item:noltbook)
    %+  turn  ms
    |=  [id=@da eid=(unit @uv) author=@p]
    ^-  attention-item:noltbook
    [%mention %message eid `id ~ author id]
  =/  keys=(set @ta)  (~(uni in ~(key by mirrored)) ~(key by att))
  %-  ~(gas by *(map @ta (list attention-item:noltbook)))
  %+  turn  ~(tap in keys)
  |=  k=@ta
  ^-  [@ta (list attention-item:noltbook)]
  [k (weld (fall (~(get by mirrored) k) ~) (fall (~(get by att) k) ~))]
::  ===== reply attention (Phase B) =====
::  attn-parent-owner: the IMMEDIATE parent's author/creator for a reply, resolved
::  by reply-to-eid across all post types (message / artifact / artifact-envelope),
::  then legacy reply-to (@da, message-only) as a text-to-text fallback. ~ if not
::  found. Only the immediate parent is consulted (no ancestor/root walk).
++  attn-parent-owner
  |=  $:  reply-eid=(unit @uv)
          legacy-reply=(unit @da)
          msgs=(list message:noltbook)
          arts=(list artifact:noltbook)
          aenvs=(list artifact-envelope:noltbook)
      ==
  ^-  (unit @p)
  ?^  reply-eid
    =/  mhit=(list message:noltbook)
      (skim msgs |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.reply-eid))))
    ?^  mhit  `author.i.mhit
    =/  ahit=(list artifact:noltbook)
      (skim arts |=(a=artifact:noltbook ?&(?=(^ meta.a) =(eid.u.meta.a u.reply-eid))))
    ?^  ahit  `creator.i.ahit
    =/  ehit=(list artifact-envelope:noltbook)
      (skim aenvs |=(e=artifact-envelope:noltbook ?&(?=(^ meta.e) =(eid.u.meta.e u.reply-eid))))
    ?^  ehit  `author.i.ehit
    ~
  ?^  legacy-reply
    =/  mhit=(list message:noltbook)  (skim msgs |=(m=message:noltbook =(id.m u.legacy-reply)))
    ?^  mhit  `author.i.mhit
    ~
  ~
::  add-reply-attn: if the immediate parent owner is our ship and the reply author
::  is someone else, append a %reply attention item (the NEW reply is the target)
::  and return [updated-attention live-delta-cards]. Dedups by eid > msg-id > aid.
++  add-reply-attn
  |=  $:  att=(map @ta (list attention-item:noltbook))
          nid=@ta
          our=@p
          reply-author=@p
          parent-owner=(unit @p)
          target=attention-item:noltbook
      ==
  ^-  [(map @ta (list attention-item:noltbook)) (list card:agent:gall)]
  ?:  =(reply-author our)  [att ~]
  ?.  ?=(^ parent-owner)  [att ~]
  ?.  =(u.parent-owner our)  [att ~]
  =/  cur=(list attention-item:noltbook)  (fall (~(get by att) nid) ~)
  ?:  %+  lien  cur
      |=  it=attention-item:noltbook
      ?|  &(?=(^ eid.target) ?=(^ eid.it) =(u.eid.it u.eid.target))
          &(?=(^ msg-id.target) ?=(^ msg-id.it) =(u.msg-id.it u.msg-id.target))
          &(?=(^ aid.target) ?=(^ aid.it) =(u.aid.it u.aid.target))
      ==
    [att ~]
  :-  (~(put by att) nid (snoc cur target))
  ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%attention-update nid ~[target] %.n])]]
::  artifact-meta: stable timeline identity for a new artifact. eid is
::  deterministic (sham [creator id]) so it matches across ships/forks.
::  seq is non-authoritative (0) in Phase A; created/updated = creation time.
++  artifact-meta
  |=  [creator=@p aid=@ta when=@da reply-eid=(unit @uv)]
  ^-  entry-meta:noltbook
  [(sham [creator aid]) 0 0 when when reply-eid]
::  find-aid-in-envelopes: scan all per-note envelope maps for an aid
++  find-aid-in-envelopes
  |=  [aid=@ta envs=(map @ta (map @ta artifact-envelope:noltbook))]
  ^-  (unit artifact-envelope:noltbook)
  =/  vals=(list (map @ta artifact-envelope:noltbook))  ~(val by envs)
  |-
  ?~  vals  ~
  =/  hit  (~(get by i.vals) aid)
  ?^  hit  hit
  $(vals t.vals)
::  query-arg: lookup query-string arg
++  query-arg
  |=  [args=(list [key=@t value=@t]) k=@t]
  ^-  (unit @t)
  ?~  args  ~
  ?:  =(key.i.args k)  `value.i.args
  $(args t.args)
::  split-url-tail: slice url after a known prefix into a knot path component
::  and parsed query args. Bypasses apat:de-purl which mis-handles
::  path segments containing dots (e.g. note-~2024.1.5..).
++  split-url-tail
  |=  [url=tape prefix-len=@ud]
  ^-  [path=@ta args=(list [key=@t value=@t])]
  =/  rest=tape  (slag prefix-len url)
  =/  qix=(unit @ud)  (find "?" rest)
  =/  path-tape=tape  ?~(qix rest (scag u.qix rest))
  =/  qstr-tape=tape  ?~(qix "" (slag u.qix rest))
  =/  args=(list [key=@t value=@t])
    (fall (rush (crip qstr-tape) yque:de-purl:html) ~)
  [(crip path-tape) args]
--
%-  agent:dbug
=|  state-42
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
  :_  this(notes (~(put by (~(put by notes) %cover cover)) %ars-rumors rumors), messages (~(put by (~(put by messages) %cover *(list message:noltbook))) %ars-rumors *(list message:noltbook)))
  ~[bind]
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  ?:  ?=([%42 *] q.old)
    =/  loaded  !<(state-42 old)
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
    ::  normalize legacy: flip obvious personal roots from %group to %notebook.
    ::  predicate: parent=~, type=%group, creator==our.bowl, users == {our.bowl},
    ::             visibility=%secret, id not %cover/%ars-rumors.
    ::  idempotent — once flipped to %notebook the predicate no longer matches.
    ::  visibility guard added so solo %group with %public/%private (intentional
    ::  shared groups awaiting joiners) are NOT demoted.
    =/  loaded
      =/  flips=(list [@ta note:noltbook])
        %+  skim  ~(tap by notes.loaded)
        |=  [k=@ta n=note:noltbook]
        ?&  ?=(~ parent.n)
            =(%group type.n)
            =(creator.n our.bowl)
            =(1 ~(wyt in users.n))
            (~(has in users.n) our.bowl)
            =(%secret visibility.n)
            !=(k %cover)
            !=(k %ars-rumors)
        ==
      ?~  flips  loaded
      ~&  [%flipping-personal-roots-to-notebook count=(lent flips)]
      =/  nmap=(map @ta note:noltbook)  notes.loaded
      =/  fixes=(list [@ta note:noltbook])  flips
      |-
      ?~  fixes  loaded(notes nmap)
      =/  [nid=@ta n=note:noltbook]  i.fixes
      =.  nmap  (~(put by nmap) nid n(type %notebook))
      $(fixes t.fixes)
    ::  corrective pass: undo any wrongly-flipped notebooks. if a note is
    ::  %notebook with visibility %public or %private it should be %group.
    ::  catches Phase 1 over-flips for shared-intent solo groups. idempotent.
    =/  loaded
      =/  fixes=(list [@ta note:noltbook])
        %+  skim  ~(tap by notes.loaded)
        |=  [k=@ta n=note:noltbook]
        ?&  =(%notebook type.n)
            ?|(=(%public visibility.n) =(%private visibility.n))
        ==
      ?~  fixes  loaded
      ~&  [%restoring-public-private-notebooks-to-group count=(lent fixes)]
      =/  nmap=(map @ta note:noltbook)  notes.loaded
      =/  todo=(list [@ta note:noltbook])  fixes
      |-
      ?~  todo  loaded(notes nmap)
      =/  [nid=@ta n=note:noltbook]  i.todo
      =.  nmap  (~(put by nmap) nid n(type %group))
      $(todo t.todo)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      [%pass /prof-out/(scot %p p) %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
    [prof-cards this(state loaded(active-calls *(map @ta call-info:noltbook)))]
  ?:  ?=([%41 *] q.old)
    =/  s41  !<(state-41 old)
    $(old !>((upgrade-41-to-42 s41)))
  ?:  ?=([%40 *] q.old)
    =/  s40  !<(state-40 old)
    $(old !>((upgrade-40-to-41 s40)))
  ?:  ?=([%39 *] q.old)
    =/  s39  !<(state-39 old)
    $(old !>((upgrade-39-to-40 s39)))
  ?:  ?=([%38 *] q.old)
    =/  s38  !<(state-38 old)
    $(old !>((upgrade-38-to-39 s38)))
  ?:  ?=([%37 *] q.old)
    =/  s37  !<(state-37 old)
    $(old !>((upgrade-37-to-38 s37)))
  ?:  ?=([%36 *] q.old)
    =/  s36  !<(state-36 old)
    $(old !>((upgrade-36-to-37 s36)))
  ?:  ?=([%35 *] q.old)
    =/  s35  !<(state-35 old)
    $(old !>((upgrade-35-to-36 s35)))
  ?:  ?=([%34 *] q.old)
    =/  s34  !<(state-34 old)
    $(old !>((upgrade-34-to-35 s34)))
  ?:  ?=([%33 *] q.old)
    =/  s33  !<(state-33 old)
    $(old !>((upgrade-33-to-34 s33)))
  ?:  ?=([%32 *] q.old)
    =/  s32  !<(state-32 old)
    $(old !>((upgrade-32-to-33 s32)))
  ?:  ?=([%31 *] q.old)
    =/  s31  !<(state-31 old)
    $(old !>((upgrade-31-to-32 s31)))
  ?:  ?=([%30 *] q.old)
    =/  s30  !<(state-30 old)
    $(old !>((upgrade-30-to-31 s30)))
  ?:  ?=([%29 *] q.old)
    =/  s29  !<(state-29 old)
    $(old !>((upgrade-29-to-30 s29)))
  ?:  ?=([%28 *] q.old)
    =/  s28  !<(state-28 old)
    $(old !>((upgrade-28-to-29 s28)))
  ?:  ?=([%27 *] q.old)
    =/  s27  !<(state-27 old)
    $(old !>((upgrade-27-to-28 s27)))
  ?:  ?=([%26 *] q.old)
    =/  s26  !<(state-26 old)
    $(old !>((upgrade-26-to-27 s26)))
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
  ::  state-12 → state-20
  ?:  ?=([%12 *] q.old)
    =/  s12  !<(state-12 old)
    =/  s15  (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 s12)))
    ::  ensure ars-rumors note exists
    =/  s15  ?.  (~(has by notes.s15) %ars-rumors)
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s15(notes (~(put by notes.s15) %ars-rumors rumors), messages (~(put by messages.s15) %ars-rumors *(list message-18)))
    s15
    =/  s19  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15)))))
    `this(state s19)
  ::  state-11 → state-19
  ?:  ?=([%11 *] q.old)
    =/  s11  !<(state-11 old)
    =/  s19  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 s11)))))))))
    `this(state s19)
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
    =/  s8=state-8
      [%8 notes.s6 messages.s6 artifacts.s6 profiles.s6 transactions.s6 current-note.s6 peers.s6 has-avatar.s6 peers.s6 ~ ~ 0 ~]
    `this(state (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8)))))))))))))
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
    =/  new-arts=(map @ta artifact-pre40:noltbook)
      %-  ~(run by artifacts.s2)
      |=  a=artifact-2
      ^-  artifact-pre40:noltbook
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
  =/  new-arts=(map @ta artifact-pre40:noltbook)
    %-  ~(run by artifacts.s1)
    |=  a=artifact-2
    ^-  artifact-pre40:noltbook
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
    =/  sys  (ensure-system-notes notes messages our.bowl)
    =/  notes-now=(map @ta note:noltbook)  notes.sys
    =/  messages-now=(map @ta (list message:noltbook))  messages.sys
    =/  note-list=(list note:noltbook)  ~(val by notes-now)
    =/  upd=update:noltbook  [%note-list note-list]
    =/  prof-list=(list [@p profile:noltbook])  ~(tap by profiles)
    =/  pupd=update:noltbook  [%profile-list prof-list]
    =/  pal-set=(set @p)
      =/  s=(set @p)  contacts
      =/  s=(set @p)  (~(uni in s) pal-outgoing)
      =/  s=(set @p)  (~(uni in s) pal-incoming)
      =/  s=(set @p)  (~(uni in s) pal-blocked)
      (~(del in s) our.bowl)
    =/  pal-pairs=(list [@p pal-status:noltbook])
      %+  turn  ~(tap in pal-set)
      |=  p=@p
      :-  p
      ?:  (~(has in pal-blocked) p)  %blocked
      ?:  &((~(has in pal-outgoing) p) (~(has in pal-incoming) p))  %mutual
      ?:  (~(has in pal-outgoing) p)  %requesting
      ?:  (~(has in pal-incoming) p)  %requested
      %none
    =/  palupd=update:noltbook  [%pal-list pal-pairs]
    =/  contactupd=update:noltbook  [%contact-list ~(tap in contacts)]
    =/  dialupd=update:noltbook  [%dial-update dial]
    ::  send all current mention states (eid stored natively since state-23)
    =/  mention-cards=(list card)
      %+  turn  ~(tap by mentions)
      |=  [nid=@ta mns=(list [id=@da eid=(unit @uv) author=@p])]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%mention-update nid mns])]
    ::  Phase A: also send the typed directed-attention state (mentions mirrored
    ::  + stored reply/send attention) so the frontend's state.attention is current.
    ::  full=& : authoritative per-note snapshot (frontend replaces that note's list)
    =/  attention-cards=(list card)
      %+  turn  ~(tap by (all-attention mentions attention))
      |=  [nid=@ta its=(list attention-item:noltbook)]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%attention-update nid its %.y])]
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
      =/  note  (~(get by notes-now) nid)
      ?~  note  ~
      (turn ~(tap in ships) |=(s=@p [nid s name.u.note]))
    =/  jr-cards=(list card)
      ?~  jr-list  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%join-request-list jr-list])]]
    ::  send admin/muted role state for each note
    =/  role-cards=(list card)
      %-  zing
      %+  turn  ~(tap by notes-now)
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
    ::  replay host-status entries so host-deleted banners persist over refresh
    =/  hs-cards=(list card)
      %+  turn  ~(tap by host-status)
      |=  [nid=@ta st=?(%host-deleted %host-unreachable)]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%note-host-status nid `st])]
    ::  replay lineage for every note so v1/vN ~host badges render after
    ::  refresh. Falls back to defaults for notes without explicit lineage
    ::  (origin = sham[creator id], version = 1, fork-of = ~).
    =/  lineage-cards=(list card)
      %+  turn  ~(tap by notes-now)
      |=  [nid=@ta n=note:noltbook]
      =/  origin=@uv  (lineage-origin-of n fork-origin)
      =/  version=@ud  (lineage-version-of nid fork-version)
      =/  parent=(unit [host=@p nid=@ta])  (~(get by fork-of) nid)
      =/  parent-ver=(unit @ud)
        =/  stored  (~(get by fork-parent-version) nid)
        ?^  stored  `u.stored
        ?:  (gth version 1)  `(sub version 1)
        ~
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%note-lineage-set nid origin version parent parent-ver])]
    ::  replay pending fork invites so the receiver sees the banner again
    ::  after refresh.
    =/  pfi-cards=(list card)
      %+  turn  ~(tap by pending-fork-invites)
      |=  [nid=@ta pi=pending-fork-invite:noltbook]
      [%give %fact ~ %noltbook-update !>(`update:noltbook`[%fork-invite-received root-id.pi source-name.pi source-version.pi sender.pi])]
    ::  prune stale acks against live conditions, then replay so passive
    ::  condition red dots stay cleared after a hard refresh. Centralizing the
    ::  cleanup here (rather than in every delete/membership/host-status path)
    ::  drops acks for notes that vanished, where we were re-added, or whose
    ::  host-deleted flag cleared — so a fresh removal/host-delete re-alerts.
    =/  pruned-acks=(set durable-notification-ack:noltbook)
      %-  ~(rep in notification-acks)
      |=  [ack=durable-notification-ack:noltbook acc=(set durable-notification-ack:noltbook)]
      =/  n=(unit note:noltbook)  (~(get by notes-now) note-id.ack)
      ?~  n  acc
      ?-  kind.ack
          %removed-status
        ?.  (~(has in removed.u.n) our.bowl)  acc
        (~(put in acc) ack)
      ::
          %host-deleted-status
        ?.  =(`%host-deleted (~(get by host-status) note-id.ack))  acc
        (~(put in acc) ack)
      ==
    ::  always emit, even when empty, so a reconnect/live resubscribe replaces
    ::  any stale frontend ack state rather than leaving it untouched.
    =/  ack-cards=(list card)
      =/  ack-list=(list durable-notification-ack:noltbook)  ~(tap in pruned-acks)
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%notification-acks ack-list])]]
    ::  durable sidebar recency: prune stale entries (deleted notes, pinned
    ::  ids) so they don't replay forever, then replay so ordering survives a
    ::  hard refresh. Always emit (even empty) to replace stale frontend state.
    =/  pruned-activity=(map @ta @da)
      =/  pairs=(list [nid=@ta t=@da])  ~(tap by note-activity)
      =/  acc=(map @ta @da)  *(map @ta @da)
      |-  ^-  (map @ta @da)
      ?~  pairs  acc
      =/  nid=@ta  nid.i.pairs
      ?:  |(=(nid %cover) =(nid %ars-rumors))  $(pairs t.pairs)
      ?.  (~(has by notes-now) nid)  $(pairs t.pairs)
      $(pairs t.pairs, acc (~(put by acc) nid t.i.pairs))
    =/  activity-cards=(list card)
      =/  act-list=(list [@ta @da])  ~(tap by pruned-activity)
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%note-activity-list act-list])]]
    ::  durable green-unread last-read: prune like note-activity, then replay.
    ::  Always emit (even empty) to replace stale frontend read state.
    =/  pruned-read=(map @ta @da)
      =/  pairs=(list [nid=@ta t=@da])  ~(tap by note-read)
      =/  acc=(map @ta @da)  *(map @ta @da)
      |-  ^-  (map @ta @da)
      ?~  pairs  acc
      =/  nid=@ta  nid.i.pairs
      ?:  |(=(nid %cover) =(nid %ars-rumors))  $(pairs t.pairs)
      ?.  (~(has by notes-now) nid)  $(pairs t.pairs)
      $(pairs t.pairs, acc (~(put by acc) nid t.i.pairs))
    =/  read-cards=(list card)
      =/  read-list=(list [@ta @da])  ~(tap by pruned-read)
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%note-read-list read-list])]]
    =/  init-cards=(list card)
      :~  [%give %fact ~ %noltbook-update !>(upd)]
          [%give %fact ~ %noltbook-update !>(pupd)]
          [%give %fact ~ %noltbook-update !>(palupd)]
          [%give %fact ~ %noltbook-update !>(contactupd)]
          [%give %fact ~ %noltbook-update !>(dialupd)]
      ==
    :_  this(notes notes-now, messages messages-now, notification-acks pruned-acks, note-activity pruned-activity, note-read pruned-read)
    :(weld init-cards mention-cards attention-cards call-cards jr-cards role-cards bb-cards hs-cards lineage-cards pfi-cards ack-cards activity-cards read-cards)
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
    ::  track new remote subscriber as a peer (no auto-introduce broadcast)
    =/  is-new-remote=?  &(!=(src.bowl our.bowl) !(~(has in peers) src.bowl))
    =/  intro-cards=(list card)  ~
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
    =/  is-group-note=?
      ?&  ?=(^ note-for-type)
          =(%group type.u.note-for-type)
      ==
    =/  art-env-cards=(list card)
      ?.  |(is-gossip-note is-group-note)  ~
      =/  aenv-map  (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
      =/  aenvs  ~(val by aenv-map)
      ?~  aenvs  ~
      ~[[%give %fact ~ %noltbook-update !>(`update:noltbook`[%artifact-envelope-list nid aenvs])]]
    :_  this(peers new-peers)
    :(weld init-cards ~[[%give %fact ~ %noltbook-update !>(pupd)]] intro-cards call-cards note-role-cards jr-admin-cards art-env-cards)
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
      =/  is-dm=?  =(%dm type.u.nt)
      ::  permission: creator always, or any DM member for local-only DM icon
      ?.  ?|  =(our.bowl creator.u.nt)
              &(is-dm (~(has in users.u.nt) our.bowl))
          ==
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
      =/  meta-fact-cards=(list card)
        ?:  is-dm
          ~[[%give %fact ~[/notes] %noltbook-update !>(meta-upd)]]
        :~  [%give %fact ~[/notes] %noltbook-update !>(meta-upd)]
            [%give %fact ~[/notes/[nid]] %noltbook-update !>(meta-upd)]
        ==
      ::  persist DM icon as a local pref for the counterparty
      =/  new-prefs=(map @p dm-pref)
        ?.  is-dm  dm-prefs
        =/  cp=(unit @p)  (dm-counterparty users.u.nt our.bowl)
        ?~  cp  dm-prefs
        =/  cur=dm-pref  (fall (~(get by dm-prefs) u.cp) [~ ~])
        (~(put by dm-prefs) u.cp cur(icon-url `new-url))
      :_  this(notes (~(put by notes) nid new-nt), dm-prefs new-prefs)
      :(weld http-cards ~[clay-card] meta-fact-cards)
    ::  artifact fetch endpoint — auth-gated
    ::  GET /apps/noltbook/artifact/<aid>?v=<v>&download=1
    ::  - on the byte host (=creator): serve local Clay (404 if bytes missing)
    ::  - on any other ship: always remote-fetch from byte host; do NOT touch
    ::    local Clay (member ships must not mirror artifact bytes)
    ?:  &(=(%'GET' method.request.inbound-request) =((scag 24 url-tape) "/apps/noltbook/artifact/"))
      =/  parts  (split-url-tail url-tape 24)
      =/  aid=@ta  path.parts
      =/  q-args  args.parts
      ?:  =('' aid)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  art  (~(get by artifacts) aid)
      ?~  art
        ::  no artifact ref locally — try gossip/cover envelope path
        =/  env  (find-aid-in-envelopes aid artifact-envelopes)
        ?~  env
          :_  this
          %+  give-simple-payload:app:server  eyre-id
          [[404 ~] ~]
        ::  remote-fetch from envelope author. Pass expected content-hash
        ::  when known; *@uv means unknown (e.g. fork envelope copies)
        ::  and is sent as ~ so the byte host doesn't reject on mismatch.
        =/  expected=(unit @uv)
          ?:  =(content-hash.u.env *@uv)  ~
          `content-hash.u.env
        =/  fetch-card=card
          :*  %pass
              /art-fetch-out/[aid]/[eyre-id]
              %agent  [author.u.env %noltbook]
              %poke   %noltbook-remote
              !>(`remote:noltbook`[%remote-artifact-fetch aid eyre-id expected])
          ==
        :_  this
        ~[fetch-card]
      ::  byte host serves local Clay. DM participants also hold a local copy
      ::  by design (symmetric DM storage) and serve from local Clay too.
      =/  nt-art  (~(get by notes) note-id.u.art)
      =/  is-dm-member=?
        ?&  ?=(^ nt-art)
            ?=(%dm type.u.nt-art)
            (~(has in users.u.nt-art) our.bowl)
        ==
      ?:  ?|(=(our.bowl creator.u.art) is-dm-member)
        =/  art-clay=path
          :*  (scot %p our.bowl)
              q.byk.bowl
              (scot %da now.bowl)
              /lib/noltbook/artifacts/[aid]/mime
          ==
        =/  local-res  (mule |.(.^(mime %cx art-clay)))
        ?:  ?=(%& -.local-res)
          =/  art-data=mime  p.local-res
          =/  ct=@t  (rap 3 (join '/' p.art-data))
          =/  qarg-dl  (query-arg q-args 'download')
          =/  hdrs=(list [@t @t])
            ?~  qarg-dl
              ~[['content-type' ct] ['cache-control' 'max-age=3600']]
            =/  fname=@t  name.u.art
            =/  cd=@t  (rap 3 ['attachment; filename="' fname '"' ~])
            :~  ['content-type' ct]
                ['cache-control' 'max-age=3600']
                ['content-disposition' cd]
            ==
          =/  =simple-payload:http
            [[200 hdrs] `q.art-data]
          [(give-simple-payload:app:server eyre-id simple-payload) this]
        ::  byte host has no local bytes → 404; DM member falls through to
        ::  remote fetch from the artifact creator (sender)
        ?:  =(our.bowl creator.u.art)
          :_  this
          %+  give-simple-payload:app:server  eyre-id
          [[404 ~] ~]
        =/  fetch-card=card
          :*  %pass
              /art-fetch-out/[aid]/[eyre-id]
              %agent  [creator.u.art %noltbook]
              %poke   %noltbook-remote
              !>(`remote:noltbook`[%remote-artifact-fetch aid eyre-id ~])
          ==
        :_  this
        ~[fetch-card]
      ::  non-host, non-DM: never touch local Clay; always remote-fetch
      =/  fetch-card=card
        :*  %pass
            /art-fetch-out/[aid]/[eyre-id]
            %agent  [creator.u.art %noltbook]
            %poke   %noltbook-remote
            !>(`remote:noltbook`[%remote-artifact-fetch aid eyre-id ~])
        ==
      :_  this
      ~[fetch-card]
    ::  artifact upload endpoint
    ::  POST /apps/noltbook/upload-artifact/<note-id>?name=...&kind=image|file&mime=...
    ::  host path: write Clay + broadcast metadata
    ::  non-host path: write own Clay + remote-poke host with metadata; host broadcasts
    ?:  &(=(%'POST' method.request.inbound-request) =((scag 31 url-tape) "/apps/noltbook/upload-artifact/"))
      =/  parts  (split-url-tail url-tape 31)
      =/  nid=@ta  path.parts
      =/  q-args  args.parts
      ?:  =('' nid)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      =/  nt  (~(get by notes) nid)
      ?~  nt
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  all note types accept artifact uploads at this layer; type-specific
      ::  rules below
      =/  is-dm=?  ?=(%dm type.u.nt)
      =/  is-cover=?  ?=(%cover type.u.nt)
      =/  is-gossipy-note=?  ?=(%gossip type.u.nt)
      =/  is-gossipy=?  |(is-cover is-gossipy-note)
      =/  is-host=?  =(our.bowl creator.u.nt)
      =/  admins  (fall (~(get by note-admins) nid) ~)
      =/  is-admin=?  (~(has in admins) our.bowl)
      ::  uploader must be a current member, not removed (applies to all)
      ?:  ?|  !(~(has in users.u.nt) our.bowl)
              (~(has in removed.u.nt) our.bowl)
          ==
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[403 ~] ~]
      ::  read-only/mute checks skip for DMs (no admin/mute concept)
      ::  and for cover (cover is a personal note hosted by self)
      ?:  ?&  !is-dm
              !is-cover
              !writable.u.nt
              !is-host
              !is-admin
          ==
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[403 ~] ~]
      =/  muted  (fall (~(get by note-muted) nid) ~)
      ?:  ?&  !is-dm
              !is-cover
              (~(has in muted) our.bowl)
              !is-host
              !is-admin
          ==
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[403 ~] ~]
      =/  bod  body.request.inbound-request
      ?~  bod
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      ::  cap at 5 MB
      ?:  (gth p.u.bod 5.242.880)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[413 ~] ~]
      =/  qarg-name  (query-arg q-args 'name')
      =/  qarg-kind  (query-arg q-args 'kind')
      =/  qarg-mime  (query-arg q-args 'mime')
      ::  optional reply context (eid). slaw returns ~ on malformed input, so
      ::  a bad replyToEid is safely ignored (artifact stays a root).
      =/  qarg-rte  (query-arg q-args 'replyToEid')
      =/  reply-eid=(unit @uv)
        ?~  qarg-rte  ~
        ^-  (unit @uv)
        (slaw %uv u.qarg-rte)
      =/  fname=@t  (fall qarg-name 'untitled')
      =/  kind=@t   (fall qarg-kind 'file')
      =/  mtype=@t  (fall qarg-mime 'application/octet-stream')
      =/  mpath=(list @ta)  (parse-mime-path mtype)
      =/  aid=@ta  (crip (weld "art-" (trip (scot %da now.bowl))))
      =/  art-cage=cage  [%mime !>(`mime`[mpath u.bod])]
      =/  nori  [%& ~[[/lib/noltbook/artifacts/[aid]/mime [%ins art-cage]]]]
      =/  clay-card=card  [%pass /art-write/[aid] %arvo %c %info q.byk.bowl nori]
      =/  meta-content=@t  (art-meta-json mtype kind p.u.bod 1)
      =/  new-art=artifact:noltbook
        :*  aid  fname  %file  our.bowl  nid
            ~[[1 meta-content our.bowl now.bowl]]
            `(artifact-meta our.bowl aid now.bowl reply-eid)
        ==
      =/  resp-body=@t  (rap 3 ['{"id":"' aid '","version":1}' ~])
      =/  ok-payload=simple-payload:http
        [[200 ~[['content-type' 'application/json']]] `(as-octs:mimes:html resp-body)]
      =/  http-cards  (give-simple-payload:app:server eyre-id ok-payload)
      ?:  is-gossipy
        ::  cover/gossip path: write own Clay, store artifact locally,
        ::  build envelope, broadcast %artifact-envelope locally + gossip
        ::  %remote-artifact-envelope-ref to mesh recipients. Never ship bytes.
        =/  hash=@uv  (sham q.u.bod)
        ::  carry the new artifact's meta (eid + reply-to-eid) so remote
        ::  recipients can reply to / unified-thread this envelope.
        =/  env=artifact-envelope:noltbook
          [aid our.bowl nid fname mtype kind p.u.bod hash now.bowl meta.new-art]
        =/  upd=update:noltbook  [%artifact-envelope nid env 0]
        =/  pax=path  ~[%notes nid]
        =/  targets=(list @p)
          ?:  is-cover
            ~(tap in pal-outgoing)
          %+  skim  ~(tap in users.u.nt)
          |=(p=@p !=(p our.bowl))
        =/  gossip-cards=(list card)
          %+  turn  targets
          |=  p=@p
          ^-  card
          [%pass /art-env-out/(scot %p p)/[aid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-envelope-ref nid env 0])]
        =/  envs-cur=(map @ta artifact-envelope:noltbook)
          (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
        ::  recency + sidebar signal + preview persistence: gossip notes
        ::  participate; cover is pinned (none of these). put-activity is a
        ::  no-op for cover, so persisting it unconditionally is safe.
        =/  prev=@t  (art-env-preview env)
        ::  own upload → advance both activity and read so it isn't self-unread.
        =/  act-cards=(list card)
          ?:  is-gossipy-note  ~[(activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
          ~
        ::  sidebar preview signal for both user gossip and cover (cover is
        ::  pinned: the frontend updates its %Grimoire preview but never dots).
        =/  sig-cards=(list card)
          ?:  is-gossipy  ~[(sidebar-signal nid our.bowl `prev %artifact now.bowl)]
          ~
        =/  new-notes=(map @ta note:noltbook)
          ?.  is-gossipy-note  notes
          (~(put by notes) nid u.nt(last-author `our.bowl, last-preview `prev))
        :_  %=  this
              notes  new-notes
              artifacts  (~(put by artifacts) aid new-art)
              artifact-envelopes
                (~(put by artifact-envelopes) nid (cap-art-envs (~(put by envs-cur) aid env)))
              note-activity  (put-activity note-activity nid now.bowl)
              note-read  (put-read note-read nid now.bowl)
            ==
        %+  weld  http-cards
        %+  weld
          :~  clay-card
              [%give %fact ~[pax] %noltbook-update !>(upd)]
          ==
        :(weld gossip-cards act-cards sig-cards)
      ?:  is-dm
        ::  DM path: write own Clay, store metadata, broadcast locally, ship
        ::  metadata + bytes to counterparty (symmetric duplication).
        =/  others=(list @p)
          %+  skim  ~(tap in users.u.nt)
          |=(p=@p !=(p our.bowl))
        =/  counterparty=@p  ?~(others our.bowl i.others)
        =/  upd=update:noltbook  [%artifact-created new-art]
        =/  pax=path  ~[%notes nid]
        =/  prev=@t  (artifact-preview new-art)
        =/  upd-note=note:noltbook  u.nt(last-author `our.bowl, last-preview `prev)
        =/  dm-card=(list card)
          ?:  =(counterparty our.bowl)  ~
          :~  :*  %pass
                  /art-dm-out/[aid]
                  %agent  [counterparty %noltbook]
                  %poke   %noltbook-remote
                  !>(`remote:noltbook`[%remote-dm-artifact new-art mtype u.bod])
              ==
          ==
        :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        %+  weld  http-cards
        %+  weld
          :~  clay-card
              [%give %fact ~[pax] %noltbook-update !>(upd)]
              (activity-fact nid now.bowl)
              (note-read-fact nid now.bowl)
              (sidebar-signal nid our.bowl `prev %artifact now.bowl)
          ==
        dm-card
      ?:  is-host
        ::  host path: store ref + broadcast group history
        =/  upd=update:noltbook  [%artifact-created new-art]
        =/  pax=path  ~[%notes nid]
        =/  prev=@t  (artifact-preview new-art)
        =/  upd-note=note:noltbook  u.nt(last-author `our.bowl, last-preview `prev)
        :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        %+  weld  http-cards
        :~  clay-card
            [%give %fact ~[pax] %noltbook-update !>(upd)]
            (activity-fact nid now.bowl)
            (note-read-fact nid now.bowl)
            (sidebar-signal nid our.bowl `prev %artifact now.bowl)
        ==
      ::  non-host path: write own Clay, ship metadata to host; no local broadcast
      =/  create-card=card
        :*  %pass
            /art-create-out/[aid]
            %agent  [creator.u.nt %noltbook]
            %poke   %noltbook-remote
            !>(`remote:noltbook`[%remote-artifact-create new-art])
        ==
      :_  this
      %+  weld  http-cards
      ~[clay-card create-card]
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
      ::  switch + trigger host-reachability probe for remote-hosted %group
      ::  notes we still belong to. We use a separate /host-probe wire so
      ::  the probe doesn't disturb the persistent /remote-note/[id]
      ::  subscription; the probe is left as soon as it acks. Behn timer
      ::  fires if no ack arrives within 8s.
      =/  n  (~(get by notes) id.act)
      ::  recency: opening a real, non-pinned note counts as activity.
      ::  green-unread: opening also marks read to the same now.bowl, so the
      ::  opened note is activity == read (not unread, since unread is strict >).
      =/  stamp=?  &(?=(^ n) !(is-pinned-note id.act))
      =/  na=(map @ta @da)
        ?:(stamp (put-activity note-activity id.act now.bowl) note-activity)
      =/  nr=(map @ta @da)
        ?:(stamp (put-read note-read id.act now.bowl) note-read)
      =/  act-cards=(list card)
        ?:(stamp ~[(activity-fact id.act now.bowl) (note-read-fact id.act now.bowl)] ~)
      =/  base=_this  this(current-note id.act, note-activity na, note-read nr)
      ?~  n  [act-cards base]
      ?.  ?&  =(%group type.u.n)
              !=(creator.u.n our.bowl)
              (~(has in users.u.n) our.bowl)
              !(~(has in removed.u.n) our.bowl)
              !(is-host-deleted id.act host-status)
          ==
        [act-cards base]
      =/  deadline=@da  (add now.bowl ~s8)
      =/  deadline-cord=@ta  (scot %da deadline)
      =/  watch-card=card
        [%pass /host-probe/[id.act]/[deadline-cord] %agent [creator.u.n %noltbook] %watch /notes/[id.act]]
      =/  wait-card=card
        [%pass /host-check/[id.act]/[deadline-cord] %arvo %b %wait deadline]
      ::  also ask the host for an authoritative snapshot of the group tree
      ::  this id sits in. Host walks up to the topmost same-host group root
      ::  and returns root + descendants + revs via %remote-note-state.
      =/  refresh-card=card
        [%pass /note-refresh/[id.act] %agent [creator.u.n %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-state-request id.act])]
      :_  base(host-checks (~(put by host-checks) id.act deadline))
      (weld act-cards ~[watch-card wait-card refresh-card])
    ::
        %rename-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  DM: local-only rename; either member can rename their copy.
      ::  Persist as dm-prefs[counterparty] so re-invited DM keeps the label.
      ?:  =(%dm type.u.old)
        ?.  (~(has in users.u.old) our.bowl)  `this
        =/  cp=(unit @p)  (dm-counterparty users.u.old our.bowl)
        =/  new-prefs=(map @p dm-pref)
          ?~  cp  dm-prefs
          =/  cur=dm-pref  (fall (~(get by dm-prefs) u.cp) [~ ~])
          (~(put by dm-prefs) u.cp cur(name `name.act))
        =/  upd=update:noltbook  [%note-renamed id.act name.act]
        :_  this(notes (~(put by notes) id.act u.old(name name.act)), dm-prefs new-prefs)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  non-DM: only creator can rename, broadcast to subscribers
      ?.  =(our.bowl creator.u.old)  `this
      =/  upd=update:noltbook  [%note-renamed id.act name.act]
      :_  this(notes (~(put by notes) id.act u.old(name name.act)))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %set-headline
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  protect system notes from deletion
      ?:  |(=(id.act %cover) =(id.act %ars-rumors))  `this
      ::  only creator (host) can delete
      ?.  =(our.bowl creator.u.old)  `this
      ::  Phase 4: collect entire subtree (root + descendants of any type)
      =/  descendants=(list @ta)  (collect-all-descendants id.act notes)
      =/  subtree-ids=(list @ta)  [id.act descendants]
      ::  detach root from parent's children list (descendants are also
      ::  deleted, so their entries in their parent's children are dropped
      ::  along with the parent — no separate trim needed)
      =/  trimmed=(map @ta note:noltbook)
        ?~  parent.u.old  notes
        =/  par  (~(get by notes) u.parent.u.old)
        ?~  par  notes
        (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
      ::  bulk-delete every per-note map keyed by @ta. Inline typed traps,
      ::  one per map type, so each compiles against its concrete value type.
      =/  new-notes=(map @ta note:noltbook)
        =/  acc=(map @ta note:noltbook)  trimmed
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-messages=(map @ta (list message:noltbook))
        =/  acc=(map @ta (list message:noltbook))  messages
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        =/  acc=(map @ta (list [id=@da eid=(unit @uv) author=@p]))  mentions
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-active-calls=(map @ta call-info:noltbook)
        =/  acc=(map @ta call-info:noltbook)  active-calls
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-gossip-envelopes=(map @ta (map @da envelope:noltbook))
        =/  acc=(map @ta (map @da envelope:noltbook))  gossip-envelopes
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-headlines=(map @ta @t)
        =/  acc=(map @ta @t)  headlines
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-seq-counters=(map @ta @ud)
        =/  acc=(map @ta @ud)  seq-counters
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-join-requests=(map @ta (set @p))
        =/  acc=(map @ta (set @p))  join-requests
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-note-admins=(map @ta (set @p))
        =/  acc=(map @ta (set @p))  note-admins
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-note-muted=(map @ta (set @p))
        =/  acc=(map @ta (set @p))  note-muted
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      =/  new-artifact-envelopes=(map @ta (map @ta artifact-envelope:noltbook))
        =/  acc=(map @ta (map @ta artifact-envelope:noltbook))  artifact-envelopes
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      ::  clean up artifacts whose note-id is in the deleted subtree
      =/  new-artifacts  (delete-artifacts-for-notes subtree-ids artifacts)
      ::  emit %note-deleted for every deleted id so FE clears subtree
      =/  delete-updates=(list card)  (build-note-deleted-cards subtree-ids)
      ::  notify remote users — one %remote-note-deleted for ROOT only;
      ::  receivers cascade descendants locally from their own notes map.
      =/  delete-remote-cards=(list card)
        %+  murn  ~(tap in users.u.old)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `[%pass /note-del/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-deleted id.act name.u.old])]
      :_  %=  this
            notes  new-notes
            messages  new-messages
            mentions  new-mentions
            active-calls  new-active-calls
            gossip-envelopes  new-gossip-envelopes
            headlines  new-headlines
            seq-counters  new-seq-counters
            join-requests  new-join-requests
            note-admins  new-note-admins
            note-muted  new-note-muted
            artifact-envelopes  new-artifact-envelopes
            artifacts  new-artifacts
          ==
      ^-  (list card)
      (weld delete-updates delete-remote-cards)
    ::
        %create-note
      ::  no parent: personal root note — created as %notebook
      ?~  parent.act
        =/  self-set=(set @p)  (sy ~[our.bowl])
        =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
        =/  new-note=note:noltbook
          :*  nid  name.act  %notebook  our.bowl  self-set  ~  ~  ~  ~  %secret  ~  &  ~  ~
          ==
        =/  upd=update:noltbook  [%note-created new-note]
        :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), note-activity (put-activity note-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        ^-  (list card:agent:gall)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
      =/  pid=@ta  u.parent.act
      =/  par-u=(unit note:noltbook)  (~(get by notes) pid)
      ?~  par-u  `this
      ::  only %notebook and %group parents may have children;
      ::  reject %dm, %cover, %gossip
      ?.  ?|(=(%notebook type.u.par-u) =(%group type.u.par-u))  `this
      =/  par=note:noltbook  u.par-u
      =/  child-type=note-type:noltbook  type.par
      =/  is-shared=?  (gth ~(wyt in users.par) 1)
      ::  host-only: only the parent's creator may add child notes. A member of
      ::  a shared note can no longer create children (UI grays this out too).
      ?.  =(our.bowl creator.par)  `this
      ::  local create; inherit users and creator from parent; mirror type;
      ::  factory metadata; no admin/mute inheritance
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  new-note=note:noltbook
        :*  nid  name.act  child-type  creator.par  users.par  ~  `pid  ~  ~  %secret  ~  &  ~  ~
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
      :_  this(notes n2, messages (~(put by messages) nid *(list message:noltbook)), note-activity (put-activity note-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
      =/  head-cards=(list card:agent:gall)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
      (weld head-cards broadcast)
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
      :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), headlines new-headlines, note-activity (put-activity note-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
      ^-  (list card:agent:gall)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
    ::
        %send-message
      =/  sys-note=?  ?|(=(note-id.act %cover) =(note-id.act %ars-rumors))
      =/  sys  (ensure-system-notes notes messages our.bowl)
      =?  notes  sys-note  notes.sys
      =?  messages  sys-note  messages.sys
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
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
              note-activity  (put-activity note-activity nid now.bowl)
              note-read  (put-read note-read nid now.bowl)
            ==
        =/  head-cards=(list card:agent:gall)
          ~[[%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
        :(weld head-cards ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(env-upd)]] gossip)
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
        ::  DMs never carry the directed marker (no orange attention in DMs)
        =/  upd=update:noltbook  [%new-message msg ~]
        =/  pax=path  ~[%notes note-id.act]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        ::  atomic DM delivery: ONE poke carrying both note metadata and
        ::  message, so receiver can recreate the DM if they left without
        ::  relying on poke ordering or subscriptions.
        =/  dm-rem=remote:noltbook  [%remote-dm-message u.exists msg]
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[[%pass /dm-msg/[note-id.act] %agent [other %noltbook] %poke %noltbook-remote !>(dm-rem)]]
        =/  notes-cards=(list card:agent:gall)
          ~[[%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact note-id.act now.bowl) (note-read-fact note-id.act now.bowl)]
        :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters), note-activity (put-activity note-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
        :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] notes-cards peer-cards)
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        =/  fwd-card=card
          ::  carry the explicit NOTE SEND marker to the host (regular/group)
          [%pass /msg-fwd/[note-id.act] %agent [creator.u.exists %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message note-id.act msg directed-kind.act])]
        ::  for remote %group sends, arm the 8s host reachability timer so
        ::  we surface %host-unreachable even when Ames swallows the ack.
        =/  arm-timer=?
          ?&  =(%group type.u.exists)
              !(is-host-deleted note-id.act host-status)
          ==
        ?.  arm-timer
          :_  this
          ~[fwd-card]
        =/  deadline=@da  (add now.bowl ~s8)
        =/  deadline-cord=@ta  (scot %da deadline)
        =/  wait-card=card
          [%pass /host-check/[note-id.act]/[deadline-cord] %arvo %b %wait deadline]
        :_  this(host-checks (~(put by host-checks) note-id.act deadline))
        ~[fwd-card wait-card]
      ::  local note: store and fan out (host posts own message). Carry the NOTE
      ::  SEND marker so member-recipients classify attention as %send.
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  upd=update:noltbook  [%new-message msg directed-kind.act]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      =/  new-seq-counters=(map @ta @ud)
        ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters)
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters new-seq-counters, note-activity (put-activity note-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
      ^-  (list card:agent:gall)
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          (activity-fact note-id.act now.bowl)
          (note-read-fact note-id.act now.bowl)
      ==
    ::
        %edit-message
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
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
            [%give %fact ~[pax] %noltbook-update !>(`update:noltbook`[%new-message u.sys-msg ~])]
            [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%new-message u.sys-msg ~])]
        ==
      :_  this(messages (~(put by messages) note-id.act new-msgs))
      facts
    ::
        %set-note-meta
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  DM: local-only meta change (icon only); either member can set.
      ::  Persist icon-url as dm-prefs[counterparty] for re-invited DMs.
      ?:  =(%dm type.u.old)
        ?.  (~(has in users.u.old) our.bowl)  `this
        =/  cp=(unit @p)  (dm-counterparty users.u.old our.bowl)
        =/  new-prefs=(map @p dm-pref)
          ?~  cp  dm-prefs
          =/  cur=dm-pref  (fall (~(get by dm-prefs) u.cp) [~ ~])
          (~(put by dm-prefs) u.cp cur(icon-url icon-url.act))
        =/  upd-note=note:noltbook  u.old(icon-url icon-url.act)
        =/  upd=update:noltbook  [%note-meta-updated id.act visibility.u.old icon-url.act writable.u.old]
        :_  this(notes (~(put by notes) id.act upd-note), dm-prefs new-prefs)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      ::  only creator can change meta
      ?.  =(our.bowl creator.u.old)  `this
      ::  notebook -> group conversion: visibility public/private on a
      ::  %notebook root flips it (and any %notebook descendants) to %group.
      ::  type-only change; visibility/writable/icon/headline untouched on
      ::  descendants. one-way; %group never demotes back.
      =/  needs-convert=?
        ?&  =(%notebook type.u.old)
            ?|(=(%public visibility.act) =(%private visibility.act))
        ==
      =/  converted=(list @ta)
        ?.  needs-convert  ~
        (collect-notebook-descendants id.act notes)
      =/  convert-ids=(list @ta)
        ?.  needs-convert  ~
        [id.act converted]
      =?  notes  needs-convert  (apply-type-group convert-ids notes)
      =/  effective-old=note:noltbook
        ?.  needs-convert  u.old
        u.old(type %group)
      =/  type-updates=(list card)
        ?.  needs-convert  ~
        (build-type-update-cards id.act converted)
      =/  upd-note=note:noltbook
        effective-old(visibility visibility.act, icon-url icon-url.act, writable writable.act)
      =/  upd=update:noltbook  [%note-meta-updated id.act visibility.act icon-url.act writable.act]
      ::  read-only toggle: adjust muted set for %group notes
      =/  new-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  mute-changed=?  %.n
      ::  Write -> Read Only: mute all non-host non-admin members
      ?:  &(writable.u.old !writable.act =(%group type.effective-old))
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
        %+  weld  type-updates
        ^-  (list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(mute-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]
        ==
      ::  Read Only -> Write: clear muted set broadly
      ?:  &(!writable.u.old writable.act =(%group type.effective-old))
        =.  new-muted  ~
        =.  mute-changed  %.y
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        :_  this(notes (~(put by notes) id.act upd-note), note-muted (~(put by note-muted) id.act new-muted))
        %+  weld  type-updates
        ^-  (list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(mute-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]
        ==
      ::  no writable change or not %group — just update meta
      :_  this(notes (~(put by notes) id.act upd-note))
      %+  weld  type-updates
      ^-  (list card)
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[id.act]] %noltbook-update !>(upd)]
      ==
    ::
        %invite-to-note
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ::  share-time hydration: the entire notebook/group subtree under
      ::  this root is part of the shared object. Collect it tolerantly
      ::  (notebook or group), then normalize every notebook node + the
      ::  root to %group so the outgoing invite + child pokes carry
      ::  type=%group and the cascade walks the full subtree.
      =/  share-descs=(list @ta)  (collect-share-descendants id.act notes)
      =/  root-was-notebook=?  =(%notebook type.u.old)
      =/  desc-changed=(list @ta)
        %+  skim  share-descs
        |=  nid=@ta
        =/  n=(unit note:noltbook)  (~(get by notes) nid)
        ?~  n  %.n
        =(%notebook type.u.n)
      =/  changed-ids=(list @ta)
        ?:  root-was-notebook  [id.act desc-changed]
        desc-changed
      =/  needs-convert=?  !=(~ changed-ids)
      =?  notes  needs-convert  (apply-type-group [id.act share-descs] notes)
      =/  effective-old=note:noltbook
        ?:  root-was-notebook  u.old(type %group)
        u.old
      =/  type-updates=(list card)
        ?.  needs-convert  ~
        (build-type-update-cards-by-ids changed-ids)
      ::  non-host group admin: forward invite request to host
      ?:  &(=(%group type.effective-old) !=(our.bowl creator.effective-old))
        =/  host=@p  creator.effective-old
        :_  this
        ~[[%pass /mod-out/(scot %p host)/[id.act] %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %invite-member ship.act])]]
      ::  compute new user set
      =/  new-users=(set @p)  (~(put in users.effective-old) ship.act)
      =/  new-removed=(set @p)  (~(del in removed.effective-old) ship.act)
      =/  new-note=note:noltbook  effective-old(users new-users, removed new-removed)
      ::  poke remote ship with invite (gossip notes use gossip-invite with headline)
      =/  poke-card=card
        ?:  =(%gossip type.effective-old)
          =/  hl=(unit @t)  (~(get by headlines) id.act)
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.effective-old our.bowl users.new-note hl]
          [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
        =/  rem=remote:noltbook  [%remote-invite id.act name.effective-old type.effective-old our.bowl users.new-note visibility.effective-old writable.effective-old]
        [%pass /invite/(scot %p ship.act)/[id.act] %agent [ship.act %noltbook] %poke %noltbook-remote !>(rem)]
      ::  subscribe to remote's ars notoria if new peer
      =/  new-peers=(set @p)  (~(put in peers) ship.act)
      =/  is-new-peer=?  !(~(has in peers) ship.act)
      =/  ars-cards=(list card)
        ?.  is-new-peer
          ~
        ~[[%pass /ars/(scot %p ship.act) %agent [ship.act %noltbook] %watch /notes/cover]]
      ::  notify local frontend
      =/  upd=update:noltbook  [%note-created new-note]
      ::  auto-mute invitee if note is read-only (group only, skip host/admin)
      =/  ro-muted=(set @p)
        ?.  &(!writable.effective-old =(%group type.effective-old))
          (fall (~(get by note-muted) id.act) ~)
        ?.  =(ship.act creator.effective-old)
          ?.  (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act)
            (~(put in (fall (~(get by note-muted) id.act) ~)) ship.act)
          (fall (~(get by note-muted) id.act) ~)
        (fall (~(get by note-muted) id.act) ~)
      =/  ro-mute-cards=(list card)
        ?.  &(!writable.effective-old =(%group type.effective-old))  ~
        ?:  =(ship.act creator.effective-old)  ~
        ?:  (~(has in (fall (~(get by note-admins) id.act) ~)) ship.act)  ~
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in ro-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]]
      ::  Phase 3: cascade membership to the shared subtree (root excluded).
      ::  share-descs already filters non-group/non-notebook ids.
      =.  notes
        ?:  =(~ share-descs)  notes
        (add-ship-to-ids ship.act share-descs notes)
      =/  new-revs=(map @ta @ud)
        (bump-member-revs [id.act share-descs] member-revs)
      =/  desc-users-cards=(list card)
        ?:  =(~ share-descs)  ~
        (build-users-updated-cards share-descs notes new-revs)
      =/  desc-child-pokes=(list card)
        ?:  =(~ share-descs)  ~
        (build-remote-child-notes-to-ship ship.act share-descs notes)
      ::  notify existing remote subscribers of the root note that the
      ::  member list changed; without this they keep a stale users set
      ::  and can miss later invitees on local-only operations like fork.
      =/  root-users-upd=update:noltbook
        [%note-users-updated id.act type.new-note ~(tap in users.new-note) ~(tap in removed.new-note) (member-rev-of id.act new-revs)]
      =/  root-users-cards=(list card)
        ~[[%give %fact ~[/notes/[id.act]] %noltbook-update !>(root-users-upd)]]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act ro-muted), member-revs new-revs)
      :(weld type-updates [poke-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes root-users-cards)
    ::
        %invite-to-note-batch
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  permission gate matches %invite-to-note
      ?.  ?|  =(our.bowl creator.u.old)
              &(=(%gossip type.u.old) (~(has in users.u.old) our.bowl))
              &(=(%group type.u.old) (~(has in (fall (~(get by note-admins) id.act) ~)) our.bowl))
          ==
        `this
      ?:  =(%dm type.u.old)  `this
      ::  share-time hydration (batch): walk full notebook/group subtree,
      ::  flip notebook nodes + root to %group so every invitee sees the
      ::  whole tree as a group.
      =/  share-descs=(list @ta)  (collect-share-descendants id.act notes)
      =/  root-was-notebook=?  =(%notebook type.u.old)
      =/  desc-changed=(list @ta)
        %+  skim  share-descs
        |=  nid=@ta
        =/  n=(unit note:noltbook)  (~(get by notes) nid)
        ?~  n  %.n
        =(%notebook type.u.n)
      =/  changed-ids=(list @ta)
        ?:  root-was-notebook  [id.act desc-changed]
        desc-changed
      =/  needs-convert=?  !=(~ changed-ids)
      =?  notes  needs-convert  (apply-type-group [id.act share-descs] notes)
      =/  effective-old=note:noltbook
        ?:  root-was-notebook  u.old(type %group)
        u.old
      =/  type-updates=(list card)
        ?.  needs-convert  ~
        (build-type-update-cards-by-ids changed-ids)
      ::  clean input: dedup, drop self + existing members
      =/  cleaned=(set @p)
        =/  raw=(set @p)  (sy ships.act)
        =/  no-self=(set @p)  (~(del in raw) our.bowl)
        %-  ~(rep in no-self)
        |=  [p=@p acc=(set @p)]
        ?:  (~(has in users.effective-old) p)  acc
        (~(put in acc) p)
      ?:  =(~ cleaned)  `this
      ::  non-host group admin: forward one %remote-mod per cleaned ship
      ?:  &(=(%group type.effective-old) !=(our.bowl creator.effective-old))
        =/  host=@p  creator.effective-old
        =/  mod-cards=(list card)
          %+  turn  ~(tap in cleaned)
          |=  p=@p
          ^-  card
          [%pass /mod-out/(scot %p host)/[id.act]/(scot %p p) %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-mod id.act %invite-member p])]
        :_  this
        mod-cards
      ::  compute final users + removed once; all invites carry this set
      =/  new-users=(set @p)  (~(uni in users.effective-old) cleaned)
      =/  new-removed=(set @p)
        %-  ~(rep in cleaned)
        |=  [p=@p acc=_removed.effective-old]
        (~(del in acc) p)
      =/  new-note=note:noltbook  effective-old(users new-users, removed new-removed)
      ::  outgoing invite poke per cleaned ship, with FINAL users set
      =/  poke-cards=(list card)
        ?:  =(%gossip type.effective-old)
          =/  hl=(unit @t)  (~(get by headlines) id.act)
          %+  turn  ~(tap in cleaned)
          |=  p=@p
          ^-  card
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.effective-old our.bowl users.new-note hl]
          [%pass /invite/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(rem)]
        %+  turn  ~(tap in cleaned)
        |=  p=@p
        ^-  card
        =/  rem=remote:noltbook  [%remote-invite id.act name.effective-old type.effective-old our.bowl users.new-note visibility.effective-old writable.effective-old]
        [%pass /invite/(scot %p p)/[id.act] %agent [p %noltbook] %poke %noltbook-remote !>(rem)]
      ::  peers + ars cover-watch per genuinely-new peer
      =/  new-peers=(set @p)  (~(uni in peers) cleaned)
      =/  newly-peered=(set @p)
        %-  ~(rep in cleaned)
        |=  [p=@p acc=(set @p)]
        ?:  (~(has in peers) p)  acc
        (~(put in acc) p)
      =/  ars-cards=(list card)
        %+  turn  ~(tap in newly-peered)
        |=  p=@p
        ^-  card
        [%pass /ars/(scot %p p) %agent [p %noltbook] %watch /notes/cover]
      ::  read-only group: auto-mute each cleaned non-host/non-admin invitee
      =/  is-ro-group=?  &(!writable.effective-old =(%group type.effective-old))
      =/  admins=(set @p)  (fall (~(get by note-admins) id.act) ~)
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      =/  to-mute=(set @p)
        ?.  is-ro-group  *(set @p)
        %-  ~(rep in cleaned)
        |=  [p=@p acc=(set @p)]
        ?:  =(p creator.effective-old)  acc
        ?:  (~(has in admins) p)  acc
        (~(put in acc) p)
      =/  new-muted=(set @p)  (~(uni in cur-muted) to-mute)
      =/  ro-mute-cards=(list card)
        ?:  =(~ to-mute)  ~
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[id.act]] %noltbook-update !>(mute-upd)]]
      ::  cascade membership to shared subtree once; share-descs already
      ::  filters non-group/non-notebook ids. Explicit trap seeded with
      ::  current notes — `~(rep in ...)` would bunt nm to the empty map.
      =.  notes
        ?:  =(~ share-descs)  notes
        =/  ships=(list @p)  ~(tap in cleaned)
        =/  nm=(map @ta note:noltbook)  notes
        |-  ^-  (map @ta note:noltbook)
        ?~  ships  nm
        $(ships t.ships, nm (add-ship-to-ids i.ships share-descs nm))
      =/  new-revs=(map @ta @ud)
        (bump-member-revs [id.act share-descs] member-revs)
      =/  desc-users-cards=(list card)
        ?:  =(~ share-descs)  ~
        (build-users-updated-cards share-descs notes new-revs)
      =/  desc-child-pokes=(list card)
        ?:  =(~ share-descs)  ~
        %-  zing
        %+  turn  ~(tap in cleaned)
        |=  p=@p
        ^-  (list card)
        (build-remote-child-notes-to-ship p share-descs notes)
      ::  root /notes/[id] users update with FINAL set so existing subscribers
      ::  refresh in one shot
      =/  root-users-upd=update:noltbook
        [%note-users-updated id.act type.new-note ~(tap in users.new-note) ~(tap in removed.new-note) (member-rev-of id.act new-revs)]
      =/  root-users-cards=(list card)
        ~[[%give %fact ~[/notes/[id.act]] %noltbook-update !>(root-users-upd)]]
      =/  upd=update:noltbook  [%note-created new-note]
      =/  local-cards=(list card)
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act new-muted), member-revs new-revs)
      :(weld type-updates poke-cards local-cards ars-cards ro-mute-cards desc-users-cards desc-child-pokes root-users-cards)
    ::
        %create-artifact
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  cover/gossip artifact creation is not implemented; close legacy door
      ?:  ?|(?=(%cover type.u.exists) ?=(%gossip type.u.exists))  `this
      =/  aid=@ta  (crip (weld "art-" (trip (scot %da now.bowl))))
      =/  new-art=artifact:noltbook
        :*  aid  name.act  type.act  our.bowl  note-id.act
            ~[[1 content.act our.bowl now.bowl]]
            `(artifact-meta our.bowl aid now.bowl reply-to-eid.act)
        ==
      =/  upd=update:noltbook  [%artifact-created new-art]
      =/  pax=path  ~[%notes note-id.act]
      =/  prev=@t  (artifact-preview new-art)
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `prev)
      :_  this(notes (~(put by notes) note-id.act upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
      ^-  (list card:agent:gall)
      :~  [%give %fact ~[pax] %noltbook-update !>(upd)]
          (activity-fact note-id.act now.bowl)
          (note-read-fact note-id.act now.bowl)
          (sidebar-signal note-id.act our.bowl `prev %artifact now.bowl)
      ==
    ::
        %edit-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
      =/  nid=@ta  note-id.u.old
      =/  upd=update:noltbook  [%artifact-deleted id.act]
      =/  pax=path  ~[%notes nid]
      :_  this(artifacts (~(del by artifacts) id.act))
      ~[[%give %fact ~[pax] %noltbook-update !>(upd)]]
    ::
        %file-save
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
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
        %search-messages
      ::  Phase 2 sidebar search. Case-insensitive substring scan over the
      ::  local messages map. No state mutation. Skips only %cover and
      ::  %ars-rumors system surfaces; user-created gossip notes are kept.
      ::  Skips notes missing from the notes map and authors in pal-blocked.
      =/  q-tape=tape  (cass (trip query.act))
      =/  hard-cap=@ud  50
      =/  cap=@ud  ?:(=(0 limit.act) hard-cap (min limit.act hard-cap))
      =/  pairs=(list [@ta (list message:noltbook)])  ~(tap by messages)
      =|  acc=(list search-msg-hit:noltbook)
      =/  all-hits=(list search-msg-hit:noltbook)
        |-  ^-  (list search-msg-hit:noltbook)
        ?~  pairs  acc
        =*  nid  -.i.pairs
        =*  msgs  +.i.pairs
        ?:  =(nid 'cover')           $(pairs t.pairs)
        ?:  =(nid 'ars-rumors')      $(pairs t.pairs)
        ?~  (~(get by notes) nid)    $(pairs t.pairs)
        =/  ms=(list message:noltbook)  msgs
        =/  note-acc=(list search-msg-hit:noltbook)  ~
        =.  note-acc
          |-  ^-  (list search-msg-hit:noltbook)
          ?~  ms  note-acc
          ?:  (~(has in pal-blocked) author.i.ms)
            $(ms t.ms)
          =/  body=tape  (cass (trip text.i.ms))
          ?:  =(~ (find q-tape body))
            $(ms t.ms)
          =/  pv=@t  (crip (scag 160 (trip text.i.ms)))
          =/  eid-u=(unit @uv)
            ?~  meta.i.ms  ~
            `eid.u.meta.i.ms
          =/  hit=search-msg-hit:noltbook
            [nid id.i.ms eid-u author.i.ms timestamp.i.ms pv]
          $(ms t.ms, note-acc [hit note-acc])
        $(pairs t.pairs, acc (weld note-acc acc))
      =/  sorted=(list search-msg-hit:noltbook)
        %+  sort  all-hits
        |=  [a=search-msg-hit:noltbook b=search-msg-hit:noltbook]
        (gth timestamp.a timestamp.b)
      =/  total=@ud  (lent sorted)
      =/  capped=?  (gth total cap)
      =/  hits=(list search-msg-hit:noltbook)  (scag cap sorted)
      =/  upd=update:noltbook  [%search-result req-id.act query.act hits capped]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %request-profile
      ::  Phase 3: explicit profile lookup. Triggered by an unknown @p row in
      ::  the sidebar search results. Self-lookup short-circuits locally; any
      ::  other ship is poked on /profile-lookup/[ship]/[req-id] so the
      ::  on-agent arm can flip status to %unreachable on poke-ack failure.
      ?:  =(ship.act our.bowl)
        =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
        =/  pupd=update:noltbook  [%profile-updated our.bowl prof]
        =/  rupd=update:noltbook  [%profile-lookup-result req-id.act our.bowl %ok]
        :_  this
        :~  [%give %fact ~[/notes] %noltbook-update !>(pupd)]
            [%give %fact ~[/notes] %noltbook-update !>(rupd)]
        ==
      =/  req=remote:noltbook  [%remote-profile-request req-id.act]
      :_  this
      ~[[%pass /profile-lookup/(scot %p ship.act)/(scot %ud req-id.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(req)]]
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
    ::  Manual opt-in only: no auto-discovery / no auto add-pal on watch.
    ::
        %add-pal
      ?:  =(ship.act our.bowl)  `this
      ::  unblock if blocked
      =/  new-blocked=(set @p)  (~(del in pal-blocked) ship.act)
      ::  add to outgoing + peers bookkeeping, send %remote-hey + our profile
      =/  new-outgoing=(set @p)  (~(put in pal-outgoing) ship.act)
      =/  new-peers=(set @p)  (~(put in peers) ship.act)
      =/  hey-card=card
        [%pass /pal-hey/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-hey ~])]
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  prof-card=card
        [%pass /prof-out/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-profile our.bowl prof])]
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %mutual
        %requesting
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-outgoing new-outgoing, pal-blocked new-blocked, peers new-peers)
      [hey-card prof-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~]
    ::
        %remove-pal
      ?:  =(ship.act our.bowl)  `this
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  bye-card=card
        [%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]
      =/  still-visible=?
        ?|  (~(has in contacts) ship.act)
            (~(has in pal-incoming) ship.act)
            (~(has in pal-blocked) ship.act)
        ==
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      :_  this(pal-outgoing new-outgoing)
      [bye-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~]
    ::
        %dismiss-pal-request
      ?:  =(ship.act our.bowl)  `this
      =/  new-incoming=(set @p)  (~(del in pal-incoming) ship.act)
      =/  still-visible=?
        ?|  (~(has in contacts) ship.act)
            (~(has in pal-outgoing) ship.act)
            (~(has in pal-blocked) ship.act)
        ==
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-blocked) ship.act)  %blocked
        ?:  (~(has in pal-outgoing) ship.act)  %requesting
        %none
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      :_  this(pal-incoming new-incoming)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
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
        =/  entries=(list [@ta note:noltbook])  ~(tap by notes)
        =/  nn=(map @ta note:noltbook)  notes
        =/  na=(map @ta (set @p))  note-admins
        =/  nm=(map @ta (set @p))  note-muted
        =/  cc=(list card)  ~
        |-
        ?~  entries  [nn na nm cc]
        =/  nid=@ta  -.i.entries
        =/  n=note:noltbook  +.i.entries
        ?.  ?&(=(our.bowl creator.n) =(%group type.n) (~(has in users.n) ship.act))
          $(entries t.entries)
        =/  new-users=(set @p)  (~(del in users.n) ship.act)
        =/  new-removed=(set @p)  (~(put in removed.n) ship.act)
        =/  upd-note=note:noltbook  n(users new-users, removed new-removed)
        =/  users-upd=update:noltbook  [%note-users-updated nid type.n ~(tap in new-users) ~(tap in new-removed) (member-rev-of nid member-revs)]
        =/  kick-card=card
          [%pass /kick/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick nid name.n])]
        ::  clean admin/muted role state for removed ship
        =/  new-na=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by na) nid) ~)
          ?:  (~(has in cur) ship.act)
            (~(put by na) nid (~(del in cur) ship.act))
          na
        =/  new-nm=(map @ta (set @p))
          =/  cur=(set @p)  (fall (~(get by nm) nid) ~)
          ?:  (~(has in cur) ship.act)
            (~(put by nm) nid (~(del in cur) ship.act))
          nm
        $(entries t.entries, nn (~(put by nn) nid upd-note), na new-na, nm new-nm, cc [kick-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] cc])
      ::  pass 2: auto-leave all %group notes hosted by blocked ship
      =/  leave-result=[new-notes=(map @ta note:noltbook) new-msgs=(map @ta (list message:noltbook)) new-arts=(map @ta artifact:noltbook) cards=(list card)]
        =/  entries=(list [@ta note:noltbook])  ~(tap by new-notes.removal-result)
        =/  nn=(map @ta note:noltbook)  new-notes.removal-result
        =/  nm=(map @ta (list message:noltbook))  messages
        =/  na=(map @ta artifact:noltbook)  artifacts
        =/  cc=(list card)  ~
        |-
        ?~  entries  [nn nm na cc]
        =/  nid=@ta  -.i.entries
        =/  n=note:noltbook  +.i.entries
        ?.  ?&(=(ship.act creator.n) =(%group type.n) (~(has in users.n) our.bowl))
          $(entries t.entries)
        =/  del-upd=update:noltbook  [%note-deleted nid]
        =/  unsub-card=card
          [%pass /remote-note/[nid] %agent [ship.act %noltbook] %leave ~]
        =/  leave-card=card
          [%pass /leave-out/(scot %p ship.act)/[nid] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-leave nid])]
        =/  cleaned-na=(map @ta artifact:noltbook)
          %-  ~(rep by na)
          |=  [[k=@ta v=artifact:noltbook] a=(map @ta artifact:noltbook)]
          ?.  =(note-id.v nid)  (~(put by a) k v)
          a
        $(entries t.entries, nn (~(del by nn) nid), nm (~(del by nm) nid), na cleaned-na, cc [unsub-card leave-card [%give %fact ~[/notes] %noltbook-update !>(del-upd)] cc])
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
      =/  still-visible=?
        ?|  (~(has in contacts) ship.act)
            (~(has in pal-outgoing) ship.act)
            (~(has in pal-incoming) ship.act)
        ==
      =/  status=pal-status:noltbook
        ?:  &((~(has in pal-outgoing) ship.act) (~(has in pal-incoming) ship.act))  %mutual
        ?:  (~(has in pal-outgoing) ship.act)  %requesting
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      :_  this(pal-blocked new-blocked)
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%pass /unblock-notify/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-unblocked ~])]
      ==
    ::
        %add-contact
      ::  add explicit contact (independent of pal state).
      ?:  =(ship.act our.bowl)  `this
      =/  new-contacts=(set @p)  (~(put in contacts) ship.act)
      =/  new-peers=(set @p)  (~(put in peers) ship.act)
      ::  status reflects pal state, not contact-only membership
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-blocked) ship.act)  %blocked
        ?:  &((~(has in pal-outgoing) ship.act) (~(has in pal-incoming) ship.act))  %mutual
        ?:  (~(has in pal-outgoing) ship.act)  %requesting
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook  [%pal-update ship.act status]
      =/  cupd=update:noltbook  [%contact-list ~(tap in new-contacts)]
      :_  this(contacts new-contacts, peers new-peers)
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(cupd)]
      ==
    ::
        %remove-contact
      ::  remove from visible contacts. This clears explicit contact state
      ::  plus local pal/request state, but does not touch block state.
      ?:  =(ship.act our.bowl)  `this
      =/  new-contacts=(set @p)  (~(del in contacts) ship.act)
      =/  had-outgoing=?  (~(has in pal-outgoing) ship.act)
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  new-incoming=(set @p)  (~(del in pal-incoming) ship.act)
      =/  bye-cards=(list card)
        ?.  had-outgoing  ~
        ~[[%pass /pal-bye/(scot %p ship.act) %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-bye ~])]]
      ::  blocked ships remain visible until explicitly unblocked.
      =/  still-visible=?
        (~(has in pal-blocked) ship.act)
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-blocked) ship.act)  %blocked
        %none
      ::  if no block state, emit %pal-removed so frontend drops row.
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      =/  cupd=update:noltbook  [%contact-list ~(tap in new-contacts)]
      =/  base-cards=(list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
            [%give %fact ~[/notes] %noltbook-update !>(cupd)]
        ==
      :_  this(contacts new-contacts, pal-outgoing new-outgoing, pal-incoming new-incoming)
      (weld base-cards bye-cards)
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
        %clear-attention
      ::  clear a directed-attention item: eid > msg-id > aid. Clears the stored
      ::  `attention` map (Phase B reply/send) AND, since mention-attention is
      ::  derived from `mentions`, a matching mention there too — so future unified
      ::  clearing works. Phase A frontend still clears mentions via %clear-mention.
      =/  nid=@ta  note-id.act
      =/  cur-a=(list attention-item:noltbook)  (fall (~(get by attention) nid) ~)
      =/  new-a=(list attention-item:noltbook)
        %+  skip  cur-a
        |=  it=attention-item:noltbook
        ?^  eid.act
          &(?=(^ eid.it) =(u.eid.it u.eid.act))
        ?^  msg-id.act
          &(?=(^ msg-id.it) =(u.msg-id.it u.msg-id.act))
        ?^  aid.act
          &(?=(^ aid.it) =(u.aid.it u.aid.act))
        %.n
      =.  attention
        ?~  new-a  (~(del by attention) nid)
        (~(put by attention) nid new-a)
      =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) nid) ~)
      =/  new-m=(list [id=@da eid=(unit @uv) author=@p])
        %+  skip  cur-m
        |=  [id=@da eid=(unit @uv) author=@p]
        ?^  eid.act
          &(?=(^ eid) =(u.eid u.eid.act))
        ?^  msg-id.act
          =(id u.msg-id.act)
        %.n
      =.  mentions
        ?~  new-m  (~(del by mentions) nid)
        (~(put by mentions) nid new-m)
      ::  emit an authoritative full snapshot so the frontend replaces this note's
      ::  attention list (no stale orange dots), even when it is now empty.
      =/  snap=(list attention-item:noltbook)
        (fall (~(get by (all-attention mentions attention)) nid) ~)
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%attention-update nid snap %.y])]]
    ::
        %set-dial
      ::  clamp dial to 0-3
      =/  new-dial=@ud  (min dial.act 3)
      =/  upd=update:noltbook  [%dial-update new-dial]
      :_  this(dial new-dial)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %ack-durable-notification
      ::  durable seen-ack for a passive condition row. Touches only the
      ::  notification-acks set — never notes, membership, host-status,
      ::  pending invites, or join requests.
      =/  ackd=(set durable-notification-ack:noltbook)
        (~(put in notification-acks) [kind.act note-id.act])
      =/  ack-list=(list durable-notification-ack:noltbook)  ~(tap in ackd)
      :_  this(notification-acks ackd)
      ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%notification-acks ack-list])]]
    ::
        %mark-note-read
      ::  durable green-unread: mark a note read to now.bowl (never decreasing).
      ::  Used by the frontend to clear unread for the currently-open note when
      ::  live activity arrives. Touches only note-read; not recency/current-note.
      =/  n  (~(get by notes) note-id.act)
      ?~  n  `this
      ?:  (is-pinned-note note-id.act)  `this
      =/  nr=(map @ta @da)  (put-read note-read note-id.act now.bowl)
      :_  this(note-read nr)
      ~[(note-read-fact note-id.act now.bowl)]
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
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ::  Phase 3: cascade removal to %group descendants
      =/  group-descs=(list @ta)
        ?.  =(%group type.u.old)  ~
        (collect-group-descendants id.act notes)
      =/  notes-after=(map @ta note:noltbook)
        (~(put by notes) id.act upd-note)
      =.  notes-after
        ?:  =(~ group-descs)  notes-after
        (remove-ship-from-ids ship.act group-descs notes-after)
      =/  new-revs=(map @ta @ud)
        (bump-member-revs [id.act group-descs] member-revs)
      =/  users-upd=update:noltbook  [%note-users-updated id.act type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of id.act new-revs)]
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
      =/  desc-users-cards=(list card)
        ?:  =(~ group-descs)  ~
        (build-users-updated-cards group-descs notes-after new-revs)
      :_  this(notes notes-after, messages (~(put by messages) id.act new-msgs), note-admins clean-admins, note-muted clean-muted, member-revs new-revs)
      %+  weld
        ^-  (list card)
        :~  kick-card
            [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(msg-upd)]
            [%give %fact ~[/notes/[id.act]] %noltbook-update !>(msg-upd)]
        ==
      desc-users-cards
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
      ::  Phase 3: collect %group descendants once for both host and non-host
      ::  branches (computed against pre-deletion notes map).
      =/  group-descs=(list @ta)
        ?.  =(%group type.u.old)  ~
        (collect-group-descendants id.act notes)
      =/  subtree-ids=(list @ta)  [id.act group-descs]
      ::  host leaving shared note: notify other users via kick, then drop locally
      ?:  is-host
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  pax=path  ~[%notes id.act]
        ::  kick every remaining member off every node in the subtree
        =/  kick-cards=(list card)
          %-  zing
          %+  turn  ~(tap in users.u.old)
          |=  p=@p
          ^-  (list card)
          ?:  =(p our.bowl)  ~
          %+  turn  subtree-ids
          |=  nid=@ta
          ^-  card
          =/  nm=(unit note:noltbook)  (~(get by notes) nid)
          =/  nname=@t  ?~(nm '' name.u.nm)
          [%pass /kick-out/(scot %p p)/[nid] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-kick nid nname])]
        ::  drop entire subtree from local state
        =/  notes-after=(map @ta note:noltbook)
          %+  roll  subtree-ids
          |=  [nid=@ta nm=_notes]
          (~(del by nm) nid)
        =/  msgs-after=(map @ta (list message:noltbook))
          %+  roll  subtree-ids
          |=  [nid=@ta mm=_messages]
          (~(del by mm) nid)
        =/  arts-after=(map @ta artifact:noltbook)
          %-  ~(rep by artifacts)
          |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
          ?:  (lien subtree-ids |=(c=@ta =(c note-id.v)))  acc
          (~(put by acc) k v)
        =/  local-deletes=(list card)
          %+  turn  subtree-ids
          |=  nid=@ta
          ^-  card
          [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-deleted nid])]
        :_  this(notes notes-after, messages msgs-after, artifacts arts-after)
        :(weld local-deletes ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] kick-cards)
      ::  non-host leaving shared note: unsub root + descendants, poke host
      ::  about the root (host cascades to its own copy), drop local subtree.
      =/  host=@p  creator.u.old
      =/  unsub-cards=(list card)
        %+  turn  subtree-ids
        |=  nid=@ta
        ^-  card
        [%pass /remote-note/[nid] %agent [host %noltbook] %leave ~]
      =/  leave-card=card
        [%pass /leave-out/(scot %p host)/[id.act] %agent [host %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-leave id.act])]
      ::  drop entire subtree from local state
      =/  notes-after=(map @ta note:noltbook)
        %+  roll  subtree-ids
        |=  [nid=@ta nm=_notes]
        (~(del by nm) nid)
      =/  msgs-after=(map @ta (list message:noltbook))
        %+  roll  subtree-ids
        |=  [nid=@ta mm=_messages]
        (~(del by mm) nid)
      =/  arts-after=(map @ta artifact:noltbook)
        %-  ~(rep by artifacts)
        |=  [[k=@ta v=artifact:noltbook] acc=(map @ta artifact:noltbook)]
        ?:  (lien subtree-ids |=(c=@ta =(c note-id.v)))  acc
        (~(put by acc) k v)
      =/  local-deletes=(list card)
        %+  turn  subtree-ids
        |=  nid=@ta
        ^-  card
        [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-deleted nid])]
      :_  this(notes notes-after, messages msgs-after, artifacts arts-after)
      :(weld unsub-cards ~[leave-card] local-deletes)
    ::
        %fork-note
      ::  Phase 6: clone a %group subtree into a new fork hosted by us.
      ::  Allowed for any current non-removed member of a %group, including
      ::  host-deleted archives. Artifact bytes and aux maps (admins/muted/
      ::  calls/joins/mentions) intentionally not copied.
      =/  src  (~(get by notes) id.act)
      ?~  src  `this
      ?.  =(%group type.u.src)  `this
      ::  removed archive holders may still fork — match the FE affordance.
      =/  can-fork=?
        |((~(has in users.u.src) our.bowl) (~(has in removed.u.src) our.bowl))
      ?.  can-fork  `this
      ::  collect subtree (%group descendants, same creator as source root)
      =/  desc-ids=(list @ta)  (collect-group-descendants id.act notes)
      =/  src-ids=(list @ta)  [id.act desc-ids]
      ::  build fresh id map old -> new
      =/  id-map=(map @ta @ta)  (gen-fork-id-map src-ids now.bowl)
      ::  compute eligible invitees: source.users minus removed minus blocked
      ::  minus self. (Old host is included automatically if still in users
      ::  and not blocked.)
      =/  candidates=(set @p)  (~(dif in users.u.src) removed.u.src)
      =/  candidates=(set @p)  (~(dif in candidates) pal-blocked)
      =/  invitees=(set @p)  (~(del in candidates) our.bowl)
      ::  new fork users: forker + all invitees (matches existing remote-invite
      ::  semantics where receivers auto-create locally on poke)
      =/  fork-users=(set @p)  (~(put in invitees) our.bowl)
      ::  lineage
      =/  src-origin=@uv  (lineage-origin-of u.src fork-origin)
      =/  src-version=@ud  (lineage-version-of id.act fork-version)
      =/  new-version=@ud  +(src-version)
      =/  src-host=@p  creator.u.src
      ::  build new note records
      =/  new-notes-list=(list note:noltbook)
        (build-fork-notes src-ids id-map id.act name.act notes our.bowl fork-users)
      ::  install new notes into the map
      =/  notes-after=(map @ta note:noltbook)
        =/  pairs=(list note:noltbook)  new-notes-list
        |-
        ?~  pairs  notes
        $(pairs t.pairs, notes (~(put by notes) id.i.pairs i.pairs))
      ::  pairs of [old-id new-id] for downstream copy helpers
      =/  pairs=(list [old=@ta new=@ta])
        %+  turn  src-ids
        |=  o=@ta  [o (~(got by id-map) o)]
      ::  copy messages and reseed seq-counters
      =/  messages-after=(map @ta (list message:noltbook))
        (copy-messages-for-fork pairs messages messages)
      =/  seq-after=(map @ta @ud)
        =/  todo  pairs
        |-
        ?~  todo  seq-counters
        =/  ml=(list message:noltbook)
          (fall (~(get by messages-after) new.i.todo) ~)
        $(todo t.todo, seq-counters (~(put by seq-counters) new.i.todo (lent ml)))
      ::  copy headlines
      =/  headlines-after=(map @ta @t)
        (copy-headlines-for-fork pairs headlines headlines)
      ::  install lineage entries: every new id gets origin + new-version +
      ::  fork-of pointing to its source counterpart (host = source-host).
      =/  fork-origin-after=(map @ta @uv)
        =/  todo  pairs
        |-
        ?~  todo  fork-origin
        $(todo t.todo, fork-origin (~(put by fork-origin) new.i.todo src-origin))
      =/  fork-version-after=(map @ta @ud)
        =/  todo  pairs
        |-
        ?~  todo  fork-version
        $(todo t.todo, fork-version (~(put by fork-version) new.i.todo new-version))
      =/  fork-of-after=(map @ta [host=@p nid=@ta])
        =/  todo  pairs
        |-
        ?~  todo  fork-of
        $(todo t.todo, fork-of (~(put by fork-of) new.i.todo [src-host old.i.todo]))
      ::  explicit parent-version: every new id was forked from src-version.
      =/  fork-parent-version-after=(map @ta @ud)
        =/  todo  pairs
        |-
        ?~  todo  fork-parent-version
        $(todo t.todo, fork-parent-version (~(put by fork-parent-version) new.i.todo src-version))
      ::  copy %file artifact references into per-fork-note envelopes. No
      ::  byte duplication: the original artifact records stay untouched,
      ::  forks carry artifact-envelopes that point back at the original
      ::  author for fetches.
      =/  artifact-envelopes-after=(map @ta (map @ta artifact-envelope:noltbook))
        =/  todo=(list [old=@ta new=@ta])  pairs
        =/  ae=(map @ta (map @ta artifact-envelope:noltbook))  artifact-envelopes
        |-
        ^-  (map @ta (map @ta artifact-envelope:noltbook))
        ?~  todo  ae
        =/  src-arts=(list artifact:noltbook)
          %+  skim  ~(val by artifacts)
          |=(a=artifact:noltbook =(note-id.a old.i.todo))
        =/  fork-envs=(map @ta artifact-envelope:noltbook)
          (fall (~(get by ae) new.i.todo) *(map @ta artifact-envelope:noltbook))
        =/  fork-envs
          =/  src-todo=(list artifact:noltbook)  src-arts
          |-  ^-  (map @ta artifact-envelope:noltbook)
          ?~  src-todo  fork-envs
          =/  env  (artifact-to-envelope-for-note new.i.todo i.src-todo)
          ?~  env  $(src-todo t.src-todo)
          $(src-todo t.src-todo, fork-envs (~(put by fork-envs) aid.u.env u.env))
        =/  ae2=(map @ta (map @ta artifact-envelope:noltbook))
          ?:  =(~ fork-envs)  ae
          (~(put by ae) new.i.todo (cap-art-envs fork-envs))
        $(todo t.todo, ae ae2)
      ::  outgoing fork invites: metadata-only. Receiver stores as pending
      ::  and must explicitly accept to trigger %remote-fork-fetch.
      =/  new-root-id=@ta  (~(got by id-map) id.act)
      =/  invite-cards=(list card)
        %+  turn  ~(tap in invitees)
        |=  p=@p
        ^-  card
        =/  rem=remote:noltbook
          [%remote-fork-invite new-root-id id.act name.u.src src-version our.bowl src-origin]
        [%pass /fork-invite/(scot %p p)/[new-root-id] %agent [p %noltbook] %poke %noltbook-remote !>(rem)]
      ::  remember the authorized invitee set so we can validate later
      ::  %remote-fork-fetch requests.
      =/  fork-invitees-after=(map @ta (set @p))
        (~(put by fork-invitees) new-root-id invitees)
      ::  local frontend: %note-created per new note + %note-lineage-set per
      ::  new note so sidebar shows fork moniker immediately.
      =/  new-ids=(list @ta)
        %+  turn  src-ids
        |=  o=@ta  (~(got by id-map) o)
      =/  created-cards=(list card)
        %+  turn  new-ids
        |=  nid=@ta
        ^-  card
        =/  n  (~(got by notes-after) nid)
        [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created n])]
      =/  lineage-cards=(list card)
        (build-lineage-set-cards new-ids notes-after fork-origin-after fork-version-after fork-of-after fork-parent-version-after)
      ::  emit %artifact-envelope-list per forked nid so the local FE can
      ::  render references immediately without waiting on a watch reply.
      =/  art-env-cards=(list card)
        %+  murn  new-ids
        |=  nid=@ta
        ^-  (unit card)
        =/  m  (~(get by artifact-envelopes-after) nid)
        ?~  m  ~
        =/  envs=(list artifact-envelope:noltbook)  ~(val by u.m)
        ?~  envs  ~
        `[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%artifact-envelope-list nid envs])]
      :_  %=  this
            notes  notes-after
            messages  messages-after
            seq-counters  seq-after
            headlines  headlines-after
            fork-origin  fork-origin-after
            fork-version  fork-version-after
            fork-of  fork-of-after
            fork-parent-version  fork-parent-version-after
            fork-invitees  fork-invitees-after
            artifact-envelopes  artifact-envelopes-after
          ==
      ^-  (list card)
      :(weld created-cards lineage-cards art-env-cards invite-cards)
    ::
        %accept-fork-invite
      ::  Phase 6.2: do not install yet. Send a %remote-fork-fetch to the
      ::  pending invite's sender. The payload arrives via %remote-fork-payload
      ::  and is installed there after final validation. Mark pending as
      ::  fetching so the FE can show a loading state.
      =/  inv  (~(get by pending-fork-invites) root-id.act)
      ?~  inv  `this
      =/  pi  u.inv
      ?:  (~(has in pal-blocked) sender.pi)  `this
      =/  updated  pi(fetching %.y)
      :_  this(pending-fork-invites (~(put by pending-fork-invites) root-id.act updated))
      ~[[%pass /fork-fetch/(scot %p sender.pi)/[root-id.act] %agent [sender.pi %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fork-fetch root-id.act])]]
    ::
        %decline-fork-invite
      ::  Phase 6.1: forget a pending fork invite. No notification sent to
      ::  the forker in this pass — deferred.
      ?.  (~(has by pending-fork-invites) root-id.act)  `this
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.act]
      :_  this(pending-fork-invites (~(del by pending-fork-invites) root-id.act))
      ~[[%give %fact ~[/notes] %noltbook-update !>(cleared)]]
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
      =/  base-dm=note:noltbook
        :*  nid  (scot %p ship.act)  %dm  our.bowl  target-users  ~  ~  ~  ~  %secret  ~  &  ~  ~
        ==
      ::  apply saved local prefs (name/icon) for this counterparty
      =/  new-dm=note:noltbook  (apply-dm-pref base-dm dm-prefs our.bowl)
      ::  invite counterparty with the DEFAULT name (do not leak local pref)
      =/  rem=remote:noltbook  [%remote-invite nid name.base-dm %dm our.bowl target-users %secret &]
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
      ::  convert a solo %notebook/%group note into the canonical DM for {us, ship}
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?.  ?|(=(%notebook type.u.old) =(%group type.u.old))  `this
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
      ::  move content from a solo %notebook/%group note into existing canonical DM, delete source
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ?.  ?|(=(%notebook type.u.old) =(%group type.u.old))  `this
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
      =/  msg-upd=update:noltbook  [%new-message new-msg ~]
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
                       [%pass /dm-msg/[dm-id] %agent [ship.act %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-message dm-id new-msg ~])]
                   ==
      ==
    ::
    ::  ===== CALL ACTIONS =====
    ::
        %start-call
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
      ::  Phase 3: cascade approved member to %group descendants
      =/  group-descs=(list @ta)
        ?.  =(%group type.u.old)  ~
        (collect-group-descendants note-id.act notes)
      =.  notes
        ?:  =(~ group-descs)  notes
        (add-ship-to-ids ship.act group-descs notes)
      =/  new-revs=(map @ta @ud)
        (bump-member-revs [note-id.act group-descs] member-revs)
      =/  users-upd=update:noltbook  [%note-users-updated note-id.act type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of note-id.act new-revs)]
      =/  desc-users-cards=(list card)
        ?:  =(~ group-descs)  ~
        (build-users-updated-cards group-descs notes new-revs)
      =/  desc-child-pokes=(list card)
        ?:  =(~ group-descs)  ~
        (build-remote-child-notes-to-ship ship.act group-descs notes)
      :_  this(notes (~(put by notes) note-id.act new-note), peers new-peers, note-muted (~(put by note-muted) note-id.act ro-muted), member-revs new-revs)
      :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.act]] %noltbook-update !>(users-upd)] [%give %fact ~[/notes] %noltbook-update !>(jr-upd)] ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
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
      =/  new-revs=(map @ta @ud)  (bump-member-rev note-id.act member-revs)
      =/  users-upd=update:noltbook  [%note-users-updated note-id.act type.u.old ~(tap in users.u.old) ~(tap in new-removed) (member-rev-of note-id.act new-revs)]
      :_  this(notes (~(put by notes) note-id.act upd-note), member-revs new-revs)
      :~  deny-card
          [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes/[note-id.act]] %noltbook-update !>(users-upd)]
          [%give %fact ~[/notes] %noltbook-update !>(jr-upd)]
      ==
    ::
        %make-admin
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
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
      =/  raw-note=note:noltbook
        [note-id.rem name.rem type.rem creator.rem users.rem ~ ~ ~ ~ visibility.rem ~ writable.rem ~ ~]
      ::  for DMs, overlay saved local prefs (name/icon) — these never travel
      =/  new-note=note:noltbook  (apply-dm-pref raw-note dm-prefs our.bowl)
      ::  repair children: if orphan child notes for this id already exist
      ::  locally (delivered before the root invite), merge their ids into
      ::  new-note.children so the subtree renders on install.
      =/  orphan-children=(list @ta)  (find-orphan-children note-id.rem notes)
      =/  new-note=note:noltbook
        new-note(children (merge-children children.new-note orphan-children))
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
              (activity-fact note-id.rem now.bowl)
          ==
        :_  %=  this
              notes  (~(put by trimmed) note-id.rem new-note)
              messages  (~(put by trimmed-msgs) note-id.rem ~)
              peers  new-peers
              note-activity  (put-activity note-activity note-id.rem now.bowl)
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
      :_  this(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers, note-activity (put-activity note-activity note-id.rem now.bowl))
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact note-id.rem now.bowl) ~] ars-cards)
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
            note-activity  (put-activity note-activity note-id.rem now.bowl)
          ==
      :(weld [sub-card [%give %fact ~[/notes] %noltbook-update !>(upd)] (activity-fact note-id.rem now.bowl) ~] ars-cards)
    ::
        %remote-dm-message
      ::  atomic DM delivery: payload carries DM note metadata, so the
      ::  receiver can recreate the DM if they previously left it. No
      ::  subscription, no echo poke — avoids ames loops.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ?.  =(%dm type.note.rem)  `this
      ?.  =(2 ~(wyt in users.note.rem))  `this
      ?.  (~(has in users.note.rem) our.bowl)  `this
      ?.  (~(has in users.note.rem) src.bowl)  `this
      ?.  =(src.bowl author.msg.rem)  `this
      ::  resolve canonical local nid for this pair (handles re-creation
      ::  after leave, and possible nid collision via root-wins).
      =/  existing=(unit note:noltbook)  (find-dm-root notes users.note.rem)
      =/  install-fresh=note:noltbook  (apply-dm-pref note.rem dm-prefs our.bowl)
      =/  target-nid=@ta
        ?~  existing  id.note.rem
        ?:  =(id.u.existing id.note.rem)  id.u.existing
        ?:  (root-wins [creator.u.existing id.u.existing] [creator.note.rem id.note.rem])
          id.u.existing
        id.note.rem
      =/  staged-notes=(map @ta note:noltbook)
        ?~  existing
          (~(put by notes) target-nid install-fresh)
        ?:  =(id.u.existing target-nid)  notes
        ::  remote wins: drop local, install incoming
        (~(put by (~(del by notes) id.u.existing)) target-nid install-fresh)
      =/  staged-msgs=(map @ta (list message:noltbook))
        ?~  existing
          (~(put by messages) target-nid ~)
        ?:  =(id.u.existing target-nid)  messages
        (~(put by (~(del by messages) id.u.existing)) target-nid ~)
      =/  note-cards=(list card)
        ?~  existing
          ~[[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created install-fresh])]]
        ?:  =(id.u.existing target-nid)  ~
        :~  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-redirect id.u.existing target-nid])]
            [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created install-fresh])]
        ==
      ::  dedup message on target nid
      =/  cur=(list message:noltbook)  (fall (~(get by staged-msgs) target-nid) ~)
      =/  msg-eid=(unit @uv)  ?~(meta.msg.rem ~ `eid.u.meta.msg.rem)
      =/  dup=?
        ?|  (lien cur |=(m=message:noltbook =(id.m id.msg.rem)))
            ?&  ?=(^ msg-eid)
                (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.msg-eid))))
            ==
        ==
      ?:  dup
        :_  this(notes staged-notes, messages staged-msgs)
        note-cards
      ::  The remote ship may know this DM under a different root id. Store
      ::  and emit the message under our resolved local DM id so the frontend
      ::  does not route it to the stale/remote id.
      =/  local-msg=message:noltbook  msg.rem(note-id target-nid)
      =/  new-cur=(list message:noltbook)  (snoc cur local-msg)
      =/  target-note=note:noltbook  (~(got by staged-notes) target-nid)
      =/  upd-note=note:noltbook
        target-note(last-author `src.bowl, last-preview `text.local-msg)
      =/  new-msg-upd=update:noltbook  [%new-message local-msg ~]
      =/  msg-cards=(list card)
        :~  [%give %fact ~[/notes/[target-nid]] %noltbook-update !>(new-msg-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(new-msg-upd)]
        ==
      :_  this(notes (~(put by staged-notes) target-nid upd-note), messages (~(put by staged-msgs) target-nid new-cur), note-activity (put-activity note-activity target-nid now.bowl))
      :(weld note-cards msg-cards ~[(activity-fact target-nid now.bowl)])
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
        ::  sender-supplied reply-to-eid wins first — this is the ONLY signal for
        ::  replies to artifacts (which have no legacy @da reply-to). Must be
        ::  checked before the legacy reply-to short-circuit.
        =/  sender-eid=(unit @uv)
          ?~(meta.msg.rem ~ reply-to-eid.u.meta.msg.rem)
        ?^  sender-eid  sender-eid
        ::  legacy text-to-text fallback: resolve parent message by @da id
        ?~  reply-to.msg.rem  ~
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
      ::  host rebroadcast of a member's message: carry the member's NOTE SEND
      ::  marker (directed-kind.rem) so a member-recipient classifies as %send.
      =/  upd=update:noltbook  [%new-message stamped directed-kind.rem]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      ::  mention detection: check if @~our appears in message text
      =/  mentioned=?  (has-our-mention text.msg.rem our.bowl)
      =/  stamped-eid=(unit @uv)
        ?~  meta.stamped  ~
        `eid.u.meta.stamped
      =/  mention-cards=(list card)
        ?.  mentioned  ~
        (attn-mention-cards note-id.rem id.stamped stamped-eid author.msg.rem)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) note-id.rem) ~)
        (~(put by mentions) note-id.rem (snoc cur-m [id.stamped stamped-eid author.msg.rem]))
      =/  new-seq=(map @ta @ud)
        ?:  =(%dm type.u.old)  seq-counters
        ?:(is-regular (~(put by seq-counters) note-id.rem nxt-seq) seq-counters)
      ::  reply attention: notify the immediate parent owner if it is us. Target
      ::  is the NEW reply (a message). Uses sender reply-to-eid then legacy @da.
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a note-id.rem)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) note-id.rem) *(map @ta artifact-envelope:noltbook)))
      =/  rte=(unit @uv)  ?~(meta.msg.rem ~ reply-to-eid.u.meta.msg.rem)
      =/  par-owner=(unit @p)  (attn-parent-owner rte reply-to.msg.rem cur note-arts note-aenvs)
      ::  NOTE SEND payment posts get kind=%send via the explicit marker carried
      ::  on the %remote-message poke (no longer text-prefix based).
      =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.rem) %send %reply)
      =/  rtarget=attention-item:noltbook  [rkind %message stamped-eid `id.stamped ~ author.msg.rem id.stamped]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention note-id.rem our.bowl author.msg.rem par-owner rtarget)
      :_  this(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur stamped)), mentions new-mentions, attention na.ar, seq-counters new-seq, note-activity (put-activity note-activity note-id.rem now.bowl))
      ^-  (list card:agent:gall)
      :*  [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          (activity-fact note-id.rem now.bowl)
          (weld mention-cards ac.ar)
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
        (attn-mention-cards %cover id.msg.rem meid author.msg.rem)
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
      ::  reply attention: cover text reply → notify the immediate parent owner if us
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a %cover)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) %cover) *(map @ta artifact-envelope:noltbook)))
      =/  env-rte=(unit @uv)  ?~(meta.env ~ reply-to-eid.u.meta.env)
      =/  par-owner=(unit @p)  (attn-parent-owner env-rte reply-to.env cur note-arts note-aenvs)
      =/  rtarget=attention-item:noltbook  [%reply %message env-eid `msg-id.env ~ author.env timestamp.env]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention %cover our.bowl author.env par-owner rtarget)
      :_  this(gossip-envelopes (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops), attention na.ar)
      ::  emit the envelope on global /notes too (like user-gossip) so a CLOSED
      ::  cover still triggers fetchGossipContent → %cover-msg-content → preview.
      ::  No activity-fact / sidebar-signal: cover must not get a green/red dot;
      ::  the preview is set frontend-side from the fetched message.
      :*  [%give %fact ~[/notes/cover] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          (weld relay ac.ar)
      ==
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
        (attn-mention-cards %cover id.msg meid author.msg)
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
      =/  head-cards=(list card:agent:gall)
        :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
            ::  also emit the envelope on global /notes so a closed gossip note
            ::  triggers fetchGossipContent → %cover-msg-content → preview.
            [%give %fact ~[/notes] %noltbook-update !>(upd)]
            (activity-fact nid now.bowl)
            (sidebar-signal nid author.env ~ %gossip now.bowl)
        ==
      ::  reply attention: user-gossip text reply → notify the parent owner if us
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
      =/  env-rte=(unit @uv)  ?~(meta.env ~ reply-to-eid.u.meta.env)
      =/  par-owner=(unit @p)  (attn-parent-owner env-rte reply-to.env cur note-arts note-aenvs)
      =/  rtarget=attention-item:noltbook  [%reply %message env-eid `msg-id.env ~ author.env timestamp.env]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention nid our.bowl author.env par-owner rtarget)
      :_  this(gossip-envelopes (~(put by gossip-envelopes) nid (cap-envs (~(put by nenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops), attention na.ar, note-activity (put-activity note-activity nid now.bowl))
      (weld (weld head-cards relay) ac.ar)
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
        (attn-mention-cards nid id.msg meid author.msg)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) nid) ~)
        (~(put by mentions) nid (snoc cur-m [id.msg meid author.msg]))
      ::  do NOT persist full message — ephemeral forward only
      =/  upd=update:noltbook  [%cover-msg-content nid msg]
      ::  sidebar signal + preview persistence for user gossip notes only
      ::  (this path also serves %cover content fetches — never signal cover).
      =/  note-u  (~(get by notes) nid)
      =/  is-user-gossip=?  &(?=(^ note-u) =(%gossip type.u.note-u))
      =/  new-notes2=(map @ta note:noltbook)
        ?.  ?=(^ note-u)  notes
        ?.  =(%gossip type.u.note-u)  notes
        (~(put by notes) nid u.note-u(last-author `author.msg, last-preview `text.msg))
      =/  sig-cards=(list card)
        ?.  is-user-gossip  ~
        ~[(sidebar-signal nid author.msg `text.msg %gossip now.bowl)]
      :_  this(gossip-envelopes new-envs, mentions new-mentions, notes new-notes2)
      :(weld ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]] mention-cards sig-cards)
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
        %remote-profile-request
      ::  Phase 3: a peer is asking us for our profile. Silently drop if they
      ::  are blocked — they get an unreachable timeout on their end.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  resp=remote:noltbook  [%remote-profile-response req-id.rem prof]
      :_  this
      ~[[%pass /profile-resp/(scot %p src.bowl)/(scot %ud req-id.rem) %agent [src.bowl %noltbook] %poke %noltbook-remote !>(resp)]]
    ::
        %remote-profile-response
      ::  Phase 3: peer replied to our lookup. Hydrate profile, then emit a
      ::  %profile-lookup-result %ok so the sidebar can open the modal.
      =/  pupd=update:noltbook  [%profile-updated src.bowl profile.rem]
      =/  rupd=update:noltbook  [%profile-lookup-result req-id.rem src.bowl %ok]
      :_  this(profiles (~(put by profiles) src.bowl profile.rem))
      :~  [%give %fact ~[/notes] %noltbook-update !>(pupd)]
          [%give %fact ~[/notes] %noltbook-update !>(rupd)]
      ==
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
        %remote-note-state-request
      ::  requester asked for an authoritative snapshot of the group tree
      ::  containing this id. We resolve the topmost same-host group root,
      ::  verify the requester still belongs to it, and reply.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  start  (~(get by notes) note-id.rem)
      ?~  start
        :_  this
        ~[[%pass /state-deny/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-state-denied note-id.rem])]]
      ?.  =(our.bowl creator.u.start)
        :_  this
        ~[[%pass /state-deny/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-state-denied note-id.rem])]]
      ?.  =(%group type.u.start)
        :_  this
        ~[[%pass /state-deny/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-state-denied note-id.rem])]]
      ::  walk parents up while parent exists, we host it, and it's %group
      =/  root-id=@ta
        =/  cur=note:noltbook  u.start
        |-  ^-  @ta
        ?~  parent.cur  id.cur
        =/  par  (~(get by notes) u.parent.cur)
        ?~  par  id.cur
        ?.  =(our.bowl creator.u.par)  id.cur
        ?.  =(%group type.u.par)  id.cur
        $(cur u.par)
      =/  root-note  (~(get by notes) root-id)
      ?~  root-note  `this
      ?.  ?&  (~(has in users.u.root-note) src.bowl)
              !(~(has in removed.u.root-note) src.bowl)
          ==
        :_  this
        ~[[%pass /state-deny/(scot %p src.bowl)/[note-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-note-state-denied note-id.rem])]]
      =/  desc-ids=(list @ta)  (collect-group-descendants root-id notes)
      =/  all-ids=(list @ta)  [root-id desc-ids]
      =/  snap-notes=(list note:noltbook)
        %+  murn  all-ids
        |=  nid=@ta
        ^-  (unit note:noltbook)
        =/  n  (~(get by notes) nid)
        ?~  n  ~
        `u.n
      =/  snap-revs=(list [@ta @ud])
        %+  turn  all-ids
        |=  nid=@ta
        [nid (member-rev-of nid member-revs)]
      =/  resp=remote:noltbook
        [%remote-note-state root-id snap-notes snap-revs]
      :_  this
      ~[[%pass /state-out/(scot %p src.bowl)/[root-id] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(resp)]]
    ::
        %remote-note-state
      ::  host replied with an authoritative snapshot. Validate strictly,
      ::  then conservatively merge metadata. Do not touch messages,
      ::  artifacts, mentions, calls, envelopes. Emit a single dedicated
      ::  %note-state-refreshed update — never %note-created — so the FE
      ::  doesn't fire spurious notifications for repaired notes.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ?~  notes.rem  `this
      =/  root=note:noltbook  i.notes.rem
      ?.  =(id.root root-id.rem)  `this
      ?.  =(src.bowl creator.root)  `this
      ?.  =(%group type.root)  `this
      ?.  ?&  (~(has in users.root) our.bowl)
              !(~(has in removed.root) our.bowl)
          ==
        `this
      ::  every payload note must be hosted by src.bowl and be %group;
      ::  parent must be in payload or already-local with src.bowl.
      =/  payload-ids=(set @ta)
        %-  ~(gas in *(set @ta))
        (turn notes.rem |=(n=note:noltbook id.n))
      =/  desc-valid=?
        =/  todo=(list note:noltbook)  notes.rem
        |-  ^-  ?
        ?~  todo  %.y
        ?.  =(src.bowl creator.i.todo)  %.n
        ?.  =(%group type.i.todo)  %.n
        ?:  =(id.i.todo root-id.rem)  $(todo t.todo)
        ?~  parent.i.todo  %.n
        =/  in-payload=?  (~(has in payload-ids) u.parent.i.todo)
        =/  local-par  (~(get by notes) u.parent.i.todo)
        =/  local-ok=?
          ?~  local-par  %.n
          =(src.bowl creator.u.local-par)
        ?.  ?|(in-payload local-ok)  %.n
        $(todo t.todo)
      ?.  desc-valid  `this
      ::  pre-index revs by id for fast lookup during merge.
      =/  revs-map=(map @ta @ud)
        %-  ~(gas by *(map @ta @ud))
        revs.rem
      ::  merge fold: thread notes-map + messages-map + new-subs list.
      =/  merged
        =/  todo=(list note:noltbook)  notes.rem
        =/  nm=(map @ta note:noltbook)  notes
        =/  mm=(map @ta (list message:noltbook))  messages
        =/  new-subs=(list @ta)  ~
        |-
        ^-  [(map @ta note:noltbook) (map @ta (list message:noltbook)) (list @ta)]
        ?~  todo  [nm mm (flop new-subs)]
        =/  inc=note:noltbook  i.todo
        =/  loc  (~(get by nm) id.inc)
        ?~  loc
          =/  nm2=(map @ta note:noltbook)  (~(put by nm) id.inc inc)
          =/  mm2=(map @ta (list message:noltbook))
            ?:  (~(has by mm) id.inc)  mm
            (~(put by mm) id.inc ~)
          $(todo t.todo, nm nm2, mm mm2, new-subs [id.inc new-subs])
        ::  present: rev-gated user/removed merge; always repair tree.
        =/  inc-rev=@ud  (fall (~(get by revs-map) id.inc) 0)
        =/  loc-rev=@ud  (member-rev-of id.inc member-revs)
        =/  accept-users=?  (gte inc-rev loc-rev)
        =/  new-users=(set @p)
          ?:  accept-users  users.inc
          users.u.loc
        =/  new-removed=(set @p)
          ?:  accept-users  removed.inc
          removed.u.loc
        =/  old-parent  parent.u.loc
        =/  new-parent  parent.inc
        =/  nm-detached=(map @ta note:noltbook)
          ?:  =(old-parent new-parent)  nm
          ?~  old-parent  nm
          ?:  =(`u.old-parent new-parent)  nm
          =/  op  (~(get by nm) u.old-parent)
          ?~  op  nm
          ?.  =(src.bowl creator.u.op)  nm
          (~(put by nm) u.old-parent u.op(children (skim children.u.op |=(c=@ta !=(c id.inc)))))
        =/  new-children=(list @ta)
          %-  flop
          %+  roll  children.inc
          |=  [c=@ta acc=(list @ta)]
          ?:  (lien acc |=(x=@ta =(x c)))  acc
          [c acc]
        =/  repaired=note:noltbook
          %=  u.loc
            parent       new-parent
            children     new-children
            users        new-users
            removed      new-removed
            type         type.inc
            visibility   visibility.inc
            writable     writable.inc
            name         name.inc
            icon-url     icon-url.inc
            headline     headline.inc
          ==
        =/  nm3=(map @ta note:noltbook)  (~(put by nm-detached) id.inc repaired)
        =/  mm3=(map @ta (list message:noltbook))
          ?:  (~(has by mm) id.inc)  mm
          (~(put by mm) id.inc ~)
        $(todo t.todo, nm nm3, mm mm3)
      ::  update member-revs, max(local, incoming) per payload id. Seed
      ::  the accumulator with the full existing member-revs map so a
      ::  refresh for one subtree doesn't erase revs for unrelated notes.
      =/  new-revs=(map @ta @ud)
        =/  ids=(list @ta)  ~(tap in payload-ids)
        =/  acc=(map @ta @ud)  member-revs
        |-
        ^-  (map @ta @ud)
        ?~  ids  acc
        =/  nid=@ta  i.ids
        =/  inc-rev=@ud  (fall (~(get by revs-map) nid) 0)
        =/  cur-rev=@ud  (member-rev-of nid acc)
        =/  next-acc=(map @ta @ud)
          ?:  (gth inc-rev cur-rev)  (~(put by acc) nid inc-rev)
          acc
        $(ids t.ids, acc next-acc)
      =/  merged-notes=(map @ta note:noltbook)  -.merged
      =/  merged-msgs=(map @ta (list message:noltbook))  +<.merged
      =/  merged-subs=(list @ta)  +>.merged
      =/  sub-cards=(list card)
        %+  turn  merged-subs
        |=  nid=@ta
        ^-  card
        [%pass /remote-note/[nid] %agent [src.bowl %noltbook] %watch /notes/[nid]]
      =/  refreshed=update:noltbook
        [%note-state-refreshed root-id.rem notes.rem revs.rem]
      =/  fact-card=card
        [%give %fact ~[/notes] %noltbook-update !>(refreshed)]
      ::  recency: only freshly-installed shared notes (merged-subs) count;
      ::  a refresh of already-local notes does not bump ordering.
      =/  na2=(map @ta @da)
        =/  subs=(list @ta)  merged-subs
        =/  acc=(map @ta @da)  note-activity
        |-  ^-  (map @ta @da)
        ?~  subs  acc
        $(subs t.subs, acc (put-activity acc i.subs now.bowl))
      =/  act-cards=(list card)
        %+  turn  merged-subs
        |=(nid=@ta (activity-fact nid now.bowl))
      :_  this(notes merged-notes, messages merged-msgs, member-revs new-revs, note-activity na2)
      :(weld (snoc sub-cards fact-card) act-cards)
    ::
        %remote-note-state-denied
      ::  silent no-op for now; user-facing error deferred.
      `this
    ::
        %remote-hey
      ::  a ship wants to be pals with us
      ::  ignore if blocked
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ::  add to incoming + peers bookkeeping, compute status, notify frontend
      =/  new-incoming=(set @p)  (~(put in pal-incoming) src.bowl)
      =/  new-peers=(set @p)  (~(put in peers) src.bowl)
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
      :_  this(pal-incoming new-incoming, peers new-peers)
      :(weld [prof-card [%give %fact ~[/notes] %noltbook-update !>(upd)] ~] hey-back)
    ::
        %remote-bye
      ::  a ship no longer wants to be pals
      =/  new-incoming=(set @p)  (~(del in pal-incoming) src.bowl)
      =/  still-visible=?
        ?|  (~(has in contacts) src.bowl)
            (~(has in pal-outgoing) src.bowl)
            (~(has in pal-blocked) src.bowl)
        ==
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-outgoing) src.bowl)  %requesting
        %none
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update src.bowl status]
        [%pal-removed src.bowl]
      :_  this(pal-incoming new-incoming)
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
    ::
        %remote-introduce
      ::  no-op: auto peer-introduce removed; variant retained for future
      ::  contact design. Do not auto-add peer / watch cover / send profile.
      `this
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
      ::  host-only child creation: members may no longer ask us to create a
      ::  child in our shared note. Reject all such requests.
      `this
    ::
        %remote-child-note
      ::  receive a child note from the host. Tolerate orphan delivery
      ::  (root invite races behind child poke) by storing the child even
      ::  if its parent is not yet present; root install repairs children.
      ?.  =(parent.note.rem `parent-id.rem)  `this
      ?.  =(creator.note.rem src.bowl)  `this
      ?.  (~(has in users.note.rem) our.bowl)  `this
      ?:  (~(has in removed.note.rem) our.bowl)  `this
      ?.  ?|(=(%group type.note.rem) =(%notebook type.note.rem))  `this
      =/  have-child=?  (~(has by notes) id.note.rem)
      =/  old-par  (~(get by notes) parent-id.rem)
      ?~  old-par
        ::  parent missing — store as orphan, subscribe, emit %note-created
        ?:  have-child  `this
        =/  sub-card=card
          [%pass /remote-note/[id.note.rem] %agent [creator.note.rem %noltbook] %watch /notes/[id.note.rem]]
        =/  upd=update:noltbook  [%note-created note.rem]
        :_  this(notes (~(put by notes) id.note.rem note.rem), messages (~(put by messages) id.note.rem *(list message:noltbook)), note-activity (put-activity note-activity id.note.rem now.bowl))
        :~  sub-card
            [%give %fact ~[/notes] %noltbook-update !>(upd)]
            (activity-fact id.note.rem now.bowl)
        ==
      ::  parent present — host must match parent creator
      ?.  =(src.bowl creator.u.old-par)  `this
      =/  new-children=(list @ta)  (append-child-if-missing id.note.rem children.u.old-par)
      =/  attach-changed=?  !=(new-children children.u.old-par)
      =/  new-par=note:noltbook  u.old-par(children new-children)
      ?:  have-child
        ::  already stored — only ensure parent is attached
        ?.  attach-changed  `this
        :_  this(notes (~(put by notes) parent-id.rem new-par))
        ~
      =/  new-notes=(map @ta note:noltbook)
        (~(put by (~(put by notes) id.note.rem note.rem)) parent-id.rem new-par)
      =/  sub-card=card
        [%pass /remote-note/[id.note.rem] %agent [creator.note.rem %noltbook] %watch /notes/[id.note.rem]]
      =/  upd=update:noltbook  [%note-created note.rem]
      :_  this(notes new-notes, messages (~(put by messages) id.note.rem *(list message:noltbook)), note-activity (put-activity note-activity id.note.rem now.bowl))
      :~  sub-card
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          (activity-fact id.note.rem now.bowl)
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
      =/  admin-cards=(list card)
        ?.  was-admin  ~
        =/  adm-upd=update:noltbook  [%admins-updated note-id.rem ~(tap in (fall (~(get by clean-admins) note-id.rem) ~))]
        [[%give %fact ~[/notes] %noltbook-update !>(adm-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(adm-upd)] ~]
      =/  muted-cards=(list card)
        ?.  was-muted  ~
        =/  mut-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in (fall (~(get by clean-muted) note-id.rem) ~))]
        [[%give %fact ~[/notes] %noltbook-update !>(mut-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(mut-upd)] ~]
      ::  Phase 3: cascade leaver removal to %group descendants. Use clear
      ::  (not remove) — leaver wasn't kicked, they left.
      =/  group-descs=(list @ta)
        ?.  =(%group type.u.old)  ~
        (collect-group-descendants note-id.rem notes)
      =/  notes-after=(map @ta note:noltbook)
        (~(put by notes) note-id.rem new-note)
      =.  notes-after
        ?:  =(~ group-descs)  notes-after
        (clear-ship-from-ids src.bowl group-descs notes-after)
      =/  new-revs=(map @ta @ud)
        (bump-member-revs [note-id.rem group-descs] member-revs)
      =/  users-upd=update:noltbook
        [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in removed.u.old) (member-rev-of note-id.rem new-revs)]
      =/  base-cards=(list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
            [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)]
        ==
      =/  desc-users-cards=(list card)
        ?:  =(~ group-descs)  ~
        (build-users-updated-cards group-descs notes-after new-revs)
      :_  this(notes notes-after, note-admins clean-admins, note-muted clean-muted, member-revs new-revs)
      :(weld base-cards admin-cards muted-cards desc-users-cards)
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
      ::  install canonical if we don't have it (apply DM prefs locally)
      =/  have-canonical=?  (~(has by notes) id.canonical.rem)
      =/  canon-local=note:noltbook  (apply-dm-pref canonical.rem dm-prefs our.bowl)
      =.  notes
        ?:  have-canonical  notes
        (~(put by notes) id.canonical.rem canon-local)
      =.  messages
        ?:  have-canonical  messages
        (~(put by messages) id.canonical.rem ~)
      ::  subscribe to canonical creator for updates (skip if already or cover)
      =/  sub-cards=(list card)
        ?:  have-canonical  ~
        ?:  =(id.canonical.rem %cover)  ~
        ~[[%pass /remote-note/[id.canonical.rem] %agent [creator.canonical.rem %noltbook] %watch /notes/[id.canonical.rem]]]
      =/  redir=update:noltbook  [%note-redirect losing-id.rem id.canonical.rem]
      =/  adopt=update:noltbook  [%note-created canon-local]
      =/  tail-cards=(list card)
        :~  [%give %fact ~[/notes] %noltbook-update !>(adopt)]
            [%give %fact ~[/notes] %noltbook-update !>(redir)]
        ==
      :_  this
      (weld sub-cards tail-cards)
    ::
        %remote-kick
      ::  host removed us from a note. For %group notes we PRESERVE the
      ::  local subtree so the user can keep reading and fork from it; we
      ::  mark our.bowl as removed in each preserved note's users/removed
      ::  set (write-guards block mutation while in removed). For non-group
      ::  notes the legacy delete behavior is retained.
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(src.bowl creator.u.old)  `this
      =/  kick-upd=update:noltbook  [%kick-notification note-id.rem note-name.rem src.bowl]
      ?.  =(%group type.u.old)
        ::  legacy delete path (DMs, gossip, cover, notebook)
        =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
        =/  unsub-card=card
          [%pass /remote-note/[note-id.rem] %agent [src.bowl %noltbook] %leave ~]
        :_  this(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem))
        :~  unsub-card
            [%give %fact ~[/notes] %noltbook-update !>(del-upd)]
            [%give %fact ~[/notes] %noltbook-update !>(kick-upd)]
        ==
      ::  %group preservation: collect subtree (same creator) and for each
      ::  node strip our.bowl from users + add to removed. Unsubscribe from
      ::  each subscription. Emit %note-users-updated so the FE refreshes
      ::  membership rows and the input bar locks via note.removed.
      =/  desc-ids=(list @ta)  (collect-group-descendants note-id.rem notes)
      =/  subtree-ids=(list @ta)  [note-id.rem desc-ids]
      =/  notes-after=(map @ta note:noltbook)
        =/  acc=(map @ta note:noltbook)  notes
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        =/  cur=(unit note:noltbook)  (~(get by acc) i.todo)
        ?~  cur  $(todo t.todo)
        =/  nu=(set @p)  (~(del in users.u.cur) our.bowl)
        =/  nr=(set @p)  (~(put in removed.u.cur) our.bowl)
        $(todo t.todo, acc (~(put by acc) i.todo u.cur(users nu, removed nr)))
      =/  unsub-cards=(list card)
        %+  turn  subtree-ids
        |=  nid=@ta
        ^-  card
        [%pass /remote-note/[nid] %agent [src.bowl %noltbook] %leave ~]
      =/  users-updated-cards=(list card)
        (build-users-updated-cards subtree-ids notes-after member-revs)
      :_  this(notes notes-after)
      ^-  (list card)
      :(weld unsub-cards users-updated-cards ^-((list card) ~[[%give %fact ~[/notes] %noltbook-update !>(kick-upd)]]))
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
      ::  host deleted a note we were in. Phase 5: preserve local subtree as
      ::  a host-deleted archive. Unsubscribe from host paths so we stop
      ::  receiving live updates; mark every preserved id host-deleted so
      ::  the write-guard blocks mutations. Emit %note-host-status per id
      ::  and a single %note-deleted-notification banner for the root.
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `this
      ?.  =(src.bowl creator.u.old)  `this
      =/  descendants=(list @ta)  (collect-all-descendants note-id.rem notes)
      =/  subtree-ids=(list @ta)  [note-id.rem descendants]
      =/  notif-upd=update:noltbook  [%note-deleted-notification note-id.rem note-name.rem]
      =/  unsub-cards=(list card)
        %+  turn  subtree-ids
        |=  nid=@ta
        ^-  card
        [%pass /remote-note/[nid] %agent [src.bowl %noltbook] %leave ~]
      ::  mark each id as %host-deleted (preserving anything already set)
      =/  new-host-status=(map @ta ?(%host-deleted %host-unreachable))
        =/  acc=(map @ta ?(%host-deleted %host-unreachable))  host-status
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(put by acc) i.todo %host-deleted))
      =/  status-cards=(list card)
        (build-host-status-cards subtree-ids `%host-deleted)
      :_  this(host-status new-host-status)
      ^-  (list card)
      :(weld unsub-cards status-cards ^-((list card) ~[[%give %fact ~[/notes] %noltbook-update !>(notif-upd)]]))
    ::
        %remote-fork-invite
      ::  Phase 6.2: metadata-only notification. No notes, descendants, or
      ::  messages stored. Blocked senders dropped silently. Duplicate
      ::  invites no-op. Collision check on root id only — payload-time
      ::  validation happens on %remote-fork-payload after explicit accept.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ?:  (~(has by notes) root-id.rem)  `this
      ?:  (~(has by pending-fork-invites) root-id.rem)  `this
      =/  rec=pending-fork-invite:noltbook
        :*  src.bowl  root-id.rem  source-root-id.rem
            source-name.rem  source-version.rem  fork-origin.rem
            now.bowl  %.n
        ==
      =/  notif=update:noltbook
        [%fork-invite-received root-id.rem source-name.rem source-version.rem forker.rem]
      :_  this(pending-fork-invites (~(put by pending-fork-invites) root-id.rem rec))
      ~[[%give %fact ~[/notes] %noltbook-update !>(notif)]]
    ::
        %remote-fork-fetch
      ::  Phase 6.2: receiver requested the full fork payload. Authorize:
      ::  we must host the fork (root in our notes, creator==our.bowl),
      ::  requester must be in fork-invitees for this root OR already in
      ::  users (re-fetch OK), requester not blocked.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  root  (~(get by notes) root-id.rem)
      =/  invs  (fall (~(get by fork-invitees) root-id.rem) *(set @p))
      =/  authorized=?
        ?~  root  %.n
        ?.  =(our.bowl creator.u.root)  %.n
        ?:  (~(has in invs) src.bowl)  %.y
        (~(has in users.u.root) src.bowl)
      ?.  authorized
        :_  this
        ~[[%pass /fork-deny/(scot %p src.bowl)/[root-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-fork-denied root-id.rem])]]
      ::  build payload from current state
      =/  desc-ids=(list @ta)  (collect-group-descendants root-id.rem notes)
      =/  src-root-id=@ta
        =/  fo  (~(get by fork-of) root-id.rem)
        ?~  fo  root-id.rem
        nid.u.fo
      =/  src-origin=@uv
        ?~  root  *@uv
        (lineage-origin-of u.root fork-origin)
      =/  fork-ver=@ud
        (lineage-version-of root-id.rem fork-version)
      ::  carry our stored parent-version (the source version we forked
      ::  from); fall back to fork-ver-1 for older state.
      =/  parent-ver=@ud
        =/  stored  (~(get by fork-parent-version) root-id.rem)
        ?^  stored  u.stored
        ?:  (gth fork-ver 1)  (sub fork-ver 1)
        0
      =/  desc-pairs=(list [n=note:noltbook source-id=@ta])
        %+  murn  desc-ids
        |=  did=@ta
        ^-  (unit [note:noltbook @ta])
        =/  n  (~(get by notes) did)
        ?~  n  ~
        =/  fo  (~(get by fork-of) did)
        =/  sid=@ta  ?~(fo did nid.u.fo)
        `[u.n sid]
      =/  payload-ids=(list @ta)  [root-id.rem desc-ids]
      =/  fork-art-envs=(list [note-id=@ta envs=(list artifact-envelope:noltbook)])
        %+  murn  payload-ids
        |=  nid=@ta
        ^-  (unit [@ta (list artifact-envelope:noltbook)])
        =/  m  (~(get by artifact-envelopes) nid)
        ?~  m  ~
        =/  envs=(list artifact-envelope:noltbook)  ~(val by u.m)
        ?~  envs  ~
        `[nid envs]
      ?~  root  `this
      =/  pload=remote:noltbook
        :*  %remote-fork-payload
            root-id.rem  src-root-id  u.root  desc-pairs
            src-origin  fork-ver  parent-ver  fork-art-envs
        ==
      :_  this
      ~[[%pass /fork-pay/(scot %p src.bowl)/[root-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(pload)]]
    ::
        %remote-fork-payload
      ::  Phase 6.2: forker delivered the subtree after accept. Validate
      ::  against pending invite, install only if everything checks out.
      ?:  (~(has in pal-blocked) src.bowl)  `this
      =/  inv  (~(get by pending-fork-invites) root-id.rem)
      ?~  inv  `this
      =/  pi  u.inv
      ?.  =(sender.pi src.bowl)  `this
      ?.  =(root-id.pi root-id.rem)  `this
      ?.  =(fork-origin.pi fork-origin.rem)  `this
      ?.  =(id.root-note.rem root-id.rem)  `this
      ?.  =(src.bowl creator.root-note.rem)  `this
      ::  flatten subtree (root first then descendants)
      =/  all-incoming=(list note:noltbook)
        [root-note.rem (turn descendants.rem |=([n=note:noltbook source-id=@ta] n))]
      =/  incoming-ids=(set @ta)
        %-  ~(gas in *(set @ta))
        (turn all-incoming |=(n=note:noltbook id.n))
      ::  re-check id collisions
      =/  collides=?
        =/  todo  all-incoming
        |-  ^-  ?
        ?~  todo  %.n
        ?:  (~(has by notes) id.i.todo)  %.y
        $(todo t.todo)
      ?:  collides
        ::  drop the invite without installing
        =/  cleared=update:noltbook  [%fork-invite-cleared root-id.rem]
        :_  this(pending-fork-invites (~(del by pending-fork-invites) root-id.rem))
        ~[[%give %fact ~[/notes] %noltbook-update !>(cleared)]]
      =/  new-version=@ud  fork-version.rem
      =/  notes-after=(map @ta note:noltbook)
        =/  todo  all-incoming
        |-
        ?~  todo  notes
        $(todo t.todo, notes (~(put by notes) id.i.todo i.todo))
      =/  messages-after=(map @ta (list message:noltbook))
        =/  todo  all-incoming
        |-
        ?~  todo  messages
        ?:  (~(has by messages) id.i.todo)  $(todo t.todo)
        $(todo t.todo, messages (~(put by messages) id.i.todo ~))
      =/  fork-origin-after=(map @ta @uv)
        =/  todo  all-incoming
        |-
        ?~  todo  fork-origin
        $(todo t.todo, fork-origin (~(put by fork-origin) id.i.todo fork-origin.rem))
      =/  fork-version-after=(map @ta @ud)
        =/  todo  all-incoming
        |-
        ?~  todo  fork-version
        $(todo t.todo, fork-version (~(put by fork-version) id.i.todo new-version))
      ::  fork-of: root points at the true source [sender, source-root-id];
      ::  descendants use their carried source-id when available.
      =/  fork-of-after=(map @ta [host=@p nid=@ta])
        =.  fork-of  (~(put by fork-of) root-id.rem [src.bowl source-root-id.rem])
        =/  todo=(list [n=note:noltbook source-id=@ta])  descendants.rem
        |-
        ?~  todo  fork-of
        $(todo t.todo, fork-of (~(put by fork-of) id.n.i.todo [src.bowl source-id.i.todo]))
      ::  every incoming node was forked from parent-version.rem on the
      ::  forker's source — record it for root + descendants.
      =/  fork-parent-version-after=(map @ta @ud)
        =/  todo  all-incoming
        |-
        ?~  todo  fork-parent-version
        $(todo t.todo, fork-parent-version (~(put by fork-parent-version) id.i.todo parent-version.rem))
      ::  install fork artifact envelopes carried by the forker. These are
      ::  metadata references only; bytes stay on the original artifact author.
      =/  artifact-envelopes-after=(map @ta (map @ta artifact-envelope:noltbook))
        =/  todo=(list [note-id=@ta envs=(list artifact-envelope:noltbook)])  artifact-envs.rem
        =/  ae=(map @ta (map @ta artifact-envelope:noltbook))  artifact-envelopes
        |-
        ^-  (map @ta (map @ta artifact-envelope:noltbook))
        ?~  todo  ae
        =/  nid=@ta  note-id.i.todo
        ?.  (~(has in incoming-ids) nid)  $(todo t.todo)
        =/  cur=(map @ta artifact-envelope:noltbook)
          (fall (~(get by ae) nid) *(map @ta artifact-envelope:noltbook))
        =/  merged=(map @ta artifact-envelope:noltbook)
          =/  env-todo=(list artifact-envelope:noltbook)  envs.i.todo
          |-  ^-  (map @ta artifact-envelope:noltbook)
          ?~  env-todo  cur
          =/  e=artifact-envelope:noltbook  i.env-todo
          ?.  =(note-id.e nid)  $(env-todo t.env-todo)
          $(env-todo t.env-todo, cur (~(put by cur) aid.e e))
        =/  ae2=(map @ta (map @ta artifact-envelope:noltbook))
          ?:  =(~ merged)  ae
          (~(put by ae) nid (cap-art-envs merged))
        $(todo t.todo, ae ae2)
      =/  sub-cards=(list card)
        %+  turn  all-incoming
        |=  n=note:noltbook
        ^-  card
        [%pass /remote-note/[id.n] %agent [src.bowl %noltbook] %watch /notes/[id.n]]
      =/  created-cards=(list card)
        %+  turn  all-incoming
        |=  n=note:noltbook
        ^-  card
        [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-created n])]
      =/  all-ids=(list @ta)
        %+  turn  all-incoming
        |=  n=note:noltbook  id.n
      =/  lineage-cards=(list card)
        (build-lineage-set-cards all-ids notes-after fork-origin-after fork-version-after fork-of-after fork-parent-version-after)
      =/  art-env-cards=(list card)
        %+  murn  artifact-envs.rem
        |=  row=[note-id=@ta envs=(list artifact-envelope:noltbook)]
        ^-  (unit card)
        ?.  (~(has in incoming-ids) note-id.row)  ~
        =/  m  (~(get by artifact-envelopes-after) note-id.row)
        ?~  m  ~
        =/  envs=(list artifact-envelope:noltbook)  ~(val by u.m)
        ?~  envs  ~
        `[%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%artifact-envelope-list note-id.row envs])]
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.rem]
      =/  accepted=update:noltbook  [%fork-invite-accepted root-id.rem]
      :_  %=  this
            notes  notes-after
            messages  messages-after
            fork-origin  fork-origin-after
            fork-version  fork-version-after
            fork-of  fork-of-after
            fork-parent-version  fork-parent-version-after
            artifact-envelopes  artifact-envelopes-after
            peers  (~(put in peers) src.bowl)
            pending-fork-invites  (~(del by pending-fork-invites) root-id.rem)
          ==
      ^-  (list card)
      %-  zing
      :~  sub-cards
          created-cards
          lineage-cards
          art-env-cards
          ^-((list card) ~[[%give %fact ~[/notes] %noltbook-update !>(cleared)]])
          ^-((list card) ~[[%give %fact ~[/notes] %noltbook-update !>(accepted)]])
      ==
    ::
        %remote-fork-denied
      ::  Phase 6.2: forker rejected our fetch. Clear the pending invite.
      =/  inv  (~(get by pending-fork-invites) root-id.rem)
      ?~  inv  `this
      ?.  =(sender.u.inv src.bowl)  `this
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.rem]
      :_  this(pending-fork-invites (~(del by pending-fork-invites) root-id.rem))
      ~[[%give %fact ~[/notes] %noltbook-update !>(cleared)]]
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
        =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
        ::  Phase 3: cascade auto-approved joiner to %group descendants
        =/  group-descs=(list @ta)
          ?.  =(%group type.u.old)  ~
          (collect-group-descendants note-id.rem notes)
        =/  notes-after=(map @ta note:noltbook)
          (~(put by notes) note-id.rem new-note)
        =.  notes-after
          ?:  =(~ group-descs)  notes-after
          (add-ship-to-ids src.bowl group-descs notes-after)
        =/  new-revs=(map @ta @ud)
          (bump-member-revs [note-id.rem group-descs] member-revs)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of note-id.rem new-revs)]
        =/  desc-users-cards=(list card)
          ?:  =(~ group-descs)  ~
          (build-users-updated-cards group-descs notes-after new-revs)
        =/  desc-child-pokes=(list card)
          ?:  =(~ group-descs)  ~
          (build-remote-child-notes-to-ship src.bowl group-descs notes-after)
        ::  auto-mute joiner if note is read-only
        =/  ro-muted=(set @p)
          ?.  !writable.u.old  (fall (~(get by note-muted) nid) ~)
          (~(put in (fall (~(get by note-muted) nid) ~)) src.bowl)
        =/  ro-mute-cards=(list card)
          ?.  !writable.u.old  ~
          =/  mute-upd=update:noltbook  [%muted-updated nid ~(tap in ro-muted)]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[/notes/[nid]] %noltbook-update !>(mute-upd)]]
        :_  this(notes notes-after, peers new-peers, note-muted (~(put by note-muted) nid ro-muted), member-revs new-revs)
        :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)] ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
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
        =/  msg-upd=update:noltbook  [%new-message sys-msg ~]
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
        ::  Phase 3: cascade removal to %group descendants
        =/  group-descs=(list @ta)
          ?.  =(%group type.u.old)  ~
          (collect-group-descendants note-id.rem notes)
        =/  notes-after=(map @ta note:noltbook)
          (~(put by notes) note-id.rem upd-note)
        =.  notes-after
          ?:  =(~ group-descs)  notes-after
          (remove-ship-from-ids target.rem group-descs notes-after)
        =/  new-revs=(map @ta @ud)
          (bump-member-revs [note-id.rem group-descs] member-revs)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of note-id.rem new-revs)]
        =/  desc-users-cards=(list card)
          ?:  =(~ group-descs)  ~
          (build-users-updated-cards group-descs notes-after new-revs)
        :_  this(notes notes-after, messages (~(put by messages) note-id.rem new-msgs), note-admins clean-admins, note-muted clean-muted, member-revs new-revs)
        %+  weld
          ^-  (list card)
          :~  kick-card
              [%give %fact ~[/notes] %noltbook-update !>(users-upd)]
              [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)]
              [%give %fact ~[/notes] %noltbook-update !>(msg-upd)]
              [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(msg-upd)]
          ==
        desc-users-cards
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
        ::  Phase 3: cascade approved member to %group descendants
        =/  group-descs=(list @ta)
          ?.  =(%group type.u.old)  ~
          (collect-group-descendants note-id.rem notes)
        =/  notes-after=(map @ta note:noltbook)
          (~(put by notes) note-id.rem new-note)
        =.  notes-after
          ?:  =(~ group-descs)  notes-after
          (add-ship-to-ids target.rem group-descs notes-after)
        =/  new-revs=(map @ta @ud)
          (bump-member-revs [note-id.rem group-descs] member-revs)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of note-id.rem new-revs)]
        =/  desc-users-cards=(list card)
          ?:  =(~ group-descs)  ~
          (build-users-updated-cards group-descs notes-after new-revs)
        =/  desc-child-pokes=(list card)
          ?:  =(~ group-descs)  ~
          (build-remote-child-notes-to-ship target.rem group-descs notes-after)
        :_  this(notes notes-after, peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted), member-revs new-revs)
        :(weld [poke-card [%give %fact ~[/notes] %noltbook-update !>(users-upd)] [%give %fact ~[/notes/[note-id.rem]] %noltbook-update !>(users-upd)] [%give %fact ~[/notes] %noltbook-update !>(jr-upd)] ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
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
        =/  new-revs=(map @ta @ud)  (bump-member-rev note-id.rem member-revs)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in users.u.old) ~(tap in new-removed) (member-rev-of note-id.rem new-revs)]
        =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
          %-  zing
          %+  turn  ~(tap by join-requests)
          |=  [nid=@ta ships=(set @p)]
          =/  n  (~(get by notes) nid)
          ?~  n  ~
          (turn ~(tap in ships) |=(s=@p [nid s name.u.n]))
        =/  jr-upd=update:noltbook  [%join-request-list jr-list]
        :_  this(notes (~(put by notes) note-id.rem upd-note), member-revs new-revs)
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
        =/  pax=path  ~[%notes note-id.rem]
        ::  auto-mute invitee if note is read-only
        =/  ro-muted=(set @p)
          ?.  !writable.u.old  (fall (~(get by note-muted) note-id.rem) ~)
          (~(put in (fall (~(get by note-muted) note-id.rem) ~)) target.rem)
        =/  ro-mute-cards=(list card)
          ?.  !writable.u.old  ~
          =/  mute-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in ro-muted)]
          ~[[%give %fact ~[/notes] %noltbook-update !>(mute-upd)] [%give %fact ~[pax] %noltbook-update !>(mute-upd)]]
        ::  Phase 3: cascade invitee to %group descendants
        =/  group-descs=(list @ta)
          ?.  =(%group type.u.old)  ~
          (collect-group-descendants note-id.rem notes)
        =/  notes-after=(map @ta note:noltbook)
          (~(put by notes) note-id.rem new-note)
        =.  notes-after
          ?:  =(~ group-descs)  notes-after
          (add-ship-to-ids target.rem group-descs notes-after)
        =/  new-revs=(map @ta @ud)
          (bump-member-revs [note-id.rem group-descs] member-revs)
        =/  users-upd=update:noltbook  [%note-users-updated note-id.rem type.u.old ~(tap in new-users) ~(tap in new-removed) (member-rev-of note-id.rem new-revs)]
        =/  desc-users-cards=(list card)
          ?:  =(~ group-descs)  ~
          (build-users-updated-cards group-descs notes-after new-revs)
        =/  desc-child-pokes=(list card)
          ?:  =(~ group-descs)  ~
          (build-remote-child-notes-to-ship target.rem group-descs notes-after)
        :_  this(notes notes-after, peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted), member-revs new-revs)
        :(weld ~[poke-card] ~[[%give %fact ~[/notes] %noltbook-update !>(users-upd)]] ~[[%give %fact ~[pax] %noltbook-update !>(users-upd)]] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
      ==
    ::
        %remote-artifact-fetch
      ::  requester asking us for artifact bytes
      =/  art  (~(get by artifacts) art-id.rem)
      ?~  art
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      =/  nt  (~(get by notes) note-id.u.art)
      ?~  nt
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      ::  block guard
      ?:  (~(has in pal-blocked) src.bowl)
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      ::  per-type permission
      ::  cover: NO direct-pal check; envelope mesh reaches further
      ::  gossip note: explicit membership (in users, not removed)
      ::  others: existing notebook/group/dm membership
      ?:  ?&  !?=(%cover type.u.nt)
              ?|  !(~(has in users.u.nt) src.bowl)
                  (~(has in removed.u.nt) src.bowl)
              ==
          ==
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      ::  scry bytes from our clay
      =/  art-clay=path
        :*  (scot %p our.bowl)
            q.byk.bowl
            (scot %da now.bowl)
            /lib/noltbook/artifacts/[art-id.rem]/mime
        ==
      =/  scry-res  (mule |.(.^(mime %cx art-clay)))
      ?:  ?=(%| -.scry-res)
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      =/  mim=mime  p.scry-res
      ::  if requester sent expected-hash, validate before serving.
      ::  q.mim is octs [p=@ud q=@]; hash content == hash of byte atom (q.q.mim)
      ?:  ?&  ?=(^ expected-hash.rem)
              !=(u.expected-hash.rem (sham q.q.mim))
          ==
        :_  this
        ~[[%pass /art-deny/(scot %p src.bowl)/[art-id.rem] %agent [src.bowl %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]]
      =/  mtype=@t  (rap 3 (join '/' p.mim))
      :_  this
      :~  :*  %pass
              /art-content/(scot %p src.bowl)/[art-id.rem]
              %agent  [src.bowl %noltbook]
              %poke   %noltbook-remote
              !>(`remote:noltbook`[%remote-artifact-content art-id.rem eyre-id.rem mtype q.mim])
          ==
      ==
    ::
        %remote-artifact-content
      ::  byte host replied with bytes; complete pending HTTP for this response
      ::  only. Do NOT persist bytes locally — member ships hold metadata only.
      =/  art  (~(get by artifacts) art-id.rem)
      ?^  art
        ::  artifact-map path: only creator may serve us bytes
        ?.  =(src.bowl creator.u.art)  `this
        =/  hdrs=(list [@t @t])
          :~  ['content-type' mime.rem]
              ['cache-control' 'no-store']
          ==
        =/  =simple-payload:http  [[200 hdrs] `bytes.rem]
        :_  this
        (give-simple-payload:app:server eyre-id.rem simple-payload)
      ::  envelope path: require known envelope + matching author. Hash
      ::  check is strict when envelope carries a non-zero hash, but
      ::  *@uv (unknown — e.g. fork-copied envelopes) bypasses it.
      =/  env  (find-aid-in-envelopes art-id.rem artifact-envelopes)
      ?~  env  `this
      ?.  =(src.bowl author.u.env)  `this
      ?.  ?|  =(content-hash.u.env *@uv)
              =(content-hash.u.env (sham q.bytes.rem))
          ==
        :_  this
        %+  give-simple-payload:app:server  eyre-id.rem
        [[404 ~] ~]
      =/  hdrs=(list [@t @t])
        :~  ['content-type' mime.rem]
            ['cache-control' 'no-store']
        ==
      =/  =simple-payload:http  [[200 hdrs] `bytes.rem]
      :_  this
      (give-simple-payload:app:server eyre-id.rem simple-payload)
    ::
        %remote-artifact-denied
      ::  byte host refused (not member, missing, removed); reply 404 to http
      =/  art  (~(get by artifacts) art-id.rem)
      ?^  art
        ?.  =(src.bowl creator.u.art)  `this
        :_  this
        %+  give-simple-payload:app:server  eyre-id.rem
        [[404 ~] ~]
      =/  env  (find-aid-in-envelopes art-id.rem artifact-envelopes)
      ?~  env  `this
      ?.  =(src.bowl author.u.env)  `this
      :_  this
      %+  give-simple-payload:app:server  eyre-id.rem
      [[404 ~] ~]
    ::
        %remote-artifact-create
      ::  member registering metadata for an artifact whose bytes live on member
      =/  art  artifact.rem
      =/  nid=@ta  note-id.art
      =/  nt  (~(get by notes) nid)
      ?~  nt  `this
      ::  must be host of this note
      ?.  =(our.bowl creator.u.nt)  `this
      ::  only normal/group notes accept artifact metadata
      ?.  ?|(?=(%notebook type.u.nt) ?=(%group type.u.nt))  `this
      ::  sender must be current member, not removed
      ?.  (~(has in users.u.nt) src.bowl)  `this
      ?:  (~(has in removed.u.nt) src.bowl)  `this
      ::  artifact creator must equal sender
      ?.  =(src.bowl creator.art)  `this
      ::  only %file artifacts in this phase
      ?.  ?=(%file type.art)  `this
      ::  versions: phase-2 uploads emit exactly one version
      ?.  ?=([^ ~] versions.art)  `this
      =/  ver  i.versions.art
      ::  content must be clay-backed metadata; reject inline base64 payloads
      =/  ctnt=tape  (trip content.ver)
      ?~  (find (trip '"storage":"clay"') ctnt)  `this
      ?^  (find (trip 'dataUrl') ctnt)  `this
      ?^  (find (trip 'mimeType') ctnt)  `this
      ::  read-only: only host/admin can post; host already self
      =/  admins  (fall (~(get by note-admins) nid) ~)
      =/  is-admin=?  (~(has in admins) src.bowl)
      ?:  ?&  !writable.u.nt
              !is-admin
          ==
        `this
      ::  mute: muted members cannot post
      =/  muted  (fall (~(get by note-muted) nid) ~)
      ?:  ?&  (~(has in muted) src.bowl)
              !is-admin
          ==
        `this
      ::  reject id collision (don't overwrite local artifact)
      ?:  (~(has by artifacts) id.art)  `this
      ::  store ref + broadcast group history; bytes stay on src.bowl
      =/  upd=update:noltbook  [%artifact-created art]
      =/  pax=path  ~[%notes nid]
      =/  prev=@t  (artifact-preview art)
      =/  upd-note=note:noltbook  u.nt(last-author `creator.art, last-preview `prev)
      ::  reply attention: artifact reply → notify the immediate parent owner if us
      =/  art-eid=(unit @uv)  ?~(meta.art ~ `eid.u.meta.art)
      =/  art-rte=(unit @uv)  ?~(meta.art ~ reply-to-eid.u.meta.art)
      =/  art-when=@da  timestamp.i.versions.art
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
      =/  par-owner=(unit @p)  (attn-parent-owner art-rte ~ cur-msgs note-arts note-aenvs)
      =/  rtarget=attention-item:noltbook  [%reply %artifact art-eid ~ `id.art creator.art art-when]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention nid our.bowl creator.art par-owner rtarget)
      :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) id.art art), attention na.ar, note-activity (put-activity note-activity nid now.bowl))
      ^-  (list card:agent:gall)
      :*  [%give %fact ~[pax] %noltbook-update !>(upd)]
          (activity-fact nid now.bowl)
          (sidebar-signal nid creator.art `prev %artifact now.bowl)
          ac.ar
      ==
    ::
        %remote-dm-artifact
      ::  counterparty shipped a DM artifact (metadata + bytes). Store both.
      =/  art  artifact.rem
      =/  nid=@ta  note-id.art
      =/  nt  (~(get by notes) nid)
      ?~  nt  `this
      ?.  ?=(%dm type.u.nt)  `this
      ::  both parties must be current, non-removed members
      ?.  (~(has in users.u.nt) src.bowl)  `this
      ?.  (~(has in users.u.nt) our.bowl)  `this
      ?:  (~(has in removed.u.nt) src.bowl)  `this
      ?:  (~(has in removed.u.nt) our.bowl)  `this
      ::  artifact must originate from sender
      ?.  =(src.bowl creator.art)  `this
      ?.  ?=(%file type.art)  `this
      ::  versions: exactly one
      ?.  ?=([^ ~] versions.art)  `this
      =/  ver  i.versions.art
      =/  ctnt=tape  (trip content.ver)
      ?~  (find (trip '"storage":"clay"') ctnt)  `this
      ?^  (find (trip 'dataUrl') ctnt)  `this
      ?^  (find (trip 'mimeType') ctnt)  `this
      ::  reject id collision
      ?:  (~(has by artifacts) id.art)  `this
      ::  write bytes to our Clay at the deterministic path
      =/  mpath=(list @ta)  (parse-mime-path mime.rem)
      =/  art-cage=cage  [%mime !>(`mime`[mpath bytes.rem])]
      =/  nori  [%& ~[[/lib/noltbook/artifacts/[id.art]/mime [%ins art-cage]]]]
      =/  clay-card=card  [%pass /art-dm-in/[id.art] %arvo %c %info q.byk.bowl nori]
      =/  upd=update:noltbook  [%artifact-created art]
      =/  pax=path  ~[%notes nid]
      =/  prev=@t  (artifact-preview art)
      =/  upd-note=note:noltbook  u.nt(last-author `creator.art, last-preview `prev)
      ::  reply attention: DM artifact reply → notify the immediate parent owner if us
      =/  art-eid=(unit @uv)  ?~(meta.art ~ `eid.u.meta.art)
      =/  art-rte=(unit @uv)  ?~(meta.art ~ reply-to-eid.u.meta.art)
      =/  art-when=@da  timestamp.i.versions.art
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
      =/  par-owner=(unit @p)  (attn-parent-owner art-rte ~ cur-msgs note-arts note-aenvs)
      =/  rtarget=attention-item:noltbook  [%reply %artifact art-eid ~ `id.art creator.art art-when]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention nid our.bowl creator.art par-owner rtarget)
      :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) id.art art), attention na.ar, note-activity (put-activity note-activity nid now.bowl))
      :*  clay-card
          [%give %fact ~[pax] %noltbook-update !>(upd)]
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          (activity-fact nid now.bowl)
          (sidebar-signal nid creator.art `prev %artifact now.bowl)
          ac.ar
      ==
    ::
        %remote-artifact-envelope-ref
      ::  cover/gossip artifact envelope from a peer; never carries bytes
      =/  nid=@ta  note-id.rem
      =/  nt  (~(get by notes) nid)
      ?~  nt  `this
      ?.  ?|(?=(%cover type.u.nt) ?=(%gossip type.u.nt))  `this
      ::  blocked sender or blocked author is rejected
      ?:  (~(has in pal-blocked) src.bowl)  `this
      ?:  (~(has in pal-blocked) author.env.rem)  `this
      ::  gossip notes: src must be in users, not removed
      ?:  ?&  ?=(%gossip type.u.nt)
              ?|  !(~(has in users.u.nt) src.bowl)
                  (~(has in removed.u.nt) src.bowl)
              ==
          ==
        `this
      =/  envs=(map @ta artifact-envelope:noltbook)
        (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
      ::  dedup by aid; skip if we already have it as a full artifact (own)
      ?:  (~(has by envs) aid.env.rem)  `this
      ?:  (~(has by artifacts) aid.env.rem)  `this
      =/  my-hops=@ud  (add hops.rem 1)
      =/  recipients=(list @p)
        ?:  ?=(%cover type.u.nt)
          ~(tap in pal-outgoing)
        ~(tap in users.u.nt)
      =/  relay=(list card)
        %+  murn  recipients
        |=  p=@p
        ?:  =(p our.bowl)  ~
        ?:  =(p src.bowl)  ~
        ?:  =(p author.env.rem)  ~
        `[%pass /art-env-out/(scot %p p)/[aid.env.rem] %agent [p %noltbook] %poke %noltbook-remote !>(`remote:noltbook`[%remote-artifact-envelope-ref nid env.rem my-hops])]
      =/  upd=update:noltbook  [%artifact-envelope nid env.rem my-hops]
      =/  pax=path  ~[%notes nid]
      ::  cover is pinned; only user gossip notes get recency/signal/preview.
      ::  put-activity already skips cover; suppress fact + signal for cover too.
      =/  is-user-gossip=?  ?=(%gossip type.u.nt)
      =/  prev=@t  (art-env-preview env.rem)
      =/  act-cards=(list card)
        ?:  is-user-gossip  ~[(activity-fact nid now.bowl)]
        ~
      ::  signal for user gossip (dots+preview) and cover (preview only; the
      ::  frontend never dots cover). Recency/note-preview-persist stay gossip-only.
      =/  sig-cards=(list card)
        ?:  is-user-gossip  ~[(sidebar-signal nid author.env.rem `prev %artifact now.bowl)]
        ?:  =(nid %cover)  ~[(sidebar-signal nid author.env.rem `prev %artifact now.bowl)]
        ~
      =/  new-notes=(map @ta note:noltbook)
        ?.  is-user-gossip  notes
        (~(put by notes) nid u.nt(last-author `author.env.rem, last-preview `prev))
      ::  reply attention: cover/gossip artifact-envelope reply → parent owner if us
      =/  env-eid=(unit @uv)  ?~(meta.env.rem ~ `eid.u.meta.env.rem)
      =/  env-rte=(unit @uv)  ?~(meta.env.rem ~ reply-to-eid.u.meta.env.rem)
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
      =/  par-owner=(unit @p)  (attn-parent-owner env-rte ~ cur-msgs note-arts ~(val by envs))
      =/  rtarget=attention-item:noltbook  [%reply %artifact-envelope env-eid ~ `aid.env.rem author.env.rem timestamp.env.rem]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention nid our.bowl author.env.rem par-owner rtarget)
      :_  this(notes new-notes, artifact-envelopes (~(put by artifact-envelopes) nid (cap-art-envs (~(put by envs) aid.env.rem env.rem))), attention na.ar, note-activity (put-activity note-activity nid now.bowl))
      :(weld ~[[%give %fact ~[pax] %noltbook-update !>(upd)]] relay act-cards sig-cards ac.ar)
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
      ?:  =(%dm type.u.old)
        :_  this(notes (~(put by notes) nid rev))
        ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
      :_  this(notes (~(put by notes) nid rev))
      :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
      ==
    `this
  ::  Behn timer for host-reachability probe. Only fires unreachable if the
  ::  stored deadline token still matches; stale wakes from prior probes
  ::  (or wakes after a successful watch-ack) are dropped.
  ?:  ?=([%host-check @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  nid=@ta  i.t.wire
    =/  ded=@da  (slav %da i.t.t.wire)
    =/  stored  (~(get by host-checks) nid)
    ?~  stored  `this
    ?.  =(u.stored ded)  `this
    =.  host-checks  (~(del by host-checks) nid)
    ::  do not overwrite host-deleted
    ?:  (is-host-deleted nid host-status)  `this
    ::  no-op if already marked unreachable
    ?:  =(`%host-unreachable (~(get by host-status) nid))  `this
    =.  host-status  (~(put by host-status) nid %host-unreachable)
    =/  upd=update:noltbook  [%note-host-status nid `%host-unreachable]
    :_  this
    :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
        [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
    ==
  (on-arvo:def wire sign-arvo)
::
++  on-leave   on-leave:def
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+  wire  (on-agent:def wire sign)
  ::
      [%host-probe @ @ ~]
    ::  ephemeral host-reachability probe. Watch-ack flips host-status
    ::  and clears the pending check; %leave to immediately tear down the
    ::  probe subscription regardless of outcome. Any incoming fact is
    ::  ignored (the persistent /remote-note/[id] subscription is the
    ::  source of truth for data delivery).
    =/  nid=@ta  i.t.wire
    =/  ded=@da  (slav %da i.t.t.wire)
    =/  leave-card=card
      [%pass wire %agent [src.bowl %noltbook] %leave ~]
    ?+  -.sign  `this
        %watch-ack
      =/  stored  (~(get by host-checks) nid)
      =/  match=?  ?~(stored %.n =(u.stored ded))
      ?~  p.sign
        ::  reachable
        =?  host-checks  match  (~(del by host-checks) nid)
        ?:  =(`%host-unreachable (~(get by host-status) nid))
          =.  host-status  (~(del by host-status) nid)
          =/  upd=update:noltbook  [%note-host-status nid ~]
          :_  this
          :~  leave-card
              [%give %fact ~[/notes] %noltbook-update !>(upd)]
              [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
          ==
        :_  this  ~[leave-card]
      ::  watch failed
      ~&  [%host-probe-failed nid u.p.sign]
      =?  host-checks  match  (~(del by host-checks) nid)
      ?:  (is-host-deleted nid host-status)
        :_  this  ~[leave-card]
      ?:  =(`%host-unreachable (~(get by host-status) nid))
        :_  this  ~[leave-card]
      =.  host-status  (~(put by host-status) nid %host-unreachable)
      =/  upd=update:noltbook  [%note-host-status nid `%host-unreachable]
      :_  this
      :~  leave-card
          [%give %fact ~[/notes] %noltbook-update !>(upd)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
      ==
    ==
  ::
      [%remote-note @ ~]
    ::  facts from a note we're subscribed to on a remote creator
    =/  nid=@ta  i.t.wire
    ?+  -.sign  (on-agent:def wire sign)
        %fact
      ?.  =(%noltbook-update p.cage.sign)  `this
      ::  any valid fact on this wire is liveness proof for the host.
      ::  Clear pending probe + %host-unreachable. Leave %host-deleted.
      =/  was-unreach=?  =(`%host-unreachable (~(get by host-status) nid))
      =.  host-checks  (~(del by host-checks) nid)
      =?  host-status  was-unreach  (~(del by host-status) nid)
      =/  cleared-cards=(list card)
        ?.  was-unreach  ~
        =/  hu=update:noltbook  [%note-host-status nid ~]
        :~  [%give %fact ~[/notes] %noltbook-update !>(hu)]
            [%give %fact ~[/notes/[nid]] %noltbook-update !>(hu)]
        ==
      =/  result=(quip card _this)
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
          =.  note-activity  (put-activity note-activity nid now.bowl)
          ::  dot-only signal: text not yet fetched, so preview ~ (no overwrite).
          :_  this
          ^-  (list card:agent:gall)
          :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(gupd)]
              ::  also emit the envelope on global /notes so a closed gossip note
              ::  triggers fetchGossipContent → %cover-msg-content → preview.
              [%give %fact ~[/notes] %noltbook-update !>(gupd)]
              (activity-fact nid now.bowl)
              (sidebar-signal nid author.env ~ %gossip now.bowl)
          ==
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
          ::  text now known: fill preview + sidebar signal (recency untouched).
          =/  prev=@t  text.msg
          =?  notes  ?=(^ note)
            (~(put by notes) nid u.note(last-author `author.msg, last-preview `prev))
          :_  this
          ^-  (list card:agent:gall)
          :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
              (sidebar-signal nid author.msg `prev %gossip now.bowl)
          ==
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
          =/  prev=@t  text.msg
          =?  notes  ?=(^ note)
            (~(put by notes) nid u.note(last-author `author.msg, last-preview `prev))
          ?:  =(author.msg our.bowl)
            ::  own gossip message → advance read too (not self-unread).
            =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
            =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
            =.  note-activity  (put-activity note-activity nid now.bowl)
            =.  note-read  (put-read note-read nid now.bowl)
            :_  this
            ^-  (list card:agent:gall)
            :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
                (activity-fact nid now.bowl)
                (note-read-fact nid now.bowl)
                (sidebar-signal nid author.msg `prev %gossip now.bowl)
            ==
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
          =.  note-activity  (put-activity note-activity nid now.bowl)
          :_  this
          ^-  (list card:agent:gall)
          :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
              [%give %fact ~[/notes] %noltbook-update !>(content-upd)]
              (activity-fact nid now.bowl)
              (sidebar-signal nid author.msg `prev %gossip now.bowl)
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
          =/  prev=@t  text.msg
          =?  notes  ?=(^ note)
            (~(put by notes) nid u.note(last-author `author.msg, last-preview `prev))
          ?:  =(author.msg our.bowl)
            ::  own gossip message → advance read too (not self-unread).
            =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
            =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
            =.  note-activity  (put-activity note-activity nid now.bowl)
            =.  note-read  (put-read note-read nid now.bowl)
            :_  this
            ^-  (list card:agent:gall)
            :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
                (activity-fact nid now.bowl)
                (note-read-fact nid now.bowl)
                (sidebar-signal nid author.msg `prev %gossip now.bowl)
            ==
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
          =.  note-activity  (put-activity note-activity nid now.bowl)
          :_  this
          ^-  (list card:agent:gall)
          :~  [%give %fact ~[pax] %noltbook-update !>(eupd)]
              [%give %fact ~[/notes] %noltbook-update !>(content-upd)]
              (activity-fact nid now.bowl)
              (sidebar-signal nid author.msg `prev %gossip now.bowl)
          ==
        ::
            %note-users-updated
          ::  drop strictly-stale snapshots; equal-rev still applies.
          ?:  (lth rev.upd (member-rev-of id.upd member-revs))  `this
          =?  notes  ?=(^ note)
            (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
          :_  this(member-revs (~(put by member-revs) id.upd rev.upd))
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
        ::  regular/shared/DM note: persist FULL history (%.n). This branch must
        ::  never gossip-cap; the prior %.y silently truncated non-gossip notes.
        ::  (cap-msgs is a no-op now, but keep the flag correct for clarity.)
        =.  messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.n))
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        ::  recency: a genuinely-new subscribed message bumps this note.
        =.  note-activity  (put-activity note-activity nid now.bowl)
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
          (attn-mention-cards nid id.msg msg-eid author.msg)
        ::  reply attention (member receives the host's broadcast). Target = reply.
        =/  note-arts=(list artifact:noltbook)
          (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
        =/  note-aenvs=(list artifact-envelope:noltbook)
          ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
        =/  rte=(unit @uv)  ?~(meta.msg ~ reply-to-eid.u.meta.msg)
        =/  par-owner=(unit @p)  (attn-parent-owner rte reply-to.msg cur note-arts note-aenvs)
        ::  classify %send via the marker the host preserved on the broadcast;
        ::  otherwise %reply. (Member-origin NOTE SEND: member→host %remote-message
        ::  carried directed-kind, host rebroadcast it on %new-message.)
        =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.upd) %send %reply)
        =/  rtarget=attention-item:noltbook  [rkind %message msg-eid `id.msg ~ author.msg id.msg]
        =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
          (add-reply-attn attention nid our.bowl author.msg par-owner rtarget)
        =.  attention  na.ar
        =/  base-cards=(list card)
          :~  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
              [%give %fact ~[/notes] %noltbook-update !>(upd)]
              (activity-fact nid now.bowl)
          ==
        :_  this
        :(weld base-cards mention-cards ac.ar)
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
        ::  host updated the user set; drop strictly-stale snapshots.
        ?:  (lth rev.upd (member-rev-of id.upd member-revs))  `this
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
        :_  this(member-revs (~(put by member-revs) id.upd rev.upd))
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
      ::
          %artifact-created
        ::  host added an artifact; store locally and relay to frontend
        =.  artifacts  (~(put by artifacts) id.artifact.upd artifact.upd)
        ::  recency: a genuinely-new artifact from the host bumps this note.
        =.  note-activity  (put-activity note-activity nid now.bowl)
        ::  sidebar signal + preview persistence for the closed-note case.
        =/  prev=@t  (artifact-preview artifact.upd)
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `creator.artifact.upd, last-preview `prev))
        ::  reply attention (member receives host's broadcast artifact). Target = reply.
        =/  art2=artifact:noltbook  artifact.upd
        =/  art-eid=(unit @uv)  ?~(meta.art2 ~ `eid.u.meta.art2)
        =/  art-rte=(unit @uv)  ?~(meta.art2 ~ reply-to-eid.u.meta.art2)
        =/  art-when=@da  ?~(versions.art2 now.bowl timestamp.i.versions.art2)
        =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
        =/  note-arts=(list artifact:noltbook)
          (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
        =/  note-aenvs=(list artifact-envelope:noltbook)
          ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
        =/  par-owner=(unit @p)  (attn-parent-owner art-rte ~ cur-msgs note-arts note-aenvs)
        =/  rtarget=attention-item:noltbook  [%reply %artifact art-eid ~ `id.art2 creator.art2 art-when]
        =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
          (add-reply-attn attention nid our.bowl creator.art2 par-owner rtarget)
        =.  attention  na.ar
        :_  this
        ^-  (list card:agent:gall)
        :*  [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
            (activity-fact nid now.bowl)
            (sidebar-signal nid creator.artifact.upd `prev %artifact now.bowl)
            ac.ar
        ==
      ::
          %artifact-updated
        ::  host updated an artifact; store locally and relay to frontend
        =.  artifacts  (~(put by artifacts) id.artifact.upd artifact.upd)
        :_  this
        ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]]
      ::
          %artifact-deleted
        ::  host deleted an artifact; drop locally and relay to frontend
        =.  artifacts  (~(del by artifacts) id.upd)
        :_  this
        ~[[%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]]
      ==
      [(weld cleared-cards -.result) +.result]
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
      ::  use watch-ack as reachability signal too: success clears
      ::  %host-unreachable, failure marks it (unless %host-deleted).
      =/  was-unreach=?  =(`%host-unreachable (~(get by host-status) nid))
      =.  host-checks  (~(del by host-checks) nid)
      ?~  p.sign
        ?.  was-unreach  `this
        =.  host-status  (~(del by host-status) nid)
        =/  hu=update:noltbook  [%note-host-status nid ~]
        :_  this
        :~  [%give %fact ~[/notes] %noltbook-update !>(hu)]
            [%give %fact ~[/notes/[nid]] %noltbook-update !>(hu)]
        ==
      ~&  [%remote-note-watch-failed nid u.p.sign]
      ?:  (is-host-deleted nid host-status)  `this
      ?:  =(`%host-unreachable (~(get by host-status) nid))  `this
      =.  host-status  (~(put by host-status) nid %host-unreachable)
      =/  hu=update:noltbook  [%note-host-status nid `%host-unreachable]
      :_  this
      :~  [%give %fact ~[/notes] %noltbook-update !>(hu)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(hu)]
      ==
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
          (attn-mention-cards %cover id.msg msg-eid author.msg)
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
          (attn-mention-cards %cover id.msg msg-eid author.msg)
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
        ::  also emit on global /notes so a CLOSED cover updates its preview via
        ::  fetchGossipContent → %cover-msg-content. No activity-fact / sidebar-
        ::  signal (cover must not get a green/red dot); the frontend
        ::  !isPinnedUnreadNote guard suppresses any cover notification.
        :~  [%give %fact ~[/notes/cover] %noltbook-update !>(gupd)]
            [%give %fact ~[/notes] %noltbook-update !>(gupd)]
        ==
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
      [%fork-invite @ @ ~]
    ::  ack/nack for outgoing fork-invite pokes
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%fork-invite-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%fork-fetch @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%fork-fetch-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%fork-pay @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%fork-pay-poke-failed wire u.p.sign]
      `this
    ==
  ::
      [%fork-deny @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%msg-fwd @ ~]
    ::  ack/nack for forwarded messages
    =/  nid=@ta  i.t.wire
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign
        ::  successful ack — host is reachable. Clear pending probe and
        ::  any prior %host-unreachable (do not touch %host-deleted).
        =.  host-checks  (~(del by host-checks) nid)
        ?.  =(`%host-unreachable (~(get by host-status) nid))  `this
        =.  host-status  (~(del by host-status) nid)
        =/  hu=update:noltbook  [%note-host-status nid ~]
        :_  this
        :~  [%give %fact ~[/notes] %noltbook-update !>(hu)]
            [%give %fact ~[/notes/[nid]] %noltbook-update !>(hu)]
        ==
      ~&  [%msg-fwd-failed wire u.p.sign]
      ::  remote host rejected/failed our send — treat as host-unreachable
      ::  for that note unless it's already %host-deleted or DM-local.
      =.  host-checks  (~(del by host-checks) nid)
      =/  n  (~(get by notes) nid)
      ?~  n  `this
      ?:  =(%dm type.u.n)  `this
      ?:  =(creator.u.n our.bowl)  `this
      ?:  (is-host-deleted nid host-status)  `this
      ?:  =(`%host-unreachable (~(get by host-status) nid))  `this
      =.  host-status  (~(put by host-status) nid %host-unreachable)
      =/  hu=update:noltbook  [%note-host-status nid `%host-unreachable]
      :_  this
      :~  [%give %fact ~[/notes] %noltbook-update !>(hu)]
          [%give %fact ~[/notes/[nid]] %noltbook-update !>(hu)]
      ==
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
      [%profile-lookup @ @ ~]
    ::  Phase 3: a profile-lookup poke to a remote ship returned. Failure =>
    ::  emit %profile-lookup-result %unreachable so the sidebar row can flip
    ::  to "this user can't be reached". Success = wait for the actual
    ::  %remote-profile-response; do nothing here.
    =/  who=@p   (slav %p i.t.wire)
    =/  rid=@ud  (slav %ud i.t.t.wire)
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%profile-lookup-failed wire u.p.sign]
      =/  upd=update:noltbook  [%profile-lookup-result rid who %unreachable]
      :_  this
      ~[[%give %fact ~[/notes] %noltbook-update !>(upd)]]
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
