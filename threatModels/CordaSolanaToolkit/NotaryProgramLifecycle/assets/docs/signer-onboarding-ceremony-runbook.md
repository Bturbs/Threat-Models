# Signer Onboarding Ceremony Runbook

**Document ID:** SIGNER-ONBOARDING-RUNBOOK  
**Status:** DRAFT  
**Version:** 0.1  
**Threat Model Ref:** `SIGNER_ONBOARDING_CEREMONY`, `OOB_CHALLENGE_SIGNATURE` (NotaryProgramLifecycle)

---

## 1. Purpose

This runbook defines the structured process for onboarding a new multisig signer into the Solana Notary Program governance (Upgrade Authority and/or Notary Admin, 3-of-5 Squads multisig).

All steps are mandatory. No step may be skipped without explicit documented risk acceptance from the Security Lead.

---

## 2. Prerequisites

Before starting, confirm:
- [ ] Candidate has been approved per the [Signer Selection Policy](signer-selection-policy.md)
- [ ] [Signer Approval Report](signer-approval-report.md) for this round is on file
- [ ] At least two verifiers are available for identity verification and challenge signature check
- [ ] On-chain Squads multisig state has been confirmed (current member count, threshold, multisig PDA address)

---

## 3. Onboarding Steps

### Step 1 — Identity Verification

**Performed by:** Two existing signers or governance authority (not the candidate)

- [ ] Verify candidate identity using a recognised method (in-person, authenticated video call + organisation credentials)
- [ ] Record verification method, verifiers involved, and date
- [ ] Store evidence reference in the [Signer Approval Report](signer-approval-report.md)

### Step 2 — Keypair Generation

**Performed by:** The candidate, unassisted

- [ ] Candidate generates a new keypair on an **approved device**:
  - Phase 1: Phantom browser wallet on a dedicated, hardened machine
  - Phase 2: Hardware wallet (Ledger / Trezor) with non-exportable private key
- [ ] Candidate confirms private key has never been exported or shared
- [ ] Candidate records the public key (base58) for submission

### Step 3 — Public Key Submission

**Performed by:** The candidate

- [ ] Candidate shares public key via an **authenticated channel** (e.g., signed message on Slack with verified identity, or directly in a recorded video call)
- [ ] Do **not** transmit public key via unauthenticated email or anonymous channels
- [ ] Receiving verifier records the submission channel and date

### Step 4 — Out-of-Band Challenge Signature Verification

**Performed by:** Lead verifier + candidate

> Prevents key substitution attacks during the onboarding flow.

- [ ] Lead verifier generates a fresh random challenge message (e.g., UUID or timestamp-prefixed string)
- [ ] Lead verifier sends challenge to candidate via a **separate, authenticated channel** from Step 3
- [ ] Candidate signs the challenge with the submitted public key and returns the signature
- [ ] Lead verifier confirms signature is valid against the submitted public key
- [ ] Record: challenge message, signature, verification result, verifier, date

### Step 5 — Conflict of Interest and Acceptance

**Performed by:** Candidate

- [ ] Candidate completes the [Signer Acceptance Report](signer-acceptance-report.md) (including conflict of interest declaration and availability SLA)
- [ ] Two verifiers countersign the acceptance document
- [ ] Acceptance document stored in `assets/docs/signers/SIGNER-ACCEPTANCE-[ID].md`

### Step 6 — Two-Person Review and Approval

**Performed by:** Two independent reviewers (not the candidate)

- [ ] Reviewers confirm all prior steps are complete and documented
- [ ] Reviewers confirm diversity requirements are still satisfied with the new signer added (see [Signer Registry](signer-registry.md))
- [ ] Both reviewers sign off in the [Signer Approval Report](signer-approval-report.md)

### Step 7 — On-Chain Member Update

**Performed by:** Platform Operations (requires existing quorum to execute)

- [ ] Prepare multisig member update transaction per Squads SDK (`multisig.rpc.configTransactionCreate` with `AddMember` action)
- [ ] Submit transaction for co-signing via standard Squads proposal flow
- [ ] Collect ≥3 approvals from existing signers (before new member is added)
- [ ] Execute transaction on-chain
- [ ] Record transaction signature in governance log

### Step 8 — Post-Update On-Chain Verification

**Performed by:** Platform Operations + one independent verifier

- [ ] Fetch on-chain multisig account state for the multisig PDA
- [ ] Confirm:
  - [ ] New member public key appears in member set
  - [ ] Threshold remains 3-of-5
  - [ ] Total member count is as expected (e.g., 5 or 6 during transition)
  - [ ] No other unintended changes to member set or config
- [ ] Record verification result and verifier in governance log

### Step 9 — Signer Registry Update

**Performed by:** Platform Operations

- [ ] Add new signer to [Signer Registry](signer-registry.md) with all required fields
- [ ] Update diversity status table
- [ ] Update signer change log entry

---

## 4. Checklist Summary

| # | Step | Owner | Complete |
|---|------|-------|----------|
| 1 | Identity verification | Two verifiers | [ ] |
| 2 | Keypair generation on approved device | Candidate | [ ] |
| 3 | Public key submission via authenticated channel | Candidate | [ ] |
| 4 | OOB challenge signature verification | Lead verifier + candidate | [ ] |
| 5 | Acceptance report completed and signed | Candidate + verifiers | [ ] |
| 6 | Two-person review and approval | Two independent reviewers | [ ] |
| 7 | On-chain member update executed | Platform Operations | [ ] |
| 8 | Post-update on-chain verification | Platform Ops + verifier | [ ] |
| 9 | Signer registry updated | Platform Operations | [ ] |

---

## 5. Related Documents

| Document | Location |
|----------|----------|
| Signer Selection Policy | [signer-selection-policy.md](signer-selection-policy.md) |
| Signer Approval Report | [signer-approval-report.md](signer-approval-report.md) |
| Signer Acceptance Report | [signer-acceptance-report.md](signer-acceptance-report.md) |
| Signer Registry | [signer-registry.md](signer-registry.md) |
| Hardware Wallet Migration Plan | [hardware-wallet-migration-plan.md](hardware-wallet-migration-plan.md) |

---

## 6. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
