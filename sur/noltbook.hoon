|%
::  entry-meta: reusable primitive separating identity/order/version/time
::  eid: stable identity hash — never changes after creation
::  seq: monotonic sequence number, scoped per [author note-id]
::  rev: revision counter (0 = original, incremented on edit)
::  created: display timestamp — when entry was first created
::  updated: display timestamp — when entry was last modified
+$  entry-meta
  $:  eid=@uv
      seq=@ud
      rev=@ud
      created=@da
      updated=@da
      reply-to-eid=(unit @uv)
  ==
::  note types
+$  note-type  ?(%notebook %dm %group %cover %gossip)
+$  note-visibility  ?(%public %private %secret)
::  durable high-level notification acks. Only passive condition rows that
::  the backend regenerates after refresh get a durable seen-ack; actionable
::  queues (fork-invite, join-request) intentionally stay red until resolved.
+$  durable-notification-kind  ?(%removed-status %host-deleted-status)
+$  durable-notification-ack  [kind=durable-notification-kind note-id=@ta]
::
+$  note
  $:  id=@ta
      name=@t
      type=note-type
      creator=@p
      users=(set @p)
      children=(list @ta)
      parent=(unit @ta)
      last-author=(unit @p)
      last-preview=(unit @t)
      visibility=note-visibility
      icon-url=(unit @t)
      writable=?
      removed=(set @p)
      headline=(unit @t)
  ==
::
+$  note-3
  $:  id=@ta
      name=@t
      type=note-type
      creator=@p
      users=(set @p)
      children=(list @ta)
      parent=(unit @ta)
      last-author=(unit @p)
      last-preview=(unit @t)
  ==
::
+$  message
  $:  id=@da
      note-id=@ta
      author=@p
      text=@t
      timestamp=@da
      reply-to=(unit @da)
      edited=?
      meta=(unit entry-meta)
  ==
::
+$  envelope
  $:  author=@p
      msg-id=@da
      timestamp=@da
      reply-to=(unit @da)
      content-hash=@uv
      meta=(unit entry-meta)
      ::  Phase 11C: app attribution rides the envelope through gossip/cover
      ::  delivery (ship stamped server-side). ~ for normal/UI/anonymous posts.
      via=(unit via-app)
  ==
::
+$  artifact-type  ?(%code %app %file)
::
+$  artifact-version
  $:  version=@ud
      content=@t
      editor=@p
      timestamp=@da
  ==
::
+$  artifact
  $:  id=@ta
      name=@t
      type=artifact-type
      creator=@p
      note-id=@ta
      versions=(list artifact-version)
      ::  Phase A: stable timeline identity. meta.eid is deterministic
      ::  (sham [creator id]); reply-to-eid carries reply context. Threading
      ::  and top-100 use this later; byte-hosting is unchanged.
      meta=(unit entry-meta)
  ==
::  artifact-pre40: the pre-state-40 artifact shape (no meta). Used only for
::  on-load typing of states <= 39; upgrade-39-to-40 appends meta=~.
+$  artifact-pre40
  $:  id=@ta
      name=@t
      type=artifact-type
      creator=@p
      note-id=@ta
      versions=(list artifact-version)
  ==
::
::  artifact-envelope: small metadata propagated through cover/gossip mesh.
::  bytes live only on the author ship; peers store envelopes only.
+$  artifact-envelope
  $:  aid=@ta
      author=@p
      note-id=@ta
      name=@t
      mime=@t
      kind=@t
      size=@ud
      content-hash=@uv
      timestamp=@da
      meta=(unit entry-meta)
  ==
::
::  pin: a host/admin-pinned timeline entry. target = the message's or
::  artifact's meta.eid (the durable cross-type identity). kind routes render.
::  pinned-at orders the strip (oldest pinned first); capped at 5 per note in
::  the action handler, never trimmed during migration.
+$  pin
  $:  target=@uv
      kind=?(%message %artifact)
      pinned-by=@p
      pinned-at=@da
  ==
