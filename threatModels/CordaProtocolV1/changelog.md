# Changelog

## 2026-05-15 (a85d60c5 fast-forward: liquidity program removal)

### Code changes mapped

- **Liquidity program deleted from codebase**
	- Code: `programs/liquidity/**` deleted, `docs/LIQUIDITY_LAYER.md` deleted, liquidity tests/UI pages removed.
	- Root TM update: removed child reference to `LiquidityLayer` from `CordaProtocolV1.yaml`.
	- Root attacker/assets update: `LIQUIDITY_POOL_MANAGER`, `LIQUIDITY_PROGRAM`, and `LIQUIDITY_POOL_PDA` marked legacy/out-of-scope to preserve REFID continuity.

- **Oracle and systemic threat wording aligned to vault-only runtime**
	- Updated `CordaProtocolV1.yaml` oracle-related threats to remove active sync-liquidity semantics.
	- Updated `STABLECOIN_DEPEG` narrative/countermeasures to vault deposit/redemption focus.

- **Lifecycle model aligned to vault-only deployment**
	- Updated `SolanaProgramsLifecycle.yaml` to treat liquidity deployment/manager key artifacts as legacy/out-of-scope.
	- Updated deployment/init/governance narratives and impacts to vault-only active scope.

- **PlantUML architecture/data model alignment**
	- Updated `assets/img/architecture.puml`, `assets/img/onchain_data_module.puml`, and `assets/img/vaultDataModel*.puml` to mark Liquidity Program/LiquidityPool as removed legacy references.
	- Kept legacy nodes in diagrams for historical traceability, explicitly annotated as removed in `a85d60c5`.

### Jira follow-up required

- **PROT-861** (`ADMIN_KEY_PERMANENT_COMPROMISE`): update wording from "admin/manager" to vault-admin-only active risk; keep liquidity-manager text as legacy historical context only if needed.
- **PROT-872** (`GOVERNANCE_LIVENESS_AND_SUCCESSION_FAILURE`): remove active references to liquidity manager key recovery.
- **PROT-867 / PROT-874** (`MULTISIG_POLICY_MISCONFIGURATION`, `MULTISIG_BRICKING_AND_PERMANENT_DEADLOCK`): remove active references to upgrading/fixing liquidity program.
- **PROT-866 / PROT-875** (`ORACLE_WRAPPER_MISCONFIGURATION`, `ORACLE_WRAPPER_ADMIN_ABUSE`): remove any stale "sync liquidity" language in Jira descriptions and keep vault settlement impact as primary narrative.

- **Obsolete liquidity-layer threat tickets**
	- If any Jira tickets were created from `LL_*` threats in `LiquidityLayer/LiquidityLayer.yaml`, mark them obsolete or move them under a historical/retired epic, because that child is no longer part of active root scope.

## 2026-05-14 (PROT-1404: remove 24h monitoring and daily sync limits)

### Code changes mapped

- **Vault 24h rolling-window monitoring removed**
	- Code: `PROT-1404` — Removed `inbound_window_*`, `outbound_window_*`, lifetime volume/count fields, and `MONITOR_WINDOW_SECONDS` from `Vault` state. Kept only `last_inbound_at/volume_usdc` and `last_outbound_at/volume_usdc` markers.
	- `record_inbound_volume()` → `record_last_inbound()`, `record_outbound_volume()` → `record_last_outbound()`.
	- Updated threat: `MISSING_CIRCUIT_BREAKERS` — attack text now reflects absence of any on-chain volume tracking. Countermeasures `OUTBOUND_VOLUME_TRACKING` and `ENFORCE_OUTBOUND_RATE_LIMIT` updated.

- **InvestorSyncUsage PDA and per-investor daily limits deleted**
	- Code: `programs/liquidity/src/state/sync_usage.rs` deleted. `daily_sync_invest_limit`/`daily_sync_redeem_limit` removed from `LiquidityPool` state. Per-investor 24h window checks removed from `invest_sync` and `redeem_sync`. Per-transaction limits (`sync_invest_limit`, `sync_redeem_limit`) retained.
	- Root asset `INVESTOR_SYNC_USAGE_PDA` marked `inScope: false` with removal note.
	- `LiquidityLayer.yaml`: scope, analysis, and countermeasure `LL_DAILY_LIMITS` updated. Threat `LL_DAILY_LIMIT_WINDOW_BOUNDARY` commented out (obsolete). `LL_INVENTORY_EXHAUSTION_DOS` updated to remove daily limit refs and REFID to deleted PDA.

