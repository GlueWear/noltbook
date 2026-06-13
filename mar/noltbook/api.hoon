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
    =/  parent=(unit @ta)
      =/  v  (get-str 'parent')
      ?~(v ~ ``@ta`u.v)
    ?:  =('create-note' tag)
      [%create-note rid (need (get-str 'name')) parent]
    ?:  =('find-or-create-note' tag)
      [%find-or-create-note rid (need (get-str 'name')) parent]
    ?:  =('post-message' tag)
      =/  rte=(unit @uv)
        =/  v  (get-str 'replyToEid')
        ?~(v ~ `(slav %uv u.v))
      [%post-message rid `@ta`(need (get-str 'noteId')) (need (get-str 'text')) rte]
    ?:  =('post-app-ref' tag)
      :*  %post-app-ref  rid
          `@ta`(need (get-str 'noteId'))
          (need (get-str 'publisher'))
          (need (get-str 'desk'))
          (need (get-str 'name'))
      ==
    ~|([%noltbook-api-unknown-action tag] !!)
  --
++  grow
  |%
  ++  noun  act
  --
++  grad  %noun
--