::  app-note-meta: durable note-level association with a Noltbook-capable app.
::  This is NOT a note type — note-type stays notebook/group/gossip/dm/cover.
::  It's metadata used later for note references, discovery, and app templates.
::  created-by/created-at are server-stamped (never client-supplied).
+$  app-note-meta
  $:  desk=@tas
      title=(unit @t)
      publisher=(unit @p)
      tag=(unit @t)
      template=(unit @tas)
      created-by=@p
      created-at=@da
  ==
::  note-anchor: optional per-note "anchored" placement of ONE existing artifact.
::  Not a new artifact type and not a new note type — the artifact stays a normal
::  %file/%app; the anchor only marks "render this in the anchored surface". target
::  is the artifact's meta.eid (same identity pins use). One anchor per note;
::  set-by/set-at are server-stamped. kind reserved (%artifact only this phase).
+$  note-anchor
  $:  target=@uv
      kind=?(%artifact)
      set-by=@p
      set-at=@da
  ==
::  note-pin: the one active pin per note (replaces both the old multi-pin list and
::  the anchor). target is a message's meta.eid (kind=%message) or a %file/%app
::  artifact's meta.eid (kind=%artifact); %code excluded. The pinned target renders
::  in the stable surface above chat. Creator/host only; pinned-by/at server-stamped.
+$  note-pin
  $:  target=@uv
      kind=?(%message %artifact)
      pinned-by=@p
      pinned-at=@da
  ==
::  note-active: one developer/API-only "live" status per note ("5 listening",
::  "playing", "live"). desk/title/publisher are server-stamped from the poke's
::  top-level `app` attribution; set-by/updated-at/expires-at server-stamped. It is a
::  heartbeat: reads/snapshots filter on expires-at, so stale entries never show.
+$  note-active
  $:  desk=@tas
      title=(unit @t)
      publisher=(unit @p)
      label=@t
      count=(unit @ud)
      set-by=@p
      updated-at=@da
      expires-at=@da
  ==
::
+$  avatar-type  ?(%urbit %s3 %ipfs %external)
+$  avatar-ref  [type=avatar-type url=@t]
+$  profile
  $:  display-name=(unit @t)
      avatar=(unit avatar-ref)
      wallet-address=(unit @t)
      azimuth-address=(unit @t)
  ==
::
+$  pal-status  ?(%mutual %requesting %requested %blocked %none)
::
::  pending-fork-invite: metadata-only record stored on the receiver after
::  %remote-fork-invite. No note records, no descendants, no messages, no
::  subscriptions until the user explicitly accepts. Accept triggers a
::  %remote-fork-fetch to sender; the payload arrives in %remote-fork-payload
::  and is validated against this record before install.
+$  pending-fork-invite
  $:  sender=@p
      root-id=@ta
      source-root-id=@ta
      source-name=@t
      source-version=@ud
      fork-origin=@uv
      received=@da
      fetching=?
  ==
::
+$  tx-type  ?(%sent %received)
::
+$  transaction
  $:  type=tx-type
      counterparty=@t
      amount=@ud
      tx-hash=@t
      timestamp=@da
  ==
::  call types
+$  call-status  ?(%active %ended)
+$  call-info
  $:  call-id=@ta
      note-id=@ta
      started-by=@p
      started=@da
      participants=(set @p)
      status=call-status
  ==
::
::  message-body search result row (Phase 2 sidebar search). Carries enough
::  for the frontend to render a row and route a click to openNote(note-id).
+$  search-msg-hit
  $:  note-id=@ta
      msg-id=@da
      eid=(unit @uv)
      author=@p
      timestamp=@da
      preview=@t
  ==