- **PlantUML diagrams updated**
	- `LiquidityLayer-flowSEQ1.puml`: Removed `InvestorSyncUsage` participant and daily limit check steps.
	- `Redemption-flowSEQ1.puml`: `record_outbound_volume()` → `record_last_outbound()`.
	- `architecture.puml`: Removed `InvestorSyncUsage` component and relationship.
	- `onchain_data_module.puml`: Removed `InvestorSyncUsage` entity, removed daily limits from pool, updated vault monitoring fields.
	- `vaultDataModel*.puml` (5 files): Same removals across all role-specific data model views.

### Jira follow-up required

- **PROT-658** (MISSING_CIRCUIT_BREAKERS): Threat wording updated — the attack surface is now larger since monitoring infrastructure was removed. Review countermeasure priorities.
- **LL_DAILY_LIMIT_WINDOW_BOUNDARY**: No Jira ticket — threat is now obsolete and commented out in YAML. No action needed.

## 2026-05-14 (async flow model rename and boundary refactor)

### Code changes mapped

- **Async child models renamed to match current architecture**
	- Renamed child model source: `FlowInvestmentProposal/FlowInvestmentProposal.yaml` -> `AsyncInvestmentFlows/AsyncInvestmentFlows.yaml`.
	- Renamed child model source: `FlowRedemption/FlowRedemption.yaml` -> `AsyncRedemptionFlows/AsyncRedemptionFlows.yaml`.
	- Updated root child references in `CordaProtocolV1.yaml` from `FlowInvestmentProposal` / `FlowRedemption` to `AsyncInvestmentFlows` / `AsyncRedemptionFlows`.
	- Threat IDs were intentionally not renamed so existing Jira links remain stable.

- **Async investment scope expanded to include batch deposit operations**
	- Code: `programs/vault/src/instructions/investments/batch_deposit.rs`, `create_investment_proposal.rs`, `match_deposit_redemption.rs`, `reject_investment.rs`, `settle_investment.rs`.
	- Updated threats/text: `AsyncInvestmentFlows/AsyncInvestmentFlows.yaml`.
	- Key alignment: async investment coverage now explicitly includes curator-controlled deposit snapshots, proportional batch settlement, and deposit-side dependence on cross-netting.

- **Async redemption scope expanded to include batch redemption operations**
	- Code: `programs/vault/src/instructions/redemptions/batch_redemption.rs`, `cancel_redemption_proposal.rs`, `create_redemption_proposal.rs`, `match_deposit_redemption.rs`, `settle_redemption.rs`.
	- Updated threats/text: `AsyncRedemptionFlows/AsyncRedemptionFlows.yaml`.
	- Key alignment: async redemption coverage now explicitly includes curator-controlled redemption snapshots, proportional batch payout, and the batch sealing moment as a price-lock decision point.

- **Liquidity layer boundary narrowed to sync and pool-specific risks**
	- Updated threats/text: `LiquidityLayer/LiquidityLayer.yaml`, `UserAuth/UserAuth.yaml`, `InvestorGateway/InvestorGateway.yaml`.
	- Key alignment: routed async investor proposal lifecycle threats now live in the async child models; `LiquidityLayer` retains sync swaps and pool-specific rebalance/custody concerns.

### Jira follow-up required

