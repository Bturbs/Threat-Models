# Signer Availability SLA and Acceptance Report

**Document ID:** SIGNER-ACCEPTANCE-[SIGNER-ID]  
**Status:** DRAFT  
**Signer Name:** [Full name]  
**Date:** YYYY-MM-DD  
**Threat Model Ref:** `SIGNER_ACCEPTANCE` (NotaryProgramLifecycle)

> **One copy of this document must be completed, signed, and retained per signer.**  
> Acceptance must be renewed upon key rotation or role change.

---

## 1. Signer Identity

| Field | Value |
|-------|-------|
| Full name | |
| Organisation / Team | |
| Role / Title | |
| Geographic location (City / Country) | |
| Contact email | |
| Emergency contact (for out-of-band coordination) | |
| Public key (base58) | |
| Key storage device | Phase 1: Software wallet (Phantom) / Phase 2: Hardware wallet (Ledger / Trezor) |
| Device identifier / serial (for hardware wallet) | |

---

## 2. Availability SLA Commitments

By signing this document, the signer commits to the following response times:

| Operation type | Maximum response time | Notes |
|---------------|----------------------|-------|
| Routine privileged operation | ≤ 4 hours | Business-hours expectation |
| Declared emergency operation | ≤ 1 hour | 24/7 obligation |
| Signing drill participation | As scheduled | See [Drill Schedule](drill-schedule-and-report.md) |

**Communication channels for signing coordination:**
- Primary: [e.g. Slack channel / Signal group]
- Secondary (out-of-band): [e.g. phone / Signal direct]
- Escalation if unreachable: [contact]

---

## 3. Responsibility Acceptance

The undersigned signer confirms acceptance of the following responsibilities:

### 3.1 Key Custody Obligations
- [ ] Private key is stored securely and never shared with any other party
- [ ] Hardware wallet migration will be completed by the deadline specified in the [Hardware Wallet Migration Plan](hardware-wallet-migration-plan.md) (Phase 2 deadline: TBD)
- [ ] Key backup and recovery procedures are understood and followed
- [ ] Any suspected compromise will be reported immediately to the governance team

### 3.2 Availability and Operational Commitments
- [ ] SLA response times in Section 2 are accepted and will be maintained
- [ ] Any change to availability (travel, leave, role change) will be communicated to the governance team with ≥48 hours notice where possible
- [ ] Participation in all scheduled drills per the [Drill Schedule](drill-schedule-and-report.md)

### 3.3 Succession Obligations
- [ ] Will cooperate fully with the replacement process if departing, including orderly key handover and onboarding of a new signer
- [ ] Will not exit the signer role without governance team confirmation that quorum is maintained

### 3.4 Signing Operations
- [ ] Will only approve proposals that have been independently reviewed and are clearly legitimate
- [ ] Will reject any proposal that cannot be verified against a documented request or change record
- [ ] Understands and accepts the break-glass process (see [Break-Glass Runbook](break-glass-runbook.md))
- [ ] Will maintain confidentiality of signing operations and proposal details

### 3.5 Incident Reporting
- [ ] Will report any suspected compromise of signing key or device immediately to [security contact]
- [ ] Will report any social engineering, bribery, or coercion attempts immediately

### 3.6 Recertification
- [ ] Will cooperate with annual recertification per the [Signer Selection Policy](signer-selection-policy.md)
- [ ] Understands that eligibility may be reassessed at any time upon organisational change

---

## 4. Geographic and Organisational Independence Declaration

I confirm that at the time of signing:

| Statement | Confirmed |
|-----------|-----------|
| My location is as stated in Section 1 | Yes / No |
| I do not share a household with another signer | Yes / No |
| I do not share a direct management chain with another signer up to [level] | Yes / No |
| I have declared all potential conflicts of interest in Section 5 | Yes / No |

---

## 5. Conflict of Interest Declaration

> Disclose any relationships with other signers or with the platform operations team that could create a conflict of interest (financial, organisational, personal).

[ ] I have no conflicts of interest to declare.

[ ] I declare the following (attach additional sheet if needed):

```
[Conflict description, if any]
```

---

## 6. Signer Signature

| Field | Value |
|-------|-------|
| Signer name | |
| Signature | |
| Date | |

---

## 7. Verifier Signatures (≥ 2 required)

| Verifier | Name | Role | Signature | Date |
|----------|------|------|-----------|------|
| Verifier 1 | | | | |
| Verifier 2 | | | | |

---

## 8. Renewal Record

| Renewal trigger | Date | Key rotation? | Notes |
|----------------|------|--------------|-------|
| Initial acceptance | | N/A | |
| | | | |

---

## 9. Storage

Stored in: `threatModels/CordaSolanaToolkit/NotaryProgramLifecycle/assets/docs/signers/`  
Referenced in: [Signer Registry](signer-registry.md)
