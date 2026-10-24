# Structured Threat Models

**Hosted site:** [View the threat models](https://proud-wave-00847161e.6.azurestaticapps.net/).

The first model is [Blueprint Gate](threatModels/BlueprintGate/BlueprintGate.yaml).
Its [evidence notes](threatModels/BlueprintGate/EVIDENCE.md) distinguish implemented
controls from deployment settings that still need confirmation.

Verify the model from a local TM-Tool checkout with:

```bash
npx tsx src/scripts/verify-threat-model.ts ../Threat-Models/threatModels/BlueprintGate/BlueprintGate.yaml
```

This repository is prepared to hold structured threat models in YAML format and generate reports in Markdown, HTML, PDF, and MkDocs.

## Introduction

Large security reviews benefit from a consistent, machine-readable format for threats, assets, and countermeasures. This approach allows for:
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

### Publish the security site

The generated `build/site-mkdocs` folder can be published through either workflow. Both serve the same public static site; the YAML source repository can stay private with Azure.

#### Choose a host

| Host | Choose it when | Requirement |
| --- | --- | --- |
| [GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site) | You want the site hosted entirely on GitHub. | A public repository on GitHub Free, or an eligible paid plan for a private repository. |
| [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/plans) | You want the YAML repository to be able to remain private, or prefer Azure hosting. | An Azure subscription with a Static Web App; the **Free** hosting plan is sufficient for this site. |

**Current choice:** Azure is enabled and serves the [hosted site](https://proud-wave-00847161e.6.azurestaticapps.net/). This repository is currently public, so GitHub Pages is also available on GitHub Free, but Pages has not been configured.

The workflows are selected with repository variables under **Settings → Secrets and variables → Actions → Variables**:

| Publish to | `PUBLISH_TO_AZURE` | `PUBLISH_TO_GITHUB_PAGES` |
| --- | --- | --- |
| Azure only (current) | `true` | Unset or `false` |
| GitHub Pages only | Unset or `false` | `true` |
| Both | `true` | `true` |

To switch to GitHub Pages, first enable Pages with **GitHub Actions** as the source in **Settings → Pages**. Then set the variables to the GitHub Pages only row above and run **Generate Security Site (Node)** from Actions. Once the new URL works, update the hosted-site link at the top of this README. To switch back to Azure, use the Azure only row and run **Publish Security Site to Azure**. An unset or `false` variable skips that host's deployment job.

For Azure, choose **Other** under **Deployment details → Source** when creating the Static Web App in the Azure portal. This lets the [repository workflow](.github/workflows/publish-azure-static-web-app.yml) deploy the already generated site without Azure creating another workflow. Copy the token from the app's **Overview → Manage deployment token**. Keep it in the GitHub secret, never in a file or commit. After setting the secret and variable, run **Publish Security Site to Azure** from the repository's Actions tab for the first deployment. Later changes to threat models or site assets on `main` deploy automatically. The Azure portal shows the public site URL after deployment.

GitHub Pages uses the existing [Pages workflow](.github/workflows/generate-mkdocs-site-ts.yml); later source changes on `main` deploy automatically when its variable is enabled. Review the generated content before enabling either host: the site is visible on the public internet even when the repository is private.

---

## Threat Model YAML Structure

Models use schema version 2. The [Blueprint Gate model](threatModels/BlueprintGate/BlueprintGate.yaml) is a verified example with objectives, assets, attackers, STRIDE threats, CVSS vectors, and countermeasures.

Each threat describes the exploit in `attack` and the consequence in `impactDesc`. References to objectives, attackers, and assets use `REFID`. A control is marked `inPlace: true` only when implementation or deployment evidence supports it. See the [evidence notes](threatModels/BlueprintGate/EVIDENCE.md) for the baseline review.

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

The repository includes a [Codex threat-modeling skill](.agents/skills/threat-model-yaml/SKILL.md)
with schema rules, evidence guidance, and a small-budget approach to PlantUML
information-flow sequences. Its supporting references are kept beside the skill.

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
