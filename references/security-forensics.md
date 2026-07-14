# Security forensics

Use this reference when the operator wants attribution for who changed or deleted important files, especially config, dependency, or deploy paths.

## Forensics baseline

### 1. Targeted `auditd` watches

Enable focused file-change watches on the project or runtime paths that actually matter:

```bash
sudo apt-get update -y
sudo apt-get install -y auditd audispd-plugins
sudo systemctl enable --now auditd

sudo tee /etc/audit/rules.d/server-doctor-forensics.rules >/dev/null <<'EOF'
-w <project-root> -p wa -k project_changes
-w <project-root>/package.json -p wa -k project_pkg
-w <project-root>/package-lock.json -p wa -k project_pkg
-w <project-root>/docker-compose.yml -p wa -k project_runtime
-a always,exit -F arch=b64 -S execve -F auid=<service-user-uid> -k operator_exec
-a always,exit -F arch=b32 -S execve -F auid=<service-user-uid> -k operator_exec
EOF

sudo augenrules --load
```

Keep the rule set narrow. A small, relevant watch list is far more useful than a noisy everything-watch.

### 2. Privileged-session logging

If policy requires privileged-session recording, configure it through the operating system's approved security baseline or configuration-management layer. Do not create or replace privilege-policy fragments from an ad-hoc incident session.

## Verification

```bash
systemctl is-active auditd
sudo auditctl -l | grep -E 'project_changes|project_pkg|project_runtime|operator_exec'
```

## Incident queries

```bash
sudo ausearch -k project_changes -i
sudo ausearch -k project_pkg -i
sudo ausearch -k project_runtime -i
sudo ausearch -k operator_exec -i
```

## Notes

- without this baseline, retroactive attribution is often impossible
- keep rules focused so the audit stream stays readable
- record the exact watched paths and the target UID in the operator handoff, otherwise the setup becomes guesswork later
