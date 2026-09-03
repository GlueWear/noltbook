/-  noltbook
|_  act=action:noltbook
++  grab
  |%
  ++  noun  action:noltbook
  ++  json
    |=  jon=^json
    ^-  action:noltbook
    ?>  ?=([%o *] jon)
    =/  obj  p.jon
    =/  tag-node  (need (~(get by obj) 'action'))
    ?>  ?=([%s *] tag-node)
    =/  tag=@t  p.tag-node
    =/  dat-node  (need (~(get by obj) 'data'))
    ?>  ?=([%o *] dat-node)
    =/  d  p.dat-node
    ::  create-note
    ?:  =('create-note' tag)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      =/  par-raw  (~(get by d) 'parent')
      =/  par=(unit @ta)
        ?~  par-raw  ~
        ?.  ?=([%s *] u.par-raw)  ~
        ``@ta`p.u.par-raw
      [%create-note p.nm-nd par]
    ::  ===== document notes =====
    ::  create-document-note: same shape as create-note; the type is explicit.
    ?:  =('create-document-note' tag)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      =/  par-raw  (~(get by d) 'parent')
      =/  par=(unit @ta)
        ?~  par-raw  ~
        ?.  ?=([%s *] u.par-raw)  ~
        ``@ta`p.u.par-raw
      [%create-document-note p.nm-nd par]
    ::  save-document: complete body plus the revision the editor started from.
    ?:  =('save-document' tag)
      =/  ni-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] ni-nd)
      =/  bd-nd  (need (~(get by d) 'body'))
      ?>  ?=([%s *] bd-nd)
      =/  ex-nd  (need (~(get by d) 'expected'))
      ?>  ?=([%n *] ex-nd)
      =/  rq-raw  (~(get by d) 'requestId')
      =/  rq=(unit @ud)
        ?~  rq-raw  ~
        ?.  ?=([%n *] u.rq-raw)  ~
        `(rash p.u.rq-raw dem)
      [%save-document `@ta`p.ni-nd p.bd-nd (rash p.ex-nd dem) rq]
    ::  restore-document-version
    ?:  =('restore-document-version' tag)
      =/  ni-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] ni-nd)
      =/  rv-nd  (need (~(get by d) 'revision'))
      ?>  ?=([%n *] rv-nd)
      =/  rq-raw  (~(get by d) 'requestId')
      =/  rq=(unit @ud)
        ?~  rq-raw  ~
        ?.  ?=([%n *] u.rq-raw)  ~
        `(rash p.u.rq-raw dem)
      [%restore-document-version `@ta`p.ni-nd (rash p.rv-nd dem) rq]
    ::  request-document
    ?:  =('request-document' tag)
      =/  ni-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] ni-nd)
      [%request-document `@ta`p.ni-nd]
    ::  peek-document
    ?:  =('peek-document' tag)
      =/  ni-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] ni-nd)
      =/  ho-nd  (need (~(get by d) 'host'))
      ?>  ?=([%s *] ho-nd)
      [%peek-document `@ta`p.ni-nd (slav %p p.ho-nd)]
    ::  request-document-history
    ?:  =('request-document-history' tag)
      =/  ni-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] ni-nd)
      [%request-document-history `@ta`p.ni-nd]
    ::  duplicate-document
    ?:  =('duplicate-document' tag)
      =/  si-nd  (need (~(get by d) 'sourceId'))
      ?>  ?=([%s *] si-nd)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      =/  bd-nd  (need (~(get by d) 'body'))
      ?>  ?=([%s *] bd-nd)
      =/  par-raw  (~(get by d) 'parent')
      =/  par=(unit @ta)
        ?~  par-raw  ~
        ?.  ?=([%s *] u.par-raw)  ~
        ``@ta`p.u.par-raw
      [%duplicate-document `@ta`p.si-nd p.nm-nd par p.bd-nd]
    ::  create-gossip-note
    ?:  =('create-gossip-note' tag)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      =/  hl-raw  (~(get by d) 'headline')
      =/  hl=@t
        ?~  hl-raw  ''
        ?.  ?=([%s *] u.hl-raw)  ''
        p.u.hl-raw
      =/  ic-raw  (~(get by d) 'iconUrl')
      =/  ic=(unit @t)
        ?~  ic-raw  ~
        ?.  ?=([%s *] u.ic-raw)  ~
        ?:  =('' p.u.ic-raw)  ~
        `p.u.ic-raw
      [%create-gossip-note p.nm-nd hl ic]
    ::  request-gossip-note: link-acquire a gossip note from `from` by id
    ?:  =('request-gossip-note' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  from-nd  (need (~(get by d) 'from'))
      ?>  ?=([%s *] from-nd)
      [%request-gossip-note `@ta`p.nid-nd (need (slaw %p p.from-nd))]
    ::  rename-note
    ?:  =('rename-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      [%rename-note `@ta`p.id-nd p.nm-nd]
    ::  delete-note
    ?:  =('delete-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      [%delete-note `@ta`p.id-nd]
    ::  fork-note
    ?:  =('fork-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  nm-raw  (~(get by d) 'name')
      =/  nm=(unit @t)
        ?~  nm-raw  ~
        ?.  ?=([%s *] u.nm-raw)  ~
        `p.u.nm-raw
      [%fork-note `@ta`p.id-nd nm]
    ::  accept-fork-invite
    ?:  =('accept-fork-invite' tag)
      =/  rid-nd  (need (~(get by d) 'rootId'))
      ?>  ?=([%s *] rid-nd)
      [%accept-fork-invite `@ta`p.rid-nd]
    ::  decline-fork-invite
    ?:  =('decline-fork-invite' tag)
      =/  rid-nd  (need (~(get by d) 'rootId'))
      ?>  ?=([%s *] rid-nd)
      [%decline-fork-invite `@ta`p.rid-nd]
    ::  switch-note
    ?:  =('switch-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      [%switch-note `@ta`p.id-nd]
    ::  send-message
    ?:  =('send-message' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  txt-nd  (need (~(get by d) 'text'))
      ?>  ?=([%s *] txt-nd)
      =/  rt-raw  (~(get by d) 'replyTo')
      =/  rt=(unit @da)
        ?~  rt-raw  ~
        ?.  ?=([%n *] u.rt-raw)  ~
        ``@da`(add ~1970.1.1 (mul (rash p.u.rt-raw dem) (div ~s1 1.000)))
      =/  rte-raw  (~(get by d) 'replyToEid')
      =/  rte=(unit @uv)
        ?~  rte-raw  ~
        ?.  ?=([%s *] u.rte-raw)  ~
        `(slav %uv p.u.rte-raw)
      ::  directed-kind: explicit NOTE SEND marker (only 'send' is honored)
      =/  dk-raw  (~(get by d) 'directedKind')
      =/  dk=(unit attention-kind:noltbook)
        ?~  dk-raw  ~
        ?.  ?=([%s *] u.dk-raw)  ~
        ?:  =('send' p.u.dk-raw)  `%send
        ~
      ::  clientId: opaque browser correlation token, echoed back on %send-pending.
      ::  Bounded and same-ship only; never forwarded to the host.
      =/  cid-raw  (~(get by d) 'clientId')
      =/  cid=(unit @t)
        ?~  cid-raw  ~
        ?.  ?=([%s *] u.cid-raw)  ~
        ?:  (gth (met 3 p.u.cid-raw) 128)  ~
        `p.u.cid-raw
      ::  msgId: the CANONICAL @da string the browser generated, parsed straight back
      ::  with slaw. Not milliseconds: a millisecond id is only unique within one page,
      ::  so two tabs sharing a clock tick could mint the same [author msg-id] and the
      ::  host's dedupe would collapse two DIFFERENT messages into one. The string
      ::  carries the real UTC second plus 64 bits of crypto-random fraction, and
      ::  slaw/scot round-trip it exactly. Malformed input parses to ~, which simply
      ::  falls back to the agent's now.bowl behavior.
      =/  mid-raw  (~(get by d) 'msgId')
      =/  mid=(unit @da)
        ?~  mid-raw  ~
        ?.  ?=([%s *] u.mid-raw)  ~
        (slaw %da p.u.mid-raw)
      ::  via attribution is API-only; frontend sends are never attributed.
      [%send-message `@ta`p.nid-nd p.txt-nd rt rte dk ~ cid mid]
    ::  resend-message: retry carrying the ORIGINAL message identity, in the SAME
    ::  canonical @da string form %send-message accepts, so the first attempt and every
    ::  retry name the identical @da and the host's [author msg-id] dedupe collapses
    ::  them to one durable message.
    ?:  =('resend-message' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  mid-nd  (need (~(get by d) 'msgId'))
      ?>  ?=([%s *] mid-nd)
      =/  mid=@da  (need (slaw %da p.mid-nd))
      =/  txt-nd  (need (~(get by d) 'text'))
      ?>  ?=([%s *] txt-nd)
      =/  rt-raw  (~(get by d) 'replyTo')
      =/  rt=(unit @da)
        ?~  rt-raw  ~
        ?.  ?=([%n *] u.rt-raw)  ~
        ``@da`(add ~1970.1.1 (mul (rash p.u.rt-raw dem) (div ~s1 1.000)))
      =/  rte-raw  (~(get by d) 'replyToEid')
      =/  rte=(unit @uv)
        ?~  rte-raw  ~
        ?.  ?=([%s *] u.rte-raw)  ~
        `(slav %uv p.u.rte-raw)
      =/  dk-raw  (~(get by d) 'directedKind')
      =/  dk=(unit attention-kind:noltbook)
        ?~  dk-raw  ~
        ?.  ?=([%s *] u.dk-raw)  ~
        ?:  =('send' p.u.dk-raw)  `%send
        ~
      [%resend-message `@ta`p.nid-nd mid p.txt-nd rt rte dk ~]
    ::  edit-message
    ?:  =('edit-message' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  mid-nd  (need (~(get by d) 'msgId'))
      ?>  ?=([%n *] mid-nd)
      =/  txt-nd  (need (~(get by d) 'text'))
      ?>  ?=([%s *] txt-nd)
      =/  mid=@da  (add ~1970.1.1 (mul (rash p.mid-nd dem) (div ~s1 1.000)))
      =/  eid-raw  (~(get by d) 'eid')
      =/  eid=(unit @uv)
        ?~  eid-raw  ~
        ?.  ?=([%s *] u.eid-raw)  ~
        `(slav %uv p.u.eid-raw)
      [%edit-message `@ta`p.nid-nd mid eid p.txt-nd]
    ::  delete-message
    ?:  =('delete-message' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  mid-nd  (need (~(get by d) 'msgId'))
      ?>  ?=([%n *] mid-nd)
      =/  mid=@da  (add ~1970.1.1 (mul (rash p.mid-nd dem) (div ~s1 1.000)))
      =/  eid-raw  (~(get by d) 'eid')
      =/  eid=(unit @uv)
        ?~  eid-raw  ~
        ?.  ?=([%s *] u.eid-raw)  ~
        `(slav %uv p.u.eid-raw)
      [%delete-message `@ta`p.nid-nd mid eid]
    ::  remove-dm-import
    ?:  =('remove-dm-import' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  eid-nd  (need (~(get by d) 'eid'))
      ?>  ?=([%s *] eid-nd)
      [%remove-dm-import `@ta`p.nid-nd (slav %uv p.eid-nd)]
    ::  set-note-meta
    ?:  =('set-note-meta' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  vis-nd  (need (~(get by d) 'visibility'))
      ?>  ?=([%s *] vis-nd)
      =/  vis=note-visibility:noltbook
        ?:  =('public' p.vis-nd)   %public
        ?:  =('private' p.vis-nd)  %private
        %secret
      =/  ico-raw  (~(get by d) 'iconUrl')
      =/  ico=(unit @t)
        ?~  ico-raw  ~
        ?.  ?=([%s *] u.ico-raw)  ~
        ?:  =(%~ p.u.ico-raw)  ~
        `p.u.ico-raw
      =/  wrt-raw  (~(get by d) 'writable')
      =/  wrt=?
        ?~  wrt-raw  &
        ?.  ?=([%b *] u.wrt-raw)  &
        p.u.wrt-raw
      [%set-note-meta `@ta`p.id-nd vis ico wrt]
    ::  invite-to-note
    ?:  =('invite-to-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%invite-to-note `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  invite-to-note-batch
    ?:  =('invite-to-note-batch' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ships-nd  (need (~(get by d) 'ships'))
      ?>  ?=([%a *] ships-nd)
      =/  ships=(list @p)
        %+  turn  p.ships-nd
        |=  j=^json
        ^-  @p
        ?>  ?=([%s *] j)
        (slav %p p.j)
      [%invite-to-note-batch `@ta`p.id-nd ships]
    ::  create-artifact
    ?:  =('create-artifact' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  nm-nd  (need (~(get by d) 'name'))
      ?>  ?=([%s *] nm-nd)
      =/  typ-nd  (need (~(get by d) 'type'))
      ?>  ?=([%s *] typ-nd)
      =/  art-type=artifact-type:noltbook
        ?:  =('code' p.typ-nd)  %code
        ?:  =('app' p.typ-nd)   %app
        ?>  =('file' p.typ-nd)
        %file
      =/  cnt-nd  (need (~(get by d) 'content'))
      ?>  ?=([%s *] cnt-nd)
      ::  optional reply context (eid); absent for existing callers
      =/  rte-raw  (~(get by d) 'replyToEid')
      =/  rte=(unit @uv)
        ?~  rte-raw  ~
        ?.  ?=([%s *] u.rte-raw)  ~
        `(slav %uv p.u.rte-raw)
      [%create-artifact `@ta`p.nid-nd p.nm-nd art-type p.cnt-nd rte]
    ::  edit-artifact
    ?:  =('edit-artifact' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  cnt-nd  (need (~(get by d) 'content'))
      ?>  ?=([%s *] cnt-nd)
      [%edit-artifact `@ta`p.id-nd p.cnt-nd]
    ::  delete-artifact
    ?:  =('delete-artifact' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      [%delete-artifact `@ta`p.id-nd]
    ::  delete-mesh-envelope (own cover/gossip artifact envelope; no full artifact locally)
    ?:  =('delete-mesh-envelope' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  aid-nd  (need (~(get by d) 'aid'))
      ?>  ?=([%s *] aid-nd)
      =/  eid-nd  (need (~(get by d) 'eid'))
      ?>  ?=([%s *] eid-nd)
      [%delete-mesh-envelope `@ta`p.nid-nd `@ta`p.aid-nd (slav %uv p.eid-nd)]
    ::  set-note-pin
    ?:  =('set-note-pin' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  tgt-nd  (need (~(get by d) 'target'))
      ?>  ?=([%s *] tgt-nd)
      =/  knd-nd  (need (~(get by d) 'kind'))
      ?>  ?=([%s *] knd-nd)
      =/  knd=?(%message %artifact)
        ?:  =('artifact' p.knd-nd)  %artifact
        ?>  =('message' p.knd-nd)
        %message
      [%set-note-pin `@ta`p.nid-nd (slav %uv p.tgt-nd) knd]
    ::  clear-note-pin
    ?:  =('clear-note-pin' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%clear-note-pin `@ta`p.nid-nd]
    ::  file-save
    ?:  =('file-save' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  dat-nd  (need (~(get by d) 'data'))
      ?>  ?=([%s *] dat-nd)
      [%file-save `@ta`p.id-nd p.dat-nd]
    ::  update-profile
    ?:  =('update-profile' tag)
      =/  dn-raw  (~(get by d) 'displayName')
      =/  dn=(unit @t)
        ?~  dn-raw  ~
        ?.  ?=([%s *] u.dn-raw)  ~
        `p.u.dn-raw
      =/  av-raw  (~(get by d) 'avatar')
      =/  av=(unit avatar-ref:noltbook)
        ?~  av-raw  ~
        ?.  ?=([%o *] u.av-raw)  ~
        =/  av-obj  p.u.av-raw
        =/  type-nd  (~(get by av-obj) 'type')
        ?~  type-nd  ~
        ?.  ?=([%s *] u.type-nd)  ~
        =/  url-nd  (~(get by av-obj) 'url')
        =/  url=@t
          ?~  url-nd  ''
          ?.  ?=([%s *] u.url-nd)  ''
          p.u.url-nd
        =/  atype=avatar-type:noltbook
          ?:  =('urbit' p.u.type-nd)     %urbit
          ?:  =('s3' p.u.type-nd)        %s3
          ?:  =('ipfs' p.u.type-nd)      %ipfs
          ?>  =('external' p.u.type-nd)
          %external
        `[atype url]
      =/  wa-raw  (~(get by d) 'walletAddress')
      =/  wa=(unit @t)
        ?~  wa-raw  ~
        ?.  ?=([%s *] u.wa-raw)  ~
        `p.u.wa-raw
      =/  az-raw  (~(get by d) 'azimuthAddress')
      =/  az=(unit @t)
        ?~  az-raw  ~
        ?.  ?=([%s *] u.az-raw)  ~
        `p.u.az-raw
      [%update-profile dn av wa az]
    ::  register-wallet
    ?:  =('register-wallet' tag)
      =/  addr-nd  (need (~(get by d) 'address'))
      ?>  ?=([%s *] addr-nd)
      [%register-wallet p.addr-nd]
    ::  request-remote-notes
    ?:  =('request-remote-notes' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%request-remote-notes (slav %p p.ship-nd)]
    ::  search-messages
    ?:  =('search-messages' tag)
      =/  q-nd  (need (~(get by d) 'query'))
      ?>  ?=([%s *] q-nd)
      =/  req-nd  (need (~(get by d) 'reqId'))
      ?>  ?=([%n *] req-nd)
      =/  lim-nd  (need (~(get by d) 'limit'))
      ?>  ?=([%n *] lim-nd)
      [%search-messages p.q-nd (rash p.req-nd dem) (rash p.lim-nd dem)]
    ::  request-profile (Phase 3 unknown @p lookup)
    ?:  =('request-profile' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      =/  req-nd  (need (~(get by d) 'reqId'))
      ?>  ?=([%n *] req-nd)
      [%request-profile (slav %p p.ship-nd) (rash p.req-nd dem)]
    ::  nock-send-confirmed
    ?:  =('nock-send-confirmed' tag)
      =/  to-nd  (need (~(get by d) 'to'))
      ?>  ?=([%s *] to-nd)
      =/  amt-nd  (need (~(get by d) 'amount'))
      ?>  ?=([%n *] amt-nd)
      =/  hash-nd  (need (~(get by d) 'txHash'))
      ?>  ?=([%s *] hash-nd)
      [%nock-send-confirmed p.to-nd (rash p.amt-nd dem) p.hash-nd]
    ::  add-pal
    ?:  =('add-pal' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%add-pal (slav %p p.ship-nd)]
    ::  remove-pal
    ?:  =('remove-pal' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%remove-pal (slav %p p.ship-nd)]
    ::  dismiss-pal-request
    ?:  =('dismiss-pal-request' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%dismiss-pal-request (slav %p p.ship-nd)]
    ::  block-pal
    ?:  =('block-pal' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%block-pal (slav %p p.ship-nd)]
    ::  unblock-pal
    ?:  =('unblock-pal' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%unblock-pal (slav %p p.ship-nd)]
    ::  add-contact
    ?:  =('add-contact' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%add-contact (slav %p p.ship-nd)]
    ::  remove-contact
    ?:  =('remove-contact' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%remove-contact (slav %p p.ship-nd)]
    ::  create-dm
    ?:  =('create-dm' tag)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%create-dm (slav %p p.ship-nd)]
    ::  convert-to-dm
    ?:  =('convert-to-dm' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%convert-to-dm `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  merge-into-dm
    ?:  =('merge-into-dm' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%merge-into-dm `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  leave-note
    ?:  =('leave-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      [%leave-note `@ta`p.id-nd]
    ::  reparent-note
    ?:  =('reparent-note' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  par-nd  (need (~(get by d) 'newParent'))
      ?>  ?=([%s *] par-nd)
      [%reparent-note `@ta`p.id-nd `@ta`p.par-nd]
    ::  clear-mentions
    ?:  =('clear-mentions' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%clear-mentions `@ta`p.nid-nd]
    ::  remove-member
    ?:  =('remove-member' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%remove-member `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  clear-mention (single)
    ?:  =('clear-mention' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  mid-nd  (need (~(get by d) 'msgId'))
      ?>  ?=([%n *] mid-nd)
      =/  mid=@da  (add ~1970.1.1 (mul (rash p.mid-nd dem) (div ~s1 1.000)))
      =/  eid-raw  (~(get by d) 'eid')
      =/  eid=(unit @uv)
        ?~  eid-raw  ~
        ?.  ?=([%s *] u.eid-raw)  ~
        `(slav %uv p.u.eid-raw)
      [%clear-mention `@ta`p.nid-nd mid eid]
    ::  clear-attention (Phase A: eid > msgId > aid; all optional)
    ?:  =('clear-attention' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  eid-raw  (~(get by d) 'eid')
      =/  eid=(unit @uv)
        ?~  eid-raw  ~
        ?.  ?=([%s *] u.eid-raw)  ~
        `(slav %uv p.u.eid-raw)
      =/  mid-raw  (~(get by d) 'msgId')
      =/  mid=(unit @da)
        ?~  mid-raw  ~
        ?.  ?=([%n *] u.mid-raw)  ~
        `(add ~1970.1.1 (mul (rash p.u.mid-raw dem) (div ~s1 1.000)))
      =/  aid-raw  (~(get by d) 'aid')
      =/  aid=(unit @ta)
        ?~  aid-raw  ~
        ?.  ?=([%s *] u.aid-raw)  ~
        ``@ta`p.u.aid-raw
      [%clear-attention `@ta`p.nid-nd eid mid aid]
    ::  configure-call-service (same-ship only; key='' preserves existing)
    ?:  =('configure-call-service' tag)
      =/  req-nd  (need (~(get by d) 'requestId'))
      ?>  ?=([%n *] req-nd)
      =/  broker-nd  (need (~(get by d) 'broker'))
      ?>  ?=([%s *] broker-nd)
      =/  broker  (need (slaw %p p.broker-nd))
      =/  endpoint-nd  (need (~(get by d) 'endpoint'))
      ?>  ?=([%s *] endpoint-nd)
      =/  key-raw  (~(get by d) 'key')
      =/  key=(unit @t)
        ?~  key-raw  ~
        ?.  ?=([%s *] u.key-raw)  ~
        ?:  =('' p.u.key-raw)  ~
        `p.u.key-raw
      [%configure-call-service (rash p.req-nd dem) broker p.endpoint-nd key]
    ::  test-call-service
    ?:  =('test-call-service' tag)
      =/  req-nd  (need (~(get by d) 'requestId'))
      ?>  ?=([%n *] req-nd)
      [%test-call-service (rash p.req-nd dem)]
    ::  set-call-sfu
    ?:  =('set-call-sfu' tag)
      =/  on-nd  (need (~(get by d) 'on'))
      ?>  ?=([%b *] on-nd)
      [%set-call-sfu p.on-nd]
    ::  start-call
    ?:  =('start-call' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%start-call `@ta`p.nid-nd]
    ::  join-call
    ?:  =('join-call' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%join-call `@ta`p.nid-nd]
    ::  leave-call
    ?:  =('leave-call' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%leave-call `@ta`p.nid-nd]
    ::  call-signal
    ?:  =('call-signal' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  to-nd  (need (~(get by d) 'to'))
      ?>  ?=([%s *] to-nd)
      =/  st-nd  (need (~(get by d) 'sigType'))
      ?>  ?=([%s *] st-nd)
      =/  pl-nd  (need (~(get by d) 'payload'))
      ?>  ?=([%s *] pl-nd)
      [%call-signal `@ta`p.nid-nd (slav %p p.to-nd) p.st-nd p.pl-nd]
    ::  call-heartbeat
    ?:  =('call-heartbeat' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%call-heartbeat `@ta`p.nid-nd]
    ::  renew-call-access
    ?:  =('renew-call-access' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      [%renew-call-access `@ta`p.nid-nd]
    ::  sync-calls
    ?:  =('sync-calls' tag)
      [%sync-calls ~]
    ::  clear-calls
    ?:  =('clear-calls' tag)
      [%clear-calls ~]
    ::  fetch-cover-msg
    ?:  =('fetch-cover-msg' tag)
      =/  nid-nd  (~(get by d) 'noteId')
      =/  nid=@ta
        ?~  nid-nd  %cover
        ?.  ?=([%s *] u.nid-nd)  %cover
        `@ta`p.u.nid-nd
      =/  author-nd  (need (~(get by d) 'author'))
      ?>  ?=([%s *] author-nd)
      =/  mid-nd  (need (~(get by d) 'msgId'))
      ?>  ?=([%n *] mid-nd)
      =/  mid=@da  (add ~1970.1.1 (mul (rash p.mid-nd dem) (div ~s1 1.000)))
      =/  eid-raw  (~(get by d) 'eid')
      =/  eid=(unit @uv)
        ?~  eid-raw  ~
        ?.  ?=([%s *] u.eid-raw)  ~
        `(slav %uv p.u.eid-raw)
      [%fetch-cover-msg nid (slav %p p.author-nd) mid eid]
    ::  set-headline
    ?:  =('set-headline' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  hl-nd  (need (~(get by d) 'headline'))
      ?>  ?=([%s *] hl-nd)
      [%set-headline `@ta`p.id-nd p.hl-nd]
    ::  request-join
    ?:  =('request-join' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  host-nd  (need (~(get by d) 'host'))
      ?>  ?=([%s *] host-nd)
      [%request-join `@ta`p.nid-nd (slav %p p.host-nd)]
    ::  approve-join
    ?:  =('approve-join' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%approve-join `@ta`p.nid-nd (slav %p p.ship-nd)]
    ::  deny-join
    ?:  =('deny-join' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%deny-join `@ta`p.nid-nd (slav %p p.ship-nd)]
    ::  deny-block-join
    ?:  =('deny-block-join' tag)
      =/  nid-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] nid-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%deny-block-join `@ta`p.nid-nd (slav %p p.ship-nd)]
    ::  make-admin
    ?:  =('make-admin' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%make-admin `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  remove-admin
    ?:  =('remove-admin' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%remove-admin `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  mute-member
    ?:  =('mute-member' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%mute-member `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  unmute-member
    ?:  =('unmute-member' tag)
      =/  id-nd  (need (~(get by d) 'id'))
      ?>  ?=([%s *] id-nd)
      =/  ship-nd  (need (~(get by d) 'ship'))
      ?>  ?=([%s *] ship-nd)
      [%unmute-member `@ta`p.id-nd (slav %p p.ship-nd)]
    ::  ack-durable-notification: durable seen-ack for a passive condition row.
    ::  kind constrained to the typed union; unknown kinds crash (rejected).
    ?:  =('ack-durable-notification' tag)
      =/  kind-nd  (need (~(get by d) 'kind'))
      ?>  ?=([%s *] kind-nd)
      =/  note-id-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] note-id-nd)
      =/  kind=durable-notification-kind:noltbook
        ?:  =('removed-status' p.kind-nd)  %removed-status
        ?>  =('host-deleted-status' p.kind-nd)
        %host-deleted-status
      [%ack-durable-notification kind `@ta`p.note-id-nd]
    ::  mark-note-read: durable green-unread last-read stamp for a note.
    ?:  =('mark-note-read' tag)
      =/  note-id-nd  (need (~(get by d) 'noteId'))
      ?>  ?=([%s *] note-id-nd)
      [%mark-note-read `@ta`p.note-id-nd]
    ::  set-dial (final case)
    ?>  =('set-dial' tag)
    =/  dial-nd  (need (~(get by d) 'dial'))
    ?>  ?=([%n *] dial-nd)
    [%set-dial (rash p.dial-nd dem)]
  --
++  grow
  |%
  ++  noun  act
  --
++  grad  %noun
--
