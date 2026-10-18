# Blueprint Gate model evidence

Baseline source: [Blueprint Gate revision 1fb3eff](https://github.com/Bturbs/Blueprint-Gate/tree/1fb3effc84e5da670da998dd2858a1ba64bb342d).

This retrospective model covers the implemented code and the first rollout plan. The project owner confirmed on 2026-10-18 that no worker is currently running and that local and hybrid workers are both planned for the first launch. An in-place software control means its behavior is present in source. It does not establish that a production deployment uses it or that an independent effectiveness review has passed.

| Boundary or threat | Evidence |
| --- | --- |
| Untrusted issue content reaches workers | [Issue polling](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/api.py) and [worker prompt](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py). |
| Repository code and checks run on worker hosts | [Worker checks](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py) and [CLI adapters](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/runtimes.py). |
| Worker authentication and scoped hybrid claims | [Credential issuance, authentication, and claim checks](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/api.py). |
| Administrative decisions and token exposure | [Bearer authentication and approval endpoints](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/api.py) use request-supplied actor strings. [Local startup](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/scripts/start.sh) exports the admin token before launching the worker; [CLI subprocess execution](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/runtimes.py) does not filter inherited environment variables. |
| GitHub credential placement | [Control token broker](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/github_auth.py) and [host-worker Git operations](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py). |
| Model provider context | [Worker prompt construction](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py) includes issue text and prior artifacts; [runtime adapters and classification routing](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/runtimes.py) invoke approved coding CLIs. |
| Stale claims and remote effects | [Fencing and worker affinity](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/api.py) and [worker claim checks](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py). |
| Model verification and approval | [Verifier adapter](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/threat_models.py), [model stage](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py), and [revision-bound gate](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/workflow.py). |
| Separate model PR review | [Exact-head independent review check](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/threat_review.py). The policy is optional. |
| Application merge | [Opt-in merge eligibility](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/merge.py). |
| Webhook intake | [Signature, size, and delivery-ID checks](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/api.py). |
| Hybrid transport | [Worker URL validation](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/worker.py) requires HTTPS outside loopback. |
| Durable state | [PostgreSQL models](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/src/adp/db.py), [Compose volume](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/compose.yaml), and [backup instructions](https://github.com/Bturbs/Blueprint-Gate/blob/1fb3effc84e5da670da998dd2858a1ba64bb342d/docs/OPERATIONS.md). |

## Stale-publication remediation progress

[Blueprint Gate PR #26](https://github.com/Bturbs/Blueprint-Gate/pull/26), merged at [revision `0f50f8b`](https://github.com/Bturbs/Blueprint-Gate/tree/0f50f8bf7b105b8ab9fc71d9219246803177566d), adds durable publication attempts, attempt-specific refs, claim-loss quarantine, audited recovery, late-effect observation, and a check before automatic merge. The [publication tests](https://github.com/Bturbs/Blueprint-Gate/blob/0f50f8bf7b105b8ab9fc71d9219246803177566d/tests/test_publication.py) simulate a successful push and pull-request creation followed by lost claim responses, duplicate-publication paths, and multi-attempt late-effect recovery. Both CI jobs passed before merge; the local suite passed 94 tests with four skipped, and a fresh database migration succeeded.

The `REMOTE_SIDE_EFFECT_RECONCILIATION` control remains `inPlace: false` and `STALE_JOB_SIDE_EFFECTS` remains `fullyMitigated: false`. GitHub does not enforce the worker's fencing token, so an already submitted effect can land between observations. A real branch/PR recovery in the dedicated staging VM also needs its scoped GitHub credential and provider login; it has not been completed. Keep [issue #7](https://github.com/Bturbs/Blueprint-Gate/issues/7) open for that evidence and the residual timing risk.

## Human decision identity progress

[Blueprint Gate PR #27](https://github.com/Bturbs/Blueprint-Gate/pull/27), merged at [revision `8fdcdfc`](https://github.com/Bturbs/Blueprint-Gate/tree/8fdcdfc), adds a separately supplied GitHub user token, a live `/user` check, numeric reviewer and operator role allowlists, actor mismatch rejection, and authenticated approval and audit actors. The full local suite passed 97 tests with four skipped; both CI jobs passed. On the isolated Mac staging stack, enforcement was enabled for owner ID `64413370`: control token alone returned HTTP 401, an invalid user token returned 401, and the owner's user token succeeded. The pause audit event recorded `github:64413370:Bturbs`. The stack remained paused with zero jobs. The older API and scheduler were stopped after confirming zero jobs; its database and checkout were retained.

`HUMAN_IDENTITY_BINDING` is `inPlace: true` for the active staging API, while `ADMIN_BEARER_ABUSE` remains `fullyMitigated: false`. A compromise of the Mac operator account could acquire both bearer credentials, and the VM has not yet been provisioned with a distinct repository-scoped delivery identity for a live worker impersonation exercise. Keep [issue #4](https://github.com/Bturbs/Blueprint-Gate/issues/4) open until the credential boundary and authorized end-to-end operation are verified.

## Worker credential lifecycle progress

The active Mac staging stack issued a repository- and capability-scoped credential to the dedicated Lima VM. The token was transferred over SSH directly to the VM supervisor's mode-0600 file. With dispatch paused, the VM's claim authenticated and returned no job. After an authorized rotation, the same old token returned HTTP 401; the replacement token authenticated and still returned no job. The queued staging ticket/job remained `QUEUED` throughout. A second scoped fixture credential returned HTTP 200 before revocation and 401 after revocation. The rotation and revocation audit events both carried the verified owner actor from [Blueprint Gate PR #27](https://github.com/Bturbs/Blueprint-Gate/pull/27). The API suite also verifies expiry, scope, heartbeat, yield, and completion checks.

`WORKER_CREDENTIAL_LIFECYCLE` is now `inPlace: true` for the active local deployment. `WORKER_IDENTITY_THEFT` remains `fullyMitigated: false`: a stolen current token remains usable until detected and revoked, and no real provider/GitHub delivery job has yet been exercised in the VM. Keep [issue #3](https://github.com/Bturbs/Blueprint-Gate/issues/3) open for that sequence and the residual exposure.

## Active staging backup progress

The active isolated Mac staging stack uses its own PostgreSQL volume. With dispatch paused and the scheduler stopped, a fresh custom-format dump restored into a separate database; comparison matched the live core rows for repositories, tickets, jobs, approvals, audit events, risk acceptances, worker credentials, and pause state. The backup directory and dump had modes 0700 and 0600. The existing macOS launchd daily backup and weekly restore-check jobs were repointed to this database and a separate private backup directory; forced runs of both exited zero. The restore check validated the current database schema and tables. The older stopped stack retains its database and historical backups.

`TESTED_DATABASE_RESTORE` and `JOB_STATE_LOSS` remain false because all copies are on the same Mac. An encrypted copy on separately protected storage and a restore from that copy are still needed for [issue #13](https://github.com/Bturbs/Blueprint-Gate/issues/13).

## Deployment facts to verify

- Which repositories are registered, and whether separate model PR review or automatic merge is enabled for each.
- Whether GitHub branch protection and required checks are active on application and model repositories.
- Whether workers use dedicated disposable identities or VMs, limited network access, and minimal GitHub permissions.
- Whether hybrid HTTPS termination, secret storage, and monitoring have been validated.
- Whether database backups are taken and restores have been tested.
- Whether security approvals are performed by distinct authenticated people; the current API does not bind the actor string to a human identity.
