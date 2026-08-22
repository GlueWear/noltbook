/-  noltbook
/+  default-agent, dbug, server
|%
::  state-33: durable per-counterparty DM display prefs (name + icon-url).
::  Local-only; never broadcast. Survive %leave-note so a re-invited DM
::  re-applies the user's saved label/icon.
+$  dm-pref  $:(name=(unit @t) icon-url=(unit @t))
::  state-75: THE state. 60 fields; the 16 actor fields were dropped by the 74->75
::  migration, which both live ships have run. That migration and the whole pre-%75
::  ladder are now gone, so this is the only version on-load accepts. app-grants holds
::  caps sets that are subsets of {%import-dm}, enforced by clamp-app-grants on every
::  load. app-cap itself must stay the broad 22-label union: it is the mold the saved
::  noun was written against, so narrowing it breaks !<(state-75 old).
+$  state-75
  $:  %75
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
      app-grants=(map @tas app-grant:noltbook)
      note-unread-activity=(map @ta @da)
      note-members=(map @ta (set @p))
      app-notifications=(map [@tas @t] app-notification:noltbook)
      dm-artifact-refs=(map @uv dm-artifact-ref:noltbook)
      dm-artifact-tombs=(map @uv dm-artifact-tomb:noltbook)
      dm-msg-tombs=(map dm-message-key:noltbook @da)
      peer-proto=(map @p @ud)
      pending-dm-fetches=(map @ta pending-dm-fetch:noltbook)
      note-artifact-tombs=(map @ta note-artifact-tomb:noltbook)
      mesh-tombs=(set @uv)
      mesh-tomb-meta=(map @uv mesh-tomb:noltbook)
      dm-imports=(map @uv dm-import:noltbook)
      import-only-dms=(set @ta)
      pending-icon-fetches=(map @ta pending-icon-fetch:noltbook)
      pending-img-writes=(map @ta pending-img-write:noltbook)
      pending-profile-lookups=(map @ud pending-profile-lookup:noltbook)
  ==
::  state-76: identical to %75 except that the single active-calls map is replaced by
::  the generation-bearing `calls` record plus per-participant `call-leases`. %75 above
::  is FROZEN -- it is the mold the saved noun was written against, and !< nests on the
::  mold, so nothing in it may be narrowed or renamed.
+$  state-76
  $:  %76
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
      ::  calls: ONE authoritative record per note, empty snapshots included, so a
      ::  cleared call keeps its generation and stays ordered. Replaces active-calls.
      calls=(map @ta call-snapshot:noltbook)
      ::  call-leases: host-only liveness. note -> participant -> deadline. A lapsed
      ::  lease removes ONLY that participant, so one crashed browser cannot end a
      ::  call the others are still in.
      call-leases=(map @ta (map @p @da))
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
      app-grants=(map @tas app-grant:noltbook)
      note-unread-activity=(map @ta @da)
      note-members=(map @ta (set @p))
      app-notifications=(map [@tas @t] app-notification:noltbook)
      dm-artifact-refs=(map @uv dm-artifact-ref:noltbook)
      dm-artifact-tombs=(map @uv dm-artifact-tomb:noltbook)
      dm-msg-tombs=(map dm-message-key:noltbook @da)
      peer-proto=(map @p @ud)
      pending-dm-fetches=(map @ta pending-dm-fetch:noltbook)
      note-artifact-tombs=(map @ta note-artifact-tomb:noltbook)
      mesh-tombs=(set @uv)
      mesh-tomb-meta=(map @uv mesh-tomb:noltbook)
      dm-imports=(map @uv dm-import:noltbook)
      import-only-dms=(set @ta)
      pending-icon-fetches=(map @ta pending-icon-fetch:noltbook)
      pending-img-writes=(map @ta pending-img-write:noltbook)
      pending-profile-lookups=(map @ud pending-profile-lookup:noltbook)
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
::  prune-note-members: drop note-members rows for a list of removed note ids.
::  Phase 1A cleanup helper.
++  prune-note-members
  |=  [ids=(list @ta) m=(map @ta (set @p))]
  ^-  (map @ta (set @p))
  =/  acc=(map @ta (set @p))  m
  |-
  ?~  ids  acc
  $(ids t.ids, acc (~(del by acc) i.ids))
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
::  ===== ordinary-DM shared message pin =====
::  Deliberately SEPARATE from apply-set-pin / apply-clear-pin, which remain the
::  creator-only hosted path. Leaving those untouched is what keeps the developer API
::  rejecting %dm (it calls them, and pin-note-ok still excludes %dm) and keeps
::  notebook/group/gossip authority byte-equivalent.
::  In an ordinary two-person DM either current participant may pin, replace or clear
::  the one shared %message pin. Artifact pins are NOT enabled here.
++  dm-pin-ok
  |=  $:  who=@p  us=@p  nid=@ta
          nmap=(map @ta note:noltbook)
          hs=(map @ta ?(%host-deleted %host-unreachable))
      ==
  ^-  ?
  =/  nt-u  (~(get by nmap) nid)
  ?~  nt-u  %.n
  ?.  (is-ordinary-dm u.nt-u)  %.n
  ?.  (~(has in users.u.nt-u) who)  %.n
  ?.  (~(has in users.u.nt-u) us)  %.n
  ?:  (~(has in removed.u.nt-u) who)  %.n
  ?:  (is-write-blocked nid hs nmap us)  %.n
  %.y
::  dm-pin-target: our current %message pin target, or ~. An artifact pin (only
::  reachable from malformed old state) reads as ~ so it is never compared or cleared.
++  dm-pin-target
  |=  [nid=@ta pins=(map @ta note-pin:noltbook)]
  ^-  (unit @uv)
  =/  pn  (~(get by pins) nid)
  ?~  pn  ~
  ?.  =(%message kind.u.pn)  ~
  `target.u.pn
::  dm-peer-of: the other participant of a two-person DM.
++  dm-peer-of
  |=  [n=note:noltbook us=@p]
  ^-  (unit @p)
  =/  others=(list @p)  (skim ~(tap in users.n) |=(p=@p !=(p us)))
  ?~  others  ~
  `i.others
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
::  newest-msg-da: newest MESSAGE creation time (@da) in a list; 0 if none.
++  newest-msg-da
  |=  msgs=(list message:noltbook)
  ^-  @da
  %+  roll  msgs
  |=  [m=message:noltbook acc=@da]
  ?:((gth id.m acc) id.m acc)
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
::  put-unread-activity: durable green-unread recency, parallel to put-activity (same
::  pinned-note skip). note-activity keeps driving sidebar order; this drives the unread
::  dot.
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
      =/  raw=tape  (trip text.i.ms)
      =/  body=tape  (cass raw)
      =/  found=(unit @ud)  (find q-tape body)
      ?~  found
        $(ms t.ms)
      ::  Center the result preview on the first match instead of always
      ::  showing the beginning of the post. Keep a little more context after
      ::  the match, where the rest of the sentence usually lives.
      =/  start=@ud  ?:((gth u.found 55) (sub u.found 55) 0)
      =/  tail=tape  (slag start raw)
      =/  excerpt=tape  (scag 160 tail)
      =/  excerpt-len=@ud  (lent excerpt)
      =/  tail-len=@ud  (lent tail)
      =/  pv=@t
        %-  crip
        ;:  weld
          ?:(=(start 0) "" "...")
          excerpt
          ?:(=(excerpt-len tail-len) "" "...")
        ==
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
      ['iconUrl' ?~(icon-url.n ~ s+u.icon-url.n)]
      ['headline' ?~(headline.n ~ s+u.headline.n)]
      ['userCount' (numb:enjs:format lcount)]
      ['lastPreview' ?~(last-preview.n ~ s+u.last-preview.n)]
      ['app' (api-app-json app)]
      ['active' (api-active-json active now)]
  ==
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
++  dm-import-snapshot
  |=  [msgs=(list message:noltbook) imap=(map @uv dm-import:noltbook)]
  ^-  (map @uv dm-import:noltbook)
  %-  ~(gas by *(map @uv dm-import:noltbook))
  %+  murn  msgs
  |=  m=message:noltbook
  ^-  (unit [@uv dm-import:noltbook])
  ?~  meta.m  ~
  =/  row  (~(get by imap) eid.u.meta.m)
  ?~(row ~ `[eid.u.meta.m u.row])
::  Strip imported rows from any snapshot served to another ship. This is the
::  transport backstop for the local-only import invariant.
++  dm-import-free-messages
  |=  [msgs=(list message:noltbook) imap=(map @uv dm-import:noltbook)]
  ^-  (list message:noltbook)
  %+  skip  msgs
  |=  m=message:noltbook
  ?~(meta.m %.n (~(has by imap) eid.u.meta.m))
::  clamp-app-grants: pure, total, idempotent. app-cap must stay broad as a storage
::  mold, so this is what actually enforces the runtime rule at the value level: every
::  decoded grant row keeps ONLY %import-dm in its caps set. Every row is preserved --
::  enabled or disabled -- along with desk, enabled, granted-by and all three
::  timestamps; a row left with no live capability becomes an empty-caps row and is
::  never deleted. %import-dm is never invented for a row that did not hold it. Runs on
::  the %75 state AFTER !<(state-75 old) has decoded it with the broad mold.
++  clamp-app-grants
  |=  g=(map @tas app-grant:noltbook)
  ^-  (map @tas app-grant:noltbook)
  %-  ~(run by g)
  |=  row=app-grant:noltbook
  ^-  app-grant:noltbook
  =/  kept=(set app-cap:noltbook)
    %-  ~(gas in *(set app-cap:noltbook))
    %+  murn  ~(tap in caps.row)
    |=  c=app-cap:noltbook
    ^-  (unit app-cap:noltbook)
    ?.  ?=(%import-dm c)  ~
    `c
  row(caps kept)
::  api-grant-json: host/developer read shape for one app grant. Unchanged wire shape:
::  {desk, enabled, caps, grantedBy, grantedAt, updatedAt, revokedAt}.
++  api-grant-json
  |=  g=app-grant:noltbook
  ^-  json
  %-  pairs:enjs:format
  :~  ['desk' s+(scot %tas desk.g)]
      ['enabled' b+enabled.g]
      ::  Serialize ONLY %import-dm. app-cap stays broad as a storage mold, so a row
      ::  decoded from older state could still carry an inert label; this read must
      ::  never expose one. Emitted array is [] or ["import-dm"].
      :-  'caps'
      :-  %a
      %+  murn  ~(tap in caps.g)
      |=  c=app-cap:noltbook
      ^-  (unit json)
      ?.  ?=(%import-dm c)  ~
      `s+(scot %tas c)
      ['grantedBy' s+(scot %p granted-by.g)]
      ['grantedAt' (numb:enjs:format (api-da-ms granted-at.g))]
      ['updatedAt' (numb:enjs:format (api-da-ms updated-at.g))]
      ['revokedAt' ?~(revoked-at.g ~ (numb:enjs:format (api-da-ms u.revoked-at.g)))]
  ==
++  api-dm-import-json
  |=  [eid=(unit @uv) imap=(map @uv dm-import:noltbook)]  ^-  json
  ?~  eid  ~
  =/  di  (~(get by imap) u.eid)
  ?~  di  ~
  =/  app-json=json
    %-  pairs:enjs:format
    :~  ['desk' s+(scot %tas desk.importer.u.di)]
        ['title' ?~(title.importer.u.di ~ s+u.title.importer.u.di)]
        ['publisher' ?~(publisher.importer.u.di ~ s+(scot %p u.publisher.importer.u.di))]
        ['ship' s+(scot %p ship.importer.u.di)]
    ==
  %-  pairs:enjs:format
  :~  ['app' app-json]
      ['source' s+(scot %tas source.u.di)]
      ['sentAt' (numb:enjs:format (api-da-ms sent-at.u.di))]
      ['receivedAt' (numb:enjs:format (api-da-ms received-at.u.di))]
      ['removedAt' ?~(removed-at.u.di ~ (numb:enjs:format (api-da-ms u.removed-at.u.di)))]
  ==
++  api-msg-json
  |=  [m=message:noltbook vmap=via-map:noltbook imap=(map @uv dm-import:noltbook)]  ^-  json
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
      ['import' (api-dm-import-json ?~(meta.m ~ `eid.u.meta.m) imap)]
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
          nmap=(map @ta note:noltbook)
      ==
  ^-  (list [@t json])
  =/  host-st  (~(get by hs) nid)
  =/  is-host-deleted=?  ?=([~ %host-deleted] host-st)
  =/  is-host-unreach=?  ?=([~ %host-unreachable] host-st)
  =/  is-removed=?  (~(has in removed.nt) our)
  =/  write-blocked=?  ?|(?=(^ host-st) is-removed)
  ::  1B.3: capabilities are LOGICAL-membership aware. A transport-only creator/host
  ::  gets NO ordinary post/member/admin caps merely from creator==our.
  =/  is-member=?  (~(has in (logical-members-of nid nm nmap)) our)
  ::  raw transport creator; ordinary creator authority also requires membership.
  =/  raw-creator=?  =(our creator.nt)
  =/  is-creator=?  &(raw-creator is-member)
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
  ::  establish clean LOCAL defaults before any pref overlay: the durable DM name is the
  ::  local counterparty's @p (the profile display name is derived live in the frontend),
  ::  and the icon is cleared. Incoming DM metadata may carry the sender's own title/icon,
  ::  and a converted notebook may retain a stale name/icon — neither should become our
    =/  base=note:noltbook  n(name (scot %p u.cp), icon-url ~)
  =/  pref=(unit dm-pref)  (~(get by prefs) u.cp)
  ?~  pref  base
  =/  with-name=note:noltbook
    ?~  name.u.pref  base
    base(name u.name.u.pref)
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
::  dm-edit-extends: single-writer validation for a DM %app-artifact edit. TRUE iff
::  `new` is a strict, author-consistent extension of `old`: strictly longer, `old` an
::  exact prefix of `new`, and every added (suffix) version has a sequential version
::  number (starting at +(old-len)), editor == `who`, and valid app content. Pure; used
::  by the %remote-dm-app-artifact-edit receiver. Adds no Gall door arm.
++  dm-edit-extends
  |=  [old=(list artifact-version:noltbook) new=(list artifact-version:noltbook) who=@p]
  ^-  ?
  =/  old-len=@  (lent old)
  ?.  (gth (lent new) old-len)  %.n
  ?.  =(old (scag old-len new))  %.n
  =/  added=(list artifact-version:noltbook)  (slag old-len new)
  =|  expect=@ud
  =.  expect  +(old-len)
  |-  ^-  ?
  ?~  added  %.y
  ?&  =(version.i.added expect)
      =(who editor.i.added)
      (valid-app-artifact-content content.i.added)
      $(added t.added, expect +(expect))
  ==
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
::  ===== Phase 0 pure helpers for ordinary-DM origin-hosting =====
::  Defined now for LATER phases; they mutate nothing and are intentionally unused this
::  phase. Kept total + defensive against legacy/malformed data.
::  dm-artifact-eid: the stable cross-ship identity — artifact.meta.eid when present,
::  else the deterministic (sham [creator id]).
++  dm-artifact-eid
  |=  a=artifact:noltbook
  ^-  @uv
  ?^  meta.a  eid.u.meta.a
  (sham [creator.a id.a])
::  dm-artifact-rev: the authoritative revision going forward — the latest
::  artifact-version.version. An empty/malformed version list falls back to 0.
++  dm-artifact-rev
  |=  a=artifact:noltbook
  ^-  @ud
  ?~  versions.a  0
  version:(rear versions.a)
::  dm-message-key-of: collision-safe tombstone key — %eid when the message carries an
::  entry-meta eid, else %legacy [author id].
++  dm-message-key-of
  |=  m=message:noltbook
  ^-  dm-message-key:noltbook
  ?^  meta.m  [%eid eid.u.meta.m]
  [%legacy author.m id.m]
::  ===== Phase 1 ordinary-DM correctness helpers (outer core; pure) =====
::  is-ordinary-dm: an ordinary two-human %dm, recognised from the note's own stored
::  properties. A %group is never a DM, regardless of any stale marker state.
++  is-ordinary-dm
  |=  n=note:noltbook
  ^-  ?
  ?&  =(%dm type.n)
      =(2 ~(wyt in users.n))
  ==
::  dm-key-tombed: is a message key terminally tombstoned?
++  dm-key-tombed
  |=  [k=dm-message-key:noltbook tombs=(map dm-message-key:noltbook @da)]
  ^-  ?
  (~(has by tombs) k)
::  dm-add-msg-tomb: idempotently record a terminal message tombstone (retained forever).
++  dm-add-msg-tomb
  |=  [k=dm-message-key:noltbook t=@da tombs=(map dm-message-key:noltbook @da)]
  ^-  (map dm-message-key:noltbook @da)
  ?:  (~(has by tombs) k)  tombs
  (~(put by tombs) k t)
::  dm-find-msg: locate a DM target message. EID-first (rem eid); legacy fallback is by
::  [author=who id], never a bare @da across authors. `who` is the authenticated author.
++  dm-find-msg
  |=  [msgs=(list message:noltbook) eid=(unit @uv) mid=@da who=@p]
  ^-  (unit message:noltbook)
  ?^  eid
    =/  by-eid  (skim msgs |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m u.eid))))
    ?^  by-eid  `i.by-eid
    =/  by-leg  (skim msgs |=(m=message:noltbook &(?=(~ meta.m) =(author.m who) =(id.m mid))))
    ?~  by-leg  ~
    `i.by-leg
  =/  by-leg  (skim msgs |=(m=message:noltbook &(=(author.m who) =(id.m mid))))
  ?~  by-leg  ~
  `i.by-leg
::  dm-next-seq: the next RECEIVER-ASSIGNED ordinal for a local DM copy. Each ship owns
::  the order of its own DM list, so an incoming meta.seq is never trusted as a timeline
::  position. Returns one greater than the larger of the local counter and the highest
::  meta.seq already stored in that DM, so a high value inherited from history stays
::  monotonic without being repaired. meta=~ contributes nothing. Pure: no cards, no
::  state, no scry, no logging.
++  dm-next-seq
  |=  [counter=@ud msgs=(list message:noltbook)]
  ^-  @ud
  =/  hi=@ud
    |-  ^-  @ud
    ?~  msgs  counter
    =/  sq=@ud  ?~(meta.i.msgs 0 seq.u.meta.i.msgs)
    $(msgs t.msgs, counter ?:((gth sq counter) sq counter))
  +(hi)
::  dm-msg-winner: pick the surviving copy of two same-key messages — higher meta.rev,
::  then higher meta.updated, then a deterministic (sham) tie-break.
++  dm-msg-winner
  |=  [a=message:noltbook b=message:noltbook]
  ^-  message:noltbook
  =/  ra=@ud  ?~(meta.a 0 rev.u.meta.a)
  =/  rb=@ud  ?~(meta.b 0 rev.u.meta.b)
  ?:  (gth ra rb)  a
  ?:  (gth rb ra)  b
  =/  ua=@da  ?~(meta.a `@da`0 updated.u.meta.a)
  =/  ub=@da  ?~(meta.b `@da`0 updated.u.meta.b)
  ?:  (gth ua ub)  a
  ?:  (gth ub ua)  b
  ?:  (gth (sham a) (sham b))  a
  b
::  dm-merge-timeline: merge two DM message lists for a note rekeyed to `win`. Identity is
::  EID-first (legacy [author id]); tombstoned keys dropped; same-key collisions keep
::  dm-msg-winner; every retained message's note-id is rewritten to `win`; ordered by
::  meta.created (fallback id). Never deduplicates by bare @da id across authors.
++  dm-merge-timeline
  |=  $:  win=@ta
          a=(list message:noltbook)
          b=(list message:noltbook)
          tombs=(map dm-message-key:noltbook @da)
      ==
  ^-  (list message:noltbook)
  =|  acc=(map dm-message-key:noltbook message:noltbook)
  =.  acc
    =/  all=(list message:noltbook)  (weld a b)
    |-  ^-  (map dm-message-key:noltbook message:noltbook)
    ?~  all  acc
    =/  m=message:noltbook  i.all(note-id win)
    =/  k=dm-message-key:noltbook  (dm-message-key-of m)
    ?:  (~(has by tombs) k)  $(all t.all)
    =/  ex  (~(get by acc) k)
    =/  keep=message:noltbook  ?~(ex m (dm-msg-winner u.ex m))
    $(all t.all, acc (~(put by acc) k keep))
  %+  sort  ~(val by acc)
  |=  [x=message:noltbook y=message:noltbook]
  ^-  ?
  =/  cx=@da  ?~(meta.x id.x created.u.meta.x)
  =/  cy=@da  ?~(meta.y id.y created.u.meta.y)
  ?.  =(cx cy)  (lth cx cy)
  ::  Part 1C: created ties break on id, then a stable message-key hash — never on
  ::  map iteration or sort stability.
  ?.  =(id.x id.y)  (lth id.x id.y)
  (lth (sham (dm-message-key-of x)) (sham (dm-message-key-of y)))
::  dm-merge-mentions / -cleared / -attention: dedup-merge note-scoped lists during
::  reconciliation. W's entries are kept first; later duplicates drop by durable token.
++  dm-merge-mentions
  |=  [a=(list [id=@da eid=(unit @uv) author=@p]) b=(list [id=@da eid=(unit @uv) author=@p])]
  ^-  (list [id=@da eid=(unit @uv) author=@p])
  =|  seen=(set @uv)
  =|  out=(list [id=@da eid=(unit @uv) author=@p])
  =/  all  (weld a b)
  |-
  ?~  all  (flop out)
  =/  tok=@uv  ?^(eid.i.all u.eid.i.all (sham author.i.all id.i.all))
  ?:  (~(has in seen) tok)  $(all t.all)
  $(all t.all, seen (~(put in seen) tok), out [i.all out])
++  dm-merge-cleared
  |=  [a=(list [id=@da eid=(unit @uv)]) b=(list [id=@da eid=(unit @uv)])]
  ^-  (list [id=@da eid=(unit @uv)])
  =|  seen=(set @uv)
  =|  out=(list [id=@da eid=(unit @uv)])
  =/  all  (weld a b)
  |-
  ?~  all  (flop out)
  =/  tok=@uv  ?^(eid.i.all u.eid.i.all (sham id.i.all))
  ?:  (~(has in seen) tok)  $(all t.all)
  $(all t.all, seen (~(put in seen) tok), out [i.all out])
++  dm-merge-attention
  |=  [a=(list attention-item:noltbook) b=(list attention-item:noltbook)]
  ^-  (list attention-item:noltbook)
  =|  seen=(set @uv)
  =|  out=(list attention-item:noltbook)
  =/  all  (weld a b)
  |-
  ?~  all  (flop out)
  =/  it  i.all
  =/  tok=@uv
    ?^  eid.it     u.eid.it
    ?^  msg-id.it  (sham %m u.msg-id.it)
    ?^  aid.it     (sham %a u.aid.it)
    (sham %k kind.it author.it when.it)
  ?:  (~(has in seen) tok)  $(all t.all)
  $(all t.all, seen (~(put in seen) tok), out [it out])
::  reconcile-dm-roots: lossless ordinary-DM root reconciliation. `lose`=losing local id,
::  `win`=winning local id, `cn`=canonical winning note (dm-pref already applied). Merges
::  the losing timeline into the winner (EID-first, tombstoned dropped, note-id rewritten)
::  and rekeys EVERY note-id-keyed state-67 field L->W. Never wipes the winner or drops
::  the loser's data. Only touches L/W keys, so unrelated notes are untouched. No-op if
::  lose==win. Group/fork/gossip-only fields hold no ordinary-DM data and are left
::  alone; pending-dm-fetches/dm-msg-tombs key by entry identity (not note-id).
++  reconcile-dm-roots
  |=  [st=state-76 lose=@ta win=@ta cn=note:noltbook]
  ^-  state-76
  ?:  =(lose win)  st
  =*  s  st
  ::  notes: install canonical winner, drop loser
  =.  notes.s  (~(put by (~(del by notes.s) lose)) win cn)
  ::  messages: merge loser timeline into winner (lossless), drop loser key
  =.  messages.s
    =/  aw=(list message:noltbook)  (fall (~(get by messages.s) win) ~)
    =/  al=(list message:noltbook)  (fall (~(get by messages.s) lose) ~)
    (~(put by (~(del by messages.s) lose)) win (dm-merge-timeline win aw al dm-msg-tombs.s))
  ::  artifacts: rewrite embedded note-id L->W (keyed by aid; keys unchanged)
  =.  artifacts.s
    %-  ~(run by artifacts.s)
    |=(a=artifact:noltbook ?.(=(note-id.a lose) a a(note-id win)))
  ::  dm-artifact-refs: rewrite embedded note-id; drop any whose eid is tombstoned
  =.  dm-artifact-refs.s
    %-  ~(gas by *(map @uv dm-artifact-ref:noltbook))
    %+  murn  ~(tap by dm-artifact-refs.s)
    |=  [e=@uv r=dm-artifact-ref:noltbook]
    ^-  (unit [@uv dm-artifact-ref:noltbook])
    ?:  (~(has by dm-artifact-tombs.s) e)  ~
    ?.  =(note-id.r lose)  `[e r]
    `[e r(note-id win)]
  ::  dm-artifact-tombs: rewrite embedded note-id (terminal; preserved)
  =.  dm-artifact-tombs.s
    %-  ~(run by dm-artifact-tombs.s)
    |=(t=dm-artifact-tomb:noltbook ?.(=(note-id.t lose) t t(note-id win)))
  ::  mentions: merge+dedup, drop loser
  =.  mentions.s
    =/  mw  (fall (~(get by mentions.s) win) ~)
    =/  ml  (fall (~(get by mentions.s) lose) ~)
    (~(put by (~(del by mentions.s) lose)) win (dm-merge-mentions mw ml))
  ::  cleared-mentions: merge+dedup, drop loser
  =.  cleared-mentions.s
    =/  cw  (fall (~(get by cleared-mentions.s) win) ~)
    =/  cl  (fall (~(get by cleared-mentions.s) lose) ~)
    (~(put by (~(del by cleared-mentions.s) lose)) win (dm-merge-cleared cw cl))
  ::  attention: merge+dedup by durable target identity, drop loser
  =.  attention.s
    =/  aw  (fall (~(get by attention.s) win) ~)
    =/  al  (fall (~(get by attention.s) lose) ~)
    (~(put by (~(del by attention.s) lose)) win (dm-merge-attention aw al))
  ::  seq-counters: keep max, drop loser
  =.  seq-counters.s
    =/  lv  (~(get by seq-counters.s) lose)
    ?~  lv  seq-counters.s
    =/  wv=@ud  (fall (~(get by seq-counters.s) win) `@ud`0)
    (~(put by (~(del by seq-counters.s) lose)) win ?:((gth u.lv wv) u.lv wv))
  ::  note-activity: keep max, drop loser
  =.  note-activity.s
    =/  lv  (~(get by note-activity.s) lose)
    ?~  lv  note-activity.s
    =/  wv=@da  (fall (~(get by note-activity.s) win) `@da`0)
    (~(put by (~(del by note-activity.s) lose)) win ?:((gth u.lv wv) u.lv wv))
  ::  note-unread-activity: keep max, drop loser
  =.  note-unread-activity.s
    =/  lv  (~(get by note-unread-activity.s) lose)
    ?~  lv  note-unread-activity.s
    =/  wv=@da  (fall (~(get by note-unread-activity.s) win) `@da`0)
    (~(put by (~(del by note-unread-activity.s) lose)) win ?:((gth u.lv wv) u.lv wv))
  ::  note-read: keep max, drop loser
  =.  note-read.s
    =/  lv  (~(get by note-read.s) lose)
    ?~  lv  note-read.s
    =/  wv=@da  (fall (~(get by note-read.s) win) `@da`0)
    (~(put by (~(del by note-read.s) lose)) win ?:((gth u.lv wv) u.lv wv))
  ::  note-pins: prefer W; else move L to W; drop loser
  =.  note-pins.s
    ?:  (~(has by note-pins.s) win)  (~(del by note-pins.s) lose)
    =/  lp  (~(get by note-pins.s) lose)
    ?~  lp  note-pins.s
    (~(put by (~(del by note-pins.s) lose)) win u.lp)
  ::  calls: prefer W; else move L, rewriting note-id on the snapshot and its call
  =.  calls.s
    ?:  (~(has by calls.s) win)  (~(del by calls.s) lose)
    =/  lc  (~(get by calls.s) lose)
    ?~  lc  calls.s
    =/  moved=call-snapshot:noltbook
      :+  win  gen.u.lc
      ?~  call.u.lc  ~
      `u.call.u.lc(note-id win)
    (~(put by (~(del by calls.s) lose)) win moved)
  =.  call-leases.s
    ?:  (~(has by call-leases.s) win)  (~(del by call-leases.s) lose)
    =/  ll  (~(get by call-leases.s) lose)
    ?~  ll  call-leases.s
    (~(put by (~(del by call-leases.s) lose)) win u.ll)
  ::  note-members: union, drop loser
  =.  note-members.s
    =/  mw  (fall (~(get by note-members.s) win) ~)
    =/  ml  (fall (~(get by note-members.s) lose) ~)
    (~(put by (~(del by note-members.s) lose)) win (~(uni in mw) ml))
  ::  notification-acks: rewrite [kind lose] -> [kind win], set re-inserts (dedup)
  =.  notification-acks.s
    %-  ~(gas in *(set durable-notification-ack:noltbook))
    %+  turn  ~(tap in notification-acks.s)
    |=(x=durable-notification-ack:noltbook ?.(=(note-id.x lose) x x(note-id win)))
  ::  headlines: prefer W; else move L
  =.  headlines.s
    ?:  (~(has by headlines.s) win)  (~(del by headlines.s) lose)
    =/  lh  (~(get by headlines.s) lose)
    ?~  lh  headlines.s
    (~(put by (~(del by headlines.s) lose)) win u.lh)
  ::  note-apps: prefer W; else move L
  =.  note-apps.s
    ?:  (~(has by note-apps.s) win)  (~(del by note-apps.s) lose)
    =/  la  (~(get by note-apps.s) lose)
    ?~  la  note-apps.s
    (~(put by (~(del by note-apps.s) lose)) win u.la)
  ::  note-active: drop the loser's stale heartbeat (winner's own value, if any, stands)
  =.  note-active.s  (~(del by note-active.s) lose)
  ::  current-note: retarget L -> W
  =.  current-note.s  ?:(=(current-note.s lose) win current-note.s)
  ::  app-notifications: rewrite optional inner note-id L -> W
  =.  app-notifications.s
    %-  ~(run by app-notifications.s)
    |=  an=app-notification:noltbook
    ?.  =(note-id.an `lose)  an
    an(note-id `win)
  ::  imported-message provenance embeds the local canonical DM note id.
  =.  dm-imports.s
    %-  ~(run by dm-imports.s)
    |=(di=dm-import:noltbook ?.(=(note-id.di lose) di di(note-id win)))
  ::  if either reconciled shell was import-only, carry the marker to the winner.
  =.  import-only-dms.s
    =/  had=?  |((~(has in import-only-dms.s) lose) (~(has in import-only-dms.s) win))
    =/  clean  (~(del in (~(del in import-only-dms.s) lose)) win)
    ?:(had (~(put in clean) win) clean)
  s
::  ===== Phase 2 ordinary-DM %file origin-hosting helpers (outer core; pure) =====
::  dm-proto-vers: the single current ordinary-DM artifact protocol version.
++  dm-proto-vers  ^-(@ud 1)
::  parse-dm-file-meta: parse a Clay-backed %file metadata blob
::  {"storage":"clay","mime":..,"kind":..,"size":..} into a content-free dm-file-meta.
::  ~ unless it is a clay-backed descriptor (rejects inline dataUrl/mimeType blobs).
++  parse-dm-file-meta
  |=  content=@t
  ^-  (unit dm-file-meta:noltbook)
  =/  jon=(unit json)  (de:json:html content)
  ?~  jon  ~
  ?.  ?=([%o *] u.jon)  ~
  =/  obj  p.u.jon
  =/  st  (~(get by obj) 'storage')
  ?.  ?&(?=(^ st) ?=([%s *] u.st) =('clay' p.u.st))  ~
  =/  mj  (~(get by obj) 'mime')
  =/  kj  (~(get by obj) 'kind')
  =/  sj  (~(get by obj) 'size')
  =/  mime=@t  ?:(?&(?=(^ mj) ?=([%s *] u.mj)) p.u.mj 'application/octet-stream')
  =/  kind=@t  ?:(?&(?=(^ kj) ?=([%s *] u.kj)) p.u.kj 'file')
  =/  size=@ud  ?:(?&(?=(^ sj) ?=([%n *] u.sj)) (fall (rush p.u.sj dem) 0) 0)
  `[mime kind size]
::  dm-ref-of: build a content-free dm-artifact-ref from a creator-owned ordinary-DM
::  artifact (%file OR %app), the receiver's local canonical note id, and a content hash
::  (unit; ~ = unknown, used only during pure on-load migration when content must not be
::  read). eid = artifact.meta.eid or (sham [creator id]); rev = latest
::  artifact-version.version (never meta.rev). %file carries file-meta parsed from the clay
::  descriptor; %app carries file-meta=~ and NEVER the descriptor/data/version history.
::  %code is refused.
++  dm-ref-of
  |=  [a=artifact:noltbook lnid=@ta chash=(unit @uv)]
  ^-  (unit dm-artifact-ref:noltbook)
  ?~  versions.a  ~
  =/  lastv=artifact-version:noltbook  (rear versions.a)
  =/  eid=@uv  (dm-artifact-eid a)
  =/  rev=@ud  (dm-artifact-rev a)
  =/  created=@da  ?~(meta.a timestamp.lastv created.u.meta.a)
  =/  rte=(unit @uv)  ?~(meta.a ~ reply-to-eid.u.meta.a)
  ?:  =(%file type.a)
    =/  fm=(unit dm-file-meta:noltbook)  (parse-dm-file-meta content.lastv)
    ?~  fm  ~
    `[eid id.a creator.a lnid %file name.a rev chash fm created timestamp.lastv rte]
  ?:  =(%app type.a)
    `[eid id.a creator.a lnid %app name.a rev chash ~ created timestamp.lastv rte]
  ~
::  migrate-dm-artifacts: idempotent normalization. Convert every remote-owned
::  (creator != our) ordinary-DM %file OR %app artifact into a content-free reference
::  (content-hash=~; NO content read) and remove the full artifact from `artifacts`, so a
::  noncreator never holds an editable/serveable copy. Skips creator-owned, %code and
::  non-DM notes. Terminally-tombstoned eids are dropped, not referenced.
::  Re-runnable: once the full artifact is gone there is nothing left to convert.
::  upgrade-75-to-76: the ONLY migration. Identical field-for-field except that the
::  single active-calls map becomes the generation-bearing `calls` record plus an
::  empty lease map. A call in flight does NOT survive: every note that had one gets
::  a cleared record at generation 1 -- a real generation-bearing empty snapshot, so
::  the browser badge disappears on load and the next start allocates generation 2.
++  upgrade-75-to-76
  |=  o=state-75
  ^-  state-76
  =/  cleared=(map @ta call-snapshot:noltbook)
    %-  ~(gas by *(map @ta call-snapshot:noltbook))
    %+  turn  ~(tap by active-calls.o)
    |=  [nid=@ta *]
    [nid `call-snapshot:noltbook`[nid 1 ~]]
  :*  %76
      notes.o
      messages.o
      artifacts.o
      profiles.o
      transactions.o
      current-note.o
      peers.o
      has-avatar.o
      pal-outgoing.o
      pal-incoming.o
      pal-blocked.o
      blocked-by.o
      dial.o
      gossip-hops.o
      mentions.o
      cleared
      *(map @ta (map @p @da))
      gossip-envelopes.o
      headlines.o
      seq-counters.o
      join-requests.o
      note-admins.o
      note-muted.o
      artifact-envelopes.o
      host-status.o
      fork-origin.o
      fork-version.o
      fork-of.o
      pending-fork-invites.o
      fork-invitees.o
      contacts.o
      dm-prefs.o
      member-revs.o
      fork-parent-version.o
      host-checks.o
      notification-acks.o
      note-activity.o
      note-read.o
      attention.o
      cleared-mentions.o
      via-by-eid.o
      note-pins.o
      note-apps.o
      note-active.o
      app-grants.o
      note-unread-activity.o
      note-members.o
      app-notifications.o
      dm-artifact-refs.o
      dm-artifact-tombs.o
      dm-msg-tombs.o
      peer-proto.o
      pending-dm-fetches.o
      note-artifact-tombs.o
      mesh-tombs.o
      mesh-tomb-meta.o
      dm-imports.o
      import-only-dms.o
      pending-icon-fetches.o
      pending-img-writes.o
      pending-profile-lookups.o
  ==
++  migrate-dm-artifacts
  |=  [our=@p st=state-76]
  ^-  state-76
  =*  s  st
  =/  targets=(list [aid=@ta a=artifact:noltbook])
    %+  murn  ~(tap by artifacts.s)
    |=  [aid=@ta a=artifact:noltbook]
    ^-  (unit [@ta artifact:noltbook])
    ?.  ?|(=(%file type.a) =(%app type.a))  ~
    ?:  =(our creator.a)  ~
    =/  nt  (~(get by notes.s) note-id.a)
    ?~  nt  ~
    ?.  (is-ordinary-dm u.nt)  ~
    `[aid a]
  |-  ^-  state-76
  ?~  targets  s
  =/  a=artifact:noltbook  a.i.targets
  =/  eid=@uv  (dm-artifact-eid a)
  ::  drop the remote-owned full artifact regardless (never editable/serveable by us)
  =.  artifacts.s  (~(del by artifacts.s) aid.i.targets)
  ?:  (~(has by dm-artifact-tombs.s) eid)  $(targets t.targets)
  =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of a note-id.a ~)
  ?~  ref  $(targets t.targets)
  =?  dm-artifact-refs.s  !(~(has by dm-artifact-refs.s) eid)
    (~(put by dm-artifact-refs.s) eid u.ref)
  $(targets t.targets)
