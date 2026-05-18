# Alert Policies

Store alert policy definitions or notes here.

Suggested focus:
- unhealthy rollout
- elevated error rate
- service unavailable after deployment

## MVP release review alert notes

The first alert policies should support operator review after deployment without creating a broad production alerting framework.

Minimum alerts to plan:
- unhealthy rollout for the selected namespace or workload
- service unavailable after deployment
- elevated error rate after rollout
- sustained latency increase after rollout

Alerts should include enough release context for operators to connect the signal back to commit SHA, build ID, image digest, or verification status when those fields are available through labels, annotations, or logs.

These notes are intentionally lightweight. The MVP can start with documented alert expectations before checked-in alert policy definitions are added.
