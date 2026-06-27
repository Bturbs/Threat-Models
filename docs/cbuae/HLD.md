







CBUAE: CBDC Phase 2
Phase 2 Retail CBDC Solution:
High-Level Architecture
Omar Awad | 2025/04/04
V6










1 
Executive summary
This document provides an overview of the end-to-end Retail CBDC [AT1]Solution to be developed, deployed and operated at CBUAE. All other detailed documents (such as high-level design artefacts) should be read in conjunction with this document. 
The CBDC Phase 2 Program builds on the success of the Phase 1 Program and aims to enhance the financial infrastructure of the country by introducing a new form of digital money (CBDC). This document outlines the high-level facets of the solution architecture, programmability capabilities, real-time settlement in central bank money, and key design decisions.
Key highlights include:
* Solution architecture: The proposed solution adopts a hybrid intermediate CBDC architecture, in which the CBUAE is the sole issuer of CBDC liable for the ultimate claims, but the Licensed Financial Institutions (LFIs) manage distribution and customer interactions.. 
* Pilot program insights: The document references a previous pilot program named FastTrack, which addressed retail payments and other business use-cases. The pilot provided valuable learnings that form the foundation of the current solution proposal.
* Key objectives: The Digital Dirham will unlock innovation, accelerate the digital economy and drive financial inclusion. The solution focuses on delivering real-time CBDC settlements and transaction governance through programmable contracts. It allows LFIs and the CBUAE to apply their own governance policies for all transactions on their network.
* Use cases: The solution supportsfoundational use cases and four digital economy use cases : Peer-to-Peer Transfers (P2P), Peer-to-Merchant Transfers (P2M), Programmability, Top-up, Withdrawal, Smart Social, and Smart Tourist, Parent-Child, Fractional Ownership.
* System design: The system adopts a user-centric micro-applications architecture style, allowing organizations to host a subset of applications that meet their specific requirements.
* Design decisions: Key design decisions are described in section Design  on page 60.
The document provides a comprehensive overview of the proposed solution, its architecture, and the key business flows that will be supported by the CBDC Phase 2 Program.


Table of contents
EXECUTIVE SUMMARY	2
TABLE OF CONTENTS	3
TABLE OF FIGURES	6
TABLE OF TABLES	7
1	OVERVIEW	8
1.1	Summary	8
1.2	History and background	9
1.2.1	Observations	9
1.3	Thesis	9
2	PREREQUISITES	10
2.1	Terminology	10
3	REQUIREMENTS	11
3.1	Key objectives	11
3.2	Use cases	11
4	SOLUTION DESIGN	12
4.1	System overview	12
4.1.1	Functional layers	12
4.1.2	System context	14
4.1.3	Functional view	14
4.1.4	System topology	18
4.1.5	Organizations assumptions and responsibilities	19
4.2.1	Key business flows	20
4.2.1.1	Issuance flow	20
4.2.1.2	Transfer flow	21
4.2.1.3	Payments to merchants (P2M)	23
4.2.1.4	Wallet top-up	23
4.2.1.5	Wallet withdrawal flow	24
4.2.1.6	Redeem flow	25
4.3	Core Business Services	26
4.4	Wallet Services	27
4.4.1	Wallet hierarchy	28
4.4.2	Shareable wallets	28
4.5	Corda DLT	29
4.5.1	Blocks processing and lifecycle	30
4.6	Corda Contracts	33
4.7	Identities and access management	35
5	SOLUTION ANALYSIS	36
5.1	Programmability scenarios	36
5.1.1	Person-to-Person Transfer use case	36
5.1.1.1	Scenario 1	36
5.1.1.2	Scenario 2	37
5.1.2	Person-to-Merchant Transfer use case	39
5.1.2.1	Scenario 1	39
5.1.2.2	Scenario 2	40
5.1.3	Parent-Child use case	42
5.1.3.1	Scenario 1	42
5.1.3.2	Scenario 2	43
5.1.4	Smart Social use case	45
5.1.4.1	Scenario 1	45
5.1.4.2	Scenario 2	47
5.1.4.3	Scenario 3	49
5.1.4.4	Scenario 4	52
5.1.5	Smart Tourist use case	53
5.1.5.1	Scenario 1	53
5.1.5.2	Scenario 2	56
5.1.5.3	Scenario 3	57
5.2	User onboarding procedure	59
5.3	Design decisions	60
5.3.1	CBDC delivery strategy	60
5.3.2	Application architecture	60
5.3.3	Application boundaries	61
5.3.4	Network topology	61
5.3.5	Applications tenancy model	61
5.3.6	Retail users’ wallet accounts	62
5.3.7	IAM and user management	62
5.3.8	Corda DLT nodes	62
5.3.9	Corda Contracts execution model	63
5.3.10	Asset programmability	63
5.3.11	Wallet management policies	63
5.3.12	Corda Contracts boundaries	64
5.3.13	Corda Contracts data scope	64
5.3.14	Retail users’ primary global wallets	64
5.3.15	Retail transactions settlement	65
5.3.16	Local contracts on shared wallets	65
5.3.17	Central Bank participation	66
5.3.18	Central reserve ledger (FlexCube)	66
5.3.19	Wallet’s top-up and withdrawal	66
5.3.20	Merchant payments	67
5.3.21	Wallets hierarchy	68
5.3.22	Custody of subsidized wallets	68
5.3.23	DLT transactions processing	68
5.3.24	DLT block processing	69
5.3.25	DLT transaction lifecycle	69
5.3.26	DLT transactions grouping	69
6	DISCLAIMER	71

