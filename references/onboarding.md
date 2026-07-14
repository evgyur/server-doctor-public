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

## Stage 2: Operator access and SSH hardening

Actions:

- configure operator access through the environment's approved identity process
- verify a second independent session before changing authentication policy
- disable root and password login only after the replacement access path is proven
- keep identity-file provisioning outside this skill and out of the repository

Verification:

```bash
sudo sshd -t
sudo grep -E '^(PermitRootLogin|PasswordAuthentication)' /etc/ssh/sshd_config
ssh <operator>@<host> 'id && true'
```

Socket-activation trap:

- some distributions can accept SSH through `ssh.socket` while `ssh.service` is inactive or tracks no real daemon PID;
- after changing `AddressFamily`, `ListenAddress`, or authentication policy, inspect both units and the actual listener;
- never close the bootstrap session until a second key-authenticated operator session succeeds.

```bash
sudo systemctl status ssh.socket ssh.service --no-pager -l
sudo systemctl show ssh.service -p MainPID -p ActiveState -p SubState
sudo ss -ltnp '( sport = :22 )'
```

If socket activation conflicts with the intended listener policy, migrate deliberately: disable the socket, enable the service, and verify a real `MainPID` plus a fresh second SSH session. A bound port by itself is not enough evidence that the intended SSH configuration owns the listener.

Acceptance:

- the new operator can log in through the approved identity path
- root SSH and password SSH are disabled
- the intended socket/service owns the listener and a second operator session works

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
