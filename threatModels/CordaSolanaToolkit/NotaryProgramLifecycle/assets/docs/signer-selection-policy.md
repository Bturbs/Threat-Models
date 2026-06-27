# Signer Selection Policy

**Document ID:** SIGNER-SELECTION-POLICY  
**Status:** DRAFT  
**Version:** 0.1  
**Threat Model Ref:** `SIGNER_SELECTION_RULES` (NotaryProgramLifecycle)

---

## 1. Purpose

This policy defines the mandatory criteria, approval process, and periodic recertification requirements for selecting and retaining signers in the Solana Notary Program multisig (Upgrade Authority and Notary Admin, 3-of-5 threshold via Squads).

---

## 2. Scope

Applies to all individuals who hold signing authority in either:
- **Upgrade Authority multisig** — authorises program upgrade operations
- **Notary Admin multisig** — authorises authorize/revoke notary operations

---

## 3. Mandatory Selection Criteria

A candidate must satisfy **all** of the following:

| # | Criterion | Description |
|---|-----------|-------------|
| 1 | **Geographic diversity** | No quorum (≥3) of signers may reside in the same jurisdiction or physical location |
| 2 | **Organisational independence** | No quorum of signers may share the same management chain or team |
| 3 | **Technical competence** | Demonstrated ability to operate signing tools: wallet setup, transaction review, key backup and recovery procedures |
| 4 | **Operational availability** | Committed SLA: ≤4 hours for routine operations; ≤1 hour for declared emergencies |
| 5 | **Identity verification** | Identity verified by at least two existing signers or the governance authority |
| 6 | **Conflict of interest disclosure** | Signed declaration of no undisclosed relationships with other signers (see Section 7) |
| 7 | **Key custody commitment** | Acceptance of hardware wallet migration timeline and custody responsibilities |

---

## 4. Nomination and Approval Process

1. **Nomination** — Any governance team member may nominate a candidate with documented justification addressing all criteria in Section 3.
2. **Independent review** — At least two independent reviewers (neither of whom is the nominee) must assess the nomination.
3. **Security sign-off** — Security team must approve the diversity and competence assessment.
4. **Approval record** — Approval (or rejection with rationale) must be stored in the governance log with reviewer signatures and date.
5. **Onboarding** — Approved candidate proceeds through the [Signer Onboarding Ceremony](signer-onboarding-ceremony-runbook.md).

---

## 5. Current Signer Set Composition Requirements

At all times the full signer set must satisfy:
- ≥5 active signers enrolled (to maintain 3-of-5 quorum headroom)
- Signers distributed across ≥3 distinct geographic regions
- No more than 1 signer per management chain reporting line

---

## 6. Periodic Recertification

| Trigger | Action |
|---------|--------|
| Annually (at minimum) | Full review of all signer eligibility against criteria in Section 3 |
| Organisational change affecting any signer | Immediate reassessment of affected signer(s) |
| Signer departure or key compromise | Immediate succession process (see [Succession Playbook](signer-succession-playbook.md)) |

Recertification outcome must be recorded in the governance log and a new [Signer Approval Report](signer-approval-report.md) produced.

---

## 7. Conflict of Interest Declaration

Each signer must declare:
- No undisclosed financial relationships with other signers
- No shared household, employer, or controlling entity with another signer
- No current or pending legal proceedings that could create a conflict

Declaration must be signed and retained in the [Signer Registry](signer-registry.md).

---

## 8. Policy Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Security Lead | | | |
| Platform Operations Lead | | | |
| Governance Authority | | | |

---

## 9. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | DRAFT | | Initial draft |