Table of figures
Figure 11: CBDC Architecture Models	9
Figure 41: Functional Layers	14
Figure 42: Solution Context	15
Figure 43: Functional View	17
Figure 44: Solution Topology	20
Figure 45: Issuance flow	22
Figure 46: Transfer Flow	23
Figure 47: P2M Flow	24
Figure 48: Top-Up Flow	25
Figure 49: Withdrawal Flow	26
Figure 410: Redeem flow	27
Figure 411: Core Business Services	28
Figure 412: Wallets Topology	29
Figure 413: DLT Privacy	30
Figure 414: DLT Transactions	31
Figure 415: DLT Blocks	33
Figure 416: Transactions Settlement	34
Figure 417: Corda Contracts	35
Figure 418: Identity Access Management	36
Figure 51: P2P Scenario 1 - Diagram	38
Figure 52: P2P Scenario 1 - Flow	38
Figure 53: P2P Scenario 2 - Diagram	39
Figure 54: P2P Scenario 2 - Flow	39
Figure 55: P2M Scenario 1 - Diagram	40
Figure 56: P2M Scenario 1 - Flow	41
Figure 57: P2M Scenario 2 - Diagram	42
Figure 58: P2M Scenario 2 - Flow	42
Figure 59: Parent-Child Scenario 1 - Diagram	43
Figure 510: Parent-Child Scenario 1 - Flow	44
Figure 511: Parent-Child Scenario 2 - Diagram	45
Figure 512: Parent-Child Scenario 2 - Flow	46
Figure 513: Smart Social Scenario 1 - Diagram	47
Figure 514: Smart Social Scenario 1 – Flow	48
Figure 515: Smart Social Scenario 2 - Diagram	49
Figure 516: Smart Social Scenario 2 - Flow	50
Figure 517: Smart Social Scenario 3 - Diagram	51
Figure 518: Smart Social Scenario 3 - Flow	52
Figure 519: Smart Social Scenario 4 - Diagram	53
Figure 520: Smart Social Scenario 4 - Flow	54
Figure 521: Smart Tourist Scenario 1 - Diagram	55
Figure 522: Smart Tourist Scenario 1 - Flow	56
Figure 523: Smart Tourist Scenario 2 - Diagram	57
Figure 524: Smart Tourist Scenario 2 - Flow	58
Figure 525: Smart Tourist Scenario 3 - Diagram	59
Figure 526: Smart Tourist Scenario 3 - Flow	60
Figure 528: Applications Architecture	61

Table of tables
Table 1: Organizations Assumptions	20
Table 2: Organizations Responsibilities	21



1 Overview
1.1 Summary
R3 is designing and developing a domestic Retail CBDC solution for CBUAE to transform the country's financial infrastructure and implement [PYL3]the future of money. This document outlines the high-level facets of the solution architecture, programmability capabilities, real-time transaction settlement and key design decisions. The solution adopts hybrid intermediate CBDC architecture, which indicates the ultimate claim is a liability on the Central Bank, but the distribution aspects fall on the LFIs.

Figure 11: CBDC Architecture Models


1.2 History and background
R3 previously conducted a pilot program named FastTrack which addressed retail payments and other business use cases on top. This pilot produced valuable learnings that are the foundation of this solution proposal. Retail user accounts in the pilot were onboarded directly on the distributed ledger, which meant that every retail payment initiated a dedicated transaction on the DLT in real-time. Corda contracts addressed the programmability concerns applied directly on the ledger to govern the issued tokens. The intention was to provide capabilities to control digital money as it was being exchanged in the market.
1.2.1 Observations
The pilot program shed light on a few key observations being addressed in the current proposed solution.
* The distributed ledger could not scale to accommodate the retail user accounts. Virtual identities are not reliable on scale.
* The settlement network gets overwhelmed in high-traffic scenarios.
* Applying governance rules on the token level is difficult.
1.3 Thesis
The R3 Retail CBDC Solution addresses these bottlenecks by restructuring the DLT layer to accommodate physical nodes that represent LFIs on the network. In the meantime, another layer on top of the DLT will handle the retail user operations and accounts. The programmable contracts will be redesigned to operate across both layers on the node or at the user account level rather than directly on the tokens. This approach allows versatility in building a variety of business applications that can accommodate scenarios of high-volume, low-latency transactions.


2 Prerequisites
2.1 Terminology
* Corda Enterprise: Blockchain platform built by R3 that enables enterprise clients to create a variety of business applications backed by a DLT, workflows and programmable contracts.
* Corda DLT: The distributed ledger component of Corda.
* Corda Workflows: The workflow framework that allows applications to orchestrate business flows on Corda.
* Corda Networks: A standard network component used to build various cluster topologies for organizations building applications on Corda.
* Corda Contracts: A deterministic policy representing a set of business rules that can be assigned on nodes or other applications to govern its activities.
* Wallet Services: A decentralized application that supports a variety of operations around managing user accounts and facilitating user transaction settlement on the DLT.
* Issuance Platform
* Identity Access Management (IAM): Multiple components that facilitate user management, authentication, authorization, and identity federation.
* Certificate Authority (CA): A trusted third-party organization that issues digital certificates to verify the participants on the network.
* Asymmetric Keys: A cryptographic scheme requiring two different keys, one to lock or encrypt the plaintext and one to unlock or decrypt the cyphertext.
*  CBUAE’s Reserve Banking Platform (FlexCube): The Central Bank ledger that holds the balances of all LFIs. The CBUAE uses Oracle FLEXCUBE as their ledger.
* CBUAE’s CBDC Ledger: The Central Bank CBDC ledger that holds a record of all transactions on the network. 
* Hub Network: The Central Bank’s shared network that all LFI traffic is routed through. This is part of the Hub-Spoke topology.
* Organization: Any participant on the Corda network. It can be an LFI, the Central Bank, or any third-party service provider that was onboarded onto the network.
* End user: Users that operate on the retail network through the CBDC mobile application as consumers. These can be retail users retail users include individuals, business and government entities
* 
3 Requirements
3.1 Key objectives
The proposed solution focuses on delivering real-time CBDC transaction settlements and transaction governance through programmable contracts. As well as enabling digital economy use cases. Key facets of the solution are:
* LFIs and the Central Bank on the CBDC network can apply their own governance policies for all transactions on their network.
* Central Bank is the sole issuer of CBDC.
* The Central Bank is always a participant in every transaction on the network.
* The network distributed ledger is the source of truth of all transactions, retail or otherwise.
* The Central Bank can apply global policies on the network.
* Retail consumer users PII data are maintained in their respective banks or LFIs. The Central Bank does not have access to retail user PII data.
* Transactions on the network are eventually updated on the CBUAE’s Reserve Banking System.
3.2 Use cases
The solution is driven by these key use cases for CBUAE:
* Foundational Use Cases
* Peer-to-Peer Transfers (P2P): End users can make transfers to other retail users.
* Peer-to-Merchant Transfers (P2M): End-users make payments to merchants on the network.
* Top-up: End-users can top-up their CBDC wallets from the universal app.
* Withdrawal: End-users can withdraw their CBDC from the universal app.[AT4]
* Key Digital Economy Use Cases
* Parent-Child: End-users (parents) can add and govern accounts for their dependents (children) on the network.
* Smart Social: The government can issue and manage subsidies to end-users on the network.
* Smart Tourist: Tourist wallets for non-residents, programmable digital dirham to attract tourists.
* Fractional Ownership: End users can pay for partial ownership of digital assets on other CBDC networks.
The detailed definitions of all use cases are provided in CBUAE Phase 2 Business Requirements Document.
4 Solution design
4.1 System overview
The proposed solution adopts a micro-applications architecture style, which is user-centric rather than system-centric. This paradigm enables a more cohesive and scalable eco-system of many applications with specific specializations. This allows organizations to host a subset of the available applications that satisfy their requirements only. 
Organizations can build their own applications living in the same ecosystem and interact with other micro-apps to satisfy their business needs. A dedicated high-level design document is provided for solution components that explore each area in more depth.
4.1.1 Functional layers
The system components are designed around various functional layers that have clear abstraction between them. This allows organizations to swap applications within each layer without an impact on the rest of the ecosystem. This segregation also establishes clear security boundaries around each layer, which restrict the blast radius. 
The core layers are horizontal, and applications in each layer only communicate downstream to the layer below, and there are components that cross-vertically across the core layers, such as security and policies. The diagram below shows the critical system layers.

