# Principal Rubric

Use this rubric when reviewing major additions to `server-doctor-public`.

## 1. Routing quality
- Is the entry path obvious?
- Does the reader know which doctrine anchor to read first?
- Does the document reduce wrong-target diagnosis?

## 2. Reuse quality
- Is the content portable across multiple environments?
- If not portable, was it placed in an overlay instead of a core runbook?
- Is the example generic enough to teach the pattern without leaking operator details?

## 3. Evidence quality
- Does the guidance separate confirmed facts from assumptions?
- Does it avoid strong outage or recovery wording without direct proof?
- Does it define a post-action verification path?

## 4. Operational usefulness
- Can an operator act from it?
- Are commands concrete?
- Are risk boundaries and rollback points clear?

## 5. Secret safety
- No passwords, tokens, chat ids, session strings, private usernames, private hostnames, or unredacted provider config
- No verbatim `.env`, `openclaw.json`, or service-unit dumps
- No examples that fingerprint a private environment unless explicitly intended for a private repo

## Scoring guide
- pass: routing is clear, the doc is reusable, and no secret-safety issues remain
- revise: useful content exists but placement, evidence discipline, or redaction quality is weak
- reject: content is misleading, environment-bound without labeling, or leaks private operational detail
