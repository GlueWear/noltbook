#!/usr/bin/env python3
"""Run the actual pure Hoon membership helpers against regression fixtures.

    python3 tests/dm_membership.py --url http://127.0.0.1:12323

Only evaluates an expression through the existing loopback Lens console. No
agent pokes, notes, messages, settings, files on a ship, or call rooms change.
Without --url, prints the expression for evaluation in a Dojo. Helpers and the
note mold are extracted from this checkout, so tests exercise the changed code.
"""

import argparse
import json
from pathlib import Path
import re
import urllib.request


ROOT = Path(__file__).resolve().parents[1]


def definition(source, rune, name):
    start = source.index(f"{rune}  {name}\n")
    next_arm = re.search(r"^\+[$+]  ", source[start + 1 :], re.M)
    end = start + 1 + next_arm.start() if next_arm else len(source)
    return source[start:end]


def expression():
    app = (ROOT / "app/noltbook.hoon").read_text()
    sur = (ROOT / "sur/noltbook.hoon").read_text()
    molds = "\n".join(
        re.search(rf"^\+\$  {name}  .*$", sur, re.M).group()
        for name in ["note-type", "note-visibility"]
    ) + "\n" + definition(sur, "+$", "note")
    helpers = "\n".join(
        definition(app, "++", name)
        for name in [
            "is-ordinary-dm", "dm-pair-ok", "dm-members", "dm-call-allowed",
            "logical-members-of", "human-sees-note", "ensure-note-members",
            "is-host-unavailable", "is-removed-self", "is-write-blocked",
            "can-user-post", "can-mutate-message",
        ]
    )
    # Exercise the real reconciliation row expression without constructing an
    # unrelated 78-field agent state or invoking the live reconciliation handler.
    merge = app.split("  =.  note-members.s\n", 1)[1].split(
        "  ::  notification-acks:", 1
    )[0]
    merge_helper = """++  merge-rows
  |=  [cn=note:noltbook lose=@ta win=@ta rows=(map @ta (set @p))]
  =/  s  [note-members=rows ~]
""" + merge
    fixture = """++  tests
  =/  pair=(set @p)  (sy ~[~zod ~nec])
  =/  dm=note:noltbook
    [%dm-test '' %dm ~zod pair ~ ~ ~ ~ %secret ~ %.y ~ ~]
  =/  group=note:noltbook  dm(id %group-test, type %group)
  =/  doc=note:noltbook  group(id %doc-test, type %document)
  =/  solo=note:noltbook  dm(id %solo-test, type %notebook, users (sy ~[~zod]))
  =/  notes=(map @ta note:noltbook)
    (~(gas by *(map @ta note:noltbook)) ~[[%dm-test dm] [%group-test group] [%doc-test doc] [%solo-test solo]])
  =/  empty=(map @ta (set @p))  *(map @ta (set @p))
  =/  singleton  (~(put by empty) %dm-test (sy ~[~zod]))
  =/  denied  (~(put by empty) %dm-test *(set @p))
  =/  both-denied  (~(put by denied) %loser *(set @p))
  =/  group-denied  (~(put by singleton) %group-test *(set @p))
  =/  rows  (~(put by group-denied) %doc-test (sy ~[~nec]))
  =/  normalized  (ensure-note-members rows notes)
  =/  removed-notes  (~(put by notes) %dm-test dm(removed (sy ~[~nec])))
  =/  bad-notes  (~(put by notes) %dm-test dm(users (sy ~[~zod ~nec ~bud])))
  =/  readonly  (~(put by notes) %group-test group(writable %.n))
  =/  muted  (~(put by empty) %group-test (sy ~[~nec]))
  =/  cases=(list [@t ?])
    :~  ['fresh-pair' =(pair (logical-members-of %dm-test empty notes))]
        ['converted-singleton' =(pair (logical-members-of %dm-test singleton notes))]
        ['explicit-empty-dm' =(pair (logical-members-of %dm-test denied notes))]
        ['both-humans-see-dm' &((human-sees-note %dm-test ~zod denied notes) (human-sees-note %dm-test ~nec denied notes))]
        ['stranger-denied' !(human-sees-note %dm-test ~bud denied notes)]
        ['host-admits-peer' (can-user-post %dm-test ~nec ~ notes singleton)]
        ['removed-peer-denied' !(can-user-post %dm-test ~nec ~ removed-notes singleton)]
        ['malformed-three-users-denied' =((logical-members-of %dm-test denied bad-notes) ~)]
        ['malformed-one-user-denied' =((dm-members dm(users (sy ~[~zod]))) ~)]
        ['foreign-coordinator-denied' =((dm-members dm(creator ~bud)) ~)]
        ['nested-dm-denied' =((dm-members dm(parent `%parent)) ~)]
        ['imported-peer-coordinator' =(pair (dm-members dm(creator ~nec)))]
        ['group-empty-stays-denied' =((logical-members-of %group-test rows notes) ~)]
        ['document-row-preserved' =((logical-members-of %doc-test rows notes) (sy ~[~nec]))]
        ['group-fallback-preserved' =(pair (logical-members-of %group-test empty notes))]
        ['group-muted-denied' !(can-mutate-message %group-test ~nec readonly empty muted)]
        ['group-unmuted-exception' (can-mutate-message %group-test ~nec readonly empty empty)]
        ['reload-drops-dm-row' !(~(has by normalized) %dm-test)]
        ['reload-preserves-group-empty' =((~(get by normalized) %group-test) `*(set @p))]
        ['reload-idempotent' =(normalized (ensure-note-members normalized notes))]
        ['reconcile-absent-rows' =((merge-rows dm %loser %dm-test empty) empty)]
        ['reconcile-empty-rows' =((merge-rows dm %loser %dm-test both-denied) empty)]
        ['reconcile-singleton' =((merge-rows dm %loser %dm-test singleton) empty)]
        ['reconcile-keeps-unrelated' =((~(get by (merge-rows dm %loser %dm-test rows)) %doc-test) `(sy ~[~nec]))]
        ['dm-call-allowed' (dm-call-allowed %dm-test ~nec notes ~ ~)]
        ['blocked-call-denied' !(dm-call-allowed %dm-test ~nec notes (sy ~[~nec]) ~)]
        ['blocked-by-call-denied' !(dm-call-allowed %dm-test ~zod notes ~ (sy ~[~nec]))]
        ['blocked-coordinator-call-denied' !(dm-call-allowed %dm-test ~zod notes (sy ~[~nec]) ~)]
        ['unblocked-call-allowed' (dm-call-allowed %dm-test ~zod notes ~ ~)]
        ['stranger-call-denied' !(dm-call-allowed %dm-test ~bud notes ~ ~)]
        ['shared-call-policy-unchanged' (dm-call-allowed %group-test ~nec notes (sy ~[~nec]) ~)]
        ['left-dm-denied' !(dm-call-allowed %dm-test ~nec (~(del by notes) %dm-test) ~ ~)]
        ['recreated-dm-allowed' (dm-call-allowed %dm-test ~nec notes ~ ~)]
    ==
  =/  failed  (skip cases |=([label=@t ok=?] ok))
  ?~  failed  [%dm-membership-tests-passed (lent cases)]
  [%dm-membership-tests-failed failed]
"""
    return "=/  noltbook\n|%\n" + molds + "--\n=<  tests\n|%\n" + fixture + helpers + merge_helper + "--\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--url", help="Existing loopback Lens HTTP endpoint")
    args = parser.parse_args()
    code = expression()
    if not args.url:
        print(code)
        return
    # Lens's direct tall parser rejects trailing input. Pass source as data
    # through ream, and return compiler errors as data rather than a stalled job.
    evaluator = "|=  txt=@t\n(mule |.(!<([@tas *] (slap !>(.) (ream txt)))))"
    body = json.dumps({"source": {"hoon": {"code": evaluator,
                                          "next": {"data": code}}},
                       "sink": {"stdout": None}}).encode()
    request = urllib.request.Request(
        args.url, data=body, headers={"Content-Type": "application/json"}
    )
    with urllib.request.urlopen(request, timeout=45) as response:
        result = json.loads(response.read())
    print(result)
    if not re.fullmatch(r"\[%\.y p=\[%dm-membership-tests-passed 33\]\]\s*", result):
        raise SystemExit(1)


if __name__ == "__main__":
    main()
