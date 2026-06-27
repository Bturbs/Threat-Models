# Introduction

# Part I: Governance and Foundational Controls

## R3 Security Controls

R3 acquired ISO27001 compliance, demonstrating a formal commitment to
information security at every level of the organization.  
ISO27001 is an internationally recognized standard for information security
management systems (ISMS). If the implementer is ISO27001 compliant, it means
they have established, implemented, maintained, and continually improved a
comprehensive set of security controls and policies.

This includes secure management of data, access controls, risk assessment,
incident response, business continuity, asset management, supplier security,
physical security, secure SDLC, and ongoing monitoring and improvement of all
security processes.

## Solution Security Objectives

In the scope of the Retail CDBC solution the following high level security
requirements have been identified during the threat modeling phase. For more
detailed relationships with designs decisions and their impacts refer to the
Full “UAE CDBC Phase 2 Threat Model” Annex 1.

**General security Objectives:**

  * Confidentiality, integrity, and availability of the CBDC network

  * Data integrity

  * Data confidentiality

  * System availability

  * Compliance

**Business specific:**

  * Trustless execution of contracts

  * Non-repudiation of CBDCs events

  * Exclusive CB control of monetary base and policies

  * 24/7 CBDC Availability

  * Financial Transaction Transparency

  * Crypto agility

  * Recover from a compromised/stolen key

  * Transaction finality

  * Forward ledger validation

  * Post-quantum crypto support

  * Payee consent

  * Instant settlement

  * Avoid excessive data exposure

  * Reliable monetary base

  * LFI cannot interfere with retail coin ownership

**Architectural:**

  * Defense in depth

  * Zero trust

  * Minimal risk surface

  * Principle of Least Privilege

  * Segregation of Duties

  * Admin attack resilience

  * Avoid single points of failure

**Mobile Specific:**

  * OWASP Mobile Top 10

  * Phishing Resistance

## Classification and handling of sensitive data

TODO High level dataflows

### PII

The solution does not handle explicit PII data like Name, Surname, Age etc.

In our case:

  * UAEPASS UUID

  * Wallet balances

  * Pseudonymous WalletID

  * Transaction details

Following the main application data store schema for tallet and transactions:

![image-20250926-075254.png](6277431473.png)

### Public data

  * Mobile app packages

### Secrets and other highly sensitive data

#### Application-specific keys  
  
<table>  
<tr>  
<th>

Title (ID)

</th>  
<th>

Description

</th>  
<th>

Properties

</th></tr>  
<tr>  
<td>

[**Wrap Master
Key**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Signing_Service.WRAP_MASTER_KEY)

</td>  
<td>

**key**  
Master key for secure storage decryption

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**MBridge Connector SOAP message signing
key**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.MBridge_Connector.MBC_SOAP_MESSAGE_SIGNING_KEY)

</td>  
<td>

**Private authentication key**  
It is used to sign SOAP messages sent to the CB mBridge node.

</td>  
<td>

  * **location:** VAULT

  * **format:** ECDSA key pair (secp256k1)

  * **length:** 256

  * **type:** Private authentication key

</td></tr></table>

#### Infrastructure Keys and PKI assets

Keys issued to processes in order to communicate in a secure manner; not
linked to a specific business logic.  
  
<table>  
<tr>  
<th>

Title (ID)

</th>  
<th>

Description

</th>  
<th>

Properties

</th></tr>  
<tr>  
<td>

[**JWT verification
certificate**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.JWT_VERIFICATION_CERT)

</td>  
<td>

**RSA public key certificate**  
Public key certificate used to verify JWT tokens

</td>  
<td>

  * **location:** Injected local file

  * **format:** X.509

  * **type:** RSA public key certificate

</td></tr>  
<tr>  
<td>

[**Ledger verification root
certificate**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Ledger_PKI.LEDGER_ROOT_CERT)

</td>  
<td>

**CA certificate**  
A self-signed certificate that identifies the Root Certificate Authority.

</td>  
<td>

  * **location:** configuration file

  * **format:** X.509

  * **length:** 256

  * **type:** CA certificate

</td></tr>  
<tr>  
<td>

[**Ledger verification intermediate CA
certificate**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Ledger_PKI.INTERMEDIATE_CA_CERT)

</td>  
<td>

**CA certificate**  
A certificate issued by the intermediate CA, signed by the root CA.

</td>  
<td>

  * **location:** configuration file

  * **format:** X.509

  * **length:** 256

  * **type:** CA certificate

</td></tr>  
<tr>  
<td>

[**Certificate Revocation
List**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Ledger_PKI.CRL)

</td>  
<td>

**CA certificate**  
Certificate Revocation List (CRL) signed by the CA as in
<https://datatracker.ietf.org/doc/html/rfc5280>

</td>  
<td>

  * **location:** accessed online

  * **format:** X.509 v3 CRL format

  * **length:** 256

  * **type:** CA certificate

</td></tr></table>

#### Credentials  
  
<table>  
<tr>  
<th>

Title (ID)

</th>  
<th>

Description

</th>  
<th>

Properties

</th></tr>  
<tr>  
<td>

[**Keycloak Database
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.KEYCLOAK_DB_CREDS)

</td>  
<td>

**credential**  
Database credentials used by Keycloak to connect to the database

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

  * **format:** username/password

</td></tr>  
<tr>  
<td>

[**Keycloak Cache
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.KEYCLOAK_CACHE_CREDS)

</td>  
<td>

**credential**  
Infinispan Cache credentials used by Keycloak to use the cache

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

  * **format:** username/password

</td></tr>  
<tr>  
<td>

[**Keycloak LDAP
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.KEYCLOAK_LDAP_CREDS)

</td>  
<td>

**credential**  
Used to connect to an LDAP for User Federation. LDAP in this case is acting as
the User Directory.

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**Keycloak OIDC
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.KEYCLOAK_OIDC_CREDS)

</td>  
<td>

