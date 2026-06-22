::  mar/noltbook/api — Developer API v1 mark. Parses JSON {action,requestId?,data}
::  into +$ api-action:noltbook. Boring + JSON-friendly. See sur/noltbook.hoon.
/-  noltbook
|_  act=api-action:noltbook
++  grab
  |%
  ++  noun  api-action:noltbook
  ++  json
    |=  jon=^json
    ^-  api-action:noltbook
    ?>  ?=([%o *] jon)
    =/  obj  p.jon
    =/  tag-nd  (need (~(get by obj) 'action'))
    ?>  ?=([%s *] tag-nd)
    =/  tag=@t  p.tag-nd
    =/  rid=(unit @ud)
      =/  r  (~(get by obj) 'requestId')
      ?~  r  ~
      ?.  ?=([%n *] u.r)  ~
      `(rash p.u.r dem)
    ::  optional top-level app attribution {desk, title?, publisher?}. Tolerant:
    ::  any malformed/missing piece omits attribution rather than crashing. desk
    ::  must be a bare term; a bad publisher drops just the publisher.
    =/  app=(unit api-app:noltbook)
      =/  a  (~(get by obj) 'app')
      ?~  a  ~
      ?.  ?=([%o *] u.a)  ~
      =/  ao  p.u.a
      =/  dk  (~(get by ao) 'desk')
      ?~  dk  ~
      ?.  ?=([%s *] u.dk)  ~
      =/  dterm=(unit @tas)  (rush p.u.dk sym)
      ?~  dterm  ~
      =/  ttl=(unit @t)
        =/  t  (~(get by ao) 'title')
        ?~(t ~ ?.(?=([%s *] u.t) ~ `p.u.t))
      =/  pub=(unit @p)
        =/  p  (~(get by ao) 'publisher')
        ?~  p  ~
        ?.(?=([%s *] u.p) ~ (slaw %p p.u.p))
      `[u.dterm ttl pub]
    ::  optional top-level actor identity {id, name, kind}. Accepted ONLY when a
    ::  valid app exists. kind must be user/bot/app. Empty id/name, missing parts,
    ::  over-cap (id 128 / name 64 bytes), or bad kind => actor omitted entirely;
    ::  the message still posts (the app handler treats ~ actor as no actor).
    =/  actor=(unit api-actor:noltbook)
      ?~  app  ~
      =/  a  (~(get by obj) 'actor')
      ?~  a  ~
      ?.  ?=([%o *] u.a)  ~
      =/  ao  p.u.a
      =/  id=(unit @t)
        =/  v  (~(get by ao) 'id')
        ?~(v ~ ?.(?=([%s *] u.v) ~ `p.u.v))
      ?~  id  ~
      ?:  =(0 (met 3 u.id))  ~
      ?:  (gth (met 3 u.id) 128)  ~
      =/  name=(unit @t)
        =/  v  (~(get by ao) 'name')
        ?~(v ~ ?.(?=([%s *] u.v) ~ `p.u.v))
      ?~  name  ~
      ?:  =(0 (met 3 u.name))  ~
      ?:  (gth (met 3 u.name) 64)  ~
      =/  kind=(unit @tas)
        =/  v  (~(get by ao) 'kind')
        ?~(v ~ ?.(?=([%s *] u.v) ~ (rush p.u.v sym)))
      ?~  kind  ~
      ?.  ?=(?(%user %bot %app) u.kind)  ~
      `[u.id u.name u.kind]
    =/  dat-nd  (need (~(get by obj) 'data'))
    ?>  ?=([%o *] dat-nd)
    =/  d  p.dat-nd
    ::  helpers
    =/  get-str
      |=  k=@t  ^-  (unit @t)
      =/  v  (~(get by d) k)
      ?~  v  ~
      ?.  ?=([%s *] u.v)  ~
      `p.u.v
    ::  three-state profile string: ~ keep (absent), [~ ~] clear (null),
    ::  [~ [~ x]] set (Phase 15 partial-update semantics).
    =/  three-str
      |=  k=@t  ^-  (unit (unit @t))
      =/  v  (~(get by d) k)
      ?~  v  ~
      ?~  u.v  `~
      ?.(?=([%s *] u.v) ~ ``p.u.v)
    ::  identity-ref (F2/F3): data.ref tagged {kind:"ship",ship} | {kind:"actor",
    ::  host,desk,id}. Any malformed structure parses to %invalid (the backend
    ::  returns invalid-ref); never crashes. Shared by contact + preference actions.
    =/  ref=api-identity-ref:noltbook
      =/  v  (~(get by d) 'ref')
      ?~  v  [%invalid ~]
      ?.  ?=([%o *] u.v)  [%invalid ~]
      =/  ro  p.u.v
      =/  knd  (~(get by ro) 'kind')
      ?~  knd  [%invalid ~]
      ?.  ?=([%s *] u.knd)  [%invalid ~]
      ?:  =('ship' p.u.knd)
        =/  sh  (~(get by ro) 'ship')
        ?~  sh  [%invalid ~]
        ?.(?=([%s *] u.sh) [%invalid ~] [%ship p.u.sh])
      ?:  =('actor' p.u.knd)
        =/  ho  (~(get by ro) 'host')
        =/  de  (~(get by ro) 'desk')
        =/  idd  (~(get by ro) 'id')
        ?~  ho  [%invalid ~]
        ?.  ?=([%s *] u.ho)  [%invalid ~]
        ?~  de  [%invalid ~]
        ?.  ?=([%s *] u.de)  [%invalid ~]
        ?~  idd  [%invalid ~]
        ?.  ?=([%s *] u.idd)  [%invalid ~]
        [%actor p.u.ho p.u.de p.u.idd]
      [%invalid ~]
    =/  parent=(unit @ta)
      =/  v  (get-str 'parent')
      ?~(v ~ ``@ta`u.v)
    ?:  =('create-note' tag)
      [%create-note rid (need (get-str 'name')) parent]
    ?:  =('find-or-create-note' tag)
      [%find-or-create-note rid (need (get-str 'name')) parent]
    ::  Actor Notes (Phase D): top-level app + actor carry the owning identity.
    ?:  =('create-actor-note' tag)
      [%create-actor-note rid app actor (need (get-str 'name'))]
    ?:  =('configure-actor-note' tag)
      =/  wbool=(unit ?)
        =/  wv  (~(get by d) 'writable')
        ?~  wv  ~
        ?.(?=([%b *] u.wv) ~ `p.u.wv)
      :*  %configure-actor-note  rid  app  actor
          `@ta`(need (get-str 'noteId'))
          (get-str 'name')  (get-str 'visibility')  wbool
          (get-str 'headline')  (get-str 'iconUrl')
      ==
    ?:  =('create-artifact' tag)
      =/  rte=(unit @uv)
        =/  v  (get-str 'replyToEid')
        ?~(v ~ `(slav %uv u.v))
      :*  %create-artifact  rid  app
          `@ta`(need (get-str 'noteId'))
          (need (get-str 'name'))
          (need (get-str 'type'))
          (need (get-str 'content'))
          rte
      ==
    ?:  =('search-messages' tag)
      =/  lim=@ud
        =/  v  (~(get by d) 'limit')
        ?~  v  0
        ?.(?=([%n *] u.v) 0 (rash p.u.v dem))
      =/  only=(unit @ta)
        =/  v  (get-str 'noteId')
        ?~(v ~ ``@ta`u.v)
      [%search-messages rid (need (get-str 'query')) lim only]
    ?:  =('find-or-create-dm' tag)
      [%find-or-create-dm rid (need (get-str 'ship'))]
    ::  Actor DM (Phase G5A): idempotent create carries top-level app+actor + ship; no
    ::  noteId, so it stays above the noteId extraction.
    ?:  =('find-or-create-actor-dm' tag)
      [%find-or-create-actor-dm rid app actor (need (get-str 'ship'))]
    ?:  =('find-or-create-gossip-note' tag)
      [%find-or-create-gossip-note rid (need (get-str 'name')) (fall (get-str 'headline') '')]
    ?:  =('start-call' tag)   [%start-call rid `@ta`(need (get-str 'noteId'))]
    ?:  =('join-call' tag)    [%join-call rid `@ta`(need (get-str 'noteId'))]
    ?:  =('leave-call' tag)   [%leave-call rid `@ta`(need (get-str 'noteId'))]
    ?:  =('fork-note' tag)
      [%fork-note rid `@ta`(need (get-str 'noteId')) (get-str 'name')]
    ?:  =('accept-fork-invite' tag)
      [%accept-fork-invite rid `@ta`(need (get-str 'rootId'))]
    ?:  =('decline-fork-invite' tag)
      [%decline-fork-invite rid `@ta`(need (get-str 'rootId'))]
    ?:  =('update-profile' tag)
      =/  av=api-prof-avatar:noltbook
        =/  v  (~(get by d) 'avatar')
        ?~  v  [%keep ~]
        ?~  u.v  [%clear ~]
        ?.  ?=([%o *] u.v)  [%invalid ~]
        =/  ao  p.u.v
        =/  tnd  (~(get by ao) 'type')
        ?~  tnd  [%invalid ~]
        ?.  ?=([%s *] u.tnd)  [%invalid ~]
        =/  at=(unit avatar-type:noltbook)
          ?:  =('urbit' p.u.tnd)     `%urbit
          ?:  =('s3' p.u.tnd)        `%s3
          ?:  =('ipfs' p.u.tnd)      `%ipfs
          ?:  =('external' p.u.tnd)  `%external
          ~
        ?~  at  [%invalid ~]
        =/  url=@t
          =/  uv  (~(get by ao) 'url')
          ?~(uv '' ?.(?=([%s *] u.uv) '' p.u.uv))
        [%set u.at url]
      :*  %update-profile  rid
          (three-str 'displayName')  av
          (three-str 'walletAddress')  (three-str 'azimuthAddress')
      ==
    ?:  =('add-contact' tag)     [%add-contact rid (need (get-str 'ship'))]
    ?:  =('remove-contact' tag)  [%remove-contact rid (need (get-str 'ship'))]
    ?:  =('add-pal' tag)         [%add-pal rid (need (get-str 'ship'))]
    ?:  =('remove-pal' tag)      [%remove-pal rid (need (get-str 'ship'))]
    ?:  =('block-pal' tag)       [%block-pal rid (need (get-str 'ship'))]
    ?:  =('unblock-pal' tag)     [%unblock-pal rid (need (get-str 'ship'))]
    ?:  =('edit-artifact' tag)
      [%edit-artifact rid `@ta`(need (get-str 'id')) (need (get-str 'content'))]
    ?:  =('delete-artifact' tag)
      [%delete-artifact rid `@ta`(need (get-str 'id'))]
    ?:  =('post-message' tag)
      =/  rte=(unit @uv)
        =/  v  (get-str 'replyToEid')
        ?~(v ~ `(slav %uv u.v))
      [%post-message rid app actor `@ta`(need (get-str 'noteId')) (need (get-str 'text')) rte]
    ?:  =('post-app-ref' tag)
      :*  %post-app-ref  rid  app  actor
          `@ta`(need (get-str 'noteId'))
          (need (get-str 'publisher'))
          (need (get-str 'desk'))
          (need (get-str 'name'))
      ==
    ::  Actor Control (Phase A) host governance actions. desk/id/status/kind are
    ::  raw text validated server-side; caps is an optional string array.
    ?:  =('set-app-grant' tag)
      =/  enabled=?
        =/  v  (~(get by d) 'enabled')
        ?~(v %.n ?.(?=([%b *] u.v) %.n p.u.v))
      =/  caps=(unit (set @t))
        =/  v  (~(get by d) 'caps')
        ?~  v  ~
        ?.  ?=([%a *] u.v)  ~
        :-  ~
        %-  ~(gas in *(set @t))
        %+  murn  p.u.v
        |=(j=^json ?.(?=([%s *] j) ~ `p.j))
      [%set-app-grant rid (need (get-str 'desk')) enabled caps]
    ?:  =('set-actor-status' tag)
      [%set-actor-status rid (need (get-str 'desk')) (need (get-str 'id')) (need (get-str 'status'))]
    ?:  =('update-actor' tag)
      ::  caps three-state: absent -> ~ (keep); null -> [~ ~] (clear/inherit);
      ::  array -> [~ [~ set]] (explicit, raw strings clamped server-side).
      =/  actor-caps=(unit (unit (set @t)))
        =/  v  (~(get by d) 'caps')
        ?~  v  ~
        ?~  u.v  `~
        ?.  ?=([%a *] u.v)  `~
        :-  ~  :-  ~
        %-  ~(gas in *(set @t))
        %+  murn  p.u.v
        |=(j=^json ?.(?=([%s *] j) ~ `p.j))
      [%update-actor rid (need (get-str 'desk')) (need (get-str 'id')) (need (get-str 'name')) (need (get-str 'kind')) actor-caps]
    ::  Actor Social (Phase F1): update-actor-profile. MUST stay above the
    ::  unconditional noteId extraction below — this action carries no noteId.
    ::  displayName/bio/statusText are three-state strings; avatar is four-state.
    ?:  =('update-actor-profile' tag)
      ::  four-state avatar: absent %keep; null %clear; {type,url} both strings
      ::  %set (raw, handler-validated); anything else %invalid (never %clear).
      =/  av-arg=api-actor-avatar:noltbook
        =/  v  (~(get by d) 'avatar')
        ?~  v  [%keep ~]
        ?~  u.v  [%clear ~]
        ?.  ?=([%o *] u.v)  [%invalid ~]
        =/  ao  p.u.v
        =/  tnd  (~(get by ao) 'type')
        ?~  tnd  [%invalid ~]
        ?.  ?=([%s *] u.tnd)  [%invalid ~]
        =/  und  (~(get by ao) 'url')
        ?~  und  [%invalid ~]
        ?.  ?=([%s *] u.und)  [%invalid ~]
        [%set p.u.tnd p.u.und]
      :*  %update-actor-profile  rid  app  actor
          (three-str 'displayName')
          av-arg
          (three-str 'bio')
          (three-str 'statusText')
      ==
    ::  Actor Social (Phase F2): contact actions carry data.ref (parsed above into
    ::  `ref`). MUST stay above the noteId extraction — no noteId here.
    ?:  =('actor-add-contact' tag)     [%actor-add-contact rid app actor ref]
    ?:  =('actor-remove-contact' tag)  [%actor-remove-contact rid app actor ref]
    ::  Actor Social (Phase F3): identity mute/block carry data.ref (the shared
    ::  `ref`). MUST stay above the noteId extraction — no noteId here.
    ?:  =('actor-block-identity' tag)    [%actor-block-identity rid app actor ref]
    ?:  =('actor-unblock-identity' tag)  [%actor-unblock-identity rid app actor ref]
    ?:  =('actor-mute-identity' tag)     [%actor-mute-identity rid app actor ref]
    ?:  =('actor-unmute-identity' tag)   [%actor-unmute-identity rid app actor ref]
    ::  Actor Social (Phase G4): developer actor-profile resolution. host/desk/id are
    ::  raw text validated server-side; no noteId — stays above the extraction below.
    ?:  =('request-actor-profile' tag)
      [%request-actor-profile rid (fall (get-str 'host') '') (fall (get-str 'desk') '') (fall (get-str 'id') '')]
    ::  edit/delete resolve a target by eid (preferred) or msgId. msgId is the
    ::  @da string the read API returns; eid is the @uv string.
    =/  eid=(unit @uv)
      =/  v  (get-str 'eid')
      ?~(v ~ `(slav %uv u.v))
    =/  mid=(unit @da)
      =/  v  (get-str 'msgId')
      ?~(v ~ `(slav %da u.v))
    ?:  =('edit-message' tag)
      [%edit-message rid `@ta`(need (get-str 'noteId')) eid mid (need (get-str 'text'))]
    ?:  =('delete-message' tag)
      [%delete-message rid `@ta`(need (get-str 'noteId')) eid mid]
    ::  Actor Tools (Phase B): top-level app + actor carry the owning identity.
    ?:  =('edit-actor-message' tag)
      [%edit-actor-message rid app actor `@ta`(need (get-str 'noteId')) eid mid (need (get-str 'text'))]
    ?:  =('delete-actor-message' tag)
      [%delete-actor-message rid app actor `@ta`(need (get-str 'noteId')) eid mid]
    ::  Phase G6B / B: NON-note-scoped actor actions — these carry NO noteId, so they
    ::  must parse ABOVE the mandatory noteId extraction below.
    ?:  =('actor-clear-notifications' tag)
      [%actor-clear-notifications rid app actor]
    ::  Phase B: real-user actor mute/block by raw [host,desk,id] (validated server-side).
    ?:  |(=('mute-actor' tag) =('unmute-actor' tag) =('block-actor' tag) =('unblock-actor' tag))
      =/  ahost=@t  (fall (get-str 'host') '')
      =/  adesk=@t  (fall (get-str 'desk') '')
      =/  aid=@t    (fall (get-str 'id') '')
      ?:  =('mute-actor' tag)     [%mute-actor rid ahost adesk aid]
      ?:  =('unmute-actor' tag)   [%unmute-actor rid ahost adesk aid]
      ?:  =('block-actor' tag)    [%block-actor rid ahost adesk aid]
      [%unblock-actor rid ahost adesk aid]
    ::  membership/admin mutations: noteId + ship (raw text), parsed server-side.
    =/  nid=@ta  `@ta`(need (get-str 'noteId'))
    =/  shp=@t  (fall (get-str 'ship') '')
    ?:  =('set-note-config' tag)
      =/  wbool=(unit ?)
        =/  wv  (~(get by d) 'writable')
        ?~  wv  ~
        ?.(?=([%b *] u.wv) ~ `p.u.wv)
      :*  %set-note-config  rid  nid
          (get-str 'name')  (get-str 'visibility')  wbool
          (get-str 'headline')  (get-str 'iconUrl')
      ==
    ?:  =('request-join' tag)
      [%request-join rid nid (fall (get-str 'host') '')]
    ?:  =('approve-join' tag)        [%approve-join rid nid shp]
    ?:  =('deny-join' tag)           [%deny-join rid nid shp]
    ?:  =('deny-block-join' tag)     [%deny-block-join rid nid shp]
    ?:  =('add-member' tag)          [%add-member rid nid shp]
    ?:  =('remove-member' tag)       [%remove-member rid nid shp]
    ?:  =('mute-member' tag)         [%mute-member rid nid shp]
    ?:  =('unmute-member' tag)       [%unmute-member rid nid shp]
    ?:  =('make-admin' tag)          [%make-admin rid nid shp]
    ?:  =('remove-admin' tag)        [%remove-admin rid nid shp]
    ::  Actor Member Management (Phase E): top-level app + actor own the request.
    ?:  =('actor-add-member' tag)     [%actor-add-member rid app actor nid shp]
    ?:  =('actor-remove-member' tag)  [%actor-remove-member rid app actor nid shp]
    ?:  =('actor-approve-join' tag)   [%actor-approve-join rid app actor nid shp]
    ?:  =('actor-deny-join' tag)      [%actor-deny-join rid app actor nid shp]
    ?:  =('actor-mute-member' tag)    [%actor-mute-member rid app actor nid shp]
    ?:  =('actor-unmute-member' tag)  [%actor-unmute-member rid app actor nid shp]
    ::  Actor Notes (Phase G1): actor deletes a note it owns. noteId only.
    ?:  =('delete-actor-note' tag)    [%delete-actor-note rid app actor nid]
    ::  Actor Notes (Phase G2): participation. join = noteId only; add/remove also
    ::  carry a targetId actor id (non-empty, <=128 bytes; over-cap/missing => '',
    ::  which the handler rejects as actor-invalid). app/actor are top-level.
    ?:  =('actor-join-note' tag)      [%actor-join-note rid app actor nid]
    ?:  |(=('actor-add-participant' tag) =('actor-remove-participant' tag))
      =/  tid=@t
        =/  v  (fall (get-str 'targetId') '')
        ?:((gth (met 3 v) 128) '' v)
      ?:  =('actor-add-participant' tag)     [%actor-add-participant rid app actor nid tid]
      [%actor-remove-participant rid app actor nid tid]
    ::  Actor Notes (Phase G3): actor leaves a note it participates in. noteId only.
    ?:  =('actor-leave-note' tag)     [%actor-leave-note rid app actor nid]
    ::  Actor DM (Phase G5A): adopt an incoming actor DM (noteId).
    ?:  =('actor-adopt-dm' tag)       [%actor-adopt-dm rid app actor nid]
    ?:  =('actor-mark-note-read' tag)
      [%actor-mark-note-read rid app actor nid]
    ::  Actor Notifications (Phase G6B): clear ONE notification (requires noteId + eid).
    ?:  =('actor-clear-notification' tag)
      [%actor-clear-notification rid app actor nid (slav %uv (need (get-str 'eid')))]
    ?:  =('set-note-pin' tag)
      [%set-note-pin rid nid (fall (get-str 'target') '') (fall (get-str 'kind') '')]
    ?:  =('clear-note-pin' tag)
      [%clear-note-pin rid nid]
    ?:  =('set-note-active' tag)
      ::  label/count/ttl from data; `app` is the poke's top-level attribution.
      =/  get-num
        |=  k=@t  ^-  (unit @ud)
        =/  v  (~(get by d) k)
        ?~  v  ~
        ?.(?=([%n *] u.v) ~ `(rash p.u.v dem))
      [%set-note-active rid app nid (get-str 'label') (get-num 'count') (get-num 'ttl')]
    ?:  =('clear-note-active' tag)
      [%clear-note-active rid nid]
    ?:  =('set-note-app' tag)
      ::  app three-state: explicit JSON null => %clear; object => %set (raw strings,
      ::  validated server-side); absent or non-null non-object => %invalid (the
      ::  server rejects it; it never silently clears). createdBy/createdAt are NOT
      ::  accepted from the client.
      =/  av  (~(get by d) 'app')
      =/  app=api-app-arg:noltbook
        ?~  av  [%invalid ~]
        ?@  u.av  [%clear ~]
        ?.  ?=([%o *] u.av)  [%invalid ~]
        =/  ad  p.u.av
        =/  gv
          |=  k=@t  ^-  (unit @t)
          =/  x  (~(get by ad) k)
          ?~  x  ~
          ?.(?=([%s *] u.x) ~ `p.u.x)
        :-  %set
        ^-(api-app-meta:noltbook [(fall (gv 'desk') '') (gv 'title') (gv 'publisher') (gv 'tag') (gv 'template')])
      [%set-note-app rid nid app]
    ~|([%noltbook-api-unknown-action tag] !!)
  --
++  grow
  |%
  ++  noun  act
  --
++  grad  %noun
--
