|%
::  note types
+$  note-type  ?(%notebook %dm %group %cover)
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
::  ship-to-ship remote pokes
+$  remote
  $%  [%remote-invite note-id=@ta name=@t type=note-type creator=@p users=(set @p) visibility=note-visibility]
      [%remote-message note-id=@ta msg=message]
      [%remote-ars msg=message hops=@ud]
      [%remote-rumor msg=message hops=@ud]
      [%remote-profile ship=@p profile=profile]
      [%remote-note-request requester=@p]
      [%remote-note-list notes=(list note)]
      [%remote-hey ~]
      [%remote-bye ~]
      [%remote-edit-msg note-id=@ta msg-id=@da text=@t]
      [%remote-delete-msg note-id=@ta msg-id=@da]
      [%remote-create-child parent-id=@ta name=@t]
      [%remote-child-note parent-id=@ta note=note]
      ::  root-uniqueness: tell loser to drop their root + adopt ours
      [%remote-root-exists losing-id=@ta canonical=note]
      [%remote-leave note-id=@ta]
  ==
::  poke actions (client to agent)
+$  action
  $%  [%create-note name=@t parent=(unit @ta)]
      [%rename-note id=@ta name=@t]
      [%delete-note id=@ta]
      [%switch-note id=@ta]
      [%send-message note-id=@ta text=@t reply-to=(unit @da)]
      [%edit-message note-id=@ta msg-id=@da text=@t]
      [%delete-message note-id=@ta msg-id=@da]
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
      [%message-deleted note-id=@ta msg-id=@da]
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
      [%rumor-message msg=message]
      [%note-redirect old-id=@ta new-id=@ta]
      [%note-users-updated id=@ta users=(list @p)]
  ==
--
