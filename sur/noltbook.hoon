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
::  ship-to-ship remote pokes
+$  remote
  $%  [%remote-invite note-id=@ta name=@t type=note-type creator=@p users=(set @p) visibility=note-visibility]
      [%remote-message note-id=@ta msg=message]
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
      [%remote-introduce ship=@p]
      ::  call signaling remotes
      [%remote-call-start note-id=@ta call-id=@ta started-by=@p]
      [%remote-call-join note-id=@ta ship=@p]
      [%remote-call-leave note-id=@ta ship=@p]
      [%remote-call-ended note-id=@ta]
      [%remote-call-signal call-id=@ta from=@p sig-type=@t payload=@t]
      ::  block: host kicked you from a note
      [%remote-kick note-id=@ta note-name=@t]
  ==
::  poke actions (client to agent)
+$  action
  $%  [%create-note name=@t parent=(unit @ta)]
      [%create-gossip-note name=@t headline=@t]
      [%rename-note id=@ta name=@t]
      [%delete-note id=@ta]
      [%switch-note id=@ta]
      [%send-message note-id=@ta text=@t reply-to=(unit @da) reply-to-eid=(unit @uv)]
      [%edit-message note-id=@ta msg-id=@da eid=(unit @uv) text=@t]
      [%delete-message note-id=@ta msg-id=@da eid=(unit @uv)]
      [%set-note-meta id=@ta visibility=note-visibility icon-url=(unit @t) writable=?]
      [%invite-to-note id=@ta ship=@p]
      [%create-artifact note-id=@ta name=@t type=artifact-type content=@t]
      [%edit-artifact id=@ta content=@t]
      [%delete-artifact id=@ta]
      [%file-save id=@ta data=@t]
      [%update-profile display-name=(unit @t) avatar=(unit avatar-ref) wallet-address=(unit @t) azimuth-address=(unit @t)]
      [%register-wallet address=@t]
      [%nock-send-confirmed to=@t amount=@ud tx-hash=@t]
      [%request-remote-notes ship=@p]
      [%add-pal ship=@p]
      [%remove-pal ship=@p]
      [%block-pal ship=@p]
      [%unblock-pal ship=@p]
      [%set-dial dial=@ud]
      [%create-dm ship=@p]
      [%leave-note id=@ta]
      [%reparent-note id=@ta new-parent=@ta]
      [%remove-member id=@ta ship=@p]
      [%clear-mentions note-id=@ta]
      [%clear-mention note-id=@ta msg-id=@da eid=(unit @uv)]
      ::  call actions
      [%start-call note-id=@ta]
      [%join-call note-id=@ta]
      [%leave-call note-id=@ta]
      [%call-signal note-id=@ta to=@p sig-type=@t payload=@t]
      [%clear-calls ~]
      [%fetch-cover-msg note-id=@ta author=@p msg-id=@da eid=(unit @uv)]
      [%set-headline id=@ta headline=@t]
  ==
::  subscription updates (agent to client)
+$  update
  $%  [%note-list notes=(list note)]
      [%note-created note=note]
      [%note-renamed id=@ta name=@t]
      [%note-deleted id=@ta]
      [%note-meta-updated id=@ta visibility=note-visibility icon-url=(unit @t) writable=?]
      [%message-list note-id=@ta messages=(list message) artifacts=(list artifact)]
      [%new-message msg=message]
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
      [%dial-update dial=@ud]
      [%gossip-message msg=message hops=@ud]
      [%gossip-envelope note-id=@ta env=envelope hops=@ud]
      [%envelope-list note-id=@ta envelopes=(list envelope)]
      [%cover-msg-content note-id=@ta msg=message]
      [%rumor-message msg=message]
      [%note-redirect old-id=@ta new-id=@ta]
      [%note-users-updated id=@ta users=(list @p) removed=(list @p)]
      [%mention-update note-id=@ta mentions=(list [id=@da eid=(unit @uv) author=@p])]
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
  ==
--
