# Signer Succession Playbook

**Document ID:** SIGNER-SUCCESSION-PLAYBOOK  
**Status:** DRAFT  
**Version:** 0.1  
**Threat Model Ref:** `SUCCESSION_PLAN_FOR_SIGNERS` (NotaryProgramLifecycle)

---

## 1. Purpose

This playbook defines the procedures for replacing, offboarding, or recovering signers in the Solana Notary Program multisig (Upgrade Authority and Notary Admin, 3-of-5 Squads).

**Critical constraint:** Quorum must be maintained at all times. The active signer count must never fall below the threshold (3) during any transition.

---

## 2. Succession Scenarios

| Scenario | Section |
|----------|---------|
| Planned departure (voluntary offboarding) | Section 3 |
| Emergency replacement (compromise or sudden unavailability) | Section 4 |
| Key loss or device failure (key unrecoverable) | Section 5 |

---

## 3. Planned Departure

> Use when a signer gives advance notice of departure (role change, leaving organisation, etc.).

**Trigger:** Signer notifies governance team with ≥14 days notice (preferred).

### Step 1 — Identify and onboard replacement
- [ ] Initiate candidate selection per [Signer Selection Policy](signer-selection-policy.md)
- [ ] Complete full [Onboarding Ceremony](signer-onboarding-ceremony-runbook.md) for the replacement candidate
- [ ] **Do not remove departing signer until replacement is enrolled** — maintain headcount ≥5

### Step 2 — Confirm diversity still satisfied
- [ ] Verify [Signer Registry](signer-registry.md) diversity table with both old and new member present, then with old member removed

### Step 3 — Execute signer removal on-chain
- [ ] Prepare member removal transaction (`RemoveMember` action in Squads config transaction)
- [ ] Two-person review of transaction before submission
- [ ] Collect ≥3 approvals from **remaining active signers (excluding departing signer)**
- [ ] Execute on-chain; record transaction signature in governance log

### Step 4 — Post-removal verification
- [ ] Confirm on-chain member set no longer contains the retired public key
- [ ] Confirm threshold remains 3-of-5
- [ ] Update [Signer Registry](signer-registry.md): move signer to retired section
- [ ] Departing signer destroys or archives private key per key custody policy

### Step 5 — Records
- [ ] Record departure in governance log with reason and date
- [ ] Update [Signer Approval Report](signer-approval-report.md) for this recertification round

---

## 4. Emergency Replacement

> Use when a signer becomes suddenly unavailable (illness, accident, unreachability) or is suspected of compromise.

**Trigger:** Governance team declares a signer unusable or unreliable.

### Step 1 — Immediate assessment
- [ ] Confirm the signer is genuinely unavailable or compromised (not a false alarm)
- [ ] Assess whether quorum (3 of remaining signers) is still reachable

### Step 2 — Decide: proceed with reduced set or pause operations
- If 3 or more signers remain functional: operations can continue; proceed to replacement
- If fewer than 3: **halt non-emergency privileged operations** and immediately prioritise replacement

### Step 3 — Expedited candidate selection and onboarding
- [ ] Invoke expedited selection: single reviewer + Security Lead sign-off (vs. two independent reviewers for routine)
- [ ] Document risk acceptance for expedited process in governance log
- [ ] Complete [Onboarding Ceremony](signer-onboarding-ceremony-runbook.md) — all steps remain mandatory; timeline is compressed

### Step 4 — Revoke compromised/unavailable signer
- [ ] If key compromise is suspected: treat as active security incident; notify all other signers immediately
- [ ] Remove the affected signer's public key via on-chain member removal (same flow as Section 3, Step 3)
- [ ] If signer is unreachable for removal approval: proceed with remaining quorum — their key will be removed by the other 3

### Step 5 — Post-replacement review
- [ ] Full post-incident review within 48 hours of resolution
- [ ] Assess root cause of unavailability or compromise
- [ ] Update playbook if gaps identified

---

## 5. Key Loss or Device Failure

> Use when a signer's private key is permanently unrecoverable (device destroyed, stolen, or failed without backup).

**Trigger:** Signer confirms key is unrecoverable.

### Step 1 — Confirm key is unrecoverable
- [ ] Signer exhausts all backup/recovery options (backup device, seed phrase)
- [ ] Signer formally declares key loss to governance team

### Step 2 — Treat as implicit compromise
- [ ] Assume worst case: key may be in adversary's hands
- [ ] Follow emergency replacement flow (Section 4) from Step 3 onwards
- [ ] Remove the lost key's public key from the multisig as a priority

### Step 3 — Update governance log
- [ ] Record key loss event: signer identity, date, circumstances, confirmation of recovery failure
- [ ] Note: if key loss is suspicious (e.g., device theft), escalate to security incident process

---

## 6. Role Handover Controls

To prevent a single person from both removing and adding a signer unilaterally:
- Removal and addition must have **independent two-person approval** on each action
- The same reviewer may not approve both the removal and the addition of a signer in the same round
- Security Lead must sign off on any deviation from this rule

---

## 7. Periodic Validation

- [ ] Review this playbook at least **annually** and after every actual signer change
- [ ] Run a succession drill as part of the [Drill Schedule](drill-schedule-and-report.md) (at a minimum, simulate planned departure scenario)
- [ ] Verify all backup devices are operational and enrolled during drills

---

## 8. Related Documents

| Document | Location |
|----------|----------|
| Signer Selection Policy | [signer-selection-policy.md](signer-selection-policy.md) |
| Signer Onboarding Ceremony | [signer-onboarding-ceremony-runbook.md](signer-onboarding-ceremony-runbook.md) |
| Break-Glass Runbook | [break-glass-runbook.md](break-glass-runbook.md) |
| Signer Registry | [signer-registry.md](signer-registry.md) |
| Drill Schedule | [drill-schedule-and-report.md](drill-schedule-and-report.md) |

---

## 9. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