::
::  ship-to-ship remote pokes
+$  remote
  $%  [%remote-invite note-id=@ta name=@t type=note-type creator=@p users=(set @p) visibility=note-visibility writable=?]
      [%remote-message note-id=@ta msg=message directed-kind=(unit attention-kind) via=(unit via-app)]
      ::  atomic DM message: carries enough note metadata so the receiver
      ::  can recreate the DM locally if they previously left it. No
      ::  separate invite is sent; receiver does not subscribe.
      [%remote-dm-message note=note msg=message via=(unit via-app)]
      [%remote-ars msg=message hops=@ud]
      [%remote-ars-ref env=envelope hops=@ud]
      [%remote-fetch-cover-msg requester=@p msg-id=@da eid=(unit @uv)]
      [%remote-cover-msg-reply requester=@p msg=message]
      [%remote-gossip-invite note-id=@ta name=@t creator=@p users=(set @p) headline=(unit @t)]
      [%remote-gossip-ref note-id=@ta env=envelope hops=@ud]
      [%remote-fetch-gossip-msg note-id=@ta requester=@p msg-id=@da eid=(unit @uv)]
      [%remote-gossip-msg-reply note-id=@ta requester=@p msg=message]
      [%remote-rumor msg=message hops=@ud]
      [%remote-profile ship=@p profile=profile]
      ::  Phase 3: explicit profile lookup by ship. Sender is src.bowl on both
      ::  sides; req-id is echoed so the requester can correlate the response
      ::  with a specific click.
      [%remote-profile-request req-id=@ud]
      [%remote-profile-response req-id=@ud profile=profile]
      [%remote-note-request requester=@p]
      [%remote-note-list notes=(list note)]
      [%remote-hey ~]
      [%remote-bye ~]
      [%remote-edit-msg note-id=@ta msg-id=@da eid=(unit @uv) text=@t]
      [%remote-delete-msg note-id=@ta msg-id=@da eid=(unit @uv)]
      [%remote-create-child parent-id=@ta name=@t]
      [%remote-child-note parent-id=@ta note=note]
      ::  root-uniqueness: tell loser to drop their root + adopt ours
      [%remote-root-exists losing-id=@ta canonical=note]
      [%remote-leave note-id=@ta]
      ::  fork invite: metadata-only notification. Receiver stores as pending.
      [%remote-fork-invite root-id=@ta source-root-id=@ta source-name=@t source-version=@ud forker=@p fork-origin=@uv]
      ::  fork fetch: receiver requests the full fork subtree after accept.
      [%remote-fork-fetch root-id=@ta]
      ::  fork payload: forker replies with notes + per-node source-id (so the
      ::  receiver can set lineage.fork-of correctly).
      [%remote-fork-payload root-id=@ta source-root-id=@ta root-note=note descendants=(list [n=note source-id=@ta]) fork-origin=@uv fork-version=@ud parent-version=@ud artifact-envs=(list [note-id=@ta envs=(list artifact-envelope)])]
      ::  fork denied: forker refuses an unauthorized %remote-fork-fetch.
      [%remote-fork-denied root-id=@ta]
      ::  fork declined: invitee tells the forker to drop them from the invitee set.
      [%remote-fork-decline root-id=@ta]
      [%remote-introduce ship=@p]
      ::  call signaling remotes
      [%remote-call-start note-id=@ta call-id=@ta started-by=@p]
      [%remote-call-join note-id=@ta ship=@p]
      [%remote-call-leave note-id=@ta ship=@p]
      [%remote-call-ended note-id=@ta]
      [%remote-call-signal call-id=@ta from=@p sig-type=@t payload=@t]
      ::  block: host kicked you from a note
      [%remote-kick note-id=@ta note-name=@t]
      ::  block: high-level notification that someone blocked you
      [%remote-blocked ~]
      ::  block: notification that someone unblocked you
      [%remote-unblocked ~]
      ::  block: DM invite was rejected because sender is blocked
      [%remote-dm-blocked note-id=@ta]
      ::  join-request flow
      [%remote-join-request note-id=@ta]
      [%remote-join-pending note-id=@ta]
      [%remote-join-denied note-id=@ta]
      [%remote-join-removed note-id=@ta]
      [%remote-note-deleted note-id=@ta note-name=@t]
      ::  authoritative group-tree snapshot: requester asks the host, host
      ::  replies with the topmost same-host group root and its descendants
      ::  plus per-id member-revs. Metadata-only; never carries messages,
      ::  artifacts, mentions, calls, or envelopes.
      [%remote-note-state-request note-id=@ta]
      [%remote-note-state root-id=@ta notes=(list note) revs=(list [id=@ta rev=@ud])]
      [%remote-note-state-denied note-id=@ta]
      ::  admin moderation forwarding (remote admin -> host)
      [%remote-mod note-id=@ta mod-type=@tas target=@p]
      ::  artifact fetch flow (member <-> byte host)
      ::  expected-hash optional: cover/gossip envelope path passes the
      ::  envelope content-hash so the byte host can confirm it matches the
      ::  serving artifact before sending bytes.
      [%remote-artifact-fetch art-id=@ta eyre-id=@ta expected-hash=(unit @uv)]
      [%remote-artifact-content art-id=@ta eyre-id=@ta mime=@t bytes=octs]
      [%remote-artifact-denied art-id=@ta eyre-id=@ta]
      ::  member -> note host: register artifact metadata; bytes stay on member
      [%remote-artifact-create =artifact]
      ::  DM artifact: ship metadata + bytes to counterparty (symmetric storage)
      [%remote-dm-artifact =artifact mime=@t bytes=octs]
      ::  cover/gossip artifact envelope mesh propagation; bytes never travel
      [%remote-artifact-envelope-ref note-id=@ta env=artifact-envelope hops=@ud]
  ==
