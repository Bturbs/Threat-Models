# Structured Threat Models

> **Current repository state:** this repository contains no threat model YAML
> files. Build commands can be used to verify an empty model set; they should
> not generate model reports or model pages. The shared assets under
> `threatModels/assets/` are retained for future use.

This repository contains structured threat models in YAML format and tools to transform them into various report formats (Markdown, HTML, PDF, MkDocs).

## Introduction

Modern large-scale security reviews (like the CBUAE Phase 2) require a consistent, machine-readable format for threats, assets, and countermeasures. This approach allows for:
- **Reproducibility**: Clear links between assets, threats, and mitigations.
- **Automation**: Automatic generation of risk reports and security sites.
- **Validation**: Ensuring all threats have assigned CVSS scores and mitigations.
- **Scalability**: Managing dozens of threat models in a central repository.

## Get Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v20+)
- [npm](https://www.npmjs.com/)

### Installation

```bash
npm install
```

### Build Security Site (MkDocs)

```bash
npm run generate:mkdocsSite
```

This generates a full MkDocs site in `build/site-mkdocs`. To preview:

```bash
npm run serve:mkdocsSite
```

---

## Threat Model YAML Structure

Threat models are defined as YAML files in the [threatModels](threatModels/) folder. Below is a detailed example of the structure:

```yaml
threats:
  - ID: TM-MODULE-ID-01  # Unique identifier
    # Assets impacted by this threat
    assets:
      - ID: Asset-ID-1
      - ID: Asset-ID-2
    # CVSS 3.1 Score and Vector
    CVSS:
      base: 7.5
      vector: CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N
    threatType: Spoofing  # STRIDE category
    # Detailed description (Markdown supported)
    description: |
      A detailed explanation of how the threat manifests
      and what the potential impact is.
    # Metadata for filtering
    public: true          # Set to false to hide in public reports
    fullyMitigated: true  # Current status of mitigation
    # List of countermeasures/mitigations
    countermeasures:
      - ID: CM-01
        description: |
          Description of the specific control implemented.
        inPlace: true     # Whether the control is currently active
        public: true
      - ID: CM-02
        description: |
          Another mitigation...
        inPlace: false    # Track planned but not yet implemented controls
        public: true
```

### Key Fields

- **CVSS**: Mandatory field for calculating risk.
- **threatType**: Should follow the STRIDE model (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege).
- **fullyMitigated**: A boolean flag used to track residual risk.
- **inPlace**: Tracks the deployment status of specific countermeasures.

---

## Validation & Rules

The tool enforces several business rules on the YAML files:
1. **Mandatory Fields**: Every threat must have a `description`, `CVSS`, and `threatType`.
2. **Asset Links**: Threats must link to at least one asset defined in the system.
3. **Mitigation tracking**: If a threat is marked `fullyMitigated: true`, all linked countermeasures SHOULD ideally be `inPlace: true`.
4. **CVSS Validity**: The vector string must be a valid CVSS 3.1 vector.

---

## CLI Usage

The `threat-model-tool` can be used via CLI for individual model generation or batch processing.

### Parameters

| Flag | Description |
|------|-------------|
| `--TMDirectory` | Directory containing the YAML threat models. |
| `--outputDir` | Where to save the generated Markdown/HTML files. |
| `--generatePDF` | Whether to trigger PDF generation (requires Puppeteer). |
| `--siteName` | The title used for the generated security site. |
| `--headerNumbering`| Automatically add section numbering to the reports. |

Example command:
```bash
npx tsx node_modules/.bin/threat-model-tool <path-to-yaml> <output-dir> --mainTitle "System Audit"
```

---

## AI Assistance

This project includes prompts designed to help security architects generate YAML models using LLMs (like GPT-4 or Claude).

- **Baseline Prompts**: Located in `ai/prompts/`, these help establish the GRC baseline for new modules.
- **Context injection**: You can feed your architecture documentation into the AI along with the schema rules to generate draft threat models.

Example workflow:
1. Provide architecture PDF/Markdown to LLM.
2. Apply `ai/prompts/prompt_GRC_baseline.txt`.
3. Review and validate output against current assets.

---

## Repository Structure

- [threatModels/](threatModels/): Source YAML files.
- [security_site/](security_site/): MkDocs templates and configuration.
- [ai/](ai/): Prompts and conversation logs for AI-assisted modeling.
- [build/](build/): Generated outputs (ignored by git).
## YAML TM data definition features

- [ ] Security objectives and linkable/reusable impacts (as negation of high level defined sec objectives)
- [ ] Status of (single) threat review
- [ ] fullyMitigated: remains ambiguous: what does it mean for operational countnermeasures, when do we need to open the Jira ticket?. Replace it openJiraTicket, also in the countermeasure part (the threat  one should open a Jira RISK ticket instead)
## Reporting tool, new features proposals

- [ ] CVSS visual representation (explains vector meaning per threat)
- [x] Executive Summary
- [x] Threats summary (metrics)
- [ ] Pentestable attribute on attacks for pentest playbook
- [x] Operational (Hardening) attribute on countermeasure for installation hardening guide
- [ ] DevTestable: attribute in countermeasures for non-functional testing during development
- [x] Add conditional option oh threats
- [ ] Add TM fields: textual summary, status, release info, author...

## Reporting tool, bug fixes needed:

 - [ ] Countermeasure REFID for references to the same file is not working
 - [x] Add conditional info in Executive summary
 - [x] Add links to Threats in Executive summary 
 - [ ] C5.html counting threats twice in executive summary, and also in the report (probably related to the latest parsing TM object, to debug...)



### Installation notes

For normal installation, use:

```bash
pip install git+https://github.com/corda/threat-model-tool.git
```
