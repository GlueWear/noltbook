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
      state-43
      state-44
      state-45
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
::  pre-via envelope shape (state-22..44) — frozen so old gossip-envelopes load.
::  state-45 adds via=(unit via-app) to the live envelope:noltbook.
+$  envelope-44
  $:  author=@p
      msg-id=@da
      timestamp=@da
      reply-to=(unit @da)
      content-hash=@uv
      meta=(unit entry-meta:noltbook)
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
::  state-44: durable per-eid app attribution ("posted via app X"). via-by-eid is
::  keyed by a message/artifact's meta.eid; only the field is added vs state-43.
::  state-45: gossip/cover envelopes carry app attribution (via on envelope).
::  state-46: generic pinned entries. note-pins keys note id -> ordered pin list
::  (oldest pinned first), capped at 5 in the handler. Only the field is added.
::  state-47: durable app-note metadata. note-apps keys note id -> app-note-meta.
::  Not a note type; only the field is added.
::  state-48: anchored artifacts. note-anchors keys note id -> note-anchor (one per
::  note). Not a note/artifact type; only the field is added.
::  state-49: one active pin per note. note-pins is now (map @ta note-pin) — the old
::  multi-pin list AND note-anchors are gone. Migration moves anchors into note-pins
::  and discards the old multi-pin lists (the old feature is removed).
::  state-50: developer/API-only note "active" status. note-active keys note id ->
::  note-active. Only the field is added.
::  state-51: app-scoped actor identity. actor-by-eid keys entry eid -> actor
::  (parallel to via-by-eid). Direct-note paths only; cover/gossip/ars-rumors
::  never write rows. Pure additive — empty map default, no envelope migration.
::  state-54: Actor Notes (Phase D). note-actor-owners keys note id -> actor-owner
::  ([host desk id]); the note's real creator stays our.bowl. Additive, empty by
::  default; existing notes have no actor owner.
::  state-63: Actor Notifications Phase G6B. actor-notifications keys [app-desk,
::  actor-id] -> (list actor-notification): durable directed reply notifications for
::  that actor. Compact (resolve author/actor/preview from messages + actor-by-eid at
::  read time). Additive; migration initializes it EMPTY (no retroactive notifications).
::  state-64: Phase B. note-unread-activity (durable green-unread source, separate from
::  note-activity recency) + the real ship-user's actor mute/block sets keyed by the full
::  [host,desk,id]. Additive; migration seeds unread-activity from note-activity (unread
::  state preserved) and the pref sets empty (notifications ON by default).
::  state-65: Actors Phase 1A schema foundation. Replaces actor-note-participation
::  (local [desk,id]) with actor-note-roster keyed by FULL actor-ref [host desk id],
::  and adds the durable participation-layer fields (no behavior yet): note-members
::  (logical human participants), actor-join-requests (pending actor requests),
::  note-actor-muted (per-note actor posting bans), user-actor-contacts (real-user
::  actor bookmarks). Migration converts each local participation row to [our desk id]
::  and seeds note-members from note.users (minus the actor owner's host).
::  state-66: App Notifications. app-notifications keys [desk,id] -> durable
::  high-level app/plugin notification rows for the Grimoire inbox. Additive; no
::  retroactive rows.
+$  state-66
  $:  %66
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-roster=(map @ta (set actor-ref:noltbook))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
      actor-note-read=(map [@tas @t] (map @ta @da))
      actor-notifications=(map [@tas @t] (list actor-notification:noltbook))
      note-unread-activity=(map @ta @da)
      user-muted-actors=(set actor-ref:noltbook)
      user-blocked-actors=(set actor-ref:noltbook)
      note-members=(map @ta (set @p))
      actor-join-requests=(map @ta (set actor-ref:noltbook))
      note-actor-muted=(map @ta (set actor-ref:noltbook))
      user-actor-contacts=(set actor-ref:noltbook)
      app-notifications=(map [@tas @t] app-notification:noltbook)
  ==
+$  state-65
  $:  %65
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-roster=(map @ta (set actor-ref:noltbook))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
      actor-note-read=(map [@tas @t] (map @ta @da))
      actor-notifications=(map [@tas @t] (list actor-notification:noltbook))
      note-unread-activity=(map @ta @da)
      user-muted-actors=(set actor-ref:noltbook)
      user-blocked-actors=(set actor-ref:noltbook)
      note-members=(map @ta (set @p))
      actor-join-requests=(map @ta (set actor-ref:noltbook))
      note-actor-muted=(map @ta (set actor-ref:noltbook))
      user-actor-contacts=(set actor-ref:noltbook)
  ==
+$  state-64
  $:  %64
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
      actor-note-read=(map [@tas @t] (map @ta @da))
      actor-notifications=(map [@tas @t] (list actor-notification:noltbook))
      note-unread-activity=(map @ta @da)
      user-muted-actors=(set actor-ref:noltbook)
      user-blocked-actors=(set actor-ref:noltbook)
  ==
+$  state-63
  $:  %63
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
      actor-note-read=(map [@tas @t] (map @ta @da))
      actor-notifications=(map [@tas @t] (list actor-notification:noltbook))
  ==
::  state-62: Actor Notifications Phase G6A. actor-note-read keys [app-desk, actor-id]
::  -> (map note-id read-cursor=@da). Each actor has an INDEPENDENT per-note message
::  read cursor — reading as Rick never marks the note read for Alice or the host. The
::  cursor is MESSAGE-only (artifacts never advance it). Additive; seeded on migration
::  to the newest stored message per participating actor (no retroactive unread).
+$  state-62
  $:  %62
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
      actor-note-read=(map [@tas @t] (map @ta @da))
  ==
::  state-61: Actor DM Phase G5A. actor-dm-notes keys a note id -> actor-dm-meta,
::  marking a secret two-ship %group note as a direct actor conversation (NOT a
::  canonical %dm). Additive, empty by default; no notes/messages/actors rewritten.
+$  state-61
  $:  %61
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
      actor-dm-notes=(map @ta actor-dm-meta:noltbook)
  ==
::  state-60: Actor Social Phase G4. remote-actor-profiles caches another ship's actor
::  public profiles keyed [host desk id] -> [profile fetched-at], for remote display.
::  Local actors still resolve from actor-registry + actor-profiles directly. Additive,
::  empty by default; bounded freshness (~m10) decided at read/request time.
+$  state-60
  $:  %60
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
      remote-actor-profiles=(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])
  ==
::  state-59: Actor Notes Phase G2. actor-note-participation keys note id -> a set of
::  [app-desk, actor-id] that may use that note (durable, membership-like, host-local).
::  The host @p stays the real note.users member; actors never enter note.users. An
::  actor may act on a regular note ONLY if it owns it (note-actor-owners) or has a
::  participation row here. Seeded from note-actor-owners on migration.
+$  state-59
  $:  %59
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
      actor-note-participation=(map @ta (set [desk=@tas id=@t]))
  ==
::  state-58: Actor Social Phase F3 (note-mute removed). actor-preferences keys
::  [desk id] -> an actor's STORED-ONLY identity mute/block book (blocked/muted
::  identity-refs only). The plugin consumes it; Noltbook never filters reads or
::  blocks posts. host pal-blocked/blocked-by/contacts/note-muted untouched.
+$  state-58
  $:  %58
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences:noltbook)
  ==
::  state-57: Actor Social Phase F3 (frozen). actor-preferences keys [desk id] -> the
::  old mute/block book (blocked/muted identity-refs + muted note ids). state-58 drops
::  muted-notes; this shape exists only for the upgrade-57-to-58 load.
+$  state-57
  $:  %57
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
      actor-preferences=(map [@tas @t] actor-preferences-57:noltbook)
  ==
::  state-56: Actor Social Phase F2. actor-contacts keys [desk id] -> a set of
::  identity-refs (ship or actor). Per-actor contact books; never touches the host
::  ship contacts. Additive, empty by default.
+$  state-56
  $:  %56
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
      actor-contacts=(map [@tas @t] (set identity-ref:noltbook))
  ==
::  state-55: Actor Social Phase F1. actor-profiles keys [desk id] -> actor-profile
::  (avatar/bio/status-text); the canonical display name stays in actor-record.name.
::  Additive, empty by default; no actor attribution rewritten.
+$  state-55
  $:  %55
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
      actor-profiles=(map [@tas @t] actor-profile:noltbook)
  ==
::  state-54: Actor Notes (Phase D). note-actor-owners keys note id -> actor-owner.
+$  state-54
  $:  %54
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
      note-actor-owners=(map @ta actor-owner:noltbook)
  ==
::  state-53: Actor Permissions (Phase C). actor-record gains caps=(unit (set
::  app-cap)) (~ inherits the app grant; [set] narrows within it). Migration maps
::  every existing record to caps=~ (inherit). app-grants/app-cap unchanged on the
::  wire (the enum expands but old grants still load).
+$  state-53
  $:  %53
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record:noltbook)
  ==
::  state-52: Actor Control (Phase A). app-grants keys desk -> app-grant (host
::  governance over local apps); actor-registry keys [desk id] -> actor-record
::  (host lifecycle + TOFU). Both additive, empty by default.
+$  state-52
  $:  %52
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
      app-grants=(map @tas app-grant:noltbook)
      actor-registry=(map [@tas @t] actor-record-52:noltbook)
  ==
+$  state-51
  $:  %51
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
      actor-by-eid=(map @uv actor:noltbook)
  ==
+$  state-50
  $:  %50
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
      note-active=(map @ta note-active:noltbook)
  ==
+$  state-49
  $:  %49
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta note-pin:noltbook)
      note-apps=(map @ta app-note-meta:noltbook)
  ==
+$  state-48
  $:  %48
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta (list pin:noltbook))
      note-apps=(map @ta app-note-meta:noltbook)
      note-anchors=(map @ta note-anchor:noltbook)
  ==
+$  state-47
  $:  %47
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta (list pin:noltbook))
      note-apps=(map @ta app-note-meta:noltbook)
  ==
+$  state-46
  $:  %46
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
      note-pins=(map @ta (list pin:noltbook))
  ==
+$  state-45
  $:  %45
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
  ==
+$  state-44
  $:  %44
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
      via-by-eid=(map @uv via-app:noltbook)
  ==
::  state-43: durable cleared-mentions tombstones. Once a mention is cleared it is
::  recorded here so refetching the same message (esp. cover/gossip content fetch)
::  cannot recreate it. Keyed by note id; per entry [msg-id eid] with eid-first
::  matching and msg-id fallback. Only the field is added vs state-42.
+$  state-43
  $:  %43
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      cleared-mentions=(map @ta (list [id=@da eid=(unit @uv)]))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
      gossip-envelopes=(map @ta (map @da envelope-44))
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
  =/  new-envs=(map @ta (map @da envelope-44))
    %-  ~(run by gossip-envelopes.s)
    |=  envs=(map @da envelope-21)
    ^-  (map @da envelope-44)
    %-  ~(run by envs)
    |=  e=envelope-21
    ^-  envelope-44
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
  =/  att=(map @ta (list attention-item:noltbook))  ~
  ::  pipe through upgrade-42-to-43 so the chain terminates at state-43.
  %-  upgrade-42-to-43
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
::  upgrade-42-to-43: add durable cleared-mentions tombstones (empty on migration).
++  upgrade-42-to-43
  |=  s=state-42
  ^-  state-64
  =/  cm=(map @ta (list [id=@da eid=(unit @uv)]))  ~
  %-  upgrade-43-to-44
  :*  %43
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
      attention.s
      cm
  ==
::  upgrade-43-to-44: add via-by-eid (durable per-eid app attribution), empty.
++  upgrade-43-to-44
  |=  s=state-43
  ^-  state-64
  %-  upgrade-44-to-45
  :*  %44
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
      attention.s
      cleared-mentions.s
      `(map @uv via-app:noltbook)`~
  ==
::  upgrade-44-to-45: add via=~ to every stored gossip/cover envelope.
++  upgrade-44-to-45
  |=  s=state-44
  ^-  state-64
  =/  new-envs=(map @ta (map @da envelope:noltbook))
    %-  ~(run by gossip-envelopes.s)
    |=  inner=(map @da envelope-44)
    ^-  (map @da envelope:noltbook)
    %-  ~(run by inner)
    |=  e=envelope-44
    ^-  envelope:noltbook
    [author.e msg-id.e timestamp.e reply-to.e content-hash.e meta.e ~]
  %-  upgrade-45-to-46
  :*  %45
      notes.s  messages.s  artifacts.s  profiles.s
      transactions.s  current-note.s  peers.s  has-avatar.s
      pal-outgoing.s  pal-incoming.s  pal-blocked.s
      blocked-by.s
      dial.s  gossip-hops.s  mentions.s  active-calls.s
      new-envs  headlines.s
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
  ==
::  upgrade-45-to-46: add note-pins (empty). Generic pinned entries (Phase 1).
::  Cap enforcement lives in the pin handler, never here.
++  upgrade-45-to-46
  |=  s=state-45
  ^-  state-64
  %-  upgrade-46-to-47
  :*  %46
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      `(map @ta (list pin:noltbook))`~
  ==
::  upgrade-46-to-47: add note-apps (empty). Durable app-note metadata. Does not
::  rewrite notes, pins, or via; only appends the new field.
++  upgrade-46-to-47
  |=  s=state-46
  ^-  state-64
  %-  upgrade-47-to-48
  :*  %47
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      `(map @ta app-note-meta:noltbook)`~
  ==
::  upgrade-47-to-48: add note-anchors (empty). Anchored artifacts. Does not
::  rewrite notes, pins, app metadata, or via; only appends the new field.
++  upgrade-47-to-48
  |=  s=state-47
  ^-  state-64
  %-  upgrade-48-to-49
  :*  %48
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      `(map @ta note-anchor:noltbook)`~
  ==
::  upgrade-48-to-49: collapse the old multi-pin list + anchors into the new single
::  note-pin map. Each anchor becomes a %artifact pin; the old multi-pin lists are
::  intentionally discarded (the multi-pin feature is removed). Other fields copied.
++  upgrade-48-to-49
  |=  s=state-48
  ^-  state-64
  =/  new-pins=(map @ta note-pin:noltbook)
    %-  ~(run by note-anchors.s)
    |=  a=note-anchor:noltbook
    ^-  note-pin:noltbook
    [target.a %artifact set-by.a set-at.a]
  %-  upgrade-49-to-50
  :*  %49
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      new-pins
      note-apps.s
  ==
::  upgrade-49-to-50: add note-active (empty). Developer/API-only "active" status.
::  Only the field is added; no other state is rewritten.
++  upgrade-49-to-50
  |=  s=state-49
  ^-  state-64
  %-  upgrade-50-to-51
  :*  %50
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      `(map @ta note-active:noltbook)`~
  ==
::  upgrade-50-to-51: add actor-by-eid (empty). App-scoped actor identity rows,
::  parallel to via-by-eid. Only the field is added; no other state is rewritten,
::  and no envelope migration (actor is excluded from gossip/cover in v1).
++  upgrade-50-to-51
  |=  s=state-50
  ^-  state-64
  %-  upgrade-51-to-52
  :*  %51
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      `(map @uv actor:noltbook)`~
  ==
::  upgrade-51-to-52: add app-grants + actor-registry (both empty). Actor Control
::  Phase A — host governance over local app actors. Pure additive.
++  upgrade-51-to-52
  |=  s=state-51
  ^-  state-64
  %-  upgrade-52-to-53
  :*  %52
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      `(map @tas app-grant:noltbook)`~
      `(map [@tas @t] actor-record-52:noltbook)`~
  ==
::  upgrade-52-to-53: add per-actor caps (Phase C). Every existing record migrates
::  to caps=~ (inherit the app grant). Only the actor-registry value shape changes.
++  upgrade-52-to-53
  |=  s=state-52
  ^-  state-64
  =/  new-registry=(map [@tas @t] actor-record:noltbook)
    %-  ~(run by actor-registry.s)
    |=  r=actor-record-52:noltbook
    ^-  actor-record:noltbook
    :*  id.r  name.r  kind.r  status.r
        created-at.r  updated-at.r  revoked-at.r  last-seen.r
        ~
    ==
  %-  upgrade-53-to-54
  :*  %53
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      new-registry
  ==
::  upgrade-53-to-54: add note-actor-owners (empty). Actor note ownership (Phase D).
::  Pure additive; existing notes get no actor owner.
++  upgrade-53-to-54
  |=  s=state-53
  ^-  state-64
  %-  upgrade-54-to-55
  :*  %54
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      `(map @ta actor-owner:noltbook)`~
  ==
::  upgrade-54-to-55: add actor-profiles (empty). Actor Social Phase F1. Pure
::  additive; no actor attribution or registry rewritten.
++  upgrade-54-to-55
  |=  s=state-54
  ^-  state-64
  %-  upgrade-55-to-56
  :*  %55
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      `(map [@tas @t] actor-profile:noltbook)`~
  ==
::  upgrade-56-to-57: add actor-preferences (empty). Actor Social Phase F3. Pure
::  additive; registry/profiles/contacts/notes/host pals+contacts+note-muted
::  untouched. Suspended/revoked actors keep any preferences for reactivation.
++  upgrade-56-to-57
  |=  s=state-56
  ^-  state-64
  %-  upgrade-57-to-58
  :*  %57
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      `(map [@tas @t] actor-preferences-57:noltbook)`~
  ==
::  upgrade-57-to-58: drop muted-notes from each actor-preferences row, keeping
::  blocked/muted. Actor Social Phase F3 cleanup (note-mute removed). Pure projection;
::  registry/profiles/contacts/notes/messages/ownership untouched.
++  upgrade-57-to-58
  |=  s=state-57
  ^-  state-64
  %-  upgrade-58-to-59
  :*  %58
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      ::  project each frozen row to [blocked muted], dropping muted-notes.
      %-  ~(run by actor-preferences.s)
      |=(p=actor-preferences-57:noltbook [blocked.p muted.p])
  ==
::  upgrade-58-to-59: add actor-note-participation (Actor Notes Phase G2). Seeded
::  from note-actor-owners: every existing actor-owned note gives its [desk,id] owner
::  a participation row. NOTHING is inferred from actor-by-eid/messages/host
::  membership. All other state fields preserved unchanged.
++  upgrade-58-to-59
  |=  s=state-58
  ^-  state-64
  =/  seed=(map @ta (set [desk=@tas id=@t]))
    %-  ~(run by note-actor-owners.s)
    |=(o=actor-owner:noltbook (sy ~[[desk.o id.o]]))
  %-  upgrade-59-to-60
  :*  %59
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      seed
  ==
::  upgrade-59-to-60: add remote-actor-profiles (empty). Actor Social Phase G4. Pure
::  additive; no actor/profile/message rewrite — just a remote display cache.
++  upgrade-59-to-60
  |=  s=state-59
  ^-  state-64
  %-  upgrade-60-to-61
  :*  %60
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-participation.s
      `(map [host=@p desk=@tas id=@t] [profile=actor-public-profile:noltbook fetched-at=@da])`~
  ==
::  upgrade-60-to-61: add actor-dm-notes (empty). Actor DM Phase G5A. Pure additive;
::  no notes/messages/actors/markers rewritten.
++  upgrade-60-to-61
  |=  s=state-60
  ^-  state-64
  %-  upgrade-61-to-62
  :*  %61
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-participation.s
      remote-actor-profiles.s
      `(map @ta actor-dm-meta:noltbook)`~
  ==
::  upgrade-61-to-62: add actor-note-read (Actor Notifications Phase G6A). SEED every
::  participating actor as read through the newest currently-stored MESSAGE in each
::  note, so no existing actor note becomes retroactively unread. Notes with no
::  messages get no row. Nothing else (messages/participation/ownership/markers/host
::  note-read) is rewritten.
++  upgrade-61-to-62
  |=  s=state-61
  ^-  state-64
  =/  seed=(map [@tas @t] (map @ta @da))
    =/  acc=(map [@tas @t] (map @ta @da))  ~
    =/  parts=(list [nid=@ta mem=(set [desk=@tas id=@t])])  ~(tap by actor-note-participation.s)
    |-  ^+  acc
    ?~  parts  acc
    =/  newest=@da  (newest-msg-da (fall (~(get by messages.s) nid.i.parts) ~))
    ?:  =(`@da`0 newest)  $(parts t.parts)
    =/  acc2=(map [@tas @t] (map @ta @da))
      =/  mem=(list [desk=@tas id=@t])  ~(tap in mem.i.parts)
      |-  ^+  acc
      ?~  mem  acc
      =/  k=[@tas @t]  [desk.i.mem id.i.mem]
      =/  inner=(map @ta @da)  (fall (~(get by acc) k) ~)
      $(mem t.mem, acc (~(put by acc) k (~(put by inner) nid.i.parts newest)))
    $(parts t.parts, acc acc2)
  %-  upgrade-62-to-63
  :*  %62
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-participation.s
      remote-actor-profiles.s
      actor-dm-notes.s
      seed
  ==
::  upgrade-62-to-63: add actor-notifications (EMPTY). Actor Notifications Phase G6B.
::  Pure additive — no retroactive notifications; messages/actors/cursors/host
::  attention are not rewritten.
++  upgrade-62-to-63
  |=  s=state-62
  ^-  state-64
  %-  upgrade-63-to-64
  :*  %63
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-participation.s
      remote-actor-profiles.s
      actor-dm-notes.s
      actor-note-read.s
      `(map [@tas @t] (list actor-notification:noltbook))`~
  ==
::  upgrade-63-to-64: Phase B. SEED note-unread-activity from note-activity (existing
::  durable unread state is preserved), mute/block sets EMPTY (notifications ON by
::  default). Pure additive — no actor/message/notification rewrite.
++  upgrade-63-to-64
  |=  s=state-63
  ^-  state-64
  :*  %64
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-participation.s
      remote-actor-profiles.s
      actor-dm-notes.s
      actor-note-read.s
      actor-notifications.s
      note-activity.s
      `(set actor-ref:noltbook)`~
      `(set actor-ref:noltbook)`~
  ==
::  upgrade-64-to-65: Actors Phase 1A. Convert local [desk,id] participation rows to
::  full actor-ref [our,desk,id] roster rows; seed note-members from note.users (minus
::  the actor owner's transport host); initialize the remaining participation-layer
::  fields empty. Pure/additive — no notes/messages/owners/registry rewritten. Takes
::  `our` because upgrade arms have no bowl and the roster ref needs the host @p.
++  upgrade-64-to-65
  |=  [our=@p s=state-64]
  ^-  state-66
  %-  upgrade-65-to-66
  :*  %65
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      (roster-from-participation our actor-note-participation.s)
      remote-actor-profiles.s
      actor-dm-notes.s
      actor-note-read.s
      actor-notifications.s
      note-unread-activity.s
      user-muted-actors.s
      user-blocked-actors.s
      (members-from-notes notes.s note-actor-owners.s)
      `(map @ta (set actor-ref:noltbook))`~
      `(map @ta (set actor-ref:noltbook))`~
      `(set actor-ref:noltbook)`~
  ==
::  upgrade-65-to-66: App Notifications. Pure additive; existing app/user/actor
::  state is carried forward and no notifications are inferred retroactively.
++  upgrade-65-to-66
  |=  s=state-65
  ^-  state-66
  :*  %66
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      actor-contacts.s
      actor-preferences.s
      actor-note-roster.s
      remote-actor-profiles.s
      actor-dm-notes.s
      actor-note-read.s
      actor-notifications.s
      note-unread-activity.s
      user-muted-actors.s
      user-blocked-actors.s
      note-members.s
      actor-join-requests.s
      note-actor-muted.s
      user-actor-contacts.s
      `(map [@tas @t] app-notification:noltbook)`~
  ==
::  roster-from-participation: each local [desk,id] participation row -> a full actor-ref
::  [our,desk,id] roster row. Drops empty sets. Phase 1A migration only.
++  roster-from-participation
  |=  [our=@p parts=(map @ta (set [desk=@tas id=@t]))]
  ^-  (map @ta (set actor-ref:noltbook))
  %-  ~(rep by parts)
  |=  [[nid=@ta s=(set [desk=@tas id=@t])] acc=(map @ta (set actor-ref:noltbook))]
  ?:  =(~ s)  acc
  =/  refs=(set actor-ref:noltbook)
    %-  ~(run in s)
    |=  [desk=@tas id=@t]
    ^-  actor-ref:noltbook
    [our desk id]
  (~(put by acc) nid refs)
::  members-from-notes: seed logical human participants per note. Ordinary note =>
::  note.users; actor-owned note => note.users minus the owner's transport host.
::  Drops empty member sets. Phase 1A migration only; no behavior is active yet.
++  members-from-notes
  |=  [nmap=(map @ta note:noltbook) owners=(map @ta actor-owner:noltbook)]
  ^-  (map @ta (set @p))
  %-  ~(rep by nmap)
  |=  [[nid=@ta nt=note:noltbook] acc=(map @ta (set @p))]
  =/  base=(set @p)  users.nt
  =/  mem=(set @p)
    =/  o=(unit actor-owner:noltbook)  (~(get by owners) nid)
    ?~  o  base
    (~(del in base) host.u.o)
  ::  1B.1: store the row even when empty (an empty logical set is authoritative).
  (~(put by acc) nid mem)
::  prune-note-members: drop note-members rows for a list of removed note ids (parity
::  with prune-participation, but the value type is (set @p)). Phase 1A cleanup helper.
++  prune-note-members
  |=  [ids=(list @ta) m=(map @ta (set @p))]
  ^-  (map @ta (set @p))
  =/  acc=(map @ta (set @p))  m
  |-
  ?~  ids  acc
  $(ids t.ids, acc (~(del by acc) i.ids))
::  upgrade-55-to-56: add actor-contacts (empty). Actor Social Phase F2. Pure
::  additive; profiles/registry/ship-contacts untouched.
++  upgrade-55-to-56
  |=  s=state-55
  ^-  state-64
  %-  upgrade-56-to-57
  :*  %56
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
      attention.s
      cleared-mentions.s
      via-by-eid.s
      note-pins.s
      note-apps.s
      note-active.s
      actor-by-eid.s
      app-grants.s
      actor-registry.s
      note-actor-owners.s
      actor-profiles.s
      `(map [@tas @t] (set identity-ref:noltbook))`~
  ==
::  upgrade-29-to-30: add pending-fork-invites map (empty).
++  upgrade-29-to-30
  |=  s=state-29
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
  ^-  state-64
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
::  ===== one active pin per note =====
::  pin-note-ok: pinnable note types — notebook/group/gossip (no DM/cover/rumors).
++  pin-note-ok
  |=  n=note:noltbook
  ^-  ?
  ?|(=(%notebook type.n) =(%group type.n) =(%gossip type.n))
::  pin-target-ok: does target eid resolve to a pinnable entry in this note?
::  %message: a message in messages[nid] with matching meta.eid.
::  %artifact: a %file/%app artifact in this note with matching meta.eid.
::  %code artifacts are intentionally excluded (hidden/dev-only, not timelined).
++  pin-target-ok
  |=  $:  nid=@ta  target=@uv  kind=?(%message %artifact)
          msgs=(map @ta (list message:noltbook))
          arts=(map @ta artifact:noltbook)
      ==
  ^-  ?
  ?-  kind
      %message
    %+  lien  (fall (~(get by msgs) nid) ~)
    |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m target)))
  ::
      %artifact
    %+  lien  ~(val by arts)
    |=  a=artifact:noltbook
    ?&  =(note-id.a nid)
        ?|(=(%file type.a) =(%app type.a))
        ?~(meta.a %.n =(eid.u.meta.a target))
    ==
  ==
::  pin-cards: broadcast the authoritative pin on /notes + /notes/[nid]. ~ = cleared.
++  pin-cards
  |=  [nid=@ta pin=(unit note-pin:noltbook)]
  ^-  (list card:agent:gall)
  =/  upd=update:noltbook  [%note-pin-updated nid pin]
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
  ==
::  apply-set-pin: host-side set. Validates note exists + pinnable type, not
::  write-blocked, `who` is the CREATOR (creator-only; admins/members excluded), and
::  target resolves for the given kind. Setting replaces the existing pin. Returns
::  the new pin or a failure code.
++  apply-set-pin
  |=  $:  who=@p  nid=@ta  target=@uv  kind=?(%message %artifact)
          nmap=(map @ta note:noltbook)
          msgs=(map @ta (list message:noltbook))
          arts=(map @ta artifact:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
          now=@da
      ==
  ^-  (each note-pin:noltbook @tas)
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note]
  ?.  (pin-note-ok u.nt-u)  [%.n %unsupported]
  ?:  (is-write-blocked nid hs nmap who)  [%.n %rejected]
  ?.  =(who creator.u.nt-u)  [%.n %rejected]
  ?.  (pin-target-ok nid target kind msgs arts)  [%.n %missing-target]
  [%.y `note-pin:noltbook`[target kind who now]]
::  apply-clear-pin: host-side clear. Creator-only; idempotent (succeeds even when
::  nothing is pinned — the handler skips the broadcast in that case).
++  apply-clear-pin
  |=  $:  who=@p  nid=@ta
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
      ==
  ^-  (each ~ @tas)
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note]
  ?.  (pin-note-ok u.nt-u)  [%.n %unsupported]
  ?:  (is-write-blocked nid hs nmap who)  [%.n %rejected]
  ?.  =(who creator.u.nt-u)  [%.n %rejected]
  [%.y ~]
::  ===== developer/API-only note "active" status =====
::  active-cards: broadcast the authoritative active status on /notes + /notes/[nid].
++  active-cards
  |=  [nid=@ta active=(unit note-active:noltbook)]
  ^-  (list card:agent:gall)
  =/  upd=update:noltbook  [%note-active-updated nid active]
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/notes/[nid]] %noltbook-update !>(upd)]
  ==
::  active-live: the unexpired active entries (expires-at strictly after `now`).
::  Snapshots/reads use this so stale heartbeats never show.
++  active-live
  |=  [m=(map @ta note-active:noltbook) now=@da]
  ^-  (map @ta note-active:noltbook)
  %-  ~(gas by *(map @ta note-active:noltbook))
  %+  skim  ~(tap by m)
  |=([@ta a=note-active:noltbook] (gth expires-at.a now))
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
  `(rpoke /child-out/(scot %p ship)/[nid] ship `remote:noltbook`[%remote-child-note u.parent.u.n u.n])
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
  `(rpoke /kick/(scot %p ship)/[nid] ship `remote:noltbook`[%remote-kick nid name.u.n])
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
::  prune-participation (Phase G2): drop actor-note-roster rows for a list of
::  removed note ids. Shared by the primary local-removal paths (leave/remote-delete)
::  so participation never outlives its note on those paths.
++  prune-participation
  |=  [ids=(list @ta) parts=(map @ta (set actor-ref:noltbook))]
  ^-  (map @ta (set actor-ref:noltbook))
  =/  acc=(map @ta (set actor-ref:noltbook))  parts
  |-
  ?~  ids  acc
  $(ids t.ids, acc (~(del by acc) i.ids))
::  ===== Phase G6A: actor-scoped message read cursors =====
::  newest-msg-da: newest MESSAGE creation time (@da) in a list; 0 if none. Actor
::  unread is MESSAGE-ONLY — artifacts never advance an actor cursor (actors have no
::  artifact access), so we never consult note-activity (which also counts artifacts).
++  newest-msg-da
  |=  msgs=(list message:noltbook)
  ^-  @da
  %+  roll  msgs
  |=  [m=message:noltbook acc=@da]
  ?:((gth id.m acc) id.m acc)
::  actor-read-get: an actor's read cursor for one note (0 = none).
++  actor-read-get
  |=  [read=(map [@tas @t] (map @ta @da)) desk=@tas aid=@t nid=@ta]
  ^-  @da
  (fall (~(get by (fall (~(get by read) [desk aid]) ~)) nid) `@da`0)
::  actor-read-put: MONOTONICALLY advance an actor's cursor — never decreases.
++  actor-read-put
  |=  [read=(map [@tas @t] (map @ta @da)) desk=@tas aid=@t nid=@ta t=@da]
  ^-  (map [@tas @t] (map @ta @da))
  =/  inner=(map @ta @da)  (fall (~(get by read) [desk aid]) ~)
  =/  cur=@da  (fall (~(get by inner) nid) `@da`0)
  ?:  (lte t cur)  read
  (~(put by read) [desk aid] (~(put by inner) nid t))
::  actor-read-seed: set an actor's cursor to the newest stored message (so joining an
::  existing note does NOT mark its history unread). No-op when there are no messages.
++  actor-read-seed
  |=  [read=(map [@tas @t] (map @ta @da)) desk=@tas aid=@t nid=@ta msgs=(list message:noltbook)]
  ^-  (map [@tas @t] (map @ta @da))
  (actor-read-put read desk aid nid (newest-msg-da msgs))
::  actor-read-del: remove ONE actor/note cursor; drop the inner map if it empties.
++  actor-read-del
  |=  [read=(map [@tas @t] (map @ta @da)) desk=@tas aid=@t nid=@ta]
  ^-  (map [@tas @t] (map @ta @da))
  =/  inner=(map @ta @da)  (fall (~(get by read) [desk aid]) ~)
  ?.  (~(has by inner) nid)  read
  =/  ni=(map @ta @da)  (~(del by inner) nid)
  ?:  =(~ ni)  (~(del by read) [desk aid])
  (~(put by read) [desk aid] ni)
::  actor-read-prune: drop a set of deleted note ids from EVERY actor's inner map;
::  drop any inner map that empties. Used wherever participation is pruned for deleted
::  notes, so cursors never outlive their note.
++  actor-read-prune
  |=  [read=(map [@tas @t] (map @ta @da)) ids=(list @ta)]
  ^-  (map [@tas @t] (map @ta @da))
  =/  idset=(set @ta)  (~(gas in *(set @ta)) ids)
  =/  out=(map [@tas @t] (map @ta @da))  ~
  =/  pairs=(list [k=[@tas @t] inner=(map @ta @da)])  ~(tap by read)
  |-  ^+  out
  ?~  pairs  out
  =/  ni=(map @ta @da)
    %-  ~(gas by *(map @ta @da))
    %+  skip  ~(tap by inner.i.pairs)
    |=([nid=@ta t=@da] (~(has in idset) nid))
  ?:  =(~ ni)  $(pairs t.pairs)
  $(pairs t.pairs, out (~(put by out) k.i.pairs ni))
::  ===== Phase G6B: actor-directed reply notifications =====
::  reply-parent-eid: the immediate parent's eid for a reply — reply-to-eid first,
::  else the legacy reply-to (@da) mapped through the note's messages to that parent's
::  eid. ~ if not a reply or the parent/eid can't be resolved. Only the immediate
::  parent is consulted (no ancestor walk).
++  reply-parent-eid
  |=  [msg=message:noltbook note-msgs=(list message:noltbook)]
  ^-  (unit @uv)
  ?~  meta.msg  ~
  ?^  reply-to-eid.u.meta.msg  reply-to-eid.u.meta.msg
  ?~  reply-to.msg  ~
  =/  hit=(list message:noltbook)  (skim note-msgs |=(m=message:noltbook =(id.m u.reply-to.msg)))
  ?~  hit  ~
  ?~  meta.i.hit  ~
  `eid.u.meta.i.hit
::  actor-notif-resolve: a durable notification -> the RESOLVED view, joining the
::  replying message (author + current edited preview) and its actor (actor-by-eid).
::  ~ when the replying message no longer exists (so a stale row never surfaces).
++  actor-notif-resolve
  |=  $:  n=actor-notification:noltbook
          messages=(map @ta (list message:noltbook))
          amap=actor-map:noltbook
      ==
  ^-  (unit actor-notification-view:noltbook)
  =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.n) ~)
  =/  hit=(list message:noltbook)
    (skim msgs |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m eid.n))))
  ?~  hit  ~
  =/  m=message:noltbook  i.hit
  ::  public timestamp is the replying MESSAGE's timestamp (identical on every ship),
  ::  NOT the local receipt time (created-at, kept in the durable record for internal
  ::  append-order/audit only).
  `[kind.n note-id.n eid.n msg-id.n author.m (~(get by amap) eid.n) text.m timestamp.m]
::  actor-notif-views: resolve a durable list to views, NEWEST-FIRST (stored append
::  order is oldest-first, so flop). Unresolvable rows are dropped.
++  actor-notif-views
  |=  $:  ns=(list actor-notification:noltbook)
          messages=(map @ta (list message:noltbook))
          amap=actor-map:noltbook
      ==
  ^-  (list actor-notification-view:noltbook)
  %-  flop
  %+  murn  ns
  |=(n=actor-notification:noltbook (actor-notif-resolve n messages amap))
::  actor-notif-add: create a directed reply notification for the parent message's
::  actor when ALL hold — parent is actor-attributed, that actor's host is ours, the
::  sender is not the same actor, the target currently owns/participates (actor-DM
::  rules included), the target is not revoked, and the sender is not muted/blocked in
::  the target's prefs. Dedups by note-id + eid. Returns [notifs delta-cards]; the
::  delta (full=%.n) carries the single new view on /api/results. NEVER creates host
::  attention and NEVER mutates host pal/block/mute/note-read.
++  actor-notif-add
  |=  $:  notifs=(map [@tas @t] (list actor-notification:noltbook))
          our=@p  now=@da  nid=@ta
          msg=message:noltbook
          sender-actor=(unit actor:noltbook)
          amap=actor-map:noltbook
          note-msgs=(list message:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
          owners=(map @ta actor-owner:noltbook)
          parts=(map @ta (set actor-ref:noltbook))
          dms=(map @ta actor-dm-meta:noltbook)
          nmap=(map @ta note:noltbook)
          prefs-map=(map [@tas @t] actor-preferences:noltbook)
      ==
  ^-  [(list card:agent:gall) (map [@tas @t] (list actor-notification:noltbook))]
  ::  the replying message must carry an eid (it is the dedup + resolve identity).
  ?~  meta.msg  [~ notifs]
  =/  my-eid=@uv  eid.u.meta.msg
  ::  resolve the immediate parent eid (reply-to-eid, else legacy reply-to @da).
  =/  pe=(unit @uv)  (reply-parent-eid msg note-msgs)
  ?~  pe  [~ notifs]
  ::  the parent must be attributed to an actor; otherwise host attention handles it.
  =/  tgt-u=(unit actor:noltbook)  (~(get by amap) u.pe)
  ?~  tgt-u  [~ notifs]
  =/  tgt=actor:noltbook  u.tgt-u
  ::  only the target actor's OWN host records the notification (a remote host that
  ::  stores the same message must not notify an actor hosted elsewhere).
  ?.  =(host.tgt our)  [~ notifs]
  ::  a reply from the EXACT same actor to itself notifies nobody. A host @p reply and
  ::  a different actor under the same host are distinct identities and DO notify.
  ?:  ?&  ?=(^ sender-actor)
          =(host.u.sender-actor host.tgt)
          =(desk.u.sender-actor desk.tgt)
          =(id.u.sender-actor id.tgt)
      ==
    [~ notifs]
  ::  the target must currently own or participate (inherits actor-DM owner/adopter
  ::  host-role rules + the membership invariant from actor-note-access).
  =/  acc  (actor-note-access our nid desk.tgt id.tgt nmap owners parts dms)
  ?:  ?=(%.n -.acc)  [~ notifs]
  ::  the target must have a CANONICAL registry row that is not revoked. A missing row
  ::  (historical actor-by-eid attribution predating the registry migration) creates no
  ::  notification and is NEVER silently TOFU-registered here; active/suspended accumulate.
  ::  Host attention stays suppressed regardless (the caller gated on parent-is-actor).
  =/  rec  (~(get by registry) [desk.tgt id.tgt])
  ?:  ?|(?=(~ rec) ?=(%revoked status.u.rec))  [~ notifs]
  ::  preference filter: sender muted OR blocked suppresses (message still posted).
  =/  sender-ref=identity-ref:noltbook
    ?~  sender-actor  [%ship author.msg]
    [%actor host.u.sender-actor desk.u.sender-actor id.u.sender-actor]
  =/  prefs=actor-preferences:noltbook  (fall (~(get by prefs-map) [desk.tgt id.tgt]) [~ ~])
  ?:  |((~(has in muted.prefs) sender-ref) (~(has in blocked.prefs) sender-ref))
    [~ notifs]
  ::  dedup by note-id + eid.
  =/  key=[@tas @t]  [desk.tgt id.tgt]
  =/  cur=(list actor-notification:noltbook)  (fall (~(get by notifs) key) ~)
  ?:  (lien cur |=(n=actor-notification:noltbook &(=(note-id.n nid) =(eid.n my-eid))))
    [~ notifs]
  ::  durable record keeps created-at=now (internal append-order/audit only).
  =/  new-notif=actor-notification:noltbook  [%reply nid my-eid id.msg now]
  ::  the delta view: the replying message's author/actor/preview (built directly, so it
  ::  does not depend on the new message being in the messages map yet). The PUBLIC
  ::  timestamp is the message timestamp (matches the durable read on every ship).
  =/  view=actor-notification-view:noltbook
    [%reply nid my-eid id.msg author.msg sender-actor text.msg timestamp.msg]
  :-  ~[[%give %fact ~[/api/results] %noltbook-update !>(`update:noltbook`[%actor-notifications-updated desk.tgt id.tgt ~[view] %.n])]]
  (~(put by notifs) key (snoc cur new-notif))
::  actor-notif-del-eid: drop every notification targeting a replying eid (its message
::  was deleted), across all actors; drop emptied per-actor rows.
++  actor-notif-del-eid
  |=  [notifs=(map [@tas @t] (list actor-notification:noltbook)) eid=@uv]
  ^-  (map [@tas @t] (list actor-notification:noltbook))
  =/  out=(map [@tas @t] (list actor-notification:noltbook))  ~
  =/  pairs=(list [k=[@tas @t] l=(list actor-notification:noltbook)])  ~(tap by notifs)
  |-  ^+  out
  ?~  pairs  out
  =/  nl=(list actor-notification:noltbook)
    (skip l.i.pairs |=(n=actor-notification:noltbook =(eid.n eid)))
  ?:  =(~ nl)  $(pairs t.pairs)
  $(pairs t.pairs, out (~(put by out) k.i.pairs nl))
::  actor-notif-del-actor-note: drop one actor's notifications for a single note (the
::  actor left or was removed); drop the row if it empties.
++  actor-notif-del-actor-note
  |=  [notifs=(map [@tas @t] (list actor-notification:noltbook)) desk=@tas aid=@t nid=@ta]
  ^-  (map [@tas @t] (list actor-notification:noltbook))
  =/  cur=(list actor-notification:noltbook)  (fall (~(get by notifs) [desk aid]) ~)
  =/  nl=(list actor-notification:noltbook)
    (skip cur |=(n=actor-notification:noltbook =(note-id.n nid)))
  ?:  =(~ nl)  (~(del by notifs) [desk aid])
  (~(put by notifs) [desk aid] nl)
::  actor-notif-prune-notes: drop notifications for a set of removed note ids across
::  EVERY actor; drop emptied rows. Used at note/subtree/ship-level note removal.
++  actor-notif-prune-notes
  |=  [notifs=(map [@tas @t] (list actor-notification:noltbook)) ids=(list @ta)]
  ^-  (map [@tas @t] (list actor-notification:noltbook))
  =/  idset=(set @ta)  (~(gas in *(set @ta)) ids)
  =/  out=(map [@tas @t] (list actor-notification:noltbook))  ~
  =/  pairs=(list [k=[@tas @t] l=(list actor-notification:noltbook)])  ~(tap by notifs)
  |-  ^+  out
  ?~  pairs  out
  =/  nl=(list actor-notification:noltbook)
    (skip l.i.pairs |=(n=actor-notification:noltbook (~(has in idset) note-id.n)))
  ?:  =(~ nl)  $(pairs t.pairs)
  $(pairs t.pairs, out (~(put by out) k.i.pairs nl))
::  actor-notif-full-cards: authoritative remaining list for one actor on /api/results
::  (full=%.y) — used after a clear or a per-actor lifecycle prune.
++  actor-notif-full-cards
  |=  $:  notifs=(map [@tas @t] (list actor-notification:noltbook))
          desk=@tas  aid=@t
          messages=(map @ta (list message:noltbook))
          amap=actor-map:noltbook
      ==
  ^-  (list card:agent:gall)
  =/  views=(list actor-notification-view:noltbook)
    (actor-notif-views (fall (~(get by notifs) [desk aid]) ~) messages amap)
  ~[[%give %fact ~[/api/results] %noltbook-update !>(`update:noltbook`[%actor-notifications-updated desk aid views %.y])]]
::  actor-notif-diff-cards: emit ONE authoritative full=%.y %actor-notifications-updated
::  per actor key whose notification list ACTUALLY changed between the old and new maps
::  (union of keys; a now-empty row emits an empty list; unchanged keys emit nothing, so
::  an unrelated deletion is silent). Remaining rows resolve with the POST-mutation
::  messages + actor-by-eid. Used by every deletion/note-removal pruning path so live
::  /api/results clients drop stale rows without rereading the route.
++  actor-notif-diff-cards
  |=  $:  old=(map [@tas @t] (list actor-notification:noltbook))
          new=(map [@tas @t] (list actor-notification:noltbook))
          messages=(map @ta (list message:noltbook))
          amap=actor-map:noltbook
      ==
  ^-  (list card:agent:gall)
  =/  keys=(set [@tas @t])  (~(uni in ~(key by old)) ~(key by new))
  %-  zing
  %+  turn  ~(tap in keys)
  |=  k=[@tas @t]
  ^-  (list card:agent:gall)
  =/  ol=(list actor-notification:noltbook)  (fall (~(get by old) k) ~)
  =/  nl=(list actor-notification:noltbook)  (fall (~(get by new) k) ~)
  ?:  =(ol nl)  ~
  =/  views=(list actor-notification-view:noltbook)  (actor-notif-views nl messages amap)
  ~[[%give %fact ~[/api/results] %noltbook-update !>(`update:noltbook`[%actor-notifications-updated -.k +.k views %.y])]]
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
::  ===== Phase B: separate unread-activity + real-user actor mute/block =====
::  put-unread-activity: durable green-unread recency, parallel to put-activity (same
::  pinned-note skip). note-activity keeps driving sidebar order; this drives the unread
::  dot. Muted/blocked actor messages advance note-activity but NOT this map.
++  put-unread-activity
  |=  [nua=(map @ta @da) nid=@ta time=@da]
  ^-  (map @ta @da)
  ?:  (is-pinned-note nid)  nua
  (~(put by nua) nid time)
::  unread-activity-fact: /notes fact advancing a note's durable UNREAD activity.
++  unread-activity-fact
  |=  [nid=@ta time=@da]
  ^-  card
  [%give %fact ~[/notes] %noltbook-update !>(`update:noltbook`[%note-unread-activity nid time])]
::  actor-ref-of: the stable [host,desk,id] preference key for a canonical actor.
++  actor-ref-of
  |=  a=actor:noltbook
  ^-  actor-ref:noltbook
  [host.a desk.a id.a]
::  actor-user-suppressed: should THIS message's actor be suppressed for the real user?
::  True when an actor is attributed AND its ref is in the muted OR blocked set. Uses
::  only the canonical actor handed in at each storage path (never an unvalidated wire).
++  actor-user-suppressed
  |=  $:  actor=(unit actor:noltbook)
          muted=(set actor-ref:noltbook)
          blocked=(set actor-ref:noltbook)
      ==
  ^-  ?
  ?~  actor  %.n
  =/  ref=actor-ref:noltbook  (actor-ref-of u.actor)
  |((~(has in muted) ref) (~(has in blocked) ref))
::  user-actor-prefs-fact: ONE authoritative snapshot of the real user's actor mute/block
::  prefs (full lists), replayed on watch and after every mutation. paths picks the wire.
++  user-actor-prefs-fact
  |=  $:  paths=(list path)
          muted=(set actor-ref:noltbook)
          blocked=(set actor-ref:noltbook)
      ==
  ^-  card
  =/  upd=update:noltbook  [%user-actor-preferences ~(tap in muted) ~(tap in blocked)]
  [%give %fact paths %noltbook-update !>(upd)]
::  api-parse-actor-ref: validate a raw [host,desk,id] from the API into a typed ref.
::  host=@p (else invalid-ship); desk=@tas + id non-empty <=128B (else invalid-actor).
::  The target need NOT exist locally (remote actors are valid; no TOFU/last-seen).
++  api-parse-actor-ref
  |=  [host=@t desk=@t id=@t]
  ^-  (each actor-ref:noltbook [code=@tas msg=@t])
  =/  hp=(unit @p)  (slaw %p host)
  ?~  hp  [%.n %invalid-ship 'host is not a valid @p']
  =/  dt=(unit @tas)  (rush desk sym)
  ?~  dt  [%.n %invalid-actor 'desk is not a valid @tas']
  ?:  |(=(0 (met 3 id)) (gth (met 3 id) 128))  [%.n %invalid-actor 'id empty or too long']
  [%.y u.hp u.dt id]
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
::  valid-desk-str: a safe desk term for a plugin descriptor — lowercase/digits/hyphen,
::  1..64 chars. Mirrors the frontend plugin-publish desk rule. Never run/installed here.
++  valid-desk-str
  |=  s=@t
  ^-  ?
  =/  t=tape  (trip s)
  ?:  =(~ t)  %.n
  ?:  (gth (lent t) 64)  %.n
  %+  levy  t
  |=  c=@tD
  ?|  &((gte c 'a') (lte c 'z'))
      &((gte c '0') (lte c '9'))
      =('-' c)
  ==
::  valid-app-artifact-content: accept a member-posted %app artifact ONLY if its content is
::  a small, well-formed Noltbook plugin DESCRIPTOR (a reference, not executable content).
::  The host validates + records; it never runs the app or owns its compute. Shape:
::    { "noltbookApp": 1, "app": { "desk": <safe-desk>, "publisher"?: null | "~ship" },
::      "data": <any json within the total cap> }
::  Conservative 64KB cap matching the frontend plugin-publish cap.
++  valid-app-artifact-content
  |=  content=@t
  ^-  ?
  ?:  (gth (met 3 content) 65.536)  %.n
  =/  jon-u=(unit json)  (de:json:html content)
  ?~  jon-u  %.n
  ?.  ?=([%o *] u.jon-u)  %.n
  =/  obj  p.u.jon-u
  ::  noltbookApp: 1
  ::  noltbookApp marker: accept numeric 1 or string "1"; reject anything else (or absence).
  =/  flag-u  (~(get by obj) 'noltbookApp')
  ?~  flag-u  %.n
  ?.  ?|  ?&(?=([%n *] u.flag-u) =('1' p.u.flag-u))
          ?&(?=([%s *] u.flag-u) =('1' p.u.flag-u))
      ==
    %.n
  ::  app: { desk, publisher? }
  =/  app-u  (~(get by obj) 'app')
  ?~  app-u  %.n
  ?.  ?=([%o *] u.app-u)  %.n
  =/  ao  p.u.app-u
  =/  desk-u  (~(get by ao) 'desk')
  ?~  desk-u  %.n
  ?.  ?=([%s *] u.desk-u)  %.n
  ?.  (valid-desk-str p.u.desk-u)  %.n
  ::  publisher optional: absent, JSON null, or a parseable ship string
  =/  pub-u  (~(get by ao) 'publisher')
  ?~  pub-u  %.y
  =/  pv=json  u.pub-u
  ?~  pv  %.y
  ?.  ?=([%s *] pv)  %.n
  !=(~ (slaw %p p.pv))
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
::  always %group. Creator = forker. Users are supplied by the caller; fork
::  creation now passes only the forker, invitees join on accept. removed
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
  ^-  state-64
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
::  mention-cleared: has this (msg-id,eid) mention already been cleared for a note?
::  `cur` is cleared-mentions[nid]. eid-first match (also matches id-only tombstones);
::  msg-id fallback when no eid. Durable so refetched gossip text can't recreate it.
++  mention-cleared
  |=  [cur=(list [id=@da eid=(unit @uv)]) id=@da eid=(unit @uv)]
  ^-  ?
  ?:  ?=(^ eid)
    %+  lien  cur
    |=  [cid=@da ceid=(unit @uv)]
    |(&(?=(^ ceid) =(u.ceid u.eid)) =(cid id))
  %+  lien  cur
  |=  [cid=@da ceid=(unit @uv)]
  =(cid id)
::  put-cleared-mention: record a cleared key, deduped by eid (or msg-id).
++  put-cleared-mention
  |=  [cm=(map @ta (list [id=@da eid=(unit @uv)])) nid=@ta id=@da eid=(unit @uv)]
  ^-  (map @ta (list [id=@da eid=(unit @uv)]))
  =/  cur=(list [id=@da eid=(unit @uv)])  (fall (~(get by cm) nid) ~)
  ?:  (mention-cleared cur id eid)  cm
  (~(put by cm) nid (snoc cur [id eid]))
::  ===== Developer API v1 (%noltbook-api) helpers =====
++  api-da-ms
  |=  t=@da  ^-  @ud
  (div (sub t ~1970.1.1) (div ~s1 1.000))
::  percent-encode a name for the ~app[...] token (RFC3986 unreserved kept).
++  api-pct-encode
  |=  t=@t  ^-  @t
  %-  crip  %-  zing
  %+  turn  (trip t)
  |=  c=@tD  ^-  tape
  ?:  ?|  &((gte c 'a') (lte c 'z'))
          &((gte c 'A') (lte c 'Z'))
          &((gte c '0') (lte c '9'))
          =(c '-')  =(c '_')  =(c '.')  =(c '~')
      ==
    ~[c]
  =/  hex=@t  '0123456789ABCDEF'
  :~  '%'
      (cut 3 [(rsh 2 c) 1] hex)
      (cut 3 [(dis c 0xf) 1] hex)
  ==
::  build ~app[~publisher|%desk|Encoded%20Name]; ensure ~ on publisher, strip % on desk.
::  validate + build the ref. publisher must parse as @p (with or without ~);
::  desk must be a bare term (accepts a leading %); name defaults to desk when
::  empty and is percent-encoded. Returns ~ on invalid input (no ref built).
++  api-app-ref
  |=  [pub=@t dsk=@t nm=@t]  ^-  (each @t @tas)
  =/  pl=tape  (trip pub)
  =/  pbare=@t  ?:(?=([%'~' *] pl) (crip t.pl) pub)
  =/  shp=(unit @p)  (rush pbare fed:ag)
  ?~  shp  [%.n %invalid-publisher]
  =/  dl=tape  (trip dsk)
  =/  dbare=@t  ?:(?=([%'%' *] dl) (crip t.dl) dsk)
  =/  dsym=(unit term)  (rush dbare sym)
  ?~  dsym  [%.n %invalid-desk]
  =/  nm2=@t  ?:(=(0 (met 3 nm)) `@t`u.dsym nm)
  [%.y (crip "~app[{(scow %p u.shp)}|%{(trip u.dsym)}|{(trip (api-pct-encode nm2))}]")]
::  api-result-card: build the /api/results fact, but only when a request-id was
::  supplied (request/response is opt-in; absent request-id = silent, as before).
++  api-result-card
  |=  $:  rid=(unit @ud)  ok=?  code=@tas  message=@t
          note-id=(unit @ta)  msg-id=(unit @da)  eid=(unit @uv)
      ==
  ^-  (list card:agent:gall)
  ?~  rid  ~
  =/  upd=update:noltbook  [%api-result u.rid ok code message note-id msg-id eid ~ ~]
  ~[[%give %fact ~[/api/results] %noltbook-update !>(upd)]]
::  api-pin-msg: human-readable message for a pin/unpin failure code.
::  api-pin-msg: human-readable message for a set/clear-note-pin failure code.
++  api-pin-msg
  |=  code=@tas
  ^-  @t
  ?+  code            'pin error'
    %missing-note     'no such note'
    %unsupported      'note type does not support pins'
    %rejected         'only the note creator can set the pin'
    %invalid-target   'target eid / kind could not be parsed'
    %missing-target   'no matching message or file/app artifact in this note'
  ==
::  api-art-result-card: result fact for create-artifact, carrying artifact-id
::  (msg-id is always ~ for artifacts).
++  api-art-result-card
  |=  $:  rid=(unit @ud)  ok=?  code=@tas  message=@t
          note-id=(unit @ta)  eid=(unit @uv)  artifact-id=(unit @ta)
      ==
  ^-  (list card:agent:gall)
  ?~  rid  ~
  =/  upd=update:noltbook  [%api-result u.rid ok code message note-id ~ eid artifact-id ~]
  ~[[%give %fact ~[/api/results] %noltbook-update !>(upd)]]
::  api-call-result-card: result fact for call controls, carrying call-id.
++  api-call-result-card
  |=  $:  rid=(unit @ud)  ok=?  code=@tas  message=@t
          note-id=(unit @ta)  call-id=(unit @ta)
      ==
  ^-  (list card:agent:gall)
  ?~  rid  ~
  =/  upd=update:noltbook  [%api-result u.rid ok code message note-id ~ ~ ~ call-id]
  ~[[%give %fact ~[/api/results] %noltbook-update !>(upd)]]
::  api-call-json: stable read shape for a call (Phase 18).
++  api-call-json
  |=  c=call-info:noltbook  ^-  json
  %-  pairs:enjs:format
  :~  ['callId' s+(crip (trip call-id.c))]
      ['noteId' s+(crip (trip note-id.c))]
      ['startedBy' s+(scot %p started-by.c)]
      ['started' (numb:enjs:format (api-da-ms started.c))]
      ['participants' a+(turn ~(tap in participants.c) |=(p=@p `json`s+(scot %p p)))]
      ['status' s+(crip (trip (scot %tas status.c)))]
  ==
::  api-search-scan: pure case-insensitive substring scan over messages, shared by
::  the sidebar %search-messages handler and the API search action. only-note
::  restricts to one note (missing => no hits). Skips cover/ars-rumors, missing
::  notes, and blocked authors; user-gossip stays searchable. Returns top `cap`
::  (default/hard-cap 50) by recency + whether the full result set was capped.
++  api-search-scan
  |=  $:  query=@t  limit=@ud  only-note=(unit @ta)
          messages=(map @ta (list message:noltbook))
          notes=(map @ta note:noltbook)  blocked=(set @p)
      ==
  ^-  [hits=(list search-msg-hit:noltbook) capped=?]
  =/  q-tape=tape  (cass (trip query))
  =/  hard-cap=@ud  50
  =/  cap=@ud  ?:(=(0 limit) hard-cap (min limit hard-cap))
  =/  pairs=(list [@ta (list message:noltbook)])
    ?~  only-note  ~(tap by messages)
    =/  m  (~(get by messages) u.only-note)
    ?~(m ~ ~[[u.only-note u.m]])
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
      ?:  (~(has in blocked) author.i.ms)
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
  [(scag cap sorted) (gth (lent sorted) cap)]
::  api-send-confirm: precompute the msg id (@da = now) and eid the internal
::  %send-message will mint THIS event (same now/our, same pre-mutation
::  seq-counters), plus an honest code: %posted when the message is stored
::  locally (dm/gossip/cover/rumors, or a note we host), %forwarded when it is
::  sent to a remote host (regular/group note we don't host) and could still be
::  rejected. Mirrors app/noltbook %send-message id/eid/seq logic exactly.
::  api-dm-blocked: replicate the internal %send-message DM block guard — a DM
::  send to a blocked counterparty silently no-ops, so we report it as rejected.
++  api-dm-blocked
  |=  [nid=@ta nt=note:noltbook our=@p blocked=(set @p)]
  ^-  ?
  ?.  =(%dm type.nt)  %.n
  =/  others=(list @p)  (skim ~(tap in users.nt) |=(p=@p !=(p our)))
  ?~  others  %.n
  (~(has in blocked) i.others)
++  api-send-confirm
  |=  [nid=@ta nt=note:noltbook our=@p now=@da seqs=(map @ta @ud)]
  ^-  [code=@tas mid=(unit @da) eid=(unit @uv)]
  =/  is-regular=?  !=(nid %ars-rumors)
  =/  cur-seq=@ud  (fall (~(get by seqs) nid) 0)
  =/  nxt-seq=@ud  ?:(is-regular +(cur-seq) 0)
  =/  eid=(unit @uv)  ?:(is-regular `(sham [our now nxt-seq]) ~)
  =/  stored-local=?
    ?|  =(%dm type.nt)  =(%gossip type.nt)
        =(nid %cover)  =(nid %ars-rumors)  =(our creator.nt)
    ==
  [?:(stored-local %posted %forwarded) `now eid]
::  api-resolve-msg: eid-first, msgId-fallback target resolution, matching the
::  internal %edit-message/%delete-message handlers exactly, so the message we
::  resolve (and report) is the one they will actually touch. ~ if none match
::  (also covers the "neither eid nor msgId supplied" case).
++  api-resolve-msg
  |=  [msgs=(list message:noltbook) eid=(unit @uv) mid=(unit @da)]
  ^-  (unit message:noltbook)
  =/  by-id=(list message:noltbook)
    ?~  mid  ~
    (skim msgs |=(m=message:noltbook =(id.m u.mid)))
  ?^  eid
    =/  by-eid=(list message:noltbook)
      (skim msgs |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid))))
    ?^  by-eid  `i.by-eid
    ?~(by-id ~ `i.by-id)
  ?~(by-id ~ `i.by-id)
::  find an app-owned (creator=our) note by exact name.
++  api-find-note-by-name
  |=  [nm=@t nts=(map @ta note:noltbook) us=@p]  ^-  (unit @ta)
  =/  hits=(list [@ta note:noltbook])
    %+  skim  ~(tap by nts)
    |=([k=@ta n=note:noltbook] &(=(name.n nm) =(creator.n us)))
  ?~  hits  ~
  `-.i.hits
::  find a locally-owned %gossip note by exact name (Phase 16).
++  api-find-gossip-by-name
  |=  [nm=@t nts=(map @ta note:noltbook) us=@p]  ^-  (unit @ta)
  =/  hits=(list [@ta note:noltbook])
    %+  skim  ~(tap by nts)
    |=([k=@ta n=note:noltbook] &(=(name.n nm) =(creator.n us) =(%gossip type.n)))
  ?~  hits  ~
  `-.i.hits
::  STABLE api read shapes (decoupled from the internal update enjs).
++  api-note-json
  ::  1B.2: lcount is the LOGICAL human-member count (not ~(wyt in users.n) transport).
  |=  [n=note:noltbook app=(unit app-note-meta:noltbook) active=(unit note-active:noltbook) now=@da lcount=@ud]  ^-  json
  %-  pairs:enjs:format
  :~  ['id' s+(crip (trip id.n))]
      ['name' s+name.n]
      ['type' s+(crip (trip (scot %tas type.n)))]
      ['creator' s+(scot %p creator.n)]
      ['visibility' s+(crip (trip (scot %tas visibility.n)))]
      ['userCount' (numb:enjs:format lcount)]
      ['lastPreview' ?~(last-preview.n ~ s+u.last-preview.n)]
      ['app' (api-app-json app)]
      ['active' (api-active-json active now)]
  ==
::  api-actor-note-summary (Phase G2): one note as seen through an actor's scoped
::  /notes read. owned/participant flag WHY it is visible. No artifact data here.
++  api-actor-note-summary
  |=  $:  n=note:noltbook  owned=?  participant=?
          owner=(unit actor-owner:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
          dm=(unit actor-dm-meta:noltbook)
          activity=@da  read=@da  lcount=@ud
      ==
  ^-  json
  %-  pairs:enjs:format
  :~  ['id' s+(crip (trip id.n))]
      ['name' s+name.n]
      ['type' s+(crip (trip (scot %tas type.n)))]
      ['creator' s+(scot %p creator.n)]
      ['visibility' s+(crip (trip (scot %tas visibility.n)))]
      ['writable' b+writable.n]
      ::  1B.3: logical human count (0 for a fresh actor note; transport host excluded).
      ['userCount' (numb:enjs:format lcount)]
      ['lastAuthor' ?~(last-author.n ~ s+(scot %p u.last-author.n))]
      ['lastPreview' ?~(last-preview.n ~ s+u.last-preview.n)]
      ['actorOwner' (api-actor-owner-json owner registry)]
      ['actorDm' ?~(dm ~ (api-actor-dm-json u.dm))]
      ['owned' b+owned]
      ['participant' b+participant]
      ::  G6A: actor-scoped unread (MESSAGE-only newest vs this actor's cursor; ms).
      ['activity' ?:(=(`@da`0 activity) ~ (numb:enjs:format (api-da-ms activity)))]
      ['read' ?:(=(`@da`0 read) ~ (numb:enjs:format (api-da-ms read)))]
      ['unread' b+(gth activity read)]
  ==
::  api-app-json: stable read shape for durable app-note metadata. null when the
::  note has no association. createdBy/createdAt are server-stamped.
++  api-app-json
  |=  app=(unit app-note-meta:noltbook)
  ^-  json
  ?~  app  ~
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.u.app)]
      ['title' ?~(title.u.app ~ s+u.title.u.app)]
      ['publisher' ?~(publisher.u.app ~ s+(scot %p u.publisher.u.app))]
      ['tag' ?~(tag.u.app ~ s+u.tag.u.app)]
      ['template' ?~(template.u.app ~ s+(scot %tas u.template.u.app))]
      ['createdBy' s+(scot %p created-by.u.app)]
      ['createdAt' (numb:enjs:format (api-da-ms created-at.u.app))]
  ==
::  api-active-json: stable read shape for a note's "active" status. null when absent
::  OR expired (expires-at <= now) — stale heartbeats never read as live.
++  api-active-json
  |=  [active=(unit note-active:noltbook) now=@da]
  ^-  json
  ?~  active  ~
  ?:  (lte expires-at.u.active now)  ~
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.u.active)]
      ['title' ?~(title.u.active ~ s+u.title.u.active)]
      ['publisher' ?~(publisher.u.active ~ s+(scot %p u.publisher.u.active))]
      ['label' s+label.u.active]
      ['count' ?~(count.u.active ~ (numb:enjs:format u.count.u.active))]
      ['setBy' s+(scot %p set-by.u.active)]
      ['updatedAt' (numb:enjs:format (api-da-ms updated-at.u.active))]
      ['expiresAt' (numb:enjs:format (api-da-ms expires-at.u.active))]
  ==
::  api-pin-json: stable read shape for a note's one pin. null when none. Resolves
::  the target at read time: %message -> messageId/author/preview/timestamp; %artifact
::  -> artifactId/artifactName/artifactType. Resolved fields are null if the target is
::  gone (the host prunes the pin on delete, so that's a transient race window only).
++  api-pin-json
  |=  $:  pin=(unit note-pin:noltbook)  nid=@ta
          msgs=(map @ta (list message:noltbook))
          arts=(map @ta artifact:noltbook)
      ==
  ^-  json
  ?~  pin  ~
  ?:  =(%message kind.u.pin)
    =/  hit=(list message:noltbook)
      %+  skim  (fall (~(get by msgs) nid) ~)
      |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m target.u.pin)))
    =/  m=(unit message:noltbook)  ?~(hit ~ `i.hit)
    %-  pairs:enjs:format
    :~  ['target' s+(scot %uv target.u.pin)]
        ['kind' s+(crip (trip (scot %tas kind.u.pin)))]
        ['pinnedBy' s+(scot %p pinned-by.u.pin)]
        ['pinnedAt' (numb:enjs:format (api-da-ms pinned-at.u.pin))]
        ['messageId' ?~(m ~ (numb:enjs:format (api-da-ms id.u.m)))]
        ['author' ?~(m ~ s+(scot %p author.u.m))]
        ['preview' ?~(m ~ s+(crip (scag 140 (trip text.u.m))))]
        ['timestamp' ?~(m ~ (numb:enjs:format (api-da-ms timestamp.u.m)))]
    ==
  =/  hit=(list artifact:noltbook)
    %+  skim  ~(val by arts)
    |=(a=artifact:noltbook ?&(=(note-id.a nid) ?~(meta.a %.n =(eid.u.meta.a target.u.pin))))
  =/  art=(unit artifact:noltbook)  ?~(hit ~ `i.hit)
  %-  pairs:enjs:format
  :~  ['target' s+(scot %uv target.u.pin)]
      ['kind' s+(crip (trip (scot %tas kind.u.pin)))]
      ['pinnedBy' s+(scot %p pinned-by.u.pin)]
      ['pinnedAt' (numb:enjs:format (api-da-ms pinned-at.u.pin))]
      ['artifactId' ?~(art ~ s+(crip (trip id.u.art)))]
      ['artifactName' ?~(art ~ s+name.u.art)]
      ['artifactType' ?~(art ~ s+(crip (trip (scot %tas type.u.art))))]
  ==
::  api-via-json: durable "via app" attribution for an entry, joined by its eid.
::  null when there's no eid or no row. ship is the authoring user's ship.
++  api-via-json
  |=  [eid=(unit @uv) vmap=via-map:noltbook]
  ^-  json
  ?~  eid  ~
  =/  v  (~(get by vmap) u.eid)
  ?~  v  ~
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.u.v)]
      ['title' ?~(title.u.v ~ s+u.title.u.v)]
      ['publisher' ?~(publisher.u.v ~ s+(scot %p u.publisher.u.v))]
      ['ship' s+(scot %p ship.u.v)]
  ==
::  api-via-put: record attribution for a just-stored message, keyed by its eid,
::  when via is present and the message carries an eid. No-op otherwise. Used at
::  every point a message is durably stored (Phase 11B propagation).
++  api-via-put
  |=  [vmap=via-map:noltbook via=(unit via-app:noltbook) m=message:noltbook]
  ^-  via-map:noltbook
  ?~  via  vmap
  ?~  meta.m  vmap
  (~(put by vmap) eid.u.meta.m u.via)
::  api-via-put-env: record an envelope's via against its eid (gossip/cover).
++  api-via-put-env
  |=  [vmap=via-map:noltbook e=envelope:noltbook]
  ^-  via-map:noltbook
  ?~  via.e  vmap
  ?~  meta.e  vmap
  (~(put by vmap) eid.u.meta.e u.via.e)
::  api-via-put-envs: fold api-via-put-env over a list (envelope-list snapshots).
++  api-via-put-envs
  |=  [vmap=via-map:noltbook envs=(list envelope:noltbook)]
  ^-  via-map:noltbook
  ?~  envs  vmap
  $(envs t.envs, vmap (api-via-put-env vmap i.envs))
::  api-env-of: build an envelope from a message, recovering via from via-by-eid
::  by eid (so msg->envelope projections keep attribution durable).
++  api-env-of
  |=  [m=message:noltbook vmap=via-map:noltbook]
  ^-  envelope:noltbook
  =/  v=(unit via-app:noltbook)  ?~(meta.m ~ (~(get by vmap) eid.u.meta.m))
  [author.m id.m timestamp.m reply-to.m (sham text.m) meta.m v]
::  api-env-hydrate: fill a stored envelope's missing via from via-by-eid by eid,
::  so served/re-relayed envelopes don't permanently lose attribution. Unchanged
::  when via is already set, there's no meta/eid, or there's no row.
++  api-env-hydrate
  |=  [e=envelope:noltbook vmap=via-map:noltbook]
  ^-  envelope:noltbook
  ?^  via.e  e
  ?~  meta.e  e
  =/  v  (~(get by vmap) eid.u.meta.e)
  ?~(v e e(via v))
++  api-envs-hydrate
  |=  [es=(list envelope:noltbook) vmap=via-map:noltbook]
  ^-  (list envelope:noltbook)
  (turn es |=(e=envelope:noltbook (api-env-hydrate e vmap)))
::  api-via-snapshot: collect ONLY the via rows referenced by the eids of the
::  messages/artifacts in a snapshot (never the whole global map). Used to make
::  attribution durable across %message-list snapshots (Phase 11B hardening).
++  api-via-snapshot
  |=  [msgs=(list message:noltbook) arts=(list artifact:noltbook) vmap=via-map:noltbook]
  ^-  via-map:noltbook
  =/  eids=(list @uv)
    %-  zing
    :~  (murn msgs |=(m=message:noltbook ?~(meta.m ~ `eid.u.meta.m)))
        (murn arts |=(a=artifact:noltbook ?~(meta.a ~ `eid.u.meta.a)))
    ==
  %-  ~(gas by *via-map:noltbook)
  %+  murn  eids
  |=  e=@uv
  ^-  (unit [@uv via-app:noltbook])
  =/  v  (~(get by vmap) e)
  ?~(v ~ `[e u.v])
::  api-actor-json: app-scoped actor identity for an entry, joined by its eid.
::  null when there's no eid or no row. host is the server-stamped authoring ship.
++  api-actor-json
  |=  [eid=(unit @uv) amap=actor-map:noltbook]
  ^-  json
  ?~  eid  ~
  =/  a  (~(get by amap) u.eid)
  ?~  a  ~
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host.u.a)]
      ['desk' s+(scot %tas desk.u.a)]
      ['id' s+id.u.a]
      ['name' s+name.u.a]
      ['kind' s+(scot %tas kind.u.a)]
  ==
::  actor-ref-json (Phase G6B): a bare actor [host desk id name kind] as JSON. Mirrored
::  field-for-field by mar/update for the live notification event.
++  actor-ref-json
  |=  a=actor:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host.a)]
      ['desk' s+(scot %tas desk.a)]
      ['id' s+id.a]
      ['name' s+name.a]
      ['kind' s+(scot %tas kind.a)]
  ==
::  api-actor-notif-json (Phase G6B): a resolved reply notification view as JSON.
::  Mirrored by mar/update so the read route and the live event share one shape.
++  api-actor-notif-json
  |=  v=actor-notification-view:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['kind' s+(scot %tas kind.v)]
      ['noteId' s+(crip (trip note-id.v))]
      ['eid' s+(scot %uv eid.v)]
      ['msgId' s+(scot %da msg-id.v)]
      ['author' s+(scot %p author.v)]
      ['actor' ?~(actor.v ~ (actor-ref-json u.actor.v))]
      ['preview' s+preview.v]
      ['timestamp' (numb:enjs:format (api-da-ms timestamp.v))]
  ==
::  api-actor-put: record an actor for a just-stored message, keyed by its eid,
::  when actor is present and the message carries an eid. No-op otherwise.
::  Mirrors api-via-put; used at every durable store on direct-note paths.
++  api-actor-put
  |=  [amap=actor-map:noltbook actor=(unit actor:noltbook) m=message:noltbook]
  ^-  actor-map:noltbook
  ?~  actor  amap
  ?~  meta.m  amap
  (~(put by amap) eid.u.meta.m u.actor)
::  api-actor-snapshot: collect ONLY the actor rows referenced by the eids of the
::  messages in a snapshot (never the whole global map). Artifacts carry no actor
::  in v1, so only messages are scanned. Mirrors api-via-snapshot.
++  api-actor-snapshot
  |=  [msgs=(list message:noltbook) amap=actor-map:noltbook]
  ^-  actor-map:noltbook
  =/  eids=(list @uv)
    (murn msgs |=(m=message:noltbook ?~(meta.m ~ `eid.u.meta.m)))
  %-  ~(gas by *actor-map:noltbook)
  %+  murn  eids
  |=  e=@uv
  ^-  (unit [@uv actor:noltbook])
  =/  a  (~(get by amap) e)
  ?~(a ~ `[e u.a])
::  gate-actor (Actor Control Phase A): host governance for a well-formed actor
::  on an allowed note. Returns the stamped actor + updated registry on success,
::  or a rejection code. Local apps only (host == our). Rules:
::    no grant / disabled / no %attribute cap  => reject (post denied)
::    unknown [desk id]                          => TOFU, auto-register %active
::    %suspended / %revoked                      => reject (post denied)
::    %active                                    => accept, bump last-seen
::  gate-actor-cap (Phase C): governance + capability check. The app grant is the
::  CEILING — every cap in `need` must be in app-grant.caps. Per-actor caps narrow
::  within it: ~ inherits (ceiling already enforced), [set] must also contain every
::  needed cap. suspended/revoked blocks everything. Unknown [desk id] => TOFU
::  registers active with caps=~ (inherit). `need` = caps this action requires.
++  gate-actor-cap
  |=  $:  our=@p  now=@da
          desk=@tas  id=@t  name=@t  kind=?(%user %bot %app)
          need=(set app-cap:noltbook)
          grants=(map @tas app-grant:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
      ==
  ^-  %+  each
        [actor=actor:noltbook registry=(map [@tas @t] actor-record:noltbook)]
      [code=@tas msg=@t]
  =/  g  (~(get by grants) desk)
  ?~  g  [%.n %app-not-granted 'app has no actor grant']
  ?.  enabled.u.g  [%.n %app-disabled 'app grant disabled']
  ::  app grant ceiling: every needed cap must be granted to the app.
  =/  app-miss  (~(dif in need) caps.u.g)
  ?^  app-miss
    [%.n %cap-missing (cat 3 'app lacks %' (scot %tas n.app-miss))]
  =/  key  [desk id]
  =/  rec  (~(get by registry) key)
  ?~  rec
    ::  TOFU: first attributed action auto-registers an active actor (caps=~
    ::  inherit), initializing name/kind from this (valid) request.
    =/  ax=actor:noltbook  [our desk id name kind]
    =/  nr=actor-record:noltbook  [id name kind %active now now ~ now ~]
    [%.y ax (~(put by registry) key nr)]
  ?:  ?=(%suspended status.u.rec)  [%.n %actor-suspended 'actor suspended']
  ?:  ?=(%revoked status.u.rec)    [%.n %actor-revoked 'actor revoked']
  ::  per-actor caps narrow within the grant: ~ inherits; [set] must contain need.
  =/  act-miss=(set app-cap:noltbook)
    ?~(caps.u.rec ~ (~(dif in need) u.caps.u.rec))
  ?^  act-miss
    [%.n %cap-missing (cat 3 'actor lacks %' (scot %tas n.act-miss))]
  ::  CANONICAL identity (Phase F1): the registry's name/kind win for an existing
  ::  actor — request-supplied name/kind are IGNORED here, so a stale poke can't
  ::  rewrite the actor's display values. Only last-seen/updated-at advance; the
  ::  returned stamp uses the canonical record values. (update-actor / update-actor
  ::  -profile are the explicit paths to change name; history is never rewritten.)
  =/  ax=actor:noltbook  [our desk id name.u.rec kind.u.rec]
  =/  nr=actor-record:noltbook
    u.rec(last-seen now, updated-at now)
  [%.y ax (~(put by registry) key nr)]
::  gate-actor-owns (Actor Tools Phase B): resolve a target message and verify the
::  supplied app+actor OWNS it — the stored actor-by-eid row matches
::  [our, app.desk, actor.id] — THEN run normal governance (gate-actor). Match is
::  checked BEFORE gate so an unrelated actor never TOFU-registers against an old
::  message. Returns the resolved target + its eid + updated registry, or a code.
++  gate-actor-owns
  |=  $:  our=@p  now=@da
          app=(unit api-app:noltbook)  act=(unit api-actor:noltbook)
          msgs=(list message:noltbook)
          eid=(unit @uv)  mid=(unit @da)
          need=(set app-cap:noltbook)
          grants=(map @tas app-grant:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
          amap=actor-map:noltbook
      ==
  ^-  %+  each
        [target=message:noltbook eid=@uv registry=(map [@tas @t] actor-record:noltbook)]
      [code=@tas msg=@t]
  ?~  app  [%.n %actor-invalid 'app required']
  ?~  act  [%.n %actor-invalid 'actor required']
  ?.  ?=(?(%user %bot %app) kind.u.act)  [%.n %actor-invalid 'bad actor kind']
  =/  tgt  (api-resolve-msg msgs eid mid)
  ?~  tgt  [%.n %missing-target 'no matching message']
  ?~  meta.u.tgt  [%.n %missing-target 'message has no eid']
  =/  teid=@uv  eid.u.meta.u.tgt
  =/  stored  (~(get by amap) teid)
  ?~  stored  [%.n %actor-missing 'message has no actor']
  ?.  ?&  =(host.u.stored our)
          =(desk.u.stored desk.u.app)
          =(id.u.stored id.u.act)
      ==
    [%.n %actor-mismatch 'actor does not own this message']
  ::  governance + capability on the matched [desk id]: gate-actor-cap cannot TOFU
  ::  here (a stored row implies prior registration); it enforces grant/disabled/
  ::  suspended/revoked AND the required caps (app ceiling + per-actor narrowing).
  =/  g  (gate-actor-cap our now desk.u.app id.u.act name.u.act kind.u.act need grants registry)
  ?-  -.g
    %.n  [%.n p.g]
    %.y  [%.y u.tgt teid registry.p.g]
  ==
::  actor-member-pre (Actor Member Management Phase E): shared gate for the six
::  actor member actions. Verifies app+actor, EXACT note ownership, governance
::  (%attribute %manage-members), a parsed target ship, write-blocked, non-DM, and
::  host-protection. Returns [who target-note updated-registry] or a failure code.
::  Per-action target-state checks (already-member, in-requests, etc.) stay in the
::  branch; the internal mutation handlers are reused unchanged.
++  actor-member-pre
  |=  $:  our=@p  now=@da
          app=(unit api-app:noltbook)  act=(unit api-actor:noltbook)
          nid=@ta  ship-txt=@t
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
          grants=(map @tas app-grant:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
          dms=(map @ta actor-dm-meta:noltbook)
          nmuted=(map @ta (set actor-ref:noltbook))
      ==
  ^-  %+  each
        [who=@p nt=note:noltbook registry=(map [@tas @t] actor-record:noltbook)]
      [code=@tas msg=@t]
  ?~  app  [%.n %actor-invalid 'app required']
  ?~  act  [%.n %actor-invalid 'actor required']
  ?.  ?=(?(%user %bot %app) kind.u.act)  [%.n %actor-invalid 'bad actor kind']
  ::  Phase G5A: actor member-management cannot touch an actor-DM note (its two-ship
  ::  membership is invariant-bound — no third ship, no generic member ops).
  ?:  (~(has by dms) nid)  [%.n %unsupported 'cannot manage members of an actor-DM note']
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note 'no such note']
  =/  nt=note:noltbook  u.nt-u
  ::  exact ownership FIRST (stable [host desk id]); a different actor sharing the
  ::  same desk/host, or an ordinary host note, is rejected here.
  =/  owner  (~(get by owners) nid)
  ?.  ?&  ?=(^ owner)
          =(host.u.owner our)
          =(desk.u.owner desk.u.app)
          =(id.u.owner id.u.act)
      ==
    [%.n %actor-not-owner 'actor does not own this note']
  ::  A1.3a: a muted acting owner cannot manage human members either.
  ?:  (~(has in (fall (~(get by nmuted) nid) ~)) [our desk.u.app id.u.act])
    [%.n %note-actor-muted 'acting actor is muted in this note']
  ::  governance: app ceiling + per-actor narrow + status (attribute + manage-members).
  =/  g  (gate-actor-cap our now desk.u.app id.u.act name.u.act kind.u.act (sy ~[%attribute %manage-members]) grants registry)
  ?:  ?=(%.n -.g)  [%.n p.g]
  =/  who=(unit @p)  (slaw %p ship-txt)
  ?~  who  [%.n %invalid-ship 'ship did not parse']
  ?:  (is-write-blocked nid hs nmap our)  [%.n %rejected 'write blocked']
  ?:  =(%dm type.nt)  [%.n %rejected 'cannot manage DM members']
  ?:  =(u.who our)  [%.n %rejected 'cannot target the host']
  [%.y u.who nt registry.p.g]
::  actor-muted (Phase A1): is the exact full actor ref banned from writing in nid?
++  actor-muted
  |=  [nid=@ta ref=actor-ref:noltbook nmuted=(map @ta (set actor-ref:noltbook))]
  ^-  ?
  (~(has in (fall (~(get by nmuted) nid) ~)) ref)
::  put/del-actor-row (Phase A1): add/remove an actor ref in a per-note ref-set map
::  (roster / requests / note-actor-muted). del drops empty rows; put never stores empty.
++  put-actor-row
  |=  [nid=@ta ref=actor-ref:noltbook m=(map @ta (set actor-ref:noltbook))]
  ^-  (map @ta (set actor-ref:noltbook))
  (~(put by m) nid (~(put in (fall (~(get by m) nid) ~)) ref))
++  del-actor-row
  |=  [nid=@ta ref=actor-ref:noltbook m=(map @ta (set actor-ref:noltbook))]
  ^-  (map @ta (set actor-ref:noltbook))
  =/  s=(set actor-ref:noltbook)  (~(del in (fall (~(get by m) nid) ~)) ref)
  ?:  =(~ s)  (~(del by m) nid)
  (~(put by m) nid s)
::  sweep-actor-requests (A1.3a): remove an actor ref from EVERY per-note request set
::  (used on revoke), dropping any row that becomes empty. Roster/mute/history untouched.
++  sweep-actor-requests
  |=  [ref=actor-ref:noltbook reqs=(map @ta (set actor-ref:noltbook))]
  ^-  (map @ta (set actor-ref:noltbook))
  %-  ~(rep by reqs)
  |=  [[nid=@ta s=(set actor-ref:noltbook)] acc=(map @ta (set actor-ref:noltbook))]
  =/  s2=(set actor-ref:noltbook)  (~(del in s) ref)
  ?:  =(~ s2)  acc
  (~(put by acc) nid s2)
::  tdesk-resolve (A1.3b): the STRICT three-state target desk -> (unit @tas). ~ means
::  reject (actor-invalid). %default -> the owner app desk only when allow-default.
++  tdesk-resolve
  |=  [spec=tdesk-spec:noltbook default-desk=@tas allow-default=?]
  ^-  (unit @tas)
  ?-  spec
    [%set *]  `desk.spec
    %invalid  ~
    %default  ?:(allow-default `default-desk ~)
  ==
::  host-actor-pre (A1.3b): ordinary-host moderation authority over an ORDINARY note
::  (NO actor owner). Local + eligible + not-actor-DM + host/admin + write-block.
++  host-actor-pre
  |=  $:  our=@p  nid=@ta
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
          admins=(map @ta (set @p))
          dms=(map @ta actor-dm-meta:noltbook)
      ==
  ^-  (each note:noltbook [code=@tas msg=@t])
  ?:  (~(has by dms) nid)  [%.n %unsupported 'cannot manage an actor-DM note']
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note 'no such note']
  =/  nt=note:noltbook  u.nt-u
  ?.  ?|(=(%notebook type.nt) =(%group type.nt))
    [%.n %unsupported 'note type not eligible for actor participation']
  ?:  (~(has by owners) nid)
    [%.n %unsupported 'actor-owned note: use owner-actor or emergency controls']
  ?.  =(our creator.nt)
    [%.n %unsupported 'remote-hosted note: remote-admin forwarding deferred to A3']
  ?.  (has-mod-power our nid creator.nt admins)
    [%.n %rejected 'not host or admin']
  ?:  (is-write-blocked nid hs nmap our)  [%.n %rejected 'write blocked']
  [%.y nt]
::  emergency-actor-pre (A1.3b): EXPLICIT host emergency authority over an ACTOR-OWNED
::  note. Local + eligible + not-DM + has an actor owner + hosted by us + write-block.
::  Returns the note + the owner ref (so removal can reject it). NOT a fallback.
++  emergency-actor-pre
  |=  $:  our=@p  nid=@ta
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
          dms=(map @ta actor-dm-meta:noltbook)
      ==
  ^-  (each [nt=note:noltbook owner=actor-ref:noltbook] [code=@tas msg=@t])
  ?:  (~(has by dms) nid)  [%.n %unsupported 'cannot manage an actor-DM note']
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note 'no such note']
  =/  nt=note:noltbook  u.nt-u
  ?.  ?|(=(%notebook type.nt) =(%group type.nt))
    [%.n %unsupported 'note type not eligible for actor participation']
  =/  owner  (~(get by owners) nid)
  ?~  owner  [%.n %unsupported 'not an actor-owned note']
  ?.  =(host.u.owner our)  [%.n %rejected 'not the actor-note host']
  ?.  =(our creator.nt)  [%.n %rejected 'remote-hosted: emergency host control deferred to A3']
  ?:  (is-write-blocked nid hs nmap our)  [%.n %rejected 'write blocked']
  [%.y nt u.owner]
::  actor-manage-apply (A1.3b): the SHARED per-operation mutation for owner/host/emergency
::  actor management. Authority is gated by the CALLER; this validates target STATE per op
::  and returns the new maps + cards + result. Never TOFU-registers; never touches human
::  note-muted; preserves messages + attribution. Local refs only (tref.host == our).
++  actor-manage-apply
  |=  $:  our=@p  nid=@ta  op=@tas  tref=actor-ref:noltbook  nt=note:noltbook
          roster=(map @ta (set actor-ref:noltbook))
          requests=(map @ta (set actor-ref:noltbook))
          muted=(map @ta (set actor-ref:noltbook))
          read=(map [@tas @t] (map @ta @da))
          notifs=(map [@tas @t] (list actor-notification:noltbook))
          notes=(map @ta note:noltbook)
          msgs=(map @ta (list message:noltbook))
          registry=(map [@tas @t] actor-record:noltbook)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          abe=actor-map:noltbook
      ==
  ^-  $:  ok=?  code=@tas  msg=@t
          roster=(map @ta (set actor-ref:noltbook))
          requests=(map @ta (set actor-ref:noltbook))
          muted=(map @ta (set actor-ref:noltbook))
          read=(map [@tas @t] (map @ta @da))
          notifs=(map [@tas @t] (list actor-notification:noltbook))
          notes=(map @ta note:noltbook)
          cards=(list card:agent:gall)
      ==
  =/  tdesk=@tas  desk.tref
  =/  tid=@t  id.tref
  =/  in-roster=?  (~(has in (fall (~(get by roster) nid) ~)) tref)
  =/  in-requests=?  (~(has in (fall (~(get by requests) nid) ~)) tref)
  =/  in-muted=?  (~(has in (fall (~(get by muted) nid) ~)) tref)
  =/  trec  (~(get by registry) [tdesk tid])
  =/  base  [ok=%.y code=%ok msg='' roster=roster requests=requests muted=muted read=read notifs=notifs notes=notes cards=`(list card:agent:gall)`~]
  ?+  op  base(ok %.n, code %unsupported, msg 'unknown actor-manage op')
      %deny
    ?.  in-requests  base(ok %.n, code %missing-target, msg 'no pending actor request')
    base(requests (del-actor-row nid tref requests))
      %mute
    ?.  in-roster  base(ok %.n, code %actor-not-participant, msg 'target is not a participant')
    base(muted (put-actor-row nid tref muted))
      %unmute
    ?.  in-muted  base(ok %.n, code %missing-target, msg 'actor is not muted in this note')
    base(muted (del-actor-row nid tref muted))
      %remove
    ?.  in-roster  base(ok %.n, code %missing-target, msg 'target is not a participant')
    =/  new-notifs  (actor-notif-del-actor-note notifs tdesk tid nid)
    %=  base
      roster    (del-actor-row nid tref roster)
      muted     (del-actor-row nid tref muted)
      requests  (del-actor-row nid tref requests)
      read      (actor-read-del read tdesk tid nid)
      notifs    new-notifs
      cards     (actor-notif-full-cards new-notifs tdesk tid msgs abe)
    ==
      ?(%approve %invite)
    ?:  &(=(%approve op) !in-requests)
      base(ok %.n, code %missing-target, msg 'no pending actor request')
    ?~  trec  base(ok %.n, code %actor-invalid, msg 'target actor not registered')
    ?:  ?=(%revoked status.u.trec)  base(ok %.n, code %actor-revoked, msg 'target actor revoked')
    =/  conv  (actor-convert-cards our nid nt notes nm owners)
    %=  base
      requests  (del-actor-row nid tref requests)
      roster    (~(put by roster) nid (~(put in (fall (~(get by roster) nid) ~)) tref))
      read      ?:(in-roster read (actor-read-seed read tdesk tid nid (fall (~(get by msgs) nid) ~)))
      notes     notes.conv
      cards     cards.conv
    ==
  ==
::  actor-convert-cards (Phase A1): when a non-owner actor is actually added to a still
::  %notebook actor note, convert it to %group via the established human type-update
::  behavior. Returns the updated notes + the type-update cards, gated by host visibility
::  (a hidden owner host never receives the global /notes fact; transport peers do).
++  actor-convert-cards
  |=  $:  our=@p  nid=@ta  nt=note:noltbook
          nmap=(map @ta note:noltbook)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
      ==
  ^-  [notes=(map @ta note:noltbook) cards=(list card:agent:gall)]
  ?.  =(%notebook type.nt)  [nmap ~]
  =/  notes-after=(map @ta note:noltbook)  (apply-type-group ~[nid] nmap)
  =/  upd=update:noltbook  [%note-type-updated nid %group]
  :-  notes-after
  %:  human-note-cards  nid  our
      nm  owners  notes-after
    ~[(gf-paths ~[/notes/[nid]] upd) (gf-notes upd)]
  ==
::  actor-owner-pre (Phase A1): owner-management precheck for actor request/mute actions.
::  Validates app+actor+kind, not-actor-DM, eligible LOCALLY-HOSTED note (creator==our —
::  remote is deferred to A3), EXACT owner authority (note-actor-owners), and governance
::  (%attribute + %manage-members). Holds the candidate registry; returns [nt registry].
::  No host fallback; atomic (caller commits only on success).
++  actor-owner-pre
  |=  $:  our=@p  now=@da
          app=(unit api-app:noltbook)  act=(unit api-actor:noltbook)
          nid=@ta
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
          grants=(map @tas app-grant:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
          dms=(map @ta actor-dm-meta:noltbook)
          nmuted=(map @ta (set actor-ref:noltbook))
      ==
  ^-  %+  each
        [nt=note:noltbook registry=(map [@tas @t] actor-record:noltbook)]
      [code=@tas msg=@t]
  ?~  app  [%.n %actor-invalid 'app required']
  ?~  act  [%.n %actor-invalid 'actor required']
  ?.  ?=(?(%user %bot %app) kind.u.act)  [%.n %actor-invalid 'bad actor kind']
  ?:  (~(has by dms) nid)  [%.n %unsupported 'cannot manage an actor-DM note']
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note 'no such note']
  =/  nt=note:noltbook  u.nt-u
  ?.  ?|(=(%notebook type.nt) =(%group type.nt))
    [%.n %unsupported 'note type not eligible for actor participation']
  ?.  =(our creator.nt)
    [%.n %unsupported 'remote-hosted note: actor membership deferred to A3']
  ?:  (is-write-blocked nid hs nmap our)  [%.n %rejected 'write blocked']
  =/  owner  (~(get by owners) nid)
  ?.  ?&  ?=(^ owner)
          =(host.u.owner our)
          =(desk.u.owner desk.u.app)
          =(id.u.owner id.u.act)
      ==
    [%.n %actor-not-owner 'actor does not own this note']
  ::  A1.2: a muted acting owner cannot moderate/configure (emergency mute neutralizes a
  ::  rogue owner). Read/leave/notification paths never call this precheck.
  ?:  (~(has in (fall (~(get by nmuted) nid) ~)) [our desk.u.app id.u.act])
    [%.n %note-actor-muted 'acting actor is muted in this note']
  =/  g  (gate-actor-cap our now desk.u.app id.u.act name.u.act kind.u.act (sy ~[%attribute %manage-members]) grants registry)
  ?:  ?=(%.n -.g)  [%.n p.g]
  [%.y nt registry.p.g]
::  actor-pref-pre (Actor Social Phase F3): shared gate for the six actor preference
::  actions. Verifies app+actor and governance (%attribute %manage-own-preferences:
::  app grant is the ceiling, per-actor caps narrow, disabled/suspended/revoked
::  reject, no host fallback). Returns the resolved [desk aid] + the candidate
::  registry (held, NOT committed) so the caller validates target state and only then
::  commits — a bad ref / missing target leaves no TOFU row and no last-seen bump.
++  actor-pref-pre
  |=  $:  our=@p  now=@da
          app=(unit api-app:noltbook)  act=(unit api-actor:noltbook)
          grants=(map @tas app-grant:noltbook)
          registry=(map [@tas @t] actor-record:noltbook)
      ==
  ^-  %+  each
        [desk=@tas aid=@t registry=(map [@tas @t] actor-record:noltbook)]
      [code=@tas msg=@t]
  ?~  app  [%.n %actor-invalid 'app required']
  ?~  act  [%.n %actor-invalid 'actor required']
  ?.  ?=(?(%user %bot %app) kind.u.act)  [%.n %actor-invalid 'bad actor kind']
  =/  g  (gate-actor-cap our now desk.u.app id.u.act name.u.act kind.u.act (sy ~[%attribute %manage-own-preferences]) grants registry)
  ?-  -.g
    %.n  [%.n p.g]
    %.y  [%.y desk.u.app id.u.act registry.p.g]
  ==
::  actor-note-access (Actor Notes Phase G2): the PURE participation/ownership gate.
::  An actor [desk aid] may act on a regular note ONLY if (a) it owns the note
::  (note-actor-owners with owner.host == our), or (b) the note's participation set
::  contains [desk aid]. Eligible types are %notebook/%group; an explicitly supplied
::  valid actor on an excluded type (%dm/%gossip/%cover/%ars-rumors) => %unsupported.
::  Missing note => %missing-note; otherwise no access => %actor-not-participant.
::  Governance (gate-actor-cap) is the CALLER's job and runs first; this is the
::  membership-like layer on top. Returns the resolved note on success.
++  actor-note-access
  |=  $:  our=@p  nid=@ta  desk=@tas  aid=@t
          nmap=(map @ta note:noltbook)
          owners=(map @ta actor-owner:noltbook)
          parts=(map @ta (set actor-ref:noltbook))
          dms=(map @ta actor-dm-meta:noltbook)
      ==
  ^-  (each note:noltbook [code=@tas msg=@t])
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  [%.n %missing-note 'no such note']
  =/  nt=note:noltbook  u.nt-u
  ?.  ?|(=(%notebook type.nt) =(%group type.nt))
    [%.n %unsupported 'note type not eligible for actor participation']
  =/  owner  (~(get by owners) nid)
  =/  owns=?
    ?&  ?=(^ owner)
        =(host.u.owner our)
        =(desk.u.owner desk)
        =(id.u.owner aid)
    ==
  =/  pset=(set actor-ref:noltbook)  (fall (~(get by parts) nid) ~)
  =/  participates=?  (~(has in pset) [our desk aid])
  =/  dm  (~(get by dms) nid)
  ::  marked actor-DM (G5A hardening): enforce the membership invariant FIRST, then
  ::  apply HOST-ROLE-SPECIFIC access — a stale/illicit participation row must never
  ::  grant access. We rely on the AUTHORITATIVE meta.owner, not generic owner/
  ::  participation flags.
  ?^  dm
    =/  m=actor-dm-meta:noltbook  u.dm
    ?.  (actor-dm-valid nt m)
      [%.n %rejected 'actor-DM membership invariant broken']
    ?:  =(host.owner.m our)
      ::  OWNER host: ONLY the exact owner actor [desk,id] may access. Participation
      ::  rows never grant access to another actor here.
      ?.  ?&(=(desk.owner.m desk) =(id.owner.m aid))
        [%.n %actor-not-participant 'only the owner actor may access this actor DM']
      [%.y nt]
    ?:  =(target.m our)
      ::  TARGET host: the participation set must contain EXACTLY ONE actor (multiple
      ::  rows are an invariant failure, not permission for each), and it must be the
      ::  requesting actor.
      ?.  =(1 ~(wyt in pset))
        [%.n %rejected 'actor-DM participation invariant broken (not exactly one adopter)']
      ?.  (~(has in pset) [our desk aid])
        [%.n %actor-not-participant 'actor has not adopted this actor DM']
      [%.y nt]
    ::  any other host role cannot access an actor DM it neither owns nor is target of.
    [%.n %rejected 'not a participant host of this actor DM']
  ?:  |(owns participates)  [%.y nt]
  [%.n %actor-not-participant 'actor does not own or participate in this note']
::  actor-dm-valid (Phase G5A): the membership invariant for a marked actor-DM note —
::  a SECRET two-ship %group hosted by the owner's host with users exactly
::  {owner.host, target}. A broken invariant makes actor-DM actions reject/unsupported
::  (never silently an ordinary actor note); actor member APIs can't add a third ship.
++  actor-dm-valid
  |=  [nt=note:noltbook meta=actor-dm-meta:noltbook]
  ^-  ?
  ?&  =(%group type.nt)
      =(%secret visibility.nt)
      =(host.owner.meta creator.nt)
      =(2 ~(wyt in users.nt))
      (~(has in users.nt) host.owner.meta)
      (~(has in users.nt) target.meta)
  ==
::  live-actor-dm (Phase G5A hardening): THE shared resolver — returns a note's
::  actor-DM marker ONLY when the note exists AND the membership invariant holds.
::  A marker on a missing / invariant-broken note reads as ~ everywhere (reads,
::  snapshots), so it never surfaces or hydrates the frontend as an actor DM.
++  live-actor-dm
  |=  [nid=@ta nmap=(map @ta note:noltbook) dms=(map @ta actor-dm-meta:noltbook)]
  ^-  (unit actor-dm-meta:noltbook)
  =/  m  (~(get by dms) nid)
  ?~  m  ~
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  ~
  ?.  (actor-dm-valid u.nt-u u.m)  ~
  m
::  api-actor-dm-json (Phase G5A): a marked actor-DM as a stable read object. owner is
::  the stable [host desk id] + the snapshot name/kind fallback; current profile still
::  resolves via G4. counterpart is filled by the caller (host sees target; adopted
::  target sees the owner actor). No private actor state, no caps.
++  api-actor-dm-json
  |=  meta=actor-dm-meta:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host.owner.meta)]
      ['desk' s+(scot %tas desk.owner.meta)]
      ['id' s+id.owner.meta]
      ['ownerName' s+name.owner.meta]
      ['ownerKind' s+(scot %tas kind.owner.meta)]
      ['target' s+(scot %p target.meta)]
      ['createdAt' (numb:enjs:format (api-da-ms created-at.meta))]
  ==
::  api-grant-json / api-actor-record-json: host/developer read shapes for the
::  Actor Control governance state (Phase A).
++  api-grant-json
  |=  g=app-grant:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.g)]
      ['enabled' b+enabled.g]
      ['caps' a+(turn ~(tap in caps.g) |=(c=app-cap:noltbook s+(scot %tas c)))]
      ['grantedBy' s+(scot %p granted-by.g)]
      ['grantedAt' (numb:enjs:format (api-da-ms granted-at.g))]
      ['updatedAt' (numb:enjs:format (api-da-ms updated-at.g))]
      ['revokedAt' ?~(revoked-at.g ~ (numb:enjs:format (api-da-ms u.revoked-at.g)))]
  ==
++  api-actor-record-json
  |=  [desk=@tas r=actor-record:noltbook]
  ^-  json
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk)]
      ['id' s+id.r]
      ['name' s+name.r]
      ['kind' s+(scot %tas kind.r)]
      ['status' s+(scot %tas status.r)]
      ['createdAt' (numb:enjs:format (api-da-ms created-at.r))]
      ['updatedAt' (numb:enjs:format (api-da-ms updated-at.r))]
      ['revokedAt' ?~(revoked-at.r ~ (numb:enjs:format (api-da-ms u.revoked-at.r)))]
      ['lastSeen' (numb:enjs:format (api-da-ms last-seen.r))]
      ::  caps: null = inherit the app grant; array = explicit per-actor subset.
      ['caps' ?~(caps.r ~ a+(turn ~(tap in u.caps.r) |=(c=app-cap:noltbook s+(scot %tas c))))]
  ==
::  api-actor-profile-json (Actor Social Phase F1): the actor's full profile read.
::  displayName/kind/lifecycleStatus come from the registry record; avatar/bio/
::  statusText from actor-profiles (null when no profile row). host = our.bowl.
::  build-actor-public-profile (Phase G4): registry record + (optional) profile row ->
::  the cross-ship/cacheable presentation-only shape. host is NOT included (stamped at
::  the boundary). lifecycle status is carried so suspended/revoked historical actors
::  stay inspectable. No caps/grants/contacts/preferences ever leak here.
++  build-actor-public-profile
  |=  [desk=@tas rec=actor-record:noltbook prof=(unit actor-profile:noltbook)]
  ^-  actor-public-profile:noltbook
  :*  desk
      id.rec
      name.rec
      kind.rec
      status.rec
      ?~(prof ~ avatar.u.prof)
      ?~(prof ~ bio.u.prof)
      ?~(prof ~ status-text.u.prof)
  ==
::  api-actor-pub-json (Phase G4): THE stable JSON encoder for an actor-public-profile.
::  host is stamped by the caller (our.bowl locally, src.bowl on a remote response —
::  never the payload). Reused by the F1 read, the cache read, and (mirrored field-for-
::  field) by the %actor-profile-result/%actor-profile-updated facts in mar/update.
++  api-actor-pub-json
  |=  [host=@p p=actor-public-profile:noltbook]
  ^-  json
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host)]
      ['desk' s+(scot %tas desk.p)]
      ['id' s+id.p]
      ['displayName' s+display-name.p]
      ['kind' s+(scot %tas kind.p)]
      ['lifecycleStatus' s+(scot %tas lifecycle-status.p)]
      ['avatar' ?~(avatar.p ~ (pairs:enjs:format ~[['type' s+(scot %tas type.u.avatar.p)] ['url' s+url.u.avatar.p]]))]
      ['bio' ?~(bio.p ~ s+u.bio.p)]
      ['statusText' ?~(status-text.p ~ s+u.status-text.p)]
  ==
::  api-actor-profile-json (Actor Social Phase F1): the actor's full profile read,
::  delegating to the single public-profile encoder (G4). host = our.bowl.
++  api-actor-profile-json
  |=  $:  our=@p  desk=@tas  id=@t
          rec=actor-record:noltbook
          prof=(unit actor-profile:noltbook)
      ==
  ^-  json
  (api-actor-pub-json our (build-actor-public-profile desk rec prof))
::  actor-prof-result-cards (Phase G4): the async %actor-profile-result fact on BOTH
::  /notes (main FE) and /api/results (dev clients), from one typed update.
++  actor-prof-result-cards
  |=  $:  req=@ud  host=@p  desk=@tas  id=@t
          status=?(%ok %missing %unreachable %invalid-response)
          fetched-at=(unit @da)
          prof=(unit actor-public-profile:noltbook)
      ==
  ^-  (list card:agent:gall)
  =/  upd=update:noltbook  [%actor-profile-result req host desk id status fetched-at prof]
  :~  [%give %fact ~[/notes] %noltbook-update !>(upd)]
      [%give %fact ~[/api/results] %noltbook-update !>(upd)]
  ==
::  actor-prof-fresh (Phase G4): is a cache entry within the ~m10 freshness window?
++  actor-prof-fresh
  |=  [now=@da fetched-at=@da]
  ^-  ?
  (lth (sub now fetched-at) ~m10)
::  api-identity-ref-json (F2): a contact reference as a stable tagged object. No
::  invented names/profile fields — only the durable identity.
++  api-identity-ref-json
  |=  r=identity-ref:noltbook
  ^-  json
  ?-  -.r
      %ship
    (pairs:enjs:format ~[['kind' s+'ship'] ['ship' s+(scot %p who.r)]])
      %actor
    %-  pairs:enjs:format
    :~  ['kind' s+'actor']
        ['host' s+(scot %p host.r)]
        ['desk' s+(scot %tas desk.r)]
        ['id' s+id.r]
    ==
  ==
::  api-validate-ref (F2): raw api-identity-ref -> validated identity-ref, or a
::  [code msg] failure. A %p parse failure (ship or actor host) => invalid-ship;
::  bad desk/id => invalid-ref; a malformed parse => invalid-ref. Rejects an actor
::  ref equal to our OWN [our, desk, aid] as a self-contact (a ship ref to the host
::  is allowed — it is a distinct real identity). Display name is never authority.
++  api-validate-ref
  |=  [our=@p desk=@tas aid=@t raw=api-identity-ref:noltbook]
  ^-  (each identity-ref:noltbook [code=@tas msg=@t])
  ?-  -.raw
      %invalid
    [%.n %invalid-ref 'malformed contact reference']
      %ship
    =/  who  (slaw %p ship.raw)
    ?~  who  [%.n %invalid-ship 'ship did not parse']
    [%.y %ship u.who]
      %actor
    =/  h  (slaw %p host.raw)
    ?~  h  [%.n %invalid-ship 'actor host did not parse']
    =/  dt  (rush desk.raw sym)
    ?~  dt  [%.n %invalid-ref 'actor desk is not a term']
    ?:  =(0 (met 3 id.raw))  [%.n %invalid-ref 'actor id empty']
    ?:  (gth (met 3 id.raw) 128)  [%.n %invalid-ref 'actor id too long']
    ?:  ?&(=(u.h our) =(u.dt desk) =(id.raw aid))
      [%.n %rejected 'cannot target yourself']
    [%.y %actor u.h u.dt id.raw]
  ==
::  api-preferences-json (Actor Social Phase F3): one actor's STORED identity mute/
::  block book as stable tagged refs. No name/profile resolution, no filtering or
::  enforcement — the plugin applies it.
++  api-preferences-json
  |=  [our=@p desk=@tas aid=@t prefs=actor-preferences:noltbook]
  ^-  json
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p our)]
      ['desk' s+(scot %tas desk)]
      ['id' s+aid]
      ['blocked' a+(turn ~(tap in blocked.prefs) api-identity-ref-json)]
      ['muted' a+(turn ~(tap in muted.prefs) api-identity-ref-json)]
  ==
::  api-actor-owner-json (Actor Notes Phase D): a note's durable actor owner. null
::  when none. host/desk/id are authoritative (from note-actor-owners); name/kind/
::  status are resolved from actor-registry at read time (null if the row is gone).
++  api-actor-owner-json
  |=  [owner=(unit actor-owner:noltbook) registry=(map [@tas @t] actor-record:noltbook)]
  ^-  json
  ?~  owner  ~
  =/  rec  (~(get by registry) [desk.u.owner id.u.owner])
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host.u.owner)]
      ['desk' s+(scot %tas desk.u.owner)]
      ['id' s+id.u.owner]
      ['name' ?~(rec ~ s+name.u.rec)]
      ['kind' ?~(rec ~ s+(scot %tas kind.u.rec))]
      ['status' ?~(rec ~ s+(scot %tas status.u.rec))]
  ==
::  api-actor-ref-json (A2): render a full actor ref + role + muted, resolving name/kind/
::  lifecycle from actor-registry. Unresolved refs keep the stable {host,desk,id} identity
::  with null display fields (never dropped).
++  api-actor-ref-json
  |=  $:  ref=actor-ref:noltbook  role=@t  muted=?
          registry=(map [@tas @t] actor-record:noltbook)
      ==
  ^-  json
  =/  rec  (~(get by registry) [desk.ref id.ref])
  %-  pairs:enjs:format
  :~  ['host' s+(scot %p host.ref)]
      ['desk' s+(scot %tas desk.ref)]
      ['id' s+id.ref]
      ['name' ?~(rec ~ s+name.u.rec)]
      ['kind' ?~(rec ~ s+(scot %tas kind.u.rec))]
      ['lifecycleStatus' ?~(rec ~ s+(scot %tas status.u.rec))]
      ['role' s+role]
      ['muted' b+muted]
  ==
::  api-note-actors (A2): the member-safe roster for a note — owner first (deduped from
::  the roster), then member actors, each with muted state. Returns [owner-json members].
++  api-note-actors
  |=  $:  nid=@ta
          owners=(map @ta actor-owner:noltbook)
          roster=(map @ta (set actor-ref:noltbook))
          muted=(map @ta (set actor-ref:noltbook))
          registry=(map [@tas @t] actor-record:noltbook)
      ==
  ^-  [owner=json actors=(list json)]
  =/  o  (~(get by owners) nid)
  =/  owner-ref=(unit actor-ref:noltbook)  ?~(o ~ `[host.u.o desk.u.o id.u.o])
  =/  mset=(set actor-ref:noltbook)  (fall (~(get by muted) nid) ~)
  =/  rset=(set actor-ref:noltbook)  (fall (~(get by roster) nid) ~)
  =/  owner-json=json
    ?~  owner-ref  ~
    (api-actor-ref-json u.owner-ref 'owner' (~(has in mset) u.owner-ref) registry)
  =/  member-set=(set actor-ref:noltbook)
    ?~  owner-ref  rset  (~(del in rset) u.owner-ref)
  :-  owner-json
  %+  turn  ~(tap in member-set)
  |=  ref=actor-ref:noltbook
  (api-actor-ref-json ref 'member' (~(has in mset) ref) registry)
++  api-msg-json
  |=  [m=message:noltbook vmap=via-map:noltbook amap=actor-map:noltbook]  ^-  json
  %-  pairs:enjs:format
  :~  ['id' (numb:enjs:format (api-da-ms id.m))]
      ['msgId' s+(scot %da id.m)]
      ['author' s+(scot %p author.m)]
      ['text' s+text.m]
      ['timestamp' (numb:enjs:format (api-da-ms timestamp.m))]
      ['edited' b+edited.m]
      ['eid' ?~(meta.m ~ s+(scot %uv eid.u.meta.m))]
      ['replyToEid' ?~(meta.m ~ ?~(reply-to-eid.u.meta.m ~ s+(scot %uv u.reply-to-eid.u.meta.m)))]
      ['via' (api-via-json ?~(meta.m ~ `eid.u.meta.m) vmap)]
      ['actor' (api-actor-json ?~(meta.m ~ `eid.u.meta.m) amap)]
  ==
++  api-art-version-json
  |=  v=artifact-version:noltbook  ^-  json
  %-  pairs:enjs:format
  :~  ['version' (numb:enjs:format version.v)]
      ['content' s+content.v]
      ['editor' s+(scot %p editor.v)]
      ['timestamp' (numb:enjs:format (api-da-ms timestamp.v))]
  ==
++  api-art-pairs
  |=  [a=artifact:noltbook vmap=via-map:noltbook]  ^-  (list [@t json])
  =/  first-ver=(unit artifact-version:noltbook)
    ?~  versions.a  ~
    `i.versions.a
  =/  latest=(unit artifact-version:noltbook)
    ?~  versions.a  ~
    `(rear versions.a)
  =/  file-meta=?  =(%file type.a)
  =/  latest-content=tape
    ?~  latest  ""
    (trip content.u.latest)
  =/  mime=(unit @t)  ?:(file-meta (json-str-field 'mime' latest-content) ~)
  =/  kind=(unit @t)  ?:(file-meta (json-str-field 'kind' latest-content) ~)
  =/  size=@ud  ?:(file-meta (json-num-field 'size' latest-content) 0)
  =/  vtxt=@t
    ?~  latest  '1'
    (scot %ud version.u.latest)
  =/  url=@t
    (rap 3 ['/apps/noltbook/artifact/' id.a '?v=' vtxt ~])
  =/  download-url=@t
    (rap 3 [url '&download=1' ~])
  =/  has-file-url=?  &(file-meta ?=(^ latest))
  =/  created-json=json
    ?~  meta.a
      ?~  first-ver  ~
      (numb:enjs:format (api-da-ms timestamp.u.first-ver))
    (numb:enjs:format (api-da-ms created.u.meta.a))
  =/  updated-json=json
    ?~  meta.a
      ?~  latest  ~
      (numb:enjs:format (api-da-ms timestamp.u.latest))
    (numb:enjs:format (api-da-ms updated.u.meta.a))
  :~  ['id' s+(crip (trip id.a))]
      ['name' s+name.a]
      ['type' s+(crip (trip (scot %tas type.a)))]
      ['creator' s+(scot %p creator.a)]
      ['noteId' s+(crip (trip note-id.a))]
      ['eid' ?~(meta.a ~ s+(scot %uv eid.u.meta.a))]
      ['replyToEid' ?~(meta.a ~ ?~(reply-to-eid.u.meta.a ~ s+(scot %uv u.reply-to-eid.u.meta.a)))]
      ['created' created-json]
      ['updated' updated-json]
      ['versionCount' (numb:enjs:format (lent versions.a))]
      ['latestVersion' ?~(latest ~ (numb:enjs:format version.u.latest))]
      ['latestEditor' ?~(latest ~ s+(scot %p editor.u.latest))]
      ['latestTimestamp' ?~(latest ~ (numb:enjs:format (api-da-ms timestamp.u.latest)))]
      ['mime' ?~(mime ~ s+u.mime)]
      ['kind' ?~(kind ~ s+u.kind)]
      ['size' ?:(file-meta (numb:enjs:format size) ~)]
      ['url' ?:(has-file-url s+url ~)]
      ['downloadUrl' ?:(has-file-url s+download-url ~)]
      ['via' (api-via-json ?~(meta.a ~ `eid.u.meta.a) vmap)]
  ==
++  api-art-json
  |=  [a=artifact:noltbook vmap=via-map:noltbook]  ^-  json
  (pairs:enjs:format (api-art-pairs a vmap))
++  api-art-detail-json
  |=  [a=artifact:noltbook vmap=via-map:noltbook]  ^-  json
  %-  pairs:enjs:format
  (snoc (api-art-pairs a vmap) ['versions' a+(turn versions.a api-art-version-json)])
::  STABLE profile/contact read shapes (Phase 7, read-only). Pure helpers — all
::  state is passed in, since this lib core has no bowl.
++  api-avatar-json
  |=  av=(unit avatar-ref:noltbook)
  ^-  json
  ?~  av  ~
  =/  ts=@t
    ?:  =(%urbit type.u.av)  'urbit'
    ?:  =(%s3 type.u.av)     's3'
    ?:  =(%ipfs type.u.av)   'ipfs'
    'external'
  (pairs:enjs:format ~[['type' s+ts] ['url' s+url.u.av]])
++  api-pal-status
  |=  [ship=@p outgoing=(set @p) incoming=(set @p) blocked=(set @p)]
  ^-  @tas
  ?:  (~(has in blocked) ship)  %blocked
  ?:  &((~(has in outgoing) ship) (~(has in incoming) ship))  %mutual
  ?:  (~(has in outgoing) ship)  %requesting
  ?:  (~(has in incoming) ship)  %requested
  %none
::  api-ship-pairs: base profile/contact summary fields for a ship. extra-known
::  lets callers (e.g. note members) mark a ship known with no profile/pal record.
++  api-ship-pairs
  |=  $:  ship=@p
          profiles=(map @p profile:noltbook)
          contacts=(set @p)
          outgoing=(set @p)
          incoming=(set @p)
          blocked=(set @p)
          extra-known=?
      ==
  ^-  (list [@t json])
  =/  prof=(unit profile:noltbook)  (~(get by profiles) ship)
  =/  is-contact=?  (~(has in contacts) ship)
  =/  is-blocked=?  (~(has in blocked) ship)
  =/  pal=@tas  (api-pal-status ship outgoing incoming blocked)
  =/  known=?  ?|(?=(^ prof) is-contact !=(%none pal) extra-known)
  :~  ['ship' s+(scot %p ship)]
      ['known' b+known]
      ['displayName' ?~(prof ~ ?~(display-name.u.prof ~ s+u.display-name.u.prof))]
      ['avatar' (api-avatar-json ?~(prof ~ avatar.u.prof))]
      ['walletAddress' ?~(prof ~ ?~(wallet-address.u.prof ~ s+u.wallet-address.u.prof))]
      ['azimuthAddress' ?~(prof ~ ?~(azimuth-address.u.prof ~ s+u.azimuth-address.u.prof))]
      ['palStatus' s+(scot %tas pal)]
      ['isContact' b+is-contact]
      ['isBlocked' b+is-blocked]
  ==
::  api-capabilities-pairs: the local user's capabilities for a note, mirroring
::  the real handler guards (Phase 8, read-only). Messages are gated only by
::  is-write-blocked (host-unavailable OR removed-self); artifact upload adds the
::  member/read-only/mute gates (DM+cover exempt, host/admin override); admin
::  mgmt is creator-only; member/mute mgmt is creator-or-admin on shared notes;
::  settings are creator-only (DM members may set the icon).
++  api-capabilities-pairs
  |=  $:  nid=@ta
          nt=note:noltbook
          our=@p
          admins=(map @ta (set @p))
          muted-map=(map @ta (set @p))
          hs=(map @ta ?(%host-deleted %host-unreachable))
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (list [@t json])
  =/  host-st  (~(get by hs) nid)
  =/  is-host-deleted=?  ?=([~ %host-deleted] host-st)
  =/  is-host-unreach=?  ?=([~ %host-unreachable] host-st)
  =/  is-removed=?  (~(has in removed.nt) our)
  =/  write-blocked=?  ?|(?=(^ host-st) is-removed)
  ::  1B.3: capabilities are LOGICAL-membership aware. A transport-only creator/host of
  ::  an actor-owned note gets NO ordinary post/member/admin caps merely from creator==our.
  =/  is-actor-owned=?  (~(has by owners) nid)
  =/  is-member=?  (~(has in (logical-members-of nid nm owners nmap)) our)
  ::  ordinary creator authority requires being a logical member AND not an actor note.
  =/  is-creator=?  ?&(=(our creator.nt) is-member !is-actor-owned)
  ::  raw transport creator + the emergency host control it still carries (delete/config).
  =/  raw-creator=?  =(our creator.nt)
  =/  emergency-host=?  &(raw-creator is-actor-owned)
  =/  is-admin=?  &((~(has in (fall (~(get by admins) nid) ~)) our) is-member)
  =/  has-mod=?  ?|(is-creator is-admin)
  =/  is-dm=?  =(%dm type.nt)
  =/  is-cover=?  =(%cover type.nt)
  =/  is-muted=?  (~(has in (fall (~(get by muted-map) nid) ~)) our)
  =/  is-shared=?  (gth ~(wyt in users.nt) 1)
  =/  exempt=?  ?|(is-dm is-cover)
  =/  can-upload=?
    ?&  is-member
        !is-removed
        ?|(exempt writable.nt is-creator is-admin)
        ?|(exempt !is-muted is-creator is-admin)
    ==
  ::  1B.3: ordinary post/read require logical membership (system DM/cover exempt).
  =/  can-post=?  &(!write-blocked ?|(exempt is-member))
  =/  can-read=?  ?|(exempt is-member)
  =/  reason=@tas
    ?:  is-removed         %removed
    ?:  is-host-deleted     %host-deleted
    ?:  is-host-unreach     %host-unreachable
    ?:  &(!is-member !exempt)  %not-participant
    %none
  :~  ['canRead' b+can-read]
      ['canPost' b+can-post]
      ['canUploadArtifact' b+can-upload]
      ['canEditOwnMessages' b+can-post]
      ['canDeleteOwnMessages' b+can-post]
      ['canManageMembers' b+?&(!write-blocked !is-dm is-shared has-mod)]
      ['canManageAdmins' b+?&(!write-blocked !is-dm is-creator)]
      ['canMuteMembers' b+?&(!write-blocked !is-dm is-shared has-mod)]
      ['canChangeSettings' b+?|(?&(!write-blocked is-creator) ?&(is-dm is-member))]
      ['isCreator' b+raw-creator]
      ['isAdmin' b+is-admin]
      ::  emergency host control (delete/configure for governance) is reported SEPARATELY
      ::  from ordinary membership/admin — a hidden actor note's host has this but is not
      ::  an ordinary member/admin.
      ['emergencyHostControl' b+emergency-host]
      ['isMuted' b+is-muted]
      ['isRemoved' b+is-removed]
      ['isHostDeleted' b+is-host-deleted]
      ['isHostUnreachable' b+is-host-unreach]
      ['reason' s+(scot %tas reason)]
  ==
::  api-mod-pre: shared precheck for Phase 9 membership/admin mutations. Parses
::  the target ship, checks the note exists, and applies the class-appropriate
::  permission gate (mirrors the internal handlers). %.y => proceed with the
::  parsed ship + whether the op forwards to a remote host (=> "accepted", not
::  durable). %.n => the failure result cards (empty when request-id is ~).
::  api-ship-pre: parse + self-check for contact/pal ship actions (Phase 15).
::  %.y = the parsed ship; %.n = the failure result cards.
++  api-ship-pre
  |=  [rid=(unit @ud) ship-txt=@t our=@p]
  ^-  (each @p (list card:agent:gall))
  =/  who=(unit @p)  (slaw %p ship-txt)
  ?~  who  [%.n (api-result-card rid %.n %invalid-ship 'ship did not parse' ~ ~ ~)]
  ?:  =(u.who our)  [%.n (api-result-card rid %.n %rejected 'cannot target yourself' ~ ~ ~)]
  [%.y u.who]
++  api-mod-pre
  |=  $:  class=?(%mod %admin %invite)
          rid=(unit @ud)
          nid=@ta
          ship-txt=@t
          nmap=(map @ta note:noltbook)
          our=@p
          admins=(map @ta (set @p))
          hs=(map @ta ?(%host-deleted %host-unreachable))
      ==
  ^-  (each [who=@p forwarded=?] (list card:agent:gall))
  =/  who=(unit @p)  (slaw %p ship-txt)
  ?~  who
    [%.n (api-result-card rid %.n %invalid-ship 'ship did not parse' `nid ~ ~)]
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u
    [%.n (api-result-card rid %.n %missing-note 'no such note' `nid ~ ~)]
  =/  nt=note:noltbook  u.nt-u
  =/  wb=?  ?|(?=(^ (~(get by hs) nid)) (~(has in removed.nt) our))
  =/  is-creator=?  =(our creator.nt)
  =/  is-admin=?  (~(has in (fall (~(get by admins) nid) ~)) our)
  =/  gate=?
    ?-  class
      %admin   is-creator
      %mod     ?|(is-creator is-admin)
      %invite  ?|(is-creator =(%gossip type.nt) &(=(%group type.nt) ?:(=(%public visibility.nt) (~(has in users.nt) our) is-admin)))
    ==
  ?:  ?|(wb =(%dm type.nt) !gate)
    [%.n (api-result-card rid %.n %rejected 'not allowed for this note/user' `nid ~ ~)]
  [%.y u.who ?&(=(%mod class) !is-creator)]
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
::  host-self (Phase A): is a stored message a GENUINE host self-post? True only when
::  the @p author is us AND no actor is attributed. An actor message authored under our
::  @p is a DISTINCT behavioral sender (host-self=%.n), so it may notify the host. A
::  remote @p author is never host-self. Non-actor callers (artifacts/envelopes) pass
::  ~ to recover the ordinary `author == our` test exactly.
++  host-self
  |=  [author=@p actor=(unit actor:noltbook) our=@p]
  ^-  ?
  &(=(author our) ?=(~ actor))
::  add-reply-attn: if the immediate parent owner is our ship and the reply is NOT a
::  host self-post (sender-self), append a %reply attention item (the NEW reply is the
::  target) and return [updated-attention live-delta-cards]. Dedups by eid > msg-id >
::  aid. sender-self is identity-aware (see host-self): an actor reply under our @p is
::  a distinct sender and is NOT self, so it may notify the host.
++  add-reply-attn
  |=  $:  att=(map @ta (list attention-item:noltbook))
          nid=@ta
          our=@p
          sender-self=?
          parent-owner=(unit @p)
          target=attention-item:noltbook
      ==
  ^-  [(map @ta (list attention-item:noltbook)) (list card:agent:gall)]
  ?:  sender-self  [att ~]
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
::  Runtime-size (Option A): factor the repeated Noltbook update-fact constructor OUT
::  of the agent door. Each inline [%give %fact … %noltbook-update !>(upd)] embeds the
::  large update:noltbook type-noun via !> ; centralising !> here leaves ONE copy in
::  this outer core instead of one per call site, shrinking the door battery. Behaviour
::  is identical: same %give %fact, same paths, same update noun, same card.
++  gf-paths
  |=  [paths=(list path) upd=update:noltbook]
  ^-  card
  [%give %fact paths %noltbook-update !>(upd)]
++  gf-notes
  |=  upd=update:noltbook
  ^-  card
  [%give %fact ~[/notes] %noltbook-update !>(upd)]
::  Runtime-size (Option A): factor remote pokes OUT of the door. Each embedded
::  !>(`remote:noltbook`…) inlines the large remote type-noun; one copy here replaces
::  one per call site. Same %pass/%agent/%poke/%noltbook-remote card, same wire/ship/noun.
++  rpoke
  |=  [=wire who=@p rem=remote:noltbook]
  ^-  card
  [%pass wire %agent [who %noltbook] %poke %noltbook-remote !>(rem)]
++  rem-handle
  ::  Option-1: the whole %noltbook-remote dispatch moved OUT of the on-poke battery.
  ::  =| / =* / =. re-expose state-66 faces exactly like the door, so handler bodies are
  ::  unchanged except this->state. on-poke delegates: =^ cards state (rem-handle bowl rem state).
  |=  [=bowl:gall rem=remote:noltbook sin=state-66]
  =|  state-66
  =*  state  -
  =.  state  sin
  ^-  (quip card state-66)
    ?-  -.rem
    ::
        %remote-invite
      ::  someone invited us to their note
      ::  reject invites from blocked ships; for DMs notify sender so they clean up
      ?:  (~(has in pal-blocked) src.bowl)
        ?.  =(%dm type.rem)  `state
        :_  state
        ~[(rpoke /dm-block-rej/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-dm-blocked note-id.rem])]
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
        ?:  =(id.u.dup note-id.rem)  `state  :: same note, no-op
        =/  local-wins=?
          %+  root-wins
            [creator.u.dup id.u.dup]
          [creator.rem note-id.rem]
        ?:  local-wins
          ::  keep local; tell sender to drop theirs + adopt ours
          :_  state
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
          :~  (gf-notes redir)
              sub-card
              (gf-notes upd)
              (activity-fact note-id.rem now.bowl)
              (unread-activity-fact note-id.rem now.bowl)
          ==
        :_  %=  state
              notes  (~(put by trimmed) note-id.rem new-note)
              messages  (~(put by trimmed-msgs) note-id.rem ~)
              peers  new-peers
              note-activity  (put-activity note-activity note-id.rem now.bowl)
              note-unread-activity  (put-unread-activity note-unread-activity note-id.rem now.bowl)
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
        :_  state(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers)
        :(weld [(gf-notes upd) ~] ars-cards)
      =/  sub-card=card
        [%pass /remote-note/[note-id.rem] %agent [creator.rem %noltbook] %watch /notes/[note-id.rem]]
      :_  state(notes (~(put by notes) note-id.rem new-note), messages (~(put by messages) note-id.rem ~), peers new-peers, note-activity (put-activity note-activity note-id.rem now.bowl), note-unread-activity (put-unread-activity note-unread-activity note-id.rem now.bowl))
      :(weld [sub-card (gf-notes upd) (activity-fact note-id.rem now.bowl) (unread-activity-fact note-id.rem now.bowl) ~] ars-cards)
    ::
        %remote-gossip-invite
      ::  someone invited us to their gossip note (with headline)
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  hl  headline.rem
      ::  gossip is always-public + hostless; carry the embedded image (icon-url) so it travels
      ::  with the note (no fetch). %public so a shared gossip note never reads as private.
      =/  new-note=note:noltbook
        [note-id.rem name.rem %gossip creator.rem users.rem ~ ~ ~ ~ %public icon-url.rem & ~ hl]
      =/  new-peers=(set @p)  (~(put in peers) creator.rem)
      =/  is-new-peer=?  !(~(has in peers) creator.rem)
      =/  ars-cards=(list card)
        ?.  is-new-peer  ~
        ~[[%pass /ars/(scot %p creator.rem) %agent [creator.rem %noltbook] %watch /notes/cover]]
      =/  upd=update:noltbook  [%note-created new-note]
      ::  gossip is hostless: do NOT subscribe to the creator's /notes/[nid] (that host coupling
      ::  is what triggers the "host unreachable" probe). Posts arrive via the pals mesh instead.
      =/  new-headlines=(map @ta @t)
        ?~  hl  headlines
        (~(put by headlines) note-id.rem u.hl)
      :_  %=  state
            notes  (~(put by notes) note-id.rem new-note)
            messages  (~(put by messages) note-id.rem ~)
            peers  new-peers
            headlines  new-headlines
            ::  acquirer is a logical member of their own copy, so they can POST (the send
            ::  handler's member gate would otherwise no-op a non-member's post). Local view.
            note-members  (~(put by note-members) note-id.rem (sy ~[our.bowl]))
            note-activity  (put-activity note-activity note-id.rem now.bowl)
            note-unread-activity  (put-unread-activity note-unread-activity note-id.rem now.bowl)
          ==
      :(weld [(gf-notes upd) (activity-fact note-id.rem now.bowl) (unread-activity-fact note-id.rem now.bowl) ~] ars-cards)
    ::
        %remote-gossip-request
      ::  someone is link-acquiring a gossip note we hold — reply with the full packet (name,
      ::  creator, headline, embedded image) so they can install it. Gossip only; nothing else.
      =/  nt  (~(get by notes) note-id.rem)
      ?~  nt  `state
      ?.  =(%gossip type.u.nt)  `state
      :_  state
      ~[(rpoke /gossip-give/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-gossip-invite note-id.rem name.u.nt creator.u.nt users.u.nt headline.u.nt icon-url.u.nt])]
    ::
        %remote-dm-message
      ::  atomic DM delivery: payload carries DM note metadata, so the
      ::  receiver can recreate the DM if they previously left it. No
      ::  subscription, no echo poke — avoids ames loops.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?.  =(%dm type.note.rem)  `state
      ?.  =(2 ~(wyt in users.note.rem))  `state
      ?.  (~(has in users.note.rem) our.bowl)  `state
      ?.  (~(has in users.note.rem) src.bowl)  `state
      ?.  =(src.bowl author.msg.rem)  `state
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
          ~[(gf-notes `update:noltbook`[%note-created install-fresh])]
        ?:  =(id.u.existing target-nid)  ~
        :~  (gf-notes `update:noltbook`[%note-redirect id.u.existing target-nid])
            (gf-notes `update:noltbook`[%note-created install-fresh])
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
        :_  state(notes staged-notes, messages staged-msgs)
        note-cards
      ::  The remote ship may know this DM under a different root id. Store
      ::  and emit the message under our resolved local DM id so the frontend
      ::  does not route it to the stale/remote id.
      =/  local-msg=message:noltbook  msg.rem(note-id target-nid)
      =/  new-cur=(list message:noltbook)  (snoc cur local-msg)
      =/  target-note=note:noltbook  (~(got by staged-notes) target-nid)
      =/  upd-note=note:noltbook
        target-note(last-author `src.bowl, last-preview `text.local-msg)
      ::  Phase ACTOR-1: trust the incoming actor only if its host == the
      ::  Ames-authenticated source; otherwise drop it. host is never trusted
      ::  from the wire field.
      ::  Phase ACTOR-1 hardening: a remote actor is app-scoped and must arrive
      ::  tied to valid via attribution FROM THE SAME SOURCE. Keep actor only when
      ::  actor+via both exist, actor.host == via.ship == src.bowl, and actor.desk
      ::  == via.desk. Any mismatch (or detached actor) drops the actor entirely.
      =/  dm-actor=(unit actor:noltbook)
        ?~  actor.rem  ~
        ?~  via.rem  ~
        ?.  =(host.u.actor.rem src.bowl)  ~
        ?.  =(ship.u.via.rem src.bowl)  ~
        ?.  =(desk.u.actor.rem desk.u.via.rem)  ~
        actor.rem
      ::  Phase 11B: DM recipient records the sender's via against the message eid.
      =/  new-msg-upd=update:noltbook  [%new-message local-msg ~ via.rem dm-actor]
      =/  msg-cards=(list card)
        :~  (gf-paths ~[/notes/[target-nid]] new-msg-upd)
            (gf-notes new-msg-upd)
        ==
      =.  via-by-eid  (api-via-put via-by-eid via.rem local-msg)
      =.  actor-by-eid  (api-actor-put actor-by-eid dm-actor local-msg)
      :_  state(notes (~(put by staged-notes) target-nid upd-note), messages (~(put by staged-msgs) target-nid new-cur), note-activity (put-activity note-activity target-nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity target-nid now.bowl))
      :(weld note-cards msg-cards ~[(activity-fact target-nid now.bowl) (unread-activity-fact target-nid now.bowl)])
    ::
        %remote-message
      ::  a remote user sent a message to a note we host
      ::  reject if sender is blocked
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ::  reject if sender was removed from note
      ?:  (~(has in removed.u.old) src.bowl)  `state
      ::  reject if sender is muted in this note
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `state
      ::  verify: we must be creator (or DM peer), sender must be in users
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `state
      ?.  (~(has in users.u.old) src.bowl)  `state
      ::  DM validation: message author must match sender
      ?:  &(=(%dm type.u.old) !=(src.bowl author.msg.rem))  `state
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
        `state
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
      ::  Phase ACTOR-1: trust the incoming actor only if its host == the
      ::  Ames-authenticated source; otherwise drop it (never trust wire host).
      ::  Phase ACTOR-1 hardening: same app-scoped invariant as the DM receiver —
      ::  actor kept only when tied to valid via from src (host==via.ship==src.bowl
      ::  and actor.desk==via.desk). Detached/mismatched actor is dropped.
      =/  rem-actor=(unit actor:noltbook)
        ?~  actor.rem  ~
        ?~  via.rem  ~
        ?.  =(host.u.actor.rem src.bowl)  ~
        ?.  =(ship.u.via.rem src.bowl)  ~
        ?.  =(desk.u.actor.rem desk.u.via.rem)  ~
        actor.rem
      ::  Phase 11B: carry the sender's via on the host rebroadcast so members
      ::  record it against the host-assigned eid (stamped), keeping ship=sender.
      =/  upd=update:noltbook  [%new-message stamped directed-kind.rem via.rem rem-actor]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      ::  Phase B: real-user mute/block of the (guarded) sender actor suppresses host
      ::  unread + @~host mention + reply attention; the message still stores/delivers.
      =/  u-suppressed=?  (actor-user-suppressed rem-actor user-muted-actors user-blocked-actors)
      ::  mention detection: check if @~our appears in message text
      =/  mentioned=?  &(!u-suppressed (has-our-mention text.msg.rem our.bowl))
      =/  stamped-eid=(unit @uv)
        ?~  meta.stamped  ~
        `eid.u.meta.stamped
      =/  active-mentioned=?
        ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) note-id.rem) ~) id.stamped stamped-eid))
      =/  mention-cards=(list card)
        ?.  active-mentioned  ~
        (attn-mention-cards note-id.rem id.stamped stamped-eid author.msg.rem)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  active-mentioned  mentions
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
      ::  Phase G6B: if the immediate parent is attributed to an actor, route to actor
      ::  notification logic and SUPPRESS host reply attention for that parent (even if
      ::  the actor is remote or the notification is later filtered).
      =/  par-eid=(unit @uv)  (reply-parent-eid msg.rem cur)
      =/  parent-is-actor=?  ?&(?=(^ par-eid) (~(has by actor-by-eid) u.par-eid))
      ::  NOTE SEND payment posts get kind=%send via the explicit marker carried
      ::  on the %remote-message poke (no longer text-prefix based).
      =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.rem) %send %reply)
      =/  rtarget=attention-item:noltbook  [rkind %message stamped-eid `id.stamped ~ author.msg.rem id.stamped]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        ?:  |(parent-is-actor u-suppressed)  [attention ~]
        (add-reply-attn attention note-id.rem our.bowl (host-self author.msg.rem rem-actor our.bowl) par-owner rtarget)
      ::  Phase 11B: host records attribution against its own stamped eid.
      =.  via-by-eid  (api-via-put via-by-eid via.rem stamped)
      ::  Phase ACTOR-1: host records the guarded actor against the stamped eid.
      =.  actor-by-eid  (api-actor-put actor-by-eid rem-actor stamped)
      ::  Phase G6B: actor reply notification on the parent actor's host (this ship).
      =^  notif-cards  actor-notifications
        ?.  parent-is-actor  [~ actor-notifications]
        (actor-notif-add actor-notifications our.bowl now.bowl note-id.rem stamped rem-actor actor-by-eid cur actor-registry note-actor-owners actor-note-roster actor-dm-notes notes actor-preferences)
      ::  Phase B: unread-activity advances unless a muted/blocked sender actor.
      =/  new-unread-activity=(map @ta @da)
        ?:(u-suppressed note-unread-activity (put-unread-activity note-unread-activity note-id.rem now.bowl))
      =/  unread-card=(list card)
        ?:(u-suppressed ~ ~[(unread-activity-fact note-id.rem now.bowl)])
      :_  state(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur stamped)), mentions new-mentions, attention na.ar, seq-counters new-seq, note-activity (put-activity note-activity note-id.rem now.bowl), note-unread-activity new-unread-activity)
      ^-  (list card:agent:gall)
      ::  1B.2: durable state + /notes/[nid] transport delivery + actor notifications are
      ::  unchanged; the global /notes host-human facts (gf-notes/activity/unread/mention)
      ::  are stripped when the host human is not a logical member of the (hidden) note.
      %:  human-note-cards  note-id.rem  our.bowl
          note-members  note-actor-owners  notes
        :*  (gf-paths ~[pax] upd)
            (gf-notes upd)
            (activity-fact note-id.rem now.bowl)
            (weld unread-card (weld notif-cards (weld mention-cards ac.ar)))
        ==
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
        `state
      ?:  ?|  (~(has by cenv) id.msg.rem)
              ?&  ?=(^ meid)
                  (lien ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.meid))))
              ==
          ==
        `state
      =/  my-hops=@ud  (add hops.rem 1)
      =/  mentioned=?  &(!=(author.msg.rem our.bowl) (has-our-mention text.msg.rem our.bowl))
      =/  active-mentioned=?
        ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) %cover) ~) id.msg.rem meid))
      =/  mention-cards=(list card)
        ?.  active-mentioned  ~
        (attn-mention-cards %cover id.msg.rem meid author.msg.rem)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  active-mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg.rem meid author.msg.rem]))
      =/  env=envelope:noltbook  (api-env-of msg.rem via-by-eid)
      ::  relay to our FOLLOWERS (pal-incoming) — content flows to who follows us, which is
      ::  who displays it (coverMsgVisible shows posts whose author you follow).
      =/  relay=(list card)
        %+  murn  ~(tap in pal-incoming)
        |=  p=@p
        ?:  =(p src.bowl)  ~
        ?:  =(p author.msg.rem)  ~
        `(rpoke /ars-out/(scot %p p) p `remote:noltbook`[%remote-ars-ref env my-hops])
      ?:  =(author.msg.rem our.bowl)
        =/  upd=update:noltbook  [%gossip-message msg.rem my-hops]
        :_  state(messages (~(put by messages) %cover (cap-msgs (snoc cur msg.rem) %.y)), gossip-hops (~(put by gossip-hops) id.msg.rem my-hops), mentions new-mentions)
        :(weld ~[(gf-paths ~[/notes/cover] upd)] relay mention-cards)
      =/  env-upd=update:noltbook  [%gossip-envelope %cover env my-hops]
      =/  content-upd=update:noltbook  [%cover-msg-content %cover msg.rem]
      :_  state(gossip-envelopes (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) id.msg.rem env))), gossip-hops (~(put by gossip-hops) id.msg.rem my-hops), mentions new-mentions)
      :(weld ~[(gf-paths ~[/notes/cover] env-upd)] ~[(gf-notes content-upd)] relay mention-cards)
    ::
        %remote-ars-ref
      ::  ARS NOTORIA envelope gossip from a peer
      =/  env  env.rem
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      ::  dedup: eid-first (stable identity), fall back to msg-id (compat)
      =/  env-eid=(unit @uv)  ?~(meta.env ~ `eid.u.meta.env)
      ?:  ?|  (~(has by cenv) msg-id.env)
              ?&  ?=(^ env-eid)
                  (lien ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.env-eid))))
              ==
          ==
        `state
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))
              ?&  ?=(^ env-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.env-eid))))
              ==
          ==
        `state
      =/  my-hops=@ud  (add hops.rem 1)
      =/  upd=update:noltbook  [%gossip-envelope %cover env my-hops]
      ::  relay to our FOLLOWERS (pal-incoming), not who we follow — see coverMsgVisible.
      =/  relay=(list card)
        %+  murn  ~(tap in pal-incoming)
        |=  p=@p
        ?:  =(p src.bowl)  ~
        ?:  =(p author.env)  ~
        `(rpoke /ars-out/(scot %p p) p `remote:noltbook`[%remote-ars-ref env my-hops])
      ::  reply attention: cover text reply → notify the immediate parent owner if us
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a %cover)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) %cover) *(map @ta artifact-envelope:noltbook)))
      =/  env-rte=(unit @uv)  ?~(meta.env ~ reply-to-eid.u.meta.env)
      =/  par-owner=(unit @p)  (attn-parent-owner env-rte reply-to.env cur note-arts note-aenvs)
      =/  rtarget=attention-item:noltbook  [%reply %message env-eid `msg-id.env ~ author.env timestamp.env]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention %cover our.bowl (host-self author.env ~ our.bowl) par-owner rtarget)
      ::  Phase 11C: record the cover envelope's app attribution by eid.
      =.  via-by-eid  (api-via-put-env via-by-eid env)
      :_  state(gossip-envelopes (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops), attention na.ar)
      ::  emit the envelope on global /notes too (like user-gossip) so a CLOSED
      ::  cover still triggers fetchGossipContent → %cover-msg-content → preview.
      ::  No activity-fact / sidebar-signal: cover must not get a green/red dot;
      ::  the preview is set frontend-side from the fetched message.
      :*  (gf-paths ~[/notes/cover] upd)
          (gf-notes upd)
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
      ?~  found  `state
      :_  state
      :~  (rpoke /msg-reply/(scot %p requester.rem)/(scot %da msg-id.rem) requester.rem `remote:noltbook`[%remote-cover-msg-reply requester.rem i.found])
      ==
    ::
        %remote-cover-msg-reply
      ::  author replied with full message content — ephemeral forward only
      ?.  =(requester.rem our.bowl)  `state
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
        `state
      ::  envelope lookup: eid-first, fall back to msg-id
      =/  env=(unit envelope:noltbook)
        ?:  ?=(^ reply-eid)
          =/  by-eid  (skim ~(val by cenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.reply-eid))))
          ?^  by-eid  `i.by-eid
          (~(get by cenv) id.msg)
        (~(get by cenv) id.msg)
      ?~  env
        ~&  [%cover-msg-reply-no-envelope id=id.msg]
        `state
      ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
        ~&  [%cover-msg-hash-mismatch id=id.msg expected=content-hash.u.env got=(sham text.msg)]
        `state
      =/  new-envs=(map @ta (map @da envelope:noltbook))
        ?:  =(content-hash.u.env *@uv)
          (~(put by gossip-envelopes) %cover (cap-envs (~(put by cenv) id.msg u.env(content-hash (sham text.msg)))))
        gossip-envelopes
      =/  meid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  active-mentioned=?
        ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) %cover) ~) id.msg meid))
      =/  mention-cards=(list card)
        ?.  active-mentioned  ~
        (attn-mention-cards %cover id.msg meid author.msg)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  active-mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
        (~(put by mentions) %cover (snoc cur-m [id.msg meid author.msg]))
      =/  upd=update:noltbook  [%cover-msg-content %cover msg]
      :_  state(gossip-envelopes new-envs, mentions new-mentions)
      (weld ~[(gf-notes upd)] mention-cards)
    ::
        %remote-gossip-ref
      ::  gossip envelope from a note user
      =/  nid=@ta  note-id.rem
      =/  note  (~(get by notes) nid)
      ?~  note  `state
      ?.  =(%gossip type.u.note)  `state
      ::  mesh model: accept a gossip ref for a note we HOLD from any pal — no member list.
      ::  Dedup below prevents loops; the envelope content-hash prevents relay tampering.
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
        `state
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      ?:  ?|  (lien cur |=(m=message:noltbook =(id.m msg-id.env)))
              ?&  ?=(^ env-eid)
                  (lien cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.env-eid))))
              ==
          ==
        `state
      =/  my-hops=@ud  (add hops.rem 1)
      =/  upd=update:noltbook  [%gossip-envelope nid env my-hops]
      ::  mesh model: re-relay onward to our FOLLOWERS (pal-incoming) — content flows to who
      ::  follows us (who displays it). Dedup above means each holder relays once, so it terminates.
      =/  relay=(list card)
        %+  murn  ~(tap in pal-incoming)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        ?:  =(p src.bowl)  ~
        ?:  =(p author.env)  ~
        `(rpoke /gossip-out/(scot %p p)/[nid] p `remote:noltbook`[%remote-gossip-ref nid env my-hops])
      =/  head-cards=(list card:agent:gall)
        :~  (gf-paths ~[/notes/[nid]] upd)
            ::  also emit the envelope on global /notes so a closed gossip note
            ::  triggers fetchGossipContent → %cover-msg-content → preview.
            (gf-notes upd)
            (activity-fact nid now.bowl)
            (unread-activity-fact nid now.bowl)
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
        (add-reply-attn attention nid our.bowl (host-self author.env ~ our.bowl) par-owner rtarget)
      ::  Phase 11C: record the gossip envelope's app attribution by eid.
      =.  via-by-eid  (api-via-put-env via-by-eid env)
      :_  state(gossip-envelopes (~(put by gossip-envelopes) nid (cap-envs (~(put by nenv) msg-id.env env))), gossip-hops (~(put by gossip-hops) msg-id.env my-hops), attention na.ar, note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl))
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
      ?~  found  `state
      :_  state
      :~  (rpoke /msg-reply/(scot %p requester.rem)/(scot %da msg-id.rem) requester.rem `remote:noltbook`[%remote-gossip-msg-reply nid requester.rem i.found])
      ==
    ::
        %remote-gossip-msg-reply
      ::  author replied with gossip message content — ephemeral forward only
      ?.  =(requester.rem our.bowl)  `state
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
        `state
      ::  envelope lookup: eid-first, fall back to msg-id
      =/  env=(unit envelope:noltbook)
        ?:  ?=(^ reply-eid)
          =/  by-eid  (skim ~(val by nenv) |=(e=envelope:noltbook ?~(meta.e %.n =(eid.u.meta.e u.reply-eid))))
          ?^  by-eid  `i.by-eid
          (~(get by nenv) id.msg)
        (~(get by nenv) id.msg)
      ?~  env
        ~&  [%gossip-msg-reply-no-envelope id=id.msg note=nid]
        `state
      ?.  |(=(content-hash.u.env *@uv) =(content-hash.u.env (sham text.msg)))
        ~&  [%gossip-msg-hash-mismatch id=id.msg note=nid]
        `state
      =/  new-envs=(map @ta (map @da envelope:noltbook))
        ?:  =(content-hash.u.env *@uv)
          (~(put by gossip-envelopes) nid (cap-envs (~(put by nenv) id.msg u.env(content-hash (sham text.msg)))))
        gossip-envelopes
      =/  meid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
      =/  active-mentioned=?
        ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) nid) ~) id.msg meid))
      =/  mention-cards=(list card)
        ?.  active-mentioned  ~
        (attn-mention-cards nid id.msg meid author.msg)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  active-mentioned  mentions
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
      :_  state(gossip-envelopes new-envs, mentions new-mentions, notes new-notes2)
      :(weld ~[(gf-notes upd)] mention-cards sig-cards)
    ::
        %remote-rumor
      ::  RUMORS: anonymous gossip from a peer. Identity model is
      ::  content-hash (not entry-meta) — see %send-message %ars-rumors.
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %ars-rumors) ~)
      ::  content-hash identity: dedup by (sham text)
      =/  chash=@uv  (sham text.msg.rem)
      ?:  (~(has by gossip-hops) `@da`chash)
        `state
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
          (rpoke /rum-out/(scot %p p) p `remote:noltbook`[%remote-rumor anon-msg (add hops.rem 1)])
        ::  proxy through one random peer
        =/  proxy=@p  (snag (~(rad og +(eny.bowl)) (lent targets)) targets)
        ~[(rpoke /rum-out/(scot %p proxy) proxy `remote:noltbook`[%remote-rumor anon-msg (add hops.rem 1)])]
      :_  state(messages (~(put by messages) %ars-rumors (snoc cur anon-msg)), gossip-hops (~(put by gossip-hops) `@da`chash 0))
      [(gf-paths ~[/notes/ars-rumors] upd) relay]
    ::
        %remote-profile
      ::  a peer sent us their profile
      =/  upd=update:noltbook  [%profile-updated ship.rem profile.rem]
      :_  state(profiles (~(put by profiles) ship.rem profile.rem))
      ~[(gf-notes upd)]
    ::
        %remote-profile-request
      ::  Phase 3: a peer is asking us for our profile. Silently drop if they
      ::  are blocked — they get an unreachable timeout on their end.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  resp=remote:noltbook  [%remote-profile-response req-id.rem prof]
      :_  state
      ~[(rpoke /profile-resp/(scot %p src.bowl)/(scot %ud req-id.rem) src.bowl resp)]
    ::
        %remote-profile-response
      ::  Phase 3: peer replied to our lookup. Hydrate profile, then emit a
      ::  %profile-lookup-result %ok so the sidebar can open the modal.
      =/  pupd=update:noltbook  [%profile-updated src.bowl profile.rem]
      =/  rupd=update:noltbook  [%profile-lookup-result req-id.rem src.bowl %ok]
      :_  state(profiles (~(put by profiles) src.bowl profile.rem))
      :~  (gf-notes pupd)
          (gf-notes rupd)
      ==
    ::
        %remote-actor-profile-request
      ::  Phase G4: a peer asks for one of OUR actors' public profile. Blocked peers
      ::  are silently dropped (same privacy as %remote-profile-request — they time
      ::  out on their end). Validate the actor id (non-empty, <=128 bytes); desk is
      ::  already a term. Suspended/revoked actors are STILL returned so historical
      ::  attributed messages remain inspectable; no actor => profile=~. Never include
      ::  caps/grants/contacts/preferences — only the public profile.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  prof=(unit actor-public-profile:noltbook)
        ?:  =(0 (met 3 actor-id.rem))  ~
        ?:  (gth (met 3 actor-id.rem) 128)  ~
        =/  rec  (~(get by actor-registry) [desk.rem actor-id.rem])
        ?~  rec  ~
        `(build-actor-public-profile desk.rem u.rec (~(get by actor-profiles) [desk.rem actor-id.rem]))
      =/  resp=remote:noltbook  [%remote-actor-profile-response req-id.rem desk.rem actor-id.rem prof]
      :_  state
      ~[(rpoke /actor-prof-resp/(scot %p src.bowl)/(scot %ud req-id.rem) src.bowl resp)]
    ::
        %remote-actor-profile-response
      ::  Phase G4: a host replied to our actor-profile lookup. The host is src.bowl
      ::  (NOT trusted from payload); the response echoes desk/actor-id. profile=~ =>
      ::  %missing (no such actor there) — cache nothing. profile=^ but its desk/id do
      ::  NOT match the request => %invalid-response, cache NOTHING (a host can only
      ::  assert profiles under its own authenticated src.bowl namespace; this stops a
      ::  mismatched Alice payload from being normalized into a Rick cache key). Match =>
      ::  cache under [src.bowl desk actor-id] with now as fetched-at and emit %ok.
      ?~  profile.rem
        :_  state
        (actor-prof-result-cards req-id.rem src.bowl desk.rem actor-id.rem %missing ~ ~)
      ?.  ?&(=(desk.u.profile.rem desk.rem) =(id.u.profile.rem actor-id.rem))
        :_  state
        (actor-prof-result-cards req-id.rem src.bowl desk.rem actor-id.rem %invalid-response ~ ~)
      =/  key=[@p @tas @t]  [src.bowl desk.rem actor-id.rem]
      :_  state(remote-actor-profiles (~(put by remote-actor-profiles) key [u.profile.rem now.bowl]))
      (actor-prof-result-cards req-id.rem src.bowl desk.rem actor-id.rem %ok `now.bowl `u.profile.rem)
    ::
        %remote-actor-dm-meta
      ::  Phase G5A: the host of an actor DM tells us this group note is a direct actor
      ::  conversation. The host is src.bowl (NOT trusted from payload): require
      ::  meta.owner.host == src.bowl and meta.target == our.bowl. Reject a marker
      ::  claiming another host. Validate the actor id cap. If the note already exists
      ::  it must be src.bowl's secret %group containing both ships; if metadata arrives
      ::  before the invite it is stored provisionally (reads/access re-verify against
      ::  the live note via actor-dm-valid). Store + emit a frontend fact.
      ?.  =(host.owner.meta.rem src.bowl)  `state
      ?.  =(target.meta.rem our.bowl)  `state
      ?:  =(0 (met 3 id.owner.meta.rem))  `state
      ?:  (gth (met 3 id.owner.meta.rem) 128)  `state
      ::  G5A hardening: if the note already exists it must pass the FULL invariant
      ::  (secret, exactly two users == {src.bowl, our.bowl}, creator == src.bowl) via
      ::  the shared actor-dm-valid — not just creator/type/membership. If the note has
      ::  not arrived yet, the marker is stored provisionally (reads/access re-verify).
      =/  nt-u  (~(get by notes) note-id.rem)
      ?:  ?&(?=(^ nt-u) !(actor-dm-valid u.nt-u meta.rem))
        `state
      =.  actor-dm-notes  (~(put by actor-dm-notes) note-id.rem meta.rem)
      :_  state
      ~[(gf-notes `update:noltbook`[%actor-dm-updated note-id.rem `meta.rem])]
    ::
        %remote-note-request
      ::  someone is asking for our joinable notes
      ::  blocked ships cannot browse our hosted notes
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ::  only %group/%gossip notes we host with public/private visibility
      =/  pub-notes=(list note:noltbook)
        %+  skim  ~(val by notes)
        |=  n=note:noltbook
        ?&  ?|(=(%group type.n) =(%gossip type.n))
            =(our.bowl creator.n)
            ?|(?=(%public visibility.n) ?=(%private visibility.n))
            !(~(has by note-actor-owners) id.n)
        ==
      =/  resp=remote:noltbook  [%remote-note-list pub-notes]
      :_  state
      ~[(rpoke /note-resp/(scot %p requester.rem) requester.rem resp)]
    ::
        %remote-note-list
      ::  received a remote ship's public/private notes
      =/  upd=update:noltbook  [%remote-note-list src.bowl notes.rem]
      :_  state
      ~[(gf-notes upd)]
    ::
        %remote-note-state-request
      ::  requester asked for an authoritative snapshot of the group tree
      ::  containing this id. We resolve the topmost same-host group root,
      ::  verify the requester still belongs to it, and reply.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  start  (~(get by notes) note-id.rem)
      ?~  start
        :_  state
        ~[(rpoke /state-deny/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-note-state-denied note-id.rem])]
      ?.  =(our.bowl creator.u.start)
        :_  state
        ~[(rpoke /state-deny/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-note-state-denied note-id.rem])]
      ?.  =(%group type.u.start)
        :_  state
        ~[(rpoke /state-deny/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-note-state-denied note-id.rem])]
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
      ?~  root-note  `state
      ?.  ?&  (~(has in users.u.root-note) src.bowl)
              !(~(has in removed.u.root-note) src.bowl)
          ==
        :_  state
        ~[(rpoke /state-deny/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-note-state-denied note-id.rem])]
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
      :_  state
      ~[(rpoke /state-out/(scot %p src.bowl)/[root-id] src.bowl resp)]
    ::
        %remote-note-state
      ::  host replied with an authoritative snapshot. Validate strictly,
      ::  then conservatively merge metadata. Do not touch messages,
      ::  artifacts, mentions, calls, envelopes. Emit a single dedicated
      ::  %note-state-refreshed update — never %note-created — so the FE
      ::  doesn't fire spurious notifications for repaired notes.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?~  notes.rem  `state
      =/  root=note:noltbook  i.notes.rem
      ?.  =(id.root root-id.rem)  `state
      ?.  =(src.bowl creator.root)  `state
      ?.  =(%group type.root)  `state
      ?.  ?&  (~(has in users.root) our.bowl)
              !(~(has in removed.root) our.bowl)
          ==
        `state
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
      ?.  desc-valid  `state
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
        (gf-notes refreshed)
      ::  recency: only freshly-installed shared notes (merged-subs) count;
      ::  a refresh of already-local notes does not bump ordering.
      =/  na2=(map @ta @da)
        =/  subs=(list @ta)  merged-subs
        =/  acc=(map @ta @da)  note-activity
        |-  ^-  (map @ta @da)
        ?~  subs  acc
        $(subs t.subs, acc (put-activity acc i.subs now.bowl))
      ::  Phase B: mirror unread-activity for freshly-installed shared notes.
      =/  nua2=(map @ta @da)
        =/  subs=(list @ta)  merged-subs
        =/  acc=(map @ta @da)  note-unread-activity
        |-  ^-  (map @ta @da)
        ?~  subs  acc
        $(subs t.subs, acc (put-unread-activity acc i.subs now.bowl))
      =/  act-cards=(list card)
        %-  zing
        %+  turn  merged-subs
        |=(nid=@ta ~[(activity-fact nid now.bowl) (unread-activity-fact nid now.bowl)])
      :_  state(notes merged-notes, messages merged-msgs, member-revs new-revs, note-activity na2, note-unread-activity nua2)
      :(weld (snoc sub-cards fact-card) act-cards)
    ::
        %remote-note-state-denied
      ::  silent no-op for now; user-facing error deferred.
      `state
    ::
        %remote-hey
      ::  a ship wants to be pals with us
      ::  ignore if blocked
      ?:  (~(has in pal-blocked) src.bowl)  `state
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
        (rpoke /prof-out/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-profile our.bowl prof])
      ::  if we already have them in outgoing and this is a fresh hey
      ::  (not already in incoming), echo hey back so they see mutual
      =/  hey-back=(list card)
        ?:  (~(has in pal-incoming) src.bowl)  ~
        ?.  (~(has in pal-outgoing) src.bowl)  ~
        ~[(rpoke /pal-hey/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-hey ~])]
      :_  state(pal-incoming new-incoming, peers new-peers)
      :(weld [prof-card (gf-notes upd) ~] hey-back)
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
      :_  state(pal-incoming new-incoming)
      ~[(gf-notes upd)]
    ::
        %remote-introduce
      ::  no-op: auto peer-introduce removed; variant retained for future
      ::  contact design. Do not auto-add peer / watch cover / send profile.
      `state
    ::
        %remote-edit-msg
      ::  remote user editing their own message in a note we host (or DM peer)
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `state
      ?.  (~(has in users.u.old) src.bowl)  `state
      ::  reject if muted
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `state
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.rem))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
        (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `state
      ::  only the author can edit their own msg
      ?.  =(src.bowl author.i.found)  `state
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
      :_  state(messages (~(put by messages) note-id.rem new-msgs))
      :~  (gf-paths ~[pax] upd)
          (gf-notes upd)
      ==
    ::
        %remote-create-child
      ::  host-only child creation: members may no longer ask us to create a
      ::  child in our shared note. Reject all such requests.
      `state
    ::
        %remote-child-note
      ::  receive a child note from the host. Tolerate orphan delivery
      ::  (root invite races behind child poke) by storing the child even
      ::  if its parent is not yet present; root install repairs children.
      ?.  =(parent.note.rem `parent-id.rem)  `state
      ?.  =(creator.note.rem src.bowl)  `state
      ?.  (~(has in users.note.rem) our.bowl)  `state
      ?:  (~(has in removed.note.rem) our.bowl)  `state
      ?.  ?|(=(%group type.note.rem) =(%notebook type.note.rem))  `state
      =/  have-child=?  (~(has by notes) id.note.rem)
      =/  old-par  (~(get by notes) parent-id.rem)
      ?~  old-par
        ::  parent missing — store as orphan, subscribe, emit %note-created
        ?:  have-child  `state
        =/  sub-card=card
          [%pass /remote-note/[id.note.rem] %agent [creator.note.rem %noltbook] %watch /notes/[id.note.rem]]
        =/  upd=update:noltbook  [%note-created note.rem]
        :_  state(notes (~(put by notes) id.note.rem note.rem), messages (~(put by messages) id.note.rem *(list message:noltbook)), note-activity (put-activity note-activity id.note.rem now.bowl), note-unread-activity (put-unread-activity note-unread-activity id.note.rem now.bowl))
        :~  sub-card
            (gf-notes upd)
            (activity-fact id.note.rem now.bowl)
            (unread-activity-fact id.note.rem now.bowl)
        ==
      ::  parent present — host must match parent creator
      ?.  =(src.bowl creator.u.old-par)  `state
      =/  new-children=(list @ta)  (append-child-if-missing id.note.rem children.u.old-par)
      =/  attach-changed=?  !=(new-children children.u.old-par)
      =/  new-par=note:noltbook  u.old-par(children new-children)
      ?:  have-child
        ::  already stored — only ensure parent is attached
        ?.  attach-changed  `state
        :_  state(notes (~(put by notes) parent-id.rem new-par))
        ~
      =/  new-notes=(map @ta note:noltbook)
        (~(put by (~(put by notes) id.note.rem note.rem)) parent-id.rem new-par)
      =/  sub-card=card
        [%pass /remote-note/[id.note.rem] %agent [creator.note.rem %noltbook] %watch /notes/[id.note.rem]]
      =/  upd=update:noltbook  [%note-created note.rem]
      :_  state(notes new-notes, messages (~(put by messages) id.note.rem *(list message:noltbook)), note-activity (put-activity note-activity id.note.rem now.bowl), note-unread-activity (put-unread-activity note-unread-activity id.note.rem now.bowl))
      :~  sub-card
          (gf-notes upd)
          (activity-fact id.note.rem now.bowl)
          (unread-activity-fact id.note.rem now.bowl)
      ==
    ::
        %remote-delete-msg
      ::  remote user deleting their own message in a note we host (or DM peer)
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ?.  ?|  =(our.bowl creator.u.old)
              =(%dm type.u.old)
          ==
        `state
      ?.  (~(has in users.u.old) src.bowl)  `state
      ::  reject if muted
      ?:  (~(has in (fall (~(get by note-muted) note-id.rem) ~)) src.bowl)  `state
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ::  eid-first lookup, fall back to msg-id
      =/  found=(list message:noltbook)
        ?^  eid.rem
          =/  by-eid  (skim cur |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid.rem))))
          ?^  by-eid  by-eid
          (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
        (skim cur |=(m=message:noltbook =(id.m msg-id.rem)))
      ?~  found  `state
      ::  only the author can delete their own msg via remote
      ?.  =(src.bowl author.i.found)  `state
      =/  target-id=@da  id.i.found
      =/  new-msgs=(list message:noltbook)
        (skim cur |=(m=message:noltbook !=(id.m target-id)))
      =/  del-eid=(unit @uv)
        ?~  meta.i.found  ~
        `eid.u.meta.i.found
      =/  upd=update:noltbook  [%message-deleted note-id.rem target-id del-eid]
      =/  pax=path  ~[%notes note-id.rem]
      ::  clear the pin if it (kind=%message) targeted this message (host-auth).
      =/  pin-hit=?
        ?~  del-eid  %.n
        =/  pn  (~(get by note-pins) note-id.rem)
        ?~  pn  %.n
        &(=(%message kind.u.pn) =(u.del-eid target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)
        ?:(pin-hit (~(del by note-pins) note-id.rem) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards note-id.rem ~) ~)
      ::  G3B hygiene: the host owns this delete authoritatively — prune the deleted
      ::  message's via/actor attribution rows when an eid resolved.
      =?  via-by-eid    ?=(^ del-eid)  (~(del by via-by-eid) u.del-eid)
      =?  actor-by-eid  ?=(^ del-eid)  (~(del by actor-by-eid) u.del-eid)
      ::  Phase G6B: prune actor notifications targeting the deleted message's eid +
      ::  emit authoritative full=%.y updates to affected actors (resolved post-mutation).
      =/  old-notifs  actor-notifications
      =?  actor-notifications  ?=(^ del-eid)
        (actor-notif-del-eid actor-notifications u.del-eid)
      =/  msgs-after  (~(put by messages) note-id.rem new-msgs)
      ::  actor-by-eid is already post-deletion here (the =? above ran).
      =/  notif-cards=(list card)
        (actor-notif-diff-cards old-notifs actor-notifications msgs-after actor-by-eid)
      :_  state(messages msgs-after, note-pins new-pins)
      %+  weld  notif-cards
      %+  weld
        ^-  (list card)
        :~  (gf-paths ~[pax] upd)
            (gf-notes upd)
        ==
      pin-clear-cards
    ::
        %remote-leave
      ::  a user left a note we host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ::  DMs use local-only leave; ignore remote-leave for DMs
      ?:  =(%dm type.u.old)  `state
      ::  only host processes group/other leaves
      ?.  =(our.bowl creator.u.old)  `state
      ?.  (~(has in users.u.old) src.bowl)  `state
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
        [(gf-notes adm-upd) (gf-paths ~[/notes/[note-id.rem]] adm-upd) ~]
      =/  muted-cards=(list card)
        ?.  was-muted  ~
        =/  mut-upd=update:noltbook  [%muted-updated note-id.rem ~(tap in (fall (~(get by clean-muted) note-id.rem) ~))]
        [(gf-notes mut-upd) (gf-paths ~[/notes/[note-id.rem]] mut-upd) ~]
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
        :~  (gf-notes users-upd)
            (gf-paths ~[/notes/[note-id.rem]] users-upd)
        ==
      =/  desc-users-cards=(list card)
        ?:  =(~ group-descs)  ~
        (build-users-updated-cards group-descs notes-after new-revs)
      :_  state(notes notes-after, note-admins clean-admins, note-muted clean-muted, member-revs new-revs, note-members (del-member-from-ids src.bowl [note-id.rem group-descs] note-members note-actor-owners notes))
      :(weld base-cards admin-cards muted-cards desc-users-cards)
    ::
        %remote-root-exists
      ::  we lost a root-uniqueness race; drop loser, adopt canonical
      ::  protect system notes from root-exists manipulation
      ?:  |(=(losing-id.rem %cover) =(losing-id.rem %ars-rumors))  `state
      ::  sender must be the canonical's creator (authority on winner)
      ?.  =(src.bowl creator.canonical.rem)  `state
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
        :~  (gf-notes adopt)
            (gf-notes redir)
        ==
      :_  state
      (weld sub-cards tail-cards)
    ::
        %remote-kick
      ::  host removed us from a note. For %group notes we PRESERVE the
      ::  local subtree so the user can keep reading and fork from it; we
      ::  mark our.bowl as removed in each preserved note's users/removed
      ::  set (write-guards block mutation while in removed). For non-group
      ::  notes the legacy delete behavior is retained.
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ?.  =(src.bowl creator.u.old)  `state
      =/  kick-upd=update:noltbook  [%kick-notification note-id.rem note-name.rem src.bowl]
      ?.  =(%group type.u.old)
        ::  legacy delete path (DMs, gossip, cover, notebook)
        =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
        =/  unsub-card=card
          [%pass /remote-note/[note-id.rem] %agent [src.bowl %noltbook] %leave ~]
        ::  1B.3: the note is gone — prune its logical-members row too (no stale row).
        :_  state(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem), note-members (~(del by note-members) note-id.rem))
        :~  unsub-card
            (gf-notes del-upd)
            (gf-notes kick-upd)
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
      ::  1B.3: we were kicked — drop our.bowl from the subtree's logical members (the
      ::  note is preserved read-only, but we are no longer a logical participant).
      :_  state(notes notes-after, note-members (del-member-from-ids our.bowl subtree-ids note-members note-actor-owners notes))
      ^-  (list card)
      :(weld unsub-cards users-updated-cards ^-((list card) ~[(gf-notes kick-upd)]))
    ::
        %remote-blocked
      ::  someone blocked us — persist in blocked-by and notify frontend
      =/  upd=update:noltbook  [%blocked-notification src.bowl]
      :_  state(blocked-by (~(put in blocked-by) src.bowl))
      ~[(gf-notes upd)]
    ::
        %remote-unblocked
      ::  someone unblocked us — remove from blocked-by and notify frontend
      =/  upd=update:noltbook  [%unblocked-notification src.bowl]
      :_  state(blocked-by (~(del in blocked-by) src.bowl))
      ~[(gf-notes upd)]
    ::
        %remote-dm-blocked
      ::  our DM invite was rejected because we are blocked — clean up ghost DM
      ::  only delete if this is clearly our just-created shell (we created it,
      ::  sender is a member, and no messages have been exchanged yet)
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ?.  =(%dm type.u.old)  `state
      ?.  =(our.bowl creator.u.old)  `state
      ?.  (~(has in users.u.old) src.bowl)  `state
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      ?.  =(~ msgs)  `state
      =/  del-upd=update:noltbook  [%note-deleted note-id.rem]
      :_  state(notes (~(del by notes) note-id.rem), messages (~(del by messages) note-id.rem))
      ~[(gf-notes del-upd)]
    ::
        %remote-note-deleted
      ::  host deleted a note we were in. Phase 5: preserve local subtree as
      ::  a host-deleted archive. Unsubscribe from host paths so we stop
      ::  receiving live updates; mark every preserved id host-deleted so
      ::  the write-guard blocks mutations. Emit %note-host-status per id
      ::  and a single %note-deleted-notification banner for the root.
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ?.  =(src.bowl creator.u.old)  `state
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
      :_  state(host-status new-host-status)
      ^-  (list card)
      :(weld unsub-cards status-cards ^-((list card) ~[(gf-notes notif-upd)]))
    ::
        %remote-fork-invite
      ::  Phase 6.2: metadata-only notification. No notes, descendants, or
      ::  messages stored. Blocked senders dropped silently. Duplicate
      ::  invites no-op. Collision check on root id only — payload-time
      ::  validation happens on %remote-fork-payload after explicit accept.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?:  (~(has by notes) root-id.rem)  `state
      ?:  (~(has by pending-fork-invites) root-id.rem)  `state
      =/  rec=pending-fork-invite:noltbook
        :*  src.bowl  root-id.rem  source-root-id.rem
            source-name.rem  source-version.rem  fork-origin.rem
            now.bowl  %.n
        ==
      =/  notif=update:noltbook
        [%fork-invite-received root-id.rem source-name.rem source-version.rem forker.rem]
      :_  state(pending-fork-invites (~(put by pending-fork-invites) root-id.rem rec))
      ~[(gf-notes notif)]
    ::
        %remote-fork-fetch
      ::  Phase 6.2: receiver requested the full fork payload. Authorize:
      ::  we must host the fork (root in our notes, creator==our.bowl),
      ::  requester must be in fork-invitees for this root OR already in
      ::  users (re-fetch OK), requester not blocked.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  root  (~(get by notes) root-id.rem)
      =/  invs  (fall (~(get by fork-invitees) root-id.rem) *(set @p))
      =/  authorized=?
        ?~  root  %.n
        ?.  =(our.bowl creator.u.root)  %.n
        ?:  (~(has in invs) src.bowl)  %.y
        (~(has in users.u.root) src.bowl)
      ?.  authorized
        :_  state
        ~[(rpoke /fork-deny/(scot %p src.bowl)/[root-id.rem] src.bowl `remote:noltbook`[%remote-fork-denied root-id.rem])]
      ::  an authorized fetch IS the acceptance: add the requester as a member of
      ::  the fork (root + descendants), drop them from the pending invitee set,
      ::  bump member revs, and emit note-users-updated. A re-fetch by an existing
      ::  member (not in invitees) skips the membership churn.
      =/  desc-ids=(list @ta)  (collect-group-descendants root-id.rem notes)
      =/  subtree-ids=(list @ta)  [root-id.rem desc-ids]
      =/  is-acceptance=?  (~(has in invs) src.bowl)
      =/  notes  ?.(is-acceptance notes (add-ship-to-ids src.bowl subtree-ids notes))
      =/  new-invitees=(set @p)  (~(del in invs) src.bowl)
      =/  fork-invitees-after=(map @ta (set @p))
        ?.  is-acceptance  fork-invitees
        ?:  =(~ new-invitees)  (~(del by fork-invitees) root-id.rem)
        (~(put by fork-invitees) root-id.rem new-invitees)
      =/  new-revs=(map @ta @ud)
        ?.(is-acceptance member-revs (bump-member-revs subtree-ids member-revs))
      ::  re-read the (possibly updated) root for the payload below.
      =/  root  (~(get by notes) root-id.rem)
      =/  member-cards=(list card)
        ?.  is-acceptance  ~
        (build-users-updated-cards subtree-ids notes new-revs)
      ::  build payload from current (post-add) state
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
      ?~  root  `state
      ::  payload carries the updated root (acceptor is now in root-note.users),
      ::  so the acceptor's %remote-fork-payload membership check passes.
      =/  pload=remote:noltbook
        :*  %remote-fork-payload
            root-id.rem  src-root-id  u.root  desc-pairs
            src-origin  fork-ver  parent-ver  fork-art-envs
        ==
      :_  state(notes notes, fork-invitees fork-invitees-after, member-revs new-revs)
      %+  weld  member-cards
      ^-  (list card)
      ~[(rpoke /fork-pay/(scot %p src.bowl)/[root-id.rem] src.bowl pload)]
    ::
        %remote-fork-payload
      ::  Phase 6.2: forker delivered the subtree after accept. Validate
      ::  against pending invite, install only if everything checks out.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  inv  (~(get by pending-fork-invites) root-id.rem)
      ?~  inv  `state
      =/  pi  u.inv
      ?.  =(sender.pi src.bowl)  `state
      ?.  =(root-id.pi root-id.rem)  `state
      ?.  =(fork-origin.pi fork-origin.rem)  `state
      ?.  =(id.root-note.rem root-id.rem)  `state
      ?.  =(src.bowl creator.root-note.rem)  `state
      ::  only install a fork we are actually a member of (guards against an
      ::  acceptor installing a fork whose users set doesn't include them).
      ?.  (~(has in users.root-note.rem) our.bowl)  `state
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
        :_  state(pending-fork-invites (~(del by pending-fork-invites) root-id.rem))
        ~[(gf-notes cleared)]
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
        (gf-notes `update:noltbook`[%note-created n])
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
        `(gf-notes `update:noltbook`[%artifact-envelope-list note-id.row envs])
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.rem]
      =/  accepted=update:noltbook  [%fork-invite-accepted root-id.rem]
      :_  %=  state
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
          ^-((list card) ~[(gf-notes cleared)])
          ^-((list card) ~[(gf-notes accepted)])
      ==
    ::
        %remote-fork-denied
      ::  Phase 6.2: forker rejected our fetch. Clear the pending invite.
      =/  inv  (~(get by pending-fork-invites) root-id.rem)
      ?~  inv  `state
      ?.  =(sender.u.inv src.bowl)  `state
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.rem]
      :_  state(pending-fork-invites (~(del by pending-fork-invites) root-id.rem))
      ~[(gf-notes cleared)]
    ::
        %remote-fork-decline
      ::  an invitee declined our fork. We must host it (root present, creator==us),
      ::  and src must be a current invitee or (legacy-bad) already a user. Drop them
      ::  from the invitee set; if they were wrongly a user, clear them from users
      ::  (NOT removed) and bump revs + emit note-users-updated.
      =/  root  (~(get by notes) root-id.rem)
      ?~  root  `state
      ?.  =(our.bowl creator.u.root)  `state
      =/  invs  (fall (~(get by fork-invitees) root-id.rem) *(set @p))
      =/  was-member=?  (~(has in users.u.root) src.bowl)
      ?.  |((~(has in invs) src.bowl) was-member)  `state
      =/  new-invitees=(set @p)  (~(del in invs) src.bowl)
      =/  fork-invitees-after=(map @ta (set @p))
        ?:  =(~ new-invitees)  (~(del by fork-invitees) root-id.rem)
        (~(put by fork-invitees) root-id.rem new-invitees)
      ?.  was-member
        ::  normal case: never a member, just forget the pending invitee.
        `state(fork-invitees fork-invitees-after)
      ::  backward-compat: a bad fork listed them as a user — clear from users only.
      =/  subtree-ids=(list @ta)  [root-id.rem (collect-group-descendants root-id.rem notes)]
      =/  notes-after=(map @ta note:noltbook)  (clear-ship-from-ids src.bowl subtree-ids notes)
      =/  new-revs=(map @ta @ud)  (bump-member-revs subtree-ids member-revs)
      :_  state(notes notes-after, fork-invitees fork-invitees-after, member-revs new-revs)
      (build-users-updated-cards subtree-ids notes-after new-revs)
    ::
    ::  ===== REMOTE CALL HANDLERS =====
    ::
        %remote-call-start
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  (~(has in users.u.exists) src.bowl)  `state
      ::  if stale call (0 participants), allow replacement; if active, no-op
      =/  old-call  (~(get by active-calls) note-id.rem)
      ?:  ?&  ?=(^ old-call)
              (gth ~(wyt in participants.u.old-call) 0)
          ==
        `state
      ::  case 1: we are the creator and a member asked us to start
      ?:  =(our.bowl creator.u.exists)
        =/  cid=@ta  (crip (weld "call-" (trip (scot %da now.bowl))))
        =/  ci=call-info:noltbook
          [cid note-id.rem src.bowl now.bowl (sy ~[src.bowl]) %active]
        =/  sys-msg=message:noltbook
          [now.bowl note-id.rem src.bowl (crip (weld "\01SYS:call-started:" (trip (scot %p src.bowl)))) now.bowl ~ %.n ~]
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
        =/  upd=update:noltbook  [%call-started note-id.rem cid src.bowl ~[src.bowl]]
        =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
        =/  pax=path  ~[%notes note-id.rem]
        ::  broadcast to all members including the requester
        =/  broadcast=(list card)
          %+  murn  ~(tap in users.u.exists)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `(rpoke /call-start/(scot %p p)/[note-id.rem] p `remote:noltbook`[%remote-call-start note-id.rem cid src.bowl])
        :_  state(active-calls (~(put by active-calls) note-id.rem ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
        :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)] broadcast)
      ::  case 2: we are NOT creator; accept notification from creator only
      ?.  =(src.bowl creator.u.exists)  `state
      =/  ci=call-info:noltbook
        [call-id.rem note-id.rem started-by.rem now.bowl (sy ~[started-by.rem]) %active]
      =/  sys-msg=message:noltbook
        [now.bowl note-id.rem started-by.rem (crip (weld "\01SYS:call-started:" (trip (scot %p started-by.rem)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-started note-id.rem call-id.rem started-by.rem ~[started-by.rem]]
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.rem]
      :_  state(active-calls (~(put by active-calls) note-id.rem ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)])
    ::
        %remote-call-join
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `state
      ?.  (~(has in users.u.exists) ship.rem)  `state
      ?:  (~(has in participants.u.ci) ship.rem)  `state
      =/  new-ci=call-info:noltbook  u.ci(participants (~(put in participants.u.ci) ship.rem))
      =/  sys-msg=message:noltbook
        [now.bowl note-id.rem ship.rem (crip (weld "\01SYS:call-joined:" (trip (scot %p ship.rem)))) now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-joined note-id.rem ship.rem]
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.rem]
      ::  case 1: we are creator — process + relay to other participants
      ::  case 2: we are NOT creator — just process locally (notification from creator)
      =/  broadcast=(list card)
        ?.  =(our.bowl creator.u.exists)  ~
        %+  murn  ~(tap in participants.u.ci)
        |=  p=@p
        ?:  =(p ship.rem)  ~
        ?:  =(p our.bowl)  ~
        `(rpoke /call-join-relay/(scot %p p)/[note-id.rem] p `remote:noltbook`[%remote-call-join note-id.rem ship.rem])
      :_  state(active-calls (~(put by active-calls) note-id.rem new-ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)] broadcast)
    ::
        %remote-call-leave
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `state
      ?.  (~(has in participants.u.ci) ship.rem)  `state
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
          `(rpoke /call-end/(scot %p p)/[note-id.rem] p `remote:noltbook`[%remote-call-ended note-id.rem])
        :_  state(active-calls (~(del by active-calls) note-id.rem), messages (~(put by messages) note-id.rem (snoc (snoc cur sys-msg) end-msg)))
        :(weld ~[(gf-paths ~[pax] end-upd)] ~[(gf-notes end-upd)] broadcast)
      ::  still has participants: update and broadcast leave
      =/  new-ci=call-info:noltbook  u.ci(participants new-parts)
      =/  upd=update:noltbook  [%call-left note-id.rem ship.rem]
      ::  only creator relays to other participants
      =/  broadcast=(list card)
        ?.  =(our.bowl creator.u.exists)  ~
        %+  murn  ~(tap in new-parts)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `(rpoke /call-leave-relay/(scot %p p)/[note-id.rem] p `remote:noltbook`[%remote-call-leave note-id.rem ship.rem])
      :_  state(active-calls (~(put by active-calls) note-id.rem new-ci), messages (~(put by messages) note-id.rem (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] broadcast)
    ::
        %remote-call-ended
      ::  host says call is over
      =/  ci  (~(get by active-calls) note-id.rem)
      ?~  ci  `state
      ::  must come from a note member
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  (~(has in users.u.exists) src.bowl)  `state
      =/  end-msg=message:noltbook
        [now.bowl note-id.rem src.bowl '\01SYS:call-ended' now.bowl ~ %.n ~]
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  upd=update:noltbook  [%call-ended note-id.rem call-id.u.ci]
      =/  pax=path  ~[%notes note-id.rem]
      :_  state(active-calls (~(del by active-calls) note-id.rem), messages (~(put by messages) note-id.rem (snoc cur end-msg)))
      ~[(gf-paths ~[pax] upd) (gf-notes upd)]
    ::
        %remote-call-signal
      ::  incoming WebRTC signal from a peer; relay to local frontend
      ::  find which note this call belongs to
      =/  entries=(list [@ta call-info:noltbook])  ~(tap by active-calls)
      =/  match=(list [@ta call-info:noltbook])
        (skim entries |=([nid=@ta ci=call-info:noltbook] =(call-id.ci call-id.rem)))
      ?~  match  `state
      =/  note-id=@ta  -.i.match
      =/  upd=update:noltbook  [%call-signal note-id from.rem sig-type.rem payload.rem]
      =/  pax=path  ~[%notes note-id]
      :_  state
      ~[(gf-paths ~[pax] upd)]
    ::
        %remote-join-request
      ::  someone wants to join one of our notes
      ::  reject from blocked ships
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ::  must be our note
      ?.  =(our.bowl creator.u.old)  `state
      ::  already a member? no-op
      ?:  (~(has in users.u.old) src.bowl)  `state
      ::  only %group/%gossip notes are joinable
      ?.  ?|(=(%group type.u.old) =(%gossip type.u.old))  `state
      ::  secret notes: deny silently
      ?:  =(%secret visibility.u.old)  `state
      ::  removed users cannot rejoin — tell them explicitly
      ?:  (~(has in removed.u.old) src.bowl)
        :_  state
        ~[(rpoke /join-removed/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-join-removed note-id.rem])]
      ::  public notes: auto-approve (immediate invite)
      ?:  =(%public visibility.u.old)
        =/  new-users=(set @p)  (~(put in users.u.old) src.bowl)
        =/  new-removed=(set @p)  (~(del in removed.u.old) src.bowl)
        =/  nid=@ta  note-id.rem
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite nid name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          (rpoke /invite/(scot %p src.bowl)/[nid] src.bowl inv)
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
          ~[(gf-notes mute-upd) (gf-paths ~[/notes/[nid]] mute-upd)]
        :_  state(notes notes-after, peers new-peers, note-muted (~(put by note-muted) nid ro-muted), member-revs new-revs, note-members (add-member-to-ids src.bowl [nid group-descs] note-members note-actor-owners notes))
        :(weld [poke-card (gf-notes users-upd) (gf-paths ~[/notes/[note-id.rem]] users-upd) ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
      ::  private notes: queue pending request
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
      ::  already pending? send pending confirmation, no duplicate
      ?:  (~(has in pending) src.bowl)
        :_  state
        :~  (rpoke /join-pending/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-join-pending note-id.rem])
        ==
      ::  add to pending set
      =.  join-requests  (~(put by join-requests) note-id.rem (~(put in pending) src.bowl))
      ::  notify host frontend + admins + confirm pending to requester
      =/  jr-upd=update:noltbook  [%join-request-received note-id.rem src.bowl name.u.old]
      :_  state
      :~  (gf-notes jr-upd)
          (gf-paths ~[/notes/[note-id.rem]] jr-upd)
          (rpoke /join-pending/(scot %p src.bowl)/[note-id.rem] src.bowl `remote:noltbook`[%remote-join-pending note-id.rem])
      ==
    ::
        %remote-join-pending
      ::  host confirmed our request is pending
      =/  upd=update:noltbook  [%join-requested note-id.rem src.bowl]
      :_  state
      ~[(gf-notes upd)]
    ::
        %remote-join-denied
      ::  host denied our join request
      =/  upd=update:noltbook  [%join-denied note-id.rem src.bowl]
      :_  state
      ~[(gf-notes upd)]
    ::
        %remote-join-removed
      ::  host says we're removed from this note — cannot rejoin
      =/  upd=update:noltbook  [%join-removed note-id.rem src.bowl]
      :_  state
      ~[(gf-notes upd)]
    ::
        %remote-mod
      ::  remote admin forwarding moderation action to host
      =/  old  (~(get by notes) note-id.rem)
      ?~  old  `state
      ::  must be our note
      ?.  =(our.bowl creator.u.old)  `state
      ::  src must be a current member; per-mod-type authority is enforced per arm below.
      ?.  (~(has in users.u.old) src.bowl)  `state
      =/  is-admin=?  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) src.bowl)
      =/  is-public=?  =(%public visibility.u.old)
      ::  dispatch by mod-type — DEFAULT-DENY: every arm states its own authority. All
      ::  mod-types remain admin-only EXCEPT %invite-member on a %public note (any member).
      ?+  mod-type.rem  `state
          %remove-member
        ?.  is-admin  `state
        ::  admin cannot remove host or other admins
        ?:  =(target.rem our.bowl)  `state
        ?:  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) target.rem)  `state
        ?.  (~(has in users.u.old) target.rem)  `state
        =/  new-users=(set @p)  (~(del in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(put in removed.u.old) target.rem)
        =/  upd-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  kick-card=card
          (rpoke /kick/(scot %p target.rem)/[note-id.rem] target.rem `remote:noltbook`[%remote-kick note-id.rem name.u.old])
        =/  sys-text=@t  (crip (weld (trip (scot %p target.rem)) " removed from note"))
        =/  sys-msg=message:noltbook  [now.bowl note-id.rem our.bowl sys-text now.bowl ~ %.n ~]
        =/  old-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
        =/  new-msgs=(list message:noltbook)  (snoc old-msgs sys-msg)
        =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
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
        :_  state(notes notes-after, messages (~(put by messages) note-id.rem new-msgs), note-admins clean-admins, note-muted clean-muted, member-revs new-revs)
        %+  weld
          ^-  (list card)
          :~  kick-card
              (gf-notes users-upd)
              (gf-paths ~[/notes/[note-id.rem]] users-upd)
              (gf-notes msg-upd)
              (gf-paths ~[/notes/[note-id.rem]] msg-upd)
          ==
        desc-users-cards
      ::
          %mute-member
        ?.  is-admin  `state
        ?.  (~(has in users.u.old) target.rem)  `state
        ?:  =(target.rem creator.u.old)  `state
        ?:  (~(has in (fall (~(get by note-admins) note-id.rem) ~)) target.rem)  `state
        =/  cur-muted=(set @p)  (fall (~(get by note-muted) note-id.rem) ~)
        =/  new-muted=(set @p)  (~(put in cur-muted) target.rem)
        =/  upd=update:noltbook  [%muted-updated note-id.rem ~(tap in new-muted)]
        :_  state(note-muted (~(put by note-muted) note-id.rem new-muted))
        :~  (gf-notes upd)
            (gf-paths ~[/notes/[note-id.rem]] upd)
        ==
      ::
          %unmute-member
        ?.  is-admin  `state
        =/  cur-muted=(set @p)  (fall (~(get by note-muted) note-id.rem) ~)
        ?.  (~(has in cur-muted) target.rem)  `state
        =/  new-muted=(set @p)  (~(del in cur-muted) target.rem)
        =/  upd=update:noltbook  [%muted-updated note-id.rem ~(tap in new-muted)]
        :_  state(note-muted (~(put by note-muted) note-id.rem new-muted))
        :~  (gf-notes upd)
            (gf-paths ~[/notes/[note-id.rem]] upd)
        ==
      ::
          %approve-join
        ?.  is-admin  `state
        ::  same logic as local %approve-join but triggered by remote admin
        ?:  =(%dm type.u.old)  `state
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `state
        =/  new-pending=(set @p)  (~(del in pending) target.rem)
        =.  join-requests
          ?:  =(~ new-pending)  (~(del by join-requests) note-id.rem)
          (~(put by join-requests) note-id.rem new-pending)
        =/  new-users=(set @p)  (~(put in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(del in removed.u.old) target.rem)
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite note-id.rem name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          (rpoke /invite/(scot %p target.rem)/[note-id.rem] target.rem inv)
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
          ~[(gf-notes mute-upd) (gf-paths ~[/notes/[note-id.rem]] mute-upd)]
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
        :_  state(notes notes-after, peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted), member-revs new-revs)
        :(weld [poke-card (gf-notes users-upd) (gf-paths ~[/notes/[note-id.rem]] users-upd) (gf-notes jr-upd) ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
      ::
          %deny-join
        ?.  is-admin  `state
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `state
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
        :_  state
        :~  (rpoke /join-deny/(scot %p target.rem)/[note-id.rem] target.rem `remote:noltbook`[%remote-join-denied note-id.rem])
            (gf-notes jr-upd)
        ==
      ::
          %deny-block-join
        ?.  is-admin  `state
        ::  admin deny-block: note-scoped block (add to removed)
        =/  pending=(set @p)  (fall (~(get by join-requests) note-id.rem) *(set @p))
        ?.  (~(has in pending) target.rem)  `state
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
        :_  state(notes (~(put by notes) note-id.rem upd-note), member-revs new-revs)
        :~  (rpoke /join-deny/(scot %p target.rem)/[note-id.rem] target.rem `remote:noltbook`[%remote-join-denied note-id.rem])
            (gf-notes users-upd)
            (gf-paths ~[/notes/[note-id.rem]] users-upd)
            (gf-notes jr-upd)
        ==
      ::
          %invite-member
        ::  public note: any member may invite; private/secret: admin only
        ?.  ?|(is-admin is-public)  `state
        ::  admin-forwarded invite: host performs canonical invite
        ?:  =(%dm type.u.old)  `state
        ?:  (~(has in users.u.old) target.rem)  `state
        =/  new-users=(set @p)  (~(put in users.u.old) target.rem)
        =/  new-removed=(set @p)  (~(del in removed.u.old) target.rem)
        =/  new-note=note:noltbook  u.old(users new-users, removed new-removed)
        =/  inv=remote:noltbook  [%remote-invite note-id.rem name.u.old type.u.old our.bowl users.new-note visibility.u.old writable.u.old]
        =/  poke-card=card
          (rpoke /invite/(scot %p target.rem)/[note-id.rem] target.rem inv)
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
          ~[(gf-notes mute-upd) (gf-paths ~[pax] mute-upd)]
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
        :_  state(notes notes-after, peers new-peers, note-muted (~(put by note-muted) note-id.rem ro-muted), member-revs new-revs)
        :(weld ~[poke-card] ~[(gf-notes users-upd)] ~[(gf-paths ~[pax] users-upd)] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
      ==
    ::
        %remote-artifact-fetch
      ::  requester asking us for artifact bytes
      =/  art  (~(get by artifacts) art-id.rem)
      ?~  art
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      =/  nt  (~(get by notes) note-id.u.art)
      ?~  nt
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      ::  block guard
      ?:  (~(has in pal-blocked) src.bowl)
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      ::  per-type permission
      ::  cover: NO direct-pal check; envelope mesh reaches further
      ::  gossip note: explicit membership (in users, not removed)
      ::  others: existing notebook/group/dm membership
      ?:  ?&  !?=(%cover type.u.nt)
              ?|  !(~(has in users.u.nt) src.bowl)
                  (~(has in removed.u.nt) src.bowl)
              ==
          ==
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      ::  scry bytes from our clay
      =/  art-clay=path
        :*  (scot %p our.bowl)
            q.byk.bowl
            (scot %da now.bowl)
            /lib/noltbook/artifacts/[art-id.rem]/mime
        ==
      =/  scry-res  (mule |.(.^(mime %cx art-clay)))
      ?:  ?=(%| -.scry-res)
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      =/  mim=mime  p.scry-res
      ::  if requester sent expected-hash, validate before serving.
      ::  q.mim is octs [p=@ud q=@]; hash content == hash of byte atom (q.q.mim)
      ?:  ?&  ?=(^ expected-hash.rem)
              !=(u.expected-hash.rem (sham q.q.mim))
          ==
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      =/  mtype=@t  (rap 3 (join '/' p.mim))
      :_  state
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
        ?.  =(src.bowl creator.u.art)  `state
        =/  hdrs=(list [@t @t])
          :~  ['content-type' mime.rem]
              ['cache-control' 'no-store']
          ==
        =/  =simple-payload:http  [[200 hdrs] `bytes.rem]
        :_  state
        (give-simple-payload:app:server eyre-id.rem simple-payload)
      ::  envelope path: require known envelope + matching author. Hash
      ::  check is strict when envelope carries a non-zero hash, but
      ::  *@uv (unknown — e.g. fork-copied envelopes) bypasses it.
      =/  env  (find-aid-in-envelopes art-id.rem artifact-envelopes)
      ?~  env  `state
      ?.  =(src.bowl author.u.env)  `state
      ?.  ?|  =(content-hash.u.env *@uv)
              =(content-hash.u.env (sham q.bytes.rem))
          ==
        :_  state
        %+  give-simple-payload:app:server  eyre-id.rem
        [[404 ~] ~]
      =/  hdrs=(list [@t @t])
        :~  ['content-type' mime.rem]
            ['cache-control' 'no-store']
        ==
      =/  =simple-payload:http  [[200 hdrs] `bytes.rem]
      :_  state
      (give-simple-payload:app:server eyre-id.rem simple-payload)
    ::
        %remote-artifact-denied
      ::  byte host refused (not member, missing, removed); reply 404 to http
      =/  art  (~(get by artifacts) art-id.rem)
      ?^  art
        ?.  =(src.bowl creator.u.art)  `state
        :_  state
        %+  give-simple-payload:app:server  eyre-id.rem
        [[404 ~] ~]
      =/  env  (find-aid-in-envelopes art-id.rem artifact-envelopes)
      ?~  env  `state
      ?.  =(src.bowl author.u.env)  `state
      :_  state
      %+  give-simple-payload:app:server  eyre-id.rem
      [[404 ~] ~]
    ::
        %remote-artifact-create
      ::  member registering metadata for an artifact whose bytes live on member
      =/  art  artifact.rem
      =/  nid=@ta  note-id.art
      =/  nt  (~(get by notes) nid)
      ?~  nt  `state
      ::  must be host of this note
      ?.  =(our.bowl creator.u.nt)  `state
      ::  only normal/group notes accept artifact metadata
      ?.  ?|(?=(%notebook type.u.nt) ?=(%group type.u.nt))  `state
      ::  sender must be current member, not removed
      ?.  (~(has in users.u.nt) src.bowl)  `state
      ?:  (~(has in removed.u.nt) src.bowl)  `state
      ::  artifact creator must equal sender
      ?.  =(src.bowl creator.art)  `state
      ::  versions: artifact uploads emit exactly one version
      ?.  ?=([^ ~] versions.art)  `state
      =/  ver  i.versions.art
      =/  ctnt=tape  (trip content.ver)
      ::  type-specific content validation. %file is UNCHANGED (clay-backed metadata; reject
      ::  inline dataUrl/mimeType blobs). %app must be a small valid plugin descriptor — a
      ::  reference the host records but never runs. %code is not accepted via this path.
      =/  content-ok=?
        ?-  type.art
            %file
          ?&  ?=(^ (find (trip '"storage":"clay"') ctnt))
              ?=(~ (find (trip 'dataUrl') ctnt))
              ?=(~ (find (trip 'mimeType') ctnt))
          ==
        ::
            %app   (valid-app-artifact-content content.ver)
            %code  %.n
        ==
      ?.  content-ok  `state
      ::  read-only: only host/admin can post; host already self
      =/  admins  (fall (~(get by note-admins) nid) ~)
      =/  is-admin=?  (~(has in admins) src.bowl)
      ?:  ?&  !writable.u.nt
              !is-admin
          ==
        `state
      ::  mute: muted members cannot post
      =/  muted  (fall (~(get by note-muted) nid) ~)
      ?:  ?&  (~(has in muted) src.bowl)
              !is-admin
          ==
        `state
      ::  reject id collision (don't overwrite local artifact)
      ?:  (~(has by artifacts) id.art)  `state
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
        (add-reply-attn attention nid our.bowl (host-self creator.art ~ our.bowl) par-owner rtarget)
      :_  state(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) id.art art), attention na.ar, note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl))
      ^-  (list card:agent:gall)
      :*  (gf-paths ~[pax] upd)
          (activity-fact nid now.bowl)
          (unread-activity-fact nid now.bowl)
          (sidebar-signal nid creator.art `prev %artifact now.bowl)
          ac.ar
      ==
    ::
        %remote-artifact-update
      ::  member updating an existing %app artifact's shared interactive state. Mirrors
      ::  %remote-artifact-create moderation: we host the note, sender is a current non-removed
      ::  member, %app + valid descriptor, read-only => admin, muted => admin. creator (origin
      ::  attribution) is unchanged; this version records editor=src.bowl. Member-writable.
      =/  old  (~(get by artifacts) art-id.rem)
      ?~  old  `state
      =/  nid=@ta  note-id.u.old
      =/  nt  (~(get by notes) nid)
      ?~  nt  `state
      ?.  =(our.bowl creator.u.nt)  `state
      ?.  ?|(?=(%notebook type.u.nt) ?=(%group type.u.nt))  `state
      ?.  (~(has in users.u.nt) src.bowl)  `state
      ?:  (~(has in removed.u.nt) src.bowl)  `state
      ?.  =(%app type.u.old)  `state
      ?.  (valid-app-artifact-content content.rem)  `state
      =/  admins  (fall (~(get by note-admins) nid) ~)
      =/  is-admin=?  (~(has in admins) src.bowl)
      ?:  ?&(!writable.u.nt !is-admin)  `state
      =/  muted  (fall (~(get by note-muted) nid) ~)
      ?:  ?&((~(has in muted) src.bowl) !is-admin)  `state
      =/  new-ver=artifact-version:noltbook
        :*  (add 1 (lent versions.u.old))  content.rem  src.bowl  now.bowl
        ==
      =/  upd-art=artifact:noltbook  u.old(versions (snoc versions.u.old new-ver))
      =/  upd=update:noltbook  [%artifact-updated upd-art]
      :_  state(artifacts (~(put by artifacts) art-id.rem upd-art))
      ~[(gf-paths ~[/notes/[nid]] upd)]
    ::
        %remote-dm-artifact
      ::  counterparty shipped a DM artifact (metadata + bytes). Store both.
      =/  art  artifact.rem
      =/  nid=@ta  note-id.art
      =/  nt  (~(get by notes) nid)
      ?~  nt  `state
      ?.  ?=(%dm type.u.nt)  `state
      ::  both parties must be current, non-removed members
      ?.  (~(has in users.u.nt) src.bowl)  `state
      ?.  (~(has in users.u.nt) our.bowl)  `state
      ?:  (~(has in removed.u.nt) src.bowl)  `state
      ?:  (~(has in removed.u.nt) our.bowl)  `state
      ::  artifact must originate from sender
      ?.  =(src.bowl creator.art)  `state
      ?.  ?=(%file type.art)  `state
      ::  versions: exactly one
      ?.  ?=([^ ~] versions.art)  `state
      =/  ver  i.versions.art
      =/  ctnt=tape  (trip content.ver)
      ?~  (find (trip '"storage":"clay"') ctnt)  `state
      ?^  (find (trip 'dataUrl') ctnt)  `state
      ?^  (find (trip 'mimeType') ctnt)  `state
      ::  reject id collision
      ?:  (~(has by artifacts) id.art)  `state
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
        (add-reply-attn attention nid our.bowl (host-self creator.art ~ our.bowl) par-owner rtarget)
      :_  state(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) id.art art), attention na.ar, note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl))
      :*  clay-card
          (gf-paths ~[pax] upd)
          (gf-notes upd)
          (activity-fact nid now.bowl)
          (unread-activity-fact nid now.bowl)
          (sidebar-signal nid creator.art `prev %artifact now.bowl)
          ac.ar
      ==
    ::
        %remote-artifact-envelope-ref
      ::  cover/gossip artifact envelope from a peer; never carries bytes
      =/  nid=@ta  note-id.rem
      =/  nt  (~(get by notes) nid)
      ?~  nt  `state
      ?.  ?|(?=(%cover type.u.nt) ?=(%gossip type.u.nt))  `state
      ::  blocked sender or blocked author is rejected
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?:  (~(has in pal-blocked) author.env.rem)  `state
      ::  gossip notes: src must be in users, not removed
      ?:  ?&  ?=(%gossip type.u.nt)
              ?|  !(~(has in users.u.nt) src.bowl)
                  (~(has in removed.u.nt) src.bowl)
              ==
          ==
        `state
      =/  envs=(map @ta artifact-envelope:noltbook)
        (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
      ::  dedup by aid; skip if we already have it as a full artifact (own)
      ?:  (~(has by envs) aid.env.rem)  `state
      ?:  (~(has by artifacts) aid.env.rem)  `state
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
        `(rpoke /art-env-out/(scot %p p)/[aid.env.rem] p `remote:noltbook`[%remote-artifact-envelope-ref nid env.rem my-hops])
      =/  upd=update:noltbook  [%artifact-envelope nid env.rem my-hops]
      =/  pax=path  ~[%notes nid]
      ::  cover is pinned; only user gossip notes get recency/signal/preview.
      ::  put-activity already skips cover; suppress fact + signal for cover too.
      =/  is-user-gossip=?  ?=(%gossip type.u.nt)
      =/  prev=@t  (art-env-preview env.rem)
      =/  act-cards=(list card)
        ?:  is-user-gossip  ~[(activity-fact nid now.bowl) (unread-activity-fact nid now.bowl)]
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
        (add-reply-attn attention nid our.bowl (host-self author.env.rem ~ our.bowl) par-owner rtarget)
      :_  state(notes new-notes, artifact-envelopes (~(put by artifact-envelopes) nid (cap-art-envs (~(put by envs) aid.env.rem env.rem))), attention na.ar, note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl))
      :(weld ~[(gf-paths ~[pax] upd)] relay act-cards sig-cards ac.ar)
    ==
::  action-vase: action:noltbook -> vase. One !> of the action type-noun lives here
::  so the API->action re-entries recurse through vase without re-embedding the cast 59x.
++  action-vase
  |=  act=action:noltbook
  ^-  vase
  !>(act)
::  ===== Phase 1B: logical human participation. note-members is the read authority
::  for the local human principal; note.users stays transport. Compact by design to
::  protect the literal budget. System notes (%cover/%ars-rumors) keep their special
::  always-visible behavior. =====
::  logical-members-of: note-members row if present; else fall back to note.users
::  (minus the actor owner's transport host for actor-owned notes). The fallback
::  protects ordinary notes created before 1B activation and un-propagated remote copies.
::  Read-only — never persists.
++  logical-members-of
  |=  $:  nid=@ta
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (set @p)
  =/  row  (~(get by nm) nid)
  ?^  row  u.row
  =/  nt  (~(get by nmap) nid)
  ?~  nt  ~
  =/  o  (~(get by owners) nid)
  ?~  o  users.u.nt
  (~(del in users.u.nt) host.u.o)
::  human-sees-note: may the local human `who` see nid? System notes always; otherwise
::  logical membership. A physical creator/transport host is NOT visible by creator alone.
++  human-sees-note
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  ?
  ?:  |(=(nid %cover) =(nid %ars-rumors))  &
  (~(has in (logical-members-of nid nm owners nmap)) who)
::  put/del-logical-member (1B.1): a PRESENT note-members row is authoritative even when
::  empty; an ABSENT row derives from note.users (minus the actor owner's host). So the
::  mutation base is logical-members-of, and both always WRITE a row (incl. empty) — they
::  never delete the key (only physical note deletion removes a row). Never touch note.users.
++  put-logical-member
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  (~(put by nm) nid (~(put in (logical-members-of nid nm owners nmap)) who))
++  del-logical-member
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  (~(put by nm) nid (~(del in (logical-members-of nid nm owners nmap)) who))
::  set-logical-members: write the supplied logical set verbatim, including empty (an
::  explicit empty row means "transport peers may exist but zero logical humans").
++  set-logical-members
  |=  [nid=@ta s=(set @p) nm=(map @ta (set @p))]
  ^-  (map @ta (set @p))
  (~(put by nm) nid s)
::  ensure-note-members: give every live note an EXPLICIT note-members row (incl. empty)
::  on load, so visibility never depends on the derive-fallback for an existing note (a
::  transport carrier can't be resurrected as a human). Ordinary note -> note.users;
::  actor-owned note -> note.users minus owner.host. Leaves present rows untouched.
++  ensure-note-members
  |=  $:  nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
          owners=(map @ta actor-owner:noltbook)
      ==
  ^-  (map @ta (set @p))
  %-  ~(rep by nmap)
  |=  [[nid=@ta nt=note:noltbook] acc=(map @ta (set @p))]
  ?:  (~(has by acc) nid)  acc
  =/  o=(unit actor-owner:noltbook)  (~(get by owners) nid)
  =/  mem=(set @p)  ?~(o users.nt (~(del in users.nt) host.u.o))
  (~(put by acc) nid mem)
::  add/del-member-to-ids: apply a logical membership change across a root + its shared
::  descendants (mirrors the note.users cascade). Always writes rows (incl. empty).
++  add-member-to-ids
  |=  $:  who=@p  ids=(list @ta)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  ?~  ids  nm
  $(ids t.ids, nm (put-logical-member i.ids who nm owners nmap))
++  del-member-from-ids
  |=  $:  who=@p  ids=(list @ta)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  ?~  ids  nm
  $(ids t.ids, nm (del-logical-member i.ids who nm owners nmap))
::  add-ships-to-ids: add a SET of humans across a root+descendants (batch invite cascade).
++  add-ships-to-ids
  |=  $:  whos=(set @p)  ids=(list @ta)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  %-  ~(rep in whos)
  |=  [w=@p acc=_nm]
  (add-member-to-ids w ids acc owners nmap)
::  drop-local-notes-facts: remove ONLY the local-human global-/notes facts from a card
::  list (a give-fact on exactly ~[/notes]); preserves /notes/[nid] transport facts and
::  every %pass/remote card. Used to strip leaks from re-entered handler card lists.
++  drop-local-notes-facts
  |=  cards=(list card:agent:gall)
  ^-  (list card:agent:gall)
  %+  skip  cards
  |=  c=card:agent:gall
  ^-  ?
  ?=([%give %fact [[%notes ~] ~] *] c)
::  human-note-cards (1B.2): the central card-gating choke point. If the local human
::  logically sees nid -> return cards unchanged; otherwise strip ONLY the global
::  ~[/notes] facts (drop-local-notes-facts), preserving /notes/[nid] transport facts,
::  every %pass/remote card, /api/results, and unrelated global facts. Applied at the
::  return of handlers that mutate a single note and mix local-human + transport cards.
++  human-note-cards
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          cards=(list card:agent:gall)
      ==
  ^-  (list card:agent:gall)
  ?:  (human-sees-note nid who nm owners nmap)  cards
  (drop-local-notes-facts cards)
::  drop-local-relay-facts (1B.3): for the on-agent SUBSCRIBER relay, the local browser
::  subscribes to BOTH ~[/notes] and ~[/notes/[nid]], so a transport-only carrier must
::  drop a single-path give-fact on EITHER (any path whose head is %notes). Preserves
::  %pass, /api/results, and multi-path/unrelated facts.
++  drop-local-relay-facts
  |=  cards=(list card:agent:gall)
  ^-  (list card:agent:gall)
  %+  skip  cards
  |=  c=card:agent:gall
  ^-  ?
  ?=([%give %fact [[%notes *] ~] *] c)
::  human-relay-cards (1B.3): on-agent relay gate. Human sees nid -> relay unchanged;
::  else drop BOTH the global /notes and the note-specific /notes/[nid] browser facts.
++  human-relay-cards
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
          cards=(list card:agent:gall)
      ==
  ^-  (list card:agent:gall)
  ?:  (human-sees-note nid who nm owners nmap)  cards
  (drop-local-relay-facts cards)
::  visible-note-ids: every nid the local human principal may see (system + member).
++  visible-note-ids
  |=  $:  who=@p
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
          nmap=(map @ta note:noltbook)
      ==
  ^-  (set @ta)
  %-  ~(gas in *(set @ta))
  %+  murn  ~(tap by nmap)
  |=  [nid=@ta n=note:noltbook]
  ^-  (unit @ta)
  ?:  (human-sees-note nid who nm owners nmap)  `nid  ~
::  can-user-post: the NEW gate for ordinary (non-actor) human posting — not write-
::  blocked AND a logical member. The existing writable/muted/role checks remain at
::  the call sites; creator==our.bowl alone never satisfies this for an actor note.
++  can-user-post
  |=  $:  nid=@ta  who=@p
          hs=(map @ta ?(%host-deleted %host-unreachable))
          nmap=(map @ta note:noltbook)
          nm=(map @ta (set @p))
          owners=(map @ta actor-owner:noltbook)
      ==
  ^-  ?
  ?:  (is-write-blocked nid hs nmap who)  %.n
  (human-sees-note nid who nm owners nmap)
::  App Notifications: expired rows are hidden from reads/snapshots; no periodic job.
++  app-notifications-live
  |=  [m=(map [@tas @t] app-notification:noltbook) now=@da]
  ^-  (map [@tas @t] app-notification:noltbook)
  %-  ~(gas by *(map [@tas @t] app-notification:noltbook))
  %+  murn  ~(tap by m)
  |=  [k=[@tas @t] n=app-notification:noltbook]
  ^-  (unit [[@tas @t] app-notification:noltbook])
  ?:  ?&  ?=(^ expires-at.n)
          (lte u.expires-at.n now)
      ==
    ~
  `[k n]
++  api-app-notification-json
  |=  n=app-notification:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.n)]
      ['appTitle' ?~(app-title.n ~ s+u.app-title.n)]
      ['publisher' ?~(publisher.n ~ s+(scot %p u.publisher.n))]
      ['id' s+id.n]
      ['title' s+title.n]
      ['body' ?~(body.n ~ s+u.body.n)]
      ['href' ?~(href.n ~ s+u.href.n)]
      ['noteId' ?~(note-id.n ~ s+(crip (trip u.note-id.n)))]
      ['artifactId' ?~(artifact-id.n ~ s+(crip (trip u.artifact-id.n)))]
      ['level' s+(scot %tas level.n)]
      ['createdAt' (numb:enjs:format (api-da-ms created-at.n))]
      ['updatedAt' (numb:enjs:format (api-da-ms updated-at.n))]
      ['expiresAt' ?~(expires-at.n ~ (numb:enjs:format (api-da-ms u.expires-at.n)))]
  ==
++  app-notifications-cards
  |=  [paths=(list path) m=(map [@tas @t] app-notification:noltbook) now=@da]
  ^-  (list card:agent:gall)
  =/  live  (app-notifications-live m now)
  ~[(gf-paths paths `update:noltbook`[%app-notifications-updated ~(val by live)])]
--
%-  agent:dbug
=|  state-66
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
  ?:  ?=([%43 *] q.old)
    =/  s43  !<(state-43 old)
    $(old !>((upgrade-43-to-44 s43)))
  ?:  ?=([%44 *] q.old)
    =/  s44  !<(state-44 old)
    $(old !>((upgrade-44-to-45 s44)))
  ?:  ?=([%45 *] q.old)
    =/  s45  !<(state-45 old)
    $(old !>((upgrade-45-to-46 s45)))
  ?:  ?=([%46 *] q.old)
    =/  s46  !<(state-46 old)
    $(old !>((upgrade-46-to-47 s46)))
  ?:  ?=([%47 *] q.old)
    =/  s47  !<(state-47 old)
    $(old !>((upgrade-47-to-48 s47)))
  ?:  ?=([%48 *] q.old)
    =/  s48  !<(state-48 old)
    $(old !>((upgrade-48-to-49 s48)))
  ?:  ?=([%49 *] q.old)
    =/  s49  !<(state-49 old)
    $(old !>((upgrade-49-to-50 s49)))
  ?:  ?=([%50 *] q.old)
    =/  s50  !<(state-50 old)
    $(old !>((upgrade-50-to-51 s50)))
  ?:  ?=([%51 *] q.old)
    =/  s51  !<(state-51 old)
    $(old !>((upgrade-51-to-52 s51)))
  ?:  ?=([%52 *] q.old)
    =/  s52  !<(state-52 old)
    $(old !>((upgrade-52-to-53 s52)))
  ?:  ?=([%53 *] q.old)
    =/  s53  !<(state-53 old)
    $(old !>((upgrade-53-to-54 s53)))
  ?:  ?=([%54 *] q.old)
    =/  s54  !<(state-54 old)
    $(old !>((upgrade-54-to-55 s54)))
  ?:  ?=([%55 *] q.old)
    =/  s55  !<(state-55 old)
    $(old !>((upgrade-55-to-56 s55)))
  ?:  ?=([%56 *] q.old)
    =/  s56  !<(state-56 old)
    $(old !>((upgrade-56-to-57 s56)))
  ?:  ?=([%57 *] q.old)
    =/  s57  !<(state-57 old)
    $(old !>((upgrade-57-to-58 s57)))
  ?:  ?=([%58 *] q.old)
    =/  s58  !<(state-58 old)
    $(old !>((upgrade-58-to-59 s58)))
  ?:  ?=([%59 *] q.old)
    =/  s59  !<(state-59 old)
    $(old !>((upgrade-59-to-60 s59)))
  ?:  ?=([%60 *] q.old)
    =/  s60  !<(state-60 old)
    $(old !>((upgrade-60-to-61 s60)))
  ?:  ?=([%61 *] q.old)
    =/  s61  !<(state-61 old)
    $(old !>((upgrade-61-to-62 s61)))
  ?:  ?=([%62 *] q.old)
    =/  s62  !<(state-62 old)
    $(old !>((upgrade-62-to-63 s62)))
  ?:  ?=([%63 *] q.old)
    =/  s63  !<(state-63 old)
    $(old !>((upgrade-63-to-64 s63)))
  ?:  ?=([%64 *] q.old)
    =/  s64  !<(state-64 old)
    $(old !>((upgrade-64-to-65 our.bowl s64)))
  ?:  ?=([%66 *] q.old)
    =/  loaded  !<(state-66 old)
    =/  loaded=state-66
      %=  loaded
        active-calls       *(map @ta call-info:noltbook)
        note-members       (ensure-note-members note-members.loaded notes.loaded note-actor-owners.loaded)
        app-notifications  (app-notifications-live app-notifications.loaded now.bowl)
      ==
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state loaded)]
  ?:  ?=([%65 *] q.old)
    =/  loaded  !<(state-65 old)
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
    ::  1B.1: give every live note an EXPLICIT note-members row (incl. empty) so human
    ::  visibility never depends on the derive-fallback for an existing %65 note.
=/  loaded=state-65
      loaded(note-members (ensure-note-members note-members.loaded notes.loaded note-actor-owners.loaded))
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-65-to-66 loaded(active-calls *(map @ta call-info:noltbook))))]
  ?:  ?=([%42 *] q.old)
    =/  s42  !<(state-42 old)
    $(old !>((upgrade-42-to-43 s42)))
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
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl loaded(active-calls *(map @ta call-info:noltbook))))]
  ?:  ?=([%19 *] q.old)
    =/  s19  !<(state-19 old)
    =/  loaded  (upgrade-19-to-20 s19)
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl loaded(active-calls *(map @ta call-info:noltbook))))]
  ?:  ?=([%18 *] q.old)
    =/  s18  !<(state-18 old)
    =/  loaded  (upgrade-19-to-20 (upgrade-18-to-19 s18))
    =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
    =/  prof-cards=(list card)
      %+  turn  ~(tap in peers.loaded)
      |=  p=@p
      ^-  card
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl loaded(active-calls *(map @ta call-info:noltbook))))]
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
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl loaded(active-calls *(map @ta call-info:noltbook))))]
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
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl loaded(active-calls *(map @ta call-info:noltbook))))]
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
      (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
    [prof-cards this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 s16))))))]
  ?:  ?=([%14 *] q.old)
    =/  loaded  !<(state-14 old)
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 loaded))))))))
  ?:  ?=([%13 *] q.old)
    =/  loaded  !<(state-13 old)
    =/  s15  (upgrade-14-to-15 (upgrade-13-to-14 loaded))
    =/  s15  ?.  (~(has by notes.s15) %ars-rumors)
      =/  rumors=note-17  [%ars-rumors 'RUMORS' %cover our.bowl (sy ~[our.bowl]) ~ ~ ~ ~ %secret ~ & ~]
      s15(notes (~(put by notes.s15) %ars-rumors rumors), messages (~(put by messages.s15) %ars-rumors *(list message-18)))
    s15
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 s15)))))))
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
    `this(state (upgrade-64-to-65 our.bowl s19))
  ::  state-11 → state-19
  ?:  ?=([%11 *] q.old)
    =/  s11  !<(state-11 old)
    =/  s19  (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 s11)))))))))
    `this(state (upgrade-64-to-65 our.bowl s19))
  ::  state-10 → ... → state-19
  ?:  ?=([%10 *] q.old)
    =/  s10  !<(state-10 old)
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 s10))))))))))))
  ::  state-9 → ... → state-19
  ?:  ?=([%9 *] q.old)
    =/  s9  !<(state-9 old)
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 s9)))))))))))))
  ::  state-8 → ... → state-20
  ?:  ?=([%8 *] q.old)
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 !<(state-8 old)))))))))))))))
  ::  state-7 → ... → state-20
  ?:  ?=([%7 *] q.old)
    =/  s7  !<(state-7 old)
    =/  s8=state-8
      [%8 notes.s7 messages.s7 artifacts.s7 profiles.s7 transactions.s7 current-note.s7 peers.s7 has-avatar.s7 pal-outgoing.s7 pal-incoming.s7 pal-blocked.s7 0 ~]
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
  ::  state-6 → ... → state-19
  ?:  ?=([%6 *] q.old)
    =/  s6  !<(state-6 old)
    =/  s8=state-8
      [%8 notes.s6 messages.s6 artifacts.s6 profiles.s6 transactions.s6 current-note.s6 peers.s6 has-avatar.s6 peers.s6 ~ ~ 0 ~]
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
  ?:  ?=([%5 *] q.old)
    =/  s5  !<(state-5 old)
    =/  new-profiles=(map @p profile:noltbook)
      %-  ~(run by profiles.s5)
      |=  p=profile-2
      ^-  profile:noltbook
      [display-name.p ~ wallet-address.p azimuth-address.p]
    =/  s8=state-8
      [%8 notes.s5 messages.s5 artifacts.s5 new-profiles transactions.s5 current-note.s5 peers.s5 %.n ~ ~ ~ 0 ~]
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
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
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
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
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
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
    `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
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
  `this(state (upgrade-64-to-65 our.bowl (upgrade-19-to-20 (upgrade-18-to-19 (upgrade-17-to-18 (upgrade-16-to-17 (upgrade-15-to-16 (upgrade-14-to-15 (upgrade-13-to-14 (upgrade-12-to-13 (upgrade-11-to-12 (upgrade-10-to-11 (upgrade-9-to-10 (upgrade-8-to-9 s8))))))))))))))
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%api %results ~]
    ::  same-ship %noltbook-api clients observe per-request result facts here.
    ::  No backlog/initial state: results are only emitted live going forward.
    `this
  ::
      [%notes ~]
    ::  local frontend only
    =/  sys  (ensure-system-notes notes messages our.bowl)
    =/  notes-now=(map @ta note:noltbook)  notes.sys
    =/  messages-now=(map @ta (list message:noltbook))  messages.sys
    ::  Phase 1B: the local human principal only hydrates notes it logically sees
    ::  (system notes + note-members), so hidden actor-owned notes vanish on reconnect.
    ::  note-list stays an authoritative replacement; every per-note snapshot below is
    ::  guarded by vis-set so we never hydrate state for a note the human can't see.
    =/  vis-set=(set @ta)
      (visible-note-ids our.bowl note-members note-actor-owners notes-now)
    =/  note-list=(list note:noltbook)
      (skim ~(val by notes-now) |=(n=note:noltbook (~(has in vis-set) id.n)))
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
      %+  murn  ~(tap by mentions)
      |=  [nid=@ta mns=(list [id=@da eid=(unit @uv) author=@p])]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%mention-update nid mns])
    ::  Phase A: also send the typed directed-attention state (mentions mirrored
    ::  + stored reply/send attention) so the frontend's state.attention is current.
    ::  full=& : authoritative per-note snapshot (frontend replaces that note's list)
    =/  attention-cards=(list card)
      %+  murn  ~(tap by (all-attention mentions attention))
      |=  [nid=@ta its=(list attention-item:noltbook)]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%attention-update nid its %.y])
    ::  send active call states
    =/  call-cards=(list card)
      %+  murn  ~(tap by active-calls)
      |=  [nid=@ta ci=call-info:noltbook]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%call-state nid ci])
    ::  send live "active" status snapshots (unexpired only) so the sidebar shows
    ::  them after a hard refresh / reconnect, like active call states.
    =/  active-cards=(list card)
      %+  murn  ~(tap by (active-live note-active now.bowl))
      |=  [nid=@ta a=note-active:noltbook]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%note-active-updated nid `a])
    ::  send pending join requests (host only sees their own)
    =/  jr-list=(list [note-id=@ta ship=@p note-name=@t])
      %-  zing
      %+  turn  ~(tap by join-requests)
      |=  [nid=@ta ships=(set @p)]
      ?.  (~(has in vis-set) nid)  ~
      =/  note  (~(get by notes-now) nid)
      ?~  note  ~
      (turn ~(tap in ships) |=(s=@p [nid s name.u.note]))
    =/  jr-cards=(list card)
      ?~  jr-list  ~
      ~[(gf-paths ~ `update:noltbook`[%join-request-list jr-list])]
    ::  send admin/muted role state for each note
    =/  role-cards=(list card)
      %-  zing
      %+  turn  ~(tap by notes-now)
      |=  [nid=@ta n=note:noltbook]
      ?.  (~(has in vis-set) nid)  *(list card)
      =/  adms=(set @p)  (fall (~(get by note-admins) nid) ~)
      =/  mts=(set @p)  (fall (~(get by note-muted) nid) ~)
      =/  out=(list card)  ~
      =?  out  !=(~ adms)
        [(gf-paths ~ `update:noltbook`[%admins-updated nid ~(tap in adms)]) out]
      =?  out  !=(~ mts)
        [(gf-paths ~ `update:noltbook`[%muted-updated nid ~(tap in mts)]) out]
      out
    ::  send blocked-by list so frontend knows who has us blocked
    =/  bb-cards=(list card)
      =/  bb-list=(list @p)  ~(tap in blocked-by)
      ?~  bb-list  ~
      ~[(gf-paths ~ `update:noltbook`[%blocked-by-list bb-list])]
    ::  replay host-status entries so host-deleted banners persist over refresh
    =/  hs-cards=(list card)
      %+  murn  ~(tap by host-status)
      |=  [nid=@ta st=?(%host-deleted %host-unreachable)]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%note-host-status nid `st])
    ::  replay lineage for every note so v1/vN ~host badges render after
    ::  refresh. Falls back to defaults for notes without explicit lineage
    ::  (origin = sham[creator id], version = 1, fork-of = ~).
    =/  lineage-cards=(list card)
      %+  murn  ~(tap by notes-now)
      |=  [nid=@ta n=note:noltbook]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      =/  origin=@uv  (lineage-origin-of n fork-origin)
      =/  version=@ud  (lineage-version-of nid fork-version)
      =/  parent=(unit [host=@p nid=@ta])  (~(get by fork-of) nid)
      =/  parent-ver=(unit @ud)
        =/  stored  (~(get by fork-parent-version) nid)
        ?^  stored  `u.stored
        ?:  (gth version 1)  `(sub version 1)
        ~
      `(gf-paths ~ `update:noltbook`[%note-lineage-set nid origin version parent parent-ver])
    ::  replay pending fork invites so the receiver sees the banner again
    ::  after refresh.
    =/  pfi-cards=(list card)
      %+  murn  ~(tap by pending-fork-invites)
      |=  [nid=@ta pi=pending-fork-invite:noltbook]
      ^-  (unit card)
      ?.  (~(has in vis-set) nid)  ~
      `(gf-paths ~ `update:noltbook`[%fork-invite-received root-id.pi source-name.pi source-version.pi sender.pi])
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
      ~[(gf-paths ~ `update:noltbook`[%notification-acks ack-list])]
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
      ?.  (~(has in vis-set) nid)  $(pairs t.pairs)
      $(pairs t.pairs, acc (~(put by acc) nid t.i.pairs))
    =/  activity-cards=(list card)
      =/  act-list=(list [@ta @da])  ~(tap by pruned-activity)
      ~[(gf-paths ~ `update:noltbook`[%note-activity-list act-list])]
    ::  durable green-unread last-read: prune like note-activity, then replay.
    ::  Always emit (even empty) to replace stale frontend read state.
    =/  pruned-read=(map @ta @da)
      =/  pairs=(list [nid=@ta t=@da])  ~(tap by note-read)
      =/  acc=(map @ta @da)  *(map @ta @da)
      |-  ^-  (map @ta @da)
      ?~  pairs  acc
      =/  nid=@ta  nid.i.pairs
      ?:  |(=(nid %cover) =(nid %ars-rumors))  $(pairs t.pairs)
      ?.  (~(has in vis-set) nid)  $(pairs t.pairs)
      $(pairs t.pairs, acc (~(put by acc) nid t.i.pairs))
    =/  read-cards=(list card)
      =/  read-list=(list [@ta @da])  ~(tap by pruned-read)
      ~[(gf-paths ~ `update:noltbook`[%note-read-list read-list])]
    ::  Phase B: durable UNREAD activity — prune like note-activity, then replay so the
    ::  green dot survives a hard refresh. Always emit (even empty) to replace stale state.
    =/  pruned-unread-activity=(map @ta @da)
      =/  pairs=(list [nid=@ta t=@da])  ~(tap by note-unread-activity)
      =/  acc=(map @ta @da)  *(map @ta @da)
      |-  ^-  (map @ta @da)
      ?~  pairs  acc
      =/  nid=@ta  nid.i.pairs
      ?:  |(=(nid %cover) =(nid %ars-rumors))  $(pairs t.pairs)
      ?.  (~(has in vis-set) nid)  $(pairs t.pairs)
      $(pairs t.pairs, acc (~(put by acc) nid t.i.pairs))
    =/  unread-activity-cards=(list card)
      =/  ua-list=(list [@ta @da])  ~(tap by pruned-unread-activity)
      ~[(gf-paths ~ `update:noltbook`[%note-unread-activity-list ua-list])]
    ::  Phase B: replay the real user's actor mute/block prefs on watch (full snapshot,
    ::  even empty), so the frontend hides blocked content + sets button state on connect.
    =/  user-prefs-cards=(list card)
      ~[(user-actor-prefs-fact ~ user-muted-actors user-blocked-actors)]
    ::  App Notifications: full authoritative Grimoire snapshot (expired rows omitted).
    =/  pruned-app-notifications=(map [@tas @t] app-notification:noltbook)
      (app-notifications-live app-notifications now.bowl)
    =/  app-notification-cards=(list card)
      (app-notifications-cards ~ pruned-app-notifications now.bowl)
    =/  init-cards=(list card)
      :~  (gf-paths ~ upd)
          (gf-paths ~ pupd)
          (gf-paths ~ palupd)
          (gf-paths ~ contactupd)
          (gf-paths ~ dialupd)
      ==
    ::  Phase G5A: replay only VALID LIVE actor-DM markers (note exists + invariant
    ::  holds, via live-actor-dm) so the frontend never hydrates a broken marker.
    =/  actor-dm-cards=(list card)
      %+  murn  ~(tap by actor-dm-notes)
      |=  [nid=@ta meta=actor-dm-meta:noltbook]
      ^-  (unit card)
      ::  Phase 1B: the actor-DM marker is human-DM presentation — only the logical
      ::  participant (the target human) hydrates it; the owner's transport host does not.
      ?.  (~(has in vis-set) nid)  ~
      =/  live  (live-actor-dm nid notes-now actor-dm-notes)
      ?~  live  ~
      `(gf-paths ~ `update:noltbook`[%actor-dm-updated nid `u.live])
    :_  this(notes notes-now, messages messages-now, notification-acks pruned-acks, note-activity pruned-activity, note-unread-activity pruned-unread-activity, note-read pruned-read, app-notifications pruned-app-notifications)
    :(weld init-cards mention-cards attention-cards call-cards active-cards jr-cards role-cards bb-cards hs-cards lineage-cards pfi-cards ack-cards activity-cards read-cards unread-activity-cards user-prefs-cards app-notification-cards actor-dm-cards)
  ::
      [%notes @ ~]
    =/  nid=@ta  i.t.path
    ::  permission check. Phase 1B: a LOCAL (src==our) human subscription must pass
    ::  logical membership (system notes exempt) so the human can't open a hidden
    ::  actor-owned note via /notes/[nid]; local apps use the developer/actor API reads.
    ::  REMOTE subscribers stay authorized by note.users (transport) — this never blocks
    ::  a remote actor carrier whose human is not a logical member.
    ?>  ?|  ?&  =(src.bowl our.bowl)
                (human-sees-note nid our.bowl note-members note-actor-owners notes)
            ==
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
        ::  non-gossip: always send full messages + the via rows for this snapshot
        ~[(gf-paths ~ `update:noltbook`[%message-list nid msgs arts (api-via-snapshot msgs arts via-by-eid) (api-actor-snapshot msgs actor-by-eid)])]
      ?:  is-local
        ::  local frontend: own-authored messages + all envelopes for re-fetch
        ::  Phase 11C hardening: hydrate stored envs' via before sending.
        =/  all-envs=(list envelope:noltbook)  (api-envs-hydrate ~(val by nenv) via-by-eid)
        =/  env-cards=(list card)
          ?~  all-envs  ~
          ~[(gf-paths ~ `update:noltbook`[%envelope-list nid all-envs])]
        [(gf-paths ~ `update:noltbook`[%message-list nid msgs arts (api-via-snapshot msgs arts via-by-eid) (api-actor-snapshot msgs actor-by-eid)]) env-cards]
      ::  remote peer: send envelopes for everything (own msgs as envelopes too).
      ::  Phase 11C: recover via from via-by-eid so a new remote subscriber's
      ::  envelope snapshot carries attribution.
      =/  msg-envs=(list envelope:noltbook)
        (turn msgs |=(m=message:noltbook (api-env-of m via-by-eid)))
      =/  all-env-ids=(set @da)  (sy (turn msg-envs |=(e=envelope:noltbook msg-id.e)))
      =/  extra-envs=(list envelope:noltbook)
        (skim ~(val by nenv) |=(e=envelope:noltbook !(~(has in all-env-ids) msg-id.e)))
      ::  Phase 11C hardening: hydrate stored envs' via (msg-envs already carry it).
      =/  all-envs=(list envelope:noltbook)  (api-envs-hydrate (weld msg-envs extra-envs) via-by-eid)
      ?~  all-envs  ~
      ~[(gf-paths ~ `update:noltbook`[%envelope-list nid all-envs])]
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
      ~[(gf-paths ~ `update:noltbook`[%call-state nid u.ci])]
    ::  send role state for this note
    =/  note-role-cards=(list card)
      =/  adms=(set @p)  (fall (~(get by note-admins) nid) ~)
      =/  mts=(set @p)  (fall (~(get by note-muted) nid) ~)
      =/  out=(list card)  ~
      =?  out  !=(~ adms)
        [(gf-paths ~ `update:noltbook`[%admins-updated nid ~(tap in adms)]) out]
      =?  out  !=(~ mts)
        [(gf-paths ~ `update:noltbook`[%muted-updated nid ~(tap in mts)]) out]
      out
    ::  send the current pin snapshot so a (re)subscribing member renders the pin
    ::  even if it missed the live %note-pin-updated fact (durable, like roles).
    =/  pin-snapshot-cards=(list card)
      =/  pin  (~(get by note-pins) nid)
      ?~  pin  ~
      ~[(gf-paths ~ `update:noltbook`[%note-pin-updated nid pin])]
    ::  send the live "active" status snapshot for this note (unexpired only).
    =/  active-snapshot-cards=(list card)
      =/  a  (~(get by note-active) nid)
      ?~  a  ~
      ?:  (lte expires-at.u.a now.bowl)  ~
      ~[(gf-paths ~ `update:noltbook`[%note-active-updated nid `u.a])]
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
      ~[(gf-paths ~ `update:noltbook`[%join-request-list jr-list])]
    =/  is-group-note=?
      ?&  ?=(^ note-for-type)
          =(%group type.u.note-for-type)
      ==
    =/  art-env-cards=(list card)
      ?.  |(is-gossip-note is-group-note)  ~
      =/  aenv-map  (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
      =/  aenvs  ~(val by aenv-map)
      ?~  aenvs  ~
      ~[(gf-paths ~ `update:noltbook`[%artifact-envelope-list nid aenvs])]
    :_  this(peers new-peers)
    :(weld init-cards ~[(gf-paths ~ pupd)] intro-cards call-cards note-role-cards pin-snapshot-cards active-snapshot-cards jr-admin-cards art-env-cards)
  ::
      [%http-response @ ~]
    `this
  ==
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+  path  (on-peek:def path)
  ::  Developer API v1 stable read shapes (returned as %json, owned by the API).
      [%x %api %notes ~]
    ::  Phase 1B: /api/notes is the local human principal's list — only logically
    ::  visible notes (system + note-members); hidden actor-owned notes never appear.
    =/  jon=json
      %+  frond:enjs:format  'notes'
      :-  %a
      %+  turn
        %+  skim  ~(val by notes)
        |=(n=note:noltbook (human-sees-note id.n our.bowl note-members note-actor-owners notes))
      |=(n=note:noltbook (api-note-json n (~(get by note-apps) id.n) (~(get by note-active) id.n) now.bowl ~(wyt in (logical-members-of id.n note-members note-actor-owners notes))))
    ``[%json !>(jon)]
  ::  App Notifications: durable high-level plugin rows for the real user's Grimoire.
  ::
      [%x %api %app-notifications ~]
    =/  live=(map [@tas @t] app-notification:noltbook)
      (app-notifications-live app-notifications now.bowl)
    =/  jon=json
      %+  frond:enjs:format  'notifications'
      a+(turn ~(val by live) api-app-notification-json)
    ``[%json !>(jon)]
  ::  Actor Control (Phase A) host/developer reads.
  ::
      [%x %api %actor-grants ~]
    =/  jon=json
      %+  frond:enjs:format  'grants'
      a+(turn ~(val by app-grants) api-grant-json)
    ``[%json !>(jon)]
  ::  Phase B: the REAL user's actor mute/block prefs. Stable [host,desk,id] only —
  ::  profile/display resolution stays client-side. Always 200 (empty lists if none).
  ::
      [%x %api %user %actor-preferences ~]
    =/  ref-json
      |=  r=actor-ref:noltbook  ^-  json
      %-  pairs:enjs:format
      :~  ['host' s+(scot %p host.r)]
          ['desk' s+(scot %tas desk.r)]
          ['id' s+id.r]
      ==
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['muted' a+(turn ~(tap in user-muted-actors) ref-json)]
          ['blocked' a+(turn ~(tap in user-blocked-actors) ref-json)]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %actors ~]
    =/  jon=json
      %+  frond:enjs:format  'actors'
      :-  %a
      %+  turn  ~(tap by actor-registry)
      |=([k=[@tas @t] r=actor-record:noltbook] (api-actor-record-json -.k r))
    ``[%json !>(jon)]
  ::
      [%x %api %actors @ ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  jon=json
      %+  frond:enjs:format  'actors'
      :-  %a
      %+  murn  ~(tap by actor-registry)
      |=  [k=[@tas @t] r=actor-record:noltbook]
      ^-  (unit json)
      ?.  =(-.k dterm)  ~
      `(api-actor-record-json -.k r)
    ``[%json !>(jon)]
  ::  one actor's registry record (Phase F1). Missing actor => no cage (404).
  ::
      [%x %api %actors @ @ ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    =/  rec  (~(get by actor-registry) [dterm aid])
    ?~  rec  ~
    ``[%json !>((api-actor-record-json dterm u.rec))]
  ::  one actor's full profile (Phase F1): registry name/kind/status + actor-profile.
  ::
      [%x %api %actors @ @ %profile ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    =/  rec  (~(get by actor-registry) [dterm aid])
    ?~  rec  ~
    =/  prof  (~(get by actor-profiles) [dterm aid])
    ``[%json !>((api-actor-profile-json our.bowl dterm aid u.rec prof))]
  ::  actor public profile incl. REMOTE (Phase G4): local host resolves the current
  ::  local profile (stale:false, fetchedAt:null); a remote host returns the CACHED
  ::  profile plus fetchedAt + stale (older than ~m10); unknown/uncached => 404.
  ::
      [%x %api %actor-profiles @ @ @ ~]
    =/  who=(unit @p)  (slaw %p i.t.t.t.path)
    ?~  who  ~
    =/  dterm=@tas  (fall (rush i.t.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.t.path
    ?:  =(u.who our.bowl)
      =/  rec  (~(get by actor-registry) [dterm aid])
      ?~  rec  ~
      =/  pp  (build-actor-public-profile dterm u.rec (~(get by actor-profiles) [dterm aid]))
      =/  base  (api-actor-pub-json our.bowl pp)
      ?.  ?=([%o *] base)  ~
      =/  obj  (~(put by p.base) 'fetchedAt' ~)
      ``[%json !>([%o (~(put by obj) 'stale' b+%.n)])]
    =/  cached  (~(get by remote-actor-profiles) [u.who dterm aid])
    ?~  cached  ~
    =/  base  (api-actor-pub-json u.who profile.u.cached)
    ?.  ?=([%o *] base)  ~
    =/  stale=?  !(actor-prof-fresh now.bowl fetched-at.u.cached)
    =/  obj  (~(put by p.base) 'fetchedAt' (numb:enjs:format (api-da-ms fetched-at.u.cached)))
    ``[%json !>([%o (~(put by obj) 'stale' b+stale)])]
  ::  one actor's contact book (Phase F2): stable tagged refs only. 404 if no actor.
  ::
      [%x %api %actors @ @ %contacts ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    =/  rec  (~(get by actor-registry) [dterm aid])
    ?~  rec  ~
    =/  cset=(set identity-ref:noltbook)  (fall (~(get by actor-contacts) [dterm aid]) ~)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['host' s+(scot %p our.bowl)]
          ['desk' s+(scot %tas dterm)]
          ['id' s+aid]
          ['contacts' a+(turn ~(tap in cset) api-identity-ref-json)]
      ==
    ``[%json !>(jon)]
  ::  one actor's identity mute/block preferences (Phase F3): stable tagged refs;
  ::  stored-only, no filtering. 404 if no actor.
  ::
      [%x %api %actors @ @ %preferences ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    =/  rec  (~(get by actor-registry) [dterm aid])
    ?~  rec  ~
    =/  prefs=actor-preferences:noltbook
      (fall (~(get by actor-preferences) [dterm aid]) [~ ~])
    ``[%json !>((api-preferences-json our.bowl dterm aid prefs))]
  ::  Actor-scoped notification read (Phase G6B): this actor's durable directed reply
  ::  notifications, NEWEST-FIRST. author/actor/preview are resolved live (current
  ::  edited preview); unresolvable rows (replying message gone) are dropped. 404 if
  ::  the actor is not registered. Read-only — never mutates state.
  ::
      [%x %api %actors @ @ %notifications ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    ?~  (~(get by actor-registry) [dterm aid])  ~
    =/  views=(list actor-notification-view:noltbook)
      (actor-notif-views (fall (~(get by actor-notifications) [dterm aid]) ~) messages actor-by-eid)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['host' s+(scot %p our.bowl)]
          ['desk' s+(scot %tas dterm)]
          ['id' s+aid]
          ['notifications' a+(turn views api-actor-notif-json)]
      ==
    ``[%json !>(jon)]
  ::  Actor-scoped note list (Phase G2): only notes this actor owns or participates
  ::  in, filtered to LIVE notes. 404 if the actor is not registered. No artifacts.
  ::
      [%x %api %actors @ @ %dms ~]
    ::  Actor DM list (Phase G5A): only valid LIVE actor-DM notes this actor owns or has
    ::  adopted. owner host sees the target ship; an adopted target sees the owner actor.
    ::  No artifacts. 404 if the actor is not registered.
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    ?~  (~(get by actor-registry) [dterm aid])  ~
    =/  jon=json
      %+  frond:enjs:format  'dms'
      :-  %a
      %+  murn  ~(tap by actor-dm-notes)
      |=  [nid=@ta meta=actor-dm-meta:noltbook]
      ^-  (unit json)
      =/  nt-u  (~(get by notes) nid)
      ?~  nt-u  ~
      ::  G5A hardening: authorize through the SAME host-role gate as actions — this
      ::  validates the marker (actor-dm-valid) AND enforces owner-host-only / single-
      ::  adopter-only. A stale participation row therefore never exposes a DM here.
      =/  acc  (actor-note-access our.bowl nid dterm aid notes note-actor-owners actor-note-roster actor-dm-notes)
      ?:  ?=(%.n -.acc)  ~
      ::  owned: derived from the AUTHORITATIVE marker owner (not a participation row).
      =/  owned=?
        ?&(=(host.owner.meta our.bowl) =(desk.owner.meta dterm) =(id.owner.meta aid))
      ::  adopted: the valid target-host role only (access already succeeded, not owner).
      =/  adopted=?  &(=(target.meta our.bowl) !owned)
      =/  activity=@da  (newest-msg-da (fall (~(get by messages) nid) ~))
      =/  read=@da  (actor-read-get actor-note-read dterm aid nid)
      :-  ~
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['actorDm' (api-actor-dm-json meta)]
          ['target' s+(scot %p target.meta)]
          ['counterpart' ?:(owned s+(scot %p target.meta) (api-actor-dm-json meta))]
          ['createdAt' (numb:enjs:format (api-da-ms created-at.meta))]
          ['lastAuthor' ?~(last-author.u.nt-u ~ s+(scot %p u.last-author.u.nt-u))]
          ['lastPreview' ?~(last-preview.u.nt-u ~ s+u.last-preview.u.nt-u)]
          ['owned' b+owned]
          ['adopted' b+adopted]
          ['activity' ?:(=(`@da`0 activity) ~ (numb:enjs:format (api-da-ms activity)))]
          ['read' ?:(=(`@da`0 read) ~ (numb:enjs:format (api-da-ms read)))]
          ['unread' b+(gth activity read)]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %actors @ @ %notes ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    ?~  (~(get by actor-registry) [dterm aid])  ~
    =/  owned-ids=(list @ta)
      %+  murn  ~(tap by note-actor-owners)
      |=  [nid=@ta o=actor-owner:noltbook]
      ^-  (unit @ta)
      ?:(?&(=(host.o our.bowl) =(desk.o dterm) =(id.o aid)) `nid ~)
    =/  part-ids=(list @ta)
      %+  murn  ~(tap by actor-note-roster)
      |=  [nid=@ta s=(set actor-ref:noltbook)]
      ^-  (unit @ta)
      ?:((~(has in s) [our.bowl dterm aid]) `nid ~)
    =/  all-ids=(set @ta)
      %-  ~(gas in *(set @ta))
      (weld owned-ids part-ids)
    =/  jon=json
      %+  frond:enjs:format  'notes'
      :-  %a
      %+  murn  ~(tap in all-ids)
      |=  nid=@ta
      ^-  (unit json)
      ::  single source of truth: actor-note-access enforces LIVE note + eligible
      ::  type (%notebook/%group) + own-or-participate, so a stale row pointing at a
      ::  dm/gossip/cover never surfaces here.
      =/  acc  (actor-note-access our.bowl nid dterm aid notes note-actor-owners actor-note-roster actor-dm-notes)
      ?:  ?=(%.n -.acc)  ~
      =/  owner  (~(get by note-actor-owners) nid)
      =/  owned=?
        ?&(?=(^ owner) =(host.u.owner our.bowl) =(desk.u.owner dterm) =(id.u.owner aid))
      =/  pset=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) nid) ~)
      =/  activity=@da  (newest-msg-da (fall (~(get by messages) nid) ~))
      =/  read=@da  (actor-read-get actor-note-read dterm aid nid)
      `(api-actor-note-summary p.acc owned (~(has in pset) [our.bowl dterm aid]) owner actor-registry (live-actor-dm nid notes actor-dm-notes) activity read ~(wyt in (logical-members-of nid note-members note-actor-owners notes)))
    ``[%json !>(jon)]
  ::  Actor-scoped single-note detail (Phase G2): metadata + recent messages with
  ::  actor/via attribution. 404 if the actor/note is missing OR the actor neither
  ::  owns nor participates. No artifact details/versions/urls/pins.
  ::
      [%x %api %actors @ @ %notes @ ~]
    =/  dterm=@tas  (fall (rush i.t.t.t.path sym) %$)
    =/  aid=@t  i.t.t.t.t.path
    =/  nid=@ta  i.t.t.t.t.t.t.path
    ?~  (~(get by actor-registry) [dterm aid])  ~
    ::  shared gate: 404 (~) unless the note is LIVE, an eligible %notebook/%group,
    ::  and the actor owns or participates — same logic as enforcement, no drift.
    =/  acc  (actor-note-access our.bowl nid dterm aid notes note-actor-owners actor-note-roster actor-dm-notes)
    ?:  ?=(%.n -.acc)  ~
    =/  nt=note:noltbook  p.acc
    =/  owner  (~(get by note-actor-owners) nid)
    =/  owned=?
      ?&(?=(^ owner) =(host.u.owner our.bowl) =(desk.u.owner dterm) =(id.u.owner aid))
    =/  pset=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) nid) ~)
    =/  participant=?  (~(has in pset) [our.bowl dterm aid])
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  activity=@da  (newest-msg-da msgs)
    =/  read=@da  (actor-read-get actor-note-read dterm aid nid)
    ::  A2 membership: member-safe roster for any participant; mutedActors + pendingRequests
    ::  ONLY for the EXACT owner actor (cooperative same-ship read — the mutation handlers
    ::  remain the real authority boundary; a scry cannot prove app/actor identity).
    =/  na  (api-note-actors nid note-actor-owners actor-note-roster note-actor-muted actor-registry)
    =/  mset=(set actor-ref:noltbook)  (fall (~(get by note-actor-muted) nid) ~)
    =/  reqs=(set actor-ref:noltbook)  (fall (~(get by actor-join-requests) nid) ~)
    =/  membership=json
      %-  pairs:enjs:format
      :~  ['owner' owner.na]
          ['actors' a+actors.na]
          :-  'mutedActors'
          ?.  owned  a+~
          a+(turn ~(tap in mset) |=(ref=actor-ref:noltbook (api-actor-ref-json ref 'muted' %.y actor-registry)))
          :-  'pendingRequests'
          ?.  owned  a+~
          a+(turn ~(tap in reqs) |=(ref=actor-ref:noltbook (api-actor-ref-json ref 'pending' %.n actor-registry)))
      ==
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['note' (api-actor-note-summary nt owned participant owner actor-registry (live-actor-dm nid notes actor-dm-notes) activity read ~(wyt in (logical-members-of nid note-members note-actor-owners notes)))]
          ['membership' membership]
          ['messages' a+(turn msgs |=(m=message:noltbook (api-msg-json m via-by-eid actor-by-eid)))]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ ~]
    =/  nid=@ta  i.t.t.t.path
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['messages' a+(turn msgs |=(m=message:noltbook (api-msg-json m via-by-eid actor-by-eid)))]
          ['artifacts' a+(turn arts |=(a=artifact:noltbook (api-art-json a via-by-eid)))]
          ['app' (api-app-json (~(get by note-apps) nid))]
          ['pin' (api-pin-json (~(get by note-pins) nid) nid messages artifacts)]
          ['active' (api-active-json (~(get by note-active) nid) now.bowl)]
          ['actorOwner' (api-actor-owner-json (~(get by note-actor-owners) nid) actor-registry)]
          ['actorDm' =/(dm (live-actor-dm nid notes actor-dm-notes) ?~(dm ~ (api-actor-dm-json u.dm)))]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %artifacts @ ~]
    =/  aid=@ta  i.t.t.t.path
    =/  art  (~(get by artifacts) aid)
    ?~  art  ~
    =/  jon=json
      (frond:enjs:format 'artifact' (api-art-detail-json u.art via-by-eid))
    ``[%json !>(jon)]
  ::
  ::  Phase 7 read-only profile/contact surfaces.
      [%x %api %profile @ ~]
    ::  invalid ship => no cage (404). A valid-but-unknown ship returns 200
    ::  with known:false and null profile fields.
    =/  who=(unit @p)  (slaw %p i.t.t.t.path)
    ?~  who  ~
    =/  jon=json
      %-  pairs:enjs:format
      (api-ship-pairs u.who profiles contacts pal-outgoing pal-incoming pal-blocked %.n)
    ``[%json !>(jon)]
  ::
      [%x %api %contacts ~]
    =/  jon=json
      %+  frond:enjs:format  'contacts'
      :-  %a
      %+  turn  ~(tap in contacts)
      |=  s=@p
      ^-  json
      %-  pairs:enjs:format
      (api-ship-pairs s profiles contacts pal-outgoing pal-incoming pal-blocked %.n)
    ``[%json !>(jon)]
  ::
  ::  Phase 17: pending fork invites (read-only).
      [%x %api %fork-invites ~]
    =/  jon=json
      %+  frond:enjs:format  'forkInvites'
      :-  %a
      %+  turn  ~(val by pending-fork-invites)
      |=  pi=pending-fork-invite:noltbook
      ^-  json
      %-  pairs:enjs:format
      :~  ['rootId' s+(crip (trip root-id.pi))]
          ['sourceName' s+source-name.pi]
          ['sourceVersion' (numb:enjs:format source-version.pi)]
          ['forker' s+(scot %p sender.pi)]
          ['fetching' b+fetching.pi]
      ==
    ``[%json !>(jon)]
  ::
  ::  Phase 18: call state (read-only).
      [%x %api %calls ~]
    =/  jon=json  (frond:enjs:format 'calls' a+(turn ~(val by active-calls) api-call-json))
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %calls ~]
    =/  nid=@ta  i.t.t.t.path
    =/  c  (~(get by active-calls) nid)
    =/  cs=(list call-info:noltbook)  ?~(c ~ ~[u.c])
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['calls' a+(turn cs api-call-json)]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %actors ~]
    ::  A2 member-safe actor roster. Note must exist + the local human must logically see
    ::  it (a hidden actor-owned note never surfaces here). owner first, deduped from the
    ::  roster; NO pending requests in this route; actor-DM isolation unchanged.
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    ?.  (human-sees-note nid our.bowl note-members note-actor-owners notes)  ~
    =/  na  (api-note-actors nid note-actor-owners actor-note-roster note-actor-muted actor-registry)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['owner' owner.na]
          ['actors' a+actors.na]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %actor-requests ~]
    ::  A2 ordinary-host pending-request read. Authoritatively local + ORDINARY (no
    ::  note-actor-owners) + caller has REAL host/admin moderation authority (NOT merely
    ::  human-sees-note). Hidden actor-owned pending requests never appear; actor-DM => 404.
    ::  Remote-admin request management is deferred to A3.
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    =/  nt=note:noltbook  u.nt-u
    ?:  (~(has by actor-dm-notes) nid)  ~
    ?.  =(our.bowl creator.nt)  ~
    ?:  (~(has by note-actor-owners) nid)  ~
    ?.  (has-mod-power our.bowl nid creator.nt note-admins)  ~
    =/  reqs=(set actor-ref:noltbook)  (fall (~(get by actor-join-requests) nid) ~)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          :-  'requests'
          :-  %a
          %+  turn  ~(tap in reqs)
          |=  ref=actor-ref:noltbook
          (api-actor-ref-json ref 'pending' %.n actor-registry)
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %members ~]
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    =/  nt=note:noltbook  u.nt-u
    =/  admins=(set @p)  (fall (~(get by note-admins) nid) ~)
    =/  muted=(set @p)  (fall (~(get by note-muted) nid) ~)
    ::  1B.1: members = LOGICAL human participants (not transport note.users) plus any
    ::  still-tracked removed ships. The transport host is not a member by creator alone.
    =/  is-actor-owned=?  (~(has by note-actor-owners) nid)
    =/  logical=(set @p)  (logical-members-of nid note-members note-actor-owners notes)
    =/  members=(set @p)  (~(uni in logical) removed.nt)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          :-  'members'
          :-  %a
          %+  turn  ~(tap in members)
          |=  s=@p
          ^-  json
          =/  base=(list [@t json])
            (api-ship-pairs s profiles contacts pal-outgoing pal-incoming pal-blocked %.y)
          ::  creator is %admin only when it is itself a logical member AND the note is
          ::  not actor-owned; explicit real admins keep %admin only while participating.
          =/  role=@tas
            ?:  ?&  ?|(&(=(s creator.nt) !is-actor-owned) (~(has in admins) s))
                    (~(has in logical) s)
                ==
              %admin
            %member
          =/  extra=(list [@t json])
            :~  ['role' s+(scot %tas role)]
                ['muted' b+(~(has in muted) s)]
                ['removed' b+(~(has in removed.nt) s)]
            ==
          %-  pairs:enjs:format
          (weld base extra)
      ==
    ``[%json !>(jon)]
  ::
  ::  Phase 8 read-only note metadata + capability surfaces. Missing note => no
  ::  cage (404), matching /api/artifacts/<missing>.
      [%x %api %notes @ %meta ~]
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    =/  nt=note:noltbook  u.nt-u
    =/  hst  (~(get by host-status) nid)
    =/  act  (~(get by note-activity) nid)
    =/  rd  (~(get by note-read) nid)
    =/  forigin  (~(get by fork-origin) nid)
    =/  fver  (~(get by fork-version) nid)
    =/  fof  (~(get by fork-of) nid)
    =/  mrev  (~(get by member-revs) nid)
    =/  caps=(list [@t json])
      (api-capabilities-pairs nid nt our.bowl note-admins note-muted host-status note-members note-actor-owners notes)
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['id' s+(crip (trip id.nt))]
          ['name' s+name.nt]
          ['type' s+(scot %tas type.nt)]
          ['creator' s+(scot %p creator.nt)]
          ['visibility' s+(scot %tas visibility.nt)]
          ['writable' b+writable.nt]
          ['parent' ?~(parent.nt ~ s+(crip (trip u.parent.nt)))]
          ['children' a+(turn children.nt |=(c=@ta `json`s+(crip (trip c))))]
          ::  1B.2: logical human count (transport note.users no longer drives this).
          ['userCount' (numb:enjs:format ~(wyt in (logical-members-of nid note-members note-actor-owners notes)))]
          ['removedCount' (numb:enjs:format ~(wyt in removed.nt))]
          ['iconUrl' ?~(icon-url.nt ~ s+u.icon-url.nt)]
          ['headline' ?~(headline.nt ~ s+u.headline.nt)]
          ['lastAuthor' ?~(last-author.nt ~ s+(scot %p u.last-author.nt))]
          ['lastPreview' ?~(last-preview.nt ~ s+u.last-preview.nt)]
          ['hostStatus' ?~(hst ~ s+(scot %tas u.hst))]
          ['activity' ?~(act ~ (numb:enjs:format (api-da-ms u.act)))]
          ['read' ?~(rd ~ (numb:enjs:format (api-da-ms u.rd)))]
          ['forkOrigin' ?~(forigin ~ s+(scot %uv u.forigin))]
          ['forkVersion' ?~(fver ~ (numb:enjs:format u.fver))]
          ['forkOf' ?~(fof ~ (pairs:enjs:format ~[['host' s+(scot %p host.u.fof)] ['nid' s+(crip (trip nid.u.fof))]]))]
          ['memberRev' ?~(mrev ~ (numb:enjs:format u.mrev))]
          ['app' (api-app-json (~(get by note-apps) nid))]
          ['pin' (api-pin-json (~(get by note-pins) nid) nid messages artifacts)]
          ['active' (api-active-json (~(get by note-active) nid) now.bowl)]
          ['capabilities' (pairs:enjs:format caps)]
          ['actorOwner' (api-actor-owner-json (~(get by note-actor-owners) nid) actor-registry)]
          ['actorDm' =/(dm (live-actor-dm nid notes actor-dm-notes) ?~(dm ~ (api-actor-dm-json u.dm)))]
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %capabilities ~]
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    =/  caps=(list [@t json])
      (api-capabilities-pairs nid u.nt-u our.bowl note-admins note-muted host-status note-members note-actor-owners notes)
    =/  all=(list [@t json])  [['noteId' s+(crip (trip nid))] caps]
    ``[%json !>((pairs:enjs:format all))]
  ::
      [%x %notes ~]
    ::  1B.1: raw human note peek — only logically visible notes (system + members).
    =/  note-list=(list note:noltbook)
      %+  skim  ~(val by notes)
      |=(n=note:noltbook (human-sees-note id.n our.bowl note-members note-actor-owners notes))
    =/  upd=update:noltbook  [%note-list note-list]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %notes @ ~]
    =/  nid=@ta  i.t.t.path
    ::  1B.1: raw human per-note peek — a hidden note returns an empty message-list.
    ?.  (human-sees-note nid our.bowl note-members note-actor-owners notes)
      ``[%noltbook-update !>(`update:noltbook`[%message-list nid ~ ~ ~ ~])]
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    =/  upd=update:noltbook  [%message-list nid msgs arts (api-via-snapshot msgs arts via-by-eid) (api-actor-snapshot msgs actor-by-eid)]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %peers ~]
    =/  peer-list=(list @p)  ~(tap in peers)
    =/  out-list=(list @p)  ~(tap in pal-outgoing)
    ``[%noun !>([peer-list out-list])]
  ::
      [%x %note-ids ~]
    ::  1B.1: raw human note-id peek — only logically visible notes.
    =/  ids=(list [@ta note-type:noltbook])
      %+  murn  ~(tap by notes)
      |=  [k=@ta v=note:noltbook]
      ^-  (unit [@ta note-type:noltbook])
      ?.  (human-sees-note k our.bowl note-members note-actor-owners notes)  ~
      `[k type.v]
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
  ::  on-poke dispatches all marks inline (agent:gall requires exactly 10 arms, so the
  ::  handlers cannot be sibling arms). Option-A gains are kept in the outer core:
  ::  gf-paths/gf-notes/rpoke factor out fact/poke literals, and av casts an
  ::  action:noltbook to vase once so the %noltbook-api -> %noltbook-action re-entries
  ::  recurse through `vase` without re-embedding the action type 59 times.
  ?+  mark  (on-poke:def mark vase)
      %noltbook-api
    ::  v1 is SAME-SHIP ONLY: reject any non-local poke before we even parse it,
    ::  since the translated actions author as our.bowl. (slog-only: same-ship
    ::  harness can't exercise this, so no result fact.)
    ?.  =(src.bowl our.bowl)
      ~&  [%noltbook-api-reject-nonlocal src.bowl]
      `this
    =/  aa  !<(api-action:noltbook vase)
    ::  request/response is opt-in: each branch appends an api-result fact via
    ::  (api-result-card request-id.aa ...), which is a no-op when request-id=~.
    ?-  -.aa
        %create-note
      ::  note-id is deterministic at now.bowl (same formula the handler uses).
      ::  no parent => root note, always created; with a parent the internal
      ::  handler may no-op on perms, so we only claim "accepted" there.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  code=@tas  ?~(parent.aa %created %accepted)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-note name.aa parent.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code 'note create' `nid ~ ~)
    ::
        %find-or-create-note
      =/  existing=(unit @ta)  (api-find-note-by-name name.aa notes our.bowl)
      ?^  existing
        :_  this
        (api-result-card request-id.aa %.y %found 'note exists' existing ~ ~)
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  code=@tas  ?~(parent.aa %created %accepted)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-note name.aa parent.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code 'note created' `nid ~ ~)
    ::
    ::  ---- Actor Notes (Phase D): explicit actor-only note create/configure. The
    ::  real note.creator stays our.bowl; note-actor-owners records the actor owner
    ::  by stable [host desk id]. No host fallback — missing/invalid actor rejects. ----
        %create-actor-note
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      ?:  =(0 (met 3 name.aa))
        :_  this
        (api-result-card request-id.aa %.n %invalid-name 'name cannot be empty' ~ ~ ~)
      ::  governance: attribute + create-note (app ceiling, per-actor narrow, status).
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %create-note]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      =.  actor-registry  registry.p.r
      ::  deterministic nid (same formula as %create-note); root %notebook, no parent.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      ::  Phase 1B (leak-free): the re-entry creates the note in state but its cards are
      ::  the ordinary %note-created/activity/unread/read facts on /notes. The actor note
      ::  is hidden from the host human and has no remote transport peers yet (users =
      ::  {our.bowl}), so we DROP those cards. The note still exists physically; ownership/
      ::  roster/read-seed are written in the same transition; note-members stays empty
      ::  (no host-human member). current-note is untouched (the create path never sets it).
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-note name.aa ~]))
      =.  note-actor-owners  (~(put by note-actor-owners) nid [our.bowl desk.u.app.aa id.u.actor.aa])
      ::  the owner actor is automatically a roster participant of its own note.
      =.  actor-note-roster
        (~(put by actor-note-roster) nid (sy ~[[our.bowl desk.u.app.aa id.u.actor.aa]]))
      ::  G6A: seed the owner's read cursor (new note has no messages => no row yet).
      =.  actor-note-read
        (actor-read-seed actor-note-read desk.u.app.aa id.u.actor.aa nid (fall (~(get by messages) nid) ~))
      ::  Phase 1B: the re-entry seeded note-members[nid]={our.bowl}; an actor-owned note
      ::  has NO host-human member, so drop the row (logical-members-of then falls back to
      ::  users-minus-owner-host = empty => hidden from the host human).
      =.  note-members  (set-logical-members nid ~ note-members)
      :_  this
      (api-result-card request-id.aa %.y %actor-note-created 'actor note created' `nid ~ ~)
    ::
        %configure-actor-note
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ::  Phase G5A: configuring a marked actor-DM note is rejected — its name/
      ::  visibility/type/membership are invariant-bound (preserve DM isolation).
      ?:  (~(has by actor-dm-notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'cannot configure an actor-DM note' `note-id.aa ~ ~)
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      ::  owner match FIRST (stable [host desk id]); no owner or mismatch => not owner.
      ::  This — NOT note.creator — is the authority, so a different actor sharing the
      ::  same desk/host cannot configure this note.
      =/  owner  (~(get by note-actor-owners) note-id.aa)
      ?.  ?&  ?=(^ owner)
              =(host.u.owner our.bowl)
              =(desk.u.owner desk.u.app.aa)
              =(id.u.owner id.u.actor.aa)
          ==
        :_  this
        (api-result-card request-id.aa %.n %actor-not-owner 'actor does not own this note' `note-id.aa ~ ~)
      ::  governance: attribute + configure-note.
      ::  A1.2: a muted owner cannot configure its note (parity with the moderation gate).
      ?:  (actor-muted note-id.aa [our.bowl desk.u.app.aa id.u.actor.aa] note-actor-muted)
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'acting actor is muted in this note' `note-id.aa ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %configure-note]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      ::  A1.3a: HOLD the candidate registry — committing it (last-seen/TOFU) is deferred
      ::  until AFTER write-block + every field validation, so an invalid name/visibility
      ::  cannot bump registry/last-seen on a rejected configure.
      =/  cand-registry  registry.p.r
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ::  same validation + partial-update semantics as set-note-config; reuse the
      ::  internal rename-note / set-note-meta / set-headline handlers (creator=our
      ::  passes their host gate). Only supplied fields are applied.
      ?:  ?&(?=(^ name.aa) =('' u.name.aa))
        :_  this
        (api-result-card request-id.aa %.n %invalid-name 'name cannot be empty' `note-id.aa ~ ~)
      =/  vis-ok=?
        ?~  visibility.aa  %.y
        ?|  =('public' u.visibility.aa)
            =('private' u.visibility.aa)
            =('secret' u.visibility.aa)
        ==
      ?.  vis-ok
        :_  this
        (api-result-card request-id.aa %.n %invalid-visibility 'visibility must be public/private/secret' `note-id.aa ~ ~)
      ::  A1.3a: all validation passed — commit the held candidate registry now, immediately
      ::  before the first note mutation (the rename re-entry below).
      =.  actor-registry  cand-registry
      =^  c1  this
        ?~  name.aa  `this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%rename-note note-id.aa u.name.aa]))
      =^  c2  this
        ?:  ?&(?=(~ visibility.aa) ?=(~ writable.aa) ?=(~ icon-url.aa))  `this
        =/  vis=note-visibility:noltbook
          ?~  visibility.aa  visibility.nt
          ?:  =('public' u.visibility.aa)   %public
          ?:  =('private' u.visibility.aa)  %private
          %secret
        =/  wr=?  ?~(writable.aa writable.nt u.writable.aa)
        =/  ic=(unit @t)
          ?~  icon-url.aa  icon-url.nt
          ?:(=('' u.icon-url.aa) ~ icon-url.aa)
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%set-note-meta note-id.aa vis ic wr]))
      =^  c3  this
        ?~  headline.aa  `this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%set-headline note-id.aa u.headline.aa]))
      ::  1B.3: rename/meta/headline re-entries emit global /notes facts; drop them for a
      ::  hidden owner host (keep /notes/[nid] transport, remote %pass, and the API result).
      :_  this
      %+  weld
        (human-note-cards note-id.aa our.bowl note-members note-actor-owners notes (weld c1 (weld c2 c3)))
      (api-result-card request-id.aa %.y %actor-note-configured 'actor note configured' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Notes (Phase G1): an actor deletes a note IT owns. Authority is the
    ::  stable [host desk id] in note-actor-owners, NOT note.creator. Reuses the internal
    ::  %delete-note (which removes the note subtree AND its note-actor-owners rows). No
    ::  actor leave/fork/host-note deletion. ----
        %delete-actor-note
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      ::  exact actor ownership FIRST (stable [host desk id]); checked BEFORE the gate so
      ::  a non-owner, an ordinary host note, another actor's note, a note owned through
      ::  a different app desk, or a remote-hosted note never TOFU-registers this actor.
      =/  owner  (~(get by note-actor-owners) note-id.aa)
      ?.  ?&  ?=(^ owner)
              =(host.u.owner our.bowl)
              =(desk.u.owner desk.u.app.aa)
              =(id.u.owner id.u.actor.aa)
          ==
        :_  this
        (api-result-card request-id.aa %.n %actor-not-owner 'actor does not own this note' `note-id.aa ~ ~)
      ::  governance: attribute + delete-own-note (app ceiling, per-actor narrow, status).
      ::  A1.2: a muted owner cannot delete its note via the actor API.
      ?:  (actor-muted note-id.aa [our.bowl desk.u.app.aa id.u.actor.aa] note-actor-muted)
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'acting actor is muted in this note' `note-id.aa ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %delete-own-note]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      ::  ATOMIC: hold the candidate registry; only commit after the note-state check
      ::  passes, so a write-blocked rejection leaves no last-seen bump / TOFU row.
      =/  cand-registry  registry.p.r
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =.  actor-registry  cand-registry
      ::  1B.3: visibility BEFORE the delete (the note vanishes after). For a hidden owner
      ::  host, drop the re-entry's global /notes facts (note-deleted etc.) while keeping
      ::  the remote %pass kicks/deletes to real participants and the API result.
      =/  human-vis=?
        (human-sees-note note-id.aa our.bowl note-members note-actor-owners notes)
      ::  reuse the internal %delete-note (creator=our.bowl passes its host gate); it
      ::  deletes the subtree and drops note-actor-owners for every deleted id.
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%delete-note note-id.aa]))
      :_  this
      %+  weld  ?:(human-vis cards (drop-local-notes-facts cards))
      (api-result-card request-id.aa %.y %actor-note-deleted 'actor note deleted' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Notes (Phase G2): durable actor participation. The host @p stays
    ::  the real note.users member; these only manage the [app-desk, actor-id] rows in
    ::  actor-note-roster. All require %attribute + %participate-note. ----
        %actor-join-note
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      ::  governance first (app ceiling + per-actor narrow + status); HOLD the
      ::  candidate registry and commit only after the note checks pass.
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %participate-note]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      =/  cand-registry  registry.p.r
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  u.nt-u
      ?.  ?|(=(%notebook type.nt) =(%group type.nt))
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'note type not eligible for actor participation' `note-id.aa ~ ~)
      ::  Phase G5A: actor-DM notes are NOT joinable via generic participation — the
      ::  target host must use actor-adopt-dm (one local actor) to preserve isolation.
      ?:  (~(has by actor-dm-notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'actor-DM note: use actor-adopt-dm' `note-id.aa ~ ~)
      ::  Phase A1: the note must be authoritatively LOCAL (we host it). Remote-hosted
      ::  actor join is deferred to A3 — no local cache is mutated here.
      ?.  =(our.bowl creator.nt)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'remote-hosted note: actor join deferred to A3' `note-id.aa ~ ~)
      =/  ref=actor-ref:noltbook  [our.bowl desk.u.app.aa id.u.actor.aa]
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      =/  owner  (~(get by note-actor-owners) note-id.aa)
      =/  is-owner=?
        ?&(?=(^ owner) =(host.u.owner our.bowl) =(desk.u.owner desk.u.app.aa) =(id.u.owner id.u.actor.aa))
      ::  already the owner or a roster participant -> idempotent actor-joined.
      ?:  |(is-owner (~(has in cur) ref))
        =.  actor-registry  cand-registry
        ::  A1.2: clear any stale pending request for an already-participating actor.
        =.  actor-join-requests  (del-actor-row note-id.aa ref actor-join-requests)
        :_  this
        (api-result-card request-id.aa %.y %actor-joined 'actor already participates' `note-id.aa ~ ~)
      ::  PUBLIC -> direct join: roster add, seed cursor, convert %notebook->%group.
      ?:  =(%public visibility.nt)
        =.  actor-registry  cand-registry
        =.  actor-note-roster  (~(put by actor-note-roster) note-id.aa (~(put in cur) ref))
        ::  A1.2: a direct public join clears any matching pending request.
        =.  actor-join-requests  (del-actor-row note-id.aa ref actor-join-requests)
        =.  actor-note-read
          (actor-read-seed actor-note-read desk.u.app.aa id.u.actor.aa note-id.aa (fall (~(get by messages) note-id.aa) ~))
        =/  conv  (actor-convert-cards our.bowl note-id.aa nt notes note-members note-actor-owners)
        =.  notes  notes.conv
        :_  this
        %+  weld  cards.conv
        (api-result-card request-id.aa %.y %actor-joined 'actor joined note' `note-id.aa ~ ~)
      ::  PRIVATE / SECRET -> durable request (idempotent). Secret stays undiscoverable;
      ::  a known-ID request never changes discovery.
      =/  pend=(set actor-ref:noltbook)  (fall (~(get by actor-join-requests) note-id.aa) ~)
      =.  actor-registry  cand-registry
      =.  actor-join-requests  (~(put by actor-join-requests) note-id.aa (~(put in pend) ref))
      :_  this
      (api-result-card request-id.aa %.y %actor-join-requested 'actor join request created' `note-id.aa ~ ~)
    ::
        %actor-add-participant
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?:  =(0 (met 3 target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target id empty' `note-id.aa ~ ~)
      ::  A1.3a: owner authority (%manage-members), local-host, acting-not-muted, eligible
      ::  type, not-actor-DM — all via the shared precheck (holds candidate registry).
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      ::  full LOCAL target ref; omitted targetDesk (%$) defaults to the owner app desk.
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa desk.u.app.aa &)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'malformed target desk' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ::  target must be registered under [targetDesk targetId]; revoked => reject;
      ::  suspended may be added (but cannot act until reactivated).
      =/  trec  (~(get by actor-registry) [tdesk target-id.aa])
      ?~  trec
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target actor not registered' `note-id.aa ~ ~)
      ?:  ?=(%revoked status.u.trec)
        :_  this
        (api-result-card request-id.aa %.n %actor-revoked 'target actor revoked' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      =.  actor-note-roster  (~(put by actor-note-roster) note-id.aa (~(put in cur) tref))
      ::  seed the read cursor ONLY for a genuinely-new roster row.
      =?  actor-note-read  !(~(has in cur) tref)
        (actor-read-seed actor-note-read tdesk target-id.aa note-id.aa (fall (~(get by messages) note-id.aa) ~))
      ::  a direct add clears any matching pending request and converts %notebook->%group.
      =.  actor-join-requests  (del-actor-row note-id.aa tref actor-join-requests)
      =/  conv  (actor-convert-cards our.bowl note-id.aa nt.p.pre notes note-members note-actor-owners)
      =.  notes  notes.conv
      :_  this
      %+  weld  cards.conv
      (api-result-card request-id.aa %.y %actor-participant-added 'actor participant added' `note-id.aa ~ ~)
    ::
        %actor-remove-participant
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?:  =(0 (met 3 target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target id empty' `note-id.aa ~ ~)
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa desk.u.app.aa &)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'malformed target desk' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ::  A1.3a: removal rejects the EXACT owner ref (not merely a matching actor id).
      =/  ow  (~(get by note-actor-owners) note-id.aa)
      ?:  ?&(?=(^ ow) =(host.u.ow our.bowl) =(desk.u.ow tdesk) =(id.u.ow target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'owner cannot be removed; delete the note instead' `note-id.aa ~ ~)
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      ?.  (~(has in cur) tref)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'target is not a participant' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ::  complete cleanup: roster, note-level mute, pending request, read cursor,
      ::  directed notifications. Historical messages + actor attribution are preserved.
      =.  actor-note-roster  (del-actor-row note-id.aa tref actor-note-roster)
      =.  note-actor-muted  (del-actor-row note-id.aa tref note-actor-muted)
      =.  actor-join-requests  (del-actor-row note-id.aa tref actor-join-requests)
      =.  actor-note-read  (actor-read-del actor-note-read tdesk target-id.aa note-id.aa)
      =.  actor-notifications
        (actor-notif-del-actor-note actor-notifications tdesk target-id.aa note-id.aa)
      :_  this
      %+  weld
        (actor-notif-full-cards actor-notifications tdesk target-id.aa messages actor-by-eid)
      (api-result-card request-id.aa %.y %actor-participant-removed 'actor participant removed' `note-id.aa ~ ~)
    ::
    ::  ---- Phase A1: owner-actor request management + note-level actor mute. Authority
    ::  is the EXACT owner actor via its app (%attribute + %manage-members), local-host
    ::  only (actor-owner-pre rejects remote-hosted notes => deferred to A3). No host
    ::  fallback; actor-DM notes excluded; actors never become admins. ----
        %actor-approve-request
      ?:  =(0 (met 3 target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target id empty' `note-id.aa ~ ~)
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ?.  (~(has in (fall (~(get by actor-join-requests) note-id.aa) ~)) tref)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending actor request' `note-id.aa ~ ~)
      ::  target registry must exist + not revoked (suspended may still be added).
      =/  trec  (~(get by actor-registry) [tdesk target-id.aa])
      ?~  trec
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target actor not registered' `note-id.aa ~ ~)
      ?:  ?=(%revoked status.u.trec)
        :_  this
        (api-result-card request-id.aa %.n %actor-revoked 'target actor revoked' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      =.  actor-join-requests  (del-actor-row note-id.aa tref actor-join-requests)
      =.  actor-note-roster  (~(put by actor-note-roster) note-id.aa (~(put in cur) tref))
      =?  actor-note-read  !(~(has in cur) tref)
        (actor-read-seed actor-note-read tdesk target-id.aa note-id.aa (fall (~(get by messages) note-id.aa) ~))
      =/  conv  (actor-convert-cards our.bowl note-id.aa nt.p.pre notes note-members note-actor-owners)
      =.  notes  notes.conv
      :_  this
      %+  weld  cards.conv
      (api-result-card request-id.aa %.y %actor-request-approved 'actor request approved' `note-id.aa ~ ~)
    ::
        %actor-deny-request
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ?.  (~(has in (fall (~(get by actor-join-requests) note-id.aa) ~)) tref)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending actor request' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      =.  actor-join-requests  (del-actor-row note-id.aa tref actor-join-requests)
      :_  this
      (api-result-card request-id.aa %.y %actor-request-denied 'actor request denied' `note-id.aa ~ ~)
    ::
        %actor-mute-participant
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ::  A1.2: target must be a roster participant — never mute a pending/unknown/removed
      ::  actor. The owner cannot mute itself via the normal action (emergency mute only).
      ?.  (~(has in (fall (~(get by actor-note-roster) note-id.aa) ~)) tref)
        :_  this
        (api-result-card request-id.aa %.n %actor-not-participant 'target actor is not a participant' `note-id.aa ~ ~)
      =/  ow  (~(get by note-actor-owners) note-id.aa)
      ?:  ?&(?=(^ ow) =(host.u.ow our.bowl) =(desk.u.ow target-desk.aa) =(id.u.ow target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot mute the owner via owner action; use emergency mute' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      =.  note-actor-muted  (put-actor-row note-id.aa tref note-actor-muted)
      :_  this
      (api-result-card request-id.aa %.y %note-actor-mute-set 'actor muted in note' `note-id.aa ~ ~)
    ::
        %actor-unmute-participant
      =/  pre  (actor-owner-pre our.bowl now.bowl app.aa actor.aa note-id.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required' `note-id.aa ~ ~)
      =/  tdesk=@tas  u.td-u
      =/  tref=actor-ref:noltbook  [our.bowl tdesk target-id.aa]
      ::  A1.2: unmute requires an EXISTING mute row.
      ?.  (~(has in (fall (~(get by note-actor-muted) note-id.aa) ~)) tref)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'actor is not muted in this note' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      =.  note-actor-muted  (del-actor-row note-id.aa tref note-actor-muted)
      :_  this
      (api-result-card request-id.aa %.y %note-actor-mute-cleared 'actor unmuted in note' `note-id.aa ~ ~)
    ::
    ::  ---- A1.3b: compact ORDINARY-HOST actor management (ordinary, non-actor-owned
    ::  notes). host/admin authority via host-actor-pre; mutation via the shared
    ::  actor-manage-apply. Remote target host or remote-admin => unsupported (A3). ----
        %manage-note-actor
      =/  th=(unit @p)  (slaw %p target-host.aa)
      ?~  th
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'target host did not parse' `note-id.aa ~ ~)
      ?.  =(our.bowl u.th)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'remote target host: deferred to A3' `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required/malformed' `note-id.aa ~ ~)
      ?:  =(0 (met 3 target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target id empty' `note-id.aa ~ ~)
      =/  opa=@tas  (fall (rush op.aa sym) %$)
      ?.  ?=(?(%approve %deny %invite %remove %mute %unmute) opa)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'unknown host actor op' `note-id.aa ~ ~)
      =/  tref=actor-ref:noltbook  [our.bowl u.td-u target-id.aa]
      =/  pre  (host-actor-pre our.bowl note-id.aa note-actor-owners notes host-status note-admins actor-dm-notes)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =/  res  (actor-manage-apply our.bowl note-id.aa opa tref p.pre actor-note-roster actor-join-requests note-actor-muted actor-note-read actor-notifications notes messages actor-registry note-members note-actor-owners actor-by-eid)
      ?.  ok.res
        :_  this
        (api-result-card request-id.aa %.n code.res msg.res `note-id.aa ~ ~)
      =/  scode=@tas
        ?-  opa
          %approve  %actor-request-approved
          %deny     %actor-request-denied
          %invite   %actor-invited
          %remove   %actor-participant-removed
          %mute     %note-actor-mute-set
          %unmute   %note-actor-mute-cleared
        ==
      :_  this(actor-note-roster roster.res, actor-join-requests requests.res, note-actor-muted muted.res, actor-note-read read.res, actor-notifications notifs.res, notes notes.res)
      %+  weld  cards.res
      (api-result-card request-id.aa %.y scode 'host actor management applied' `note-id.aa ~ ~)
    ::
    ::  ---- A1.3b: EXPLICIT host emergency controls on ACTOR-OWNED notes (never a silent
    ::  fallback from owner-actor failure). emergency-actor-pre + shared mutation; remove
    ::  rejects the exact owner ref; mute may target the owner. Distinct success codes. ----
        %emergency-manage-note-actor
      =/  th=(unit @p)  (slaw %p target-host.aa)
      ?~  th
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'target host did not parse' `note-id.aa ~ ~)
      ?.  =(our.bowl u.th)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'remote target host: deferred to A3' `note-id.aa ~ ~)
      =/  td-u=(unit @tas)  (tdesk-resolve target-desk.aa %$ |)
      ?~  td-u
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target desk required/malformed' `note-id.aa ~ ~)
      ?:  =(0 (met 3 target-id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'target id empty' `note-id.aa ~ ~)
      =/  opa=@tas  (fall (rush op.aa sym) %$)
      ?.  ?=(?(%remove %mute %unmute) opa)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'emergency supports only remove/mute/unmute' `note-id.aa ~ ~)
      =/  tref=actor-ref:noltbook  [our.bowl u.td-u target-id.aa]
      =/  pre  (emergency-actor-pre our.bowl note-id.aa note-actor-owners notes host-status actor-dm-notes)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      ?:  &(=(%remove opa) =(tref owner.p.pre))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot remove the owner actor' `note-id.aa ~ ~)
      =/  res  (actor-manage-apply our.bowl note-id.aa opa tref nt.p.pre actor-note-roster actor-join-requests note-actor-muted actor-note-read actor-notifications notes messages actor-registry note-members note-actor-owners actor-by-eid)
      ?.  ok.res
        :_  this
        (api-result-card request-id.aa %.n code.res msg.res `note-id.aa ~ ~)
      =/  scode=@tas
        ?-  opa
          %remove  %emergency-actor-removed
          %mute    %emergency-actor-muted
          %unmute  %emergency-actor-unmuted
        ==
      :_  this(actor-note-roster roster.res, actor-join-requests requests.res, note-actor-muted muted.res, actor-note-read read.res, actor-notifications notifs.res, notes notes.res)
      %+  weld  cards.res
      (api-result-card request-id.aa %.y scode 'emergency actor control applied' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Notes (Phase G3): an actor leaves a note it PARTICIPATES in. This
    ::  removes ONLY the actor's own [app.desk, actor.id] row. It NEVER calls the
    ::  ship-level %leave-note: note.users/note.removed/subscriptions/messages and the
    ::  host's notes map are all untouched, no %remote-leave / wire traffic fires, and
    ::  other actors' rows are unaffected. The owner must DELETE (not leave). ----
        %actor-leave-note
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ?.  ?|(=(%notebook type.u.nt-u) =(%group type.u.nt-u))
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'note type not eligible for actor participation' `note-id.aa ~ ~)
      ::  exact owner must DELETE, not leave (rejected, NOT actor-not-owner). Checked
      ::  before the gate so the owner-as-non-participant path can't TOFU/last-seen.
      =/  owner  (~(get by note-actor-owners) note-id.aa)
      ?:  ?&  ?=(^ owner)
              =(host.u.owner our.bowl)
              =(desk.u.owner desk.u.app.aa)
              =(id.u.owner id.u.actor.aa)
          ==
        :_  this
        (api-result-card request-id.aa %.n %rejected 'owner must delete the note rather than leave' `note-id.aa ~ ~)
      ::  must currently participate. Absent (incl. a repeated leave) => not a
      ::  participant. Checked BEFORE the gate so a non-participant is never
      ::  TOFU-registered and gets no last-seen update.
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      ?.  (~(has in cur) [our.bowl desk.u.app.aa id.u.actor.aa])
        :_  this
        (api-result-card request-id.aa %.n %actor-not-participant 'actor does not participate in this note' `note-id.aa ~ ~)
      ::  governance LAST (app ceiling + per-actor narrow + status); HOLD the candidate
      ::  registry and commit only on success.
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %leave-note]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      =.  actor-registry  registry.p.r
      ::  remove ONLY this actor's row; drop the map entry if the set becomes empty.
      =/  new-set=(set actor-ref:noltbook)  (~(del in cur) [our.bowl desk.u.app.aa id.u.actor.aa])
      =.  actor-note-roster
        ?:  =(~ new-set)  (~(del by actor-note-roster) note-id.aa)
        (~(put by actor-note-roster) note-id.aa new-set)
      ::  Phase A1: leaving also clears this actor's note-level mute + any pending request.
      =/  lref=actor-ref:noltbook  [our.bowl desk.u.app.aa id.u.actor.aa]
      =.  note-actor-muted  (del-actor-row note-id.aa lref note-actor-muted)
      =.  actor-join-requests  (del-actor-row note-id.aa lref actor-join-requests)
      ::  G6A: drop this actor's read cursor (a later rejoin re-seeds to current).
      =.  actor-note-read
        (actor-read-del actor-note-read desk.u.app.aa id.u.actor.aa note-id.aa)
      ::  G6B: drop this actor's directed notifications for the note it left + emit its
      ::  authoritative remaining list (full=%.y).
      =.  actor-notifications
        (actor-notif-del-actor-note actor-notifications desk.u.app.aa id.u.actor.aa note-id.aa)
      :_  this
      %+  weld
        (actor-notif-full-cards actor-notifications desk.u.app.aa id.u.actor.aa messages actor-by-eid)
      (api-result-card request-id.aa %.y %actor-note-left 'actor left note' `note-id.aa ~ ~)
    ::
    ::  ---- Actor DM (Phase G5A): a private actor-to-ship conversation as a SECRET
    ::  two-ship %group note (NOT canonical %dm). Idempotent per [owner, target]. The
    ::  host @p stays the real note.users member; isolation is the unique note id. ----
        %find-or-create-actor-dm
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      =/  who=(unit @p)  (slaw %p ship.aa)
      ?~  who
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'ship did not parse' ~ ~ ~)
      ?:  =(u.who our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot actor-DM yourself' ~ ~ ~)
      ?:  (~(has in pal-blocked) u.who)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'ship is blocked' ~ ~ ~)
      ::  governance: attribute + send-dm. HOLD the candidate registry; commit on success.
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %send-dm]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      =/  cand-registry  registry.p.r
      ::  canonical actor [host desk id name kind] (host == our.bowl) for the marker.
      =/  owner-actor=actor:noltbook  actor.p.r
      ::  idempotent: a LIVE valid actor-DM matching [owner, target].
      =/  found=(unit @ta)
        =/  pairs=(list [nid=@ta meta=actor-dm-meta:noltbook])  ~(tap by actor-dm-notes)
        |-  ^-  (unit @ta)
        ?~  pairs  ~
        =/  m=actor-dm-meta:noltbook  meta.i.pairs
        ?.  ?&  =(host.owner.m our.bowl)
                =(desk.owner.m desk.u.app.aa)
                =(id.owner.m id.u.actor.aa)
                =(target.m u.who)
            ==
          $(pairs t.pairs)
        =/  nt-u  (~(get by notes) nid.i.pairs)
        ?:  ?&(?=(^ nt-u) (actor-dm-valid u.nt-u m))  `nid.i.pairs
        $(pairs t.pairs)
      ?^  found
        =.  actor-registry  cand-registry
        :_  this
        (api-result-card request-id.aa %.y %found 'actor dm found' `u.found ~ ~)
      ::  prune any stale markers for this [owner,target] (note gone/invalid) so a fresh
      ::  conversation is created cleanly.
      =/  stale-ids=(list @ta)
        %+  murn  ~(tap by actor-dm-notes)
        |=  [nid=@ta m=actor-dm-meta:noltbook]
        ^-  (unit @ta)
        ?.  ?&  =(host.owner.m our.bowl)
                =(desk.owner.m desk.u.app.aa)
                =(id.owner.m id.u.actor.aa)
                =(target.m u.who)
            ==
          ~
        =/  nt-u  (~(get by notes) nid)
        ?:  ?&(?=(^ nt-u) (actor-dm-valid u.nt-u m))  ~
        `nid
      =.  actor-dm-notes
        (roll stale-ids |=([n=@ta acc=_actor-dm-notes] (~(del by acc) n)))
      ::  G5A hardening: tell the FE to drop each pruned stale marker.
      =/  stale-clear-cards=(list card)
        %+  turn  stale-ids
        |=  n=@ta
        ^-  card
        (gf-notes `update:noltbook`[%actor-dm-updated n ~])
      ::  create: mint nid (note-{now}), reuse internal %create-note (secret %notebook),
      ::  write owner + participation + marker, then reuse %invite-to-note for the one
      ::  target (handles notebook->group + remote invite). Name = canonical actor name.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  dm-name=@t  (crip :(weld (trip name.owner-actor) " (DM with " (scow %p u.who) ")"))
      =.  actor-registry  cand-registry
      =^  c1  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-note dm-name ~]))
      =.  note-actor-owners  (~(put by note-actor-owners) nid [our.bowl desk.u.app.aa id.u.actor.aa])
      =.  actor-note-roster
        (~(put by actor-note-roster) nid (sy ~[[our.bowl desk.u.app.aa id.u.actor.aa]]))
      ::  Phase 1B: this actor-DM is actor-owned; the owner's transport host is NOT a
      ::  human member (G5 target presentation is preserved via the users-minus-owner-host
      ::  fallback). Drop the {our.bowl} row the %create-note re-entry seeded.
      =.  note-members  (set-logical-members nid ~ note-members)
      ::  G6A: seed the owner's read cursor (fresh DM note has no messages => no row).
      =.  actor-note-read
        (actor-read-seed actor-note-read desk.u.app.aa id.u.actor.aa nid (fall (~(get by messages) nid) ~))
      =/  meta=actor-dm-meta:noltbook  [owner-actor u.who now.bowl]
      =.  actor-dm-notes  (~(put by actor-dm-notes) nid meta)
      =^  c2  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%invite-to-note nid u.who]))
      ::  G5A: after the invite, tell the target this group is a direct actor DM.
      =/  meta-card=card
        (rpoke /actor-dm-meta/(scot %p u.who)/[nid] u.who `remote:noltbook`[%remote-actor-dm-meta nid meta])
      ::  1B.1: the owner host is NOT a logical member of this DM, so strip every local
      ::  /notes fact: c1 (note-created), c2's gf-notes (keep its remote invite %pass),
      ::  the stale-clear gf-notes facts, and the owner-host actor-dm-updated fact.
      ::  Remote transport (meta-card to the target, c2's invite pokes) is preserved.
      :_  this
      %-  zing
      :~  (drop-local-notes-facts stale-clear-cards)
          (drop-local-notes-facts c1)
          (drop-local-notes-facts c2)
          ~[meta-card]
          (api-result-card request-id.aa %.y %actor-dm-created 'actor dm created' `nid ~ ~)
      ==
    ::
        %actor-adopt-dm
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %send-dm]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      =/  cand-registry  registry.p.r
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  u.nt-u
      =/  dm-u  (~(get by actor-dm-notes) note-id.aa)
      ?~  dm-u
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'not an actor-DM note' `note-id.aa ~ ~)
      =/  meta=actor-dm-meta:noltbook  u.dm-u
      ::  the marker must be addressed to us, owner.host must be the note's creator, and
      ::  the membership invariant (secret 2-ship %group, users {creator, our}) must hold.
      ?.  =(target.meta our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'this actor DM is not addressed to us' `note-id.aa ~ ~)
      ?.  =(host.owner.meta creator.nt)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'owner host is not the note creator' `note-id.aa ~ ~)
      ?.  (actor-dm-valid nt meta)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'actor-DM membership invariant broken' `note-id.aa ~ ~)
      ::  the adopting actor must not be a LOCAL owner of it (target host has no owner
      ::  row; this is defensive against an illicit local owner row).
      =/  owner-row  (~(get by note-actor-owners) note-id.aa)
      ?:  ?&  ?=(^ owner-row)
              =(host.u.owner-row our.bowl)
              =(desk.u.owner-row desk.u.app.aa)
              =(id.u.owner-row id.u.actor.aa)
          ==
        :_  this
        (api-result-card request-id.aa %.n %rejected 'owner cannot adopt its own actor DM' `note-id.aa ~ ~)
      ::  occupancy: at most ONE local actor participation row. This actor => idempotent
      ::  success; a different actor already present => occupied/rejected.
      =/  cur=(set actor-ref:noltbook)  (fall (~(get by actor-note-roster) note-id.aa) ~)
      ?:  (~(has in cur) [our.bowl desk.u.app.aa id.u.actor.aa])
        =.  actor-registry  cand-registry
        :_  this
        (api-result-card request-id.aa %.y %actor-dm-adopted 'actor dm adopted' `note-id.aa ~ ~)
      ?.  =(0 ~(wyt in cur))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'actor DM already adopted by another local actor' `note-id.aa ~ ~)
      =.  actor-registry  cand-registry
      =.  actor-note-roster
        (~(put by actor-note-roster) note-id.aa (sy ~[[our.bowl desk.u.app.aa id.u.actor.aa]]))
      ::  G6A: seed the adopter's read cursor to current so adoption isn't all-unread.
      =.  actor-note-read
        (actor-read-seed actor-note-read desk.u.app.aa id.u.actor.aa note-id.aa (fall (~(get by messages) note-id.aa) ~))
      :_  this
      (api-result-card request-id.aa %.y %actor-dm-adopted 'actor dm adopted' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Notifications (Phase G6A): advance THIS actor's per-note read cursor.
    ::  Independent per actor; never touches host note-read or other actors' cursors. ----
        %actor-mark-note-read
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ ~)
      ::  governance: attribute + manage-own-notifications. HOLD the candidate registry.
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %manage-own-notifications]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ ~)
      =/  cand-registry  registry.p.r
      ::  own-or-participate (inherits actor-DM host-role rules + invariant + honest
      ::  missing-note/unsupported/actor-not-participant codes from actor-note-access).
      =/  acc  (actor-note-access our.bowl note-id.aa desk.u.app.aa id.u.actor.aa notes note-actor-owners actor-note-roster actor-dm-notes)
      ?:  ?=(%.n -.acc)
        :_  this
        (api-result-card request-id.aa %.n code.p.acc msg.p.acc `note-id.aa ~ ~)
      ::  commit registry, then advance THIS actor's cursor to the newest stored MESSAGE
      ::  (monotonic; no messages => no row but still success). Never calls the internal
      ::  %mark-note-read and never mutates host note-read.
      =.  actor-registry  cand-registry
      =/  newest=@da  (newest-msg-da (fall (~(get by messages) note-id.aa) ~))
      =.  actor-note-read
        (actor-read-put actor-note-read desk.u.app.aa id.u.actor.aa note-id.aa newest)
      :_  this
      (api-result-card request-id.aa %.y %actor-note-read 'actor note marked read' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Notifications (Phase G6B): clear THIS actor's directed reply
    ::  notifications. Independent of read state; never touches host attention. ----
        %actor-clear-notification
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ `eid.aa)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ `eid.aa)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' `note-id.aa ~ `eid.aa)
      ::  governance: attribute + manage-own-notifications. HOLD the candidate registry.
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %manage-own-notifications]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r `note-id.aa ~ `eid.aa)
      =/  cand-registry  registry.p.r
      ::  the row (note-id + eid) must exist for THIS actor; else missing-target (do not
      ::  commit the candidate registry — mirrors mark-read's failure handling).
      =/  cur=(list actor-notification:noltbook)
        (fall (~(get by actor-notifications) [desk.u.app.aa id.u.actor.aa]) ~)
      ?.  (lien cur |=(n=actor-notification:noltbook &(=(note-id.n note-id.aa) =(eid.n eid.aa))))
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no such notification' `note-id.aa ~ `eid.aa)
      ::  commit registry, drop the row for THIS actor (clearing never marks the note
      ::  read), then emit the AUTHORITATIVE remaining list on /api/results (full=%.y).
      =.  actor-registry  cand-registry
      =/  nl=(list actor-notification:noltbook)
        (skip cur |=(n=actor-notification:noltbook &(=(note-id.n note-id.aa) =(eid.n eid.aa))))
      =.  actor-notifications
        ?:  =(~ nl)  (~(del by actor-notifications) [desk.u.app.aa id.u.actor.aa])
        (~(put by actor-notifications) [desk.u.app.aa id.u.actor.aa] nl)
      :_  this
      %+  weld
        (actor-notif-full-cards actor-notifications desk.u.app.aa id.u.actor.aa messages actor-by-eid)
      (api-result-card request-id.aa %.y %actor-notification-cleared 'notification cleared' `note-id.aa ~ `eid.aa)
    ::
        %actor-clear-notifications
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %manage-own-notifications]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      ::  commit registry, drop ALL of this actor's notifications (idempotent success),
      ::  then emit the now-empty authoritative list (full=%.y).
      =.  actor-registry  registry.p.r
      =.  actor-notifications
        (~(del by actor-notifications) [desk.u.app.aa id.u.actor.aa])
      :_  this
      %+  weld
        (actor-notif-full-cards actor-notifications desk.u.app.aa id.u.actor.aa messages actor-by-eid)
      (api-result-card request-id.aa %.y %actor-notifications-cleared 'notifications cleared' ~ ~ ~)
    ::
    ::  ---- Phase B: REAL ship-user actor mute/block by full [host,desk,id]. Validate raw
    ::  strings, delegate to the typed internal action, then mirror the authoritative prefs
    ::  on /api/results + a result card. Idempotent add; unmute/unblock of an absent target
    ::  => missing-target. mute/block independent; suppression = muted OR blocked. ----
        %mute-actor
      =/  pr  (api-parse-actor-ref host.aa desk.aa id.aa)
      ?:  ?=(%.n -.pr)
        :_  this
        (api-result-card request-id.aa %.n code.p.pr msg.p.pr ~ ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%mute-actor p.pr]))
      :_  this
      :*  (user-actor-prefs-fact ~[/api/results] user-muted-actors user-blocked-actors)
          %+  weld  cards
          (api-result-card request-id.aa %.y %user-actor-muted 'actor muted' ~ ~ ~)
      ==
    ::
        %unmute-actor
      =/  pr  (api-parse-actor-ref host.aa desk.aa id.aa)
      ?:  ?=(%.n -.pr)
        :_  this
        (api-result-card request-id.aa %.n code.p.pr msg.p.pr ~ ~ ~)
      ?.  (~(has in user-muted-actors) p.pr)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'actor was not muted' ~ ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%unmute-actor p.pr]))
      :_  this
      :*  (user-actor-prefs-fact ~[/api/results] user-muted-actors user-blocked-actors)
          %+  weld  cards
          (api-result-card request-id.aa %.y %user-actor-unmuted 'actor unmuted' ~ ~ ~)
      ==
    ::
        %block-actor
      =/  pr  (api-parse-actor-ref host.aa desk.aa id.aa)
      ?:  ?=(%.n -.pr)
        :_  this
        (api-result-card request-id.aa %.n code.p.pr msg.p.pr ~ ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%block-actor p.pr]))
      :_  this
      :*  (user-actor-prefs-fact ~[/api/results] user-muted-actors user-blocked-actors)
          %+  weld  cards
          (api-result-card request-id.aa %.y %user-actor-blocked 'actor blocked' ~ ~ ~)
      ==
    ::
        %unblock-actor
      =/  pr  (api-parse-actor-ref host.aa desk.aa id.aa)
      ?:  ?=(%.n -.pr)
        :_  this
        (api-result-card request-id.aa %.n code.p.pr msg.p.pr ~ ~ ~)
      ?.  (~(has in user-blocked-actors) p.pr)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'actor was not blocked' ~ ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%unblock-actor p.pr]))
      :_  this
      :*  (user-actor-prefs-fact ~[/api/results] user-muted-actors user-blocked-actors)
          %+  weld  cards
          (api-result-card request-id.aa %.y %user-actor-unblocked 'actor unblocked' ~ ~ ~)
      ==
    ::
        %post-message
      ::  cheap pre-checks mirror the internal handler's guards so obvious
      ::  failures report honestly instead of silently no-op'ing.
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ::  the one extra no-op after existence/write-blocked: DM w/ blocked peer.
      ?:  (api-dm-blocked note-id.aa nt our.bowl pal-blocked)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'dm counterparty blocked' `note-id.aa ~ ~)
      ::  Phase 11B: convert the caller's app identity to a via-app stamped with
      ::  OUR ship, and pass it into %send-message. The handler writes via-by-eid
      ::  for local stores and carries via on forward/broadcast to host+members.
      =/  via=(unit via-app:noltbook)
        ?~  app.aa  ~
        `[desk.u.app.aa title.u.app.aa publisher.u.app.aa our.bowl]
      ::  Phase ACTOR-A / G2: governance gate. A supplied actor = valid app + valid
      ::  kind (note-type is NO LONGER part of this decision). Such an actor runs the
      ::  host's app grant + registry (TOFU); a governance-DENIED actor REJECTS. The
      ::  candidate registry is HELD — the G2 actor-note-access check below then
      ::  enforces own-or-participate and FAILS %unsupported on an excluded note type
      ::  (cover/gossip/ars-rumors/dm), so a valid actor is NEVER silently stripped
      ::  and posted as the host. Only no-actor / missing-app / bad-kind => host post.
      ::  Phase G5A: a post into a marked actor-DM note ALSO requires %send-dm.
      =/  dm-need=(set app-cap:noltbook)
        ?:((~(has by actor-dm-notes) note-id.aa) (sy ~[%attribute %post-message %send-dm]) (sy ~[%attribute %post-message]))
      =/  ar=(each [a=(unit actor:noltbook) reg=(map [@tas @t] actor-record:noltbook)] [code=@tas msg=@t])
        ?.  ?&  ?=(^ app.aa)  ?=(^ actor.aa)
                ?=(?(%user %bot %app) kind.u.actor.aa)
            ==
          [%.y ~ actor-registry]
        =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa dm-need app-grants actor-registry)
        ?-  -.r
          %.n  [%.n p.r]
          %.y  [%.y `actor.p.r registry.p.r]
        ==
      ?:  ?=(%.n -.ar)
        :_  this
        (api-result-card request-id.aa %.n code.p.ar msg.p.ar `note-id.aa ~ ~)
      ::  Phase G2: a supplied/attributed actor MUST own or participate in the note
      ::  (eligible %notebook/%group only; %dm => unsupported). The gate's candidate
      ::  registry is HELD; we commit only after this passes, so a denied actor never
      ::  TOFU-registers, bumps last-seen, posts as host, or mutates messages. A
      ::  no-actor host post (a.p.ar == ~) skips this entirely — host behavior unchanged.
      =/  access-fail=(unit [code=@tas msg=@t])
        ?~  a.p.ar  ~
        =/  acc  (actor-note-access our.bowl note-id.aa desk.u.a.p.ar id.u.a.p.ar notes note-actor-owners actor-note-roster actor-dm-notes)
        ?:(?=(%.y -.acc) ~ `p.acc)
      ?^  access-fail
        :_  this
        (api-result-card request-id.aa %.n code.u.access-fail msg.u.access-fail `note-id.aa ~ ~)
      ::  1B.1: a no-actor (host human) post into ANY regular note the human is NOT a
      ::  logical member of returns honestly instead of claiming posted (system notes
      ::  exempt). Attributed actor posts (a.p.ar=^) already passed actor-note-access.
      ?:  ?&  ?=(~ a.p.ar)
              !(human-sees-note note-id.aa our.bowl note-members note-actor-owners notes)
          ==
        :_  this
        (api-result-card request-id.aa %.n %not-participant 'host user is not a logical participant of this note' `note-id.aa ~ ~)
      ::  Phase A1: an attributed actor muted in this note cannot post (note-level mute).
      ?:  ?&  ?=(^ a.p.ar)
              (actor-muted note-id.aa [our.bowl desk.u.a.p.ar id.u.a.p.ar] note-actor-muted)
          ==
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'actor is muted in this note' `note-id.aa ~ ~)
      =.  actor-registry  reg.p.ar
      =+  conf=(api-send-confirm note-id.aa nt our.bowl now.bowl seq-counters)
      ::  G6A: the posting actor's OWN message must not make it unread. Advance its
      ::  cursor to now.bowl (= the local message id on a note we host). For a remote
      ::  note the host re-stamps the message; the %new-message receipt path then
      ::  advances to that exact id (monotonic). Other actors stay unread.
      =?  actor-note-read  ?=(^ a.p.ar)
        (actor-read-put actor-note-read desk.u.a.p.ar id.u.a.p.ar note-id.aa now.bowl)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%send-message note-id.aa text.aa ~ reply-to-eid.aa ~ via a.p.ar]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code.conf 'message sent' `note-id.aa mid.conf eid.conf)
    ::
        %post-app-ref
      ::  validate publisher (@p) + desk (term) first; bad input => failure with
      ::  the precise code and no message posted.
      =/  res=(each @t @tas)  (api-app-ref publisher.aa desk.aa name.aa)
      ?:  ?=(%.n -.res)
        :_  this
        (api-result-card request-id.aa %.n p.res 'invalid app ref' `note-id.aa ~ ~)
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ?:  (api-dm-blocked note-id.aa nt our.bowl pal-blocked)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'dm counterparty blocked' `note-id.aa ~ ~)
      ::  Phase G5A: app-refs AS AN ACTOR are not supported inside actor-DM notes.
      ?:  ?&((~(has by actor-dm-notes) note-id.aa) ?=(^ actor.aa))
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'app-ref as actor is not supported in actor DMs' `note-id.aa ~ ~)
      =/  via=(unit via-app:noltbook)
        ?~  app.aa  ~
        `[desk.u.app.aa title.u.app.aa publisher.u.app.aa our.bowl]
      ::  Phase ACTOR-A / G2: same as %post-message — a supplied actor (valid app +
      ::  kind) runs governance, then actor-note-access enforces own-or-participate
      ::  and FAILS %unsupported on excluded note types; never stripped to a host post.
      =/  ar=(each [a=(unit actor:noltbook) reg=(map [@tas @t] actor-record:noltbook)] [code=@tas msg=@t])
        ?.  ?&  ?=(^ app.aa)  ?=(^ actor.aa)
                ?=(?(%user %bot %app) kind.u.actor.aa)
            ==
          [%.y ~ actor-registry]
        =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %post-message]) app-grants actor-registry)
        ?-  -.r
          %.n  [%.n p.r]
          %.y  [%.y `actor.p.r registry.p.r]
        ==
      ?:  ?=(%.n -.ar)
        :_  this
        (api-result-card request-id.aa %.n code.p.ar msg.p.ar `note-id.aa ~ ~)
      ::  Phase G2: same own-or-participate gate as %post-message (held registry).
      =/  access-fail=(unit [code=@tas msg=@t])
        ?~  a.p.ar  ~
        =/  acc  (actor-note-access our.bowl note-id.aa desk.u.a.p.ar id.u.a.p.ar notes note-actor-owners actor-note-roster actor-dm-notes)
        ?:(?=(%.y -.acc) ~ `p.acc)
      ?^  access-fail
        :_  this
        (api-result-card request-id.aa %.n code.u.access-fail msg.u.access-fail `note-id.aa ~ ~)
      ::  1B.1: a no-actor (host human) post into ANY regular note the human is NOT a
      ::  logical member of returns honestly instead of claiming posted (system notes
      ::  exempt). Attributed actor posts (a.p.ar=^) already passed actor-note-access.
      ?:  ?&  ?=(~ a.p.ar)
              !(human-sees-note note-id.aa our.bowl note-members note-actor-owners notes)
          ==
        :_  this
        (api-result-card request-id.aa %.n %not-participant 'host user is not a logical participant of this note' `note-id.aa ~ ~)
      ::  Phase A1: an attributed actor muted in this note cannot post (note-level mute).
      ?:  ?&  ?=(^ a.p.ar)
              (actor-muted note-id.aa [our.bowl desk.u.a.p.ar id.u.a.p.ar] note-actor-muted)
          ==
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'actor is muted in this note' `note-id.aa ~ ~)
      =.  actor-registry  reg.p.ar
      =+  conf=(api-send-confirm note-id.aa nt our.bowl now.bowl seq-counters)
      ::  G6A: advance the posting actor's own cursor (see %post-message).
      =?  actor-note-read  ?=(^ a.p.ar)
        (actor-read-put actor-note-read desk.u.a.p.ar id.u.a.p.ar note-id.aa now.bowl)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%send-message note-id.aa p.res ~ ~ ~ via a.p.ar]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code.conf 'app ref sent' `note-id.aa mid.conf eid.conf)
    ::
    ::  ---- Actor Control (Phase A): host governance over local app actors. ----
    ::  These mutate grants/registry only; they never post content and the actor
    ::  -bearing post path cannot reach them. Same-ship only (the on-poke guard);
    ::  on one ship "host vs app" is cooperative, not a cryptographic boundary.
        %set-app-grant
      =/  dterm=(unit @tas)  (rush desk.aa sym)
      ?~  dterm
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'desk did not parse' ~ ~ ~)
      ::  caps default to {%attribute}; any valid app-cap string is kept, unknown
      ::  strings are dropped (the ?= narrows a parsed term to the app-cap enum).
      =/  caps=(set app-cap:noltbook)
        ?~  caps.aa  (sy ~[%attribute])
        %-  ~(gas in *(set app-cap:noltbook))
        %+  murn  ~(tap in u.caps.aa)
        |=  c=@t  ^-  (unit app-cap:noltbook)
        =/  ct  (rush c sym)
        ?~  ct  ~
        ?.  ?=(app-cap:noltbook u.ct)  ~
        `u.ct
      =/  existing  (~(get by app-grants) u.dterm)
      =/  prior-rev=(unit @da)  ?~(existing ~ revoked-at.u.existing)
      =/  ng=app-grant:noltbook
        :*  u.dterm  enabled.aa  caps  our.bowl
            ?~(existing now.bowl granted-at.u.existing)
            now.bowl
            ?:(enabled.aa prior-rev `now.bowl)
        ==
      =.  app-grants  (~(put by app-grants) u.dterm ng)
      :_  this
      (api-result-card request-id.aa %.y ?:(enabled.aa %app-granted %app-disabled) 'app grant set' ~ ~ ~)
    ::
        %set-actor-status
      =/  dterm=(unit @tas)  (rush desk.aa sym)
      ?~  dterm
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'desk did not parse' ~ ~ ~)
      =/  st=(unit actor-status:noltbook)
        ?:  =('active' status.aa)  `%active
        ?:  =('suspended' status.aa)  `%suspended
        ?:  =('revoked' status.aa)  `%revoked
        ~
      ?~  st
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad status' ~ ~ ~)
      =/  key  [u.dterm id.aa]
      =/  rec  (~(get by actor-registry) key)
      ?~  rec
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'no such actor' ~ ~ ~)
      =/  nr=actor-record:noltbook
        %=  u.rec
          status      u.st
          updated-at  now.bowl
          revoked-at  ?:(?=(%revoked u.st) `now.bowl revoked-at.u.rec)
        ==
      =.  actor-registry  (~(put by actor-registry) key nr)
      ::  A1.3a: revoking a local actor sweeps its ref out of every pending request set
      ::  (roster membership, note-level mute, messages, profile, attribution are kept).
      =?  actor-join-requests  ?=(%revoked u.st)
        (sweep-actor-requests [our.bowl u.dterm id.aa] actor-join-requests)
      =/  code=@tas
        ?-(u.st %active %actor-active, %suspended %actor-suspended, %revoked %actor-revoked)
      :_  this
      (api-result-card request-id.aa %.y code 'actor status set' ~ ~ ~)
    ::
        %update-actor
      =/  dterm=(unit @tas)  (rush desk.aa sym)
      ?~  dterm
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'desk did not parse' ~ ~ ~)
      =/  knd=(unit ?(%user %bot %app))
        ?:  =('user' kind.aa)  `%user
        ?:  =('bot' kind.aa)  `%bot
        ?:  =('app' kind.aa)  `%app
        ~
      ?~  knd
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad kind' ~ ~ ~)
      ?:  =(0 (met 3 id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'empty id' ~ ~ ~)
      ::  %update-actor requires the app to hold %manage-actors (host-granted).
      =/  g  (~(get by app-grants) u.dterm)
      ?:  ?|(?=(~ g) !enabled.u.g !(~(has in caps.u.g) %manage-actors))
        :_  this
        (api-result-card request-id.aa %.n %app-not-granted 'app lacks %manage-actors' ~ ~ ~)
      =/  key  [u.dterm id.aa]
      =/  rec  (~(get by actor-registry) key)
      ::  caps three-state: ~ keep existing (or ~ for new); [~ ~] clear→inherit;
      ::  [~ [~ strs]] set explicit (parsed/clamped to valid app-caps).
      =/  new-caps=(unit (set app-cap:noltbook))
        ?~  caps.aa  ?~(rec ~ caps.u.rec)
        ?~  u.caps.aa  ~
        :-  ~
        %-  ~(gas in *(set app-cap:noltbook))
        %+  murn  ~(tap in u.u.caps.aa)
        |=  c=@t  ^-  (unit app-cap:noltbook)
        =/  ct  (rush c sym)
        ?~  ct  ~
        ?.  ?=(app-cap:noltbook u.ct)  ~
        `u.ct
      =/  nr=actor-record:noltbook
        ?~  rec
          [id.aa name.aa u.knd %active now.bowl now.bowl ~ now.bowl new-caps]
        u.rec(name name.aa, kind u.knd, updated-at now.bowl, caps new-caps)
      =.  actor-registry  (~(put by actor-registry) key nr)
      :_  this
      (api-result-card request-id.aa %.y %actor-updated 'actor updated' ~ ~ ~)
    ::
    ::  ---- Phase 12A: artifact creation (code/app only; no raw file upload). ----
        %create-artifact
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-art-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ?:  =('' name.aa)
        :_  this
        (api-art-result-card request-id.aa %.n %invalid-name 'name cannot be empty' `note-id.aa ~ ~)
      =/  atype=(unit artifact-type:noltbook)
        ?:  =('code' type.aa)  `%code
        ?:  =('app' type.aa)   `%app
        ~
      ?~  atype
        :_  this
        (api-art-result-card request-id.aa %.n %invalid-type 'type must be code or app' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-art-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      ::  mirror the internal handler gate: cover/gossip artifact creation is closed.
      ?:  ?|(=(%cover type.nt) =(%gossip type.nt))
        :_  this
        (api-art-result-card request-id.aa %.n %unsupported 'cover/gossip artifact creation not supported' `note-id.aa ~ ~)
      ::  precompute the aid/eid the handler mints this same event:
      ::  aid = art-{now}, eid = (sham [our aid]).
      =/  aid=@ta  (crip (weld "art-" (trip (scot %da now.bowl))))
      =/  art-eid=@uv  (sham [our.bowl aid])
      =/  via=(unit via-app:noltbook)
        ?~  app.aa  ~
        `[desk.u.app.aa title.u.app.aa publisher.u.app.aa our.bowl]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-artifact note-id.aa name.aa u.atype content.aa reply-to-eid.aa]))
      ::  Phase 12A: attribute the locally-created artifact by its eid. Local only —
      ::  remote artifact via propagation (artifact-created/remote wire) is deferred.
      =?  via-by-eid  ?=(^ via)
        (~(put by via-by-eid) art-eid u.via)
      :_  this
      %+  weld  cards
      (api-art-result-card request-id.aa %.y %artifact-created 'artifact created' `note-id.aa `art-eid `aid)
    ::
        %edit-artifact
      =/  art-u=(unit artifact:noltbook)  (~(get by artifacts) art-id.aa)
      ?~  art-u
        :_  this
        (api-art-result-card request-id.aa %.n %missing-target 'no such artifact' ~ ~ `art-id.aa)
      =/  art=artifact:noltbook  u.art-u
      =/  r-eid=(unit @uv)  ?~(meta.art ~ `eid.u.meta.art)
      ?~  (~(get by notes) note-id.art)
        :_  this
        (api-art-result-card request-id.aa %.n %missing-note 'artifact note no longer exists' `note-id.art r-eid `art-id.aa)
      ?:  (is-write-blocked note-id.art host-status notes our.bowl)
        :_  this
        (api-art-result-card request-id.aa %.n %rejected 'write blocked' `note-id.art r-eid `art-id.aa)
      =/  nt=note:noltbook  (~(got by notes) note-id.art)
      ::  authority: %app artifacts are shared interactive state — any current member may edit
      ::  (the host re-validates + moderates); %code/%file stay creator-only. %app content is
      ::  validated here too, since the internal action now also accepts member %app edits.
      =/  gate-err=(unit [code=@tas msg=@t])
        ?:  ?=(%app type.art)
          ?.  (~(has in users.nt) our.bowl)  `[%rejected 'not a member of this note']
          ?.  (valid-app-artifact-content content.aa)  `[%invalid 'invalid app descriptor']
          ~
        ?.  =(our.bowl creator.art)  `[%rejected 'only artifact creator can edit via API']
        ~
      ?^  gate-err
        :_  this
        (api-art-result-card request-id.aa %.n code.u.gate-err msg.u.gate-err `note-id.art r-eid `art-id.aa)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%edit-artifact art-id.aa content.aa]))
      :_  this
      %+  weld  cards
      (api-art-result-card request-id.aa %.y %artifact-edited 'artifact edited' `note-id.art r-eid `art-id.aa)
    ::
        %delete-artifact
      =/  art-u=(unit artifact:noltbook)  (~(get by artifacts) art-id.aa)
      ?~  art-u
        :_  this
        (api-art-result-card request-id.aa %.n %missing-target 'no such artifact' ~ ~ `art-id.aa)
      =/  art=artifact:noltbook  u.art-u
      =/  r-eid=(unit @uv)  ?~(meta.art ~ `eid.u.meta.art)
      ?~  (~(get by notes) note-id.art)
        :_  this
        (api-art-result-card request-id.aa %.n %missing-note 'artifact note no longer exists' `note-id.art r-eid `art-id.aa)
      ?:  (is-write-blocked note-id.art host-status notes our.bowl)
        :_  this
        (api-art-result-card request-id.aa %.n %rejected 'write blocked' `note-id.art r-eid `art-id.aa)
      ?.  =(our.bowl creator.art)
        :_  this
        (api-art-result-card request-id.aa %.n %rejected 'only artifact creator can delete via API' `note-id.art r-eid `art-id.aa)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%delete-artifact art-id.aa]))
      ::  Phase 12B cleanup: drop the artifact's attribution row after delete.
      =?  via-by-eid  ?=(^ r-eid)
        (~(del by via-by-eid) u.r-eid)
      :_  this
      %+  weld  cards
      (api-art-result-card request-id.aa %.y %artifact-deleted 'artifact deleted' `note-id.art r-eid `art-id.aa)
    ::
    ::  ---- Phase 13: message-body search (read-only, no state mutation). ----
        %search-messages
      ::  no request-id => no observable result (search has no side effects).
      ?~  request-id.aa  `this
      ::  empty query: reject (the sidebar matches-all on empty, which would dump
      ::  every message — not a useful API default), report as invalid-query.
      ?:  =('' query.aa)
        :_  this
        (api-result-card request-id.aa %.n %invalid-query 'query cannot be empty' ~ ~ ~)
      =/  res  (api-search-scan query.aa limit.aa note-id.aa messages notes pal-blocked)
      :_  this
      ~[(gf-paths ~[/api/results] `update:noltbook`[%api-search-result u.request-id.aa query.aa hits.res capped.res])]
    ::
    ::  ---- Phase 14: find or create the canonical DM for {our, ship}. ----
        %find-or-create-dm
      =/  who=(unit @p)  (slaw %p ship.aa)
      ?~  who
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'ship did not parse' ~ ~ ~)
      ?:  =(u.who our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot DM yourself' ~ ~ ~)
      ?:  (~(has in pal-blocked) u.who)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'ship is blocked' ~ ~ ~)
      =/  target-users=(set @p)  (sy ~[our.bowl u.who])
      =/  existing=(unit note:noltbook)  (find-dm-root notes target-users)
      ?^  existing
        :_  this
        (api-result-card request-id.aa %.y %found 'dm found' `id.u.existing ~ ~)
      ::  no DM yet: %create-dm mints nid = note-{now} (same formula) and fires the
      ::  invite/pal side effects — reuse it, don't duplicate.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-dm u.who]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %dm-created 'dm created' `nid ~ ~)
    ::
    ::  ---- Phase 16: find or create a user-gossip note by exact name. ----
        %find-or-create-gossip-note
      ?:  =('' name.aa)
        :_  this
        (api-result-card request-id.aa %.n %invalid-name 'name cannot be empty' ~ ~ ~)
      =/  existing=(unit @ta)  (api-find-gossip-by-name name.aa notes our.bowl)
      ?^  existing
        :_  this
        (api-result-card request-id.aa %.y %found 'gossip note found' `u.existing ~ ~)
      ::  %create-gossip-note mints nid = note-{now} (same formula) with no gates.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-gossip-note name.aa headline.aa ~]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %gossip-created 'gossip note created' `nid ~ ~)
    ::
    ::  ---- Phase 17: fork actions (reuse the internal fork handlers). ----
        %fork-note
      =/  src-u=(unit note:noltbook)  (~(get by notes) note-id.aa)
      ?~  src-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  src=note:noltbook  u.src-u
      ::  mirror the handler gates: only %group notes, member-or-removed may fork.
      ?.  =(%group type.src)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'only group notes can be forked' `note-id.aa ~ ~)
      ::  the creator of an active note cannot fork their own note (matches the UI,
      ::  which never offers Fork Group to the host).
      ?:  &(=(our.bowl creator.src) !(is-host-deleted note-id.aa host-status))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'the note creator cannot fork their own note' `note-id.aa ~ ~)
      ?.  ?|((~(has in users.src) our.bowl) (~(has in removed.src) our.bowl))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'must be a member to fork' `note-id.aa ~ ~)
      ::  the fork root takes idx 0 in gen-fork-id-map => note-{now} (precomputable).
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%fork-note note-id.aa name.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %fork-created 'fork created' `nid ~ ~)
    ::
        %accept-fork-invite
      =/  inv  (~(get by pending-fork-invites) root-id.aa)
      ?~  inv
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending invite for rootId' `root-id.aa ~ ~)
      ?:  (~(has in pal-blocked) sender.u.inv)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'forker is blocked' `root-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%accept-fork-invite root-id.aa]))
      ::  async: the handler only sends a remote fork-fetch and marks fetching; the
      ::  subtree installs later via %remote-fork-payload. Hence "requested".
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %fork-fetch-requested 'fork fetch requested (installs async)' `root-id.aa ~ ~)
    ::
        %decline-fork-invite
      ?.  (~(has by pending-fork-invites) root-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending invite for rootId' `root-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%decline-fork-invite root-id.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %fork-invite-declined 'fork invite declined' `root-id.aa ~ ~)
    ::
    ::  ---- Phase 18: call controls (Noltbook call state; no media/WebRTC). ----
        %start-call
      =/  ex=(unit note:noltbook)  (~(get by notes) note-id.aa)
      ?~  ex
        :_  this
        (api-call-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~)
      ::  active call with participants => the handler no-ops; report honestly.
      =/  old-call  (~(get by active-calls) note-id.aa)
      ?:  ?&(?=(^ old-call) (gth ~(wyt in participants.u.old-call) 0))
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'call already active' `note-id.aa `call-id.u.old-call)
      ::  creator starts locally (cid = call-{now}); non-creator forwards to host.
      =/  is-creator=?  =(our.bowl creator.u.ex)
      =/  cid=@ta  (crip (weld "call-" (trip (scot %da now.bowl))))
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%start-call note-id.aa]))
      :_  this
      %+  weld  cards
      ?:  is-creator
        (api-call-result-card request-id.aa %.y %call-started 'call started' `note-id.aa `cid)
      (api-call-result-card request-id.aa %.y %accepted 'call start forwarded to host' `note-id.aa ~)
    ::
        %join-call
      =/  ex=(unit note:noltbook)  (~(get by notes) note-id.aa)
      ?~  ex
        :_  this
        (api-call-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~)
      =/  ci  (~(get by active-calls) note-id.aa)
      ?~  ci
        :_  this
        (api-call-result-card request-id.aa %.n %missing-target 'no active call to join' `note-id.aa ~)
      ?:  (~(has in participants.u.ci) our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'already in call' `note-id.aa `call-id.u.ci)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%join-call note-id.aa]))
      :_  this
      %+  weld  cards
      (api-call-result-card request-id.aa %.y %call-joined 'call joined' `note-id.aa `call-id.u.ci)
    ::
        %leave-call
      =/  ex=(unit note:noltbook)  (~(get by notes) note-id.aa)
      ?~  ex
        :_  this
        (api-call-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~)
      =/  ci  (~(get by active-calls) note-id.aa)
      ?~  ci
        :_  this
        (api-call-result-card request-id.aa %.n %missing-target 'no active call' `note-id.aa ~)
      ?.  (~(has in participants.u.ci) our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'not in call' `note-id.aa `call-id.u.ci)
      =/  cid=@ta  call-id.u.ci
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%leave-call note-id.aa]))
      :_  this
      %+  weld  cards
      (api-call-result-card request-id.aa %.y %call-left 'call left' `note-id.aa `cid)
    ::
    ::  ---- Phase 15: profile / contact / pal mutations. ----
        %update-profile
      ?:  ?=([%invalid *] avatar.aa)
        :_  this
        (api-result-card request-id.aa %.n %invalid-avatar 'avatar payload could not be parsed' ~ ~ ~)
      ::  partial update: omitted fields keep current, null clears, value sets.
      =/  cur=profile:noltbook  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  dn=(unit @t)  ?~(display-name.aa display-name.cur u.display-name.aa)
      =/  wa=(unit @t)  ?~(wallet-address.aa wallet-address.cur u.wallet-address.aa)
      =/  za=(unit @t)  ?~(azimuth-address.aa azimuth-address.cur u.azimuth-address.aa)
      =/  av=(unit avatar-ref:noltbook)
        ?-  -.avatar.aa
          %keep   avatar.cur
          %clear  ~
          %set    `av.avatar.aa
        ==
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%update-profile dn av wa za]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %profile-updated 'profile updated' ~ ~ ~)
    ::
        %add-contact
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%add-contact p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %contact-added 'contact added' ~ ~ ~)
    ::
        %remove-contact
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%remove-contact p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %contact-removed 'contact removed' ~ ~ ~)
    ::
        %add-pal
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%add-pal p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pal-requested 'pal request sent' ~ ~ ~)
    ::
        %remove-pal
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%remove-pal p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pal-removed 'pal removed' ~ ~ ~)
    ::
        %block-pal
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%block-pal p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pal-blocked 'pal blocked' ~ ~ ~)
    ::
        %unblock-pal
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%unblock-pal p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pal-unblocked 'pal unblocked' ~ ~ ~)
    ::
        %edit-message
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.aa) ~)
      =/  tgt=(unit message:noltbook)  (api-resolve-msg msgs eid.aa msg-id.aa)
      ?~  tgt
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no matching message' `note-id.aa ~ ~)
      =/  r-mid=(unit @da)  `id.u.tgt
      =/  r-eid=(unit @uv)  ?~(meta.u.tgt ~ `eid.u.meta.u.tgt)
      =/  applies-local=?  ?|(=(%dm type.nt) =(our.bowl creator.nt))
      ::  edit is author-only where applied locally; remote notes are forwarded
      ::  to the host, which enforces authorship there.
      ?:  ?&(applies-local !=(our.bowl author.u.tgt))
        :_  this
        (api-result-card request-id.aa %.n %rejected 'only the author can edit' `note-id.aa r-mid r-eid)
      =/  code=@tas  ?:(applies-local %edited %accepted)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%edit-message note-id.aa id.u.tgt eid.aa text.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code 'message edited' `note-id.aa r-mid r-eid)
    ::
        %delete-message
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.aa) ~)
      =/  tgt=(unit message:noltbook)  (api-resolve-msg msgs eid.aa msg-id.aa)
      ?~  tgt
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no matching message' `note-id.aa ~ ~)
      =/  r-mid=(unit @da)  `id.u.tgt
      =/  r-eid=(unit @uv)  ?~(meta.u.tgt ~ `eid.u.meta.u.tgt)
      =/  is-local-host=?  =(our.bowl creator.nt)
      =/  applies-local=?  ?|(=(%dm type.nt) is-local-host)
      ::  mirrors %delete-message: author may delete own; a local-host group lets
      ::  the host delete any. Remote notes are forwarded to the host.
      =/  allowed=?  ?|(=(our.bowl author.u.tgt) &(is-local-host (gth ~(wyt in users.nt) 2)))
      ?:  ?&(applies-local !allowed)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'not allowed to delete' `note-id.aa r-mid r-eid)
      =/  code=@tas  ?:(applies-local %deleted %accepted)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%delete-message note-id.aa id.u.tgt eid.aa]))
      ::  Phase 11A cleanup: drop the attribution row for a locally-deleted message.
      =?  via-by-eid  ?&(=(%deleted code) ?=(^ r-eid))
        (~(del by via-by-eid) u.r-eid)
      ::  Phase B parity: also drop the actor row so deletes don't orphan it.
      =?  actor-by-eid  ?&(=(%deleted code) ?=(^ r-eid))
        (~(del by actor-by-eid) u.r-eid)
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code 'message deleted' `note-id.aa r-mid r-eid)
    ::
    ::  ---- Actor Tools (Phase B / G3B): an app actor edits/deletes ONLY its own
    ::  attributed messages. Require app+actor; verify actor-ownership via
    ::  gate-actor-owns + current participation; then re-enter the existing internal
    ::  edit/delete handler (authored as our.bowl). A note WE host applies durably
    ::  (%actor-edited/%actor-deleted); a remote-hosted %group note forwards the
    ::  existing %remote-edit-msg/%remote-delete-msg and returns %accepted. ----
        %edit-actor-message
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.aa) ~)
      ::  Phase G5A: editing inside a marked actor-DM note ALSO requires %send-dm.
      =/  edit-need=(set app-cap:noltbook)
        ?:((~(has by actor-dm-notes) note-id.aa) (sy ~[%attribute %edit-own-message %send-dm]) (sy ~[%attribute %edit-own-message]))
      =/  g  (gate-actor-owns our.bowl now.bowl app.aa actor.aa msgs eid.aa msg-id.aa edit-need app-grants actor-registry actor-by-eid)
      ?:  ?=(%.n -.g)
        :_  this
        (api-result-card request-id.aa %.n code.p.g msg.p.g `note-id.aa ~ ~)
      ::  Phase G2: beyond exact actor-by-eid ownership, also require CURRENT note
      ::  ownership/participation — an actor that no longer participates cannot edit
      ::  its earlier messages via the actor API. The gate's candidate registry is
      ::  held; we commit only after this passes (no TOFU/last-seen on failure).
      =/  acc  (actor-note-access our.bowl note-id.aa desk.u.app.aa id.u.actor.aa notes note-actor-owners actor-note-roster actor-dm-notes)
      ?:  ?=(%.n -.acc)
        :_  this
        (api-result-card request-id.aa %.n code.p.acc msg.p.acc `note-id.aa ~ ~)
      ::  Phase A1: a note-level actor mute blocks this write (reads/profile/leave stay open).
      ?:  (actor-muted note-id.aa [our.bowl desk.u.app.aa id.u.actor.aa] note-actor-muted)
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'actor is muted in this note' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.g
      =/  tgt=message:noltbook  target.p.g
      =/  teid=@uv  eid.p.g
      ::  G3B: a note WE host (creator==our) edits durably here; a remote-hosted %group
      ::  note re-enters the SAME internal %edit-message, whose non-creator branch
      ::  forwards the existing %remote-edit-msg to the host (no new wire shape). A
      ::  forwarded edit is HANDED-OFF, not host-confirmed => %accepted, never
      ::  %actor-edited. actor-by-eid is never rewritten, so the host's %message-edited
      ::  (same eid) re-renders as the same actor.
      =/  is-local=?  =(our.bowl creator.nt)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%edit-message note-id.aa id.tgt `teid text.aa]))
      :_  this
      %+  weld  cards
      ?:  is-local
        (api-result-card request-id.aa %.y %actor-edited 'actor edited message' `note-id.aa `id.tgt `teid)
      (api-result-card request-id.aa %.y %accepted 'actor edit forwarded to host' `note-id.aa `id.tgt `teid)
    ::
        %delete-actor-message
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' ~ ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' `note-id.aa ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' `note-id.aa ~ ~)
      =/  msgs=(list message:noltbook)  (fall (~(get by messages) note-id.aa) ~)
      ::  Phase G5A: deleting inside a marked actor-DM note ALSO requires %send-dm.
      =/  del-need=(set app-cap:noltbook)
        ?:((~(has by actor-dm-notes) note-id.aa) (sy ~[%attribute %delete-own-message %send-dm]) (sy ~[%attribute %delete-own-message]))
      =/  g  (gate-actor-owns our.bowl now.bowl app.aa actor.aa msgs eid.aa msg-id.aa del-need app-grants actor-registry actor-by-eid)
      ?:  ?=(%.n -.g)
        :_  this
        (api-result-card request-id.aa %.n code.p.g msg.p.g `note-id.aa ~ ~)
      ::  Phase G2: also require CURRENT note ownership/participation (held registry).
      =/  acc  (actor-note-access our.bowl note-id.aa desk.u.app.aa id.u.actor.aa notes note-actor-owners actor-note-roster actor-dm-notes)
      ?:  ?=(%.n -.acc)
        :_  this
        (api-result-card request-id.aa %.n code.p.acc msg.p.acc `note-id.aa ~ ~)
      ::  Phase A1: a note-level actor mute blocks this write (reads/profile/leave stay open).
      ?:  (actor-muted note-id.aa [our.bowl desk.u.app.aa id.u.actor.aa] note-actor-muted)
        :_  this
        (api-result-card request-id.aa %.n %note-actor-muted 'actor is muted in this note' `note-id.aa ~ ~)
      =.  actor-registry  registry.p.g
      =/  tgt=message:noltbook  target.p.g
      =/  teid=@uv  eid.p.g
      ::  G3B: a note WE host deletes durably here; a remote-hosted %group note re-enters
      ::  the SAME internal %delete-message, whose non-creator branch forwards the
      ::  existing %remote-delete-msg to the host (handed-off, NOT host-confirmed =>
      ::  %accepted). Only prune attribution on the LOCAL delete — for a forwarded
      ::  delete the message (and its via/actor rows) stay until the host's authoritative
      ::  %message-deleted arrives, which the subscriber path then prunes.
      =/  is-local=?  =(our.bowl creator.nt)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%delete-message note-id.aa id.tgt `teid]))
      =?  via-by-eid    is-local  (~(del by via-by-eid) teid)
      =?  actor-by-eid  is-local  (~(del by actor-by-eid) teid)
      :_  this
      %+  weld  cards
      ?:  is-local
        (api-result-card request-id.aa %.y %actor-deleted 'actor deleted message' `note-id.aa `id.tgt `teid)
      (api-result-card request-id.aa %.y %accepted 'actor delete forwarded to host' `note-id.aa `id.tgt `teid)
    ::
    ::  ---- Phase 9: membership/admin mutations (re-enter the existing handlers
    ::  so all ownership/host checks still apply). %mod ops forward to the host
    ::  when we're an admin (not creator) => "accepted"; otherwise durable. ----
        %request-join
      ::  host = explicit host arg, else the local note's creator if we have it.
      =/  host-u=(unit @p)
        ?:  =('' host.aa)
          =/  nt-u  (~(get by notes) note-id.aa)
          ?~(nt-u ~ `creator.u.nt-u)
        (slaw %p host.aa)
      ?~  host-u
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no host: pass host or hold the note locally' `note-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%request-join note-id.aa u.host-u]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %joined-requested 'request-join sent' `note-id.aa ~ ~)
    ::
        %approve-join
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%approve-join note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %approved) 'approve-join' `note-id.aa ~ ~)
    ::
        %deny-join
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%deny-join note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %denied) 'deny-join' `note-id.aa ~ ~)
    ::
        %deny-block-join
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%deny-block-join note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %blocked) 'deny-block-join' `note-id.aa ~ ~)
    ::
        %add-member
      =/  pre  (api-mod-pre %invite request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%invite-to-note note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %member-added 'add-member' `note-id.aa ~ ~)
    ::
        %remove-member
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%remove-member note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %member-removed) 'remove-member' `note-id.aa ~ ~)
    ::
        %mute-member
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%mute-member note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %muted) 'mute-member' `note-id.aa ~ ~)
    ::
        %unmute-member
      =/  pre  (api-mod-pre %mod request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%unmute-member note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y ?:(forwarded.p.pre %accepted %unmuted) 'unmute-member' `note-id.aa ~ ~)
    ::
        %make-admin
      =/  pre  (api-mod-pre %admin request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%make-admin note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %admin-added 'make-admin' `note-id.aa ~ ~)
    ::
        %remove-admin
      =/  pre  (api-mod-pre %admin request-id.aa note-id.aa ship.aa notes our.bowl note-admins host-status)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%remove-admin note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %admin-removed 'remove-admin' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Member Management (Phase E): an actor manages REAL @p members of
    ::  notes it owns. Shared actor-member-pre does ownership + governance + ship +
    ::  host-protection; each branch adds its target-state check and reuses the
    ::  existing internal handler (durable host-local; the host sends remote pokes). ----
        %actor-add-member
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?:  (~(has in users.nt.p.pre) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'already a member' `note-id.aa ~ ~)
      ::  first member converts a %notebook to %group (intentional).
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%invite-to-note note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %actor-member-added 'actor added member' `note-id.aa ~ ~)
    ::
        %actor-remove-member
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?.  (~(has in users.nt.p.pre) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'not a member' `note-id.aa ~ ~)
      ::  protect host-appointed admins from actor removal (admin boundary host-only).
      ?:  (~(has in (fall (~(get by note-admins) note-id.aa) ~)) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot remove an admin' `note-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%remove-member note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %actor-member-removed 'actor removed member' `note-id.aa ~ ~)
    ::
        %actor-approve-join
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?.  (~(has in (fall (~(get by join-requests) note-id.aa) ~)) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending join request' `note-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%approve-join note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %actor-approved 'actor approved join' `note-id.aa ~ ~)
    ::
        %actor-deny-join
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?.  (~(has in (fall (~(get by join-requests) note-id.aa) ~)) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'no pending join request' `note-id.aa ~ ~)
      ::  %deny-join only (no block); pal-blocked / note.removed are never touched.
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%deny-join note-id.aa who.p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %actor-denied 'actor denied join' `note-id.aa ~ ~)
    ::
        %actor-mute-member
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?.  (~(has in users.nt.p.pre) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'not a member' `note-id.aa ~ ~)
      ?:  (~(has in (fall (~(get by note-admins) note-id.aa) ~)) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot mute an admin' `note-id.aa ~ ~)
      ::  idempotent: muting an already-muted member reports success (the internal
      ::  handler is a no-op set-add).
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%mute-member note-id.aa who.p.pre]))
      :_  this
      ::  1B.3: %muted-updated re-entry fact is gated for a hidden owner host.
      %+  weld  (human-note-cards note-id.aa our.bowl note-members note-actor-owners notes cards)
      (api-result-card request-id.aa %.y %actor-muted 'actor muted member' `note-id.aa ~ ~)
    ::
        %actor-unmute-member
      =/  pre  (actor-member-pre our.bowl now.bowl app.aa actor.aa note-id.aa ship.aa note-actor-owners notes host-status app-grants actor-registry actor-dm-notes note-actor-muted)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre `note-id.aa ~ ~)
      =.  actor-registry  registry.p.pre
      ?.  (~(has in (fall (~(get by note-muted) note-id.aa) ~)) who.p.pre)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'not muted' `note-id.aa ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%unmute-member note-id.aa who.p.pre]))
      :_  this
      %+  weld  (human-note-cards note-id.aa our.bowl note-members note-actor-owners notes cards)
      (api-result-card request-id.aa %.y %actor-unmuted 'actor unmuted member' `note-id.aa ~ ~)
    ::
    ::  ---- Actor Social (Phase F1): an actor updates its OWN profile. displayName
    ::  is the canonical actor-record.name; avatar/bio/statusText live in
    ::  actor-profiles. Three-state per field. Self-scoped to [our, desk, id] —
    ::  Noltbook enforces the host grant; the trusted app (Skiff) authenticates
    ::  which Earth user supplied the actor id (Gall cannot). ----
        %update-actor-profile
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %update-own-profile]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      ::  ATOMIC: hold the gate's candidate registry locally (TOFU/last-seen are NOT
      ::  committed yet). Validate every supplied field first; mutate actor-registry
      ::  / actor-profiles only on full success, so an invalid request leaves no
      ::  TOFU row, no last-seen bump, and no profile change.
      =/  cand-registry  registry.p.r
      =/  dkey  [desk.u.app.aa id.u.actor.aa]
      =/  rec  (~(got by cand-registry) dkey)
      =/  prof  (~(get by actor-profiles) dkey)
      =/  cur-av=(unit actor-avatar-ref:noltbook)  ?~(prof ~ avatar.u.prof)
      ::  displayName three-state -> actor-record.name. absent keep; null reset to
      ::  id; string cap 64 bytes; empty after cap => invalid-name.
      =/  name-res=(each @t @tas)
        ?~  display-name.aa  [%.y name.rec]
        ?~  u.display-name.aa  [%.y id.u.actor.aa]
        =/  capped=@t  (end [3 64] u.u.display-name.aa)
        ?:  =(0 (met 3 capped))  [%.n %invalid-name]
        [%.y capped]
      ::  avatar four-state -> profile.avatar. %keep current; %clear ~; %invalid =>
      ::  invalid-avatar; %set validates type (s3/ipfs/external, urbit rejected),
      ::  url non-empty, url <= 2048 bytes.
      =/  av-res=(each (unit actor-avatar-ref:noltbook) @tas)
        ?-    -.avatar.aa
            %keep     [%.y cur-av]
            %clear    [%.y ~]
            %invalid  [%.n %invalid-avatar]
            %set
          =/  ty=@t  type.avatar.aa
          ?:  =('urbit' ty)  [%.n %invalid-avatar]
          =/  at=(unit actor-avatar-type:noltbook)
            ?:  =('s3' ty)        `%s3
            ?:  =('ipfs' ty)      `%ipfs
            ?:  =('external' ty)  `%external
            ~
          ?~  at  [%.n %invalid-avatar]
          ?:  =(0 (met 3 url.avatar.aa))  [%.n %invalid-avatar]
          ?:  (gth (met 3 url.avatar.aa) 2.048)  [%.n %invalid-avatar]
          [%.y `[u.at url.avatar.aa]]
        ==
      ::  bio (cap 280) + statusText (cap 64): absent keep; null clear; string set.
      =/  new-bio=(unit @t)
        ?~  bio.aa  ?~(prof ~ bio.u.prof)
        ?~  u.bio.aa  ~
        `(end [3 280] u.u.bio.aa)
      =/  new-st=(unit @t)
        ?~  status-text.aa  ?~(prof ~ status-text.u.prof)
        ?~  u.status-text.aa  ~
        `(end [3 64] u.u.status-text.aa)
      ::  validation gates — return BEFORE any mutation (actor-registry untouched).
      ?:  ?=(%.n -.name-res)
        :_  this
        (api-result-card request-id.aa %.n %invalid-name 'display name empty' ~ ~ ~)
      ?:  ?=(%.n -.av-res)
        :_  this
        (api-result-card request-id.aa %.n %invalid-avatar 'bad avatar (type/url)' ~ ~ ~)
      ::  success: commit the candidate registry (with canonical name + gate's
      ::  last-seen) and the profile row (always written; all-null reads as absent).
      =.  actor-registry  (~(put by cand-registry) dkey rec(name p.name-res))
      =.  actor-profiles  (~(put by actor-profiles) dkey [p.av-res new-bio new-st])
      ::  Phase G4: refresh the main FE immediately with the new PUBLIC profile (host=
      ::  our.bowl). Not pushed to remotes — they re-resolve through the cache/TTL.
      =/  pp  (build-actor-public-profile desk.u.app.aa rec(name p.name-res) `[p.av-res new-bio new-st])
      =/  pupd=update:noltbook  [%actor-profile-updated our.bowl pp]
      :_  this
      %+  weld  ~[(gf-notes pupd)]
      (api-result-card request-id.aa %.y %actor-profile-updated 'actor profile updated' ~ ~ ~)
    ::
    ::  ---- Actor Social (Phase G4): developer actor-profile resolution. Validates,
    ::  emits the immediate scalar, then re-enters the internal %request-actor-profile
    ::  so local/cache/remote logic is shared; the async %actor-profile-result lands on
    ::  /api/results (and /notes). requestId is required for correlation. ----
        %request-actor-profile
      ?~  request-id.aa
        :_  this
        (api-result-card ~ %.n %actor-invalid 'requestId required' ~ ~ ~)
      =/  who  (slaw %p host.aa)
      ?~  who
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'host did not parse' ~ ~ ~)
      =/  dt  (rush desk.aa sym)
      ?~  dt
        :_  this
        (api-result-card request-id.aa %.n %invalid-desk 'desk is not a term' ~ ~ ~)
      ?:  =(0 (met 3 id.aa))
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'id empty' ~ ~ ~)
      ?:  (gth (met 3 id.aa) 128)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'id too long' ~ ~ ~)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%request-actor-profile u.who u.dt id.aa u.request-id.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %actor-profile-requested 'actor profile lookup started' ~ ~ ~)
    ::
    ::  ---- Actor Social (Phase F2): an actor's own contact book. Contacts are
    ::  tagged identity-refs (ship or actor); they grant NO trust/pal/membership and
    ::  never touch the host's ship contacts. Self-scoped to [our, desk, id]. ----
        %actor-add-contact
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %manage-own-contacts]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      ::  ATOMIC: hold the gate's candidate registry; validate the ref before any
      ::  commit, so a bad ref / self-contact leaves no TOFU row and no last-seen bump.
      =/  cand-registry  registry.p.r
      =/  vr  (api-validate-ref our.bowl desk.u.app.aa id.u.actor.aa ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.u.app.aa id.u.actor.aa]
      =/  cur=(set identity-ref:noltbook)  (fall (~(get by actor-contacts) dkey) ~)
      ::  duplicate add is idempotent success (set put is a no-op if present).
      =.  actor-registry  cand-registry
      =.  actor-contacts  (~(put by actor-contacts) dkey (~(put in cur) p.vr))
      :_  this
      (api-result-card request-id.aa %.y %actor-contact-added 'actor contact added' ~ ~ ~)
    ::
        %actor-remove-contact
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'app required' ~ ~ ~)
      ?~  actor.aa
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'actor required' ~ ~ ~)
      ?.  ?=(?(%user %bot %app) kind.u.actor.aa)
        :_  this
        (api-result-card request-id.aa %.n %actor-invalid 'bad actor kind' ~ ~ ~)
      =/  r  (gate-actor-cap our.bowl now.bowl desk.u.app.aa id.u.actor.aa name.u.actor.aa kind.u.actor.aa (sy ~[%attribute %manage-own-contacts]) app-grants actor-registry)
      ?:  ?=(%.n -.r)
        :_  this
        (api-result-card request-id.aa %.n code.p.r msg.p.r ~ ~ ~)
      =/  cand-registry  registry.p.r
      =/  vr  (api-validate-ref our.bowl desk.u.app.aa id.u.actor.aa ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.u.app.aa id.u.actor.aa]
      =/  cur=(set identity-ref:noltbook)  (fall (~(get by actor-contacts) dkey) ~)
      ?.  (~(has in cur) p.vr)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'not a contact' ~ ~ ~)
      =/  new-set=(set identity-ref:noltbook)  (~(del in cur) p.vr)
      =.  actor-registry  cand-registry
      ::  drop the map row when the set becomes empty (keeps reads/storage clean).
      =.  actor-contacts
        ?:  =(~ new-set)  (~(del by actor-contacts) dkey)
        (~(put by actor-contacts) dkey new-set)
      :_  this
      (api-result-card request-id.aa %.y %actor-contact-removed 'actor contact removed' ~ ~ ~)
    ::
    ::  ---- Actor Social (Phase F3): an actor's own STORED-ONLY identity mute/block
    ::  book. Every write gates on %attribute + %manage-own-preferences via
    ::  actor-pref-pre. Block and mute are independent sets; nothing host-level
    ::  (pal-blocked/contacts/note-muted/membership/attention) is touched and reads
    ::  are NOT filtered. ATOMIC: the candidate registry is held and committed only on
    ::  success, so a failed action never TOFU-registers or bumps last-seen, and every
    ::  failure with a requestId still emits a visible /api/results fact. ----
        %actor-block-identity
      =/  pre  (actor-pref-pre our.bowl now.bowl app.aa actor.aa app-grants actor-registry)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre ~ ~ ~)
      =/  cand-registry  registry.p.pre
      =/  vr  (api-validate-ref our.bowl desk.p.pre aid.p.pre ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.p.pre aid.p.pre]
      =/  cur=actor-preferences:noltbook  (fall (~(get by actor-preferences) dkey) [~ ~])
      ::  duplicate add is idempotent; muted is left untouched (independent set).
      =.  actor-registry  cand-registry
      =.  actor-preferences
        (~(put by actor-preferences) dkey cur(blocked (~(put in blocked.cur) p.vr)))
      :_  this
      (api-result-card request-id.aa %.y %actor-identity-blocked 'actor identity blocked' ~ ~ ~)
    ::
        %actor-unblock-identity
      =/  pre  (actor-pref-pre our.bowl now.bowl app.aa actor.aa app-grants actor-registry)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre ~ ~ ~)
      =/  cand-registry  registry.p.pre
      =/  vr  (api-validate-ref our.bowl desk.p.pre aid.p.pre ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.p.pre aid.p.pre]
      =/  cur=actor-preferences:noltbook  (fall (~(get by actor-preferences) dkey) [~ ~])
      ?.  (~(has in blocked.cur) p.vr)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'identity not blocked' ~ ~ ~)
      ::  remove ONLY from blocked; muted is independent and stays.
      =/  np=actor-preferences:noltbook  cur(blocked (~(del in blocked.cur) p.vr))
      =.  actor-registry  cand-registry
      =.  actor-preferences
        ?:  &(=(~ blocked.np) =(~ muted.np))
          (~(del by actor-preferences) dkey)
        (~(put by actor-preferences) dkey np)
      :_  this
      (api-result-card request-id.aa %.y %actor-identity-unblocked 'actor identity unblocked' ~ ~ ~)
    ::
        %actor-mute-identity
      =/  pre  (actor-pref-pre our.bowl now.bowl app.aa actor.aa app-grants actor-registry)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre ~ ~ ~)
      =/  cand-registry  registry.p.pre
      =/  vr  (api-validate-ref our.bowl desk.p.pre aid.p.pre ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.p.pre aid.p.pre]
      =/  cur=actor-preferences:noltbook  (fall (~(get by actor-preferences) dkey) [~ ~])
      ::  duplicate add is idempotent; blocked is left untouched (independent set).
      =.  actor-registry  cand-registry
      =.  actor-preferences
        (~(put by actor-preferences) dkey cur(muted (~(put in muted.cur) p.vr)))
      :_  this
      (api-result-card request-id.aa %.y %actor-identity-muted 'actor identity muted' ~ ~ ~)
    ::
        %actor-unmute-identity
      =/  pre  (actor-pref-pre our.bowl now.bowl app.aa actor.aa app-grants actor-registry)
      ?:  ?=(%.n -.pre)
        :_  this
        (api-result-card request-id.aa %.n code.p.pre msg.p.pre ~ ~ ~)
      =/  cand-registry  registry.p.pre
      =/  vr  (api-validate-ref our.bowl desk.p.pre aid.p.pre ref.aa)
      ?:  ?=(%.n -.vr)
        :_  this
        (api-result-card request-id.aa %.n code.p.vr msg.p.vr ~ ~ ~)
      =/  dkey  [desk.p.pre aid.p.pre]
      =/  cur=actor-preferences:noltbook  (fall (~(get by actor-preferences) dkey) [~ ~])
      ?.  (~(has in muted.cur) p.vr)
        :_  this
        (api-result-card request-id.aa %.n %missing-target 'identity not muted' ~ ~ ~)
      ::  remove ONLY from muted; blocked is independent and stays.
      =/  np=actor-preferences:noltbook  cur(muted (~(del in muted.cur) p.vr))
      =.  actor-registry  cand-registry
      =.  actor-preferences
        ?:  &(=(~ blocked.np) =(~ muted.np))
          (~(del by actor-preferences) dkey)
        (~(put by actor-preferences) dkey np)
      :_  this
      (api-result-card request-id.aa %.y %actor-identity-unmuted 'actor identity unmuted' ~ ~ ~)
    ::
    ::  ---- Phase 10: note configuration. Applies only the supplied fields via
    ::  the existing rename-note / set-note-meta / set-headline handlers, emitting
    ::  one result fact for the whole request. ----
        %set-note-config
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ?:  ?&(?=(^ name.aa) =('' u.name.aa))
        :_  this
        (api-result-card request-id.aa %.n %invalid-name 'name cannot be empty' `note-id.aa ~ ~)
      =/  vis-ok=?
        ?~  visibility.aa  %.y
        ?|  =('public' u.visibility.aa)
            =('private' u.visibility.aa)
            =('secret' u.visibility.aa)
        ==
      ?.  vis-ok
        :_  this
        (api-result-card request-id.aa %.n %invalid-visibility 'visibility must be public/private/secret' `note-id.aa ~ ~)
      ::  same gate as set-note-meta: creator, or a DM member, and not write-blocked.
      =/  allowed=?
        ?&  !(is-write-blocked note-id.aa host-status notes our.bowl)
            ?|  =(our.bowl creator.nt)
                ?&(=(%dm type.nt) (~(has in users.nt) our.bowl))
            ==
        ==
      ?.  allowed
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot change this note settings' `note-id.aa ~ ~)
      ::  name -> rename-note
      =^  c1  this
        ?~  name.aa  `this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%rename-note note-id.aa u.name.aa]))
      ::  visibility/writable/icon -> set-note-meta (bundle: keep current for any
      ::  field not supplied; iconUrl='' clears the icon).
      =^  c2  this
        ?:  ?&(?=(~ visibility.aa) ?=(~ writable.aa) ?=(~ icon-url.aa))  `this
        =/  vis=note-visibility:noltbook
          ?~  visibility.aa  visibility.nt
          ?:  =('public' u.visibility.aa)   %public
          ?:  =('private' u.visibility.aa)  %private
          %secret
        =/  wr=?  ?~(writable.aa writable.nt u.writable.aa)
        =/  ic=(unit @t)
          ?~  icon-url.aa  icon-url.nt
          ?:(=('' u.icon-url.aa) ~ icon-url.aa)
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%set-note-meta note-id.aa vis ic wr]))
      ::  headline -> set-headline (creator-only handler; '' clears it)
      =^  c3  this
        ?~  headline.aa  `this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%set-headline note-id.aa u.headline.aa]))
      :_  this
      %+  weld  (weld c1 (weld c2 c3))
      (api-result-card request-id.aa %.y %configured 'note configured' `note-id.aa ~ ~)
    ::
        %set-note-app
      ::  durable app-note metadata. LOCAL-ONLY this phase (no broadcast): API
      ::  reads are the priority; cross-ship propagation can follow the
      ::  %note-meta-updated pattern later. App metadata is HOST/CREATOR-OWNED:
      ::  since it is local-only with no propagation, a non-host admin setting it
      ::  would diverge silently across ships, so admins are rejected here (this
      ::  does NOT touch any other admin power). Gate: note exists, type is
      ::  notebook/group/gossip, not write-blocked, and our.bowl == note.creator.
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  u.nt-u
      ?.  ?|(=(%notebook type.nt) =(%group type.nt) =(%gossip type.nt))
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'app metadata not supported for this note type' `note-id.aa ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      ?.  =(our.bowl creator.nt)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'only the note creator can set app metadata' `note-id.aa ~ ~)
      ::  malformed app argument (absent / non-null non-object) is rejected — it
      ::  never silently clears. Only an explicit JSON null clears.
      ?:  ?=([%invalid *] app.aa)
        :_  this
        (api-result-card request-id.aa %.n %invalid-app 'app must be null or an object' `note-id.aa ~ ~)
      ::  %clear: drop the association.
      ?:  ?=([%clear *] app.aa)
        :_  this(note-apps (~(del by note-apps) note-id.aa))
        (api-result-card request-id.aa %.y %app-cleared 'app metadata cleared' `note-id.aa ~ ~)
      =/  am=api-app-meta:noltbook  am.app.aa
      ::  desk required + must be a valid term.
      =/  dsym=(unit @tas)  (rush desk.am sym)
      ?~  dsym
        :_  this
        (api-result-card request-id.aa %.n %invalid-desk 'desk is not a valid term' `note-id.aa ~ ~)
      ::  optional publisher: if present, must parse as @p.
      ?:  ?&(?=(^ publisher.am) ?=(~ (slaw %p u.publisher.am)))
        :_  this
        (api-result-card request-id.aa %.n %invalid-publisher 'publisher is not a valid @p' `note-id.aa ~ ~)
      ::  optional template: if present, must be a valid term.
      ?:  ?&(?=(^ template.am) ?=(~ (rush u.template.am sym)))
        :_  this
        (api-result-card request-id.aa %.n %invalid-template 'template is not a valid term' `note-id.aa ~ ~)
      =/  pub=(unit @p)  ?~(publisher.am ~ (slaw %p u.publisher.am))
      =/  tmpl=(unit @tas)  ?~(template.am ~ (rush u.template.am sym))
      ::  optional tag, capped at 128 chars.
      =/  tag=(unit @t)  ?~(tag.am ~ `(crip (scag 128 (trip u.tag.am))))
      =/  meta=app-note-meta:noltbook
        [u.dsym title.am pub tag tmpl our.bowl now.bowl]
      :_  this(note-apps (~(put by note-apps) note-id.aa meta))
      (api-result-card request-id.aa %.y %app-set 'app metadata set' `note-id.aa ~ ~)
    ::
        %set-note-pin
      ::  precheck against local state for an honest code (validates target + kind),
      ::  then re-enter the internal action to apply + broadcast. Creator-only;
      ::  echoes the target eid. Setting replaces the existing pin.
      =/  tgt=(unit @uv)  (slaw %uv target.aa)
      ?~  tgt
        :_  this
        (api-result-card request-id.aa %.n %invalid-target 'target eid could not be parsed' `note-id.aa ~ ~)
      =/  knd=(unit ?(%message %artifact))
        ?:  =('message' kind.aa)   `%message
        ?:  =('artifact' kind.aa)  `%artifact
        ~
      ?~  knd
        :_  this
        (api-result-card request-id.aa %.n %invalid-target 'kind must be message or artifact' `note-id.aa ~ `u.tgt)
      =/  res  (apply-set-pin our.bowl note-id.aa u.tgt u.knd notes messages artifacts host-status now.bowl)
      ?:  ?=(%.n -.res)
        :_  this
        (api-result-card request-id.aa %.n p.res (api-pin-msg p.res) `note-id.aa ~ `u.tgt)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%set-note-pin note-id.aa u.tgt u.knd]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pin-set 'pin set' `note-id.aa ~ `u.tgt)
    ::
        %clear-note-pin
      =/  res  (apply-clear-pin our.bowl note-id.aa notes host-status)
      ?:  ?=(%.n -.res)
        :_  this
        (api-result-card request-id.aa %.n p.res (api-pin-msg p.res) `note-id.aa ~ ~)
      ::  echo the cleared pin's target eid when there was one (null otherwise).
      =/  cleared-eid=(unit @uv)
        =/  pn  (~(get by note-pins) note-id.aa)
        ?~(pn ~ `target.u.pn)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%clear-note-pin note-id.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %pin-cleared 'pin cleared' `note-id.aa ~ cleared-eid)
    ::
        %set-note-active
      ::  developer/API-only "active" status. REQUIRES top-level `app` attribution;
      ::  desk/title/publisher are server-stamped from it, set-by/updated-at/expires-at
      ::  from the server. Gate: note exists, notebook/group/gossip, not write-blocked,
      ::  creator-only. Handled directly (no internal action); broadcasts + reads filter
      ::  on expires-at. label default "live" (cap 32); ttl seconds default 120, cap 600.
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %missing-app 'set-note-active requires top-level app attribution' `note-id.aa ~ ~)
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  u.nt-u
      ?.  (pin-note-ok nt)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'note type does not support active status' `note-id.aa ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      ?.  =(our.bowl creator.nt)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'only the note creator can set active status' `note-id.aa ~ ~)
      ::  label: 32-char cap; empty (absent or blank after truncation) -> "live".
      =/  lbl=@t
        =/  raw=@t  ?~(label.aa '' (crip (scag 32 (trip u.label.aa))))
        ?:(=('' raw) 'live' raw)
      ::  count: optional, clamped to 999 so the sidebar badge can't overflow.
      =/  cnt=(unit @ud)  ?~(count.aa ~ `(min 999 u.count.aa))
      =/  ttl-s=@ud  ?~(ttl.aa 120 (min 600 u.ttl.aa))
      =/  exp=@da  (add now.bowl (mul ttl-s ~s1))
      =/  active=note-active:noltbook
        [desk.u.app.aa title.u.app.aa publisher.u.app.aa lbl cnt our.bowl now.bowl exp]
      :_  this(note-active (~(put by note-active) note-id.aa active))
      ::  1B.2: active-cards emit a global /notes fact (+ transport); drop the global one
      ::  when the host human is not a logical member. The /api/results result is unaffected.
      %+  weld
        (human-note-cards note-id.aa our.bowl note-members note-actor-owners notes (active-cards note-id.aa `active))
      (api-result-card request-id.aa %.y %active-set 'active set' `note-id.aa ~ ~)
    ::
        %clear-note-active
      ::  clears the active status; no app attribution required.
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      =/  nt=note:noltbook  u.nt-u
      ?.  (pin-note-ok nt)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'note type does not support active status' `note-id.aa ~ ~)
      ?:  (is-write-blocked note-id.aa host-status notes our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'write blocked' `note-id.aa ~ ~)
      ?.  =(our.bowl creator.nt)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'only the note creator can clear active status' `note-id.aa ~ ~)
      ::  idempotent: only broadcast a clear if there was an entry.
      =/  had=?  (~(has by note-active) note-id.aa)
      =/  clear-cards=(list card)
        ?.  had  ~
        (human-note-cards note-id.aa our.bowl note-members note-actor-owners notes (active-cards note-id.aa ~))
      :_  this(note-active (~(del by note-active) note-id.aa))
      %+  weld  clear-cards
      (api-result-card request-id.aa %.y %active-cleared 'active cleared' `note-id.aa ~ ~)
    ::
        %set-app-notification
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %missing-app 'set-app-notification requires top-level app attribution' ~ ~ ~)
      =/  notif-id=@t  (crip (scag 96 (trip id.aa)))
      ?:  =(0 (met 3 notif-id))
        :_  this
        (api-result-card request-id.aa %.n %invalid-id 'notification id cannot be empty' ~ ~ ~)
      =/  notif-title=@t  (crip (scag 120 (trip title.aa)))
      ?:  =(0 (met 3 notif-title))
        :_  this
        (api-result-card request-id.aa %.n %invalid-title 'notification title cannot be empty' ~ ~ ~)
      =/  lvl-u=(unit app-notification-level:noltbook)
        ?~  level.aa  `%info
        =/  lv=(unit @tas)  (rush u.level.aa sym)
        ?~  lv  ~
        ?.  ?=(?(%info %success %warning %error) u.lv)  ~
        `u.lv
      ?~  lvl-u
        :_  this
        (api-result-card request-id.aa %.n %invalid-level 'level must be info/success/warning/error' ~ ~ ~)
      =/  ttl-sec=(unit @ud)
        ?~  ttl.aa  ~
        `?:(=(0 u.ttl.aa) 1 (min 604.800 u.ttl.aa))
      =/  exp=(unit @da)
        ?~  ttl-sec  ~
        `(add now.bowl (mul u.ttl-sec ~s1))
      =/  bdy=(unit @t)  ?~(body.aa ~ `(crip (scag 600 (trip u.body.aa))))
      =/  lnk=(unit @t)  ?~(href.aa ~ `(crip (scag 2.048 (trip u.href.aa))))
      =/  clean=(map [@tas @t] app-notification:noltbook)
        (app-notifications-live app-notifications now.bowl)
      =/  key=[@tas @t]  [desk.u.app.aa notif-id]
      =/  old=(unit app-notification:noltbook)  (~(get by clean) key)
      =/  created=@da  ?~(old now.bowl created-at.u.old)
      =/  notif=app-notification:noltbook
        :*  desk.u.app.aa  title.u.app.aa  publisher.u.app.aa
            notif-id  notif-title  bdy  lnk
            note-id.aa  artifact-id.aa  u.lvl-u
            created  now.bowl  exp
        ==
      =/  new-notifs=(map [@tas @t] app-notification:noltbook)
        (~(put by clean) key notif)
      :_  this(app-notifications new-notifs)
      %+  weld
        (app-notifications-cards ~[/notes] new-notifs now.bowl)
      %+  weld
        (app-notifications-cards ~[/api/results] new-notifs now.bowl)
      (api-result-card request-id.aa %.y %app-notification-set 'app notification set' ~ ~ ~)
    ::
        %clear-app-notification
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %missing-app 'clear-app-notification requires top-level app attribution' ~ ~ ~)
      =/  notif-id=@t  (crip (scag 96 (trip id.aa)))
      ?:  =(0 (met 3 notif-id))
        :_  this
        (api-result-card request-id.aa %.n %invalid-id 'notification id cannot be empty' ~ ~ ~)
      =/  clean=(map [@tas @t] app-notification:noltbook)
        (app-notifications-live app-notifications now.bowl)
      =/  key=[@tas @t]  [desk.u.app.aa notif-id]
      =/  new-notifs=(map [@tas @t] app-notification:noltbook)
        (~(del by clean) key)
      :_  this(app-notifications new-notifs)
      %+  weld
        (app-notifications-cards ~[/notes] new-notifs now.bowl)
      %+  weld
        (app-notifications-cards ~[/api/results] new-notifs now.bowl)
      (api-result-card request-id.aa %.y %app-notification-cleared 'app notification cleared' ~ ~ ~)
    ==
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
          ~[(gf-notes meta-upd)]
        :~  (gf-notes meta-upd)
            (gf-paths ~[/notes/[nid]] meta-upd)
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
          (rpoke /art-env-out/(scot %p p)/[aid] p `remote:noltbook`[%remote-artifact-envelope-ref nid env 0])
        =/  envs-cur=(map @ta artifact-envelope:noltbook)
          (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
        ::  recency + sidebar signal + preview persistence: gossip notes
        ::  participate; cover is pinned (none of these). put-activity is a
        ::  no-op for cover, so persisting it unconditionally is safe.
        =/  prev=@t  (art-env-preview env)
        ::  own upload → advance both activity and read so it isn't self-unread.
        =/  act-cards=(list card)
          ?:  is-gossipy-note  ~[(activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
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
              note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
              note-read  (put-read note-read nid now.bowl)
            ==
        %+  weld  http-cards
        %+  weld
          :~  clay-card
              (gf-paths ~[pax] upd)
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
        :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        %+  weld  http-cards
        %+  weld
          :~  clay-card
              (gf-paths ~[pax] upd)
              (activity-fact nid now.bowl)
              (unread-activity-fact nid now.bowl)
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
        :_  this(notes (~(put by notes) nid upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        %+  weld  http-cards
        :~  clay-card
            (gf-paths ~[pax] upd)
            (activity-fact nid now.bowl)
            (unread-activity-fact nid now.bowl)
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
      %noltbook-action
    =/  act  !<(action:noltbook vase)
    ?-  -.act
    ::  ---- Phase B: REAL ship-user actor mute/block (typed actor-ref). mute/block are
    ::  independent; effective suppression = muted OR blocked. Each emits the authoritative
    ::  full prefs snapshot on /notes so the frontend rerenders buttons + hidden content.
    ::  Pure user preference — no grant/caps/status, no host pal/membership mutation. ----
        %mute-actor
      =.  user-muted-actors  (~(put in user-muted-actors) ref.act)
      :_  this
      ~[(user-actor-prefs-fact ~[/notes] user-muted-actors user-blocked-actors)]
    ::
        %unmute-actor
      =.  user-muted-actors  (~(del in user-muted-actors) ref.act)
      :_  this
      ~[(user-actor-prefs-fact ~[/notes] user-muted-actors user-blocked-actors)]
    ::
        %block-actor
      =.  user-blocked-actors  (~(put in user-blocked-actors) ref.act)
      :_  this
      ~[(user-actor-prefs-fact ~[/notes] user-muted-actors user-blocked-actors)]
    ::
        %unblock-actor
      =.  user-blocked-actors  (~(del in user-blocked-actors) ref.act)
      :_  this
      ~[(user-actor-prefs-fact ~[/notes] user-muted-actors user-blocked-actors)]
    ::
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
      =/  nua=(map @ta @da)
        ?:(stamp (put-unread-activity note-unread-activity id.act now.bowl) note-unread-activity)
      =/  nr=(map @ta @da)
        ?:(stamp (put-read note-read id.act now.bowl) note-read)
      =/  act-cards=(list card)
        ?:(stamp ~[(activity-fact id.act now.bowl) (unread-activity-fact id.act now.bowl) (note-read-fact id.act now.bowl)] ~)
      =/  base=_this  this(current-note id.act, note-activity na, note-unread-activity nua, note-read nr)
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
        (rpoke /note-refresh/[id.act] creator.u.n `remote:noltbook`[%remote-note-state-request id.act])
      :_  base(host-checks (~(put by host-checks) id.act deadline))
      (weld act-cards ~[watch-card wait-card refresh-card])
    ::
    ::  A1.3b: internal host + emergency actor management (the main host UI pokes these
    ::  directly; the API veneers in poke-api reuse the same shared helpers). No result
    ::  card here — the mutation cards are returned. Local target host only (A3 remote).
        %manage-note-actor
      ?.  =(our.bowl host.target.act)  `this
      =/  pre  (host-actor-pre our.bowl note-id.act note-actor-owners notes host-status note-admins actor-dm-notes)
      ?:  ?=(%.n -.pre)  `this
      =/  res  (actor-manage-apply our.bowl note-id.act op.act target.act p.pre actor-note-roster actor-join-requests note-actor-muted actor-note-read actor-notifications notes messages actor-registry note-members note-actor-owners actor-by-eid)
      ?.  ok.res  `this
      :_  this(actor-note-roster roster.res, actor-join-requests requests.res, note-actor-muted muted.res, actor-note-read read.res, actor-notifications notifs.res, notes notes.res)
      cards.res
    ::
        %emergency-manage-note-actor
      ?.  =(our.bowl host.target.act)  `this
      =/  pre  (emergency-actor-pre our.bowl note-id.act note-actor-owners notes host-status actor-dm-notes)
      ?:  ?=(%.n -.pre)  `this
      ?:  &(=(%remove op.act) =(target.act owner.p.pre))  `this
      =/  res  (actor-manage-apply our.bowl note-id.act op.act target.act nt.p.pre actor-note-roster actor-join-requests note-actor-muted actor-note-read actor-notifications notes messages actor-registry note-members note-actor-owners actor-by-eid)
      ?.  ok.res  `this
      :_  this(actor-note-roster roster.res, actor-join-requests requests.res, note-actor-muted muted.res, actor-note-read read.res, actor-notifications notifs.res, notes notes.res)
      cards.res
    ::
        %rename-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  gossip is an immutable snapshot — name is frozen at creation, no rename.
      ?:  =(%gossip type.u.old)  `this
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
        ~[(gf-notes upd)]
      ::  non-DM: only creator can rename, broadcast to subscribers
      ?.  =(our.bowl creator.u.old)  `this
      =/  upd=update:noltbook  [%note-renamed id.act name.act]
      :_  this(notes (~(put by notes) id.act u.old(name name.act)))
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[id.act]] upd)
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
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[id.act]] upd)
      ==
    ::
        %delete-note
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  protect system notes from deletion
      ?:  |(=(id.act %cover) =(id.act %ars-rumors))  `this
      ::  gossip is hostless: nobody deletes it (and a delete must never broadcast
      ::  %remote-note-deleted to holders). The creator, like anyone, can only leave.
      ?:  =(%gossip type.u.old)  `this
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
      ::  Phase D: drop actor ownership rows for every deleted note in the subtree.
      =/  new-note-actor-owners=(map @ta actor-owner:noltbook)
        =/  acc=(map @ta actor-owner:noltbook)  note-actor-owners
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      ::  Phase G2: drop actor participation rows for every deleted note in the subtree.
      =/  new-actor-note-roster=(map @ta (set actor-ref:noltbook))
        =/  acc=(map @ta (set actor-ref:noltbook))  actor-note-roster
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      ::  Phase G6A: prune actor read cursors for every deleted id in the subtree
      ::  (across every actor's nested map).
      =/  new-actor-note-read=(map [@tas @t] (map @ta @da))
        (actor-read-prune actor-note-read subtree-ids)
      ::  Phase G6B: prune actor notifications for every deleted id in the subtree, and
      ::  emit authoritative full=%.y updates to affected actors (resolved with the
      ::  post-deletion messages map; actor-by-eid is unchanged on this path).
      =/  new-actor-notifications=(map [@tas @t] (list actor-notification:noltbook))
        (actor-notif-prune-notes actor-notifications subtree-ids)
      =/  notif-diff-cards=(list card)
        (actor-notif-diff-cards actor-notifications new-actor-notifications new-messages actor-by-eid)
      ::  Phase G5A: prune actor-DM markers for every deleted id in the subtree.
      =/  new-actor-dm-notes=(map @ta actor-dm-meta:noltbook)
        =/  acc=(map @ta actor-dm-meta:noltbook)  actor-dm-notes
        =/  todo=(list @ta)  subtree-ids
        |-
        ?~  todo  acc
        $(todo t.todo, acc (~(del by acc) i.todo))
      ::  emit %actor-dm-updated nid ~ for any marker that was actually removed so the
      ::  FE drops state.actorDms for it.
      =/  actor-dm-clear-cards=(list card)
        %+  murn  subtree-ids
        |=  nid=@ta
        ^-  (unit card)
        ?.  (~(has by actor-dm-notes) nid)  ~
        `(gf-notes `update:noltbook`[%actor-dm-updated nid ~])
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
        `(rpoke /note-del/(scot %p p)/[id.act] p `remote:noltbook`[%remote-note-deleted id.act name.u.old])
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
            note-actor-owners  new-note-actor-owners
            actor-note-roster  new-actor-note-roster
            note-members  (prune-note-members subtree-ids note-members)
            actor-join-requests  (prune-participation subtree-ids actor-join-requests)
            note-actor-muted  (prune-participation subtree-ids note-actor-muted)
            actor-note-read  new-actor-note-read
            actor-notifications  new-actor-notifications
            actor-dm-notes  new-actor-dm-notes
          ==
      ^-  (list card)
      :(weld delete-updates delete-remote-cards actor-dm-clear-cards notif-diff-cards)
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
        :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), note-members (~(put by note-members) nid self-set), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
        ^-  (list card:agent:gall)
        ~[(gf-notes upd) (activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
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
        `(rpoke /child-out/(scot %p p)/[nid] p `remote:noltbook`[%remote-child-note pid new-note])
      :_  this(notes n2, messages (~(put by messages) nid *(list message:noltbook)), note-members (set-logical-members nid (logical-members-of pid note-members note-actor-owners notes) note-members), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
      =/  head-cards=(list card:agent:gall)
        ~[(gf-notes upd) (activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
      (weld head-cards broadcast)
    ::
        %create-gossip-note
      =/  self-set=(set @p)  (sy ~[our.bowl])
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  hl=(unit @t)  ?:(=(%~ headline.act) ~ `headline.act)
      ::  gossip is always-public + hostless; visibility is a dead field (set %public so it
      ::  never reads as private). creator is attribution only, not an authority.
      =/  new-note=note:noltbook
        :*  nid  name.act  %gossip  our.bowl  self-set  ~  ~  ~  ~  %public  icon-url.act  &  ~  hl
        ==
      =/  upd=update:noltbook  [%note-created new-note]
      =/  new-headlines=(map @ta @t)
        ?~  hl  headlines
        (~(put by headlines) nid u.hl)
      ::  gossip note created locally only — distribute via share/invite. 1B.3: seed the
      ::  creator as the explicit logical member.
      :_  this(notes (~(put by notes) nid new-note), messages (~(put by messages) nid *(list message:noltbook)), headlines new-headlines, note-members (~(put by note-members) nid self-set), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
      ^-  (list card:agent:gall)
      ~[(gf-notes upd) (activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
    ::
        %request-gossip-note
      ::  link-acquire: ask the sharer (`from`) for a gossip note by id; they reply with the
      ::  full %remote-gossip-invite packet, which our %remote-gossip-invite receiver installs.
      :_  this
      ~[(rpoke /gossip-req/(scot %p from.act)/[note-id.act] from.act `remote:noltbook`[%remote-gossip-request note-id.act])]
    ::
        %send-message
      =/  sys-note=?  ?|(=(note-id.act %cover) =(note-id.act %ars-rumors))
      =/  sys  (ensure-system-notes notes messages our.bowl)
      =?  notes  sys-note  notes.sys
      =?  messages  sys-note  messages.sys
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      ::  1B.1: an ordinary (non-actor) post by the host human into ANY regular note it
      ::  is not a logical member of is a no-op (system notes exempt via human-sees-note).
      ::  Actor-attributed posts (actor.act=^) are exempt — gated by actor-note-access
      ::  upstream. The API layer returns %not-participant honestly (see %post-message).
      ?:  ?&  ?=(~ actor.act)
              !(human-sees-note note-id.act our.bowl note-members note-actor-owners notes)
          ==
        `this
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
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act) em via.act]
        ::  send our cover envelope to our FOLLOWERS (pal-incoming) — they display it.
        =/  gossip=(list card)
          %+  turn  ~(tap in pal-incoming)
          |=  p=@p
          ^-  card
          (rpoke /ars-out/(scot %p p) p `remote:noltbook`[%remote-ars-ref env 0])
        =/  env-upd=update:noltbook  [%gossip-envelope %cover env 0]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        ::  Phase 11C: attribute our own cover message locally; the envelope above
        ::  carries via to peers/members for their own via-by-eid.
        =.  via-by-eid  (api-via-put via-by-eid via.act msg)
        :_  this(notes (~(put by notes) %cover upd-note), messages (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y)), gossip-hops (~(put by gossip-hops) id.msg 0), seq-counters (~(put by seq-counters) %cover nxt-seq))
        :(weld ~[(gf-notes upd)] ~[(gf-paths ~[/notes/cover] env-upd)] gossip)
      ::  user-created gossip notes: same envelope model as cover
      ?:  =(%gossip type.u.exists)
        =/  nid=@ta  note-id.act
        =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
        =/  upd=update:noltbook  [%gossip-message msg 0]
        =/  env=envelope:noltbook  [our.bowl id.msg now.bowl reply-to.act (sham text.act) em via.act]
        ::  mesh model: send the envelope (reference, content-hash) to our FOLLOWERS
        ::  (pal-incoming) — like cover. Followers who hold the note display + re-relay it.
        =/  targets=(list @p)
          %+  skim  ~(tap in pal-incoming)
          |=(p=@p !=(p our.bowl))
        =/  gossip=(list card)
          %+  turn  targets
          |=  p=@p
          ^-  card
          (rpoke /gossip-out/(scot %p p)/[nid] p `remote:noltbook`[%remote-gossip-ref nid env 0])
        =/  env-upd=update:noltbook  [%gossip-envelope nid env 0]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        =/  cenv=(map @da envelope:noltbook)
          (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
        =.  via-by-eid  (api-via-put via-by-eid via.act msg)
        :_  %=  this
              notes  (~(put by notes) nid upd-note)
              messages  (~(put by messages) nid (cap-msgs (snoc cur msg) %.y))
              gossip-hops  (~(put by gossip-hops) id.msg 0)
              seq-counters  (~(put by seq-counters) nid nxt-seq)
              note-activity  (put-activity note-activity nid now.bowl)
              note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
              note-read  (put-read note-read nid now.bowl)
            ==
        =/  head-cards=(list card:agent:gall)
          ~[(gf-notes upd) (activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
        :(weld head-cards ~[(gf-paths ~[/notes/[nid]] env-upd)] gossip)
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
            (rpoke /rum-out/(scot %p p) p `remote:noltbook`[%remote-rumor anon-msg 0])
          ::  proxy through one random peer
          =/  proxy=@p  (snag (~(rad og +(eny.bowl)) (lent targets)) targets)
          ~[(rpoke /rum-out/(scot %p proxy) proxy `remote:noltbook`[%remote-rumor anon-msg 0])]
        =/  upd-note=note:noltbook  u.exists(last-author ~, last-preview `text.act)
        :_  this(notes (~(put by notes) %ars-rumors upd-note), messages (~(put by messages) %ars-rumors (snoc cur anon-msg)), gossip-hops (~(put by gossip-hops) `@da`chash 0))
        [(gf-paths ~[/notes/ars-rumors] upd) gossip]
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
        =/  upd=update:noltbook  [%new-message msg ~ via.act actor.act]
        =/  pax=path  ~[%notes note-id.act]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        ::  atomic DM delivery: ONE poke carrying both note metadata and
        ::  message, so receiver can recreate the DM if they left without
        ::  relying on poke ordering or subscriptions.
        =/  dm-rem=remote:noltbook  [%remote-dm-message u.exists msg via.act actor.act]
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[(rpoke /dm-msg/[note-id.act] other dm-rem)]
        =/  notes-cards=(list card:agent:gall)
          ~[(gf-notes upd) (activity-fact note-id.act now.bowl) (unread-activity-fact note-id.act now.bowl) (note-read-fact note-id.act now.bowl)]
        ::  Phase 11B: attribute our own stored DM copy (via.ship = us, the sender).
        =.  via-by-eid  (api-via-put via-by-eid via.act msg)
        ::  Phase ACTOR-1: store the actor row for our local DM copy (direct path).
        =.  actor-by-eid  (api-actor-put actor-by-eid actor.act msg)
        :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters), note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity (put-unread-activity note-unread-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
        :(weld ~[(gf-paths ~[pax] upd)] notes-cards peer-cards)
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        =/  fwd-card=card
          ::  carry the explicit NOTE SEND marker to the host (regular/group)
          (rpoke /msg-fwd/[note-id.act] creator.u.exists `remote:noltbook`[%remote-message note-id.act msg directed-kind.act via.act actor.act])
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
      =/  upd=update:noltbook  [%new-message msg directed-kind.act via.act actor.act]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      =/  new-seq-counters=(map @ta @ud)
        ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters)
      ::  Phase 11B: attribute our locally-stored message; the %new-message fact
      ::  above carries via to subscribed members so they record it too.
      =.  via-by-eid  (api-via-put via-by-eid via.act msg)
      ::  Phase ACTOR-1: store the actor row for our local copy (direct path); the
      ::  %new-message fact above carries actor to subscribed members too.
      =.  actor-by-eid  (api-actor-put actor-by-eid actor.act msg)
      ::  Phase G6B: if this message replies to a message attributed to a LOCAL actor,
      ::  record a directed reply notification for that actor (own host only). The
      ::  host's own post can still notify a different local actor (distinct identity).
      =^  notif-cards  actor-notifications
        (actor-notif-add actor-notifications our.bowl now.bowl note-id.act msg actor.act actor-by-eid cur actor-registry note-actor-owners actor-note-roster actor-dm-notes notes actor-preferences)
      ::  Phase A: a locally-posted ACTOR message is a DISTINCT behavioral sender for our
      ::  host. host-self is true only for a genuine host post (no actor) — that case
      ::  keeps the prior byte-for-byte behavior (advance + emit host note-read). An actor
      ::  post advances note-activity only (host stays unread), and runs host mention /
      ::  reply attention. An ordinary host post creates none of that.
      =/  is-host-self=?  (host-self our.bowl actor.act our.bowl)
      ::  Phase B: if the REAL user muted/blocked this actor, suppress its host unread +
      ::  reply/@~host attention (message still stored/delivered; recency still advances;
      ::  the actor's own G6B notifications are untouched).
      =/  u-suppressed=?  (actor-user-suppressed actor.act user-muted-actors user-blocked-actors)
      =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
      ::  @~host mention by the actor (ordinary host self-mention stays ignored).
      =/  mentioned=?  &(?=(^ actor.act) !u-suppressed (has-our-mention text.act our.bowl))
      =/  active-mentioned=?
        ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) note-id.act) ~) id.msg msg-eid))
      =/  mention-cards=(list card)
        ?.  active-mentioned  ~
        (attn-mention-cards note-id.act id.msg msg-eid our.bowl)
      =/  new-mentions=(map @ta (list [id=@da eid=(unit @uv) author=@p]))
        ?.  active-mentioned  mentions
        =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) note-id.act) ~)
        (~(put by mentions) note-id.act (snoc cur-m [id.msg msg-eid our.bowl]))
      ::  reply attention: actor reply to a NORMAL host message may notify the host. A
      ::  parent that is itself actor-attributed stays G6B-only (host attention suppressed).
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a note-id.act)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) note-id.act) *(map @ta artifact-envelope:noltbook)))
      =/  rte=(unit @uv)  ?~(meta.msg ~ reply-to-eid.u.meta.msg)
      =/  par-owner=(unit @p)  (attn-parent-owner rte reply-to.act cur note-arts note-aenvs)
      =/  par-eid=(unit @uv)  (reply-parent-eid msg cur)
      =/  parent-is-actor=?  ?&(?=(^ par-eid) (~(has by actor-by-eid) u.par-eid))
      =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.act) %send %reply)
      =/  rtarget=attention-item:noltbook  [rkind %message msg-eid `id.msg ~ our.bowl id.msg]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        ?:  |(is-host-self parent-is-actor u-suppressed)  [attention ~]
        (add-reply-attn attention note-id.act our.bowl is-host-self par-owner rtarget)
      ::  host note-read advances ONLY for a genuine host self-post; an actor post leaves
      ::  the host unread (the open-note delayed mark-read still clears a viewed note).
      =.  note-read  ?:(is-host-self (put-read note-read note-id.act now.bowl) note-read)
      ::  unread-activity advances unless a muted/blocked actor (recency still advances).
      =/  new-unread-activity=(map @ta @da)
        ?:(u-suppressed note-unread-activity (put-unread-activity note-unread-activity note-id.act now.bowl))
      ::  Phase 1B: the /notes/[nid] transport fact always goes out (real members /
      ::  remote peers who opened the note). The LOCAL human global-/notes facts
      ::  (gf-notes + activity/unread/read) are suppressed when the host human is not a
      ::  logical member — i.e. an actor posting into a hidden actor-owned note never
      ::  surfaces to the host human's sidebar/recency.
      =/  human-vis=?
        (human-sees-note note-id.act our.bowl note-members note-actor-owners notes)
      =/  base-cards=(list card)
        ?.  human-vis  ~[(gf-paths ~[pax] upd)]
        :~  (gf-paths ~[pax] upd)
            (gf-notes upd)
            (activity-fact note-id.act now.bowl)
        ==
      =?  base-cards  &(human-vis !u-suppressed)  (snoc base-cards (unread-activity-fact note-id.act now.bowl))
      =?  base-cards  &(human-vis is-host-self)  (snoc base-cards (note-read-fact note-id.act now.bowl))
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters new-seq-counters, note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity new-unread-activity, note-read note-read, mentions new-mentions, attention na.ar)
      :(weld notif-cards mention-cards ac.ar base-cards)
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
          ~[(rpoke /dm-edit/[note-id.act] other `remote:noltbook`[%remote-edit-msg note-id.act msg-id.act eid.act text.act])]
        :_  this(messages (~(put by messages) note-id.act new-msgs))
        :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] peer-cards)
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[(rpoke /msg-edit/[note-id.act] creator.u.exists `remote:noltbook`[%remote-edit-msg note-id.act msg-id.act eid.act text.act])]
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
      ::  1B.1: keep the /notes/[nid] transport fact; emit the local-human /notes fact
      ::  only when the host human is a logical member (actor edits to a hidden note
      ::  update durable state + transport peers but never surface to the host browser).
      ?.  (human-sees-note note-id.act our.bowl note-members note-actor-owners notes)
        ~[(gf-paths ~[pax] upd)]
      :~  (gf-paths ~[pax] upd)
          (gf-notes upd)
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
          ~[(rpoke /dm-del/[note-id.act] other `remote:noltbook`[%remote-delete-msg note-id.act msg-id.act eid.act])]
        :_  this(messages (~(put by messages) note-id.act kept))
        :(weld ~[(gf-paths ~[pax] del-upd)] ~[(gf-notes del-upd)] peer-cards)
      ::  non-creator forwards to creator
      ?.  =(our.bowl creator.u.exists)
        :_  this
        ~[(rpoke /msg-del/[note-id.act] creator.u.exists `remote:noltbook`[%remote-delete-msg note-id.act msg-id.act eid.act])]
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
      =/  raw-facts=(list card)
        ?~  sys-msg
          :~  (gf-paths ~[pax] del-upd)
              (gf-notes del-upd)
          ==
        :~  (gf-paths ~[pax] del-upd)
            (gf-notes del-upd)
            (gf-paths ~[pax] `update:noltbook`[%new-message u.sys-msg ~ ~ ~])
            (gf-notes `update:noltbook`[%new-message u.sys-msg ~ ~ ~])
        ==
      ::  1B.1: keep /notes/[nid] transport facts; drop the local-human /notes facts when
      ::  the host human is not a logical member (actor delete stays invisible to it).
      =/  facts=(list card)
        ?:  (human-sees-note note-id.act our.bowl note-members note-actor-owners notes)
          raw-facts
        (drop-local-notes-facts raw-facts)
      ::  clear the pin if it targeted this message (host-authoritative).
      =/  pin-hit=?
        ?~  del-eid  %.n
        =/  pn  (~(get by note-pins) note-id.act)
        ?~  pn  %.n
        &(=(%message kind.u.pn) =(u.del-eid target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)
        ?:(pin-hit (~(del by note-pins) note-id.act) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards note-id.act ~) ~)
      ::  Phase G6B: if the deleted message was itself a notifying reply, drop every
      ::  actor notification targeting its eid (no stale rows), and emit an authoritative
      ::  full=%.y update to each affected actor so live clients drop the row at once.
      =/  old-notifs  actor-notifications
      =?  actor-notifications  ?=(^ del-eid)
        (actor-notif-del-eid actor-notifications u.del-eid)
      =/  msgs-after  (~(put by messages) note-id.act new-msgs)
      =/  notif-cards=(list card)
        (actor-notif-diff-cards old-notifs actor-notifications msgs-after actor-by-eid)
      :_  this(messages msgs-after, note-pins new-pins)
      (weld notif-cards (weld facts pin-clear-cards))
    ::
        %set-note-meta
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  gossip is an immutable snapshot — visibility/icon/writable frozen at creation.
      ?:  =(%gossip type.u.old)  `this
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
        ~[(gf-notes upd)]
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
        :~  (gf-notes upd)
            (gf-paths ~[/notes/[id.act]] upd)
            (gf-notes mute-upd)
            (gf-paths ~[/notes/[id.act]] mute-upd)
        ==
      ::  Read Only -> Write: clear muted set broadly
      ?:  &(!writable.u.old writable.act =(%group type.effective-old))
        =.  new-muted  ~
        =.  mute-changed  %.y
        =/  mute-upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
        :_  this(notes (~(put by notes) id.act upd-note), note-muted (~(put by note-muted) id.act new-muted))
        %+  weld  type-updates
        ^-  (list card)
        :~  (gf-notes upd)
            (gf-paths ~[/notes/[id.act]] upd)
            (gf-notes mute-upd)
            (gf-paths ~[/notes/[id.act]] mute-upd)
        ==
      ::  no writable change or not %group — just update meta
      :_  this(notes (~(put by notes) id.act upd-note))
      %+  weld  type-updates
      ^-  (list card)
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[id.act]] upd)
      ==
    ::
        %invite-to-note
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  gossip: ANY holder may share (hostless, always-public — having the note = may share it;
      ::  acquirers aren't in note.users). group: public → any member, private/secret → admin.
      ::  creator always; all other types: host only.
      ?.  ?|  =(our.bowl creator.u.old)
              =(%gossip type.u.old)
              ?&  =(%group type.u.old)
                  ?:  =(%public visibility.u.old)
                    (~(has in users.u.old) our.bowl)
                  (~(has in (fall (~(get by note-admins) id.act) ~)) our.bowl)
              ==
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
        ~[(rpoke /mod-out/(scot %p host)/[id.act] host `remote:noltbook`[%remote-mod id.act %invite-member ship.act])]
      ::  compute new user set
      =/  new-users=(set @p)  (~(put in users.effective-old) ship.act)
      =/  new-removed=(set @p)  (~(del in removed.effective-old) ship.act)
      =/  new-note=note:noltbook  effective-old(users new-users, removed new-removed)
      ::  poke remote ship with invite (gossip notes use gossip-invite with headline)
      =/  poke-card=card
        ?:  =(%gossip type.effective-old)
          =/  hl=(unit @t)  (~(get by headlines) id.act)
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.effective-old creator.effective-old users.new-note hl icon-url.effective-old]
          (rpoke /invite/(scot %p ship.act)/[id.act] ship.act rem)
        =/  rem=remote:noltbook  [%remote-invite id.act name.effective-old type.effective-old our.bowl users.new-note visibility.effective-old writable.effective-old]
        (rpoke /invite/(scot %p ship.act)/[id.act] ship.act rem)
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
        ~[(gf-notes mute-upd) (gf-paths ~[/notes/[id.act]] mute-upd)]
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
        ~[(gf-paths ~[/notes/[id.act]] root-users-upd)]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act ro-muted), member-revs new-revs, note-members (add-member-to-ids ship.act [id.act share-descs] note-members note-actor-owners notes))
      :(weld type-updates [poke-card (gf-notes upd) ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes root-users-cards)
    ::
        %invite-to-note-batch
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  permission gate matches %invite-to-note (gossip: any holder; group: public→member, else admin)
      ?.  ?|  =(our.bowl creator.u.old)
              =(%gossip type.u.old)
              ?&  =(%group type.u.old)
                  ?:  =(%public visibility.u.old)
                    (~(has in users.u.old) our.bowl)
                  (~(has in (fall (~(get by note-admins) id.act) ~)) our.bowl)
              ==
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
          (rpoke /mod-out/(scot %p host)/[id.act]/(scot %p p) host `remote:noltbook`[%remote-mod id.act %invite-member p])
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
          =/  rem=remote:noltbook  [%remote-gossip-invite id.act name.effective-old creator.effective-old users.new-note hl icon-url.effective-old]
          (rpoke /invite/(scot %p p)/[id.act] p rem)
        %+  turn  ~(tap in cleaned)
        |=  p=@p
        ^-  card
        =/  rem=remote:noltbook  [%remote-invite id.act name.effective-old type.effective-old our.bowl users.new-note visibility.effective-old writable.effective-old]
        (rpoke /invite/(scot %p p)/[id.act] p rem)
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
        ~[(gf-notes mute-upd) (gf-paths ~[/notes/[id.act]] mute-upd)]
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
        ~[(gf-paths ~[/notes/[id.act]] root-users-upd)]
      =/  upd=update:noltbook  [%note-created new-note]
      =/  local-cards=(list card)
        ~[(gf-notes upd)]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act new-muted), member-revs new-revs, note-members (add-ships-to-ids cleaned [id.act share-descs] note-members note-actor-owners notes))
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
      ::  non-host on a remote-hosted notebook/group: ship the artifact metadata to the host,
      ::  which validates + broadcasts %artifact-created back to all members (it reaches us via
      ::  our remote-note subscription). The host is the authority for shared history, so we do
      ::  NOT store/broadcast locally. This is the path member-posted %app (and inline %file)
      ::  artifacts take — mirroring the %file upload-artifact non-host path. DMs fall through to
      ::  the local path below (DM sync uses %remote-dm-artifact; the host path rejects DMs).
      ?:  ?&  !=(our.bowl creator.u.exists)
              ?|(?=(%notebook type.u.exists) ?=(%group type.u.exists))
          ==
        :_  this
        ~[(rpoke /art-create-out/[aid] creator.u.exists `remote:noltbook`[%remote-artifact-create new-art])]
      =/  upd=update:noltbook  [%artifact-created new-art]
      =/  pax=path  ~[%notes note-id.act]
      =/  prev=@t  (artifact-preview new-art)
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `prev)
      :_  this(notes (~(put by notes) note-id.act upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity (put-unread-activity note-unread-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
      ^-  (list card:agent:gall)
      ::  1B.2: keep /notes/[nid] transport; drop the global host-human facts when hidden.
      %:  human-note-cards  note-id.act  our.bowl
          note-members  note-actor-owners  notes
        :~  (gf-paths ~[pax] upd)
            (activity-fact note-id.act now.bowl)
            (unread-activity-fact note-id.act now.bowl)
            (note-read-fact note-id.act now.bowl)
            (sidebar-signal note-id.act our.bowl `prev %artifact now.bowl)
        ==
      ==
    ::
        %edit-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
      ::  %app artifacts carry shared interactive state — validate the descriptor on EVERY edit
      ::  path (not just remote receive), since %app edits are now member-writable.
      ?:  ?&  =(%app type.u.old)
              !(valid-app-artifact-content content.act)
          ==
        `this
      ::  non-host on a remote-hosted %app artifact: forward to the host, which is the authority +
      ::  serializer — it moderates, applies, and broadcasts %artifact-updated back to all members
      ::  (reaching us via /remote-note). Do NOT store locally. Mirrors the create forward.
      =/  nt  (~(get by notes) note-id.u.old)
      ?:  ?&  =(%app type.u.old)
              ?=(^ nt)
              !=(our.bowl creator.u.nt)
              ?|(?=(%notebook type.u.nt) ?=(%group type.u.nt))
          ==
        :_  this
        ~[(rpoke /art-edit-out/[id.act] creator.u.nt `remote:noltbook`[%remote-artifact-update id.act content.act])]
      =/  new-ver=artifact-version:noltbook
        :*  (add 1 (lent versions.u.old))  content.act  our.bowl  now.bowl
        ==
      =/  upd-art=artifact:noltbook  u.old(versions (snoc versions.u.old new-ver))
      =/  upd=update:noltbook  [%artifact-updated upd-art]
      =/  pax=path  ~[%notes note-id.upd-art]
      :_  this(artifacts (~(put by artifacts) id.act upd-art))
      ~[(gf-paths ~[pax] upd)]
    ::
        %delete-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
      =/  nid=@ta  note-id.u.old
      =/  upd=update:noltbook  [%artifact-deleted id.act]
      =/  pax=path  ~[%notes nid]
      ::  clear the pin if it (kind=%artifact) targeted this artifact (host-auth).
      =/  del-eid=(unit @uv)  ?~(meta.u.old ~ `eid.u.meta.u.old)
      =/  pin-hit=?
        ?~  del-eid  %.n
        =/  pn  (~(get by note-pins) nid)
        ?~  pn  %.n
        &(=(%artifact kind.u.pn) =(u.del-eid target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)
        ?:(pin-hit (~(del by note-pins) nid) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards nid ~) ~)
      :_  this(artifacts (~(del by artifacts) id.act), note-pins new-pins)
      ::  1B.2: /notes/[nid] transport kept; any global pin-clear /notes fact dropped if hidden.
      %:  human-note-cards  nid  our.bowl
          note-members  note-actor-owners  notes
        (weld ~[(gf-paths ~[pax] upd)] pin-clear-cards)
      ==
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
      ~[(gf-paths ~[pax] upd)]
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
        (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
      :_  this(profiles (~(put by profiles) our.bowl prof))
      [(gf-notes upd) peer-cards]
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
        (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
      :_  this(profiles (~(put by profiles) our.bowl prof))
      [(gf-notes upd) peer-cards]
    ::
        %nock-send-confirmed
      =/  tx=transaction:noltbook  [%sent to.act amount.act tx-hash.act now.bowl]
      =/  new-txs=(list transaction:noltbook)  [tx transactions]
      =/  upd=update:noltbook  [%wallet-update new-txs]
      :_  this(transactions new-txs)
      ~[(gf-notes upd)]
    ::
        %search-messages
      ::  Phase 2 sidebar search — now via the shared api-search-scan helper.
      ::  Same behavior: case-insensitive, all notes, skip cover/ars-rumors/missing/
      ::  blocked, top-50 by recency. Emits %search-result on /notes.
      =/  res  (api-search-scan query.act limit.act ~ messages notes pal-blocked)
      =/  upd=update:noltbook  [%search-result req-id.act query.act hits.res capped.res]
      :_  this
      ~[(gf-notes upd)]
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
        :~  (gf-notes pupd)
            (gf-notes rupd)
        ==
      =/  req=remote:noltbook  [%remote-profile-request req-id.act]
      :_  this
      ~[(rpoke /profile-lookup/(scot %p ship.act)/(scot %ud req-id.act) ship.act req)]
    ::
        %request-actor-profile
      ::  Phase G4: resolve an actor public profile. Local host => answer now from
      ::  actor-registry + actor-profiles. Remote: a FRESH cache (~m10) answers now;
      ::  otherwise send %remote-actor-profile-request (and let the on-agent nack arm
      ::  flip to %unreachable). A STALE cache is kept as stored fallback (served by
      ::  /api/actor-profiles) but is NOT echoed now — we wait for the fresh response.
      ?:  =(host.act our.bowl)
        =/  rec  (~(get by actor-registry) [desk.act actor-id.act])
        ?~  rec
          :_  this
          (actor-prof-result-cards req-id.act our.bowl desk.act actor-id.act %missing ~ ~)
        =/  pp  (build-actor-public-profile desk.act u.rec (~(get by actor-profiles) [desk.act actor-id.act]))
        :_  this
        ::  local => fetched-at ~ (always current).
        (actor-prof-result-cards req-id.act our.bowl desk.act actor-id.act %ok ~ `pp)
      =/  cached  (~(get by remote-actor-profiles) [host.act desk.act actor-id.act])
      ?:  ?&(?=(^ cached) (actor-prof-fresh now.bowl fetched-at.u.cached))
        :_  this
        ::  fresh cache => carry the STORED fetch time so the FE reflects backend age.
        (actor-prof-result-cards req-id.act host.act desk.act actor-id.act %ok `fetched-at.u.cached `profile.u.cached)
      =/  req=remote:noltbook  [%remote-actor-profile-request req-id.act desk.act actor-id.act]
      =/  wire=path
        /actor-prof-lookup/(scot %p host.act)/(scot %tas desk.act)/(scot %t actor-id.act)/(scot %ud req-id.act)
      :_  this
      ~[(rpoke wire host.act req)]
    ::
        %request-remote-notes
      ::  frontend wants another ship's public/private notes
      =/  who=@p  ship.act
      ?:  =(who our.bowl)
        ::  local: only notes we host for profile discovery
        =/  pub-notes=(list note:noltbook)
          %+  skim  ~(val by notes)
          |=  n=note:noltbook
          ?&  ?|(=(%group type.n) =(%gossip type.n))
              =(our.bowl creator.n)
              ?|(?=(%public visibility.n) ?=(%private visibility.n))
              !(~(has by note-actor-owners) id.n)
          ==
        =/  upd=update:noltbook  [%remote-note-list our.bowl pub-notes]
        :_  this
        ~[(gf-notes upd)]
      ::  remote: poke the other ship to request their notes
      =/  rem=remote:noltbook  [%remote-note-request our.bowl]
      :_  this
      ~[(rpoke /note-req/(scot %p who) who rem)]
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
        (rpoke /pal-hey/(scot %p ship.act) ship.act `remote:noltbook`[%remote-hey ~])
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  prof-card=card
        (rpoke /prof-out/(scot %p ship.act) ship.act `remote:noltbook`[%remote-profile our.bowl prof])
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %mutual
        %requesting
      =/  upd=update:noltbook  [%pal-update ship.act status]
      :_  this(pal-outgoing new-outgoing, pal-blocked new-blocked, peers new-peers)
      [hey-card prof-card (gf-notes upd) ~]
    ::
        %remove-pal
      ?:  =(ship.act our.bowl)  `this
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  bye-card=card
        (rpoke /pal-bye/(scot %p ship.act) ship.act `remote:noltbook`[%remote-bye ~])
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
      [bye-card (gf-notes upd) ~]
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
      ~[(gf-notes upd)]
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
        :~  (rpoke /pal-bye/(scot %p ship.act) ship.act `remote:noltbook`[%remote-bye ~])
            (rpoke /block-notify/(scot %p ship.act) ship.act `remote:noltbook`[%remote-blocked ~])
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
          (rpoke /kick/(scot %p ship.act)/[nid] ship.act `remote:noltbook`[%remote-kick nid name.n])
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
        $(entries t.entries, nn (~(put by nn) nid upd-note), na new-na, nm new-nm, cc [kick-card (gf-notes users-upd) cc])
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
          (rpoke /leave-out/(scot %p ship.act)/[nid] ship.act `remote:noltbook`[%remote-leave nid])
        =/  cleaned-na=(map @ta artifact:noltbook)
          %-  ~(rep by na)
          |=  [[k=@ta v=artifact:noltbook] a=(map @ta artifact:noltbook)]
          ?.  =(note-id.v nid)  (~(put by a) k v)
          a
        $(entries t.entries, nn (~(del by nn) nid), nm (~(del by nm) nid), na cleaned-na, cc [unsub-card leave-card (gf-notes del-upd) cc])
      ::  clean up any pending join-requests from blocked ship
      =/  new-jr=(map @ta (set @p))
        %-  ~(rep by join-requests)
        |=  [[nid=@ta ships=(set @p)] acc=(map @ta (set @p))]
        =/  cleaned=(set @p)  (~(del in ships) ship.act)
        ?:  =(~ cleaned)  acc
        (~(put by acc) nid cleaned)
      :_  this(notes new-notes.leave-result, messages new-msgs.leave-result, artifacts new-arts.leave-result, note-admins new-admins.removal-result, note-muted new-muted.removal-result, pal-outgoing new-outgoing, pal-incoming new-incoming, pal-blocked new-blocked, join-requests new-jr)
      :(weld [(gf-notes upd) ~] bye-cards cards.removal-result cards.leave-result)
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
      :~  (gf-notes upd)
          (rpoke /unblock-notify/(scot %p ship.act) ship.act `remote:noltbook`[%remote-unblocked ~])
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
      :~  (gf-notes upd)
          (gf-notes cupd)
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
        ~[(rpoke /pal-bye/(scot %p ship.act) ship.act `remote:noltbook`[%remote-bye ~])]
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
        :~  (gf-notes upd)
            (gf-notes cupd)
        ==
      :_  this(contacts new-contacts, pal-outgoing new-outgoing, pal-incoming new-incoming)
      (weld base-cards bye-cards)
    ::
        %clear-mentions
      ::  tombstone every currently-active mention for the note, then clear them,
      ::  so refetched gossip text can't recreate them.
      =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) note-id.act) ~)
      =.  cleared-mentions
        =/  acc  cleared-mentions
        |-  ^+  acc
        ?~  cur-m  acc
        $(acc (put-cleared-mention acc note-id.act id.i.cur-m eid.i.cur-m), cur-m t.cur-m)
      =.  mentions  (~(del by mentions) note-id.act)
      `this
    ::
        %clear-mention
      ::  clear a single mention by eid (preferred) or msg-id (fallback), and
      ::  tombstone it so a refetch of the same message can't re-add it.
      =.  cleared-mentions  (put-cleared-mention cleared-mentions note-id.act msg-id.act eid.act)
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
      ::  tombstone the mentions this clear removed (cur-m minus new-m) so a
      ::  refetch can't recreate them.
      =/  removed-m=(list [id=@da eid=(unit @uv) author=@p])
        %+  skim  cur-m
        |=  [id=@da eid=(unit @uv) author=@p]
        ?^  eid.act
          &(?=(^ eid) =(u.eid u.eid.act))
        ?^  msg-id.act
          =(id u.msg-id.act)
        %.n
      =.  cleared-mentions
        =/  acc  cleared-mentions
        |-  ^+  acc
        ?~  removed-m  acc
        $(acc (put-cleared-mention acc nid id.i.removed-m eid.i.removed-m), removed-m t.removed-m)
      =.  mentions
        ?~  new-m  (~(del by mentions) nid)
        (~(put by mentions) nid new-m)
      ::  emit an authoritative full snapshot so the frontend replaces this note's
      ::  attention list (no stale orange dots), even when it is now empty.
      =/  snap=(list attention-item:noltbook)
        (fall (~(get by (all-attention mentions attention)) nid) ~)
      :_  this
      ~[(gf-notes `update:noltbook`[%attention-update nid snap %.y])]
    ::
        %set-dial
      ::  clamp dial to 0-3
      =/  new-dial=@ud  (min dial.act 3)
      =/  upd=update:noltbook  [%dial-update new-dial]
      :_  this(dial new-dial)
      ~[(gf-notes upd)]
    ::
        %ack-durable-notification
      ::  durable seen-ack for a passive condition row. Touches only the
      ::  notification-acks set — never notes, membership, host-status,
      ::  pending invites, or join requests.
      =/  ackd=(set durable-notification-ack:noltbook)
        (~(put in notification-acks) [kind.act note-id.act])
      =/  ack-list=(list durable-notification-ack:noltbook)  ~(tap in ackd)
      :_  this(notification-acks ackd)
      ~[(gf-notes `update:noltbook`[%notification-acks ack-list])]
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
        %set-note-pin
      ::  creator-only + host-authoritative; broadcast live to subscribers. Since
      ::  creator == host, a non-creator member just fails here (no forwarding).
      ::  Setting replaces any existing pin for this note.
      =/  res  (apply-set-pin our.bowl note-id.act target.act kind.act notes messages artifacts host-status now.bowl)
      ?:  ?=(%.n -.res)  `this
      :_  this(note-pins (~(put by note-pins) note-id.act p.res))
      ::  1B.2: pin-cards emits a global /notes fact (+ transport); drop the global one if hidden.
      (human-note-cards note-id.act our.bowl note-members note-actor-owners notes (pin-cards note-id.act `p.res))
    ::
        %clear-note-pin
      =/  res  (apply-clear-pin our.bowl note-id.act notes host-status)
      ?:  ?=(%.n -.res)  `this
      ::  idempotent: if nothing was pinned, no state change and no broadcast.
      ?.  (~(has by note-pins) note-id.act)  `this
      :_  this(note-pins (~(del by note-pins) note-id.act))
      (human-note-cards note-id.act our.bowl note-members note-actor-owners notes (pin-cards note-id.act ~))
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
        `(rpoke /child-out/(scot %p p)/[id.act] p `remote:noltbook`[%remote-child-note new-parent.act moved])
      :_  this(notes n3, messages (~(put by messages) id.act (fall (~(get by messages) id.act) ~)))
      :(weld ~[(gf-notes upd)] broadcast)
    ::
        %remove-member
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[(rpoke /mod-fwd/[id.act] creator.u.old `remote:noltbook`[%remote-mod id.act %remove-member ship.act])]
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
        (rpoke /kick/(scot %p ship.act)/[id.act] ship.act `remote:noltbook`[%remote-kick id.act name.u.old])
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      =/  desc-users-cards=(list card)
        ?:  =(~ group-descs)  ~
        (build-users-updated-cards group-descs notes-after new-revs)
      :_  this(notes notes-after, messages (~(put by messages) id.act new-msgs), note-admins clean-admins, note-muted clean-muted, member-revs new-revs, note-members (del-member-from-ids ship.act [id.act group-descs] note-members note-actor-owners notes))
      %+  weld
        ^-  (list card)
        :~  kick-card
            (gf-notes users-upd)
            (gf-paths ~[/notes/[id.act]] users-upd)
            (gf-notes msg-upd)
            (gf-paths ~[/notes/[id.act]] msg-upd)
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
        =/  new-notifs  (actor-notif-prune-notes actor-notifications ~[id.act])
        =/  msgs-after  (~(del by messages) id.act)
        =/  notif-cards=(list card)
          (actor-notif-diff-cards actor-notifications new-notifs msgs-after actor-by-eid)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by notes) id.act), messages msgs-after, artifacts cleaned-arts, cleared-mentions (~(del by cleared-mentions) id.act), actor-note-roster (prune-participation ~[id.act] actor-note-roster), note-members (~(del by note-members) id.act), actor-join-requests (~(del by actor-join-requests) id.act), note-actor-muted (~(del by note-actor-muted) id.act), actor-note-read (actor-read-prune actor-note-read ~[id.act]), actor-notifications new-notifs)
        (weld notif-cards base-cards)
      ::  gossip: hostless container — leaving is a LOCAL-ONLY silent drop. Never kick
      ::  members and never notify a host (there is none); just remove our own copy.
      ?:  =(%gossip type.u.old)
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  new-notifs  (actor-notif-prune-notes actor-notifications ~[id.act])
        =/  msgs-after  (~(del by messages) id.act)
        =/  notif-cards=(list card)
          (actor-notif-diff-cards actor-notifications new-notifs msgs-after actor-by-eid)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by notes) id.act), messages msgs-after, artifacts cleaned-arts, gossip-envelopes (~(del by gossip-envelopes) id.act), cleared-mentions (~(del by cleared-mentions) id.act), actor-note-roster (prune-participation ~[id.act] actor-note-roster), note-members (~(del by note-members) id.act), actor-join-requests (~(del by actor-join-requests) id.act), note-actor-muted (~(del by note-actor-muted) id.act), actor-note-read (actor-read-prune actor-note-read ~[id.act]), actor-notifications new-notifs)
        (weld notif-cards base-cards)
      ::  sole user: act like delete
      ?:  (lte user-count 1)
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  new-notifs  (actor-notif-prune-notes actor-notifications ~[id.act])
        =/  msgs-after  (~(del by messages) id.act)
        =/  notif-cards=(list card)
          (actor-notif-diff-cards actor-notifications new-notifs msgs-after actor-by-eid)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by trimmed) id.act), messages msgs-after, artifacts cleaned-arts, cleared-mentions (~(del by cleared-mentions) id.act), actor-note-roster (prune-participation ~[id.act] actor-note-roster), note-members (~(del by note-members) id.act), actor-join-requests (~(del by actor-join-requests) id.act), note-actor-muted (~(del by note-actor-muted) id.act), actor-note-read (actor-read-prune actor-note-read ~[id.act]), actor-notifications new-notifs)
        (weld notif-cards base-cards)
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
          (rpoke /kick-out/(scot %p p)/[nid] p `remote:noltbook`[%remote-kick nid nname])
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
          (gf-notes `update:noltbook`[%note-deleted nid])
        =/  new-notifs  (actor-notif-prune-notes actor-notifications subtree-ids)
        =/  notif-cards=(list card)
          (actor-notif-diff-cards actor-notifications new-notifs msgs-after actor-by-eid)
        :_  this(notes notes-after, messages msgs-after, artifacts arts-after, actor-note-roster (prune-participation subtree-ids actor-note-roster), note-members (prune-note-members subtree-ids note-members), actor-join-requests (prune-participation subtree-ids actor-join-requests), note-actor-muted (prune-participation subtree-ids note-actor-muted), actor-note-read (actor-read-prune actor-note-read subtree-ids), actor-notifications new-notifs)
        :(weld local-deletes ~[(gf-paths ~[pax] upd)] kick-cards notif-cards)
      ::  non-host leaving shared note: unsub root + descendants, poke host
      ::  about the root (host cascades to its own copy), drop local subtree.
      =/  host=@p  creator.u.old
      =/  unsub-cards=(list card)
        %+  turn  subtree-ids
        |=  nid=@ta
        ^-  card
        [%pass /remote-note/[nid] %agent [host %noltbook] %leave ~]
      =/  leave-card=card
        (rpoke /leave-out/(scot %p host)/[id.act] host `remote:noltbook`[%remote-leave id.act])
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
        (gf-notes `update:noltbook`[%note-deleted nid])
      =/  new-notifs  (actor-notif-prune-notes actor-notifications subtree-ids)
      =/  notif-cards=(list card)
        (actor-notif-diff-cards actor-notifications new-notifs msgs-after actor-by-eid)
      :_  this(notes notes-after, messages msgs-after, artifacts arts-after, actor-note-roster (prune-participation subtree-ids actor-note-roster), note-members (prune-note-members subtree-ids note-members), actor-join-requests (prune-participation subtree-ids actor-join-requests), note-actor-muted (prune-participation subtree-ids note-actor-muted), actor-note-read (actor-read-prune actor-note-read subtree-ids), actor-notifications new-notifs)
      :(weld unsub-cards ~[leave-card] local-deletes notif-cards)
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
      ::  the live host/creator must not fork their own active note (the UI hides
      ::  this affordance from the creator; forking is for member copies).
      ?:  &(=(our.bowl creator.u.src) !(is-host-deleted id.act host-status))  `this
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
      ::  the new fork starts with ONLY the forker as a member. Eligible source
      ::  members are invited (fork-invitees + %remote-fork-invite) and only become
      ::  members of the fork when they accept.
      =/  fork-users=(set @p)  (sy ~[our.bowl])
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
        (rpoke /fork-invite/(scot %p p)/[new-root-id] p rem)
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
        (gf-notes `update:noltbook`[%note-created n])
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
        `(gf-notes `update:noltbook`[%artifact-envelope-list nid envs])
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
      ~[(rpoke /fork-fetch/(scot %p sender.pi)/[root-id.act] sender.pi `remote:noltbook`[%remote-fork-fetch root-id.act])]
    ::
        %decline-fork-invite
      ::  forget a pending fork invite locally, and notify the forker so they drop
      ::  us from the fork invitee set (and from users on legacy-bad forks).
      =/  inv  (~(get by pending-fork-invites) root-id.act)
      ?~  inv  `this
      =/  cleared=update:noltbook  [%fork-invite-cleared root-id.act]
      =/  decline-card=card
        (rpoke /fork-decline/(scot %p sender.u.inv)/[root-id.act] sender.u.inv `remote:noltbook`[%remote-fork-decline root-id.act])
      :_  this(pending-fork-invites (~(del by pending-fork-invites) root-id.act))
      ~[decline-card (gf-notes cleared)]
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
        ~[(gf-notes upd)]
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
        (rpoke /invite/(scot %p ship.act)/[nid] ship.act rem)
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
        ~[(rpoke /pal-hey/(scot %p ship.act) ship.act `remote:noltbook`[%remote-hey ~])]
      =/  pal-status-upd=(list card)
        ?.  is-new-peer  ~
        ~[(gf-notes `update:noltbook`[%pal-update ship.act %requesting])]
      =/  upd=update:noltbook  [%note-created new-dm]
      :_  this(notes (~(put by notes) nid new-dm), messages (~(put by messages) nid *(list message:noltbook)), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card (gf-notes upd) ~] ars-cards hey-cards pal-status-upd)
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
      ::  A1.3a: refuse to convert an actor-bearing note into a DM — it would orphan the
      ::  actor owner/roster/requests/mute. Resolve actor participation first (no silent
      ::  kick). actor-DM creation remains its own explicit invariant-bound path.
      ?:  ?|  (~(has by note-actor-owners) id.act)
              (~(has by actor-note-roster) id.act)
              (~(has by actor-join-requests) id.act)
              (~(has by note-actor-muted) id.act)
          ==
        `this
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
        (rpoke /invite/(scot %p ship.act)/[id.act] ship.act rem)
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
        ~[(rpoke /pal-hey/(scot %p ship.act) ship.act `remote:noltbook`[%remote-hey ~])]
      =/  pal-status-upd=(list card)
        ?.  is-new-peer  ~
        ~[(gf-notes `update:noltbook`[%pal-update ship.act %requesting])]
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, pal-outgoing new-outgoing)
      :(weld [poke-card (gf-notes upd) ~] ars-cards hey-cards pal-status-upd)
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
          (gf-notes `update:noltbook`[%artifact-created migrated])
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
          [(gf-notes del-upd) ~]
        %+  weld  msg-cards
        %+  weld  art-cards
        ^-  (list card)
        ~[(gf-notes `update:noltbook`[%note-created dm-note])]
      =/  m=message:noltbook  i.src-msgs
      =/  nxt-seq=@ud  +(seq)
      =/  new-id=@da  (add now.bowl idx)
      =/  em=(unit entry-meta:noltbook)
        `[(sham [our.bowl new-id nxt-seq]) nxt-seq 0 new-id new-id ~]
      =/  new-msg=message:noltbook
        [new-id dm-id author.m text.m new-id ~ %.n em]
      =/  msg-upd=update:noltbook  [%new-message new-msg ~ ~ ~]
      =/  pax=path  ~[%notes dm-id]
      %=  $
        src-msgs   t.src-msgs
        idx        +(idx)
        seq        nxt-seq
        new-msgs   (snoc new-msgs new-msg)
        msg-cards  %+  weld  msg-cards
                   ^-  (list card)
                   :~  (gf-paths ~[pax] msg-upd)
                       (gf-notes msg-upd)
                       (rpoke /dm-msg/[dm-id] ship.act `remote:noltbook`[%remote-message dm-id new-msg ~ ~ ~])
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
        :~  (rpoke /call-start/(scot %p creator.u.exists)/[note-id.act] creator.u.exists `remote:noltbook`[%remote-call-start note-id.act (crip (weld "call-" (trip (scot %da now.bowl)))) our.bowl])
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.act]
      ::  notify all other note members
      =/  broadcast=(list card)
        %+  murn  ~(tap in users.u.exists)
        |=  p=@p
        ?:  =(p our.bowl)  ~
        `(rpoke /call-start/(scot %p p)/[note-id.act] p `remote:noltbook`[%remote-call-start note-id.act cid our.bowl])
      :_  this(active-calls (~(put by active-calls) note-id.act ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)] broadcast)
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
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.act]
      ::  notify: if creator, tell existing participants directly;
      ::  if non-creator, tell the host who relays
      =/  broadcast=(list card)
        ?:  =(our.bowl creator.u.exists)
          %+  murn  ~(tap in participants.u.ci)
          |=  p=@p
          ?:  =(p our.bowl)  ~
          `(rpoke /call-join-relay/(scot %p p)/[note-id.act] p `remote:noltbook`[%remote-call-join note-id.act our.bowl])
        ~[(rpoke /call-join/(scot %p creator.u.exists)/[note-id.act] creator.u.exists `remote:noltbook`[%remote-call-join note-id.act our.bowl])]
      :_  this(active-calls (~(put by active-calls) note-id.act new-ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)] broadcast)
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
          `(rpoke /call-end/(scot %p p)/[note-id.act] p `remote:noltbook`[%remote-call-ended note-id.act])
        :_  this(active-calls (~(del by active-calls) note-id.act), messages (~(put by messages) note-id.act (snoc (snoc cur sys-msg) end-msg)))
        :(weld ~[(gf-paths ~[pax] end-upd)] ~[(gf-notes end-upd)] broadcast)
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
          `(rpoke /call-leave-relay/(scot %p p)/[note-id.act] p `remote:noltbook`[%remote-call-leave note-id.act our.bowl])
        ~[(rpoke /call-leave/(scot %p creator.u.exists)/[note-id.act] creator.u.exists `remote:noltbook`[%remote-call-leave note-id.act our.bowl])]
      =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
      :_  this(active-calls (~(put by active-calls) note-id.act new-ci), messages (~(put by messages) note-id.act (snoc cur sys-msg)))
      :(weld ~[(gf-paths ~[pax] upd)] ~[(gf-notes upd)] ~[(gf-paths ~[pax] msg-upd)] broadcast)
    ::
        %call-signal
      ::  relay WebRTC signal to target peer
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  ci  (~(get by active-calls) note-id.act)
      ?~  ci  `this
      ::  send signal directly to target peer
      :_  this
      ~[(rpoke /call-sig/(scot %p to.act)/[note-id.act] to.act `remote:noltbook`[%remote-call-signal call-id.u.ci our.bowl sig-type.act payload.act])]
    ::
        %clear-calls
      ::  purge all active calls locally, notify frontend
      =/  end-cards=(list card)
        %+  turn  ~(tap by active-calls)
        |=  [nid=@ta ci=call-info:noltbook]
        (gf-notes `update:noltbook`[%call-ended nid call-id.ci])
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
        :~  (rpoke /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) author.act `remote:noltbook`[%remote-fetch-gossip-msg nid our.bowl msg-id.act eid.act])
        ==
      :~  (rpoke /fetch-msg/(scot %p author.act)/(scot %da msg-id.act) author.act `remote:noltbook`[%remote-fetch-cover-msg our.bowl msg-id.act eid.act])
      ==
    ::
        %request-join
      ::  requester asks host to join a note
      ::  send remote-join-request to host
      :_  this
      :~  (rpoke /join-req/(scot %p host.act)/[note-id.act] host.act `remote:noltbook`[%remote-join-request note-id.act])
      ==
    ::
        %approve-join
      ::  host or admin approves a pending join request — do full invite flow
      =/  old  (~(get by notes) note-id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[(rpoke /mod-fwd/[note-id.act] creator.u.old `remote:noltbook`[%remote-mod note-id.act %approve-join ship.act])]
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
        (rpoke /invite/(scot %p ship.act)/[note-id.act] ship.act rem)
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
        ~[(gf-notes mute-upd) (gf-paths ~[/notes/[note-id.act]] mute-upd)]
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
      :_  this(notes (~(put by notes) note-id.act new-note), peers new-peers, note-muted (~(put by note-muted) note-id.act ro-muted), member-revs new-revs, note-members (put-logical-member note-id.act ship.act note-members note-actor-owners notes))
      :(weld [poke-card (gf-notes users-upd) (gf-paths ~[/notes/[note-id.act]] users-upd) (gf-notes jr-upd) ~] ars-cards ro-mute-cards desc-users-cards desc-child-pokes)
    ::
        %deny-join
      ::  host or admin denies a pending join request (no block)
      =/  old  (~(get by notes) note-id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[(rpoke /mod-fwd/[note-id.act] creator.u.old `remote:noltbook`[%remote-mod note-id.act %deny-join ship.act])]
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
      :~  (rpoke /join-deny/(scot %p ship.act)/[note-id.act] ship.act `remote:noltbook`[%remote-join-denied note-id.act])
          (gf-notes jr-upd)
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
        ~[(rpoke /mod-fwd/[note-id.act] creator.u.old `remote:noltbook`[%remote-mod note-id.act %deny-block-join ship.act])]
      ?.  (has-mod-power our.bowl note-id.act creator.u.old note-admins)  `this
      =/  pending=(set @p)  (fall (~(get by join-requests) note-id.act) *(set @p))
      ?.  (~(has in pending) ship.act)  `this
      =/  new-pending=(set @p)  (~(del in pending) ship.act)
      =.  join-requests
        ?:  =(~ new-pending)  (~(del by join-requests) note-id.act)
        (~(put by join-requests) note-id.act new-pending)
      =/  deny-card=card
        (rpoke /join-deny/(scot %p ship.act)/[note-id.act] ship.act `remote:noltbook`[%remote-join-denied note-id.act])
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
            (gf-notes pal-upd)
            (gf-notes jr-upd)
        ==
      ::  admin: note-scoped block (add to removed)
      =/  new-removed=(set @p)  (~(put in removed.u.old) ship.act)
      =/  upd-note=note:noltbook  u.old(removed new-removed)
      =/  new-revs=(map @ta @ud)  (bump-member-rev note-id.act member-revs)
      =/  users-upd=update:noltbook  [%note-users-updated note-id.act type.u.old ~(tap in users.u.old) ~(tap in new-removed) (member-rev-of note-id.act new-revs)]
      :_  this(notes (~(put by notes) note-id.act upd-note), member-revs new-revs)
      :~  deny-card
          (gf-notes users-upd)
          (gf-paths ~[/notes/[note-id.act]] users-upd)
          (gf-notes jr-upd)
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
        ~[(gf-notes mute-upd) (gf-paths ~[/notes/[id.act]] mute-upd)]
      :_  this(note-admins (~(put by note-admins) id.act new-admins), note-muted (~(put by note-muted) id.act new-muted))
      :(weld ~[(gf-notes upd)] ~[(gf-paths ~[/notes/[id.act]] upd)] mute-cards)
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
        ~[(gf-notes mute-upd) (gf-paths ~[/notes/[id.act]] mute-upd)]
      :_  this(note-admins (~(put by note-admins) id.act new-admins), note-muted (~(put by note-muted) id.act new-muted))
      :(weld ~[(gf-notes upd)] ~[(gf-paths ~[/notes/[id.act]] upd)] mute-cards)
    ::
        %mute-member
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[(rpoke /mod-fwd/[id.act] creator.u.old `remote:noltbook`[%remote-mod id.act %mute-member ship.act])]
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
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[id.act]] upd)
      ==
    ::
        %unmute-member
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  remote admin: forward to host
      ?.  =(our.bowl creator.u.old)
        :_  this
        ~[(rpoke /mod-fwd/[id.act] creator.u.old `remote:noltbook`[%remote-mod id.act %unmute-member ship.act])]
      ::  host or admin can unmute
      ?.  (has-mod-power our.bowl id.act creator.u.old note-admins)  `this
      =/  cur-muted=(set @p)  (fall (~(get by note-muted) id.act) ~)
      ?.  (~(has in cur-muted) ship.act)  `this
      =/  new-muted=(set @p)  (~(del in cur-muted) ship.act)
      =/  upd=update:noltbook  [%muted-updated id.act ~(tap in new-muted)]
      :_  this(note-muted (~(put by note-muted) id.act new-muted))
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[id.act]] upd)
      ==
    ==
      %noltbook-remote
    =/  rem  !<(remote:noltbook vase)
    =^  cards  state  (rem-handle bowl rem state)
    [cards this]
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
        ~[(gf-notes upd)]
      :_  this(notes (~(put by notes) nid rev))
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[nid]] upd)
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
    :~  (gf-notes upd)
        (gf-paths ~[/notes/[nid]] upd)
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
              (gf-notes upd)
              (gf-paths ~[/notes/[nid]] upd)
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
          (gf-notes upd)
          (gf-paths ~[/notes/[nid]] upd)
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
        :~  (gf-notes hu)
            (gf-paths ~[/notes/[nid]] hu)
        ==
      =/  result=(quip card _this)
        =/  upd  !<(update:noltbook q.cage.sign)
      ~&  [%nb-art-trace-rn-fact our=our.bowl from=src.bowl note=nid tag=-.upd]
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
          ::  Phase 11C: subscribed member records the envelope's via by eid.
          =.  via-by-eid  (api-via-put-env via-by-eid env)
          =.  gossip-hops  (~(put by gossip-hops) msg-id.env my-hops)
          =.  note-activity  (put-activity note-activity nid now.bowl)
          =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
          ::  dot-only signal: text not yet fetched, so preview ~ (no overwrite).
          :_  this
          ^-  (list card:agent:gall)
          :~  (gf-paths ~[/notes/[nid]] gupd)
              ::  also emit the envelope on global /notes so a closed gossip note
              ::  triggers fetchGossipContent → %cover-msg-content → preview.
              (gf-notes gupd)
              (activity-fact nid now.bowl)
              (unread-activity-fact nid now.bowl)
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
          ::  Phase 11C: snapshot durability — merge via from all new envelopes.
          =.  via-by-eid  (api-via-put-envs via-by-eid new-envs)
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
          :~  (gf-notes upd)
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
          =/  env=envelope:noltbook  (api-env-of msg via-by-eid)
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
            =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
            =.  note-read  (put-read note-read nid now.bowl)
            :_  this
            ^-  (list card:agent:gall)
            :~  (gf-paths ~[pax] eupd)
                (activity-fact nid now.bowl)
                (unread-activity-fact nid now.bowl)
                (note-read-fact nid now.bowl)
                (sidebar-signal nid author.msg `prev %gossip now.bowl)
            ==
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
          =.  note-activity  (put-activity note-activity nid now.bowl)
          =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
          :_  this
          ^-  (list card:agent:gall)
          :~  (gf-paths ~[pax] eupd)
              (gf-notes content-upd)
              (activity-fact nid now.bowl)
              (unread-activity-fact nid now.bowl)
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
          =/  env=envelope:noltbook  (api-env-of msg via-by-eid)
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
            =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
            =.  note-read  (put-read note-read nid now.bowl)
            :_  this
            ^-  (list card:agent:gall)
            :~  (gf-paths ~[pax] eupd)
                (activity-fact nid now.bowl)
                (unread-activity-fact nid now.bowl)
                (note-read-fact nid now.bowl)
                (sidebar-signal nid author.msg `prev %gossip now.bowl)
            ==
          =/  content-upd=update:noltbook  [%cover-msg-content nid msg]
          =.  gossip-envelopes  (~(put by gossip-envelopes) nid (cap-envs (~(put by note-envs) id.msg env)))
          =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
          =.  note-activity  (put-activity note-activity nid now.bowl)
          =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
          :_  this
          ^-  (list card:agent:gall)
          :~  (gf-paths ~[pax] eupd)
              (gf-notes content-upd)
              (activity-fact nid now.bowl)
              (unread-activity-fact nid now.bowl)
              (sidebar-signal nid author.msg `prev %gossip now.bowl)
          ==
        ::
            %note-users-updated
          ::  drop strictly-stale snapshots; equal-rev still applies.
          ?:  (lth rev.upd (member-rev-of id.upd member-revs))  `this
          =?  notes  ?=(^ note)
            (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
          ::  A1.3a: an authoritative remote type change to an actor-INELIGIBLE type
          ::  defensively prunes any stale local actor roster/request/mute rows + read
          ::  cursors + directed notifications for this note (message attribution is kept).
          =/  ineligible=?  ?!(?|(=(%notebook type.upd) =(%group type.upd)))
          =?  actor-note-roster  ineligible  (~(del by actor-note-roster) id.upd)
          =?  actor-join-requests  ineligible  (~(del by actor-join-requests) id.upd)
          =?  note-actor-muted  ineligible  (~(del by note-actor-muted) id.upd)
          =?  actor-note-read  ineligible  (actor-read-prune actor-note-read ~[id.upd])
          =?  actor-notifications  ineligible  (actor-notif-prune-notes actor-notifications ~[id.upd])
          ::  1B.3: %note-users-updated carries only TRANSPORT users, so it updates
          ::  note.users/removed/type/rev only and PRESERVES note-members. Deriving logical
          ::  membership from transport would wrongly resurrect a future actor carrier as a
          ::  human. Real-human membership changes arrive through explicit invite/kick/join/
          ::  leave/install paths (§3); the future authoritative logical-members payload
          ::  will reconcile full remote state. (gf-notes upd is relay-gated below.)
          :_  this(member-revs (~(put by member-revs) id.upd rev.upd))
          (human-relay-cards id.upd our.bowl note-members note-actor-owners notes ~[(gf-notes upd)])
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
        ::  Phase 11B hardening: merge the snapshot's via rows so attribution is
        ::  durable even when the live %new-message fact was missed. Additive —
        ::  existing local rows win on any (immutable) eid collision.
        =.  via-by-eid  (~(uni by via.upd) via-by-eid)
        ::  Phase ACTOR-1: merge the snapshot's actor rows (same additive rule).
        =.  actor-by-eid  (~(uni by actor.upd) actor-by-eid)
        ::  relay to local frontend
        :_  this
        ~[(gf-paths ~[/notes/[nid]] upd)]
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
        ::  Phase 11B: subscribed member records app attribution carried on the fact.
        =.  via-by-eid  (api-via-put via-by-eid via.upd msg)
        ::  Phase ACTOR-1: member records the actor carried on the fact (host
        ::  already host==src guarded it on receive; member trusts host relay).
        =.  actor-by-eid  (api-actor-put actor-by-eid actor.upd msg)
        ::  G6A: if THIS subscribed message is one of OUR OWN actors' (actor.host ==
        ::  our.bowl — e.g. our post to a remote-hosted note coming back host-restamped),
        ::  advance that actor's cursor to the message's exact id so its own message
        ::  never reads as unread. Other actors / host / remote authors never advance.
        =?  actor-note-read  ?&(?=(^ actor.upd) =(host.u.actor.upd our.bowl))
          (actor-read-put actor-note-read desk.u.actor.upd id.u.actor.upd nid id.msg)
        =?  notes  ?=(^ note)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        ::  recency: a genuinely-new subscribed message bumps this note.
        =.  note-activity  (put-activity note-activity nid now.bowl)
        ::  Phase B: real-user mute/block of the (host-relayed) sender actor suppresses
        ::  host unread + @~host mention + reply attention; recency above still advances.
        =/  u-suppressed=?  (actor-user-suppressed actor.upd user-muted-actors user-blocked-actors)
        =?  note-unread-activity  !u-suppressed  (put-unread-activity note-unread-activity nid now.bowl)
        ::  mention detection for subscribed notes
        =/  msg-eid=(unit @uv)
          ?~  meta.msg  ~
          `eid.u.meta.msg
        ::  Phase A: an actor message authored under our @p is a DISTINCT sender, so a
        ::  local-actor rebroadcast mentioning @~host creates host mention; only an
        ::  ordinary host self-post (no actor) is suppressed. Phase B mute/block also gates.
        =/  mentioned=?  &(!u-suppressed !(host-self author.msg actor.upd our.bowl) (has-our-mention text.msg our.bowl))
        =/  active-mentioned=?
          ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) nid) ~) id.msg msg-eid))
        =?  mentions  active-mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) nid) ~)
          (~(put by mentions) nid (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  active-mentioned  ~
          (attn-mention-cards nid id.msg msg-eid author.msg)
        ::  reply attention (member receives the host's broadcast). Target = reply.
        =/  note-arts=(list artifact:noltbook)
          (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a nid)))
        =/  note-aenvs=(list artifact-envelope:noltbook)
          ~(val by (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook)))
        =/  rte=(unit @uv)  ?~(meta.msg ~ reply-to-eid.u.meta.msg)
        =/  par-owner=(unit @p)  (attn-parent-owner rte reply-to.msg cur note-arts note-aenvs)
        ::  Phase G6B: actor-attributed parent => route to actor notifications + suppress
        ::  host reply attention for that parent.
        =/  par-eid=(unit @uv)  (reply-parent-eid msg cur)
        =/  parent-is-actor=?  ?&(?=(^ par-eid) (~(has by actor-by-eid) u.par-eid))
        ::  classify %send via the marker the host preserved on the broadcast;
        ::  otherwise %reply. (Member-origin NOTE SEND: member→host %remote-message
        ::  carried directed-kind, host rebroadcast it on %new-message.)
        =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.upd) %send %reply)
        =/  rtarget=attention-item:noltbook  [rkind %message msg-eid `id.msg ~ author.msg id.msg]
        =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
          ?:  |(parent-is-actor u-suppressed)  [attention ~]
          (add-reply-attn attention nid our.bowl (host-self author.msg actor.upd our.bowl) par-owner rtarget)
        =.  attention  na.ar
        ::  Phase G6B: notification on the parent actor's host (this ship), if any.
        =^  notif-cards  actor-notifications
          ?.  parent-is-actor  [~ actor-notifications]
          (actor-notif-add actor-notifications our.bowl now.bowl nid msg actor.upd actor-by-eid cur actor-registry note-actor-owners actor-note-roster actor-dm-notes notes actor-preferences)
        ::  Phase B: emit the unread-activity fact only when not user-suppressed.
        =/  base-cards=(list card)
          :~  (gf-paths ~[/notes/[nid]] upd)
              (gf-notes upd)
              (activity-fact nid now.bowl)
          ==
        =?  base-cards  !u-suppressed  (snoc base-cards (unread-activity-fact nid now.bowl))
        :_  this
        :(weld base-cards notif-cards mention-cards ac.ar)
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
        :~  (gf-paths ~[/notes/[nid]] upd)
            (gf-notes upd)
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
        ::  G3B hygiene: when the authoritative deletion carries an eid, prune that
        ::  message's via/actor attribution rows. Kept in place until now so a
        ::  remote-forwarded actor delete still rendered as the right actor in flight.
        =?  via-by-eid    ?=(^ del-eid)  (~(del by via-by-eid) u.del-eid)
        =?  actor-by-eid  ?=(^ del-eid)  (~(del by actor-by-eid) u.del-eid)
        ::  Phase G6B: member-side prune too — a missed separate fact must not leave a
        ::  stale notification row for the deleted replying message's eid. Emit the
        ::  authoritative full=%.y update on /api/results (apps may not watch /notes).
        ::  messages + actor-by-eid above are already post-deletion.
        =/  old-notifs  actor-notifications
        =?  actor-notifications  ?=(^ del-eid)
          (actor-notif-del-eid actor-notifications u.del-eid)
        =/  notif-cards=(list card)
          (actor-notif-diff-cards old-notifs actor-notifications messages actor-by-eid)
        ::  if this note's pinned message was the one deleted, self-prune note-pins
        ::  (and emit a local %note-pin-updated ~) in case the host's clear is missed.
        =/  pin-hit=?
          ?~  del-eid  %.n
          =/  pn  (~(get by note-pins) note-id.upd)
          ?~  pn  %.n
          &(=(%message kind.u.pn) =(u.del-eid target.u.pn))
        =?  note-pins  pin-hit  (~(del by note-pins) note-id.upd)
        =/  base-cards=(list card)
          ?.  pin-hit
            :~  (gf-paths ~[/notes/[nid]] upd)
                (gf-notes upd)
            ==
          :~  (gf-paths ~[/notes/[nid]] upd)
              (gf-notes upd)
              (gf-paths ~[/notes/[nid]] `update:noltbook`[%note-pin-updated note-id.upd ~])
          ==
        :_  this
        (weld notif-cards base-cards)
      ::
          %note-meta-updated
        ::  relay visibility changes from remote creator to local frontend
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(visibility visibility.upd, icon-url icon-url.upd, writable writable.upd))
        :_  this
        ~[(gf-notes upd)]
      ::
          %profile-list
        ::  store remote profiles locally and relay to frontend
        =.  profiles
          %-  ~(gas by profiles)
          (turn profiles.upd |=([s=@p p=profile:noltbook] [s p]))
        :_  this
        ~[(gf-notes upd)]
      ::
          %profile-updated
        ::  store remote profile locally and relay to frontend
        =.  profiles  (~(put by profiles) ship.upd profile.upd)
        :_  this
        ~[(gf-notes upd)]
      ::
          %note-users-updated
        ::  host updated the user set; drop strictly-stale snapshots.
        ?:  (lth rev.upd (member-rev-of id.upd member-revs))  `this
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(users (sy users.upd), removed (sy removed.upd), type type.upd))
        :_  this(member-revs (~(put by member-revs) id.upd rev.upd))
        ~[(gf-notes upd)]
      ::
          %note-renamed
        ::  host renamed the note; sync locally
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(name name.upd))
        :_  this
        ~[(gf-notes upd)]
      ::
          %headline-updated
        ::  host updated headline; sync locally
        =?  notes  ?=(^ note)
          (~(put by notes) id.upd u.note(headline headline.upd))
        :_  this
        ~[(gf-notes upd)]
      ::
          %muted-updated
        ::  host updated muted set; store locally and relay to frontend
        =.  note-muted
          =/  ms=(set @p)  (sy muted.upd)
          ?:  =(~ ms)  (~(del by note-muted) id.upd)
          (~(put by note-muted) id.upd ms)
        :_  this
        ~[(gf-notes upd)]
      ::
          %admins-updated
        ::  host updated admin set; store locally and relay to frontend
        =.  note-admins
          =/  as=(set @p)  (sy admins.upd)
          ?:  =(~ as)  (~(del by note-admins) id.upd)
          (~(put by note-admins) id.upd as)
        :_  this
        ~[(gf-notes upd)]
      ::
          %note-pin-updated
        ::  host set/cleared the pin; store locally and relay to frontend.
        =.  note-pins
          ?~  pin.upd  (~(del by note-pins) note-id.upd)
          (~(put by note-pins) note-id.upd u.pin.upd)
        :_  this
        ~[(gf-notes upd)]
      ::
          %note-active-updated
        ::  host set/cleared the active status; store locally and relay to frontend.
        =.  note-active
          ?~  active.upd  (~(del by note-active) note-id.upd)
          (~(put by note-active) note-id.upd u.active.upd)
        :_  this
        ~[(gf-notes upd)]
      ::
          %artifact-created
        ::  host added an artifact; store locally and relay to frontend
        =.  artifacts  (~(put by artifacts) id.artifact.upd artifact.upd)
        ::  recency: a genuinely-new artifact from the host bumps this note.
        =.  note-activity  (put-activity note-activity nid now.bowl)
        =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
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
          (add-reply-attn attention nid our.bowl (host-self creator.art2 ~ our.bowl) par-owner rtarget)
        =.  attention  na.ar
        :_  this
        ^-  (list card:agent:gall)
        :*  (gf-paths ~[/notes/[nid]] upd)
            (activity-fact nid now.bowl)
            (unread-activity-fact nid now.bowl)
            (sidebar-signal nid creator.artifact.upd `prev %artifact now.bowl)
            ac.ar
        ==
      ::
          %artifact-updated
        ::  host updated an artifact; store locally and relay to frontend
        ~&  [%nb-art-trace-art-upd our=our.bowl from=src.bowl note=nid artifact=id.artifact.upd versions=(lent versions.artifact.upd)]
        =.  artifacts  (~(put by artifacts) id.artifact.upd artifact.upd)
        :_  this
        ~[(gf-paths ~[/notes/[nid]] upd)]
      ::
          %artifact-deleted
        ::  host deleted an artifact; drop locally and relay to frontend. If it was
        ::  this note's pinned artifact, self-prune note-pins here too (and emit a
        ::  local %note-pin-updated ~) in case the host's separate clear fact is
        ::  missed. Idempotent: no-op when nothing matched.
        =/  gone-eid=(unit @uv)
          =/  a  (~(get by artifacts) id.upd)
          ?~  a  ~
          ?~  meta.u.a  ~
          `eid.u.meta.u.a
        =/  pin-hit=?
          ?~  gone-eid  %.n
          =/  pn  (~(get by note-pins) nid)
          ?~  pn  %.n
          &(=(%artifact kind.u.pn) =(u.gone-eid target.u.pn))
        =.  artifacts  (~(del by artifacts) id.upd)
        =?  note-pins  pin-hit  (~(del by note-pins) nid)
        :_  this
        ?.  pin-hit
          ~[(gf-paths ~[/notes/[nid]] upd)]
        :~  (gf-paths ~[/notes/[nid]] upd)
            (gf-paths ~[/notes/[nid]] `update:noltbook`[%note-pin-updated nid ~])
        ==
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
        :~  (gf-notes hu)
            (gf-paths ~[/notes/[nid]] hu)
        ==
      ~&  [%remote-note-watch-failed nid u.p.sign]
      ?:  (is-host-deleted nid host-status)  `this
      ?:  =(`%host-unreachable (~(get by host-status) nid))  `this
      =.  host-status  (~(put by host-status) nid %host-unreachable)
      =/  hu=update:noltbook  [%note-host-status nid `%host-unreachable]
      :_  this
      :~  (gf-notes hu)
          (gf-paths ~[/notes/[nid]] hu)
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
        =/  env=envelope:noltbook  (api-env-of msg via-by-eid)
        =/  eupd=update:noltbook  [%gossip-envelope %cover env 1]
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =/  active-mentioned=?
          ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) %cover) ~) id.msg msg-eid))
        =?  mentions  active-mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  active-mentioned  ~
          (attn-mention-cards %cover id.msg msg-eid author.msg)
        ::  author persists full message; non-author stores envelope only
        ?:  =(author.msg our.bowl)
          =.  messages  (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y))
          =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
          :_  this
          (weld ~[(gf-paths ~[/notes/cover] eupd)] mention-cards)
        ::  non-author: envelope only + ephemeral content to frontend
        =/  content-upd=update:noltbook  [%cover-msg-content %cover msg]
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(put by cover-envs) id.msg env)))
        =.  gossip-hops  (~(put by gossip-hops) id.msg 1)
        :_  this
        :(weld ~[(gf-paths ~[/notes/cover] eupd)] ~[(gf-notes content-upd)] mention-cards)
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
        =/  env=envelope:noltbook  (api-env-of msg via-by-eid)
        =/  eupd=update:noltbook  [%gossip-envelope %cover env my-hops]
        =/  msg-eid=(unit @uv)  ?~(meta.msg ~ `eid.u.meta.msg)
        =/  mentioned=?  &(!=(author.msg our.bowl) (has-our-mention text.msg our.bowl))
        =/  active-mentioned=?
          ?&(mentioned !(mention-cleared (fall (~(get by cleared-mentions) %cover) ~) id.msg msg-eid))
        =?  mentions  active-mentioned
          =/  cur-m=(list [id=@da eid=(unit @uv) author=@p])  (fall (~(get by mentions) %cover) ~)
          (~(put by mentions) %cover (snoc cur-m [id.msg msg-eid author.msg]))
        =/  mention-cards=(list card)
          ?.  active-mentioned  ~
          (attn-mention-cards %cover id.msg msg-eid author.msg)
        ::  author persists; non-author stores envelope only
        ?:  =(author.msg our.bowl)
          =.  messages  (~(put by messages) %cover (cap-msgs (snoc cur msg) %.y))
          =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
          :_  this
          (weld ~[(gf-paths ~[/notes/cover] eupd)] mention-cards)
        =/  content-upd=update:noltbook  [%cover-msg-content %cover msg]
        =.  gossip-envelopes  (~(put by gossip-envelopes) %cover (cap-envs (~(put by cover-envs) id.msg env)))
        =.  gossip-hops  (~(put by gossip-hops) id.msg my-hops)
        :_  this
        :(weld ~[(gf-paths ~[/notes/cover] eupd)] ~[(gf-notes content-upd)] mention-cards)
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
        ::  Phase 11C hardening: merge the snapshot's via rows FIRST, then build
        ::  the remote envelopes via api-env-of so the stored envelopes keep via.
        =.  via-by-eid  (~(uni by via.upd) via-by-eid)
        =/  new-envs=(map @da envelope:noltbook)
          %-  ~(gas by *(map @da envelope:noltbook))
          %+  turn  remote
          |=  m=message:noltbook
          [id.m (api-env-of m via-by-eid)]
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
        ::  Phase 11C: record the cover envelope's via by eid.
        =.  via-by-eid  (api-via-put-env via-by-eid env)
        =.  gossip-hops  (~(put by gossip-hops) msg-id.env my-hops)
        :_  this
        ::  also emit on global /notes so a CLOSED cover updates its preview via
        ::  fetchGossipContent → %cover-msg-content. No activity-fact / sidebar-
        ::  signal (cover must not get a green/red dot); the frontend
        ::  !isPinnedUnreadNote guard suppresses any cover notification.
        :~  (gf-paths ~[/notes/cover] gupd)
            (gf-notes gupd)
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
        ::  Phase 11C: snapshot durability — merge via from all new cover envelopes.
        =.  via-by-eid  (api-via-put-envs via-by-eid new-envs)
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
        ~[(gf-notes upd)]
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
        :~  (gf-notes hu)
            (gf-paths ~[/notes/[nid]] hu)
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
      :~  (gf-notes hu)
          (gf-paths ~[/notes/[nid]] hu)
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
      ~[(gf-notes upd)]
    ==
  ::
      [%actor-prof-lookup @ @ @ @ ~]
    ::  Phase G4: our actor-profile request to a remote host returned. A NACK
    ::  (host down / no agent / old peer that can't parse the new variant) =>
    ::  emit %actor-profile-result %unreachable. A successful ack waits for the
    ::  actual %remote-actor-profile-response. (True silence from a reachable but
    ::  unresponsive/blocking host is NOT detectable here — the frontend/API timeout
    ::  covers that; we never fabricate a confirmation.)
    =/  host=@p   (slav %p i.t.wire)
    =/  desk=@tas  (slav %tas i.t.t.wire)
    =/  aid=@t    (slav %t i.t.t.t.wire)
    =/  rid=@ud   (slav %ud i.t.t.t.t.wire)
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%actor-prof-lookup-failed wire u.p.sign]
      :_  this
      (actor-prof-result-cards rid host desk aid %unreachable ~ ~)
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
