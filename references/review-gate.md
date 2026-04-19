# Review Gate

Use this gate before merging new docs, scripts, or incident notes into `server-doctor-public`.

## Gate 1. Placement
- Is this doctrine, runbook, overlay, or incident memory?
- Is it stored in the highest reusable layer that fits?

## Gate 2. Secret safety
- Remove private hostnames, usernames, domains, IPs, emails, bot names, chat ids, and credentials
- Replace environment fingerprints with role-based placeholders where possible
- Keep examples short and generic

## Gate 3. Evidence wording
- Strong claims require direct evidence
- `restart succeeded` is not `service recovered`
- `visibility-limited` is not `down`

## Gate 4. Operator value
- Does the change improve targeting, diagnosis, repair, or verification?
- Would a new operator understand what to do next?

## Gate 5. Verification
- For scripts: run or update the relevant tests
- For docs: verify file paths, command names, and cross-links
- For incident notes: ensure they link back to the governing doctrine or runbook

## Merge rule
If a change fails placement or secret-safety review, fix that first. Do not merge and promise to sanitize later.
