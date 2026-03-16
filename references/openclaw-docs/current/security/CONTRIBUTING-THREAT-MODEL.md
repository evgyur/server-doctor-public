<!-- Source: https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL -->
<!-- Title: CONTRIBUTING THREAT MODEL - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/)

[Get started

](https://docs.openclaw.ai/)[Install

](https://docs.openclaw.ai/install)[Channels

](https://docs.openclaw.ai/channels)[Agents

](https://docs.openclaw.ai/pi)[Tools

](https://docs.openclaw.ai/tools)[Models

](https://docs.openclaw.ai/providers)[Platforms

](https://docs.openclaw.ai/platforms)[Gateway & Ops

](https://docs.openclaw.ai/gateway)[Reference

](https://docs.openclaw.ai/cli)[Help

](https://docs.openclaw.ai/help)

##### Gateway

-   [
    
    Gateway Runbook
    
    
    
    ](https://docs.openclaw.ai/gateway)

##### Remote access

-   [
    
    Remote Access
    
    
    
    ](https://docs.openclaw.ai/gateway/remote)
-   [
    
    Remote Gateway Setup
    
    
    
    ](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/gateway/tailscale)

##### Security

-   [
    
    Formal Verification (Security Models)
    
    
    
    ](https://docs.openclaw.ai/security/formal-verification)
-   [
    
    THREAT MODEL ATLAS
    
    
    
    ](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)
-   [
    
    CONTRIBUTING THREAT MODEL
    
    
    
    ](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

##### Web interfaces

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/web)
-   [
    
    Control UI
    
    
    
    ](https://docs.openclaw.ai/web/control-ui)
-   [
    
    Dashboard
    
    
    
    ](https://docs.openclaw.ai/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/web/tui)

-   [Contributing to the OpenClaw Threat Model](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Ways to Contribute](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Add a Threat](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Suggest a Mitigation](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Propose an Attack Chain](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Fix or Improve Existing Content](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [What We Use](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [MITRE ATLAS](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Threat IDs](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Risk Levels](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Review Process](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Resources](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Contact](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)
-   [Recognition](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Security

# CONTRIBUTING THREAT MODEL

# 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Contributing to the OpenClaw Threat Model

Thanks for helping make OpenClaw more secure. This threat model is a living document and we welcome contributions from anyone - you don’t need to be a security expert.

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Ways to Contribute

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Add a Threat

Spotted an attack vector or risk we haven’t covered? Open an issue on [openclaw/trust](https://github.com/openclaw/trust/issues) and describe it in your own words. You don’t need to know any frameworks or fill in every field - just describe the scenario. **Helpful to include (but not required):**

-   The attack scenario and how it could be exploited
-   Which parts of OpenClaw are affected (CLI, gateway, channels, ClawHub, MCP servers, etc.)
-   How severe you think it is (low / medium / high / critical)
-   Any links to related research, CVEs, or real-world examples

We’ll handle the ATLAS mapping, threat IDs, and risk assessment during review. If you want to include those details, great - but it’s not expected.

> **This is for adding to the threat model, not reporting live vulnerabilities.** If you’ve found an exploitable vulnerability, see our [Trust page](https://trust.openclaw.ai/) for responsible disclosure instructions.

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Suggest a Mitigation

Have an idea for how to address an existing threat? Open an issue or PR referencing the threat. Useful mitigations are specific and actionable - for example, “per-sender rate limiting of 10 messages/minute at the gateway” is better than “implement rate limiting.”

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Propose an Attack Chain

Attack chains show how multiple threats combine into a realistic attack scenario. If you see a dangerous combination, describe the steps and how an attacker would chain them together. A short narrative of how the attack unfolds in practice is more valuable than a formal template.

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Fix or Improve Existing Content

Typos, clarifications, outdated info, better examples - PRs welcome, no issue needed.

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

What We Use

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

MITRE ATLAS

This threat model is built on [MITRE ATLAS](https://atlas.mitre.org/) (Adversarial Threat Landscape for AI Systems), a framework designed specifically for AI/ML threats like prompt injection, tool misuse, and agent exploitation. You don’t need to know ATLAS to contribute - we map submissions to the framework during review.

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Threat IDs

Each threat gets an ID like `T-EXEC-003`. The categories are:

| Code | Category |
| --- | --- |
| RECON | Reconnaissance - information gathering |
| ACCESS | Initial access - gaining entry |
| EXEC | Execution - running malicious actions |
| PERSIST | Persistence - maintaining access |
| EVADE | Defense evasion - avoiding detection |
| DISC | Discovery - learning about the environment |
| EXFIL | Exfiltration - stealing data |
| IMPACT | Impact - damage or disruption |

IDs are assigned by maintainers during review. You don’t need to pick one.

### 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Risk Levels

| Level | Meaning |
| --- | --- |
| **Critical** | Full system compromise, or high likelihood + critical impact |
| **High** | Significant damage likely, or medium likelihood + critical impact |
| **Medium** | Moderate risk, or low likelihood + high impact |
| **Low** | Unlikely and limited impact |

If you’re unsure about the risk level, just describe the impact and we’ll assess it.

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Review Process

1.  **Triage** - We review new submissions within 48 hours
2.  **Assessment** - We verify feasibility, assign ATLAS mapping and threat ID, validate risk level
3.  **Documentation** - We ensure everything is formatted and complete
4.  **Merge** - Added to the threat model and visualization

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Resources

-   [ATLAS Website](https://atlas.mitre.org/)
-   [ATLAS Techniques](https://atlas.mitre.org/techniques)
-   [ATLAS Case Studies](https://atlas.mitre.org/studies)
-   [OpenClaw Threat Model](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Contact

-   **Security vulnerabilities:** See our [Trust page](https://trust.openclaw.ai/) for reporting instructions
-   **Threat model questions:** Open an issue on [openclaw/trust](https://github.com/openclaw/trust/issues)
-   **General chat:** Discord #security channel

## 

[​

](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

Recognition

Contributors to the threat model are recognized in the threat model acknowledgments, release notes, and the OpenClaw security hall of fame for significant contributions.

[THREAT MODEL ATLAS](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)[Web](https://docs.openclaw.ai/web)

⌘I
