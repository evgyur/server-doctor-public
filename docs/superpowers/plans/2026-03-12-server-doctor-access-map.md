# Server Doctor Access Map Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rework the public `server-doctor` skill so it requires an access and inventory preflight before diagnosis, while still allowing partial progress when the operator only knows part of the environment.

**Architecture:** This is a single-file documentation change. The skill text will be restructured so the opening guidance, workflow, and expected outputs all push the agent toward building an operational environment map before attempting repairs.

**Tech Stack:** Markdown skill documentation

---

## Chunk 1: Rewrite The Public Skill

### Task 1: Assess Gaps Against The Current Skill

**Files:**
- Modify: `server-doctor-public/SKILL.md`
- Verify: `cat /mnt/c/Users/user/.github/server-doctor-public/SKILL.md`

- [ ] **Step 1: Compare the current skill against the approved spec**

Check these required areas in `server-doctor-public/SKILL.md`:
- warning about limited usefulness without access
- `Access & Inventory Preflight` before generic diagnostics
- explicit `mapped` / `partial map` / `unreachable` statuses
- support for remote and local/container access paths
- map-oriented outputs for host, bot, runtime, access, and known unknowns

Expected: identify only the missing deltas relative to the spec; if already compliant, do not force a rewrite.

- [ ] **Step 2: Update the warning and intake language if needed**

Ensure the document:
- warns that the skill is operationally weak without access
- requests a minimal operator intake for hosts, bots, runtime/service topology, owners, directories or service identifiers, and safe connection methods
- does not require secrets to be pasted into public chat

- [ ] **Step 3: Update map-state behavior if needed**

Ensure `partial map` behavior explicitly says to:
- record confirmed facts
- list unknowns
- continue with reachable targets
- ask for the next access detail that unlocks deeper work

- [ ] **Step 4: Update workflow and outputs if needed**

Ensure downstream sections preserve the priority order:
- access map first
- runtime discovery second
- restart/log/status-path capture after runtime discovery
- operational map and incident handling after access is established

Ensure the output explicitly includes:
- host map
- bot map
- runtime map
- access map
- known unknowns

- [ ] **Step 5: Verify the final skill text**

Run: `cat /mnt/c/Users/user/.github/server-doctor-public/SKILL.md`
Expected:
- intake covers hosts, bots, runtimes, owners, directories or service identifiers, and safe access methods
- preflight appears before generic diagnostics
- all three map states appear: `mapped`, `partial map`, `unreachable`
- remote, local, and container access paths are present
- restart/log/status-path guidance is present after runtime discovery
- outputs include host map, bot map, runtime map, access map, and known unknowns
- `partial map` behavior is explicit
- warning makes clear that the skill cannot reliably diagnose or repair without access
- no private hosts, users, secrets, or unsafe credential requirements are introduced