Figure 41: Functional Layers
The aforementioned layers cut through all the organizations on the network. Applications in each layer can be local to the organization or decentralized applications that operate on the level of the network as a whole.
* Core Layers
* Channels: Encapsulate applications and services that end-users interact with the platform through such as mobile applications, web portals, POS, and APIs.
* Business Applications: Encapsulate all applications that implement business use cases or workflows such as transfer, issuance, and redemption.
* Wallet Services: Encapsulate all end-users account management, payment services and transaction processing.
* Settlement Layer: Encapsulate the main ledger into which all network activity is settled and stored. This can be a distributed ledger or a central ledger.
* Application Clusters: Encapsulate the network components and connectivity configuration required to set up application clusters for the organizations on the network.
* Cross-Cutting-Concerns Layers
* Contracts and Policies: Encapsulate the programmability services that can govern activities on applications across all the other layers.
* Identity Access Management: Encapsulate the components necessary for user management, authentication, authorization, and identity federation.
* Certificates and Cryptography: Encapsulate the public key infrastructure (PKI), certificate management and secret management components.
4.1.2 System context
The high-level view of the system context demonstrates various types of organizations and actors in the system. It emphasizes the relationship between them without sharing details on the capabilities of each. The main organization types for CBUAE are the CBUAE itself, retail banks, payment providers, and other types of financial institutions that must participate in the network. 
The actors are end users (individuals), business and government entities. All organizations in the system are connected through a central hub network hosted in the CBUAE. Actors (users) can access the platform through multiple channels such as universal mobile applications, POS, and web portals, depending on the type of the end user.

Figure 42: Solution Context
4.1.3 Functional view
This functional view of the system showcases the various applications each organization can host to meet its needs. Applications under the micro-app architecture are specialized, and organizations only need to host applications that provide the required capabilities they require. Some applications operate locally within the organization they are hosted in, while others are decentralized, operating across the network.


Figure 43: Functional View

The main applications inventory provided in the retail CBDC system are:
* Organizational Applications
* Local Applications
* Issuance Platform (Command Center): An application that allows users to view their assets across connected networks and trigger issuance or redemption.
* Core Business Services: Business services that orchestrates the core flows of issuance, redemption, and transfer on connected networks.
* Corda Contracts: The programmability services that provide organizations with the ability to build contracts that govern activities and set policies over their networks.
* Acquirer Gateway: The main gateway for acquirers, which provides the necessary integration points with the acquirer systems.
* Application Gateway: This is the main gateway for the CBDC mobile application, which provides the necessary integration points with the CBDC platform.
* Cryptographic Key Management: The components necessary to manage asymmetric keys and secrets across all applications in the organization network.
* Certificate Authority: The application that manages certificates from issuance, revocation, and expiry.
* Identity Access Management (IAM): Multiple components that facilitate user management, authentication, authorization, and identity federation for each organization.
* Central Reserve Ledger (FlexCube): The Central Bank ledger that holds the balances of all LFIs. The CBUAE uses Oracle FLEXCUBE as their ledger.
* Central Bank CBDC Ledger: The Central Bank CBDC ledger that holds a record of all transactions on the network. 
* UAE PASS Bridge: A third-party authentication provider in the UAE.
* Decentralized Applications
* Public Key Infrastructure (PKI): Manages asymmetric keys for applications across the network.
* Wallet Services: Application that provides end-user account (wallet) management, provides payment services and facilitates transaction processing.
* Distributed Ledger (DLT): Corda DLT that settles and stores all network transactions across participants. This is the source of truth of all network transactions.
* End-user Applications
* CBDC Mobile Application: A universal mobile application that provides necessary retail services for end users (consumers), such as wallet access and payments.
4.1.4 System topology
The system topology showcases the conceptual network topology, application groups and connectivity between applications across the network. Hub and spoke network topology are adopted, in which the Central Bank network is the hub and LFI networks are the spokes. This model ensures that all organizations' traffic is routed through the Central Bank hub and that no peer-to-peer traffic between organizations is permitted. Mutual TLS connections can be terminated in the hub for inspection and re-established between the hub and the target spoke.
The shared network between organizations (spokes) and the hub (Central Bank) hosts decentralized applications such as Wallets Services and Corda DLT. Organizations’ local applications do not have access to the shared network, and only operate in the organization's local network. This segregation enforces system and data boundaries between various participants on the system to protect private organization data.
Onboarding an organization (LFI) requires creating a dedicated spoke network, an intermediate certificate with a chain of trust from the Central Bank root certificate, and connectivity to the hub network.

