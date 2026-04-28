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
      :~  ['envelope' (env-to-json env.upd)]
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
      (frond 'cover-msg-content' (msg-to-json msg.upd))
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
          ['users' a+(turn users.upd |=(p=@p s+(scot %p p)))]
          ['removed' a+(turn removed.upd |=(p=@p s+(scot %p p)))]
      ==
    ::
        %mention-update
      %+  frond  'mention-update'
      %-  pairs
      :~  ['noteId' s+(crip (trip note-id.upd))]
          ['mentions' a+(turn mentions.upd |=([id=@da author=@p] (pairs ~[['id' (numb (da-to-ms id))] ['author' s+(scot %p author)]])))]
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
      ==
    ::
    ++  env-to-json
      |=  e=envelope:noltbook
      %-  pairs
      :~  ['id' (numb (da-to-ms msg-id.e))]
          ['author' s+(scot %p author.e)]
          ['timestamp' (numb (da-to-ms timestamp.e))]
          ['replyTo' ?~(reply-to.e ~ (numb (da-to-ms u.reply-to.e)))]
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
