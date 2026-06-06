/-  noltbook
=,  enjs:format
|_  upd=update:noltbook
++  grab
  |%
  ++  noun  update:noltbook
  --
++  grow
  |%
  ++  noun  upd
  ++  json
    ^-  ^json
    |^
    ?-  -.upd
        %note-list
      (frond 'note-list' a+(turn notes.upd note-to-json))
    ::
        %note-created
      (frond 'note-created' (note-to-json note.upd))
    ::
        %note-renamed
      %+  frond  'note-renamed'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['name' s+name.upd]
      ==
    ::
        %note-deleted
      (frond 'note-deleted' (frond 'id' s+(crip (trip id.upd))))
    ::
        %note-meta-updated
      %+  frond  'note-meta-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['visibility' s+(crip (trip (scot %tas visibility.upd)))]
          ['iconUrl' ?~(icon-url.upd ~ s+u.icon-url.upd)]
          ['writable' b+writable.upd]
      ==
    ::
        %note-type-updated
      %+  frond  'note-type-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['type' s+(crip (trip (scot %tas type.upd)))]
      ==
    ::
        %note-host-status
      %+  frond  'note-host-status'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['status' ?~(status.upd ~ s+(crip (trip (scot %tas u.status.upd))))]
      ==
    ::
        %note-state-refreshed
      %+  frond  'note-state-refreshed'
      %-  pairs
      :~  ['rootId' s+(crip (trip root-id.upd))]
          ['notes' a+(turn notes.upd note-to-json)]
          :-  'revs'
          a+(turn revs.upd |=([i=@ta r=@ud] (pairs ~[['id' s+(crip (trip i))] ['rev' (numb r)]])))
      ==
    ::
        %note-lineage-set
      %+  frond  'note-lineage-set'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['forkOrigin' s+(scot %uv fork-origin.upd)]
          ['forkVersion' (numb fork-version.upd)]
          :-  'forkOf'
          ?~  fork-of.upd  ~
          (pairs ~[['host' s+(scot %p host.u.fork-of.upd)] ['nid' s+(crip (trip nid.u.fork-of.upd))]])
          :-  'parentVersion'
          ?~  parent-version.upd  ~
          (numb u.parent-version.upd)
      ==
    ::
        %fork-invite-received
      %+  frond  'fork-invite-received'
      %-  pairs
      :~  ['rootId' s+(crip (trip root-id.upd))]
          ['sourceName' s+source-name.upd]
          ['sourceVersion' (numb source-version.upd)]
          ['forker' s+(scot %p forker.upd)]
      ==
    ::
        %fork-invite-cleared
      (frond 'fork-invite-cleared' (frond 'rootId' s+(crip (trip root-id.upd))))
    ::
        %fork-invite-accepted
      (frond 'fork-invite-accepted' (frond 'rootId' s+(crip (trip root-id.upd))))
    ::
        %headline-updated
      %+  frond  'headline-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['headline' ?~(headline.upd ~ s+u.headline.upd)]
      ==
    ::
        %message-list
      %+  frond  'message-list'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['messages' a+(turn messages.upd msg-to-json)]
          ['artifacts' a+(turn artifacts.upd art-to-json)]
      ==
    ::
        %new-message
      (frond 'new-message' (msg-to-json msg.upd))
    ::
        %message-edited
      %+  frond  'message-edited'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['message' (msg-to-json msg.upd)]
      ==
    ::
        %message-deleted
      %+  frond  'message-deleted'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['msgId' (numb (da-to-ms msg-id.upd))]
          ['eid' ?~(eid.upd ~ s+(scot %uv u.eid.upd))]
      ==
    ::
        %artifact-created
      (frond 'artifact-created' (art-to-json artifact.upd))
    ::
        %artifact-updated
      (frond 'artifact-updated' (art-to-json artifact.upd))
    ::
        %artifact-deleted
      (frond 'artifact-deleted' (frond 'id' s+(crip (trip id.upd))))
    ::
        %profile-list
      %+  frond  'profile-list'
      a+(turn profiles.upd |=([s=@p p=profile:noltbook] (pairs ~[['ship' s+(scot %p s)] ['profile' (prof-to-json p)]])))
    ::
        %profile-updated
      %+  frond  'profile-updated'
      %-  pairs
      :~  ['ship' s+(scot %p ship.upd)]
          ['profile' (prof-to-json profile.upd)]
      ==
    ::
        %wallet-update
      (frond 'wallet-update' a+(turn transactions.upd tx-to-json))
    ::
        %sponsor-chain
      (frond 'sponsor-chain' a+(turn chain.upd |=(p=@p s+(scot %p p))))
    ::
        %remote-note-list
      %+  frond  'remote-note-list'
      %-  pairs
      :~  ['ship' s+(scot %p ship.upd)]
          ['notes' a+(turn notes.upd note-to-json)]
      ==
    ::
        %pal-list
      %+  frond  'pal-list'
      a+(turn pals.upd |=([s=@p st=pal-status:noltbook] (pairs ~[['ship' s+(scot %p s)] ['status' s+(crip (trip (scot %tas st)))]])))
    ::
        %pal-update
      %+  frond  'pal-update'
      %-  pairs
      :~  ['ship' s+(scot %p ship.upd)]
          ['status' s+(crip (trip (scot %tas status.upd)))]
      ==
    ::
        %pal-removed
      %+  frond  'pal-removed'
      (pairs ~[['ship' s+(scot %p ship.upd)]])
    ::
        %contact-list
      %+  frond  'contact-list'
      a+(turn ships.upd |=(p=@p s+(scot %p p)))
    ::
        %dial-update
      (frond 'dial-update' (numb dial.upd))
    ::
        %gossip-message
      %+  frond  'gossip-message'
      %-  pairs
      :~  ['message' (msg-to-json msg.upd)]
          ['hops' (numb hops.upd)]
      ==
    ::
        %gossip-envelope
      %+  frond  'gossip-envelope'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['envelope' (env-to-json env.upd)]
          ['hops' (numb hops.upd)]
      ==
    ::
        %envelope-list
      %+  frond  'envelope-list'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['envelopes' a+(turn envelopes.upd env-to-json)]
      ==
    ::
        %cover-msg-content
      %+  frond  'cover-msg-content'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['message' (msg-to-json msg.upd)]
      ==
    ::
        %rumor-message
      %+  frond  'rumor-message'
      %-  pairs
      :~  ['message' (msg-to-json msg.upd)]
      ==
    ::
        %note-redirect
      %+  frond  'note-redirect'
      %-  pairs
      :~  ['oldId' s+(crip (trip old-id.upd))]
          ['newId' s+(crip (trip new-id.upd))]
      ==
    ::
        %note-users-updated
      %+  frond  'note-users-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['type' s+(crip (trip (scot %tas type.upd)))]
          ['users' a+(turn users.upd |=(p=@p s+(scot %p p)))]
          ['removed' a+(turn removed.upd |=(p=@p s+(scot %p p)))]
          ['rev' (numb rev.upd)]
      ==
    ::
        %mention-update
      %+  frond  'mention-update'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['mentions' a+(turn mentions.upd |=([id=@da eid=(unit @uv) author=@p] (pairs ~[['id' (numb (da-to-ms id))] ['eid' ?~(eid ~ s+(scot %uv u.eid))] ['author' s+(scot %p author)]])))]
      ==
    ::
        %call-started
      %+  frond  'call-started'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['callId' s+(crip (trip call-id.upd))]
          ['startedBy' s+(scot %p started-by.upd)]
          ['participants' a+(turn participants.upd |=(p=@p s+(scot %p p)))]
      ==
    ::
        %call-joined
      %+  frond  'call-joined'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['ship' s+(scot %p ship.upd)]
      ==
    ::
        %call-left
      %+  frond  'call-left'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['ship' s+(scot %p ship.upd)]
      ==
    ::
        %call-ended
      %+  frond  'call-ended'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['callId' s+(crip (trip call-id.upd))]
      ==
    ::
        %call-signal
      %+  frond  'call-signal'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['from' s+(scot %p from.upd)]
          ['sigType' s+sig-type.upd]
          ['payload' s+payload.upd]
      ==
    ::
        %call-state
      %+  frond  'call-state'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['call' (call-to-json call.upd)]
      ==
    ::
        %kick-notification
      %+  frond  'kick-notification'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['noteName' s+note-name.upd]
          ['from' s+(scot %p from.upd)]
      ==
    ::
        %blocked-notification
      %+  frond  'blocked-notification'
      %-  pairs
      :~  ['from' s+(scot %p from.upd)]
      ==
    ::
        %unblocked-notification
      %+  frond  'unblocked-notification'
      %-  pairs
      :~  ['from' s+(scot %p from.upd)]
      ==
    ::
        %blocked-by-list
      (frond 'blocked-by-list' a+(turn ships.upd |=(p=@p s+(scot %p p))))
    ::
        %join-requested
      %+  frond  'join-requested'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['host' s+(scot %p host.upd)]
      ==
    ::
        %join-denied
      %+  frond  'join-denied'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['host' s+(scot %p host.upd)]
      ==
    ::
        %join-removed
      %+  frond  'join-removed'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['host' s+(scot %p host.upd)]
      ==
    ::
        %join-request-received
      %+  frond  'join-request-received'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['ship' s+(scot %p ship.upd)]
          ['noteName' s+note-name.upd]
      ==
    ::
        %join-request-list
      %+  frond  'join-request-list'
      a+(turn requests.upd |=([note-id=@ta ship=@p note-name=@t] (pairs ~[['noteId' s+(crip (trip note-id))] ['ship' s+(scot %p ship)] ['noteName' s+note-name]])))
    ::
        %note-deleted-notification
      %+  frond  'note-deleted-notification'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['noteName' s+note-name.upd]
      ==
    ::
        %admins-updated
      %+  frond  'admins-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['admins' a+(turn admins.upd |=(p=@p s+(scot %p p)))]
      ==
    ::
        %muted-updated
      %+  frond  'muted-updated'
      %-  pairs
      :~  ['id' s+(crip (trip id.upd))]
          ['muted' a+(turn muted.upd |=(p=@p s+(scot %p p)))]
      ==
    ::
        %artifact-envelope
      %+  frond  'artifact-envelope'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['envelope' (art-env-to-json env.upd)]
          ['hops' (numb hops.upd)]
      ==
    ::
        %artifact-envelope-list
      %+  frond  'artifact-envelope-list'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['envelopes' a+(turn envs.upd art-env-to-json)]
      ==
    ::
        %search-result
      %+  frond  'search-result'
      %-  pairs
      :~  ['reqId' (numb req-id.upd)]
          ['query' s+query.upd]
          ['hits' a+(turn hits.upd search-hit-to-json)]
          ['capped' b+capped.upd]
      ==
    ::
        %profile-lookup-result
      %+  frond  'profile-lookup-result'
      %-  pairs
      :~  ['reqId' (numb req-id.upd)]
          ['ship' s+(scot %p ship.upd)]
          ['status' s+(crip (trip (scot %tas status.upd)))]
      ==
    ::
        %notification-acks
      %+  frond  'notification-acks'
      :-  %a
      %+  turn  acks.upd
      |=  ack=durable-notification-ack:noltbook
      %-  pairs
      :~  ['kind' s+(crip (trip (scot %tas kind.ack)))]
          ['noteId' s+(crip (trip note-id.ack))]
      ==
    ::
        %note-activity
      %+  frond  'note-activity'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['activity' (numb (da-to-ms activity.upd))]
      ==
    ::
        %note-activity-list
      %+  frond  'note-activity-list'
      :-  %a
      %+  turn  activities.upd
      |=  [note-id=@ta activity=@da]
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id))]
          ['activity' (numb (da-to-ms activity))]
      ==
    ::
        %note-sidebar-signal
      %+  frond  'note-sidebar-signal'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['author' s+(scot %p author.upd)]
          ['preview' ?~(preview.upd ~ s+u.preview.upd)]
          ['kind' s+(crip (trip (scot %tas kind.upd)))]
          ['time' (numb (da-to-ms time.upd))]
      ==
    ::
        %note-read
      %+  frond  'note-read'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['read' (numb (da-to-ms read.upd))]
      ==
    ::
        %note-read-list
      %+  frond  'note-read-list'
      :-  %a
      %+  turn  reads.upd
      |=  [note-id=@ta read=@da]
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id))]
          ['read' (numb (da-to-ms read))]
      ==
    ==
    ::
    ++  call-to-json
      |=  c=call-info:noltbook
      %-  pairs
      :~  ['callId' s+(crip (trip call-id.c))]
          ['noteId' s+(crip (trip note-id.c))]
          ['startedBy' s+(scot %p started-by.c)]
          ['started' (numb (da-to-ms started.c))]
          ['participants' a+(turn ~(tap in participants.c) |=(p=@p s+(scot %p p)))]
          ['status' s+(crip (trip (scot %tas status.c)))]
      ==
    ::
    ++  da-to-ms
      |=  t=@da
      ^-  @ud
      (div (sub t ~1970.1.1) (div ~s1 1.000))
    ::
    ++  search-hit-to-json
      |=  h=search-msg-hit:noltbook
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.h))]
          ['msgId' (numb (da-to-ms msg-id.h))]
          ['eid' ?~(eid.h ~ s+(scot %uv u.eid.h))]
          ['author' s+(scot %p author.h)]
          ['timestamp' (numb (da-to-ms timestamp.h))]
          ['preview' s+preview.h]
      ==
    ::
    ++  note-to-json
      |=  n=note:noltbook
      %-  pairs
      :~  ['id' s+(crip (trip id.n))]
          ['name' s+name.n]
          ['type' s+(crip (trip (scot %tas type.n)))]
          ['creator' s+(scot %p creator.n)]
          ['users' a+(turn ~(tap in users.n) |=(p=@p s+(scot %p p)))]
          ['children' a+(turn children.n |=(c=@ta s+(crip (trip c))))]
          ['parent' ?~(parent.n ~ s+(crip (trip u.parent.n)))]
          ['lastAuthor' ?~(last-author.n ~ s+(scot %p u.last-author.n))]
          ['lastPreview' ?~(last-preview.n ~ s+u.last-preview.n)]
          ['visibility' s+(crip (trip (scot %tas visibility.n)))]
          ['iconUrl' ?~(icon-url.n ~ s+u.icon-url.n)]
          ['writable' b+writable.n]
          ['removed' a+(turn ~(tap in removed.n) |=(p=@p s+(scot %p p)))]
          ['headline' ?~(headline.n ~ s+u.headline.n)]
      ==
    ::
    ++  msg-to-json
      |=  m=message:noltbook
      %-  pairs
      :~  ['id' (numb (da-to-ms id.m))]
          ['noteId' s+(crip (trip note-id.m))]
          ['author' s+(scot %p author.m)]
          ['text' s+text.m]
          ['timestamp' (numb (da-to-ms timestamp.m))]
          ['replyTo' ?~(reply-to.m ~ (numb (da-to-ms u.reply-to.m)))]
          ['edited' b+edited.m]
          ['meta' ?~(meta.m ~ (meta-to-json u.meta.m))]
      ==
    ::
    ++  meta-to-json
      |=  m=entry-meta:noltbook
      %-  pairs
      :~  ['eid' s+(scot %uv eid.m)]
          ['seq' (numb seq.m)]
          ['rev' (numb rev.m)]
          ['created' (numb (da-to-ms created.m))]
          ['updated' (numb (da-to-ms updated.m))]
          ['replyToEid' ?~(reply-to-eid.m ~ s+(scot %uv u.reply-to-eid.m))]
      ==
    ::
    ++  env-to-json
      |=  e=envelope:noltbook
      %-  pairs
      :~  ['id' (numb (da-to-ms msg-id.e))]
          ['author' s+(scot %p author.e)]
          ['timestamp' (numb (da-to-ms timestamp.e))]
          ['replyTo' ?~(reply-to.e ~ (numb (da-to-ms u.reply-to.e)))]
          ['contentHash' s+(scot %uv content-hash.e)]
          ['meta' ?~(meta.e ~ (meta-to-json u.meta.e))]
      ==
    ::
    ++  art-to-json
      |=  a=artifact:noltbook
      %-  pairs
      :~  ['id' s+(crip (trip id.a))]
          ['name' s+name.a]
          ['type' s+(crip (trip (scot %tas type.a)))]
          ['creator' s+(scot %p creator.a)]
          ['noteId' s+(crip (trip note-id.a))]
          ['versions' a+(turn versions.a ver-to-json)]
      ==
    ::
    ++  art-env-to-json
      |=  e=artifact-envelope:noltbook
      %-  pairs
      :~  ['aid' s+(crip (trip aid.e))]
          ['author' s+(scot %p author.e)]
          ['noteId' s+(crip (trip note-id.e))]
          ['name' s+name.e]
          ['mime' s+mime.e]
          ['kind' s+kind.e]
          ['size' (numb size.e)]
          ['contentHash' s+(scot %uv content-hash.e)]
          ['timestamp' (numb (da-to-ms timestamp.e))]
          ['meta' ?~(meta.e ~ (meta-to-json u.meta.e))]
      ==
    ::
    ++  ver-to-json
      |=  v=artifact-version:noltbook
      %-  pairs
      :~  ['version' (numb version.v)]
          ['content' s+content.v]
          ['editor' s+(scot %p editor.v)]
          ['timestamp' (numb (da-to-ms timestamp.v))]
      ==
    ::
    ++  prof-to-json
      |=  p=profile:noltbook
      %-  pairs
      :~  ['displayName' ?~(display-name.p ~ s+u.display-name.p)]
          :-  'avatar'
          ?~  avatar.p  ~
          =/  type-str=@t
            ?:  =(%urbit type.u.avatar.p)    'urbit'
            ?:  =(%s3 type.u.avatar.p)       's3'
            ?:  =(%ipfs type.u.avatar.p)     'ipfs'
            'external'
          (pairs ~[['type' s+type-str] ['url' s+url.u.avatar.p]])
          ['walletAddress' ?~(wallet-address.p ~ s+u.wallet-address.p)]
          ['azimuthAddress' ?~(azimuth-address.p ~ s+u.azimuth-address.p)]
      ==
    ::
    ++  tx-to-json
      |=  t=transaction:noltbook
      %-  pairs
      :~  ['type' s+(crip (trip (scot %tas type.t)))]
          ['counterparty' s+counterparty.t]
          ['amount' (numb amount.t)]
          ['txHash' s+tx-hash.t]
          ['timestamp' (numb (da-to-ms timestamp.t))]
      ==
    --
  --
++  grad  %noun
--