- **Concrete Jira update list**
	- `PROT-866` - split or clarify scope because it now covers two distinct root threats: `ORACLE_WRAPPER_MISCONFIGURATION` and `STABLECOIN_DEPEG`. If kept as one ticket, the description should explicitly separate oracle-wrapper config hardening from depeg response controls.
	- `PROT-873` - refresh wording for `VAULT_BANK_RUN` so it describes the current async redemption structure: pending redemption proposals, optional `batch_redemption` snapshots, sequential curator settlement, and lack of pro-rata or queue enforcement.
	- `PROT-659` - refresh wording for `LIVE_PRICE_TIMING_MANIPULATION` so it explicitly covers both individual settlement timing and curator-controlled batch snapshot sealing time in `AsyncInvestmentFlows` and `AsyncRedemptionFlows`.
	- `PROT-894` - refresh wording for `ROUNDING_DUST_ACCUMULATION` so it references current proposal-based async settlement and redemption payout semantics rather than any legacy NAV or receipt-era framing.
	- `PROT-658` - refresh wording for `MISSING_CIRCUIT_BREAKERS` so it mentions the current manual controls (`redemptions_paused` and emergency stop) and clarifies that automated on-chain enforcement is still missing.

- **Rename model references in Jira descriptions/comments**
	- Any open Jira item, comment, or linked design note that still cites `FlowInvestmentProposal` should be updated to `AsyncInvestmentFlows`.
	- Any open Jira item, comment, or linked design note that still cites `FlowRedemption` should be updated to `AsyncRedemptionFlows`.
	- Earlier changelog entries intentionally keep the historical names for traceability, but Jira text should use the current child model names.

- **Older Jira text likely affected by prior changelog changes**
	- Jira text that still says "large investment" or "standard investment" should be rewritten against the merged async investment model.
	- Jira text that still describes tokenizer burns, aToken release, stored vault price fields, `update_aum`, `update_price`, or `accrue_fees` should be updated to the current proposal, snapshot, oracle-wrapper, and emergency-stop semantics.
	- This is a documentation follow-up only; threat IDs in YAML were left unchanged.

## 2026-05-13

### Updated diagrams

- `assets/img/vaultDataModel.puml`
- `assets/img/vaultDataModel-curator.puml`

### Related threat model updates

- `CordaProtocolV1.yaml`
- `SolanaProgramsLifecycle/SolanaProgramsLifecycle.yaml`
- `LiquidityLayer/LiquidityLayer.yaml`
- `FlowRedemption/FlowRedemption.yaml`

### Specific change context

- **Deleted tokenizer program and ACL/receipt-era entities from diagrams**
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`
	- Related threat model scope cleanup: `CordaProtocolV1.yaml` (removed stale deployed-component framing and legacy architecture references)

- **Aligned program IDs and runtime architecture to merged vault + liquidity reality**
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `SolanaProgramsLifecycle/assets/img/SolanaProgramsLifecycleSeq1.puml`
	- Related threat model updates: `CordaProtocolV1.yaml`, `SolanaProgramsLifecycle/SolanaProgramsLifecycle.yaml`

- **Kept large-investment proposal path as current behavior (no premature simplification)**
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `FlowStandardInvestment/assets/img/StandardInvestment-flowSEQ1.puml`
	- Related threat model updates: `CordaProtocolV1.yaml`, `LiquidityLayer/LiquidityLayer.yaml`
	- Note: simplification is intentionally deferred pending upstream dev merge.

- **Updated redemption semantics to escrow + cancel/settle for pending unmatched proposals**
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `FlowRedemption/assets/img/Redemption-flowSEQ1.puml`
	- Related threat model updates: `FlowRedemption/FlowRedemption.yaml`

- **Refreshed curator/investor instruction relationships to proposal-driven settlement flows**
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `LiquidityLayer/assets/img/LiquidityLayer-flowSEQ1.puml`
	- Related threat model updates: `LiquidityLayer/LiquidityLayer.yaml`, `SolanaProgramsLifecycle/SolanaProgramsLifecycle.yaml`

- **Validation outcome**
	- Post-edit stale-term scan over the two vault data model diagrams found no remaining legacy keywords.

## 2026-05-13 (corda-protocol-mvp fast-forward re-alignment)

### Code changes mapped

- **State split in vault-core**
	- Code: created `packages/vault-core/src/state/investment_proposal.rs`, created `packages/vault-core/src/state/redemption_proposal.rs`, deleted `packages/vault-core/src/state/proposal.rs`.
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `assets/img/onchain_data_module.puml`, `assets/img/vaultDataModel-admin.puml`, `assets/img/vaultDataModel-investor.puml`, `assets/img/vaultDataModel-manager.puml`.
	- Updated threats/scope text: `CordaProtocolV1.yaml` (proposal asset naming aligned to InvestmentProposal wording).

- **Removed config instruction file**
	- Code: deleted `programs/vault/src/instructions/config/set_large_order_threshold.rs`.
	- Updated threats/context: references to standalone threshold setter removed from investment-flow wording and aligned to current `update_vault_config`-driven config model.

- **Instruction renames in vault investments**
	- Code: `create_large_investment_proposal.rs` -> `create_investment_proposal.rs`.
	- Updated diagrams: `FlowInvestmentProposal/assets/img/InvestmentProposal-flowSEQ1.puml`, `LiquidityLayer/assets/img/LiquidityLayer-flowSEQ1.puml`, `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-investor.puml`, `assets/img/architecture.puml`.
	- Updated threats/text: `LiquidityLayer/LiquidityLayer.yaml` and investment-flow references in `CordaProtocolV1.yaml`.

- **Instruction renames in curator settlement path**
	- Code: `reject_large_investment.rs` -> `reject_investment.rs`, `settle_large_investment.rs` -> `settle_investment.rs`.
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-curator.puml`, `assets/img/vaultDataModel-curator-rejectLargeInvestment.puml`, `assets/img/vaultDataModel-curator-settleLargeInvestment.puml`, `assets/img/investmentSettlement.puml`, `assets/img/useCaseDiagram-vault.puml`.
	- Updated threats/text: `FlowInvestmentProposal/FlowInvestmentProposal.yaml`, `CordaProtocolV1.yaml`.

