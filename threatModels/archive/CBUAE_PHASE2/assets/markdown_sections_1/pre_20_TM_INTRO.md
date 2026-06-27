<div class="pagebreak"></div>

# CBUAE PHASE 2 Threat Model

## Introduction To the threat model

### Threat model — high level introduction

This threat model is organised around four fundamental questions that drive scope, analysis, and remediation:

- *What are we building?*  
    Define the scope clearly (assets, dataflows, and actors). A narrow, well‑scoped model keeps the analysis actionable and bounded.

- *What can go wrong?*  
    Identify plausible threats: how an attacker could exploit the system (attack) and the resulting effects (impact). Treat "threat", "vulnerability", "risk" as practical synonyms for things that can go wrong.

- *What are we doing about it?*  
    Capture countermeasures (mitigations/controls) that reduce likelihood or impact. Record their status (e.g., "Countermeasure in Place") and ownership so findings are actionable.

- *Are we doing a good job?*  
    Validate the threat model's completeness and quality over time (e.g., "Do we have diagrams?" "Did we identify threats?"). This evolved to include tracking remediation: "Did we file bugs or tickets?" and ultimately "Did we resolve the issues?"

    [REF: The_Four_Question_Framework.pdf](https://shostack.org/files/papers/The_Four_Question_Framework.pdf)

### How to read this report (practical notes)

- This work is intended to be a review based on Design Documents. Details on countermeasures and current status depend on the status of up-to-date design documents (High and Low level).
- There are Threat Model 'sections' that map with the chapters of the design documents (e.g., Low Level Design Document).
- Each threat entry focuses on the semantic pair: attack (how to exploit) and impact description (what breaks). We use impacted security objectives to map threats to impacted high-level security objectives.
- CVSS vectors provide a standardised numeric view of severity and help prioritise remediation. "Not fully mitigated" threats are considered in need of remediation (security gap), or risk acceptance. On the other hand, for "Mitigated" threats that do have some "not in place" mitigations, the meaning is that the "mitigations" in place are considered enough to mitigate the risk. Some of the mitigations "not in place" may be alternatives/incompatible strategies to mitigate the same threat. This is now indicated explicitly in every countermeasure, as a "not chosen as threat is mitigated by other countermeasures".


<div class="pagebreak"></div>
### Threat Legend

The following image helps interpresting an identified Threat.

<img src="img/threat_legend.png"/>


### Attack Tree legend

There will be an attack tree diagram per section.
The root will be the main topic in scope and can be impacted (or not) by the threats depending on the mitigation status. It offers at a glance, a quick reference for the status of the threats of the section. Different colors have different meanings according to the image below:

<img src ="img/legend_AttackTree.svg"/>


<div class="pagebreak"></div>