::  dm-refs-for-note: the (live) references attached to a note, for %dm-ref-list snapshots.
::  Refs are removed on tombstone, so the map holds only live entries.
++  dm-refs-for-note
  |=  [nid=@ta refs=(map @uv dm-artifact-ref:noltbook)]
  ^-  (list dm-artifact-ref:noltbook)
  %+  skim  ~(val by refs)
  |=(r=dm-artifact-ref:noltbook =(note-id.r nid))
::  flush-pending-for-eid: complete EVERY held HTTP request pending on `eid` with 404 and
::  drop it (used when a tombstone lands). Later content responses + timeout wakes for the
::  removed eyre-ids are then no-ops. Returns the 404 cards + the pruned pending map.
++  flush-pending-for-eid
  |=  [eid=@uv pend=(map @ta pending-dm-fetch:noltbook)]
  ^-  [(list card:agent:gall) (map @ta pending-dm-fetch:noltbook)]
  =/  hits=(list @ta)
    %+  murn  ~(tap by pend)
    |=([k=@ta p=pending-dm-fetch:noltbook] ?:(=(eid.p eid) `k ~))
  =/  cards=(list card:agent:gall)
    %-  zing
    %+  turn  hits
    |=(k=@ta (give-simple-payload:app:server k `simple-payload:http`[[404 ~] ~]))
  =/  pruned=(map @ta pending-dm-fetch:noltbook)  pend
  =.  pruned
    |-  ^-  (map @ta pending-dm-fetch:noltbook)
    ?~  hits  pruned
    $(hits t.hits, pruned (~(del by pruned) i.hits))
  [cards pruned]
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
::  ===== %file artifact byte-serving policy (preview vs download) =====
::  Applies ONLY to %file artifact bytes on the ordinary + DM routes, local or
::  ephemerally fetched. Never touches %app descriptors, /pkg plugin pages,
::  avatars, note icons or gossip images. Bytes are NEVER altered — only headers.
::  art-ct: mite -> 'type/subtype' cord.
++  art-ct
  |=  m=mite
  ^-  @t
  (rap 3 (join '/' m))
::  art-serve-class: how a declared type may be presented.
::    %raster/%media/%pdf — established safe inline previews, served as declared.
::    %svg   — still rendered, but under a no-script sandbox CSP.
::    %doc   — active or textual documents (html, js, xml, ...). NEVER served as the
::             declared type; downgraded to text/plain so navigating to the raw URL
::             cannot execute as a same-origin Noltbook page. The frontend doc/text
::             cards read these with fetch() + textContent, so excerpts are unchanged.
::    %other — unknown: octet-stream + attachment, so opening downloads.
++  art-serve-class
  |=  ct=@t
  ^-  ?(%raster %media %pdf %svg %doc %other)
  =/  s=tape  (cass (trip ct))
  ?:  =("image/svg+xml" s)     %svg
  ?:  =("image/svg" s)         %svg
  ?:  =("application/pdf" s)   %pdf
  ?:  =("image/" (scag 6 s))
    ::  allowlisted rasters only; any other image/* is unknown, not assumed safe.
    ?:  ?|  =("image/jpeg" s)  =("image/jpg" s)   =("image/png" s)
            =("image/gif" s)   =("image/webp" s)  =("image/bmp" s)
            =("image/avif" s)  =("image/x-icon" s)
            =("image/vnd.microsoft.icon" s)
        ==
      %raster
    %other
  ?:  |(=("audio/" (scag 6 s)) =("video/" (scag 6 s)))  %media
  ?:  =("text/" (scag 5 s))  %doc
  ?:  ?|  =("application/json" s)            =("application/xml" s)
          =("application/javascript" s)      =("application/x-javascript" s)
          =("application/ecmascript" s)      =("application/xhtml+xml" s)
          =("application/rss+xml" s)         =("application/atom+xml" s)
          =("application/xml-dtd" s)         =("application/x-httpd-php" s)
      ==
    %doc
  %other
::  art-serve-payload: build the response for %file bytes.
::  download=& always wins: original bytes, declared type, forced attachment.
::  Otherwise the class decides. nosniff is on EVERY response so a downgraded
::  content-type can never be re-sniffed back into an active document.
++  art-serve-payload
  |=  [m=mime fname=@t download=? cache=@t]
  ^-  simple-payload:http
  =/  ct=@t       (art-ct p.m)
  =/  ns=[@t @t]  ['x-content-type-options' 'nosniff']
  =/  cc=[@t @t]  ['cache-control' cache]
  =/  cd=[@t @t]
    ['content-disposition' (rap 3 ['attachment; filename="' fname '"' ~])]
  ?:  download
    [[200 ~[['content-type' ct] cc ns cd]] `q.m]
  =/  cls  (art-serve-class ct)
  ?-  cls
      %raster  [[200 ~[['content-type' ct] cc ns]] `q.m]
      %media   [[200 ~[['content-type' ct] cc ns]] `q.m]
      %pdf     [[200 ~[['content-type' ct] cc ns]] `q.m]
  ::
      %svg
    ::  visual preview preserved; the CSP sandbox blocks scripts, plugins and every
    ::  external load, so an embedded <script> cannot run even on direct navigation.
    :_  `q.m
    :-  200
    :~  ['content-type' 'image/svg+xml']
        cc  ns
        :-  'content-security-policy'
        'default-src \'none\'; style-src \'unsafe-inline\'; img-src data:; sandbox'
    ==
  ::
      %doc
    [[200 ~[['content-type' 'text/plain; charset=utf-8'] cc ns]] `q.m]
  ::
      %other
    [[200 ~[['content-type' 'application/octet-stream'] cc ns cd]] `q.m]
  ==
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
::  host-self: is a stored message a GENUINE host self-post? True exactly when the @p
::  author is us; a remote @p author is never host-self.
++  host-self
  |=  [author=@p our=@p]
  ^-  ?
  =(author our)
::  add-reply-attn: if the immediate parent owner is our ship and the reply is NOT a
::  host self-post (sender-self), append a %reply attention item (the NEW reply is the
::  target) and return [updated-attention live-delta-cards]. Dedups by eid > msg-id >
::  aid.
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
::  ===== artifact byte storage abstraction =====
::  Artifact (%file/image) bytes live on the CREATOR ship in a SEPARATE, non-running Clay
::  desk — NOT the live %noltbook desk — so a %c %info commit never goads/reloads the billed
::  %noltbook agent (the Kelvin-408 write-to-live-desk stall). The desk name and Clay layout
::  are encapsulated ENTIRELY here: no sur/mark/frontend/shared reference knows them, so this
::  backend can later be swapped for S3 or an Urbit-native blob service without touching the
::  browser endpoints (/apps/noltbook/artifact/<aid>, /apps/noltbook/dm-artifact/<eid>).
::  Avatars, note icons, %app packages, and the served frontend stay on q.byk.bowl (unchanged).
::  Provisioning invariant: %noltbook-data must be a SEPARATE, DEAD (suspended, no desk.bill)
::  desk and must be UNMOUNTED after provisioning — it holds bytes only, never runs an agent,
::  and needs no Unix mirror. See setup note in the upload handler.
++  art-store-desk  `desk`%noltbook-data
::  file spur WITHIN the data desk: /artifacts/<aid>/mime (mark = mime).
++  art-store-spur
  |=  aid=@ta
  ^-  path
  /artifacts/[aid]/mime
::  full Clay beam-tail for scrying an artifact's bytes in the data desk.
++  art-store-path
  |=  [our=@p now=@da aid=@ta]
  ^-  path
  (weld ~[(scot %p our) art-store-desk (scot %da now)] (art-store-spur aid))
::  is the data desk provisioned + ready on this ship? Two checks, both must pass, else the
::  caller fails safe (upload rejected; read yields ~) and NEVER touches the live %noltbook
::  desk. (1) %cd desk-list membership (a %cy root scry is NOT a valid existence test — Clay
::  returns an empty arch for a nonexistent desk; follows base/lib/hood/kiln.hoon). (2) %cu
::  readiness for the files required to store/read %mime cages: /sys/kelvin and /mar/mime/hoon.
++  art-store-exists
  |=  [our=@p now=@da]
  ^-  ?
  =/  desks-res
    (mule |.(.^((set desk) %cd ~[(scot %p our) %$ (scot %da now)])))
  ?.  ?=(%& -.desks-res)  %.n
  ?.  (~(has in p.desks-res) art-store-desk)  %.n
  =/  kel=path  ~[(scot %p our) art-store-desk (scot %da now) %sys %kelvin]
  =/  mim=path  ~[(scot %p our) art-store-desk (scot %da now) %mar %mime %hoon]
  =/  ready-res  (mule |.(&(.^(? %cu kel) .^(? %cu mim))))
  ?:(?=(%| -.ready-res) %.n p.ready-res)
::  read an artifact's current bytes from the data desk; ~ on any failure. Nonblocking for a
::  missing file: %cu existence FIRST, and only then the typed %cx. Never reads
::  /lib/noltbook/artifacts or q.byk.bowl, and never falls back to the old live-desk path.
++  art-store-read
  |=  [our=@p now=@da aid=@ta]
  ^-  (unit mime)
  =/  fpath=path  (art-store-path our now aid)
  =/  ex-res  (mule |.(.^(? %cu fpath)))
  ?.  ?=(%& -.ex-res)  ~
  ?.  p.ex-res  ~
  =/  res  (mule |.(.^(mime %cx fpath)))
  ?:(?=(%| -.res) ~ `p.res)
::  build the %c %info card that writes an artifact's bytes to the data desk (never to
::  q.byk.bowl). Callers MUST gate on art-store-exists first so a missing desk fails safe.
++  art-store-write-card
  |=  [wire=path aid=@ta m=mime]
  ^-  card
  =/  art-cage=cage  [%mime !>(m)]
  =/  nori  [%& ~[[(art-store-spur aid) [%ins art-cage]]]]
  [%pass wire %arvo %c %info art-store-desk nori]
::  ===== data-desk-first image reads (storage migration step 1: READS ONLY) =====
::  Uploads still write to the live %noltbook desk in this segment. These readers try
::  the migrated %noltbook-data location FIRST and fall back to the legacy live-desk
::  path, so images written before the move keep serving with no migration step.
::  Data-desk spurs: /avatar/mime and /icons/<nid>/mime.
::  Legacy spur:     /lib/noltbook/avatar/mime (profile picture only). Note icons have
::  NO legacy fallback -- they are read from %noltbook-data exclusively.
::  clay-read-mime: mule-guarded read of ONE Clay file. %cu existence check FIRST so an
::  absent file answers ~ rather than blocking; the typed %cx runs only once the file is
::  known present. Never writes, copies, migrates or deletes.
++  clay-read-mime
  |=  fpath=path
  ^-  (unit mime)
  =/  ex-res  (mule |.(.^(? %cu fpath)))
  ?.  ?=(%& -.ex-res)  ~
  ?.  p.ex-res  ~
  =/  res  (mule |.(.^(mime %cx fpath)))
  ?:(?=(%| -.res) ~ `p.res)
::  avatar-read: this ship's own profile picture, data desk first then legacy.
::  The data-desk probe is gated on art-store-exists so a not-yet-provisioned desk
::  can never block the (unauthenticated) avatar routes.
++  avatar-read
  |=  [our=@p now=@da live=@tas]
  ^-  (unit mime)
  =/  d=(unit mime)
    ?.  (art-store-exists our now)  ~
    (clay-read-mime ~[(scot %p our) art-store-desk (scot %da now) %avatar %mime])
  ?^  d  d
  (clay-read-mime ~[(scot %p our) live (scot %da now) %lib %noltbook %avatar %mime])
::  icon-read: a note icon this ship hosts. %noltbook-data ONLY -- note icons have no
::  legacy fallback (deliberately dropped; the profile-picture fallback is unaffected).
++  icon-read
  |=  [our=@p now=@da nid=@ta]
  ^-  (unit mime)
  ?.  (art-store-exists our now)  ~
  (clay-read-mime ~[(scot %p our) art-store-desk (scot %da now) %icons nid %mime])
::  note-icon-pointer: the ONLY icon-url value that denotes an internally uploaded
::  note icon. Both the host and the member require an exact match, so an external or
::  malformed pointer can never trigger a byte fetch.
++  note-icon-pointer
  |=  nid=@ta
  ^-  @t
  (crip (weld "/apps/noltbook/icon/" (trip nid)))
++  note-icon-is-internal
  |=  [nid=@ta iu=(unit @t)]
  ^-  ?
  ?~  iu  |
  =(u.iu (note-icon-pointer nid))
::  ===== data-desk image WRITES (storage migration step 2) =====
::  New profile-picture and note-icon bytes go to %noltbook-data, never to the live
::  %noltbook desk. Callers MUST gate on art-store-exists first so a missing or
::  incomplete data desk fails safe (503) instead of falling back to the live desk.
::  Legacy live-desk files are never copied, modified or deleted; the readers added in
::  step 1 keep serving them.
::  avatar-data-spur / icon-data-spur: file spurs WITHIN the data desk.
++  avatar-data-spur  `path`/avatar/mime
++  icon-data-spur
  |=  nid=@ta
  ^-  path
  /icons/[nid]/mime
::  data-file-exists: does this exact file already exist? mule-guarded %cu, so an
::  absent file, a read failure, or an unbuilt subtree all answer %.n (-> %ins).
++  data-file-exists
  |=  fpath=path
  ^-  ?
  =/  res  (mule |.(.^(? %cu fpath)))
  ?:(?=(%| -.res) %.n p.res)
::  data-write-mime-card: the %c %info card writing a mime cage into art-store-desk at
::  `spur`. %mut iff that exact DATA-DESK file already exists, else %ins -- decided
::  purely from Clay on the data-desk path, never from has-avatar, icon-url, or whether
::  a legacy live-desk file happens to exist.
++  data-write-mime-card
  |=  [our=@p now=@da wire=path spur=path m=mime]
  ^-  card
  =/  fpath=path  (weld ~[(scot %p our) art-store-desk (scot %da now)] spur)
  =/  cag=cage  [%mime !>(m)]
  =/  miso  ?:((data-file-exists fpath) [%mut cag] [%ins cag])
  [%pass wire %arvo %c %info art-store-desk [%& ~[[spur miso]]]]
::  art-store-del-cards: physically remove ONE artifact's bytes from %noltbook-data.
::  Scope is exactly /artifacts/<aid>/mime in the data desk -- never the live %noltbook
::  desk, never any other path. Callers must already have established that WE own the
::  bytes (we are the artifact creator) and that the deletion is authoritative.
::  Returns ~ (a safe no-op) when the data desk is not ready or the file is already
::  absent, so a duplicate, replayed or late deletion costs nothing.
::  %c %info does not acknowledge (clay.hoon emits %mere only from the merge core), so a
::  next-event Behn wake re-scries and logs if the removal did not take. Cleanup is
::  best-effort by design: the semantic deletion and its tombstone are already
::  authoritative, and no HTTP request or UI ever waits on this.
++  art-store-del-cards
  |=  [our=@p now=@da aid=@ta]
  ^-  (list card)
  ?.  (art-store-exists our now)  ~
  ?.  (data-file-exists (art-store-path our now aid))  ~
  :~  :*  %pass  /art-del/[aid]  %arvo  %c  %info
          art-store-desk  [%& ~[[(art-store-spur aid) [%del ~]]]]
      ==
      [%pass /art-del-verify/[aid] %arvo %b %wait +(now)]
  ==
::  icon-store-del-cards: physically remove ONE note icon's bytes from %noltbook-data.
::  Scope is exactly /icons/<nid>/mime in the data desk -- never the live %noltbook desk,
::  never any other path. Mirrors art-store-del-cards: readiness + existence are checked
::  first, so a missing desk or an already-absent file is a harmless no-op and a repeat
::  costs nothing. %c %info does not acknowledge (clay.hoon emits %mere only from the
::  merge core), so a next-event Behn wake re-scries and logs. Best-effort by design:
::  nothing user-visible ever waits on it.
::
::  FUTURE(cleanup-scope): this helper has NO call site yet. Its first consumer will be
::  %delete-note, and that consumer will deliberately be limited to a subtree proven to
::  be ENTIRELY: locally owned (creator == our.bowl), %notebook, %secret, self-only
::  (users == {our.bowl}), unremoved, non-forked
::  (no fork-of / fork-origin / fork-version / fork-parent-version / fork-invitees /
::  pending-fork-invites row) and not host-deleted (no host-status row).
::  Those exclusions are CONSERVATIVE RELEASE SAFETY BOUNDARIES, not permanent product
::  limitations. Cleaning up more aggressively would first require separately defining
::  ownership and retention rules for shared descendants, forks, retained copies,
::  host-deleted archives, foreign-created artifacts and %leave-note. Those conditions
::  interlock: review and relax them AS A GROUP, never one at a time.
++  icon-store-del-cards
  |=  [our=@p now=@da nid=@ta]
  ^-  (list card)
  ?.  (art-store-exists our now)  ~
  ?.  (data-file-exists ~[(scot %p our) art-store-desk (scot %da now) %icons nid %mime])  ~
  :~  :*  %pass  /icon-del/[nid]  %arvo  %c  %info
          art-store-desk  [%& ~[[(icon-data-spur nid) [%del ~]]]]
      ==
      [%pass /icon-del-verify/[nid] %arvo %b %wait +(now)]
  ==
::  notebook-subtree-private: is EVERY note in a proposed deletion subtree strictly
::  local and unshared, so its locally stored bytes are safe to remove? PURE -- returns
::  only ?, emits no cards, performs no scries, mutates no state, logs nothing. Every
::  missing or malformed row fails CLOSED (%.n).
::  Eligibility is deliberately ALL-OR-NOTHING over the complete root+descendants list:
::  one ineligible note disqualifies the entire subtree and we never clean up "the safe
::  half". The %notebook type is already a strong structural invariant (sharing and
::  publishing convert to %group, %group never demotes back, and %fork-note requires
::  %group) -- but every other condition is kept as explicit defense in depth rather
::  than relying on that. See FUTURE(cleanup-scope) above for why these exclusions are
::  a group and must be relaxed together, never individually.
++  notebook-subtree-private
  |=  [our=@p ids=(list @ta) st=state-76]
  ^-  ?
  ::  an empty subtree proves nothing.
  ?~  ids  %.n
  ::  Fork lineage can name a note in a VALUE as well as in a key, so gather every note
  ::  id mentioned ANYWHERE in the fork structures and treat all of them as
  ::  disqualifying. Keys: all six maps. Values: fork-of carries the source nid, and a
  ::  pending invite carries both root-id and source-root-id. fork-origin (@uv),
  ::  fork-version / fork-parent-version (@ud) and fork-invitees ((set @p)) hold no note
  ::  ids in their values, so keys alone suffice for those three.
  =/  fork-touched=(set @ta)
    ::  value-side note ids, gathered into fresh sets and then unioned in (a
    ::  ~(rep by) accumulator starts from its own bunt, never from an outer face).
    =/  of-vals=(set @ta)
      %-  ~(rep by fork-of.st)
      |=  [[k=@ta v=[host=@p nid=@ta]] a=(set @ta)]
      ^-  (set @ta)
      (~(put in a) nid.v)
    =/  inv-vals=(set @ta)
      %-  ~(rep by pending-fork-invites.st)
      |=  [[k=@ta v=pending-fork-invite:noltbook] a=(set @ta)]
      ^-  (set @ta)
      (~(put in (~(put in a) root-id.v)) source-root-id.v)
    ::  keys of all six fork maps, plus the value-side ids above.
    =/  s=(set @ta)  ~(key by fork-of.st)
    =.  s  (~(uni in s) ~(key by fork-origin.st))
    =.  s  (~(uni in s) ~(key by fork-version.st))
    =.  s  (~(uni in s) ~(key by fork-parent-version.st))
    =.  s  (~(uni in s) ~(key by fork-invitees.st))
    =.  s  (~(uni in s) ~(key by pending-fork-invites.st))
    =.  s  (~(uni in s) of-vals)
    (~(uni in s) inv-vals)
  ::  every id must satisfy every condition. levy is a pure conjunction, so a repeated
  ::  id is evaluated identically each time and duplicates are harmless by construction.
  ::  cast back to (list @ta): the ?~ above narrows ids to a lest, and levy's wet
  ::  recursion cannot nest a possibly-empty tail into a lest sample.
  %+  levy  `(list @ta)`ids
  |=  nid=@ta
  ^-  ?
  =/  nt  (~(get by notes.st) nid)
  ::  a missing note is unprovable, so it fails closed.
  ?~  nt  %.n
  ?&  =(%notebook type.u.nt)
      =(our creator.u.nt)
      =(%secret visibility.u.nt)
      =(1 ~(wyt in users.u.nt))
      (~(has in users.u.nt) our)
      =(~ removed.u.nt)
      !(~(has by host-status.st) nid)
      !(~(has in fork-touched) nid)
  ==
::  ensure-data-desk: self-provision the local artifact-byte desk on first install/load.
::  Mirrors the shipped |new-desk seed construction, adding %mime for artifact cages.
::  The desk has no desk.bill, runs no agent, is not mounted, and has no remote sync.
::  An existing desk is never recreated or overwritten; art-store-exists remains the
::  fail-safe readiness check if an existing desk is incomplete.
::  build-stamp: read the build marker out of the index.html this ship actually serves.
::  Reading the served file rather than a side-file means the two can never disagree.
::  The marker lives in <head>, so a short prefix is scanned -- never the whole ~700KB.
++  build-stamp
  |=  =bowl:gall
  ^-  @t
  =/  pax=path
    :*  (scot %p our.bowl)
        q.byk.bowl
        (scot %da now.bowl)
        /lib/noltbook/index/html
    ==
  ?.  .^(? %cu pax)  ''
  =/  head=tape  (scag 600 (trip .^(@t %cx pax)))
  =/  key=tape   "nb-build\" content=\""
  =/  i  (find key head)
  ?~  i  ''
  (crip (scag 10 (slag (add u.i (lent key)) head)))
++  ensure-data-desk
  |=  =bowl:gall
  ^-  (list card)
  =/  desks=(set desk)
    .^((set desk) %cd ~[(scot %p our.bowl) %$ (scot %da now.bowl)])
  ?:  (~(has in desks) art-store-desk)  ~
  =/  seeds=(list path)
    :~  /mar/noun/hoon
        /mar/hoon/hoon
        /mar/txt/hoon
        /mar/kelvin/hoon
        /mar/mime/hoon
        /sys/kelvin
    ==
  =/  files=(map path page:clay)
    %-  ~(gas by *(map path page:clay))
    %+  turn  seeds
    |=  =path
    ^-  [^path page:clay]
    :-  path
    :-  (rear path)
    .^  *
      %cx
      (scot %p our.bowl)
      q.byk.bowl
      (scot %da now.bowl)
      path
    ==
  ~[[%pass /data-desk-create %arvo (new-desk:cloy art-store-desk ~ files)]]
::  ===== cover/ordinary-gossip hostless deletion helpers =====
::  is-mesh-note: a %cover or ordinary %gossip note (the hostless envelope meshes) whose
::  entries are origin-authoritative. EXCLUDES %ars-rumors (anonymous; out of scope) and
::  every hosted type (%group/%notebook/%dm — those have their own deletion authority).
++  is-mesh-note
  |=  [nid=@ta nt=note:noltbook]
  ^-  ?
  ?&  ?|(?=(%cover type.nt) ?=(%gossip type.nt))
      !=(%ars-rumors nid)
  ==
::  mesh-delete-targets: the peers a deletion must reach, matching the EXACT envelope route
::  the entry used, keyed on kind (is-art). Text (cover AND gossip) rode pal-incoming; a
::  cover artifact rode pal-outgoing; a gossip artifact rode note.users. Always excludes self.
++  mesh-delete-targets
  |=  [nt=note:noltbook is-art=? our=@p pin=(set @p) pout=(set @p)]
  ^-  (list @p)
  =/  raw=(set @p)
    ?.  is-art  pin
    ?:(?=(%cover type.nt) pout users.nt)
  (skip ~(tap in raw) |=(p=@p =(p our)))
::  recompute-mesh-note: after a cover/gossip deletion, set the note's last-author/last-preview
::  to the NEWEST remaining locally-available entry (text message / artifact envelope / text
::  envelope), or clear BOTH atomically if none remain — never leaving deleted content as the
::  preview. Cover is pinned (its sidebar preview is frontend-derived), so it is returned
::  unchanged. A remaining text envelope with no persisted text gets a neutral preview.
++  recompute-mesh-note
  |=  $:  nt=note:noltbook
          msgs=(list message:noltbook)
          tenvs=(map @da envelope:noltbook)
          aenvs=(map @ta artifact-envelope:noltbook)
      ==
  ^-  note:noltbook
  ?:  ?=(%cover type.nt)  nt
  =/  cands=(list [when=@da author=@p preview=@t])
    ;:  weld
      (turn msgs |=(m=message:noltbook [timestamp.m author.m text.m]))
      (turn ~(val by aenvs) |=(e=artifact-envelope:noltbook [timestamp.e author.e (art-env-preview e)]))
      (turn ~(val by tenvs) |=(e=envelope:noltbook [timestamp.e author.e 'shared a post']))
    ==
  ?~  cands  nt(last-author ~, last-preview ~)
  =/  best=[when=@da author=@p preview=@t]
    %+  roll  t.cands
    |=  [c=[when=@da author=@p preview=@t] acc=_i.cands]
    ?:((gth when.c when.acc) c acc)
  nt(last-author `author.best, last-preview `preview.best)
::  mesh-{text,art}-tombed: canonical replay guard. The origin's mesh-tomb-meta record (NEVER
::  the bare mesh-tombs set) must EXACTLY match this incoming entry to block it. A tomb for a
::  different author/note/kind/msg-id/aid, or a state-69 bare-set eid with no canonical record,
::  never blocks a legitimate entry.
++  mesh-text-tombed
  |=  [meta=(map @uv mesh-tomb:noltbook) eid=@uv nid=@ta author=@p mid=@da]
  ^-  ?
  =/  rec  (~(get by meta) eid)
  ?~  rec  %.n
  ?&  ?=(%text kind.u.rec)
      =(note-id.u.rec nid)
      =(author.u.rec author)
      =(msg-id.u.rec `mid)
  ==
++  mesh-art-tombed
  |=  [meta=(map @uv mesh-tomb:noltbook) eid=@uv nid=@ta author=@p aid=@ta]
  ^-  ?
  =/  rec  (~(get by meta) eid)
  ?~  rec  %.n
  ?&  ?=(%artifact kind.u.rec)
      =(note-id.u.rec nid)
      =(author.u.rec author)
      =(aid.u.rec `aid)
  ==
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
++  icon-url-cap     ^-(@ud 2.048)
++  gossip-icon-cap  ^-(@ud 71.680)
::  icon-url-ok: does this value fit the cap? Both ~ and '' pass.
++  icon-url-ok
  |=  [iu=(unit @t) cap=@ud]
  ^-  ?
  ?~  iu  &
  (lte (met 3 u.iu) cap)
::  clamp-icon-url: drop an oversized icon but KEEP the note. Used on receive paths,
::  where discarding one image beats refusing the whole gossip note.
++  clamp-icon-url
  |=  [iu=(unit @t) cap=@ud]
  ^-  (unit @t)
  ?:  (icon-url-ok iu cap)  iu
  ~
::  sanitize-note-icon: bound the icon reference on a COMPLETE note record arriving
::  from the network. Several handlers receive a whole note and store it directly,
::  bypassing the action/API gates. Gossip notes carry the embedded image, so they get
::  the larger cap; every other type gets the ordinary pointer cap. ONLY icon-url is
::  touched -- every other field is preserved exactly, and an oversized icon never
::  causes the note itself to be rejected. Remote ships never ship image BYTES through
::  these fields; this bounds the reference text only.
++  sanitize-note-icon
  |=  n=note:noltbook
  ^-  note:noltbook
  =/  cap=@ud  ?:(=(%gossip type.n) gossip-icon-cap icon-url-cap)
  n(icon-url (clamp-icon-url icon-url.n cap))
::  ===== uploaded-image signature validation =====
::  Identify a locally uploaded image by its ACTUAL leading bytes. The request's
::  Content-Type is caller-controlled and is NOT evidence of the real format, so it
::  is no longer consulted for avatar / note-icon uploads. The stored
::  mime is derived from the signature that matched. Applies to uploaded BYTES only:
::  external image URLs, file/image artifacts and gossip images are untouched here.
::  image-byte-at: byte i of an octs, 0 = FIRST byte of the file (atoms are
::  little-endian, so the leading file byte is the least significant). Out-of-range
::  reads answer 0 instead of crashing, so truncated bodies are safe to probe.
++  image-byte-at
  |=  [b=octs i=@ud]
  ^-  @
  ?:  (gte i p.b)  0
  (cut 3 [i 1] q.b)
::  image-sig-mite: allowed-format signature gate. ~ for empty, truncated,
::  malformed or unknown bytes; the caller answers 400. Total — never crashes.
++  image-sig-mite
  |=  b=octs
  ^-  (unit (list @ta))
  =/  at  |=(i=@ud (image-byte-at b i))
  ::  every allowed signature is at least 3 bytes; shorter bodies cannot match.
  ?:  (lth p.b 3)  ~
  ::  JPEG: FF D8 FF
  ?:  ?&  =(0xff (at 0))  =(0xd8 (at 1))  =(0xff (at 2))
      ==
    `/image/jpeg
  ::  PNG: 89 50 4E 47 0D 0A 1A 0A
  ?:  ?&  (gte p.b 8)
          =(0x89 (at 0))  =(0x50 (at 1))  =(0x4e (at 2))  =(0x47 (at 3))
          =(0xd (at 4))   =(0xa (at 5))   =(0x1a (at 6))   =(0xa (at 7))
      ==
    `/image/png
  ::  GIF: "GIF87a" or "GIF89a"
  ?:  ?&  (gte p.b 6)
          =('G' (at 0))  =('I' (at 1))  =('F' (at 2))  =('8' (at 3))
          |(=('7' (at 4)) =('9' (at 4)))
          =('a' (at 5))
      ==
    `/image/gif
  ::  WebP: "RIFF" <4 length bytes> "WEBP"
  ?:  ?&  (gte p.b 12)
          =('R' (at 0))  =('I' (at 1))  =('F' (at 2))   =('F' (at 3))
          =('W' (at 8))  =('E' (at 9))  =('B' (at 10))  =('P' (at 11))
      ==
    `/image/webp
  ~
