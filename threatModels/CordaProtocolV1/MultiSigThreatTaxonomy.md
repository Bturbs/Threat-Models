# Vault Signing Threats

## Threat Model for Sensitive Action Signatures

**Assumptions:**

- Secure signature algorithms (ECDSA)
- Solana signing: e.g. excludes replay attacks, nonce reuse etc
- High stakes: signatures are potent and valuable  
  - Ref: https://r3-cev.atlassian.net/wiki/spaces/RL/pages/6432817160

---

## Taxonomy of Threats (What Can Go Wrong)

- **Legitimate signer signs the wrong action**
  - Via fraud/phishing, compromised UIs
  - By mistake (overload, overconfidence)
    - Relates to mistake repudiation with insider trading
  - Facilitated by long‑lived signatures required by multisig (e.g. durable nonces)
  - Facilitated by opaque signatures  
    - E.g. hash of a script for smart contract vs “verifiable” P2PKH in Bitcoin

- **Legitimate signer signs under duress**
  - Violence menace
    - Facilitated by address/role/information disclosure
      - By hardware delivery shop
      - By company data
      - By own disclosure
  - Blackmailing

- **Key theft**
  - Stolen hardware keys
    - PIN stolen as well
    - Hardware hacking for PIN / private keys
  - Backup (24‑word seed) exfiltration
    - Via phishing

- **A signature discloses information**
  - Example: front‑running of price changes

- **Supply chain compromise of signing tools**
  - Tampered hardware wallet firmware (before delivery or via malicious update)
  - Malicious dependencies in signing software / SDKs

- **Signer collusion**
  - Bribery, shared interests, or corporate control overlap among signers
  - Legitimately meeting threshold while violating the intended trust distribution

- **Key rotation / revocation failures**
  - Departed signers retaining valid keys in the multisig set
  - No process for emergency revocation upon suspected compromise
  - Stale keys weakening the effective trust model over time

- **Stale signature context**
  - On-chain state changes between first and last signature in a multisig
  - Earlier signers authorized a different effective outcome than what executes

- **Lack of availability**
  - Non‑responsive signing process (needs to be reactive / available in a short time)
  - Targeted DoS against specific signers to block threshold or force fallback to a weaker set
  - Targeted DoS against watchtower / circuit breaker (single point of failure)

- **Upgrade‑related disclosure**
  - Upgrading a buggy program for a security fix can disclose the vulnerability before upgrading  
    - (Finalizing the upgrade: squad time‑locked signature)

---

## Taxonomy of Countermeasures (What We Can Do)

- **Multisig** (n of total potential signers)

- **Timelocked signatures + monitoring and alerting + 3rd‑party manual circuit breaker**
  - Requires an external watchtower to communicate and alert on suspicious activities
  - Redundant / anonymous watchtowers to avoid single point of failure
  - Dead man's switch: if watchtower stops heartbeating, system freezes (fail‑closed)

- **Against targeted DoS on signers**
  - Large signer pool with redundancy (n significantly larger than m)
  - No public signer identity
  - Geographic / infrastructure diversity across signers

- **Transaction simulation / human‑readable preview**
  - Signers see a decoded summary of the action before signing (counters opaque signatures)
  - Simulation of transaction effects before approval

- **Off‑chain audit trail**
  - Log proposal justification, signer communication, and approval rationale
  - Complements on‑chain transaction record for forensics and non‑repudiation

- **Threshold Signature Schemes (TSS / MPC)** (alternative to on‑chain multisig)
  - Key is sharded across parties; no single complete key ever exists (reduces key theft surface)
  - Hides signer identity, governance structure, and threshold on‑chain (counters information disclosure, targeted DoS, duress)
  - Trade‑off: loses on‑chain non‑repudiation — signers can deny participation; requires off‑chain audit trail to compensate

- **Hardware wallets**

- **Decoys**
  - Limiting the loss of an under‑duress signature

- **Compensation of risk to signers**

- **Reduce signature use cases in general**

- **Reduce signature use frequency**

- **Reduce signature impact (blast radius)**
  - Limit signature potency in contract
  - Circuit breakers
  - Limits on amounts

- **For upgrading the Vault program (non‑security fix)**
  - PDA buffer account (any researcher can see on‑chain) can work as a bug bounty when upgrading the vault  
    - Good as an incentive vs being the first exploiter

- **For upgrading Vault program (security fix)**
  - Commit (hash) and atomic reveal strategy

- **Against front‑running**
  - Do not use RPC but TPU or “jito bundles” to broadcast transactions
  - Commit hash and reveal in 2 steps
- **Against signer collusion**
  - Conflict‑of‑interest policies: signers must be independent parties with no shared ownership or financial ties
  - Geographic / jurisdictional distribution of signers
  - Higher thresholds for high‑value actions
  - Randomized signer selection from a larger pool per transaction
  - Transparency / audit trail on signing activity to increase detection risk

- **Against supply chain compromise**
  - Buy hardware wallets directly from manufacturer; verify tamper‑evident packaging and document the process (photos, attestation) against repudiation
  - Verify firmware signatures on boot and after updates
  - Use multiple hardware wallet vendors across the multisig (e.g. Ledger + Trezor + Keystone)
  - Pin and audit dependencies in custom signing tools (`cargo audit`, `npm audit`)
  - Prefer open‑source firmware wallets for auditability
  - Air‑gapped signing (QR code / SD card transfer) to eliminate remote firmware attack vectors

- **Against key rotation / revocation failures**
  - Signer succession playbooks: documented, rehearsed procedures for onboarding/offboarding signers
  - Periodic key rotation policy (e.g. annually) even without a triggering event
  - Emergency revocation procedure: pre‑agreed fast‑track process to remove a signer upon suspected compromise
  - Regular multisig membership audit: review active signers vs. actual authorized personnel
  - Automated monitoring of on‑chain multisig membership changes

- **Against stale signature context**
  - State guards in the smart contract with range checks (e.g. vault balance ≥ X, price within range Y); execution fails on‑chain if state drifted beyond bounds
  - Atomic proposal snapshots: include a hash of relevant state at proposal time in the signed payload; contract verifies at execution
  - Two‑phase signing: collect approvals against a state snapshot, then validate state hasn't materially changed before execution
  - Signature expiry: time‑bound signatures to limit the drift window
  - Monitoring + alerting during signature collection for relevant state changes

---

## References

- Solana common attack vectors:  
  https://github.com/Ackee-Blockchain/solana-common-attack-vectors