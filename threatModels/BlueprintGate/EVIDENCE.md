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

## Deployment facts to verify

- Which repositories are registered, and whether separate model PR review or automatic merge is enabled for each.
- Whether GitHub branch protection and required checks are active on application and model repositories.
- Whether workers use dedicated disposable identities or VMs, limited network access, and minimal GitHub permissions.
- Whether hybrid HTTPS termination, secret storage, and monitoring have been validated.
- Whether database backups are taken and restores have been tested.
- Whether security approvals are performed by distinct authenticated people; the current API does not bind the actor string to a human identity.
