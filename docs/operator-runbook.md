# Operator Runbook

## Purpose

Provide an operator-oriented guide for validating and reviewing releases.

## Routine workflow

### 1. Confirm the release candidate exists
Verify that the release artifact was built and published.

### 2. Review build outcome
Check build results and confirm the release candidate passed the required checks.

Before approving promotion, review the verification output for:
- `commit_sha` matching the intended source revision
- `build_id` matching the reviewed Cloud Build execution
- `image_digest` identifying the immutable candidate artifact
- `verification_status=passed`
- `verification_timestamp` showing when the gate completed
- `trust_signal_ref` indicating the expected trust signal path, when available

If `verification_status=failed`, stop the promotion workflow and inspect the failed check instead of rebuilding or promoting the artifact implicitly.

### 3. Confirm deployment trust status
If deployment is blocked, inspect trust and policy conditions before proceeding.

### 4. Review deployment result
Confirm that the target environment received the intended release.

### 5. Review runtime signals
Use dashboards, logs, and alerts to assess health after rollout.

For the MVP review loop, use the monitoring notes as a lightweight checklist:
- dashboards summarize deployment health, request errors, latency, and release metadata lookup
- log-based metrics capture release events, deployment denials, and application error bursts
- alert policies identify unhealthy rollout signals that should stop or delay promotion

Runtime review should confirm that the running workload still maps back to the expected commit SHA, build ID, image digest, and verification status before promotion continues.

### 6. Decide on promotion
Advance only if the release is operationally healthy and trust conditions remain satisfied.

Treat this as a promotion checkpoint, not a routine continuation step. If runtime evidence is incomplete or contradictory, pause promotion until release identity, trust status, and health signals are reconciled.

Promotion decision outcomes should be explicit and recorded:
- continue promotion to the next environment
- hold in the current environment for additional review
- rollback or reject the release candidate

## Common failure categories

- build failure
- pre-release verification failure
- artifact trust failure
- deployment failure
- post-deployment health issue

## Runbook goal

The operator should be able to tell the difference between:
- a release that failed to build
- a release that built but is not trusted
- a trusted release that deployed incorrectly
- a trusted release that deployed but behaves poorly

## Related references

- [Release Flow](release-flow.md)
- [Observability](observability.md)
- [Environment Policies](architecture/environment-policies.md)
