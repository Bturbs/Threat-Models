Applicable to:  
\- All production software

Keeping our customers’ environments and data secure is R3’s primary concern,
and we are committed to the continuous security improvement of our products
and services. R3 use a Secure Development Lifecycle process to integrate
security into its products from design, through development and release.

Sometimes vulnerabilities escape detection, or new exploits are released after
the product is already on the market. At R3 we investigate all received
vulnerability reports and implement the best course of action in order to
protect our customers.

* * *

## Scope

The following describes our targets for responding to security issues
discovered in our products. The actual time taken to release a fixed version
will depend on the complexity and risk of the fix, as well as R3’s assessment
of the likelihood and severity of a customer affecting incident.

This policy does not describe the complete disclosure or advisory process that
we follow.

### Security bug fix Service Level Objectives (SLO)

We have defined the following target response times for fixing security issues
in our products:  
  
<table markdown="1">  
<tr markdown="1">  
<th markdown="1">

**Issue Severity**

</th>  
<th markdown="1">

**CVSS v3 score**

</th>  
<th markdown="1">

**Target Response Time**

</th></tr>  
<tr markdown="1">  
<td markdown="1">

Critical

</td>  
<td markdown="1">

**9 - 10**

</td>  
<td markdown="1">

To be fixed within 4 weeks of being reported.

</td></tr>  
<tr markdown="1">  
<td markdown="1">

High

</td>  
<td markdown="1">

**7 - 8.9**

</td>  
<td markdown="1">

To be fixed in the next scheduled maintenance release, or the next plus one if
within 4 weeks.

</td></tr>  
<tr markdown="1">  
<td markdown="1">

Medium

</td>  
<td markdown="1">

**4 - 6.9**

</td>  
<td markdown="1">

To be fixed in the next plus one scheduled maintenance release.

</td></tr>  
<tr markdown="1">  
<td markdown="1">

Low

</td>  
<td markdown="1">

**0.1 - 3.9**

</td>  
<td markdown="1">

To be fixed in a future scheduled released based on related development
activities.

</td></tr></table>

### Vulnerability Handling

When a security vulnerability is reported by a third party through our
[Vulnerability Disclosure
Program](Security%20Programs/Responsible%20Disclosure/Vulnerability%20Disclosure%20Policy/Vulnerability%20Disclosure%20Policy.md),
R3 will do all of the following:

  
-  Provide prompt acknowledgement of receipt of your vulnerability report (within 48 business hours of submission).

  
-  Conduct an internal assessment and respond with our view on severity and impact, typically within 2 weeks but may be longer for complex issues.

For externally reported issues, and also for issues identified through our own
internal review process, we will:

  
-  Issue a new, fixed release for the current version of the affected product in line with our target response times above. 

#### 3rd party components

Our software products usually contain 3rd party dependencies. R3 utilize
commercial Software Composition Analysis (SCA) tools to identify components
that might contain known vulnerabilities (CVEs).

We prioritise fixes to dependencies based on our assessment of the severity
and potential impact of a CVE, and also the manner and context in which the
issue is likely to be exposed.

  
-  Vulnerabilities that are assessed as likely to be exposed are updated according to the target response times above wherever possible. 

  
-  Vulnerabilities that are assessed as unlikely to be exposed by Corda, are updated if possible as part of a scheduled release to the product.

### Security Fixes

Customers should upgrade their installations whenever a new release becomes
available to ensure that the latest security fixes have been applied.

### Further information

We will continuously evaluate our policies based on customer feedback and will
provide any updates or changes on this page.

