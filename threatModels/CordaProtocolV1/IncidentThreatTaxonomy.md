# Threat taxonomy specific to web Vaults


## Stablecoin price fluctuation and debasement

**Scenario:** Vault assumes a fixed price for a stablecoin or lacks a real-time oracle, leading to incorrect collateralization ratios during market volatility.

**Failure:** Reliance on hardcoded values or delayed price updates that don't account for asset debasement.

**Defense:** Integrate decentralized oracles (e.g., Pyth, Chainlink) with frequent heartbeat updates and circuit breakers for extreme volatility.

**Reference Incident:** [Resolv Hack (March 2026)](https://www.chainalysis.com/blog/lessons-from-the-resolv-hack/) — Attacker exploited a compromised off-chain signing key to mint 80M unbacked USR tokens, leading to an immediate 80% price collapse. Also [Mango Markets (October 2022)](https://rekt.news/mango-markets-rekt/) — Attacker spiked the price of a low-liquidity token ($MNGO) to inflate their collateral value and drain the protocol.


## Lack of liquidity

**Scenario:** Large withdrawal requests cannot be honored because the vault's assets are locked in illiquid positions or lending markets.

**Failure:** Improper balancing between yield-generating (locked) and liquid (available) reserves.

**Defense:** Implement reserve requirements, withdrawal queues, or tiered liquidity strategies to ensure immediate availability for expected outflows.

**Reference Incident:** [Mango Markets (October 2022)](https://rekt.news/mango-markets-rekt/) — Attacker manipulated MNGO spot price, then borrowed against inflated collateral until all available borrow liquidity was drained, leaving ~$115M in bad debt.


## Time of check/Time of use mismatch in price related to an automated action

**Scenario:** A vault checks a price (directly or via oracle-fed state) and later executes mint/redeem/borrow logic using that value after market conditions have changed.

**Failure:** Oracle-derived valuation is stale or manipulable during the check/use gap, so the protocol executes with an outdated or attacker-inflated price.

**Defense:** Use atomic price-check + execution flows, enforce oracle freshness/confidence bounds (max staleness, deviation limits), and add TWAP/anti-manipulation guards for mint/redeem paths.

**Reference Incident:** [Nirvana Finance (July 2022)](https://rekt.news/nirvana-rekt/) — Flash-loan-driven price distortion let the attacker exploit oracle-linked valuation timing to extract treasury assets.


## Account Substitution / Spoofing (Solana IDOR)

**Scenario:** Attacker passes a fake Pyth Oracle account in the accounts array with a manipulated price (e.g., SOL = $10M) to drain the vault.

**Failure:** Program reads "account #4" without verifying the account's **Owner** (must be Pyth Program) or its specific **Pubkey**.

**Defense (Anchor):**
- `#[account(owner = pyth_program_id)]`
- `#[account(address = official_feed_pubkey)]`

**Reference Incident:** Step Finance (July 2021) — Attacker provided a malicious program masquerading as a legitimate one, which the protocol invoked via CPI in a trusted state. Also [Cashio App (March 2022)](https://rekt.news/cashio-rekt/) — Failure to validate the `mint` address of collateral tokens allowed an attacker to use worthless fake tokens to mint $48M.


## Missing Signer Checks (Broken Authentication)

**Scenario:** Attacker initiates a withdrawal passing Alice's account as the user, but their own wallet as the destination.

**Failure:** Program deducts Alice's balance without checking if `account.is_signer == true`.

**Defense (Anchor):**
- Use `Signer<'info>` type or `#[account(signer)]` constraint.

**Reference Incident:** Step Finance (July 2021) — Common vulnerability during the early Solana ecosystem where `is_signer` checks were omitted. Also relevant to [Wormhole Bridge (February 2022)](https://rekt.news/wormhole-rekt/) where a spoofed sysvar account bypassed signature verification.


## Arbitrary CPI / Program Injection (Solana SSRF & RCE)

**Scenario:** Vault executes a Cross-Program Invocation (CPI) to lend USDC, but the attacker passes a malicious Program ID instead of a protocol like Kamino.

**Failure:** Vault sends funds to the dynamic Program ID passed in the account array without validation.

**Defense (Anchor):**
- Use `Program<'info, LendingProtocol>` to enforce a specific program type.
- Hardcode and verify target Program IDs before calling `invoke`.

**Reference Incident:** Step Finance (July 2021) — Attacker passed a malicious program ID which received a CPI call from the protocol, allowing it to perform unauthorized actions. Also [Wormhole (February 2022)](https://rekt.news/wormhole-rekt/) where delegating verification to a spoofed program allowed forging VAAs.


## Precision and Calculation Errors (Arithmetic Vulnerabilities)

**Scenario:** A protocol performs complex math for rewards, swaps, or fee distributions (e.g., tick-based liquidity) where rounding directions or intermediate overflows can be exploited.

**Failure:** Using incorrect precision, failing to account for rounding errors in the user's favor, or allowing attackers to provide malicious "data accounts" that influence internal calculations.

**Defense:**
- Use high-precision arithmetic (e.g., `U128`, `U256`).
- Always round in favor of the protocol (e.g., round up for debt, round down for rewards).
- Validate all input data accounts used in calculations to ensure they are authentic.

**Reference Incident:** [Crema Finance (July 2022)](https://osec.io/blog/2022-07-04-crema-finance-postmortem/) — Attacker exploited a flaw in how concentrated liquidity fees were calculated by providing a malicious "tick account," tricking the program into awarding ~$8.7M in fake fees.


## Admin / Multisig Takeover via social engineering

**Scenario:** Attacker socially engineers multisig signers to pre-approve transactions, then uses Solana durable nonce accounts to store and execute them at a chosen time — seizing control of privileged protocol admin roles (e.g., a Security Council).

**Failure:** Multisig approvals were obtained in advance via social engineering or transaction misrepresentation. Durable nonce accounts allowed pre-signed transactions to be held and executed later. Once admin powers were seized, the attacker introduced a malicious asset and removed withdrawal limits, draining multiple vaults.

**Defense:**
- **Timelock on admin operations** — Require a delay (e.g., 24-48h) between multisig approval and execution for sensitive operations (changing withdrawal limits, adding new assets, modifying permissions).
- **Human-readable transaction summaries** — Multisig UIs should clearly display the effect of every instruction being signed, not just raw data.
- **Rotation & quorum policies** — Require higher quorum thresholds for destructive operations (e.g., 4-of-6 for normal ops, 6-of-6 for removing withdrawal limits).
- **Durable nonce monitoring** — Alert on creation of durable nonce accounts that reference protocol admin PDAs.
- **Immutable circuit breakers** — Per-epoch withdrawal caps and TVL drain guards that even admin keys cannot instantly disable.

**Reference Incident:** [Drift Protocol (April 2026)](https://www.theblock.co/post/396183/drift-280m-exploit-zachxbt-circle) — Attacker pre-positioned durable nonce transactions, obtained multisig approvals via social engineering, seized Security Council admin powers, introduced a malicious asset, removed withdrawal limits, and drained ~$280M in JLP, SOL, USDC, cbBTC, and wBTC across multiple vaults (JLP Delta Neutral, SOL Super Staking, BTC Super Staking). Not a smart contract bug or seed phrase compromise. Circle failed to freeze ~$230M USDC within the 6-hour window despite the funds transiting via CCTP to Ethereum.


## Missing Circuit Breakers and Automated Incident Response

Every incident referenced in this taxonomy would have been **reduced or prevented** by on-chain circuit breakers. Even when the root vulnerability is a code-level flaw (e.g., missing account validation), a circuit breaker acts as a **defense-in-depth** layer that limits the blast radius.

**Incident impact analysis:**

| Incident | Circuit breaker that would have helped |
|---|---|
| Resolv (2026) | Mint-rate cap — 80M USR minted in minutes would have tripped a per-epoch ceiling |
| Mango (2022) | Borrow-rate / TVL-drain cap — $115M borrowed in one session against spiked collateral |
| Nirvana (2022) | Treasury-outflow cap — $3.5M drained from treasury in a single flash-loan tx |
| Cashio (2022) | Mint-rate cap — 2B $CASH minted in one transaction |
| Step Finance (2021) | Withdrawal-rate cap — would have slowed fund drainage |
| Wormhole (2022) | Per-epoch bridge cap — 120K wETH minted in a single attestation |
| Crema (2022) | Max-claim threshold — anomalous $8.7M fee withdrawal in one call |
| Drift (2026) | Withdrawal-rate / TVL-drain cap — $280M drained across multiple vaults after admin removed withdrawal limits; a hardcoded per-epoch ceiling not modifiable by admin would have capped losses |

### Types of on-chain circuit breakers

**1. Rate Limiters (per-epoch caps)**
Enforce maximum mint/redeem/borrow volume within a time window (epoch, slot range, or clock-based).

```rust
// Anchor example: per-epoch mint cap
#[account(
    mut,
    constraint = vault.minted_this_epoch < vault.max_mint_per_epoch
        @ VaultError::MintCapExceeded
)]
pub vault: Account<'info, Vault>,
```

**2. TVL Drain Guards**
Halt operations when total value locked drops by more than a threshold (e.g., >10%) within a single epoch or time window.

```rust
// Pseudo-logic in instruction handler
let drain_pct = (vault.prev_tvl - vault.current_tvl) * 100 / vault.prev_tvl;
require!(drain_pct <= MAX_DRAIN_PCT, VaultError::DrainGuardTripped);
```

**3. Admin Pause / Emergency Freeze**
A privileged admin or multisig can freeze all vault operations. On Solana, this is typically a boolean flag on the vault state PDA.

```rust
#[account(
    constraint = !vault.paused @ VaultError::VaultPaused
)]
pub vault: Account<'info, Vault>,
```

**4. Per-Transaction Amount Caps**
Limit the maximum value that can flow through a single instruction (mint, redeem, borrow, bridge).

```rust
require!(amount <= vault.max_per_tx, VaultError::TxAmountExceeded);
```

**5. Anomaly-Triggered Auto-Pause (off-chain + on-chain)**
An off-chain monitoring service (e.g., Chainalysis Hexagate, OtterSec Sentinel) watches for anomalous on-chain events and triggers an on-chain `pause` instruction via a keeper or multisig. This is explicitly what the Resolv post-mortem identifies as the missing safeguard.

**6. Oracle Deviation Guards**
Reject operations when the oracle price deviates beyond a confidence threshold or moves more than X% within a window.

```rust
let price_change_pct = abs(current_price - last_price) * 100 / last_price;
require!(price_change_pct <= MAX_PRICE_MOVE, VaultError::OracleDeviationExceeded);
```

### Key principle

Circuit breakers do **not** fix root-cause vulnerabilities — they **contain damage** while the root cause is investigated. A vault with proper account validation **and** circuit breakers has two independent layers of defense.