::  SUPERSEDED by image-sig-mite; no callers remain. Content-Type is caller-
::  controlled and is not evidence of format. Do not re-wire to an upload path.
::  mite-of-header: derive the stored image mime from the upload's Content-Type
::  header (browsers set it to the file's real type). Splits "image/png" into a
::  proper mite so PNG/GIF/WebP aren't mislabeled jpeg. Falls back to image/jpeg.
++  mite-of-header
  |=  headers=(list [key=@t value=@t])
  ^-  (list @ta)
  =/  ct=(unit @t)  (~(get by (malt headers)) 'content-type')
  ?~  ct  /image/jpeg
  =/  ct-tape=tape  (trip u.ct)
  =/  semi=(unit @ud)  (find ";" ct-tape)
  =/  clean=tape  ?~(semi ct-tape (scag u.semi ct-tape))
  =/  slash=(unit @ud)  (find "/" clean)
  ?~  slash  /image/jpeg
  =/  major=@ta  (crip (scag u.slash clean))
  =/  minor=@ta  (crip (slag +(u.slash) clean))
  ?:  |(=(0 (met 3 major)) =(0 (met 3 minor)))  /image/jpeg
  ~[major minor]
::  SUPERSEDED by image-sig-mite; no callers remain. Header-only, no magic bytes.
::  Do not re-wire to an upload path.
::  user-avatar-mite: MIME gate for avatar image uploads (user PFP).
::  Accepts jpeg/png/gif/webp. Missing Content-Type -> image/jpeg fallback (keeps the
::  browser File-upload flow working; lower-risk than rejecting). Present-but-not-an-
::  allowed-image -> ~ (the caller returns 400). Header-only (no magic-byte sniffing).
++  user-avatar-mite
  |=  headers=(list [key=@t value=@t])
  ^-  (unit (list @ta))
  =/  ct=(unit @t)  (~(get by (malt headers)) 'content-type')
  ?~  ct  `/image/jpeg
  =/  ct-tape=tape  (trip u.ct)
  =/  semi=(unit @ud)  (find ";" ct-tape)
  =/  clean=@t  (crip ?~(semi ct-tape (scag u.semi ct-tape)))
  ?:  =('image/jpeg' clean)  `/image/jpeg
  ?:  =('image/png' clean)   `/image/png
  ?:  =('image/gif' clean)   `/image/gif
  ?:  =('image/webp' clean)  `/image/webp
  ~
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
::  wallet-id-clean: an opaque transaction identifier must carry no ASCII control
::  characters -- it is rendered (escaped) in the client, and a control byte would
::  corrupt the row. Format-agnostic otherwise: we never assume hex or base58.
++  wallet-id-clean
  |=  t=@t
  ^-  ?
  =/  b=(list @)  (rip 3 t)
  |-
  ?~  b  %.y
  ?:  |((lth i.b 0x20) =(i.b 0x7f))  %.n
  $(b t.b)
::  wallet-retain: ROLLING retention for an incoming %received row.
::  Newest-first. Keeps at most 25 %received rows per counterparty: when a 26th
::  arrives, that same sender's OLDEST received row is dropped -- never a %sent row,
::  never another sender's row -- and the new one is kept. Future rows are therefore
::  never rejected for being over the cap. The overall newest-100 cap is applied last.
++  wallet-retain
  |=  [new=transaction:noltbook old=(list transaction:noltbook) who=@p]
  ^-  (list transaction:noltbook)
  =/  cp=@t  (scot %p who)
  =|  kept=(list transaction:noltbook)
  =/  seen=@ud  0
  =/  walk=(list transaction:noltbook)  [new old]
  |-
  ?~  walk  (scag 100 (flop kept))
  ?.  &(=(%received type.i.walk) =(cp counterparty.i.walk))
    $(walk t.walk, kept [i.walk kept])
  ?:  (gte seen 25)  $(walk t.walk)
  $(walk t.walk, kept [i.walk kept], seen +(seen))
::  ===== CALL STATE: host-authoritative, generation-ordered =====
::  Every ship stores exactly one call-snapshot per note it knows about, including
::  EMPTY ones, so a cleared call keeps its generation. Only the note creator writes a
::  snapshot; members send requests and apply what the host returns.
::
::  Timing. The lease must survive ordinary Ames latency and a browser tab that is
::  briefly throttled, so it is generous: a participant is dropped only after four
::  missed heartbeats.
++  call-hb-interval  ~s20        ::  frontend heartbeat cadence while joined
++  call-lease-ttl    ~m2         ::  participant deadline granted per heartbeat
::  call-eligible: the note kinds that may host a call. Mirrors the frontend's
::  noteSupportsCalls() exactly -- cover, %Rumors, gossip and notebooks never call.
++  call-eligible
  |=  [nid=@ta nt=note:noltbook]
  ^-  ?
  ?:  =(nid %cover)  %.n
  ?:  =(nid %ars-rumors)  %.n
  ?:  ?=(%gossip type.nt)  %.n
  ?:  ?=(%notebook type.nt)  %.n
  %.y
::  norm-snap: an active call with no participants, or one already marked %ended, is
::  not a call. Normalising here is what makes "zero participants but still active"
::  unrepresentable rather than merely unlikely.
++  norm-snap
  |=  snap=call-snapshot:noltbook
  ^-  call-snapshot:noltbook
  ?~  call.snap  snap
  ?:  ?=(%ended status.u.call.snap)  snap(call ~)
  ?:  =(0 ~(wyt in participants.u.call.snap))  snap(call ~)
  snap
::  snap-dominates: may `inc` replace `cur`? This is the ONLY ordering rule, and it is
::  strict: `gen` is a per-note revision counter that the host advances on every change
::  it authors, so a STRICTLY higher revision replaces, and anything less than or equal
::  is a duplicate or a straggler and is ignored outright. That single comparison covers
::  an old active after a newer leave, an old active after a newer end, an old end after
::  a newer call started, and plain duplicate delivery -- no payload inspection needed.
++  snap-dominates
  |=  [inc=call-snapshot:noltbook cur=(unit call-snapshot:noltbook)]
  ^-  ?
  ?~  cur  %.y
  (gth gen.inc gen.u.cur)
::  call-gen: the highest generation we hold for a note (0 = never seen a call).
++  call-gen
  |=  [cm=(map @ta call-snapshot:noltbook) nid=@ta]
  ^-  @ud
  =/  c  (~(get by cm) nid)
  ?~  c  0
  gen.u.c
::  call-snap-wire: carries note, generation and attempt so a poke-ack failure can be
::  retried a bounded number of times and a stale ack can be recognised.
++  call-snap-wire
  |=  [who=@p nid=@ta gen=@ud try=@ud]
  ^-  wire
  /call-snap/(scot %p who)/[nid]/(scot %ud gen)/(scot %ud try)
::  call-snap-cards: host -> every current note member (participants and not, because
::  the sidebar badge is note-visible state). One authoritative payload, no deltas.
++  call-snap-cards
  |=  [to=(set @p) snap=call-snapshot:noltbook our=@p]
  ^-  (list card)
  %+  murn  ~(tap in to)
  |=  p=@p
  ?:  =(p our)  ~
  :-  ~
  %^    rpoke
      (call-snap-wire p note-id.snap gen.snap 1)
    p
  `remote:noltbook`[%remote-call-snap snap]
::  call-local-cards: the same snapshot to our own frontend, on both subscription paths.
++  call-local-cards
  |=  snap=call-snapshot:noltbook
  ^-  (list card)
  =/  upd=update:noltbook  [%call-snap snap]
  ~[(gf-paths ~[/notes/[note-id.snap]] upd) (gf-notes upd)]
::  lease-wake: a behn wake carrying note, CALL ID, participant and deadline. All four
::  are re-checked on wake, so a wake left over from a renewed heartbeat, an ended call,
::  a different call or a participant who already left is a silent no-op, and nothing is
::  ever cancelled.
::
::  It is keyed on call-id, NOT on the snapshot revision. The revision advances every
::  time the host changes the participant set, so a revision-keyed wake would be
::  invalidated by somebody else's join or leave -- leaving a crashed participant with no
::  live timer at all, since a crashed browser sends no further heartbeat to arm a new
::  one. call-id is stable for the whole life of one call, which is exactly the scope a
::  lease belongs to.
++  lease-wake
  |=  [nid=@ta cid=@ta who=@p at=@da]
  ^-  card
  :^  %pass  /call-lease/[nid]/[cid]/(scot %p who)/(scot %da at)
    %arvo
  [%b %wait at]
::  put-lease: refresh one participant's deadline and arm its wake.
++  put-lease
  |=  [lm=(map @ta (map @p @da)) nid=@ta who=@p at=@da]
  ^-  (map @ta (map @p @da))
  =/  cur  (fall (~(get by lm) nid) *(map @p @da))
  (~(put by lm) nid (~(put by cur) who at))
++  del-lease
  |=  [lm=(map @ta (map @p @da)) nid=@ta who=@p]
  ^-  (map @ta (map @p @da))
  =/  cur  (fall (~(get by lm) nid) *(map @p @da))
  =/  nxt  (~(del by cur) who)
  ?:  =(~ nxt)  (~(del by lm) nid)
  (~(put by lm) nid nxt)
++  prune-call-leases
  |=  [ids=(list @ta) lm=(map @ta (map @p @da))]
  ^-  (map @ta (map @p @da))
  =/  acc  lm
  |-
  ?~  ids  acc
  $(ids t.ids, acc (~(del by acc) i.ids))
::  visible-call-snaps: the call records for notes this subscriber can see. Sent as ONE
::  %call-list replacement rather than a fact per note; empty records travel too, so the
::  frontend inherits our revisions and can reject a stale fact after hydration.
++  visible-call-snaps
  |=  [cm=(map @ta call-snapshot:noltbook) vis=(set @ta)]
  ^-  (list call-snapshot:noltbook)
  %+  murn  ~(tap by cm)
  |=  [nid=@ta snap=call-snapshot:noltbook]
  ^-  (unit call-snapshot:noltbook)
  ?.  (~(has in vis) nid)  ~
  `snap
::  call-sys-msg: the hidden \01SYS:call-* marker. Written by the HOST only, so every
::  ship's transcript agrees. The frontend filters these; see isCallControl().
++  call-sys-msg
  |=  [now=@da nid=@ta who=@p txt=@t]
  ^-  message:noltbook
  [now nid who txt now ~ %.n ~]
::  is-call-marker: the four hidden call-control markers, and ONLY those. Deliberately
::  narrow, exactly like isCallControl() in the frontend: \01SYS:host-delete and
::  \01SYS:art-delete are real system messages and keep their existing behaviour.
++  is-call-marker
  |=  t=@t
  ^-  ?
  =/  s=tape  (trip t)
  ?:  =("\01SYS:call-ended" s)  %.y
  %+  lien
    ^-  (list tape)
    :~  "\01SYS:call-started:"
        "\01SYS:call-joined:"
        "\01SYS:call-left:"
    ==
  |=(pfx=tape =(pfx (scag (lent pfx) s)))
++  call-started-txt
  |=  who=@p  ^-  @t
  (crip (weld "\01SYS:call-started:" (trip (scot %p who))))
++  call-joined-txt
  |=  who=@p  ^-  @t
  (crip (weld "\01SYS:call-joined:" (trip (scot %p who))))
++  call-left-txt
  |=  who=@p  ^-  @t
  (crip (weld "\01SYS:call-left:" (trip (scot %p who))))
::  call-sync-cards: ask every remote host for the current state of the notes it owns.
::  One poke per HOST, not per note. Repairs a missed ending after downtime.
::  host-start-snap: the host authors the generation, the call id AND the start time, so
::  every ship shows the same values instead of each reconstructing `started` locally.
++  host-start-snap
  |=  [nid=@ta starter=@p now=@da prev-gen=@ud]
  ^-  call-snapshot:noltbook
  =/  g=@ud  +(prev-gen)
  =/  cid=@ta
    %-  crip
    ;:  weld
      "call-"  (trip (scot %ud g))  "-"  (trip (scot %da now))
    ==
  [nid g `[cid nid starter now (sy ~[starter]) %active]]
::  host-drop: remove exactly ONE participant from a live call, and end the call only
::  when that empties it. Either outcome is a host-authored change, so the revision
::  advances exactly once -- that is what makes a delayed earlier snapshot (which would
::  otherwise restore a departed participant or a stale count) strictly older and inert.
::  `call-id` is untouched: it identifies the call, not the revision.
::  An ALREADY-EMPTY snapshot is returned verbatim: nothing changed, so nothing advances.
++  host-drop
  |=  [now=@da snap=call-snapshot:noltbook who=@p]
  ^-  [out=call-snapshot:noltbook msgs=(list message:noltbook) ended=?]
  ?~  call.snap  [snap ~ %.y]
  =/  ci  u.call.snap
  =/  left=(set @p)  (~(del in participants.ci) who)
  =/  leave-msg  (call-sys-msg now note-id.snap who (call-left-txt who))
  =/  nxt=@ud  +(gen.snap)
  ?:  =(0 ~(wyt in left))
    =/  end-msg  (call-sys-msg now note-id.snap who '\01SYS:call-ended')
    [[note-id.snap nxt ~] ~[leave-msg end-msg] %.y]
  ::  bind before wrapping: `ci(participants left) would parse the backtick against `ci`
  ::  and then apply the mutation to the resulting unit
  =/  kept=call-info:noltbook  ci(participants left)
  [[note-id.snap nxt `kept] ~[leave-msg] %.n]
++  call-sync-cards
  |=  [nmap=(map @ta note:noltbook) our=@p]
  ^-  (list card)
  =/  by-host=(map @p (list @ta))
    %+  roll  ~(tap by nmap)
    |=  [[nid=@ta nt=note:noltbook] acc=(map @p (list @ta))]
    ?:  =(creator.nt our)  acc
    ?.  (~(has in users.nt) our)  acc
    ?.  (call-eligible nid nt)  acc
    =/  cur  (fall (~(get by acc) creator.nt) ~)
    (~(put by acc) creator.nt [nid cur])
  %+  turn  ~(tap by by-host)
  |=  [host=@p ids=(list @ta)]
  ^-  card
  (rpoke /call-sync/(scot %p host) host `remote:noltbook`[%remote-call-sync ids])
::  pal-status-of: the visible pal status for `target` from our actual sets.
++  pal-status-of
  |=  [target=@p outgoing=(set @p) incoming=(set @p) blocked=(set @p)]
  ^-  pal-status:noltbook
  ?:  (~(has in blocked) target)  %blocked
  ?:  &((~(has in outgoing) target) (~(has in incoming) target))  %mutual
  ?:  (~(has in outgoing) target)  %requesting
  ?:  (~(has in incoming) target)  %requested
  %none
::  pal-sync-card: a durable %remote-pal-sync poke carrying our authoritative view
::  of the relationship with `target` (outgoing = we follow them, blocked = we block
::  them, incoming = we believe they follow us — diagnostic on the receiver).
++  pal-sync-card
  |=  [target=@p outgoing=(set @p) incoming=(set @p) blocked=(set @p)]
  ^-  card
  =/  out=?  (~(has in outgoing) target)
  =/  inc=?  (~(has in incoming) target)
  =/  blk=?  (~(has in blocked) target)
  (rpoke /pal-sync/(scot %p target) target `remote:noltbook`[%remote-pal-sync out inc blk])
::  ames-contact-since: did we RECEIVE anything from `who` at or after `since`?
::
::    App-independent reachability, read from Ames' own per-peer QoS. No second probe:
::    the %request-profile poke we already sent is what makes Ames attempt contact, and
::    any packet coming back (an ack, or the %flub boon a ship sends when the target
::    agent isn't running) sets qos to %live and stamps last-contact.
::
::    %live and %dead BOTH qualify. Ames records a receive that arrived with no direct
::    lane -- the normal case for sponsor-forwarded or NAT-ed contact -- as %dead with a
::    FRESH last-contact (ames.hoon ~9937: `=? ev-core ?=(~ lane.per) (ev-update-qos %dead
::    last-contact=now)`, carrying the comment "XX this happens after first (forwarded)
::    contact"). A genuinely reachable ship is therefore often %dead, and requiring %live
::    misclassified it as unreachable. %dead only ever means "no traffic for ~s30".
::
::    %unborn is the one tag that MUST be rejected: it is the only state whose last-contact
::    was not written by a receive. Peer creation sets [%unborn now] (lull: "last-contact:
::    last time we heard from peer, or if %unborn, when we first started tracking time"),
::    so accepting it would report a ship we have never heard from as freshly contacted.
::    That is also why /peers/[ship]/last-contact is never read on its own.
::
::    `~` means "cannot tell" (read failed, or shape not as expected) and the caller emits
::    nothing, leaving the unchanged 28s frontend timeout as the backstop. `[~ %.n]` is a
::    positive proof of no qualifying contact. This never claims durable presence: the
::    answer is scoped to this lookup's window by `since`.
++  ames-contact-since
  |=  [our=@p now=@da who=@p since=@da]
  ^-  (unit ?)
  =/  res=(each (unit ?) tang)
    %-  mule
    |.
    ^-  (unit ?)
    ::  gate on the peers map first: scrying an absent peer crashes, and %alien means no
    ::  completed contact -- both resolve to a definite %.n rather than an unknown.
    =/  pez=(map ship ?(%alien %known))
      .^((map ship ?(%alien %known)) %ax /(scot %p our)//(scot %da now)/peers)
    ?.  =(`%known (~(get by pez) who))  `%.n
    =/  ss=ship-state:ames
      .^(ship-state:ames %ax /(scot %p our)//(scot %da now)/peers/(scot %p who))
    ?.  ?=(%known -.ss)  `%.n
    ::  accept %live or %dead (both are written by a real receive); reject %unborn.
    ?.  ?=(?(%live %dead) -.qos.ss)  `%.n
    `(gte last-contact.qos.ss since)
  ?:  ?=(%| -.res)  ~
  p.res
++  rem-handle
  ::  Option-1: the whole %noltbook-remote dispatch moved OUT of the on-poke battery.
  ::  =| / =* / =. re-expose state-67 faces exactly like the door, so handler bodies are
  ::  unchanged except this->state. on-poke delegates: =^ cards state (rem-handle bowl rem state).
  |=  [=bowl:gall rem=remote:noltbook sin=state-76]
  =|  state-76
  =*  state  -
  =.  state  sin
  ^-  (quip card state-76)
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
        ::  remote wins; losslessly reconcile our losing local root into the incoming one
        =/  old-id=@ta  id.u.dup
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
        ::  Part 5: merge timeline + rekey every note-id-keyed field (lossless), then
        ::  apply peer + recency updates. reconcile installs the canonical winner.
        =.  state  (reconcile-dm-roots state old-id note-id.rem new-note)
        :_  %=  state
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
      ::  oversized incoming icon: keep the gossip note, discard just the image.
      =/  ic=(unit @t)  (clamp-icon-url icon-url.rem gossip-icon-cap)
      =/  new-note=note:noltbook
        [note-id.rem name.rem %gossip creator.rem users.rem ~ ~ ~ ~ %public ic & ~ hl]
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
      ::  bound the icon on the incoming DM note before any use of note.rem below.
      =.  rem  rem(note (sanitize-note-icon note.rem))
      ::  atomic DM delivery: payload carries DM note metadata, so the
      ::  receiver can recreate the DM if they previously left it. No
      ::  subscription, no echo poke — avoids ames loops.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?.  =(%dm type.note.rem)  `state
      ?.  =(2 ~(wyt in users.note.rem))  `state
      ?.  (~(has in users.note.rem) our.bowl)  `state
      ?.  (~(has in users.note.rem) src.bowl)  `state
      ?.  =(src.bowl author.msg.rem)  `state
      ::  a DM message with no entry-meta has no seq to replace, so its order would fall
      ::  back to the sender-controlled id. Current clients always send meta; reject.
      ?~  meta.msg.rem  `state
      ::  resolve canonical local nid for this pair (handles re-creation
      ::  after leave, and possible nid collision via root-wins).
      ::  Part 4: a delayed delivery of an already-deleted message is a terminal no-op —
      ::  it must not reinsert the message nor recreate a locally-removed DM. A genuinely
      ::  new message (new key) may still recreate the DM (current product behavior).
      =/  in-key=dm-message-key:noltbook  (dm-message-key-of msg.rem)
      ?:  (dm-key-tombed in-key dm-msg-tombs)  `state
      =/  existing=(unit note:noltbook)  (find-dm-root notes users.note.rem)
      =/  install-fresh=note:noltbook  (apply-dm-pref note.rem dm-prefs our.bowl)
      =/  target-nid=@ta
        ?~  existing  id.note.rem
        ?:  =(id.u.existing id.note.rem)  id.u.existing
        ?:  (root-wins [creator.u.existing id.u.existing] [creator.note.rem id.note.rem])
          id.u.existing
        id.note.rem
      ::  Part 5: when our local root LOSES to the remote root, losslessly reconcile
      ::  (merge timeline + rekey every note-id-keyed field) instead of wiping history.
      =/  redir-cards=(list card)
        ?~  existing  ~
        ?:  =(id.u.existing target-nid)  ~
        ~[(gf-notes `update:noltbook`[%note-redirect id.u.existing target-nid])]
      ::  the =? test narrows `existing` to non-null inside the value below.
      =?  state  ?&(?=(^ existing) !=(id.u.existing target-nid))
        (reconcile-dm-roots state id.u.existing target-nid install-fresh)
      ::  ensure the winning DM note exists locally (fresh create / recreate after leave)
      =/  had-note=?  (~(has by notes) target-nid)
      =?  notes     !had-note  (~(put by notes) target-nid install-fresh)
      =?  messages  !had-note  (~(put by messages) target-nid ~)
      =/  note-cards=(list card)
        ?:  had-note  redir-cards
        (weld redir-cards ~[(gf-notes `update:noltbook`[%note-created install-fresh])])
      ::  Part 1B: EID-first dedup. A modern message duplicates ONLY by matching eid; a
      ::  legacy message duplicates ONLY by [author id]. Two messages with the same @da id
      ::  but different eids both survive. (in-key already derived from msg.rem above.)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) target-nid) ~)
      =/  dup=?  (lien cur |=(m=message:noltbook =(in-key (dm-message-key-of m))))
      ?:  dup
        :_  state
        note-cards
      ::  The remote ship may know this DM under a different root id. Store
      ::  and emit the message under our resolved local DM id so the frontend
      ::  does not route it to the stale/remote id.
      ::  RECEIVER-ASSIGNED ORDER. Computed after authentication, tombstone and EID
      ::  dedup, so a rejected or duplicate payload consumes no ordinal. Only meta.seq is
      ::  replaced -- eid, author, text, timestamps, reply identity, rev, created and
      ::  updated all survive, as does the note-id canonicalisation above.
      =/  nxt-seq=@ud
        (dm-next-seq (fall (~(get by seq-counters) target-nid) 0) cur)
      =/  local-msg=message:noltbook
        msg.rem(note-id target-nid, meta `u.meta.msg.rem(seq nxt-seq))
      =/  new-cur=(list message:noltbook)  (snoc cur local-msg)
      =/  target-note=note:noltbook  (~(got by notes) target-nid)
      =/  upd-note=note:noltbook
        target-note(last-author `src.bowl, last-preview `text.local-msg)
      ::  Phase 11B: DM recipient records the sender's via against the message eid.
      =/  new-msg-upd=update:noltbook  [%new-message local-msg ~ via.rem ~]
      =/  msg-cards=(list card)
        :~  (gf-paths ~[/notes/[target-nid]] new-msg-upd)
            (gf-notes new-msg-upd)
        ==
      =.  via-by-eid  (api-via-put via-by-eid via.rem local-msg)
      :_  state(notes (~(put by notes) target-nid upd-note), messages (~(put by messages) target-nid new-cur), seq-counters (~(put by seq-counters) target-nid nxt-seq), note-activity (put-activity note-activity target-nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity target-nid now.bowl), import-only-dms (~(del in import-only-dms) target-nid))
      :(weld note-cards msg-cards ~[(activity-fact target-nid now.bowl) (unread-activity-fact target-nid now.bowl)])
    ::
        %remote-note-pin
      ::  Ordinary-DM shared message pin, compare-and-set. NO ECHO: this handler emits
      ::  local facts only and never rpokes, so an operation cannot bounce between the
      ::  pair. Attribution is stamped from authenticated local information -- the wire
      ::  carries no note-id, no kind, no pinned-by and no pinned-at.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ::  resolve OUR canonical root from the participant pair; never trust a sender id
      =/  dm-u  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      ?~  dm-u  `state
      =/  nid=@ta  id.u.dm-u
      ?.  (dm-pin-ok src.bowl our.bowl nid notes host-status)  `state
      ::  compare-and-set: apply only when our current target is the one the sender saw
      =/  cur=(unit @uv)  (dm-pin-target nid note-pins)
      ?.  =(cur expect.rem)  `state
      ?~  target.rem
        ::  clear -- `expect` already proved a %message pin is present and matches
        ?~  cur  `state
        :_  state(note-pins (~(del by note-pins) nid))
        (pin-cards nid ~)
      ?.  (pin-target-ok nid u.target.rem %message messages artifacts)  `state
      =/  new-pin=note-pin:noltbook  [u.target.rem %message src.bowl now.bowl]
      :_  state(note-pins (~(put by note-pins) nid new-pin))
      (pin-cards nid `new-pin)
    ::
        %remote-dm-app-artifact-create  `state
    ::
        %remote-dm-app-artifact-edit  `state
    ::
    ::  Phase 3: legacy ordinary-DM %app artifact transport is RETIRED. No sender emits
    ::  these wires; the receivers are inert so there is exactly one authoritative path
    ::  (origin-hosted references via %remote-dm-ref-upsert / -ref-delete). A forged/old
    ::  poke can no longer create a duplicate full %app artifact on the counterparty.
        %remote-dm-app-artifact-delete  `state
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
      ::  INTEGRITY. src.bowl is the authenticated Gall sender, so the embedded
      ::  author must always be that ship. This was previously enforced for %dm
      ::  only, which let any member of a hosted group/notebook post under another
      ::  ship's name. The embedded note-id must likewise equal the route note-id
      ::  already validated above; the handler otherwise never reads it, but it is
      ::  stored and fanned out, and clients file messages by it.
      ::  Both are rejected here -- before sequence counters, host metadata,
      ::  durable storage, previews, mentions, attention, activity/unread, and any
      ::  fact or fan-out -- so a malformed payload changes nothing and emits no card.
      ?.  =(src.bowl author.msg.rem)       `state
      ?.  =(note-id.rem note-id.msg.rem)   `state
      ::  DM only: no entry-meta means no seq to replace, so order would fall back to the
      ::  sender-controlled id. Hosted notes are unaffected -- they get host-assigned meta.
      ?:  &(=(%dm type.u.old) ?=(~ meta.msg.rem))  `state
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
      ::  DM: keep the sender's meta but replace ONLY the ordinal with a receiver-assigned
      ::  one (computed after the DM dedup above, so duplicates consume nothing).
      ::  Hosted: override with host meta, byte-equivalent to before.
      =/  dm-seq=@ud  (dm-next-seq (fall (~(get by seq-counters) note-id.rem) 0) cur)
      ::  the ?: guard above cannot narrow meta.msg.rem for the compiler, so re-test with
      ::  ?~ here. The null arm is unreachable -- the guard already rejected meta=~.
      =/  stamped=message:noltbook
        ?.  =(%dm type.u.old)  msg.rem(meta host-meta)
        ?~  meta.msg.rem  msg.rem
        msg.rem(meta `u.meta.msg.rem(seq dm-seq))
      ::  host rebroadcast of a member's message: carry the member's NOTE SEND
      ::  marker (directed-kind.rem) so a member-recipient classifies as %send.
      ::  Phase 11B: carry the sender's via on the host rebroadcast so members
      ::  record it against the host-assigned eid (stamped), keeping ship=sender.
      =/  upd=update:noltbook  [%new-message stamped directed-kind.rem via.rem ~]
      =/  pax=path  ~[%notes note-id.rem]
      =/  upd-note=note:noltbook  u.old(last-author `author.msg.rem, last-preview `text.msg.rem)
      ::  mention detection: check if @~our appears in message text
      =/  mentioned=?  (has-our-mention text.msg.rem our.bowl)
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
        ?:  =(%dm type.u.old)  (~(put by seq-counters) note-id.rem dm-seq)
        ?:(is-regular (~(put by seq-counters) note-id.rem nxt-seq) seq-counters)
      ::  reply attention: notify the immediate parent owner if it is us. Target
      ::  is the NEW reply (a message). Uses sender reply-to-eid then legacy @da.
      =/  note-arts=(list artifact:noltbook)
        (skim ~(val by artifacts) |=(a=artifact:noltbook =(note-id.a note-id.rem)))
      =/  note-aenvs=(list artifact-envelope:noltbook)
        ~(val by (fall (~(get by artifact-envelopes) note-id.rem) *(map @ta artifact-envelope:noltbook)))
      =/  rte=(unit @uv)  ?~(meta.msg.rem ~ reply-to-eid.u.meta.msg.rem)
      =/  par-owner=(unit @p)  (attn-parent-owner rte reply-to.msg.rem cur note-arts note-aenvs)
      =/  par-eid=(unit @uv)  (reply-parent-eid msg.rem cur)
      ::  NOTE SEND payment posts get kind=%send via the explicit marker carried
      ::  on the %remote-message poke (no longer text-prefix based).
      =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.rem) %send %reply)
      =/  rtarget=attention-item:noltbook  [rkind %message stamped-eid `id.stamped ~ author.msg.rem id.stamped]
      =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
        (add-reply-attn attention note-id.rem our.bowl (host-self author.msg.rem our.bowl) par-owner rtarget)
      ::  Phase 11B: host records attribution against its own stamped eid.
      =.  via-by-eid  (api-via-put via-by-eid via.rem stamped)
      =/  new-unread-activity=(map @ta @da)
        (put-unread-activity note-unread-activity note-id.rem now.bowl)
      =/  unread-card=(list card)
        ~[(unread-activity-fact note-id.rem now.bowl)]
      :_  state(notes (~(put by notes) note-id.rem upd-note), messages (~(put by messages) note-id.rem (snoc cur stamped)), mentions new-mentions, attention na.ar, seq-counters new-seq, note-activity (put-activity note-activity note-id.rem now.bowl), note-unread-activity new-unread-activity)
      ^-  (list card:agent:gall)
      ::  1B.2: durable state + /notes/[nid] transport delivery are unchanged; the
      ::  global /notes host-human facts (gf-notes/activity/unread/mention)
      ::  are stripped when the host human is not a logical member of the (hidden) note.
      %:  human-note-cards  note-id.rem  our.bowl
          note-members  notes
        :*  (gf-paths ~[pax] upd)
            (gf-notes upd)
            (activity-fact note-id.rem now.bowl)
            (weld unread-card (weld mention-cards ac.ar))
        ==
      ==
    ::
        %remote-ars
      ::  ARS NOTORIA gossip from a peer (legacy full-message path)
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) %cover) *(map @da envelope:noltbook))
      =/  cur=(list message:noltbook)  (fall (~(get by messages) %cover) ~)
      =/  meid=(unit @uv)  ?~(meta.msg.rem ~ `eid.u.meta.msg.rem)
      ::  canonical replay guard: block only when the origin's canonical record matches THIS
      ::  entry (eid+kind+note+author+msg-id) — never a bare-set eid.
      ?:  ?&(?=(^ meid) (mesh-text-tombed mesh-tomb-meta u.meid %cover author.msg.rem id.msg.rem))  `state
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
      ::  canonical replay guard: block only when the canonical record matches THIS envelope.
      ?:  ?&(?=(^ env-eid) (mesh-text-tombed mesh-tomb-meta u.env-eid %cover author.env msg-id.env))  `state
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
        (add-reply-attn attention %cover our.bowl (host-self author.env our.bowl) par-owner rtarget)
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
      ::  canonical replay guard: block only when the canonical record matches THIS content.
      ?:  ?&(?=(^ reply-eid) (mesh-text-tombed mesh-tomb-meta u.reply-eid %cover author.msg id.msg))  `state
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
      ::  canonical replay guard: block only when the canonical record matches THIS envelope.
      ?:  ?&(?=(^ env-eid) (mesh-text-tombed mesh-tomb-meta u.env-eid nid author.env msg-id.env))  `state
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
        (add-reply-attn attention nid our.bowl (host-self author.env our.bowl) par-owner rtarget)
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
      ::  canonical replay guard: block only when the canonical record matches THIS content.
      ?:  ?&(?=(^ reply-eid) (mesh-text-tombed mesh-tomb-meta u.reply-eid nid author.msg id.msg))  `state
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
      ::  The pending row is deleted FIRST: the 27s reachability wake requires an exact
      ::  matching row, so removing it here is what stops a later wake from emitting
      ::  %noltbook-unavailable on top of this %ok. Only drop the row when it really is
      ::  this ship's lookup, so a stale/forged req-id cannot cancel someone else's.
      =/  drop-pend=?
        =/  p  (~(get by pending-profile-lookups) req-id.rem)
        ?~(p %.n =(src.bowl ship.u.p))
      =/  pupd=update:noltbook  [%profile-updated src.bowl profile.rem]
      =/  rupd=update:noltbook  [%profile-lookup-result req-id.rem src.bowl %ok]
      =/  new-pend=(map @ud pending-profile-lookup:noltbook)
        ?.  drop-pend  pending-profile-lookups
        (~(del by pending-profile-lookups) req-id.rem)
      :_  state(profiles (~(put by profiles) src.bowl profile.rem), pending-profile-lookups new-pend)
      :~  (gf-notes pupd)
          (gf-notes rupd)
      ==
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
        ==
      =/  resp=remote:noltbook  [%remote-note-list pub-notes]
      :_  state
      ~[(rpoke /note-resp/(scot %p requester.rem) requester.rem resp)]
    ::
        %remote-note-list
      ::  bound icons before the list is handed to the frontend.
      =.  rem  rem(notes (turn notes.rem sanitize-note-icon))
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
      ::  bound icons on every note in the authoritative snapshot before any use below.
      =.  rem  rem(notes (turn notes.rem sanitize-note-icon))
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
        %remote-pal-sync
      ::  durable reconciliation. `outgoing`/`blocked` from the peer are authoritative;
      ::  `incoming` is diagnostic only and NEVER mutates our own pal-outgoing intent.
      =/  peer=@p  src.bowl
      =/  we-follow=?  (~(has in pal-outgoing) peer)
      =/  i-block=?  (~(has in pal-blocked) peer)
      =/  old-status=pal-status:noltbook
        (pal-status-of peer pal-outgoing pal-incoming pal-blocked)
      ::  apply their authoritative outgoing -> our pal-incoming. never keep them in
      ::  incoming while we block them, while they block us, or when they don't follow us.
      =/  new-incoming=(set @p)
        ?:  i-block  (~(del in pal-incoming) peer)
        ?:  |(blocked.rem =(%.n outgoing.rem))  (~(del in pal-incoming) peer)
        (~(put in pal-incoming) peer)
      =/  new-status=pal-status:noltbook
        (pal-status-of peer pal-outgoing new-incoming pal-blocked)
      ::  emit a fact only when the visible status actually changed (idempotent).
      =/  status-cards=(list card)
        ?:  =(old-status new-status)  ~
        =/  still-visible=?
          ?|  (~(has in contacts) peer)
              (~(has in pal-outgoing) peer)
              (~(has in new-incoming) peer)
              (~(has in pal-blocked) peer)
          ==
        ?:  still-visible  ~[(gf-notes [%pal-update peer new-status])]
        ~[(gf-notes [%pal-removed peer])]
      ::  reply with OUR authoritative sync only when their belief about whether we
      ::  follow them (incoming.rem) disagrees with reality. converges in one round and
      ::  cannot ping-pong: pal-outgoing is owner-authoritative and never mutated here.
      =/  reply-cards=(list card)
        ?:  =(incoming.rem we-follow)  ~
        ~[(pal-sync-card peer pal-outgoing new-incoming pal-blocked)]
      :_  state(pal-incoming new-incoming)
      (weld status-cards reply-cards)
    ::
        %remote-introduce
      ::  no-op: auto peer-introduce removed; variant retained for future
      ::  contact design. Do not auto-add peer / watch cover / send profile.
      `state
    ::
        %remote-edit-msg
      ::  remote user editing their own message in a note we host (or DM peer)
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ::  Part 3: ordinary-DM pair resolution first. The authenticated pair {our,src} is
      ::  the DM identity; never trust note-id.rem as our local id. Use the DM path ONLY
      ::  when that DM actually holds the target (EID-first, legacy [src id]).
      =/  dm=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      =/  dm-hit=(unit [nid=@ta m=message:noltbook])
        ?~  dm  ~
        ?.  (is-ordinary-dm u.dm)  ~
        ?.  (~(has in users.u.dm) our.bowl)  ~
        ?.  (~(has in users.u.dm) src.bowl)  ~
        =/  msgs=(list message:noltbook)  (fall (~(get by messages) id.u.dm) ~)
        =/  hit  (dm-find-msg msgs eid.rem msg-id.rem src.bowl)
        ?~  hit  ~
        `[id.u.dm u.hit]
      ?^  dm-hit
        =/  lnid=@ta  nid.u.dm-hit
        =/  tgt=message:noltbook  m.u.dm-hit
        ::  Imported history is local-only and cannot be mutated by a forged/colliding
        ::  remote ordinary-DM event, even though its displayed author is the peer.
        ?:  ?&(?=(^ meta.tgt) (~(has by dm-imports) eid.u.meta.tgt))  `state
        ::  Part 4: a delayed edit for a tombstoned message is a no-op (no resurrection).
        ?:  (dm-key-tombed (dm-message-key-of tgt) dm-msg-tombs)  `state
        ::  author-only (backend authoritative against forged pokes)
        ?.  =(src.bowl author.tgt)  `state
        =/  cur=(list message:noltbook)  (fall (~(get by messages) lnid) ~)
        =/  new-meta=(unit entry-meta:noltbook)
          ?~  meta.tgt  ~
          `u.meta.tgt(rev +(rev.u.meta.tgt), updated now.bowl)
        ::  Part 1A: mutate ONLY the exact stored target, compared by full dm-message-key.
        =/  target-key=dm-message-key:noltbook  (dm-message-key-of tgt)
        =/  new-msgs=(list message:noltbook)
          %+  turn  cur
          |=  m=message:noltbook
          ?.  =(target-key (dm-message-key-of m))  m
          m(text text.rem, edited &, meta new-meta)
        =/  edited=message:noltbook  tgt(text text.rem, edited &, meta new-meta)
        =/  upd=update:noltbook  [%message-edited lnid edited]
        =/  pax=path  ~[%notes lnid]
        :_  state(messages (~(put by messages) lnid new-msgs))
        :~  (gf-paths ~[pax] upd)
            (gf-notes upd)
        ==
      ::  ---- exact-note (non-DM / same-id) path, unchanged ----
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
      ::  bound the icon on the incoming child note before any use of note.rem below.
      =.  rem  rem(note (sanitize-note-icon note.rem))
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
      ::  Part 3: ordinary-DM pair resolution first (never trust note-id.rem for a DM).
      ::  Part 2: a DM delete writes a terminal tombstone derived from the STORED message.
      =/  dm=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      =/  dm-hit=(unit [nid=@ta m=message:noltbook])
        ?~  dm  ~
        ?.  (is-ordinary-dm u.dm)  ~
        ?.  (~(has in users.u.dm) our.bowl)  ~
        ?.  (~(has in users.u.dm) src.bowl)  ~
        =/  msgs=(list message:noltbook)  (fall (~(get by messages) id.u.dm) ~)
        =/  hit  (dm-find-msg msgs eid.rem msg-id.rem src.bowl)
        ?~  hit  ~
        `[id.u.dm u.hit]
      ?^  dm-hit
        =/  lnid=@ta  nid.u.dm-hit
        =/  tgt=message:noltbook  m.u.dm-hit
        ?:  ?&(?=(^ meta.tgt) (~(has by dm-imports) eid.u.meta.tgt))  `state
        ::  author-only (backend authoritative against forged pokes)
        ?.  =(src.bowl author.tgt)  `state
        =/  tkey=dm-message-key:noltbook  (dm-message-key-of tgt)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) lnid) ~)
        ::  Part 1A: remove ONLY the exact stored target, compared by full dm-message-key.
        =/  target-id=@da  id.tgt
        =/  kept=(list message:noltbook)
          (skim cur |=(m=message:noltbook !=(tkey (dm-message-key-of m))))
        =/  del-eid=(unit @uv)  ?~(meta.tgt ~ `eid.u.meta.tgt)
        =/  upd=update:noltbook  [%message-deleted lnid target-id del-eid]
        =/  pax=path  ~[%notes lnid]
        =/  pin-hit=?
          ?~  del-eid  %.n
          =/  pn  (~(get by note-pins) lnid)
          ?~  pn  %.n
          &(=(%message kind.u.pn) =(u.del-eid target.u.pn))
        =/  new-pins=(map @ta note-pin:noltbook)
          ?:(pin-hit (~(del by note-pins) lnid) note-pins)
        =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards lnid ~) ~)
        =?  via-by-eid    ?=(^ del-eid)  (~(del by via-by-eid) u.del-eid)
        =/  msgs-after  (~(put by messages) lnid kept)
        :_  state(messages msgs-after, note-pins new-pins, dm-msg-tombs (dm-add-msg-tomb tkey now.bowl dm-msg-tombs))
        %+  weld
          ^-  (list card)
          :~  (gf-paths ~[pax] upd)
              (gf-notes upd)
          ==
        pin-clear-cards
      ::  ---- exact-note (non-DM / same-id) path, unchanged (no tombstone) ----
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
      ::  message's via attribution row when an eid resolved.
      =?  via-by-eid    ?=(^ del-eid)  (~(del by via-by-eid) u.del-eid)
      =/  msgs-after  (~(put by messages) note-id.rem new-msgs)
      :_  state(messages msgs-after, note-pins new-pins)
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
      :_  state(notes notes-after, note-admins clean-admins, note-muted clean-muted, member-revs new-revs, note-members (del-member-from-ids src.bowl [note-id.rem group-descs] note-members notes))
      :(weld base-cards admin-cards muted-cards desc-users-cards)
    ::
        %remote-root-exists
      ::  bound the icon on the incoming canonical note before any use below.
      =.  rem  rem(canonical (sanitize-note-icon canonical.rem))
      ::  we lost a root-uniqueness race; adopt canonical, losslessly reconciling our loser
      ::  protect system notes from root-exists manipulation
      ?:  |(=(losing-id.rem %cover) =(losing-id.rem %ars-rumors))  `state
      ::  sender must be the canonical's creator (authority on winner)
      ?.  =(src.bowl creator.canonical.rem)  `state
      =/  loser  (~(get by notes) losing-id.rem)
      =/  have-canonical=?  (~(has by notes) id.canonical.rem)
      =/  canon-local=note:noltbook  (apply-dm-pref canonical.rem dm-prefs our.bowl)
      ::  Part 5: if we own the losing root and it is an ordinary %dm matching this exact
      ::  {our,src} pair, reconcile losslessly (merge timeline + rekey every field). The
      ::  system/non-DM/foreign cases fall back to the prior drop-our-losing-root behavior.
      =/  can-reconcile=?
        ?&  ?=(^ loser)
            =(our.bowl creator.u.loser)
            ?=(~ parent.u.loser)
            (is-ordinary-dm u.loser)
            =(%dm type.canonical.rem)
            =(2 ~(wyt in users.canonical.rem))
            =(users.u.loser users.canonical.rem)
            =(`(set @p)`(sy ~[our.bowl src.bowl]) users.canonical.rem)
            !=(losing-id.rem id.canonical.rem)
        ==
      =?  state  can-reconcile
        (reconcile-dm-roots state losing-id.rem id.canonical.rem canon-local)
      ::  legacy fallback (only when NOT reconciled): drop our own losing root
      =?  notes  &(!can-reconcile ?=(^ loser) =(our.bowl creator.u.loser) ?=(~ parent.u.loser))
        (~(del by notes) losing-id.rem)
      =?  messages  &(!can-reconcile ?=(^ loser) =(our.bowl creator.u.loser) ?=(~ parent.u.loser))
        (~(del by messages) losing-id.rem)
      ::  install canonical if absent (reconcile already installed it when it ran)
      =.  notes
        ?:  (~(has by notes) id.canonical.rem)  notes
        (~(put by notes) id.canonical.rem canon-local)
      =.  messages
        ?:  (~(has by messages) id.canonical.rem)  messages
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
      :_  state(notes notes-after, note-members (del-member-from-ids our.bowl subtree-ids note-members notes))
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
      ::  bound icons on the root note and every descendant before validation/install.
      =.  rem  rem(root-note (sanitize-note-icon root-note.rem))
      =.  rem
        %=    rem
            descendants
          %+  turn  descendants.rem
          |=  [n=note:noltbook source-id=@ta]
          [(sanitize-note-icon n) source-id]
        ==
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
      ::  member -> HOST: "please start a call". Only the host allocates a generation,
      ::  a call id and a start time; a member never authors call state.
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  =(our.bowl creator.u.exists)  `state
      ?.  (call-eligible note-id.rem u.exists)  `state
      ?.  (can-user-post note-id.rem src.bowl host-status notes note-members)  `state
      =/  cur  (~(get by calls) note-id.rem)
      ::  a live call already exists: the requester should JOIN it, not restart it
      ?:  ?&(?=(^ cur) ?=(^ call.u.cur))  `state
      =/  snap=call-snapshot:noltbook
        %-  norm-snap
        (host-start-snap note-id.rem src.bowl now.bowl (call-gen calls note-id.rem))
      ?~  call.snap  `state
      =/  dl=@da  (add now.bowl call-lease-ttl)
      =/  msg  (call-sys-msg now.bowl note-id.rem src.bowl (call-started-txt src.bowl))
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  msg-upd=update:noltbook  [%new-message msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.rem]
      =.  calls  (~(put by calls) note-id.rem snap)
      =.  call-leases  (put-lease call-leases note-id.rem src.bowl dl)
      =.  messages  (~(put by messages) note-id.rem (snoc cur-msgs msg))
      :_  state
      ;:  weld
        (call-snap-cards users.u.exists snap our.bowl)
        (call-local-cards snap)
        ~[(gf-paths ~[pax] msg-upd)]
        ~[(lease-wake note-id.rem call-id.u.call.snap src.bowl dl)]
      ==
    ::
        %remote-call-join
      ::  member -> HOST: "add me". src.bowl IS the subject, so there is no ship field
      ::  to forge and no way to join anyone else.
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  =(our.bowl creator.u.exists)  `state
      ?.  (can-user-post note-id.rem src.bowl host-status notes note-members)  `state
      =/  cur  (~(get by calls) note-id.rem)
      ?~  cur  `state
      ?~  call.u.cur  `state
      =/  ci  u.call.u.cur
      =/  dl=@da  (add now.bowl call-lease-ttl)
      ::  already a participant: treat as liveness, refresh the lease only
      ?:  (~(has in participants.ci) src.bowl)
        =.  call-leases  (put-lease call-leases note-id.rem src.bowl dl)
        :_  state
        ~[(lease-wake note-id.rem call-id.ci src.bowl dl)]
      =/  new-ci=call-info:noltbook
        ci(participants (~(put in participants.ci) src.bowl))
      ::  adding a participant is a host-authored change: advance the revision once, and
      ::  keep call-id so the call's identity survives its own participant churn
      =/  snap=call-snapshot:noltbook
        (norm-snap [note-id.rem +(gen.u.cur) `new-ci])
      =/  msg  (call-sys-msg now.bowl note-id.rem src.bowl (call-joined-txt src.bowl))
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  msg-upd=update:noltbook  [%new-message msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.rem]
      =.  calls  (~(put by calls) note-id.rem snap)
      =.  call-leases  (put-lease call-leases note-id.rem src.bowl dl)
      =.  messages  (~(put by messages) note-id.rem (snoc cur-msgs msg))
      :_  state
      ;:  weld
        (call-snap-cards users.u.exists snap our.bowl)
        (call-local-cards snap)
        ~[(gf-paths ~[pax] msg-upd)]
        ~[(lease-wake note-id.rem call-id.new-ci src.bowl dl)]
      ==
    ::
        %remote-call-leave
      ::  member -> HOST: "drop me". Only the sender can be dropped this way.
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  =(our.bowl creator.u.exists)  `state
      =/  cur  (~(get by calls) note-id.rem)
      ?~  cur  `state
      ?~  call.u.cur  `state
      ?.  (~(has in participants.u.call.u.cur) src.bowl)  `state
      =/  res  (host-drop now.bowl u.cur src.bowl)
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.rem) ~)
      =/  pax=path  ~[%notes note-id.rem]
      =.  calls  (~(put by calls) note-id.rem out.res)
      =.  call-leases  (del-lease call-leases note-id.rem src.bowl)
      =?  call-leases  ended.res  (~(del by call-leases) note-id.rem)
      =.  messages  (~(put by messages) note-id.rem (weld cur-msgs msgs.res))
      :_  state
      ;:  weld
        (call-snap-cards users.u.exists out.res our.bowl)
        (call-local-cards out.res)
        %+  turn  msgs.res
        |=  m=message:noltbook
        (gf-paths ~[pax] `update:noltbook`[%new-message m ~ ~ ~])
      ==
    ::
        %remote-call-heartbeat
      ::  member -> HOST: liveness for ITSELF only. Refreshes that one lease.
      =/  exists  (~(get by notes) note-id.rem)
      ?~  exists  `state
      ?.  =(our.bowl creator.u.exists)  `state
      ?.  (can-user-post note-id.rem src.bowl host-status notes note-members)  `state
      =/  cur  (~(get by calls) note-id.rem)
      ?~  cur  `state
      ?~  call.u.cur  `state
      ?.  (~(has in participants.u.call.u.cur) src.bowl)  `state
      =/  dl=@da  (add now.bowl call-lease-ttl)
      =.  call-leases  (put-lease call-leases note-id.rem src.bowl dl)
      :_  state
      ~[(lease-wake note-id.rem call-id.u.call.u.cur src.bowl dl)]
    ::
        %remote-call-sync
      ::  member -> HOST: "current call state of these notes". We answer only for notes
      ::  we host and the asker is in. An EMPTY generation-bearing snapshot is a real
      ::  answer -- it is what clears a badge left behind by downtime.
      :_  state
      %+  murn  note-ids.rem
      |=  nid=@ta
      ^-  (unit card)
      =/  nt  (~(get by notes) nid)
      ?~  nt  ~
      ?.  =(our.bowl creator.u.nt)  ~
      ?.  (~(has in users.u.nt) src.bowl)  ~
      =/  cur  (~(get by calls) nid)
      =/  snap=call-snapshot:noltbook  ?~(cur [nid 0 ~] u.cur)
      :-  ~
      %^    rpoke
          (call-snap-wire src.bowl nid gen.snap 1)
        src.bowl
      `remote:noltbook`[%remote-call-snap snap]
    ::
        %remote-call-snap
      ::  HOST -> us: the authoritative record. Accepted only from the note creator and
      ::  only when it dominates what we hold, so duplicate, delayed and reordered
      ::  snapshots are all inert.
      =/  nid=@ta  note-id.snap.rem
      =/  exists  (~(get by notes) nid)
      ?~  exists  `state
      ?.  =(src.bowl creator.u.exists)  `state
      ?.  (~(has in users.u.exists) our.bowl)  `state
      =/  snap=call-snapshot:noltbook  (norm-snap snap.rem)
      ?.  (snap-dominates snap (~(get by calls) nid))  `state
      =.  calls  (~(put by calls) nid snap)
      ::  leases are host-only bookkeeping; a member holds none
      =.  call-leases  (~(del by call-leases) nid)
      :_  state
      (call-local-cards snap)
    ::
        %remote-call-signal
      ::  incoming WebRTC signal. Signaling itself is unchanged; the only addition is
      ::  the correlation check -- the call id must match a LIVE call and the sender
      ::  must actually be one of its participants.
      =/  entries=(list [@ta call-snapshot:noltbook])  ~(tap by calls)
      =/  match=(list [@ta call-snapshot:noltbook])
        %+  skim  entries
        |=  [nid=@ta snap=call-snapshot:noltbook]
        ?~  call.snap  %.n
        =(call-id.u.call.snap call-id.rem)
      ?~  match  `state
      =/  nid=@ta  -.i.match
      =/  snap=call-snapshot:noltbook  +.i.match
      ?~  call.snap  `state
      ?.  (~(has in participants.u.call.snap) src.bowl)  `state
      =/  upd=update:noltbook  [%call-signal nid from.rem sig-type.rem payload.rem]
      =/  pax=path  ~[%notes nid]
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
        :_  state(notes notes-after, peers new-peers, note-muted (~(put by note-muted) nid ro-muted), member-revs new-revs, note-members (add-member-to-ids src.bowl [nid group-descs] note-members notes))
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
      ::  read bytes from the separate %noltbook-data desk (never q.byk.bowl)
      =/  scry-res  (art-store-read our.bowl now.bowl art-id.rem)
      ?~  scry-res
        :_  state
        ~[(rpoke /art-deny/(scot %p src.bowl)/[art-id.rem] src.bowl `remote:noltbook`[%remote-artifact-denied art-id.rem eyre-id.rem])]
      =/  mim=mime  u.scry-res
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
        ::  ephemeral bytes get the SAME policy as local ones. The original request's
        ::  preview/download marker cannot survive the async host round-trip without new
        ::  state, so preview semantics are applied unconditionally: safe types render,
        ::  active documents are downgraded to text/plain, unknown types download. The
        ::  bytes are always the untouched original, so the frontend's `download`
        ::  attribute still saves the real file.
        =/  =simple-payload:http
          %+  art-serve-payload
            [(parse-mime-path mime.rem) bytes.rem]
          [name.u.art | 'no-store']
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
      ::  gossip/cover envelope path: same unconditional policy as above.
      =/  =simple-payload:http
        %+  art-serve-payload
          [(parse-mime-path mime.rem) bytes.rem]
        [name.u.env | 'no-store']
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
        %remote-note-icon-fetch
      ::  HOST: serve our OWN uploaded icon for a note we created. No arbitrary-path
      ::  access -- the spur is derived from note-id and read only from %noltbook-data.
      ::  Every failed check answers denied, never bytes.
      =/  deny=(list card)
        :~  %^    rpoke
                /nic-deny/(scot %p src.bowl)/[note-id.rem]
              src.bowl
            `remote:noltbook`[%remote-note-icon-denied note-id.rem eyre-id.rem]
        ==
      ?:  (~(has in pal-blocked) src.bowl)  [deny state]
      =/  nt  (~(get by notes) note-id.rem)
      ?~  nt  [deny state]
      ?.  =(our.bowl creator.u.nt)  [deny state]
      ?.  (note-icon-is-internal note-id.rem icon-url.u.nt)  [deny state]
      ::  a current non-removed member, or a note already advertised public/private.
      =/  is-member=?
        ?&  (~(has in users.u.nt) src.bowl)
            !(~(has in removed.u.nt) src.bowl)
        ==
      =/  advertised=?
        ?|(=(%public visibility.u.nt) =(%private visibility.u.nt))
      ?.  |(is-member advertised)  [deny state]
      =/  res  (icon-read our.bowl now.bowl note-id.rem)
      ?~  res  [deny state]
      ::  same 50 KB ceiling the upload enforces, re-checked on the way out.
      ?:  (gth p.q.u.res 51.200)  [deny state]
      ::  revalidate the stored bytes; never ship something that is not an image.
      ?~  (image-sig-mite q.u.res)  [deny state]
      :_  state
      :~  %^    rpoke
              /nic-content/(scot %p src.bowl)/[note-id.rem]
            src.bowl
          `remote:noltbook`[%remote-note-icon-content note-id.rem eyre-id.rem q.u.res]
      ==
    ::
        %remote-note-icon-content
      ::  REQUESTER: answer the held browser request and persist NOTHING. The wire
      ::  carries no mime on purpose -- the type is re-derived from the bytes here.
      ::  resolve-once: only a request we are actually holding may be answered, and the
      ::  row is deleted on every path, so a late or duplicate reply finds nothing.
      =/  pend  (~(get by pending-icon-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(note-id.rem note-id.u.pend)  `state
      ?.  =(src.bowl host.u.pend)  `state
      =/  dropped  (~(del by pending-icon-fetches) eyre-id.rem)
      =/  fail-404
        :_  state(pending-icon-fetches dropped)
        (give-simple-payload:app:server eyre-id.rem `simple-payload:http`[[404 ~] ~])
      =/  nt  (~(get by notes) note-id.rem)
      ?~  nt  fail-404
      ::  the Ames-authenticated sender must be the creator of OUR copy of the note.
      ?.  =(src.bowl creator.u.nt)  fail-404
      ?.  (note-icon-is-internal note-id.rem icon-url.u.nt)  fail-404
      ?:  (gth p.bytes.rem 51.200)  fail-404
      =/  mt  (image-sig-mite bytes.rem)
      ?~  mt  fail-404
      =/  hdrs=(list [@t @t])
        :~  ['content-type' (rap 3 (join '/' u.mt))]
            ['cache-control' 'no-store']
            ['access-control-allow-origin' '*']
            ['x-content-type-options' 'nosniff']
        ==
      :_  state(pending-icon-fetches dropped)
      %+  give-simple-payload:app:server  eyre-id.rem
      `simple-payload:http`[[200 hdrs] `bytes.rem]
    ::
        %remote-note-icon-denied
      ::  REQUESTER: resolve the held request as 404. Only the note's creator may
      ::  complete a request for that note -- otherwise any ship could 404 a browser
      ::  request it does not own. Unknown note or wrong sender: ignore entirely.
      ::  No pending-request state is kept; authority comes from our local note record.
      =/  pend  (~(get by pending-icon-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(note-id.rem note-id.u.pend)  `state
      ?.  =(src.bowl host.u.pend)  `state
      =/  nt  (~(get by notes) note-id.rem)
      ?~  nt  `state
      ?.  =(src.bowl creator.u.nt)  `state
      :_  state(pending-icon-fetches (~(del by pending-icon-fetches) eyre-id.rem))
      %+  give-simple-payload:app:server  eyre-id.rem
      `simple-payload:http`[[404 ~] ~]
    ::
        %remote-user-avatar-fetch
      ::  owner: serve ONLY our own uploaded user avatar bytes. require has-avatar +
      ::  a mule-guarded Clay read of the FIXED /lib/noltbook/avatar/mime path (no
      ::  arbitrary-path access); missing/read-fail -> denied.
      ?.  has-avatar
        :_  state
        ~[(rpoke /uav-deny/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-user-avatar-denied eyre-id.rem])]
      =/  res  (avatar-read our.bowl now.bowl q.byk.bowl)
      ?~  res
        :_  state
        ~[(rpoke /uav-deny/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-user-avatar-denied eyre-id.rem])]
      =/  mim=mime  u.res
      =/  ct=@t  (rap 3 (join '/' p.mim))
      :_  state
      ~[(rpoke /uav-content/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-user-avatar-content eyre-id.rem ct q.mim])]
    ::
        %remote-user-avatar-content
      ::  requester: answer the held browser request with the fetched bytes; persist
      ::  NOTHING. no-store (no versioning this pass, so never cache).
      =/  hdrs=(list [@t @t])
        :~  ['content-type' mime.rem]
            ['cache-control' 'no-store']
            ['access-control-allow-origin' '*']
        ==
      =/  =simple-payload:http  [[200 hdrs] `bytes.rem]
      :_  state
      (give-simple-payload:app:server eyre-id.rem simple-payload)
    ::
        %remote-user-avatar-denied
      ::  requester: resolve the held request as 404; leave no pending state.
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
      ::  terminal tombstone dominates: a replayed/late create must never revive a deleted
      ::  shared-note artifact (aids are never reused; a replacement gets a fresh aid).
      ?:  (~(has by note-artifact-tombs) id.art)  `state
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
        (add-reply-attn attention nid our.bowl (host-self creator.art our.bowl) par-owner rtarget)
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
      ::  terminal tombstone dominates: a replayed/late update must never revive a deleted
      ::  shared-note artifact.
      ?:  (~(has by note-artifact-tombs) art-id.rem)  `state
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
        %remote-artifact-delete
      ::  member -> host: host-authoritative deletion of a shared-note artifact. The deleter
      ::  is the authenticated Ames source (src.bowl); the helper re-validates that we host
      ::  the note, the note is %group/%notebook, src.bowl is a current permitted participant,
      ::  the artifact exists + belongs to the note, and src.bowl is the artifact creator,
      ::  the note host, or a current admin. Unauthorized/duplicate/replayed requests are a
      ::  harmless no-op (no state change, no marker). Same helper the host-local path uses.
      =^  cards  state  (delete-note-artifact bowl src.bowl note-id.rem art-id.rem state)
      [cards state]
    ::
        %remote-dm-artifact
      ::  Part 6: legacy old->new %file delivery. The old sender still ships bytes; we use
      ::  them ONLY to compute a content hash, then discard. We store a content-free
      ::  reference — never write Clay, never keep the full remote artifact. New senders
      ::  never emit this wire. Non-ordinary-DM legacy paths are unaffected (this wire was
      ::  only ever a DM wire).
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  art  artifact.rem
      ?.  ?=(%file type.art)  `state
      ?.  =(src.bowl creator.art)  `state
      ?.  ?=([^ ~] versions.art)  `state
      =/  ver  i.versions.art
      =/  ctnt=tape  (trip content.ver)
      ?~  (find (trip '"storage":"clay"') ctnt)  `state
      ?^  (find (trip 'dataUrl') ctnt)  `state
      ?^  (find (trip 'mimeType') ctnt)  `state
      ::  resolve OUR local DM by the authenticated pair; never trust note-id.art. Drop
      ::  safely if we have no local DM (legacy payload carries no note metadata to recreate).
      =/  existing=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      ?~  existing  `state
      ?.  (is-ordinary-dm u.existing)  `state
      ?.  =(~ removed.u.existing)  `state
      =/  lnid=@ta  id.u.existing
      =/  eid=@uv  (dm-artifact-eid art)
      ::  terminal tombstone dominates
      ?:  (~(has by dm-artifact-tombs) eid)  `state
      ::  bytes used ONLY to compute the content hash (ephemeral), then discarded
      =/  chash=@uv  (sham q.bytes.rem)
      =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of art lnid `chash)
      ?~  ref  `state
      =/  cur-ref  (~(get by dm-artifact-refs) eid)
      ::  reject only a STRICTLY older rev (same-rev enrichment / newer both proceed).
      ?:  ?&(?=(^ cur-ref) (gth rev.u.cur-ref rev.u.ref))  `state
      =/  prev=@t  'shared a file'
      =/  upd-note=note:noltbook  u.existing(last-author `src.bowl, last-preview `prev)
      =/  upd=update:noltbook  [%dm-ref-upserted u.ref]
      :_  state(notes (~(put by notes) lnid upd-note), dm-artifact-refs (~(put by dm-artifact-refs) eid u.ref), note-activity (put-activity note-activity lnid now.bowl), note-unread-activity (put-unread-activity note-unread-activity lnid now.bowl))
      :~  (gf-paths ~[/notes/[lnid]] upd)
          (gf-notes upd)
          (activity-fact lnid now.bowl)
          (unread-activity-fact lnid now.bowl)
          (sidebar-signal lnid src.bowl `prev %artifact now.bowl)
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
      ::  canonical replay guard: block only when the canonical record matches THIS artifact
      ::  envelope (eid+kind+note+author+aid) — never a bare-set eid.
      ?:  ?&(?=(^ meta.env.rem) (mesh-art-tombed mesh-tomb-meta eid.u.meta.env.rem nid author.env.rem aid.env.rem))  `state
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
        (add-reply-attn attention nid our.bowl (host-self author.env.rem our.bowl) par-owner rtarget)
      :_  state(notes new-notes, artifact-envelopes (~(put by artifact-envelopes) nid (cap-art-envs (~(put by envs) aid.env.rem env.rem))), attention na.ar, note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl))
      :(weld ~[(gf-paths ~[pax] upd)] relay act-cards sig-cards ac.ar)
    ::
        %remote-mesh-delete
      ::  CANONICAL author-authenticated deletion. Applied ONLY when the authenticated
      ::  src.bowl == author.tomb. ALL mutation + relay routing use the origin-built canonical
      ::  record `tomb`, never anything a relay/requester supplied. Full-artifact and envelope
      ::  are matched + removed INDEPENDENTLY. Tomb-before-entry installs only the terminal
      ::  tombstone + record (no false removal). Block state never prevents this cleanup.
      =/  t=mesh-tomb:noltbook  tomb.rem
      ?.  =(src.bowl author.t)  `state
      =/  nid=@ta  note-id.t
      =/  nt  (~(get by notes) nid)
      ?~  nt  `state
      ?.  (is-mesh-note nid u.nt)  `state
      ::  canonical record shape: %text => msg-id present, no aid; %artifact => aid, no msg-id
      =/  shape-ok=?
        ?-  kind.t
          %text      &(?=(^ msg-id.t) ?=(~ aid.t))
          %artifact  &(?=(^ aid.t) ?=(~ msg-id.t))
        ==
      ?.  shape-ok  `state
      ::  idempotent + loop-terminating: no-op ONLY when the stored canonical record IS this
      ::  exact authenticated record. A conflicting record (or a bare-set eid with no canonical
      ::  record) must NOT block this legitimate authenticated deletion.
      ?:  =(`t (~(get by mesh-tomb-meta) eid.t))  `state
      =/  pax=path  ~[%notes nid]
      =/  pin-hit=?
        =/  pn  (~(get by note-pins) nid)
        ?~  pn  %.n
        =(eid.t target.u.pn)
      =/  new-pins=(map @ta note-pin:noltbook)
        ?:(pin-hit (~(del by note-pins) nid) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards nid ~) ~)
      =/  is-art=?  ?=(%artifact kind.t)
      =/  relay=(list card)
        %+  murn  (mesh-delete-targets u.nt is-art our.bowl pal-incoming pal-outgoing)
        |=  p=@p
        ?:  =(p src.bowl)  ~
        ?:  =(p author.t)  ~
        %-  some
        (rpoke /mesh-hint/(scot %p p) p `remote:noltbook`[%remote-mesh-delete-hint eid.t author.t])
      =/  new-meta=(map @uv mesh-tomb:noltbook)  (~(put by mesh-tomb-meta) eid.t t)
      =/  new-tombs=(set @uv)  (~(put in mesh-tombs) eid.t)
      ?:  is-art
        =/  aid=@ta  (need aid.t)
        =/  full  (~(get by artifacts) aid)
        =/  aenvs=(map @ta artifact-envelope:noltbook)
          (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
        =/  env-a  (~(get by aenvs) aid)
        ::  INDEPENDENT exact matches — one never authorizes removing the other structure.
        =/  full-match=?
          ?&  ?=(^ full)  =(note-id.u.full nid)  =(id.u.full aid)
              ?=(^ meta.u.full)  =(eid.u.meta.u.full eid.t)  =(creator.u.full author.t)
          ==
        =/  env-match=?
          ?&  ?=(^ env-a)  =(aid.u.env-a aid)
              ?=(^ meta.u.env-a)  =(eid.u.meta.u.env-a eid.t)  =(author.u.env-a author.t)
          ==
        =/  new-arts=(map @ta artifact:noltbook)  ?:(full-match (~(del by artifacts) aid) artifacts)
        =/  new-aenvs=(map @ta artifact-envelope:noltbook)  ?:(env-match (~(del by aenvs) aid) aenvs)
        =/  removed=?  |(full-match env-match)
        =/  new-notes=(map @ta note:noltbook)
          ?.  removed  notes
          %+  ~(put by notes)  nid
          %:  recompute-mesh-note  u.nt
            (fall (~(get by messages) nid) ~)
            (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
            new-aenvs
          ==
        =/  fe-cards=(list card)
          ?.  removed  ~
          =/  du=update:noltbook  [%mesh-entry-deleted nid `eid.t `aid ~]
          ~[(gf-paths ~[pax] du) (gf-notes du)]
        :_  state(mesh-tombs new-tombs, mesh-tomb-meta new-meta, artifacts new-arts, artifact-envelopes (~(put by artifact-envelopes) nid new-aenvs), notes new-notes, note-pins new-pins)
        :(weld fe-cards pin-clear-cards relay)
      ::  TEXT: remove local message/envelope by eid + author. The FE removal (msg-id from the
      ::  canonical record) drops even ephemeral remote text that was never stored in messages.
      =/  mid=@da  (need msg-id.t)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      =/  cenv=(map @da envelope:noltbook)
        (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook))
      =/  kept-msgs=(list message:noltbook)
        (skip cur |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m eid.t) =(author.m author.t))))
      =/  new-cenv=(map @da envelope:noltbook)
        %-  ~(gas by *(map @da envelope:noltbook))
        %+  skip  ~(tap by cenv)
        |=([k=@da e=envelope:noltbook] ?&(?=(^ meta.e) =(eid.u.meta.e eid.t) =(author.e author.t)))
      =/  removed=?  |(!=((lent kept-msgs) (lent cur)) !=(~(wyt by new-cenv) ~(wyt by cenv)))
      =/  new-notes=(map @ta note:noltbook)
        ?.  removed  notes
        %+  ~(put by notes)  nid
        %:  recompute-mesh-note  u.nt  kept-msgs  new-cenv
          (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
        ==
      =/  fe-cards=(list card)
        ?.  removed  ~
        =/  du=update:noltbook  [%mesh-entry-deleted nid `eid.t ~ `mid]
        ~[(gf-paths ~[pax] du) (gf-notes du)]
      :_  state(mesh-tombs new-tombs, mesh-tomb-meta new-meta, messages (~(put by messages) nid kept-msgs), gossip-envelopes (~(put by gossip-envelopes) nid new-cenv), notes new-notes, note-pins new-pins)
      :(weld fe-cards pin-clear-cards relay)
    ::
        %remote-mesh-delete-hint
      ::  {eid, author} only — fully untrusted, can NEVER determine a mutation. Suppress the
      ::  verify ONLY when we already hold the hinted author's OWN canonical record for this
      ::  eid; an unrelated record (or a bare-set eid) must not suppress verification.
      =/  hrec  (~(get by mesh-tomb-meta) eid.rem)
      ?:  ?&(?=(^ hrec) =(author.u.hrec author.rem))  `state
      ?:  =(author.rem our.bowl)  `state
      :_  state
      ~[(rpoke /mesh-verify/(scot %p author.rem) author.rem `remote:noltbook`[%remote-mesh-delete-verify eid.rem])]
    ::
        %remote-mesh-delete-verify
      ::  EID only. We (the claimed author) confirm ONLY from our stored CANONICAL record —
      ::  never echoing requester fields — replying with the authoritative record iff we hold
      ::  it and we authored it. Block state is irrelevant to authenticated cleanup.
      =/  rec  (~(get by mesh-tomb-meta) eid.rem)
      ?~  rec  `state
      ?.  =(author.u.rec our.bowl)  `state
      :_  state
      ~[(rpoke /mesh-confirm/(scot %p src.bowl) src.bowl `remote:noltbook`[%remote-mesh-delete u.rec])]
    ::  ===== ordinary-DM origin-hosting wires =====
    ::  Phase 3: protocol advertisement is inert. Both ships run the same build, so DM
    ::  reference delivery is unconditional and never gated on a stored version. The wire
    ::  variant + peer-proto field stay dormant (no state revision); nothing acts on them.
        %remote-proto-advertise  `state
    ::  receive a %file/%app reference (metadata only; no bytes, no descriptor, no Clay).
    ::  local DM by the authenticated {our,src} pair; recreate it if missing.
        %remote-dm-ref-upsert
      ::  bound the icon on the incoming complete note before validation, the
      ::  dm-pref overlay, storage, or the emitted %note-created fact.
      =.  rem  rem(note (sanitize-note-icon note.rem))
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  pnote=note:noltbook          note.rem
      =/  r=dm-artifact-ref:noltbook   ref.rem
      ::  %file OR %app only; shape must match type (file-meta present iff %file; an %app
      ::  reference must never carry file-meta or any descriptor content).
      ?.  ?|(=(%file type.r) =(%app type.r))  `state
      ?:  &(=(%file type.r) ?=(~ file-meta.r))  `state
      ?:  &(=(%app type.r) ?=(^ file-meta.r))  `state
      ?.  =(src.bowl creator.r)  `state
      ?.  =(eid.r (sham [creator.r aid.r]))  `state
      ?.  =(%dm type.pnote)  `state
      ?.  =(2 ~(wyt in users.pnote))  `state
      ?.  (~(has in users.pnote) our.bowl)  `state
      ?.  (~(has in users.pnote) src.bowl)  `state
      ?.  =(~ removed.pnote)  `state
      ?.  =(`(set @p)`(sy ~[our.bowl src.bowl]) users.pnote)  `state
      ::  terminal tombstone dominates forever
      ?:  (~(has by dm-artifact-tombs) eid.r)  `state
      =/  existing=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      ?:  ?&(?=(^ existing) !=(~ removed.u.existing))  `state
      =/  install-fresh=note:noltbook  (apply-dm-pref pnote dm-prefs our.bowl)
      =/  lnid=@ta  ?~(existing id.pnote id.u.existing)
      =/  had-note=?  (~(has by notes) lnid)
      =/  note-cards=(list card)
        ?:  had-note  ~
        ~[(gf-notes `update:noltbook`[%note-created install-fresh])]
      =/  cur-ref  (~(get by dm-artifact-refs) eid.r)
      =/  stored=dm-artifact-ref:noltbook  r(note-id lnid)
      ::  recreate a locally-left DM in EVERY outcome (never with activity/preview churn).
      =?  notes     !had-note  (~(put by notes) lnid install-fresh)
      =?  messages  !had-note  (~(put by messages) lnid ~)
      ::  P1: idempotent revision semantics.
      ::  - strictly OLDER incoming rev => reject (no ref/activity/fact change).
      ::  - EQUAL rev + identical immutable identity + empty stored hash => silently fill the
      ::    hash (hashless-migrated enrichment); NO activity/unread/sidebar/post facts.
      ::  - EQUAL rev otherwise => complete no-op (never replace a known hash/immutable field).
      ::  - NEW eid OR strictly NEWER rev => full accept (post behavior + facts).
      ?:  ?&(?=(^ cur-ref) (gth rev.u.cur-ref rev.r))
        :_  state  note-cards
      ?:  ?&(?=(^ cur-ref) =(rev.u.cur-ref rev.r))
        =/  c=dm-artifact-ref:noltbook  u.cur-ref
        =/  id-ok=?
          ?&  =(creator.c creator.r)  =(aid.c aid.r)  =(type.c type.r)
              =(created.c created.r)  =(reply-to-eid.c reply-to-eid.r)
          ==
        ?:  ?&(id-ok ?=(~ content-hash.c) ?=(^ content-hash.r))
          :_  state(dm-artifact-refs (~(put by dm-artifact-refs) eid.r c(content-hash content-hash.r)))
          note-cards
        :_  state  note-cards
      ::  accept (fresh insert or strictly newer revision).
      =/  base-note=note:noltbook  (~(got by notes) lnid)
      =/  prev=@t  ?:(=(%app type.r) 'shared an app' 'shared a file')
      =/  upd-note=note:noltbook  base-note(last-author `src.bowl, last-preview `prev)
      =/  upd=update:noltbook  [%dm-ref-upserted stored]
      :_  %=  state
            notes     (~(put by notes) lnid upd-note)
            dm-artifact-refs  (~(put by dm-artifact-refs) eid.r stored)
            note-activity  (put-activity note-activity lnid now.bowl)
            note-unread-activity  (put-unread-activity note-unread-activity lnid now.bowl)
          ==
      %+  weld  note-cards
      :~  (gf-paths ~[/notes/[lnid]] upd)
          (gf-notes upd)
          (activity-fact lnid now.bowl)
          (unread-activity-fact lnid now.bowl)
      ==
    ::  receive a terminal %file/%app deletion. The tombstone is terminal regardless of rev
    ::  and blocks any future upsert/content response for this EID.
        %remote-dm-ref-delete
      =/  pnote=note:noltbook          note.rem
      =/  t=dm-artifact-tomb:noltbook  tomb.rem
      ?.  ?|(=(%file type.t) =(%app type.t))  `state
      ?.  =(src.bowl creator.t)  `state
      ?.  =(eid.t (sham [creator.t aid.t]))  `state
      ?.  =(%dm type.pnote)  `state
      ?.  =(2 ~(wyt in users.pnote))  `state
      ?.  (~(has in users.pnote) our.bowl)  `state
      ?.  (~(has in users.pnote) src.bowl)  `state
      ?.  =(`(set @p)`(sy ~[our.bowl src.bowl]) users.pnote)  `state
      =/  existing=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      =/  lnid=@ta  ?~(existing note-id.t id.u.existing)
      =/  local-tomb=dm-artifact-tomb:noltbook  t(note-id lnid)
      =/  pin-hit=?
        =/  pn  (~(get by note-pins) lnid)
        ?~  pn  %.n
        &(=(%artifact kind.u.pn) =(eid.t target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)  ?:(pin-hit (~(del by note-pins) lnid) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards lnid ~) ~)
      =/  upd=update:noltbook  [%dm-ref-deleted eid.t aid.t lnid]
      ::  P2: complete any in-flight fetches for this EID with 404 now; their later content
      ::  responses and timeout wakes become no-ops (pending entries removed).
      =/  flushed  (flush-pending-for-eid eid.t pending-dm-fetches)
      :_  state(dm-artifact-refs (~(del by dm-artifact-refs) eid.t), dm-artifact-tombs (~(put by dm-artifact-tombs) eid.t local-tomb), note-pins new-pins, pending-dm-fetches +.flushed)
      %-  zing
      :~  ~[(gf-paths ~[/notes/[lnid]] upd) (gf-notes upd)]
          pin-clear-cards
          -.flushed
      ==
    ::  creator: serve current %file bytes (Clay) or %app descriptor (state) ephemerally,
    ::  or gone (tombstoned) / unavailable (missing/unreadable).
        %remote-dm-content-fetch
      =/  unavail=(list card)
        ~[(rpoke /dm-unavail/(scot %p src.bowl)/[eyre-id.rem] src.bowl `remote:noltbook`[%remote-dm-content-unavailable eyre-id.rem eid.rem])]
      ::  P2: identity + membership gate BEFORE any tombstone reveal, so an unrelated ship
      ::  cannot probe arbitrary EIDs. The EID must be our own (sham [our aid]); the requester
      ::  must be the other member of our ordinary DM (authenticated {our,src} pair).
      ?.  =(eid.rem (sham [our.bowl aid.rem]))  `state
      ?:  (~(has in pal-blocked) src.bowl)  `state
      =/  pair-dm=(unit note:noltbook)  (find-dm-root notes (sy ~[our.bowl src.bowl]))
      ?~  pair-dm  `state
      ?.  (is-ordinary-dm u.pair-dm)  `state
      ?:  (~(has by dm-artifact-tombs) eid.rem)
        =/  t  (~(got by dm-artifact-tombs) eid.rem)
        ?.  &(=(aid.t aid.rem) =(our.bowl creator.t))  `state
        :_  state
        ~[(rpoke /dm-gone/(scot %p src.bowl)/[eyre-id.rem] src.bowl `remote:noltbook`[%remote-dm-content-gone eyre-id.rem t])]
      =/  art  (~(get by artifacts) aid.rem)
      ::  missing authoritative artifact => unavailable now (not a silent wait to timeout)
      ?~  art  [unavail state]
      ?.  =(our.bowl creator.u.art)  `state
      =/  nt  (~(get by notes) note-id.u.art)
      ?~  nt  `state
      ?.  (is-ordinary-dm u.nt)  `state
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?.  (~(has in users.u.nt) src.bowl)  `state
      ?:  (~(has in removed.u.nt) src.bowl)  `state
      ?.  (~(has in users.u.nt) our.bowl)  `state
      ::  kind must match the artifact's actual type
      ?.  =(kind.rem ?:(=(%app type.u.art) %app %file))  `state
      ?:  =(%app type.u.art)
        ::  %app: serve the current descriptor from the artifacts map (never Clay).
        ?~  versions.u.art  [unavail state]
        =/  content=@t  content:(rear versions.u.art)
        ?.  (valid-app-artifact-content content)  [unavail state]
        =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of u.art note-id.u.art `(sham content))
        ?~  ref  [unavail state]
        :_  state
        ~[(rpoke /dm-content/(scot %p src.bowl)/[eyre-id.rem] src.bowl `remote:noltbook`[%remote-dm-app-content eyre-id.rem u.ref content])]
      ::  %file: serve current bytes from the separate %noltbook-data desk (never q.byk.bowl)
      =/  scry-res  (art-store-read our.bowl now.bowl aid.rem)
      ?~  scry-res  [unavail state]
      =/  mim=mime  u.scry-res
      =/  mtype=@t  (rap 3 (join '/' p.mim))
      =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of u.art note-id.u.art `(sham q.q.mim))
      ?~  ref  [unavail state]
      :_  state
      ~[(rpoke /dm-content/(scot %p src.bowl)/[eyre-id.rem] src.bowl `remote:noltbook`[%remote-dm-file-content eyre-id.rem u.ref mtype q.mim])]
    ::  requester: complete the held HTTP request with fetched %file bytes; never persist.
    ::  P2: any authenticated-but-mismatched/stale/tombstoned response completes the held
    ::  request with 404 (never hangs to timeout); a stranger's response is ignored.
        %remote-dm-file-content
      =/  pend  (~(get by pending-dm-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(src.bowl creator.u.pend)  `state
      =/  fail-404
        :_  state(pending-dm-fetches (~(del by pending-dm-fetches) eyre-id.rem))
        (give-simple-payload:app:server eyre-id.rem `simple-payload:http`[[404 ~] ~])
      ?.  ?=(%file kind.u.pend)  fail-404
      ?.  =(eid.ref.rem eid.u.pend)  fail-404
      ?.  =(aid.ref.rem aid.u.pend)  fail-404
      ?.  =(%file type.ref.rem)  fail-404
      ?.  =(src.bowl creator.ref.rem)  fail-404
      ?.  =(eid.ref.rem (sham [creator.ref.rem aid.ref.rem]))  fail-404
      ::  tombstoned while pending => 404, never the bytes.
      ?:  (~(has by dm-artifact-tombs) eid.u.pend)  fail-404
      ::  require a currently LIVE matching reference, not older than the response.
      =/  cur-ref  (~(get by dm-artifact-refs) eid.u.pend)
      ?~  cur-ref  fail-404
      ?.  =(aid.u.cur-ref aid.ref.rem)  fail-404
      ?:  (gth rev.u.cur-ref rev.ref.rem)  fail-404
      ?~  content-hash.ref.rem  fail-404
      ?.  =(u.content-hash.ref.rem (sham q.bytes.rem))  fail-404
      ::  enrich the live ref (same-rev hash fill or newer); never downgrade.
      =.  dm-artifact-refs
        %+  ~(put by dm-artifact-refs)  eid.u.pend
        u.cur-ref(rev rev.ref.rem, content-hash content-hash.ref.rem, file-meta file-meta.ref.rem, name name.ref.rem, updated updated.ref.rem)
      ::  DM reference bytes: same policy, applied unconditionally (see above).
      =/  =simple-payload:http
        %+  art-serve-payload
          [(parse-mime-path mime.rem) bytes.rem]
        [name.ref.rem | 'no-store']
      :_  state(pending-dm-fetches (~(del by pending-dm-fetches) eyre-id.rem))
      (give-simple-payload:app:server eyre-id.rem simple-payload)
    ::  requester: complete the held HTTP request with the fetched %app descriptor; never
    ::  persist it (no state.artifacts, no Clay, no durable cache — only the HTTP body).
    ::  P2: mismatched/stale/tombstoned responses complete with 404; strangers are ignored.
        %remote-dm-app-content
      =/  pend  (~(get by pending-dm-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(src.bowl creator.u.pend)  `state
      =/  fail-404
        :_  state(pending-dm-fetches (~(del by pending-dm-fetches) eyre-id.rem))
        (give-simple-payload:app:server eyre-id.rem `simple-payload:http`[[404 ~] ~])
      ?.  ?=(%app kind.u.pend)  fail-404
      ?.  =(eid.ref.rem eid.u.pend)  fail-404
      ?.  =(aid.ref.rem aid.u.pend)  fail-404
      ?.  =(%app type.ref.rem)  fail-404
      ?.  =(src.bowl creator.ref.rem)  fail-404
      ?.  =(eid.ref.rem (sham [creator.ref.rem aid.ref.rem]))  fail-404
      ?:  (~(has by dm-artifact-tombs) eid.u.pend)  fail-404
      =/  cur-ref  (~(get by dm-artifact-refs) eid.u.pend)
      ?~  cur-ref  fail-404
      ?.  =(aid.u.cur-ref aid.ref.rem)  fail-404
      ?:  (gth rev.u.cur-ref rev.ref.rem)  fail-404
      ?.  (valid-app-artifact-content content.rem)  fail-404
      ?~  content-hash.ref.rem  fail-404
      ?.  =(u.content-hash.ref.rem (sham content.rem))  fail-404
      =.  dm-artifact-refs
        %+  ~(put by dm-artifact-refs)  eid.u.pend
        u.cur-ref(rev rev.ref.rem, content-hash content-hash.ref.rem, name name.ref.rem, updated updated.ref.rem)
      =/  hdrs=(list [@t @t])
        :~  ['content-type' 'application/json']
            ['cache-control' 'no-store']
            ['x-content-type-options' 'nosniff']
        ==
      =/  =simple-payload:http  [[200 hdrs] `(as-octs:mimes:html content.rem)]
      :_  state(pending-dm-fetches (~(del by pending-dm-fetches) eyre-id.rem))
      (give-simple-payload:app:server eyre-id.rem simple-payload)
    ::  Part 9: content temporarily unavailable — 503, keep the live reference.
        %remote-dm-content-unavailable
      =/  pend  (~(get by pending-dm-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(src.bowl creator.u.pend)  `state
      ?.  =(eid.rem eid.u.pend)  `state
      :_  state(pending-dm-fetches (~(del by pending-dm-fetches) eyre-id.rem))
      (give-simple-payload:app:server eyre-id.rem `simple-payload:http`[[503 ~] ~])
    ::  Part 9: content authoritatively deleted — 404, store terminal tomb, drop ref.
        %remote-dm-content-gone
      =/  pend  (~(get by pending-dm-fetches) eyre-id.rem)
      ?~  pend  `state
      ?.  =(src.bowl creator.u.pend)  `state
      =/  t=dm-artifact-tomb:noltbook  tomb.rem
      ?.  =(eid.t eid.u.pend)  `state
      ?.  =(src.bowl creator.t)  `state
      ?.  =(eid.t (sham [creator.t aid.t]))  `state
      =/  ex  (~(get by dm-artifact-refs) eid.t)
      =/  lnid=@ta  ?~(ex note-id.t note-id.u.ex)
      =/  local-tomb=dm-artifact-tomb:noltbook  t(note-id lnid)
      =/  pin-hit=?
        =/  pn  (~(get by note-pins) lnid)
        ?~  pn  %.n
        &(=(%artifact kind.u.pn) =(eid.t target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)  ?:(pin-hit (~(del by note-pins) lnid) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards lnid ~) ~)
      =/  upd=update:noltbook  [%dm-ref-deleted eid.t aid.t lnid]
      ::  P2: 404 EVERY pending fetch for this EID (incl. this eyre-id), then install the tomb.
      =/  flushed  (flush-pending-for-eid eid.t pending-dm-fetches)
      :_  %=  state
            dm-artifact-refs    (~(del by dm-artifact-refs) eid.t)
            dm-artifact-tombs   (~(put by dm-artifact-tombs) eid.t local-tomb)
            note-pins           new-pins
            pending-dm-fetches  +.flushed
          ==
      %-  zing
      :~  -.flushed
          ~[(gf-paths ~[/notes/[lnid]] upd) (gf-notes upd)]
          pin-clear-cards
      ==
    ::
        %remote-wallet-activity
      ::  An authenticated ship reports it submitted a payment to us through Noltbook.
      ::  TRUST BOUNDARY: Ames/Gall prove WHICH ship said this. They do not prove the
      ::  payment exists, that it is confirmed on Nockchain, that it is final, or that
      ::  the sender controls any wallet address. A non-blocked ship can lie about a
      ::  payment it never made; retention is what bounds the clutter. Only chain
      ::  verification could do better, and that is out of scope.
      ::  Every check below returns before any state change, fact or card.
      ?:  (~(has in pal-blocked) src.bowl)  `state
      ?:  =(0 amount.rem)  `state
      ::  the client receives amount as a JSON number, so anything past 2^53-1 would
      ::  silently lose precision there. Reject rather than display a wrong figure.
      ?:  (gth amount.rem 9.007.199.254.740.991)  `state
      =/  idb=@ud  (met 3 tx-hash.rem)
      ?:  =(0 idb)  `state
      ?:  (gth idb 128)  `state
      ?.  (wallet-id-clean tx-hash.rem)  `state
      ::  Dedup key: direction + counterparty + FULL identifier. Counterparty is the
      ::  authenticated sender, never a payload field. A duplicate or replay is a silent
      ::  no-op: no row, no %wallet-update, no card, no slog.
      ::  LIMIT: this compares against RETAINED activity only. An identifier that has
      ::  aged out of the newest 100 is no longer replay-protected. Deliberate -- no
      ::  tombstone map and no migration in this pass.
      =/  cp=@t  (scot %p src.bowl)
      =/  dup=?
        %+  lien  transactions
        |=  t=transaction:noltbook
        ?&  =(%received type.t)
            =(cp counterparty.t)
            =(tx-hash.rem tx-hash.t)
        ==
      ?:  dup  `state
      =/  tx=transaction:noltbook  [%received cp amount.rem tx-hash.rem now.bowl]
      =/  new-txs=(list transaction:noltbook)  (wallet-retain tx transactions src.bowl)
      =/  upd=update:noltbook  [%wallet-update new-txs]
      :_  state(transactions new-txs)
      ~[(gf-notes upd)]
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
::  logical-members-of: note-members row if present (authoritative even when EMPTY);
::  else fall back to an existing note's note.users; else the empty set. The fallback
::  protects ordinary notes created before 1B activation and un-propagated remote copies.
::  Read-only — never persists.
++  logical-members-of
  |=  $:  nid=@ta
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (set @p)
  =/  row  (~(get by nm) nid)
  ?^  row  u.row
  =/  nt  (~(get by nmap) nid)
  ?~  nt  ~
  users.u.nt
::  human-sees-note: may the local human `who` see nid? System notes always; otherwise
::  logical membership. A physical creator/transport host is NOT visible by creator alone.
++  human-sees-note
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  ?
  ?:  |(=(nid %cover) =(nid %ars-rumors))  &
  (~(has in (logical-members-of nid nm nmap)) who)
::  put/del-logical-member (1B.1): a PRESENT note-members row is authoritative even when
::  empty; an ABSENT row derives from note.users. So the mutation base is
::  logical-members-of, and both always WRITE a row (incl. empty) — they never delete
::  the key (only physical note deletion removes a row). Never touch note.users.
++  put-logical-member
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  (~(put by nm) nid (~(put in (logical-members-of nid nm nmap)) who))
++  del-logical-member
  |=  $:  nid=@ta  who=@p
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  (~(put by nm) nid (~(del in (logical-members-of nid nm nmap)) who))
::  set-logical-members: write the supplied logical set verbatim, including empty (an
::  explicit empty row means "transport peers may exist but zero logical humans").
++  set-logical-members
  |=  [nid=@ta s=(set @p) nm=(map @ta (set @p))]
  ^-  (map @ta (set @p))
  (~(put by nm) nid s)
::  ensure-note-members: give every live note an EXPLICIT note-members row on load, so
::  visibility never depends on the derive-fallback for an existing note. The fold is
::  SEEDED FROM nm (acc=_nm), so a stored row is authoritative and is returned unchanged
::  — including an explicitly EMPTY row, which means "transport peers may exist but zero
::  logical humans". Only a live note with NO row gets one, seeded from note.users.
::  Never prunes: a row for a missing note is left alone (physical note deletion owns
::  that). Read-and-return only.
++  ensure-note-members
  |=  $:  nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  %-  ~(rep by nmap)
  |=  [[nid=@ta nt=note:noltbook] acc=_nm]
  ?:  (~(has by acc) nid)  acc
  (~(put by acc) nid users.nt)
::  add/del-member-to-ids: apply a logical membership change across a root + its shared
::  descendants (mirrors the note.users cascade). Always writes rows (incl. empty).
++  add-member-to-ids
  |=  $:  who=@p  ids=(list @ta)
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  ?~  ids  nm
  $(ids t.ids, nm (put-logical-member i.ids who nm nmap))
++  del-member-from-ids
  |=  $:  who=@p  ids=(list @ta)
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  ?~  ids  nm
  $(ids t.ids, nm (del-logical-member i.ids who nm nmap))
::  add-ships-to-ids: add a SET of humans across a root+descendants (batch invite cascade).
++  add-ships-to-ids
  |=  $:  whos=(set @p)  ids=(list @ta)
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (map @ta (set @p))
  %-  ~(rep in whos)
  |=  [w=@p acc=_nm]
  (add-member-to-ids w ids acc nmap)
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
          nmap=(map @ta note:noltbook)
          cards=(list card:agent:gall)
      ==
  ^-  (list card:agent:gall)
  ?:  (human-sees-note nid who nm nmap)  cards
  (drop-local-notes-facts cards)
::  delete-note-artifact: the single authoritative shared-note (%group/%notebook) artifact
::  deletion path. Callable by the host directly (sender=our.bowl) or via the host-bound
::  %remote-artifact-delete wire (sender=src.bowl). WE must host the note. Validates the
::  sender is a current permitted participant AND is the artifact creator, the note host,
::  or a current admin. On success it installs a terminal aid-keyed tombstone (blocking any
::  replayed create/update resurrection), removes the artifact + any pin targeting it,
::  appends a durable \01SYS:art-delete control message carrying the deleter's role
::  (author/host/admin, derived from the authenticated sender), and broadcasts both
::  %artifact-deleted and the system %new-message on /notes/[nid]. Every validation failure
::  — unknown/foreign note, not hosted here, wrong type, non-member, missing/foreign
::  artifact, already-tombstoned, or unauthorized sender — is a harmless no-op ([~ st]), so
::  duplicate and replayed requests neither mutate state nor emit a marker.
++  delete-note-artifact
  |=  [=bowl:gall sender=@p nid=@ta aid=@ta st=state-76]
  ^-  [(list card:agent:gall) state-76]
  =/  nt  (~(get by notes.st) nid)
  ?~  nt  [~ st]
  ::  we must host this note; shared %group/%notebook only
  ?.  =(our.bowl creator.u.nt)  [~ st]
  ?.  ?|(?=(%group type.u.nt) ?=(%notebook type.u.nt))  [~ st]
  ::  sender must be a current, non-removed participant
  ?.  (~(has in users.u.nt) sender)  [~ st]
  ?:  (~(has in removed.u.nt) sender)  [~ st]
  ::  target artifact must exist AND belong to this note
  =/  art  (~(get by artifacts.st) aid)
  ?~  art  [~ st]
  ?.  =(nid note-id.u.art)  [~ st]
  ::  scope: only %file/%app artifacts. %code (and any other) falls through to its
  ::  pre-change behavior — this path never touches it.
  ?.  ?|(=(%file type.u.art) =(%app type.u.art))  [~ st]
  ::  terminal tombstone already present => no-op (defensive; blocks dupes/races)
  ?:  (~(has by note-artifact-tombs.st) aid)  [~ st]
  ::  authority: artifact creator, note host, or current admin
  =/  admins=(set @p)  (fall (~(get by note-admins.st) nid) ~)
  =/  is-creator=?  =(sender creator.u.art)
  =/  is-host=?     =(sender our.bowl)
  =/  is-admin=?    (~(has in admins) sender)
  ?.  ?|(is-creator is-host is-admin)  [~ st]
  ::  role for the durable marker — creator-first, then host, then admin
  =/  role=tape  ?:(is-creator "author" ?:(is-host "host" "admin"))
  =/  eid=@uv  (dm-artifact-eid u.art)
  ::  clear an active pin that targeted this artifact (host-authoritative)
  =/  pin-hit=?
    =/  pn  (~(get by note-pins.st) nid)
    ?~  pn  %.n
    &(=(%artifact kind.u.pn) =(eid target.u.pn))
  =/  new-pins=(map @ta note-pin:noltbook)
    ?:(pin-hit (~(del by note-pins.st) nid) note-pins.st)
  =/  pin-clear-cards=(list card:agent:gall)  ?:(pin-hit (pin-cards nid ~) ~)
  ::  terminal tombstone (aid-keyed), installed atomically with artifact removal
  =/  tomb=note-artifact-tomb:noltbook  [aid eid creator.u.art nid sender now.bowl]
  ::  durable deletion marker — reuse the \01SYS control-message mechanism (renders as a
  ::  compact system line; no user-authored content, no edit/delete controls). It is a
  ::  normal modern hosted-note entry: allocate the next per-note sequence and stamp
  ::  entry-meta with a deterministic EID (over stable, authenticated deletion inputs),
  ::  that sequence, rev 0, created/updated=now, reply-to-eid=~. author is the AUTHENTICATED
  ::  sender (the deleter), so the deleter does not receive their own marker as unread.
  =/  txt=@t
    (crip ;:(weld "\01SYS:art-delete:" role ":" (trip (scot %p sender))))
  =/  cur-seq=@ud  (fall (~(get by seq-counters.st) nid) 0)
  =/  nxt-seq=@ud  +(cur-seq)
  =/  marker-eid=@uv  (sham [%art-delete our.bowl nid aid sender now.bowl nxt-seq])
  =/  em=(unit entry-meta:noltbook)
    `[marker-eid nxt-seq 0 now.bowl now.bowl ~]
  =/  sys-msg=message:noltbook  [now.bowl nid sender txt now.bowl ~ %.n em]
  =/  old-msgs=(list message:noltbook)  (fall (~(get by messages.st) nid) ~)
  =/  new-msgs=(list message:noltbook)  (snoc old-msgs sys-msg)
  =/  del-upd=update:noltbook  [%artifact-deleted aid]
  =/  msg-upd=update:noltbook  [%new-message sys-msg ~ ~ ~]
  =/  pax=path  ~[%notes nid]
  =/  st2=state-76
    %=  st
      artifacts             (~(del by artifacts.st) aid)
      note-pins             new-pins
      note-artifact-tombs   (~(put by note-artifact-tombs.st) aid tomb)
      messages              (~(put by messages.st) nid new-msgs)
      seq-counters          (~(put by seq-counters.st) nid nxt-seq)
    ==
  ::  physical cleanup: ONLY when we own the bytes. A host or admin deleting another
  ::  member's %file artifact must not touch any local path -- the bytes live on the
  ::  creator's ship, which cleans up when it sees the authoritative %artifact-deleted.
  =/  byte-del=(list card:agent:gall)
    ?.  ?&(=(%file type.u.art) =(our.bowl creator.u.art))  ~
    (art-store-del-cards our.bowl now.bowl aid)
  :_  st2
  %+  weld  byte-del
  ^-  (list card:agent:gall)
  %:  human-note-cards  nid  our.bowl
      note-members.st  notes.st
    ;:  weld
      ~[(gf-paths ~[pax] del-upd)]
      ~[(gf-paths ~[pax] msg-upd)]
      pin-clear-cards
    ==
  ==
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
          nmap=(map @ta note:noltbook)
          cards=(list card:agent:gall)
      ==
  ^-  (list card:agent:gall)
  ?:  (human-sees-note nid who nm nmap)  cards
  (drop-local-relay-facts cards)
::  visible-note-ids: every nid the local human principal may see (system + member).
++  visible-note-ids
  |=  $:  who=@p
          nm=(map @ta (set @p))
          nmap=(map @ta note:noltbook)
      ==
  ^-  (set @ta)
  %-  ~(gas in *(set @ta))
  %+  murn  ~(tap by nmap)
  |=  [nid=@ta n=note:noltbook]
  ^-  (unit @ta)
  ?:  (human-sees-note nid who nm nmap)  `nid  ~
::  can-user-post: the gate for human posting — not write-blocked AND a logical
::  member. The existing writable/muted/role checks remain at the call sites;
::  creator==our.bowl alone never satisfies this.
++  can-user-post
  |=  $:  nid=@ta  who=@p
          hs=(map @ta ?(%host-deleted %host-unreachable))
          nmap=(map @ta note:noltbook)
          nm=(map @ta (set @p))
      ==
  ^-  ?
  ?:  (is-write-blocked nid hs nmap who)  %.n
  (human-sees-note nid who nm nmap)
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
=|  state-76
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
  (weld ~[bind] (ensure-data-desk bowl))
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  ::  TWO accepted shapes and no ladder: %75 (the previous development state, migrated
  ::  exactly once) and %76 (our own, on every reload after that). Anything else is a
  ::  foreign or corrupt noun and fails loudly rather than being coerced. state-75 is
  ::  FROZEN -- !< nests on the mold, so narrowing anything in it breaks the decode.
  ?>  ?|(?=([%75 *] q.old) ?=([%76 *] q.old))
  =/  base=state-76
    ?:  ?=([%76 *] q.old)  !<(state-76 old)
    (upgrade-75-to-76 !<(state-75 old))
  =/  based=state-76
    %=  base
      note-members       (ensure-note-members note-members.base notes.base)
      app-notifications  (app-notifications-live app-notifications.base now.bowl)
      ::  in-flight lookups cannot survive a reload; the 28s frontend timeout covers it
      pending-profile-lookups  *(map @ud pending-profile-lookup:noltbook)
      ::  app-cap stays broad for storage compatibility, so strip any inert label from
      ::  every decoded row here.
      app-grants               (clamp-app-grants app-grants.base)
    ==
  ::  Reload. A reload is only authoritative for calls WE host, so the two cases differ:
  ::
  ::    hosted + active  -- we can no longer vouch for the participants (their leases and
  ::                        our timers are gone), so end it and advance the revision once.
  ::                        Broadcasting that is what makes the other ship's badge clear
  ::                        instead of lingering, which the old silent wipe caused.
  ::    hosted + empty   -- nothing changed, so the revision must NOT move. Bumping it on
  ::                        every reload would inflate our own revision for no reason.
  ::    hosted elsewhere -- keep the cached snapshot VERBATIM and ask that host for the
  ::                        truth. Synthesising an empty at the same revision is what
  ::                        broke recovery: the host's real active answer then compared
  ::                        as a duplicate and was rejected, so a member could never heal.
  =/  hosted-active=(list @ta)
    %+  murn  ~(tap by calls.based)
    |=  [nid=@ta sn=call-snapshot:noltbook]
    ^-  (unit @ta)
    ?~  call.sn  ~
    =/  nt  (~(get by notes.based) nid)
    ?~  nt  ~
    ?.  =(our.bowl creator.u.nt)  ~
    `nid
  =/  ended=(set @ta)  (sy hosted-active)
  =/  reloaded=(map @ta call-snapshot:noltbook)
    %-  ~(gas by *(map @ta call-snapshot:noltbook))
    %+  turn  ~(tap by calls.based)
    |=  [nid=@ta sn=call-snapshot:noltbook]
    ^-  [@ta call-snapshot:noltbook]
    ?.  (~(has in ended) nid)  [nid sn]
    [nid [nid +(gen.sn) ~]]
  =/  based=state-76
    based(calls reloaded, call-leases *(map @ta (map @p @da)))
  ::  idempotent normalization of remote-owned ordinary-DM %file/%app artifacts into
  ::  content-free references (no content read/write; nothing serveable by a noncreator).
  =/  loaded=state-76  (migrate-dm-artifacts our.bowl based)
  ::  tell our own browser the full call list (which now includes any PRESERVED remote
  ::  cache), tell the members of every call we just ended that it is over, and ask every
  ::  remote host for its current truth. Those three are why a reload converges on both
  ::  ships without a manual %clear-calls. The browser may briefly show a preserved
  ::  remote call; the host's reply then either duplicates it (ignored) or supersedes it.
  ::  broadcast ONLY the endings this reload actually authored. A hosted call that was
  ::  already empty, and every call hosted elsewhere, is left alone.
  =/  host-end-cards=(list card)
    %-  zing
    %+  turn  ~(tap in ended)
    |=  nid=@ta
    ^-  (list card)
    =/  nt  (~(get by notes.loaded) nid)
    ?~  nt  ~
    =/  sn  (~(get by calls.loaded) nid)
    ?~  sn  ~
    (call-snap-cards users.u.nt u.sn our.bowl)
  =/  call-cards=(list card)
    :(weld host-end-cards ~[(gf-notes `update:noltbook`[%call-list ~(val by calls.loaded)])] (call-sync-cards notes.loaded our.bowl))
  =/  prof  (fall (~(get by profiles.loaded) our.bowl) *profile:noltbook)
  =/  prof-cards=(list card)
    %+  turn  ~(tap in peers.loaded)
    |=  p=@p
    ^-  card
    (rpoke /prof-out/(scot %p p) p `remote:noltbook`[%remote-profile our.bowl prof])
  ::  Phase 3: no protocol advertisement — both ships run the same build. DM reference
  ::  delivery is unconditional; peer-proto is left dormant (no state revision).
  [:(weld prof-cards call-cards (ensure-data-desk bowl)) this(state loaded)]
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%api %results ~]
    ::  same-ship %noltbook-api clients observe per-request result facts here.
    ::  No backlog/initial state: results are only emitted live going forward.
    ?>  =(src.bowl our.bowl)
    `this
  ::
      [%notes ~]
    ::  local frontend only
    ?>  =(src.bowl our.bowl)
    =/  sys  (ensure-system-notes notes messages our.bowl)
    =/  notes-now=(map @ta note:noltbook)  notes.sys
    =/  messages-now=(map @ta (list message:noltbook))  messages.sys
    ::  Phase 1B: the local human principal only hydrates notes it logically sees
    ::  (system notes + note-members).
    ::  note-list stays an authoritative replacement; every per-note snapshot below is
    ::  guarded by vis-set so we never hydrate state for a note the human can't see.
    =/  vis-set=(set @ta)
      (visible-note-ids our.bowl note-members notes-now)
    =/  note-list=(list note:noltbook)
      (skim ~(val by notes-now) |=(n=note:noltbook (~(has in vis-set) id.n)))
    =/  upd=update:noltbook  [%note-list note-list import-only-dms]
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
    ::  durable reconciliation: on session start push our authoritative pal view to
    ::  every ship we have a relationship with, so a missed hey/bye or one-sided state
    ::  loss self-heals. bounded one-shot (no timer), relationship ships only.
    =/  pal-sync-set=(set @p)
      =/  s=(set @p)  (~(uni in pal-outgoing) pal-incoming)
      =/  s=(set @p)  (~(uni in s) pal-blocked)
      (~(del in s) our.bowl)
    =/  pal-sync-cards=(list card)
      %+  turn  ~(tap in pal-sync-set)
      |=(p=@p (pal-sync-card p pal-outgoing pal-incoming pal-blocked))
    =/  contactupd=update:noltbook  [%contact-list ~(tap in contacts)]
    =/  dialupd=update:noltbook  [%dial-update dial]
    ::  NOLTBOOK ACTIVITY reload hydration. %wallet-update is an authoritative
    ::  REPLACEMENT on the client (it assigns, never appends), so re-sending the
    ::  whole list on every /notes watch cannot duplicate rows.
    =/  walletupd=update:noltbook  [%wallet-update transactions]
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
    ::  ONE authoritative replacement of the whole visible call set, not a fact per
    ::  note. Empty records travel too, so the browser inherits our generations and can
    ::  reject a stale per-note fact that arrives after hydration.
    =/  call-cards=(list card)
      ~[(gf-paths ~ `update:noltbook`[%call-list (visible-call-snaps calls vis-set)])]
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
          (gf-paths ~ walletupd)
      ==
    ::  Part 11: authoritative per-DM %file reference snapshots (only DMs that have refs).
    =/  dm-ref-cards=(list card)
      %-  zing
      %+  turn  ~(tap by notes-now)
      |=  [nid=@ta n=note:noltbook]
      ^-  (list card)
      ?.  (~(has in vis-set) nid)  ~
      ?.  (is-ordinary-dm n)  ~
      =/  rl=(list dm-artifact-ref:noltbook)  (dm-refs-for-note nid dm-artifact-refs)
      ?~  rl  ~
      ~[(gf-paths ~ `update:noltbook`[%dm-ref-list nid rl])]
    :_  this(notes notes-now, messages messages-now, notification-acks pruned-acks, note-activity pruned-activity, note-unread-activity pruned-unread-activity, note-read pruned-read, app-notifications pruned-app-notifications)
    =/  build-cards=(list card)
      ~[(gf-paths ~ `update:noltbook`[%build-stamp (build-stamp bowl)])]
    :(weld build-cards init-cards pal-sync-cards mention-cards attention-cards call-cards active-cards jr-cards role-cards bb-cards hs-cards lineage-cards pfi-cards ack-cards activity-cards read-cards unread-activity-cards app-notification-cards dm-ref-cards)
  ::
      [%notes @ ~]
    =/  nid=@ta  i.t.path
    ::  permission check. Phase 1B: a LOCAL (src==our) human subscription must pass
    ::  logical membership (system notes exempt) so the human can't open a note it is
    ::  not a member of via /notes/[nid]; local apps use the developer API reads.
    ::  REMOTE subscribers stay authorized by note.users (transport) — this never blocks
    ::  a remote transport carrier whose human is not a logical member.
    ?>  ?|  ?&  =(src.bowl our.bowl)
                (human-sees-note nid our.bowl note-members notes)
            ==
            ?&  !(~(has in import-only-dms) nid)
                =/  note  (~(get by notes) nid)
                ?&  ?=(^ note)
                    (~(has in users.u.note) src.bowl)
                ==
            ==
            =(nid %cover)
            =(nid %ars-rumors)
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
        =/  served-msgs=(list message:noltbook)
          ?:(is-local msgs (dm-import-free-messages msgs dm-imports))
        ~[(gf-paths ~ `update:noltbook`[%message-list nid served-msgs arts (api-via-snapshot served-msgs arts via-by-eid) ?:(is-local (dm-import-snapshot served-msgs dm-imports) ~)])]
      ?:  is-local
        ::  local frontend: own-authored messages + all envelopes for re-fetch
        ::  Phase 11C hardening: hydrate stored envs' via before sending.
        =/  all-envs=(list envelope:noltbook)  (api-envs-hydrate ~(val by nenv) via-by-eid)
        =/  env-cards=(list card)
          ?~  all-envs  ~
          ~[(gf-paths ~ `update:noltbook`[%envelope-list nid all-envs])]
        [(gf-paths ~ `update:noltbook`[%message-list nid msgs arts (api-via-snapshot msgs arts via-by-eid) (dm-import-snapshot msgs dm-imports)]) env-cards]
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
    ::  Always send a snapshot for this note, INCLUDING the empty one. This is the
    ::  self-healing hinge: a remote member's persistent /remote-note subscription is
    ::  re-established on either ship's reload, and the snapshot it receives here is
    ::  what clears a call whose ending it missed.
    =/  call-cards=(list card)
      =/  cur  (~(get by calls) nid)
      =/  snap=call-snapshot:noltbook  ?~(cur [nid 0 ~] u.cur)
      ~[(gf-paths ~ `update:noltbook`[%call-snap snap])]
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
    ::  Part 11: authoritative %file reference snapshot for a LOCAL ordinary-DM open
    ::  (replacement semantics; an empty list clears any stale frontend refs).
    =/  dm-ref-snapshot-cards=(list card)
      ?.  is-local  ~
      ?~  note-for-type  ~
      ?.  (is-ordinary-dm u.note-for-type)  ~
      ~[(gf-paths ~ `update:noltbook`[%dm-ref-list nid (dm-refs-for-note nid dm-artifact-refs)])]
    :_  this(peers new-peers)
    :(weld init-cards ~[(gf-paths ~ pupd)] intro-cards call-cards note-role-cards pin-snapshot-cards active-snapshot-cards jr-admin-cards art-env-cards dm-ref-snapshot-cards)
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
    ::  visible notes (system + note-members).
    =/  jon=json
      %+  frond:enjs:format  'notes'
      :-  %a
      %+  turn
        %+  skim  ~(val by notes)
        |=(n=note:noltbook (human-sees-note id.n our.bowl note-members notes))
      |=(n=note:noltbook (api-note-json n (~(get by note-apps) id.n) (~(get by note-active) id.n) now.bowl ~(wyt in (logical-members-of id.n note-members notes))))
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
  ::  App grants: host/developer read of every local app-desk grant.
  ::
      [%x %api %app-grants ~]
    =/  jon=json
      %+  frond:enjs:format  'grants'
      a+(turn ~(val by app-grants) api-grant-json)
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
          ['messages' a+(turn msgs |=(m=message:noltbook (api-msg-json m via-by-eid dm-imports)))]
          ['artifacts' a+(turn arts |=(a=artifact:noltbook (api-art-json a via-by-eid)))]
          ['app' (api-app-json (~(get by note-apps) nid))]
          ['pin' (api-pin-json (~(get by note-pins) nid) nid messages artifacts)]
          ['active' (api-active-json (~(get by note-active) nid) now.bowl)]
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
    =/  live=(list call-info:noltbook)
      %+  murn  ~(val by calls)
      |=(sn=call-snapshot:noltbook call.sn)
    =/  jon=json  (frond:enjs:format 'calls' a+(turn live api-call-json))
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %calls ~]
    =/  nid=@ta  i.t.t.t.path
    =/  c  (~(get by calls) nid)
    =/  cs=(list call-info:noltbook)
      ?~  c  ~
      ?~  call.u.c  ~
      ~[u.call.u.c]
    =/  jon=json
      %-  pairs:enjs:format
      :~  ['noteId' s+(crip (trip nid))]
          ['calls' a+(turn cs api-call-json)]
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
    =/  logical=(set @p)  (logical-members-of nid note-members notes)
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
          ::  creator is %admin only when it is itself a logical member; explicit real
          ::  admins keep %admin only while participating.
          =/  role=@tas
            ?:  ?&  ?|(=(s creator.nt) (~(has in admins) s))
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
      (api-capabilities-pairs nid nt our.bowl note-admins note-muted host-status note-members notes)
    ::  gossipLink: the shareable ~gnote token, matching the browser's
    ::  copyGossipNoteLink shape exactly: ~gnote[nid|~sharer|name|desc|image],
    ::  each of name/desc/image url-encoded. null for non-gossip notes.
    =/  gossip-link=json
      ?.  =(%gossip type.nt)  ~
      =/  enc  |=(t=@t `tape`(en-urlt:html (trip t)))
      =/  tok=@t
        %-  crip
        ;:  weld
          "~gnote["  (trip id.nt)
          "|"  (trip (scot %p our.bowl))
          "|"  (enc name.nt)
          "|"  (enc ?~(headline.nt '' u.headline.nt))
          "|"  (enc ?~(icon-url.nt '' u.icon-url.nt))
          "]"
        ==
      s+tok
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
          ['userCount' (numb:enjs:format ~(wyt in (logical-members-of nid note-members notes)))]
          ['removedCount' (numb:enjs:format ~(wyt in removed.nt))]
          ['iconUrl' ?~(icon-url.nt ~ s+u.icon-url.nt)]
          ['headline' ?~(headline.nt ~ s+u.headline.nt)]
          ['gossipLink' gossip-link]
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
      ==
    ``[%json !>(jon)]
  ::
      [%x %api %notes @ %capabilities ~]
    =/  nid=@ta  i.t.t.t.path
    =/  nt-u=(unit note:noltbook)  (~(get by notes) nid)
    ?~  nt-u  ~
    =/  caps=(list [@t json])
      (api-capabilities-pairs nid u.nt-u our.bowl note-admins note-muted host-status note-members notes)
    =/  all=(list [@t json])  [['noteId' s+(crip (trip nid))] caps]
    ``[%json !>((pairs:enjs:format all))]
  ::
      [%x %notes ~]
    ::  1B.1: raw human note peek — only logically visible notes (system + members).
    =/  note-list=(list note:noltbook)
      %+  skim  ~(val by notes)
      |=(n=note:noltbook (human-sees-note id.n our.bowl note-members notes))
    =/  upd=update:noltbook  [%note-list note-list import-only-dms]
    ``[%noltbook-update !>(upd)]
  ::
      [%x %notes @ ~]
    =/  nid=@ta  i.t.t.path
    ::  1B.1: raw human per-note peek — a hidden note returns an empty message-list.
    ?.  (human-sees-note nid our.bowl note-members notes)
      ``[%noltbook-update !>(`update:noltbook`[%message-list nid ~ ~ ~ ~])]
    =/  msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  arts=(list artifact:noltbook)
      %+  skim  ~(val by artifacts)
      |=(a=artifact:noltbook =(note-id.a nid))
    =/  upd=update:noltbook  [%message-list nid msgs arts (api-via-snapshot msgs arts via-by-eid) (dm-import-snapshot msgs dm-imports)]
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
      ?.  (human-sees-note k our.bowl note-members notes)  ~
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
    ::  A retired actor/persona action, or an actor/persona field on a surviving one.
    ::  The mark maps both cases here so the caller gets an honest %unsupported instead
    ::  of the request quietly becoming a human-authored post. Nothing is written and no
    ::  message is sent. Ordinary unknown actions still fail in the mark as before.
        %unsupported-input
      =/  why=@t
        %-  crip
        %-  zing
        :~  "'"  (trip tag.aa)  "' is not supported: actor and persona attribution "
            "were removed. Use post-message with `app` for app-attributed posting."
        ==
      :_  this
      (api-result-card request-id.aa %.n %unsupported why ~ ~ ~)
    ::
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
      ::  1B.1: a post into ANY regular note the human is NOT a logical member of
      ::  returns honestly instead of claiming posted (system notes exempt). This is
      ::  the whole permission model now: an app posts exactly where its user may.
      ?.  (human-sees-note note-id.aa our.bowl note-members notes)
        :_  this
        (api-result-card request-id.aa %.n %not-participant 'host user is not a logical participant of this note' `note-id.aa ~ ~)
      =+  conf=(api-send-confirm note-id.aa nt our.bowl now.bowl seq-counters)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%send-message note-id.aa text.aa ~ reply-to-eid.aa ~ via]))
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
      =/  via=(unit via-app:noltbook)
        ?~  app.aa  ~
        `[desk.u.app.aa title.u.app.aa publisher.u.app.aa our.bowl]
      ::  1B.1: same membership gate as %post-message -- an app may post an app-ref
      ::  exactly where its user may already post. No attribution identity involved.
      ?.  (human-sees-note note-id.aa our.bowl note-members notes)
        :_  this
        (api-result-card request-id.aa %.n %not-participant 'host user is not a logical participant of this note' `note-id.aa ~ ~)
      =+  conf=(api-send-confirm note-id.aa nt our.bowl now.bowl seq-counters)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%send-message note-id.aa p.res ~ ~ ~ via]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code.conf 'app ref sent' `note-id.aa mid.conf eid.conf)
    ::
    ::  ---- App grants: the host's revocable grant to one local app desk. ----
    ::  Mutates app-grants only; never posts content. The surviving capability set is
    ::  {%import-dm} -- the only capability there is.
    ::  Same-ship only (the on-poke guard); on one ship "host vs app" is cooperative,
    ::  not a cryptographic boundary.
        %set-app-grant
      =/  dterm=(unit @tas)  (rush desk.aa sym)
      ?~  dterm
        :_  this
        (api-result-card request-id.aa %.n %invalid-desk 'desk did not parse' ~ ~ ~)
      ::  caps accepts only %import-dm; any other name is dropped exactly like an
      ::  unknown string. Absent caps => empty set:
      ::  a grant confers nothing until the host names a capability explicitly.
      =/  caps=(set app-cap:noltbook)
        ?~  caps.aa  *(set app-cap:noltbook)
        %-  ~(gas in *(set app-cap:noltbook))
        %+  murn  ~(tap in u.caps.aa)
        |=  c=@t  ^-  (unit app-cap:noltbook)
        =/  ct  (rush c sym)
        ?~  ct  ~
        ?.  ?=(%import-dm u.ct)  ~
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
      ::  Phase 1.1: an artifact in an ordinary DM is peer-authoritative, so refuse when
      ::  a participant was removed/left — otherwise we store locally + report success
      ::  while the peer's receiver rejects it, leaving a one-sided artifact.
      ::  Notebook/group are unaffected.
      ?:  ?&  =(%dm type.nt)
              ?|  !=(2 ~(wyt in users.nt))
                  !(~(has in users.nt) our.bowl)
                  !=(~ removed.nt)
              ==
          ==
        :_  this
        (api-art-result-card request-id.aa %.n %rejected 'cannot create a DM artifact after a participant was removed' `note-id.aa ~ ~)
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
          ::  ordinary DM %app is single-writer: creator-only. Notebook/group %app stays
          ::  member-writable (host re-validates).
          ?:  =(%dm type.nt)
            ?.  =(our.bowl creator.art)  `[%rejected 'only artifact creator can edit in a DM']
            ?.  (valid-app-artifact-content content.aa)  `[%invalid 'invalid app descriptor']
            ~
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
        %import-dm-message
      ::  Gall cannot authenticate the calling local agent. As with the existing app
      ::  governance surface, app.desk is cooperative attribution plus a revocable grant.
      ?~  app.aa
        :_  this
        (api-result-card request-id.aa %.n %missing-app 'app attribution required' ~ ~ ~)
      =/  grant  (~(get by app-grants) desk.u.app.aa)
      ?~  grant
        :_  this
        (api-result-card request-id.aa %.n %app-not-granted 'app has no import grant' ~ ~ ~)
      ?.  enabled.u.grant
        :_  this
        (api-result-card request-id.aa %.n %app-disabled 'app grant disabled' ~ ~ ~)
      ?.  (~(has in caps.u.grant) %import-dm)
        :_  this
        (api-result-card request-id.aa %.n %cap-missing 'app lacks %import-dm' ~ ~ ~)
      =/  peer-u=(unit @p)  (slaw %p peer.aa)
      ?~  peer-u
        :_  this
        (api-result-card request-id.aa %.n %invalid-ship 'peer did not parse' ~ ~ ~)
      =/  peer=@p  u.peer-u
      ?:  =(peer our.bowl)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'cannot import a self DM' ~ ~ ~)
      ?:  (~(has in pal-blocked) peer)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'peer is blocked' ~ ~ ~)
      =/  src-tape=tape  (trip source.aa)
      =/  src-bare=@t
        ?:(?=([%'%' *] src-tape) (crip t.src-tape) source.aa)
      =/  src-u=(unit @tas)  (rush src-bare sym)
      ?~  src-u
        :_  this
        (api-result-card request-id.aa %.n %invalid-source 'source must be a term' ~ ~ ~)
      ?:  ?|(=(0 (met 3 external-id.aa)) (gth (met 3 external-id.aa) 512))
        :_  this
        (api-result-card request-id.aa %.n %invalid-external-id 'externalId must be 1-512 bytes' ~ ~ ~)
      ?:  ?|(=(0 (met 3 text.aa)) (gth (met 3 text.aa) 64.000))
        :_  this
        (api-result-card request-id.aa %.n %invalid-text 'text must be 1-64000 bytes' ~ ~ ~)
      ?:  ?|((lth sent-at.aa ~1970.1.1) (gth sent-at.aa (add now.bowl ~d1)))
        :_  this
        (api-result-card request-id.aa %.n %invalid-time 'sentAt is outside the accepted range' ~ ~ ~)
      =/  eid=@uv  (sham [%noltbook-dm-import our.bowl peer u.src-u external-id.aa])
      =/  prior  (~(get by dm-imports) eid)
      ?^  prior
        ?:  ?&  =(peer.u.prior peer)
                =(source.u.prior u.src-u)
                =(external-id.u.prior external-id.aa)
            ==
          :_  this
          (api-result-card request-id.aa %.y %duplicate 'message was already imported' `note-id.u.prior `received-at.u.prior `eid)
        :_  this
        (api-result-card request-id.aa %.n %identity-conflict 'derived import identity conflicts with stored provenance' ~ ~ `eid)
      =/  eid-used=?
        %+  lien  ~(val by messages)
        |=  ml=(list message:noltbook)
        (lien ml |=(m=message:noltbook ?~(meta.m %.n =(eid.u.meta.m eid))))
      ?:  ?|(eid-used (~(has by dm-artifact-refs) eid) (~(has by dm-artifact-tombs) eid))
        :_  this
        (api-result-card request-id.aa %.n %identity-conflict 'derived import eid is already in use' ~ ~ `eid)
      =/  target-users=(set @p)  (sy ~[our.bowl peer])
      =/  existing=(unit note:noltbook)  (find-dm-root notes target-users)
      =/  nid=@ta
        ?^(existing id.u.existing (crip (weld "note-" (trip (scot %da now.bowl)))))
      =/  base=note:noltbook
        :*  nid  (scot %p peer)  %dm  peer  target-users
            ~  ~  ~  ~  %secret  ~  %.y  ~  ~
        ==
      =/  fresh=note:noltbook  (apply-dm-pref base dm-prefs our.bowl)
      =/  nt=note:noltbook  ?^(existing u.existing fresh)
      =/  cur=(list message:noltbook)  (fall (~(get by messages) nid) ~)
      ::  imports share the receiver-assigned ordinal so they cannot collide with sends
      =/  seq=@ud  (dm-next-seq (fall (~(get by seq-counters) nid) 0) cur)
      =/  meta=entry-meta:noltbook  [eid seq 0 now.bowl now.bowl ~]
      =/  msg=message:noltbook  [now.bowl nid peer text.aa now.bowl ~ %.n `meta]
      =/  importer=via-app:noltbook
        [desk.u.app.aa title.u.app.aa publisher.u.app.aa our.bowl]
      =/  row=dm-import:noltbook
        [eid nid peer importer u.src-u external-id.aa sent-at.aa now.bowl ~]
      =/  upd-note=note:noltbook  nt(last-author `peer, last-preview `text.aa)
      =.  notes  (~(put by notes) nid upd-note)
      =.  messages  (~(put by messages) nid (snoc cur msg))
      =.  seq-counters  (~(put by seq-counters) nid seq)
      =.  dm-imports  (~(put by dm-imports) eid row)
      =?  import-only-dms  ?=(~ existing)
        (~(put in import-only-dms) nid)
      =.  note-activity  (put-activity note-activity nid now.bowl)
      =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
      =/  note-cards=(list card:agent:gall)
        ?^(existing ~ ~[(gf-notes `update:noltbook`[%import-dm-note-created fresh])])
      =/  mu=update:noltbook  [%new-message msg ~ ~ `row]
      =/  live-cards=(list card:agent:gall)
        :~  (gf-notes mu)
            (activity-fact nid now.bowl)
            (unread-activity-fact nid now.bowl)
        ==
      :_  this
      (weld note-cards (weld live-cards (api-result-card request-id.aa %.y %imported 'message imported locally' `nid `now.bowl `eid)))
    ::
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
      ::  bound the embedded gossip image (70 KiB). Reject rather than silently
      ::  creating the note with its image stripped.
      ?.  (icon-url-ok icon-url.aa gossip-icon-cap)
        :_  this
        (api-result-card request-id.aa %.n %invalid-icon 'iconUrl exceeds 71680 bytes' ~ ~ ~)
      =/  existing=(unit @ta)  (api-find-gossip-by-name name.aa notes our.bowl)
      ?^  existing
        :_  this
        (api-result-card request-id.aa %.y %found 'gossip note found' `u.existing ~ ~)
      ::  %create-gossip-note mints nid = note-{now} (same formula) with no gates.
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%create-gossip-note name.aa headline.aa icon-url.aa]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %gossip-created 'gossip note created' `nid ~ ~)
    ::
    ::  ---- gossip distribution: share a copy / acquire by link. ----
    ::  share: gossip is hostless + always-public, so ANY holder may share it.
    ::  Reuses the internal %invite-to-note gossip path (any-holder gate).
        %share-gossip-note
      =/  nt-u  (~(get by notes) note-id.aa)
      ?~  nt-u
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ?.  =(%gossip type.u.nt-u)
        :_  this
        (api-result-card request-id.aa %.n %unsupported 'only gossip notes can be shared this way' `note-id.aa ~ ~)
      =/  pre  (api-ship-pre request-id.aa ship.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%invite-to-note note-id.aa p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %gossip-shared 'gossip note shared' `note-id.aa ~ ~)
    ::
    ::  acquire: request a gossip note by link. `from` is the sharer named in the
    ::  ~gnote token; the note installs async via %remote-gossip-invite.
        %request-gossip-note
      =/  pre  (api-ship-pre request-id.aa from.aa our.bowl)
      ?:  ?=(%.n -.pre)  [p.pre this]
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%request-gossip-note note-id.aa p.pre]))
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y %gossip-requested 'gossip note requested (installs async)' `note-id.aa ~ ~)
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
      ?.  (call-eligible note-id.aa u.ex)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'note kind cannot host calls' `note-id.aa ~)
      ::  a LIVE call => the handler no-ops; report honestly.
      =/  old  (~(get by calls) note-id.aa)
      ?:  ?&(?=(^ old) ?=(^ call.u.old))
        :_  this
        %^    api-call-result-card
            request-id.aa
          %.n
        [%rejected 'call already active' `note-id.aa `call-id.u.call.u.old]
      ::  the HOST authors the call id, so report it only when we are the host; a
      ::  member's request is %accepted and the real id arrives with the snapshot.
      =/  is-host=?  =(our.bowl creator.u.ex)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%start-call note-id.aa]))
      =/  fresh  (~(get by calls) note-id.aa)
      =/  new-cid=(unit @ta)
        ?~  fresh  ~
        ?~  call.u.fresh  ~
        `call-id.u.call.u.fresh
      :_  this
      %+  weld  cards
      ?:  is-host
        (api-call-result-card request-id.aa %.y %call-started 'call started' `note-id.aa new-cid)
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
      =/  cur  (~(get by calls) note-id.aa)
      ?:  ?|(?=(~ cur) ?=(~ call.u.cur))
        :_  this
        (api-call-result-card request-id.aa %.n %missing-target 'no active call to join' `note-id.aa ~)
      =/  ci  u.call.u.cur
      ?:  (~(has in participants.ci) our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'already in call' `note-id.aa `call-id.ci)
      =/  is-host=?  =(our.bowl creator.u.ex)
      =^  cards  this
        $(mark %noltbook-action, vase (action-vase `action:noltbook`[%join-call note-id.aa]))
      :_  this
      %+  weld  cards
      ?:  is-host
        (api-call-result-card request-id.aa %.y %call-joined 'call joined' `note-id.aa `call-id.ci)
      (api-call-result-card request-id.aa %.y %accepted 'join forwarded to host' `note-id.aa `call-id.ci)
    ::
        %leave-call
      =/  ex=(unit note:noltbook)  (~(get by notes) note-id.aa)
      ?~  ex
        :_  this
        (api-call-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~)
      =/  cur  (~(get by calls) note-id.aa)
      ?:  ?|(?=(~ cur) ?=(~ call.u.cur))
        :_  this
        (api-call-result-card request-id.aa %.n %missing-target 'no active call' `note-id.aa ~)
      =/  ci  u.call.u.cur
      ?.  (~(has in participants.ci) our.bowl)
        :_  this
        (api-call-result-card request-id.aa %.n %rejected 'not in call' `note-id.aa `call-id.ci)
      =/  cid=@ta  call-id.ci
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
      :_  this
      %+  weld  cards
      (api-result-card request-id.aa %.y code 'message deleted' `note-id.aa r-mid r-eid)
    ::
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
    ::
    ::  ---- Phase 10: note configuration. Applies only the supplied fields via
    ::  the existing rename-note / set-note-meta / set-headline handlers, emitting
    ::  one result fact for the whole request. ----
        %set-note-config
      ?~  (~(get by notes) note-id.aa)
        :_  this
        (api-result-card request-id.aa %.n %missing-note 'no such note' `note-id.aa ~ ~)
      ::  bound iconUrl (ordinary cap). Honest failure instead of delegating and
      ::  reporting %configured while the internal handler silently drops it.
      ?.  (icon-url-ok icon-url.aa icon-url-cap)
        :_  this
        (api-result-card request-id.aa %.n %invalid-icon 'iconUrl exceeds 2048 bytes' `note-id.aa ~ ~)
      =/  nt=note:noltbook  (~(got by notes) note-id.aa)
      ::  gossip is an immutable snapshot (name/visibility/icon/headline frozen at
      ::  creation). Reject up front so the API is honest instead of reporting
      ::  %configured while the internal freezes silently drop every field.
      ?:  =(%gossip type.nt)
        :_  this
        (api-result-card request-id.aa %.n %rejected 'gossip notes are immutable' `note-id.aa ~ ~)
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
        (human-note-cards note-id.aa our.bowl note-members notes (active-cards note-id.aa `active))
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
        (human-note-cards note-id.aa our.bowl note-members notes (active-cards note-id.aa ~))
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
      =/  av-res  (avatar-read our.bowl now.bowl q.byk.bowl)
      ?~  av-res
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  avatar-data=mime  u.av-res
      =/  =simple-payload:http
        :_  `q.avatar-data
        :-  200
        :~  ['content-type' (rap 3 (join '/' p.avatar-data))]
            ['cache-control' 'max-age=3600']
            ['access-control-allow-origin' '*']
      ==
      [(give-simple-payload:app:server eyre-id simple-payload) this]
    ::  host-scoped user avatar: /apps/noltbook/user-avatar/<host>. Phase 1: only the
    ::  owner (us) serves; remote-host Ames fetch is Phase 2 -> 404.
    ?:  &(=(%'GET' method.request.inbound-request) =((scag 27 url-tape) "/apps/noltbook/user-avatar/"))
      ::  split off the host so a ?v=<rev> cache-buster query is ignored.
      =/  host-u=(unit @p)  (slaw %p path:(split-url-tail url-tape 27))
      ?~  host-u
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  remote host: fetch bytes over Ames (artifact-style fetch-serve-forget). Hold
      ::  this HTTP request; %remote-user-avatar-content/-denied answers eyre-id when the
      ::  owner replies. We NEVER persist the fetched bytes.
      ?.  =(u.host-u our.bowl)
        :_  this
        ~[(rpoke /uav-fetch-out/[eyre-id] u.host-u `remote:noltbook`[%remote-user-avatar-fetch eyre-id])]
      ::  local host: serve our own uploaded avatar bytes.
      ?.  has-avatar
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  av-res  (avatar-read our.bowl now.bowl q.byk.bowl)
      ?~  av-res
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  avatar-data=mime  u.av-res
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
      ::  strip any ?v=<rev> cache-buster: the revision is browser-only and the stored
      ::  pointer never carries it.
      =/  nid=@ta  path:(split-url-tail url-tape 20)
      =/  nt  (~(get by notes) nid)
      ?~  nt
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  serve when we host the note, OR when it is a DM icon we stored locally and we
      ::  are still a current, non-removed member -- the upload endpoint allows exactly
      ::  that, so the read must match. DM icons stay local-only: there is no remote
      ::  fetch path for them, and ordinary non-host notes are still denied here.
      =/  dm-local=?
        ?&  =(%dm type.u.nt)
            (~(has in users.u.nt) our.bowl)
            !(~(has in removed.u.nt) our.bowl)
        ==
      ?.  |(=(our.bowl creator.u.nt) dm-local)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  only the exact internal pointer may serve bytes.
      ?.  (note-icon-is-internal nid icon-url.u.nt)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  data desk first, then legacy. A missing/unreadable file now answers 404
      ::  instead of crashing the (unauthenticated) request on a bare %cx.
      =/  ic-res  (icon-read our.bowl now.bowl nid)
      ?~  ic-res
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      =/  icon-data=mime  u.ic-res
      =/  =simple-payload:http
        :_  `q.icon-data
        :-  200
        :~  ['content-type' (rap 3 (join '/' p.icon-data))]
            ['cache-control' 'no-store']
            ['access-control-allow-origin' '*']
            ['x-content-type-options' 'nosniff']
        ==
      [(give-simple-payload:app:server eyre-id simple-payload) this]
    ::  member-side host-scoped uploaded-note-icon fetch:
    ::    GET /apps/noltbook/note-icon/<host>/<nid>
    ::  Serves an uploaded icon for a note hosted by ANOTHER ship. Bytes arrive
    ::  ephemerally over Ames and are NEVER persisted (fetch-serve-forget).
    ?:  &(=(%'GET' method.request.inbound-request) =((scag 25 url-tape) "/apps/noltbook/note-icon/"))
      =/  parts  (split-url-tail url-tape 25)
      =/  tail=tape  (trip path.parts)
      =/  hslash=(unit @ud)  (find "/" tail)
      =/  host-u=(unit @p)  ?~(hslash ~ (slaw %p (crip (scag u.hslash tail))))
      =/  nid=@ta  ?~(hslash '' (crip (slag +(u.hslash) tail)))
      =/  nt  ?:(=('' nid) ~ (~(get by notes) nid))
      ::  malformed host/nid, unknown note, wrong host, or a non-internal pointer: 404
      ::  and no fetch. Never emit a poke for something we cannot vouch for locally.
      ?:  ?|  ?=(~ host-u)
              =('' nid)
              ?=(~ nt)
              !=(u.host-u creator.u.nt)
              !(note-icon-is-internal nid icon-url.u.nt)
          ==
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  local host: same read and same headers as the ordinary /icon route.
      ?:  =(u.host-u our.bowl)
        =/  ic-res  (icon-read our.bowl now.bowl nid)
        ?~  ic-res
          :_  this
          %+  give-simple-payload:app:server  eyre-id
          [[404 ~] ~]
        =/  icon-data=mime  u.ic-res
        =/  =simple-payload:http
          :_  `q.icon-data
          :-  200
          :~  ['content-type' (rap 3 (join '/' p.icon-data))]
              ['cache-control' 'no-store']
              ['access-control-allow-origin' '*']
              ['x-content-type-options' 'nosniff']
          ==
        [(give-simple-payload:app:server eyre-id simple-payload) this]
      ::  remote host: hold this request. Record it and arm a 10s Behn timeout, so
      ::  content, denial, poke-nack and timeout each have a completion path and the
      ::  browser can never wait forever.
      =/  deadline=@da  (add now.bowl ~s10)
      =/  pend=pending-icon-fetch:noltbook  [eyre-id nid u.host-u deadline]
      :_  this(pending-icon-fetches (~(put by pending-icon-fetches) eyre-id pend))
      :~  %^    rpoke
                /nic-fetch-out/[nid]/[eyre-id]
              u.host-u
            `remote:noltbook`[%remote-note-icon-fetch nid eyre-id]
          [%pass /icon-fetch-timeout/[eyre-id] %arvo %b %wait deadline]
      ==
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
      ::  reject non-image uploads by SIGNATURE, not by Content-Type -> 400.
      =/  umite  (image-sig-mite u.bod)
      ?~  umite
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      ::  bytes go to the separate %noltbook-data desk. If it is missing or incomplete,
      ::  fail with 503 rather than writing into the live %noltbook desk.
      ?.  (art-store-exists our.bowl now.bowl)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[503 ~] ~]
      ::  hold the Eyre request until the write is verified. has-avatar and the 200 are
      ::  set by the /avatar-write-done wake, after the stored bytes are read back and
      ::  hash-matched -- otherwise a browser could refetch before the new bytes land.
      =/  clay-card=card
        %:  data-write-mime-card
          our.bowl  now.bowl  /avatar-write/[eyre-id]  avatar-data-spur
          `mime`[u.umite u.bod]
        ==
      ::  Save must never wait forever: record the held request and arm a 10s timeout.
      ::  Completion comes from the /avatar-write-done wake, which reads the bytes back
      ::  and verifies them against this hash -- existence alone is not proof, since a
      ::  replacement overwrites a file that already exists.
      =/  want-hash=@uv  (sham u.bod)
      =/  deadline=@da  (add now.bowl ~s10)
      =/  pw=pending-img-write:noltbook  [eyre-id %avatar '' deadline |]
      :_  this(pending-img-writes (~(put by pending-img-writes) eyre-id pw))
      ::  Clay write FIRST, then the wake. Clay's %info commits inside THIS event; a
      ::  Behn timer can only fire on a later event, so the read-back always sees it.
      :~  clay-card
          :*  %pass  /avatar-write-done/[eyre-id]/(scot %uv want-hash)
              %arvo  %b  %wait  +(now.bowl)
          ==
          [%pass /img-write-timeout/[eyre-id] %arvo %b %wait deadline]
      ==
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
              ?&  is-dm
                  (~(has in users.u.nt) our.bowl)
                  !(~(has in removed.u.nt) our.bowl)
              ==
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
      ::  validate by SIGNATURE and store the real type; the previous code assumed
      ::  every icon body was jpeg and never checked it at all.
      =/  imite  (image-sig-mite u.bod)
      ?~  imite
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[400 ~] ~]
      ::  bytes go to the separate %noltbook-data desk. If it is missing or incomplete,
      ::  fail with 503 rather than writing into the live %noltbook desk. %ins/%mut is
      ::  decided from the data-desk file itself, NOT from icon-url (a legacy live-desk
      ::  icon must not force %mut on an absent data-desk file).
      ?.  (art-store-exists our.bowl now.bowl)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[503 ~] ~]
      ::  hold the Eyre request until the write is verified. note-id, eyre-id and the
      ::  expected byte hash ride the wake wire. NOTHING is published here: no 200, no
      ::  icon-url, no dm-pref, no fact. All of that happens in the /icon-write-done
      ::  wake, so browsers are only told to refetch once the bytes are readable.
      =/  clay-card=card
        %:  data-write-mime-card
          our.bowl  now.bowl  /icon-write/[nid]/[eyre-id]  (icon-data-spur nid)
          `mime`[u.imite u.bod]
        ==
      ::  same bounded, hash-verified contract as the avatar write.
      =/  want-hash=@uv  (sham u.bod)
      =/  deadline=@da  (add now.bowl ~s10)
      =/  pw=pending-img-write:noltbook  [eyre-id %icon nid deadline |]
      :_  this(pending-img-writes (~(put by pending-img-writes) eyre-id pw))
      :~  clay-card
          :*  %pass  /icon-write-done/[nid]/[eyre-id]/(scot %uv want-hash)
              %arvo  %b  %wait  +(now.bowl)
          ==
          [%pass /img-write-timeout/[eyre-id] %arvo %b %wait deadline]
      ==
    ::  Part 9: ordinary-DM %file reference fetch — collision-safe, keyed by EID.
    ::  GET /apps/noltbook/dm-artifact/<eid>. Holds the HTTP request, fetches current bytes
    ::  ephemerally from the creator, and NEVER persists them. 503 on unavailable/timeout,
    ::  404 on terminal deletion.
    ?:  &(=(%'GET' method.request.inbound-request) =((scag 27 url-tape) "/apps/noltbook/dm-artifact/"))
      =/  parts  (split-url-tail url-tape 27)
      =/  eid-u=(unit @uv)  (slaw %uv path.parts)
      ?~  eid-u
        :_  this
        (give-simple-payload:app:server eyre-id [[404 ~] ~])
      =/  eid=@uv  u.eid-u
      ::  terminally deleted references stay gone
      ?:  (~(has by dm-artifact-tombs) eid)
        :_  this
        (give-simple-payload:app:server eyre-id [[404 ~] ~])
      =/  rf  (~(get by dm-artifact-refs) eid)
      ?~  rf
        :_  this
        (give-simple-payload:app:server eyre-id [[404 ~] ~])
      ?.  ?|(=(%file type.u.rf) =(%app type.u.rf))
        :_  this
        (give-simple-payload:app:server eyre-id [[404 ~] ~])
      ::  require current ordinary-DM membership (us + the ref creator, none removed)
      =/  nt  (~(get by notes) note-id.u.rf)
      ?:  ?|  ?=(~ nt)
              !(is-ordinary-dm u.nt)
              !(~(has in users.u.nt) our.bowl)
              !(~(has in users.u.nt) creator.u.rf)
              (~(has in removed.u.nt) our.bowl)
          ==
        :_  this
        (give-simple-payload:app:server eyre-id [[404 ~] ~])
      ::  hold the request; fetch current content (bytes for %file, descriptor for %app)
      ::  from the creator + arm a 10s timeout.
      =/  fkind=dm-fetch-kind:noltbook  ?:(=(%app type.u.rf) %app %file)
      =/  known-rev=(unit @ud)  `rev.u.rf
      =/  deadline=@da  (add now.bowl ~s10)
      =/  pend=pending-dm-fetch:noltbook  [eyre-id eid aid.u.rf creator.u.rf fkind deadline]
      =/  fetch-card=card
        (rpoke /dm-fetch-out/[eyre-id] creator.u.rf `remote:noltbook`[%remote-dm-content-fetch eid aid.u.rf fkind eyre-id known-rev])
      =/  timer-card=card
        [%pass /dm-fetch-timeout/[eyre-id] %arvo %b %wait deadline]
      :_  this(pending-dm-fetches (~(put by pending-dm-fetches) eyre-id pend))
      ~[fetch-card timer-card]
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
      ::  Part 10: local Clay is served ONLY by the artifact creator. A noncreator (incl. a
      ::  DM member) must never serve orphaned copied bytes; it always remote-fetches from
      ::  the creator. Ordinary-DM %file bytes are fetched via /apps/noltbook/dm-artifact/<eid>
      ::  instead (those refs are not in `artifacts`). Group/gossip creator + member behavior
      ::  is unchanged.
      ?:  =(our.bowl creator.u.art)
        =/  local-res  (art-store-read our.bowl now.bowl aid)
        ?^  local-res
          =/  art-data=mime  u.local-res
          ::  preview=1 renders under the byte-serving policy; download=1 returns the
          ::  untouched original as an attachment. Neither marker => treated as a
          ::  download, so a bare link can never render as an active document.
          =/  qarg-dl  (query-arg q-args 'download')
          =/  qarg-pv  (query-arg q-args 'preview')
          ::  explicit download wins; a bare link with neither marker is ALSO a
          ::  download, so an old or hand-typed URL can never render actively.
          =/  dl=?  |(?=(^ qarg-dl) ?=(~ qarg-pv))
          =/  =simple-payload:http
            (art-serve-payload art-data name.u.art dl 'max-age=3600')
          [(give-simple-payload:app:server eyre-id simple-payload) this]
        ::  creator has no bytes → 404
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[404 ~] ~]
      ::  noncreator: never touch local Clay; always remote-fetch from the creator
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
      ::  artifact bytes are stored in the separate, locally self-provisioned %noltbook-data
      ::  desk. If creation has not completed or an existing desk is incomplete, fail the
      ::  upload safely (503) rather than writing into the live %noltbook desk.
      ?.  (art-store-exists our.bowl now.bowl)
        :_  this
        %+  give-simple-payload:app:server  eyre-id
        [[503 ~] ~]
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
      ::  write bytes to the separate non-running %noltbook-data desk (never q.byk.bowl), so
      ::  the commit does not goad/reload the live %noltbook agent.
      =/  clay-card=card  (art-store-write-card /art-write/[aid] aid `mime`[mpath u.bod])
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
        ::  Part 4: ordinary-DM %file origin hosting. The authoritative artifact + bytes
        ::  stay on the creator (this ship, in Clay). Send ONLY a content-free reference,
        ::  and ONLY to a v1 peer — NEVER %remote-dm-artifact, NEVER bytes. If the peer is
        ::  old/unknown, keep the file creator-local (an explicit "peer must upgrade to
        ::  view" UI indication is deferred: there is no existing non-destructive channel,
        ::  and per spec we must not fabricate a shared text message).
        =/  others=(list @p)
          %+  skim  ~(tap in users.u.nt)
          |=(p=@p !=(p our.bowl))
        =/  counterparty=@p  ?~(others our.bowl i.others)
        =/  upd=update:noltbook  [%artifact-created new-art]
        =/  pax=path  ~[%notes nid]
        =/  prev=@t  (artifact-preview new-art)
        =/  upd-note=note:noltbook  u.nt(last-author `our.bowl, last-preview `prev)
        =/  chash=@uv  (sham q.u.bod)
        =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of new-art nid `chash)
        ::  Phase 3: always send the content-free reference directly (no protocol gate).
        =/  dm-card=(list card)
          ?:  =(counterparty our.bowl)  ~
          ?~  ref  ~
          ~[(rpoke /dm-ref-out/[aid] counterparty `remote:noltbook`[%remote-dm-ref-upsert u.nt u.ref])]
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
      :_  `html-bytes
      :-  200
      :~  ['content-type' 'text/html; charset=utf-8']
          ::  Never cache the app shell. This response carries no ETag and no
          ::  Last-Modified, so a browser that keeps a copy has no way to revalidate it:
          ::  it just keeps serving the old page after an update, and the only cure is a
          ::  manual hard reload. Storing it at all is what makes a ship look "not
          ::  updated" when the desk is perfectly current.
          ['cache-control' 'no-store']
      ==
    [(give-simple-payload:app:server eyre-id simple-payload) this]
      %noltbook-action
    ::  SAME-SHIP ONLY: this is the local client protocol. Every handler
    ::  below acts with our.bowl authority. Cross-ship Noltbook traffic
    ::  must use %noltbook-remote, which authenticates its sender.
    ?.  =(src.bowl our.bowl)
      `this
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
        %rename-note
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  System-note names are fixed presentation identities.
      ?:  |(=(id.act %cover) =(id.act %ars-rumors))  `this
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
      ::  gossip is an immutable snapshot — headline (description) frozen at creation.
      ?:  =(%gossip type.u.old)  `this
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
      ::  ===== physical file cleanup (best-effort, additive) =====
      ::  Evaluated HERE, before any map below is rebuilt, so both the eligibility test
      ::  and the target lists see the PRE-deletion notes/artifacts. Eligibility is
      ::  all-or-nothing across root+descendants: if the subtree is not provably private
      ::  we emit no cleanup cards at all and never clean "the safe portion". Everything
      ::  below this block is unchanged, and the semantic deletion never waits on Clay
      ::  or on the verification wakes.
      =/  cleanup-cards=(list card)
        ?.  (notebook-subtree-private our.bowl subtree-ids state)  ~
        =/  drop=(set @ta)  (sy subtree-ids)
        ::  artifacts: only %file bytes WE created inside the deleted subtree. %app and
        ::  %code carry no stored bytes, and a foreign creator's bytes are not ours.
        =/  art-cards=(list card)
          %-  zing
          %+  turn  ~(tap by artifacts)
          |=  [aid=@ta a=artifact:noltbook]
          ^-  (list card)
          ?.  (~(has in drop) note-id.a)  ~
          ?.  =(%file type.a)  ~
          ?.  =(our.bowl creator.a)  ~
          (art-store-del-cards our.bowl now.bowl aid)
        ::  icons: only when the PRE-deletion record's icon-url is exactly this note's
        ::  own internal pointer. External URLs, embedded data URLs, absent icons and
        ::  mismatched internal pointers all produce nothing.
        =/  icon-cards=(list card)
          %-  zing
          %+  turn  `(list @ta)`subtree-ids
          |=  nid=@ta
          ^-  (list card)
          =/  nt  (~(get by notes) nid)
          ?~  nt  ~
          ?.  (note-icon-is-internal nid icon-url.u.nt)  ~
          (icon-store-del-cards our.bowl now.bowl nid)
        (weld art-cards icon-cards)
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
      =/  new-calls=(map @ta call-snapshot:noltbook)
        =/  acc=(map @ta call-snapshot:noltbook)  calls
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
        `(rpoke /note-del/(scot %p p)/[id.act] p `remote:noltbook`[%remote-note-deleted id.act name.u.old])
      :_  %=  this
            notes  new-notes
            messages  new-messages
            mentions  new-mentions
            calls         new-calls
            call-leases   (prune-call-leases subtree-ids call-leases)
            gossip-envelopes  new-gossip-envelopes
            headlines  new-headlines
            seq-counters  new-seq-counters
            join-requests  new-join-requests
            note-admins  new-note-admins
            note-muted  new-note-muted
            artifact-envelopes  new-artifact-envelopes
            artifacts  new-artifacts
            note-members  (prune-note-members subtree-ids note-members)
          ==
      ^-  (list card)
      :(weld cleanup-cards delete-updates delete-remote-cards)
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
      :_  this(notes n2, messages (~(put by messages) nid *(list message:noltbook)), note-members (set-logical-members nid (logical-members-of pid note-members notes) note-members), note-activity (put-activity note-activity nid now.bowl), note-unread-activity (put-unread-activity note-unread-activity nid now.bowl), note-read (put-read note-read nid now.bowl))
      =/  head-cards=(list card:agent:gall)
        ~[(gf-notes upd) (activity-fact nid now.bowl) (unread-activity-fact nid now.bowl) (note-read-fact nid now.bowl)]
      (weld head-cards broadcast)
    ::
        %create-gossip-note
      =/  self-set=(set @p)  (sy ~[our.bowl])
      =/  nid=@ta  (crip (weld "note-" (trip (scot %da now.bowl))))
      =/  hl=(unit @t)  ?:(=(%~ headline.act) ~ `headline.act)
      ::  bound the embedded image before it is stored or shared. Backstop: the API
      ::  layer rejects oversized values outright so callers get an honest error.
      =/  ic=(unit @t)  (clamp-icon-url icon-url.act gossip-icon-cap)
      ::  gossip is always-public + hostless; visibility is a dead field (set %public so it
      ::  never reads as private). creator is attribution only, not an authority.
      =/  new-note=note:noltbook
        :*  nid  name.act  %gossip  our.bowl  self-set  ~  ~  ~  ~  %public  ic  &  ~  hl
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
      ::  1B.1: a post by the host human into ANY regular note it is not a logical member
      ::  of is a no-op (system notes are exempt inside human-sees-note). This check is now
      ::  UNCONDITIONAL: every post goes through the ordinary membership gate. The API
      ::  layer still returns %not-participant honestly (see %post-message).
      ?.  (human-sees-note note-id.act our.bowl note-members notes)
        `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  entry-meta for hosted, cover, and gossip notes. Rumors use
      ::  content-hash identity (anonymous — no author for eid/seq).
      =/  is-regular=?
        !=(note-id.act %ars-rumors)
      ::  DM: the ordinal is receiver-assigned and must clear anything already stored in
      ::  this DM, since incoming messages are renumbered locally on arrival. Every other
      ::  note type keeps its existing counter behaviour untouched.
      =/  cur-seq=@ud  (fall (~(get by seq-counters) note-id.act) 0)
      =/  nxt-seq=@ud
        ?.  is-regular  0
        ?.  =(%dm type.u.exists)  +(cur-seq)
        (dm-next-seq cur-seq (fall (~(get by messages) note-id.act) ~))
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
        =/  upd=update:noltbook  [%new-message msg ~ via.act ~]
        =/  pax=path  ~[%notes note-id.act]
        =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
        ::  atomic DM delivery: ONE poke carrying both note metadata and
        ::  message, so receiver can recreate the DM if they left without
        ::  relying on poke ordering or subscriptions.
        =/  dm-rem=remote:noltbook  [%remote-dm-message u.exists msg via.act]
        =/  peer-cards=(list card)
          ?:  =(other our.bowl)  ~
          ~[(rpoke /dm-msg/[note-id.act] other dm-rem)]
        =/  notes-cards=(list card:agent:gall)
          ~[(gf-notes upd) (activity-fact note-id.act now.bowl) (unread-activity-fact note-id.act now.bowl) (note-read-fact note-id.act now.bowl)]
        ::  Phase 11B: attribute our own stored DM copy (via.ship = us, the sender).
        =.  via-by-eid  (api-via-put via-by-eid via.act msg)
        :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters), note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity (put-unread-activity note-unread-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl), import-only-dms (~(del in import-only-dms) note-id.act))
        :(weld ~[(gf-paths ~[pax] upd)] notes-cards peer-cards)
      ::  remote note: forward to creator
      ?.  =(our.bowl creator.u.exists)
        =/  fwd-card=card
          ::  carry the explicit NOTE SEND marker to the host (regular/group)
          (rpoke /msg-fwd/[note-id.act] creator.u.exists `remote:noltbook`[%remote-message note-id.act msg directed-kind.act via.act])
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
      =/  upd=update:noltbook  [%new-message msg directed-kind.act via.act ~]
      =/  pax=path  ~[%notes note-id.act]
      =/  upd-note=note:noltbook  u.exists(last-author `our.bowl, last-preview `text.act)
      =/  new-seq-counters=(map @ta @ud)
        ?:(is-regular (~(put by seq-counters) note-id.act nxt-seq) seq-counters)
      ::  Phase 11B: attribute our locally-stored message; the %new-message fact
      ::  above carries via to subscribed members so they record it too.
      =.  via-by-eid  (api-via-put via-by-eid via.act msg)
      ::  our own post is a host self-post, so it never self-mentions and never
      ::  reply-notifies us. mentions and reply attention are therefore both untouched,
      ::  note-read advances, and unread-activity advances.
      =/  new-unread-activity=(map @ta @da)
        (put-unread-activity note-unread-activity note-id.act now.bowl)
      =.  note-read  (put-read note-read note-id.act now.bowl)
      ::  Phase 1B: the /notes/[nid] transport fact always goes out (real members /
      ::  remote peers who opened the note). The LOCAL human global-/notes facts are
      ::  suppressed when the host human is not a logical member of the note.
      =/  human-vis=?
        (human-sees-note note-id.act our.bowl note-members notes)
      =/  base-cards=(list card)
        ?.  human-vis  ~[(gf-paths ~[pax] upd)]
        :~  (gf-paths ~[pax] upd)
            (gf-notes upd)
            (activity-fact note-id.act now.bowl)
        ==
      =?  base-cards  human-vis  (snoc base-cards (unread-activity-fact note-id.act now.bowl))
      =?  base-cards  human-vis  (snoc base-cards (note-read-fact note-id.act now.bowl))
      :_  this(notes (~(put by notes) note-id.act upd-note), messages (~(put by messages) note-id.act (snoc cur msg)), seq-counters new-seq-counters, note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity new-unread-activity, note-read note-read)
      base-cards
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
        ::  Part 1A: mutate ONLY the exact stored target, compared by full dm-message-key
        ::  (modern %eid, else legacy [author id]) — never by bare @da id.
        =/  target-key=dm-message-key:noltbook  (dm-message-key-of i.found)
        =/  new-msgs=(list message:noltbook)
          %+  turn  cur
          |=  m=message:noltbook
          ?.  =(target-key (dm-message-key-of m))  m
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
      ::  only when the host human is a logical member (an edit to a note the host human
      ::  cannot see updates durable state + transport peers but never its browser).
      ?.  (human-sees-note note-id.act our.bowl note-members notes)
        ~[(gf-paths ~[pax] upd)]
      :~  (gf-paths ~[pax] upd)
          (gf-notes upd)
      ==
    ::
        %delete-message
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  cover/ordinary-gossip: HOSTLESS origin-authoritative deletion. The poster deletes
      ::  their OWN text; there is no note-creator authority (do NOT forward to note.creator).
      ::  Remove the local message + its text envelope, install a terminal eid tombstone,
      ::  propagate a compact %remote-mesh-delete through the same mesh, and emit FE removal.
      ::  A legacy post with no modern eid is removed locally only (no tomb/propagation).
      ?:  (is-mesh-note note-id.act u.exists)
        =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
        ::  EID-strict resolution: a supplied modern eid resolves ONLY that eid (owned by us)
        ::  with NO msg-id fallback; a genuinely legacy delete (no eid supplied) resolves by
        ::  [author, msg-id]. A mismatched/unowned/absent eid is a clean no-op.
        =/  found=(list message:noltbook)
          ?^  eid.act
            (skim cur |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.eid.act) =(author.m our.bowl))))
          (skim cur |=(m=message:noltbook &(=(id.m msg-id.act) =(author.m our.bowl))))
        ?~  found  `this
        =/  target=message:noltbook  i.found
        =/  target-id=@da  id.target
        =/  del-eid=(unit @uv)  ?~(meta.target ~ `eid.u.meta.target)
        ::  removal: MODERN => exact meta.eid + author; LEGACY (no eid) => [author, msg-id].
        =/  kept=(list message:noltbook)
          ?^  del-eid
            (skip cur |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m u.del-eid) =(author.m our.bowl))))
          (skip cur |=(m=message:noltbook &(=(id.m target-id) =(author.m our.bowl))))
        ::  text envelope removal: MODERN => independently by eid + author; LEGACY => msg-id + author.
        =/  cenv=(map @da envelope:noltbook)
          (fall (~(get by gossip-envelopes) note-id.act) *(map @da envelope:noltbook))
        =/  new-cenv=(map @da envelope:noltbook)
          %-  ~(gas by *(map @da envelope:noltbook))
          %+  skip  ~(tap by cenv)
          |=  [k=@da e=envelope:noltbook]
          ?^  del-eid
            ?&(?=(^ meta.e) =(eid.u.meta.e u.del-eid) =(author.e our.bowl))
          &(=(k target-id) =(author.e our.bowl))
        ::  clear an active pin that targeted this message
        =/  pin-hit=?
          ?~  del-eid  %.n
          =/  pn  (~(get by note-pins) note-id.act)
          ?~  pn  %.n
          &(=(%message kind.u.pn) =(u.del-eid target.u.pn))
        =/  new-pins=(map @ta note-pin:noltbook)
          ?:(pin-hit (~(del by note-pins) note-id.act) note-pins)
        =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards note-id.act ~) ~)
        ::  MODERN only: build + store the canonical tomb and propagate authoritatively. A
        ::  genuine legacy no-eid entry is removed locally only (no tomb, no propagation).
        =/  new-tombs=(set @uv)
          ?~(del-eid mesh-tombs (~(put in mesh-tombs) u.del-eid))
        =/  new-meta=(map @uv mesh-tomb:noltbook)
          ?~  del-eid  mesh-tomb-meta
          (~(put by mesh-tomb-meta) u.del-eid `mesh-tomb:noltbook`[u.del-eid note-id.act our.bowl %text `target-id ~])
        =/  del-upd=update:noltbook  [%mesh-entry-deleted note-id.act del-eid ~ `target-id]
        =/  pax=path  ~[%notes note-id.act]
        =/  mesh-cards=(list card)
          ?~  del-eid  ~
          =/  tomb=mesh-tomb:noltbook  [u.del-eid note-id.act our.bowl %text `target-id ~]
          =/  targets=(list @p)
            (mesh-delete-targets u.exists %.n our.bowl pal-incoming pal-outgoing)
          %+  turn  targets
          |=  p=@p
          ^-  card
          (rpoke /mesh-del/(scot %p p) p `remote:noltbook`[%remote-mesh-delete tomb])
        ::  recompute the note's sidebar preview from remaining entries (gossip; cover is FE).
        =/  upd-note2=note:noltbook
          %:  recompute-mesh-note  u.exists  kept  new-cenv
            (fall (~(get by artifact-envelopes) note-id.act) *(map @ta artifact-envelope:noltbook))
          ==
        =/  fe-cards=(list card)  ~[(gf-paths ~[pax] del-upd) (gf-notes del-upd)]
        :_  this(notes (~(put by notes) note-id.act upd-note2), messages (~(put by messages) note-id.act kept), gossip-envelopes (~(put by gossip-envelopes) note-id.act new-cenv), note-pins new-pins, mesh-tombs new-tombs, mesh-tomb-meta new-meta)
        :(weld fe-cards pin-clear-cards mesh-cards)
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
        ::  Part 1A: remove ONLY the exact stored target, compared by full dm-message-key.
        =/  target-id=@da  id.i.found
        =/  target-key=dm-message-key:noltbook  (dm-message-key-of i.found)
        =/  kept=(list message:noltbook)
          (skim cur |=(m=message:noltbook !=(target-key (dm-message-key-of m))))
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
        ::  Part 2: terminal tombstone derived from the actual stored message (not poke
        ::  fields). Prevents any future create/edit/replay/merge from resurrecting it.
        :_  this(messages (~(put by messages) note-id.act kept), dm-msg-tombs (dm-add-msg-tomb target-key now.bowl dm-msg-tombs))
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
      ::  the host human is not a logical member.
      =/  facts=(list card)
        ?:  (human-sees-note note-id.act our.bowl note-members notes)
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
      =/  msgs-after  (~(put by messages) note-id.act new-msgs)
      :_  this(messages msgs-after, note-pins new-pins)
      (weld facts pin-clear-cards)
    ::
        %remove-dm-import
      =/  row-u  (~(get by dm-imports) eid.act)
      ?~  row-u  `this
      ?:  ?|  ?=(^ removed-at.u.row-u)
              !=(note-id.u.row-u note-id.act)
          ==
        `this
      =/  nt-u  (~(get by notes) note-id.act)
      ?~  nt-u  `this
      ?.  =(%dm type.u.nt-u)  `this
      =/  cur=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  found=(list message:noltbook)
        (skim cur |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m eid.act))))
      ?~  found  `this
      ?.  =(peer.u.row-u author.i.found)  `this
      =/  kept=(list message:noltbook)
        (skip cur |=(m=message:noltbook ?&(?=(^ meta.m) =(eid.u.meta.m eid.act))))
      =/  rev=(list message:noltbook)  (flop kept)
      =/  nn=note:noltbook
        ?~  rev
          u.nt-u(last-author ~, last-preview ~)
        u.nt-u(last-author `author.i.rev, last-preview `text.i.rev)
      =/  row=dm-import:noltbook  u.row-u(removed-at `now.bowl)
      =/  upd=update:noltbook  [%message-deleted note-id.act id.i.found `eid.act]
      =.  notes  (~(put by notes) note-id.act nn)
      =.  messages  (~(put by messages) note-id.act kept)
      =.  dm-imports  (~(put by dm-imports) eid.act row)
      =.  dm-msg-tombs  (dm-add-msg-tomb [%eid eid.act] now.bowl dm-msg-tombs)
      :_  this
      ~[(gf-notes upd)]
    ::
        %delete-mesh-envelope
      ::  own cover/gossip artifact-ENVELOPE deletion when no full artifact record exists
      ::  locally (stale/test state). Validate the LOCAL envelope is ours, then run the exact
      ::  origin deletion: tombstone the eid, remove the envelope (+ full artifact if it does
      ::  exist), emit live %mesh-entry-deleted, and propagate authoritative %remote-mesh-delete
      ::  to the artifact mesh route. Never usable against another user's envelope.
      =/  nid=@ta  note-id.act
      =/  nt  (~(get by notes) nid)
      ?~  nt  `this
      ?.  (is-mesh-note nid u.nt)  `this
      =/  aenvs=(map @ta artifact-envelope:noltbook)
        (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
      =/  env  (~(get by aenvs) aid.act)
      ?~  env  `this
      ::  authority: the envelope must be OURS and carry the supplied eid
      ?.  =(author.u.env our.bowl)  `this
      ?.  ?&(?=(^ meta.u.env) =(eid.u.meta.u.env eid.act))  `this
      =/  new-aenvs=(map @ta artifact-envelope:noltbook)  (~(del by aenvs) aid.act)
      ::  drop a stray full artifact at this aid ONLY if it INDEPENDENTLY matches
      ::  note/eid/aid/creator — never merely because it shares the AID.
      =/  full  (~(get by artifacts) aid.act)
      =/  full-match=?
        ?&  ?=(^ full)  =(note-id.u.full nid)  =(id.u.full aid.act)
            ?=(^ meta.u.full)  =(eid.u.meta.u.full eid.act)  =(creator.u.full our.bowl)
        ==
      =/  new-arts=(map @ta artifact:noltbook)
        ?:(full-match (~(del by artifacts) aid.act) artifacts)
      =/  pin-hit=?
        =/  pn  (~(get by note-pins) nid)
        ?~  pn  %.n
        &(=(%artifact kind.u.pn) =(eid.act target.u.pn))
      =/  new-pins=(map @ta note-pin:noltbook)
        ?:(pin-hit (~(del by note-pins) nid) note-pins)
      =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards nid ~) ~)
      =/  pax=path  ~[%notes nid]
      =/  del-upd=update:noltbook  [%mesh-entry-deleted nid `eid.act `aid.act ~]
      ::  canonical artifact tomb record (author=us)
      =/  tomb=mesh-tomb:noltbook  [eid.act nid our.bowl %artifact ~ `aid.act]
      =/  targets=(list @p)
        (mesh-delete-targets u.nt %.y our.bowl pal-incoming pal-outgoing)
      =/  mesh-cards=(list card)
        %+  turn  targets
        |=  p=@p
        ^-  card
        (rpoke /mesh-del/(scot %p p) p `remote:noltbook`[%remote-mesh-delete tomb])
      =/  upd-note2=note:noltbook
        (recompute-mesh-note u.nt (fall (~(get by messages) nid) ~) (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook)) new-aenvs)
      ::  This handler serves TWO cases:
      ::    1. the NORMAL frontend deletion path for a locally authored Cover/gossip post.
      ::       The UI renders those posts from artifact envelopes and deletes through here
      ::       even when the backend still holds the complete local artifact record.
      ::    2. a fallback for envelope-only stale state, where no full record exists.
      ::  Only case 1 can safely drop bytes, because only there does an INDEPENDENTLY
      ::  matched full record prove the bytes belong to this exact local %file artifact.
      ::  full-match already verifies note id, artifact id, eid and creator == our.bowl.
      ::  In case 2 cleanup stays a silent no-op -- never a loose AID-only delete.
      =/  byte-del=(list card)
        ?.  full-match  ~
        ?.  ?=(^ full)  ~
        ?.  =(%file type.u.full)  ~
        (art-store-del-cards our.bowl now.bowl aid.act)
      :_  this(notes (~(put by notes) nid upd-note2), artifacts new-arts, artifact-envelopes (~(put by artifact-envelopes) nid new-aenvs), note-pins new-pins, mesh-tombs (~(put in mesh-tombs) eid.act), mesh-tomb-meta (~(put by mesh-tomb-meta) eid.act tomb))
      ;:  weld
        byte-del
        ~[(gf-paths ~[pax] del-upd)]
        ~[(gf-notes del-upd)]
        pin-clear-cards
        mesh-cards
      ==
    ::
        %set-note-meta
      ?:  (is-write-blocked id.act host-status notes our.bowl)  `this
      =/  old  (~(get by notes) id.act)
      ?~  old  `this
      ::  gossip is an immutable snapshot — visibility/icon/writable frozen at creation.
      ?:  =(%gossip type.u.old)  `this
      ::  bound the stored + propagated icon before ANY branch below writes it
      ::  (ordinary cap; gossip returned above and is bounded at creation instead).
      ?.  (icon-url-ok icon-url.act icon-url-cap)  `this
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
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act ro-muted), member-revs new-revs, note-members (add-member-to-ids ship.act [id.act share-descs] note-members notes))
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
      :_  this(notes (~(put by notes) id.act new-note), peers new-peers, note-muted (~(put by note-muted) id.act new-muted), member-revs new-revs, note-members (add-ships-to-ids cleaned [id.act share-descs] note-members notes))
      :(weld type-updates poke-cards local-cards ars-cards ro-mute-cards desc-users-cards desc-child-pokes root-users-cards)
    ::
        %create-artifact
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ::  cover/gossip artifact creation is not implemented; close legacy door
      ?:  ?|(?=(%cover type.u.exists) ?=(%gossip type.u.exists))  `this
      ::  Phase 1.1: defensive — a direct internal action must not store a one-sided DM
      ::  artifact. An ordinary DM with a removed/departed participant is
      ::  peer-unauthoritative, so no-op. Notebook/group are unaffected.
      ?:  ?&  =(%dm type.u.exists)
              ?|  !=(2 ~(wyt in users.u.exists))
                  !(~(has in users.u.exists) our.bowl)
                  !=(~ removed.u.exists)
              ==
          ==
        `this
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
      ::  Phase 3: an %app artifact in an ordinary 2-person DM is origin-hosted.
      ::  The full artifact + descriptor stay here on the creator; the counterparty gets ONLY
      ::  a content-free reference (%remote-dm-ref-upsert), never the descriptor or a full
      ::  artifact payload. content-hash lets the counterparty validate the ephemeral fetch.
      =/  dm-cards=(list card:agent:gall)
        ?.  ?&  =(%dm type.u.exists)
                =(%app type.act)
                =(2 ~(wyt in users.u.exists))
                =(~ removed.u.exists)
            ==
          ~
        =/  others=(list @p)  (skim ~(tap in users.u.exists) |=(p=@p !=(p our.bowl)))
        ?~  others  ~
        ?:  =(i.others our.bowl)  ~
        =/  dhash=@uv  (sham content:(rear versions.new-art))
        =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of new-art note-id.act `dhash)
        ?~  ref  ~
        ~[(rpoke /dm-ref-out/[aid] i.others `remote:noltbook`[%remote-dm-ref-upsert u.exists u.ref])]
      :_  this(notes (~(put by notes) note-id.act upd-note), artifacts (~(put by artifacts) aid new-art), note-activity (put-activity note-activity note-id.act now.bowl), note-unread-activity (put-unread-activity note-unread-activity note-id.act now.bowl), note-read (put-read note-read note-id.act now.bowl))
      %+  weld  dm-cards
      ^-  (list card:agent:gall)
      ::  1B.2: keep /notes/[nid] transport; drop the global host-human facts when hidden.
      %:  human-note-cards  note-id.act  our.bowl
          note-members  notes
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
      ::  ordinary DM: single-writer authority — only the artifact creator may edit ANY
      ::  DM artifact (app/file/code). Non-creator edits are rejected outright (no local
      ::  mutation, no propagation). Notebook/group behaviour is unchanged.
      ?:  ?&  ?=(^ nt)
              =(%dm type.u.nt)
              !=(our.bowl creator.u.old)
          ==
        `this
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
      ::  Phase 3: an %app artifact edit in an ordinary 2-person DM is origin-hosted. The
      ::  new full version stays here on the creator; the counterparty gets ONLY a newer
      ::  content-free reference (%remote-dm-ref-upsert). No descriptor or version history
      ::  is transmitted. Single-writer authority is enforced above (non-creator rejected).
      =/  dm-cards=(list card:agent:gall)
        ?.  ?&  ?=(^ nt)
                =(%dm type.u.nt)
                =(%app type.u.old)
                =(2 ~(wyt in users.u.nt))
                (~(has in users.u.nt) our.bowl)
                =(~ removed.u.nt)
            ==
          ~
        =/  others=(list @p)  (skim ~(tap in users.u.nt) |=(p=@p !=(p our.bowl)))
        ?~  others  ~
        ?:  =(i.others our.bowl)  ~
        =/  dhash=@uv  (sham content:(rear versions.upd-art))
        =/  ref=(unit dm-artifact-ref:noltbook)  (dm-ref-of upd-art note-id.u.old `dhash)
        ?~  ref  ~
        ~[(rpoke /dm-ref-edit-out/[id.act] i.others `remote:noltbook`[%remote-dm-ref-upsert u.nt u.ref])]
      :_  this(artifacts (~(put by artifacts) id.act upd-art))
      (weld dm-cards ~[(gf-paths ~[pax] upd)])
    ::
        %delete-artifact
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
      =/  nid=@ta  note-id.u.old
      =/  upd=update:noltbook  [%artifact-deleted id.act]
      =/  pax=path  ~[%notes nid]
      ::  Phase 3: an %app artifact delete in an ordinary 2-person DM is peer-authoritative
      ::  — also poke the sole counterparty (like create/edit), carrying the DM note + the
      ::  artifact id so they resolve their local id and drop their copy. Gated on both
      ::  parties current + none removed; a removed peer => no propagation (local delete
      ::  still applies).
      =/  nt  (~(get by notes) nid)
      ::  cover/ordinary-gossip: HOSTLESS origin-authoritative artifact deletion. Only the
      ::  artifact creator may delete. Remove the full artifact + its local artifact-envelope,
      ::  install a terminal eid tombstone, propagate %remote-mesh-delete through the mesh, and
      ::  emit the FE %artifact-deleted removal. Bytes in %noltbook-data are NOT touched; the
      ::  content endpoint becomes unavailable because the artifact + envelope are both gone.
      ?:  ?&(?=(^ nt) (is-mesh-note nid u.nt))
        ?.  =(our.bowl creator.u.old)  `this
        =/  art-eid=@uv  (dm-artifact-eid u.old)
        =/  aenvs=(map @ta artifact-envelope:noltbook)
          (fall (~(get by artifact-envelopes) nid) *(map @ta artifact-envelope:noltbook))
        =/  new-aenvs=(map @ta artifact-envelope:noltbook)  (~(del by aenvs) id.act)
        =/  pin-hit=?
          =/  pn  (~(get by note-pins) nid)
          ?~  pn  %.n
          &(=(%artifact kind.u.pn) =(art-eid target.u.pn))
        =/  new-pins=(map @ta note-pin:noltbook)
          ?:(pin-hit (~(del by note-pins) nid) note-pins)
        =/  pin-clear-cards=(list card)  ?:(pin-hit (pin-cards nid ~) ~)
        ::  build + store the CANONICAL artifact tomb record (author=us) atomically.
        =/  tomb=mesh-tomb:noltbook  [art-eid nid our.bowl %artifact ~ `id.act]
        ::  origin propagation: authoritative %remote-mesh-delete carrying the canonical record
        ::  to the artifact's exact route (cover=pal-outgoing, gossip=note.users).
        =/  targets=(list @p)
          (mesh-delete-targets u.nt %.y our.bowl pal-incoming pal-outgoing)
        =/  mesh-cards=(list card)
          %+  turn  targets
          |=  p=@p
          ^-  card
          (rpoke /mesh-del/(scot %p p) p `remote:noltbook`[%remote-mesh-delete tomb])
        ::  recompute sidebar preview from remaining entries (gossip; cover is FE).
        =/  upd-note2=note:noltbook
          (recompute-mesh-note u.nt (fall (~(get by messages) nid) ~) (fall (~(get by gossip-envelopes) nid) *(map @da envelope:noltbook)) new-aenvs)
        ::  note-scoped live removal (artifact: aid + eid)
        =/  del-upd=update:noltbook  [%mesh-entry-deleted nid `art-eid `id.act ~]
        ::  after the canonical artifact removal + mesh tombstone above: delete our own
        ::  %file bytes from %noltbook-data on a BEST-EFFORT basis (we are the creator,
        ::  checked above). %app and %code artifacts have no stored file bytes to delete.
        ::  The semantic deletion is already authoritative and never waits on this.
        =/  byte-del=(list card)
          ?.  =(%file type.u.old)  ~
          (art-store-del-cards our.bowl now.bowl id.act)
        :_  this(notes (~(put by notes) nid upd-note2), artifacts (~(del by artifacts) id.act), artifact-envelopes (~(put by artifact-envelopes) nid new-aenvs), note-pins new-pins, mesh-tombs (~(put in mesh-tombs) art-eid), mesh-tomb-meta (~(put by mesh-tomb-meta) art-eid tomb))
        ;:  weld
          byte-del
          ~[(gf-paths ~[pax] del-upd)]
          ~[(gf-notes del-upd)]
          pin-clear-cards
          mesh-cards
        ==
      ::  shared-note (%group/%notebook) artifact deletion is HOST-AUTHORITATIVE. If we host
      ::  the note, delete through the single authoritative helper (validates artifact
      ::  creator/note host/current admin, installs a terminal tombstone, broadcasts the
      ::  removal + a durable \01SYS:art-delete marker to every subscriber). If we are a
      ::  non-host member, forward the intent to the host via %remote-artifact-delete and do
      ::  NOT finalize locally — the artifact disappears only on the host's authoritative
      ::  %artifact-deleted broadcast, so reloaded/snapshot state can never disagree.
      ::  Scope: ONLY an ordinary human %group/%notebook AND only %file/%app artifacts.
      ::  %code falls through to its exact pre-change local-delete behavior below.
      ?:  ?&  ?=(^ nt)
              ?|(?=(%group type.u.nt) ?=(%notebook type.u.nt))
              ?|(=(%file type.u.old) =(%app type.u.old))
          ==
        ?:  =(our.bowl creator.u.nt)
          =^  cards  state  (delete-note-artifact bowl our.bowl nid id.act state)
          [cards this]
        :_  this
        ~[(rpoke /art-del-out/[id.act] creator.u.nt `remote:noltbook`[%remote-artifact-delete nid id.act])]
      ::  ordinary DM: single-writer authority — only the artifact creator may delete ANY
      ::  DM artifact (app/file/code). Non-creator deletes are rejected outright (no local
      ::  mutation, no propagation). Notebook/group + moderation is unchanged.
      ?:  ?&  ?=(^ nt)
              =(%dm type.u.nt)
              !=(our.bowl creator.u.old)
          ==
        `this
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
      ::  Phase 3: ordinary-DM %file OR %app deletion — write a TERMINAL tombstone
      ::  (atomically with artifact removal), drop any local reference, and ALWAYS notify
      ::  the counterparty via %remote-dm-ref-delete (no protocol gate; the legacy %app
      ::  delete wire is retired). The EID is never reused, so no delayed create/edit/
      ::  snapshot/content response can resurrect it.
      =/  is-dm-art=?
        ?&  ?=(^ nt)
            =(%dm type.u.nt)
            ?|(=(%file type.u.old) =(%app type.u.old))
            =(our.bowl creator.u.old)
        ==
      =/  art-eid=@uv  (dm-artifact-eid u.old)
      =/  art-kind=dm-artifact-type:noltbook  ?:(=(%app type.u.old) %app %file)
      =/  art-tomb=dm-artifact-tomb:noltbook
        [art-eid id.u.old our.bowl nid art-kind (dm-artifact-rev u.old) now.bowl]
      =/  new-tombs=(map @uv dm-artifact-tomb:noltbook)
        ?.  is-dm-art  dm-artifact-tombs
        (~(put by dm-artifact-tombs) art-eid art-tomb)
      =/  new-refs=(map @uv dm-artifact-ref:noltbook)
        ?.  is-dm-art  dm-artifact-refs
        (~(del by dm-artifact-refs) art-eid)
      =/  dm-del-cards=(list card)
        ?.  is-dm-art  ~
        ?.  ?=(^ nt)  ~
        ?.  ?&(=(2 ~(wyt in users.u.nt)) (~(has in users.u.nt) our.bowl) =(~ removed.u.nt))  ~
        =/  others=(list @p)  (skim ~(tap in users.u.nt) |=(p=@p !=(p our.bowl)))
        ?~  others  ~
        ?:  =(i.others our.bowl)  ~
        ~[(rpoke /dm-ref-del-out/[id.act] i.others `remote:noltbook`[%remote-dm-ref-delete u.nt art-tomb])]
      ::  ordinary-DM %file we created (is-dm-art requires creator == our.bowl) with the
      ::  terminal tomb installed here. A counterparty holds only a content-free reference
      ::  and never reaches this branch, so it can never attempt a local byte deletion.
      =/  byte-del=(list card)
        ?.  ?&(is-dm-art =(%file type.u.old))  ~
        (art-store-del-cards our.bowl now.bowl id.act)
      :_  this(artifacts (~(del by artifacts) id.act), note-pins new-pins, dm-artifact-refs new-refs, dm-artifact-tombs new-tombs)
      ::  1B.2: /notes/[nid] transport kept; any global pin-clear /notes fact dropped if hidden.
      %+  weld  byte-del
      ^-  (list card)
      %+  weld  dm-del-cards
      ^-  (list card:agent:gall)
      %:  human-note-cards  nid  our.bowl
          note-members  notes
        (weld ~[(gf-paths ~[pax] upd)] pin-clear-cards)
      ==
    ::
        %file-save
      =/  old  (~(get by artifacts) id.act)
      ?~  old  `this
      ?:  (is-write-blocked note-id.u.old host-status notes our.bowl)  `this
      ::  ordinary DM: single-writer authority — only the artifact creator may overwrite a
      ::  DM file artifact. Non-creator saves are rejected. Notebook/group unchanged.
      =/  nt-fs  (~(get by notes) note-id.u.old)
      ?:  ?&  ?=(^ nt-fs)
              =(%dm type.u.nt-fs)
              !=(our.bowl creator.u.old)
          ==
        `this
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
      ::  Durable record of a send SUBMITTED through Noltbook: Iris reported success
      ::  and returned an id. That is NOT independent chain confirmation, and this
      ::  list is not whole-wallet history -- only sends started from this client.
      ::  amount is INTEGER NICKS (65,536 nicks = 1 NOCK), matching the value handed
      ::  to Iris. Retention: newest 100 rows, older activity is dropped.
      =/  tx=transaction:noltbook  [%sent to.act amount.act tx-hash.act now.bowl]
      =/  new-txs=(list transaction:noltbook)  (scag 100 `(list transaction:noltbook)`[tx transactions])
      =/  upd=update:noltbook  [%wallet-update new-txs]
      ::  Tell the recipient, so they get a %received row. to.act is whatever the
      ::  client resolved: a canonical @p when it identified a ship, otherwise a raw
      ::  wallet address. Only a parseable @p is notified -- the backend never guesses
      ::  address->ship, so contested address ownership can never misattribute a row.
      ::  Sent to a raw address, or to ourselves, this stays sender-only activity.
      ::  Carries the FULL id and exact nicks, and depends on no DM -- which is what
      ::  keeps it clear of the new-DM creation race.
      =/  peer=(unit @p)  (slaw %p to.act)
      =/  peer-cards=(list card)
        ?~  peer  ~
        ?:  =(u.peer our.bowl)  ~
        :_  ~
        %^    rpoke
            /wact/(scot %p u.peer)
          u.peer
        `remote:noltbook`[%remote-wallet-activity amount.act tx-hash.act]
      :_  this(transactions new-txs)
      [(gf-notes upd) peer-cards]
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
      ::  record the lookup so every wake can tell "we heard from them during THIS lookup"
      ::  from an older handshake. Two wakes are armed now: the first EARLY check at ~1s
      ::  (which chains 1s -> 3s -> 7s -> 15s until contact is observed) and the FINAL
      ::  classifier at 27s -- just inside the unchanged 28s frontend backstop.
      ::  Both wires carry phase/req-id/ship/started so a stale wake from a previous
      ::  session cannot match a reused request id. Early checks are local scries only:
      ::  no extra network traffic is ever sent.
      =/  pend=pending-profile-lookup:noltbook  [ship.act now.bowl]
      =/  corr=path
        /(scot %ud req-id.act)/(scot %p ship.act)/(scot %da now.bowl)
      :_  this(pending-profile-lookups (~(put by pending-profile-lookups) req-id.act pend))
      :~  (rpoke /profile-lookup/(scot %p ship.act)/(scot %ud req-id.act) ship.act req)
          [%pass (weld /prof-early/(scot %ud 1) corr) %arvo %b %wait (add now.bowl ~s1)]
          [%pass (weld /prof-reach corr) %arvo %b %wait (add now.bowl ~s27)]
      ==
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
      ::  sending/reciprocating a pal request is a local choice: save them as an
      ::  explicit contact so removing our outgoing later leaves the row intact.
      ::  incoming requests (%remote-hey) never do this — only our own action.
      =/  new-contacts=(set @p)  (~(put in contacts) ship.act)
      =/  hey-card=card
        (rpoke /pal-hey/(scot %p ship.act) ship.act `remote:noltbook`[%remote-hey ~])
      =/  prof  (fall (~(get by profiles) our.bowl) *profile:noltbook)
      =/  prof-card=card
        (rpoke /prof-out/(scot %p ship.act) ship.act `remote:noltbook`[%remote-profile our.bowl prof])
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %mutual
        %requesting
      =/  upd=update:noltbook  [%pal-update ship.act status]
      =/  cupd=update:noltbook  [%contact-list ~(tap in new-contacts)]
      :_  this(pal-outgoing new-outgoing, pal-blocked new-blocked, peers new-peers, contacts new-contacts)
      :~  hey-card
          prof-card
          (pal-sync-card ship.act new-outgoing pal-incoming new-blocked)
          (gf-notes upd)
          (gf-notes cupd)
      ==
    ::
        %remove-pal
      ?:  =(ship.act our.bowl)  `this
      =/  had-outgoing=?  (~(has in pal-outgoing) ship.act)
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      ::  backfill: a pal relationship created before %add-pal saved contacts has no
      ::  contacts entry. Add it here so legacy and new state converge on removal --
      ::  no on-load migration needed. Only when we actually had outgoing state:
      ::  removing a pal we never followed must not invent a contact.
      =/  new-contacts=(set @p)
        ?.  had-outgoing  contacts
        (~(put in contacts) ship.act)
      =/  bye-card=card
        (rpoke /pal-bye/(scot %p ship.act) ship.act `remote:noltbook`[%remote-bye ~])
      =/  still-visible=?
        ?|  (~(has in new-contacts) ship.act)
            (~(has in pal-incoming) ship.act)
            (~(has in pal-blocked) ship.act)
        ==
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      =/  cupd=update:noltbook  [%contact-list ~(tap in new-contacts)]
      :_  this(pal-outgoing new-outgoing, contacts new-contacts)
      :~  bye-card
          (pal-sync-card ship.act new-outgoing pal-incoming pal-blocked)
          (gf-notes upd)
          (gf-notes cupd)
      ==
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
      ~[(pal-sync-card ship.act pal-outgoing new-incoming pal-blocked) (gf-notes upd)]
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
      :(weld [(gf-notes upd) (pal-sync-card ship.act new-outgoing new-incoming new-blocked) ~] bye-cards cards.removal-result cards.leave-result)
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
          (pal-sync-card ship.act pal-outgoing pal-incoming new-blocked)
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
      ::  remove the explicit contact plus our own outgoing pal relationship.
      ::  pal-incoming is THEIR outgoing choice, not ours: we cannot clear it here
      ::  (a remote %remote-pal-sync would just restore it), so an incoming request
      ::  stays visible. block state is untouched.
      ?:  =(ship.act our.bowl)  `this
      =/  new-contacts=(set @p)  (~(del in contacts) ship.act)
      =/  had-outgoing=?  (~(has in pal-outgoing) ship.act)
      =/  new-outgoing=(set @p)  (~(del in pal-outgoing) ship.act)
      =/  bye-cards=(list card)
        ?.  had-outgoing  ~
        ~[(rpoke /pal-bye/(scot %p ship.act) ship.act `remote:noltbook`[%remote-bye ~])]
      ::  blocked ships, and ships with a live incoming request, remain visible.
      =/  still-visible=?
        ?|  (~(has in pal-blocked) ship.act)
            (~(has in pal-incoming) ship.act)
        ==
      =/  status=pal-status:noltbook
        ?:  (~(has in pal-blocked) ship.act)  %blocked
        ?:  (~(has in pal-incoming) ship.act)  %requested
        %none
      ::  if nothing keeps them visible, emit %pal-removed so frontend drops row.
      =/  upd=update:noltbook
        ?:  still-visible  [%pal-update ship.act status]
        [%pal-removed ship.act]
      =/  cupd=update:noltbook  [%contact-list ~(tap in new-contacts)]
      =/  base-cards=(list card)
        :~  (gf-notes upd)
            (gf-notes cupd)
        ==
      :_  this(contacts new-contacts, pal-outgoing new-outgoing)
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
      ::  ---- ordinary DM: symmetric participant authority, %message only ----
      ::  `expect` MUST be read here, BEFORE the local pin is replaced, so the peer's
      ::  compare-and-set tests the pin we actually saw rather than the one we just set.
      =/  pin-nt  (~(get by notes) note-id.act)
      =/  pin-is-dm=?  ?~(pin-nt %.n (is-ordinary-dm u.pin-nt))
      ?:  pin-is-dm
        ?~  pin-nt  `this                       ::  unreachable; re-narrows for the compiler
        ?.  =(%message kind.act)  `this         ::  DM artifact pins stay unsupported
        ?.  (dm-pin-ok our.bowl our.bowl note-id.act notes host-status)  `this
        ?.  (pin-target-ok note-id.act target.act %message messages artifacts)  `this
        =/  expect=(unit @uv)  (dm-pin-target note-id.act note-pins)
        =/  new-pin=note-pin:noltbook  [target.act %message our.bowl now.bowl]
        =/  peer  (dm-peer-of u.pin-nt our.bowl)
        ::  one poke, on the SAME wire as %remote-dm-message, so a pin can never
        ::  overtake the message it targets and PIN->UNPIN stays ordered.
        =/  peer-cards=(list card)
          ?~  peer  ~
          ~[(rpoke /dm-msg/[note-id.act] u.peer `remote:noltbook`[%remote-note-pin `target.act expect])]
        :_  this(note-pins (~(put by note-pins) note-id.act new-pin))
        %+  weld
          (human-note-cards note-id.act our.bowl note-members notes (pin-cards note-id.act `new-pin))
        peer-cards
      ::  creator-only + host-authoritative; broadcast live to subscribers. Since
      ::  creator == host, a non-creator member just fails here (no forwarding).
      ::  Setting replaces any existing pin for this note.
      =/  res  (apply-set-pin our.bowl note-id.act target.act kind.act notes messages artifacts host-status now.bowl)
      ?:  ?=(%.n -.res)  `this
      :_  this(note-pins (~(put by note-pins) note-id.act p.res))
      ::  1B.2: pin-cards emits a global /notes fact (+ transport); drop the global one if hidden.
      (human-note-cards note-id.act our.bowl note-members notes (pin-cards note-id.act `p.res))
    ::
        %clear-note-pin
      ::  ---- ordinary DM: either participant may clear, whoever set it ----
      =/  cpin-nt  (~(get by notes) note-id.act)
      =/  cpin-is-dm=?  ?~(cpin-nt %.n (is-ordinary-dm u.cpin-nt))
      ?:  cpin-is-dm
        ?~  cpin-nt  `this                      ::  unreachable; re-narrows
        ?.  (dm-pin-ok our.bowl our.bowl note-id.act notes host-status)  `this
        =/  expect=(unit @uv)  (dm-pin-target note-id.act note-pins)
        ::  nothing pinned (or an artifact pin from malformed state): idempotent no-op,
        ::  no state change, no fact, and no remote card.
        ?~  expect  `this
        =/  peer  (dm-peer-of u.cpin-nt our.bowl)
        =/  peer-cards=(list card)
          ?~  peer  ~
          ~[(rpoke /dm-msg/[note-id.act] u.peer `remote:noltbook`[%remote-note-pin ~ expect])]
        :_  this(note-pins (~(del by note-pins) note-id.act))
        %+  weld
          (human-note-cards note-id.act our.bowl note-members notes (pin-cards note-id.act ~))
        peer-cards
      =/  res  (apply-clear-pin our.bowl note-id.act notes host-status)
      ?:  ?=(%.n -.res)  `this
      ::  idempotent: if nothing was pinned, no state change and no broadcast.
      ?.  (~(has by note-pins) note-id.act)  `this
      :_  this(note-pins (~(del by note-pins) note-id.act))
      (human-note-cards note-id.act our.bowl note-members notes (pin-cards note-id.act ~))
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
      :_  this(notes notes-after, messages (~(put by messages) id.act new-msgs), note-admins clean-admins, note-muted clean-muted, member-revs new-revs, note-members (del-member-from-ids ship.act [id.act group-descs] note-members notes))
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
        =/  msgs-after  (~(del by messages) id.act)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by notes) id.act), messages msgs-after, artifacts cleaned-arts, cleared-mentions (~(del by cleared-mentions) id.act), note-members (~(del by note-members) id.act))
        base-cards
      ::  gossip: hostless container — leaving is a LOCAL-ONLY silent drop. Never kick
      ::  members and never notify a host (there is none); just remove our own copy.
      ?:  =(%gossip type.u.old)
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  msgs-after  (~(del by messages) id.act)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by notes) id.act), messages msgs-after, artifacts cleaned-arts, gossip-envelopes (~(del by gossip-envelopes) id.act), cleared-mentions (~(del by cleared-mentions) id.act), note-members (~(del by note-members) id.act))
        base-cards
      ::  sole user: act like delete
      ?:  (lte user-count 1)
        =/  trimmed=(map @ta note:noltbook)
          ?~  parent.u.old  notes
          =/  par  (~(get by notes) u.parent.u.old)
          ?~  par  notes
          (~(put by notes) u.parent.u.old u.par(children (skim children.u.par |=(c=@ta !=(c id.act)))))
        =/  upd=update:noltbook  [%note-deleted id.act]
        =/  msgs-after  (~(del by messages) id.act)
        =/  base-cards=(list card)  ~[(gf-notes upd)]
        :_  this(notes (~(del by trimmed) id.act), messages msgs-after, artifacts cleaned-arts, cleared-mentions (~(del by cleared-mentions) id.act), note-members (~(del by note-members) id.act))
        base-cards
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
        :_  this(notes notes-after, messages msgs-after, artifacts arts-after, note-members (prune-note-members subtree-ids note-members))
        :(weld local-deletes ~[(gf-paths ~[pax] upd)] kick-cards)
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
      :_  this(notes notes-after, messages msgs-after, artifacts arts-after, note-members (prune-note-members subtree-ids note-members))
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
      ::  must not already have a DM for this pair
      =/  target-users=(set @p)  (sy ~[our.bowl ship.act])
      =/  dm-root  (find-dm-root notes target-users)
      ?^  dm-root  `this
      ::  convert in place: type->dm, add user, set name
      ::  become an ordinary %dm, then localize defaults (name = counterparty @p, icon
      ::  cleared) + overlay any saved local DM pref. The former notebook name/icon must
      ::  not persist as DM presentation.
      =/  base-note=note:noltbook
        u.old(type %dm, users target-users)
      =/  new-note=note:noltbook  (apply-dm-pref base-note dm-prefs our.bowl)
      =/  upd=update:noltbook  [%note-created new-note]
      ::  invite remote with the DEFAULT counterparty name (do not leak local pref)
      =/  rem=remote:noltbook  [%remote-invite id.act (scot %p ship.act) %dm our.bowl target-users %secret &]
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
      ::  seed the batch above both the counter and anything already in the destination DM
      =/  cur-seq=@ud
        (dec (dm-next-seq (fall (~(get by seq-counters) dm-id) 0) dm-msgs))
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
                       (rpoke /dm-msg/[dm-id] ship.act `remote:noltbook`[%remote-message dm-id new-msg ~ ~])
                   ==
      ==
    ::
    ::  ===== CALL ACTIONS =====
    ::
        %start-call
      ::  Local user pressed CALL. If we host the note we allocate; otherwise we only
      ::  REQUEST and wait for the host's snapshot -- the frontend must not treat the
      ::  poke landing as the call existing.
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ?.  (call-eligible note-id.act u.exists)  `this
      =/  cur  (~(get by calls) note-id.act)
      ?:  ?&(?=(^ cur) ?=(^ call.u.cur))  `this
      ?.  =(our.bowl creator.u.exists)
        :_  this
        :~  %^    rpoke
                /call-start/(scot %p creator.u.exists)/[note-id.act]
              creator.u.exists
            `remote:noltbook`[%remote-call-start note-id.act]
        ==
      =/  snap=call-snapshot:noltbook
        %-  norm-snap
        (host-start-snap note-id.act our.bowl now.bowl (call-gen calls note-id.act))
      ?~  call.snap  `this
      =/  dl=@da  (add now.bowl call-lease-ttl)
      =/  msg  (call-sys-msg now.bowl note-id.act our.bowl (call-started-txt our.bowl))
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  msg-upd=update:noltbook  [%new-message msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.act]
      :_  %=  this
            calls        (~(put by calls) note-id.act snap)
            call-leases  (put-lease call-leases note-id.act our.bowl dl)
            messages     (~(put by messages) note-id.act (snoc cur-msgs msg))
          ==
      ;:  weld
        (call-snap-cards users.u.exists snap our.bowl)
        (call-local-cards snap)
        ~[(gf-paths ~[pax] msg-upd)]
        ~[(lease-wake note-id.act call-id.u.call.snap our.bowl dl)]
      ==
    ::
        %join-call
      ?:  (is-write-blocked note-id.act host-status notes our.bowl)  `this
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      ?.  (call-eligible note-id.act u.exists)  `this
      =/  cur  (~(get by calls) note-id.act)
      ?~  cur  `this
      ?~  call.u.cur  `this
      =/  ci  u.call.u.cur
      ?.  =(our.bowl creator.u.exists)
        :_  this
        :~  %^    rpoke
                /call-join/(scot %p creator.u.exists)/[note-id.act]
              creator.u.exists
            `remote:noltbook`[%remote-call-join note-id.act]
        ==
      =/  dl=@da  (add now.bowl call-lease-ttl)
      ?:  (~(has in participants.ci) our.bowl)
        :_  this(call-leases (put-lease call-leases note-id.act our.bowl dl))
        ~[(lease-wake note-id.act call-id.ci our.bowl dl)]
      =/  new-ci=call-info:noltbook
        ci(participants (~(put in participants.ci) our.bowl))
      ::  same rule as the remote join: one revision per authored change
      =/  snap=call-snapshot:noltbook
        (norm-snap [note-id.act +(gen.u.cur) `new-ci])
      =/  msg  (call-sys-msg now.bowl note-id.act our.bowl (call-joined-txt our.bowl))
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  msg-upd=update:noltbook  [%new-message msg ~ ~ ~]
      =/  pax=path  ~[%notes note-id.act]
      :_  %=  this
            calls        (~(put by calls) note-id.act snap)
            call-leases  (put-lease call-leases note-id.act our.bowl dl)
            messages     (~(put by messages) note-id.act (snoc cur-msgs msg))
          ==
      ;:  weld
        (call-snap-cards users.u.exists snap our.bowl)
        (call-local-cards snap)
        ~[(gf-paths ~[pax] msg-upd)]
        ~[(lease-wake note-id.act call-id.new-ci our.bowl dl)]
      ==
    ::
        %leave-call
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  cur  (~(get by calls) note-id.act)
      ?~  cur  `this
      ?~  call.u.cur  `this
      ?.  (~(has in participants.u.call.u.cur) our.bowl)  `this
      ::  non-host: ask the host to drop us. Our badge clears when its snapshot lands,
      ::  never on the poke merely being accepted.
      ?.  =(our.bowl creator.u.exists)
        :_  this
        :~  %^    rpoke
                /call-leave/(scot %p creator.u.exists)/[note-id.act]
              creator.u.exists
            `remote:noltbook`[%remote-call-leave note-id.act]
        ==
      =/  res  (host-drop now.bowl u.cur our.bowl)
      =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) note-id.act) ~)
      =/  pax=path  ~[%notes note-id.act]
      =/  leases-1  (del-lease call-leases note-id.act our.bowl)
      =/  leases-2  ?:(ended.res (~(del by leases-1) note-id.act) leases-1)
      :_  %=  this
            calls        (~(put by calls) note-id.act out.res)
            call-leases  leases-2
            messages     (~(put by messages) note-id.act (weld cur-msgs msgs.res))
          ==
      ;:  weld
        (call-snap-cards users.u.exists out.res our.bowl)
        (call-local-cards out.res)
        %+  turn  msgs.res
        |=  m=message:noltbook
        (gf-paths ~[pax] `update:noltbook`[%new-message m ~ ~ ~])
      ==
    ::
        %call-heartbeat
      ::  liveness for OURSELVES only, sent while actually joined. Non-hosts forward it.
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  cur  (~(get by calls) note-id.act)
      ?~  cur  `this
      ?~  call.u.cur  `this
      ?.  (~(has in participants.u.call.u.cur) our.bowl)  `this
      ?.  =(our.bowl creator.u.exists)
        :_  this
        :~  %^    rpoke
                /call-hb/(scot %p creator.u.exists)/[note-id.act]
              creator.u.exists
            `remote:noltbook`[%remote-call-heartbeat note-id.act]
        ==
      =/  dl=@da  (add now.bowl call-lease-ttl)
      :_  this(call-leases (put-lease call-leases note-id.act our.bowl dl))
      ~[(lease-wake note-id.act call-id.u.call.u.cur our.bowl dl)]
    ::
        %sync-calls
      ::  frontend channel reconnect: re-hydrate the browser from what we hold AND ask
      ::  every remote host for its current truth, so a missed ending self-heals.
      :_  this
      %+  weld
        ~[(gf-notes `update:noltbook`[%call-list ~(val by calls)])]
      (call-sync-cards notes our.bowl)
    ::
        %call-signal
      ::  relay a WebRTC signal to one peer. Only inside a LIVE call we are in, and only
      ::  to a ship that is actually a participant.
      =/  exists  (~(get by notes) note-id.act)
      ?~  exists  `this
      =/  cur  (~(get by calls) note-id.act)
      ?~  cur  `this
      ?~  call.u.cur  `this
      =/  ci  u.call.u.cur
      ?.  (~(has in participants.ci) our.bowl)  `this
      ?.  (~(has in participants.ci) to.act)  `this
      :_  this
      :~  %^    rpoke
              /call-sig/(scot %p to.act)/[note-id.act]
            to.act
          `remote:noltbook`[%remote-call-signal call-id.ci our.bowl sig-type.act payload.act]
      ==
    ::
        %clear-calls
      ::  operator escape hatch. For notes we HOST this is a real authoritative end
      ::  broadcast to the members; for notes hosted elsewhere we drop our cached copy
      ::  and immediately re-ask the host, so we cannot invent an ending for someone else.
      =/  ours=(list [@ta call-snapshot:noltbook])
        %+  skim  ~(tap by calls)
        |=  [nid=@ta *]
        =/  nt  (~(get by notes) nid)
        ?~  nt  %.n
        =(our.bowl creator.u.nt)
      ::  only an ACTIVE hosted call is a real ending: it gets one revision bump. An
      ::  already-empty record is left exactly as it is, so a duplicate %clear-calls
      ::  cannot inflate the revision or invalidate the host's own later snapshots.
      =/  ended-map=(map @ta call-snapshot:noltbook)
        %+  roll  ours
        |=  [[nid=@ta snap=call-snapshot:noltbook] acc=(map @ta call-snapshot:noltbook)]
        ?~  call.snap  acc
        (~(put by acc) nid [nid +(gen.snap) ~])
      =/  host-cards=(list card)
        %-  zing
        %+  turn  ~(tap by ended-map)
        |=  [nid=@ta snap=call-snapshot:noltbook]
        ^-  (list card)
        =/  nt  (~(get by notes) nid)
        ?~  nt  ~
        (call-snap-cards users.u.nt snap our.bowl)
      =/  next-calls=(map @ta call-snapshot:noltbook)
        (~(uni by calls) ended-map)
      :_  this(calls next-calls, call-leases *(map @ta (map @p @da)))
      ;:  weld
        host-cards
        ~[(gf-notes `update:noltbook`[%call-list ~(val by next-calls)])]
        (call-sync-cards notes our.bowl)
      ==
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
      :_  this(notes (~(put by notes) note-id.act new-note), peers new-peers, note-muted (~(put by note-muted) note-id.act ro-muted), member-revs new-revs, note-members (put-logical-member note-id.act ship.act note-members notes))
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
  ::  Call lease expiry. The wire carries note, CALL ID, participant and deadline, and
  ::  every one is re-checked below, in that order. Nothing is ever cancelled, so no
  ::  timer bookkeeping can leak; a wake that no longer describes reality simply returns.
  ::  Keyed on call-id rather than the snapshot revision, so another participant joining
  ::  or leaving -- which does advance the revision -- leaves this timer intact.
  ?:  ?=([%call-lease @ @ @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  nid=@ta   i.t.wire
    =/  cid=@ta   i.t.t.wire
    =/  who=@p    (slav %p i.t.t.t.wire)
    =/  at=@da    (slav %da i.t.t.t.t.wire)
    ::  1. the note still has a call record
    =/  cur  (~(get by calls) nid)
    ?~  cur  `this
    ::  2. that record is an ACTIVE call
    ?~  call.u.cur  `this
    ::  3. it is the SAME call this wake was armed for. A wake from an earlier call on
    ::     this note dies here, and a revision bump from someone else's join or leave
    ::     does not.
    ?.  =(cid call-id.u.call.u.cur)  `this
    ::  4. the participant is still in it
    ?.  (~(has in participants.u.call.u.cur) who)  `this
    ::  5. the note still exists and 6. we still host it -- only a host expires anyone
    =/  nt  (~(get by notes) nid)
    ?~  nt  `this
    ?.  =(our.bowl creator.u.nt)  `this
    ::  7. we still hold a lease for them
    =/  held  (~(get by (fall (~(get by call-leases) nid) *(map @p @da))) who)
    ?~  held  `this
    ::  8. it is THIS deadline -- a later heartbeat moved it, so that wake supersedes us
    ?.  =(u.held at)  `this
    ::  9. and it has actually expired
    ?:  (gth u.held now.bowl)  `this
    =/  res  (host-drop now.bowl u.cur who)
    =/  cur-msgs=(list message:noltbook)  (fall (~(get by messages) nid) ~)
    =/  pax=path  ~[%notes nid]
    =/  leases-1  (del-lease call-leases nid who)
    =/  leases-2  ?:(ended.res (~(del by leases-1) nid) leases-1)
    :_  %=  this
          calls        (~(put by calls) nid out.res)
          call-leases  leases-2
          messages     (~(put by messages) nid (weld cur-msgs msgs.res))
        ==
    ;:  weld
      (call-snap-cards users.u.nt out.res our.bowl)
      (call-local-cards out.res)
      %+  turn  msgs.res
      |=  m=message:noltbook
      (gf-paths ~[pax] `update:noltbook`[%new-message m ~ ~ ~])
    ==
  ?:  ?=([%eyre %bound *] sign-arvo)
    ~?  !accepted.sign-arvo
      [dap.bowl "eyre bind rejected!" binding.sign-arvo]
    `this
  ::  Clay's %c %info does NOT acknowledge: base/sys/vane/clay.hoon emits %mere only
  ::  from the merge core (++done), never from ++info/+park. Upload completion is
  ::  therefore driven by the /avatar-write-done and /icon-write-done Behn wakes
  ::  below, NOT by %mere. This block now only traces genuine merge failures.
  ?:  ?=([%clay %mere *] sign-arvo)
    ::  every other Clay wire keeps its previous behaviour: success is a no-op,
    ::  failure is traced. Avatar and artifact writes are unchanged.
    ?:  ?=(%& -.p.sign-arvo)  `this
    ~&  [%clay-write-failed wire]
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
  ::  Part 9: ordinary-DM %file fetch timeout. If the pending request is still open at the
  ::  deadline, answer 503 and clear it. Late/duplicate responses after removal are no-ops;
  ::  every held Eyre request is completed at most once.
  ::  held remote note-icon request expired: answer 504 and drop the row, so a late
  ::  content/denied/nack reply finds nothing and cannot answer the request twice.
  ::  ===== upload completion (replaces the unreachable %clay %mere path) =====
  ::  Verified by CONTENT: the stored bytes must hash to the uploaded hash carried on
  ::  the wire. That distinguishes a real replacement from a stale file left in place.
  ?:  ?=([%avatar-write-done @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  eid=@ta   i.t.wire
    =/  want=@uv  (slav %uv i.t.t.wire)
    =/  pw  (~(get by pending-img-writes) eid)
    ?~  pw  `this
    ?.  ?=(%avatar kind.u.pw)  `this
    =/  dropped  (~(del by pending-img-writes) eid)
    =/  got  (avatar-read our.bowl now.bowl q.byk.bowl)
    ?:  ?|(?=(~ got) !=(want (sham q.u.got)))
      ::  never landed, or what is stored is not what was uploaded: keep the previous
      ::  avatar exactly as it was and do not set has-avatar.
      ~&  [%avatar-write-unverified eid answered=answered.u.pw]
      :_  this(pending-img-writes dropped)
      ?:  answered.u.pw  ~
      (give-simple-payload:app:server eid `simple-payload:http`[[500 ~] ~])
    :_  this(has-avatar %.y, pending-img-writes dropped)
    ?:  answered.u.pw  ~
    (give-simple-payload:app:server eid `simple-payload:http`[[200 ~] ~])
  ::
  ?:  ?=([%icon-write-done @ @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  nid=@ta   i.t.wire
    =/  eid=@ta   i.t.t.wire
    =/  want=@uv  (slav %uv i.t.t.t.wire)
    =/  pw  (~(get by pending-img-writes) eid)
    ?~  pw  `this
    ?.  ?=(%icon kind.u.pw)  `this
    ?.  =(nid note-id.u.pw)  `this
    =/  dropped  (~(del by pending-img-writes) eid)
    =/  got  (icon-read our.bowl now.bowl nid)
    ?:  ?|(?=(~ got) !=(want (sham q.u.got)))
      ::  unverified: leave the note's icon and the DM preference untouched.
      ~&  [%icon-write-unverified nid eid answered=answered.u.pw]
      :_  this(pending-img-writes dropped)
      ?:  answered.u.pw  ~
      (give-simple-payload:app:server eid `simple-payload:http`[[500 ~] ~])
    ::  verified: publish the stable pointer, the DM pref and the refresh fact. The
    ::  fact fires on first upload AND replacement, since the URL never changes.
    =/  old  (~(get by notes) nid)
    ?~  old
      :_  this(pending-img-writes dropped)
      ?:  answered.u.pw  ~
      (give-simple-payload:app:server eid `simple-payload:http`[[404 ~] ~])
    =/  new-url=@t  (note-icon-pointer nid)
    =/  new-nt=note:noltbook  u.old(icon-url `new-url)
    =/  is-dm=?  =(%dm type.u.old)
    =/  upd=update:noltbook  [%note-meta-updated nid visibility.u.old `new-url writable.u.old]
    =/  new-prefs=(map @p dm-pref)
      ?.  is-dm  dm-prefs
      =/  cp=(unit @p)  (dm-counterparty users.u.old our.bowl)
      ?~  cp  dm-prefs
      =/  cur=dm-pref  (fall (~(get by dm-prefs) u.cp) [~ ~])
      (~(put by dm-prefs) u.cp cur(icon-url `new-url))
    =/  meta-fact-cards=(list card)
      ?:  is-dm
        ~[(gf-notes upd)]
      :~  (gf-notes upd)
          (gf-paths ~[/notes/[nid]] upd)
      ==
    =/  ok-http=(list card)
      ?:  answered.u.pw  ~
      (give-simple-payload:app:server eid `simple-payload:http`[[200 ~] ~])
    :_  this(notes (~(put by notes) nid new-nt), dm-prefs new-prefs, pending-img-writes dropped)
    (weld ok-http meta-fact-cards)
  ::
  ::  EARLY reachability check: /prof-early/[phase]/[req-id]/[ship]/[started]. Local Ames
  ::  scry only -- never any extra network traffic. On observed contact it emits the
  ::  NON-TERMINAL %reachable and stops chaining; otherwise it arms the next phase
  ::  (1s -> 3s -> 7s -> 15s) and after 15s falls through to the already-armed 27s wake.
  ::  All three of req-id, ship and started must match the pending row, so a stale wake
  ::  from a previous session cannot match even if its request id has been reused.
  ::  Never deletes the pending row: only a terminal outcome may do that.
  ?:  ?=([%prof-early @ @ @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  phase=@ud   (slav %ud i.t.wire)
    =/  rid=@ud     (slav %ud i.t.t.wire)
    =/  who=@p      (slav %p i.t.t.t.wire)
    =/  started=@da  (slav %da i.t.t.t.t.wire)
    =/  pend  (~(get by pending-profile-lookups) rid)
    ?~  pend  `this
    ?.  ?&(=(who ship.u.pend) =(started started.u.pend))  `this
    =/  seen=(unit ?)  (ames-contact-since our.bowl now.bowl who started)
    ?:  =(`%.y seen)
      ::  contact observed: interim fact, stop chaining, leave the row for the 27s wake.
      :_  this
      ~[(gf-notes `update:noltbook`[%profile-lookup-result rid who %reachable])]
    ::  not observed (or inconclusive): schedule the next early phase, if any.
    =/  nxt=(unit [p=@ud d=@dr])
      ?+  phase  ~
        %1  `[2 ~s2]
        %2  `[3 ~s4]
        %3  `[4 ~s8]
      ==
    ?~  nxt  `this
    :_  this
    :~  :*  %pass
            /prof-early/(scot %ud p.u.nxt)/(scot %ud rid)/(scot %p who)/(scot %da started)
            %arvo  %b  %wait  (add now.bowl d.u.nxt)
        ==
    ==
  ::  FINAL profile-lookup verdict, 27s after the request went out (just inside the 28s
  ::  frontend backstop). Requires an EXACT pending row -- req-id, ship AND started -- which
  ::  is what makes this at-most-once: %ok and the poke-nack both delete the row first, so a
  ::  duplicate or late wake finds nothing and no-ops without emitting. The row is deleted
  ::  before any terminal fact, so the same wake can never resolve twice.
  ?:  ?=([%prof-reach @ @ @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  rid=@ud      (slav %ud i.t.wire)
    =/  who=@p       (slav %p i.t.t.wire)
    =/  started=@da  (slav %da i.t.t.t.wire)
    =/  pend  (~(get by pending-profile-lookups) rid)
    ?~  pend  `this
    ?.  ?&(=(who ship.u.pend) =(started started.u.pend))  `this
    =/  seen=(unit ?)  (ames-contact-since our.bowl now.bowl who started)
    ::  cannot tell => emit nothing; the frontend timeout decides (reachable-so-far =>
    ::  noltbook-unavailable, otherwise unreachable).
    ?~  seen  `this(pending-profile-lookups (~(del by pending-profile-lookups) rid))
    =/  status=?(%ok %unreachable %noltbook-unavailable %reachable)
      ?:(u.seen %noltbook-unavailable %unreachable)
    =/  upd=update:noltbook  [%profile-lookup-result rid who status]
    :_  this(pending-profile-lookups (~(del by pending-profile-lookups) rid))
    ~[(gf-notes upd)]
  ::  artifact-byte deletion read-back. %c %info does not acknowledge, so this
  ::  next-event wake re-scries the data desk. Purely diagnostic: metadata and the
  ::  tombstone are already authoritative, so a failed removal is logged and nothing is
  ::  restored. No state change here, so duplicate or late wakes are harmless.
  ?:  ?=([%art-del-verify @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  aid=@ta  i.t.wire
    ?.  (data-file-exists (art-store-path our.bowl now.bowl aid))  `this
    ~&  [%artifact-bytes-delete-failed aid]
    `this
  ::  note-icon byte deletion read-back, same contract as the artifact one above:
  ::  diagnostic ONLY. Nothing is restored, nothing is retried, no user-visible state
  ::  changes, and no state is written -- so duplicate or late wakes are harmless.
  ?:  ?=([%icon-del-verify @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  nid=@ta  i.t.wire
    ?.  (data-file-exists ~[(scot %p our.bowl) art-store-desk (scot %da now.bowl) %icons nid %mime])
      `this
    ~&  [%note-icon-bytes-delete-failed nid]
    `this
  ?:  ?=([%icon-fetch-timeout @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  eid=@ta  i.t.wire
    ?.  (~(has by pending-icon-fetches) eid)  `this
    :_  this(pending-icon-fetches (~(del by pending-icon-fetches) eid))
    (give-simple-payload:app:server eid `simple-payload:http`[[504 ~] ~])
  ::  held avatar/note-icon UPLOAD expired: the completion wake has not arrived within
  ::  10s. Answer 504 so Save never hangs; no image or metadata is changed here.
  ?:  ?=([%img-write-timeout @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  eid=@ta  i.t.wire
    =/  pw  (~(get by pending-img-writes) eid)
    ?~  pw  `this
    ?:  answered.u.pw  `this
    ~&  [%img-write-timeout eid]
    ::  answer 504 now and mark the row `answered`, but KEEP it: the completion wake
    ::  may still arrive, verify the bytes, and apply the state change and facts -- it
    ::  just cannot answer HTTP a second time. (%c %info produces no %mere, so nothing
    ::  else will ever resolve this row.) The reaper below removes the row if the
    ::  completion wake never arrives at all.
    :_  this(pending-img-writes (~(put by pending-img-writes) eid u.pw(answered &)))
    %+  weld
      (give-simple-payload:app:server eid `simple-payload:http`[[504 ~] ~])
    ^-  (list card)
    ~[[%pass /img-write-reap/[eid] %arvo %b %wait (add now.bowl ~m5)]]
  ::  backstop: the completion wake never arrived. Drop the row so an answered
  ::  request cannot linger in state forever.
  ?:  ?=([%img-write-reap @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  eid=@ta  i.t.wire
    ?.  (~(has by pending-img-writes) eid)  `this
    ~&  [%img-write-reaped eid]
    `this(pending-img-writes (~(del by pending-img-writes) eid))
  ?:  ?=([%dm-fetch-timeout @ ~] wire)
    ?.  ?=([%behn %wake *] sign-arvo)  `this
    =/  eid-key=@ta  i.t.wire
    =/  pend  (~(get by pending-dm-fetches) eid-key)
    ?~  pend  `this
    :_  this(pending-dm-fetches (~(del by pending-dm-fetches) eid-key))
    (give-simple-payload:app:server eid-key `simple-payload:http`[[503 ~] ~])
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
          ::  1B.3: %note-users-updated carries only TRANSPORT users, so it updates
          ::  note.users/removed/type/rev only and PRESERVES note-members. Deriving logical
          ::  membership from transport would wrongly resurrect a transport carrier as a
          ::  human. Real-human membership changes arrive through explicit invite/kick/join/
          ::  leave/install paths (§3); the future authoritative logical-members payload
          ::  will reconcile full remote state. (gf-notes upd is relay-gated below.)
          :_  this(member-revs (~(put by member-revs) id.upd rev.upd))
          (human-relay-cards id.upd our.bowl note-members notes ~[(gf-notes upd)])
        ==
      ::  === regular note: persist full messages ===
      ?+  -.upd  `this
      ::
          %call-snap
        ::  Authoritative call record arriving on the HOST subscription. Gall
        ::  re-establishes this subscription after either ship reloads, and the host's
        ::  on-watch always sends a snapshot -- including the empty one -- so this branch
        ::  is what heals a call whose ending we missed. Same dominance rule as the
        ::  direct poke, so a resubscribe can never regress our state.
        =/  snap=call-snapshot:noltbook  (norm-snap snap.upd)
        ?.  =(nid note-id.snap)  `this
        =/  nt  (~(get by notes) nid)
        ?~  nt  `this
        ?.  =(src.bowl creator.u.nt)  `this
        ?.  (snap-dominates snap (~(get by calls) nid))  `this
        :_  %=  this
              calls        (~(put by calls) nid snap)
              call-leases  (~(del by call-leases) nid)
            ==
        (call-local-cards snap)
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
        ::  A hidden call marker is stored for the transcript but must have NO visible
        ::  effect here: no recency bump, no DURABLE UNREAD, no sidebar preview, no
        ::  mention or attention work. Relay the fact so the browser stores it too (the
        ::  frontend filters it out of the timeline itself) and stop.
        ::
        ::  Without this, the four markers a single call writes each raise
        ::  note-unread-activity on every member that does not have the note open, and
        ::  the sidebar shows a green unread dot for a call nobody missed. The frontend's
        ::  isHiddenCallMsg() guard cannot help: by the time the browser sees
        ::  %note-unread-activity the message is gone and only a timestamp remains.
        ?:  (is-call-marker text.msg)
          :_  this
          ~[(gf-paths ~[/notes/[nid]] upd) (gf-notes upd)]
        ::  a shared-note artifact-deletion marker (\01SYS:art-delete:...) is stored in the
        ::  timeline like any message, but a receiving member must NOT overwrite the note's
        ::  sidebar last-author/last-preview with its raw control text — preserve the
        ::  preceding preview/source. Ordinary messages update both fields exactly as before.
        =/  is-art-del-marker=?
          =/  pfx=tape  "\01SYS:art-delete:"
          =(pfx (scag (lent pfx) (trip text.msg)))
        =?  notes  ?&(?=(^ note) !is-art-del-marker)
          (~(put by notes) nid u.note(last-author `author.msg, last-preview `text.msg))
        ::  recency: a genuinely-new subscribed message bumps this note.
        =.  note-activity  (put-activity note-activity nid now.bowl)
        =.  note-unread-activity  (put-unread-activity note-unread-activity nid now.bowl)
        ::  mention detection for subscribed notes
        =/  msg-eid=(unit @uv)
          ?~  meta.msg  ~
          `eid.u.meta.msg
        ::  a host self-post never mentions itself; any other author may mention us.
        =/  mentioned=?  &(!(host-self author.msg our.bowl) (has-our-mention text.msg our.bowl))
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
        ::  classify %send via the marker the host preserved on the broadcast;
        ::  otherwise %reply. (Member-origin NOTE SEND: member→host %remote-message
        ::  carried directed-kind, host rebroadcast it on %new-message.)
        =/  rkind=attention-kind:noltbook  ?:(=(`%send directed-kind.upd) %send %reply)
        =/  rtarget=attention-item:noltbook  [rkind %message msg-eid `id.msg ~ author.msg id.msg]
        =/  ar=[na=(map @ta (list attention-item:noltbook)) ac=(list card:agent:gall)]
          (add-reply-attn attention nid our.bowl (host-self author.msg our.bowl) par-owner rtarget)
        =.  attention  na.ar
        =/  base-cards=(list card)
          :~  (gf-paths ~[/notes/[nid]] upd)
              (gf-notes upd)
              (activity-fact nid now.bowl)
          ==
        =.  base-cards  (snoc base-cards (unread-activity-fact nid now.bowl))
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
        ::  message's via attribution row.
        =?  via-by-eid    ?=(^ del-eid)  (~(del by via-by-eid) u.del-eid)
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
        base-cards
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
        ::  Phase 1: DM artifacts are delivered by the direct DM wires
        ::  (%remote-dm-app-artifact-create for %app, %remote-dm-artifact for %file),
        ::  which are authoritative. Ignore any artifact-created arriving via the legacy
        ::  DM subscription so it can neither duplicate the direct delivery nor race
        ::  ahead of the file bytes and trip the collision guard. Notebook/group
        ::  subscriptions are unaffected.
        ?:  ?&(?=(^ note) =(%dm type.u.note))  `this
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
          (add-reply-attn attention nid our.bowl (host-self creator.art2 our.bowl) par-owner rtarget)
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
        ::  DM %app edits arrive via the direct %remote-dm-app-artifact-edit wire, which is
        ::  authoritative. Ignore any %app update arriving via the legacy DM subscription so
        ::  it can neither duplicate the direct delivery nor bypass canonical-id rewriting.
        ::  DM %file (no direct edit wire yet) + notebook/group updates are unaffected.
        ?:  ?&(?=(^ note) =(%dm type.u.note) =(%app type.artifact.upd))  `this
        ::  host updated an artifact; store locally and relay to frontend
        =.  artifacts  (~(put by artifacts) id.artifact.upd artifact.upd)
        :_  this
        ~[(gf-paths ~[/notes/[nid]] upd)]
      ::
          %artifact-deleted
        ::  DM %app deletes arrive via the direct %remote-dm-app-artifact-delete wire. Ignore
        ::  a delete arriving via the legacy DM subscription when the local target is missing
        ::  (the direct wire already removed it) OR is an %app artifact. A first DM %file
        ::  delete still processes (target exists + is %file); repeats are harmless no-ops.
        ::  Notebook/group deletes are unaffected.
        ::  capture the artifact BEFORE metadata is dropped below: physical cleanup runs
        ::  only when the host has accepted the deletion (this fact IS that acceptance),
        ::  the artifact is %file, and WE created it -- i.e. our ship owns the bytes.
        =/  pre-del  (~(get by artifacts) id.upd)
        =/  byte-del=(list card)
          ?.  ?=(^ pre-del)  ~
          ?.  ?&(=(%file type.u.pre-del) =(our.bowl creator.u.pre-del))  ~
          (art-store-del-cards our.bowl now.bowl id.upd)
        =/  del-tgt  (~(get by artifacts) id.upd)
        ?:  ?&  ?=(^ note)
                =(%dm type.u.note)
                ?|(?=(~ del-tgt) =(%app type.u.del-tgt))
            ==
          `this
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
        %+  weld  byte-del
        ^-  (list card)
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
      [%nic-fetch-out @ @ ~]
    ::  outgoing note-icon fetch nacked: the host is unreachable, or is running a build
    ::  with no %remote-note-icon-fetch. Resolve the held browser request as 404 rather
    ::  than knowingly leaving it open.
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%note-icon-fetch-failed wire]
      =/  eid=@ta  i.t.t.wire
      ?.  (~(has by pending-icon-fetches) eid)  `this
      :_  this(pending-icon-fetches (~(del by pending-icon-fetches) eid))
      (give-simple-payload:app:server eid `simple-payload:http`[[404 ~] ~])
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
    ::  Phase 3: a profile-lookup poke to a remote ship returned.
    ::
    ::    A NEGATIVE ack is a packet we received back from that ship, so it proves the
    ::    ship is reachable and something there rejected the poke => %noltbook-unavailable,
    ::    not %unreachable. (Note an ABSENT or suspended remote agent does NOT nack: Gall
    ::    flubs the plea and Ames sends no ack at all, which is silence and is handled by
    ::    the 27s reachability wake instead.) The pending row is dropped first so the wake
    ::    cannot then contradict this.
    ::
    ::    A POSITIVE ack is not profile success and stays unused. The early Ames checks
    ::    already supply the reachability state, so nothing is gained by surfacing it. Note
    ::    the honest scope of this design: it MAY surface generic reachability (a blocking
    ::    ship still returns packets, so it can read as reachable) but it never surfaces WHY
    ::    Noltbook did not answer -- absent, suspended, incompatible, crashed and silently
    ::    blocking are deliberately indistinguishable. Success is signalled only by a real
    ::    %remote-profile-response.
    =/  who=@p   (slav %p i.t.wire)
    =/  rid=@ud  (slav %ud i.t.t.wire)
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ::  require an exact pending row (req-id + ship) BEFORE deleting or emitting, so a
      ::  stale or duplicate nack cannot cancel a live lookup or contradict a settled one.
      =/  pend  (~(get by pending-profile-lookups) rid)
      ?~  pend  `this
      ?.  =(who ship.u.pend)  `this
      ~&  [%profile-lookup-failed wire u.p.sign]
      =/  upd=update:noltbook  [%profile-lookup-result rid who %noltbook-unavailable]
      :_  this(pending-profile-lookups (~(del by pending-profile-lookups) rid))
      ~[(gf-notes upd)]
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
      [%call-snap @ @ @ @ ~]
    ::  Authoritative snapshot delivery failed. Retry EXACTLY once, and resend whatever
    ::  we hold NOW rather than the payload that failed -- if the call moved on, the
    ::  newer record is the one worth delivering. After that we stop: the member's own
    ::  %remote-call-sync (agent reload, resubscribe, frontend reconnect) repairs it, so
    ::  there is no unbounded retry map anywhere.
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      =/  who=@p   (slav %p i.t.wire)
      =/  nid=@ta  i.t.t.wire
      =/  try=@ud  (slav %ud i.t.t.t.t.wire)
      ~&  [%call-snap-failed nid who try]
      ?:  (gte try 2)  `this
      =/  cur  (~(get by calls) nid)
      ?~  cur  `this
      :_  this
      :~  %^    rpoke
              (call-snap-wire who nid gen.u.cur +(try))
            who
          `remote:noltbook`[%remote-call-snap u.cur]
      ==
    ==
  ::
  ::  member -> host requests. A failure here is reported and dropped: the frontend is
  ::  waiting on an authoritative snapshot and will surface the timeout truthfully.
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
        %poke-ack
      ?~  p.sign  `this
      ~&  [%call-join-failed wire]
      `this
    ==
  ::
      [%call-leave @ @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%call-leave-failed wire]
      `this
    ==
  ::
      [%call-hb @ @ ~]
    ::  a dropped heartbeat is self-correcting: the next one renews the lease, and if
    ::  they all stop the host expires this participant on purpose.
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ::
      [%call-sync @ ~]
    ?+  -.sign  `this
        %poke-ack
      ?~  p.sign  `this
      ~&  [%call-sync-failed wire]
      `this
    ==
  ::
      [%call-sig @ @ ~]
    ?+  -.sign  `this
        %poke-ack  `this
    ==
  ==
::
++  on-fail    on-fail:def
--
