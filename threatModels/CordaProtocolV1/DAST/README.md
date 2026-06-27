# DAST — Corda Protocol V1

Dynamic analysis (DAST) assets for the Corda Protocol V1 threat model.

This folder captures real browser traffic with Playwright, then turns the
resulting HAR into PlantUML sequence / DFD diagrams used as architecture
evidence for threat modeling.

> All generated artifacts are **maintained and incrementally improved in this
> directory** (under `har/`). They are intentionally **not** written to a
> transient `build/` directory in another project.

## Layout

```
DAST/
├── playwright_tests/
│   └── demo_inverstor_registration.spec.ts   # records the HAR (recordHar)
└── har/
    ├── demo_investor_registration.har                  # captured traffic (input)
    ├── demo_investor_registration.indexHAR.yaml        # compact request index
    ├── demo_investor_registration.config.yaml          # MAINTAINED classification config
    ├── demo_investor_registration.sequence.puml        # full sequence view
    ├── demo_investor_registration.sourceHostSummary.puml # one call per source host
    └── demo_investor_registration.HighLevelDFD.puml    # high-level DFD
```

## Prerequisites

Playwright browsers (first time only):

```bash
npm install
npx playwright install
```

The `threat-model-har-config` / `threat-model-har2seq` binaries are provided by
`threat-model-tool`, installed in the `threat-modeling` workspace root. The npm
scripts below resolve them automatically via `PATH`, so they must be run from
this directory.

## Workflow

### 1. Capture the HAR

The Playwright spec records a HAR via a `recordHar` browser context and writes it
to `har/demo_investor_registration.har`:

```bash
npx playwright test
```

To (re)record interactions with codegen:

```bash
npx playwright codegen https://corda-rr.vercel.app/vault?invite=demo \
  --output playwright_tests/demo_inverstor_registration.spec.ts
```

### 2. Bootstrap the config (one-time)

Generates the request index and a starter classification config into `har/`.
After this, the config is **edited and maintained by hand** (first-party vs
third-party participants, trust boundaries, properties).

```bash
npm run har:config
```

> ⚠️ Re-running `har:config` overwrites the maintained config. Only run it to
> bootstrap from scratch.

### 3. (Re)generate diagrams

Regenerate all three PlantUML views from the maintained config:

```bash
npm run har:diagrams
```

Individual targets:

| Script | View | Description |
| --- | --- | --- |
| `npm run har:seq` | sequence | Full sequence, one call per request |
| `npm run har:seq:hosts` | sequence | Collapsed: one call per source host |
| `npm run har:dfd` | HighLevelDFD | High-level DFD, one call per participant |

## Iteration loop

1. `npx playwright test` — refresh the HAR if the flow changed.
2. Edit `har/demo_investor_registration.config.yaml` — refine participants,
   trust boundaries, and security properties.
3. `npm run har:diagrams` — regenerate the diagrams.
4. Repeat until the view is compact but preserves threat-relevant distinctions.

See `notes_log.md` for the raw command history.
