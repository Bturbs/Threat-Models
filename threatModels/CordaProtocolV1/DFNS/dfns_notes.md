


https://docs.dfns.co/core-concepts/how-mpc-wallets-work

Threat: API leak

Deployment models: cloud, mix, on prom of the keys part have different TMs based on coutnreparty risk and repudiation risks.

Threats:

DFNS as a single point of failure (is used for all keys in a full cloud deployment)

Proposed configuration for DFNS threat model:

Full cloud deployemnt (no mixed or full-on-prem key shares aka signers)
Timelocks via squads (1 of 1 + vetoer config), signing keys (key shares on DFNS ownership).


Some predicted countermeasures:

- Deployment/upgrade keys on another Squads (M of N) with R3 owned phisicala keys (e.g. disaster recovery also from DFNS). This may be applicable also for RBAC config keys.

- Veto keys also out of DFNS (veto keys managed on high avilability wallets e.g. mobile + notifications for time-locked actions outcomes also with NCC SOC integration)

- Security Halt operations keys both on DFNS and on an external high availability wallet

Some predicted threats:

- Blind signatures
- Vulnerable to compromised devices/PC (not present: out of band signature intent verification with simulation, possible PAI based integration with a custom implementation)
- Vulnerable to Compromised UI (e.g. supply chain)


Diagrams:

TODO: plantuml diagram of DFNS intergation with APIs for runtime signing from the curator (with SSO from Microsoft as authentication)