### Validation notes

	- `CordaProtocolV1.yaml`
	- `LiquidityLayer/LiquidityLayer.yaml`
	- `FlowInvestmentProposal/FlowInvestmentProposal.yaml`
	- `FlowInvestmentProposal/FlowInvestmentProposal.yaml`

- **Removed obsolete standard-investment flow model**
	- Removed child model source: `FlowStandardInvestment/FlowStandardInvestment.yaml`.
	- Removed child sequence source: `FlowStandardInvestment/assets/img/StandardInvestment-flowSEQ1.puml`.
	- Pruned receipt-flow entities from current shared diagrams: `assets/img/onchain_data_module.puml`, `assets/img/vaultDataModel-investor.puml`, `assets/img/vaultDataModel-admin.puml`, `assets/img/vaultDataModel-manager.puml`.
	- Active investment coverage remains in `FlowInvestmentProposal/FlowInvestmentProposal.yaml`; no replacement child model was needed.

- **Child model rename from legacy large-investment naming**
	- Threat model path renamed conceptually from `FlowLargeInvestment/FlowLargeInvestment.yaml` to `FlowInvestmentProposal/FlowInvestmentProposal.yaml`.
	- Sequence diagram source renamed conceptually from `FlowLargeInvestment/assets/img/LargeInvestment-flowSEQ1.puml` to `FlowInvestmentProposal/assets/img/InvestmentProposal-flowSEQ1.puml`.
	- Root child reference updated in `CordaProtocolV1.yaml` from `FlowLargeInvestment` to `FlowInvestmentProposal`.

## 2026-05-14 (vault-core struct and redemption-flow realignment)

### Code changes mapped

- **Vault state fields aligned to current `vault-core` layout**
	- Code: `packages/vault-core/src/state/vault.rs` now uses `vault_id`, `vtoken_vault`, `fee_recipient`, `offboard_destination`, `emergency_stop`, oracle-wrapper references, and outstanding volume counters instead of the older NAV/aToken/receipt-era layout.
	- Updated diagrams: `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-investor.puml`, `assets/img/vaultDataModel-admin.puml`, `assets/img/vaultDataModel-manager.puml`, `assets/img/onchain_data_module.puml`, `assets/img/investmentSettlement.puml`, `assets/img/useCaseDiagram-vault.puml`.