Figure 44: Solution Topology
4.1.5 Organizations assumptions and responsibilities
Assumptions:
CBUAE
LFI
CB will initially host all solution infrastructure, including the LFI’s networks
LFIs will only have portal access to retail applications like Wallets and the Issuance platform
CB will have Corda Enterprise access and will ensure LFIs do not have direct access to it
LFIs do not host or maintain retail application infrastructure or solutions
CB will not access retail consumers' PII data nor provide direct service to them
LFIs are not responsible for maintaining or troubleshooting application instances
Table 1: Organizations Assumptions


4.2 

Responsibilities:		
CBUAE
LFI
Host the central hub network for all retail traffic.
Operate their Identity Access Management (IAM) solution to manage consumer identities and accounts.
Host network and application instances for each LFI and itself.
Provide retail services to consumers.
Maintain and update the hosted applications regularly.
Handle wallets, user accounts, issuance platform, and key management tasks.
Store transactional data in cold storage for compliance.
Monitor transactions and provide operational support using the application portals from the Central Bank.
Run a private certificate authority (CA) to issue certificates and assign legal identities to each LFI application.

Table 2: Organizations Responsibilities
4.2.1 Key business flows

4.2.1.1 Issuance flow
LFI’s will request issuance of CBDC which will trigger the debit from LFI’s reserve account and credit of LFI’s retail CBDC account in CBUAE’s Flexcube Core Banking System. If the debit and credit is successful, retail CBDC is minted in the CBUAE wallet and transferred to the LFI wallet. The following diagram shows the high-level sequence of the transaction lifecycle.

Figure 45: Issuance flow
4.2.1.2 Transfer flow
All retail transactions will trigger a transfer between LFIs (organizations). The following diagram show the high-level sequence of a transaction lifecycle.


Figure 46: Transfer Flow
1.1.1.1 
4.2.1.3 Payments to merchants (P2M)
To streamline payments to merchants, the Digital Dirham application can scan the existing QR codes that Aani rolled out in CBUAE to initiate a transfer directly to the merchant CBDC wallet. All merchant payments are made in CBDC [AT5]via Aani and/or alternate payment methods agreed as part of the scope of phase 2. Merchants can withdraw CBDC to fiat on-demand. The following diagram shows the high-level sequence of a standard P2M flow.

Figure 47: P2M Flow
4.2.1.4 Wallet top-up
Topping up consumer wallets can be facilitated through multiple methods such as Aani, bank deposits, debit card and cash. The current design focuses on integrating with Aani and direct bank API’s but it’s extendible to support the other methods. The following diagram demonstrates a high-level illustration of topping up a CBDC wallet with Aani. The Digital Dirham application (part of CBDC platform) will trigger the Aani application to initiate a fiat transfer to the LFI account. Once the funds are received, the LFI will handle the orchestration to kick off the CBDC transfer leg part of the overall transaction. The following diagram shows the high-level sequence of the top-up flow.[AT7][AT8]

Figure 48: Top-Up Flow
4.2.1.5 Wallet withdrawal flow
To withdraw CBDC from a wallet to a consumer fiat account, the user can initiate a withdrawal from the Digital Dirham application (part of CBDC platform), which will transfer CBDC to the LFI wallet. Once the CBDC is received, the LFI will handle the orchestration to kick off the fiat transfer leg of the overall transaction. The following diagram shows the high-level sequence of the withdrawal flow.[AT9]

Figure 49: Withdrawal Flow
4.2.1.6 Redeem flow
LFI’s will request redemption of CBDC which will trigger the collateral movement from LFI’s retail CBDC account to LFI’s settlement account in CBUAE’s Flexcube Core Banking System. If the collateral movement is successful, retail CBDC is transferred to CBUAE wallet from LFI wallet and then deducted from CBUAE wallet. The following diagram shows the high-level sequence of the transaction lifecycle.

Figure 410: Redeem flow

4.3 Core Business Services
A suite of micro-services is responsible for executing and orchestrating the core business flows for each connected CBDC network, such as issuance, redemption, and transfer. These services host the workflows for cross-border and domestic-retail CBDC networks. The services are part of the applications layer as they mainly orchestrate high-level business logic. Therefore, they can only directly interact with Wallet Services and the network bridges. These flows are abstracted away from the distributed ledger.

Figure 411: Core Business Services
4.4 Wallet Services
Wallet Services is responsible for managing user accounts (wallets) and transaction processing. A dedicated web portal will be available for each organization to manage all user wallets within the organization only. The transaction processing layer will serve as an abstraction on top of the settlement layer, which can be Corda DLT or other value ledgers. Limits can be assigned to individual Wallets. Specifically, limits can be assigned to the balance of a Wallet (account limits), and to the value of a transaction.
Wallet Services can initiate transfers to their wallets on the network across organizations. The diagram below showcases a high-level view of the Wallet Services topology.

