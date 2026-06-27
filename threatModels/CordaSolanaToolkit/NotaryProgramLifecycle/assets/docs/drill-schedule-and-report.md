# Signing Drill Schedule and Report Template

**Document ID:** DRILL-SCHEDULE  
**Status:** DRAFT  
**Version:** 0.1  
**Threat Model Ref:** `DRILLS` (NotaryProgramLifecycle)

---

## 1. Purpose

This document defines the schedule and reporting template for regular signing drills to verify operational readiness of the Solana Notary Program multisig governance.

Drills must be run **at least quarterly**. Each drill must be logged using the report template in Section 4.

---

## 2. Drill Types

| Type | Description | Frequency |
|------|-------------|----------|
| **Liveness drill** | Simulate signer unavailability; measure time to quorum under degraded conditions | Quarterly |
| **Signing ceremony drill** | Full end-to-end rehearsal of a privileged operation (no-op upgrade or test admin instruction) | Quarterly |
| **Break-glass drill** | Simulate emergency quorum scenario using [Break-Glass Runbook](break-glass-runbook.md) | Semi-annually |
| **Succession drill** | Simulate planned departure scenario using [Succession Playbook](signer-succession-playbook.md) | Annually |

---

## 3. Drill Schedule

> Update this table when drills are scheduled or completed.

| Drill ID | Type | Scheduled Date | Actual Date | Lead | Status | Report |
|----------|------|---------------|------------|------|--------|--------|
| DRILL-2026-Q1-LIVENESS | Liveness | | | | Planned | |
| DRILL-2026-Q1-CEREMONY | Signing ceremony | | | | Planned | |
| DRILL-2026-Q2-LIVENESS | Liveness | | | | Planned | |
| DRILL-2026-Q2-CEREMONY | Signing ceremony | | | | Planned | |
| DRILL-2026-H1-BREAKGLASS | Break-glass | | | | Planned | |
| DRILL-2026-Q3-LIVENESS | Liveness | | | | Planned | |
| DRILL-2026-Q3-CEREMONY | Signing ceremony | | | | Planned | |
| DRILL-2026-Q4-LIVENESS | Liveness | | | | Planned | |
| DRILL-2026-Q4-CEREMONY | Signing ceremony | | | | Planned | |
| DRILL-2026-H2-BREAKGLASS | Break-glass | | | | Planned | |
| DRILL-2026-ANNUAL-SUCCESSION | Succession | | | | Planned | |

---

## 4. Drill Report Template

> Copy and complete one instance per drill run. Store completed reports in `assets/docs/drills/`.

---

### Drill Report: [DRILL-ID]

**Drill type:** Liveness / Signing ceremony / Break-glass / Succession  
**Date:** YYYY-MM-DD  
**Lead:** [Name]  
**Participants:**

| Signer | Present | Response channel | Notes |
|--------|---------|-----------------|-------|
| | Yes / No | | |
| | Yes / No | | |
| | Yes / No | | |
| | Yes / No | | |
| | Yes / No | | |

---

#### Timing Metrics

| Metric | Target | Actual | Pass / Fail |
|--------|--------|--------|------------|
| Time to first signer response | ≤ 15 min | | |
| Time to quorum (3 approvals) | ≤ 60 min (routine) / ≤ 30 min (emergency) | | |
| Communication channel reliability | All channels reachable | | |

---

#### Scenario Description

> [Describe what was simulated — e.g., "Signer 3 and Signer 5 declared unavailable. Remaining signers assembled to approve a test no-op upgrade proposal."]

---

#### Observations and Issues

> [Note any tooling issues, communication failures, procedural gaps, or confusion encountered during the drill.]

| # | Issue observed | Severity (High/Med/Low) | Owner | Resolution |
|---|---------------|------------------------|-------|-----------|
| | | | | |

---

#### Backup Device Verification (if applicable)

| Signer | Backup device tested? | Device type | Result |
|--------|----------------------|-------------|--------|
| | Yes / No | | Pass / Fail |

---

#### Lessons Learned and Procedure Updates

> [List any updates made or recommended to runbooks, policies, or tooling as a result of this drill.]

| Update | Document | Status |
|--------|----------|--------|
| | | Pending / Done |

---

#### Sign-Off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Drill lead | | | |
| Security reviewer | | | |

---

## 5. Related Documents

| Document | Location |
|----------|----------|
| Break-Glass Runbook | [break-glass-runbook.md](break-glass-runbook.md) |
| Signer Succession Playbook | [signer-succession-playbook.md](signer-succession-playbook.md) |
| Signer Registry | [signer-registry.md](signer-registry.md) |
| Hardware Wallet Migration Plan | [hardware-wallet-migration-plan.md](hardware-wallet-migration-plan.md) |

---

## 6. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
