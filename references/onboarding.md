# Onboarding

Use this reference when preparing a fresh server or bootstrapping a new operator user.

## Intake

Collect before touching the host:

- server IP or hostname
- initial login method
- target operator username
- public SSH key to install
- domain and email for TLS if a reverse proxy is needed
- workload type: `app`, `bot`, `db`, or `mixed`

## Stage 1: Safe Preflight

```bash
hostname
whoami
uname -a
cat /etc/os-release
id
ss -tulpn
```

Acceptance:

- OS family is known
- current auth path is verified
- no blind changes happen before a baseline snapshot

## Stage 2: User Bootstrap And SSH Hardening

Actions:

- create the operator user with sudo when appropriate
- add `~/.ssh/authorized_keys`
- disable `PermitRootLogin` and `PasswordAuthentication` after verifying the new login

Verification:

```bash
sudo sshd -t
sudo systemctl restart ssh || sudo systemctl restart sshd
sudo grep -E '^(PermitRootLogin|PasswordAuthentication)' /etc/ssh/sshd_config
```

Acceptance:

- the new user can login by key
- root SSH and password SSH are disabled

## Stage 3: Security Baseline

Actions:

- enable the firewall with `ufw` or `firewalld`
- allow only `22`, `80`, `443`, and explicit required ports
- install and enable `fail2ban` for `sshd`
- enable unattended security updates

Verification:

```bash
sudo ufw status verbose || sudo firewall-cmd --list-all
sudo systemctl is-active fail2ban
sudo fail2ban-client status sshd
```

Acceptance:

- firewall is active
- `fail2ban` is active with an `sshd` jail

## Stage 4: Runtime Baseline

Actions:

- install Docker and the compose plugin when the workload needs containers
- configure log rotation
- install Caddy or nginx with HTTPS when required

Verification:

```bash
docker --version
docker compose version
sudo caddy validate --config /etc/caddy/Caddyfile
curl -I https://<domain>
```

Acceptance:

- container runtime is healthy
- reverse proxy config is valid
- TLS is issued for the target domain

## Stage 5: Report And Handoff

Generate:

- `server-doctor-report.md`
- `server-doctor-report.json`

The report should include:

- before and after health score
- applied fixes
- skipped checks with reason
- manual follow-ups
