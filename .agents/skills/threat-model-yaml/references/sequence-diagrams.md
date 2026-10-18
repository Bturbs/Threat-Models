# Information-Flow Sequence Diagrams

Use sequence diagrams to show **who sends what to whom, in what order, across which trust boundary**. They supplement the YAML asset/dataflow inventory and attack trees; they do not replace either.

## Choose a Small Set

1. Identify the few flows that change security decisions or move sensitive information: intake, authentication, worker dispatch, provider context, model approval, code delivery, or a system-specific equivalent.
2. Start with one end-to-end overview. Add a focused diagram only when it reveals a different boundary, credential lifecycle, or approval handoff that the overview cannot show legibly.
3. Default to **one to three diagrams per root model**. If more than three are genuinely needed, state why each extra view changes the analysis before creating it. Do not create a diagram per threat, endpoint, job stage, or child model by default. Consolidate repeated calls into one labeled exchange.
4. Keep each diagram readable at ordinary report width. Aim for roughly 5–8 participants and 10–20 significant messages. Split a crowded diagram by security question, not by arbitrary page count.

## Evidence and Meaning

- Label arrows with the information or authority transferred (for example, `issue text + metadata`, `scoped worker token`, `verification result + revision`), not generic verbs such as `request` or `response`.
- Show direction and meaningful order. Mark trust boundaries and note where untrusted content enters, where secrets reside, and where human decisions are recorded.
- Distinguish implemented behavior from planned deployment. Use notes or `alt` branches for mode or policy differences; do not draw a planned protection as active without evidence.
- Keep provider internals, vendor services, and other out-of-scope components as single participants. Never include real tokens, customer data, or sensitive endpoint values in diagram source.
- Tie each diagram to modeled assets, dataflows, or threats in a short caption. Keep exact source-code evidence in notes or an evidence appendix, following the skill's evidence discipline.

## Store and Verify

- Place hand-authored files under the model's `assets/img/` directory, for example `assets/img/sequence_delivery.puml`. Reference the generated `.svg` in `scope.diagram` with Markdown image syntax, such as `![Delivery information flow](img/sequence_delivery.svg)`. The report generator copies the assets and renders `.puml` files; do not commit generated SVGs unless the repository already tracks them.
- Use `@startuml` / `@enduml` and stable participant aliases. Ensure referenced SVG paths match the final report layout.
- Run the YAML verifier after editing the model. Build the report or site and inspect every sequence SVG for rendering errors, legibility, and broken links. If a rendering tool is unavailable, report that limitation explicitly.
