# Signer Registry

**Document ID:** SIGNER-REGISTRY  
**Status:** DRAFT  
**Last Updated:** YYYY-MM-DD  
**Threat Model Ref:** `SIGNER_ONBOARDING_CEREMONY`, `SIGNER_ACCEPTANCE` (NotaryProgramLifecycle)

> **Living document.** Must be updated whenever the signer set changes (addition, removal, key rotation, recertification).

---

## 1. Active Signer Set

### Upgrade Authority Multisig (3-of-5)

| # | Signer | Public Key (base58) | Location | Team | Key Device | Enrolled Date | Acceptance Doc | Status |
|---|--------|--------------------|---------|----|-----------|--------------|---------------|--------|
| 1 | | | | | Phase 1 / Phase 2 | | [SIGNER-ACCEPTANCE-1](signers/) | Active |
| 2 | | | | | | | | Active |
| 3 | | | | | | | | Active |
| 4 | | | | | | | | Active |
| 5 | | | | | | | | Active |

### Notary Admin Multisig (3-of-5)

| # | Signer | Public Key (base58) | Location | Team | Key Device | Enrolled Date | Acceptance Doc | Status |
|---|--------|--------------------|---------|----|-----------|--------------|---------------|--------|
| 1 | | | | | | | | Active |
| 2 | | | | | | | | Active |
| 3 | | | | | | | | Active |
| 4 | | | | | | | | Active |
| 5 | | | | | | | | Active |

> Note: The same individual may hold signing authority on both multisigs. In this case, their diversity contribution counts once for both.

---

## 2. Diversity Status

| Check | Status | Notes |
|-------|--------|-------|
| ≥ 3 distinct geographic regions | Pass / Fail | |
| No quorum (≥3) in same jurisdiction | Pass / Fail | |
| No quorum sharing management chain | Pass / Fail | |
| All signers have signed acceptance docs | Pass / Fail | |
| All acceptance docs current (not expired) | Pass / Fail | |

---

## 3. Signer Change Log

| Date | Change type | Signer | Reason | Approved by | Approval Report Ref |
|------|------------|--------|--------|-------------|---------------------|
| | Addition | | | | |
| | Removal | | | | |
| | Key rotation | | | | |
| | Recertification | | | | |

---

## 4. Retired Signers

| Signer | Public Key (base58) | Enrolled | Retired | Reason | Replacement |
|--------|--------------------|---------|----|--------|-------------|
| | | | | | |

---

## 5. Emergency Contacts

> For out-of-band signer coordination (do not store sensitive credentials here).

| Signer | Primary Channel | Secondary Channel | Escalation Contact |
|--------|----------------|------------------|--------------------|
| | | | |

---

## 6. Document References

| Document | Location |
|----------|----------|
| Signer Selection Policy | [signer-selection-policy.md](signer-selection-policy.md) |
| Signer Approval Reports | [signer-approval-report.md](signer-approval-report.md) |
| Signer Acceptance Reports | `assets/docs/signers/` |
| Onboarding Ceremony Runbook | [signer-onboarding-ceremony-runbook.md](signer-onboarding-ceremony-runbook.md) |
| Succession Playbook | [signer-succession-playbook.md](signer-succession-playbook.md) |

---

## 7. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