- **Proposal seed strings aligned to split state types**
	- Code: `InvestmentProposal::SEED_PREFIX = b"investment_proposal"`, `RedemptionProposal::SEED_PREFIX = b"redemption_proposal"`.
	- Updated threats/text: `CordaProtocolV1.yaml`, `FlowRedemption/FlowRedemption.yaml`.

- **Redemption flow rewritten around escrow, matching, and curator-controlled cancel/settle**
	- Code: `create_redemption_proposal.rs`, `cancel_redemption_proposal.rs`, `match_deposit_redemption.rs`, `settle_redemption.rs`.
	- Updated threats/text: `FlowRedemption/FlowRedemption.yaml`.
	- Key alignment: removed tokenizer/aToken-burn narrative, added `match_deposit_redemption`, optional snapshot pricing, `vtoken_vault` escrow, and pinned `fee_recipient` handling.

- **Final root cleanup after redemption rewrite**
	- Updated threats/text: `FlowRedemption/FlowRedemption.yaml`, `CordaProtocolV1.yaml`.
	- Fixed a partial rewrite that had left duplicate YAML keys in `FlowRedemption/FlowRedemption.yaml`.
	- Marked root receipt/aToken artifacts as legacy-only and replaced remaining root prose that still referred to receipt settlement, `nav_per_share`, or `pending_redemption_shares` with current proposal and live price-path terminology.
	- Validation: root verification passed again after the cleanup.

## 2026-05-14 (oracle-wrapper pricing and emergency-stop fast-forward)

### Code changes mapped

- **Vault pricing moved to the oracle-wrapper program**
	- Code: added `programs/oracle_wrapper/**`, added `packages/vault-core/src/vault_operations/prices.rs`, removed direct vault-side pricing instruction files, and wired `initialize_vault` to pin `price_oracle_program`, `vtoken_oracle_wrapper_config`, and `vtoken_feed`.
	- Updated threats/text: `CordaProtocolV1.yaml`, `LiquidityLayer/LiquidityLayer.yaml`, `FlowRedemption/FlowRedemption.yaml`, `UI/UI.yaml`, `SolanaProgramsLifecycle/SolanaProgramsLifecycle.yaml`, `UserAuth/UserAuth.yaml`.
	- Updated diagrams: `assets/img/onchain_data_module.puml`, `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-admin.puml`, `assets/img/vaultDataModel-investor.puml`, `assets/img/vaultDataModel-manager.puml`, `assets/img/architecture.puml`, `assets/img/investmentSettlement.puml`, `LiquidityLayer/assets/img/LiquidityLayer-flowSEQ1.puml`.

- **Manual incident response now includes emergency stop / lift**
	- Code: added `programs/vault/src/instructions/config/emergency_stop.rs` and `lift_emergency_stop.rs`; permission logic allows `compliance_authority` to engage the stop and `admin` to lift it.
	- Updated threats/text: `CordaProtocolV1.yaml`, `SolanaProgramsLifecycle/SolanaProgramsLifecycle.yaml`, `UserAuth/UserAuth.yaml`.
	- Updated diagrams: `assets/img/architecture.puml`, `assets/img/vaultDataModel.puml`, `assets/img/vaultDataModel-manager.puml`.

- **Removed stale TM references to deleted accounting instructions and stored price fields**
	- Removed or replaced references to `update_aum`, `update_price`, `accrue_fees`, `vtoken_price`, and `last_price_update` where they no longer matched live code.
	- Key alignment: pricing is now described as a live oracle-wrapper read or sealed snapshot override, not as a stored Vault account field.
	- Validation: root verification passed; all touched standalone `.puml` sources were clean in editor diagnostics, except the known false-positive unnamed-include warning on `assets/img/onchain_data_module.puml`.

- **Stablecoin depeg restored as a separate systemic threat**
	- Updated threats/text: `CordaProtocolV1.yaml`.
	- Clarified that stablecoin depeg remains a valid threat even with oracle-wrapper pricing; the oracle mitigates the "undetected depeg" failure mode, while oracle-wrapper misconfiguration remains a separate additional threat.