**credential**  
OIDC credentials used by Keycloak to connect to the OIDC provider. Used to
authenticate with a foreign Identity provider for Identity brokering.

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**Keycloak SMTP
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.KEYCLOAK_SMTP_CREDS)

</td>  
<td>

**credential**  
Used to send emails from Keycloak

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**User Sync NATS
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.USER_SYNC_NATS_CREDS)

</td>  
<td>

**credential**  
Used to connect to NATS for User Sync

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**User Sync LDAP
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.USER_SYNC_LDAP_CREDS)

</td>  
<td>

**credential**  
Used to connect to LDAP for User Sync

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**User Sync Keycloak
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.USER_SYNC_KEYCLOAK_CREDS)

</td>  
<td>

**credential**  
Used to authenticate with Keycloak Realm for User
fetching/creation/update/delete.

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

</td></tr>  
<tr>  
<td>

[**Infrastructure as Code Keycloak Configuration
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.IAC_KEYCLOACK_CONF_CREDS)

</td>  
<td>

**credential**  
Used to configure Keycloak (realm) via Infrastructure as Code

</td>  
<td>

  * **location:** IaC tool (JENKINS)

</td></tr>  
<tr>  
<td>

[**Hasura Access
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.HASHURA_ACCESS_CREDENTIALS)

</td>  
<td>

**credential**  
Access credentials used by services to connect to Hasura GraphQL Engine

</td>  
<td>

  * **location:** VAULT_KV_ENGINE

  * **format:** username/password

</td></tr>  
<tr>  
<td>

[**Wallet Database
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Wallet_Service.WALLET_DB_CREDENTIALS)

</td>  
<td>

**username/password**  
Database credentials for the Wallet Service to access the wallet database.

</td>  
<td>

  * **type:** username/password

</td></tr>  
<tr>  
<td>

[**Back Office
JWT**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Wallet_Back_Office_Portal.BO_JWT)

</td>  
<td>

**credential**  
Data flow representing the JWT token used by the Back Office UI for
authentication.

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**UAE PASS Client
ID**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.UAE_PASS_Integration.UAEPASS_CLIENT_ID)

</td>  
<td>

**credential**  
The `UAEPASS_CLIENT_ID` is a public identifier for the client application
(Keycloak). It is used to identify the client application to the authorization
server.

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**UAE PASS API
Secret**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.UAE_PASS_Integration.UAE_PASS_API_SECRET)

</td>  
<td>

**Basic auth cerdentials**  
The `UAE_PASS_API_SECRET` is a secret key that Keycloak uses to verify the UAE
PASS access token. [REF](<https://docs.uaepass.ae/guides/authentication/token-
validation-api/integration-steps/1.-obtaining-resource-server-or-sp-access-
token> )

</td>  
<td>

  * **location:** Injected in Keycloak from Kubernetes secret from secrets manager (HASHICORP)

  * **type:** Basic auth cerdentials

</td></tr>  
<tr>  
<td>

[**UAE PASS
Token**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.UAE_PASS_Integration.TOKEN_UAE_PASS)

</td>  
<td>

**credential**  
Token returned from UAE PASS upon successful login. Used by the IDM to issue a
final JWT for the Digital Dirham mobile app.

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**FLEXCUBE
Password**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Flexcube_Connector.FLEXCUBE_PASSWORD)

</td>  
<td>

**credential**  
Secret password used to authenticate the connector with Oracle FLEXCUBE.

</td>  
<td>

  * **format:** 16 bytes AES key

  * **storage:** vault

</td></tr>  
<tr>  
<td>

[**FLEXCUBE
Password**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Flexcube_Connector.FLEXCUBE_PASSWORD)

</td>  
<td>

**credential**  
Secret password used to authenticate the connector with Oracle FLEXCUBE.

</td>  
<td>

  * **format:** 16 bytes AES key

  * **storage:** vault

</td></tr>  
<tr>  
<td>

[**User
JWT**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.IAM.USER_JWT)

</td>  
<td>

**credentials**  
JWT token containing user attributes or claims for authorization decisions.

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**GlobalScape
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Delivery_Pipeline.GLOBALSCAPE_CREDENTIALS)

</td>  
<td>

**password**  
GlobalScape credentials are used to authenticate and authorize access to the
GlobalScape Workspaces from R3's Jenkings.

