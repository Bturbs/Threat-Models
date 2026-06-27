# Wallet Auth Middleware Comparison

## Custodian vs. Wallet Middleware — Key Distinction

A **custodian** (e.g., Anchorage) holds and manages private keys on behalf of users — they have direct control over the assets.

**Wallet connection/authentication middleware** (Privy, Web3Auth, WalletConnect) does **not** custody funds. These services sit between a web UI and the blockchain, helping users authenticate and sign transactions. They are comparable to each other, not to custodians.

---

## Glossary

| Acronym | Full Name | Meaning |
|---|---|---|
| **MPC** | Multi-Party Computation | A cryptographic technique where the private key is split into multiple shares held by different parties. No single party ever holds the complete key. Signing requires collaboration between shares without reconstructing the full key. |
| **SSS** | Shamir's Secret Sharing | A scheme that splits a secret (e.g., a private key) into _n_ shares, of which any _k_ are needed to reconstruct it. Used by some providers alongside or instead of MPC. |
| **RPC** | Remote Procedure Call | The API endpoint used to communicate with blockchain nodes (e.g., submit transactions, read state). Providers like Helius, QuickNode, and Triton run Solana RPC nodes. |
| **dApp** | Decentralized Application | A web application that interacts with smart contracts on a blockchain. |
| **PDA** | Program Derived Address | A Solana address deterministically derived from a program ID and seeds — not backed by a private key; only the owning program can sign for it. |
| **Ed25519** | Edwards-curve Digital Signature Algorithm (Curve25519) | The elliptic curve signature scheme used by Solana for all keypairs and transaction signing. |

---

## What Each Does

