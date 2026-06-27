This process applies to in-field software or products in use by customers of
R3.

The Vulnerability Disclosure Handling Process defines the process to be used
when an _advisory-class_ vulnerability in one of R3’s products is discovered,
either via the [Vulnerability Disclosure Program](https://hackerone.com/r3) or
through internal testing.

The purpose of responsible disclosure is to prevent a security incident from
occurring, by instead managing the response in a way that enables R3 to
coordinate a resolution without impacting customers and users.

![](img/4259577944.png)

This process is intended to be compliant with:

  
-  ISO-29147 (Vulnerability Disclosure) 

  
-  ISO-30111 (Vulnerability Handling Processes)

**Advisory-class** issues exhibit the following properties:

  
-  Rated **High** or **Critical** severity.

  
-  Assessed by the security team to cause an impact 

## Discovery

Vulnerabilities can be discovered and reported in a variety of ways, described
below.

### Emergency / Publicly known zero-days

#### (Emergency Process)

Vulnerabilities that are suddenly announced through public news channels will
force R3 to start this progress. (For example another Log4J scenario).

Usually the Support Team will already be talking to concerned customers about
these scenarios.

The high-profile nature of these emergency-class zero-days, require the BU
Head to nominate a response coordinator, who will run this process from this
point.

## Responsible disclosure

### (Advisory Class)

Vulnerabilities are normally received through R3’s vulnerability disclosure
programs hosted on HackerOne: <https://hackerone.com/r3>

Occasionally vulnerabilities may be reported to R3 through other channels,
without being visible to the internal security team.

Such reports must be forwarded to the
[security@r3.com](mailto:security@r3.com) inbox.

  1. The Security Team will create a **Security Disclosure** JIRA ticket to track the disclosure. This happens automatically when syncing reports from HackerOne:

  
**Project:** Security Disclosure  
**Issue Type:** Security Disclosure  
**Subject:** Vulnerability Disclosure in XYZ (_summarize the finding_)  
**Asset:** Domain name or project name  
**Reporter:** name & email  
**Report Date:** YYYY-MM-DD hh-mm  
**Initial Report:** copy and paste the original email or report into a pre-
formatted text block.  

  2. The Security Team will contact the reporter and acknowledge receipt of report. It is important to respond swiftly to the reporter of the issue, and to confirm receipt of the disclosure.   
  
When replying via email, reply directly to the reporter using the To: field,
and CC: [security@r3.com](mailto:security@r3.com)  
Consider using the template below in your response:

> Thank you for the disclosure of the issue identified in Asset XYX.
>
> We appreciate the efforts you have made in conducting your research, and by
> following our vulnerability disclosure process. We will validate your
> submission and respond as soon as we are able with our confirmation of the
> vulnerability.

## Internal Research & Testing

### (Advisory Class)

Vulnerabilities discovered through internal research, either by the security
team, or during testing & QA, must be brought to the attention of the security
team.

These tickets will normally be represented by an existing Security Bug ticket.

  1. **Alert** the security team by sending an email to the [securityteam@r3.com](mailto:securityteam@r3.com) mailbox

  2. The Security Team will create a **Security Disclosure** JIRA ticket to track the disclosure (as before)

  3. The Security Team will link the Security Bug ticket to the Security Disclosure one.

## Verification

R3 Security Team investigates the report to establish the validity of the
issue and what impact it has. The owner of the affected product may also be
involved in this stage.

### Investigate

  
-  Identify the engineer with most knowledge of the subject domain

  
-  Reproduce the behaviour identified by the report.

#### Invalid reports

If the vulnerability is determined to be invalid then this process can
conclude. The R3 Security Team will communicate the results of the analysis to
the reporter, and the Security Disclosure Jira ticket can be closed.

#### Establish issue severity

  
-  Assign a CVSS score using the [CVSS Calculator](https://www.first.org/cvss/calculator/3.0)

  
-  Base the priority on the CVSS severity metric.

  
-  Set the corresponding fields on the Security Disclosure ticket:

    
-  CVSS Vector

    
-  CVSS Score

    
-  Severity - None, Low, Medium, High, Critical

#### Link and Report issue

  1. A **Security Bug** Jira ticket will be created (if it does not exist already)

  2. The **Security Bug** must be linked to the original **Security Disclosure**  
see: <https://github.com/corda/security/tree/master/jira-link>  

  3. Apply the **Severity** and **CVSS** fields so that they match the Security Disclosure ticket

  4. The security bug will be reported to the product manager and engineering leads responsible for the affected product or service.

It is the responsibility of the product team to immediately assign resources
to remediate the issue.

## Advisory

Issues assessed to be **High** or **Critical** severity require the advisory
process to be followed. Affected customers must be alerted that their systems
may be at risk.

Customers and users affected by the vulnerability will be be given fair
warning that a patch or mitigation will be shortly available. Affected users
must be given the opportunity to prepare their systems for the forth-coming
update.

  1. Identify the users & customers using the vulnerable software

  2. Identity users that have forked the GitHub repository containing the vulnerable code

  3. Send all parties an email notifying them of the issue

The R3 Support Team will coordinate this process.

### Alert Key Internal Stakeholders

BU Head will nominate the response coordinator, who will run this process from
this point.

The Security Team must alert key stakeholders and initiate the internal
process for disclosure.

  
-  Set up a new _named_ internal slack channel and invite the following:

    
-  Head of Product. 

    
-  Product Lead. 

    
-  Project Manager.

    
-  Engineering Lead

    
-  Security.

    
-  Head of Support.

    
-  Tech Writing team

    
-  Head of P.S (Optional?).

  
-  Liaise with Tech writing team to create a live status page to keep the public informed on our progress.

    
-  _Only required for publicly known zero-days (i..e Log4J scenarios)._

    
-  _Do not do this for non-public disclosures._

  
-  Send an email to some group with the same membership as above? TODO

  
-  Product Lead / Project Manager - Set up a regular daily meeting with above membership.

### Identity affected systems

P.S. and Support will:

  
-  Record all affected systems & end-users in the _disclosure ticket_

  
-  Notify customer(s) of the affected product or service that a patch will be available. Provide a summary of the impact including the issue _severity_ , but do not provide details that may be used to discover exactly what the vulnerability is, and how it may be exploited.

  
-  Agree on a remediation timescale for when a fix (temporary remediation or patch) will be available

  
-  Agree to a timescale for when an announcement will be made

The industry standard for the receipt of vulnerability disclosure, to a fix
being made available and being applied to affected systems, is 90 days. After
this time it is expected that the reporter of the disclosure is entitled to
publicise their findings. Whilst it may be possible to negotiate with the
reporter to extend the time scales this should not be relied upon.

### Special customer commitments

Does the security fix trigger one or more of our Special customer commitments?

TODO (for P.S.)

### Send Advisory notice to affected customers

  1. Product Lead - compose the advisory notice that will be sent to customers. 

  2. Security Team - to review the text

  3. Support Team - Send all parties an email notifying them of the issue. 

     1. Titled “R3 Security Patch Advisory Notice”

     2. Using standard email template

     3. Example: d

## Remediation

Remediation of vulnerabilities must be conducted on a private Github
repository. A Jira 'Security Bug' ticket must be created to track the
remediation.

### Develop remediation

Issues identified in the public CORDA repository require that the repo be
cloned. The [corda-private](https://github.com/corda/corda-private) repo can
be used for this purpose.

In some cases, it may not be possible to develop an update within the agreed
timescales. An alternative means of mitigating the impact of the vulnerability
must be identified and documented if this is the case.

#### Release Notes

Documentation related to the fixing of the vulnerability should not include
details that describe what the vulnerability is, or how it may be exploited.
These details can be provided at a later time in a ‘post-mortum’ advisory
notice.

## Release

The normal patch release process will be followed at this point.

For open-source products, a patch or new release must not be made public until
impacted customers have been given the opportunity to patch their systems.

All customers of the affected software will be provided with a patch or
remediation steps that help to secure their systems.

## Announcement

After all parties have confirmed that the remediation or patch has been
applied, OR the agreed timescale for making an announcement has been reached,
the Announcement process can begin.

The product team can decide whether an announcement (advisory notice) is
applicable on a case-by-case basis. For critical issues that affect the
security model of the product, it would be expected to follow this part of the
process.

### Create draft announcement

Security announcements should created in draft form in the following location
in the wiki, where they can be reviewed if necessary:

[Security
Advisories](Security%20%28Internal%29/Security%20Advisories/Security%20Advisories.md)

The Tech-Writing team will review and complete the

### Publish Advisory

The Tech-Writing team publish the security advisory on the Corda documentation
site in the following location (tbd):

<https://docs.corda.net/security/advisories>  

## References

  1. <https://www.ietf.org/rfc/rfc2350.txt>

  2. <https://tools.ietf.org/html/draft-christey-wysopal-vuln-disclosure-00>

  3. ISO 29147 (Vulnerability Disclosure)  
<https://standards.iso.org/ittf/PubliclyAvailableStandards/c045170_ISO_IEC_29147_2014.zip>

  4. ISO 30111 (Vulnerability Handling)

  5. <https://www.ncsc.gov.uk/blog-post/ncsc-vulnerability-disclosure-co-ordination>

  6. <https://www.rsaconference.com/writable/presentations/file_upload/asec-t18.pdf>

  

  

  

  

  