::  directed attention (Phase A scaffold). A single durable list per note that
::  unifies @-mentions (today) with reply / note-SEND attention (future phases).
::  kind = why attention exists; target-kind = what the frontend jumps to; eid is
::  the durable cross-type identity; msg-id/aid are the text/artifact DOM targets;
::  author caused it; when orders oldest->newest.
+$  attention-kind  ?(%mention %reply %send)
+$  attention-target-kind  ?(%message %artifact %artifact-envelope)
+$  attention-item
  $:  kind=attention-kind
      target-kind=attention-target-kind
      eid=(unit @uv)
      msg-id=(unit @da)
      aid=(unit @ta)
      author=@p
      when=@da
  ==
::  poke actions (client to agent)
+$  action
  $%  [%create-note name=@t parent=(unit @ta)]
      [%create-gossip-note name=@t headline=@t]
      [%rename-note id=@ta name=@t]
      [%delete-note id=@ta]
      [%switch-note id=@ta]
      ::  directed-kind: explicit NOTE SEND marker (Phase C). %send => the
      ::  resulting reply attention is classified kind=%send instead of %reply.
      ::  Normal messages and wallet/DM SEND omit it (~).
      [%send-message note-id=@ta text=@t reply-to=(unit @da) reply-to-eid=(unit @uv) directed-kind=(unit attention-kind) via=(unit via-app)]
      [%edit-message note-id=@ta msg-id=@da eid=(unit @uv) text=@t]
      [%delete-message note-id=@ta msg-id=@da eid=(unit @uv)]
      [%set-note-meta id=@ta visibility=note-visibility icon-url=(unit @t) writable=?]
      [%invite-to-note id=@ta ship=@p]
      [%invite-to-note-batch id=@ta ships=(list @p)]
      [%create-artifact note-id=@ta name=@t type=artifact-type content=@t reply-to-eid=(unit @uv)]
      [%edit-artifact id=@ta content=@t]
      [%delete-artifact id=@ta]
      [%file-save id=@ta data=@t]
      [%update-profile display-name=(unit @t) avatar=(unit avatar-ref) wallet-address=(unit @t) azimuth-address=(unit @t)]
      [%register-wallet address=@t]
      [%nock-send-confirmed to=@t amount=@ud tx-hash=@t]
      [%request-remote-notes ship=@p]
      [%search-messages query=@t req-id=@ud limit=@ud]
      [%request-profile ship=@p req-id=@ud]
      [%add-pal ship=@p]
      [%remove-pal ship=@p]
      [%dismiss-pal-request ship=@p]
      [%block-pal ship=@p]
      [%unblock-pal ship=@p]
      [%add-contact ship=@p]
      [%remove-contact ship=@p]
      [%set-dial dial=@ud]
      [%create-dm ship=@p]
      [%convert-to-dm id=@ta ship=@p]
      [%merge-into-dm id=@ta ship=@p]
      [%leave-note id=@ta]
      [%fork-note id=@ta name=(unit @t)]
      [%accept-fork-invite root-id=@ta]
      [%decline-fork-invite root-id=@ta]
      [%reparent-note id=@ta new-parent=@ta]
      [%remove-member id=@ta ship=@p]
      [%clear-mentions note-id=@ta]
      [%clear-mention note-id=@ta msg-id=@da eid=(unit @uv)]
      ::  Phase A: clear a directed-attention item (eid > msg-id > aid)
      [%clear-attention note-id=@ta eid=(unit @uv) msg-id=(unit @da) aid=(unit @ta)]
      ::  call actions
      [%start-call note-id=@ta]
      [%join-call note-id=@ta]
      [%leave-call note-id=@ta]
      [%call-signal note-id=@ta to=@p sig-type=@t payload=@t]
      [%clear-calls ~]
      [%fetch-cover-msg note-id=@ta author=@p msg-id=@da eid=(unit @uv)]
      [%set-headline id=@ta headline=@t]
      [%request-join note-id=@ta host=@p]
      [%approve-join note-id=@ta ship=@p]
      [%deny-join note-id=@ta ship=@p]
      [%deny-block-join note-id=@ta ship=@p]
      ::  role management
      [%make-admin id=@ta ship=@p]
      [%remove-admin id=@ta ship=@p]
      [%mute-member id=@ta ship=@p]
      [%unmute-member id=@ta ship=@p]
      ::  durable ack for passive high-level condition notifications
      [%ack-durable-notification kind=durable-notification-kind note-id=@ta]
      ::  durable green sidebar unread: mark a note read (last-opened time)
      [%mark-note-read note-id=@ta]
      ::  one active pin per note: target a message (kind=%message, by meta.eid) or
      ::  a %file/%app artifact (kind=%artifact, by meta.eid). Creator/host only,
      ::  host-authoritative + broadcast. Setting replaces; clearing keeps the target.
      [%set-note-pin note-id=@ta target=@uv kind=?(%message %artifact)]
      [%clear-note-pin note-id=@ta]
  ==