Figure 412: Wallets Topology
4.4.1 Wallet hierarchy
The wallets portal allows organizations to create a flexible hierarchy of wallets, with multiple wallets at the root level, each having its own tree of sub-wallets. This capability enables organizations to model their accounting structure to reflect their business functions or programs as needed. 
Each individual wallet in any hierarchy can be given a different level of access to roles or users within the organization. If a retail end user is given permission to access a wallet, then they can view the wallet from the CBDC mobile application.
4.4.2 Shareable wallets
An organization can share a wallet with another organization on the network and assign various permissions, such as management rights. This allows organizations to delegate the management of wallets to other organizations. Organizations receiving shared wallets can add sub-wallets under the shared wallet with the right permissions. 
Any activity on a shared wallet is committed to the host organization as they maintain custody of the shared wallet. From the perspective of the receiver organization, the shared wallet is just a proxy to manage the wallet and its sub-wallets on behalf of another organization.
4.5 Corda DLT
Corda DLT is a distributed ledger designed with a privacy-first approach which restricts party access only to transactions in which they participated. The DLT is the settlement layer for the CBDC network. The new generation of Corda DLT moved away from the concept of virtual nodes and mandates each participant to host and run physical nodes in their network. 
The diagram below demonstrates three participants on the network transacting with each other but restricted to viewing only their own transaction details.

Figure 413: DLT Privacy
The DLT transactions are processed through a logical grouping called a block. Transactions are grouped into blocks based on the following criteria:
* Direction of the transaction (outbound or inbound)
* Sender
* Receiver
A transaction from Alice to Bob will be added to a block different from one from Bob to Alice, as each has a different direction. This ensures that real-time processing blocks are formed, sealed, and processed immediately once transactions are available. The blocks are sealed and set for processing based on multiple criteria, such as:
* Reached the maximum number of transactions allowed in a block
* Reached maximum open block time duration (for example, a block cannot be open for more than 0.5 seconds)
The criteria used to manage a block's lifecycle are configurable to enable fine-tuning of the DLT network based on the scenario it is used for.

Figure 414: DLT Transactions
4.5.1 Blocks processing and lifecycle
Multiple blocks can be issued simultaneously and processed in parallel between the same participant with the same transaction direction. This allows the nodes and blocks to scale horizontally as needed to ensure the fastest processing times. In the same network, there is no limit on how many blocks can be issued and processed in parallel by any number of participants. This design approach aims to provide real-time settlement of transactions without queuing bottlenecks or scalability limitations.
Once blocks are issued and set for processing in the initiation node (the sender node), they go through a consensus mechanism called finality that validates the block and its transactions with the sender, receiver, and notary. The Central Bank assumes the role of the notary for CBUAE Phase 2, and it is a party to all transactions on the network. The blocks are validated by verifying the signature on every transaction they hold and are evaluated against all the contracts assigned on the validating node.
Therefore, in the CBUAE topology, a single block must be evaluated against all the contracts assigned to the sender, receiver, and Central Bank nodes. This allows the Central Bank to set global contracts and policies on the CBDC network. If a block was invalidated for any number of reasons, such as invalid transactions within the block, then all faulty transactions are rejected, and a new protected block is issued with the remaining valid transactions to be processed immediately after the original block is invalidated. This failure mechanism avoids rejecting valid transactions at the expense of infrequent minor increases in transaction latency of around an extra second.
The diagram below shows a hypothetical network of three LFI nodes in addition to the Central Bank, in which LFIs simultaneously transact with each other and process blocks in parallel. The diagram is followed by a flow sequence showing the block life cycle.

Figure 415: DLT Blocks
The following diagram simulates three participants in two different banks initiating transfers between each other and how the transactions are grouped into blocks as described previously.

Figure 416: Transactions Settlement
4.6 Corda Contracts
Corda Contracts is a solution that enables clients to integrate custom business rules and policies into their Corda-based systems. Corda Contracts allows organizations to embed business logic and compliance requirements into transaction workflows and user activities, ensuring that all processes adhere to specific operational and regulatory standards. 
By using Corda Contracts, businesses can customize their transaction processes to meet strategic goals while utilizing the built-in features of Wallets and DLT applications within the Corda Network. The following is a system context diagram highlighting Corda Contracts in the solution.

Figure 417: Corda Contracts
4.7 Identities and access management
The R3 Platform supports authentication for many users simultaneously. Authentication identifies the user context for each platform request, to confirm real user engagement and provide the information needed to determine service and resource access. While authentication verifies identity, authorization controls actual access privileges.
Users may include consumers, mobile app merchants, or employees accessing a web interface. Every request to the R3 Platform requires authorization to perform protected actions. Unlike traditional IAM solutions that combine authentication and authorization functions, the R3 Platform separates authorization policies from Identity Management for greater flexibility. The diagram below showcases a high-level view of the IAM system.

Figure 418: Identity Access Management
1. Initial request: A user sends a request to an API on the R3 Platform. This request is blocked without authentication, and the client is redirected to the R3 Federated IdM login page. 
* The login page presents options based on customer settings: a list of IdMs, a pre-selected IdM, or a default IdM.
2. External IdM authentication: The user authenticates, and a token is issued to the federated IdM, which then issues its own JWT token to the client.
3. Token forwarding: The client uses the new token for API requests.
4. Verification: The API Gateway checks the token and forwards the authenticated request to the desired service.


5 Solution analysis
5.1 Programmability scenarios
Transactions governance through policies and business rules for each organization on the network is a key foundation of the R3 retail CBDC solution. This section shows some CBUAE business use cases and demonstrates the programmability capabilities available to govern each scenario: both using Corda Contracts on wallets and Corda DLT applications. 
Contracts can be applied on wallets and DLT levels for each LFI on the network. Additionally, each organization is responsible for implementing their own processes and not handled by the platform.
Note: This section illustrates a few example scenarios only. Please reference the BRD document for all scenarios.  

5.1.1 Person-to-Person Transfer use case
5.1.1.1 Scenario 1
A retail consumer transfers to another user in a different bank.
Note: The sender wallet only allows P2P.

Figure 51: P2P Scenario 1 - Diagram

Figure 52: P2P Scenario 1 - Flow
5.1.1.2 Scenario 2
A retail consumer transfers to another user in a different bank. Note the following:
* Sender wallets only allow personal transfers.
* Receiver wallets only accept transfers from FAB customers.

Figure 53: P2P Scenario 2 - Diagram

