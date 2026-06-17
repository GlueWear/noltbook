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
    =/  parent=(unit @ta)
      =/  v  (get-str 'parent')
      ?~(v ~ ``@ta`u.v)
    ?:  =('create-note' tag)
      [%create-note rid (need (get-str 'name')) parent]
    ?:  =('find-or-create-note' tag)
      [%find-or-create-note rid (need (get-str 'name')) parent]
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
      [%post-message rid app `@ta`(need (get-str 'noteId')) (need (get-str 'text')) rte]
    ?:  =('post-app-ref' tag)
      :*  %post-app-ref  rid  app
          `@ta`(need (get-str 'noteId'))
          (need (get-str 'publisher'))
          (need (get-str 'desk'))
          (need (get-str 'name'))
      ==
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