| Service | Role | How It Works | Advantages |
|---|---|---|---|
| **[Privy](https://www.privy.io/)** | Embedded wallet + auth provider | Creates wallets for users behind social logins (email, Google, etc.). Uses MPC/SSS to split keys — Privy alone cannot sign. | Smooth onboarding for non-crypto users; no wallet install needed; full UX control; supports progressive self-custody (user can export key later). |
| **[Web3Auth](https://web3auth.io/)** | Auth + key infrastructure | Social login to derive or reconstruct keys via MPC. User "owns" the key but never sees a seed phrase. | Open-source core; flexible MPC key infrastructure; wide social login support; can be self-hosted for more control; chain-agnostic. |
| **[WalletConnect](https://walletconnect.network/)** | Wallet connection protocol | Bridges your dApp to the user's **existing** wallet (Phantom, Backpack, etc.) via QR code or deep link. No embedded wallet creation. | User retains full custody; no key material on your side; supports hardware wallets; broad wallet ecosystem; battle-tested protocol. |

---

## Flows for a Solana dApp with Web UI

### Flow 1: User Authentication & Wallet Setup

**With Privy / Web3Auth (embedded wallet):**

```
User ──▶ Web UI ──▶ Auth Provider (Privy / Web3Auth)
                          │
                          ├─ Social login (Google, email, passkey, etc.)
                          ├─ MPC key generation or reconstruction
                          │   (key shares split between client, provider, and/or recovery)
                          └─ Returns: Solana public key + signing capability
```

The user never sees a seed phrase or installs a wallet extension. The auth provider creates and manages key shares using MPC so that:
- The **client** holds one share (in browser/device)
- The **provider** holds another share (server-side)
- A **recovery share** may be stored separately (e.g., cloud backup, device enclave)

No single party can sign alone. Signing happens via a distributed protocol between shares.

**With WalletConnect (external wallet):**

```
User ──▶ Web UI ──▶ WalletConnect ──▶ User's existing wallet (Phantom, Backpack, etc.)
                                              │
                                              └─ User approves connection in wallet
```

The user already has a wallet installed. WalletConnect just bridges the communication.

---

### Flow 2: Transaction Signing & Submission

```
Web UI builds a Solana transaction (e.g., invoke a smart contract instruction)
       │
       ▼
Signing request ──▶ Middleware (Privy / Web3Auth) OR external wallet (WalletConnect)
       │
       ├─ Privy / Web3Auth: MPC signing across client + server shares
       │   (user may see a confirmation modal, but no wallet popup)
       │
       └─ WalletConnect: redirects to user's wallet app for manual approval
       │
       ▼
Signed transaction ──▶ Solana RPC node (Helius, QuickNode, Triton, etc.) ──▶ Solana network
       │
       ▼
Transaction confirmed ──▶ Web UI updates state
```

**Key point:** In all cases, the signed transaction is submitted to a standard Solana RPC endpoint. The middleware only handles authentication and signing — it does not run validators or process transactions itself.

---

### Flow 3: End-to-End Architecture

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────┐     ┌──────────────┐
│  Web UI     │────▶│ Wallet Middleware │────▶│ Solana RPC  │────▶│ Smart        │
│ (React,     │     │ (Privy/Web3Auth/ │     │ (Helius,    │     │ Contract     │
│  Next.js)   │◀────│  WalletConnect)  │◀────│  QuickNode) │◀────│ (On-chain)   │
└─────────────┘     └──────────────────┘     └─────────────┘     └──────────────┘
   Build tx            Sign tx                 Submit tx          Execute instruction
```

---

## How to Choose

| Criteria | Privy / Web3Auth | WalletConnect |
|---|---|---|
| **Target users** | Non-crypto-native (mainstream users) | Crypto-native (already have wallets) |
| **Onboarding friction** | Low — social login, no wallet install | Higher — requires existing wallet |
| **Key custody** | MPC-split (provider + client + recovery) | User-held (full self-custody) |
| **UX control** | Full — no wallet popups, branded experience | Partial — user approves in external wallet |
| **Hardware wallet support** | Limited (some via passkeys) | Native — Ledger, Trezor via wallet apps |
| **Dependency risk** | Higher — signing depends on provider infra | Lower — protocol-based, wallet-agnostic |
| **Self-hosting** | Web3Auth: yes (partial). Privy: no. | N/A — it's a protocol, no hosting needed |
| **Best for** | Consumer-facing dApps, smooth UX | Operator/power-user tools, DeFi users |

### Recommendation by User Type

- **End users / consumers** interacting with the dApp: Privy or Web3Auth (embedded wallet, minimal friction)
- **Operators / signers** managing multisig governance: WalletConnect or direct wallet adapters (Phantom, Backpack) — they need hardware wallet support and full key control
- **Both audiences in one app**: Use a wallet adapter library (e.g., `@solana/wallet-adapter`) that supports embedded providers AND external wallets, letting users choose

---

## Privy Investigation Notes (10 Mar 2026)

Initial investigation of [Privy](https://www.privy.io/) as a wallet connection and user management provider.

### Demo Findings (demo.privy.io, Solana devnet)

Validated capabilities:

- Connected a Phantom wallet with a throw-away dev key
- Enabled 2FA / passkey on the account
- Linked a Telegram ID to the account
- Signed a message from the Privy app, confirmed in Phantom
- Configured the demo app to **only allow login via a pre-existing wallet** (no embedded wallet creation)

**Key insight:** For early iterations, the external-wallet-only mode is likely what we want — we are not interested in embedded wallets initially. Privy can restrict login to pre-existing wallets only.

The login screen also lists support for **custodied MPC wallets** (e.g., Anchorage Digital, Fireblocks), which would allow institutional users to connect their custody-managed wallets through Privy.

### Architecture Components

**Dashboard:**
- Central administration point for creating/configuring apps
- Usage monitoring and user administration
- Login can be protected with 2FA or SSO (Microsoft logins supported — usable with our org SSO)

> **Open question:** Who/what organisation should access, monitor, or control the dashboard?

**REST API / SDKs:**
- Dashboard provides an `app ID` + `secret` per app for API access
- **Backend SDK:** Access user info, wallet IDs, request transaction signatures (user must confirm)
- **Frontend SDK:** Provides a "user pill" widget embeddable in a web app — handles login, wallet connection, social account linking, etc.

### Pricing

- Enterprise pricing is negotiable
- **Free tier** available — sufficient for all development and test work
- See: [Privy Pricing](https://www.privy.io/pricing)

### Next Steps

1. Create a dashboard account on the free tier
2. Integrate into a test app to evaluate the flow for our use case
3. Test with a multisig wallet (e.g., connect an Anchorage Digital wallet if a test instance is available)

### Implications for Our Architecture

Based on this investigation, the likely integration approach for early iterations:

```
┌──────────────┐     ┌──────────────────────┐     ┌──────────────┐     ┌───────────┐
│  Web UI      │────▶│ Privy Frontend SDK   │────▶│ Solana RPC   │────▶│ On-chain  │
│  + User Pill │     │ (wallet-only mode)   │     │              │     │ Program   │
│              │◀────│                      │◀────│              │◀────│           │
└──────────────┘     └──────────────────────┘     └──────────────┘     └───────────┘
                              │
                     ┌────────┴────────┐
                     │ External Wallet │
                     │ (Phantom,       │
                     │  Anchorage,     │
                     │  Fireblocks)    │
                     └─────────────────┘
```

```
┌────────────────────┐     ┌──────────────────────┐
│  Backend Service   │────▶│ Privy Backend SDK    │
│  (Node.js, etc.)   │     │ (user info, wallet   │
│                    │◀────│  IDs, sign requests)  │
└────────────────────┘     └──────────────────────┘
                                    │
                           ┌────────┴────────┐
                           │ Privy Dashboard │
                           │ (admin, monitor,│
                           │  SSO-protected) │
                           └─────────────────┘
```

**Wallet-only mode flow:**

1. User opens the web UI
2. Privy "user pill" presents wallet login options (Phantom, Anchorage, Fireblocks, etc.)
3. User connects their pre-existing wallet — no embedded wallet is created
4. Backend can query Privy for the connected wallet's public key
5. Transactions are built by the app, signed by the user's external wallet, submitted to Solana RPC