Figure 54: P2P Scenario 2 - Flow
5.1.2 Person-to-Merchant Transfer use case
5.1.2.1 Scenario 1
A retail consumer transfers to a merchant in a different bank. Note the following:
* The Retail Bank does not allow gambling.
* The Retail User Wallet only allows transfers under AED 1000.
* The Merchant only accepts transfers from FAB.

Figure 55: P2M Scenario 1 - Diagram

Figure 56: P2M Scenario 1 - Flow
5.1.2.2 Scenario 2
A retail consumer transfers to a merchant in a different bank. Note the following:
* The Retail Bank does not allow gambling.
* The Retail User Wallet does not accept payments from Carrefour.
* The Merchant only accepts transfers over AED 500.

Figure 57: P2M Scenario 2 - Diagram

Figure 58: P2M Scenario 2 - Flow
5.1.3 Parent-Child use case
5.1.3.1 Scenario 1
A parent sets restrictions on multiple child wallets. Note the following:
* The Retail Bank does not allow child wallets to purchase alcohol.
* Child Wallet 1 can only issue transfers up to AED 200.
* Child Wallet 2 can only be used in restaurants.

Figure 59: Parent-Child Scenario 1 - Diagram

Figure 510: Parent-Child Scenario 1 - Flow
5.1.3.2 Scenario 2
A parent sets restrictions on multiple child wallets. Note the following:
* The Retail Bank does not allow child wallets to purchase alcohol.
* The Parent Wallet only allows transfers under AED 1000.
* The Parent Wallet can only be used in restaurants.
* The Child Wallet 1 can only issue transfers up to AED 200.

Figure 511: Parent-Child Scenario 2 - Diagram

Figure 512: Parent-Child Scenario 2 - Flow
5.1.4 Smart Social use case
5.1.4.1 Scenario 1
A ministry restricts spending for a subsidy program. Note the following:
* The Ministry restricts the retailer to Carrefour only on the subsidy program.
* The Merchant only accepts transfers above AED 20.
* The Central Bank only allows transfers under AED 1000.

Figure 513: Smart Social Scenario 1 - Diagram

Figure 514: Smart Social Scenario 1 – Flow
5.1.4.2 Scenario 2
A ministry restricts spending for a subsidy program. Note the following:
* The Ministry restricts the retailer to Carrefour only on the subsidy program.
* The Merchant only accepts transfers above AED 20.
* The Central Bank only allows transfers under AED 1000.
* The Retail Bank does not allow the purchase of alcohol.
Remarks:
* In this scenario the Retail Bank can apply contracts on both local wallets and shared wallets.

Figure 515: Smart Social Scenario 2 - Diagram 

Figure 516: Smart Social Scenario 2 - Flow
5.1.4.3 Scenario 3
A ministry restricts spending for a subsidy program. Note the following:
* The Ministry requires beneficiary wallets to expire after one month of being created.
* The Merchant only accepts transfers above AED 20.
* The Central Bank only allows transfers under AED 1000.
* Retail Bank 1 does not allow the purchase of alcohol.
* Retail Bank 2 restricts the retailer to Carrefour only.
Remarks:
* Contracts and policies cannot be applied directly to the Digital Dirham, but rather at the wallet or DLT level.

Figure 517: Smart Social Scenario 3 - Diagram

Figure 518: Smart Social Scenario 3 - Flow
5.1.4.4 Scenario 4
A ministry manages wallets for subsidy programs and fund distribution. Note the following:
* The Retail Bank must tag user wallets as “beneficiary-wallet”.
* The Retail Bank must add T&C in the beneficiary-wallet description.
Remarks:
* Contracts and policies can be applied to wallet creation and various activities on the network other than transactions.

Figure 519: Smart Social Scenario 4 - Diagram

Figure 520: Smart Social Scenario 4 - Flow
5.1.5 Smart Tourist use case
5.1.5.1 Scenario 1
A ministry restricts spending for a tourist program. Note the following:
* The Ministry restricts the retailers' type to car rentals only.
* The Merchant only accepts transfers above AED 200.
* The Central Bank only allows transfers under AED 3000.

Figure 521: Smart Tourist Scenario 1 - Diagram

Figure 522: Smart Tourist Scenario 1 - Flow


5.1.5.2 Scenario 2
A ministry restricts spending on a tourist program. Note the following:
* The Ministry restricts the retailers’ type to car rentals only.
* The Merchant only accepts transfers above AED 200.
* The Central Bank only allows transfers under AED 3000.
* The Retail Bank restricts the retailer to car rental service such as Sixt.

Figure 523: Smart Tourist Scenario 2 - Diagram

Figure 524: Smart Tourist Scenario 2 - Flow
5.1.5.3 Scenario 3
A ministry restricts spending on a tourist program. Note the following:
* The Ministry restricts the retailers’ type to car rentals only.
* The Merchant only accepts transfers above AED 200.
* The Central Bank only allows transfers under AED 3000.
* Retail Bank 1 restricts the retailer to a car rental service such as Sixt.
* Retail Bank 2 does not allow rentals from Hertz.

Figure 525: Smart Tourist Scenario 3 - Diagram

Figure 526: Smart Tourist Scenario 3 - Flow
5.2 User onboarding procedure
The user onboarding procedure and KYC process can vary for each LFI. 
Note: The details of Retail user onboarding are covered in CBUAE Phase 2 BRD (2.3).


5.3 Design decisions
5.3.1 CBDC delivery strategy
What is the delivery mechanism of CBDC from the Central Bank to the retail end-user?
Options:
* Direct model
* Hybrid Intermediate model
* Indirect model
Decision
Remarks
Hybrid intermediate
Preferred delivery model by CBUAE.
5.3.2 Application architecture
What is the adopted application architecture style?
Options:

