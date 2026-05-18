# Dashboards

Store dashboard definitions or notes here.

Suggested focus:
- deployment health
- request errors
- latency
- release visibility

## MVP release review dashboard notes

The first dashboard iteration should support operator review rather than broad platform analytics.

Minimum views to plan:
- deployment health for the selected namespace
- request error rate after rollout
- request latency after rollout
- release metadata lookup using runtime annotations such as commit SHA, build ID, image digest, and verification status

These notes are intentionally lightweight. The MVP does not require checked-in dashboard JSON until the workload, metrics, and release labels are stable enough to keep definitions reviewable.
