# Corda Protocol V1 - Security Architecture Summary

**Target Infrastructure**: Account 491552082744 (blt-dev), Region eu-west-1
**Cluster**: eks-e2e-01 (Kubernetes 1.32, Active)
**VPCs**: 6 (primary: eaas-ireland-491552082744-eks-e2e-01-net, 10.36.0.0/16)

## Executive Overview

A security architecture review was conducted against the active Corda Protocol V1 AWS CI/CD Environment. The assessment highlighted several areas where infrastructure design deviates from best practices, particularly concerning compute metadata access, internal network segmentation, and IAM least-privilege.

The review identified **1 Critical** and **6 High** priority architectural concerns across 7 infrastructure repositories.

---

## Key Architectural Concerns


### 1. Compute Metadata Security (CRITICAL)
**Repository**: `terraform-aws-ec2-fleet`

**Concern**:
EC2 launch templates for EKS worker nodes do not enforce Instance Metadata Service Version 2 (IMDSv2), allowing fallback to IMDSv1.

**Impact**:
Application code or container escape vulnerabilities can leverage Server-Side Request Forgery (SSRF) to query `http://169.254.169.254` and retrieve valid AWS IAM credentials without authentication.

**Resolution Path**:
Update `terraform-aws-ec2-fleet` launch templates — set `http_tokens = "required"` and `http_put_response_hop_limit = 1`.


### 2. Lack of Internal Network Segmentation (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
The Kubernetes environment (eks-e2e-01) operates with zero NetworkPolicy resources deployed across all namespaces (vault, default, kube-system).

**Impact**:
Default Kubernetes behavior allows all pods to reach all other pods on all ports. A compromise in an ephemeral build agent provides unrestricted network access to Vault (8200, 8201), PostgreSQL (5432), and Jenkins (8080).

**Resolution Path**:
Implement deny-all default NetworkPolicies with explicit allow rules per namespace in `infrastructure-ci-aws`.


### 3. Over-Privileged IAM Implementation (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
270 custom IAM policies exist in the account (scope: Local). Multiple policies use wildcard (`"Action": "*"`) actions and `"Resource": "*"` designations. No IAM Access Analyzer is configured and no privilege review has been documented.

**Impact**:
Violates the principle of least privilege. Compromised credentials carry maximum blast radius across unintended AWS resources.

**Resolution Path**:
Run IAM Access Analyzer against all 270 policies; scope each to the minimum required ARNs and explicit actions.


### 4. Excessive Security Group Exposure (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
10 security groups in eu-west-1 contain rules allowing inbound access from `0.0.0.0/0` on sensitive ports, including SSH (22) and PostgreSQL (5432).

**Impact**:
Critical services are exposed to internet-wide brute force and scanning. No failed login attempt monitoring is in place.

**Resolution Path**:
Restrict all SSH and database ingress to corporate VPN CIDR blocks or specific security group references. Remove any `0.0.0.0/0` rules on non-public-facing ports.


### 5. At-Rest Data Encryption Gaps (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
EBS encryption by default is explicitly disabled at the AWS account level (`EbsEncryptionByDefault: false`). No `aws_ebs_encryption_by_default` resource exists in Terraform.

**Impact**:
New persistent volumes storing secrets, credentials, or source code can be provisioned without encryption. 

**Resolution Path**:
Enable account-wide `aws_ebs_encryption_by_default` via Terraform; audit existing volumes for unencrypted instances.


### 6. Absent Network Observability (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
Zero VPC Flow Logs are configured across all 6 VPCs in eu-west-1, including the primary EKS VPC (10.36.0.0/16).

**Impact**:
Complete blind spot for network-layer incident response. Port scanning, lateral movement, and data exfiltration cannot be traced or evidenced.

**Resolution Path**:
Enable VPC Flow Logs (ALL traffic: ACCEPT/REJECT) for all 6 VPCs; route to S3 with a minimum 90-day retention policy. Prioritise the primary EKS VPC.


### 7. Incomplete Backup Coverage (HIGH)
**Repository**: `infrastructure-ci-aws`

**Concern**:
AWS Backup coverage is partial — only EFS has an automated backup plan (`aws/efs/automatic-backup-plan`). EBS volumes (including 3 Vault volumes and the Jenkins home directory) and RDS have no backup plans or DLM snapshot policies.

**Impact**:
Accidental deletion or corruption of Vault EBS volumes or Jenkins data results in permanent loss with no recovery point. RPO and RTO for these workloads are undefined and untested.

**Resolution Path**:
Define `aws_backup_plan` resources covering EBS and RDS with daily snapshots, 30-day retention, and cross-region replication.

---

## Next Steps
This summary provides visibility into the structural risks associated with the Corda Protocol V1 CI/CD stack. The concerns above are drawn directly from the detailed findings in `V1 Architeceture.md` and align with the live infrastructure state in Account 491552082744 (eu-west-1).