Figure 527: Applications Architecture
Decision
Remarks
Microapps
Due to the variety of organizations on the network, this model can enable better adoption as organizations will only host applications that are necessary for their operations.
Every application in the system can be fined-tuned to the organization needs. the applications are designed to scale horizontally and handle parallel processing for large volumes of transactions.
The applications are self-sufficient islands that have clear contracts on the API level. They are loosely coupled with each other with clear bounded context. Inter-application choreography is facilitated with a message broker and a service mesh.
5.3.3 Application boundaries
How are the application boundaries determined from a system design perspective?
Options:
* Functional layers with clear boundaries
* One layer of interconnected applications
Decision
Remarks
Functional layers with clear boundaries
Setting clear boundaries might require a minor extra effort, but it significantly reduces the risk and impact of application modifications in a production system.
5.3.4 Network topology
What is the adopted network topology?
Options:
* Hub-and-spoke
* Peer-to-peer
Decision
Remarks
Hub-and-spoke
This topology is easier to manage and allows the Central Bank to intercept and inspect all network traffic. R3’s design ensures no SPOFs.
5.3.5 Applications tenancy model
What is the application tenancy model?
Options:
* Single-tenancy
* Multi-tenancy
Decision
Remarks
Single-tenancy
This model fits the network topology well, as every LFI will host its own application in a dedicated network. Adopting multi-tenancy for this use case can complicate the development.
5.3.6 Retail users’ wallet accounts
Where should retail users’ wallet accounts be managed?
Options:
* Managed on the distributed ledger
* Managed in a separate layer
Decision
Remarks
Managed in a separate layer
Retail users require a high volume of accounts if managed on the DLT, which can overwhelm the network and degrade its performance significantly, in addition to the total cost of ownership (TCO). Managing the user wallet accounts in a separate transaction processing layer allows the network to scale and perform under load, if necessary, with significantly lower TCO.
The DLT is the source of truth in which the wallet transactions persist in the DLT blocks without any PII data, reducing network degradation due to the high number of accounts required for retail uses. The transactions initiated from the wallets are stored and committed on the DLT synchronously and only cleared if the DLT guarantees it achieved consensus by all participants and stored on each respective node.
5.3.7 IAM and user management
How are the IAM and user management capabilities implemented and provided to operators?
Options:
* Integrated in business applications
* Implemented in independent components
Decision
Remarks
Implemented in independent components
Separating IAM and user management capabilities from the business applications allows each organization to customize the IAM setup to integrate seamlessly with its existing infrastructure and policies.
5.3.8 Corda DLT nodes
How are the DLT nodes implemented?
Options:
* Virtual nodes
* Physical nodes
Decision
Remarks
Physical nodes
Due to the retail user wallet accounts being managed in a separate layer, adopting physical nodes on the ledger to represent individual organizations only is significantly simpler and a more performant topology than virtual nodes.
5.3.9 Corda Contracts execution model
What is the adopted execution model for Corda Contracts?
Options:
* Contracts as a service
* Embedded contracts on the ledger
Decision
Remarks
Contracts as a service
Network activity governance and policies are cross-cutting concerns, and this implementation model allows the contracts to be used across all functional layers and applications. Hence, wallets can utilize contracts in addition to Corda DLT.
5.3.10 Asset programmability
What is the best level at which the contracts and policies should be applied?
Options:
* CBDC token level
* User wallet level
* DLT node level
Decision
Remarks
User wallet and DLT node level
This is a significantly simpler model and more efficient to manage. Enabling programmable wallets and ledger nodes introduces type uniformity for the Digital Dirham CBDC token without the need for encumberment.
5.3.11 Wallet management policies
Should we enable contract policies to evaluate the wallet creation process?
Options:
* Support for dedicated contracts for wallet management
* Not supported
Decision
Remarks
TBD
This feature can simplify a few wallet management scenarios and mostly enable better governance in a variety of business scenarios, such as Smart Social.
5.3.12 Corda Contracts boundaries
What is the boundary of a Corda Contract?
Options:
* Global over the whole network
* Local over the organization network only
Decision
Remarks
Local over the organization network only
The contract policies might contain sensitive information related to the organization; therefore, they cannot be hosted outside the organization's network. Nevertheless, global policies can be mitigated by assigning contracts to the Central Bank DLT node, as it is mandated to participate in every transaction on the network; therefore, it can apply global rules to the overall network participants.
5.3.13 Corda Contracts data scope
What is the contract input data scope?
Options:
* Transaction, current wallet, and user details
* Transaction, current wallet, user details, and aggregated analytics on the LFI wallets
Decision
Remarks
Transaction, current wallet, and user details
Implementing a model that operates on the wallet and transaction level is simple and efficient. Expanding the model will impact performance. Corda Contracts' design allows extensibility to expand the data scope if needed in the future.
5.3.14 Retail users’ primary global wallets
Can we provide retail users with unique global wallets, or can the Central Bank restrict retail users to one unique primary wallet?

Options:
* Yes: users can have a primary unique wallet across all LFIs
* No: users' wallets are managed per LFI, and users can have more accounts in other LFIs
Decision
Remarks
No. Users' wallets are managed per LFI. Users can have more accounts in other LFIs.
Due to the CBDC hybrid intermediate model, each LFI must manage their own user accounts independently as the PII data are private to their network. Therefore, a user can create primary accounts in multiple banks.
5.3.15 Retail transactions settlement
How do the retail transactions get settled on the DLT?
Options:
* Realtime
* Deferred
Decision
Remarks
Realtime
Required settlement model by CBUAE. This model might be a bit slower, but it reduces the risk of concurrency issues and ensures that the Central Bank can validate every transaction on the network in real-time.
Failed transactions are handled individually while valid transactions are continuously being pushed for processing and settlement on the DLT. Individual transaction failures are handled in the wallets level and only user-friendly indication is provided to the users on the mobile app.
5.3.16 Local contracts on shared wallets
Can the user assign a local contract to a shared wallet in a different organization?
Options:
* Yes
* No
Decision
Remarks
TBD
Local contracts, if assigned to a shared wallet, will be executed against the wallet activity on requests going through the current organization before they are routed back to the wallet custodian organization.
5.3.17 Central Bank participation
Does the Central Bank need to be involved in CBDC transactions on the network?
Options:
* Yes, for wholesale transactions only
* Yes, for all transactions
* No
Decision
Remarks
Yes, for all transactions
Required model by CBUAE. The Central Bank can inspect all retail network transactions without the PII data of retail users.


