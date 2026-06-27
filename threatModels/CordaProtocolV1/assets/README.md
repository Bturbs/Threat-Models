# CordaProtocolV1 Diagrams

This directory contains PlantUML diagrams documenting the Corda Protocol V1 architecture, with a focus on the on-chain wallet whitelisting implementation.

## Diagrams

### 1. Architecture Overview
**File:** `architecture.puml`

High-level view of the V1 system components:
- Vault Program and state accounts
- ACL Gate program for transfer hook validation
- Token-2022 integration
- Whitelist enforcement points

### 2. Vault Data Model
**File:** `vaultDataModel.puml`

Detailed class diagram showing:
- All active PDAs (VaultState, VaultWhitelistEntry, InvestmentProposal, RedemptionProposal, etc.)
- Programs (Vault, ACL Gate)
- Instructions (admin, investor, curator)
- Token mints and accounts
- Relationships and authority flows

Focus on whitelist-related structures and their interactions.

### 3. Investment Settlement Flow
**File:** `investmentSettlement.puml`

Sequence diagram showing the critical path for settling investments with whitelist enforcement:
1. Curator authorization check
2. **Whitelist validation** (critical security check)
3. NAV-based vToken calculation
4. vToken account thawing via ACL Gate when needed
5. vToken minting to whitelisted investor

### 4. Whitelist Management Flow
**File:** `whitelistManagement.puml`

Sequence diagram showing admin operations:

**Add to Whitelist:**
- Admin authorization
- VaultWhitelistEntry PDA creation
- Setting whitelisted = true

**Remove from Whitelist:**
- Admin authorization
- Setting whitelisted = false
- FLAG_ACCOUNT funding
- vToken account freezing via ACL Gate

### 5. ACL Gate Transfer Hook Validation
**File:** `aclGateValidation.puml`

Detailed sequence diagram of Token-2022 transfer hook execution:

**Thaw (Unfreeze) Scenario:**
- Transfer hook invocation
- Extra account metas parsing
- Whitelist PDA validation
- Whitelist status check
- Allow/deny decision

**Freeze Scenario:**
- Similar validation
- Ensures account is NOT whitelisted before freezing

## Key Security Flows

### Whitelist Enforcement Points

1. **Settlement Time** (`settle_investment`)
   - Whitelist check BEFORE minting vTokens
   - Prevents non-KYC'd investors from receiving shares

2. **Transfer Time** (Token-2022 transfer hook)
   - ACL Gate validates whitelist on every transfer
   - Frozen accounts cannot transfer
   - Removal from whitelist triggers immediate freeze

### Critical PDAs

- **VaultWhitelistEntry:** `["vault_whitelist_entry", vtoken_mint, owner]`
  - Owner: VaultProgram
  - Fields: mint, owner, whitelisted, bump

- **FLAG_ACCOUNT:** `["FLAG_ACCOUNT", vtoken_account]`
  - Owner: Token ACL Program
  - Tracks freeze state per account

## Generating SVG Diagrams

To generate SVG output from PlantUML files:

```bash
# Using PlantUML CLI
plantuml -tsvg *.puml

# Using Docker
docker run -v $(pwd):/data plantuml/plantuml -tsvg /data/*.puml

# Using VS Code extension
# Install "PlantUML" extension and use preview/export features
```

## References

- Vault Program: `/Users/david.cervigni/workspace/corda-protocol-mvp/programs/vault`
- ACL Gate: `/Users/david.cervigni/workspace/corda-protocol-mvp/programs/vault-acl-gate`
- Tests: `/Users/david.cervigni/workspace/corda-protocol-mvp/tests/vault/`

## Notes

All diagrams follow the style established in CordaProtocolV0 with enhancements to show:
- Whitelist validation checkpoints
- ACL Gate integration
- Token-2022 freeze/thaw mechanics
- Admin vs. Curator authorization boundaries
