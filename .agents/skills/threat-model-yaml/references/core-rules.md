# Core Threat Model YAML Rules

Read this reference before creating or materially editing threat-model YAML.

## Methodology

Use the four fundamental questions:

1. What are we building?
2. What can go wrong?
3. What are we doing about it?
4. Are we doing a good job?

Focus on semantics over terminology. Risk, bug, vulnerability, threat, and attack all mean "something that can go wrong." Countermeasure, mitigation, and control all mean "something we do about something that can go wrong."

## Scope

Threat-model scope must focus on what the team is building, not everything they use.

| Reframed question | In scope when | Out of scope when |
| --- | --- | --- |
| Are we building the infrastructure? | Team creates Terraform, Helm, Kubernetes manifests, or equivalent | Team uses vendor-managed infrastructure without owning configuration |
| Are we building the build pipeline? | Team creates or owns the pipeline | Pipeline is externally managed |
| Are we building imported libraries? | Import selection, version choice, and usage patterns | Library internals |
| Are we building crypto algorithms? | Implementation, key management, configuration | Algorithm design |

## Document-Level Attribute Order

Main YAML attributes must appear in this order:

1. `ID`
2. `schemaVersion: 2`
3. `title`
4. `version`
5. `status`
6. `children`
7. `authors`
8. `parent`
9. `scope`
10. `analysis`
11. `threats`

`status` and `children` are optional. Use `parent` only for child models.

## Scope Contents

Define scope-level items before threats reference them.

### Security Objectives

Always include confidentiality, integrity, and availability as foundational objectives unless an existing parent model already supplies equivalent objectives.

Useful fields:

- `ID`: Uppercase with underscores.
- `title`: Human-readable title.
- `description`: Objective detail.
- `group`: Category such as "Data Security" or "System Integrity".
- `treeImage`: Boolean flag for attack tree diagrams.
- `contributesTo`: `REFID` links to higher-level objectives.

Threats reference objectives with `impactedSecObj`.

### Assets

Assets represent the decomposition of what is being built and the relevant dataflows.

Every asset must have:

- `ID`
- `type`
- `title`
- `inScope`

Allowed asset `type` values:

- `system`: Software components, services, applications.
- `data`: Stored information, databases, files.
- `dataflow`: Communication channels, network connections, API calls.
- `credential`: Keys, tokens, passwords, certificates.
- `endpoint`: API endpoints, network interfaces, ports.

Use `specifies` to show specialization or refinement of another asset.

Prefer `credential` for secrets and keys when possible. Add concrete credential properties when known, such as location, format, public key length, or private key length.

External assets are usually out of scope. Dataflows to an external asset can be in scope even when the external asset itself is not.

### Attackers

List plausible threat agents with clear boundaries. Include both in-scope and out-of-scope attackers where relevant.

Attacker fields:

- `ID`: Uppercase with underscores.
- `title`: Human-readable title.
- `description`: Capabilities and motivation.
- `inScope`: Boolean.

Threats must reference pre-defined attackers with `REFID`.

## Threat Semantics

Do not use a generic `description` field for threats.

Use:

- `attack`: How exploitation works, including process, difficulty, prerequisites, and likelihood-relevant detail.
- `impactDesc`: What happens if exploitation succeeds.
- `impactedSecObj`: Formal impact references to security objectives.

`impactDesc` and `impactedSecObj` may both be present when the narrative adds useful detail.

## Threat Field Order

Fields within each threat must appear in this order:

1. `ID`
2. `title`
3. `attack`
4. `threatType`
5. `impactDesc`
6. `impactedSecObj`
7. `attackers`
8. `assets`
9. `CVSS`
10. `pentestTestable`
11. `fullyMitigated`
12. `countermeasures`

`attackers`, `assets`, and `pentestTestable` are optional. `countermeasures` must be last.

## STRIDE Values

`threatType` must use STRIDE values:

- `Spoofing`
- `Tampering`
- `Repudiation`
- `Information Disclosure`
- `Denial of Service`
- `Elevation of Privilege`

Multiple values may be comma-separated, such as:

```yaml
threatType: Tampering, Information Disclosure
```

Do not use non-STRIDE values such as `Insecure Design`, `Misconfiguration`, or `Supply Chain`. Map those concepts to the closest STRIDE category based on primary impact.

## Title and ID Style

Threat titles should be human-readable. Use sentence case or conventional title case, and preserve acronyms such as `JWT`, `TLS`, `DoS`, or `SQL`.

IDs must be uppercase with underscores, unique within the model, memorable, and descriptive. Avoid generic IDs such as `THREAT_001`.

Good threat IDs sound like something that can go wrong:

- `SQL_INJECTION`
- `KEY_COMPROMISE`
- `REQUEST_REPUDIATION`

## CVSS

Use `vector`, never `base`.

```yaml
CVSS:
  vector: 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N'
```

Risk level comes from impact and likelihood:

- Impact narrative: `impactDesc`
- Impact vector: CVSS confidentiality, integrity, availability values
- Likelihood narrative: `attack`
- Likelihood vector: CVSS attack vector, complexity, privileges, and user interaction values

## Countermeasures

Allowed countermeasure fields:

- `ID`
- `title`
- `description`
- `inPlace`
- `public`
- `operational`
- `operator`

Use `description`, not `details`.

Always provide `operator` when `operational: true`.

`fullyMitigated: true` means selected countermeasures are in place and effective enough to address the threat. `fullyMitigated: false` means mitigation is missing or incomplete; that residual gap is the risk.

## REFID References

Use `REFID` for cross-references.

```yaml
impactedSecObj:
  - REFID: DATA_CONFIDENTIALITY
attackers:
  - REFID: EXTERNAL_ATTACKER
assets:
  - REFID: DATABASE_SERVER
```

Referenced attackers, security objectives, and local assets must be defined in `scope` before being referenced. In child models, threats may also reference parent-defined items.

## Markdown in YAML Strings

Lists in multiline YAML strings must have blank lines before and after.

```yaml
impactDesc: |
  The attacker can perform these actions:

  - Steal credentials
  - Modify data

  This leads to compromise.
```

Do not use markdown heading markers such as `#`, `##`, or `###` inside multiline YAML fields. Use bold labels instead.

```yaml
analysis: |
  **Glossary**

  - **NAV**: Net Asset Value.
```

## PlantUML Diagrams

When generating `.puml` diagrams inside `assets/img/`, reference them as `.svg` in YAML fields and Markdown content, such as `img/MyDiagram.svg`. A separate build process converts `.puml` files to `.svg`.

For information-flow sequence diagrams, use the selection and verification rules in [sequence-diagrams.md](sequence-diagrams.md).

## Final Checklist

Before finalizing a model, confirm:

- Attributes follow the required order.
- All `REFID` references resolve.
- `countermeasures` is last in each threat.
- Security objectives include CIA foundations or reuse parent equivalents.
- Assets have explicit `type` and `inScope`.
- Attackers are clearly marked `inScope: true` or `inScope: false`.
- Threats use `attack` and `impactDesc`, not generic threat `description`.
- `CVSS` uses `vector`.
- Markdown lists have blank lines before and after.
- Scope follows "Are we building it?"
- `fullyMitigated` reflects actual countermeasure coverage.
- Case-sensitive child folder names, YAML filenames, and `ID` values match.
- Verification was run against the root YAML or a clear reason was reported.