::  Developer API v1 (mark %noltbook-api). A small, STABLE surface for same-ship
::  apps so they don't bind to the internal `action` grab-bag. Each carries an
::  optional request-id (echoed on /api/results when supplied).
::  Handlers translate these into the existing `action` code paths (no bypass of
::  permission/membership checks).
::  app attribution (Phase 11A). api-app is the optional caller-supplied identity
::  on a poke ("posted via app X"); via-app is the durable record we store, with
::  the authoring ship stamped server-side (never user-supplied). This is
::  ATTRIBUTION, not authorship: the real author stays the user/ship.
+$  api-app  [desk=@tas title=(unit @t) publisher=(unit @p)]
::  api-app-meta: client-supplied app-note metadata (set-note-app). All raw text
::  — desk/publisher/template are validated server-side; created-by/created-at are
::  stamped server-side and are NOT part of this client shape.
+$  api-app-meta
  $:  desk=@t
      title=(unit @t)
      publisher=(unit @t)
      tag=(unit @t)
      template=(unit @t)
  ==
::  set-note-app's app argument, three-state (mirrors api-prof-avatar). %clear =
::  JSON null; %set = an app object; %invalid = absent or a non-null non-object,
::  so a malformed call never silently clears.
+$  api-app-arg
  $%  [%clear ~]
      [%set am=api-app-meta]
      [%invalid ~]
  ==
::  three-state profile-avatar arg (Phase 15): keep = field absent; clear = JSON
::  null; set = a parsed avatar-ref; invalid = present but unparseable.
+$  api-prof-avatar
  $%  [%keep ~]
      [%clear ~]
      [%set av=avatar-ref]
      [%invalid ~]
  ==
