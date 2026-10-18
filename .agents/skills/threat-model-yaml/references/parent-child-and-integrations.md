# Parent, Child, HAR, and Jira Guidance

Read this reference for parent/child model work, HAR-derived threat modeling, and Jira-related workflows.

## Parent and Child Models

Threat models can be organized hierarchically with `parent` and `children`.

Parent model:

```yaml
ID: EnterpriseInfrastructure
schemaVersion: 2
title: Enterprise Infrastructure Security
children:
  - REFID: APIGateway
  - REFID: DatabaseLayer
```

Child model:

```yaml
ID: APIGateway
schemaVersion: 2
title: API Gateway Security
parent: EnterpriseInfrastructure
```

Before writing child YAML, read the parent model and inventory its security objectives, attackers, and shared assets.

## Child Security Objectives

First choice: reuse parent objectives directly with `REFID`. Map each child threat impact to the most semantically appropriate parent objective.

If no parent objective fits, do not create a local substitute with a different name. Propose adding a new parent objective that serves both parent and child models, then ask the user before adding it.

Check semantic fit, not keyword match. A narrow parent objective such as `PROGRAM_INTEGRITY` should not be used for generic infrastructure integrity. If the parent objective is too narrow, propose a broader parent objective and make the narrow objective contribute to it.

Only create child-specific objectives when the child genuinely needs a specialized sub-objective that has no place in the parent scope. Link it to a parent objective with `contributesTo`.

Decision flow:

1. Does a parent objective match semantically? Use `REFID`.
2. Is the closest parent objective too narrow? Propose broadening the parent.
3. Does no parent objective cover this domain? Propose adding one to the parent.
4. Is the objective truly child-specialized? Create it locally with `contributesTo`.

Before generating YAML, tell the user which parent objectives will be reused and which new parent or child objectives are proposed.

## Child Attackers

First choice: reuse parent attackers with `REFID`.

Do not create local variants such as `INFRA_EXTERNAL_ATTACKER` or `UI_EXTERNAL_ATTACKER` when a parent `EXTERNAL_ATTACKER` already covers the role.

Create a child-specific attacker only when the child introduces a genuinely distinct threat agent not represented in the parent.

If an attacker is out of scope for a child but relevant to the parent, note it in the child scope description and suggest adding it to the parent. Do not define it locally as `inScope: false` if it belongs in the parent.

Before generating YAML, tell the user which parent attackers will be reused and why any child-specific attacker is needed.

## Child Assets

The `scope.assets` list in a child model must contain only child-specific assets with full `ID`, `type`, `title`, and related fields.

Do not add bare `REFID` entries to child `scope.assets`; the schema requires full asset objects there.

Shared assets belong in the parent. Parent-defined assets can still be referenced by child threats.

Correct child pattern:

```yaml
scope:
  assets:
    - ID: DF_MY_DATAFLOW
      type: dataflow
      title: My Child-Specific Dataflow
      inScope: true

threats:
  - ID: MY_THREAT
    assets:
      - REFID: SHARED_PARENT_ASSET
      - REFID: DF_MY_DATAFLOW
```

## Case Sensitivity

For every `children` entry, the folder name, YAML filename, and `ID` inside YAML must use exactly the same casing.

Example:

```text
Foo/Foo.yaml
ID: Foo
```

macOS is case-insensitive, but CI on Linux is case-sensitive and may skip mismatched children.

## HAR-First Workflow

Use this mode when the user starts from an HAR capture, `.indexHAR.yaml`, HAR config YAML, or a HAR-derived sequence diagram and wants to classify participants, infer vendor roles, refine collapse rules, or create a manageable architecture view.

If a repository contains `docs/HAR_2_TM_tool_config_workflow.md`, read it before HAR-first work.

Policy:

1. Do not force the full threat-model interview while the user is still classifying participants, trust boundaries, and properties.
2. Stabilize first-party and third-party classifications, participant properties, vendor roles, collapse rules, and compact sequence diagrams first.
3. Use a specialist `har-party-classifier` agent if it is available. If not available, perform the classification directly.
4. Resume formal threat-model YAML authoring only after the HAR config and compact architecture view are stable enough to support threat modeling.

Delegation triggers include:

- "Given this HAR, classify first vs third party"
- "Infer the role of these third parties"
- "Refine the HAR config before threat modeling"
- "Make the sequence diagram manageable from this capture"

## Jira Operations

Keep threat analysis and classification in the threat-modeling workflow. Hand off only ticket operations when a Jira tool or specialist agent is available.

Ticket operations include labels, bulk updates, reconciliation, audit checks, issue creation, CSV export, and ticket preview.

Provide structured payloads instead of raw threat narratives where possible:

```yaml
action: sync-labels
label: onChainImp
tickets:
  - PROT-614
  - PROT-615
rules:
  applyWhen: requires on-chain program changes
  skipWhen: operational or infra-only control
dryRun: false
```

If no Jira execution tool is available, prepare the payload and ask the user before making external changes.

For ticket creation from an existing threat model:

- Read the existing YAML to extract threats, countermeasures, ticket links, and relevant metadata.
- Prefer structured ticket rows or minimal derived fields over full narrative text.
- Include only required Jira metadata, such as project key, epic, issue type, labels, and required custom fields.
- Avoid forwarding sensitive descriptions unless the user explicitly asks for them in the Jira artifact.

## TicketLink Synchronization

When the user asks to create Jira issues and update the model, request or record write-back of created Jira browse URLs into source YAML as `ticketLink:` attributes.

Rules:

- Write back only when the user explicitly requests it.
- Pass or store the minimum mapping needed, such as source threat or countermeasure ID to created issue key or URL.
- Prefer writing back the browse URL only, not copied Jira field content.
