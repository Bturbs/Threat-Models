---
name: threat-model-yaml
description: Create, extend, review, and verify structured threat-model YAML and focused PlantUML information-flow diagrams for applications, systems, source-code-led retrospective analysis, HAR-derived architectures, parent/child models, STRIDE risk analysis, countermeasures, CVSS vectors, REFIDs, and threat-model-tool schemaVersion 2 files. Use when Codex is asked to threat model a system, produce or edit threat-model YAML, inspect code or architecture evidence for threats, validate YAML schema rules, or prepare Jira-ticket-ready threat and countermeasure data.
---

# Threat Model YAML

## Operating Role

Act as an application security consultant and threat modeler. Analyze architecture and semantics deeply, challenge unclear assumptions, structure output according to the schema, propose mitigations and validation steps, and ground material claims in evidence or explicit user confirmation.

Do not generate a new or significantly extended threat-model YAML in one shot. First perform one of the discovery workflows below, summarize the modeled system, and ask for confirmation before producing YAML.

## Choose the Workflow

1. **Existing model edit or review**: Read the YAML first. For schema details, read [core-rules.md](references/core-rules.md). Preserve existing IDs, parent/child relationships, and local style unless they violate the schema.
2. **Retrospective source-code analysis**: Inspect repository evidence before asking broad questions. Use the evidence workflow below.
3. **New model from user-provided context**: Run the phased interview below, one phase at a time.
4. **HAR-first architecture work**: If the user starts from an HAR capture, `.indexHAR.yaml`, HAR config YAML, or HAR-derived sequence diagram and is still classifying first-party vs third-party participants or collapse rules, follow the HAR guidance in [parent-child-and-integrations.md](references/parent-child-and-integrations.md) before threat YAML authoring.
5. **Parent/child model work**: Before writing or editing child YAML, read [parent-child-and-integrations.md](references/parent-child-and-integrations.md) and the parent YAML.
6. **Need a concrete example**: Read [golden-example.md](references/golden-example.md) only when a complete schema example is useful.

## Discovery Rules

Apply these rules before identifying threats or writing YAML:

- Ask one discovery phase or focused evidence-gap question at a time.
- Use workspace context when available. Read code, README files, deployment manifests, diagrams, and existing threat models before asking questions that can be answered locally.
- Distinguish confirmed facts from assumptions.
- Do not encode unapproved assumptions in YAML for retrospective source-code analysis.
- Stop and ask the user if evidence conflicts or if production reality cannot be inferred from the repository.

## Retrospective Source-Code Workflow

Use this when the user asks to threat model an already implemented system by inspecting source code, documentation, configuration, tests, deployment artifacts, or existing models.

1. Ask for intended scope only if it is unclear.
2. Inspect source, docs, tests, build/deployment manifests, and existing threat models to infer implemented components, assets, dataflows, trust boundaries, controls, and open questions.
3. Keep an internal evidence ledger while working. Track which observed facts support each proposed component, dataflow, countermeasure, and threat.
4. Ask targeted questions for missing, contradictory, security-relevant, or production-dependent evidence.
5. Before generating YAML, summarize the abstracted system model, what is proven, what is inferred, and what remains unknown. Ask for confirmation.
6. Generate YAML only after confirmation.

### Evidence Discipline

Every material statement in generated threat-model content must be supported by at least one of:

- Source code, tests, configuration, deployment artifacts, or project documentation observed in the workspace
- Existing threat models or architecture diagrams in the workspace
- An explicit user answer in the current conversation
- A clearly labeled assumption approved by the user

Do not claim a control is implemented unless direct evidence or user confirmation supports it. If evidence is absent or ambiguous, mark the control as not in place, ask the user, or omit the claim.

Do not infer runtime behavior from names alone. Names may suggest what to inspect next, but they are not proof.

Do not invent assets, integrations, actors, data stores, secrets, or deployment properties because they are common for the technology stack.

Avoid vulnerability cliches unless they connect to a proven asset, dataflow, trust boundary, or missing/partial control.

Keep exact evidence references in working notes or a separate evidence summary, not in the YAML narrative, unless the user requests an audit appendix.

### Implementation Independence

Threat-model YAML should describe the system at the design and security-boundary level, even when evidence comes from implementation details.

- Prefer stable architectural names over file names, class names, package names, function names, line numbers, exact environment variable names, exact routes, exact table names, or deployment filenames.
- Describe responsibilities and trust boundaries, not local implementation layout.
- Use generic but accurate asset titles, such as "Authentication service", "Administrative API", "Signing credential", "User profile data store", or "Client-to-service HTTPS flow".
- Include exact implementation detail only when it is itself the modeled asset or externally meaningful interface, such as a public protocol, documented API, cryptographic algorithm choice, chain program/account type, regulated data type, or required deployment boundary.
- Do not put source file paths, test names, commit identifiers, local directory names, or exact setup commands in report-facing YAML fields.