+$  via-app  [desk=@tas title=(unit @t) publisher=(unit @p) ship=@p]
::  via-map: durable per-eid attribution rows, used by state-44 (defined in app).
+$  via-map  (map @uv via-app)
+$  api-action
  $%  [%create-note request-id=(unit @ud) name=@t parent=(unit @ta)]
      [%find-or-create-note request-id=(unit @ud) name=@t parent=(unit @ta)]
      ::  create-artifact (Phase 12A): %code/%app only (no raw file upload). type is
      ::  raw text, validated server-side. app = optional attribution.
      [%create-artifact request-id=(unit @ud) app=(unit api-app) note-id=@ta name=@t type=@t content=@t reply-to-eid=(unit @uv)]
      ::  edit/delete an artifact by id (Phase 12B). API requires creator==our.
      [%edit-artifact request-id=(unit @ud) art-id=@ta content=@t]
      [%delete-artifact request-id=(unit @ud) art-id=@ta]
      ::  message-body search (Phase 13). request-id required for a result fact.
      [%search-messages request-id=(unit @ud) query=@t limit=@ud note-id=(unit @ta)]
      ::  find or create the canonical DM for {our, ship} (Phase 14). ship is raw
      ::  text, parsed server-side. Reuses %create-dm (invite/pal side effects).
      [%find-or-create-dm request-id=(unit @ud) ship=@t]
      ::  find or create a user-gossip note by exact name (Phase 16). Reuses
      ::  %create-gossip-note. headline defaults to '' when absent.
      [%find-or-create-gossip-note request-id=(unit @ud) name=@t headline=@t]
      ::  fork actions (Phase 17). rootId is carried in the result's note-id field.
      [%fork-note request-id=(unit @ud) note-id=@ta name=(unit @t)]
      [%accept-fork-invite request-id=(unit @ud) root-id=@ta]
      [%decline-fork-invite request-id=(unit @ud) root-id=@ta]
      ::  call controls (Phase 18) — Noltbook call STATE only, no media/WebRTC.
      [%start-call request-id=(unit @ud) note-id=@ta]
      [%join-call request-id=(unit @ud) note-id=@ta]
      [%leave-call request-id=(unit @ud) note-id=@ta]
      ::  profile/contact/pal mutations (Phase 15). string fields are three-state:
      ::  ~ = keep (absent), [~ ~] = clear (null), [~ [~ x]] = set x. ship raw text.
      [%update-profile request-id=(unit @ud) display-name=(unit (unit @t)) avatar=api-prof-avatar wallet-address=(unit (unit @t)) azimuth-address=(unit (unit @t))]
      [%add-contact request-id=(unit @ud) ship=@t]
      [%remove-contact request-id=(unit @ud) ship=@t]
      [%add-pal request-id=(unit @ud) ship=@t]
      [%remove-pal request-id=(unit @ud) ship=@t]
      [%block-pal request-id=(unit @ud) ship=@t]
      [%unblock-pal request-id=(unit @ud) ship=@t]
      [%post-message request-id=(unit @ud) app=(unit api-app) note-id=@ta text=@t reply-to-eid=(unit @uv)]
      [%post-app-ref request-id=(unit @ud) app=(unit api-app) note-id=@ta publisher=@t desk=@t name=@t]
      [%edit-message request-id=(unit @ud) note-id=@ta eid=(unit @uv) msg-id=(unit @da) text=@t]
      [%delete-message request-id=(unit @ud) note-id=@ta eid=(unit @uv) msg-id=(unit @da)]
      ::  membership/admin mutations (Phase 9). ship/host are raw text, parsed in
      ::  the on-poke arm so a malformed value reports invalid-ship via a result.
      [%request-join request-id=(unit @ud) note-id=@ta host=@t]
      [%approve-join request-id=(unit @ud) note-id=@ta ship=@t]
      [%deny-join request-id=(unit @ud) note-id=@ta ship=@t]
      [%deny-block-join request-id=(unit @ud) note-id=@ta ship=@t]
      [%add-member request-id=(unit @ud) note-id=@ta ship=@t]
      [%remove-member request-id=(unit @ud) note-id=@ta ship=@t]
      [%mute-member request-id=(unit @ud) note-id=@ta ship=@t]
      [%unmute-member request-id=(unit @ud) note-id=@ta ship=@t]
      [%make-admin request-id=(unit @ud) note-id=@ta ship=@t]
      [%remove-admin request-id=(unit @ud) note-id=@ta ship=@t]
      ::  note configuration (Phase 10). Only the supplied fields change. name and
      ::  visibility are raw text, validated in the on-poke arm. headline='' clears
      ::  it; iconUrl='' clears the icon (URL only — no byte upload here).
      [%set-note-config request-id=(unit @ud) note-id=@ta name=(unit @t) visibility=(unit @t) writable=(unit ?) headline=(unit @t) icon-url=(unit @t)]
      ::  durable app-note metadata. app is three-state (clear/set/invalid). desk
      ::  required + must be a valid term; publisher/template validated server-side.
      ::  created-by / created-at are always server-stamped. Creator-only.
      [%set-note-app request-id=(unit @ud) note-id=@ta app=api-app-arg]
      ::  one active pin per note. target is a %uv eid string; kind is raw text
      ::  ('message'|'artifact'); both validated + resolved server-side. Creator-only.
      [%set-note-pin request-id=(unit @ud) note-id=@ta target=@t kind=@t]
      [%clear-note-pin request-id=(unit @ud) note-id=@ta]
      ::  developer/API-only note "active" status. app = the poke's top-level
      ::  attribution (REQUIRED; missing-app otherwise). label/count/ttl from data;
      ::  ttl is seconds (default 120, capped 600). Creator-only.
      [%set-note-active request-id=(unit @ud) app=(unit api-app) note-id=@ta label=(unit @t) count=(unit @ud) ttl=(unit @ud)]
      [%clear-note-active request-id=(unit @ud) note-id=@ta]
  ==
