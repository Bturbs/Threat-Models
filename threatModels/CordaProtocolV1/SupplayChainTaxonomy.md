Assumptions: 
    - Compromised PCs
    - Compromised CI/CD

Threats:
    - Compromised PC shows fake UI and let users sign malicious TXs
        - Countermeaure1: No UI, sign with scrips when possible
        - Use a more trusted device for signing (e.g. iphone or android or full dedicated specialized device AND hardware wallet)

Mitigations:
    - Sepatared CI/CD for prod.
        - Deterministic builds
    - out of band (not same UI) TX simulations AND full TXID checks training for signers.

---

## Monitoring & Audit (not yet in TM YAML — tracked as notes)

### Dependency Update Monitoring
- Automated alerts for new CVEs in used dependencies (Snyk/Dependabot continuous monitoring)
- Currently Snyk only on corda-solana-toolkit — extend to all repos

### Build Audit Trail
- Immutable logs of all builds: who triggered, what source hash, what artifacts produced
- Jenkins has logs but no formal provenance metadata (SLSA attestation)
- Build provenance should link: source commit → builder identity → artifact hash

### GitHub Audit Log Monitoring
- Alert on: branch protection changes, new collaborators, deploy key additions, webhook modifications
- Monitor: CODEOWNERS file changes, org-level permission changes

### Container Runtime Monitoring
- Detect anomalous behavior in deployed containers (unexpected processes, network connections)
- Consider: Falco, Sysdig, or cloud-native equivalents on Azure Container Apps

### Incident Response Playbook (Supply Chain)
- Documented procedure for supply chain compromise:
  - How to identify which builds/artifacts are affected
  - How to quarantine compromised artifacts from registries
  - How to roll back to last known-good artifact
  - Communication plan for downstream consumers
  - Credential rotation checklist (which secrets to rotate)

### Pipeline Activity Anomaly Detection
- Alert on unusual Jenkins activity: builds at odd hours, builds by unusual users, builds with modified Jenkinsfile
- Monitor Azure Container Registry: unexpected image pushes, tag overwrites, new repositories

### ISO 27001 Evidence Collection
- A.8.25 (Secure development lifecycle) — need build provenance + SBOM as audit evidence
- A.8.8 (Management of technical vulnerabilities) — need scanning reports for all repos
- A.5.21 (ICT supply chain) — need dependency inventory + risk assessment
- A.8.31 (Separation of environments) — need evidence of separated prod pipeline