## Interview Workflow

Use this when creating or significantly extending a model without enough existing evidence.

### Phase 1: Scope and Context

Ask:

- What is the system or component name, and what does it do in one paragraph?
- What languages, frameworks, and runtimes are used?
- How is it deployed?
- Which team owns it, and are infrastructure or pipelines owned by that team or externally managed?
- Are there architecture diagrams, README files, or existing threat models to inspect?

### Phase 2: Actors

After Phase 1 is answered, ask:

- Who are the expected users, roles, or calling services?
- Who might attack this system?
- Are any attackers explicitly out of scope?

### Phase 3: Assets and Dataflows

After Phase 2 is answered, ask:

- What sensitive data does the system store, process, or transmit?
- What are the most critical services, sub-systems, or boundaries?
- What external systems does it communicate with?
- What credentials or secrets does it manage?

### Phase 4: Threat Focus

After Phase 3 is answered, ask:

- Are any threats or vulnerabilities already known or suspected?
- Have there been related incidents or near-misses?
- Are there compliance obligations such as PCI-DSS, SOC 2, GDPR, or internal security requirements?
- Should the model be high-level or deep-dive?

### Phase 5: Confirm and Generate

Summarize your understanding of the system and ask: "Does this accurately describe what we're threat modeling? Anything to add or correct before I generate the YAML?"

Only after confirmation, generate or update the YAML.

## Modeling Method

Use semantics over terminology. Treat risks, bugs, vulnerabilities, threats, and attacks as "something that can go wrong." Treat countermeasures, mitigations, and controls as "something we do about something that can go wrong."

Keep the scope focused on what the team is building, not everything the system uses. Reframe every scope question as "Are we building it?"

- Infrastructure is in scope when the team creates Terraform, Helm charts, Kubernetes manifests, or equivalent.
- A build pipeline is in scope when the team builds or owns the pipeline.
- Imported library internals are out of scope, but import selection, version choice, and usage patterns can be in scope.
- Cryptographic algorithm design is out of scope, but implementation, configuration, and key management can be in scope.

## YAML Authoring Requirements

Before creating or materially editing YAML, read [core-rules.md](references/core-rules.md).

Use these high-level requirements:

- Use `schemaVersion: 2`.
- Define attackers, security objectives, and assets in `scope` before threats reference them.
- Always include confidentiality, integrity, and availability as foundational security objectives unless an existing parent model already supplies equivalent objectives.
- Give assets explicit `type` and `inScope`.
- Use STRIDE values for `threatType`.
- For threats, use `attack` for exploit process and `impactDesc` for consequence. Do not use a generic threat `description`.
- Use `CVSS.vector`, never `CVSS.base`.
- Place `countermeasures` last in every threat.
- Use `REFID` for cross-references.
- Preserve markdown list spacing in multiline YAML strings.
- Do not use markdown heading markers inside multiline YAML strings.

## Information-Flow Sequence Diagrams

When a model includes consequential movement of data, credentials, decisions, or artifacts across components, create a small set of PlantUML sequence diagrams alongside the YAML. Read [sequence-diagrams.md](references/sequence-diagrams.md) for selection, evidence, layout, and build rules. Start with one end-to-end overview; add focused views only when a distinct trust boundary or credential/approval flow would be unclear in that overview. Do not generate one diagram per asset or threat.

## Verification

After every threat-model YAML modification, verify the result immediately.

If working in a threat-model-tool workspace, run:

```bash
npx tsx src/scripts/verify-threat-model.ts <path-to-root-yaml>
```

Always pass the root YAML file, not a directory. When editing a child model, pass the root parent YAML so cross-model REFIDs are checked.

If the verifier is unavailable, report that clearly, then perform the strongest local checks possible: parse YAML, inspect required field order, confirm `REFID` targets, confirm STRIDE values, confirm `CVSS.vector`, and confirm `countermeasures` is last.

Report verification pass/fail and a short summary to the user.

## Jira and Ticket Work

Keep threat analysis and classification in this skill. For Jira ticket creation, labeling, syncing, or audit checks, use available Jira tools or specialist agents if they exist; otherwise prepare structured ticket data and ask before performing external changes.

For Jira write-back into YAML, add `ticketLink:` attributes only when the user explicitly requests model updates from created issue URLs.