::  subscription updates (agent to client)
::  api-result: per-request outcome fact for %noltbook-api clients. Emitted on
::  /api/results only when the originating poke carried a request-id. `ok` is the
::  overall pass/fail; `code` is a stable @tas (see app/noltbook on-poke). Some
::  success codes are "accepted" (validated + handed to the internal handler),
::  not durably-confirmed — see code list.
+$  api-result
  $:  request-id=@ud  ok=?  code=@tas  message=@t
      note-id=(unit @ta)  msg-id=(unit @da)  eid=(unit @uv)
      artifact-id=(unit @ta)
      call-id=(unit @ta)
  ==
+$  update
  $%  [%api-result =api-result]
      [%note-list notes=(list note)]
      [%note-created note=note]
      [%note-renamed id=@ta name=@t]
      [%note-deleted id=@ta]
      [%note-meta-updated id=@ta visibility=note-visibility icon-url=(unit @t) writable=?]
      [%note-type-updated id=@ta type=note-type]
      [%note-host-status id=@ta status=(unit ?(%host-deleted %host-unreachable))]
      [%note-state-refreshed root-id=@ta notes=(list note) revs=(list [id=@ta rev=@ud])]
      ::  fork lineage: origin=stable lineage id, version=fork depth (1=original)
      ::  fork-of=direct source pointer (~ for original)
      [%note-lineage-set id=@ta fork-origin=@uv fork-version=@ud fork-of=(unit [host=@p nid=@ta]) parent-version=(unit @ud)]
      [%fork-invite-received root-id=@ta source-name=@t source-version=@ud forker=@p]
      [%fork-invite-cleared root-id=@ta]
      [%fork-invite-accepted root-id=@ta]
      [%message-list note-id=@ta messages=(list message) artifacts=(list artifact) via=(map @uv via-app)]
      ::  directed-kind: carries the NOTE SEND marker through host broadcasts so
      ::  non-host members classify reply attention as %send (Phase C). JSON shape
      ::  is unchanged (enjs emits the message directly); ~ for normal/sys/DM.
      [%new-message msg=message directed-kind=(unit attention-kind) via=(unit via-app)]
      [%message-edited note-id=@ta msg=message]
      [%message-deleted note-id=@ta msg-id=@da eid=(unit @uv)]
      [%artifact-created artifact=artifact]
      [%artifact-updated artifact=artifact]
      [%artifact-deleted id=@ta]
      [%profile-list profiles=(list [@p profile])]
      [%profile-updated ship=@p profile=profile]
      [%wallet-update transactions=(list transaction)]
      [%sponsor-chain chain=(list @p)]
      [%remote-note-list ship=@p notes=(list note)]
      [%pal-list pals=(list [@p pal-status])]
      [%pal-update ship=@p status=pal-status]
      [%pal-removed ship=@p]
      [%contact-list ships=(list @p)]
      [%dial-update dial=@ud]
      [%gossip-message msg=message hops=@ud]
      [%gossip-envelope note-id=@ta env=envelope hops=@ud]
      [%envelope-list note-id=@ta envelopes=(list envelope)]
      [%cover-msg-content note-id=@ta msg=message]
      [%rumor-message msg=message]
      [%note-redirect old-id=@ta new-id=@ta]
      [%note-users-updated id=@ta type=note-type users=(list @p) removed=(list @p) rev=@ud]
      [%mention-update note-id=@ta mentions=(list [id=@da eid=(unit @uv) author=@p])]
      ::  Phase A: typed directed-attention stream. full=& is an authoritative
      ::  per-note snapshot (replace that note's list); full=| is a delta (append).
      [%attention-update note-id=@ta items=(list attention-item) full=?]
      ::  call updates
      [%call-started note-id=@ta call-id=@ta started-by=@p participants=(list @p)]
      [%call-joined note-id=@ta ship=@p]
      [%call-left note-id=@ta ship=@p]
      [%call-ended note-id=@ta call-id=@ta]
      [%call-signal note-id=@ta from=@p sig-type=@t payload=@t]
      [%call-state note-id=@ta call=call-info]
      ::  block: you were kicked from a note
      [%headline-updated id=@ta headline=(unit @t)]
      [%kick-notification note-id=@ta note-name=@t from=@p]
      [%blocked-notification from=@p]
      [%unblocked-notification from=@p]
      [%blocked-by-list ships=(list @p)]
      [%join-requested note-id=@ta host=@p]
      [%join-denied note-id=@ta host=@p]
      [%join-removed note-id=@ta host=@p]
      [%join-request-received note-id=@ta ship=@p note-name=@t]
      [%join-request-list requests=(list [note-id=@ta ship=@p note-name=@t])]
      [%note-deleted-notification note-id=@ta note-name=@t]
      ::  role updates
      [%admins-updated id=@ta admins=(list @p)]
      [%muted-updated id=@ta muted=(list @p)]
      ::  one active pin per note: authoritative per-note pin. ~ = cleared.
      [%note-pin-updated note-id=@ta pin=(unit note-pin)]
      ::  developer/API-only note "active" status. ~ = cleared/expired.
      [%note-active-updated note-id=@ta active=(unit note-active)]
      ::  cover/gossip artifact envelope updates
      [%artifact-envelope note-id=@ta env=artifact-envelope hops=@ud]
      [%artifact-envelope-list note-id=@ta envs=(list artifact-envelope)]
      ::  Phase 2 message-body search result; req-id/query echoed for race-safety
      [%search-result req-id=@ud query=@t hits=(list search-msg-hit) capped=?]
      ::  Phase 13: API-specific search result, emitted on /api/results.
      [%api-search-result request-id=@ud query=@t hits=(list search-msg-hit) capped=?]
      ::  Phase 3 unknown-@p profile lookup outcome.
      [%profile-lookup-result req-id=@ud ship=@p status=?(%ok %unreachable)]
      ::  durable acks for passive high-level condition notifications
      [%notification-acks acks=(list durable-notification-ack)]
      ::  durable per-note recency for sidebar ordering
      [%note-activity note-id=@ta activity=@da]
      [%note-activity-list activities=(list [note-id=@ta activity=@da])]
      ::  durable per-note last-read for green sidebar unread dots
      [%note-read note-id=@ta read=@da]
      [%note-read-list reads=(list [note-id=@ta read=@da])]
      ::  compact live sidebar signal: closed-note dot/preview without routing
      ::  full artifact/gossip content facts to global /notes. preview=~ means
      ::  dot-only (do not overwrite an existing preview).
      [%note-sidebar-signal note-id=@ta author=@p preview=(unit @t) kind=?(%message %artifact %gossip) time=@da]
  ==
--
