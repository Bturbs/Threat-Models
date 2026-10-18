# Golden Example

Use this example when a complete schema pattern is helpful. Adapt names, scope, threats, objectives, and controls to the user's actual system and evidence.

```yaml
ID: SecureAPIGateway
schemaVersion: 2
title: API Gateway Security
version: 1.0
status: Final
authors: |
  Security Architecture Team
parent: EnterpriseInfrastructure

scope:
  description: |
    Threat model for an API gateway providing authentication, rate limiting,
    and request routing for backend microservices.

  securityObjectives:
    - ID: SYSTEM_INTEGRITY
      title: System Integrity
      description: |
        Ensure the API gateway operates correctly and reliably.
      group: System Security
      treeImage: true

    - ID: REQUEST_INTEGRITY
      title: Request Integrity
      description: |
        Prevent modification or injection of malicious requests.
      group: Data Security
      contributesTo:
        - REFID: SYSTEM_INTEGRITY

    - ID: DATA_CONFIDENTIALITY
      title: Data Confidentiality
      description: |
        Protect sensitive data in transit and at rest.
      group: Data Protection
      treeImage: true

  assets:
    - ID: API_GATEWAY_SERVICE
      type: system
      title: API Gateway Service
      description: |
        Central entry point for all client requests to backend services.
      inScope: true

    - ID: JWT_SECRET
      type: credential
      title: JWT Signing Secret
      description: |
        Symmetric key used for signing and verifying JWT tokens.
      inScope: true

    - ID: DF_CLIENT_CONNECTION
      type: dataflow
      title: Client HTTPS Connection
      description: |
        TLS-encrypted connection from client applications to the gateway.
      inScope: true

  assumptions:
    - ID: TRUSTED_BACKEND
      description: |
        Backend microservices are trusted and properly secured with internal network isolation.

  attackers:
    - ID: EXTERNAL_ATTACKER
      title: External Network Adversary
      description: |
        Attacker with network access attempting to intercept communications or exploit vulnerabilities.
      inScope: true

    - ID: MALICIOUS_INSIDER
      title: Malicious Insider
      description: |
        Employee or contractor with legitimate access attempting to abuse privileges.
      inScope: true

    - ID: NATION_STATE
      title: Nation-State Adversary
      description: |
        Advanced persistent threat with significant resources, considered out of scope.
      inScope: false

analysis: |
  The gateway is a critical chokepoint for all external traffic. Key risks include
  authentication bypass, credential compromise, denial-of-service attacks, and
  unauthorized access to backend services.

threats:
  - ID: JWT_SECRET_COMPROMISE
    title: JWT signing secret compromise
    attack: |
      Attacker gains access to the gateway server's configuration files or environment
      variables and exfiltrates the JWT signing secret stored in plaintext format. This
      could occur through:

      - Exploiting server misconfiguration
      - Compromising the server through an unpatched vulnerability
      - Social engineering against the operations team

    threatType: Information Disclosure
    impactDesc: |
      Complete authentication bypass, enabling the attacker to forge valid JWT tokens for
      any user and access protected backend services without authentication.

      - Forge arbitrary user tokens
      - Bypass authentication entirely
      - Impersonate privileged users
      - Access backend APIs
      - Maintain persistent access

    impactedSecObj:
      - REFID: REQUEST_INTEGRITY
      - REFID: SYSTEM_INTEGRITY
    attackers:
      - REFID: EXTERNAL_ATTACKER
      - REFID: MALICIOUS_INSIDER
    assets:
      - REFID: JWT_SECRET
      - REFID: API_GATEWAY_SERVICE
    CVSS:
      vector: 'CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H'
    pentestTestable: true
    fullyMitigated: false
    countermeasures:
      - ID: SECRETS_MANAGER
        title: Use Cloud Secrets Manager
        description: |
          Store JWT signing secret in a cloud-native secrets manager with:

          - IAM-based access controls
          - Audit logging of all secret access
          - Automatic secret rotation
          - Encryption at rest and in transit

        inPlace: false
        public: true
        operational: false

      - ID: SECRET_ROTATION
        title: Implement Automated Secret Rotation
        description: |
          Rotate JWT signing secrets every 90 days using automated rotation procedures.
          During rotation:

          - Support both old and new keys temporarily
          - Update all gateway instances atomically
          - Invalidate tokens signed with old key after the grace period

        inPlace: true
        public: true
        operational: true
        operator: Platform Security Team

  - ID: REQUEST_INJECTION
    title: Malicious request injection via MITM
    attack: |
      Attacker performs a man-in-the-middle attack on the client connection to inject
      or modify HTTP requests. This could be achieved through:

      - ARP spoofing on a local network
      - DNS hijacking
      - Compromised router or proxy
      - TLS downgrade attack

      Once positioned, the attacker can manipulate request headers, bodies, or routing decisions.

    threatType: Tampering
    impactDesc: |
      Attacker can manipulate requests to bypass authorization checks, escalate privileges,
      or access unauthorized resources by:

      - Modifying user IDs in headers
      - Injecting additional parameters
      - Changing routing targets
      - Bypassing rate limits

    impactedSecObj:
      - REFID: REQUEST_INTEGRITY
    attackers:
      - REFID: EXTERNAL_ATTACKER
    assets:
      - REFID: DF_CLIENT_CONNECTION
      - REFID: API_GATEWAY_SERVICE
    CVSS:
      vector: 'CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N'
    pentestTestable: true
    fullyMitigated: true
    countermeasures:
      - ID: ENFORCE_TLS_13
        title: Enforce TLS 1.3
        description: |
          Require TLS 1.3 for all client connections to ensure:

          - Strong encryption with forward secrecy
          - Prevention of downgrade attacks
          - Resistance to known TLS vulnerabilities
          - HSTS headers to prevent protocol downgrade

        inPlace: true
        public: true
        operational: false

      - ID: REQUEST_SIGNING
        title: Implement Request Signing
        description: |
          Use HMAC or digital signatures to verify request integrity and authenticity
          before processing. Each request includes:

          - Timestamp to prevent replay
          - Signature covering critical headers and body
          - Client-specific signing key

        inPlace: false
        public: true
        operational: false

  - ID: DOS_ATTACK
    title: Denial of Service via request flooding
    attack: |
      Attacker floods the gateway with high volume of requests to exhaust:

      - Network bandwidth
      - CPU resources
      - Memory
      - Database connections

      Attack may use distributed infrastructure to amplify impact and evade IP-based blocking.

    threatType: Denial of Service
    impactDesc: |
      Gateway becomes unresponsive, denying service to legitimate users.

      - Service downtime
      - Revenue loss
      - Reputational damage
      - Cascading failures in dependent systems

    impactedSecObj:
      - REFID: SYSTEM_INTEGRITY
    attackers:
      - REFID: EXTERNAL_ATTACKER
    assets:
      - REFID: API_GATEWAY_SERVICE
    CVSS:
      vector: 'CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H'
    pentestTestable: true
    fullyMitigated: false
    countermeasures:
      - ID: RATE_LIMITING
        title: Implement Rate Limiting
        description: |
          Apply rate limits at multiple levels:

          - Per IP address
          - Per authenticated user
          - Global service limit

          Use a sliding-window algorithm to prevent burst attacks.

        inPlace: true
        public: true
        operational: false

      - ID: DDOS_PROTECTION
        title: Deploy DDoS Protection Service
        description: |
          Use cloud-based DDoS protection to:

          - Filter malicious traffic at the edge
          - Absorb large-scale volumetric attacks
          - Provide traffic analytics and alerting

        inPlace: false
        public: true
        operational: true
        operator: Infrastructure Team
```
