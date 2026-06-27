# Hardware Wallet Migration Plan

**Document ID:** HW-WALLET-MIGRATION-PLAN  
**Status:** DRAFT  
**Version:** 0.1  
**Threat Model Ref:** `HARDWARE_SIGNING` (NotaryProgramLifecycle)

---

## 1. Purpose

This document defines the phased migration plan from Phase 1 (software wallets) to Phase 2 (hardware-backed signing) for all Solana Notary Program multisig signers.

Phase 1 risk is explicitly accepted for the initial bootstrapping period only. Migration to Phase 2 is a security obligation and must be completed on the schedule defined in Section 3.

---

## 2. Phase Definitions

### Phase 1 — Initial Deployment (Software Wallets)

| Attribute | Value |
|-----------|-------|
| Wallet type | Phantom browser wallet |
| Key storage | Software (browser-encrypted keypair) |
| Key exportability | Keys can be exported via seed phrase |
| Endpoint requirements | Dedicated, hardened machine; no browser extensions except Phantom |
| Risk acceptance | Accepted for bootstrapping period only |
| Risk exposure | Endpoint compromise, clipboard hijacking, browser extension attacks, phishing |

### Phase 2 — Production Hardening (Hardware Wallets)

| Attribute | Value |
|-----------|-------|
| Wallet type | Ledger (Nano X / Nano S Plus) or Trezor Model T |
| Key storage | Hardware-isolated, non-exportable private key |
| Key exportability | Private key never leaves the device |
| Endpoint requirements | Air-gapped signing preferred; dedicated machine for transaction preparation |
| Risk acceptance | Full production risk posture |

---

## 3. Migration Schedule

| Milestone | Target Date | Status |
|-----------|------------|--------|
| Phase 1 deployment (software wallets enrolled) | TBD | |
| All signers hardware wallet procured | TBD (suggest: +4 weeks from Phase 1) | |
| All signers hardware wallet set up and tested | TBD (suggest: +6 weeks) | |
| All signers hardware wallet enrolled in multisig | TBD (suggest: +8 weeks) | |
| All Phase 1 software wallet keys removed from multisig | TBD (suggest: +10 weeks) | |
| Phase 2 migration complete — all keys hardware-backed | TBD | |

> Dates must be agreed and signed off by Security Lead and Platform Operations Lead. Update this table when dates are confirmed.

---

## 4. Per-Signer Migration Procedure

Each signer performs the following steps **individually** during their migration window:

### Step 1 — Procure and verify hardware wallet
- [ ] Procure hardware wallet from an official/authorised distributor (not secondhand)
- [ ] Verify device packaging integrity (tamper-evident seal intact)
- [ ] Confirm firmware version and update to latest stable release from manufacturer
- [ ] Record device type, firmware version, and serial number in the [Signer Acceptance Report](signer-acceptance-report.md)

### Step 2 — Generate new keypair on hardware wallet
- [ ] Generate new keypair directly on the hardware device (not imported from software)
- [ ] Record the derived public key (base58) — do **not** record or transmit the private key or seed phrase
- [ ] Store seed phrase backup per key custody policy (offline, physically secured, not digitally stored)

### Step 3 — Verify signing capability
- [ ] Sign a test message with the new hardware keypair
- [ ] Verify signature using an independent tool (e.g., `solana-keygen verify`)
- [ ] Confirm transaction review on hardware device screen matches the expected transaction before approving

### Step 4 — Submit for on-chain member update
- [ ] Notify Platform Operations of new public key via authenticated channel
- [ ] Platform Operations initiates Squads member update:
  - Add new hardware key as member
  - Collect ≥3 approvals
  - Execute
- [ ] Confirm new key appears in on-chain member set
- [ ] Old Phase 1 software key remains enrolled temporarily (as backup during transition)

### Step 5 — Participate in a test signing drill
- [ ] Complete at least one test signing with the new hardware device (simulate a routine proposal approval)
- [ ] Confirm Squads UI and hardware device interaction work end-to-end
- [ ] Report any issues to Platform Operations before Phase 1 key removal

### Step 6 — Remove Phase 1 software key
- [ ] Once hardware wallet is confirmed operational and enrolled:
  - Platform Operations initiates member removal of the old software public key
  - Collect ≥3 approvals; execute
  - Confirm old key is removed from on-chain member set
- [ ] Signer destroys or archives Phase 1 private key (do not retain active access to it)
- [ ] Update [Signer Registry](signer-registry.md): update key device field to "Phase 2 — Hardware wallet"
- [ ] Record key rotation in governance log

---

## 5. Migration Status Tracking

| Signer | HW procured | HW setup | New key enrolled | Test drill passed | Phase 1 key removed | Phase 2 complete |
|--------|------------|---------|-----------------|------------------|--------------------|-|
| Signer 1 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Signer 2 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Signer 3 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Signer 4 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |
| Signer 5 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] |

---

## 6. Accepted Risks (Phase 1 Only)

| Risk | Acceptance Rationale | Review Date |
|------|---------------------|-------------|
| Software wallet key exportability | Increased risk accepted for initial bootstrapping only; all hardware migration must complete before significant asset exposure | [Phase 2 completion date] |
| Endpoint compromise | Mitigated by endpoint hardening requirements; residual risk accepted | [Phase 2 completion date] |

---

## 7. Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Security Lead | | | |
| Platform Operations Lead | | | |

---

## 8. Related Documents

| Document | Location |
|----------|----------|
| Signer Onboarding Ceremony | [signer-onboarding-ceremony-runbook.md](signer-onboarding-ceremony-runbook.md) |
| Signer Acceptance Report | [signer-acceptance-report.md](signer-acceptance-report.md) |
| Signer Registry | [signer-registry.md](signer-registry.md) |
| Drill Schedule | [drill-schedule-and-report.md](drill-schedule-and-report.md) |

---

## 9. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
