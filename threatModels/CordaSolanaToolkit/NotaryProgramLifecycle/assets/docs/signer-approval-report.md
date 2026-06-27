# Signer Approval Report

**Document ID:** SIGNER-APPROVAL-REPORT-[ROUND]  
**Status:** DRAFT  
**Report Round:** [e.g. Initial / Annual Recertification YYYY / Replacement YYYY-MM]  
**Date:** YYYY-MM-DD  
**Threat Model Ref:** `SIGNER_SELECTION_REPORT` (NotaryProgramLifecycle)

---

## 1. Purpose

This report provides auditable evidence that the signer selection (or recertification) process was followed in compliance with the [Signer Selection Policy](signer-selection-policy.md).

---

## 2. Selection Round Summary

| Field | Value |
|-------|-------|
| Selection type | Initial / Annual recertification / Replacement |
| Trigger | [e.g. annual review / signer departure / key compromise] |
| Date of nomination | |
| Date of approval | |
| Reviewers | |
| Security sign-off | |

---

## 3. Candidates Considered

| Candidate | Nominated by | Outcome | Rationale |
|-----------|-------------|---------|-----------|
| | | Approved / Rejected | |
| | | Approved / Rejected | |

---

## 4. Diversity Assessment

Assess the **full proposed signer set** (not just the new candidate).

### 4.1 Geographic Locations

| Signer | Location (City / Region / Jurisdiction) |
|--------|-----------------------------------------|
| Signer 1 | |
| Signer 2 | |
| Signer 3 | |
| Signer 4 | |
| Signer 5 | |

**No quorum (≥3) in same jurisdiction?** Yes / No  
**Assessment:** [Pass / Fail — justification if fail]

### 4.2 Organisational Affiliations

| Signer | Team / Department | Reporting Line (Manager) |
|--------|--------------------|--------------------------|
| Signer 1 | | |
| Signer 2 | | |
| Signer 3 | | |
| Signer 4 | | |
| Signer 5 | | |

**No quorum sharing a management chain?** Yes / No  
**Assessment:** [Pass / Fail]

### 4.3 Overall Diversity Assessment

> [Narrative summary — e.g. "The proposed set distributes signers across 4 jurisdictions in 3 continents, with no shared management chain."]

---

## 5. Competence Verification

| Signer | Evidence Type | Evidence Reference | Verified by | Date |
|--------|--------------|-------------------|-------------|------|
| | Test signing drill | | | |
| | Wallet setup verification | | | |
| | | | | |

---

## 6. Identity Verification Records

| Signer | Verification Method | Verifiers (≥2 required) | Date |
|--------|--------------------|-----------------------|------|
| | [e.g. In-person, video call + org credentials] | | |

---

## 7. Conflict of Interest Declarations

| Signer | Declaration signed? | Declaration date | Stored location |
|--------|--------------------|-----------------|-|
| | Yes / No | | |
| | Yes / No | | |

---

## 8. Final Approved Signer Roster

| # | Signer | Public Key (base58) | Location | Role / Team | Effective Date |
|---|--------|--------------------|---------|----|---------------|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |

---

## 9. Approval Signatures

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Reviewer 1 (independent) | | | |
| Reviewer 2 (independent) | | | |
| Security Team | | | |
| Governance Authority | | | |

---

## 10. Storage and Access

- Stored in: `threatModels/CordaSolanaToolkit/NotaryProgramLifecycle/assets/docs/reports/`
- Access: Governance team, security team, auditors (on request)
- Updated when: signer set changes (addition, removal, recertification)

---

## 11. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