5.3.18 Central Bank Reserve System (FlexCube)
How is the central reserve banking system updated?
Options:
* Realtime
* Deferred
Decision
Remarks
Deferred
This model allows the network to perform significantly faster, as transactions are not hindered by the bandwidth capacity of Flexcube.
5.3.19 Wallet’s top-up and withdrawal
How are the top-up and withdrawal fiat operations handled?
Options:
* Through the Digital Dirham application
* Through a third-party service
Decision
Remarks
Through a third-party service
Applying separation of concerns on the CBDC system helps keep the network efficient and focuses on maintaining unique CBDC capabilities while utilizing existing infrastructure for other purposes.
5.3.20 Merchant payments
How do the merchants get paid?
Options:
* Receive fiat equivalent of Digital Dirham CBDC payments
* Receive Digital Dirham in a CBDC wallet
Decision
Remarks
Receive Digital Dirham in a CBDC wallet.
Onboarding merchants on the network and settling transactions in Digital Dirham directly ensures fast payment execution, as there is no dependency on a fiat transaction leg for every payment.



5.3.21 Wallets hierarchy
What is the preferred wallet hierarchy structure?
Options:
* Flat hierarchy structure
* Tree hierarchy structure
Decision
Remarks
Tree hierarchy structure
This structure enables a better governance model for wallets. Policies can be applied to a wallet, and all its tree of sub-wallet transactions will be evaluated against those policies.
Every wallet has its own access control configuration to assign claims to individual users or groups as needed.
The transactions on a wallet will be evaluated against all the contracts associated on the whole wallet tree-structure. Nevertheless, access permissions are handled for each wallet individually.
5.3.22 Custody of subsidized wallets
Which organization holds the custody of the subsidized wallets?
Options:
* The subsidy program issuer (Ministry)
* The distributing LFI
Decision
Remarks
The subsidy program issuer (Ministry)
This model enables the issuer to govern and manage the program wallets at any time, such as moving or withdrawing liquidity. In addition, it allows the ministry to apply global policies that govern the wallets' activities even if the distribution is being handled by multiple LFIs.
5.3.23 DLT transactions processing
How does the DLT commit retail transactions?
Options:
* Individually
* In logical blocks
Decision
Remarks
In logical blocks
Grouping transactions in logical blocks allows the DLT network to scale and perform significantly faster, as it reduces traffic over the network. Nevertheless, the logical blocks can be configured to have a capacity of one transaction only, which results in a similar effect as individually committing transactions on the DLT.
5.3.24 DLT block processing
How does the DLT schedule blocks for processing?
Options:
* Sequenced
* Un-sequenced
Decision
Remarks
Un-sequenced
This model allows blocks to be processed in parallel, which helps the nodes scale horizontally. R3 design prevent race conditions.
5.3.25 DLT transaction lifecycle
How does the DLT transaction lifecycle relate to the block?
Options:
* Independent
* Dependent
Decision
Remarks
Independent
This mechanism allows for persistent transaction processing in the case of blocks being invalidated. In that case, the transactions will be rescheduled in another block for processing. The lifecycle of a transaction is, therefore, independent from a block.
5.3.26 DLT transactions grouping
How does the DLT group transactions in a block?
Options:
* First-come-first serve
* Based on specific criteria
Decision
Remarks
Based on specific criteria
This model allows the creation of blocks that are processed by a minimum number of DLT participant nodes, as all transactions in a block would be between the same two participants. This results in faster execution.
The DLT operates on first-come-first-serve bases and prioritize execution of transactions that are received first. To ensure the blocks are processed in timely manner, they follow a very low execution window of sub-second intervals to reduce the delay of transactions processing.



6 Future Roadmap alignment 
This section aims to capture that the architecture outlined in this HLD is extensible to drive future roadmap alignment of CBDC platform and its core features to create and capture value. Examples include but are not limited to Offline payments, multiple CBDC networks.
R3 does not commit to building these within the scope of the current Statement of Work. R3 will have separate further engagements with CBUAE and LFIs to capture in detail the requirements on developing and integrating additional use cases with the CBDC Platform. This may require developing new APIs, services, UX and other solution components as the use cases may vary in their goals and their impact on current architecture and integration.
6.1 

7 Appendix A – CBUAE Design Principles






8 Disclaimer
The high-level design document is a Deliverable identified in Annexure A of the Phase 2 Framework Agreement between R3 and CBUAE. The elements of this Deliverable constitute R3 Pre-existing Property or Creations, except for those elements which (i) are third-party Intellectual Property and (ii) are identified as CBUAE New Intellectual Property in Section 4 of Annexure A, as may be amended in the Intellectual Property Memorandum to be issued by R3 with the final Deliverable.



About R3
R3 is a leading provider of digital currency, digital asset, and interoperability solutions. R3 supports Central Banks, Corporates and FMIs by providing them with the tools to navigate the complexities of digitization. 
Corda is the world leading open, permissioned platform powering the tokenization of assets and currencies connecting global markets. 
R3 is committed to progressing financial markets. Learn more at www.r3.com. 




















[AT1]Parag / Andy have you reviewed? I requested this spelling mistake was corrected
[AT2]Again formatting issues
[PYL3]From and ??? 
[AT4]Programmability needs added
[AT5]Spelling mistake
[AT6]Aani is on method as per my feedback, please review my feedback and properly address
[AT7]There are two top up methods aani or bank please update, in future cash and card, this feedback was shared and it stated it was updated but it hasn’t
[AT8R7]The app and platform will need to trigger this feedback was shared and it stated it was updates but it hasn’t

[AT9]Same as above please review our feedback and address properly







2
© Copyright – R3



© Copyright – R3




© Copyright – R3
21
© Copyright – R3



2
© Copyright – R3
Commercial in Confidence







© Copyright – R3