</td>  
<td>

  * **location:** Jenkins credentials store [[RFI:12]](https://security.r3.com/CBUAE_PHASE2/index.html#rfi12) Scope

  * **type:** password

</td></tr>  
<tr>  
<td>

[**Credentials stored in
Jenkins**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Delivery_Pipeline.JENKINS_STORED_CREDENTIALS)

</td>  
<td>

**credentials**  
Jenkins credentials are used to authenticate and authorize access to the
source code repository, binaries and other services.

</td>  
<td>

</td></tr>  
<tr>  
<td>

[**GlobalScape
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Delivery_Pipeline.GLOBALSCAPE_CREDENTIALS)

</td>  
<td>

**password**  
GlobalScape credentials are used to authenticate and authorize access to the
GlobalScape Workspaces from R3's Jenkings.

</td>  
<td>

  * **location:** Jenkins credentials store

  * **type:** password

</td></tr>  
<tr>  
<td>

[**Application
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Secrets_management.APPLICATION_CREDENTIALS)

</td>  
<td>

**JWT**  
Credentials used by applications to access Vault Transit and PKI engines.

</td>  
<td>

  * **type:** JWT

</td></tr>  
<tr>  
<td>

[**Vault JWT Verification
Endpoint**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Secrets_management.VAULT_JWT_VERIFICATION_ENDPOINT)

</td>  
<td>

**HOSTNAME:PORT**  
Verifies Kubernetes JWT tokens for authentication with Vault. It is treated as
a credential as it is used for authentication. Its manipulation can lead to
unauthorized access to Vault compromising the whole system security.

</td>  
<td>

  * **type:** HOSTNAME:PORT

  * **connectionType:** HTTPS

</td></tr>  
<tr>  
<td>

[**HSM
Credentials**](https://security.r3.com/CBUAE_PHASE2/index.html#CBUAE_PHASE2.Signing_Service.HSM_CREDS)

</td>  
<td>

**credentials**  
Credentials used to authenticate with the HSM to perform cryptographic
operations.

</td>  
<td>

</td></tr></table>

## Identity and Access Management (IAM)

#### Authentication

**Backoffice User** authenticate with a federated Keycloack Realm to the LFI
internal user directory.

**Retail Users** authenticate with a federated Keycloack Realm to the UAEPASS
user directory.

#### Authorization

The infrastructure enforces authorization at 2 levels.

  1. Role based access controls authorization on the network (API Gateway) Trust Border based on credential roles (JWT claims).

  2. Access Control Lists (Fine grained) at the service level. Policy Information Point for this fine grained authorization is an Open Policy Agent (OPA) solution. OPA data is populated at user onboarding time and syncronized on a regular basis.

![overview.png](6276284869.png)

### IGA and lifecycle of digital identities

In the current solution digital identities are inherited from external system
and the corresponding internal identity is managed in a dedicated users’data
storage (Keycloack and Postgres based).  
**Identity sources:**

  * Retail CDBC with UAEPASS users

  * LFI/Banking users

**Internal Identities storage**

  * Per every LFI Keycloack/Postgres

##### **Ideintiy lifecycle**

**For Back Office R3 CBDC Portals (Participant Organisation Employees):**

  * **Provisioning:** delegated to the participant organization’s own SSO and user storage. Prerequisite: An admin user responsible for onboarding retail users is available within the relevant user storage.

  * **Modification:** delegated to the participant organization’s own SSO and user storage (e.g. Active Directory)

  * **De-provisioning:** delegated to the participant organization’s own SSO and user storage

**For retail CDBC Users:**

  * **Provisioning:** a pseudonymous account is created on registration from UAEPASS (No PII provided)

  * **Modification:** No modification is currently necessary as the access role is unique (separate identity from any other CDBC platform user e.g. back-office users etc).

  * **De-provisioning:** Retail and back office accounts can be deleted from the CBDC platform’s Keycloak deployment using the Keycloak delete user admin api. When closing down a retail user account and return any funds to the user might be:

    * Off-board the user to prevent them logging in and interacting with the wallet

    * Transfer funds from the retail users wallet to another wallet

    * Suspend the wallet to prevent any more transactions interacting with it

    * Redeem the transferred funds to the user

### PAM

Security controls are enforced by the solution and a RBAC and fine corased
fashion through OPA (Open Policy Agent) and in application controls.
Privileged accounts are based on claims from the SSO of the specific LFI/Bank.
The monitoring of the accessess is by the CBUAE SOC.

# Part II: Secure Development & Engineering

## SDLC (Secure Development LifeCycle)

### Security Engineering Principles

  * **Shift-Left** paradigm must be present throughout the SDLC. Security practices therefore occur at the _earliest_ opportunity in all phases of the SDLC ensure that a product will be fit for purpose.

  * **Secure by Default** ensures that security controls be incorporated during the design and development process, rather than being bolted on after the fact. Software configurations also default to the most secure / pessimistic setting.

  * **Security Testing and Validation** seeks to verify security measures are present and correctly implemented.

  * **Threat Modelling** is an incremental activity that occurs throughout the SDLC.

  * **Supply Chain Security** ensures that the build pipeline and release process aligned with the “Build Security Manifesto”

### Security in the SDLC

The following principles define how security is applied across each core area
of the SDLC.

#### Analyze Security Requirements

  * **Security Requirements** and Use Cases are identified and flagged to the Security Team for inclusion into the Threat Model. These are translated into **Security Objectives** that wiill cascade through every subsquent design.

  * Where **Personae** are identified, these must be aligned with the Actors identified in the threat model, and/or the threat model updated accordingly. The Security Team must be involved to have visibility of Use Cases being developed. 

#### Secure By Design

This principles ensures that designs are coherent with, and aligned to the
threat model and describe security measures identified as being required by
the threat modelling exercise.

  * **Security Alignment** occurs at the inception of every design, where Security Objectives for the solution are identified and selected for each design.

  * **Security Objectives** defined in the threat model are referenced by every design.

  * **Countermeasures** to every security objective are described in the design.

  * **Threat Modelling** is a continuous process that begins in the project design inception, and is incrementally refined and developed hroughout the rest of the project lifecycle.

  * **Security Design Review** assesses a completed design against the threat model and details which countermeasures have been selected for implementation.

#### Secure Development

The **Shift-Left** paradigm must be present throughout the development phase:

  * **Dependency-first** strategy ensures that vulnerable dependencies are addressed as a by-product of a mature dependency management programme, not because of a focus on only addressing vulnerabilities as and when they occur.

    * 3rd-party **Dependencies** are always up-to-date. This applies equally to:

      * Application-level dependencies

      * Docker base images

    * **Snyk SCA** tools are mandatory to validate the dependency programme is working.

  * **Waivers** are used only in _exceptional circumstances_ and must be limited:

    * Limited to short time-windows of applicability (expire and reevaulate after 60 days).

    * Must not be used when a dependency could have been updated instead

  * **Pull requests**(PRs) for source-code are integrated with SAST scanning to enable errors to be caught before they are comitted to a code-base.

    * **SAST** scanning for all source code pull pequests (PRs) (Snyk Code & Snyk IAC)

    * **PRs** are blocked until all errors are resolved. 

#### Security Validation

  * Vulnerability reports are included in all QA release that detail all open vulnerabilities:

    * All open Security Bugs

    * All open Security Stories

    * All open Security CVEs

      * Snyk Open Source

      * Snyk Container

    * Snyk Code

    * Snyk IAC

  * Waivers are present and documented for every unresolved CVE

  * Block releases that do not comply the with “Security Bug Fix Policy”

### Automated Testing Processes

This section outlines the automated security processes R3 engineers follow
when setting up a new project. It provides a comprehensive overview of the
Snyk products used across R3, how they are applied within Jenkins pipelines,
and the security scanning requirements for artifacts being shipped to
customers.

It details the developer workflow for running Snyk scans locally and in CI,
explains how security gates like Snyk Delta and automated Jira integration are
enforced, and outlines notification of results are communicated via. Slack.
Finally, it includes a detailed checklist for setting up new repositories
using R3's self-service, template-driven model to ensure standardized and
secure project onboarding.

#### Snyk Products & Artifact Coverage in R3

R3 integrates a suite of Snyk products to ensure that all components of our
software stack are securely scanned throughout the development and release
lifecycle. Each product targets a specific layer and is executed both locally
and within dedicated Jenkins pipeline stages for traceability and compliance.  
Vulnerability scanning during development helps identify and remediate
security issues early before code is deployed, reducing the risk of exploits,
minimizing remediation cost, enabling a shift-left security approach, and
ensuring compliance with security standards.

  1. **Snyk Code (Static Code Analysis)**  
Scans proprietary source code for vulnerabilities and coding issues during
pull requests, enabling secure development (Shift Left) from the start. When a
developer opens a Pull Request to propose a change, this scan is automatically
triggered and visible on the Pull Request to the developer, enabled immediate
remediation.

  2. **Snyk Open Source (3rd Party Risk)**  
Analyzes third-party dependencies for known vulnerabilities based on public
CVE databases. Automatically flags risks when code is committed or
dependencies change. If a developer raises a Pull Request that introduces a
new CVE, merging of the change will be blocked, and the developer will need to
fix the violation before their PR can be merged.

  3. **Snyk Container**  
Inspects container images for OS and package-level vulnerabilities to ensure
secure deployment artifacts, This is integrated into our Jenkins pipelines
along with the other DevSecOps tools mentioned.

  4. **Snyk IAC (Infrastructure As Code)**  
Scans Terraform files and other infrastructure-as-code configurations for
security misconfigurations, policy violations, and drift risks. Similiar in
concept to Snyk Code, Snyk IAC enables a shift-left approach to infrastructure
defined as code.

All four products are implemented as independent stages within Jenkins
pipelines, supporting clear traceability and separation of concerns across the
CI process.

#### Artifact Types Shipped to Clients & Snyk Coverage

Before release, all shipped artifacts must pass the relevant Snyk security
gates during CI:

  * **Docker Images**

    * **Snyk Container** : Scans OS and runtime layers

  * **Terraform, Helm Charts & IaC**

    * **Snyk IaC** : Primary tool for scanning configuration and provisioning code

  * **JAR Files and Application packages**

    * **Snyk Code** : Scans code in real-time and provides actionable insights directly in the developer workflow

    * **Snyk Open Source** : At build time this product scans third-party Java dependencies via Gradle

Each artifact must be verified as free from newly introduced vulnerabilities
via CI Snyk scans before it can be delivered to customers.

#### Snyk Developer Workflow

To maintain security best practices throughout the development lifecycle,
developers are expected to incorporate Snyk scans into both local development
and CI processes.

##### Local Scanning

  * Developers should run Snyk scans frequently during development to catch and remediate vulnerabilities early.

  * The appropriate Snyk CLI tools should be used depending on the component being worked on (e.g., Snyk Open Source, Snyk Container, Snyk IaC or Snyk Code or a combination of tools).

  * Developers should apply patches, upgrade dependencies, or make necessary code or configuration changes to resolve any vulnerabilities identified.

##### CI Pipeline Integration

Jenkins pipelines for R3 projects are configured to include Snyk scans as
distinct pipeline stages. These stages include:

[Jenkins Snyk Scan folder](https://ci02.dev.r3.com/job/r3-corda/job/snyk-
scans/)

  * A stage for Snyk Code to check source code for vulnerabilities.

  * A stage for Snyk Open Source to analyze third-party dependencies.

  * A stage for Snyk IaC to validate Terraform and other infrastructure code.

  * A stage for Snyk Container to scan Docker images.

Each stage uploads its scan results to the Snyk server, ensuring that projects
are continuously monitored even after the build completes.

**Snyk Pipeline Stages** :

![image-20250502-100129.png](6278382605.png)![image-20250502-100129.png](6278382605.png)

##### Pull Request Security

To prevent the introduction of new security vulnerabilities, every pull
request is subjected to automated checks:

  * **Snyk Delta** :

    * Runs as part of the Jenkins `<repo>/pr-merge` build

    * Identifies the base branch and its last Snyk scan snapshot

    * Compares the PR changes against the snapshot

    * Fails the PR if any new vulnerabilities or license violations are introduced

  * **Snyk Code GitHub Integration** :

    * Provides a real-time PR check on GitHub using static code analysis

    * Flags any new vulnerabilities directly in the GitHub UI

    * Complements the Snyk Delta check, offering an additional security layer focused on source-level issues

**Code changes checks:**

![image-20250502-094338.png](6278382624.png)![image-20250502-094338.png](6278382624.png)

Both checks must pass before a PR can be merged. These gates are essential to
preserving the security posture of all R3 repositories.

##### Snyk Jira Integration (Main Branch Builds)

For builds on the `main` branch, Snyk vulnerabilities are processed using a
custom integration with Jira. This integration includes logic to:

  * Query the Snyk server for newly identified issues.

  * Check whether an issue has previously been logged in Jira.

  * If an issue already exists, it is ignored to prevent duplication.

  * If an issue is new, a Jira ticket is automatically created and assigned to the relevant team or engineer.

This integration ensures that all vulnerabilities discovered in production
branches are tracked, triaged, and addressed through the formal ticketing
system.

### 3rd party verification and penetration testing

Pentesting is an authorized, simulated cyberattack on a computer system,
network, or application to find vulnerabilities that malicious attackers could
exploit. An accredited third party will before release and periodically test
the solution by simulating cyberattacks and produce a report with the findings
that will be verified and follow the “Bug Fixing Policy”.

## Solution Delivery and Supply Chain security

Pipeline security, dependency management, and build integrity

#### Overview

The security of the solution delivery pipeline and its supply chain is
paramount to ensuring the integrity, confidentiality, and reliability of the
Retail CBDC Solution. This section outlines the controls, processes, and tools
implemented to secure the CI/CD pipeline, manage dependencies, and guarantee
the integrity of all build artifacts delivered to the client.

For stable artifact here is a referece image from Low Level Design documents:  

![image-20250925-085904.png](6276284800.png)

#### Pipeline Security

##### Secure CI/CD Orchestration

  * **Jenkins Hardening:**  
All Jenkins instances orchestrating the build and deployment pipelines are
hardened according to industry best practices. This includes:

    * Role-based access control (RBAC) for pipeline execution and configuration.

    * Enforced use of strong authentication and integration with enterprise identity providers.

    * Restriction of plugin usage to a vetted set, with regular updates and vulnerability scanning.

    * Segregation of duties between pipeline administrators and developers.

  * **Pipeline as Code:**  
All pipeline definitions (Jenkinsfiles, scripts) are stored in version-
controlled repositories (Bitbucket), ensuring traceability, auditability, and
peer review of any changes.

  * **Credential Management:**  
Sensitive credentials (e.g., service accounts, API tokens, kubeconfig files)
are managed using Jenkins credential stores and are never hardcoded or exposed
in logs or code repositories.

##### Build Environment Isolation

  * **Network Segmentation:**  
Build environments are isolated from production and other sensitive
environments. Only necessary network paths are permitted, and all traffic is
monitored.

##### Pipeline Integrity

  * **Immutable Artifacts:**  
All build artifacts are uniquely versioned and cryptographically hashed. Once
published to the artifact repository (JFrog Artifactory), artifacts are
immutable and cannot be altered.

  * **Audit Logging:**  
All pipeline executions, artifact promotions, and deployments are logged and
retained for audit purposes. Logs are protected against tampering and
unauthorized access.

#### Dependency Management

##### Automated Dependency Scanning

  * **Snyk Integration:**  
The pipeline integrates Snyk tools for comprehensive dependency scanning:

    * **Snyk Open Source:** Scans all open-source dependencies for known vulnerabilities.

    * **Snyk Container:** Scans container images for vulnerabilities in OS packages and included libraries.

    * **Snyk IaC:** Scans Terraform and other infrastructure-as-code artifacts for misconfigurations and security risks.

  * **Continuous Monitoring:**  
Dependencies are continuously monitored for new vulnerabilities. Nightly scans
and PR gate checks ensure that no new vulnerabilities are introduced.

##### Dependency Provenance and SBOM

  * **Software Bill of Materials (SBOM):**  
For every build, an SBOM is generated, listing all dependencies, their
versions, and their sources. The SBOM is delivered alongside the binary
artifacts to the client, ensuring full transparency and traceability.

  * **Approved Sources:**  
All third party dependencies must be sourced from approved, trusted
repositories. Direct downloads from unverified sources are prohibited.

##### Vulnerability Management

  * **Blocking Policies:**  
The pipeline enforces strict policies: any artifact with unresolved high or
critical vulnerabilities is blocked from promotion to stable or client
environments.

  * **Remediation Workflow:**  
When a vulnerability is detected:

    * An automated JIRA ticket is created.

    * Notifications are sent to the relevant Slack channels.

    * The responsible developer must remediate or, if justified, formally waive the vulnerability (with documented rationale and approval).

![image-20250925-090222.png](6276251967.png)

#### Build Integrity

Files produced internally by R3. These include binary files such as Helm
charts, Docker images, Terraform modules, and Terraform providers, as well as
bundled (zipped) pipeline and deployment scripts.

##### Reproducible Builds

  * **Build Processes:**  
Build scripts and environments are not designed to be fully deterministic,
while not ensuring that repeated builds from the same source and dependencies
produce identical artifacts it is possible to recreate equivalent artifacts
for a specified version.

  * **Build Provenance:**  
The final bundled (zipped) artifact, containing both the binaries and
associated metadata, is securely transmitted to client environments via
Globalscape, ensuring provenance and integrity throughout the distribution
process.

##### Artifact Promotion Controls

  * **Promotion Gates:**  
Artifacts must pass all required quality and security gates before promotion
from unstable to stable repositories. Promotion is automated and policy-
driven, with manual approval required for production releases.

  * **Metadata and Policy Enforcement:**  
Artifact metadata (test results, scan reports, etc.) is used to enforce
promotion policies.

##### Secure Artifact Distribution

  * **Controlled Syncing:**  
Artifacts are transferred to client environments via secure, auditable
channels (e.g., Globalscape Workspaces). Only artifacts that have passed all
internal checks are eligible for syncing.

  * **Client Verification:**  
Clients receive Snyk reports, SBOMs, and artifact hashes, enabling independent
verification of artifact integrity and security posture.

#### Supply Chain Threat Mitigation

  * **Third-Party Risk Management:**  
All third-party components are evaluated for security and license compliance.
Only components with approved licenses and no known critical vulnerabilities
are permitted.

  * **Incident Response:**  
In the event of a newly discovered vulnerability or supply chain compromise, a
coordinated incident response process is triggered, including client
notification, artifact revocation, and emergency patching if required.

# Part III: Solution Security Controls

## Application & Mobile

### Back-office portals security controls

Circled in the following image the Back-Office portals in scope of this
section

![backoffice_portal.svg](6277464232.png)

#### Strong Authentication

  * **Single Sign-On (SSO) Integration and Identity Provider Integration** : Implements centralized authentication through LFI or CB organization’s specific Keycloak instance

  * **Multi-Factor Authentication (MFA)** : LFI and CB organization’s SSO systems requires additional verification factors beyond username/password (Prerequisite)

  * **Session Management** : Proper handling of authentication sessions with appropriate timeouts (short lived JWT tokens)

#### Robust Server-Side Authorization

  * **Role-Based Access Control (RBAC)** : Implements granular permissions based on user roles and responsibilities

  * **Server-Side Validation** : All authorization checks performed on the server side, not relying on client-side controls

  * **Attribute-Based Access Control (ABAC)** : Advanced authorization policies based on user attributes and context. Polici Information Point for authorization decisions is a per-organizaiton OPA (Open Policy Agent) system

  * **Permission Validation** : Every request is re-validated against user permissions before processing even in downstream services (zero-trust, defence in depth).

#### Cross-Site Request Forgery (CSRF) Protection

  * **JWT sessionStorage Implementation** : Stores authentication tokens in sessionStorage instead of cookies to prevent CSRF (Cross Site Request Forgery Attacks)

  * **Bearer Token Authorization** : Uses Authorization header with bearer tokens for API requests

  * **Same-Origin Policy Enforcement** : Strict enforcement of same-origin policies for sensitive operations

#### Cross-Site Scripting (XSS) Prevention

  * **React Contextual Encoding** : Leverages React's built-in XSS protection through JSX expression escaping

  * **Input Validation and Sanitization** : Comprehensive validation of all user inputs on both client and server sides

  * **Content Security Policy (CSP)** : Strict CSP headers to prevent execution of malicious scripts

  * **Avoidance of Dangerous APIs** : Eliminates use of `dangerouslySetInnerHTML` and inline event handlers

#### Principle of Least Privilege

  * **Minimal Access Rights** : Users granted only the minimum permissions necessary for their roles

  * **Issuer-Specific Restrictions** : Critical operations like add/deduct limited to specific issuer users and wallets

  * **Administrative Access Controls** : Enhanced restrictions on administrative functions and users

#### Monitoring and Auditing

While logs are generated by the backend services every specific organization’s
SIEM/SOC/PAM systems will also controbute to:

  * **Comprehensive Activity Logging** : All critical back-office actions logged with detailed audit trails

  * **Real-Time Monitoring** : Automated monitoring systems to detect suspicious activities 

  * **Log Security** : Audit logs protected from tampering and securely stored

  * **Regular Audit Reviews** : Periodic analysis of logs to identify potential security incidents

#### Step-Up Authentication for Critical Operations

  * **Additional Verification** : Enhanced authentication requirements for high-risk operations

  * **Re-Authentication Prompts** : Users required to re-authenticate for sensitive actions

  * **Time-Based Re-Authentication** : Periodic re-authentication for extended sessions

#### Multiple Approval Mechanisms

  * **Dual Authorization** : Critical operations require approval from multiple authorized users

  * **Separation of Duties** : No single user can complete high-risk operations independently

  * **Approval Workflows** : Structured approval processes for sensitive administrative actions

  * **Override Controls** : Limited and audited ability to bypass approval requirements in emergencies

#### HTTP Security Headers

  * **Content Type Protection** : `X-Content-Type-Options: nosniff` to prevent MIME type confusion

  * **Frame Protection** : `X-Frame-Options: SAMEORIGIN` to prevent clickjacking attacks

  * **XSS Protection** : `X-XSS-Protection: 1; mode=block` for additional browser-level protection

  * **Transport Security** : Strict Transport Security (HSTS) headers for HTTPS enforcement

#### Session Security Management

  * **Secure Token Storage** : JWT tokens stored securely in sessionStorage with proper lifecycle management

  * **Session Timeout** : Automatic session expiration after periods of inactivity

  * **Token Rotation** : Regular refresh of authentication tokens to limit exposure window

  * **Logout Security** : Proper cleanup of session data upon logout or session expiration

#### Network and Infrastructure Security

  * **Private Network Access** : Back office portal accessible only within secure private networks

  * **API Gateway Protection** : Centralized traffic management and security enforcement through API gateway

  * **TLS Encryption** : End-to-end encryption for all communications between components

  * **Load Balancing Security** : Secure traffic distribution and SSL termination (and downstream re-initiation, see service-mesh) at gateway level

#### Data Flow Security

  * **Request Validation** : All data flows between UI, API Gateway, and CSB components validated

  * **Authorization Context** : User authorization context maintained throughout request processing

  * **Data Orchestration** : CSB ensures proper data handling between frontend and backend services

  * **Sensitive Data Protection** : Wallet data protected throughout all processing stages 

### Mobile security controls

![image-20250925-121607.png](6276252228.png)

#### Defense-in-Depth Authentication and Authorization

  * **API Gateway** : Validates token signatures and enforces access control policies on requested services/URLs

  * **WAF (Web Application Firewall):** detects and blocks attacks and anomalies by inspecting the mobile client’s requests

  * **IAM Integration** : Leverages identity and access management solutions to control user access to services

  * **Service-Level Validation** : Each service validates specific request conditions before performing operations

#### TLS Encryption in Transit

  * **Transport Layer Security** : Protects data integrity and confidentiality during transmission. Prevents also man-in-the-middle attacks by validating server certificates linked to trusted CAs.

  * **End-to-End HTTPS/TLS** : Secures all communication channels between mobile app, gateways, and backend services.

#### Secure Token Storage

Ensures authentication tokens are encrypted at rest using device-specific keys

  * **Android EncryptedSharedPreferences** : Utilizes Android's secure storage mechanisms for token persistence

  * **iOS Keychain Services** : Leverages Apple's Keychain for secure token and credential storage

#### Signed Push Notifications (TODO: check ticket status  [
R3SOL-4250](https://r3-cev.atlassian.net/browse/R3SOL-4250) \- Getting issue
details... STATUS )

  * **Notification Authentication** : Cryptographically signs all push notifications to verify sender authenticity

  * **Secure Channel Verification** : Validates notification sources through secure communication channels

  * **Message Integrity Checks** : Cryptographically ensures notifications haven't been tampered with during transmission

  * **Anti-Spoofing Measures** : Prevents malicious actors from sending fraudulent notifications

#### Deep Linking Validation (App Links)

  * **Android App Links** : Uses HTTPS-based deep links with domain verification for secure app navigation

  * **iOS Universal Links** : Implements Apple's Universal Links for verified deep link handling

  * **UAEPASS Flow Validation** : Specifically validates UAEPASS authentication flow links for correctness

  * **Syntactic and Semantic Validation** : Ensures deep links direct users only to legitimate app screens

#### Least Privilege Permissions on Device

  * **Minimal Permission Requests** : Only requests essential device permissions required for core functionality

  * **Permission Justification** : Provides clear explanations to users for why specific permissions are needed

  * **Runtime Permission Handling** : Manages permissions dynamically based on actual feature usage

  * **Sensitive Data Context Protection** : Handles sensitive operations only in secure, controlled environments

#### Code Obfuscation and Hardening

  * **Minification & obfuscation**: The compilation process minifies and obfuscate the mobile distributed package using “Hermes engine” and stripe out spefic debuggable info from the installed packages. While there is not a complete guarantee against reverse-engineering client code, it does not contain disclosure-sensitive algorithms or any secret data.

#### Detect Jailbreak/Root and Other Device Integrity Checks

  * **Rooting/Jailbreak Detection** : Identifies compromised devices and restricts access to sensitive operations

  * **Play Integrity API** : Uses Google's Play Integrity API for Android device verification

  * **Apple Device Attestation** : Implements Apple's device attestation framework for iOS integrity checks

  * **Compromise Response** : Shows warnings and limits functionality on devices with security compromises

#### OWASP Mobile Top 10 Adherence

  * **Regular Risk Assessment** : Continuously reviews and addresses OWASP Mobile Top 10 security risks

  * **Insecure Data Storage Prevention** : Implements secure storage practices for sensitive information

  * **Weak Server-Side Controls Mitigation** : Ensures robust server-side validation and authorization

  * **Transport Layer Protection** : Maintains secure communication channels throughout the application

#### Secure Development Practices

  * **Secure Development Lifecycle** : Follows established SDLC practices with integrated security checkpoints

  * **Threat Modeling** : Conducts regular threat modeling exercises to identify potential vulnerabilities

  * **Code Review Process** : Implements mandatory security-focused code reviews before deployment

  * **Security Testing Integration** : Incorporates automated and manual security testing throughout development

#### Validation During Login Flows preventing:

  * **CSRF Prevention** : Uses state parameters to prevent cross-site request forgery attacks

  * **Replay Attack Prevention** : Implements nonce validation to prevent authentication replay attacks

  * **Session Integrity** : Ensures authentication flow integrity through cryptographic validation

#### Transaction and Operation Limits

  * **Transfer Limits** : Enforces maximum transaction amounts to limit potential fraud

  * **~~Operation Frequency Limits~~**~~: Restricts the number of sensitive operations per time period~~

  * **Step-Up Authentication Triggers** : Requires additional authentication for sesitive operations (this is a current implementation gap)

#### Audit Logs for Sensitive Operations

  * **Comprehensive Logging** : Records all sensitive operations with user, timestamp, and operation details

  * **Immutable Audit Trails** : Maintains tamper-proof logs for forensic analysis and compliance

  * **Log Analysis** : Regular logs are produced by the solution to identify patterns and potential security incidents by the SIEM/SOC

#### Phishing-Resistant Authentication Methods

  * **UAEPASS Mobile Flow** : Utilizes UAE Pass mobile authentication for strong, phishing-resistant login including:

    * **Multi-Factor Authentication** : Implements multiple authentication factors to prevent credential-based attacks

    * **Biometric Authentication** : Leverages device biometrics for user verification when available

    * **Hardware-Based Authentication** : Uses device security features for tamper-resistant authentication

    * **Device Registration Process** : Implements secure device enrollment and trust establishment. UAEPASS Mobile-Only Flow restricts access to mobile flow only, avoiding less secure web-based alternatives

#### Single Session Enforcement

  * **Concurrent Session Prevention** : Prevents multiple simultaneous sessions for the same user account, this is achieved with Keyclock single session enforcement

  * **Automatic Session Termination** : Terminates existing sessions when new authentication occurs

## Infrastructure

Infrastructure security, hardening, and monitoring

### Secrets management

**Hashicorp Vault**

Hashicorp Vault solution is chosen to store, manage, deploy, and rotate static
key/value pair secrets across applications, services, systems, and
infrastructure.

Hashicorp Vault is split into engines, each of which forms a part of some
solution which spans PKI, Cryptography services, secrets management, and CA
services.

The solution uses HashiCorp Vault KV store as a centralized secrets accessible
store  for every Organization, with Kubernetes authentication to securely
access secrets at pod startup inside an `InitContainer`. Secrets are read once
and stored in files mounted in memory for applications to read either directly
or once pushed into environment variables.

![image-20250929-113228.png](6278316883.png)

Secrets and credential injection by the InitContainer using secure KV store
sequence diagram is detailed below:

![image-20250926-082712.png](6277398699.png)

### Infrastructure workloads

For processes and workload the chosed infrastrcuture is Red Hat OpenShift. Is
an enterprise version of Kubernetes that offers the following advantages from
using plain Open-Source Kubernetes or other container management platforms:

  1. **Secure Containers**

     * Restricted and run as non-root by default

  2. **Integrated CI/CD Tooling**

     * Integrated OpenShift pipelines

  3. **Strict Image Management**

     * Strict image verification, registry controls and access policies

  4. **Tight RHEL Integration**

     * Integrates closely with RHEL container tools like Podman

  5. **Project Isolation**

     * OpenShift treats “Projects” (namespaces) as isolated, secure environments with fine-grained RBAC

  6. **Unified Management Stack**

     * Built-in monitoring, logging, metrics, and alerting based on Prometheus, Grafana, and Loki

> Reference (IDD 3.2.1)

## Network

### Network security, segmentation, and protection

Network logical (and potentially phisical) isolation is achieved with the
following Hub-and-spoke network segmentation.

A hub-and-spoke network topology is characterized by a central "hub" network
that connects to multiple "spoke" networks. A fundamental security benefit of
this design is the inherent logical isolation it provides between the spokes.
Communication between different spoke networks is not direct; instead, all
traffic must be routed through the central hub.

The following diagram from the Corda Networks HLD shows three network
participants, illustrating the hub-and-spoke model where the central hub
represents, for example, the Central Bank in a CBDC setup. The Web Application
Firewall verifies the request before forwarding it to the API Gateway, which
routes it within the service mesh to the target MicroApp instance.

![image-20250926-082311.png](6277464282.png)

### Service-to-Service authentication and zero-trust

#### Transport level securiry with Service mesh (mutual TLS)

The solution deploys a service mesh (Buoyant’s Linkerd) to each Kubernetes
cluster/namespace. Linkerd has a custom-built proxy that minimizes the
resource overhead and the additional latency. The service mesh will be used to
enforce mTLS between Kubernetes pods, and restrict access based on
authorization policies.

#### Layer 7 (application) level backend security

Platform issues internal JWTs are used for authentication and authorization
purposes in service-to-service communication.

SVID JWTs are generated via the platform’s cryptographic library, and pushed
into any outgoing messages to other platform services. Identity is assigned to
entities in the [_SPIFFE_](https://spiffe.io/) format.

Every service/process verifies the caller’s token authenticity and enforces
authorization based on token claims.

## Data at rest

**Availability**

The following systems:

  1. Distributed Ledger data 

  2. per LFI/Bank retail wallet data 

  3. per LFI/Bank Keycloack user store

  4. OPA policy data

use Postgres capabilities including replication based on Write Ahead Log
(WAL).

The Cloud Native Postgres (CNPG): this is an Open-Source Postgres operator
designed to manage Postgres workloads on a Kubernetes cluster. It will provide
us with replication capabilities across 3 (or more) worker nodes. In the
Primary Datacentre this architecture can be referred to as a Non-Stretched
cluster deployment.

![image-20250925-123206.png](6276350476.png)

KeyValue and message store (NATS) also contains statuses of ongoing
transaction. Replication strategies for available storage are in line with
those provided by Postgres.

**Hashicorp Cryptographic Vault for secrets**

Secrets, including private keys are encrypted at rest suing Hashicorp Vault
Solutino TODO

**Data Access Controls**

Database credentials are encrypted and provided to single services by the
infrastructure solution (See LLD, Decret manager). Services themself enforce
access policies from other services and users (See AIM/ fine coarsed access
controls and ACLs).

# Part IV: Operations and Validation

## Business Continuity and Disaster Recovery (BCDR)

The Retail solution will be deployed across two Data Centres (PROD & DR) in
accordance with an **Active-DR Hot Standby** configuration. With this approach
the PROD site handles all production workloads. The DR site is fully
provisioned and running, but it doesn’t handle any traffic unless failover is
triggered.

![image-20250925-121207.png](6276317704.png)

> Reference: IDD document, section 2.2

## Security Testing

Penetration testing, vulnerability assessment DAST?, and security validation

[James
Brown](https://r3-cev.atlassian.net/wiki/people/5a02f273f491f53c4fcbb524?ref=confluence)
TODO

## Reference Documents

  * HLDs 

  * LLDs 

  * IDD

## Annexes

## Annex A - Threat Model

**Note:** [Paul
Moloney](https://r3-cev.atlassian.net/wiki/people/630367fe8474ff0a80ac014a?ref=confluence)
This is the unredacted version on the Threat Model. The **CBUAE_PHASE2.md**
file has the correct scope of the contect (the html and pdf have the summary
section that should not be present)

[![](https://r3-cev.atlassian.net/wiki/download/thumbnails/6275400419/CBUAE_PHASE2.zip?version=1&modificationDate=1758896860288&cacheVersion=1&api=v2&viewType=fileMacro)](/wiki/download/attachments/6275400419/CBUAE_PHASE2.zip?version=1&modificationDate=1758896860288&cacheVersion=1&api=v2)

## Annex B - Security Bug Fix Policy

# Scope

The following describes our targets for responding to security issues
discovered in the solution. The actual time taken to release a fixed version
will depend on the complexity and risk of the fix, as well as the assessment
of the likelihood and severity of a customer affecting incident.

This policy does not describe the complete disclosure or advisory process that
we follow.

## Security bug fix Service Level Objectives (SLO)

We have defined the following target response times for fixing security issues
in our products:  
  
<table>  
<tr>  
<th>

**Issue Severity**

</th>  
<th>

**CVSS v3 score**

</th>  
<th>

**Target Response Time**

</th></tr>  
<tr>  
<td>

Critical

</td>  
<td>

**9 - 10**

</td>  
<td>

To be fixed within 2 weeks of being reported.**TODO confirm with QA**

</td></tr>  
<tr>  
<td>

High

</td>  
<td>

**7 - 8.9**

</td>  
<td>

To be fixed in the next scheduled maintenance release, or the next plus one if
within 4 weeks.

</td></tr>  
<tr>  
<td>

Medium

</td>  
<td>

**4 - 6.9**

</td>  
<td>

To be fixed in the next plus one scheduled maintenance release.

</td></tr>  
<tr>  
<td>

Low

</td>  
<td>

**0.1 - 3.9**

</td>  
<td>

To be fixed in a future scheduled released based on related development
activities.

</td></tr></table>

### 3rd party components

Our software products usually contain 3rd party dependencies. R3 utilize
commercial Software Composition Analysis (SCA) tools to identify components
that might contain known vulnerabilities (CVEs).

We prioritise fixes to dependencies based on our assessment of the severity
and potential impact of a CVE, and also the manner and context in which the
issue is likely to be exposed.

  * Vulnerabilities that are assessed as likely to be exposed are updated according to the target response times above wherever possible.

  * Vulnerabilities that are assessed as unlikely to be exposed by The solution, are updated if possible as part of a scheduled release to the product.

## Security Fixes

Customers should upgrade their installations whenever a new release becomes
available to ensure that the latest security fixes have been applied.

